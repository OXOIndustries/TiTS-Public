//Krymhilde: Stormguard Valkyrie
//Savin

/*Notes & Outline

Krym is found in a unique arena in the northern part of the Glacial Rift, where she’s set up a camp amidst many obsidian pillars. Ostensibly there to keep an eye on the native tribes and report if any get too aggressive or built up. Often protects researchers and scientists working in the Rift. Her camp is a safe place, if you can pay her or earn her trust. Includes a Taxi beacon.

Combat Mechanics/Notes
If the male Stormguard is highly aggressive fighter, she’s highly defensive. Doesn’t output much damage, but she’s damn hard to take down.
Carries a Storm Shield strapped to one arm - has a huge Evasion boost while her shields are up.
Wields a lightning lance (same as Astra) and a laser machine pistol.
Has a jetpack, making her nigh-immune to melee attacks while she’s using it. Player can EMP, shoot, or hack it to disable.
Fight smart, not hard. Has loads of traps and devices scattered around her combat arena. Netguns, turrets, hardlight cages, etc.


Character/Appearance Notes
Human female.
Tall (5’10), athletic build - not super muscular, but definitely physically fit.
C-cup breasts. Big hips, thick thighs, and a whole lotta junk in her trunk.
Blonde hair. Shaved and swept to one side. A little less than shoulder length.
Blue eyes.
Ear on the shaved side is pierced with several small hardlight rings. Has a stud on the opposite nostril.
Has a crossed thunderbolt tramp stamp, like arrows pointing to her booty.
Wears the same kind of armor/cloak/jetpack setup Astra has, but with dark blue pauldrons and leg-guards. One arm has a metal bracer on it which projects a hardlight shield.
Wears a leather holoband strapped to her non-shield arm; interacts with all her traps and toys, and acts as a comms device.
Has blue goggles pulled up on her brow, and a dark blue scarf wrapped around her neck.

Sarcastic, quick-witted, and can be a little condescending. Always quick with a joke or a scathing quip.
Definitely a natural domme, but can enjoy a good pounding when she gets beaten. When she wins she’ll ride you into the ground (snu snu cowgirl or queening).
She’s not mean, though, and doesn’t mind giving some tender aftercare to your bruised and battered body after she’s had her fun.
Once you’ve beaten her 5 times, you’ll Earn Respect with her: she’ll consider you a <i>“worthy partner,”</i> and let you skip the fighting and go straight to the sex. Fighting optional thereafter. If she beats you consistently, she’ll eventually stop banging you until you turn it around - no fun if you’re just asking for it!
*/

//Room Descriptions
//Plateau Approach
//A chunk of ice to the north of the floes has been carved out with a laser, leaving a smooth, narrow incline. Ropes have been pitoned into the sides of the glacial ice, giving whoever needs to come and go from the plateau overhead some handholds to work with. Without them, it’d be a slippery mess trying to get up. The passage itself is narrow, walled on either side by sheer ice, barely wide enough for two people to squeeze through abreast.

//On either side of the incline’s top, you can see a pair of snow-camo turrets sitting low to the ice, long barrels sweeping steadily from side to side in search of hostile targets. When you enter their line of sight, both barrels snap over to you, scanning... and then beep quietly and resume their watch.

//Plateau Camp

//output("\n\nYou’re standing in the middle of a wide, flat plateau of ice overlooking the northern-most reaches of the Rift. Several pillars of obsidian-black rock jut up from the ice and snow, forming a sort of henge around the center of plateau. A spindly Q-COMM beacon is sitting in the middle of all of them, pulsing with a red light every few seconds.");

public function showKrym(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showName("\nKRYM");
	showBust("KRYM" + nudeS);
}

public function krymCampBonus():void
{
	output("\n\nThe eastern half of the area is dominated by what looks to be a pre-fab metal bunker, covered in tarps and reinforced with sandbags pressed against the walls. Radio antennae peek out from the roof around a solid, smoking chimney. There are no windows you can see, and the door is solid metal covered by a thick curtain of tanned hides. Unsurprisingly, ");
	if(flags["MET_KRYM"] != undefined) output("Krym");
	else output("whoever lives here");
	output(" is desperate to keep as warm as possible.");
	output("\n\nSeveral colonial turrets have been set up around the perimeter, watching over the plains of ice stretching out in every direction.");
	if(flags["MET_KRYM"] != undefined && hours >= 5 && hours < 19) 
	{
		output(" Krymhilde is patrolling the turret gun-line, making sure each one is functional despite the cold and wear from the constant storms. She ");
		if(krymRespectsYou()) output("gives you a flirty grin over her shoulder as she works, and you see a little more spring make its way into her step as she works.");
		else output("gives you a slight nod of acknowledgement as you wander.");
	}
	else if(hours >= 5 && hours < 19) output(" A woman in white ceramic armor is patrolling the gun line, carrying a spear almost as tall as she is over one shoulder. She’s clearly human, if the head of blond hair and cream-pale skin are anything to go by. The lightning bolt patterns on her armor tell you she’s probably a member of the local Stormguard.");
	
	CodexManager.unlockEntry("Stormguard");
	
	if(hours >= 5 && hours < 19)
	{
		if(flags["MET_KRYM"] == undefined) addButton(0,"Stormguard",approachKrym,undefined,"Stormguard","Try and talk to the armed and armored woman. If she hasn’t attacked you yet, she probably won’t start now... right?");
		else addButton(0,"Krym",approachKrym,undefined,"Krym","Check on Krym. Maybe she’ll be up for something besides fighting... or not.");
	}
	else if(krymRespectsYou())
	{
		addButton(1,"Use Beacon",useUvetoBeacon,undefined,"Use Beacon","Krym won’t mind if you use the beacon while she sleeps.");
	}
}

//Krym Greetings

//First Time
//During daytime, add [Stormguard] to the plateau menu.
//Try and talk to the armed and armored woman. If she hasn’t attacked you yet, she probably won’t start now... right?

public function approachKrym():void
{
	clearOutput();
	showKrym();
	author("Savin");
	if(flags["MET_KRYM"] == undefined)
	{
		output("You [pc.walk] over to the armored woman, raising a hand in greeting. She turns to you, lips in a hard line and both hands on her spear. <i>“Who goes there?”</i> she shouts, <i>“Not expecting any researchers.”</i>");
		output("\n\nYou call back your name, saying that you’re an explorer of sorts. If she wasn’t expecting you, you sure weren’t expecting to find a fortified base out here in the middle of nowhere.");
		output("\n\nShe lowers her spear after a moment, A head of blond hair whips in the wind, shaved on one side and swept over near her shoulder on the other, revealing an ear full of glistening holo-rings and a pierced nostril. She pushes a pair of blue-tinted goggles, matching blue eyes, up on her forehead. <i>“Fair enough. This is a Stormguard outpost. We keep it safe for Iresteaders that wander too far afield, or scientists coming through to study the Rift. ‘Course, they all pay a premium to use the place. You, though...”</i>");
		output("\n\nThe woman taps a button on a wrist-mounted device and waves her arm in your direction. <i>“You’re lucky you’re loaded down with nanomachines. Otherwise the turrets woulda ripped you a new one when you got inside a hundred meters. But, you’re still not supposed to be here. So.”</i>");
		output("\n\nSo. <i>“Who’re you?”</i>");
		output("\n\nShe chuckles, switching the spear from one hand to the other. <i>“Krymhilde Weissman. Storm Lancer. Can call me Krym if you want. I’m responsible for security and maintenance here. Make sure the right people can come and go, safe and sound. Since you’re not Stormguard or someone paying us, if you want to use the transport beacon or catch some shuteye in the safety of my gun-net, gonna have to make it worth my while. Otherwise, kindly take a hike.”</i>");
		flags["MET_KRYM"] = 1;
		processTime(4);
	}
	//Repeat, Didn't Fight
	else if(flags["KRYM_KOMBAT_RESULT"] == undefined) 
	{
		output("<i>“You again!?”</i> Krym calls down, crossing her arms under her chest. <i>“Finally grow a backbone... or just desperate enough to fight? That’s the only way you’re getting anything here, so what’ll it be?”</i>");
		processTime(1);
	}
	//Repeat, Has Fought Before, Not Earned Respect
	else if(!krymRespectsYou())
	{
		output("<i>“Steele!”</i> Krym calls from across the plateau. <i>“Welcome back. ");
		if(flags["KRYM_KOMBAT_RESULT"] == -1) output("Come to test your mettle again? Everyone deserves a chance to show how they’ve grown, we Stormguard say. But I won’t go easy on you just because you lost last time... I liked watching you squirm a little too much for that!");
		else output("I was hoping you’d swing around my way again, give me a chance to show you what I can do now. I’ve been practicing since last time, you know!");
		output("”</i>\n\nThat right?");
		output("\n\nShe grins, spinning her spear under her arm. <i>“Almost non-stop. I’m not going to rest until it’s me pinning </i>you<i> down!”</i>");
	}
	//Repeat, has Respect
	else
	{
		output("<i>“Back again, Steele?”</i> Krym calls over, pulling her goggles up onto her brow. <i>“Sure you’re not going native out there? Seem to like wandering around in the snow as much as a milodan, from where I’m standing. Heh. Either way, beacon and camp’re yours to use... as am I, if you want. Could always use a short break from the overwhelming boredom,”</i> she laughs.");
	}
	krymMenu();
}

//Hasn’t Fought before:
//[Use Camp?] [Leave]

//Has Fought, No Respect
//[Duel Krym] [Leave]

//Has Fought, Has Respect
//[Duel Krym] [Use Beacon] [Rest] [Leave]

public function krymMenu():void
{
	clearMenu();
	if(flags["KRYM_KOMBAT_RESULT"] == undefined) addButton(0,"Use Camp?",useKrymsCamp,undefined,"Use Camp?","Ask what it’ll take for the Stormguard woman to let you use the camp’s facilities.");
	else addButton(0,"Duel Krym",duelKrym,undefined,"Duel Krym","Throw down with the Storm Lancer.");
	addButton(14,"Leave",mainGameMenu);
	if(krymRespectsYou())
	{
		addButton(1,"Use Beacon",useUvetoBeacon,undefined,"Use Beacon","Ask Krym if you can use the Taxi beacon.");
		addButton(2,"Rest",restOfKrym,undefined,"Rest","Take a rest in the safety of Krym’s camp.");
	}
	else
	{
		addDisabledButton(1,"Use Beacon","Use Beacon","You’ll need to win her approval (or pity) to use this.");
		addDisabledButton(2,"Rest","Rest","If you want to rest in her camp, you’ll need to earn her respect.");
	}
	if(pc.hasStatusEffect("Transmitter-APPROVED")) addButton(1,"Use Beacon",useUvetoBeacon,undefined,"Use Beacon","Ask Krym if you can use the Taxi beacon.");
}

//Track last result and consecutive wins. If consecutive wins hit 3, she respects you and that stops tracking.
public function krymCombatTrack(win:Boolean = true):void
{
	if(win) flags["KRYM_KOMBAT_RESULT"] = 1;
	else flags["KRYM_KOMBAT_RESULT"] = -1;
	if(!krymRespectsYou())
	{
		if(win)
		{
			IncrementFlag("KRYM_RESPECT");
		}
		else flags["KRYM_RESPECT"] = 0;
	}
}

public function krymRespectsYou():Boolean
{
	return (flags["KRYM_RESPECT"] >= 3);
}

//Use Camp?
//Ask what it’ll take for the Stormguard woman to let you use the camp’s facilities.
public function useKrymsCamp():void
{
	clearOutput();
	showKrym();
	author("Savin");
	output("<i>“And what’s it take to make it worth your while?”</i> you ask. <i>“Credits?”</i>");
	output("\n\nKrymhilde chuckles, crossing her arms under her chest. <i>“Nah, got plenty of those. Besides, what am I gonna spend ‘em on out here? Milodan and korgonne wouldn’t know what to do with a " + (isAprilFools() ? "dogecoin" : "credit chit") + " unless it was shaped like a cock. Tell you what: you made it all the way out here all by yourself, so you must be pretty good in a fight. I could use the practice - none of the natives can make it past my turrets, if they even bother trying anymore. Starting to worry I’m gonna lose my edge.”</i>");
	output("\n\nSo what, she wants you to fight her?");
	output("\n\n<i>“Call it an honor duel. You win, can use the camp like you own the place. I win, and I’m gonna drag you inside and use <b>you</b> to get nice and warm. Gets awful cold and lonely working out here all day.”</i>");
	if(pc.isAss() || pc.isBro()) output("\n\nAs if you’d lose.");
	else output("\n\nWell, that’s awfully forward.");
	output(" <i>“And does ‘using the camp’ include you, then?”</i> you ask back. <i>“Seems only fair.”</i>");
	output("\n\nThe Storm Lancer gives you a sly grin. <i>“If you want. Fair’s fair. But you better be ready to handle me,”</i> she chuckles, planting her spearhead in the snow. <i>“We Uvetan girls are wild.”</i>");
	output("\n\nGuess you’ll have to see <i>how</i> wild for yourself.");
	processTime(5);
	clearMenu();
	//[Duel Krym] [Leave]
	addButton(0,"Duel Krym",duelKrym,undefined,"Duel Krym","Throw down with the Storm Lancer.");
	addButton(14,"Leave",mainGameMenu);
}

//Duel Krym
//Throw down with the Storm Lancer.
public function duelKrym():void
{
	clearOutput();
	showKrym();
	author("Savin");
	output("<i>“Alright. You and me, let’s go,”</i> you say, drawing your [pc.weapon].");
	if(!krymRespectsYou()) output("\n\nKrym throws her head back and laughs. <i>“Awesome! I haven’t had a halfway decent fight in ages. Come on then, Steele, it’s time to show you what Stormguard valor looks like!”</i>");
	else 
	{
		output("\n\n<i>“Again?”</i> Krym answers, cocking an eyebrow. <i>“Not that I don’t appreciate the practice, but you’ve proved your worth, Steele. Don’t have to fight me unless you just want to for the sake of it.”</i>");
		output("\n\nYou assure her that you do, earning a slight chuckle from the valkyrie. <i>“Alright, but I’ll warn you: I’ve been practicing since last time. Gonna make you work for your reward.”</i>");
	}
	output("\n\nKrym spins her lance under her arm and assumes a ready position. Her off-arm erupts in a flash of energy, and a crackling energy shield takes shape around her bracer. She levels her weapon at your [pc.chest], couching the haft on the top of the shimmering hardlight buckler.");
	output("\n\n<i>“May the best woman win!”</i>");
	clearMenu();
	var tEnemy:Krym = new Krym();
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(combatVictoryWithKrymm);
	CombatManager.lossScene(loseToThatIcyBimbo);
	CombatManager.displayLocation("KRYM");
	addButton(0,"Next",CombatManager.beginCombat);
}

//Use Beacon
//Ask Krym if you can use the Taxi beacon.
public function useUvetoBeacon():void
{
	clearOutput();
	author("Savin");
	if(hours >= 5 && hours < 19)
	{
		showKrym();
		output("<i>“Sure thing, Steele,”</i> Krym says, jerking a thumb toward the beeping Q-COMM beacon in the middle of the pillar forest. <i>“Just hook your Codex in and she’ll get a signal anywhere on-planet.”</i>");
		output("\n\nYou do as she says, syncing your Codex up with the Stormguard network, and a moment later, that of the Confederate Scout Authority and their rapid transit system. You can call in for pickup here, no problem.");
		if(inCombat()) 
		{
			if(eventQueue.indexOf(useUvetoBeaconMenu) == -1) eventQueue.push(useUvetoBeaconMenu);
			output("\n\n");
			CombatManager.genericVictory();
		}
		else useUvetoBeaconMenu();
	}
	else 
	{
		showName("\nTRANSIT!");
		showBust("");
		output("You sync your Codex up with the Stormguard network, and a moment later, that of the Confederate Scout Authority and their rapid transit system. You can call in for pickup here, no problem.");
		useUvetoBeaconMenu();
	}
	processTime(2);
}
public function useUvetoBeaconMenu():void
{
	clearMenu();
	//Display destination options
	addButton(0, "Irestead", uvetoTaxiShitGooo, "UVI P40");
	if(flags["UVIP_R10_PROBE_ACTIVE"] == undefined) addDisabledButton(1, "Probe");
	else addButton(1, "Probe", uvetoTaxiShitGooo, "UVIP R10");
	if(hours >= 5 && hours < 19) addButton(14, "Nevermind", krymMenu);
	else addButton(14, "Back", mainGameMenu);
}

//PC chooses destination:
public function uvetoTaxiShitGooo(destination:String):void
{
	clearOutput();
	if(hours >= 5 && hours < 19) showKrym();
	else showBust("");
	showName("\nTRANSIT!");
	author("Savin");
	output("You punch in your destination, and all there is left to do is wait. Given the cold, you decide to retreat into the awning of the bunker, getting shelter from the winds until, a few minutes later, you hear the roar of hovercraft engines and a beam of light lancing through the snow. Stepping back out and shielding your eyes, you watch the snow-patterned hover car slowly setting down amidst the black pillars looming up from the plateau.");
	output("\n\nYou head over and pop the door, finding a shiny chrome robot in the driver’s seat waiting for you.");
	if(hours >= 5 && hours < 19) 
	{
		output(" As you’re swinging into the back, you hear Krym behind you: <i>“Safe travels, Steele.");
		//PC lost last:
		if(flags["KRYM_KOMBAT_RESULT"] == -1) output(" Get stronger out there - I need a meaty challenge to keep me sharp out here.");
		else output(" You come back ‘fore long, you hear? I’m gonna be practicing until I’m the one mashing </i>your<i> face in the snow!");
		output("”</i>");
	}
	output("\n\nYou nod over your shoulder and seal the door, telling the taxi drone to take you onwards.");

	output("\n\nIt beeps and takes off, flying into the storm with robotic calm. Thanks to the powerful engines, anywhere in the region is just a hop and a skip away - you feel like you’ve barely taken off before the taxi beeps and shudders, setting down with a soft thud. The drone takes your credits with a synthetic smile and deposits you back on the planet’s surface before flying off again to its next appointment.");
	moveTo(destination);
	processTime(20);
	clearMenu();
	if(inCombat())
	{
		output("\n\n");
		CombatManager.genericVictory();
	}
	else addButton(0,"Next",move,destination);
}

//Rest
//Take a rest in the safety of Krym’s camp.
public function restOfKrym():void
{
	clearOutput();
	showKrym();
	author("Savin");
	output("Turning towards the bunker, you tell Krym that you’re going to catch some shuteye. There’s nowhere on the Rift where you’re likely to get a safer, warmer place to sleep, after all. Not gonna let the chance pass you by.");
	//NoRespect; Just Fought: 
	if(!krymRespectsYou()) 
	{
		output(" <i>“That it?”</i> Krym grimaces, forcing herself up to her feet. <i>“After all that, and your blood isn’t racing - isn’t ready to turn you into a rutting beast? I said I’m game...”</i>");
		output("\n\nYou shake your head. You’re not interested in the Lancer’s games right now: just a nap.");
		output("\n\nShe laughs and shakes her head. <i>“Dammit. Well, hope you don’t mind a little noise from the next room. I’ve got something run on batteries that’s calling my name.”</i>");
		output("\n\nClassy.");
		output("\n\nYou head inside, followed closely by Krym, and find a closet-sized room near the back with a cot. You lock the door and bunk down for a few hours...");
		//Give PC the benefits of sleeping. When done, move to outside menu again.
		processTime(5*60+rand(30));
		sleepHeal();
		if(inCombat())
		{
			output("\n\n");
			CombatManager.genericVictory();
		}
		else
		{
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
	}
	else
	{
		output(" <i>“That right?”</i> Krym asks, leaning on her spear’s haft. <i>“Well, you’ve more than earned it, Steele. And my company while you rest, if you want it...”</i>");
		output("\n\nShe lets the offer hang in the air for a moment, favoring you with a playful smile and a slow, steady sway of her hips while she leans on the rigid pole.");
		processTime(5);
		//[Fuck Krym] [Not Now]
		clearMenu();
		addButton(1,"Not Now",noSexForKrym,undefined,"Not Now","Maybe next time, Krym...");
		if(pc.lust() >= 33)
		{
			if((!pc.hasCock() || pc.cockThatFits(krymhilde.analCapacity()) < 0) && (!pc.hasHardLightEquipped() && !pc.hasCock()) && (!pc.hasVagina() || pc.blockedVaginas() >= pc.totalVaginas())) addDisabledButton(0,"Fuck Krym","Fuck Krym","You need to have a penis or hardlight strap-on, or an unblocked vagina, in order to fuck her.");
			else addButton(0,"Fuck Krym",fuckKrym,undefined,"Fuck Krym","Take Krym up on her offer and bed the stormy valkyrie.");
		}
		else addDisabledButton(0,"Fuck Krym","Fuck Krym","You aren’t aroused enough for this.");
	}
}

//[Not Now]
//Maybe next time, Krym...
public function noSexForKrym():void
{
	clearOutput();
	showKrym();
	output("You shake your head, saying you need to rest right now. Krym tsks her tongue, but keeps smiling anyway. <i>“Fair ‘nuff. If that’s the case, I guess I’ll take the opportunity for a little meditation. Keep watch over you while you sleep.”</i>");
	output("\n\nThanking the Storm Lancer for her generosity on the matter, you head inside, followed closely by Krym, and find a closet-sized room near the back with a cot. You lock the door and bunk down for a few hours...");
	//Give PC the benefits of sleeping. When done, move to outside menu again.
	processTime(5*60+rand(30));
	sleepHeal();
	if(inCombat())
	{
		output("\n\n");
		CombatManager.genericVictory();
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Combat Loss
public function loseToThatIcyBimbo():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	clearOutput();
	showBust("KRYM_NUDE");
	author("Savin");
	output("<i>“");
	if(pc.isBimbo()) output("I, like, give up already!");
	else output("I yield, I yield!");
	output("”</i> you shout, throwing your hands in the air, staggering back from the ferocious Storm Lancer. Krym ");
	if(enemy.hasStatusEffect("Flying")) output("lands gracefully on the ice a few feet in front of you");
	else output("couches her spear under her arm");
	output(" and strides forward with a confident swagger of her hips, a smirk on her rosy lips. She grabs you by the neck and pushes you back, shoving you up against the metal wall of her home and leering at you.");

	output("\n\n<i>“Not bad, ");
	//respect:
	if(krymRespectsYou()) output("[pc.name]. You’re always a good fight, you know.");
	else output("friend. You put up a better fight than most of the furry barbarians around here, at least.");
	output(" And if there’s one thing that gets me going, it’s a strong " + pc.mf("","wo") + "man... just shy of strong enough to beat me!”</i>");
	output("\n\nThe victorious valkyrie plants her spear in the ground and closes on you, pressing herself up against you. Her perky breasts press against your [pc.chest], and a leg hooks around your [pc.hips], holding you in place for her; without another word, she thrusts her lips against yours, driving her tongue into your mouth and searching out your own.");
	output("\n\nYou knew what you were getting into, but the brazenness of her sexual assault takes you off-guard. You gasp, then moan for her, feeling her hands working around your [pc.butt], grabbing rough handfuls of ass-flesh as she tongue-fucks your mouth. The valkyrie keeps you there for a long moment, savoring your mouth until a chill wind blasting across the plateau reminds you both that you’re still outdoors, the heat of your rising lusts dampened by the pervasive cold.");
	output("\n\nKrym breaks the kiss and shoves the door open behind you, forcing you backwards with a mix of gropes and playful shoves that guide you to the largest of the rooms inside: a spartan chamber dominated by a flickering holocomputer against a wall and a messily-made bed. She");
	if(pc.isCrotchGarbed()) output(" unceremoniously rips off your [pc.lowerGarments], bearing your body for her inspection - and");
	else output(" removes the rest of your gear,");
	output(" opening you up to a whole new barrage of sensual touches, vigorous gropes, and finally, a grab of your crotch that knocks you off balance, making you teeter back and finally, sprawl back over her bed.");

	output("\n\n<i>“Now that’s what I like to see,”</i> the stormguard purrs, unhooking her gunbelt and letting it clatter to the floor with a metallic <i>thunk</i>. More slowly, her hands start working their way up her body, caressing the palmable mounds of her breasts before finding their way to her armored pauldrons. <i>“");
	if(pc.hasCock()) output("Try not a bust a nut before I’m done, kay?");
	else output("No touching yourself, now.");
	output("”</i>");

	output("\n\nKrym gives you a little wink and starts to undo her armor, disconnecting the plates locked onto the skin-tight bodysuit underneath. They drop aside one after another, revealing the soft curves and firm muscles of the Stormguard’s body, hugged tightly by her snow-white suit - tight enough that nothing is left to the imagination, from the damp spot forming between her legs to the turgid tips of her nipples jutting through the material.");

	output("\n\nShe puts on a show of things, slowly pulling down the suit’s zipper, cupping her tits and pinching her nipples as they slip out of the tight confines. When she gets it down to the end, just below her firm, flat belly, Krym turns around and thrusts her ass out at you, letting you dig your hands in the taut curves before doing the honors of baring her naked little slit, pink as a rose and beading with her mounting excitement. She leaves her rump planted squarely in your face, refusing to move until you get the idea and plant your hands on either cheek and spread them apart before leaning in and running your [pc.tongue] through the cleft between her pussylips.");

	output("\n\nYou lick up her ambrosial dew, flicking your tongue from taint to clit, swirling around her stiff little pearl and urging it out from its hood. The stoic valkyrie breaks down into a low, husky moan when you start working her button, pushing back against your face until you’re lying back on the bed and she’s crawled atop you, straddling your shoulders and sitting on your face.");

	output("\n\nOne of Krym’s hands play across your [pc.crotch], teasing the tender flesh on offer in return for your continued worship of her pussy. Her hips rock up and down, riding the [pc.tongue] thrust into her slit and moaning openly.");

	output("\n\nBut a stormy amazon like her can’t be satisfied just by owning your face...");
	processTime(30);
	pc.lust(100);
	krymCombatTrack(false);
	//[Next]//to relevant version. If the PC is a herm or a shemale, 50/50 odds between which scene they get.
	clearMenu();
	if(pc.hasCock() && (!pc.hasVagina() || rand(2) == 0 || pc.blockedVaginas() > 0)) addButton(0,"Next",hasACockLoseToKrym);
	else addButton(0,"Next",pcGonnaGetFucked);
}

//PC has a Cock Vers.
public function hasACockLoseToKrym():void
{
	clearOutput();
	showKrym(true);
	author("Savin");
	output("Not with [pc.oneCock] throbbing in her hands, so close to Krym’s lips that even in victory, she’s more than happy to lean down and give the [pc.cockHead] a lick, wrapping her lips around your cockhead and taking it down to the base. You gasp at the sudden surge of sensation, returning the favor by driving your [pc.tongue] as deep into Krym’s cunt as you can.");
	output("\n\n<i>“O-okay, [pc.name],”</i> she laughs. <i>“Don’t enjoy yourself too much. This is <b>my</b> turn.”</i>");
	output("\n\nShe gives you a wink over her shoulder, then swings a leg around and shifts down, moving to face you while straddling your [pc.hips] and stroking your [pc.cock]. She easily man-handles your manhood into the cleavage between her meaty pussy-lips. Once you’re in place, she rocks her hips for a moment, grinding your shaft against her clit and letting her juices rub off on you, getting you nice and lubed before she rises up on her knees and plants your crown against her slit.");
	output("\n\n<i>“Now the fun starts!”</i> she grins, spreading herself open with two fingers. <i>“Just lay back and try not to cum too quickly.”</i>");
	if(pc.isAss() || pc.isBro()) output("\n\nYou just growl at her. Like hell you would!");
	else output("\n\nYou clench your jaw, helpless but to try for the stormy amazon.");

	output("\n\nKrym plants her hands on your [pc.chest] and, still grinning, spears herself on your shaft. Without ever breaking eye contact with you, the sultry warrioress plants herself in your lap, taking every inch of throbbing cockflesh with nothing more than a quiet moan. Once she’s settled");
	if(pc.cocks[0].cLength() >= 16) output(", stomach bulging with the sheer mass of dickmeat she’s sitting on");
	output(", Krym bites her lip, holding back another moan with a smile, clearly just enjoying the feeling of being filled. It doesn’t take her long to get over it, and when she does, the valkyrie locks eyes with you; her gaze is filled with nothing but unbridled, hungry lust.");
	pc.cockChange();

	output("\n\n<i>“Sorry about your pelvis,”</i> she grins.");
	output("\n\nYou give her a confused look, only to find out <i>exactly</i> what she means a moment later. Krym rises on her knees and comes slamming down with crushing force, knocking the wind out of you with the sheer thunderbolt of pleasure lancing up from your [pc.cock]. You barely notice how hard she came down around how fucking <i>good</i> it felt to sheath all that cock in her slavering slit all at once. The bed creaks and squeals underneath you, sounding like a second lover taking a pounding from you... or maybe that’s your voice you’re hearing, going wild as the amazonian woman pile drives you into the bed again, and again, and again...");
	output("\n\nHowling with pleasure, Krym grabs your hands and guides them to her breasts, filling your grasp with soft, bouncing titflesh, ripe for you to play with. You tweak and tug on her teats, cupping the perky mounds while their owner rides your turgid dick. The sounds of your rutting echo thunderously through the barren shack, creating a cacophonous chorus of wet, fleshy sounds of penetration mixed with Krym’s moans and yours.");
	output("\n\n<i>“Fuck yeah!”</i> the valkyrie shouts, squeezing your hands around her tits, her smile so wide that her tongue threatens to list out at the apex of each bounce. <i>“Give it to me! Give me that fuckin’ dick!”</i>");
	if(silly) output("\n\nYou’re givin’ her all she’s got, cap’n!");
	else output("\n\nShe’s taking all you have and more already!");
	output(" For what it’s worth, you buck your [pc.hips] up to meet her falling twat, thrusting deep enough to make her shriek with pleasure, drenching your thighs and throwing her hair in wild thrashes - she’s cumming! You’re in a position to hold her steady, propping the orgasming warrior-woman up as she rides through her climax. All the extra lube from the sudden deluge just lets her go faster, gliding up and down your throbbing pole with frenzied desire.");
	output("\n\nShe’s nowhere near done by the time her frantic movements have milked out your own orgasm. You can’t do much, trapped under her driving hips, but squeeze her tits as hard as you dare and drive your dick as deep into that sweltering snatch as you can before your [pc.balls] discharge");
	if(pc.balls <= 1) output("s");
	output(" a steaming load of [pc.cum] into the sodden passage squeezing so wonderfully around your shaft.");
	output("\n\n<i>“Oh! That’s the stuff,”</i> Krym laughs, reaching down and ");
	if(pc.biggestTitSize() >= 1) output("grabbing a boob");
	else output("running her hands across your chest");
	output(". <i>“Just let it all out for me... that cum’s just more lube, [pc.name]. Haha!”</i>");

	output("\n\nShe grins down at you, and even though the wild contracts around your meat have slowed, the amazon doesn’t stop riding you. Oh, boy...");

	processTime(50);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",cumBucketsForKrym);
}

//[Cum Buckets]
//Pass 1 hour
public function cumBucketsForKrym():void
{
	clearOutput();
	showKrym(true);
	author("Savin");
	output("You’ve lost count of how many times Krym’s milked your [pc.balls], draining you dry one cumshot at a time. her thighs and slit are a sticky, cum-slathered mess, and the bed is soaked with juices and sweat. Throughout the whole affair, Krym’s refused to let your [pc.cock] go, holding you inside her with those iron pussy-muscles of hers.");
	output("\n\nBetween crushing bounces, you feel your amazonian partner cum again, squeezing your drained prick and roaring with her climax, soaking your crotch once again. This time, though, her orgasm rocks her body, making her breath come in ragged gasps. Her breasts bounce, quaking with her chest’s uneven movements, before the strength left in her mighty thighs gives out. Krym collapses on top of you, face pressing into your [pc.chest], breathing hard. Her grip on your dick finally releases, and you shudder as your abused member slides from her cunt in a deluge of musky juices that leak down her thighs and onto your [pc.leg].");
	output("\n\n<i>“Fuck! That was good,”</i> Krym manages to moan after a few seconds, catching her breath in your chest. Despite the crushing ride she just took you on, you find your arms wrapping around the naked amazon’s waist, clinging to her as you too recover from the assault. After a while, though, Krym props herself up on her elbows and grins down at you.");
	//NoRespect:
	if(!krymRespectsYou()) output("\n\n<i>“Well, that was worth my while alright. Camp’s yours: rest up, and use the beacon if you need to. Feel free to use my tits as a pillow, cuz I’m going to sleep that off.”</i>");
	else output("\n\n<i>“A pleasure as always,”</i> Krym chuckles, tracing a few kisses up your chest. <i>“Wanna stick around for a little bit? Sleeping off a fight and a fuck’s always better with someone to curl up on me.”</i>");
	output("\n\nThe valkyrie rolls off you onto her back, and you quickly take her up on her offer, resting your cheek on one of her silky-soft breasts. This time it’s her arms slipping around you; glancing up, you see Krym smiling, eyes closed. It isn’t long before you drift off, too...");
	//Pass 8 hours, give Sleep benefits. PC can use the transmitter outside for an hour afterwards if they don’t already have Respect.
	processTime(60);
	if(!pc.hasStatusEffect("Transmitter-APPROVED"))
	{
		pc.createStatusEffect("Transmitter-APPROVED");
	}
	pc.setStatusMinutes("Transmitter-APPROVED",60);
	output("\n\n");
	for(var x:int = 0; x < 10; x++)
	{
		pc.orgasm();
	}
	processTime(7*60);
	sleepHeal();
	clearMenu();
	CombatManager.genericLoss();
}

//PC Goan Get Fuq’d Vers.
public function pcGonnaGetFucked():void
{
	clearOutput();
	showKrym(true);
	author("Savin");
	
	var krymHardlight:Number = 500;
	var vIdx:int = -1;
	if(pc.hasVagina() && pc.blockedVaginas() == 0) vIdx = rand(pc.vaginas.length);
	
	output("<i>“Fuck, that’s the stuff,”</i> Krym growls, grinding her hips into your face, taking your tongue as deep as it’ll go into her pussy. <i>“Keep going, and I’ll get you nice and ready.”</i>");
	output("\n\nWhat, you’re not already doing the deed? You can’t exactly see anything, with your face full of lush, pale ass, but you can feel Krym reach off the bed and start rustling around, grabbing something off her nightstand.");
	if(vIdx < 0) 
	{
		output("\n\nSomething drops onto the bed, and then you hear a bottle being popped open. A second later and something thick and cool rubs against your [pc.asshole], smeared around by a pair of Krym’s fingers. You gasp into her twat, feeling her digits playing around your tailhole, lubing up the rim before they push into you.");
		if(pc.ass.looseness() < 3) output("\n\n<i>“Nice and tight back here!”</i> Krym chuckles slowly but surely spreading you out. <i>“I almost feel guilty for breaking this in...”</i>");
		else if(pc.ass.looseness() < 5) output("\n\nYou force yourself to relax, breathing slowly and letting Krym’s fingers move around inside you, smearing lube across your anal walls. <i>“There we go... I guess if you fight like that here on Uveto, I shouldn’t be surprised your ass knows how to take a dicking!”</i>");
		else output("\n\nKrym’s fingers all but sink into your [pc.asshole], eliciting a long, lurid moan of pleasure from you. <i>“Damn, [pc.name],”</i> Krym laughs, adding the rest of her fingers to the mix inside your lubed-up ass. <i>“Why do I feel like a frostwyrm’s been breeding this hole, huh?”</i>");

		output("\n\nAll you can do is squirm and moan, arching your back as Krym molests your asshole, filling you with lube until you feel like you’re leaking it with every shuddering breath. Only then does she pull back, seemingly satisfied. With a grin,");
	}
	output(" Krym lifts off your face and spins the");
	if(vIdx < 0) output(" other");
	output(" object on a finger, letting you take it in for a moment.");

	output("\n\nIt’s a pair of panties. Black cloth, no obvious thrill or frills, except for a tiny, almost imperceptible ring of metal objects around the waistband. She grins down at you like a hungry wolf and slips the panties on, hitching them high up her hips. Krym runs her fingers up between the lips of her pussy through the panties, moaning softly. You watch as her fingers slip around to one of the metal nodes, pressing it in. With an electric <i>whoosh</i>, a glowing orange shaft erupts from her crotch, coalescing into the shape of a canine cock, about ten inches long from knotty base to tapered tip.");
	output("\n\n<i>“Ooooh yeah,”</i> the valkyrie croons, rubbing her holographic hardon. <i>“I don’t know how women survived without these way back when...”</i>");
	output("\n\nKrym laughs and swings her legs around, turning to face you full-on, straddling your shoulders. <i>“What do you think? Ausar dick fit me?”</i>");
	output("\n\nOf course, the question was a trap. The moment you open your mouth, you get a face-full of glowing dick-light, thrusting right to the back of your throat. Krym howls a wordless thrill of pleasure, running a hand through her wild hair and using the other to hold you down while she rapes your face. You’re just a passenger on this ride now, forced to lay back and slather up her artificial tool with your [pc.tongue].");
	output("\n\nYou barely have time to get comfortable in your cock-sucking duties before Krym rears her hips back, popping her knotty hardlight cock out from your [pc.lips]. The brawny woman unceremoniously grabs your shoulders and flips you over, planting your face in her pillow and hiking your ass in the air.");
	if(vIdx < 0) output("\n\n<i>“This is where I say ‘bite the pillow,’ right?”</i> she laughs, slapping your [pc.butt].");
	else output("\n\n<i>“Spread ‘em wide for me, Steele!”</i> she orders, digging her fingers into your [pc.butt].");
	output(" You reach back and spread your cheeks, showing off your [pc.vagOrAss " + vIdx + "] to the horny stormguard. You pretty much immediately feel the slender crown of her strapon pressing against your entrance, teasing the ");
	if(vIdx < 0) output("rim");
	else output("lips");
	output(" with a vaguely electric sensation before Krym just plunges in.");
	
	if(vIdx < 0) pc.cuntChange(vIdx, krymHardlight);
	else pc.buttChange(krymHardlight);

	output("\n\nShe’s not gentle, and she doesn’t go easy on you. The first thrust takes her hardlight rod knot-deep in your [pc.vagOrAss " + vIdx + "]; the second has you moaning, gasping into the pillow as the valkyrie mercilessly hammers you. Every time you almost get used to her, she changes up the pace, delivers a harsh spank to your [pc.butt], or reaches forward to grab and grope your [pc.nipples].");
	if(pc.hasTailCock()) 
	{
		output(" Even ");
		if(pc.tailCount > 1) output("one of your tailcocks");
		else output("your tailcock");
		output(" gets some attention. Krym grabs it while it sways behind you, guiding the shaft into her mouth. A shock of pleasure worms its way through your wriggling [pc.tail] as you feel her tongue wrap around your shaft, suckling on its cumslit.");
	}
	else if(pc.hasTailCunt()) output(" You feel a shuddering pleasure in your tail-cunt, prompting you to glance over your shoulder. Krym’s wrapped her fingers around your tail, holding in steady while she digs into your drooling pussy.");

	output("\n\nKrym has you moaning like a whore before you know it. Your body bucks forward with every hammer-blow of her broad hips, sending your ass-flesh aquiver. The hardlight shaft spearing your [pc.vagOrAss " + vIdx + "] open seems to throb, pulsing with energy that feels like electric currents running through your ");
	if(vIdx >= 0) output("vaginal");
	else output("anal");
	output(" muscles, making every hair stand on end - and overwhelming you with shocks of pleasure.");

	if(pc.hasCock()) output("\n\nOne of those shocks finds your anal pleasure-buzzer, and your [pc.cock] stiffens painfully, swelling with an urgent need. You barely realize when that sesation bubbles over, and [pc.cum] squirts from your [pc.cockHead] and onto Krym’s bed, soaking her sheets. Krym roars with laughter and slaps your ass, continuing to piston her hips; she doesn’t relent even after your load has leaked out in its entirety, and your cock is going limp.");
	else output("\n\nBy the way she’s howling back there, Krym’s having an even better time than you are. Her hands slap and grope your [pc.butt], making your [pc.vagOrAss " + vIdx + "] squirm around the quickly-thrusting length of her hardlight strapon. The impacts of her hips on your jiggling rear push you down, crushing you against the bed; her tits press into your back, and her mouth is brought close enough to nibble on your [pc.ear]. Her breath comes hot and husky, moaning into your ear that’s she’s cumming; that you’re a good cocksleeve, and to hold on tight.");

	output("\n\nKrym’s orgasm comes down like a hammer, making her growl like a bear and clutch at your [pc.chest], pulling you tight against her. The turgid knot at the base of her hardlight rod presses urgently against your [pc.vagOrAss " + vIdx + "], stretching you wide and lodging itself in your ");
	if(vIdx < 0) output("spasming rim");
	else output("drooling lips");
	output(". Her fingers rake your [pc.skinFurScales], refusing to let you go until she’s ridden out her climax, and thoroughly tied you like her own personal bitch.");

	output("\n\n<i>“You’d better get comfortable,”</i> she murmurs, running a hand ");
	if(pc.hasHair()) output("through your hair");
	else output("along your cheek");
	output(". <i>“I’ve got this thing on a release timer...”</i>");

	output("\n\nThere’s not much you can do other than pull her pillow under your head and settle in, letting the horny viking-babe drift off to sleep still mounting you...");
	//Pass 8 hours, give Sleep benefits. PC can use the transmitter outside for an hour afterwards if they don’t already have Respect.
	processTime(60);
	pc.orgasm();
	sleepHeal();
	processTime(7*60);
	if(!pc.hasStatusEffect("Transmitter-APPROVED"))
	{
		pc.createStatusEffect("Transmitter-APPROVED");
	}
	pc.setStatusMinutes("Transmitter-APPROVED",60);
	clearMenu();
	output("\n\n");
	CombatManager.genericLoss();
}

//Combat Victory
//I coulda sworn I wrote this but oh well I guess not.
public function combatVictoryWithKrymm():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	clearOutput();
	showBust("KRYM");
	author("Savin");
	
	output("The valkyrie staggers back, ");
	if(enemy.HP() <= 1) output("groaning in pain");
	else output("panting with lust");
	output(". Her weapons <i>thud</i> into the snow at her feet, and Krym looks up at you with ");
	//has respect:
	if(krymRespectsYou()) output("the respect due to her better. <i>“Damn it,”</i> she sighs, <i>“I’ll get stronger someday... somehow. In the meantime, I guess you’ve won again. So what’ll it be, Steele?”</i>");
	else output("surprise. <i>“I... damn it! Damn it all, how did I let this happen!? You win, Steele... so what are you gonna do about it?”</i>");
	output("\n\n");

	krymCombatTrack(true);
	clearMenu();
	if(pc.lust() >= 33)
	{
		if((!pc.hasCock() || pc.cockThatFits(krymhilde.analCapacity()) < 0) && (!pc.hasHardLightEquipped() && !pc.hasCock()) && (!pc.hasVagina() || pc.blockedVaginas() >= pc.totalVaginas())) addDisabledButton(0,"Fuck Her","Fuck Her","You need to have a penis or hardlight strap-on, or an unblocked vagina, in order to fuck her.");
		else addButton(0,"Fuck Her",fuckKrym,undefined,"Fuck Her","Take Krym up on her offer and bed the stormy valkyrie.");
	}
	else addDisabledButton(0,"Fuck Her","Fuck Her","You aren’t aroused enough for this.");

	addButton(1,"Rest",restOfKrym,undefined,"Rest","Take a rest in the safety of Krym’s camp.");
	addButton(2,"Use Beacon",useUvetoBeacon,undefined,"Use Beacon","Ask Krym if you can use the Taxi beacon.");
	addButton(14,"Leave",CombatManager.genericVictory);
}
//Go to [Fuck Krym] option, above.

//[Fuck Krym]
//Take Krym up on her offer and bed the stormy valkyrie.
public function fuckKrym():void
{
	clearOutput();
	showKrym(true);
	output("Rather than answer, you " + pc.mf("saunter","sashay") + " up to the valkyrie and grab her by the waist, pulling her against yourself. She grins, putting her hands on your [pc.chest] and leaning ");
	if(pc.tallness >= krymhilde.tallness + 5) output("up");
	else output("down");
	output(" to snatch a kiss. <i>“Good an excuse as any to get out of this damn cold. Why don’t we head back to my place...”</i>");

	output("\n\nYou give her a pop on the ass and let Krym lead you inside. She takes you to the largest of the rooms inside, a spartan affair dominated by a holoscreen desk and a large, messily-made bed. Krym gives you a sultry wink over her shoulder once the door’s closed behind you, and her hands are quickly pulling off the armor plates hugging her shapely curves. When she turns back to you, slipping back onto the bed with legs spread, she’s in nothing but her skin-tight white bodysuit, zipped down all the way to the belly. Perky, palmable cleavage slips out when you yank her suit down around her waist, pushing her back on the bed and running your [pc.tongue] across her pebbly teats, tracing kisses up her neck until you’re on top of her, pinning her to the bed and thrusting your tongue into her mouth. Krym moans, wrapping her legs around your [pc.hips].");
	output("\n\n<i>“Easy tiger,”</i> she moans, arching her back into your nibbles and gropes. Krym wiggles out of her suit, kicking it off onto the wall nearby and starting to work on your gear. When you’re bare, your lover gets her hands around your shoulders and flips you, landing on her knees straddling your waist.");
	output("\n\n<i>“You’ve seen how Stormguard fight. Now let me show you how we fuck!”</i>");

	//Scene options.
	clearMenu();
	if(pc.hasCock() && pc.cockThatFits(krymhilde.analCapacity()) >= 0) addButton(0,"Buttfuck",consensualKrymButtfuck,undefined,"Buttfuck","Stick your dick in the haughty valkyrie’s butt.");
	else if(pc.hasCock()) addDisabledButton(0,"Buttfuck","Buttfuck","You’re too big to fit in her heiny.");
	else addDisabledButton(0,"Buttfuck","Buttfuck","You need a penis to fuck her heiny with.");

	if(pc.hasHardLightEquipped() || pc.hasCock()) addButton(1,"Pitch Vaginal",pitchVagimalKrym,undefined,"Pitch Vaginal","Take Krym to pound town.");
	else if(pc.hasCock()) addDisabledButton(1,"Pitch Vaginal","Pitch Vaginal","Your dick is way too fat to fit in there.");
	else addDisabledButton(1,"Pitch Vaginal","Pitch Vaginal","You need a penis or hardlight strap-on to give her pussy the pounding it so righteously deserves.");
	
	if(pc.hasVagina() && pc.blockedVaginas() < pc.totalVaginas()) addButton(2,"Tribbing",consensualTribbingWithKrym,undefined,"Tribbing","Get down and dirty with Krym and rub pussies.");
	else if(pc.blockedVaginas() > 0) addDisabledButton(2,"Tribbing","Tribbing","You might want to get rid of whatever is blocking up your vagina before you do this.");
	else addDisabledButton(2,"Tribbing","Tribbing","You need a vagina for this.");
}

//Consensual: Buttfuck Krym
//Stick your dick in the haughty valkyrie’s butt.
//Written by SomeKindofWizard
//Reqs pc.cockThatFits(krymhilde.vaginalCapacity(0)) >= 0
public function consensualKrymButtfuck():void
{
	clearOutput();
	showKrym(true);
	var x:int = pc.cockThatFits(krymhilde.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	author("SomeKindofWizard");
	output("<i>“Mnf-going exploring back there are you?”</i> Your hands slide down from her delightful hips, to the voluptuous curves of her callipygean bootie. It doesn’t seem so much exploring as a full adventure, you can barely wrap your [pc.arms] around her at the waist. She smirks and bounces atop you, and soon the heat of her sultry snatch is pressing down hard against your ");
	if(pc.hasCock()) output("[pc.cocks].");
	else output("[pc.abdomen].");
	output("\n\nShe lowers herself down, all but mashing her perky tits into your face while you grasp and knead at seemingly-endless assflesh.");

	//If PC has a cock/cocks
	output("\n\nThe force of her moist cunt pressing down on your [pc.cocks] is enough to work pre out of you. Not that she seems to be bothered by this, it only adds to the slickness spreading across your lower half. By this point, your finger has found its way to the innocent winking ring of Krym’s rear. Her breath hitches, and her fingers dig into your [pc.chest]. For a moment you’re afraid she’s about to do you some harm, but her body finally relents, and your finger gains entry.");
	output("\n\n<i>“Sh-shit, I’ll never get used to that...”</i> her boisterous voice seems rather more subdued as your finger goes exploring around the tender walls of her ass. ");
	if(pc.tailCount > 0) output("Your [pc.tail] sets to wagging");
	else output("Your muscles tense up");
	output(" when she begins moving properly. She releases her leg’s deathgrip around your [pc.hips] and flips around on you. The world goes dark beneath cunt and ass, and the scent of horny female is pressed up against your [pc.face].");

	output("\n\nShe wiggles herself insistently, making a soaking mess of you while she makes herself busy toying with your [pc.cock " + x + "]. Her hand wraps around your aching boner, teasing every sensitive little nerve-ending she can find. Before you can get too distracted by her surprisingly tender ministrations, she jiggles her ass in your face. Your [pc.tongue] rolls out, treated to surprisingly sweet fem-lube. Her cunny tightens around your tongue and delivers another squirt, forcing you to lap at her hungrily or risk sexual drowning.");
	output("\n\nA little moan of disappointment escapes you when her hips raise away from your face... it becomes obvious why when you hear the soft <i>“Aaahn~”</i>.");
	output("\n\n...And then you’re enveloped in wetness and heat. She sucks and slurps noisily on your [pc.cock " + x + "], ");
	if(pc.balls > 0) output("hands busying themselves with your balls");
	else output("fingers digging into your thighs for purchase");
	output(". She groans and moans her way down your length, until the head of your cock is being massaged by the depths of her throat. The peristaltic motions beg your body for more, and soon you’re hard enough to physically hurt with the need to fuck. She slides off of your dick with a long moan, sending pleasant reverberations deep into the root of you.");
	output("\n\n<i>“Now then, I daresay that’s enough foreplay right there.”</i>");
	output("\n\nSeriously? Things had only been getting started! You lift your ");
	if(!pc.isNaga()) output("[pc.legs] up and stretch until you can wrap them around behind Krym’s head");
	else output("naga-tail up and wrap them around Krym’s shoulders");
	output(". She yelps in surprise and you use the time with her mouth open to bring her back down. She chuckles and relents, giving the [pc.cockHead " + x + "] of your [pc.cock " + x + "] another lick. At the same time she settles her hips back down again.");
	output("\n\nOnly fair, you suppose, digging back into her with gusto. It doesn’t take long for you to find those little spots that have her moaning and groaning in ecstasy. The sensation of cumming seems to be fast on the heels of her resumed blowjob, and a familiar churning in your ");
	if(pc.balls >= 1) output("[pc.balls]");
	else output("prostate");
	output(" announces your approach to the edge– an edge you’re all too happy to go tumbling over. You wrap your lips around the sensitive little pleasure-buzzer of her clitty as you let go of your restraint.");
	output("\n\nKrym is too distracted by the sensations of her clit being toyed with to do pull away. Moments later and you cum hard enough to cause her cheeks to bulge. She coughs in surprise, eyes widening. Instead of rise up though, she mashes her pussy harder into your face, and you can hear slow gulping as she drinks down your ");
	if(pc.cumQ() < 1000) output("modest");
	else output("incredible load");
	output(".");

	//if you have nuki-balls:
	if(pc.cumQ() >= 3000)
	{
		output("\n\nDespite the gusto with which she tries to consume your liquid load, your endless reserves finally overwhelm her, and she has to sit up, gasping for air and holding a slightly-too-full-stomach.");
	}

	output("\n\nThe relief was so much that you didn’t even notice her getting off, but the sticky-sweet coating of femcum around your chops is evidence enough of her cumming in the act. She sighs softly before turning around on top of you again, re-wrapping her legs around your [pc.hips] and giving them a fond squeeze. <i>“Well, that was a bit of a surprise... but I sure hope you’ve got another load in you...”</i> She reaches behind herself and grips at your cock, giving a cheshire-cat grin at your continued hardness.");
	output("\n\nGood [pc.boyGirl], or I’d be sorely annoyed with you for pulling that stunt.");
	if(pc.isNice()) output("\n\nYou give her a bashful apology, clearing your throat.");
	else if(pc.isMischievous()) output("\n\nYou smirk knowingly at her, licking your lips of femcum. Surely she enjoyed it really?");
	else output("\n\nThat slut knows she enjoyed it really...");
	output(" With some amount of insistence, you shake your hips. It has the side-effect of fucking your cock through her hand’s grasp, and she coo’s in excitement, wiggling her own hips back.");

	output("\n\nYou take hold of those wonderful flanks of hers and lift, guiding her up. She takes a hold of your cock and lines it up with her winking ring. <i>“Damn you for having a little root-around in my ass, I just have to know how you feel in there...”</i> She lowers herself down with painful slowness, and the heat of her insides is so great you’re sure you wouldn’t be able to feel the cold of Uveto if you’d decided to fuck outdoors. Kyrm’s eyes grow half-lidded and heady with lust as her body slowly yields to you. It’s a good thing she’d been such an attentive cock-shiner in the end– she’s so tight you’re afraid you’d hurt something taking her otherwise.");
	pc.cockChange();
	output("\n\nStill, she stubbornly spears herself onto your [pc.cock " + x + "], desperate to feel you stretching her ass to its limits. She whimpers and pauses, free hand going to her cunt. She spreads her lips and you can actually see the muscles work before she’s squirting like a fountain onto your bare chest.");
	if(pc.hasFur()) output(" You suppose it’s worth the matted fur...");
	output(" <i>“Oh fuck, oh stars you’re so damned <i>big</i>!”</i>");

	output("\n\nIt might actually just be that she’s so sinfully tight. Still her second orgasm seems to do wonders for relaxing her muscles, though their grip has become more spasmodic. Random aftershocks of her pleasure seem to work hard enough on your bone to nearly force it back out of her. Growing tired of her slow descent (and by this point near-mad with need), you pull yourself up. The poor overstimulated girl yelps in surprise, flopped onto her back. You wrap your arms around her legs and hold onto them for dear life");
	if(pc.biggestTitSize() >= 1) output(", squeezing your [pc.breasts] with them a little for good measure");
	output(".");

	output("\n\n<i>“Hah~ You animal!”</i>");
	//silly-mode:
	if(silly)
	{
		//if alien:
		if(InCollection(pc.race(),["ausar","half-ausar","kaithrit","kui-tan","half-kaithrit","half kui-tan"]) || pc.hasFur() || pc.hasScales()) output("\n\nYou’re fairly sure that’s racist...");
		else output("\n\nGood thing you’re not an Ausar or something, that would totally be inappropes...");
	}

	if(pc.hasKnot(x)) output("\n\nHer breathing stops in time with yours as you can finally feel what you’ve been waiting for; the knot. She whimpers as her asshole is pushed to its absolute limits, until all at once it gives, permitting you entry. It’s impossible to pull back out, relegating you to short sharp thrusts, but that’s hardly an issue.");
	output("\n\nPanting with the effort of holding back the approaching tide, you lay into her wonderful ass with abandon. Her groans and gasps turn into outright cries of delight, and she noisily frigs herself while you ravage her ass until it’s quivering. Spanking her only serves to make her clench tightly around you, turning her battered back-end from a sloppy box to a sinful vice. You’re almost pushed entirely out of her with one last hard spank before she goes completely limp with pleasure.");
	output("\n\nFemcum flows freely between her fingers, and her ass swallows you up. Releasing her legs, you lean down");
	if(pc.biggestTitSize() >= 1) output(" until your own [pc.breasts] are pressed up against Krym’s perky c-cups");
	else output(" until your flat-chest is pressing down against Krym’s perky c-cups");
	output(". Her heart is beating loudly enough to be felt between gasps for air, and your entire body lets go. You flood her bowels with potent [pc.cumNoun], somehow finding reserves that put your previous orgasm to utter shame.");

	output("\n\nThe feeling of your seed rushing into her seems to be all it takes to quench the fires of her lust. She wraps her arms around you tightly, mashing your face into her neck as she cools down. Still the milking feeling of her ass doesn’t cease, going from helpless orgasm-driven clenches, to a slow milking that gradually coaxes the last of your cum from ");
	if(pc.balls > 0)
	{
		output("overtaxed ball");
		if(pc.balls > 1) output("s");
	}
	else output("an overtaxed prostate");
	output(".");

	//If Knotted-cock: 
	if(pc.hasKnot(x)) output(" Well, your knot isn’t deflating anytime soon. Instead you just revel in the slow massage of her body around your dick.");

	output("\n\nShe licks her lips, releasing her death grip on you once she’s found her voice. <i>“Okay [pc.name], that was damned good fun... but I’m going to be feeling this for a while...”</i>");
	if(pc.cumQ() >= 2000) output(" she squirms a little bit, still speared on you. <i>“I’m fairly sure your cum’s roiling around my stomach... and not just from our little starter.”</i>");
	output(" Her hands are surprisingly tender, running down your back – it’s then that you realize her nails have done a bit of a number on you, and she traces sensitive lines.");

	output("\n\n<i>“Damn, good thing you’re made of tough stuff. Any harder and you’d make a total bloody mess of everything.”</i> She pauses and looks down at her cum-drenched body. <i>“More literally, I mean, this is absolutely a mess. But it’s the good kind of mess...”</i>");
	output("\n\nHer speech takes on a wistful rambling quality, and she wiggles her hips. <i>“I’m going to smell of sex for ages...”</i> Krym gives you a kiss along the jaw, smirking when you");
	if(InCollection(pc.earType, [GLOBAL.TYPE_CANINE,GLOBAL.TYPE_KUITAN,GLOBAL.TYPE_FELINE,GLOBAL.TYPE_EQUINE,GLOBAL.TYPE_BOVINE])) output("r [pc.ears] twitch");
	else output(" fidget");
	output(".");

	processTime(15);
	krymhilde.loadInAss(pc);
	pc.orgasm();
	processTime(20);
	krymhilde.loadInAss(pc);
	pc.orgasm();
	if(inCombat()) 
	{
		output("\n\n");
		CombatManager.genericVictory();
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Consensual: Pitch Vaginal
//Take Krym to pound town.
//aka Powerbottom Valkyrie Action 2017. Needs dick or strapon.
//Reqs: pc.cockThatFits(krymhilde.vaginalCapacity(0) * 1.5) >= 0 || strapon
public function pitchVagimalKrym():void
{
	clearOutput();
	showKrym(true);
	author("Savin");

	var x:int = pc.cockThatFits(krymhilde.vaginalCapacity(0)*1.5);
	if(x == -1 && !pc.hasHardLightEquipped()) x = pc.smallestCockIndex();
	if(pc.hasCock())
	{
		output("Krym reaches down and traces her fingers along the underside of your [pc.cock], pushing it down against your [pc.belly]. She chews her lip and smiles, brushing her thumb up and down your length, as far as it’ll go. Every little motion sends shudders of pleasure echoing through your body, until your [pc.chest] is heaving.");
	}
	else 
	{
		output("Krym reaches down and finds the switch on your panties, the only thing you’re still wearing, and thumbs it on.");
		output("\n\n<i>“Glad to see I’m not the only bitch on this iceball that likes her high-tech dongs,”</i> Krym grins, letting your hardlight erection erupt into existence... right into her waiting hand. You can’t help but shiver at the sudden rush of sensation, feeling Krym rub your hardlight hardon, pushing it down against your [pc.belly].");
	}
	output("\n\nThe valkyrie shifts forward on her hips, planting her pussy right on the base of your [pc.cockOrStrapon " + x + "]. She’s sweltering hot - a sweet relief from the oppressive cold you’ve been subjected to since landing on Uveto, spreading up the length of your shaft. Krym leaves a trail of wet excitement in her wake, slickening your shaft - and giving herself a taste of the pleasure she’s giving you. Your stormy lover moans, cupping one of her perky breasts as her hips start to move faster along your length, grinding back and forth until she’s moaning and laughing. Your hands naturally migrate towards her hips: her broad flanks have plenty of room to spare, and lead you towards one of the few places on her body sporting a nice bit of softness for you to dig into.");
	if(pc.hasCock()) pc.cockChange();
	output("\n\nKrym grins when your fingers sink into her rump, and you feel her pussy flex around your ");
	if(x == -1) output("glowing tip");
	else output("[pc.cockHead " + x + "]");
	output(", smearing her approval all over your crown. The valkyrie’s butt is sinfully soft, practically swallowing your fingers into the jiggling, plump swells bouncing behind her with every thrust. At the apex of one such motion, you leverage your grip and lift Krym up - just enough for your [pc.cockOrStrapon " + x + "] to lift up off your [pc.belly] and press its crown between her pussylips.");
	output("\n\n<i>“Okay, okay, main course time,”</i> Krym laughs, planting her hands on your [pc.chest] and slowly sinking down your length. Your cock goes from being slathered in her wetness to drowning in it, surrounded on all sides by a roiling sea of clenching cunt-flesh. Your lover groans, throwing her head back with wild ecstasy; her breasts bounce hypnotically as she settles into your lap, taking ");
	if(x == -1 || pc.cockVolume(x) < krymhilde.vaginalCapacity(0)) output("the full length of your cock");
	else output("as much cock as she comfortably can");
	output(".");

	output("\n\nThe stormguard makes the fatal mistake of pausing to catch her breath, panting with lust as your [pc.cockOrStrapon " + x + "] throbs inside her. You flash her a cocky grin and tighten your grip on her rear, pushing up and over. Krym gasps, clenching hard around your shaft as you barrel her over, throwing her down on the bed and pinning her beneath you. Her legs curl up behind you, hips squeezing your flanks and ankles locking behind your [pc.butt].");
	output("\n\n<i>“Fuck!”</i> she growls, clawing at your back. <i>“Dammit, I’m supposed to be on top!”</i>");
	if(inCombat()) output("\n\n<i>“Losers don’t top,”</i> you answer, grabbing one of her tits and squeezing it hard enough to make her cry out.");
	else output("\n\n<i>“Not today,”</i> you tell her, grabbing her tits in both hands and squeezing hand enough to make her squeal.");

	output("\n\nShe just laughs, turning into a husky moan as you start to push your [pc.hips] against her. <i>“Dammit!”</i>");

	output("\n\nYou know she loves it - and a few thrusts later, she’s not afraid to show it. Krym howls with pleasure with every thrust, fingers clutching at your bare, sweaty muscles while you pound her - and she all but <i>begs</i> for that pounding, shouting for you to fuck her harder, faster, any time you even think about slowing down. There’s no time to catch your breath with this girl! Even her pussy clings to you, making it an exquisite effort to pull yourself out of her... and blindingly pleasurable when you hammer back home, filling her with your [pc.cockOrStrapon " + x + "].");
	output("\n\n<i>“Oh gods. Yeah! Right there!”</i> Krym groans, throwing her head back and thrusting a hand between her legs, molesting her stiff clitty to the beat of your thrusts. You can feel her climax coming a moment later, heralded by squirts of female lust leaking around your cock and wild clenches of her cunny. It feels as though your [pc.cockOrStrapon " + x + "] is drowning in her juices, bathed in a musky sea of femcum while her screams echo off the metal walls. It’s a symphony of sexual sounds all around you: flesh slapping flesh, wet slicks of her juices being fucked out by your dick, and both your voices mixing in a chorus of moans.");
	output("\n\nWhen she’s done, the valkyrie falls back on the bed, chest heaving. Your hands are still on her tits, rising and falling with her unsteady breath. She smiles up at you, a mix of lust and fatigue on her lips, and her legs relax their death-grip on your [pc.hips]. You use that moment like a boost of momentum, pulling your [pc.cockOrStrapon " + x + "] out from the sweltering slit between her legs and lunging forward, thrusting it right between her lips.");
	output("\n\nKrym grunts as her mouth is suddenly and violently battered open, but that fades away when she starts tasting herself all over your shaft. Her hands grab your [pc.butt] and hold you steady while she sucks, bobbing her head up and down your shaft. Those plush lips of hers are just as loving as her twat’s, sucking your cock hard until you’re gasping and throbbing, ready to pop.");
	
	if(pc.hasCock()) output("\n\nClimax comes with a jolt of anal shock. A finger thrusts into your [pc.asshole], pressing against your prostate with amazonian strength.");
	else output("\n\nHer sucking skills are as practiced as her fighting, and she’s got you on the edge in seconds.");
	if(x != -1) output(" Your dick grows tight in her lips, turgid with liquid seed, and erupts into her throat.");
	if(x != -1 && pc.cumQ() >= 2000) output(" Cum immediately spurts back around your shaft, and even out of her nose, as the unsuspecting valkyrie is exposed to the monstrous volume of your load.");
	else output(" Krym grins up at you around her mouthful of dick, or at least as much as she can");
	if(x != -1) output(", while your throbbing dick deposits its load in her stomach");
	output(".");
	output("\n\n<i>“Oh, fuck!”</i> Krym laughs");
	if(x != -1) output(", coughing up a glob of cum onto her tits and");
	output(" pushing herself up onto her elbows. <i>“That was good. Real good! Gods, my heart is pounding still.”</i>");
	output("\n\nShe plants a kiss on your cockhead and flops back, wrapping her arms under her head. You grab a towel and start to clean up while Krym lounges");
	if(x != -1) output(", licking her lips clean of your seed");
	output(".");
	output("\n\n<i>“Hope you’re planning on staying on Uveto for a long time, [pc.name],”</i> she murmurs. Wearily, the valkyrie pulls herself up and takes the towel from your hands. She starts to clean you, slowly and gently wiping clean your loins");
	if(x != -1) output(", until nothing’s left but the faint outline of her lips on your crown. That, she leaves alone");
	output(". <i>“It isn’t everyday a fuck like you comes along...”</i>");
	output("\n\nIs that the only reason, you wonder.");

	if(x >= 0) krymhilde.loadInMouth(pc);
	pc.orgasm();

	if(inCombat())
	{
		output("\n\n");
		CombatManager.genericVictory();
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Consensual: Tribbing
//Get down and dirty with Krym and rub pussies.
//Reqs: Pussay!
public function consensualTribbingWithKrym():void
{
	clearOutput();
	showKrym(true);
	author("Savin");
	var x:int = rand(pc.totalVaginas());
	output("While Krym is busy straddling you, cupping her breasts and rubbing her steamy quim against your [pc.belly], you reach back and pull open one of the drawers on her nightstand. With your chest stretched out and attention wandering, Krym takes the opportunity to grab your [pc.nipples], leaning in to run her tongue across your [pc.chest]. Blindly groping around inside the drawer, your fingers eventually close around something thick and covered in rounded nubs of what feels like latex. What you end up pulling out is a long, floppy blue dildo, about the length of your forearm.");
	output("\n\n<i>“Ohh, one of my favorites,”</i> Krym grins, running a hand down the waggling length you present to her. <i>“This has kept a girl company on many a lonely night.”</i>");
	output("\n\nNo doubt. You take the nubby dildo and trace its rounded head between your [pc.breasts], down your [pc.belly] and between your [pc.legs]. The shaft spreads your [pc.cunt]’s lips, rubbing between your folds with all its wonderful little nubs, drawing a moan out from deep within your chest.");
	output("\n\n<i>“And what am I supposed to do while you have fun?”</i> Krym mock-pouts, teasing her nipples. You’ve got some ideas about that... You grab Krym by the pussy, sinking two fingers into her juicy slit and pushing her up off your lap. She gasps and moans, rising up on her knees for you while you slide the ribbed dildo between your lips. When you’ve got it right where you want it, you guide the valkyrie back down, pressing her twat against the other side of the shaft. There’s a radiant warmth pouring off of Krym’s sex to yours, and your lower lips manage to touch around the nub-ringed dildo.");
	output("\n\n<i>“That works,”</i> Krym grins, leaning down to kiss you. Her hips move while she makes out with you, grinding up and down the dildo - and making it shift between your labia with every motion. Oh, that feels nice! You join her in the act, bucking your hips against her while the valkyrie’s lips find your [pc.nipples] and neck; your arms wrap around her back, holding her close enough that her swaying breasts press against your [pc.chest]. The feeling of her tense, sweat-slicked muscles against your [pc.skinFurScales] only adds to the effect of being ridden by the sultry stormguard.");
	output("\n\nThe dildo ends up smushed between your lips and Krym’s, rubbing its nubs against your inner folds and the underside of your clit, grinding back and forth with the valkyrie’s hips. Wet excitement trickles down around its girth, mixing with your own juices into a musky lake of lubrication. Between the two of your sodden quims, it isn’t long before your flesh glides slickly against each other.");
	if(pc.wetness(x) >= 4) output("\n\n<i>“Damn, you’re drenching my bed!”</i> Krym laughs. <i>“You’re worse than the huskar science-sluts that come ‘round from Irestead. Starting to feel a little jealous, really...”</i>");
	else if(pc.wetness(x) >= 2) output("\n\n<i>“We’re making such a mess!”</i> Krym laughs, running her hand across the sheets under your [pc.butt]. <i>“But <b>fuck</b> it feels good!”</i>");
	else output("\n\n<i>“You not getting off to this?”</i> Krym teases, tweaking the crown of the dildo, pushing it down against your [pc.clit]. <i>“Your half’s dry as a bone... at least compared to mine. Or maybe I’m just spoiled by all the ausar bitches from Irestead. Maybe I just need to come down there and loosen things up,”</i> she adds, spreading two fingers around her lips and sticking her tongue out at you. Now that’s a tempting offer...");
	output("\n\nRather than answer her teases, you wrap your arms around Krym’s shoulders and bring her in close, locking lips with her for a good long while. She thrusts against you, keeping up the steady grind of pleasure while you make out, sparring with your tongues now rather than blades and guns. At some point during the tangle, Krym’s hands find their way to your [pc.butt], and you’re rolled on top, staring down at your lover. She twists around so that, rather than riding one another, you’re spread out on the bed, connected at the crotches by the dildo pinned between you. Krym’s legs maneuver the dildo side to side, rubbing it against your [pc.clit] until you’re moaning, breath catching in your chest with every jagged motion of the shaft. From her new angle, the valkyrie’s able to move faster than before, putting more pressure on your [pc.cunt].");
	output("\n\nNow you’re starting to feel that sweet, sweet rise of orgasm building up, ready to overflow across your entire body.");
	if(pc.hasCock()) 
	{
		output(" Before you can try and gain control of yourself, your [pc.cocks] swell");
		if(pc.cockTotal() == 1) output("s and then squirts");
		else output(" and then squirt");
		output(", spraying a thick wad of [pc.cum] across your [pc.belly]. Krym laughs, but her voice breaks into an shriek of pleasure as your cunt presses her toy back against her, driving her towards her own climax.");
	}
	else output(" Krym isn’t far behind you, starting to gasp and shudder with shocks of pleasure drawn out by your lustful motions.");
	output(" The two of you work for each other’s pleasure, trying to bring the other woman to climax first.");

	output("\n\nWith both of you working tirelessly, you end up cumming together, both throwing back your heads and crying out with pleasure as the ribbed cock between you finally brings you over the edge. Your bodies tangle and convulse, locked in the throes of orgasm, voices echoing from the walls of Krym’s bunk until all the energy has been drained from you, and both you and the horny viking-girl fall back onto the bed, gasping for breath.");
	output("\n\n<i>“Whew!”</i> Krym smiles, flopping back against the footboard of the bed. <i>“Well, that’s a whole new use for my favorite toy. Damn, I can’t feel my legs... haha!”</i>");
	output("\n\nYou grin over at her and lay back, letting the pillows swallow you up...");
	processTime(45);
	pc.orgasm();
	if(inCombat())
	{
		output("\n\n");
		CombatManager.genericVictory();
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}