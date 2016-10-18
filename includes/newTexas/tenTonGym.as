//The Ten Ton Gym (ver. 1.2)
//- Slab Bulkhead
//Overview
//A gym on New Texas, complete with weight room, swimming pool, track, locker room, and showers. The owner and manager, <i>“Ten-Ton”</i> Quenton Jones, is here to help you look your best. The purpose is to provide a place for PCs to adjust their muscle tone and body thickness.

//Room Descriptions
/*
output("\n\nAdded to New Texas west of the Stables");
output("\n\n");

output("\n\n[Add directional into gym]");
*/

public function showQuenton(nude:Boolean = false):void
{
	showName("\nQUENTON");
	if(!nude) showBust("QUENTON");
	else showBust("QUENTON_NUDE");
}

//Entrance
public function gymEntranceBonus():Boolean
{
	clearOutput();
	author("Slab Bulkhead");
	showName("TEN\nTON GYM");
	output("The gym’s entry room is simple and spartan, with almost half of it taken up by an enormous desk made from plate glass propped on top of some welded-together bars from weight machines. A small computer terminal sits atop the desk. Photos adorn the walls, all local bulls and cows, flexing and posing to show off their musculature and tone.");
	output("\n\nThe bull behind the desk is a remarkably toned example of his kind, with every muscle defined to the point that he could probably find work posing for anatomy textbooks. He’s clad in a white tank top with the gym’s logo on the front and blue workout pants made of some smooth material. His brown hair is buzzed short around a pair of stubby white horns.");
	output("\n\nA gated doorway just past the desk leads into the weight room, while a gated hallway on the back wall leads into the rest of the gym. There’s also a closed door marked ‘Office’.");
	if(flags["MET_QUENTON"] == undefined)
	{
		output("\n\nThe bull gives you a giant grin as you walk in. <i>“How do, friend? Welcome to The Ten Ton Gym. I’m Quenton, owner of this place. Folks ‘round here call me Ten-Ton Quenton.”</i> He chuckles. <i>“I betcha I can getcha looking better than you ever dreamed. Whatcha say?”</i>");
	}
	else if(!pc.hasKeyItem("Ten Ton Gym Membership") && !pc.hasStatusEffect("Gym Pass")) output("\n\nUpon seeing you walk in, Quenton’s familiar grin lights up his face. <i>“How do, friend? Good to see you back. Here for a workout?”</i>");
	//Has gym membership: 
	else output("\n\nQuenton grins and waves to you as you walk inside. <i>“How do, [pc.name]? Good to see you back. Enjoy your workout.”</i>");

	//[Quenton] Go to Talk to Quenton
	//[To Hallway]{locked if PC doesn’t have membership}
	//[To Weight Room]{locked if PC doesn’t have membership}
	addButton(0,"Quenton",talkToQuenton,undefined,"Quenton","Have a chat with the muscly bull.");
	return false;
}

public function passDetector():Boolean
{
	if(!pc.hasKeyItem("Ten Ton Gym Membership") && !pc.hasStatusEffect("Gym Pass"))
	{
		clearOutput();
		showName("NONE\nSHALL PASS");
		output("A strong arm bars your progress. <i>“Whoah! Sorry, but ya got ta have a pass to use the facilities.”</i>");
		currentLocation = "569";
		generateMapForLocation(currentLocation);
		showName("TEN\nTON GYM");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return true;
	}
	return false;
}

//Main Hallway
public function mainHallWayOfGymShit():Boolean
{
	clearOutput();
	author("Slab Bulkhead");
	if(passDetector()) return true;
	output("The gym’s main thoroughfare, this hallway is lined with mirrors and smells faintly of sweat. The patrons walk slowly through here, most of them checking themselves and others out as they head through the gym. You hear the sound of splashing from one doorway, and raised voices chanting a cadence come from another.");
	// One of the following descriptions should appear at random between the first and third paragraphs whenever the PC enters this room:
	if(rand(6) == 0) output("\n\nBuff bulls fist-bump each other on their way between workouts, and one gives a passing cowgirl a smack on her jiggling rear. She squeals, then spins around and grabs his ass hard with both hands, making him jump and grunt in surprise.");
	else if(rand(5) == 0) output("\n\nA couple makes out in one corner. She’s pressed against the wall while he holds her up by gripping her ass, and her legs are wrapped around him. This being New Texas, the locals offer encouragement and grope one or both of the lovers as they pass by.");
	else if(rand(4) == 0) output("\n\nA group of bulls heads from the pool to the showers, naked and dripping, horsecocks swinging freely. One snaps a towel at another’s ass and gets a punch to the shoulder for it.");
	else if(rand(3) == 0) output("\n\nA group of cows jogs from the track to the showers, boobs and butts bouncing along the whole way. Their bubbly laughter and chatter echoes through the hall.");
	else if(rand(2) == 0) output("\n\nTwo bulls in nothing but workout pants head down the hall, arms around each others’ shoulders, both bragging they can lift more than the other. From their conversation, the prize in this competition seems to be a blowjob from the loser.");
	else output("\n\nA cowgirl jogs in from the track and meets another cow waiting by the door, fresh out of the pool. They share a quick kiss and head into the showers. As the door closes, you see one reach for the others’ breasts.");
	output("\n\nOpen doorways lead to the track and the swimming pool, while closed double doors at the hall’s end have a sign above them reading ‘Locker Room and Showers’.");
	return false;
}


//Weight Room
public function weightRoomBonusFunction():Boolean
{
	clearOutput();
	author("Slab Bulkhead");
	if(passDetector()) return true;
	output("The sounds of grunts and clanking metal greet you as you walk into the weight room. Half the room is taken up with machines for working every possible muscle, all of them with stacks of heavy plates over a meter high, to account for the brute strength the Treatment bestows upon some of its users. The room’s other half is filled with various types of weight benches and racks of free weights, for those who want to pump iron without mechanical assistance. The gym’s front windows make up most of one wall, and the opposite wall is all mirrors.");
	output("\n\nMost of the room’s occupants are bulls, focusing largely on their chests and arms, with a few of them pressing hard on the leg machines. A few cows are scattered around the room, working on their arms and legs or doing ab exercises on mats. Bulls and cows both ogle and catcall each other as they work, often stopping in the middle of a set to do so. A dark-skinned cowgirl is lifting heavier weights on a machine, and offers a challenging smirk to anyone who approaches her.");
	//if met Busky, and time is between 5pm and midnight
	if(flags["MET_BUSKY"] == true && hours >= 17 && hours <= 24) output("\n\nYou see another familiar face, Busky, hidden under a bench press. Whenever he takes a break, he stares dreamily at the bulging crotches of other bulls. He seems to be in the middle of an extensive workout, lifting around 300 imperial pounds. It's a rather low amount compared to the other bulls lifting twice, some thrice that much weight. However his endurance is astonishing, doing longer reps than any other bull. Compensating for weight, he's doing a much harder workout, and his body is showing it. His heaving chest is sweating profusely, being soaked up by his sodden undershirt and gym shorts.");
	//[Light Workout] Go to Light Workout {locked if PC has [Sore] debuff or doesn’t have 30 energy}
	if(pc.energy() >= 30 && !pc.isWornOut()) addButton(0,"Light Workout",lightWorkout,undefined,"Light Workout","A light workout that’ll help you build a little bit of muscle.");
	else addDisabledButton(0,"Light Workout","Light Workout","You’re too tired for that workout.");
	//[Hard Workout] Go to Light Workout {locked if PC has [Sore] debuff or doesn’t have 50 energy}
	if(pc.energy() >= 50 && !pc.isWornOut()) addButton(1,"Hard Workout",hardWorkout,undefined,"Hard Workout","A hard workout that’ll help you build muscle <b>and</b> strength.");
	else addDisabledButton(1,"Hard Workout","Hard Workout","You’re too tired for that workout.");
	//[Cowgirl] Go to Simone
	if(flags["MET_SIMONE"] == undefined) addButton(3,"Cowgirl",simoneWorkoutApproach,undefined,"Cowgirl","A cowgirl can be seen lifting weights here.");
	else addButton(3, "Simone", simoneWorkoutApproach, undefined, "Simone", "Pump some iron with the competitive cowgirl.");
	//add Busky menu, buskyWorkoutMenu() found in Busky.as
	if(flags["MET_BUSKY"] == true && hours >= 17 && hours <= 24) addButton(4, "Busky", buskyWorkoutMenu, undefined, "Busky", "Meet up with the bull.");
	//[To Entrance]
	return false;
}

//Light Workout
public function lightWorkout():void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("LIGHT\nWORKOUT");
	output("You work your way through a row of weight machines, keeping the weights at a moderate level. There’s something oddly relaxing about putting yourself through the simple motions, and the burn sets in after a while, leaving your muscles feeling tired and springy.");
	output("\n\nYou step away from the machines when done, wipe sweat from your forehead, and smile. Not a bad workout, but not too exhausting either. Let the bulls sweat and grunt until they can barely lift their arms; you’re just here to make sure you stay in good shape.");
	output("\n\nYour muscles have become slightly more toned.");
	//+1 muscle tone, +1 toward [Sore] debuff, +1 [Sweaty], -30 energy Time: 30 minutes";
	processTime(30);
	pc.energy(-30);
	pc.modTone(1,false);
	sweatyDebuff(1);
	soreDebuff(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function hardWorkout():void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("HARD\nWORKOUT");
	output("Time to pump iron. You slam some weights on the bars and start hefting. The gym regulars clearly appreciate seeing you put in as much work as they do, and volunteer to spot you, so long as you can spot them in return.");
	output("\n\nOne of the bulls starts lifting at the bar next to you, and an impromptu contest begins, both of you lifting heavier and heavier weights as the other does. You grit your teeth and push through it, determined to show the locals you’ve got what it takes.");
	output("\n\nThe contest comes to an abrupt end when a cowgirl walks by and tickles the bull’s crotch, nearly making him drop the bar. He struggles to right his weight, and you do the same. It’s a strain to even sit up after that, but you nod to your worthy opponent, then head off to stretch out the soreness.");
	output("\n\nYour muscles have become considerably more toned.");
	//{+3 muscle tone, +2 toward [Sore] debuff, +2 [Sweaty], -50 energy}{Time: 30 minutes}");
	processTime(30);
	pc.energy(-50);
	soreDebuff(2);
	sweatyDebuff(2);
	pc.modTone(3, false);
	pc.slowStatGain("physique",1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Track
public function newTexasTrackBonus():Boolean
{
	clearOutput();
	author("Slab Bulkhead");
	output("The whirr of air conditioners greets you as you enter the track room. It’s longer than you expected, taken up largely by an extended oval loop of running track, with lights hanging from bars that crisscross the ceiling. The track itself is some sort of brown synthetic, and bounces slightly under the runners’ feet. White lines designate the track’s five lanes.");
	output("\n\nA few young bulls are running the track in perfect synch, calling out their steps in time. One group of cows runs together in a loose cluster, some of them quite sweaty; another group of cows sits along the wall, calling out encouragement and lewd comments to the runners. A few other New Texans run at their own pace or catch their breath against the wall.");
	output("\n\nAt the center of the track, some sort of aerobics class is in progress, with an older cow calling out exercises and counting down numbers for the group she leads. The sight of a group of bulls and cows all moving and bending in synch like that is oddly hypnotizing, for quite a few reasons.");
	//[Jog] Go to Jog {locked if PC has [Sore] debuff or doesn’t have 30 energy}
	if(pc.energy() >= 30 && !pc.isWornOut()) addButton(0,"Jog",takeAJogInTenTonGym,undefined,"Jog","Jog around the track to burn some fat.");
	else addDisabledButton(0,"Jog","Jog","You’re too tired for that workout.");
	//[Run] Go to Run {locked if PC has [Sore] debuff or doesn’t have 50 energy}
	if(pc.energy() >= 50 && !pc.isWornOut()) addButton(1,"Run",takeARunInNewTexas,undefined,"Run","Run around the track to burn some fat.");
	else addDisabledButton(1,"Run","Run","You’re too tired for that workout.");
	//[To Hallway]
	return false;
}

//Jog
public function takeAJogInTenTonGym():void
{
	clearOutput();
	showName("\nJOGGING");
	author("Slab Bulkhead");
	output("You hit the track at a moderate pace, working your way up to a swift walk, then a gentle jog. After about half a lap, you catch up with the group of cows, and fall in with them. It seems like they’re here to chat just as much as they’re here to work out, and most of the conversation revolves around the local bulls and who’s best in the sack, though there’s mention of some curious people working at the nearby barn.");
	output("\n\nYou do a few more laps with the locals, then excuse yourself, slowing to a walk and heading off the track. It’s an easy workout, but it leaves you with a healthy glow and a light sweat once you’re done.");
	output("\n\nYou feel slightly trimmer after your workout.");
	//{-1 frame, +1 toward [Sore] debuff, +1 [Sweaty], -30 energy}{Time: 30 minutes}
	processTime(30);
	pc.modThickness(-1,false);
	soreDebuff(1);
	sweatyDebuff(1);
	pc.energy(-30);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Run
public function takeARunInNewTexas():void
{
	clearOutput();
	showName("\nRUNNING");
	author("Slab Bulkhead");
	output("Time to move, and there’s no better place for it. You hit the track and run a quick warmup lap, then decide it’s time to push yourself. The sound of chanting comes from behind you, and you glance back to see the group of young bulls running in cadence.");
	output("\n\nYou move over to the side to let them pass, then speed up to match their pace, running in time along with them. A few of them grunt a greeting, but every one of them is breathing hard, sweat flowing freely down their chests. They set a grueling pace, but you match it and keep up with them for at least a few miles.");
	output("\n\nSoon, you’re dripping sweat and have to cool off. One of the bulls razzes you about not being able to keep up, but running with them until you collapse doesn’t sound like the best idea. You head off the track, then grab a gym towel and wipe yourself off.");
	output("\n\nYou feel like you’ve shed a few pounds from that workout.");
	//{-3 frame, +2 toward [Sore] debuff, +2 [Sweaty], -50 energy}{Time: 30 minutes}
	pc.slowStatGain("reflexes",1);
	processTime(30);
	pc.modThickness(-3,false);
	soreDebuff(2);
	sweatyDebuff(2);
	pc.energy(-50);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Swimming Pool
public function swimmingPoolBonus():Boolean
{
	clearOutput();
	author("Slab Bulkhead");
	output("Tile covers the floor in this long room, and the whole place has a pleasant yet unfamiliar smell. A pool stretches nearly the entire length of the room, with black lines crossing its floor to designate swimming lanes. A sloping ramp leads down into the shallow end.");
	output("\n\nThis place seems more popular with the local cows than the other rooms, as there are groups of them swimming together. Many are clad in holstein-print swimsuits, while others – cow and bull alike – go naked. One naked cowgirl floats on her back, pink nipples pointing toward the ceiling, pushing herself along in a lazy backstroke.");
	output("\n\nYou wonder why it doesn’t smell like chlorine; surely they can’t go without something to keep the pool clean, with this many people in it. You dip two fingers into the pool water to test it, and find it smooth, almost slippery, the sign of a synthetic decontaminant. That explains the unfamiliar smell, and it’s probably a safer choice here, as you’re sure more than a few people have had sex in this pool.");
	output("\n\nA bubbling spa sits in one corner, big enough to hold fifteen to twenty people. It looks to be very popular; about a dozen cows and bulls sit in it, some on each others’ laps. You’re not sure if the motion in the water is entirely from the jets, or if there’s something going on beneath the bubbles. Probably both.");
	var isSwimChanged:Boolean = (pc.hasStatusEffect("Temporary Nudity Cheat") || pc.hasStatusEffect("Temporary Swimwear Cheat"));
	if(pc.inSwimwear(true) || pc.isNude())
	{
		if(isSwimChanged) flags["NAV_DISABLED"] = NAV_WEST_DISABLE;
		//[Quick Swim] Go to Quick Swim {locked if PC has [Sore] debuff or doesn’t have 30 energy}
		if(pc.energy() >= 30 && !pc.isWornOut()) addButton(0,"Quick Swim",quickSwim,undefined,"Quick Swim","Take a swim in the pool. It’ll burn fat and build muscle!");
		else addDisabledButton(0,"Quick Swim","Quick Swim","You’re too tired for that workout.");
		//[Swim Laps] Go to Swim Laps {locked if PC has [Sore] debuff or doesn’t have 50 energy}
		if(pc.energy() >= 50 && !pc.isWornOut()) addButton(1,"Swim Laps",swimLapsAtZePool,undefined,"Swim Laps","Swim laps in the pool. It’ll burn fat and build muscle but leave you tired as a dog.");
		else addDisabledButton(1,"Swim Laps","Swim Laps","You’re too tired for that workout.");
		//[Spa] Go to Spa
		addButton(4,"Spa",spaTimesFunStuff,undefined,"Spa","Relax in the spa and recover some energy.");
		//[Swimmer] Go to Lola
		if(flags["MET_LOLA"] == undefined) addButton(3,"Swimmer",lolaPoolApproach,undefined,"Swimmer","A naked cowgirl floats about here.");
		else addButton(3,"Lola",lolaPoolApproach,undefined,"Lola","Have some floaty fun with the cowgirl.");
	}
	else
	{
		addDisabledButton(0,"Quick Swim","Quick Swim","You’ll need to get yourself swim-ready before stepping into the pool.");
		addDisabledButton(1,"Swim Laps","Swim Laps","You’ll need to get yourself swim-ready before stepping into the pool.");
		addDisabledButton(4,"Spa","Spa","You’ll need to get yourself ready before stepping into the spa.");
	}
	if(isSwimChanged)
	{
		output("\n\n<b>You will need to rinse off and collect your belongings before leaving.</b>");
		addButton(5,"Rinse",poolGetReady,0,"Rinse","Use the shower to rinse yourself off before leaving.");
	}
	else
	{
		if(!pc.inSwimwear(true) && !pc.isNude())
		{
			output("\n\n<b>You will need to be wearing a full set of swimwear or otherwise be naked to use the facilities.</b>");
			if(pc.exhibitionism() < 66) output(" Temporary swimsuits are also available on racks nearby.");
		}
		addButton(5,"GetReady",poolGetReady,1,"Get Ready","Get yourself swim-ready.");
	}
	gooArmorTalkButton(2);
	return false;
}
//Outfit Change/Reclaim
public function poolGetReady(response:int = 0):void
{
	clearOutput();
	showName("THE\nPOOL");
	switch(response)
	{
		case 1:
			author("Slab Bulkhead");
			output("You ");
			if(pc.exhibitionism() < 66)
			{
				if(pc.inSwimwear(true)) output("adjust your [pc.gear]");
				else
				{
					output("don a swimsuit");
					pc.createStatusEffect("Temporary Swimwear Cheat");
				}
			}
			else if(!pc.isNude())
			{
				output("strip naked");
				pc.createStatusEffect("Temporary Nudity Cheat");
			}
			else output("admire your already nude form");
			output(" and prepare to step into the wet area of the pool.");
			break;
		case 0:
			output("You step underneath a nearby rinsing shower and yank on the chain. A spray of cold fresh water douses you, cleansing your body of any irritant you may have exposed yourself to.");
			output("\n\nAfter the shower subsides, you towel yourself off and reclaim your [pc.gear].");
			processTime(2);
			pc.shower();
			pc.removeStatusEffect("Temporary Swimwear Cheat");
			pc.removeStatusEffect("Temporary Nudity Cheat");
			flags["NAV_DISABLED"] = undefined;
			break;
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Quick Swim
public function quickSwim():void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("QUICK\nSWIM");
	output("You step into the pool, taking a few minutes to get used to the water. The unusual smoothness feels good against your [pc.skinFurScalesNoun], almost sensual. The temperature is pretty much perfect, a little bit cold but nothing you can’t handle.");
	output("\n\nOnce the water’s past your waist, you plunge in and swim a few laps. It’s amazingly refreshing, and you turn on your back and float, letting your worries wash away with the water.");
	output("\n\nAfter a few moments, you remind yourself that you’re here to work out, not drift away, and you push yourself a little through a few more laps. It’s a good workout, and leaves you feeling tired but energized.");
	output("\n\nYou feel a little stronger and fitter after your swim.");
	//{+1 muscle tone, -1 frame, +1 toward [Sore] debuff, -30 energy}{Time: 30 minutes}
	pc.modTone(1,false);
	pc.modThickness( -1, false);
	pc.shower();

	soreDebuff(1);
	processTime(30);
	pc.energy(-30);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Swim Laps
public function swimLapsAtZePool():void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("SWIM\nLAPS");
	output("You plunge into the cool water headfirst, coming up with a spurting breath. You head for one of the lanes, and get right into swimming laps. It takes a few strokes for you to find your rhythm, but soon you’re coasting through the water with ease.");
	output("\n\nAfter a few laps, you swim up alongside the local cows who are also doing laps, and nod a quick greeting to them, then match their pace. They clearly do this a lot, and it’s a struggle at first, but you manage to stay with them for a while.");
	output("\n\nSoon enough, your limbs start feeling heavy, and your once-smooth strokes start to stutter. You swim for the edge and pull yourself out, sore but satisfied.");
	output("\n\nYou feel stronger and fitter after your swim.");
	//{+2 muscle tone, -2 frame, +2 toward [Sore] debuff, -50 energy}{Time: 30 minutes}
	processTime(30);
	pc.slowStatGain("aim",1);
	pc.energy(-50);
	soreDebuff(2);
	pc.modThickness(-2,false);
	pc.modTone(2, false);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Spa
public function spaTimesFunStuff():void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("THE\nSPA");
	output("The spa is a welcome sight. You ready yourself and climb in.");
	output("\n\nThe smooth water is just barely beneath too hot, but once you get used to it, you let out a deep sigh of relief. You find a place to relax among the bubbling jets, and let the warm water soothe away your aches and pains.");
	output("\n\nAs you suspected before, not all the water’s motion is from the jets. There are several couples enjoying both the spa and each other, thrusting together in slow, lazy strokes. Pretty much what you’d expect for New Texas. Must be a great way to come down from a workout.");
	output("\n\nAfter a while, you feel yourself starting to get too warm, and climb out. The air feels suddenly cold, a bit bracing but not uncomfortable. Time to find a towel.");
	//{+20 energy, +15-20 Lust}{Time: 20 minutes}
	processTime(20);
	pc.energy(20);
	pc.lust(15+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Locker Room and Showers
public function lockerRoomAndShowersBonus():Boolean
{
	clearOutput();
	author("Slab Bulkhead");
	showName("LOCKER\nROOM");
	output("Tall metal lockers cover the tiled walls of this room, with benches bolted to the floor between them. The air is moist and smells of sweat and soap. You hear showers running nearby, along with lockers slamming closed and the rustle of clothing.");
	output("\n\nThe shower room is an open area with showerheads and knobs on the walls, as well as a long line of pipes featuring more of the same down the center. It’s a little crowded, as most everyone who uses the gym ends up here at some point. Dispensers by the shower knobs provide shampoo and body wash.");
	output("\n\nBulls and cows mingle freely in here, chatting and flirting as they change into and out of their workout clothes with the typical New Texas lack of modesty. There’s the occasional smack of flesh on flesh among the lockers, and moans come here and there from the showers.");
	//[Shower] Go to Shower
	//[To Hallway]
	addButton(0,"Shower",takeAShowerSloot,undefined,"Shower","Take a shower and wash off any sweat or grime.");
	return false;
}

//Shower
public function takeAShowerSloot():void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("SHOWER\nTIME!");
	output("Time to hit the shower. You strip down and stow your stuff in a locker, then find a shower that no one’s using and turn it on. The water splashes down on you all at once, and it takes you a moment to get the temperature set just right.");
	output("\n\nYou shampoo your [pc.hair] and rub down your [pc.skinFurScalesNoun] with the slippery body wash");
	if(pc.hasStatusEffect("Sweaty")) output(", stripping away the sweat from your workout");
	output(". After that, you scrub your [pc.face] and wash behind your [pc.ears], giving yourself a thorough cleaning.");

	if(pc.exhibitionism() < 50) 
	{
		output("\n\nThe hot water washes away your sweat and soreness, and it’s a significant improvement over your shipboard shower unit; the improved water pressure alone has you wanting to stay in for longer than necessary. But all good things must end, and you soon head out and towel yourself off, then get dressed again.");
		output("\n\nYou needed that.");
		//{Remove all [Sweaty]}{Time: 10 minutes}
		pc.removeStatusEffect("Sweaty");
		processTime(10);
	}
	else
	{
		output("\n\nYou’ve gotten yourself clean, but now that you’re done, you wouldn’t mind getting dirty again. And while it wouldn’t be the first time you got yourself off in the shower, with so many attractive people here, there’s no reason you should have to do it alone.");
		output("\n\nWith that in mind, you squirt another dollop of body wash into your hands, then turn your back to the shower, rubbing your hands all over your [pc.chest]. You work it into a good lather, stroking the slippery stuff all the way down to your [pc.belly] and massaging it into your [pc.crotch].");
		output("\n\nYou let out a moan, not too loud but enough to be heard among the sounds of rushing water and splashing footsteps. Surely someone’s watching by now.");
		output("\n\nSliding your foam-covered hands back up, you tweak your [pc.nipples], making yourself gasp. You turn it into a loud exhale, then spin to face the shower, stretching your arms out behind yourself and tilting your head back to let the water wash your [pc.chest] clean.");
		output("\n\nAfter holding the pose for a good long moment, you get another palmful of body wash, rub it onto both hands, then smack your [pc.ass] hard on both cheeks. You stroke your hands up your sides, then rub your shoulders for a moment, tilting your head back and forth, swaying your [pc.hips] all the while.");
		// If the PC has no cock, they will get the <i>“no one interested”</i> scene. If the PC has a cock, there’s a 50/50 chance for the sandwich scene.
		if(9999 == 9999)
		{
			output("\n\nDespite the show you’ve just put on, it seems like nobody wants to play right now. You consider handling yourself right then, but really, what’s the point? If a room full of naked New Texans doesn’t want to get dirty with you, then you might as well get cleaned up and find someone who does.");
			//[Done] Go to Locker Room and Showers {Remove all [Sweaty]} {Time: 10 minutes} [+40 Lust] [+1% Exhibitionism]}
			pc.shower();
			processTime(10);
			pc.lust(30+rand(10));
			pc.exhibitionism(1);
		}
		else
		{
			output("\n\nYour show seems to have attracted some attention. As you turn around to wash your [pc.ass] and put your [pc.chest] back on full display, two cowgirls walk up to you, each with a hand on the other’s rear.");
			//[Next] Go to Betsy and Victoria}
			pc.shower();
			processTime(10);
			pc.lust(30+rand(10));
			pc.exhibitionism(1);
			clearMenu();
			//9999 addButton(0,"Next",showerWithBetsyAndVictoriaApproach);
			return;
		}
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Talk to Quenton
//Quenton
public function talkToQuenton():void
{
	clearOutput();
	showQuenton();
	author("Slab Bulkhead");
	//Hasn’t talked to Quenton: 
	if(flags["MET_QUENTON"] == undefined)
	{
		output("<i>“Always good to see someone lookin’ to be their best and buffest.”</i> The musclebound bull grins, the cords of his thick neck standing out. If his shirt had a collar, it would have just ripped. He holds out his hand, and you introduce yourself. His grip feels like it could crush your bones, but he doesn’t squeeze.");
		output("\n\n<i>“If you’re lookin’ to join up here at the Ten Ton Gym, we’re runnin’ a special right now, full membership for 10,000 credits. If you just want to get yourself a sample, you can use the facilities today for 500 credits. Whatcha say?”</i>");
		processTime(2);
		flags["MET_QUENTON"] = 1;
	}
	else
	{
		if(flags["SEXED_QUENTON"] != undefined) output("<i>“Office is always open, if you’re up for some personal trainin’.</i>");
		else output("<i>“Good to see you again, [pc.name]. What can I do for you today?”</i>");
		processTime(1);
	}
	clearMenu();
	//[Purchase Day] Go to Purchasing Membership for a Day {Text: Ask about purchasing a day-long membership.}
	if(!pc.hasKeyItem("Ten Ton Gym Membership") && !pc.hasStatusEffect("Gym Pass")) addButton(0,"Day Pass",purchaseTempGymMembership,undefined,"Day Pass","Ask about purchasing a day-long membership.");
	else addDisabledButton(0,"Day Pass","Day Pass","You already have a gym pass.");
	//[Purchase Life] Go to Purchasing Lifetime Membership {Text: Ask about purchasing a lifetime membership.}
	if(!pc.hasKeyItem("Ten Ton Gym Membership")) addButton(1,"Life Pass",buyDatLifetimeMembership,undefined,"Life Pass","Ask about purchasing a lifetime membership.");
	else addDisabledButton(1,"Life Pass","Life Pass","You already have one!");
	//[Personal] Go to Personal Training {Text: Try to get into Quenton’s workout pants}
	if(pc.lust() >= 33) addButton(2,"P.Training",quentonPersonalTraining,undefined,"Personal Training","Try to get into Quenton’s workout pants.");
	else addDisabledButton(2,"P.Training","Personal Training","You are not aroused enough for this.");
	//[No Thanks] Go to Entrance
	addButton(14,"Leave",mainGameMenu);
}

//Purchasing Membership for a Day
public function purchaseTempGymMembership():void
{
	clearOutput();
	showQuenton();
	author("Slab Bulkhead");
	output("Quenton gives you a nod. <i>“Just here for a quick look or a quick lift? I gotcha.<i>”</i> He taps a few buttons on his computer, then holds out a hand to you. <i>“That’ll be 500, friend.”</i>");
	processTime(1);
	clearMenu();
	//[Purchase Day]{Set global flag GYM_MEMBER_DAY to true}{Deduct 50 credits} Go to Purchased Day
	if(pc.credits >= 500) addButton(0,"Purchase",purchaseTempGymMembershipConfirm,undefined,"Purchase","Spend 500 credits on a day pass.");
	else addDisabledButton(0,"Purchase","Purchase","You can’t afford a day pass.\n\nPrice: 500 Credits");
	//[Never Mind] Go to Entrance
	addButton(14,"Back",talkToQuenton);
}

//Purchased Day
public function purchaseTempGymMembershipConfirm():void
{
	clearOutput();
	showQuenton();
	author("Slab Bulkhead");
	output("You pay Quenton with a credit chit, and he gestures toward the gym doors. <i>“Enjoy your workout, and do come back.”</i>");
	processTime(1);
	pc.credits -= 500;
	pc.createStatusEffect("Gym Pass", 0, 0, 0, 0, false, "Icon_Haste", "You have a temporary gym pass to the Ten Ton Gym on New Texas.", false, 1440);
	variableRoomUpdateCheck();
	generateMapForLocation(currentLocation);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Purchasing Lifetime Membership
public function buyDatLifetimeMembership():void
{
	clearOutput();
	showQuenton();
	author("Slab Bulkhead");
	output("Quenton’s grin stretches even wider. <i>“Always happy to welcome a new member!”</i> He taps a few buttons on his computer, then holds out a hand to you. <i>“10,000 credits, friend, and you’ve got a home at the greatest gym this side of the galaxy.”</i>");
	clearMenu();
	if(pc.credits >= 10000) addButton(0,"Purchase",purchaseLifetimeGymMembership,undefined,"Purchase","Purchase a lifetime membership for 10,000 credits.");
	else addDisabledButton(0,"Purchase","Purchase","You cannot afford that.\n\nPrice: 10000 Credits");
	//[Purchase Life]{Set global flag GYM_MEMBER_LIFE to true}{Deduct 500 credits} Go to Purchased Life
	//[Never Mind] Go to Entrance
	addButton(14,"Back",talkToQuenton);
}

//Purchased Life
public function purchaseLifetimeGymMembership():void
{
	clearOutput();
	showQuenton();
	author("Slab Bulkhead");
	output("You pay him with a credit chit, and the computer plays a twangy musical fanfare. <i>“You’re all set, [pc.name]. Welcome to the Ten Ton Gym!”</i>");
	processTime(1);
	pc.credits -= 10000;
	pc.createKeyItem("Ten Ton Gym Membership",0,0,0,0);
	variableRoomUpdateCheck();
	generateMapForLocation(currentLocation);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// Personal Training
public function quentonPersonalTraining():void
{
	clearOutput();
	author("Slab Bulkhead");
	
	//PC’s tone is below 80% of maximum:
	if(pc.tone < 80)
	{
		showQuenton();
		output("You lean toward Quenton and ask if he does any personal training, if he knows what you mean. He seems to be a man who likes his muscle, so you flex your biceps, just to make sure you get your point across.");
		output("\n\nQuenton chuckles a little. <i>“I’m flattered, friend, but you’re not what I’d call my type.”</i> He gestures to the pictures hanging on his walls, all the buff cowgirls and bullboys. <i>“I like a good, hard body more than anything else, why I built up the gym in the first place. And why I built up myself, naturally.”</i> A quick flex makes both of his pecs jump.");
		output("<i>“Now, don’t take it bad, I’m just sayin’. Maybe you spend some time here, get yourself in my kind of shape, and we can see about some personal trainin’.”</i>");
		// [Back] Go to Entrance
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	// PC’s tone is above 80% of maximum
	else
	{
		showQuenton(true);
		// and has not had sex with Quenton: 
		if(flags["SEXED_QUENTON"] == undefined) output("<i>“Oh, I get what you’re sayin’,”</i> Quenton says, and stands up to his full height. He puffs out his chest, pecs straining against his shirt, stretching the gym’s logo across his musculature. <i>“There’s nothin’ I like more than a good, hard body against mine, except maybe a good lift. And even that’s made better with a good lay after. Or maybe durin’.”</i> He chuckles. <i>“So I’m up for it if you’re askin’.”</i>");
		// and has had sex with Quenton: 
		else output("<i>“You know I do,”</i> Quenton says with a chuckle. <i>“You’re up for another round, then, hardbody?”</i>");
		output("\n\nDamn right you are. Quenton props a sign that says ‘Be Back Soon’ on the desk, then opens up the door to his office and invites you in, closing the door behind you both.");
		output("\n\nQuenton’s office is small but simple, with a desk and cabinet taking up about half of it. Lights shine down from the ceiling, and two of the walls are nothing but enormous mirrors.");
		output("\n\nThe short-horned bull takes a bottle of lube out of one desk drawer, then strips out of his shirt and pants, and spreads his arms and legs as he flexes for you. Quenton is ridiculously ripped, with veins standing out over rock-hard muscles bulging beneath his tanned skin. His foot-long horse cock also has thick veins standing out on either side, with a pair of bulging balls dangling behind it. He’s also entirely hairless, further making all of his muscles and his pronounced package stand out.");
		output("\n\nQuenton flexes his way through a few poses, then turns to you with a grin, clearly hoping you like what you see. <i>“You pitchin’ or catchin’, hardbody? I’m good for you either way.”</i>");
		
		// [Pitch] Go to Pitching Quenton {requires penis or strap-on}
		// [Catch] Go to Catching Quenton
		clearMenu();
		if (pc.lowerUndergarment.hardLightEquipped || pc.hasCock()) addButton(0, "Pitch", quentonTrainingPitch, undefined, "Pitch", "Use your tool to take him from behind.");
		else addDisabledButton(2, "Pitch", "Pitch", "You don’t have the proper equipment for this.");
		addButton(1, "Catch", quentonTrainingCatch, "catch", "Catch", "Have him take you from behind.");
	}
}

// Pitching Quenton
public function quentonTrainingPitch():void
{
	clearOutput();
	author("Slab Bulkhead");
	showQuenton(true);
	
	// Create Quenton
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_EQUINE);
	pp.cocks[0].cLengthRaw = 12;
	pp.elasticity = 1.5;
	
	var x:int = -1;
	if(!pc.lowerUndergarment.hardLightEquipped && pc.hasCock()) x = rand(pc.cocks.length);
	
	output("You tell Quenton you want to take him from behind. He puts his hands on his hips and nods");
	if(!pc.isNude())
	{
		if(pc.hasArmor() || (x >= 0 && pc.hasLowerGarment() && !pc.hasUpperGarment()))
		{
			output(", then waits as you get out of your");
			if(pc.hasArmor()) output(" [pc.armor]");
		}
		if(pc.hasUpperGarment()) output(". He gives you an appreciative whistle as you shed your [pc.upperUndergarment]");
		if(x >= 0 && pc.hasLowerGarment())
		{
			if(pc.hasArmor() || pc.hasUpperGarment()) output(" and");
			output(" [pc.lowerUndergarment]");
		}
	}
	output(". <i>“Damn, [pc.name]. You’ve done yourself right, with a build like that.”</i>");
	output("\n\nQuenton picks up the bottle of lube and drizzles some of it into his palm, then tosses the bottle to you. He rubs the lube all over his chest, making every muscle shine, then flexes again, thrusting his crotch at you.");
	output("\n\n<i>“Now,”</i> Quenton says, giving you a lewd wink, <i>“let’s see about you doin’ me right.”</i>");
	output("\n\nYou lube up your [pc.cockOrStrapon " + x + "] and step up to Quenton. He pulls you close, pressing your [pc.chest] against his muscular pecs, and rubs his dong against your [pc.cockOrStrapon " + x + "]. His lubed-up hands stroke you and him both,");
	//if cock:
	if(x >= 0) output(" his strong grip tugging you to hardness in a handful of strokes");
	//if strapon:
	else output(" tugging on your hardlight and providing a pleasing friction through your [pc.lowerUndergarment]");
	output(". He smells like lube and masculine musk, making your desire build and your [pc.nipples] hard.");
	output("\n\nQuenton frees one of his hands from the mutual massage and traces it up your side, his touch surprisingly light as he outlines your muscles with his fingertips. There’s a look of mixed lust and approval as he does the same along your arm and shoulder, then across your [pc.chest], giving your nipples a little tweak along the way.");
	output("\n\n<i>“Body this built,”</i> he says, <i>“goin’ to feel real good against mine.”</i> He gives you another grin. <i>“You ready, hardbody?”</i>");
	output("\n\nAs if he needed to ask. You grin right back at Quenton and tell him to turn around. He does so, flexing again and watching himself in the mirror before glancing back over his shoulder to you.");
	output("\n\nYou run your hands down Quenton’s muscular back and down to his narrow hips, then grip both his hard butt cheeks as tight as you can. He only laughs and flexes them, then widens his stance, rests his hands on his thighs as he bends over.");
	output("\n\n<i>“Slide on home, Steele,”</i> Quenton says. <i>“I’m ready for you.”</i>");
	output("\n\nYou slide your [pc.cockOrStrapon " + x + "] down one of Quenton’s cheeks and aim it at his rear entrance. He lets out a low, lusty groan as your head penetrates him, and you drive in slowly, taking hold of his hips and pressing your lubed-up [pc.cockOrStrapon " + x + "] in.");
	// PC has large cock:
	if(x >= 0 && pc.cockVolume(x) > pp.analCapacity()) output(" It’s a tight squeeze, and he grunts once as you push your [pc.cock " + x + "] into the muscle-lined tunnel.");
	// PC doesn’t have large cock or uses strapon:
	else output(" It’s an easy fit, and while you wouldn’t call him loose, it’s clearly not the first time he’s been fucked like this.");
	
	// PC has cock:
	if(x >= 0)
	{
		pc.cockChange();
		
		output("\n\nOnce you’re all the way in, you thrust just a little, getting used to the feel of your cock up his ass. Quenton starts to push back against you, a low growl coming from his throat with every motion as he too eases into it. The muscles of his back and legs tighten and loosen, every movement pushing him into an easy rhythm. After a moment, you start thrusting a little harder, and Quenton drops one hand to his foot-long dong and starts stroking himself.");
		output("\n\n<i>“You got it, Steele,”</i> Quenton says, his voice low and husky, and lets out a long moan. <i>“Just keep on goin’.”</i>");
		output("\n\nYou plan to. Your grip tightens on his narrow hips, and as you pick up the pace, your hands slowly trace up his sides. Quenton straightens up and presses his muscled ass back against you, making your thrusts go deeper. You feel the heat coming off of him as he presses his back against your [pc.chest], and the scent of his musk is intoxicating.");
		output("\n\nQuenton’s hips are thrusting faster now, and you increase your pace again, and wrap your arms around his chest, getting a grip on his hard pecs. He growls, and slaps his free hand down on your [pc.thigh], squeezing it.");
		output("\n\nHe’s breathing faster, sweat beading on his forehead and trickling down the back of his neck. Your thrusts drive still deeper, making him let out a quick gasp with each one. His swollen balls swing forward with every one of your thrusts, to bang against the base of his horsecock");
		// if PC has balls:
		if(pc.balls > 0) output(", matched by your own [pc.balls] in the same rhythm slapping against his ass");
		output(". His head tilts back, and he squeezes your thigh, urging you on.");
		output("\n\n<i>“Harder,”</i> Quenton groans, his voice catching at the end.");
		output("\n\nYou drop your hands to his hips again, your fingers wrapping around them from the front, all for a better grip. His rear tunnel clenches around your [pc.cock " + x + "] as you thrust harder and harder again, the sound of your flesh slapping together filling the small office. The heat coming off of him is enough to make you start sweating, and you wonder if the mirrors will fog up before you two are done.");
		output("\n\nYou feel your urge to release building, and force it down. No way you’re going to finish before him; you’ll show Quenton you’re stronger. Just to drive that home, you drop one hand to his swinging balls and give them a soft squeeze, then start stroking his swollen sack.");
		output("\n\nAnother long, low groan tears its way out of Quenton’s throat, and he arches his back, pressing his shoulders against your [pc.chest]. <i>“Gonna,”</i> he gasps out, <i>“gonna–”</i>");
		output("\n\nAnything else Quenton was going to say is lost in a throaty groan as his cock twitches and spurts out a long stream of pearly white cum, splattering against the mirror halfway across the office. You don’t let up, and give his balls a good squeeze as he shoots off again, his breathing rough and ragged. He gives his horsedong a few more tugs, squeezing out another quick shot, before leaning forward and resting his hands on his knees again.");
		output("\n\nWith the buff bull finished and drained, it’s time for you to get yours. You clench your hands on Quenton’s hips again and pound away, focusing on the sound of his low grunts and the warm grip of his anal passage as it massages your [pc.cock " + x + "]. It’s not long before you can no longer hold back. You look to the cum-spattered mirror, and see Quenton watching you both there, and give him a grin as you pound home one last time.");
		output("\n\nYour [pc.cock " + x + "] spasms as the orgasm rips through you, and you let out a long groan of your own as your [pc.cum] flows through you and gushes into Quenton’s ass. He squeezes down hard on your organ, holding you tight in his rear grip as you spend yourself within him.");
		// If PC makes lots of cum:
		if(pc.cumQ() >= 2000) output(" But he can’t hold all you’ve got to give, and your [pc.cum] splashes back out of his asshole, splattering against your [pc.thighs] and dripping down to the floor.");
		output("\n\nA few deep breaths later, you slowly pull your [pc.cock " + x + "] out of Quenton’s asshole, and let it dangle free as you catch your breath. Quenton straightens himself with a grunt, and grabs some pre-moistened towels from a bin in the corner. His familiar grin is back in place as he cleans himself off, and he gives you an appreciative look as you do the same.");
		output("\n\n<i>“Damn fine work, hardbody,”</i> Quenton says, then pulls out a fresh pair of underwear from one of his desk drawers. Looks like he does this kind of thing all the time, if he’s that well-prepared. <i>“We’ve got to do this again sometime.”</i> He looks to the mess he made on the mirror, and chuckles. <i>“Be right back with you after I get this cleaned up.”</i>");
		output("\n\nYou chuckle, and finish cleaning yourself up, then don your discarded clothes and head out. Hell of a personal training session.");
	}
	
	// PC uses strapon:
	else
	{
		x = rand(pc.vaginas.length);
		
		output("\n\nOnce you’ve got the hardlight dildo all the way in, you thrust just a little. The friction from your [pc.lowerUndergarment] rubs against [pc.oneVagina], a pleasing sensation that builds with every thrust. Quenton starts to push back against you, a low growl coming from his throat with every motion as he too eases into it. The muscles of his back and legs tighten and loosen, every movement pushing him into an easy rhythm. After a moment, you start thrusting a little harder, and Quenton drops one hand to his foot-long dong and starts stroking himself.");
		output("\n\n<i>“You got it, Steele,”</i> Quenton says, his voice low and husky, and lets out a long moan. <i>“Just keep on goin’.”</i>");
		output("\n\nYou plan to. Your grip tightens on his narrow hips, and as you pick up the pace, your hands slowly trace up his sides. Quenton straightens up and presses his muscled ass back against you, making your thrusts go deeper. You feel the heat coming off of him as he presses his back against your [pc.chest], and the scent of his musk is intoxicating.");
		output("\n\nQuenton’s hips are thrusting faster now, and you increase your pace again, and wrap your arms around his chest, getting a grip on his hard pecs. He growls, and slaps his free hand down on your [pc.thigh], squeezing it.");
		output("\n\nHe’s breathing faster, sweat beading on his forehead and trickling down the back of his neck. Your thrusts drive still deeper, making him let out a quick gasp with each one. His swollen balls swing forward with every one of your thrusts, to bang against the base of his horsecock");
		// if PC has balls:
		if(pc.balls > 0) output(", matched by your own [pc.balls] in the same rhythm slapping against his ass");
		output(". His head tilts back, and he squeezes your thigh, urging you on.");
		output("\n\n<i>“Harder,”</i> Quenton groans, his voice catching at the end.");
		output("\n\nYou drop your hands to his hips again, your fingers wrapping around them from the front, all for a better grip. His rear tunnel squeezes your strapon, and you push harder, increasing the pressure against your [pc.vagina " + x + "] as you thrust again, the sound of your flesh slapping together filling the small office. The heat coming off of him is enough to make you start sweating, and you wonder if the mirrors will fog up before you two are done.");
		output("\n\nThe pleasure in your [pc.crotch] builds, bringing you closer to orgasm, but you force it down. No way you’re going to finish before him; you’ll show Quenton you’re stronger. Just to drive that home, you drop one hand to his swinging balls and give them a soft squeeze, then start stroking his swollen sack.");
		output("\n\nAnother long, low groan tears its way out of Quenton’s throat, and he arches his back, pressing his shoulders against your [pc.chest]. <i>“Gonna,”</i> he gasps out, <i>“gonna–”</i>");
		output("\n\nAnything else Quenton was going to say is lost in a throaty groan as his cock twitches and spurts out a long stream of pearly white cum, splattering against the mirror halfway across the office. You don’t let up, and give his balls a good squeeze as he shoots off again, his breathing rough and ragged. He gives his horsedong a few more tugs, squeezing out another quick shot, before leaning forward and resting his hands on his knees again.");
		output("\n\nWith the buff bull finished and drained, it’s time for you to get yours. You clench your hands on Quenton’s hips again and pound away, focusing on the sound of his low grunts and friction from every thrust as your [pc.lowerUndergarment] massages your [pc.vaginaNoun " + x + "]. It’s not long before the sensation becomes too much. You look to the cum-spattered mirror, and see Quenton watching you both there, and give him a grin as you pound home one last time.");
		output("\n\nYour [pc.vaginaNoun " + x + "] spasms as the orgasm rips through you, your whole body clenching at once, and you let out a long groan of your own as your [pc.girlCum] turns your [pc.lowerUndergarment] slick and swampy. Your hips thrust a few more times on their own, then your whole body sags.");
		output("\n\nA few deep breaths later, you slowly pull your strapon out of Quenton’s asshole, and let it dangle free as you catch your breath. Quenton straightens himself with a grunt, and grabs some pre-moistened towels from a bin in the corner. His familiar grin is back in place as he cleans himself off, and he gives you an appreciative look as you do the same.");
		output("\n\n<i>“Damn fine work, hardbody,”</i> Quenton says, then pulls out a fresh pair of underwear from one of his desk drawers. Looks like he does this kind of thing all the time, if he’s that well-prepared. <i>“We’ve got to do this again sometime.”</i> He looks to the mess he made on the mirror, and chuckles. <i>“Be right back with you after I get this cleaned up.”</i>");
		output("\n\nYou chuckle, and finish cleaning yourself up, then don your discarded");
		if(!pc.isNude()) output(" clothes");
		else output(" gear");
		output(" and head out. Hell of a personal training session.");
	}
	
	processTime(25);
	pc.orgasm();
	pc.orgasm();
	IncrementFlag("SEXED_QUENTON");
	
	// [Done] Go to Entrance
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Catching Quenton
public function quentonTrainingCatch(response:String = ""):void
{
	clearOutput();
	author("Slab Bulkhead");
	showQuenton(true);
	
	// Create Quenton
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_EQUINE);
	pp.cocks[0].cLengthRaw = 12;
	pp.elasticity = 1.5;
	
	var x:int = 0;
	
	if(response == "catch")
	{
		output("You tell Quenton you want him to take you from behind. He puts his hands on his hips and nods");
		if(!pc.isNude())
		{
			if(pc.hasArmor() || (pc.hasLowerGarment() && !pc.hasUpperGarment()))
			{
				output(", then waits as you get out of your");
				if(pc.hasArmor()) output(" [pc.armor]");
			}
			if(pc.hasUpperGarment()) output(". He gives you an appreciative whistle as you shed your [pc.upperUndergarment]");
			if(pc.hasLowerGarment())
			{
				if(pc.hasArmor() || pc.hasUpperGarment()) output(" and");
				output(" [pc.lowerUndergarment]");
			}
		}
		output(". <i>“Damn, [pc.name]. You’ve done yourself right, with a build like that.”</i>");
		output("\n\nQuenton picks up the bottle of lube and strokes his horsecock to full hardness, then drizzles a line of lube on it and rubs it in until his cock gleams. A palmful of lube gets rubbed all over his chest, making every muscle shine. He flexes again, and thrusts his well-oiled crotch at you.");
		output("\n\n<i>“Now,”</i> Quenton says, giving you a lewd wink, <i>“let’s see about doin’ you right.”</i>");
		output("\n\nQuenton steps behind you and faces you toward the mirror, runs both his hands down your muscular back, then slides his hands around your [pc.belly] and strokes them up your [pc.chest]. You keep your eyes on the mirror, watching his hands work over your body, and catch the appreciative look on his face.");
		output("\n\nThis is indeed a man who loves his muscle, and you’ve got what he wants.");
		output("\n\nQuenton’s hands stroke down your sides again, slower this time, as he works his way toward your [pc.crotch]. He moves in closer, and you feel his horsecock against your [pc.ass], warm and slick and growing steadily harder. His lubed-up chest presses against your back, and the scent of his musk makes your [pc.nipples] hard.");
		output("\n\nThe bull at your back lets out a low groan as his hands reach past your waist.");
		// PC has only penis and balls:
		if(!pc.hasVagina() && pc.hasCock() && pc.balls > 0) output(" Quenton’s hand wraps around your [pc.biggestCock] and gives it a good, long stroke, then another. His grip is firm and strong, and blood rushes to your crotch as your [pc.biggestCock] rises to the occasion. Quenton’s other hand cups your [pc.balls] and rolls them gently in his palm, giving you just enough of a squeeze to be stimulating.");
		// PC has only penis and no balls:
		else if(!pc.hasVagina() && pc.hasCock() && pc.balls <= 0) output(" Quenton’s hand wraps around [pc.biggestCock] and gives it a good, long stroke, then another. His grip is firm and strong, and blood rushes to your crotch as [pc.biggestCock] rises to the occasion. Quenton’s other hand wraps around the base of your [pc.biggestCock] and squeezes in rhythm with his strokes. His well-practiced technique makes you moan.");
		// PC has only vagina:
		else if(pc.hasVagina() && !pc.hasCock()) output(" Quenton’s hand slides down to stroke [pc.eachVagina], rubbing his fingers back and forth along your lower lips. He applies a little more pressure with each stroke, then slides one thick finger into [pc.oneVagina], and you let out a low moan. After a few good strokes, he slips in a second finger, which is swiftly covered in your [pc.girlCum].");
		// PC has both:
		else if(pc.hasVagina() && pc.hasCock()) output(" Quenton’s hand wraps around your [pc.biggestCock] and gives it a good, long stroke, then another. His grip is firm and strong, and blood rushes to your crotch as your [pc.biggestCock] rises to the occasion. Quenton’s other hand slides down to [pc.eachVagina], rubbing his fingers back and forth along your lower lips.");
		output("\n\n<i>“You about ready, hardbody?”</i> Quenton asks, his breath hot on your neck. He presses his horsecock against your [pc.ass], and it’s clearly at full mast now. <i>“‘Cause I’m all kinds of ready for you.”</i>");
		output("\n\nYou tell Quenton that you’re definitely ready, and spread your legs a little wider, making yourself open for him. He gives you an approving growl, and pulls his hands away from your [pc.crotch], then gives your rear a light smack.");
		
		processTime(5);
		
		// [Catch Vaginal] Go to Catch Vaginal
		// [Catch Anal] Go to Catch Anal
		if(pc.hasVagina())
		{
			output("\n\n<i>“Where do you want it, Steele?”</i>");
			
			addButton(0, "Vaginal", quentonTrainingCatch, "vaginal", "Vaginal", "Have him peg [pc.oneVagina].");
			addButton(1, "Anal", quentonTrainingCatch, "anal", "Anal", "Have him fuck your butt.");
		}
		else addButton(0, "Next", quentonTrainingCatch, "anal");
		
		return;
	}
	
	switch(response)
	{
		// Catch Vaginal
		case "vaginal":
			x = rand(pc.vaginas.length);
			
			output("Quenton slides his horsecock between your legs, rubbing the shaft against [pc.eachVagina], adding some slickness to his already lubed-up member. His hands settle on your [pc.hips], and he pulls his own hips back, then slides his cock into [pc.oneVagina] with one smooth, slow motion.");
			// PC has tight vagina:
			if(pc.vaginas[x].looseness() <= 1) output(" You feel him pushing to fit into you, and he lets out a low groan as his foot-long dong stretches your vaginal walls, pressing them wide with his penetration.");
			
			pc.cuntChange(x, pp.cockVolume(0));
			
			output("\n\nHe presses in balls-deep with his first stroke, hilting himself in your [pc.vagina " + x + "], then pulls halfway out with a long grunt. <i>“Damn,”</i> he breathes, then shoves himself into you again, pulls halfway out once more, then thrusts in and holds himself there.");
			output("\n\nYou push your [pc.hips] back against him, your [pc.ass] smacking against his crotch, eager for more. He’s got muscle to spare, so he can fuck you stronger than that, can’t he?");
			output("\n\nIndeed he can. Quenton grins at your encouragement, and starts into a rhythmic thrust. You look at the mirror, and see his abs clenched as he pounds away at you, his pecs bouncing in time with every thrust. Thick veins stand out on his forearms as he grips your [pc.hips].");
			output("\n\n<i>“That’s the stuff,”</i> Quenton grunts, and brings a hand down to smack one cheek of your [pc.ass]. You let out a gasp, and Quenton laughs, then spanks your other cheek.");
			output("\n\nThe buff bull’s thrusts pick up their pace, and the sound of your bodies slapping together fills the office. He drops his hands back to your [pc.hips], then runs them up your sides, urging you to tilt your torso up higher. You do so, pushing hard back against his hips, until you’re standing halfway up.");
			output("\n\nQuenton reaches out and takes hold of your [pc.chest], squeezing tight as he pumps deeper into your [pc.vagina " + x + "]. He’s watching the mirror as you fuck, his gaze tracing over both of you the entire time. You tilt your head back and moan as his horsecock pounds away, his balls slapping against your [pc.thighs].");
			output("\n\n<i>“</i>Damn<i>, you look good,”</i> Quenton grunts, sweat from his chest beading onto your bare back. <i>“Got to be . . . one of the best . . . bodies in my gym,”</i> he pants.");
			output("\n\nYou reach back and get a grip on the back of Quenton’s neck, urging him on, telling him to go harder, and deliberately putting yourself on better display. His hips redouble their efforts, slapping into your [pc.ass] with a new fury, sweat from both of you leaping off in all directions.");
			// If PC has penis:
			if(pc.hasCock()) output(" [pc.EachCock] flops in rhythm with your fucking, bouncing up and down at full mast.");
			// If PC has no penis:
			else output(" You watch his horsecock thrusting in and out of your [pc.vagina " + x + "], your [pc.girlCum] soaking his shaft.");
			output("\n\nQuenton’s thrusting is getting more fevered now, his grunts louder, his hot breath on the back of your neck coming faster and faster. His grip on your [pc.chest] tightens, and his head tilts back. You feel his horsecock twitch in your cunt and you clench down hard. You’re almost there, but not yet.");
			output("\n\n<i>“Hell of a squeeze!”</i> he groans, then takes a deep breath and keeps thrusting away.");
			output("\n\nYou twitch your hips from side to side, focusing on the feeling of him filling you, and lean back against him. His frantic thrusts bring you closer, closer, until you can’t hold it back any more. You arch back hard against Quenton, your back bending away from his broad chest, orgasm ripping through you, [pc.girlCum] dripping down over his cock to his swinging balls.");
			// If PC has penis:
			if(pc.hasCock()) output(" At the same time, [pc.cum] spurts out of [pc.eachCock], splattering across the mirror and leaving a long [pc.cumColor] trail back to your crotch.");
			output("\n\nA breath later, Quenton lets out a throaty groan as his cock twitches inside you, and you feel the hot jet of his cum splash into you. He gives a few long thrusts, finishing the same way he started, each accompanied by another squirt.");
			output("\n\nYou both lean forward, sweaty and drained, and it’s a moment before either of you can form words again. Quenton slowly pulls his semi-hard dong out of you, then lets out a low chuckle. <i>“I knew some personal trainin’ with you was a good idea,”</i> he says, then straightens up. <i>“Damn good, Steele, damn good. Let me getcha a towel.”</i>");
			output("\n\nQuenton hands you a pre-moistened towel from a bin in the corner, and you both take a moment to clean up before returning to the gym entrance.");
			
			pc.loadInCunt(pp, x);
			pc.loadInCunt(pp, x);
			break;
		// Catch Anal
		case "anal":
			output("<i>“Backdoor fan, eh?”</i> Quenton asks, then chuckles. <i>“You’re not the only one.”</i>");
			output("\n\nQuenton slaps his horsecock against your [pc.ass], rubbing the slickened shaft between your cheeks. His hands settle on your [pc.hips], and he pulls his own hips back, then aligns his cock with your [pc.asshole]. His wide, flat cockhead presses against your rear entrance, then slips into you with one smooth, slow motion.");
			// PC has tight asshole:
			if(pc.ass.looseness() <= 1) output(" You feel him pushing to fit into you, and he lets out a low groan as his foot-long dong stretches your anal walls, pressing them wide with his penetration.");
			
			pc.buttChange(pp.cockVolume(0));
			
			output("\n\nHe presses in balls-deep with his first stroke, hilting himself in your [pc.ass], then pulls halfway out with a long grunt. <i>“Damn,”</i> he breathes, then shoves himself into you again, pulls halfway out once more, then thrusts in and holds himself there.");
			output("\n\nYou push your [pc.hips] back against him, your [pc.ass] smacking against his crotch, eager for more. He’s got muscle to spare, so he can fuck you stronger than that, can’t he?");
			output("\n\nIndeed he can. Quenton grins at your encouragement, and starts into a rhythmic thrust. You look at the mirror, and see his abs clenched as he pounds away at you, his pecs bouncing in time with every thrust. Thick veins stand out on his forearms as he grips your [pc.hips].");
			output("\n\n<i>“That’s the stuff,”</i> Quenton grunts, and brings a hand down to smack one cheek of your [pc.ass]. You let out a gasp, and Quenton laughs, then spanks your other cheek.");
			output("\n\nThe buff bull’s thrusts pick up their pace, and the sound of your bodies slapping together fills the office. He drops his hands back to your [pc.hips], then runs them up your sides, urging you to tilt your torso up higher. You do so, pushing hard back against his hips, until you’re standing halfway up.");
			output("\n\nQuenton reaches out and takes hold of your [pc.chest], squeezing tight as he pumps deeper into your [pc.asshole]. He’s watching the mirror as you fuck, his gaze tracing over both of you the entire time. You tilt your head back and moan as his horsecock pounds away, his balls slapping against your [pc.thighs].");
			output("\n\n<i>“</i>Damn<i>, you look good,”</i> Quenton grunts, sweat from his chest beading onto your bare back. <i>“Got to be . . . one of the best . . . bodies in my gym,”</i> he pants.");
			output("\n\nYou reach back and get a grip on the back of Quenton’s neck, urging him on, telling him to go harder, and deliberately putting yourself on better display. His hips redouble their efforts, slapping into your [pc.ass] with a new fury, sweat from both of you leaping off in all directions.");
			// If PC has penis:
			if(pc.hasCock()) output(" [pc.EachCock] flops in rhythm with your fucking, bouncing up and down at full mast.");
			// If PC has no penis:
			else output(" You watch his horsecock thrusting in and out of your [pc.ass], his shaft shiny with lube.");
			output("\n\nQuenton’s thrusting is getting more fevered now, his grunts louder, his hot breath on the back of your neck coming faster and faster. His grip on your [pc.chest] tightens, and his head tilts back. You feel his horsecock twitch in your [pc.asshole], and squeeze down hard. You’re almost there, but not yet.");
			output("\n\n<i>“Hell of a squeeze!”</i> he groans, then takes a deep breath and keeps thrusting away.");
			output("\n\nYou twitch your hips from side to side, focusing on the feeling of him filling you, and lean back against him. His frantic thrusts bring you closer, closer, until you can’t hold it back any more. You arch back hard against Quenton, your back bending away from his broad chest, orgasm ripping through you, your [pc.ass] clenching tight against Quenton’s thighs and cock.");
			// If PC has penis:
			if(pc.hasCock()) output(" At the same time, [pc.cum] spurts out of [pc.eachCock], splattering across the mirror and leaving a long [pc.cumColor] trail back to your crotch.");
			output("\n\nA breath later, Quenton lets out a throaty groan as his cock twitches inside you, and you feel the hot jet of his cum splash into you. He gives a few long thrusts, finishing the same way he started, each accompanied by another squirt.");
			output("\n\nYou both lean forward, sweaty and drained, and it’s a moment before either of you can form words again. Quenton slowly pulls his semi-hard dong out of you, then lets out a low chuckle. <i>“I knew some personal trainin’ with you was a good idea,”</i> he says, then straightens up. <i>“Damn good, Steele, damn good. Let me getcha a towel.”</i>");
			output("\n\nQuenton hands you a pre-moistened towel from a bin in the corner, and you both take a moment to clean up before returning to the gym entrance.");
			
			pc.loadInAss(pp);
			pc.loadInAss(pp);
			break;
	}
	
	processTime(20);
	pc.orgasm();
	pc.orgasm();
	IncrementFlag("SEXED_QUENTON");
	
	// [Done] Go to Entrance
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Simone
public function simoneWorkoutApproach():void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("\nSIMONE");
	showBust("SIMONE");
	
	output("You saunter on over to the smirking cowgirl. She’s hard at work on a chest press machine, her arms spread wide to either side of her gigantic breasts, which are barely held in place by a tight, pink sports bra. Her top matches the equally tight pink shorts she’s got on, the shiny fabric an interesting contrast to her dark brown skin. Her long, curly brown hair is tied back in a simple ponytail, and her pink sweatband sits just beneath a pair of gleaming black horns. She’s clearly a gym regular; her arms and shoulders are well-toned, she has defined abs, and her thighs are strong and firm. You can see a hint of a bulge between her legs, but not enough for her to be a hermaphrodite; it looks more like she has a prominent cameltoe.");
	
	// PC hasn’t met Simone:
	if(flags["MET_SIMONE"] == undefined)
	{
		output("\n\n<i>“Heeyy,”</i> the cowgirl says as you approach. She lowers the bar and leans up on one elbow. Her eyes meet yours for a moment, then lower to your arms and chest. <i>“You here to lift, or just to watch?”</i>");
		output("\n\nYou ask her if you can’t do both, then introduce yourself. If she recognizes your name, she doesn’t show it.");
		output("\n\n<i>“I’m Simone,”</i> she says, <i>“and </i>I’m<i> here to lift. But if you’re here for both, how about a little challenge?”</i>");
		output("\n\nWhen you ask what kind of challenge, Simone’s smirk returns. It looks like she’s been waiting for someone to ask.");
		output("\n\n<i>“Let’s see who’s stronger,”</i> Simone says. She nudges the chest press bar, setting her boobs to jiggling. <i>“Five presses, add weight, five more, add weight, you get it. First one who can’t lift anymore loses.”</i> She smiles, the tip of her wide pink tongue flicking out between her lips. <i>“Loser makes the winner come. You in?”</i>");
		
		flags["MET_SIMONE"] = 1;
		
		processTime(5);
	}
	// PC has met Simone:
	else
	{
		output("\n\n<i>“Heeyy, [pc.name],”</i> Simone says, stopping her workout as you approach. <i>“Feeling up for a challenge, or did you wear yourself out too much already?”</i>");
		
		processTime(1);
	}
	
	// Genderless tease check
	if(flags["SIMONE_TEASED"] != undefined && pc.hasGenitals()) flags["SIMONE_TEASED"] = undefined;
	
	if(!pc.hasGenitals())
	{
		if(pc.isCrotchExposed()) output("\n\nYou turn slightly and she gives you a second take, then coughs. <i>“Ahem, on second thought...”</i> She eyes your crotch. <i>“It doesn’t look like you have much there to really wager... or are you sure you want to do this, or are you here because you want to lose to me?”</i>");
		else if(flags["SIMONE_TEASED"]) output("\n\nShe pauses, then gives you a smirk. <i>“Hm, I don’t know... I remember the stunt you pulled last time...”</i> She eyes your crotch, making it obvious that she remembers the results of the last competition. <i>“Without anything there, I’m most definitely going to beat you... or is that secretly what you want?”</i>");
	}
	
	// [Compete] Go to Compete {Text: Lift like you mean it.} {-40 Energy}
	// [Fake Loss] Go to Fake Loss {Text: Lift like you don’t mean it.} {-20 Energy}
	// [Pass] Go to Pass {Text: Or just don’t lift.}
	clearMenu();
	if(pc.energy() >= 40 && !pc.isWornOut())
	{
		if((flags["SIMONE_TEASED"] != undefined || pc.isCrotchExposed()) && !pc.hasGenitals()) addButton(0, "Compete", simoneWorkoutGo, "compete", "Compete", "Are your sure about that? You’ll need some genitals if you want to reap any of the rewards.");
		else addButton(0, "Compete", simoneWorkoutGo, "compete", "Compete", "Lift like you mean it.");
	}
	else addDisabledButton(0, "Compete", "Compete", "You’re too tired to lift.");
	if(pc.energy() >= 20 && !pc.isWornOut()) addButton(1, "Fake Loss", simoneWorkoutGo, "fake loss", "Fake Loss", "Lift like you don’t mean it.");
	else addDisabledButton(1, "Fake Loss", "Fake Loss", "You’re too tired to lift.");
	addButton(2, "Pass", simoneWorkoutGo, "pass", "Pass", "Or just don’t lift.");
}
public function simoneWorkoutGo(response:String = ""):void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("\nSIMONE");
	showBust("SIMONE");
	clearMenu();
	
	switch(response)
	{
		// Compete
		case "compete":
			output("You tell Simone you’ll take her on, and lie down on the other chest press machine. You set the stack to four weights, as per her instructions, then take hold of the bar. She says, <i>“Ready? Go!”</i> and you start lifting.");
			output("\n\nYou push your way through your first set, then add more weight and start your second, lifting slow and steady. Simone matches your pace, clearly handling this without a problem. It doesn’t start to get difficult until you add the sixth weight, but you keep going.");
			output("\n\nBy the time you get to the ninth weight, you and Simone have both slowed down a little, but she shows no signs of stopping. You take a deep breath and move up to the tenth weight. One . . . two . . . three . . . four . . . five. There’s an aching in your chest now, but you force yourself to keep lifting.");
			
			// If the PC has a Sexiness bonus of 7 or higher, or muscle tone over 70% of maximum, Simone will lose on purpose. If PC chooses [Compete], they win. If PC chooses [Fake Loss], they still lose.
			// If Simone does not lose on purpose, take the PC’s Physique stat plus a random number from 1 to 10. If that number is over 20, the PC wins. If that number is under 20, Simone wins.
			var winrar:Boolean = false;
			if(pc.sexiness() >= 7 || pc.tone > 70 || ((pc.physique() + rand(10) + 1) > 20)) winrar = true;
			if((flags["SIMONE_TEASED"] != undefined || pc.isCrotchExposed()) && !pc.hasGenitals()) winrar = false;
			
			processTime(15);
			//soreDebuff(1);
			pc.energy(-40);
			
			// PC wins:
			if(winrar)
			{
				output("\n\nThe movements become mechanical: lift five, add weight, lift five more, add weight. You plow through the eleventh stack with only a little trouble, and a quick glance over at Simone shows that she’s starting to struggle. You both add the twelfth weight at the same time, and she pauses to take a deep breath.");
				output("\n\nYou shove the bar up with a grunt, pushing through your set, then lower the weights and add another to the stack. A loud slam comes from Simone’s machine, and you look over to see her laying there, arms dangling off both sides of the bench, her heavy tits trying to flop to either side as her sports bra strains to hold them in place. She looks at you, and you push the bar up once, twice, three times, so she knows that you won.");
				output("\n\nVictory is yours, and you let the bar drop.");
				output("\n\nSimone rises and walks over to you, her arms hanging limp at her sides. <i>“Damn, [pc.name],”</i> she says. <i>“I didn’t think you had it in you.”</i>");
				output("\n\nYou sit up and flex your arms and chest, trying not to show any strain from the workout. It looks like you win, you tell her, and she laughs.");
				output("\n\n<i>“Looks like.”</i> Simone leans forward and rests a hand on your [pc.thigh], then trails it higher, moving toward your [pc.crotch]. <i>“Now let’s see what you’ve got for me.”</i>");
				
				// [Victory] Go to Victory
				addButton(0, "Victory", simoneWorkoutResults, "victory");
			}
			// Simone wins:
			else
			{
				output("\n\nIt’s the eleventh stack that gets you. After shoving the bar up as hard as you can, your muscles feel weak and wobbly, and you wipe away sweat before trying again. Your arms strain as you try to force them to work, and then, you know it’s hopeless.");
				output("\n\nTry as you might, you can’t force the bar up one more time. You look over at Simone, who’s struggling through her own set of eleven. She hoists the bar up four times, then five, and lets the weights slam down. When she looks over and sees you spent, she lets out a tired laugh, then adds one more weight to her stack and pushes the bar up once, just so there’s no doubt who won.");
				output("\n\nSlowly, Simone rises and walks over to you. <i>“Not bad, [pc.name],”</i> she says. <i>“Not bad at all. I thought you had me there for a second.”</i> Her smirk returns. <i>“Just means you get to have me now.”</i>");
				output("\n\nYou give her a sly smile, wondering what she’s got in mind.");
				output("\n\n<i>“Oh, don’t get up,”</i> Simone says, and hooks one thumb into her pink shorts’ waistband. <i>“Just scoot down a little, so the bar’s out of the way. You’re not going anywhere.”</i>");
				
				// [Defeat] Go to Defeat
				addButton(0, "Defeat", simoneWorkoutResults, "defeat");
			}
			break;
		// Fake Loss
		case "fake loss":
			output("You tell Simone to bring it on, trying to hide your smile. Better make this look convincing; she looks like she takes this seriously.");
			output("\n\nYou lie down on another chest press machine, and set the weights on the fourth setting, as per Simone’s instructions. She says, <i>“Ready? Go!”</i> and you start lifting. You start off fast, to make it look like you’re going to burn yourself out quickly.");
			output("\n\nBy the time you’ve increased the weight twice, you slow it down a little, and let out a grunt as you finish your reps. When you glance over at Simone, she looks like she’s plowing through this with ease. Perfect.");
			output("\n\nWhen you have the weights stacked up to seven, you start breathing hard, and after adding the eighth weight, you struggle, straining against the bar to no avail. When Simone laughs, you look over, and see her raising her stack to the ninth weight. You force the bar up one last time, gritting your teeth with a loud grunt, then let the bar slam down hard. The sound of metal on metal is just barely loud enough to cover your strained breathing.");
			output("\n\nSimone hefts her way through her set of five, then adds the tenth weight and pushes through another set, just to ensure her victory. Once finished, she stands up with a hearty laugh, then steps over to your machine. <i>“Aww, [pc.name]. Is that all you’ve got?”</i>");
			output("\n\nLooks like it. You shrug and laugh, trying to look like you really meant to win. Whether you fooled her or not, the glint in her eye makes it clear she’s taking her victor’s spoils.");
			output("\n\n<i>“Oh, don’t get up,”</i> Simone says, and hooks one thumb into her pink shorts’ waistband. Her smirk returns. <i>“Just scoot down a little, so the bar’s out of the way. You’re not going anywhere.”</i>");
			
			processTime(10);
			//soreDebuff(1);
			pc.energy(-20);
			
			// [Defeat] Go to Defeat
			addButton(0, "Defeat", simoneWorkoutResults, "defeat");
			break;
		// Pass
		case "pass":
			output("You tell Simone that you’re not up for a challenge right now. Her smile fades, and she looks disappointed. <i>“Too bad,”</i> she says. <i>“Could have been fun. Let me know if you change your mind.”</i> She lies back down on the bench and returns to her lifting.");
			
			processTime(2);
			
			// [Done] Go to Weight Room
			addButton(0, "Next", mainGameMenu);
			break;
		// Failsafe
		default:
			addButton(0, "Next", mainGameMenu);
			break;
	}
}
public function simoneWorkoutResults(response:String = ""):void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("\nSIMONE");
	showBust("SIMONE_NUDE");
	clearMenu();
	
	// Create Simone
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasVagina()) pp.createVagina();
	pp.vaginas[0].wetnessRaw = 4;
	
	var x:int = 0;
	
	switch(response)
	{
		// Victory
		case "victory":
			output("Simone sits down and straddles the end of the bench, then");
			if(pc.hasArmor() || pc.hasLowerGarment())
			{
				if(pc.hasArmor()) output(" helps you out of your [pc.armor]");
				if(pc.hasArmor() && pc.hasLowerGarment()) output(" and");
				if(pc.hasLowerGarment()) output(" tugs your [pc.lowerUndergarment] down");
			}
			else output(" helps you out of your [pc.gear]");
			output(".");
			
			// If PC has no genitals (Special scene!)
			if(!pc.hasGenitals())
			{
				output("\n\nOnce she");
				if(!pc.isCrotchExposed()) output(" exposes your crotch");
				else output(" sees your crotch");
				output(", Simone gives a disappointed sigh, blowing one of her loose bangs from her face. <i>“Um, there’s nothing there, babe...”</i> she grumps.");
				output("\n\nYou sit up, and before you can say anything, she puts two fingers on your mouth.");
				output("\n\n<i>“Uhp--! Not. One. Word. If you wanted to tease me then mission accomplished, mis" + pc.mf("ter", "sy") + ".”</i> She politely returns your gear to you eying you to redress. <i>“If you ever come back for some more fun, do make sure you’re using the right equipment, okay?”</i>");
				output("\n\nWith that, you take your leave... but not before she gives you a big smack in the ass!");
				output("\n\n<i>“For playing with me,”</i> she winks, teasingly.");
				
				processTime(2);
				
				flags["SIMONE_TEASED"] = true;
			}
			// If PC has no penises (Vaginas only)
			if(!pc.hasCock() || (pc.isHerm() && rand(3) == 0))
			{
				x = rand(pc.vaginas.length);
				
				output("\n\nOnce she");
				if(!pc.isCrotchExposed()) output(" exposes your crotch");
				else output(" sees your crotch");
				output(", she gives [pc.eachVagina] a long look, and runs her thick tongue over her lips.");
				if(pc.totalVaginas() == 1) output(" <i>“Doesn’t that look nice,”</i> she says, and waggles her eyebrows at you.");
				else output(" <i>“Wow. You’re making me wish I had more than one tongue,”</i> she says. <i>“Not for the first time.”</i>");
				output(" She meets your eyes, to make sure you’re watching, then slips her tongue out from between her lips, and lets it dangle down past her chin. Simone’s tongue is easily three inches wide, and longer than some people’s cocks.");
				output("\n\nAnd she’s clearly looking forward to using it on you.");
				output("\n\nSimone licks you up one [pc.thigh], pauses to plant a kiss on [pc.oneVagina], then slowly trails her tongue down your other [pc.thigh], sending a shiver through you. She smiles at your reaction then does it again, using her tongue on your [pc.vagina " + x + "] this time, pressing its width against your lips.");
				output("\n\nSimone’s tongue covers all of your [pc.vaginaNoun " + x + "] in soft, smooth flesh, and she rubs it up and down, sliding it out to either side against your [pc.thighs] before returning to give you another long lick. This is definitely something she’s done before, " + (pc.hasLegs() ? "and you spread your legs wider" : "angle your crotch") + " to give her better access.");
				output("\n\n<i>“That’s it, [pc.name],”</i> Simone says, then laughs quietly. <i>“Just open wide and enjoy it.”</i>");
				output("\n\nBefore you can respond, Simone runs the tip of her tongue up and down over your [pc.vaginaNoun " + x + "], slowly at first, then picking up speed as pleasure runs through you. Your hands find the sides of the weight bench and squeeze, and you let out a moan as Simone’s tongue work continues.");
				output("\n\nSimone pulls back and kisses your [pc.vagina " + x + "] again, then slips her tongue between your lips, sliding the pink flesh up inside you. You gasp as the flexible organ wiggles back and forth, then curls up against the roof of your insides, the tip sliding forward and back, seeking out something.");
				output("\n\nThe busty cowgirl’s own lips are at work as well, pressed tight against your [pc.vaginaNoun " + x + "], her upper lip on the hood over [pc.oneClit]. This sends little shocks of pleasure through you, but it doesn’t seem to be her main focus.");
				output("\n\nSimone’s tongue lashes back and forth inside you, the tip pressing everywhere on your [pc.vaginaNoun " + x + "]’s upper wall, and then it hits a spot that makes you cry out. Your back arches, and you press your crotch harder against Simone’s face. She lets out a chuckle, sounding triumphant, and rubs the tip of her tongue against that one spot again.");
				output("\n\nYou squeeze your eyes shut and let out a loud groan as the sensations rip through you. Simone’s tongue has pinpointed the one spot inside you that feels the best, and she’s working her tip against it, massaging your g-spot and making you shake hard enough to rattle the weight bench against the floor.");
				output("\n\nSimone slows her tongue’s ministrations for a moment, just long enough for you to catch your breath as your [pc.girlCum] drips down her chin. Then, she picks up speed again, her eyes narrowing in amusement as you writhe under her touch.");
				output("\n\nShe goes through another two rounds of slowing and speeding up, bringing you closer and closer to orgasm every time, then backing off when you’re nearly there. When you finally feel yourself hit the point of no return, you’d tell her to slow down again if you could think clearly enough to form words. But the rippling pleasure from Simone’s tongue makes it hard to focus on anything else, and when she goes even faster than before and doesn’t let up, there’s nothing you can do to hold back.");
				// If PC doesn't make lots of girlcum
				if(!pc.isSquirter(x))
				{
					output("\n\nYour orgasm hits hard, and you shove your [pc.vagina " + x + "] against Simone’s face again, smashing your lips against hers. Holding onto the weight bench is all that keeps you from falling off as your entire body shakes, tremors passing through you from head to toe, your cries of pleasure echoing off the weight room ceiling.");
					output("\n\nWhen Simone pulls her tongue out, you’re breathing like you just ran a race, and it’s a moment before you can open your eyes again. When you do, you see her standing above you, running that amazing tongue over her lips.");
					output("\n\n<i>“Not bad, [pc.name]. ");
					// If PC's girlcum type=honey
					if(pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY) output("Actually, that’s delicious.”</i> She pauses, as though trying to identify the taste. <i>“Is that... honey?”</i> She chuckles. <i>“");
					output("And the way you out-lifted me, you deserved that.”</i>");
					output("\n\nSimone slowly stretches, and your gaze drops to her crotch. The bump between her legs is more prominent now; it looks like getting you off turned her on more than a little. She licks her lips once more, then smirks down at you. <i>“Come by and challenge me again sometime, but for now, I need a shower.”</i> Her hand trails down to her own crotch, and she murmurs, <i>“Might be in there a while...”</i>");
					output("\n\nYou lay back on the weight bench and try to catch your breath as the busty cowgirl heads for the showers.");
				}
				// If PC makes lots of girlcum
				else
				{
					output("\n\nYour orgasm hits hard, and you shove your [pc.vagina " + x + "] against Simone’s face again, smashing your lips against hers. Streams of [pc.girlCum] spray out of your [pc.vaginaNoun " + x + "], splashing across Simone’s face and hair and boobs, hosing her down completely. Holding onto the weight bench is all that keeps you from falling off as your entire body shakes, tremors passing through you from head to toe, your cries of pleasure echoing off the weight room ceiling.");
					output("\n\nWhen Simone pulls her tongue out, you’re breathing like you just ran a race, and it’s a moment before you can open your eyes again. When you do, you see her standing above you, your [pc.girlCum] dripping from her face down onto her bra-bound jugs. She looks a little surprised, but runs that amazing tongue over her lips.");
					output("\n\n<i>“Not bad, [pc.name]. ");
					// If PC's girlcum type=honey
					if(pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY) output("Actually, that’s delicious.”</i> She pauses, as though trying to identify the taste. <i>“Is that... honey?”</i> She chuckles. <i>“");
					output("And the way you out-lifted me, you deserved that.”</i>");
					output("\n\nSimone slides her tongue out again, licking your [pc.girlCum] off of one tit, then slowly stretches, and your gaze drops to her crotch. The bump between her legs is more prominent now; it looks like getting you off turned her on more than a little. She licks her lips once more, then smirks down at you. <i>“Come by and challenge me again sometime, but for now, I need a shower.”</i> Her hand trails down to her own crotch, and she murmurs, <i>“Might be in there a while...”</i>");
					output("\n\nYou lay back on the weight bench and try to catch your breath as the busty cowgirl heads for the showers.");
				}
				processTime(20);
			}
			// If PC has one penis
			else if(pc.cockTotal() == 1)
			{
				output("\n\nOnce she");
				if(!pc.isCrotchExposed()) output(" exposes your crotch");
				else output(" sees your crotch");
				output(", Simone gives your [pc.cocksLight] a long look.");
				// If PC has cock less than 12 inches:
				if(pc.cLength(0) < 12) output(" <i>“Not bad, [pc.name],”</i> she says, stroking one hand down your length as it grows stiff. <i>“Not quite on bull status, but think I’m going to enjoy playing with this one.”</i>");
				// If PC has cock 12 inches or longer:
				else output(" <i>“Well, damn, [pc.name],”</i> she says, hefting your [pc.cock] in her palm and letting your stiffening length slap against her flesh with a meaty thwack. <i>“Could have taken you for a native with a dong like that.”</i>");
				output("\n\nSimone slides off the weight bench, and lowers herself until her giant boobs are resting between your [pc.legs], your [pc.cocksLight] right at cleavage level. <i>“Now, let me show you what I can do with it.”</i>");
				output("\n\nShe meets your eyes, to make sure you’re watching, then slips her tongue out from between her lips, and lets it dangle down past her chin. Simone’s tongue is easily three inches wide, and longer than some people’s cocks.");
				output("\n\nAnd she’s clearly looking forward to using it on you.");
				output("\n\nSimone leans forward and takes your [pc.cockHead] between her lips, lets out a low moan as it slides into her mouth. She runs her wide tongue along the underside of your dick, back and forth, the slick flesh curling against it and rubbing up against both sides. After a moment, she pulls back and wraps her tongue around your [pc.cockHead], gently squeezing it inside her mouth. A few tugs of that is enough to make you groan, and Simone gives you a few more, then pulls back and smiles.");
				output("\n\n<i>“I never get tired of doing that,”</i> she says, clearly pleased with your reaction. <i>“Or this.”</i>");
				output("\n\nSimone leans forward again, as far as she can, and takes your [pc.cock] all the way into her mouth. Her tits shove up against your [pc.thighs], and she has to crank her head forward to get past them, even as her wide tongue slips back and forth and around your [pc.cocksLight]. She pulls back again, then looks down at her two massive mounds.");
				output("\n\n<i>“And these just keep getting in the way.”</i> She meets your eyes again, then rises on her knees and thrusts her chest forward, briefly trapping your cock beneath her enormous tits.");
				output("\n\nThen, Simone reaches under her chest to your [pc.cocksLight] and slides its slippery length up through her cleavage, her tight pink top holding everything in place. Your [pc.cock] is trapped, caught between her monumental mammaries with the head sticking out the top.");
				output("\n\n<i>“Much better,”</i> Simone says with another grin, then plants her palms on her tits, each hand nowhere near enough to contain either one. She slides her boobs up and down around your length, a tight and delightful squeeze. <i>“Don’t you think?”</i>");
				output("\n\nYou’re lucky you can think at all right now, and barely manage a nod and a smile before Simone gets back to it. She strokes her tongue over your [pc.cockHead] again and again, dropping down to wrap her lips around it and suck, then raising her head again to let her tits keep doing their work.");
				output("\n\nShe clearly has no problem with dragging this out, but you’re already not sure how long you can last. Your hands grip the sides of the weight bench, and you breathe deep, trying to hold on. Having your cock trapped between those two plush, firm orbs and getting such expert care lavished upon your [pc.cockHead] is enough to send you over the edge at any moment.");
				output("\n\nWith her head raised, Simone sticks her tongue all the way out again, and licks all around your [pc.cockHead] with just the tip, smearing your pre-cum all over. Her nipples are poking out from between her fingers, and she squeezes them through her sports bra, letting out a soft moan around her extended tongue.");
				output("\n\nThis seems to drive her on, as she drops down again and takes your [pc.cockHead] into her mouth, down far enough that she’s almost kissing her own tits, and squeezes your head tight with her tongue. She pauses for a moment, raises her eyes to meet yours, then starts tugging on your [pc.cockHead] with her tongue again.");
				output("\n\nYou let out another groan, and raise your [pc.hips] slightly as the sensation sweeps through you, trying to thrust more of your [pc.cock] between the dark cowgirl’s lips. Those lips squeeze tighter around your shaft as Simone’s tongue continues its work, and she presses her tits in harder, extending the squeeze down your entire length.");
				output("\n\nSimone closes her eyes as her tongue picks up speed, her head bobbing up and down along with her boobs, every bit of her focused on your [pc.cock]. She lets out little moans as her fingers continue to work her nipples, and for a second, you wonder if she could get herself off that way, right as she’s getting you off too.");
				output("\n\nYou realize that you won’t get to find out as you feel the orgasm start to hit you, and it’s all you can do to stay on the weight bench as Simone sucks you to a climax.");
				// If PC doesn't make lots of cum
				if(pc.cumQ() < 500)
				{
					output("\n\nYour [pc.cock] twitches between Simone’s lips and tits as [pc.cum] spurts through it, and you let out a cry, loud enough to carry over the sounds of the weight room. Simone keeps sucking, her tongue still tugging away, milking your [pc.cockHead] of every last drop. You can hardly catch your breath as she drains you dry, and for a moment, you wonder if she’s going to try to wring another one out of you.");
					output("\n\nSimone raises her head and swallows down your [pc.cum], then slips her wide tongue out and licks her lips. Even though she lost the lifting contest, she damn sure doesn’t look like she minds.");
					output("\n\n<i>“Not bad, [pc.name]. ");
					// If PC’s cum type=honey
					if(pc.cumType == GLOBAL.FLUID_TYPE_HONEY) output("Actually, that’s delicious.”</i> She pauses, as though trying to identify the taste. <i>“Is that... honey?”</i> She chuckles. <i>“");
					output("And the way you out-lifted me, you deserved that.”</i>");
					output("\n\nSimone slowly stands, letting your [pc.cock] slip out from between her boobs, leaving it to flop down on your [pc.thighs]. She licks her lips once more, then smirks down at you. <i>“Come by and challenge me again sometime, but for now, I need a shower.”</i> Her hand trails down to her own crotch, and she murmurs, <i>“Might be in there a while...”</i>");
					output("\n\nYou lay back on the weight bench and try to catch your breath as the busty cowgirl heads for the showers.");
				}
				// If PC makes lots of cum
				else
				{
					output("\n\nYour [pc.cock] twitches between Simone’s lips and tits as shot after shot of [pc.cum] spurts through it, and you let out a cry, loud enough to carry over the sounds of the weight room. Simone keeps sucking, her tongue still tugging away, until her cheeks start to puff out as your [pc.cum] fills her mouth. She swallows once, then again, then a third time, but can’t seem to keep up with your immense potency. You wonder for a second how much she can swallow, then she throws her head back, gasping.");
					output("\n\nYour [pc.cockHead], still sticking up from between Simone’s enormous boobs, continues to pour out [pc.cum], making a pool of it in Simone’s cleavage and sending it dripping down the sides of her tits. Your last shot splashes against her face, splattering over her cheeks");
					// if PC cum color=white
					if(pc.fluidColorSimple(pc.cumType) == "white") output(" and turning the dark cowgirl into a Holstein");
					output(".");
					output("\n\nSimone stares at you, still breathing hard, then slips her wide tongue out and licks your [pc.cum] from her face. <i>“Well, damn, [pc.name]. You didn’t tell me you would... come that much.”</i> She slowly gets to her feet, letting your [pc.cock] slip down and out from between her boobs, sending your [pc.cum] dripping down her chest and her flat stomach. She heads over to a rack of towels in the corner, and starts to rub herself clean, but mostly just smears your stickiness all over herself.");
					output("\n\nShe gives you a smirk as she passes by you on her way out. <i>“Come by and challenge me again sometime, but for now, I need a shower.”</i> She looks down at the mess you made of her cleavage, and she murmurs, <i>“Might be in there a while...”</i>");
					output("\n\nYou lay back on the weight bench and try to catch your breath as the busty cowgirl heads for the showers.");
				}
				processTime(20);
			}
			// If PC has 2+ penises
			else
			{
				output("\n\nHer eyes light up when she sees your [pc.multiCocks]. <i>“You’ve got... more than one,”</i> she says, sounding more than a little surprised. Her nipples get hard all at once, straining against her top’s stretchy fabric. It takes her a moment to stop staring, but when she finally raises her gaze from your [pc.crotch], she’s got a mischievous grin on her face.");
				output("\n\nSimone slides her hands up and takes one of your [pc.cocks] in each hand. As strong as she is, she clearly knows not to squeeze your lengths too hard, and you feel your shafts growing stiff as she leers down at you. <i>“Most guys here do just fine with one cock,”</i> Simone continues, leaning forward to rub the heads of your [pc.cocksLight] against her enormous tits. <i>“Only ever met one other person with two.”</i>");
				output("\n\nShe leans down and wraps her lips around your [pc.cockHeadBiggest], while her hand keeps working away at your [pc.cockSmallest]. Once your [pc.cockHeadBiggest] is properly lubed, she slides off the weight bench and drops to her knees, then takes your [pc.cockSmallest] all the way into her mouth, sliding her wide tongue down its length.");
				output("\n\nThe sensation as Simone’s cow-tongue works its magic is almost enough to make you ask her to just keep going, but you can guess what she has in mind, and it doesn’t seem like you could talk her out of it if you tried.");
				output("\n\nSimone gives your [pc.cockSmallest] one last long good slurp, then stands up and grins down at you again, reaching for the waistband of her tight pink shorts. <i>“Now, I normally settle my gym bets with oral, one way or another, but I’m not giving this up.”</i>");
				output("\n\nThe dark-skinned cowgirl turns and pulls down her clingy shorts, giving you a shot of her curvy, supple ass. She kicks the garment off, making her rear shake, then turns around again. Her pussy lips are thick and glistening, and the head of her clit is already poking out from beneath its hood, easily as big around as her thumb. She steps forward and gives your [pc.cockBiggest] and [pc.cockSmallest] a few more strokes, making sure you’re staying hard, then looks down at you, the smirk on her face making it clear you’re in for a wild ride.");
				output("\n\nYou grin back at her, and tell her to bring it on.");
				output("\n\nSimone takes hold of your [pc.cockBiggest], aims it at her wet lips, and squats down onto you, sliding your cock up into her with practiced ease. She clenches around you as you slip into her, just enough to hold your [pc.cockBiggest] in place, then stands halfway up, her mouth partway open, her eyes half-closed. Then, she reaches back and takes hold of your [pc.cockSmallest], sliding its spit-slick length along her ass until it reaches the canyon between her cheeks.");
				output("\n\nWith a moan that quickly turns into a gasp, Simone pops the head of your [pc.cockSmallest] into her tight asshole, and leans back as she sinks down, slowly taking your length up her ass.");
				output("\n\nYou reach out and wrap your hands around Simone’s curvy hips, not sure whether to start thrusting or not. The dueling sensations of Simone’s pussy and tight ass around your cocks are nearly enough to make you come right away, and there’s no way you’re going to let this go that easily. Simone tilts her hips forward and back, like she’s adjusting to being double-penetrated, and takes a moment to catch her breath.");
				
				pc.cockChange();
				
				output("\n\n<i>“Wow,”</i> Simone says. Her chest heaves as she tries to catch her breath, her boobs wobbling back and forth within her top’s confines. <i>“That’s... mmmh...”</i> She bites her lip and starts to rock her hips back and forth, the pressure on your [pc.cockBiggest] and [pc.cockSmallest] shifting with every motion, then breaks into another wide grin as she finds the motion that works best.");
				output("\n\nAs Simone’s pussy and ass massage your lengths with every movement, your hands trace up her sides. She leans forward a little, and takes hold of the weight bar overhead, pushing down on it as she shoves her hips back against your crotch. This puts her swaying breasts right over your [pc.chest], and you reach up and take hold of them, stroking along their curving sides.");
				output("\n\n<i>“Nipples,”</i> Simone gasps, her breath coming quicker and shorter with every thrust the two of you make. <i>“Play with – my nipples...”</i>");
				output("\n\nYou slide your hands across her boobs, and tweak both Simone’s nipples at once, making her gasp again. Her pussy and ass clench down again around your [pc.cockBiggest] and [pc.cockSmallest], and her thighs tighten around your [pc.hips], reminding you just how strong the woman riding you really is.");
				output("\n\nThe sound of your flesh slapping together fills the weight room, and you hear some calls of encouragement from the bulls and cows gathered there. No surprise that you’ve attracted an audience, the way Simone’s moaning. You would look to see if anyone was watching from outside, but the dark-skinned cowgirl riding your lap keeps your attention focused on her.");
				output("\n\nSimone leans back all at once, her rear passage squeezing your [pc.cockSmallest] all the way up inside her, and whips off her top, sending it flying across the room as her tits go free. She resumes bouncing atop you, then reaches forward, grabs your hands and holds them to her boobs. She takes hold of the weight bar again and urges you, <i>“Harder!”</i>");
				output("\n\nThat seems like an order. You plant your [pc.feet] and thrust as hard as you can, driving your [pc.cockBiggest] and [pc.cockSmallest] up into her with a renewed fury. Simone cries out, head tilting back as she gasps, sweat dripping down her neck to get lost in her cleavage as you squish her boobs together and fondle her nipples.");
				output("\n\nThe weight bench creaks beneath you. Simone’s sweat spatters across your [pc.chest]. Her arms flex with every thrust she makes against your crotch, making her muscles stand out. You roll her nipples between your fingers, making her cry out again and squeeze your cocks tighter within her.");
				output("\n\nFinally, Simone leans back again and clenches around your [pc.cockBiggest] and [pc.cockSmallest], crying out in orgasm so loud it echoes off the weight room’s ceiling. Her whole body tenses at once, and you keep thrusting, so close–");
				// If PC doesn't make lots of cum
				if(pc.cumQ() < 500)
				{
					output("\n\nYou let out a long groan as the orgasm hits you, your [pc.cockBiggest] and [pc.cockSmallest] firing off jets of [pc.cum] into both of Simone’s holes, your whole body shaking.");
					if(pc.cockTotal() == 3) output(" Your unused cock fires off at Simone’s chest, splattering the undersides of her tits with [pc.cumColor].");
					else if(pc.cockTotal() > 3) output(" Your unused cocks fire off at Simone’s chest, splattering the undersides of her tits with [pc.cumColor].");
					output("\n\nThe lifting contest followed by Simone’s back-breaking ride makes you feel like you’ve run a marathon. She collapses atop you, sweaty and breathing hard, her boobs squishing across your [pc.chest].");
					output("\n\nIt takes a moment for the two of you to catch your breath, but Simone slowly sits up, a glazed look in her eyes. <i>“That... was amazing,”</i> she breathes, and takes hold of the weight bar again to lever herself off of you. She stands with a groan, letting your [pc.cockBiggest] and [pc.cockSmallest] free of her, and walks wide-legged over to a rack of towels in the corner.");
					output("\n\nYou and Simone towel each other off, and she picks up her top and shorts and throws them over her shoulder. <i>“I need a shower after that,”</i> she says, and lets out a long breath. She gives you another grin, this one very satisfied. <i>“Come back and challenge me again sometime, [pc.name],”</i> she says, then lets out a laugh. <i>“But I think I win either way.”</i>");
				}
				// 
				else
				{
					output("\n\nYou let out a long groan as the orgasm hits you, your [pc.cockBiggest] and [pc.cockSmallest] firing off jet after jet of [pc.cum] into both of Simone’s holes, your whole body shaking. It’s more than she can hold, and your [pc.cum] surges out of her, front and back, splattering over her legs and yours alike.");
					if(pc.cockTotal() == 3) output(" Your unused cock fires off at Simone’s chest, coating the undersides of her tits and all of her tight abs with [pc.cumColor], sending [pc.cum] dripping down to her crotch.");
					else if(pc.cockTotal() > 3) output(" Your unused cocks fire off at Simone’s chest, coating the undersides of her tits and all of her tight abs with [pc.cumColor], sending [pc.cum] dripping down to her crotch.");
					output("\n\nThe lifting contest followed by Simone’s back-breaking ride makes you feel like you’ve run a marathon. She collapses atop you, sweaty and breathing hard, her boobs squishing across your [pc.chest]. Your legs and hers feel like they might end up glued together if you stay like this for too long, but right now, it’s hard to move.");
					output("\n\nIt takes a moment for the two of you to catch your breath, but Simone slowly sits up, a glazed look in her eyes. <i>“That... was amazing,”</i> she breathes, and takes hold of the weight bar again to lever herself off of you. She looks down at the mess you made, and blinks a few times. <i>“You didn’t tell me... I’ll call someone to clean this up.”</i> She stands with a groan, letting your [pc.cockBiggest] and [pc.cockSmallest] free of her, and walks wide-legged over to a rack of towels in the corner. Your [pc.cum] drips down her ass and legs with every step, and she leaves a trail of it across the gym floor.");
					output("\n\nYou and Simone towel each other off, and she picks up her top and shorts and throws them over her shoulder. <i>“I need a shower after that,”</i> she says, and lets out a long breath. <i>“I might be in there for an hour or two.”</i> She gives you another grin, this one very satisfied. <i>“Come back and challenge me again sometime, [pc.name],”</i> she says, then lets out a laugh. <i>“But I think I win either way.”</i>");
				}
				processTime(20);
			}
			
			if(pc.hasGenitals())
			{
				pc.exhibitionism(2);
				pc.orgasm();
				pc.orgasm();
				IncrementFlag("SEXED_SIMONE");
			}
			else
			{
				pc.lust(50 + rand(21));
				pc.HP(-1);
			}
			
			StatTracking.track("contests/simone challenge wins");
			
			// [Done] Go to Weight Room
			addButton(0, "Next", mainGameMenu);
			break;
		// Defeat
		case "defeat":
			output("Simone turns around and slowly pulls down her clingy workout shorts, giving you a view of her fit, shapely ass as she drops the garment down to her feet. She turns back halfway as she bends to pick her shorts up, the muscles in her thighs flexing. With a smirk, she drops her shorts on your crotch as she stands back up, and says, <i>“Hold those for me.”</i> Then, she slings one leg over the weight bench and stands above you, hands on her hips, naked from the waist down.");
			output("\n\nSimone’s pussy lips are thicker than most womens’, puffed up enough to give her that prominent cameltoe, glistening in the gym’s light. It looks like the thought of claiming her victory over you has her plenty aroused, as her clit is peeking out from under its hood, swollen as big around as her thumb.");
			output("\n\nWith a mischievous giggle, Simone steps forward, moving her exposed crotch closer and closer to you, until it’s only a few inches from your face. You can smell her now, the musk of her arousal mixed with a faint hint of sweat. When you look up, most of what you can see is Simone’s enormous boobs straining against her sports bra, but above those, she looks very pleased with herself. This is clearly a position she enjoys being in.");
			output("\n\n<i>“Take a deep breath,”</i> she says with a grin, and slides forward, meeting your [pc.lips] with her wet lips.");
			output("\n\nYou give Simone’s pussy a long lick from bottom to top, then another, sliding your [pc.tongue] all over her puffy lips, starting off slow and getting used to her taste. She eases herself further forward, her strong thighs coming to rest on either side of your face. You keep licking, working your way into an easy rhythm and letting your hands crawl up to rest on Simone’s hips.");
			output("\n\n<i>“Mmmhh...”</i> Simone lets out a quiet moan, and her nipples stiffen, poking through her tight top. She pushes herself forward a little more, pressing her lips against yours, clearly eager for more.");
			output("\n\nYou flick the tip of your [pc.tongue] between Simone’s lips, then slide it in a little further as her breathing quickens. You tease her a bit, darting your tongue farther into her each time, then pulling out to lick her lips again, lavishing attention on each one before returning to sliding your tongue inside. She’s getting wetter, small drops of her fluids dripping down your cheeks.");
			output("\n\nThen, you slide your tongue up to the top of her pussy, and run it against her bulging clit. Simone’s breath catches in her throat, and she drops one of her hands to your head, slides her fingers into your [pc.hair].");
			output("\n\n<i>“There,”</i> Simone gasps. <i>“Do my clit.”</i>");
			output("\n\nIt’s probably best to obey someone who’s straddling your face. You slowly slide your tongue over Simone’s giant clit again, and she lets out a long, low moan, then another, almost in time with your motions. Her hand tightens in your [pc.hair], and she takes hold of her tit with her other hand, her fingers tweaking her hard nipple.");
			output("\n\nSimone’s clit swells up further at your attentions, and peeks all the way out from under her hood, a throbbing knob almost large enough to fuck someone with. You fold your [pc.tongue] into a U shape and wrap it around her clit’s underside, then proceed to slide your tongue up and down her clit’s length, pressing your upper lip over the top of it.");
			output("\n\nSimone cries out, her fingers clenching in your [pc.hair], and she presses her pussy harder against your face, jamming her clit against your lips and tongue. Her breathing’s coming faster now, and you keep tongue-fucking her clit, making her gasp again with each thrust. She still has one nipple clenched between her fingers, so you reach up and tweak her other one, making her twitch.");
			output("\n\n<i>“Keep going,”</i> Simone pants, her eyes closed, her lips pursed. Her hand’s squeezing her own boob so hard that her dark flesh is puffing out of the top of her sports bra, jiggling with every breath.");
			output("\n\nYou thrust your [pc.tongue] against her throbbing clit faster, rolling her nipple between your fingers in time. Your cheeks are damp with Simone’s juices by now, and her thighs twitch tighter on either side of your face, her muscles flexing. She has to be close, looks like she’s about to–");
			output("\n\nSimone throws her head back and cries out, her orgasmic yell echoing off the ceiling, enough to ring out over the sound of machines and weights and curious onlookers. A final splash of her fluids spatters over your lips and cheeks, and her hand in your [pc.hair] relaxes, her fingers twitching against your head. She leans back, gasping, then blows out a long breath.");
			output("\n\n<i>“Damn, [pc.name],”</i> Simone breathes. She lets out a quick laugh, then scoots back a little, so her toned ass rests against your [pc.chest]. When she looks down at you, she seems dazed and more than a little pleased.");
			output("\n\n<i>“You know, not everyone knows what to do with this,”</i> Simone says, brushing her fingers over her still-throbbing clit. <i>“But damn... you did good.”</i> Simone slowly stands, using the weight bar for support as she hoists herself off the bench, then picks up her pink shorts from where she left them on your crotch and slings them over her shoulder. <i>“And I need a shower after that.”</i>");
			output("\n\nShe turns to go, but gives you one last look over her shoulder before she leaves. <i>“Come by and challenge me again sometime, [pc.name],”</i> she says, and gives you a confident grin. <i>“Whenever you’re up to it.”</i>");
			output("\n\nSimone saunters out of the weight room, leaving you lying there with a sticky face and a sore tongue.");
			
			processTime(20);
			pc.loadInMouth(pp);
			pc.loadInMouth(pp);
			pc.exhibitionism(2);
			pc.lust(30+rand(10));
			applyPussyDrenched(pc);
			
			if(!pc.hasGenitals() && flags["SIMONE_TEASED"] == undefined) flags["SIMONE_TEASED"] = true;
			
			IncrementFlag("SEXED_SIMONE");
			StatTracking.track("contests/simone challenge losses");
			
			// [Done] Go to Weight Room
			addButton(0, "Next", mainGameMenu);
			break;
		// Failsafe
		default:
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

// Lola
public function lolaPoolApproach():void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("\nLOLA");
	showBust("LOLA");
	clearMenu();
	
	if(flags["MET_LOLA"] == undefined)
	{
		output("You enter the pool and wade over toward the naked cowgirl as she strokes her way across the pool. She doesn’t seem to notice your approach, so you time it so she bumps into you on her way. As soon as you two collide, she looks up, then flips herself over and stands, surprise clear on her round face.");
		output("\n\n<i>“Oh, I’m sorry!”</i> she says, then gives you a long look up and down, her blue eyes wide. <i>“Hi there,”</i> she says, a smile spreading across her face. <i>“I’m Lola. Haven’t seen you here before, huh?”</i>");
		output("\n\nLola’s only a little over five feet tall, but her hips would look wide on a woman twice her size; on her, they seem almost comically exaggerated. Her butt is appropriately bulbous, with curvy thighs beneath it. Soaked red hair trails down to her shoulders, clearly her natural color, if the little tuft above her pussy is any indication. Two short white horns peek out from among her locks, and her ears are cowlike and floppy. Her skin is pale, and she has the large boobs common among New Texans, with hard, pink nipples.");
		output("\n\nYou introduce yourself to the bright-eyed cowgirl, and ask if she’s here working out, or if she just likes to swim.");
		output("\n\n<i>“Little of both,”</i> Lola says, nodding a few times. <i>“Sometimes I feel like I need a workout, but mostly I just like to swim. Or to fuck.”</i> Her smile grows a little devious as her gaze trails over your [pc.chest]. <i>“Have you ever had sex with someone who’s floating?”</i>");
		output("\n\nYou consider it for a moment, and tell her no, you haven’t. Lola looks down at your crotch.");
		
		flags["MET_LOLA"] = 1;
		processTime(2);
		
		if(!pc.isCrotchGarbed())
		{
			if(pc.hasCock()) output("\n\n<i>“That’s too bad,”</i> she says, not taking her eyes off your [pc.cock]. A blush spreads across her cheeks and down her chest, turning the skin on her breasts the palest pink. <i>“Do you want to try it? Like, right now?”</i>");
			else output("\n\n<i>“That’s too bad,”</i> she says, and looks up from your [pc.crotch] after a moment. <i>“And you don’t have anything to fuck me with. Darn.”</i>");
		}
		else
		{
			output("\n\n<i>“Soooo....”</i> Lola says, then looks back up at you, a blush spreading across her cheeks. She reaches out and rests one hand on your [pc.hip], and seems to be waiting for your permission to move her hand in closer to your crotch. <i>“You got anything under there for me?”</i>");
			if(pc.lowerUndergarment.hardLightEquipped)
			{
				if(pc.hasCock()) output("\n\nYou shake your head, and tell Lola that while you have a penis, you are not planning on using it at the moment.");
				else output("\n\nYou shake your head, and tell Lola that you don’t have the dong she’s looking for.");
				output("\n\n<i>“That’s too bad,”</i> she says, and gives your [pc.hip] a squeeze before pulling her hand away. <i>“And you look like you’d be fun, too. Darn.”</i>");
				if(pc.lowerUndergarment.hardLightEquipped)
				{
					output("\n\nYou mention that you’ve got a hardlight strapon back with your gear, and you can get it if she’s down for that.");
					output("\n\nLola nods eagerly, her eyes lighting up. <i>“Ooh, those things are fun,”</i> she says. A blush spreads across her cheeks and down her chest, turning the skin on her breasts the palest pink. <i>“Can you go get that? Please?”</i>");
				}
			}
			else if(pc.hasCock())
			{
				output("\n\nYou take hold of Lola’s hand and move it over your [pc.crotch], letting her feel what you’ve got. Her eyes light up as she feels out your [pc.cock] through your swimsuit, her fingers stroking down your length to your [pc.cockHead].");
				output("\n\n<i>“Ooh, that feels like fun,”</i> she says. Her blush spreads from her cheeks down to her chest, turning the skin on her breasts the palest pink. <i>“Do you want to fuck me? Like, right now?”</i>");
			}
		}
		
		if(!pc.lowerUndergarment.hardLightEquipped && !pc.hasCock())
		{
			output("\n\nYou ask if she’s still up for whatever you two can do together. Fingers and lips and tongues can do a lot.");
			output("\n\n<i>“Oh, but it’s not the same,”</i> Lola says, pouting a little. <i>“And I really like to be, you know–”</i> She thrusts her voluminous hips in your direction, sending a small wave crashing against you. <i>“–penetrated. Sorry, [pc.name].”</i>");
			output("\n\nLola swims away, flipping onto her back again after a few strokes, leaving you alone.");
			
			// [Done] Go to Swimming Pool
			addButton(0, "Next", mainGameMenu);
			return;
		}
		
		// [Yep] Go to FloatFuck
		// [Nope] Go to NoFloatFuck
		if (pc.lust() < 33) addDisabledButton(0, "Yep", "Yep", "You are not aroused enough for this.");
		else addButton(0, "Yep", lolaPoolSex, "yep");
		addButton(1, "Nope", lolaPoolSex, "nope");
	}
	else
	{
		output("You enter the pool and wade over to the wide-hipped cowgirl as she swims her laps. Remembering your first encounter, you pause where she’ll bump into you as she swims. When Lola’s pale shoulder rubs up against you, she looks up, then gives you a sweet smile as she stands.");
		output("\n\n<i>“Hi there, [pc.name],”</i> Lola says. Her cheeks turn pink, and she twirls one finger into her shoulder-length red hair. <i>“Good to see you. You just here to swim, or....”</i> She shakes her ample hips in your direction a few times, and giggles, and leaving no doubt at all what she’s asking.");
		
		// [Yep] Go to FloatFuck {requires penis or strap-on}
		// [Nope] Go to NoFloatFuck
		if (pc.lust() < 33) addDisabledButton(0, "Yep", "Yep", "You are not aroused enough for this.");
		else if(pc.lowerUndergarment.hardLightEquipped || pc.hasCock()) addButton(0, "Yep", lolaPoolSex, "yep");
		else addDisabledButton(0, "Yep", "Yep", "You don’t have the proper equipment to do this!");
		addButton(1, "Nope", lolaPoolSex, "nope");
	}
}
public function lolaPoolSex(response:String = ""):void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("\nLOLA");
	showBust("LOLA");
	clearMenu();
	
	switch(response)
	{
		// FloatFuck
		case "yep":
			var x:int = -1;
			if(!pc.lowerUndergarment.hardLightEquipped && pc.hasCock()) x = rand(pc.cocks.length);
			
			output("You tell Lola that you would, in fact, like to fuck her while she’s floating.");
			if(x < 0) output(" You hurry out of the pool and don your [pc.lowerUndergarment], then return to Lola and activate the hardlight dildo.");
			output(" She gives you an eager grin, and rubs her hands together as she giggles. <i>“C’mon,”</i> she says, reaching down toward your [pc.crotch]. <i>“Let’s get to the right water level.”</i>");
			output("\n\nLola takes hold of your [pc.cockOrStrapon " + x + "] and leads you across the pool. She strokes you gently as she walks, her fingers easily slipping up and down your tool, the water’s synthetic decontaminant acting like a low-grade lube. When the water is right at your crotch level, Lola stops and backs up against you, leaning her wide, plump ass against your [pc.crotch], sliding your [pc.cockOrStrapon " + x + "] between her jiggly cheeks.");
			output("\n\n<i>“You like that, [pc.name]?”</i> Lola asks, then looks back over her shoulder and gives you a bright smile. Bent over like she is, her boobs are dipping halfway into the water, splashing as she rubs her rear against you.");
			output("\n\nDamn right you do.");
			if(x < 0) output(" Lola’s got your hardlight caught tight between her cheeks, and the friction makes your [pc.lowerUndergarment] rub against your [pc.vagOrAss], leading to some very pleasurable friction. The slippery water only makes it better, and you let out a low moan as your arousal rises.");
			else output(" With an ass like hers, Lola can hotdog you like no other. Your [pc.cock " + x + "] is caught between her warm, wet cheeks, and the water’s just slippery enough to keep both of you moving nicely. She clenches her ass, giving your [pc.cock " + x + "] a tight squeeze, and you let out a low moan as you become fully erect.");
			output("\n\nYou reach down and wrap your hands around Lola’s hips, fingers sinking into her pale flesh, and grind against her, then reach one hand down to her pussy. She lets out a gasp as your fingers trail against her slippery lips, and presses her ass harder against you. After a few good strokes, she’s breathing hard, and when you slide a finger inside, she’s clearly ready to go.");
			output("\n\nLola releases your [pc.cockOrStrapon " + x + "] from her ass’s grip, then turns to face you. She lifts up one leg and hooks it over your [pc.hip], then gives you a look, her face red, her eyes slightly dazed. <i>“You’ve got to hold me up, okay?”</i> she says. <i>“I’ll wrap my legs around you when we get going, but I can’t hold myself up and fuck you at the same time. You good?”</i>");
			output("\n\nYou assure Lola that you’ll hold her up, and hold still as she gets herself situated. Lola holds onto your sides, lifts her other leg up and crooks it around you, her feet tapping against your [pc.ass]. She spreads her arms as you take hold of her hips, and you align your [pc.cockOrStrapon " + x + "] with her pale pink twat, ready to slide it in.");
			output("\n\n<i>“Ooooooohhh....”</i> Lola moans as she wraps her legs around your [pc.hips], pulling your [pc.cockOrStrapon " + x + "] into her slippery hole. She takes you to the hilt in one pull, clenching her legs around you, waving her arms back and forth to keep herself afloat. Her boobs wobble back and forth as she lies back, her nipples pointing toward the ceiling.");
			output("\n\nYou wrap your hands farther around her plump ass, grunting a little as you make sure you’ve got a good hold on her. It takes a moment, but the two of you find your balance, and you start with a few slow, easy thrusts. Water splashes up between your crotch and hers with every push, and Lola lets out a few quiet gasps as you start to get into a rhythm.");
			output("\n\nA slow smile spreads across Lola’s face as her legs tighten around you, and she arches her back a little, arms still treading water. <i>“Faster,”</i> she says, and you pick up your pace, bucking your hips harder as your [pc.cockOrStrapon " + x + "] pounds away at her slippery slit. You feel her heels pressing into the small of your back, just above your [pc.ass], drumming against your [pc.skinFurScales] as she grinds herself against you.");
			output("\n\nThe wide-hipped cowgirl’s pale breasts are shaking faster now, and you thrust harder to match them, sending waves rippling out around you both. Lola’s breath comes in small gasps, her eyes closed, her pink pussy");
			if(x < 0) output(" making your strapon grind hard against your [pc.vagOrAss].");
			else output(" clenching down hard around your [pc.cock " + x + "].");
			output("\n\nYou tilt your [pc.hips] up a little to get a better angle on her, and Lola’s eyes snap open wide as she lets out a cry. Well, that worked. You keep thrusting, and the cowgirl’s gasps turn into high-pitched moans as your [pc.cockOrStrapon " + x + "] hits exactly the right place. She arches her back harder, dipping her forehead into the water and sending her boobs tumbling toward her chin, and gasps out <i>“Don’t stop!”</i>");
			output("\n\nNot that you were going to. You tighten your grip on Lola’s magnificent ass and redouble your efforts, the water frothing around her crotch as you pound your [pc.cockOrStrapon " + x + "] harder and harder into her. After another dozen or so thrusts, Lola lets out a scream that echoes off the high ceiling, and her legs clench hard around you, driving her heels into your back as she comes.");
			output("\n\nHer pussy’s death-grip on your [pc.cockOrStrapon " + x + "] loosens a moment later, and she slowly pulls herself off of you, her legs unwinding themselves from around your [pc.hips] as she does. It takes her a moment to find her feet again, but when Lola looks up at you, she seems more than a little dazed. <i>“Oh, that was good,”</i> she says, drawing out the last word as she leans against you. After a moment, she blinks, then shakes her head, sending water flying off her hair and long ears. <i>“But you didn’t come yet.”</i>");
			output("\n\nYou shake your head, and give her a rueful smile as you");
			if(x < 0) output(" remind her a strapon doesn’t get soft.");
			else output(" indicate your still-hard [pc.cock " + x + "].");
			output("\n\nLola giggles, and runs her tongue over her upper lip. <i>“Can I have another one?”</i>");
			output("\n\nNo way you’d say no to that, especially since you haven’t gotten yours yet. Lola turns around and slides her expansive ass against your [pc.cockOrStrapon " + x + "] again, but leans farther forward this time, until she can lift one leg up and wrap it back around your hips.");
			output("\n\n<i>“Hold me up again,”</i> she says, looking back at you, <i>“then slide that thing on in!”</i>");
			output("\n\nYou take hold of Lola’s hips once more, lifting her up just enough to aim your [pc.cockOrStrapon " + x + "]’s head at her slick pussy. She lifts her other leg and kicks herself backward, then lets out a low moan as you slide back into her.");
			output("\n\nYou almost lose your grip as you push your [pc.cockOrStrapon " + x + "] inside, but Lola’s curvy legs wrap tight again around your [pc.hips], locking her into place with little trouble. Her ass slaps hard against your [pc.belly], sending water flying everywhere.");
			output("\n\nLola’s arms sweep back and forth as her legs tighten around you, and she lets out a small gasp with every thrust, her boobs waving forward and back under the water. Her pussy starts clenching down on your [pc.cockOrStrapon " + x + "] once more,");
			if(x < 0) output(" increasing the friction against your [pc.vagOrAss]");
			else output(" squeezing harder with every thrust");
			output(", and you get the feeling it won’t take long for her to come again.");
			output("\n\nAnd you’re not far off either. You feel your orgasm building with every thrust of your [pc.cockOrStrapon " + x + "] into Lola’s squeezing snatch, and watching her ass slam against you only brings it closer. The pale cowgirl is moaning again now, loud enough to echo off the high ceiling, and you see that quite a few of the swimmers have stopped to watch you two fuck.");
			output("\n\nYou remember what worked on Lola before, and angle your [pc.hips] down this time, driving harder into her. She cries aloud, and her legs tighten around you, her crotch pounding against yours so hard you think your hips might break.");
			output("\n\n<i>“I – I’m gonna,”</i> Lola gasps, and the rest of her words are lost in one long, loud moan that turns into a <i>“Moooooo––”</i> somewhere along the way.");
			output("\n\n");
			if(x < 0) output("The friction from your incessant thrusting finally builds up enough to hit home, and you feel your [pc.vagOrAss] twitch as your orgasm hits. You match Lola’s moan with one of your own, your hips moving of their own accord to make it last as long as you can get it.");
			else
			{
				output("You give in to the sensation that’s been building at the base of your [pc.cock " + x + "], and let out a long groan as your orgasm finally hits. Your [pc.cum] bursts out of you all at once and gushes into Lola’s tight pussy");
				if(pc.cumQ() >= 500) output(", enough to make her pale belly swell");
				output(".");
				pc.cockChange();
			}
			output(" Your hands clench hard on Lola’s wide hips as the sensation rips through you, and you struggle to stay " + ((pc.hasLegs() && pc.hasKnees()) ? "standing, your knees suddenly weak" : "propped up") + ".");
			output("\n\nYou’re not sure who slowed first, but you and Lola both find yourselves out of breath as you come down, and it takes a moment for you to pull yourselves apart. She eases herself off of your [pc.cockOrStrapon " + x + "] with a giggle, then turns to you and presses her boobs against your [pc.chest], and pulls you close for a quick kiss.");
			output("\n\n<i>“That was amazing, [pc.name],”</i> Lola moans, drawing out the words. <i>“Come find me again sometime, okay?”</i>");
			output("\n\nYou nod, and she gives you a smile and floats away.");
			
			// [Done] [+2% Exhibitionism] Go to Swimming Pool
			processTime(15);
			pc.exhibitionism(2);
			pc.orgasm();
			pc.orgasm();
			
			IncrementFlag("SEXED_LOLA");
			
			addButton(0, "Next", mainGameMenu);
			break;
		// NoFloatFuck
		case "nope":
			output("You tell Lola that you’re just not into that. She pouts at you a little, then shrugs it off with a giggle. <i>“Aww, no problem. I’m sure someone else here’s up for it.”</i>");
			output("\n\nLola floats off, the peaceful smile returning to her face.");
			
			processTime(2);
			
			// [Done] Go to Swimming Pool
			addButton(0, "Next", mainGameMenu);
			break;
		// Failsafe
		default:
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

/*
// Betsy and Victoria
public function showerWithBetsyAndVictoriaApproach():void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("BETSY &\nVICTORIA");
	showBust("BETSY", "VICTORIA");
	
	if(flags["MET_SHOWER_GIRLS"] == undefined)
	{
		output("One of the girls is a tanned blue-eyed blonde with a figure so much the New Texas ideal she could have stepped off of a travel brochure, her huge tits almost impossibly perky with nipples staring straight at you. Her hair’s pulled back in low pigtails dangling past her shoulders.");
		output("\n\nThe other has black hair with bangs trimmed straight above her eyebrows, and stands taller and a little less curvy, but with quite a bit more tone, clearly no stranger to the gym. She’s also packing eight inches of horsecock, an uncommon sight on the local girls.");
		output("\n\n<i>“Hi there, cutie,”</i> the blonde says, then giggles as she looks you over. <i>“I’m Betsy. This–”</i> She pauses to squeeze her partner’s ass, prompting the other girl to spank her, hand smacking hard across Betsy’s jiggling flesh. <i>“–is Victoria.”</i>");
		output("\n\n<i>“Hi,”</i> Victoria says, and gives you an appraising look. Her eyes are heavy-lidded, but she looks like she likes what she sees.");
		output("\n\nYou introduce yourself, and ask if the two come here often.");
		output("\n\n<i>“Most every time we’re here,”</i> Victoria says. <i>“It’s a good place to find new friends to play with.”</i>");
		output("\n\nYou mention that you haven’t seen many herms here on New Texas, though you’ve met quite a few others on your journeys. Victoria smiles, looking kind of proud, but it’s Betsy who speaks up, blushing as she laughs.");
		output("\n\n<i>“Oh, that’s a funny story. We used to use a strapon, but I kept breaking them. I, um, get a little rough sometimes.”</i>");
		output("\n\nYou stare at Betsy for a moment, and hope she’s talking about low-tech strapons. If the girl has a habit of breaking hardlights, you might be in for a rough time.");
		output("\n\n<i>“And,”</i> Victoria says, <i>“I always wondered what it felt like to have a cock. So I thought I’d give it a try.”</i> She strokes a hand down her length, joined by Betsy’s hand a moment later. <i>“I wouldn’t give up this thing for the world.”</i>");
		
		flags["MET_SHOWER_GIRLS"] = 1;
	}
	else
	{
		output("\n\nThe tanned, blue-eyed blonde Betsy and the tall, raven-haired herm Victoria approach you again, both as perky and proud as ever.");
	}
	output("\n\n<i>“</i>Sooooo,<i>”</i> Betsy says, twirling a lock of blonde hair around one finger, <i>“you want to play with us? You can pick who gets to be in the middle.”</i>");
	
	processTime(1);
	
	// [Oh Yeah] Go to Sandwich Selection [+40 Lust] {Remove all [Sweaty]} {Time: 10 minutes}
	// [Just Teasing] Go to Sandwich Denial [+40 Lust] {Remove all [Sweaty]} {Time: 10 minutes}
	clearMenu();
	addButton(0, "Oh Yeah", showerWithBetsyAndVictoriaSelect, "yes");
	addButton(1, "Just Teasing", showerWithBetsyAndVictoriaSelect, "denial");
}
// Sandwich Selection
public function showerWithBetsyAndVictoriaSelect(response:String = ""):void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("BETSY &\nVICTORIA");
	showBust("BETSY", "VICTORIA");
	clearMenu();
	
	switch(response)
	{
		case "yes":
			output("<i>“Ooh, good,”</i> Betsy says. <i>“I thought you looked like fun.”</i> She presses her wet body against you, her boobs slipping against your [pc.chest], while Victoria slides up against your other hip, and rubs her dong against your thigh.");
			output("\n\n<i>“So, your choice, [pc.name],”</i> Victoria says. <i>“Who gets to be in the middle?”</i>");
			
			processTime(1);
			
			// [Betsy] Go to Betsy Sandwich
			// [Victoria] Go to Victoria Sandwich
			// [You] Go to You Sandwich
			addButton(0, "Betsy", showerWithBetsyAndVictoriaSelect, "betsy", "Betsy", "Betsy Sandwich");
			addButton(1, "Victoria", showerWithBetsyAndVictoriaSelect, "victoria", "Victoria", "Victoria Sandwich");
			addButton(2, "You", showerWithBetsyAndVictoriaSelect, "you", "You", "[pc.name] Sandwich");
			break;
		// Betsy Sandwich
		case "betsy":
			// [Not yet written] You and Victoria double-penetrate Betsy in between you two.
			
			// 9999
			
			processTime(10);
			pc.lust(30+rand(10));
			pc.exhibitionism(2);
			pc.removeStatusEffect("Sweaty");
			
			IncrementFlag("SHOWER_SANDWICH");
			
			// [Done] Go to Locker Room and Showers [+2% Exhibitionism]
			addButton(0, "Next", mainGameMenu);
			break;
		// Victoria Sandwich
		case "victoria":
			// [Not yet written] You fuck Victoria, while she fucks Betsy.
			
			// 9999
			
			processTime(10);
			pc.lust(30+rand(10));
			pc.exhibitionism(2);
			pc.removeStatusEffect("Sweaty");
			
			IncrementFlag("SHOWER_SANDWICH");
			
			// [Done] Go to Locker Room and Showers [+2% Exhibitionism]
			addButton(0, "Next", mainGameMenu);
			break;
		// You Sandwich
		case "you":
			// [Not yet written] Victoria fucks you, while you fuck Betsy.
			
			// 9999
			
			processTime(10);
			pc.lust(30+rand(10));
			pc.exhibitionism(2);
			pc.removeStatusEffect("Sweaty");
			
			IncrementFlag("SHOWER_SANDWICH");
			
			// [Done] Go to Locker Room and Showers [+2% Exhibitionism]
			addButton(0, "Next", mainGameMenu);
			break;
		// Sandwich Denial
		case "denial":
			output("You give the two cowgirls a teasing smile, and tell them you just felt like showing off a little. It’s a flattering offer, but you’re not actually looking for sex right now.");
			output("\n\n<i>“Tease,”</i> Betsy says, and sticks her tongue out at you.");
			output("\n\nVictoria gives her a swat on her butt, and points over to another part of the showers. <i>“What about her?”</i> she asks Betsy.");
			output("\n\n<i>“Ooh, I like,”</i> Betsy says. The two lovers wander off toward their new potential partner.");
			
			processTime(10);
			pc.lust(30+rand(10));
			pc.exhibitionism(1);
			pc.removeStatusEffect("Sweaty");
			
			// [Done] Go to Locker Room and Showers [+1% Exhibitionism]
			addButton(0, "Next", mainGameMenu);
			break;
		// Failsafe
		default:
			addButton(0, "Next", mainGameMenu);
			break;
	}
}
*/

//New Mechanics
//Sore
/*
[Sore] is a debuff gained from using the gym, as noted in the workouts. The purpose of [Sore] is to make it so you have to spend a little time and effort getting your character's body into the exact shape you want. I'm trying to make it work similar to the Fatigue buildup from using the gym in CoC, so you can't just go to the gym once, work out for ten hours of game time, and never need to go back.

The debuff has three steps:

[Sore], for 3-5 stacks. Energy regeneration is halved.
[Very Sore], for 6-8 stacks. Energy regeneration is quartered.
[Worn Out], for 9+ stacks. Energy regeneration does not happen.

All stacks of [Sore] can be removed by sleeping.
*/

public function soreDebuff(arg:int = 0):Number
{
	if(!pc.hasStatusEffect("Sore Counter"))
	{
		pc.createStatusEffect("Sore Counter");
	}
	if(arg != 0)
	{
		pc.addStatusValue("Sore Counter", 1, arg);
		
		if(pc.statusEffectv1("Sore Counter") >= 9 && !pc.hasStatusEffect("Worn Out"))
		{
			pc.removeStatusEffect("Sore");
			pc.removeStatusEffect("Very Sore");
			pc.createStatusEffect("Worn Out", 0, 0, 0, 0, false, "Icon_Crying", "You are worn out and and unable to regain energy. Working out is also impossible in this state. Sleep to recover.", false, 0, 0xFF0000);
		}
		else if(pc.statusEffectv1("Sore Counter") >= 6 && pc.statusEffectv1("Sore Counter") < 9 && !pc.hasStatusEffect("Very Sore"))
		{
			pc.removeStatusEffect("Sore");
			pc.createStatusEffect("Very Sore", 0, 0, 0, 0, false, "Icon_Crying", "You are very sore and will regain energy much slower. Sleep to recover.", false, 0, 0xFF8080);
			pc.removeStatusEffect("Worn Out");
		}
		else if(pc.statusEffectv1("Sore Counter") >= 3 && pc.statusEffectv1("Sore Counter") < 6 && !pc.hasStatusEffect("Sore"))
		{
			pc.createStatusEffect("Sore", 0, 0, 0, 0, false, "Icon_Crying", "You are sore and will regain energy slower. Sleep to recover.", false, 0, 0xFFFFFF);
			pc.removeStatusEffect("Very Sore");
			pc.removeStatusEffect("Worn Out");
		}
	}
	return pc.statusEffectv1("Sore Counter");
}

public function soreChange(arg:int = 0):void
{
	if(!pc.hasStatusEffect("Sore Counter"))
	{
		pc.createStatusEffect("Sore Counter");
	}
	if(arg != 0)
	{
		pc.addStatusValue("Sore Counter", 1, arg);
		
		if(pc.statusEffectv1("Sore Counter") < 3 && pc.hasStatusEffect("Sore"))
		{
			pc.removeStatusEffect("Sore");
			pc.removeStatusEffect("Very Sore");
			pc.removeStatusEffect("Worn Out");
			pc.removeStatusEffect("Sore Counter");
		}
		else if(pc.statusEffectv1("Sore Counter") < 6 && pc.statusEffectv1("Sore Counter") >= 3 && pc.hasStatusEffect("Very Sore"))
		{
			pc.createStatusEffect("Sore", 0, 0, 0, 0, false, "Icon_Crying", "You are sore and will regain energy slower. Sleep to recover.", false, 0, 0xFFFFFF);
			pc.removeStatusEffect("Very Sore");
			pc.removeStatusEffect("Worn Out");
		}
		else if(pc.statusEffectv1("Sore Counter") < 9 && pc.statusEffectv1("Sore Counter") >= 6 && pc.hasStatusEffect("Worn Out"))
		{
			pc.removeStatusEffect("Sore");
			pc.createStatusEffect("Very Sore", 0, 0, 0, 0, false, "Icon_Crying", "You are very sore and will regain energy much slower. Sleep to recover.", false, 0, 0xFF8080);
			pc.removeStatusEffect("Worn Out");
		}
	}
}

//Sweaty
//Workouts from the Weight Room or the Track will give you [Sweaty], a stacking debuff. For each stack of [Sweaty], your Sexiness will be reduced by 5. If you have fur, each stack of [Sweaty] reduces your Sexiness by 10. Using the Shower will remove all stacks of [Sweaty].
//For NPCs with the Likes_Sweaty tag, the Sexiness reduction is reversed and becomes an addition.

public function sweatyDebuff(arg:int = 0):Number
{
	if(arg != 0)
	{
		if(!pc.hasStatusEffect("Sweaty"))
		{
			pc.createStatusEffect("Sweaty", 0, 0, 0, 0, false, "Icon_Smelly", "You are covered with sweat from a workout, reducing your potential sexiness to many foes. Some, however, may like it.", false, 0);
		}
		if(pc.statusEffectv1("Sweaty") < 5) pc.addStatusValue("Sweaty", 1, arg);
	}
	if(pc.statusEffectv1("Sweaty") <= 0)
	{
		pc.removeStatusEffect("Sweaty");
		return 0;
	}
	return pc.statusEffectv1("Sweaty");
}

/*
output("\n\nNew Flags");
output("\n\nGym Member Day");
output("\n\nAllows PC access to the Ten Ton Gym. Limited to 24 hours.");
output("\n\nGym Member Life");
output("\n\nAllows PC access to the Ten Ton Gym.");

output("\n\nLikes_Sweaty"); - PERK}
output("\n\nNPC tag only. Treats the negative to Sexiness applied by the [Sweaty] debuff as a positive to Sexiness.");
*/
