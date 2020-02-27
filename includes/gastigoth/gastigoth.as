//Trials in Tainted Space: The Galactic Prison
//Or, Privatized Sex-Slavery By Any Other Name
//By: Savers

//Project Notes
//The Warden: Regina Kasmiran
//From the Neue Rhine Confederation - a subsection of the T.S.C. made up of several Germanic colonies.
/*
*Mid fifties (heavily anti-agathized so that she looks shy of thirty), aristocratic, fiery, dominant cyborg. Kinda looks like a hot-for-leather Mercy. Wears a smoking combination of military-style uniform, skin-tight synthleather domina outfit, and thigh high gloves/boots.

Possibly some kind of reptilian/demon morphs to add curling horns/spikes/tail? Naturally needs long claw nails and a tight ponytail way down her back.

Carries a stunning laser whip, flip-out riding crop/baton, several shock handcuffs, and other means of corporal punishment on her hips. In the event of a riot/prison break, has a light combat exoskeleton (not quite Amara power armor), an energy tower shield, and a jetpack she’ll use to bounce around in zero-g.

When things go to shit, she shuts off the station’s gravity. Only the security drones/officers and her have magboots and jump jets, so that alone puts them at a huge advantage.

Formerly headed a T.S.C. counter-terrorist task force against the Mechanus League. Was forced to retire after being injured in a bombing of a gene-splice research lab her unit was assigned to protect. Heavily cyberized because of it, and the irony is by no means lost on her. Largely covered in reinforced synthskin (possibly just is her domina uniform? Seamless transition from flesh at the neck/cleavage line to latexy leather on every inch below!); both arms are superhuman-strong augments; eyes are cyberized and complete with cool holohuds; large breast implants that may or may not have ballistic augmentations in silly mode. Obv. has a gigantic horsey hardlight she can use to “discipline” prisoners.

Hates terrorists, especially the League, with a deadly passion. Briefly came to work for O.H.G.R. after her discharge, made a small fortune through extortion and unreserved cruelty towards her subjects, and eventually left to open a private corrections facility under Confederate contract. She is merciless towards her prisoners, and takes no small amount of joy in pimping them out to the second-worst galactic scum, in her eye: rich playboys who like to play God.

SOP
>PC goes through security; is Disarmed
>Must wear a bracelet that feedbacks vital signs and RFID to get around

Guards are Nova Securities goons: dark orange and white full body armor, full face masks and helms, energy riot shields, and heavy stun guns and shock batons (some carry lethal firearms as well; mostly laser carbines). All have ultra-heavy mag boots with jump jets, ready for zero-g close combat.
*/


//Introduction Email: The Galactic Prison Calls!
//Arrives in the PC’s inbox rand(3-10) days after the first time an applicable prisoner is taken (eg. Tarasque crew, Zaalt, etc.)

//From: Regina Kasmiran (DoNotReply@FaangnisCorrections.corp)
//To: [pc.Email]@SteeleTech.corp
//Subject: [pc.name]: Exclusive Offer
public function gastigothCoordinatesUnlocked():Boolean
{
	return (MailManager.isEntryViewed("gastigoth_unlock"));
}
//Start the stuff to unlock flying to space jail...
public function processGastigothEvents():void
{
	//If already unlocked: nothing changes!
	if(MailManager.isEntryUnlocked("gastigoth_unlock")) return;
	if(pc.hasStatusEffect("GastiUnlockTimer")) return;
	
	//Not unlocked yet!
	var prisonerSent:Number = 0;
	if(completedStellarTetherGood()) prisonerSent += 3; // Pirates of Tarasque: Khorgan, Kaska and Tam
	if(drBadgerImprisioned()) prisonerSent += 1; // Dr. Badger
	if(zaaltImprisoned()) prisonerSent += 1; // Zaalt
	if(rkLahImprisoned()) prisonerSent += 1; // R.K.Lah
	if(samImprisoned()) prisonerSent += 1; // Sam

	if(prisonerSent <= 0) return;
	
	pc.createStatusEffect("GastiUnlockTimer");
	pc.setStatusMinutes("GastiUnlockTimer",5*24*60);
	flags["GASTIGOTH_UNLOCKNUM"] = prisonerSent;
}

public function showBrandt(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	if(flags["MET_BRANDT"] != undefined) showName("\nBRANDT");
	else showName("\nCOMMANDER");
	showBust("BRANDT" + nudeS);
}
public function showKasmiran(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showName("WARDEN\nKASMIRAN");
	showBust("KASMIRAN" + nudeS);
}

public function showTamtamPrison(preg:Boolean = false):void
{
	showName("\nTAM-TAM");
	var pregS:String = "";
	if(flags["TAMTAM_GAST_PREG_TIMER"] >= 100) pregS = "_PREG";
	showBust("TAMTAM_JAIL" + pregS);
}
public function showKhorganPrison(preg:Boolean = false):void
{
	showName("\nKHORGAN");
	var pregS:String = "";
	if(flags["KHORGAN_GAST_PREG_TIMER"] >= 60) pregS = "_PREG";
	showBust("CAPTAIN_KHORGAN_JAIL" + pregS);
}
public function showKaskaPrison(cum:Boolean = false):void
{
	showName("\nKASKA");
	if(cum) showBust("KASKA_JAIL_CUM");
	else showBust("KASKA_JAIL_NUDE");
}

public function gastigothEmailText():String 
{
	var blep:String = "Greetings, " + pc.mf("Mister","Miss") + " Steele,\n\nI am Warden Regina Kasmiran, controlling officer of the private correctional station <i>Gastigoth</i>. It is unlikely you have heard of us, but we have heard of you: and we have a proposition. You are responsible for the recent capture of ";
	if(flags["GASTIGOTH_UNLOCKNUM"] < 1) blep += "<b>NONE</b>";
	else if(flags["GASTIGOTH_UNLOCKNUM"] == 1) blep += "one";
	else blep += "several";
	blep += " of this station’s new inmates which, given the nature of the convicts we supervise here, means you are an individual of exceptional talent. And of exceptional means, if I am not mistaken. The unique realities of privatized correction allow me to make this offer, and do so with what I hope is blunt clarity:\n\n<i>Gastigoth</i> allows private citizens such as yourself to participate in the corrective process of our inmates, for a small fee. We offer several services on the backs of our inmates, as part of their long journey to clear their debt to galactic society. Or more accurately, most services conclude with the inmates <i>on</i> their backs, though we also support a highly successful breeding program and collared labor, among other more esoteric punishments. Should the fate of your prisoner, and the corrective measure to be applied to them, interest you, I encourage you to visit our establishment. Should you continue on your current course, I have little doubt we will be housing several more individuals you come into contact with throughout the course of the Rush.\n\nThe station coordinates are attached. I look forward to meeting you in person, Captain.\n\n\tRegina Kasmiran\n\tWarden-Commander,\n\tPenal Station <i>Gastigoth</i>";
	blep += "\n\n<i>You note that, indeed, a set of stellar coordinates are included. The penal station is located on the fringe of Rush Space 13, not that far from Tavros in fact.</i>";
	return blep;
}

//Introduction: Arrival at Gastigoth
//Pass time as if going to Tavros, then add 12 hours. Gain Sleep benefits.
public function arrivalAtGastibooty():void 
{
	clearOutput();
	showName("LANDING AT\nGASTIGOTH");
	showBust("BRANDT");
	author("Savin");
	if(flags["LANDED_AT_GASTIGOTH"] == undefined)
	{
		flags["LANDED_AT_GASTIGOTH"] = 1;
		output("The trip through the Warp Gate network back into the safety of last generation’s Rush Space is relatively easy, as far as jumps go, though it takes a bit longer than you’d like. The network out here still isn’t as robust as back in the core proper, but there’s little risk of piracy or the like. For once, you can rest easy as you travel.");
		output("\n\nSeveral hours pass before your ship’s computer alerts you to your arrival. You yawn and roll out of bed, stretching on your way up to the bridge and flop into your captain’s chair still blinking the sleep from your eyes. It doesn’t take long for your gaze to narrow and focus, though, as your auto-pilot sweeps you towards your destination.");
		output("\n\n<i>Gastigoth</i> is a monster of a space station, a mammoth sphere of faceted metals ridged by communications arrays and bristling with weapons. It has no discernable top or bottom, or any other axis beyond a high tower coming from the center of the orb nearest you. Only as you approach this docking arm do you truly get a sense for the station’s scale: it is a behemoth structure that blots out the distant light of the system’s twin suns, and its docking ring alone is the size of a Terran super-carrier. In fact, you’re not convinced that isn’t exactly what it is: a long stretch of solid, flat steel which turns several batteries of rail cannon towards you as you approach, eyeing you dangerously with a hundred barrels of high-powered ship-reaping death before a beep passes over your communications array.");
		output("\n\nYou answer quickly, not eager to make whoever’s got that much firepower antsy.");
		output("\n\nThe forward viewscreen blinks out and resolves into an interior camera view. Aboard the armored dock’s bridge, you imagine, if the dozens of holoscreens and fire solution displays flickering in the background are any indication. Unsubtly, several of them show your ship in the crossed sights of heavy cannons and missile racks.");
		output("\n\nThe only actual person visible on screen is a young woman, pretty as far as primly-cut military types go, though she’s got an unpleasant, emotionless expression on her face. Her hands are clasped in front of her, folded in a way that shows small patches of colorful scales underneath her white-trimmed, dark orange uniform’s sleeves - coloration mirrored on her cheeks and neck, though her face is fleshy and human. Human-reptile crossbreed of some sort?");
		output("\n\nShe fixes you with a pair of solid, bright blue eyes slitted like a cat’s. <i>“Attention [pc.ship], you have entered a Confederate-licensed security zone. You will power down all shields and weapons, and follow automatic docking trajectories into hanger...”</i> she glances aside. <i>“Hanger twenty-two alpha. Hmm, reserved for special guests. Regardless, any change in your weapons systems once you are within the point perimeter will be construed as an active threat and result in atomization. Understood?”</i>");
		output("\n\nWow, they really go all out here. Feels like you’re flying into a military base as much as you are into a maximum-security prison.");
		output("\n\nConsidering the Nova Securities uniform the woman on-screen is wearing, you’re not sure there’s much of a difference here. Private military, private prison... You shrug off the thought and power down your ship’s combat defenses. Not that they’d do you much good if the owner of this place decided to get nasty, but losing your shields makes you feel awfully vulnerable nonetheless.");
		output("\n\n<i>“Thank you, Captain,”</i> the security officer says, giving you the faintest hint of a nod. <i>“Docking tethers are interfacing with your systems... now.”</i>");
		output("\n\nYou feel a slight rumble under the deck as their computer talks to yours, cajoling your autopilot to follow a slightly different course. The system submissively adjusts, following a glowing light pattern on the almost-carrier’s deck until you’re skidding to a halt on your landing struts, hooking into an old-fashioned magnetic catapult that, rather than blasting you off, starts sucking you in towards the station interior.");
		output("\n\n<i>“Very good,”</i> the woman on-screen says while you’re being shuttled to your destination. <i>“Your landing will be complete momentarily. Welcome to penal station </i>Gastigoth<i>, Captain Steele. We will see you soon.”</i>");
		output("\n\nThe screen cuts off sharply. Well, you can’t fault them on efficiency. A few seconds later and your hull thumps against something solid, followed by a resounding... nothing. It takes you a moment to notice that your airlock signal is blinking, telling you that a pressurized umbilical has attached. With the holocall dead, you’re free to glance out into the dock: your ship is one of about a dozen on deck, mostly expensive-looking pleasure yachts and high-performance speedsters.");
		output("\n\nNot quite the clientele you might have expected from a fringe prison... more like a core-ward country club.");
		output("\n\nYou take a deep breath and stand up. Time to see what you’ve flown into...");
	}
	else
	{
		output("You drop out of the local Warp Gate well outside the commanding shadow of penal station <i>Gastigoth</i>, yet it’s never not an imposing sight when the behemoth sphere comes rolling into view, bristling with guns and high-tech sensors. Your autopilot guides you around the sphere to the docking arm, the one unique blemish in the otherwise oblique sphere.");
		output("\n\nAs you approach, your systems alert you at once to several weapon locks and a video call. You answer, already turning off your weapons and shields.");
		output("\n\n<i>“Welcome back, Captain,”</i> the half-reptilian ");
		if(flags["MET_BRANDT"] == undefined) output("Nova officer from before");
		else output("Commander Brandt");
		output(" says, as pleasantly as an otherwise emotionless drone can. <i>“I see you remember our security procedures. Please keep your weapons offline and allow our docking computers to guide you onto the catapult deck.”</i>");
		output("\n\nYou do so, having little to do now but sit back in your chair and wait until the computers bump digital uglies and do their merry dance, dragging you onto the deck of the docking arm and then inside its maw. The security commander stays on the line with you, silently regarding you with her huge, near-solid-blue eyes, crisply-folded scaled hands in front of her until you’ve parked. She taps a hardlight button on her panel, extending the docking umbilical.");
		output("\n\n<i>“We’ll be awaiting you inside, Captain,”</i> she says simply, killing the call.");
		output("\n\nOnce more, it seems, you’ve managed to avoid being atomized by the stone cold lizard-woman. You let out a little breath and hop up, ready to get going.");
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Leaving Gastigoth (Not Prison Breaking)
public function leaveZePrison():void
{
	clearOutput();
	showName("LEAVING\nGASTIGOTH");
	author("Savin");
	output("You plop into your captain’s chair and buzz the station’s comm channel, saying that you’re ready to depart.");
	if(flags["MET_BRANDT"] == undefined) output(" The same half-reptilian woman that guided you in the first time");
	else output(" Commander Brandt");
	output(" appears on your forward screen, cool and crisp in her dark uniform.");

	output("\n\n<i>“Understood, [pc.ship],”</i> she answers evenly, depressing a holographic panel in front of her. You feel the deck underneath you shudder, then your ship start to move. <i>“The magnetic catapult will launch your vessel beyond our security perimeter. Per regulation, do not attempt manual engine control or activate any weapons systems until you are beyond our security zone.”</i>");
	output("\n\nYou’re reminded of the hundred or so railguns outside, and decide that’s mighty fine advice.");
	output("\n\nA few moments later and the catapult chain under your landing gear hurls you like a big, fat brick off into space. The ship shudders around you, balking at the sudden acceleration, but the trip out of the prison’s defensive zone is relatively quick. Once you’re safe, ");
	if(flags["MET_BRANDT"] == undefined) output("the officer");
	else output("Brandt");
	output(" gives you a slight nod, and your computer bleeps that its lost connection with <i>Gastigoth</i>’s.");
	output("\n\n<i>“Safe travels, Captain,”</i> the Nova officer says crisply. The call cuts off, leaving you to take a heavy breath and look towards your next destination.");
	output("\n\nJust in case, your shields come back on the moment you’re out of range.");
	clearMenu();
	addButton(0,"Next",flyMenu);
}

public function securityCheckpointBonus():void
{
	if(flags["GASTIGOTH_CHECKED"] == undefined)
	{
		output("\n\nThe same half-reptilian woman you were talked at by on the vid call is standing here, crisply at attention behind a security station.");
	}
	else output("\n\nCommand Brandt takes her place at the security station, awaiting you.");
	output(" A pair of humanoids in full body armor and shaded breath masks stand behind her, couching stun rifles under an arm and hardlight-projected riot shields braced beside them.");
	//[{Officer / Brandt}]
	if(flags["MET_BRANDT"] == undefined) addButton(0,"Officer",talkToCommandyBrandy,undefined,"Officer","Go over to the Nova Securities officer and see what she wants.");
	else addButton(0,"Brandt",talkToCommandyBrandy,undefined,"Brandt","Talk to Commander Brandt.");
}

//PC tries to move into the station without being Disarmed:
public function intoStationDisarmCheck():Boolean
{
	if(!pc.hasStatusEffect("Disarmed") && flags["MET_BRANDT"] == undefined)
	//Without talking to Brandt
	{
		clearOutput();
		author("Savin");
		showName("HALT\nARMED SCUM!");
		output("The moment you try to go anywhere, the two goons in orange armor stomp up and lock shields, all but jamming the shimmering projections in your face.");
		output("\n\n<i>“I’m afraid we’ll be relieving you of your weapons, Captain,”</i> the woman behind the station says, giving you a flat look. <i>“No arms, shields, explosives, or any other means of combat are permitted beyond this point. No matter how small, secure, or primitive. This is for your safety and ours; I take no particular pleasure is disarming you.”</i>");
		output("\n\nDammit.");
		moveTo("I16_SECURITY_CHECKPOINT");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return true;
	}
	//After talking to Brandt
	else if (!pc.hasStatusEffect("Disarmed"))
	{
		pc.takeMeleeWeapon();
		pc.takeRangedWeapon();
		pc.createStatusEffect("Disarmed", 4, 0, 0, 0, false, "Blocked", "You’ve checked all forms of weaponry at Gastigoth’s security checkpoint.", false, 0, 0xFF0000);
		output("You check your gear with Brandt and continue into the station.\n\n");
		processTime(5);
	}
	
	if (flags["MET_BRANDT"] != undefined)
	{
		//Descriptive text for the room
		output("The corridor here connects the docking tether back the way you first came in with two other corridors, both clearly labeled in several languages: to the north, Command & Control. Westward, the Lobby. Of course, south is back to Security. The bulkheads in every direction are otherwise sterile, grey, and bristling with gun turrets. Uniformly, though, there’s a tiny potted tree every thirty feet or so - the only life in this place, aside from your armed companion.\n\nCommander Brandt follows a pace behind you in locked step, her arms folded behind her back and her face implacable as ever.");
		return false;
	}
	return false;
}

//PC tries to move off station while Disarmed:
public function leaveStationDisarmCheck():Boolean
{
	if (pc.hasStatusEffect("Disarmed"))
	{
		returnAllItems(true);
		pc.removeStatusEffect("Disarmed");
		output("You reclaim your gear from Brandt and proceed back to your ship.\n\n");
		processTime(5);
	}
	output("Your ship is currently parked at the end of a short docking umbilical, connecting you to a sterile grey corridor that runs into the station. Your berth is one of many visible from the umbilical windows, all connected to different parts of the station. Supposedly, your berth is reserved for special guests - guess you’re important.");
	return false;
}

//I12 Command & Control
public function commandAndControlBonusiiii():Boolean
{
	author("Savin");
	//PC tries to enter without talking to Brandt about it:
	if(flags["BRANDT_FLIRTED"] == undefined)
	{
		clearOutput();
		showName("ACCESS\nDENIED");
		showBrandt();
		output("A pair of security drones step up from the shadows and stare you down impassively, their metal fingers seamlessly integrated into a pair of pulse carbines.");
		output("\n\n<i>“I do not believe you have any business in our command room at present, Captain,”</i> Brandt says evenly from behind you. <i>“Neither do they, it seems.”</i>");
		output("\n\nThe drones make no move or sound, but the threat hangs in the air until you take a step back. They give you a slight nod and retreat as well, bracing their backs against the bulkheads on either side of the door.");
		moveTo("I14_CORRIDOR");
		processTime(2);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return true;
	}
	else if(pc.lust() < 33)
	{
		clearOutput();
		showName("NOT\nYET...");
		output("You aren’t really in the mood for a tryst with Brandt. Maybe once your libido has you feeling a little more frisky.");
		moveTo("I14_CORRIDOR");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return true;
	}
	//PC enters with Brandt, first time.
	else if(flags["FIRST_GAST_CC"] == undefined)
	{
		clearOutput();
		showName("ACCESS\nGRANTED");
		showBust("BRANDT");
		output("<i>“At ease, gentlemen,”</i> Brandt says, waving the drones aside with her security card. They beep at her and remain at their posts, allowing you to pass.\n\n");
		flags["FIRST_GAST_CC"] = 1;
	}
	output("<i>Gastigoth</i>’s C&C room is a single, sweeping circular chamber some fifty feet wide. It’s dominated by consoles and weapon displays, all projecting ungodly amounts of information towards a single chair in the middle of the room. You recognize it immediately as Brandt’s seat, with the same lock-on displays behind it from when you talked on vid-call.");
	output("\n\nNow that you can see the chair that was formerly hidden behind her, your questions are resolved at a glance: a large, almost phallic-shaped cyber jack protrudes from the nape of the command chair’s headrest, matching the small silver input on the Commander’s own neck. A cord runs from the jack down to the floor, pooling there before disappearing into the deck.");
	output("\n\nIt’s extremely hot in here, now that you think about it. All those computers running together. Brandt doesn’t seemed troubled by it at all, though you notice that her normally flawless uniform has become unbuttoned down to the chest, revealing the slightest hint of the pert breasts hidden beneath her undershirt.");
	output("\n\nShe looks at you expectantly, her tail swishing slightly against the myriad datacords on the deck.");
	addButton(0,"Brandt",brandtCCRoomSexyTiems,undefined,"Brandt","Sexy times!!! :3");
	return false;
}

//PC can’t normally get into the elevators. Only in scenes. So no room descs.
public function lobbyBonusShit():Boolean
{
	author("Savin");
	//Has [Terminal] button enabled once you speak to the Warden for the first time. Has its own special scene.
	//First Time Meeting
	//Play the first time the PC enters the Lobby square.
	if(flags["MET_KASMIRAN"] == undefined)
	{
		clearOutput()
		showKasmiran();
		output("Commander Brandt guides you through a lengthy corridor, taking you deep into the ship-sized security center until it opens up into a sweeping, circular lobby. A glass table dominates the middle, flanked by a pair of curved couches on the entrance’s side and the opposite, and a pair of small potted plants at either end. The room, like the rest of the station, is a sterile gun-metal gray and brightly lit, though it lacks the overt armed security of the rest of the station: a pair of armored Nova troopers are the only passive threat, standing on either side of an ultra-high-security reinforced door to the north. The entrance to the prison proper, you imagine.");
		output("\n\nA moment after you enter, an elevator door opposite you dings and slides open with an audible hiss. What can only be the Warden steps out, striding towards you with the cool, commanding confidence of a woman in absolute, unquestioned power. Your stare is met by a pair of steely red-gold eyes, surrounded by flickering holographic displays flashing from a pair of implants on her temples, half-hidden by the bangs of her lustrous pink hair, itself parted by a pair of curling horns growing from her brow.");
		output("\n\nShe’s every bit the classic dominatrix at first glance: black and grey leather, polished to a shine, with high-heeled jackboots that click and clack on the metal deck with every step. It’s only after a moment’s searching that you realize you can’t find the zipper - or any other seam - on her outfit. It’s a part of her, you realize; as much as the reddish-brown skin of her face and neck. She’s a cyborg, no doubt. Almost completely so, if you had to guess.");
		output("\n\nThe cybernetic woman regards you with a genteel smile and a sharp incline of her head. <i>“You must be [pc.name] Steele, yes? Welcome to </i>Gastigoth<i>. I am Warden Kasmiran - we spoke briefly via email. Please, have a seat.”</i>");
		output("\n\nShe sweeps a hand towards one of the couches, waiting until you’ve ");
		if(pc.isTaur() || pc.isDrider()) output("planted yourself beside it");
		else output("sat down");
		output(" before seating herself. Her motions are crisp and calculated; not one iota of energy or motion wasted. Even her posture is as close to perfect as you could ask for.");
		if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" You wouldn’t be surprised if she was letting a V.I. program pilot her body around, the way she’s moving. Creepy.");

		output("\n\nCrossing one leg over the other, the Warden locks her hands around her knee and looks you over for a moment. <i>“Mmm, yes, I can see the resemblance. Your father’s company is quite influential on my homeworld, " + pc.mf("Mr.","Ms.") + " Steele. It’s my hope you and I can find a mutually beneficial arrangement: after all, you have already contributed to </i>Gastigoth<i>’s population. Given your reputation, I have no doubt you will do so again, intentionally or not. So, simply put, I would like to offer you our station’s... unique services. Our clientele is quite exclusive, " + pc.mf("Mr.","Ms.") + " Steele, and discerning. You will not find a similar offer anywhere else in the galaxy. Not legally, anyway.”</i>");
		processTime(5);
		flags["MET_KASMIRAN"] = 1;
		//[Her Offer...]
		clearMenu();
		addButton(0,"Her Offer",kasmiransOffer);
		return true;
	}
	else addButton(0,"Terminal",sexHaverTerminalTime,undefined,"Terminal","Take a look at the prisoner selection menu.");
	return false;
}


//Gastigoth Station: Commander Brandt
// {Officer}
//First time talking to Commander Brandt at the security station.
//Go over to the Nova Securities officer and see what she wants.
public function talkToCommandyBrandy():void
{
	clearOutput();
	showBrandt();
	author("Savin");
	if(flags["MET_BRANDT"] == undefined)
	{
		output("The message is clear enough: you step up to the small, gunmetal desk between you and the woman you’d spoken to over comms. Now that you’re in the same room, you can really get the size of her: she’s handsome, in a serious and grim-faced way, overly tall for a human and athletically built. She’s six-five, you’d guess, though that might be helped by the over-sized combat boots she’s wearing, complete with magnetized armor and jump jets, and she’s sleekly muscular beneath the dark orange dress uniform she’s got on. A boxer’s build, you think to yourself, though of course you’d need to see under that uniform to really gauge her physique.");
		output("\n\nStill, what you can see is appealing: flawless golden-bronze skin on a fundamentally human body shape, though she’s got small patches of yellowish scales on the sides of her neck and completely encasing her bare hands. Reddish blonde hair complements her coloration, pulled back into a tight military bun behind a pair of unadorned, small ears. Her eyes, though, are huge and solid blue, save for a pair of vertical slits that regard you cooly.");
		output("\n\nAnd, you notice, she’s got a thick tail sprouting from the back of her uniform, dragging heavily on the floor like a still lump of solid muscle - it’s yellow like her scales, though a somewhat darker hue. Almost gold. ");
		//Ovir Codex unlocked:
		if(CodexManager.entryUnlocked("Ovir")) output("You’d guess she’s half-ovir now that you can see the tail. Wonder what she’s got under the belt, if that’s the case");
		else output("Your Codex beeps an alert that it’s detected a new race: the ovir. The officer cocks an eyebrow at the audible alert, maybe surprised you’ve never met a core race like hers. Good going, Codex.");

		output("\n\n<i>“Captain,”</i> she says after a long moment, shifting her weight slightly. You blink, suddenly aware you were ");
		if(pc.isBro() && pc.libido() >= 66) output("casually undressing her with your eyes... while she was looking right back at you");
		else output("staring");
		output(". <i>“Welcome to </i>Gastigoth<i>. I am Sub-Commander Brandt, and I will be your escort for the moment. Before you go any further into the station, though, I am afraid I have to ask you to disarm.”</i>");

		output("\n\nWell, that’s hardly unexpected considering the way she emasculated your ship earlier. You sigh and, very slowly, start to withdraw your equipment. Brandt gives you a slight nod, but otherwise remains motionless as you dump your kit into a plastic tub sitting on the table.");

		output("\n\nOnce you’re done, she slides the bucket aside with a practiced motion and picks up a wand-like device off her belt. The half-ovir waves you forward with two fingers, drawing you around the desk until you’re an arm’s breadth from her - at that point, her fingers depress solidly into your chest, stopping you on a dime while her other hand waves the wand over your person.");
		output("\n\n<i>“Hmm. Clear,”</i> she says, and you’re half certain you hear a tiny hint of surprise in her voice. The closest thing she’s shown to emotion since your arrival. <i>“Very well. As I said, welcome to the penal station, Captain Steele. The Warden has been alerted to your arrival and should be on her way. She insisted you were an important visit. The lobby is one turn north, then another westward along the station’s axis. Feel free to wait for her there. If, however, you have any questions...”</i>");
		flags["MET_BRANDT"] = 1;
		//Apply Disarmed Condition, same as New Texas.
		pc.createStatusEffect("Disarmed",4,0,0,0,false,"Blocked","You’ve checked all forms of weaponry at Gastigoth’s security checkpoint.",false,0,0xFF0000);
		processTime(10);
	}
	//Brandt (Repeat)
	//Talk to Commander Brandt.
	else
	{
		output("<i>“Brandt,”</i> you say, stepping up to the security station.");
		output("\n\n<i>“Steele,”</i> she echoes, inclining her bronze brow ever so slightly.");
		if(flags["SEXED_BRANDT"] != undefined && pc.hasStatusEffect("Disarmed")) output(" <i>“Leaving so soon?”</i>");
		else if(flags["SEXED_BRANDT"] != undefined) output(" <i>“Welcome back, Captain. A pleasure to see you again.”</i>");
		else output(" <i>“Ready to leave, Captain?”</i>");
		processTime(3);
	}
	brandtMenu();
}
//Brandt Talk Stuff
//[Herself] [Gastigoth] [Warden]
//[Dis/Rearm] [Sex // LOCKED] [Appearance]

public function brandtMenu(disable:String = ""):void
{
	clearMenu();
	if(!pc.hasStatusEffect("Disarmed")) addButton(0,"Disarm",disarmOrRearmLikeABoss,undefined,"Disarm","Get your weapons checked in.");
	else addButton(0,"Rearm",disarmOrRearmLikeABoss,undefined,"Rearm","Get your weapons checked out.");

	addButton(1,"Appearance",brandtAppearance);
	
	if(flags["BRANDT_BRANDT_TALK"] == undefined || flags["BRANDT_BRANDT_TALK"] + 60 * 24 <= GetGameTimestamp()) addButton(2,"Herself",talkToBrandtAboutHerSweetBooty,undefined,"Herself","Ask the sub-commander a bit about herself.");
	else addDisabledButton(2,"Herself","Herself","Maybe wait a bit before prying any deeper into her...");

	addButton(3,"Gastigoth",gastibuttsTalkBrandt,undefined,"Gastigoth","Ask Brandt about the prison station. This seems like a pretty well-oiled, and highly militarized, operation.");
	var wardenBonus:String = "";
	if(flags["MET_WARDEN"] == undefined) wardenBonus = " Might as well brace yourself for whatever you’re going to meet inside.";
	addButton(4,"Warden",talkToBrandtAboutTheWarden,undefined,"Warden","Ask Brandt about the Warden." + wardenBonus);

	addButton(14,"Leave",mainGameMenu);

	if(disable == "Herself") addDisabledButton(2,"Herself","Herself","You just talked about that.");
	else if(disable == "Gastigoth") addDisabledButton(3,"Gastigoth","Gastigoth","You just spoke about that.");
	else if(disable == "Warden") addDisabledButton(4,"Warden","Warden","You just spoke about that.");
	else if(disable == "Appearance") addDisabledButton(1,"Appearance","Appearance","You’re looking at her right now.");

	if(flags["BRANDT_HATES_YOU"] != undefined)
	{
		addDisabledButton(1,"Appearance","Appearance","Brandt has better things to do than be ogled.");
		addDisabledButton(2,"Herself","Herself","Brandt does not want to talk to you.");
		addDisabledButton(3,"Gastigoth","Gastigoth","Brandt does not want to talk to you.");
		addDisabledButton(4,"Warden","Warden","Brandt does not want to talk to you.");
	}
}


//[Herself]
//Ask the sub-commander a bit about herself.
public function talkToBrandtAboutHerSweetBooty():void
{
	clearOutput();
	showBrandt();
	author("Savin");
	//First Time Variant:
	if(flags["BRANDT_BRANDT_TALK"] == undefined)
	{
		output("<i>“So... how’d you end up working out here?”</i> you ask, trying to find some little crack to break the ice in the officer’s otherwise stony exterior.");
		output("\n\nShe blinks her big, blue eyes at you, and stays silent for a moment. When she answers, it’s measured and slow. <i>“I am a contractor for Nova Securities. As a daughter company, Faangnis Correction draws much of its security personnel from Nova.”</i>");
		output("\n\nShe inclines her head slightly towards the two towering, armored humanoids standing nearby. One of them grunts <i>“Sup?”</i> at you.");
		output("\n\nOh. Well then, how’d she come to work for Nova?");
		output("\n\nShe considers you for a moment more, then takes a little breath. The stone drops out of her voice, at least somewhat, as she answers. <i>“I completed my tour of duty in the Terran navy three years ago. As I have military-grade Reaper implants, which have little purpose outside of commanding a capital warship, I am legally classified as a weapon. This, you can imagine, limits my employment options. I chose to work in private security rather than have my cybernetics removed.”</i>");
		output("\n\nSo she captained a warship? She looks a little young to have been that high-ranked.");
		output("\n\n<i>“I was a Link Helmsman,”</i> she answers evenly. <i>“Which is to say, cybernetically attached to a ship, allowing for speed-of-thought combat reaction. I was linked to the fleet carrier </i>Digenes Akritas<i> for one year, and then the </i>Volsung<i> for an additional three as its primary Link.”</i>");
		output("\n\nHey, you’ve heard of those. They’re <i>huge</i> warships - prides of the Terran navy. In other words, she drove two of the biggest and scariest starships in the galaxy with her brain?");
		output("\n\n<i>“In essence,”</i> Brandt says, giving you a hint of a nod. <i>“Much of my accomplishment is derived from implants, as I said, though I was given the opportunity to have them as my natural reaction speed and spatial-mathematics are in the 99th percentile for Terran soldiers.”</i>");
		output("\n\nDeadpan she may be, but you think you just caught Brandt bragging a little. Must be nice, being a stone-cold genius ace pilot.");
		output("\n\nFor once, Brandt lets herself give off a hint of a smile. <i>“I’m afraid, as a Link Helm, I’m still four capital kills short of an ace. But... yes, I am quite satisfied with my experience nevertheless.”</i>");
		output("\n\nHer smile widens, and she cocks her head to the side with a tick of her enormous eyes you’d almost go ahead and call cute.");
		output("\n\n... wait, does that mean she blew up a capital ship? Holy shit.");
		flags["BRANDT_BRANDT_TALK"] = GetGameTimestamp();
		processTime(15);
		brandtMenu("Herself");

	}
	//[Herself]
	//Ask Brandt about herself again. Maybe you can get something a little more personal out of her, now that you’ve heard about her military career.
	//Repeatable Version. Only accessible on a repeat visit to the station (or at least 24 hours later, if that’s a pain to track), and after exhausting all other dialogue with her.
	else
	{
		output("<i>“So, aside from being a, uh, ‘Link Helm,’”</i> you say, glancing at the once-more stone-faced officer in front of you. <i>“What else have you done?”</i>");
		output("\n\nBrandt answers crisply. <i>“I have few accomplishments outside of my military and security experience, Captain. I enlisted in the Terran navy at eighteen and have served in a green-collar function continuously since.”</i>");
		output("\n\nAlright... well, how about before then? Where’d she grow up?");
		output("\n\n<i>“I fail to see how this is relevant to my qualifications, Captain,”</i> she responds, shifting her weight back on her tail. You cross your arms and tell her this isn’t a job interview - you just want to talk to her.");
		output("\n\nBrandt’s nose scrunches in the shadow of her over-sized eyes, but she recomposes herself a moment later. <i>“Very well... ");
		if(flags["SEXED_BRANDT"] != undefined) output("I suppose there’s no harm in sharing a little more...”</i>");
		else output("if you wish for me to bore you with my personal details, I have nothing to hide.”</i>");

		output("\n\nYou motion for her to go on. It’s like pulling teeth with this woman!");
		output("\n\nAfter a moment’s thought on the matter, Brandt folds her hands behind her back and starts talking in a slow, even cadence. <i>“I was born on Mars. My mother, the human contributor to my genetics, was and is a collegiate professor of chemistry, of Austrian descent. My ovir sire is an artist, born and raised in human colonies. One of her paintings is currently on display at the Neo Pompidou, and another in the National Gallery of Vesperia,”</i> she adds with a hint of pride.");
		output("\n\nQuite the accomplished family, then.");
		output("\n\nShe nods. <i>“Yes, and luckily their careers meant they were spared the worst of the Martian depression. I was decidedly middle class, somewhat sheltered, but well loved. An only child, as you might expect. I believe my parents did a better than average job, especially given the economic conditions and lingering social stigma against non-humans in the Martian colonies.”</i>");
		output("\n\nBrandt certainly has a... clinical diagnosis of her early life.");
		output("\n\nShe gives you one of those rare half-smiles. <i>“My implants. It isn’t my intention to be... cold. This is simply the way my brain has been mechanically rewired and reconditioned. Sentimentality does not come easy to me. Nor does... small talk, as you may have gathered.”</i>");
		output("\n\nAlright, then, maybe she’d rather talk about how she ended up joining the navy? That doesn’t seem like a natural choice for someone with her upbringing.");
		output("\n\n<i>“Actually, I am a seventh generation veteran,”</i> she smirks. <i>“On my sire’s side, both in the Confederate and Terran-Space militaries. I am the first to attempt, and gain, an officer’s commission. Largely thanks to my mathematical achievements, I was able to attain a scholarship to the Martian Naval Academy. Though I did not qualify for my own command, my acceptance in the Link program assured me a place of great responsibility on any ship I chose.”</i>");
		output("\n\nSpeaking of which, since she’s (inevitably gotten) on the topic again... didn’t she also say something about not wanting to get the implants out? Why’s that?");
		output("\n\nBrandt considers you for a long moment. <i>“If I told you that, by removing a hemisphere of your brain, I could make you happier... would you do it?”</i>");
		if(pc.isBro() && pc.isTreated()) output("\n\nDude, totally.");
		else if(pc.isTreated() && pc.isBimbo()) output("\n\nLike, been there, done that!");
		else output("\n\nUhhhh...");

		output("\n\n<i>“As I said, it is not my intention to be unfriendly or cold. But the idea of having a full third of my mental faculties stripped is difficult to countenance. Not to mention the lingering possibility of mishap in surgery, or mental defect. Having grey-matter implants removed completely is rare and dangerous, even today. I am... content to be difficult to talk to. My job requires little more than terse call and response, after all.”</i>");

		if(flags["SEXED_BRANDT"] != undefined) output("\n\n<i>“Though I do... I appreciate your taking the time to talk to me, Captain. I know I am not the easiest person to converse with, even among this station’s population.”</i>");
		else output("\n\n<i>“Except when a very nosy captain decides to be the first person in months to engage me in conversation...”</i>");
		output("\n\nIf you didn’t know better, you’d say Sub-Commander Brandt here sounds very, very lonely.");
		output("\n\nThe hint of rose that comes to her cheeks when you say it is all but hidden by her dark, bronzed skin... but it’s there, sure as the little twist of her tail behind her or the sudden swallow. <i>“I... um, I don’t mean to sound that way.”</i>");
		output("\n\nBut she does.");
		output("\n\n...Are you wrong?");
		output("\n\nBrandt stiffens, snaps her arms behind her back, and looks you dead in the eye.");
		if(flags["SEXED_BRANDT"] != undefined) 
		{
			output(" <i>“If... if you wish to talk more privately, Captain Steele, you are welcome to accompany me back to my office. It is high time I took a short break.”</i>");
			output("\n\nOne of the goons behind her chuckles, and gets a swift tail-smack in the thigh for it.");
		}
		else
		{
			output(" <i>“You are not. Now that you have successfully extracted that information, what would you like to do with it? Did you simply want me to admit that in front of my subordinates,”</i> she growls, waving a hand back at the two beefy security goons standing behind her, <i>“...or did you have a point to make?”</i>");
			output("\n\nYou take a step back, trying to mask the surprise at the sudden razor-sharp verbal slap the normally even-toned officer just dropped across your face.");
		}
		processTime(15);
		//[Flirt] [Just Asking...] [Tease]
		clearMenu();
		addButton(0,"Flirt",flirtWivBrandt,undefined,"Flirt","You could help her with the loneliness thing...")
		addButton(1,"Just Asking...",justAskingBrandtJeesusPeezusYaHoser,undefined,"Just Asking...","You were just asking... maybe trying to make her feel better, if you could get that out of her?");
		addButton(2,"Tease",teaseBrandtChickStuffAndMoreStuff,undefined,"Tease","You just wanted her to say it!");
	}
}

//[Tease]
//You just wanted her to say it!
//+Mischievous
public function teaseBrandtChickStuffAndMoreStuff():void
{
	clearOutput();
	showBrandt();
	pc.addMischievous(5);
	author("Savin");
	output("<i>“...I see,”</i> Brandt says, staring down your cheeky grin. <i>“My mistake, Captain, I momentarily took one of the station’s clients for someone worth talking to. Now, if there’s anything else?”</i>");
	output("\n\nOne of the goons behind her chuckles, and gets a swift tail-smack in the thigh for it.");

	//Disable all Brandt’s talk/sex scenes. Permanently.
	flags["BRANDT_HATES_YOU"] = 1;
	processTime(3);
	brandtMenu("Herself");
}

//[Just Asking...]
//You were just asking... maybe trying to make her feel better, if you could get that out of her?
public function justAskingBrandtJeesusPeezusYaHoser():void
{
	clearOutput();
	showBrandt();
	author("Savin");
	output("Brandt sighs as you explain yourself, slowly relaxing her shoulders when you insist that it was an innocent line of questioning.");
	output("\n\n<i>“I... I am sorry, Captain. I did not mean to snap,”</i> she murmurs after a long moment, wrapping her tail around her leg. <i>“As I said, I am not much of a conversationalist. Being asked personal questions like that is... difficult. Please, let’s discuss something else?”</i>");
	processTime(4);
	brandtMenu("Herself");
}

//[Flirt]
//You could help her with the loneliness thing...
public function flirtWivBrandt():void
{
	clearOutput();
	showBrandt();
	author("Savin");
	output("<i>“You don’t have to be lonely,”</i> you say, giving her a warm smile and stepping closer... and trying to ignore the many, many gun drones watching you. Not to mention the two impassive, masked armed guards not ten feet away. They don’t have faces, nobody cares what they think.");
	output("\n\nFor her part, Brandt blinks at you. <i>“I... I’m sorry, Captain?”</i> she squeaks, voice absolutely breaking as you draw near. <i>“That isn’t something I can simply decide for myself...”</i>");
	output("\n\nIt could be. It is, right now.");
	output("\n\nThe halfbreed woman blinks at you again, measuring your every word with those huge blue eyes of hers. After a moment, she glances back at the two armored guards looming behind her.");
	output("\n\nOne of them gives a tiny nod towards the hallway, towards Brandt’s office. The other gives her a thumb’s up around his - her? Who knows - shield.");
	output("\n\nBrandt gulps, then turns back to you. The same guard gives you a bigger thumbs up once the officer isn’t looking. <i>“I... Ah. If you would like, Captain, I would be delighted to give you a tour of the station’s security command. What you might call my office. I believe you would like to see it. With me.”</i>");
	output("\n\nPoor thing. Close enough, you guess. You tell her to lead on");
	//not Disarmed:
	if(!pc.hasStatusEffect("Disarmed"))
	{
		output(", and quickly disarm yourself before one of the surprisingly-supportive faceless minions in the background shield-bashes you over it");
		
		pc.takeMeleeWeapon();
		pc.takeRangedWeapon();
		pc.createStatusEffect("Disarmed",4,0,0,0,false,"Blocked","You’ve checked all forms of weaponry at Gastigoth’s security checkpoint.",false,0,0xFF0000);
	}
	output(".");
	output("\n\n<i>“It’s just to the north...”</i>");
	//Unlock Sex. Let PC into the C&C room.
	if(flags["BRANDT_FLIRTED"] == undefined) flags["BRANDT_FLIRTED"] = 1;
	processTime(5);
	brandtMenu("Herself");
}

//[Gastigoth]
//Ask Brandt about the prison station. This seems like a pretty well-oiled, and highly militarized, operation.
public function gastibuttsTalkBrandt():void
{
	clearOutput();
	showBrandt();
	author("Savin");
	output("<i>“Penal station </i>Gastigoth<i> is fairly typical for its purpose,”</i> she answers, so quickly you almost think it’s a V.I.’s programmed response. <i>“The superstructure is owned by Nova daughter company Faangnis Corrections, with personnel drawn from both corporations. While dedicated corrections departments may be common in the galactic core, few such private companies operate facilities as large or intensive as </i>Gastigoth<i>. For that reason, as well as the added risk of piracy, armed escape attempts, and other direct hazards, it is hardly surprising that a maximum security suite would be operated by a private military contractor, no?”</i>");
	output("\n\nIn other words, Nova Securities is here to keep a prison break from happening?");
	output("\n\nBrandt nods sharply. <i>“The greatest threat to a station such as </i>Gastigoth<i> is not internal strife, but an external attack. When private correction stations were first put into practice along the galactic frontier, they were frequently the target of criminal raids - either to free their compatriots, reinforce their crews, or to take slaves. In response, companies like Faangnis allowed themselves to be purchased and retooled by professional security contractors.”</i>");
	output("\n\n<i>“So why no risk from inside?”</i> you ask.");
	output("\n\nThe answer comes with a slight nod of her head towards the window behind you. <i>“Where would the prisoners go if they broke out? That is the chief advantage to penal stations: a lack of escape possibility. Even if the prisoners took control of the station, there are only ever a handful of small craft available for them to steal. Heavy craft are not permitted within the security zone to avoid possible hijackings.”</i>");
	output("\n\n<i>“And, of course, space is also a weapon in its own right. Should the prisoners rebel, we are fully within our legal authority to shunt sections of the station into vacuum.”</i>");
	output("\n\nOh. Well, that’d do it.");
	output("\n\nBrandt shrugs. <i>“Spacing our prisoners is a last resort, of course. As you have likely noticed, Gastigoth is equipped with the best modern security has to offer to prevent such an unfortunate event. Aside from security personnel and riot officers, we have hundreds of armed drones throughout the station, plus security force-fields, chemical suppression systems, and of course, basic shock collars and electrified deck and hull plating. Killing prisoners does not earn the station any funding from the governments that sponsor us, so it is in fact in our best interest to hurt, not kill, should the need arise. In my years of service here, it thus far has not.”</i>");
	output("\n\nHuh, considering all the security around here - and the insane amount of firepower she was threatening you with on your way in - you’d have thought there’d but a lot more... space murder going on.");
	output("\n\nThe commander gives you the faintest hint of a smile. <i>“That is the image we like to cultivate. Appearing like an impregnable fortress has its benefits, chiefly instilling an aversion to attempting an assault on the station. While </i>Gastigoth<i> has only a fraction of the power of a Terran super-carrier like my </i>Volsung<i>, I assure you it is more than sufficient to counter even a concerted Black Void assault. Any prisoners remanded here after your adventures will be quite secure.”</i>");
	output("\n\nYou can see that. So, aside from keeping people locked up, what does <i>Gastigoth</i> do with its prisoners? Surely there’s something that makes it different than just any other station.");
	output("\n\n<i>“Well,”</i> the half-lizard woman says, shifting her weight, <i>“Our facility is primarily dedicated to holding and correction for ultra-high-risk prisoners - either due to their individual talents, or due to their connections. Still, you are right to assume that our station provides... alternative corrective measure, somewhat more... intensive than those common in government-run prisons. Or ones with more moral oversight.”</i>");
	output("\n\nThat doesn’t sound good, coming from someone working here.");
	output("\n\n<i>“I make no judgement on you, the Warden, or our other patrons,”</i> she answers sharply. <i>“I simply mean that by most galactic standards of morality, the means we use for punishment are somewhat esoteric, if not extreme. Then again, we don’t engage in outright torture or the violent barbarism common on less civilized frontier planets like Myrellion or Phaedra. The majority of our corrective measures would fall well within the rights of, say, a master and a deeply indentured servant. One that had made a very, very loose contract.”</i>");
	output("\n\nUh-huh.");
	if(flags["MET_BETH_CARVER"] != undefined) output(" You wonder if these folks have any relation to a certain slaver mistress you’ve met...");
	output("\n\nBrandt curls her tail under her, wrapping her legs in its scaly embrace. <i>“Anything else you’d like to discuss, captain? I’m afraid querying the specifics of our programs would be better left to the Warden.”</i>");

	processTime(18);
	brandtMenu("Gastigoth");
}

//[Warden]
//Ask Brandt about the Warden. {Might as well brace yourself for whatever you’re going to meet inside.}
public function talkToBrandtAboutTheWarden():void
{
	clearOutput();
	showBrandt();
	author("Savin");
	output("<i>“Tell me about the Warden,”</i> you prompt, glancing between Brandt and the doors leading deeper into the station.");
	//if haven’t met the Warden:
	if(flags["MET_WARDEN"] == undefined)
	{
		output("\n\nThe half-ovir makes a noncommittal sound and folds her hands over her stomach. <i>“I’d prefer not to gossip, captain. Warden Kasmiran has made herself available to you directly, if you’d care to come aboard. She is, I understand, eager to meet you.”</i>");
		output("\n\nOh, come on. She can at least tell you a little bit? You don’t even know what species the Warden is!");
		output("\n\nBrandt takes a deep breath, releases it, and locks eyes with you. <i>“Very well, if you insist. ");
	}
	else output(" <i>“");
	output("Warden Regina Kasmiran: feminized cylirian, age fifty eight. Natural-born citizen of the Terran-Space Coalition, first generation. Heavily cyberized, both necessary and voluntary. Doctorate in criminal psychology obtained from the Neue Rhineland University on the Terran colony of Carima Three, with honors. Service in the Coalition Intelligence Agency, also with honors. Currently the junior of two executive officers in control of Faangnis Corrections, having obtained a minority stock control through private brokerage before taking the position immediately after exiting Terran service.”</i>");
	output("\n\nThose sure were a lot of words that didn’t actually tell you anything about her.");
	output("\n\nBrandt blinks, then spends a moment thinking. <i>“The Warden is a very... calculating individual. Profit-driven. Decisive. What some might label controlling, perhaps even dominating. But dedicated to the correction of criminal behavior with a zeal that I find commendable.”</i>");
	if(pc.isBro() || pc.isBimbo()) 
	{
		output("\n\nSo she’s a scary dominatrix that runs a prison?");
		output("\n\nThe icy woman in front of you actually giggles at that, a momentary break from decorum that she quickly hides behind a hand. <i>“Yes... I suppose that’s an apt description.”</i>");
	}
	else 
	{
		output("\n\nSounds like the sort of person who’d end up running a doom station full of convicts in the backwaters of space, yeah.");
		output("\n\n<i>“Indeed,”</i> Brandt says, crossing her arms. <i>“May we change the subject now?”</i>");
	}
	processTime(5);
	brandtMenu("Warden");
}

//Disarm/Rearm
//Get your weapons checked {in / out}.
public function disarmOrRearmLikeABoss():void
{
	clearOutput();
	showBrandt();
	author("Savin");
	//Disarm:
	if(!pc.hasStatusEffect("Disarmed"))
	{
		output("You approach Brandt and say that you’re ready to be disarmed.");
		output("\n\n<i>“Good. Welcome aboard, captain,”</i> she says, pulling out a heavy-duty tub from under the station and pushing it towards you. The two armored goons with shock rifles eye you warily so that you make sure you go nice and slow, taking your time drawing your [pc.weapon]");
		//laser:, ejecting the battery//bullet:, ejecting the magazine //rock: n/a // else: 
		//Fen note: not all energy weaps use batteries. Gonna just go with the geneirc here:
		output(", making sure it’s safe and setting it inside.");
		output("\n\nBrandt watches you impassively until you indicate that you’re finished, at which point she picks up an electronic wand from under the station and waves you forward. You step up, just to arm’s reach before she plants one hand on your chest and sweeps the wand around your person. It makes a soft, ticking beep until Brandt gives a satisfied nod and tucks it away.");
		output("\n\n<i>“Clear. You’re free to proceed, captain.”</i>");
		output("\n\nIn you go, then.");
		//[Next]
		
		pc.takeMeleeWeapon();
		pc.takeRangedWeapon();
		//Apply Disarmed Condition, same as New Texas.
		pc.createStatusEffect("Disarmed",4,0,0,0,false,"Blocked","You’ve checked all forms of weaponry at Gastigoth’s security checkpoint.",false,0,0xFF0000);
	}
	//Rearm:
	else
	{
		output("You approach Brandt and say that you’d like to have your gear back now.");
		output("\n\n<i>“Of course,”</i> she says, reaching under the security station and retrieving the bucket you stowed your weapons in. You spend a few moments getting your equipment sorted out, back the way you like it, before stepping back towards the airlock.");
		if(flags["SEXED_BRANDT"] != undefined) output("\n\n<i>“Alright. See you again soon, I hope,”</i> she says, giving you that faint little smile of hers.");
		else output("\n\n<i>“Have a safe journey, captain,”</i> the security commander says, giving you a slight nod. <i>“Please return to your ship and we will guide you out of the security zone.”</i>");
		output("\n\nYou nod and turn to leave.");
		//[Next]
		
		returnAllItems(true);
		//Remove Disarmed Condition
		pc.removeStatusEffect("Disarmed");
	}
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Brandt: Sex
//Add [Brandt] to C&C room whenever the PC’s in there.
public function brandtCCRoomSexyTiems():void
{
	clearOutput();
	showBrandt(true);
	author("Savin");
	//First Time
	if(flags["BRANDT_FLIRTED"] == 1)
	{
		output("Now that you’re alone in the steamy strategic center of the space station, you turn to the lovely sub-commander and ask what comes next. She, you notice, has unbuckled the lapel of her dress uniform, letting a white undershirt and just a hint of cleavage show. Guess you’re not the only one feeling the heat...");
		output("\n\n<i>“I... was hoping you would know?”</i> she answers, nervousness clearly cut in her voice. <i>“I’m sorry, you put me very much on the spot. I don’t know...”</i>");
		output("\n\nFuck it. You sweep forward, grab Brandt by the waist, and yank her into a kiss. She gasps, squirms, and then melts into your firm embrace. Every ounce of stress and resistance bleeds out of the soldier-girl and into your hands, turning her practically limp save for the steady sway of her lizard-like tail against your [pc.leg].");
		output("\n\n<i>“Oh!”</i> she murmurs when you break the kiss, needing a little room to dig your hands into her shirt so you can pull it off. <i>“I... I guess this works.”</i>");
		output("\n\nShe laughs - actually giggles - as your hands roughly pull away at her clothing, yanking her uniform open and back, then her tank-top up over her head. The motion catches on and pops off the tie holding her bun of hair together, letting it spill down around her shoulders while your hands grab at her breasts. They’re small but perky, bouncing in your grip and showing off a crest of golden color over them - a little plume of scales right in the heart of her svelte cleavage.");
		output("\n\nBrandt’s breath catches when you run a tongue along one of her quickly-stiffening peaks, and suddenly you’re falling backwards, carrying all of her weight as the shy beauty loses her balance amid the pleasure. Lucky you, her command chair is right behind you, cushioning your fall and letting you sprawl backwards over the reclining seat. Brandt ends up overtop you, awkwardly straddling your hips as your hands work her pants down around her squirming tail.");
		output("\n\nShe kisses you, leaning down and running her lips all around yours when you finally unhook her tail and drop her drawers. Nothing left but panties and boots, but for now, her attention is on you: you moan as exploratory hands pull your equipment aside, caressing every new inch of flesh they reveal until you’re bare");
		if(pc.hasCock()) output(" and your [pc.cock] is throbbing with urgent need, rubbing against Brandt’s thigh");
		output(".");

		output("\n\nOnly then does she pull herself up, resting back on her knees and guiding your hands to her waist. Gods and stars, her body’s every bit as gorgeous as you’d imagined it, now that you can see her all but naked: toned, sleek, glistening in the red running lights. Her perky breasts heave on her chest, and her hips - so broad and powerful they’re almost inhuman - buck in your hands. Her tail coils around ");
		if(pc.legCount > 1) output("one of your [pc.legs]");
		else output("your lower body");
		output(", gripping you as tightly as her mighty thighs do your waist.");
		output("\n\n<i>“I... I’m Hélla, by the way,”</i> she whispers, letting it turn into a little moan as your fingers dig into her firm ass.");
		output("\n\n<i>“[pc.name],”</i> you answer. She already knew, you realize a moment later, but... hell.");
		output("\n\nBrandt - Hélla - smiles prettily. <i>“Okay, [pc.name]. Show me just what you meant back there...”</i>");
		flags["BRANDT_FLIRTED"] = 2;
	}
	//Repeat Sex
	else
	{
		output("Knowing full well that Brandt wants you, it’s all you could do to keep your hands off her up until now. But the moment you two are alone, all bets are off. You twist around and grab the shy flower by her broad waist, yanking her against your [pc.chest] and into a fierce kiss. She gasps, but it turns into a lovely little moan before long. Every ounce of stress and resistance bleeds out of the soldier-girl and into your hands, turning her practically limp save for the steady sway of her lizard-like tail against your [pc.leg].");
		output("\n\n<i>“Oh!”</i> she murmurs when you break the kiss, needing a little room to dig your hands into her shirt so you can pull it off. <i>“I... Oh, I like it when you lead, Captain...”</i>");
		output("\n\nShe murmurs happy, sweet nothings at you as your hands roughly pull away at her clothing, yanking her uniform open and back, then her tank-top up over her head. The motion catches on and pops off the tie holding her bun of hair together, letting it spill down around her shoulders while your hands grab at her breasts. They’re small but perky, bouncing in your grip and showing off a crest of golden color over them - a little plume of scales right in the heart of her svelte cleavage.");
		output("\n\nBrandt’s breath catches when you run a tongue along one of her quickly-stiffening peaks, and suddenly you’re falling backwards, carrying all of her weight as the shy beauty loses her balance amid the pleasure. Lucky you, her command chair is right behind you, cushioning your fall and letting you sprawl backwards over the reclining seat. Brandt ends up overtop you, awkwardly straddling your hips as your hands work her pants down around her squirming tail.");
		output("\n\nShe kisses you, leaning down and running her lips all around yours when you finally unhook her tail and drop her drawers. Nothing left but panties and boots, but for now, her attention is on you: you moan as exploratory hands pull your things aside, caressing every new inch of flesh they reveal until you’re bare");
		if(pc.hasCock()) output(" and your [pc.cock] is throbbing with urgent need, rubbing against Brandt’s thigh");
		output(".");

		output("\n\nOnly then does she pull herself up, resting back on her knees and guiding your hands to her waist. Gods and stars, her body’s is every bit as gorgeous as you’d imagined it, now that you can see her all but naked: toned, sleek, glistening in the red running lights. Her perky breasts heave on her chest, and her hips - so broad and powerful they’re almost inhuman - buck in your hands. Her tail coils around ");
		if(pc.legCount > 1) output("one of your [pc.legs]");
		else output("your lower body");
		output(", gripping you as tightly as her mighty thighs do your waist.");
		output("\n\nShe moans wordlessly, grinding against your sex, awaiting your guiding leadership...");
	}
	processTime(10);
	//[Missionary] [Cowgirl Anal] [Sixty Nine]
	brandtSexMenu();
}

public function brandtSexMenu():void
{
	clearMenu();
	if(pc.hasHardLightEquipped() || (pc.hasCock() && pc.cockThatFits(brandtCapacity()) >= 0)) addButton(0,"Missionary",penisRouter,[brandMissionarySex,brandtCapacity()],"Missionary","Flip Hélla onto her back and plow her into her command chair.");
	else addDisabledButton(0,"Missionary","Missionary","You need a penis or a strap-on that will fit inside her for this.");

	addButton(1,"Sixty-Nine",brandtSixtyNine,undefined,"Sixty-Nine","That lizard-pussy is practically right in your face, begging for attention...");	

	if(flags["SEXED_BRANDT"] != undefined && (pc.hasHardLightEquipped() || (pc.hasCock() && pc.cockThatFits(brandtCapacity()) >= 0))) addButton(2,"Cowgirl Anal",penisRouter,[heliaAnal,brandtCapacity()],"Cowgirl Anal","Urge Brandt to climb on your cock and put that plump asshole to good use.");
	else if(flags["SEXED_BRANDT"] == undefined) addDisabledButton(2,"Cowgirl Anal","Cowgirl Anal","You’ll need to have some traditional sexual experiences with her first.");
	else addDisabledButton(2,"Cowgirl Anal","Cowgirl Anal","You need a penis or a strap-on that will fit inside her for this.");
}

public function brandtCapacity():Number
{
	return 1200;
}

//Brandt Sex: Missionary
//Flip Hélla onto her back and plow her into her command chair.
//cockOrStrapon
public function brandMissionarySex(x:int):void
{
	clearOutput();
	showBrandt(true);
	author("Savin");
	output("Tightening your grip on Hélla’s hips, you pick her up and flip her around, planting her in the command chair while you loom over her, free to run your hands across her supple, scaled flesh. Her hand, meanwhile, delves between her legs, rubbing at her clit while you focus on her nipples, bathing the shy soldier in pleasure. Her long, muscular legs spread over the chair’s arms to wrap around your [pc.hips], ");
	if(x >= 0) output("drawing your [pc.cock " + x + "] inexorably towards the slit between them.");
	else output("flicking the little device that causes your hardlight strapon to flare into existence. The shaft flops weightily into the gash of her sex, stirring up the slick honeypot.");
	output("\n\n<i>“Come on,”</i> Hélla murmurs, nibbling at your [pc.ear]. <i>“Take me.”</i>");
	if(pc.isMischievous()) output("\n\n<i>“Yes ma’am.”</i> You grin.");
	else output("\n\nLike you needed more of an invitation!");
	output(" Her thick, scaly tail brushes up against your back, pushing you in until your [pc.chest] " + (pc.biggestTitSize() >= 1 ? "are" : "is") + " pressed against her perky little tits, and your [pc.cockOrStrapon " + x + "] grinds against the thick lips of her sex, picking up lubrication from her free-flowing excitement. The halfbreed shivers and gasps, feeling your prick rub against her cherry bulb, faster and faster until a motion of your [pc.hips] pulls it back and presses the crown against her hungry slit.");
	output("\n\nYou push forward, and her body yields, opening like a flower to accept the stiff mast of your [pc.cockOrStrapon " + x + "]. Wet heat envelops you, caressing you and drawing you deeper into the halfbreed girl’s sensual embrace.");
	if(x >= 0) pc.cockChange();
	output("\n\n<i>“A-ah! I feel it!”</i> Hélla gasps, arching her back from the chair, thrashing her tail against your [pc.leg]. She moans, softly at first, then higher as you press forward.");
	if (x >= 0)
	{
		if(pc.cocks[x].thickness() >= 3) output(" <i>“It’s so big. Like it’s tearing me apart!”</i>");
		else if(pc.cocks[x].cLength() >= 15) output(" <i>“So deep! Keep going... keep going until it’s pushing my belly out!”</i>");
		else if (pc.cocks[x].cLength() < 6) output(" <i>“Like I’m swallowing you up,”</i> she giggles. <i>“Feels good...”</i>");
	}

	output("\n\nYou grin down at Hélla, starting to move your hips back and forth, thrusting into her. Her legs and tail tighten around your hips, and her fingers claw at your back, wrapping you in warm, scaled flesh. Her pussy clenches for you, welcoming your dick back again and again with wet squeezes that caress you from crown to ");
	if(x >= 0 && pc.hasKnot(x)) output("[pc.knot " + x + "].");
	else output("base.");

	output("\n\nThough you start slow, giving your lover time to adjust, she quickly urges you onwards. <i>“You can go faster. I’m not... I’m not made of paper,”</i> Hélla whispers breathily. You thrust forward, spearing yourself to the hilt in her, <i>“I want us to rut like animals!”</i>");
	output("\n\nSo you pump faster, building up a fierce rhythm of thrusts and pulls into those sweltering depths between Hélla’s legs. Her moans reach a fever pitch, high and girly - an alluring contrast to her normally stone-cold public face. The clenches of her quim grow wilder, leaking wetness down her thighs; she cums without saying a word, clawing at your shoulders and squeezing hard around your [pc.cockOrStrapon " + x + "]. A little squeal is all your warning before her orgasm, and then you’re feeling her muscles go wild and her wetness spike.");
	output("\n\nWhen it passes, Hélla goes all but limp in your arms, breathing hard into your neck. You run a hand down, first brushing her cheek, then one of her breasts, squeezing the perky mound until she’s gasping, squirming underneath you. Her nipple is so stiff that it practically invites you to give it a pinch and tug, making Hélla’s back arch with pleasure, and her twat comes down hard on you again.");
	output("\n\n<i>“That... that felt...”</i> Hélla gasps, trying to catch her breath. You slow your movements to a gentle gyration, rocking your [pc.hips] slowly against her cum-stained groin.");
	output("\n\n<i>“Amazing?”</i> you finish for her.");
	output("\n\nShe nods, eagerly. <i>“That’s a good word for it. But you haven’t, um... cum yet. Here.”</i>");
	output("\n\nHélla reaches down, drawing you out of her with one hand and bracing herself against the chair with the other. With a grunt and a gasp, she rolls herself over, planting her hands on the back of the chair and wiggling her booty at you. Her tail curls up over her back, and a hand slips down to spread her pussy lips, showing off the slick, still-open hole between them.");
	output("\n\n<i>“Please keep going. Let me help you get off, too.”</i>");
	output("\n\nWell, if she insists...");
	processTime(30);
	pc.changeLust(100);
	clearMenu();
	//[Buttjob] [Finish Inside]
	addButton(0,"Buttjob",heliaButtjob,x,"Buttjob","Grab Hélla’s ass and finish all over that scaly butt.");
	if(x >= 0) addButton(1,"Finish Inside",finishInsideHelia,x,"Finish Inside","Blow your load in that sultry lizard-snatch.");
	else addDisabledButton(1,"Finish Inside","Finish Inside","You need a biological penis to cum inside her.");
}

//[Buttjob]
//Grab Hélla’s ass and finish all over that scaly butt.
public function heliaButtjob(x:int):void
{
	clearOutput();
	showBrandt(true);
	author("Savin");
	output("You step forward, planting your hands on Hélla’s hips and aligning your [pc.cockOrStrapon " + x + "] with the gash of her sex. She gasps with pleasure when your crown brushes against her clit, but you go no further, instead drawing yourself up between her lips and letting your prick drop heavily into the cleft of her ass.");
	output("\n\nHélla doesn’t have a whole lotta junk in her trunk, but what’s there is firm and tight, flexing as you grope it in both hands. You press both cheeks down around your [pc.cockOrStrapon " + x + "] wrapping yourself in muscular flesh. Hélla squeezes down for you, helping you keep her svelte rump clenched around your dick, and you start to thrust. Her tail curls around your [pc.hips], pulling you in until you hilt against her butt, your ");
	if(pc.balls > 0) output("[pc.balls]");
	else output("thighs");
	output(" slapping heavily against the soldier’s supple backside.");

	output("\n\nA few thrusts later and you’re on the edge");
	if(x >= 0) output(", leaking pre into the valley of ass-cleavage pressing around your shaft");
	output(". Your breath quickens, and you feel hot tightness swelling in your loins, ready to burst at any moment.");

	if(x >= 0)
	{
		output("\n\nYou aim directly into the base of her tail and let loose, squirting your load up through her crack and watching it splatter against Hélla’s scales. She gasps, flexing her muscles in response to the sudden smear of heat leaking down to her thighs.");
		output("\n\n<i>“Oh!”</i> Hélla sighs, wiping at your smeared orgasm with the tip of her tail. <i>“Well, that certainly made a mess. I don’t think I can return to duty like this...”</i>");
		output("\n\nYou chuckle and ");
		if(pc.isBimbo()) output("spend the next few minutes licking [pc.cum] off of Hélla’s butt, spit-shining that scaly booty until it sparkles");
		else output("go searching for a towel. You spend the next minute or so wiping up the cummy smear on Hélla’s rump and thighs");
		output(". You make sure to tease her pussy while you do so, letting the occasional finger or tongue caress her labia while you work, until she’s flushed and squirming.");
		output("\n\n<i>“Now I’ll have to go back to work weak-kneed. I blame you for this... you’d best take responsibility for it before you leave.”</i>");
		output("\n\nYes ma’am.");
	}
	else
	{
		output("\n\nThe hardlight strapon feeds back a rush of pleasure, making every muscle in your body tense with orgasmic ecstasy. You gasp, breathing hard, and slam your hips into your lover’s ass, pushing her hard against the command chair. Hélla giggles, grinding back and wiggling her hips so that her ass is constantly teasing your radiant rod, making sure you’re bathed in pleasure right until the very end.");
		output("\n\nWhen your orgasm finally passes, leaving you panting and clutching Hélla’s hips as if your life depended on those broad egg-layers, you manage to stumble back and deactivate your hardlight cock. It vanishes in an instant, taking with it a whole host of sensations that make your body wonder why it felt so good moments ago...");
		if(flags["BRANDT_BUTTJS"] == undefined) output("\n\n<i>“That’s an interesting toy,”</i> Hélla murmurs, twisting back around to sit in the command chair, crossing her legs. <i>“I never thought I’d rut with pure light...”</i>");
		output("\n\nYou take a few moments to catch your breath, regaining your balance with a little help from your lover’s oversized tail. Hélla helps you get dressed, and you return the favor, getting each other ship-shape in no time... with a generous helping of gropes and flirts along the way.");
		output("\n\nWhen you’re done, Hélla nudges you towards the door. <i>“Come along, before someone notices we’ve been gone.”</i>");
		IncrementFlag("BRANDT_BUTTJS");
	}
	IncrementFlag("SEXED_BRANDT");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].southExit);
}

//[Finish Inside]
//Blow your load in that sultry lizard-snatch.
//Requires a cock.
public function finishInsideHelia(x:int):void
{
	clearOutput();
	showBrandt(true);
	author("Savin");

	output("You saunter forward, running your hands up along the full, firm cheeks of her ass and pulling them apart. The pink slit between her legs peeks out, beckoning you with slimy winks and the alluring scent of feminine arousal. You plant your [pc.cockHead " + x + "] right in the cleft between her quim’s plush lips, rubbing it against her throbbing clit.");
	output("\n\n<i>“Don’t tease,”</i> Hélla chides, pushing her hips back and taking your [pc.cock " + x + "] to the first inch. <i>“This is for you, after all...”</i>");
	output("\n\nYou sigh, more from pleasure than consternation, as Hélla’s sex envelops your dick. You mirror her push after a moment, thrusting into the sultry slit until your lover’s moaning, arching her back and pulling you in again with her tail. With her tail curled around your waist, pinning you against her butt, there’s nothing you can do but use your hips to piston back and forth, letting your lover’s ever-fierce grip milk you. It only takes a few moments of this treatment to draw you back to the edge, and then over it with a sharp grunt of pleasure. [pc.Cum] shoots deep, thick rivulets filling Hélla’s twat ");
	if(pc.cumQ() >= 1500) output("until her stomach puffs out and globs of it run down her thighs, splattering on the deck below you.");
	else output("until your dick is leaking aftershoots into a well-packed pussy, and Hélla herself is leaning against the chair, sighing contentedly.");
	output("\n\n<i>“Well, that was full-filling,”</i> Hélla says snickering at her own joke a moment afterwards. <i>“I suppose I’m going to feel that sloshing around inside for the rest of my shift. I’ll think of you every time something threatens to leak out.”</i>");
	output("\n\nThat’s... that’s something. You give Hélla a swat on the butt and go to gather your clothes, getting ready to accompany her back into public.");
	processTime(5);
	IncrementFlag("SEXED_BRANDT");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].southExit);
}

//Brandt Sex: Sixty Nine
//That lizard-pussy is practically right in your face, begging for attention...
public function brandtSixtyNine():void
{
	clearOutput();
	showBrandt(true);
	author("Savin");
	output("You run your hands over Hélla’s firm rear, kneading her cheeks and slowly spreading them apart. Between the lush, supple mounds you find a slender little slit that’s just begging for attention, spider-webbed with feminine slime that glistens in the light. Above it sits the plump ring of her exotic alien ass, puffed out like a silken donut. The dark folds of her quim wink at you, breaking you from your lustful reverie and prompting you to lean your face into the valley of butt-cleavage and sink your [pc.tongue] into Hélla’s sex.");
	output("\n\nThe half-ovir vixen gasps, arching her meaty tail over her back and clenching down with her pussy-muscles. The slick walls of her sex slide around the sides of your [pc.tongue], trying at odds to push you back and draw you deeper with every uneven breath she takes. Exploring her depths is slow going, but oh-so rewarding: every new inch of pussyflesh induces a high chorus of moans and shuddered breaths from your halfbreed lover. You’re fully buried in her slit by the time she manages to regain control of her tail, just long enough to wrap around your shoulders and pull you flush into her ass, making you drive your tongue just as deep as it will go.");
	output("\n\n<i>“That’s amazing,”</i> Hélla moans, fingers digging into the command chair. <i>“Your [pc.tongue] is... how does it make me feel this good?”</i>");
	output("\n\nYou spell out your answer into her quim, tracing letters with your tongue until she’s crying out, and steamy wetness is flecking your cheeks amidst orgasmic contractions. You’re half-afraid she’s going to suffocate you with her tail before she’s finally done, slumping forward in her chair and relaxing all her muscles, like all the stress has just flown out of her through her pussy. A soft, satiated sigh escapes her lips... before she rears forward and plants a foot square on your [pc.chest].");
	output("\n\nThe next thing you know, you’re lying sprawled out on your back with Hélla on top of you, planting that broad rump right in your face, pussy so close you can taste her excitement on the air, hanging like a cloud of lust over your [pc.face].");
	output("\n\n<i>“That was good,”</i> Hélla says, smirking over her shoulder. <i>“Let me see what I can do for <b>you</b>...”</i>");

	//PC has a cock:
	if(pc.hasCock()) output("\n\nHélla leans down slowly, sensually stretching herself out over your body and wrapping her hands around your [pc.cock]. A hungry little sound escapes her lips before you feel something wet pressing to the crown your dick, wrapping it in lurid heat - a kiss, planted right on your tip! She doesn’t stop there, of course: Hélla’s tongue slithers out, probing your cumslit before encircling your dick, guiding inch after inch into her mouth as she lowers her head into your loins.");
	if(pc.hasVagina()) output("\n\nThe lustful lizard-girl lays her hands on your thighs, slowly running her fingers up your bare [pc.skinFurScales]. Eventually, inevitably, they find their way to the outer mound of your sex, and her thumbs start to spread you open. A shiver runs up your spine as your body is handled by her sensual touches, completely outside of your control, left to the soldier’s silent desires. All you can do is gasp and shiver with pleasure as Hélla’s fingers slide inside you, exploring your pussy’s depths.");
	if(!pc.hasGenitals()) 
	{
		output("\n\n<i>“Well, you like to present a challenge, I guess,”</i> she murmurs, patting your bare crotch. <i>“What do I do with this?”</i>");
		output("\n\nShe tsks her tongue, thinking to herself for a moment before resting her hands on your thighs. The tips of her fingers slip downwards, cupping the cheeks of your [pc.butt] and slowly, tenderly, spreading your ass apart so she can get at the [pc.asshole] she seeks. You feel something warm and wet splat onto the rim of your hole, and then a finger is pressing against you with insistant pressure, forcing the dollop of spit into you.");
	}
	output("\n\nYour hands clench around Hélla’s legs as her mouth and hands go to work on you, eagerly exploring your body. Her pussy winks and drools in your face, a swamp of feminine lust that threatens to boil over with every sensuous lick its owner gives you. Before you can make your own decision on the matter, the lizard-babe’s tail-tip curls under your head, gently nudging you upwards. You get the idea: you lift your head, letting her tail curl under your head like a scaly pillow that puts you at the perfect height to kiss your [pc.lips] against her vulva, and bury your [pc.tongue] into her darkest depths.");
	output("\n\nMinutes pass in blissful, mutual masturbation, using hands and mouths to pleasure each other. You’re each in your own rhythm, finding your lover’s most sensitive places and teasing them until both you and Hélla are both gasping, breathing hard and sheened in sweat and fuck-juices. Hélla’s breasts press into your [pc.belly], diamond-stiff nipples caressing your [pc.skinFurScales] with every husky breath, only adding to their owner’s please. You can feel the heat boiling out of her quim now, washing over you in orgasmic waves; your [pc.tongue] finds just the right place, letting your [pc.lipsChaste] lock around her clit, suckling on the prominent bud while your tongue teases her g-spot all the way to climax. And you’re not far behind, thrashing your [pc.legs] against the deck while she ");
	if(pc.hasCock()) output("deep-throats your cock");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina() || !pc.hasGenitals()) output("thrusts her fingers into your [pc.vagOrAss]");
	output(".");

	output("\n\nYou cum just after she does, ");
	if(pc.hasCock()) output("pumping a load of [pc.cum] down Hélla’s throat");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("splattering your lover’s hands in femcum");
	if(!pc.hasGenitals()) output("squirming beneath Hélla as your sexless body convulses in please");
	output(". When the orally-induced orgasm passes, you’re left gasping for breath, head resting atop the meaty middle of Hélla’s slowly-swaying tail.");
	output("\n\n<i>“Mmm, that was nice...”</i> Hélla sighs, resting on her elbows. <i>“I wish I wasn’t working. I feel like you’re supposed to cuddle and kiss after something like that.”</i>");

	output("\n\nWell, you can manage half of that. You extricate yourself from underneath the lizard-girl and pull her to her feet, drawing her into a brief kiss that tastes of your own sexual excess before you both have to go searching for your discarded gear.");
	IncrementFlag("SEXED_BRANDT");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].southExit);
}

//Cowgirl Anal
//Urge Brandt to climb on your cock and put that plump asshole to good use.
//Must have vaginally fucked Brandt before. CockOrStrapon scene.
public function heliaAnal(x:int):void
{
	clearOutput();
	showBrandt(true);
	author("Savin");
	output("With Hélla lounging on her hands and knees, slowly swaying her broad hips at you, your eyes are inevitably drawn to the supple swells of her firm cheeks. Hidden between them, you can just see the silken mound of her asshole’s plump ring, so lush and tempting that you can’t keep yourself from leaning in, hands on her flanks, and running your [pc.tongue] around her rim.");
	output("\n\n<i>“Ahaaa!”</i> Hélla gasps, thrashing her tail against your hips. <i>“That’s-ah! ");
	if(flags["BRANDT_ANAL"] == undefined) output("That’s my ass, [pc.name]! What are you doing?");
	else output("My ass again? You’ve got an insatiable lust for it, don’t you?");
	output("”</i>");

	output("\n\nYou answer her with a soft moan, kissing your lips to the dark mound of it and pushing in with your tongue, teasing the tight ring open just enough for your moistened tip to enter her.");
	output("\n\n<i>“If... if that’s what you want,”</i> Hélla groans, tightening her grip on the back of her chair. Slowly, deliberately, you feel the wringing muscles of her sphincter start to relax, enough that you’re able to make a little headway into her tailhole. The walls of her hole squeeze roughly around your probing muscle, fighting you for every inch. The more her body pushes back, though, the more thoroughly you’re able to thoroughly coat her insides with spittle.");
	output("\n\nYou take your time, letting your tongue probe and tease as far into Hélla’s ass as you can");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" - deep enough that your lover’s back arches, and soft moans start to escape her lips as you explore her inner-most recesses");
	output(". Only when her ass is a swamp of spit, luridly drenched and ready to accept something much thicker than your [pc.tongue], do you finally pry yourself free of the ovir’s asshole and stand back up. While you were working, you");
	if(x >= 0) output("r [pc.cock " + x + "] has gotten painfully hard, throbbing between your [pc.legs] as your anal lusts boil over, threatening to burst.");
	else output(" slipped a hand down to your panties and found the switch to activate the magic hidden inside. When you stand, now, you tap the button that causes the hardlight strapon to spring to life, erupting into existence in a rush of sensation that makes you shudder with delight.");
	output("\n\nYou heft your [pc.cockOrStrapon " + x + "] up and slap it into the crack of Hélla’s ass. She gasps, giving you a look over her shoulder before wrapping her thick, reptilian tail around your waist and pulling you in, slamming your thighs into the firm cheeks of her ass. <i>“It feels slimy and empty back there now,”</i> she huffs, curling the tip of her tail around to tease the base of your dick. <i>“Fix it.”</i>");
	output("\n\nRunning your hands over her butt, you slowly rock your hips to grind your [pc.cockOrStrapon " + x + "] against her pussy and ass. <i>“What do you want?”</i>");
	output("\n\nHélla makes a confused sound, using her tail-tip to try and angle your cockhead into her ass. You resist, firmly staying right where you are. <i>“I asked what you wanted,”</i> you remind her, grinding a little more insistently; hard enough to make her moan.");
	output("\n\n<i>“I want...”</i> Hélla starts, and then all of a sudden you feel a heavy blow against your stomach, not painful but <i>forceful</i>, enough to send you sprawling back across the deck. Something big and heavy is resting on your lap, and you feel an intense pressure on the tip of your [pc.cockOrStrapon " + x + "]. You glance down the length of your body, and find it largely obscured by the thick, meaty mass of Hélla’s ovir tail. What you can make out around it, though, looks like a whole lot of ass and supple back, half-obscured by a mess of hair that’s coming undone from its crisp ties.");
	output("\n\n<i>“What I want,”</i> she finally says, punctuating the clause by pushing her hips down - and wrapping your dick in a wet, hot vice of meat. <i>“...is cock!”</i>");
	output("\n\nIt’s your turn to moan, body scrabbling at the smooth, cold metal of the deck, as Hélla sinks down on your [pc.cockOrStrapon " + x + "], slowly taking it in her ass. Her hands clutch at your [pc.legs], using them to hold herself steady until her spread cheeks are resting in your lap");
	if(x >= 0 && pc.cocks[x].cLength() >= 15) output(" and her stomach is bulging around the sheer size of your equipment");
	output(".");
	if(x >= 0) pc.cockChange();

	//first time:
	if(flags["BRANDT_ANAL"] == undefined)
	{
		output("\n\n<i>“This feels... good?”</i> Hélla whispers, voice low and husky, trembling with the unfamiliar anal sensation. <i>“I’ve played around back there before, but having someone else’s ");
		if(x >= 0) output("dick");
		else output("toy");
		output(" in there... ah, it feels better than I’d ever thought.”</i>");
	}
	else
	{
		output("\n\n<i>“I feel dirty, liking this so much,”</i> Hélla murmurs, rocking her hips on your lap. <i>“But it does feel so good. Like my ass was made for this...”</i>");
	}
	output("\n\nYou grin up at the anally captivated lizard-girl, reaching your hands up and caressing her egg-layer’s hips. Once she’s settled in, her hands play up your [pc.legs] and come to rest on yours, lacing her fingers through your own and giving your hands a little squeeze.");
	output("\n\n<i>“I think I’m okay to move,”</i> she finally says, gently rising on her knees to bring the first inch of dickmeat out of her ass. She gasps and shudders, clenching at your hands - and her ass clenches around your [pc.cockOrStrapon " + x + "], squeezing your shaft powerfully between her lubed-up muscles. She moves slowly at first, letting you both get adjusted to the pleasant pressure of penetration before picking up the pace a little, starting to ride you properly. Her tail sprawls across your [pc.chest] as she moves, teasing your [pc.nipples] with its tip, occasionally slapping your ");
	if(pc.biggestTitSize() >= 1) output("tits");
	else output("cheeks");
	output(" or flicking your [pc.lips], urging you to nibble one and suckle the scaly appendage to calm its erratic movements.");

	output("\n\nIt isn’t long before Hélla is bouncing in your lap, taking your dick from ");
	if(x >= 0 && pc.hasKnot(x)) output("[pc.knot " + x + "]");
	else output("base");
	output(" to crown, slamming her huge hips down on your pelvis and burying so much cock into her ass that she can’t help but cry out. Her hands abandon yours, one going to grope her chocolate nipples, and the other desperately delving the slit of her sex, adding to the sensation");
	if(pc.cockTotal() > 1) output("; before she finally seems to notice your second cock. Flashing you a sultry little grin over her shoulder, she wraps her fingers around that dick too, guiding it into her pussy. Double penetration seems to suit her, if the chorus of moans and soft cries she serenades you with are any indication");
	output(".");
	output("\n\nA moment later and her voice breaks. <i>“I’m going to... I’m going...”</i>");
	output("\n\nHélla throws her head back, fiery hair swaying behind her as she shakes and stirs with lustful vigor. Her moans reach a fever pitch, and you can see - and feel! - juices squirting from her pussy, drenching your thighs with an explosive orgasm that rocks her whole body. The tight grip of her asshole becomes vice-like, squeezing and milking your [pc.cockOrStrapon " + x + "] with her wild, bucking movements. Eventually, one such thrust buries your [pc.cockOrStrapon " + x + "] all the way inside her, subjecting every inch of tender ");
	if(x == -1) output("holo-cock");
	else output("cock-flesh");
	output(" to the desperate grasps of her spasming muscles until you’re following on the heels of her orgasm!");

	if(x >= 0)
	{
		if(pc.cockTotal() == 1)
		{
			output("\n\nYour cock swells, turgid with seed for the blink of an eye before erupting deep in Hélla’s bowels. She gasps, the grins at you over her shoulder. <i>“That feels gross... but in a good way.");
		}
		else output("\n\nYou feel your dicks swelling with seed, starting to pump thick globs of [pc.cum] into Hélla’s ass and pussy in unison. The half-ovir gasps, putting a hand on her belly as you pump her full of jizz. <i>“Ooh, two for the price of one, captain?");
		if(pc.cumQ() >= 1000) output(" And there’s so much! I feel like I’ve got a gravball sloshing around in my belly now.”</i>");
		else output(" Feels like you shot a lot of [pc.cumNoun] in me. So warm...”</i>");
	}
	else output("\n\n A sudden surge of electrifying sensation feeds back from your hardlight prick, making your loins feel like they’re aflame with orgasmic pleasure. Your back arches off the deck, and a ragged cry of pleasure escapes your [pc.lips] as the hardlight panties bring you to orgasm as surely as a real cock.");
	output("\n\nWhen the orgasm passes, you can still feel Hélla’s ass around your [pc.cockOrStrapon " + x + "], only slowly releasing you from her sphincter’s grip. She stands, wobbling, and letting a mix of fluids run down her thighs as she does so. <i>“I don’t know if I can walk after that,”</i> she laughs, steadying herself on the arm of her chair. <i>“Gah! My legs are shaking. Like they’re made of paper...”</i>");
	output("\n\nYou pull yourself up and wrap your arms around Hélla’s waist, helping your lover until she recovers her footing, and manages to bend down enough to collect her scattered uniform clothes.");
	output("\n\n<i>“Help me find a folding chair to take back to my post, would you. Standing feels weird...”</i>");
	processTime(30);
	IncrementFlag("SEXED_BRANDT");
	IncrementFlag("BRANDT_ANAL");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].southExit);
}


//Brandt’s Appearance
public function brandtAppearance():void
{
	clearOutput();
	showBrandt();
	author("Savin");
	output("Sub-Commander ");
	if(flags["SEXED_BRANDT"] != undefined) output("Hélla ");
	output("Brandt is a human-ovir crossbreed. Though she’s wearing the dress uniform of Nova Securities - dark orange trimmed with silvery white - there’s enough definition underneath the heavy fabric to tell you that she’s got the build of a boxer, sleek and muscular, complemented by pert B-cups and wide, egg-bearing hips beneath a toned belly.");
	output("\n\nMost of her body is covered with golden-bronze skin, covered in just enough sweat and oil from her steamy duty in the computer-laden command room to glisten in the station’s light. Her hands, neck, lower ribs, and of course, her tail are all covered in dark yellow scales, so fine that they look almost like a single, contiguous plate at first glance. A few additional spots appear on her upper thighs and rump, almost like freckles, as well as a colorful crest of dark orange ones that dive down between her breasts. Brandt’s hairless everywhere save the top of her head, with golden-red tresses cut fairly short and pulled back into a neat military-style bun.");
	output("\n\nHer eyes are her most attention-drawing trait, huge by human standards and solidly dark blue in coloration: she lacks whites at all, merely orbs of sapphire split by slitted irises. The rest of her face seems ever so slightly mis-proportioned around them: she’s bearing a small nose, rounded human ears, and lips so slender they almost vanish into her perpetual even frown. She’s not ugly by any means, you think, but you don’t know that you’d call her beautiful, either. Handsome, maybe?");
	output("\n\nA thick, heavy tail hangs behind her, peeking out of a sewn-in gap in her uniform’s dress pants. On the rare occasion you’re able to catch a glimpse of her back, you’re almost sure you see the faintest hint of pink cloth underneath, hugging her tail tightly.");
	if(flags["SEXED_BRANDT"] != undefined) 
	{
		output("\n\nHélla is a female, through and through. Tucked between those mighty thighs of hers is a wet and ready human-style slit, replete with lush labia and a perky little clitoris. A fine partner to the firm, muscular ass she’s carrying under that tail - and the sinfully skilled asshole it’s hiding, right where ");
		if(silly) output("it belongs.");
		else output("you like it.");
	}
	else
	{
		output("\n\nGiven she’s an ovir, there’s no real way to know what actual sex Brandt is without getting her hot and bothered - the males of her race hide their giant cocks internally when unaroused and have figures as voluptuous and shapely as the ladies. Still, for now, you haven’t seen any hint of bulge beneath the sub-commander’s belt.");
		output("\n\nYet.");
	}
	brandtMenu("Appearance");
}

public function kasmiransOffer():void
{
	clearOutput();
	showKasmiran();
	author("Savin");
	output("<i>“What exactly are you offering?”</i> you ask.");
	output("\n\n<i>“Ah, of course,”</i> the warden says, letting her black lips play into the faintest hint of a smirk. <i>“</i>Gastigoth<i> is a privately-operated penal facility. We deal with the galaxy’s most dangerous or high-risk criminals, those that the Confederacy itself cannot or will not house for a variety of reasons. Because of this, we are given de facto ownership of our prisoners, and some degree of control over how their sentences are carried out. That is where you come in.”</i>");
	output("\n\nThe warden snaps a finger, and one of the walls slides open, revealing a flickering orange-tinted holoscreen. Through it, you’re given a view of a human woman in dark prison fatigues strapped face-down to a table, legs splayed apart over the edge so that her ass is in the air. Her pants have been yanked down around her ankles, baring her sex to the security camera you’re viewing through. Despite her weak struggles against the restraints on her wrists and legs, her twat is puffy and red, slicked with arousal.");
	output("\n\n<i>“Murder. First degree. Seventeen counts,”</i> Warden Kasmiran says coldly, leaning back in the couch and watching the prisoner. <i>“Her raider crew botched a bank job on a frontier world, and ended up entrenched in a hostage crisis that lasted three days, and seven assaults by Peacekeepers. It eventually took a power armor detachment from the local military base to resolve the situation.”</i>");
	output("\n\nDamn. But what’s that got to do with you?");
	output("\n\n<i>“She has several life sentences, of course, but it is my belief that simply allowing prisoners to waste away is... an unfortunate waste. </i>Gastigoth<i> repurposes these individuals, makes them useful - or at least, profitable. Despite her psychosis and antisocial behavior, our raider captain here is quite the talented warrior. With some correction, her genetics can be made highly desirable.”</i>");
	output("\n\nYou’re starting to get the picture here...");
	output("\n\nThe warden chuckles. <i>“Yes, quite. She’ll be using her womb again and again to help offset the costs of her long, long stay with us. In fact, today will be her third breeding: she’s already played the brood-sow for the great-grandson of an Aegis V.P., and for one of Nova Security’s fleet commanders. Quite prestigious!”</i>");
	output("\n\nEven as she’s talking, you watch as the security door in the cell slides open and a heavyset ausar man strides in, all smiles and swagger - even as he casually drops his dress pants to the deck and delivers a massive slap across the prisoner’s ass. She makes a silent cry, inaudible over the video feed, which only seems to make her breeder that much more jolly. He leans against the table, slaps her ass again, and starts talking to her - taunting, probably, as a pair of his fingers find their way into her drooling pussy.");
	output("\n\n<i>“Aphrodisiacs and the promise of better treatment should they comply keeps the inmates docile enough, even without restraints,”</i> the warden explains, watching impassively as the ausar eventually finishes teasing the prisoner and mounts her, ramming a pillar of red meat in and starting to hump away. <i>“And our security measures ensure there is no risk to our clients, of course.”</i>");
	output("\n\nWhile you both watch the ausar man breed the raider woman, the warden continues: <i>“As I hinted at in my email, we offer several services such as this here at </i>Gastigoth<i>. Whether you simply seek pleasure at their expense or find yourself interested in breeding a particular prisoner - or several - we accommodate a wide variety of desires.”</i>");
	output("\n\nTurning back to you as the ausar man huffs and knots himself, the warden adds, <i>“I believe that explains our position quite thoroughly, but if you have any questions, I’d be happy to answer them. Otherwise, you’re free to peruse our catalogue of miscreants and malcontents for one that suits your desires. It’s that easy.”</i>");

	processTime(10);
	pc.changeLust(15);
	clearMenu();
	//[Services] [Gastigoth] [Warden] [Prisoners]
	//[Done]
	addButton(0,"Services",kasmiranServices,undefined,"Services","Tell you more about this special service Kasmiran is offering you...");
	addButton(1,"Gastigoth",askWardenAboutGastigoth,undefined,"Gastigoth","Get some sweet deets on the space station itself.");
	addButton(2,"Warden",wardenSelftalk,undefined,"Warden","Ask the warden about herself.");
	addButton(3,"Prisoners",prisonersTalkyTalk,undefined,"Prisoners","Ask about the prisoners kept on the station. Who’s here, exactly?");
	addButton(5,"Appearance",wardensAppearance);
	addButton(14,"Leave",leaveDatWardenBooty);
}

//[Prisoners]
//Ask about the prisoners kept on the station. Who’s here, exactly?
public function prisonersTalkyTalk():void
{
	clearOutput();
	showKasmiran();
	author("Savin");
	output("<i>“Tell me about the prisoners you keep here.”</i>");
	output("\n\n<i>“They’re scum,”</i> the warden says simply, giving you a self-assured little grin. <i>“We house the worst the galaxy has to offer here. Criminals with a high risk value - because of their abilities, or their connections - are sent here by their homeworlds or the Confederate government to assure they will face the full extent of justice’s wrath without the risk of escape. Pirates, psykers, mad scientists, and worse all find their way to this station one way or another.”</i>");
	output("\n\nAside from who you’ve brought in, are there any notable inmates?");
	output("\n\n<i>“That depends on your tastes. The terminal over there has information on our most interesting inmates. Every one of our ‘guests’ is uniquely qualified to be here, of course, but there are always some who sink beneath even the lowest form of animal.”</i>");
	processTime(5);
	addDisabledButton(3,"Prisoners","Prisoners","You already talked about this.");
}

//[Warden]
//Ask the warden about herself.
public function wardenSelftalk():void
{
	clearOutput();
	showKasmiran();
	author("Savin");

	output("<i>“So, tell me a little about yourself...”</i>");
	output("\n\nThe warden arches an eyebrow, crossing one cybernetic leg over the other. <i>“I’m afraid I’m not much for talking about myself, captain. Suffice to say I have a background in intelligence work, and I am now the co-owner of Faangnis Corrections. Overseeing this station is as close to a retirement as I’m likely to get.”</i>");
	output("\n\nIf wardening for a prison full of psychopaths is her idea of retirement, you’d hate to see what hard work is. That said, anything else she’d like to share?");
	output("\n\n<i>“Not particularly,”</i> Kasmiran answers. <i>“You’re here for the prisoners, not the staff, I should think. Though I’m sure my staff would be pleased to rumormonger about me with you. It’s practically their favorite hobby.”</i>");
	output("\n\nYou guess you aren’t getting more out of her on that particular topic...");
	processTime(5);
	addDisabledButton(2,"Warden","Warden","You just did this.");
}

//[Gastigoth]
//Get some sweet deets on the space station itself.
public function askWardenAboutGastigoth():void
{
	clearOutput();
	showKasmiran();
	author("Savin");
	output("<i>“Tell me about this station of yours,”</i> you prompt, gesturing to the sterile white-and-grey walls all around you.");
	output("\n\n<i>“That, I’m happy to do,”</i> the warden says, smiling cooly. <i>“I’ll spare you the exact specifications of the place, and the company stock lines about how secure it is. You can see that for yourself: we’re in deep space, so there’s nowhere for inmates to break out into. We’re surrounded by capital-ship class armaments, so there’s no chance some two-bit pirate’s going to break </i>in</i>. </i>Gastigoth<i> is made up of several ex-military hulls, ausar and Terran, rebuilt into a single, continuous complex... but with all the security measures, air-tight bulkheads, and armament you’d expect from a supercarrier.”</i>");
	output("\n\n<i>“Our security primarily comes from space itself. We control the atmosphere. If the prisoners riot or attempt to seize control, the station can be flooded with knockout gasses, or in worst-case scenario, the air can be vented from any section of the ship with a push of a button. We restrict the number and size of vessels docked here at any given time, so the possibility of escape is severely restricted. Plus, the station is under constant surveillance from the Confederacy and several planetary governments, ensuring any attempted takeover -from inside or out - can be countered swiftly. In other words, </i>Gastigoth<i> is nigh unassailable: a perfect place for the scum we house.”</i>");
	output("\n\nSo you’ve noticed. The place certainly is a fortress.");
	output("\n\nThe warden nods. <i>“That it is. Of course, a fortress isn’t <b>all</b> that the station aspires to be. We have several programs running in the background, including the one that I invited you to participate in. Considering our position and clientele, </i>Gastigoth<i> is in a position to provide our unique... services... to the galaxy’s elite.”</i>");
	processTime(5);
	addDisabledButton(1,"Gastigoth","Gastigoth","You already discussed this.");
}

//[Services]
//Tell you more about this special service Kasmiran is offering you...
public function kasmiranServices():void
{
	clearOutput();
	showKasmiran();
	author("Savin");
	output("<i>“So, tell me more about this ‘service’ your prison’s offering.”</i>");
	output("\n\n<i>“It’s really quite simple, " + pc.mf("Mr","Ms") + ". Steele. Despite their criminal ways, many of our inmates still have desirable traits: super-genius intellects, incredible physical prowess, and sometimes even good looks,”</i> the warden says with a sneer. <i>“In exchange for reduced sentences or additional access to amenities during their stay, inmates volunteer for our conjugal program. From amongst them, we select the most viable of our inmates and add them to a roster available to you, our </i>select<i> clientele. For an appropriate fee, your choice of inmate is made safe for interaction, and you’re allowed to... fulfill your desires.”</i>");
	output("\n\nSeeing that she’s got your attention now, the warden continues: <i>“Simply taking part in a prisoner’s normal cycle of punishment and degradation is only the beginning. A good place to start, but if you find yourself particularly drawn to a given prisoner... or simply find yourself in the mood to leave a lasting mark... we offer more inventive options as well. My station boasts a very successful breeding program among the female population, and of course we’re more than happy to stud the males if that suits you better.”</i>");
	output("\n\n<i>“You would be surprised to find out how many of the galaxy’s elite find it... convenient, or perhaps exciting, to father their heirs or future tools on elite assassins, brilliant but misguided scientists, or the like. I understand there’s a thrill to be had in seeking out their fallen enemies, once incarcerated, and turning those who would have harmed them into nothing but breeding stock. Human cattle. Naturally our program is overseen by some of the best eugenics experts in the galaxy, to ensure undesired traits such as homicidal tendencies are not accidentally passed down.”</i>");
	output("\n\n<i>“Of course, even if you aren’t interested in the breeding program, you yourself will doubtless have some personal connection to some of the inmates as your exploits continue. If you wish to revisit some encounter of yours, well, that’s always an option.”</i>");
	output("\n\nYou’ll just assume she means intimate, rather than combative, encounters.");
	processTime(5);
	addDisabledButton(0,"Services","Services","You already discussed this.");
}

//[Leave]
//That’s all the questions you have.
public function leaveDatWardenBooty():void
{
	clearOutput();
	showKasmiran();
	author("Savin");
	output("<i>“I think I know all I need to,”</i> you say, standing.");
	output("\n\nThe warden nods, doing the same. She adjusts her cap and clasps her hands behind her back, a gesture that causes her chest to thrust out, straining her uniform... or whatever synthetic element wraps her body. It’s hard to tell where costume ends and synth-flesh begins.");
	output("\n\n<i>“Very well, Steele,”</i> she says, voice little more than a throaty purr. <i>“The terminal on the wall there has all the relevant information on our inmates. If any of them catch your eye, the station’s V.I. will walk you through setting up visitation and any other programs you’re interested in. If there’s nothing else, I’ll leave you to peruse our stock.”</i>");
	output("\n\nGiving you a crisp nod, Kasmiran turns on a heel and marches back to the elevator, leaving you to your own devices.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Warden’s Appearance
public function wardensAppearance():void
{
	clearOutput();
	showKasmiran();
	author("Savin");
	output("Warden Regina Kasmiran is an imposing woman, and not just because of her tall, amazonian physique. She exudes a cool, confident surety with her every action: even the slightest motion seems deeply calculated, deliberate, and without the slightest waste. Your stare is met openly by the warden, regarding you with steely red-gold eyes that are obviously cybernetic. Data flashes across them, inside and out, projected from internal holos and a pair of small bands bolted into her brows.");
	output("\n\nAround them fall locks of long pink hair, a dark shade that seems as natural to the warden as anything left of her physical body. Which, you imagine, isn’t much. You believe she was once a cylirian - a member of race that appear like a hellish amalgam of moths and ogres - but she shed that mortal flesh long ago. Her face is all that you think is mostly flesh and blood, with reddish-brown skin and full, black-painted lips. Her ears are long and elfin, used to hold back her long mane of shaggy hair where it would otherwise spill down to her waist all around her. A pair of curling bone horns sweep back from her brow, just above her holo-lenses, combining with the four-spaded tail swishing behind her to give the warden a decidedly demonic appearance. One you’re sure she’s quite happy to cultivate, if her flame-red energy whip and claw-like nails and fangs are any indication.");
	output("\n\nIndeed, she seems the sensually feminine version of a certain old-earth devil.");
	output("\n\nBelow a plunging neckline, Regina’s skin transitions literally seamlessly into a latexy-leather material you can’t quite place, growing out and around her entire body like a mix of bodysuit, domina uniform, and ballistic armor all at once. The synthskin is supple, mirroring feminine curves and lush tone with equal ease wherever it goes. Mostly, it’s a dark, smooth grey; around the chest and joints, though, she’s been colored black as night, reinforced with military-grade ballistic resistance.");
	output("\n\nWhether her bodysuit conforms to her natural figure or has expanded, you’ve got no way of knowing. At the moment, though, the warden is voluptuous in a matronly way. Her breasts are large and rest high on her chest, mimicking broad nipples that peak slightly at your wandering gaze. She sports a weighty pair of F-cups, big enough to individually fill both your hands were you to get a grip on them. Her hips are broad and flared, striking a strongly slavic figure before you notice the tight muscle of her legs and thighs: no doubt she could crush your head between them.");
	output("\n\nThat’s not the only thing she could work down there, you’re sure. The warden’s only piece of clothing above her bodysuit is a simple sash of fabric clinging to her matronly hips, so short that it hardly serves modesty as much as it does drive your curiosity. You suspect that the scant glances of shining latex you catch between the skirt’s motions hint at a deep synthetic cunt between the warden’s legs, but there’s just no way of knowing...");
	output("\n\nWhat you do know is that the several small black studs pierced into the warden’s hips are quite capable of projecting a mammoth hardlight erection from her groin, a two-foot pillar of pure energy and bestial, equine dominance. Seeing where you’re shamelessly looking, Regina leans a little bit deeper into her chair and runs a silver-wrapped finger up one of her long legs. It almost brushes aside the hem of her skirt, but leaves a tantalizing moment too soon... though the motion of her arm languidly pushes her hefty breasts together, forming the cleavage of a goddess.");
	output("\n\nSo deliciously close, and yet so far...");
	addDisabledButton(5,"Appearance","Appearance","It’s impolite to stare that long.");
}

//[Terminal]
public function sexHaverTerminalTime(fromBack:Boolean = false):void
{
	clearOutput();
	showName("BEEP\nBOOP");
	author("Savin");
	if(!fromBack) output("You step up to the lobby’s terminal and tap the haptic interface, causing the pulsating advertisement to flicker away, replaced by a simple user interface that shows a list of what you can only assume to be current inmates, all tagged under a big heading of <i>“[pc.name] Steele.”</i>\n");
	else output("The user interface displays a list of current inmates, all tagged under the heading: <i>“[pc.name] Steele.”</i>\n");
	//List all current inmates on the buttons.
	//When you select an inmate, show their bust and display a readout of:
	clearMenu();
	var btnSlot:int = 0;
	var prisonerBtns:Array = [];
	var i:int = 0;
	
	if(completedStellarTetherGood()) 
	{
		output("\n\\\[Pirate\\\] Tam-Tam");
		prisonerBtns.push(["Tam-Tam",prisonerStatline,"Tamtam","Tam-Tam","Pay a visit to the spunky cat-girl mechanic you met on Tarkus."]);
		output("\n\\\[Pirate\\\] Kaska");
		prisonerBtns.push(["Kaska",prisonerStatline,"Kaska","Kaska","Pay a visit to the dick-toting pirate you defeated on Tarkus."]);
		output("\n\\\[Pirate\\\] Khorgan");
		prisonerBtns.push(["Khorgan",prisonerStatline,"Khorgan","Captain Khorgan","Pay a visit to the bad-ass space-pirate you defeated on Tarkus."]);
	}
	if(samImprisoned())
	{
		output("\n\\\[Pirate\\\] Sam");
		prisonerBtns.push(["Sam",prisonerStatline,"Sam","Sam","Pay a visit to Sam."]);
	}
	if(rkLahImprisoned())
	{
		output("\n\\\[Convict\\\] R.K.Lah");
		prisonerBtns.push(["R.K.Lah",prisonerStatline,"Lah","R.K.Lah","Pay a visit to Lah."]);
	}
	if(drBadgerImprisioned())
	{
		output("\n\\\[Doctor\\\] Dr. Badger");
		prisonerBtns.push(["Dr. Badger",prisonerStatline,"Badger","Dr. Badger","Pay a visit to Dr. Badger."]);
	}
	if(zaaltImprisoned())
	{
		output("\n\\\[Smuggler\\\] Zaalt");
		prisonerBtns.push(["Zaalt",prisonerStatline,"Zaalt","Captain Zaalt","Pay a visit to Zaalt."]);
	}
	
	output("\n\n");
	for(i = 0; i < prisonerBtns.length; i++)
	{
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Never Mind", mainGameMenu);
			btnSlot++;
		}
		if(btnSlot >= 60) break;
		
		addButton(btnSlot, prisonerBtns[i][0], prisonerBtns[i][1], prisonerBtns[i][2], prisonerBtns[i][3], prisonerBtns[i][4]);
		btnSlot++;
		
		if(prisonerBtns.length > 14 && (i + 1) == prisonerBtns.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Never Mind", mainGameMenu);
		}
	}
	
	addButton(14,"Never Mind",mainGameMenu);
}

public function prisonerStatline(prisonerName:String):void
{
	clearOutput();
	author("Savin");
	clearMenu();
	addButton(14,"Back",sexHaverTerminalTime, true);
	
	var payFee:Boolean = true;
	
	/*
	output("<b>Name:</b> ");
	output("\n<b>Age:</b> ");
	output("\n<b>Sex:</b> ");
	output("\n<b>Race:</b> ");
	output("\n\nConvicted of: ");
	*/
	switch(prisonerName)
	{
		case "Sam":
			showSam();
			output("<b>Name:</b> Samurenth “Sam” Tyraso");
			output("\n<b>Age:</b> 24");
			output("\n<b>Sex:</b> Female");
			output("\n<b>Race:</b> Ausar");
			output("\n\nConvicted of: 2 counts of Piracy, 7 counts of Grand Hacking, 17 counts of Cyber Theft, 3 counts of Cyber Assault, 4,478 counts of Identity Theft, Kidnapping, Assault With a Deadly Weapon, 2 counts of Attempted Homicide");
			if(silly) output(", Cyber Bullying, and Hand Holding");
			output(".");
			addButton(0,"Visit",visitAPrisoner,"Sam","Sam","Visit the ausar with a rap sheet a mile long. She’s anything but a “Good Girl.”\n\n<b>Cost:</b> 1,000 credits");
			if(!pc.hasCock()) addDisabledButton(1, "Impregnate", "Impregnate", "You need a cock to knock someone up.");
			else if(sam.isPregnant()) addDisabledButton(1, "Impregnate", "Impregnate", "Sam is already pregnant.");
			else addButton(1, "Impregnate", impregAPrisoner, "Sam", "Impregnate", "Let’s talk about breeding this particular inmate...");
			break;
		case "Tamtam":
			showTamtamPrison();
			output("<b>Name:</b> Tam Tam");
			output("\n<b>Age:</b> 22");
			output("\n<b>Sex:</b> Female");
			output("\n<b>Race:</b> Kaithrit");
			output("\n\nConvicted of: Attempted Destruction of a Planet, Unlicensed Software Editing, 12 Counts of Piracy, 3 Counts of Grand Piracy, Piracy in the Third Degree, Attempted Rape, Rape, and Jaywalking.");
			addButton(0,"Visit",visitAPrisoner,"Tamtam","Tam-Tam","Visit the spunky cat-girl mechanic you helped bust on Tarkus.\n\n<b>Cost:</b> 1,000 credits");
			if(!pc.hasCock()) addDisabledButton(1, "Impregnate", "Impregnate", "You need a cock to knock someone up.");
			else if(tamtam.isPregnant()) addDisabledButton(1, "Impregnate", "Impregnate", "Tam-Tam is already pregnant.");
			else addButton(1, "Impregnate", impregAPrisoner, "Tamtam", "Impregnate", "Let’s talk about breeding this particular inmate...");
			break;
		case "Kaska":
			showKaskaPrison();
			output("<b>Name:</b> Kaska");
			output("\n<b>Age:</b> 24");
			output("\n<b>Sex:</b> Hermaphrodite");
			output("\n<b>Race:</b> Dzaan");
			output("\n\nConvicted of: Attempted Destruction of a Planet, Slavery, Rape, 8 Counts of Piracy, Assault, Possession of Unlicensed Military-Grade Weaponry, and Polygamy.");
			addButton(0,"Visit",visitAPrisoner,"Kaska","Kaska","Visit the dick-girl pirate you defeated on Tarkus.\n\n<b>Cost:</b> 1,000 credits");
			break;
		case "Khorgan":
			showKhorganPrison();
			output("<b>Name:</b> Captain Khorgan");
			output("\n<b>Age:</b> 30");
			output("\n<b>Sex:</b> Female");
			output("\n<b>Race:</b> Thraggen");
			output("\n\nConvicted of: Attempted Destruction of a Planet, Murder, 8 Counts of Grand Piracy, Piracy in the First Degree, Rape, Unlicensed Use of Power Armor, and Grand Theft Spacecraft.");
			addButton(0,"Visit",visitAPrisoner,"Khorgan","Captain Khorgan","Visit the bad-ass space-pirate you defeated on Tarkus.\n\n<b>Cost:</b> 1,000 credits");
			if(!pc.hasCock()) addDisabledButton(1, "Impregnate", "Impregnate", "You need a cock to knock someone up.");
			else if(khorgan.isPregnant()) addDisabledButton(1, "Impregnate", "Impregnate", "Khorgan is already pregnant.");
			else addButton(1, "Impregnate", impregAPrisoner, "Khorgan", "Impregnate", "Let’s talk about breeding this particular inmate...");
			break;
		case "Badger":
			showDrBadger();
			output("<b>Name:</b> ‘Doctor’ Badger");
			output("\n<b>Age:</b> ??");
			output("\n<b>Sex:</b> Hermaphrodite");
			output("\n<b>Race:</b> Unknown");
			output("\n\nConvicted of: Assault, Drug Manufacturing, Drug Trafficking, Illegal Mind Control, Indecent Exposure, Kidnapping, Possession of Unlicensed Technology, Racketeering, and Unlicensed Medical Practices.");
			if(9999 == 9999) addDisabledButton(0,"Visit","Dr. Badger","You cannot visit this prisoner at the moment.");
			else addButton(0,"Visit",visitAPrisoner,"Badger","Dr. Badger","Visit Dr. Badger.\n\n<b>Cost:</b> 1,000 credits");
			break;
		case "Zaalt":
			showZaalt();
			output("<b>Name:</b> Captain Zaalt Kandar");
			output("\n<b>Age:</b> ??");
			output("\n<b>Sex:</b> Male");
			output("\n<b>Race:</b> Milodan");
			output("\n\nConvicted of: Possession of Unlicensed Technology.");
			if(9999 == 9999) addDisabledButton(0,"Visit","Captain Zaalt","You cannot visit this prisoner at the moment.");
			else addButton(0,"Visit",prisonerTimes,"Zaalt","Captain Zaalt","Visit Zaalt and possibly pay his bail.");
			payFee = false;
			break;
		case "Lah":
			showLah();
			output("<b>Name:</b> Remi-Kellen Lah");
			output("\n<b>Age:</b> 28");
			output("\n<b>Sex:</b> Male");
			output("\n<b>Race:</b> Ausar");
			output("\n\nConvicted of: First degree arson; battery; prison escape; incitement and conspiracy to violence; incitement and conspiracy to pervert the course of justice; treason.");
			addButton(0,"Visit",visitAPrisoner,"Lah","R.K. Lah","Visit Lah.\n\n<b>Cost:</b> 1,000 credits");
			break;
	}
	showName("CLICK\nCLACK");
	
	// {Stat Line: Physique, Reflex, Aim, Intelligence, Willpower, Libido}
	if(payFee && pc.credits <= 1000) addDisabledButton(0,"Visit","Visit","You do not have the necessary credits.\n\n<b>Cost:</b> 1,000 credits");
}

//<i>“Visit”</i>
//Tell the computer to arrange a <i>“visitation”</i> with the selected inmate.
//Cost: idontknow
public function visitAPrisoner(prisonerName:String):void
{
	clearOutput();
	clearBust();
	clearMenu();
	author("Savin");
	pc.credits -= 1000;
	output("You slide your Codex’s payscreen and tap confirm. A gruff male voice answers back, <i>“Affirmative. Inmate " + prisonerName + " will be processed shortly. Please follow the running lights to the holding area. Please ensure that you have no sharp or heavy objects on your person when entering the holding area.”</i>");
	output("\n\nAn array of tiny red lights flicker on under your [pc.feet], guiding you back down the hallway you came in the first time. As directed, you following the floor lights to an airlock that opens automatically as you approach, pass through it, and down another set of corridors. Armed guards and automated turrets seem to greet you at every turn, watching you as warily as they might any inmate. You doubt you’re ever more than twenty feet from a loaded gun... and you’re starting to feel awful naked without your kit.");
	output("\n\nYou do your best to shrug off the feeling. You should feel <i>safe</i> around all the security, but...");
	output("\n\nThe running lights eventually take you to another lobby, adorned much like the first, with a large sealed bulkhead dominating the far wall. A solid red light is displayed over the door, and the terminal nearby has a >PROCESSING>>> bar ticking upwards. There’s nothing to do but wait, and psych yourself up for what’s to come.");
	output("\n\nEventually, the bar fills up, and the light shifts over to green. The V.I.’s voice comes over the room’s speakers, telling you <i>“The inmate requested has been processed. Please proceed into the holding unit.”</i>");
	processTime(10);
	//[Enter]
	addButton(0,"Enter",prisonerTimes,prisonerName);
}

public function prisonerTimes(prisonerName:String):void
{
	switch(prisonerName)
	{
		case "Tamtam": tamtamStuffGo(); return; break;
		case "Kaska": kaskaSlammer(); return; break;
		case "Khorgan": capnKhorganPrisonVisit(); return; break;
		case "Badger": /* 9999 return; */ break;
		case "Zaalt": /* 9999 return; */ break;
		case "Lah": lahPrisonRoom(); return; break;
		case "Sam": samsPrisonRoom(); return; break;
	}
	clearOutput();
	clearBust();
	output("<b>ERROR: Prisoner not found.</b> Please try again!");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function backOuttaPrisonVisit():void
{
	clearOutput();
	showName("\nNEVER MIND");
	output("You wave the prisoner away and leave. This just isn’t going to work out. The prison is quick to refund your money. Maybe a different prisoner will be more to your tastes?");
	pc.credits += 1000;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Tam Tam
public function tamtamStuffGo(impregnate:Boolean = false):void
{
	clearOutput();
	showTamtamPrison();
	author("Savin");
	output("Strapped face-down and ass-up to the examination table is the familiar feline form of Tam-Tam. Her two pink tails are curled defensively around her legs, but she’s breathing huskily, and you can see that the crotch of her prison jumpsuit is practically soaked-through with arousal. Those huge, plump tits of hers are spread out on the cold metal of the table, practically spilling out of her zipped-down suit.");
	//Lightly Pregnant: 
	if(flags["TAMTAM_GAST_PREG_TIMER"] <= 60) output(" You can see the slightest bit of weight hanging down from her belly, stretching her jumpsuit taut and confirming your virility.");
	//else mid pregnancy:
	else if(flags["TAMTAM_GAST_PREG_TIMER"] <= 180) output(" She’s <i>definitely</i> pregnant; there’s no mistaking that hefty bulge in her stomach, making her bent-over position awkward and clearly uncomfortable.");
	else if(flags["TAMTAM_GAST_PREG_TIMER"] != undefined) output(" The staff has put an antigrav harness and several cushions around the cat-girl’s midriff, helping to support the gravid belly bump she’s sporting.");
	output("\n\nHearing the airlock hiss open, she squirms around until she’s able to look at the door from between her spread legs.");

	//First Time & Took Tamwolf:
	if(flags["TAMTAM_PRISONED"] == undefined && flags["TAKEN_TAMWOLF"] == 1)
	{
		output("\n\n<i>“You!”</i> Tam-Tam screeches, lunging towards you in her chains. They clank and strain, pulling her back before she gets more than an inch off the table. <i>“YOU STOLE MY DOGGY! GIVE HIM BACK!”</i>");
		output("\n\nShe’s in prison, chained and lust-drugged... and the first thing she thinks of when she sees the person who put her in prison is... her drone? As if they’d let her have that in here anyway.");
		output("\n\nYou say as much, but the delusional kitty just ends up tiring herself out before she gives in to your words. With an exhausted sigh, she slumps forward against the table and moans a plaintive <i>“Why am I so <b>hooooorny?</b> Uggh. Gimme back Tam-wolf... Pretty please?”</i>");
	}
	//Else, first time:
	else if(flags["TAMTAM_PRISONED"] == undefined)
	{
		output("\n\n<i>“It’s you!”</i> Tam-Tam yelps, squirming in her bonds. <i>“W-what’re you doin’ here? And why do I feel... unnnf, so hot and... and horny!”</i>");
	}
	//First time combine
	if(flags["TAMTAM_PRISONED"] == undefined) output("\n\n<i>“Don’t worry, kitty,”</i> you tell her slowly approaching her defenseless rear. <i>“I’ll take good care of you.”</i>");

	output("\n\nYou deliver a quick swat to the cat-girl’s spankable rump, and watch it jiggle for you under the too-tight prison orange. Tam-Tam gives a surprisingly lewd moan, wiggling her tails; her crotch grows a little darker, prompting you to hook your fingers under her pants and yank them down, exposing the soaked slit of her pussy. Whatever drugs they pump the prisoners full of has her wet-and-ready as an ausar in heat, and a quick brush across her flushed lips leaves your digits slicked with her drug-addled excitement.");
	output("\n\n<i>“D-don’t stop!”</i>");
	output("\n\nTam purrs lustily, squirming in her restraints as you slip down onto your [pc.knees], burying your face in the catgirl’s pussy. She squeals delightedly, tails wrapping around your neck to lock you in position as she pushes back against you, her sex slipping down the length of your nose until the bud of her clit brushes your lips. You latch on, suckling the cat’s pleasure buzzer up and teasing it ever so gently between your teeth, sending visible shockwaves of pleasure up the cat’s spine. Moving up the lips of her pussy, you let your tongue dart out, spreading her folds to taste her sweet kaithrit juices - and sweet they are! Tam’s practically a faucet after you teased her clit, and you soon have a faceful of excitement rubbing up against you, begging for more. Your tongue probes in, licking up the sensitives inner walls of her vulva, teasing and caressing the folds of her womanhood until she’s panting and gasping, moaning with every movement you make.");
	output("\n\n<i>“God, you’re... oh, yeah... you’re such a tease...”</i> the cat whines, spreading her hands a little more around your probing face. You answer that by reaching forward and tugging at her tight jumpsuit’s top; a few nudges are enough to tear it open around those big tits of hers, leaving her all but naked and at your mercy. More importantly, it leaves her tits bare, big and perky, hanging low as she bends over the table. You reach up and grab one of the soft mounds, squeezing it just hard enough to make its owner gasp, tails tightening around your throat until you’re afraid she might choke you.");
	output("\n\nMoaning softly, the catgirl finally gives up any pretense of resisting you. She plants her hand over yours, humping back against your tongue and groping at her tits, squeezing and twisting her nipple until it’s a rigid point at the top of her teat, flushed with red.");
	output("\n\nAfter a few more minutes of this, you can’t take it anymore: the lust building your loins is almost painful");
	if(pc.hasCock() && !pc.isCrotchExposed()) output(", and your cock is threatening to burst from your [pc.crotchCover] if you don’t get some relief");
	output(". Tam doesn’t seem much better off: she’s biting her lip, trying not to moan too loudly as you eat her out; her tails are twitching spasmically, brushing at your cheeks and trying desperately to pull you deeper into her sodden box. Finally, the catgirl shifts forward, hiking a leg up onto the table and bracing her hands against the wall, leaving her pussy wide open to you.");
	output("\n\n<i>“Stop teasing me already, [pc.name]... tell me you’re gonna fuck me... please....”</i> she whines, reaching back as if to finger herself (though the chains don’t quite reach far enough), squeezing her eyes shut in anticipation.");

	var x:int = -1;
	if(pc.hasCock()) 
	{
		x = pc.cockThatFits(500);
		if(x < 0) x = pc.smallestCockIndex();
	}
	//No D or Hardlight
	if(!pc.hasCock() && !pc.hasHardLightEquipped())
	{
		output("\n\nLacking the equipment to give the cat-girl what she wants, you glance around the cell... and see someone’s thought just of you. There’s a leather strap hanging on the edge of a table corner, with a slightly glowing pillar of yellow-orange hardlight jutting out of it in the unmistakable shape of a human dick. You slip into the strapon harness with practiced ease, feeling the surge of tingling sensation as the belt synchs with your nervous system and starts transmitting. You can’t help yourself; you stroke the bulbous hardlight prick, shuddering at the unfamiliar feeling. The holographic dick throbs in your hand, pulsing like a real slab of cockmeat until you’re lining it up with Tam’s puss.");
	}
	else if(x == -1) output("\n\nYou’ve got just the nip for this kitty. You toss your gear aside and flick on the tiny switch hidden in your panties. A beam of light erupts from your crotch, hardening into a phallic-shaped [pc.cockOrStrapon " + x + "]. Ohhh, that’s the stuff! You stroke the shaft and shiver, feeling the throb of sexual pleasure work its way up through your loins.");
	else output("\n\nYou toss your gear aside and grab your [pc.cock " + x + "], slapping the half-hard rod into the crack of Tam’s ass. She yips and purrs, wiggling her hips for you; her plump tush squeezes wonderfully around your [pc.cock " + x + "], almost as good as that slit between her legs.");
	output("\n\nShe gasps happily as your prick drops down, and her tails quickly catch and wrap it, both wriggling, fuzzy lengths curling around your [pc.cockOrStrapon " + x + "] until it’s just a great big fuzzy package. She’s got remarkable control over those tails of hers, and with a wiggle of her booty she puts them to use massaging your prick, squeezing just enough to make you moan.");
	output("\n\n<i>“Even in chains, I’ve still got it!”</i> Tam giggles, rubbing her butt against the sheathed underside of your prick. <i>“Double kaithrit tail-job... maybe I’ll let you stick it in for a scratch between the ears?”</i>");
	output("\n\nHer cat ears perk up expectantly, tails squeezing hard around your shaft as encouragement until you finally reach up and give the puss what she wants. Tam purrs throatily as your fingers work through her bright pink hair, getting at that wonderfully sensitive spot right between her perky cat-ears. Her hips press back against your crotch, grinding up against you as her twin tails slowly release your rod, letting you enjoy the warm, wet feeling of her sex rubbing against your [pc.cockOrStrapon " + x + "], so close to penetration that any errant movement would send you deep into the catgirl’s eager box.");
	output("\n\n<i>“You’re clear for landing, babe,”</i> Tam purrs, wiggling her flared hips up your shaft, until the crown of your cock is kissing the lips of her pussy. Tam bites her lip, back arching as she purrs and moans, readying herself for you. You’re more than happy to make up the difference: grabbing Tam’s hips, you thrust in, one long, smooth motion until you’re ");
	if(x < 0 || pc.cockVolume(x) < 500) output("buried to the hilt");
	else output("able to see her gut distending from the sheer amount of cock being shoved into her");
	output(". The chorus of moans Tam’s been serenading you with breaks at that moment, her cute little groans turning into a long cry of pleasure as you finally fuck her.");

	//If PC has a dick bigger than Kaska’s:
	if(x >= 0 && pc.cockVolume(x) > (chars["KASKA"].cockVolume(0) * 1.5))
	{
		output("\n\n<i>“Oh, god... so big...”</i> she moans, bracing against the table as you put more and more cock into her. <i>“Mmmm, how did you get so THICK? Never mind, just keep doing it. Oh, that’s it... just like that...”</i>");
		output("\n\nShe purrs contentedly as you slowly fuck yourself into her, stretching her pussy out until she’s begging for respite. Tam’s belly is bulging with the sheer size of it, but that doesn’t deter her for a second. Man, kaithrit are built to take ‘em!");
		output("\n\n<i>“Mmm, somebody’s been getting into the Throbb, huh? I looooove it,”</i> she moans, back arching as you start to slide the shaft out of her. <i>“You’re being so gentle though... oh, when’re you gonna get to the rough stuff, huh? I wanna see what you can do!”</i>");
	}
	//elseif PC’s dick is ~the same size as Kaska’s:
	else if(x >= 0 && pc.cockVolume(x) > (chars["KASKA"].cockVolume(0) * .75))
	{
		output("\n\n<i>“Ahhh, yeah, just like that,”</i> she moans, back arching as you slide into her cunt. Her wet, writhing walls meld perfectly to your shape and size, apparently quite accustomed to somebody of your girth. You give Tam another appreciative slap on the ass, grinning as her flesh quakes, reddening at your touch.");
		output("\n\n<i>“It’s been too long... I’ve been missing my daily dose of dick,”</i> Tam purrs, starting to move back against you. <i>“You’re being so gentle today... oh, when’re you gonna get to the rough stuff, huh?”</i>");
	}
	//elseif PC has a tiny pecker
	else
	{
		output("\n\n<i>“Come on, give it to me!”</i> Tam purrs as you hilt yourself in her, <i>“Thrust it deep in me!”</i>");
		output("\n\nWhat, do you not stack up? You look down to the gaping maw of Tam’s slit, at your own [pc.cockOrStrapon " + x + "] barely parting her clearly well-used lips. God damn, who else’s been using this kitty?");
		output("\n\n<i>“Oh, size doesn’t matter!”</i> Tam teases, squeezing down all around you. <i>“Come on, give it to me rough!”</i>");
	}
	processTime(20);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",tamtamPrisonFinisher,[x, impregnate]);
}

public function tamtamPrisonFinisher(args:Array):void
{
	clearOutput();
	showTamtamPrison();
	author("Savin");
	
	var x:int = args[0];
	var impregnate:Boolean = args[1];
	
	output("You start to thrust, pumping your hips into Tam’s backside until her assflesh is quaking with the force of impacts, her lusty moans filling your ears with every movement as you spread her pussy wide on your [pc.cockOrStrapon " + x + "]. She’s leaking like a faucet around you, cunny-juices running faster every time your [pc.hips] slam into hers, spattering the both of you with her excitement. Tam’s twin pink tails slip around your waist, trying to pull you in every time you pull out, coaxing you back with purrs and moans and the jiggle of her luscious ass and bouncing tits. Oh, those look tempting.... Between thrusts, you shift your grip on your feline lover, reaching up and squeezing her sinfully soft tits; they’re like water in your hands, flowing right around your fingers as her body is pushed up with the force of another pumping of your crotch.");
	output("\n\n<i>“Oh, yes!”</i> she yelps as your [pc.hips] slap into her ass again, <i>“Harder! Harder! Fuck me harder!”</i>");
	output("\n\nWell, she did say she liked it rough!");
	output("\n\nAny hint of the resistant cat-girl from before shatters as Tam-Tam braces against the wall, legs spread wide and back arched sharply, inviting you to pound the hell out of her sodden box. You oblige, a hand grabbing her by the scruff of the neck and forcing her down, bending her over as you start to hammer her cunt. Your [pc.cockOrStrapon " + x + "] is a blur as your hips move faster, fucking her into the table until she’s screaming in pleasure, pulling her chains taut as you mercilessly fuck her into submission.");
	output("\n\nYou barely notice Tam’s orgasm, marked only by a peak in her cries and a sudden gush of girl-cum that slithers down her thighs around the thrusting shaft of your [pc.cockOrStrapon " + x + "] as you continue to pound away at her, unrelenting as her warm, wet muscles squeeze around your rod, trying to milk the cum from you. You try and hold back, concentrating on the rippling display of ass-flesh in front of you, on squeezing Tam’s tits until she squeals, but eventually you too feel the apex of pleasure oncoming.");
	output("\n\nThere’s no stopping it now. With a primal roar, you slam yourself deep into Tam’s sodden quim and ");
	if(x >= 0) output("unleash your load, firing a thick rope of [pc.cumColor] spunk to paint her walls, mixing with her own flowing juices as she cums again, spurred on by your potent release.");
	else output("try not to scream yourself as the hardlight dick sends mind-numbing pleasure through your nerves.");
	output(" You grab the cat’s neck, holding her down as your hips continue to jerkily thrust into her, tempo broken by the waves of pleasure crashing through you.");
	output("\n\n<i>“Fuck yeah,”</i> Tam purrs, nuzzling back against your firm hand. <i>“Treat me like a whore, babe... just like that...”</i>");
	output("\n\nIf she insists.... Your orgasm finally winding down, you pull out of Tam’s now-gaped pussy, smearing the last traces of ");
	if(x >= 0) output("your load");
	else output("her fem-cum");
	output(" off on one of her big butt-cheeks, leaving a nice, creamy smear as you start to gather your things. By the time you’re ready to go, it looks like Tam’s drifted off into a peaceful cat-nap, clearly quite satisfied with her treatment.");
	output("\n\nWorth every credit.");
	IncrementFlag("TAMTAM_PRISONED");
	processTime(25);
	pc.orgasm();
	if(impregnate) tryKnockUpTam();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Captain Khorgan
public function capnKhorganPrisonVisit(impregnate:Boolean = false):void
{
	clearOutput();
	showKhorganPrison();
	author("Savin");
	output("Inside the holding cell sits a tall, dark-green amazon of a woman: her body is chiseled muscles and jagged scars, giving way to large, firm breasts that heave with heavy breaths underneath the too-tight prison jumpsuit she’s wearing, zipped down to the navel to show off all that sculpted green muscle. ");
	//lightly pregnant:
	if(flags["KHORGAN_GAST_PREG_TIMER"] <= 40) output("And, you notice, a very slight belly the captain’s started to sport. She’s resting a hand on it, running a thumb up and down the taut emerald skin of her stomach.");
	else if(flags["KHORGAN_GAST_PREG_TIMER"] <= 115) output("There’s no mistaking the swell of her stomach, poking through the mammoth cleavage of her jumpsuit. She’s pregnant: no doubt about it, and looking radiant in her matronhood. The thraggen rests a hand proudly on her belly, grinning at you beneath her bestial tusks.");
	//else gravid: 
	else if(flags["KHORGAN_GAST_PREG_TIMER"] != undefined) output("Khorgan’s gravidly pregnant; there’s no other way to describe it. Her belly bump is a massive ball of life protruding from her once-flat stomach, taut emerald skin stretched around your bastard offspring. The thraggen pirate smiles radiantly around her bestial tusks, proudly running her hand along the swell of her belly.");
	output(" Sometime between you selecting her and her arrival in the holding cell, Khorgan’s broken free of the grav-chains that are supposed to be holding her; she’s sitting on the edge of the table, one leg crossed over the other, her red hair spilling down around her shoulders like a lion’s mane.");

	output("\n\n<i>“Captain Steele,”</i> Khorgan says, somewhere between a sultry purr and the growl of a barbaric rival. ");
	//not pregnant OR first time:
	if(flags["KHORGAN_PRISONED"] == undefined) output("<i>“Finally ready to claim your prize, are you? We should be tearing this galaxy a new one, side by side, showing everyone our combined strength! You’ve won my loyalty in battle, so why keep me here, huh?”</i>");
	//else is pregnant:
	else if(khorgan.isPregnant()) output("<i>“Come to check in on the mother of your child? As if anything could happen to me in here! There’re so many doctors and science-mongers scrutinizing my belly that I can’t get morning sick without setting off an alarm. Your child will be healthy and strong, Steele. No doubt about it.”</i>");
	//repeat not preggo:
	else output("<i>“Back again? Good. I’m tired of beating on these pathetic guards - at least you’re worth my attention!”</i>");

	output("\n\nShe chuckles and leans back on the table, a gesture that both thrusts her chest out at you and invites you closer, to close the distance and grab the once-mighty thraggen, pulling her into a fierce kiss. Her breath catches in her throat, but she moans into your [pc.lipsChaste], her powerful hands quickly searching down your own body, grabbing your [pc.butt] and squeezing hard.");

	output("\n\n<i>“We thraggen have a saying,”</i> she whispers as you release her. <i>“To the victor go the spoils. You defeated me in my prime, so take me. Any way you want, Steele.”</i>");

	output("\n\nWith a few slight movements of her hands, she starts to pull the equipment from your body, baring the [pc.skinFurScales] beneath. You return the favor, tearing her jumpsuit off so that her breasts fall fully free, pressed against your own [pc.chest] as your hands run all over each others, tearing at clothes and groping at bare stretches of flesh, slowly working towards each others’ most sensitive parts. Eventually, you hook your fingers through her pants and give them a downward tug. She gives a little moan as you wiggle her breeches off, leaving the damp garments for her to kick off. True to form, that captain’s gone without panties, leaving the dark gash of her sex on blatant display, already glistening with slick excitement.");

	output("\n\n<i>“Oh yeah,”</i> she groans as your wandering hand caresses her mons, a pair of fingers easily probing their way into her. <i>“Right there, Steele. Just like that.”</i>");
	output("\n\nYou thrust your hand deeper, burying your digits to the knuckles, and are rewarded with a gasp of pleasure and a feral growl as Khorgan wraps her powerful arms around you, squeezing you almost painfully tight. You’re about to complain when one of her legs hooks around your [pc.leg]; you give a little yelp as the two of you tumble to the ground, slamming into the steel deck with head-rattling force. When your vision clears, though, you see that all’s well with the world: the captain’s straddling you, thighs clamped around your [pc.hips] with her own slick sex poised overtop your ");
	if(!pc.hasCock()) output("[pc.face]");
	else output("[pc.cock], almost on the brink of penetration");
	output(".");

	processTime(20);
	pc.changeLust(100);

	clearMenu();
	
	//Quick and Dirty way to do impregnation
	if(impregnate)
	{
		addButton(0, "Next", khorganDickyWickyTrickyDo, true, "", "");
		return;
	}
	
	addButton(1,"Girly Fun",khorganLesboPrisonSex,undefined,"Girly Fun","Make sure every pussy on the deck gets licked, regardless of owner.");
	if(pc.hasCock()) 
	{
		if(pc.cockThatFits(chars["CAPTAINKHORGAN"].vaginalCapacity(0)) >= 0) addButton(0,"Dick Fuck",khorganDickyWickyTrickyDo,undefined,"Dick Fuck","Give her what she’s asking for.");
		else addDisabledButton(0,"Dick Fuck","Dick Fuck","Her body couldn’t handle what you’re packing.");
	}
	else addDisabledButton(0,"Dick Fuck","Dick Fuck","Unsurprisingly, this scene requires a phallus.");	
}

//Dick Fuck
public function khorganDickyWickyTrickyDo(impregnate:Boolean = false):void
{
	clearOutput();
	showKhorganPrison();
	author("Savin");
	var x:int = pc.cockThatFits(chars["CAPTAINKHORGAN"].vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	output("<i>“I want you,”</i> she breathes huskily, leaning down just enough to press her face to yours, her tongue tracing along the line of your jaw, licking along your sweat-slick [pc.skin] as she starts to grind against you, her pussy reaching down to kiss the length of your stiffening shaft, rubbing along it. You gasp, reeling from the electric shock of pleasure spreading from your loins as your [pc.cock " + x + "] reacts to her wet, hot touch, jumping to attention by the time she’s finished one full bounce along its now-turgid length. She doesn’t stop, her hips continuing to pump up along your cockflesh, rubbing it down through the slit of her sex until your [pc.cock " + x + "] is well and truly drenched, smeared with feminine slime so that it glistens in the dim light of the cell.");
	output("\n\nGrinning, Khorgan rises on her knees, one hand firmly planted on your [pc.chest] to support herself, the other reaching up to grope one of her massive green melons. She gives you a look as if to say, ‘<i>are you ready?</i>’ as her hips shift, finally aligning the channel of her sex with the [pc.cockHead " + x + "] of your [pc.cock " + x + "]. You give her a slight nod, and quickly find your head rolling back, a primal roar of sexual satisfaction rolling off your lips as Khorgan slides onto you, submerging your [pc.cock " + x + "] into the tight, sweltering, sodden slit between her legs.");
	output("\n\n<i>“YES!”</i> Khorgan roars, back arched and tits bouncing as she slams herself down on your rod. The breath explodes from your chest as the captain’s hips ram into yours and the amazonian woman starts to ride you, bucking and bouncing overtop you. Her movements are forceful and violent, every buck of her hips an attack against you with almost bone-shattering force. You groan and struggle under her, but the captain’s sexual assault is overwhelming, threatening to batter the cum right out of you - and probably put you in the hospital, if the greenskin slut’s got anything to say about it.");
	pc.cockChange();
	output("\n\n<i>“Do you like it, Steele?”</i> the captain teases at the apex of another pelvis-crushing bounce, <i>“Cum for me. ");
	//not preggers: 
	if(!khorgan.isPregnant()) output("Breed me.... Give me one of your powerful offspring.... Imagine what we could do together....”</i>");
	else output("Give me more of that virile seed. Let our child grow stronger in my belly!”</i>");

	output("\n\nOh no she doesn’t! Marshalling what’s left of your strength, you issue a primal roar of outrage as you flip the both of you over, slamming the captain’s back into the deck and leaving you on your knees between her splayed legs. Khorgan looks up at you in shock, just as you hike her legs up over your shoulders and slam your [pc.hips] in, hilting your [pc.cock " + x + "] in her. Rather than resisting as you might have expected, the captain gives you an approving nod and hooks her hands under her powerful legs, holding them nice and wide, giving you unobstructed access to her cunt.");
	output("\n\nNow it’s your turn. You lean in through the splayed gulf of her groin, deep enough to grab one of the dark teats atop Khorgan’s breasts between your teeth, rolling the pert bud between your incisors until the captain groans with pleasure, vaginal muscles tensing around your thrusting prick. At this angle, though, no matter how tight she clenches, you’ve got the perfect vantage to pound her pussy. Your hips piston forward, slamming home against her up-raised cheeks with enough force to make her whole body tremble, her hefty tits bouncing hypnotically with every thrust.");
	output("\n\nYou grab those heavy, perfect orbs, sinking your fingers into the pliant flesh until Khorgan’s howling with pleasure, all but begging for release. You refuse to let up on your furious sexual assault, putting the amazonian in her place with your hammering [pc.hips] and thrusting cock filling her cunny. Finally, the former captain throws her head back and gives a feral, lusty roar - a sound that echoes through the prison as she cums. Her muscular legs wrap around your neck, pulling you tight into the heaving mounds of her tits as she climaxes, letting you feel the heat radiating off her lust-addled body, the beat of her heart through the tensed muscles of her sex as she slathers you in fem-spunk, drenching your groin even as her pussy milks you, muscles instinctively trying to drain every drop of seed.");
	output("\n\nThat, at least, you’ll happily give her. You move faster, your [pc.hips] slamming into her with greater and greater force as your speed reaches dizzying heights. The captain’s orgasm drags out as you hammer her, pulling you closer and closer to your own with her low, guttural cries and wild-wringing muscles. Between your frantic thrusts, you feel your orgasm coming, a thick rope of [pc.cum] surging through your [pc.cock] and into the slick, squirming tunnel of the captain’s sex.");
	output("\n\n<i>“Fuck yes!”</i> Khorgan screams, feeling your seed ");
	if(silly) output("sploosh");
	else output("rush");
	output(" into her. Before she can continue, you silence her with a rough kiss, forcing your tongue through her lips and across the pointed tips of her fang-like teeth. The thraggen captain grunts her approval, hands grabbing your [pc.butt] and forcing you deeper inside as you blow your load into her cumming cunny. With her pulling you in, you finally hilt yourself inside her");
	if(pc.hasKnot(x)) output(", your [pc.knot " + x + "] forcing the lips of her pussy wide open, lodging itself in the mouth of her cunt");
	output(". Panting, you finally disentangle yourself from the cum-filled thraggen, leaning back on your [pc.knees] and heaving a sigh of exhaustion. The captain grins up at you, fingers rubbing gingerly at the rim of her sex, making no move to resist you lean in for a parting kiss... and clip her restraints back into place. You gather your gear and get ready to leave.");
	IncrementFlag("KHORGAN_PRISONED");
	processTime(20+rand(10));
	chars["CAPTAINKHORGAN"].loadInCunt(pc,0);
	if(impregnate) tryKnockUpKhorgan();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//LesboSex
public function khorganLesboPrisonSex():void
{
	clearOutput();
	showKhorganPrison();
	author("Gardeford & Savin");
	output("Khorgan grins down at you from her suddenly-dominant position");
	//if preggers:
	if(khorgan.isPregnant()) output(", having to lean well over her hefty baby-bump");
	output(". <i>“Nice view,”</i> she sneers, reaching down to spread the dusky lips of her twat, showing you the hungry hole in all its sodden glory. She’s so wet from just the foreplay that droplets of her excitement pitter-patter onto your cheeks, slathering you in her scent. It’s almost instinct to lean your head up, running your [pc.tongue] through the cleft of her sex. Khorgan growls softly, groping her breasts and rocking her hips, urging your tongue deeper and deeper.");
	output("\n\nEating pussy’s nice and all, but you’re the one who’s supposed to be on top. Taking advantage of Khorgan’s lust-drunk state, you drive your tongue as far into her twat as you can, stunning the thraggen amazon with pleasure. She throws her head back with a roar, grinding her hips into your [pc.face]. The distraction is more than enough: you grab Khorgan by the hips and flip her, putting the big green beauty on her back with her legs splayed around your [pc.hips] and her arms pinned at her side.");
	output("\n\n<i>“About time!”</i> your thraggen lover growls happily.");
	output("\n\nYou grasp one of her tits in your palm, giving it a squeeze before narrowing your hold to pinch her darker viridian nipple. Her arm twitches, instinctively wanting to join your hand in playing with her breasts. Luckily for her, you have no intention of leaving your current plaything’s twin unattended. You lean in close, starting at the base of her arm and kissing along the side of her sizeable melon. Your kisses culminate as you reach her rock hard nipple, softly biting it as you gaze lustily into the thraggen pirate’s eyes.");
	output("\n\nAs your mouth works its magic on her breast, you let your hand trail down her stomach, brushing the cleanly defined muscle of her abs. You dip your fingers into the folds of her vagina, circling her hole once before plunging two fingers into its depths.");
	output("\n\n<i>“Yes, Steele! More!”</i> she moans, her hand replacing the missing one in fondling her abandoned tit. The heat of her cunt is immense inside the hotbox of her pants, and you feel the warmth of it spreading up your arm as you dig your fingers deeper inside at her insistence. The nipple in your mouth has become nearly as hard as the platinum the captain was so invested in mining once upon a time, and you bite a little harder with each pass until you have Khorgan roaring with pleasure at each touch of your teeth.");
	output("\n\nThe lust-drunk pirate bucks her hips against your hand, her legs rapidly alternating between being locked together and splaying out in rapture. The inner walls of her sex clamp around your hand like a cinch, but you pull in and out just as rapidly, adding a third finger to your spelunking escapade. In the excitement, you fail to notice that her other arm has edged its way out of the body trap you’d placed it under.");
	output("\n\nYou tense in astonishment as a feral growl escapes the captain’s throat, and she grasps both of your shoulders, rolling the both of you over until she lies on top of you. <i>“I can’t just lie there and not give anything back, can I Steele?”</i>");
	//if pc shortstack:
	if(pc.tallness <= 59) 
	{
		output("\n\nShe sits atop your fingers, hands gripping at your [pc.chest]. You gasp with pleasure as she squeezes your [pc.breasts] and tweaks your [pc.nipples]. Her hips gyrate on your fingers, still buried in her loins.");
		if(pc.hasVagina()) output(" You shiver as her fluids start to leak down, mixing with the ones already trickling down your [pc.legs] from [pc.eachVagina].");
	}
	else output("\n\nThe thraggen captain straddles your hand, which still lies buried in her pants. She grins at you, baring her fang-like teeth before gently biting one of your [pc.breasts]. Her soft gnawing grows in intensity until you flinch with discomfort, at which point she lets down, sucking on your [pc.nipple] to soothe your hurt. Her tongue is just as developed as the rest of her muscles, and plays across your flesh like an exotic dancer. You shiver as the euphoric mixture of pleasure and pain sets rivulets of your sexual fluids dripping down [pc.legs].");

	output("\n\nDespite how good she’s making you feel, you aren’t about to give up control of the situation. While the captain is busy playing with your [pc.chest], you pull your fingers out of her burning cunt and move it around to her chiseled ass. You slip your second hand in as well, caressing her cheeks to further lull her into a false sense of security. The next time she clenches her legs together to keep herself up, you swiftly withdraw your hands and grab her ass, flipping her back onto the deck with the momentum.");
	output("\n\nAt this point, you’re all but wrestling for dominance - an act that only arouses the amazonian pirate further. She growls and howls, powerful muscles struggling against your own. Now this must be how thraggen fuck! You grin down at her, pinning the captain to the deck and molesting her exposed breasts with your teeth.");
	output("\n\nThe jade-skinned pirate’s face is a mask of battle-lust, and seeing it brings a renewed feeling of triumph and vigor to your body. You grip Khorgan’s prone form around the waist, pulling her wonderfully tight butt and cunt up to your face, and hugging her back to your [pc.chest]. Despite the fact that it has been freed from enclosure, her cunt is still thoroughly soaked with sweltering hot juices. The sight and smell of it causes " + (pc.hasVagina() ? "[pc.eachVagina] to become noticeably wetter" : "your [pc.asshole] to pulse with arousal") + ".");
	output("\n\nUnable to deny your lusts any longer, you bury your face in her waiting folds. Your [pc.tongue] dives into her hole, licking around her insides as your nose rubs fervently against her budding clit. The thraggen captain grunts and moans at the sudden penetration, momentarily unsure of what to do with herself. Eventually her hands find their way to her breasts, playing and tugging at them with a mindless resolve. Holding her in place with one arm, you join one of her hands in massaging them, intertwining your fingers with hers and coaxing her to squeeze her helpless tit with a little extra force.");
	output("\n\nKhorgan’s well muscled legs shudder and tense in the air above the two of you, but her eyes have lost none of their fiery intensity; she’s entirely focused on you as she resists your assault to the best of her ability. Her jaw is clenched with teeth bared, ");
	if(silly) output("considerably white for a pirate. You guess no one has an excuse to not keep up with dental hygiene considering new advances in the technology.");
	else output("but you imagine you’ll have her howling again in short notice.");
	output("\n\nA final twitch of her clit is the only warning you get before the pirate captains body fulminates in a planet-cracking orgasm. You hear a wet rip as her pants tear into two halves, freeing her legs to splay out in the air, letting your face nuzzle even deeper into her now fully exposed spasming cunt. A burst of femcum splatters over your face, dribbling down her stomach and back as you pull away. Her body leaves her no energy for shouting, so all the noise she can make is a soft moan as she rides out the euphoria. You gulp in a couple breaths of fresh air before returning your attentions to Khorgan.");
	output("\n\nYour victory prize remains where you left her, still trying to recover as aftershocks of the orgasm you put her through occasionally send shudders through her body. There’s still something missing from this equation though: you haven’t actually gotten off yet.");
	output("\n\nYou’ve got the answer to that problem, though. You straddle the insensate amazons face, planting " + (pc.hasVagina() ? "[pc.oneVagina]" : "your [pc.asshole]") + " directly over her mouth.");
	if(pc.isNice()) output("\n\n<i>“Come on, you gotta help me after that,”</i> you say with a smile, running your hand through her sweat slicked hair.");
	else if(pc.isMischievous()) output("\n\n<i>“You can’t be done so soon,”</i> you chide teasingly.");
	else output("<i>“Lick,”</i> you command with a grin.");
	output(" Some primal part of the captain must hear you, as she weakly grasps your hips and pulls you down onto her mouth. Her tongue laps and licks at your [pc.vagOrAss], sending small shockwaves of bliss through your body when she teases ");
	if(pc.hasVagina())
	{
		if(pc.totalClits() > 1) output("a");
		else output("your");
		output(" [pc.clit]");
	}
	else output("your tender ring");
	output(". You massage her tensed body while she tends to your [pc.vagOrAss], rubbing the stress out of her athletic abs and sturdy hips. While the idea of fingering her again is tempting, you decide to let her off the hook, especially since she’s doing such a good job.");
	output("\n\nHer powerful tongue has since slipped deep inside you, pressing all the right places with all the right pressure. In a matter of seconds, one of her tongue’s strokes passes a spot that fills your head with rhapsodic bliss. Your body follows closely behind, tensing and ");
	if(pc.hasVagina()) output("showering Khorgan’s face with your [pc.girlCum]. You remain seated for a few more seconds to catch your breath, giggling as the pirate captain continues to weakly lick your mons periodically");
	else output("gasping as your asshole rockets to orgasm, sending shockwaves of pleasure all through you");
	output(". Eventually, you raise yourself from her, gathering your gear before turning back to her.");
	output("\n\n<i>“Until next time, then,”</i> Khorgan grins, licking her lips clean of you... right up until you grab her restraints and lock them down again, earning an indignant grunt as you walk out.");
	processTime(20+rand(10));
	pc.orgasm();
	pc.girlCumInMouth(chars["CAPTAINKHORGAN"]);
	IncrementFlag("KHORGAN_PRISONED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
/*
output("\n\nKaska");
output("\n\nhttps://docs.google.com/document/d/19GGjJ4Xa1Xe4ROMt9mNLxMrdLNz58R4FSudvA86zwnA/edit#");
*/

public function kaskaSlammer():void
{
	clearOutput();
	showKaskaPrison();
	output("Inside the cell is the restrained form of Kaska Beamfury, the dick-girl pirate you defeated back on Tarkus. She looks much the same as you remember her: over seven feet tall with large, shapely breasts that heave with every breath and a punkish haircut you could pick out across a crowded room. The most telling difference is her expression. Gone is the fierce glare that seems like it could bore the hull of a battlecruiser. In its place is the lazy-eyed look of a woman who has lost all control of her life.");
	output("\n\nTime in the slammer has not been kind to Kaska.");
	output("\n\nOne other change presents itself at the sight of you: her dick. It’s at least three times as big as it ever was before, and swelling larger with every passing second, tumescent futa flesh slowly climbing up her middle to slap it into place between her tits, nestling into a menagerie of half-dried spunk-stains. Kaska’s eyes brighten with recognition or arousal, you aren’t sure which. Dark blushes form on her cheeks, and her rampantly erect monster-cock bobs and leaks, slapping wetly against her cleavage again and again, nearly grazing her chin each time.");
	output("\n\n<i>“Uh, hey there Steele.");
	//No new PG. First time:
	if(flags["KASKA_PRISONED"] == undefined) 
	{
		output(" I didn’t think I’d ever see you again. Can’t blame you though. If our positions were reversed, I’d already be shoving my cock down your throat... not that I can do that now.”</i> Kaska idly strokes her tremendously erect shaft as she explains, smearing the slobbering dick-juice over every aphrodisiac-fortified inch. <i>“The asshole guards jacked up my cock like this before I could get anyone hooked on my cum. Pricks.”</i> She shudders and sighs, still stroking, panting a little now. <i>“How am I supposed to build an army of loyal prison grunts if I can’t stick this beast inside them?”</i>");
		output("\n\nYou shrug, watching the proud pirate gradually giving herself over to the influence of her lust-drug-augmented boner.");
		output("\n\n<i>“Exactly.”</i> Kaska falls to her knees, openly fucking herself by this point. She saws her hips back and forth, creaming from cock and cunt alike. Musky pussy-juice splatters below her as she watches you hungrily. <i>“So are you going to fuck me or what? Better you than the useless trash I’m locked up with.”</i> She bites her lip and bats her eyelashes. <i>“Uh... please or whatever?”</i>");
	}
	//Repeat. No new PG
	else
	{
		output(" You came back.”</i> Kaska idly strokes her tremendously erect shaft, hand speeding in excitement. <i>“Even without a load of my cum, you’re hooked, huh?”</i> She gathers up a palmful of her own pre-spooge and sensuously licks it from her hand, watching you the whole time. <i>“Or are you just into girls with big, useless slabs of meat? It doesn’t matter, does it?”</i> She shudders and pants.");
		output("\n\nYou shrug. It really doesn’t matter, and she clearly doesn’t expect a reply.");
		output("\n\n<i>“F-fuck, what are you waiting for?”</i> Kaska drops to her knees, openly fucking herself. Her powerful hips pump her slobbering log of a cock through her tightly-squeezing fingers. Pussy-juice dribbles eagerly across the floor. She licks her lips and bats her eyelashes surprisingly submissively. <i>“Let’s fuck already. You’re fucking hot, and these drugs have me so hard I could cum from a good snuggle.”</i> She cups her tits, pressing them tight around her leaky cock-head. <i>“P-please?”</i>");
	}
	//[Dick Fuck] [Cunnilingus] - menu copy/pasted below. New content is directly edited into old scenes.
	if(pc.lust() >= 33)
	{
		if(pc.hasCock() && pc.cockThatFits(chars["KASKA"].vaginalCapacity(0)) >= 0) addButton(0,"Dick Fuck",victoryKaskaDicksex,true,"Dick Fuck","She seems awful proud of her male endowment. Maybe she could stand to learn a little about taking one from someone else.");
		else addDisabledButton(0,"Dick Fuck","Dick Fuck","You need to have a penis that would fit in Kaska’s vagina for this.");
		if(pc.hasVagina()) addButton(1,"Cunnilingus",makeKaskaSuchYerCoochLikeABaws,true,"Cunnilingus","She’d be a pretty great pussy licker while she takes care of herself....");
		else addDisabledButton(1,"Cunnilingus","Cunnilingus","This scene requires you to have a vagina.");
	}
	else
	{
		addDisabledButton(0,"Dick Fuck","Dick Fuck","You are not aroused enough for this act.");
		addDisabledButton(1,"Cunnilingus","Cunnilingus","You are not aroused enough for this act.");
	}
	addButton(14,"Never Mind",backOuttaPrisonVisit);
}
