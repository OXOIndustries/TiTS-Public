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

public function showQuenton():void
{
	showName("\nQUENTON");
	showBust("QUENTON");
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
		output("\n\nThe bull gives you a giant grin as you walk in. <i>“How do, friend?  Welcome to The Ten Ton Gym. I’m Quenton, owner of this place. Folks ‘round here call me Ten-Ton Quenton.”</i> He chuckles. <i>“I betcha I can getcha looking better than you ever dreamed. Whatcha say?”</i>");
	}
	else if(!pc.hasKeyItem("Ten Ton Gym Membership") && !pc.hasStatusEffect("Gym Pass")) output("\n\nUpon seeing you walk in, Quenton’s familiar grin lights up his face. <i>“How do, friend? Good to see you back. Here for a workout?”</i>");
	//Has gym membership: 
	else output("\n\nQuenton grins and waves to you as you walk inside. <i>“How do, [pc.name]. Good to see you back. Enjoy your workout.”</i>");

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
		var map:* = mapper.generateMap(currentLocation);
		userInterface.setMapData(map);
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
	//[Light Workout] Go to Light Workout {locked if PC has [Sore] debuff or doesn’t have 30 energy}
	if(pc.energy() >= 30 && !pc.hasStatusEffect("Sore")) addButton(0,"Light Workout",lightWorkout,undefined,"Light Workout","A light workout that'll help you build a little bit of muscle.");
	else addDisabledButton(0,"Light Workout","Light Workout","You're too tired for that workout.");
	//[Hard Workout] Go to Light Workout {locked if PC has [Sore] debuff or doesn’t have 50 energy}
	if(pc.energy() >= 50 && !pc.hasStatusEffect("Sore")) addButton(1,"Hard Workout",hardWorkout,undefined,"Hard Workout","A hard workout that'll help you build muscle <b>and</b> strength.");
	else addDisabledButton(1,"Hard Workout","Hard Workout","You're too tired for that workout.");

	//[Cowgirl] Go to Simone
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
	if(pc.energy() >= 30 && !pc.hasStatusEffect("Sore")) addButton(0,"Jog",takeAJogInTenTonGym,undefined,"Jog","Jog around the track to burn some fat.");
	else addDisabledButton(0,"Jog","Jog","You're too tired for that workout.");
	//[Run] Go to Run {locked if PC has [Sore] debuff or doesn’t have 50 energy}
	if(pc.energy() >= 50 && !pc.hasStatusEffect("Sore")) addButton(1,"Run",takeARunInNewTexas,undefined,"Run","Run around the track to burn some fat.");
	else addDisabledButton(1,"Run","Run","You're too tired for that workout.");
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
	output("Time to move, and there’s no better place for it.  You hit the track and run a quick warmup lap, then decide it’s time to push yourself. The sound of chanting comes from behind you, and you glance back to see the group of young bulls running in cadence.");
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
	//[Quick Swim] Go to Quick Swim {locked if PC has [Sore] debuff or doesn’t have 30 energy}
	if(pc.energy() >= 30 && !pc.hasStatusEffect("Sore")) addButton(0,"Quick Swim",quickSwim,undefined,"Quick Swim","Take a swim in the pool. It'll burn fat and build muscle!");
	else addDisabledButton(0,"Quick Swim","Quick Swim","You're too tired for that workout.");
	//[Swim Laps] Go to Swim Laps {locked if PC has [Sore] debuff or doesn’t have 50 energy}
	if(pc.energy() >= 50 && !pc.hasStatusEffect("Sore")) addButton(1,"Swim Laps",swimLapsAtZePool,undefined,"Swim Laps","Swim laps in the pool. It'll burn fat and build muscle but leave you tired as a dog.");
	else addDisabledButton(1,"Swim Laps","Swim Laps","You're too tired for that workout.");
	//[Spa] Go to Spa
	addButton(5,"Spa",spaTimesFunStuff,undefined,"Spa","Relax in the spa and recover some energy.");
	//[Swimmer] Go to Lola

	return false;
}

//Quick Swim
public function quickSwim():void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("QUICK\nSWIM");
	output("You ");
	if(pc.exhibitionism() < 66) output("don a swimsuit");
	else if(!pc.isNude()) output("strip naked");
	else output("admire your already nude form");
	output(" and step into the pool, taking a few minutes to get used to the water. The unusual smoothness feels good against your [pc.skinFurScalesNoun], almost sensual. The temperature is pretty much perfect, a little bit cold but nothing you can’t handle.");
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
	output("You ");
	if(pc.exhibitionism() < 66) output("don a swimsuit");
	else if(!pc.isNude()) output("strip naked");
	else output("admire your already nude form");
	output(" and plunge into the cool water headfirst, coming up with a spurting breath. You head for one of the lanes, and get right into swimming laps. It takes a few strokes for you to find your rhythm, but soon you’re coasting through the water with ease.");
	output("\n\nAfter a few laps, you swim up alongside the local cows who are also doing laps, and nod a quick greeting to them, then match their pace. They clearly do this a lot, and it’s a struggle at first, but you manage to stay with them for a while.");
	output("\n\nSoon enough, your limbs start feeling heavy, and your once-smooth strokes start to stutter.  You swim for the edge and pull yourself out, sore but satisfied.");
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
	output("The spa is a welcome sight. You ");
	if(pc.exhibitionism() < 66) output("don a swimsuit");
	else if(!pc.isNude()) output("strip naked");
	else output("admire your already nude form");
	output(" and climb in.");

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
			//addButton(0,"Next",9999);
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
	}
	else
	{
		if(flags["SEXED_QUENTON"] != undefined) output("<i>“Office is always open, if you’re up for some personal trainin’.</i>");
		else output("<i>“Good to see you again, [pc.name]. What can I do for you today?”</i>");
		processTime(1);
	}
	//[Purchase Day] Go to Purchasing Membership for a Day {Text: Ask about purchasing a day-long membership.}
	if(!pc.hasKeyItem("Ten Ton Gym Membership") && !pc.hasStatusEffect("Gym Pass")) addButton(0,"Day Pass",purchaseTempGymMembership,undefined,"Day Pass","Ask about purchasing a day-long membership.");
	else addDisabledButton(0,"Day Pass","Day Pass","You already have a gym pass.");
	//[Purchase Life] Go to Purchasing Lifetime Membership {Text: Ask about purchasing a lifetime membership.}
	if(!pc.hasKeyItem("Ten Ton Gym Membership")) addButton(1,"Life Pass",buyDatLifetimeMembership,undefined,"Life Pass","Ask about purchasing a lifetime membership.");
	else addDisabledButton(1,"Life Pass","Life Pass","You already have one!");
	//[Personal] Go to Personal Training {Text: Try to get into Quenton’s workout pants}
	//[No Thanks] Go to Entrance
	addButton(14,"Leave",mainGameMenu);
}

//Purchasing Membership for a Day
public function purchaseTempGymMembership():void
{
	clearOutput();
	showQuenton();
	author("Slab Bulkhead");
	output("Quenton gives you a nod. <i>“Just here for a quick look or a quick lift?  I gotcha.<i>”</i> He taps a few buttons on his computer, then holds out a hand to you. <i>“That’ll be 500, friend.”</i>");
	processTime(1);
	clearMenu();
	//[Purchase Day]{Set global flag GYM_MEMBER_DAY to true}{Deduct 50 credits} Go to Purchased Day
	if(pc.credits >= 500) addButton(0,"Purchase",purchaseTempGymMembershipConfirm,undefined,"Purchase","Spend 500 credits on a day pass.");
	else addDisabledButton(0,"Purchase","Purchase","You can't afford a day pass.");
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
	else addDisabledButton(0,"Purchase","Purchase","You cannot afford that.");
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
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*
output("\n\nPersonal Training");
output("\n\nYou lean toward Quenton and ask if he does any personal training, if he knows what you mean. He seems to be a man who likes his muscle, so you flex your biceps, just to make sure you get your point across.");

output("\n\n{PC’s tone is below 80% maximum: Quenton chuckles a little. <i>“I’m flattered, friend, but you’re not what I’d call my type.”</i> He gestures to the pictures hanging on his walls, all the buff cowgirls and bullboys. <i>“I like a good, hard body more than anything else, why I built up the gym in the first place. And why I built up myself, naturally.”</i> A quick flex makes both of his pecs jump.");

output("\n\n<i>“Now, don’t take it bad, I’m just sayin’. Maybe you spend some time here, get yourself in my kind of shape, and we can see about some personal trainin’.”</i>");

output("\n\n[Back] Go to Entrance}");

output("\n\n{PC’s tone is above 80% maximum: <i>“Oh, I get what you’re sayin’,”</i> Quenton says, and stands up to his full height. He puffs out his chest, pecs straining against his shirt, stretching the gym’s logo across his musculature. <i>“There’s nothin’ I like more than a good, hard body against mine, except maybe a good lift. And even that’s made better with a good lay after. Or maybe durin’.”</i> He chuckles. <i>"So I’m up for it if you’re askin’.”</i>");

output("\n\nDamn right you are. Quenton props a sign that says ‘Be Back Soon’ on the desk, then opens up the door to his office and invites you in, closing the door behind you both.");

output("\n\nQuenton’s office is small but simple, with a desk and cabinet taking up about half of it. Lights shine down from the ceiling, and two of the walls are nothing but enormous mirrors.");

output("\n\nThe short-horned bull takes a bottle of lube out of one desk drawer, then strips out of his shirt and pants, and spreads his arms and legs as he flexes for you. Quenton is ridiculously ripped, with veins standing out over rock-hard muscles bulging beneath his tanned skin. His foot-long horse cock also has thick veins standing out on either side, with a pair of bulging balls dangling behind it. He’s also entirely hairless, further making all of his muscles and his pronounced package stand out.");

output("\n\nQuenton flexes his way through a few poses, then turns to you with a grin, clearly hoping you like what you see. <i>“You pitchin’ or catchin, hardbody? I’m good for you either way.”</i>");

output("\n\n[Pitch] Go to Pitching Quinton {requires penis or strap-on}");
output("\n\n[Catch] Go to Catching Quinton {requires penis or strap-on}}");

output("\n\nPitching Quinton");
output("\n\n[Not yet written] You bang Quinton’s behind in front of his mirror.");

output("\n\n[Done] Go to Entrance");

output("\n\nCatching Quinton");
output("\n\n[Not yet written] Quinton bangs you from behind, in front of his mirror.");

output("\n\n[Done] Go to Entrance");

output("\n\nSimone");
output("\n\nYou saunter on over to the smirking cowgirl. She’s hard at work on a chest press machine, her arms spread wide to either side of her gigantic breasts, which are barely held in place by a tight, pink sports bra. Her top matches the equally tight pink shorts she’s got on, the shiny fabric an interesting contrast to her dark brown skin. Her long, curly brown hair is tied back in a simple ponytail, and her pink sweatband sits just beneath a pair of gleaming black horns. She’s clearly a gym regular; her arms and shoulders are well-toned, she has defined abs, and her thighs are strong and firm. You can see a hint of a bulge between her legs, but not enough for her to be a futa; it looks more like she has a prominent cameltoe.");

output("\n\n{PC hasn’t met Simone: <i>“Heeyy,”</i> the cowgirl says as you approach. She lowers the bar and leans up on one elbow. Her eyes meet yours for a moment, then lower to your arms and chest. <i>“You here to lift, or just to watch?”</i>");

output("\n\nYou ask her if you can’t do both, then introduce yourself. If she recognizes your name, she doesn’t show it.");

output("\n\n<i>“I’m Simone,”</i> she says, <i>“and </i>I’m<i> here to lift. But if you’re here for both, how about a little challenge?”</i>");

output("\n\nWhen you ask what kind of challenge, Simone’s smirk returns. It looks like she’s been waiting for someone to ask.");

output("\n\n<i>“Let’s see who’s stronger,”</i>, Simone says. She nudges the chest press bar, setting her boobs to jiggling. <i>“Five presses, add weight, five more, add weight, you get it. First one who can’t lift anymore loses.”</i> She smiles, the tip of her wide pink tongue flicking out between her lips. <i>“Loser makes the winner come. You in?”</i>}");

output("\n\n{PC has met Simone: <i>“Heeyy, [pc.name],”</i> Simone says, stopping her workout as you approach. <i>“Feeling up for a challenge, or did you wear yourself out too much already?”</i>}");

output("\n\n[Compete] Go to Compete {Text: Lift like you mean it.} {-40 Energy}");
output("\n\n[Fake Loss] Go to Fake Loss {Text: Lift like you don’t mean it.} {-20 Energy}");
output("\n\n[Pass] Go to Pass {Text: Or just don’t lift.}");

output("\n\nCompete");
output("\n\nYou tell Simone you’ll take her on, and lie down on the other chest press machine. You set the stack to four weights, as per her instructions, then take hold of the bar. She says, <i>“Ready? Go!”</i> and you start lifting.");

output("\n\nYou push your way through your first set, then add more weight and start your second, lifting slow and steady. Simone matches your pace, clearly handling this without a problem. It doesn’t start to get difficult until you add the sixth weight, but you keep going.");

output("\n\nBy the time you get to the ninth weight, you and Simone have both slowed down a little, but she shows no signs of stopping. You take a deep breath and move up to the tenth weight. One . . . two . . . three . . . four . . . five. There’s an aching in your chest now, but you force yourself to keep lifting.");

output("\n\n// If the PC has a Sexiness bonus of 7 or higher, or muscle tone over 70% of maximum, Simone will lose on purpose. If PC chooses [Compete], they win. If PC chooses [Fake Loss], they still lose.");
output("\n\nIf Simone does not lose on purpose, take the PC’s Physique stat plus a random number from 1 to 10. If that number is over 20, the PC wins. If that number is under 20, Simone wins.");

output("\n\n{PC wins: The movements become mechanical: lift five, add weight, lift five more, add weight. You plow through the eleventh stack with only a little trouble, and a quick glance over at Simone shows that she’s starting to struggle. You both add the twelfth weight at the same time, and she pauses to take a deep breath.");

output("\n\nYou shove the bar up with a grunt, pushing through your set, then lower the weights and add another to the stack. A loud slam comes from Simone’s machine, and you look over to see her laying there, arms dangling off both sides of the bench, her heavy tits trying to flop to either side as her sports bra strains to hold them in place. She looks at you, and you push the bar up once, twice, three times, so she knows that you won.");

output("\n\nVictory is yours, and you let the bar drop.");

output("\n\nSimone rises and walks over to you, her arms hanging limp at her sides. <i>“Damn, [pc.name],”</i> she says. <i>“I didn’t think you had it in you.”</i>");

output("\n\nYou sit up and flex your arms and chest, trying not to show any strain from the workout. It looks like you win, you tell her, and she laughs.");

output("\n\n<i>"Looks like.”</i> Simone leans forward and rests a hand on your [pc.thigh], then trails it higher, moving toward your [pc.crotch]. <i>"Now let’s see what you’ve got for me.”</i>}");

output("\n\n[Victory] Go to Victory");

output("\n\n{Simone wins: It’s the eleventh stack that gets you. After shoving the bar up as hard as you can, your muscles feel weak and wobbly, and you wipe away sweat before trying again. Your arms strain as you try to force them to work, and then, you know it’s hopeless.");

output("\n\nTry as you might, you can’t force the bar up one more time. You look over at Simone, who’s struggling through her own set of eleven. She hoists the bar up four times, then five, and lets the weights slam down. When she looks over and sees you spent, she lets out a tired laugh, then adds one more weight to her stack and pushes the bar up once, just so there’s no doubt who won.");

output("\n\nSlowly, Simone rises and walks over to you. <i>“Not bad, [pc.name],”</i> she says. <i>“Not bad at all. I thought you had me there for a second.”</i> Her smirk returns. <i>“Just means you get to have me now.”</i>");

output("\n\nYou give her a sly smile, wondering what she’s got in mind.");

output("\n\n<i>“Oh, don’t get up,”</i> Simone says, and hooks one thumb into her pink shorts’ waistband. <i>“Just scoot down a little, so the bar’s out of the way. You’re not going anywhere.”</i>}");

output("\n\n[Defeat] Go to Defeat");
output("\n\nFake Loss");
output("\n\nYou tell Simone to bring it on, trying to hide your smile. Better make this look convincing; she looks she takes this seriously.");

output("\n\nYou lie down on another chest press machine, and set the weights on the fourth setting, as per Simone’s instructions. She says, <i>“Ready? Go!”</i> and you start lifting. You start off fast, to make it look like you’re going to burn yourself out quickly.");

output("\n\nBy the time you’ve increased the weight twice, you slow it down a little, and let out a grunt as you finish your reps. When you glance over at Simone, she looks like she’s plowing through this with ease. Perfect.");

output("\n\nWhen you have the weights stacked up to seven, you start breathing hard, and after adding the eighth weight, you struggle, straining against the bar to no avail. When Simone laughs, you look over, and see her raising her stack to the ninth weight. You force the bar up one last time, gritting your teeth with a loud grunt, then let the bar slam down hard. The sound of metal on metal is just barely loud enough to cover your strained breathing.");

output("\n\nSimone hefts her way through her set of five, then adds the tenth weight and pushes through another set, just to ensure her victory. Once finished, she stands up with a hearty laugh, then steps over to your machine. <i>“Aww, [pc.name]. Is that all you’ve got?”</i>");

output("\n\nLooks like it. You shrug and laugh, trying to look like you really meant to win. Whether you fooled her or not, the glint in her eye makes it clear she’s taking her victor’s spoils.");

output("\n\n<i>“Oh, don’t get up,”</i> Simone says, and hooks one thumb into her pink shorts’ waistband. Her smirk returns. <i>“Just scoot down a little, so the bar’s out of the way. You’re not going anywhere.”</i>");

output("\n\n[Defeat] Go to Defeat");

output("\n\nPass");
output("\n\nYou tell Simone that you’re not up for a challenge right now. Her smile fades, and she looks disappointed. <i>“Too bad,”</i> she says. <i>“Could have been fun. Let me know if you change your mind.”</i> She lies back down on the bench and returns to her lifting.");

output("\n\n[Done] Go to Weight Room");

output("\n\nVictory");
output("\n\n{If PC has no penises: [Not yet written] Simone goes down on the PC with her wide cow-tongue. [+2% Exhibitionism]}");
output("\n\n{If PC has one penis: [Not yet written] Simone titfucks the PC, keeps her top on for a better squeeze. [+2% Exhibitionism]}");
output("\n\n{If PC has 2+ penises: [Not yet written] Simone double-penetrates herself with the PC’s dicks. [+2% Exhibitionism]}");

output("\n\n[Done] Go to Weight Room");

output("\n\nDefeat");
output("\n\n[Not yet written] Simone rides PC’s face, making sure to get her gumball-sized clit thoroughly sucked. [+2% Exhibitionism] [+40 Lust]");

output("\n\n[Done] Go to Weight Room");

output("\n\nLola");
output("\n\nYou wade over toward the naked cowgirl as she strokes her way across the pool. She doesn’t seem to notice your approach, so you time it so she bumps into you on her way. As soon as you two collide, she looks over, then flips herself over and stands up, surprise clear on her round face.");

output("\n\n<i>“Oh, I’m sorry!”</i> she says, then gives you a long look up and down, her blue eyes wide. <i>“Hi there,”</i> she says, a smile spreading across her face. <i>“I’m Lola. Haven’t seen you here before, huh?”</i>");

output("\n\nLola’s only a little over five feet tall, but her hips would look wide on a woman twice her size; on her, they seem almost comically exaggerated. Her butt is appropriately bulbous, with curvy thighs beneath it. Soaked red hair trails down to her shoulders, clearly her natural color, if the little tuft above her pussy is any indication. Two short white horns peek out from among her locks, and her ears are cowlike and floppy. Her skin is pale, and she has the large boobs common among New Texans, with hard, pink nipples.");

output("\n\nYou introduce yourself to the bright-eyed cowgirl, and ask if she’s here working out, or if she just likes to swim.");

output("\n\n<i>“Little of both,”</i>, Lola says, nodding a few times. <i>“Sometimes I feel like I need a workout, but mostly I just like to swim. Or to fuck.”</i> Her smile grows a little devious as her gaze trails over your [pc.chest]. <i>“Have you ever had sex with someone who’s floating?”</i>");

output("\n\nYou consider it for a moment, and tell her no, you haven’t. Lola looks down at your crotch.");

output("\n\n{If PC has cock: <i>“That’s too bad,”</i> she says, not taking her eyes off your [pc.cock]. A blush spreads across her cheeks and down her chest, turning the skin on her breasts the palest pink. <i>“Do you want to try it? Like, right now?”</i>");

output("\n\n[Yep] Go to FloatFuck");
output("\n\n[Nope] Go to NoFloatFuck}");

output("\n\n{If PC doesn’t have cock: <i>“That’s too bad,”</i> she says, and looks up from your [pc.crotch] after a moment. <i>“And you don’t have anything to fuck me with. Darn.”</i>");

output("\n\n{If PC has no hardlight undergarment: You ask if she’s still up for whatever you two can do together. Fingers and lips and tongues can do a lot.");

output("\n\n<i>“Oh, but it’s not the same,”</i> Lola says, pouting a little. <i>“And I really like to be, you know–”</i> She thrusts her voluminous hips in your direction, sending a small wave crashing against you. <i>“–penetrated. Sorry, [pc.name].”</i>");

output("\n\nLola swims away, flipping onto her back again after a few strokes, leaving you alone.");

output("\n\n[Done] Go to Swimming Pool}");

output("\n\n{If PC has hardlight undergarment: You mention that you’ve got a hardlight strapon back with your gear, and you can get it if she’s down for that.");

output("\n\nLola nods eagerly, her eyes lighting up. <i>“Ooh, those things are fun,”</i> she says. A blush spreads across her cheeks and down her chest, turning the skin on her breasts the palest pink. <i>“Can you go get that? Please?”</i>");

output("\n\n[Yep] Go to FloatFuck");
output("\n\n[Nope] Go to NoFloatFuck}}");

output("\n\nFloatFuck");
output("\n\n[Not yet written] You fuck Lola. While she’s floating.");

output("\n\n[Done] [+2% Exhibitionism] Go to Swimming Pool");

output("\n\nNoFloatFuck");
output("\n\nYou tell Lola that you’re just not into that. She pouts at you a little, then shrugs it off with a giggle. <i>“Aww, no problem. I’m sure someone else here’s up for it.”</i>");

output("\n\nLola floats off, the peaceful smile returning to her face.");

output("\n\n[Done] Go to Swimming Pool");

output("\n\nBetsy and Victoria");
output("\n\nOne of the girls is a tanned blue-eyed blonde with a figure so much the New Texas ideal she could have stepped off of a travel brochure, her huge tits almost impossibly perky with nipples staring straight at you. Her hair’s pulled back in low pigtails dangling past her shoulders.");

output("\n\nThe other has black hair with bangs trimmed straight above her eyebrows, and stands taller and a little less curvy, but with quite a bit more tone, clearly no stranger to the gym. She’s also packing eight inches of horsecock, an uncommon sight on the local girls.");

output("\n\n<i>“Hi there, cutie,”</i> the blonde says, then giggles as she looks you over. <i>“I’m Betsy. This–”</i> She pauses to squeeze her partner’s ass, prompting the other girl to spank her, hand smacking hard across Betsy’s jiggling flesh. <i>“–is Victoria.”</i>");

output("\n\n<i>“Hi,”</i> Victoria says, and gives you an appraising look. Her eyes are heavy-lidded, but she looks like she likes what she sees.");

output("\n\nYou introduce yourself, and ask if the two come here often.");

output("\n\n<i>“Most every time we’re here,”</i> Victoria says. <i>“It’s a good place to find new friends to play with.”</i>");

output("\n\nYou mention that you haven’t seen many futa here on New Texas, though you’ve met quite a few others on your journeys. Victoria smiles, looking kind of proud, but it’s Betsy who speaks up, blushing as she laughs.");

output("\n\n<i>“Oh, that’s a funny story. We used to use a strapon, but I kept breaking them. I, um, get a little rough sometimes.”</i>");

output("\n\nYou stare at Betsy for a moment, and hope she’s talking about low-tech strapons. If the girl has a habit of breaking hardlights, you might be in for a rough time.");

output("\n\n<i>“And,”</i> Victoria says, <i>“I always wondered what it felt like to have a cock. So I thought I’d give it a try.”</i> She strokes a hand down her length, joined by Betsy’s hand a moment later. <i>“I wouldn’t give up this thing for the world.”</i>");

output("\n\n<i>“"Sooooo,”</i> Betsy says, twirling a lock of blonde hair around one finger, <i>“you want to play with us? You can pick who gets to be in the middle.”</i>");

output("\n\n[Oh Yeah] Go to Sandwich Selection [+40 Lust] {Remove all [Sweaty]} {Time: 10 minutes}");
output("\n\n[Just Teasing] Go to Sandwich Denial [+40 Lust] {Remove all [Sweaty]} {Time: 10 minutes}}");

output("\n\nSandwich Selection");
output("\n\n<i>“Ooh, good,”</i> Betsy says. <i>“I thought you looked like fun.”</i> She presses her wet body against you, her boobs slipping against your [pc.chest], while Victoria slides up against your other hip, and rubs her dong against your thigh.");

output("\n\n<i>“So, your choice, [pc.name],”</i> Victoria says. <i>“Who gets to be in the middle?”</i>");

output("\n\n[Betsy] Go to Betsy Sandwich");
output("\n\n[Victoria] Go to Victoria Sandwich");
output("\n\n[You] Go to You Sandwich");

output("\n\nBetsy Sandwich");
output("\n\n[Not yet written] You and Victoria double-penetrate Betsy in between you two.");

output("\n\n[Done] Go to Locker Room and Showers [+2% Exhibitionism]");

output("\n\nVictoria Sandwich");
output("\n\n[Not yet written] You fuck Victoria, while she fucks Betsy.");

output("\n\n[Done] Go to Locker Room and Showers [+2% Exhibitionism]");

output("\n\nYou Sandwich");
output("\n\n[Not yet written] Victoria fucks you, while you fuck Betsy.");

output("\n\n[Done] Go to Locker Room and Showers [+2% Exhibitionism]");

output("\n\nSandwich Denial");
output("\n\nYou give the two cowgirls a teasing smile, and tell them you just felt like showing off a little. It’s a flattering offer, but you’re not actually looking for sex right now.");

output("\n\n<i>“Tease,”</i> Betsy says, and sticks her tongue out at you.");

output("\n\nVictoria gives her a swat on her butt, and points over to another part of the showers. <i>“What about her?”</i> she asks Betsy.");

output("\n\n<i>“Ooh, I like,”</i> Betsy says. The two lovers wander off toward their new potential partner.");

output("\n\n[Done] Go to Locker Room and Showers [+1% Exhibitionism]");
*/

//New Mechanics
//Sore
//If your [Sore] total from working out reaches or exceeds 3 (two heavy workouts or three light workouts) you’ll gain the debuff [Sore]. This means you won’t be able to use the gym again until after you sleep, and you’ll regain half as much energy as usual (via resting or other mechanics) while [Sore].
//The purpose of [Sore] is to make it so you have to spend a little time and effort getting your character’s body into the exact shape you want. I’m trying to make it work similar to the Fatigue buildup from using the gym in CoC, so you can’t just go to the gym once, work out for ten hours of game time, and never need to go back.  The [Sore] debuff should disappear after you sleep.

public function soreDebuff(arg:int = 0):Number
{
	if(!pc.hasStatusEffect("Sore Counter"))
	{
		pc.createStatusEffect("Sore Counter");
	}
	if(arg != 0) 
	{
		pc.addStatusValue("Sore Counter",1,arg);
		if(pc.statusEffectv1("Sore Counter") >= 3 && !pc.hasStatusEffect("Sore"))
		{
			pc.createStatusEffect("Sore", 0, 0, 0, 0, false, "Icon_Crying", "You are sore and will regain energy slower. Working out is also impossible in this state. Sleep to recover.", false, 0);
		}
	}
	return pc.statusEffectv1("Sore Counter");
}

//Sweaty
//Workouts from the Weight Room or the Track will give you [Sweaty], a stacking debuff. For each stack of [Sweaty], your Sexiness will be reduced by 5. If you have fur, each stack of [Sweaty] reduces your Sexiness by 10. Using the Shower will remove all stacks of [Sweaty].
//For NPCs with the Likes_Sweaty tag, the Sexiness reduction is reversed and becomes an addition.

public function sweatyDebuff(arg:int = 0):Number
{
	if(!pc.hasStatusEffect("Sweaty"))
	{
		pc.createStatusEffect("Sweaty", 0, 0, 0, 0, false, "Icon_Smelly", "You are covered with sweat from a workout, reducing your potential sexiness to many foes. Some, however, may like it.", false, 0);
	}
	if(pc.statusEffectv1("Sweaty") < 5) pc.addStatusValue("Sweaty",1,1);
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