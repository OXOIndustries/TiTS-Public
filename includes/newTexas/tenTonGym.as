//The Ten Ton Gym (ver. 1.2)
//- Slab Bulkhead
//Overview
//A gym on New Texas, complete with weight room, swimming pool, track, locker room, and showers. The owner and manager, “Ten-Ton” Quenton Jones, is here to help you look your best. The purpose is to provide a place for PCs to adjust their muscle tone and body thickness.

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
	
	flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
	
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
		moveTo("569");
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
	if(flags["MET_BUSKY"] == true && hours >= 17 && hours <= 24) output("\n\nYou see another familiar face, Busky, hidden under a bench press. Whenever he takes a break, he stares dreamily at the bulging crotches of other bulls. He seems to be in the middle of an extensive workout, lifting around 300 imperial pounds. It’s a rather low amount compared to the other bulls lifting twice, some thrice that much weight. However his endurance is astonishing, doing longer reps than any other bull. Compensating for weight, he’s doing a much harder workout, and his body is showing it. His heaving chest is sweating profusely, being soaked up by his sodden undershirt and gym shorts.");
	//[Light Workout] Go to Light Workout {locked if PC has [Sore] debuff or doesn’t have 30 energy}
	if(pc.energy() >= 30 && !pc.isWornOut()) addButton(0,"Light Workout",lightWorkout,undefined,"Light Workout","A light workout that’ll help you build a little bit of muscle.");
	else addDisabledButton(0,"Light Workout","Light Workout","You’re too tired for that workout.");
	//[Hard Workout] Go to Light Workout {locked if PC has [Sore] debuff or doesn’t have 50 energy}
	if(pc.energy() >= 50 && !pc.isWornOut()) addButton(1,"Hard Workout",hardWorkout,undefined,"Hard Workout","A hard workout that’ll help you build muscle <b>and</b> strength.");
	else addDisabledButton(1,"Hard Workout","Hard Workout","You’re too tired for that workout.");
	//Mirrin: #2
	mirrinGymBonus(2);
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
	output("You work your way through a row of weight machines, keeping the weights at a moderate level. ");
	//Shekkus interruptus!
	if(pc.hasCock() && pc.cockThatFits(shekka.vaginalCapacity(0)) >= 0 && shekkaIsCrew() && shekkaIsAvailable() && !pc.hasStatusEffect("SHEKKA_GYM_CD") && rand(2) == 0)
	{
		output("You’re just about to try a little more with a friendly, local spotter.");
		shekkaGymmusInterruptus(true);
		return;
	}
	output("There’s something oddly relaxing about putting yourself through the simple motions, and the burn sets in after a while, leaving your muscles feeling tired and springy.");
	output("\n\nYou step away from the machines when done, wipe sweat from your forehead, and smile. Not a bad workout, but not too exhausting either. Let the bulls sweat and grunt until they can barely lift their arms; you’re just here to make sure you stay in good shape.");
	output("\n\nYour muscles have become slightly more toned.");
	//+1 muscle tone, +1 toward [Sore] debuff, +1 [Sweaty], -30 energy Time: 30 minutes";
	processTime(30);
	pc.energy(-30);
	pc.modTone(1,false);
	sweatyDebuff(1);
	soreDebuff(1);
	clearMenu();
	if(!pc.hasStatusEffect("Lift Voyeur CD") && rand(5) == 0) addButton(0,"Next",liftVoyeurism);
	else addButton(0,"Next",mainGameMenu);
}

public function hardWorkout():void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("HARD\nWORKOUT");
	output("Time to pump iron. You slam some weights on the bars and start hefting. The gym regulars clearly appreciate seeing you put in as much work as they do, and volunteer to spot you, so long as you can spot them in return.");
	//Shekkus interruptus!
	if(pc.hasCock() && pc.cockThatFits(shekka.vaginalCapacity(0)) >= 0 && shekkaIsCrew() && shekkaIsAvailable() && !pc.hasStatusEffect("SHEKKA_GYM_CD") && rand(2) == 0)
	{
		shekkaGymmusInterruptus(false);
		return;
	}
	output("\n\nOne of the bulls starts lifting at the bar next to you, and an impromptu contest begins, both of you lifting heavier and heavier weights as the other does. You grit your teeth and push through it, determined to show the locals you’ve got what it takes.");
	output("\n\nThe contest comes to an abrupt end when a cowgirl walks by and tickles the bull’s crotch, nearly making him drop the bar. He struggles to right his weight, and you do the same. It’s a strain to even sit up after that, but you nod to your worthy opponent, then head off to stretch out the soreness.");
	output("\n\nYour muscles have become considerably more toned.");
	// +3 muscle tone, +2 toward [Sore] debuff, +2 [Sweaty], -50 energy, Time: 30 minutes
	processTime(30);
	pc.energy(-50);
	soreDebuff(2);
	sweatyDebuff(2);
	pc.modTone(3, false);
	pc.slowStatGain("physique",1);
	clearMenu();
	if(!pc.hasStatusEffect("Lift Voyeur CD") && rand(5) == 0) addButton(0,"Next",liftVoyeurism);
	else addButton(0,"Next",mainGameMenu);
}


// Track
public function newTexasTrackBonus():Boolean
{
	clearOutput();
	author("Slab Bulkhead");
	if(passDetector()) return true;
	output("The whirr of air conditioners greets you as you enter the track room. It’s longer than you expected, taken up largely by an extended oval loop of running track, with lights hanging from bars that crisscross the ceiling. The track itself is some sort of brown synthetic, and bounces slightly under the runners’ feet. White lines designate the track’s five lanes.");
	output("\n\nA few young bulls are running the track in perfect synch, calling out their steps in time. One group of cows runs together in a loose cluster, some of them quite sweaty; another group of cows sits along the wall, calling out encouragement and lewd comments to the runners. A few other New Texans run at their own pace or catch their breath against the wall.");
	output("\n\nAt the center of the track, some sort of aerobics class is in progress, with an older cow calling out exercises and counting down numbers for the group she leads. The sight of a group of bulls and cows all moving and bending in synch like that is oddly hypnotizing, for quite a few reasons.");
	//Is Anno working out? 33% chance to find her.
	if(annoIsCrew() && rand(3) == 0)
	{
		output("\n\nFlanked by two young bulls as she runs around the track, a familiar white-furred beauty rushes by. With tail wagging and sweat darkening her exercise wear, she’s clearly having fun.");
		addButton(2, "Anno", aWildJoggingAnno, undefined, "Anno", "Greet Anno.");
	}
	//[Jog] Go to Jog {locked if PC has [Sore] debuff or doesn’t have 30 energy}
	if(pc.energy() >= 30 && !pc.isWornOut()) addButton(0,"Jog",takeAJogInTenTonGym,undefined,"Jog","Jog around the track to burn some fat.");
	else addDisabledButton(0,"Jog","Jog","You’re too tired for that workout.");
	//[Run] Go to Run {locked if PC has [Sore] debuff or doesn’t have 50 energy}
	if(pc.energy() >= 50 && !pc.isWornOut()) addButton(1,"Run",takeARunInNewTexas,undefined,"Run","Run around the track to burn some fat.");
	else addDisabledButton(1,"Run","Run","You’re too tired for that workout.");
	//[To Hallway]
	return false;
}

//Approach Anno
public function aWildJoggingAnno():void
{
	clearOutput();
	clearMenu();
	author("Twin Flare Tails");
	showName("ANNO");
	showBust(annoBustDisplay());
	output("As she comes by on the track, you wave and call to her. Her ears perk up at your voice and she rushes over.");
	output("\n\n<i>“Hey, boss! Came to get a little exercise, too? There are so many tasty treats on New Texas, I have to burn some calories just to stay in shape.”</i> You have to wonder which tasty treats she means exactly. Anno puts in a lot of effort to take care of herself. Her choice of dress reflects her confidence; a snug black tank top and white shorts advertising an almost indecent amount of her lower body.");
	if(flags["ANNO_HUSKARRED"] != undefined)
	{
		output(" It must have been some time since she last updated her exercise wear, though. Her sporty shorts and tank top are straining to contain her abundant assets. You can also clearly see she isn’t wearing a sports bra. Whether by choice or lack thereof, you cannot say.");
	}
	output("\n\n<i>“I’d still like to go for a while longer. I wouldn’t mind a little company, if you wanted to join me for a few laps?”</i>");
	output("\n\nWell, what will it be? A little exercise couldn’t hurt, right? On the other hand, you don’t really need it, and watching Anno run would be enjoyable in itself. And with all that talk of laps... maybe you could go back to the ship for a few “laps.”");
	if (pc.energy() >= 30) addButton(0, "Join In", runWithAnno, undefined, "Join In", "Run with Anno.");
	else addDisabledButton(0, "Join In", "Join In", "You’re too tired to run with Anno.");
	addButton(1,"Watch",annoWorkoutWatchItJiggle,undefined,"Watch","Watch Anno run.");
	if (pc.hasGenitals() && !pc.isTaur()) addButton(2,"Ship",annoWorkoutShipSexyFunTimes);
	else addDisabledButton(2,"Ship","Ship","You must have a fitting cock and/or cannot be a taur.");
	//"Leave" should always be button slot 14 for proper hotkeying.
	addButton(14,"Leave",howCouldYouLeaveAnno,undefined,"Leave","Leave Anno to her run.");
}

//Run with Anno
public function runWithAnno():void
{
	clearOutput();
	clearMenu();
	author("Twin Flare Tails");
	showName("ANNO");
	showBust(annoBustDisplay());
	output("Sure, why not? You and Anno begin jogging around the track together. You’re no slouch, but she’s making you exert yourself to keep up.");
	output("\n\n<i>“Nothing like a healthy jog to get the blood pumping,”</i> she pants.");
	output("\n\nAs you complete your first lap around the track, a bull behind you makes his presence known."); 
	output("\n\n<i>“Excuse me! Some of us here are trying to actually exercise. If you can’t go any faster, then would you mind moving over for a real athlete?”</i>");
	output("\n\nAnno rolls her eyes and picks up the pace to run in front of you. This puts her well-sculpted behind directly into your field of vision. With every step, her plush bottom shifts in her skintight athletic shorts. Your eyes shift as each cheek lifts: left, right, left right..."); 
	if(pc.hasCock()) output(" If you’re not careful, you’ll be too encumbered by your swollen erection to keep up with your puppy girl.");
	output(" While you’re still enraptured with her bouncing behind, a gentle cough reminds you there’s still an Anno attached to it. The suggestive look she’s giving you lets you know your behavior is being taken as a compliment.");
	if(flags["ANNO_HUSKARRED"] != undefined)
	{
		output("\n\nYour eyes can’t help but be drawn back to her luscious backside. That thick bottom is too tempting to resist. Your right hand reaches down and gives her perfectly squishy butt a squeeze. With her wagging tail smacking against your arm, she pivots her upper body to give you another significant look.");
		output("\n\nThe sudden shift in position allows her full, fluffy tits to spring free from her ill-fitting tank top. Anno lets out a bark of surprise and clutches at her exposed breasts. You grab two handfuls of Anno’s abundant rack and do your best to return it to the reluctant tank top.");
		output(" You manage to squeeze the right breast back inside, but have some difficulty stowing the other away. Just as you think you’ve got it, her right breast springs free and tit-slaps you across the face.");
		output("\n\nOnly with a monumental amount effort do you succeed in restoring her tits to their residency within Anno’s top. With the crisis handled, you look around to see whether anyone noticed your little problem. The least observant detective in the universe would be able to tell you just how noticeable your little accident was. Every bull in the room is sporting a throbbing erection and not a small number of the cows are leaking at the breast or groin. Not that you can blame them.");
		pc.changeLust(10);
	}
	output("\n\nYou run a few more laps around the track before calling that a good work out. Sweat runs down your [pc.skin], leaving slick, salty trails. Your exercise buddy is similarly dripping with sweat, her [anno.chest] heaving with each breath as she cools down from the run.");
	output("\n\n<i>“Woo, That was a great jog! We worked up quite a sweat, huh, boss? What say we go rinse off?”<i>");
	processTime(30);
	pc.energy( -30);
	pc.modTone(1,false);
	sweatyDebuff(1);
	soreDebuff(1);
	addButton(0,"Pass",mainGameMenu,undefined,"Pass","Ends the scene.");
	addButton(1,"Showers",annoWorkoutShowerSex,undefined,"Showers","Hit the showers with Anno.");
	
	//Non-Huskar Anno has vag penetration. Huskar Anno does not. Have to do some shenanagins if we want to allow Huskar Anno scene with large cock.
	if (pc.hasCock())
	{
		if (pc.isTaur()) addDisabledButton(2,"Sexercise","Sexercise","You must not be a taur.");
		else if (pc.cockThatFits(anno.vaginalCapacity()) == -1 && flags["ANNO_HUSKARRED"] == undefined) addDisabledButton(2,"Sexercise","Sexercise","You must have a cock that fits.");
		else addButton(2,"Sexercise",annoWorkoutGimmeDatBootySweat,undefined,"Sexercise","You like it sweaty.");
	}
	else addDisabledButton(2,"Sexercise","Sexercise","You must have a cock.");
}
	
//Leave	
public function howCouldYouLeaveAnno():void
{
	clearOutput();
	showName("ANNO");
	author("Twin Flare Tails");
	showBust(annoBustDisplay());
	output("You don’t feel like exercising right now.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}	
	
//Get Squeaky Clean	
public function annoWorkoutShowerSex():void

{
	clearOutput();
	showName("ANNO");
	author("Twin Flare Tails");
	showBust(annoBustDisplay(true));
	//Actually put in lockers/showers
	currentLocation = "571";
	generateMap();
	output("You let Anno know that hitting the showers sounds good to you, and she leads the way to the locker room. A number of the bulls and cows who had also been on the track not-so-coincidentally decide they’re also ready to be done. Anno wastes no time in taking off her exercise wear and stowing it away in a locker. "); 
	output("\n\nYou follow suit, throwing your things in with hers. You are aware of hungry eyes watching the pair of you disrobe. At least a dozen bulls hastily remove their own clothing, some not even bothering with a locker. Anno latches a biosecurity lock onto the locker containing your gear.");
	output("\n\n<i>“I’ve come back to find my clothes gone a few times before,” she explains.</i>");
	output("\n\nYou follow your [anno.race] companion to the showers, trailed by a small herd of bulls and even a few cows. The shower room doesn’t have quite enough capacity for everyone to have their own nozzle, so Anno offers to wash your back if you do hers. You both have a quick rinse under the showerhead, then");
	 if(pc.hasHair())output(" lather each other’s hair up with shampoo and ");
	output("give each other a thorough scrubbing with your fingers. ");
	output("\n\nAnno’s steady, confident fingers sweep across your back and scalp, then your [pc.chest], soothing every inch of [pc.skinNoun]. You’re not sure, but she seems to take just a little more time rubbing your [pc.butt] than elsewhere. After her stellar performance, it’s your turn to wash Anno’s succulent body.");
	
	if(flags["ANNO_HUSKARRED"] != undefined)
	{
		output("\n\nYour fingers knead her thick, squishy body with enthusiasm, digging into every plentiful curve and crevice. You take special care going over her bouncy bosom and the smooth skin of her hips. Anno makes sure you do a good job on her tail as well.");
	}
	else
	{
		output("\n\nYou put your fingers to work on her sleek skin, washing away the sticky sweat she accumulated from exercising. She seems to take special pleasure in the effort you put into cleansing her perky tits. So much so that she seems almost reluctant to remind you to get her ears."); 
		if(silly) output(" As you dig your fingers into her smooth belly, she tenses up and begins to tap her foot uncontrollably. When you stop, she gives you an amused smile.");
	}
	output("\n\nAt last, you appear to have given your companion a thorough washing. There’s not many places left which could be in need of attention. Anno doesn’t seem quite ready to leave yet, though.");
	output("\n\n<i>“Hey, boss, what do you say to a bit of deep cleaning? You know, making sure we get all the dirty places really clean?”</i>");
	output("\n\nOne of the bulls who followed you in drops a bottle of shampoo with a clatter. A quick glance reminds you that they’re all still there, watching. Well, what will it be?");
	
	processTime(10);
	pc.shower();
	
	clearMenu();
	addButton(0,"Just Us",deepCleanDatDirtyAusar,undefined,"Just Us", "Get a thorough cleaning");
	addButton(1,"Them First",runTrainOnAnno,undefined,"Them First","Let the bulls go first.");
	addButton(2,"Clean",allCleanCausePartyPooper,undefined,"Clean","Leave the showers.");
}

//Clean dat dirty dirty Ausar	
public function deepCleanDatDirtyAusar():void

{
	clearOutput();
	showName("ANNO");
	author("Twin Flare Tails");
	showBust(annoBustDisplay(true));
	output("That sounds like a great idea to you. Anno cheerfully pops open a bottle of coconut oil and begins to rub it into her hands. She’s wearing that sexy smile again and you’re pretty sure you know what’s coming.");
	if(silly) output(" If past experience can be trusted: you.");
	output("\n\nHer magic hands begin by running across your [pc.breasts], thumbing your nipples only fleetingly.");
	if (pc.isLactating()) output(" A few drops of [pc.milk] drip down her fingers.");
	output(" She moves behind you, rubbing your shoulders, then a few motions across your back. As her hands reach your hips, you can feel her [anno.breasts] press into your back and her pelvis bump your [pc.butt].");
	
	var selCock:Number = pc.cockThatFits(anno.vaginalCapacity());
	if (selCock != -1)
	{
		output("Her fingers trail down to your [pc.cock " + selCock + "], wrapping sensuously around it"); 
		if(pc.balls > 0) output(" and teasing your [pc.balls] with her fingertips");
		output(". She begins to stroke you with expert skill, her fingers traveling only partially up your length, mostly staying near to the base."); 
		if(pc.hasKnot(selCock)) output("As your [pc.cock " + selCock + "] becomes fully erect, your [pc.knot " + selCock + "] begins to swell, too. Anno mercilessly fondles your knot, giving you an uncomfortable feeling of closeness in your belly and exposure in your unsheathed cock.");
		output("Your dick feels amazing, each throb pulsing between her slick fingers forcing [pc.cumVisc] precum from the tip, lubricating her hand as it jerks you off. You grunt as Anno picks up the pace.");
	}
	output("\n\n<i>“Oh, don’t worry,”</i> she whispers in your ear, <i>“We’re not done yet.”</i> She turns you around to face her. <i>“Mind giving my front a wash while I do yours?”</i>");
	output("\n\nYou apply yourself with vigor, going over her breasts once more with your fingers, but now you’re doing it explicitly for pleasure. Her [anno.chest] feels magnificent in your hands. You could do this all day. Anno on the other hand can’t seem to wait for the end, lightly pushing into you as you wash her.");
	if (pc.hasVagina()) 
	{
		output("\n\nWith not a twinge of discomfort or awkwardness, Anno reaches down and begins rubbing your [pc.pussy] with her ");
		if (pc.hasCock()) output(" precum-lubed");
		output(" hand. She’s had years of practice with other girls, so this shouldn’t come as any surprise. Her fingers seem to locate all of your most sensitive spots with ease and coax them until your gonads are throbbing with desire. You feel a tightening in your belly as your body makes its want known.");
	}
	output("\n\nYou reach down with your right hand to Anno’s pussy, still handling her breast with your left, and begin to tease her clit. Her breathing slows and tail begins to wag in time with your handiwork as the intensity of your stimulation increases. As her own pleasure increases, Anno decides to step her game up as well.");
	if (selCock >= 0)
	{
		output("\n\n<i>“Let’s just slide this in here for now, okay?”</i> Anno murmurs sweetly as she slowly mounts your [pc.cock " + selCock + "]. Her inner passage parts to accept your cock into its warm embrace. This alone is nearly enough to make your dick erupt. <i>“Make sure you get it nice and clean in there.”</i> Her hips begin to rock against yours, producing a slippery spurting noise from where the two of you are connected."); 
		if(pc.hasKnot(selCock)) output(" You can feel your knot swell to its full size, trapping your [pc.cock " + selCock + "] in her love tunnel.");
		pc.cockChange();
		output("\n\nYou’re not sure how clean you’ll be making her, with every instinct telling you to dirty her tight snatch with your spooge. Especially not with her grinding on you like this. It’s all you can do to not blow your load right now.");
	}
	output("\n\nAnno takes advantage of having a free hand to reach down to your behind, brushing your backdoor with a finger.");
	output("\n\n<i>“Don’t want to forget about here,”</i> she teases.");
	if (pc.hasTailCock())
	{
		output("\n\nWithout any conscious effort on your part, your tailcock spears itself into Anno’s behind. She lets out a yelp of surprise, turning to see your [pc.tailCock] pumping her tailhole in senseless abandon, determined to deliver its parasitic payload.");
		output("\n\nAnno’s face is blushing crimson with arousal from the sensations running through her, <i>“I guess you had the same idea, huh? Let’s see how long you can last like this.”</i> You try to hold out as your tailcock does it’s best to accelerate your impending orgasm.");
	}
	output("\n\nAnno’s teasing goes on for minutes which feel like hours, stretched by the intensity of the pressure you feel building inside. Anno is clearly enjoying the build up to her orgasm but also seems aware how close you are to your limit. Moments before you lose control completely, she leans forward and whispers playfully in your ear.");
	output("\n\n<i>“Cum.”</i>");
	if (pc.hasTailCock()) output("\n\nWith immense difficulty, you manage to free your [pc.tailCock] from her tailhole, just in time for it to spray its seed across her back.");
	if (selCock >= 0)
	{
		output("\n\nYou cry out as your [pc.cock " + selCock + "] explodes, firing shot after shot into her waiting womb.");
		if(pc.hasVagina()) output(" Your [pc.pussy] clenches around Anno’s clever fingers as you cum, her rhythm setting the pace for your climax.");
		output(" Anno rides your joined orgasm out, rocking her hips steadily as if to make sure you’ve emptied all the sperm in your ");
		if(pc.balls > 0)output("[pc.balls]");
		else output("body");
		output(" into her. There’s no question she really cleaned you out, in any case. ");
		if(pc.hasKnot(selCock)) output("But with your knot sealing her entrance shut, your swimmers are trapped in her with nowhere to go, leaving her insides anything but clean.");
		if (pc.cumQ() >= 1000) output(" Indeed, her belly is visibly swollen with your reproductive potential.");
	}
	if(pc.hasVagina() &&!pc.cockThatFits(anno.vaginalCapacity()) != -1)output("\n\nYour [pc.pussy] clenches up throughout your orgasm, tensing in tune with Anno’s fingers. It feels like you are giving birth to a massive dildo as your pussy milks a phantom cock of its imaginary load.");
	output("\n\nWhen at last you come down from your orgasm, you realize you’re not alone. The bulls who came to join you in the shower appear to have had climaxes of their own, the products of which now criss cross the tiled floor in a display of spent virility.");
	output("\n\n<i>“There. I think we’re all clean now,”</i> Anno pants, <i>“Inside and out.”</i>");
	output("\n\n You share a few more pleasant moments with Anno before returning to the locker room."); 
	pc.orgasm();
	processTime(30);
	pc.exhibitionism(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
	
//Running a train on Anno
public function runTrainOnAnno():void
{	
	clearOutput();
	showName("ANNO");
	author("Twin Flare Tails");
	showBust(annoBustDisplay(true));
	output("You ask Anno if she wouldn’t prefer to help some of the bulls clean their hard-to-reach places first.");
	output("\n\nHer ears perk up at the thought and she smiles. <i>“I know we just got done exercising, but I think a few warm-ups wouldn’t be out of the question.”</i> She approaches the nearest bull and compliments his impressive equipment. <i>“You’ve got a nice set on you.”</i>");
	output("\n\nShe begins stroking his sizable manhood. He gives an appreciative grunt and reaches out to give one of her breasts a friendly squeeze. The other bulls move closer to get a better view of the action. You can hardly keep your eyes off it yourself."); 
	output("\n\n<i>“Almost as nice as yours,”</i> the bull replies, palming her ample tits in his equally large hands and massaging them lightly between his thick fingers."); 
	output("\n\nHis dick is a big, fat model with a pair of gleaming, cum-heavy balls under it. The nanofiber condom Anno unrolls over his dick is a tight fit, but secure. The white-furred [anno.race] girl bends over and braces herself against the tiled wall with her hands. After a few trial runs through her asscrack, the big bull enters her pussy. It’s a tight squeeze and you’re not sure if Anno is going to have the capacity to accommodate his girth, but after three or four pushes, he manages to fit it in. Anno lets out a big gasp when he finally penetrates her, a mixture of pain and pleasure. ");
	output("\n\nHe begins slowly but steadily humping her backside. It only takes him about two minutes of slow, methodical pumping to blow his load. Anno continues to hump her behind against his crotch for another thirty seconds before reaching her orgasm. Getting his dick out takes the bull significantly less time than putting it in. Anno’s walls practically push him out and, after tying a knot in it, the bull pulls the condom from her sex. As the pint cum balloon flops out, a trickle of Anno’s feminine juices follows after."); 
	output("\n\nThe first satisfied bull leaves, another stepping forward to take his place. His dick is a lot thinner than his predecessor and Anno has no trouble fitting it into her mouth, but it’s still a bit unwieldy at over a foot in length. He closes his eyes and lets out a low moo as she alternates between giving his dick a tongue bath and polishing his crown. Another bull sidles up and nudges Anno’s shoulder with his cock until she grasps it in her left hand and begins jerking it."); 
	if(pc.hasCock()) output(" By this point, yourself and the other bulls are all handling your respective dicks.");
	output("\n\nAnno isn’t alone in getting some action. A couple of the bulls who came in after you have gotten busy with a trio of cowgirls, faces and cocks buried in mouths, tits, and puss as they go to town.");
	output("\n\nThe bull Anno is fellating whispers something you can’t catch over the noise of a dozen bulls playing with themselves, but which evidently Anno caught. She gives him a nod, and allows him to ease most of his dick into her mouth. It gives a whole new meaning to the term deepthroat. With all those inches for Anno’s tongue to play with, he doesn’t last long, and after five minutes of getting his shaft milked, releases his load into her belly with a grunt."); 
	output("\n\n<i>“After a snack like that,”</i> Anno jokes between gasps, <i>“I might have to run a few more laps.”</i>"); 
	output("The bull she’s been jerking asks if he can try her mouth on for size, too. Anno silently glances over his rather more underwhelming dick, before slipping a condom over it."); 
	output("\n\n<i>“I’m feeling a little full right now. Okay if I save some of this for later?”</i>");
	output("\n\nThe bull doesn’t mind, and Anno proceeds to suck on his nanofiber-sealed prick. A bigger bull next to you tears open a condom and, after no small amount of trouble, unrolls it over his arm-length stallion dick. This guy looks like he must have a few mods. Anno sees him and motions him over, widening her stance as she does so. Not needing any more invitation than that, the big bull mounts her doggystyle, his horsecock nudging into her entrance until Anno’s pussy admits him.");
	output("\n\nOnce inside, it still takes quite a bit of humping and straining for him to fit it deeper down her passage. You’re not sure where there’s room in there for it, but she somehow manages to fit it in. With her mouth busy, it’d be impossible to ask, but if her moans of pleasure are any indicator, she appears to enjoy being spitroasted.");
	output("\n\nOnce fully inside, the big bull begins bucking his hips steadily, making his watermelon-sized spunk tanks bounce against Anno’s ass. The remaining bulls move closer to the ménage à trois in progress, still beating their meat. The big bull lifts Anno off her feet as he continues to pump away, but she’s beyond caring by this point, holes filled and surrounded by dick. Each free hand and foot finds its way to a throbbing erection,");
	if(pc.hasCock())output(" one of them your own,");
	output("as Anno attempts to get everyone off. Her tight little tailhole even finds an occupant: a cowgirl with a tailcock and a mean look in her eye.");
	output("\n\nAnno’s voice rises above the slapping and clapping of cock as she climaxes for the umpteenth time. The dick in her mouth slips free, a baseball-sized cumballoon drooping from his cockhead. A smaller bull with a pink-and-black pockmarked prick takes his place and Anno doesn’t even seem to notice, eyes glazed with pleasure from the shower gangbang. As each bull reaches his peak, he blows his load on Anno’s body, coating her in a layer of slippery spooge.");
	if(pc.hasCock())output(" Your own [pc.cock] erupts a few times, mingling your seed with that already on Anno.");
 	output("\n\nAs Anno begins whimpering with another orgasm, the big bull supporting her picks up speed, grunting with each thrust. The other bulls, realizing the end is coming, work their dicks harder to get in one more cum before the big bull’s horsecock goes off. The tailcock in her ass quivers and withdraws reservedly from her now-creamed asshole. The bumpy pink and black one in her mouth has just enough time to add a couple swallows of dense spunk to the load already digesting in her before, with a roar, the final thrust is made.");
	output(" There’s no way that condom isn’t going to burst. The stud’s stallion balls slam upwards and his horsecock quivers, buried as deep as it can get in Anno’s quim.");
	output("\n\nAnno is pushed steadily forwards on his rolling orgasm. He takes hold of her to prevent his equine dong from dropping her to the floor. With each shudder that runs through their merged frames, the nanofiber condom on the bull’s dick is sucked further up his shaft and he is pushed further out of Anno until he has been fully ejected. His horsecock hoses her back and ass with the few spurts of virile jizz he couldn’t deposit in her overstuffed womb.");
	output("\n\nThat volume of spunk could make a kui-tan envious. At long last his rapidly softening dick gives its final dry surge and the bull steps back to admire his work. He thanks Anno and leaves, shadowed by a couple eager-looking cowgirls. Anno, for her part, makes vague noises of recognition from where she lies slumped on the floor, rivers of white hot semen leaking from both ends and a slimy film coating the rest of her. The other bulls show their appreciation with a few words or a squeeze and make their way out of the shower.");
	output("\n\nYou take the time to give your tuckered pup a thorough cleansing, taking care to wash behind her ears, comb clumps of jizz out of her tail, and dry her off with a towel. As you haul her back to the ship to recover from her exercise session, she wakes briefly, just long enough to give you a whispered, <i>“Thank you,”</i> snuggles into your chest and falls fast asleep."); 
	pc.orgasm();
	processTime(30);
	pc.exhibitionism(2);
	clearMenu(); 
	addButton(0, "Next", mainGameMenu);
}
	
//Clean Ends the scene.
public function allCleanCausePartyPooper():void
{	
	clearOutput();
	showName("ANNO");
	author("Twin Flare Tails");
	showBust(annoBustDisplay(true)); 
	output("You tell Anno that you feel clean enough now. The bulls and cows watch with envious eyes as you leave the shower room with Anno. If you were a gambling [pc.manWoman], you’d wager on there being a few bulls blowing their loads in the shower in short order. After you and Anno have dried and dressed, you leave the locker room."); 
	clearMenu();
	addButton(0, "Next", mainGameMenu);

}

//Work out more with Anno. Mmm dat booty sweat.
public function annoWorkoutGimmeDatBootySweat():void
{
	clearOutput();
	showName("ANNO");
	author("Twin Flare Tails");
	showBust(annoBustDisplay());
	currentLocation = "572";
	generateMap();
	output("You let Anno know that you happen to like her sweat.");
	output("\n\nAnno cocks an eyebrow at that. <i>“Are you saying you want to exercise a little more? I think I’d be up for that. If you’re not too tired, that is.”</i> She tucks her thumbs into the front of her waistband and runs them around to the back. <i>“What did you have in mind?”</i>");
	output("\n\nYou suggest the weight room. She gives you a dubious look, thinking you might have actually been serious about continuing your work out. You make your way over to the weight room and soon find what you were looking for: a machine with overhead hand grips. You set the weights on the machine to 1500 lbs and take a seat. As Anno watches with a bemused expression, you pull futilely on the grips, fighting the insurmountable weight you set. After a minute or two, she asks if you would like a little help.");
	output("\n\nAnno plops down before you on the seat, legs spread wide to either side of it and her bottom rubbing against your [pc.crotch]. She raises her arms and intertwines her fingers with yours."); 
	output("\n\n<i>“Ready?”</i> your cheeky pup asks as she gives her [anno.butt] a little shake on your manhood.");
	output("\n\n<i>“Ready.”</i>");
	output("\n\nYou pull down with all your might on the hand grips, straining to make the weights even shudder. Anno’s fingers cut into your own as she also pulls to no effect. You make a good show of it, though. If someone were completely stupid, they might be convinced you were attempting regular exercise. When you are certain no one is paying any attention, you tell Anno to try turning around. Your [anno.race] workout companion obliges, reorienting herself so that you can sit face-to-face, with her atop your lap.");
	var selCock:int = pc.cockThatFits(anno.vaginalCapacity(0));
	if(!pc.isCrotchExposed())
	{
		output("\n\nWith her body for cover, you slip [pc.oneCock] out of your [pc.crotchCovers], only for it to be wrapped in the confines of Anno’s sweaty thighs. You resume your facade of struggling to lift weights as Anno pulls rhythmically, raising herself up your length, then pushing back down it."); 
	}
	else
	{
		output("\n\nAnno traps [pc.oneCock] in the slick, sweaty embrace of her thighs. You continue with your weightlifting charade, fighting against the frankly insane amount of weight you set the machine to while Anno works her crotch against yours.");
	}
	if(flags["ANNO_HUSKARRED"] != undefined)
	{
		if(selCock < 0) selCock = pc.smallestCockIndex();
		output("\n\nAs you struggle against the machine and Anno rubs against your erect cock, the inevitable happens. Her too-small exercise shorts are pushed just a little too far and, with an audible ripping noise, split a seam in the crotch. Anno looks down with surprise at her own huskar pussy, glistening with a mixture of sweat and girlcum, its lips wrapped around the base of your [pc.cock " + selCock + "]."); 
	}
	else
	{
		selCock = pc.biggestCockIndex();
		output("\n\nAnno lets out a grunt as she bucks her hips into yours, the wetness of your mixed sweat, precum, and girlcum lubricating her thrusts. After several minutes grinding against your bone, the Ausar girl can’t seem to take it anymore. Anno stands and slides her shorts and panties off, tosses them to one side, and returns to schlicking your [pc.cock " + selCock + "], only now with the lips of her bare pussy."); 
	}
	output("\n\nA moan escapes Anno’s lips as her orgasming pussy coats your [pc.cock " + selCock + "] in her love juice. You can’t help but be aware that some of the nearer patrons of the gym have taken notice, but there’s nothing you can really do about it while you’re receiving lip service from your puppy’s sopping wet cunt. Panting heavily with her tongue out and thrusting lewdly into you with wet slaps, Anno appears to have given up any pretense of engaging in a normal exercise routine. Ah, what the hell! You release your grip on the weight machine and take hold of Anno’s tank top. In one motion you lift it over her head ");
	if (flags["ANNO_HUSKARRED"] != undefined) output("ripping her sports bra off with a loud snap ");
	output("so her [anno.breasts] can spring free. Taking her [anno.hips] in your hands and a nipple in your mouth, you lean into the [anno.race] girl."); 
	if(flags["ANNO_HUSKARRED"] != undefined)
	{
		output("\n\nAnno leans into you in turn, her huge mammaries suffocating you with the scent of puppy sweat and lust.");
		if(pc.cocks[selCock].cLength() >= 16) output(" With every thrust, your dick is immersed not only in wet snatch, but also in her amazing tits.");
		output(" Your fingers dig into her thick, squeezable body. She’s softer and squishier than any sextoy known to man. As tightly as her thighs are squeezing you, they mould into the perfect shape to massage your [pc.cock " + selCock + "]. You can feel a building pressure");
		if(pc.balls > 1) output("in your spunk-makers");
		output(". You’re going to cum; the only question is when. Anno’s moans are beginning to crescendo just as you feel like you can’t take it anymore, and you slap your hips into Anno’s, making her bounce on your lap. With a cry of pure ecstasy, ");
		if(silly) output("you unleash a fountain of excessive virility, dousing both of your bodies with billions of potential future heirs to the Steele line.");
		else output(" your [pc.cock " + selCock + "] empties your load into Anno’s spacious cleavage, marking your huskar lover’s [anno.chest] with hot [pc.cum].");
		if(pc.hasCuntSnake())
		{
			output(" Your tailpussy swiftly descends on the tip of your cock, catching the last few spurts for its own greedy hunger, then sucking futilely at your shaft as it begs for more."); 
			feedCuntSnake(pc);
		}
	}
	else
	{
		output("\n\nYour Ausar lover lets out a cry of pleasure as your tongue tickles her salty puppy teat. ");
		if(pc.balls > 0) output("You feel your [pc.balls] jump a little as Anno wraps her fingers around your [pc.cock " + selCock + "] and angles it into herself. With a growing moan, Anno squeezes her own tits while you continue to tease her nipple orally.");
		if(pc.cocks[selCock].cLength() >= 12) 
		{
			output(" Your dick plows Anno’s innermost depths");
			if(silly) output(" pounding the back wall of her womb hard enough to scramble her eggs");
			output(".");
		}
		else output(" Your cock glides through her positively soaked love tunnel with practically no friction whatsoever."); 
		pc.cockChange();
		output("\n\nYou can feel Anno picking up the pace as you near your own climax. Slamming your hips together furiously, you simultaneously reach orgasm, cumming hard. You empty yourself into Anno like it’s your last chance at procreation"); 
		if(pc.cumQ() >= 1000) output("; every shot filling her more excessively than the last"); 
		output(".");
		if(pc.virility() == 0)output(" Not that you could knock her up, lacking functional sperm.");
		else output(" You wonder when Anno last took sterilex, not that knowing the answer would make any difference now.");
	}
	output("\n\nAs you both come down from your climaxes, you notice that all eyes are on you. Admittedly, the weight most people came to the gym to pump was not liquid, so it’s hardly surprising you attracted this much attention. After taking the time to rearrange your equipment and cleaning up the mess you made with supplies from the janitor’s closet, you leave the weight room.");
	if(flags["ANNO_HUSKARRED"] != undefined) output("\n\n<i>“That was a lot of fun,”</i> your Huskar companion says conversationally. <i>“We might have to do it again sometime, after I replace these workout clothes.”</i>");
	else output("\n\n<i>“Now that’s what I call good exercise,”</i> your Ausar companion puts a hand on your waist as she comments on your rather public escapade. <i>“I’d be up for doing that again. Beats any other way I know of staying in shape.”</i>"); 
	output("\n\nIt certainly doesn’t sound like a bad idea.");
	pc.orgasm();
	processTime(30);
	pc.exhibitionism(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Watch Anno Jog
public function annoWorkoutWatchItJiggle():void
{	
	clearOutput();
	showName("ANNO");
	author("Twin Flare Tails");
	showBust(annoBustDisplay());
	output("You sit down on a nearby bench to spectate. Anno resumes her exercise routine. It doesn’t take long for her to get back into it. You admire her sumptuous curves and bouncing assets as she jogs around the track. With each footfall, her [anno.chest] jiggles in the rhythmic motion cultivated by nature to excite the male brain.");
	if(pc.hasGenitals())
	{	
		output("\n\n");
		if(pc.hasCock()) output("Your face reddens and you realize you’re sporting a rather noticeable boner. You’re not the only one, you note. Several of the bulls around you are sporting tentpoles of their own. ");
		if(pc.hasVagina()) output("You manage to keep your fingers away from your privates, but that does nothing to slow the spreading moisture permeating your nether regions."); 
	}
	if(flags["ANNO_HUSKARRED"] != undefined)
	{	
		showBust(annoBustDisplay(true));
		output("\n\nAs Anno runs by you on the track, you notice that she looks rather uncomfortable in her exercise wear and comment on it.");
		output("\n\n<i>“It is a little tight,”</i> Anno admits.");
		//Porn logic. Running with unsupported big breasts hurts.
		output("\n\nYou mention noticing that some patrons of the gym choose to exercise au naturale. It would probably be fine if she chose to do so as well. She is unsure at first, but the idea seems to excite her. With only slight hesitation, Anno pulls her top over her head, letting her big, squishy breasts spring free. She then drops her shorts and steps out of them one leg at a time. Having tossed her exercise gear aside, Anno resumes jogging.");
		output("\n\nNow that her body is fully exposed, there are very few eyes not watching her progress around the track and more than a few hands tucked into waistbands. Her tits bounce freely in rhythm as she runs, tossing droplets of salty Huskar sweat into the air with each jiggle. She’s not the only one jogging on the track in the buff now, though. A cluster of nude bulls and cows have grouped around her, giving the impression she’s being chased by a herd of throbbing erections, fervently churning balls, and milky breasts. As you watch, a confident bull directly behind Anno gains enough ground on her that his cock begins bopping her well-formed Huskar butt with each footfall.");
		output("\n\nAnno is sweating far more unclothed than clothed. She is panting heavily now and her face is flushed; signs she is working up a good heat in her muscles, and possibly somewhere else, too. Streaks of sweat coat her entire body, the rivulets running down her back, merging with the splatters of virile bull precum sprinkling her squishy backside."); 
		output("\n\nAfter completing one final lap, Anno slows to a walk. She stretches her arms above her head and lets out an exaggerated sigh.");
		output("\n\n<i>“It’s about time I threw in the towel. That was a lot of fun. Maybe next time you’ll want to join in.</i>");
		output("\n\nWith one last shake of her sexy little tail, Anno heads toward the showers, trailed by her crowd of rutting bulls and cowgirls. You have some idea what they might be getting up to in there.");
	}
	else
	{
		output("\n\nYou have ample opportunity to take in all the curves and contours of her fit body as Anno does several loops of the track. After you’ve had plenty opportunity to enjoy the show, Anno slows to a walk and heads your way.");
		output("\n\n<i>“I worked up quite an appetite with that workout. After I have a quick shower, I’ll have to take another trip to the buffet. Maybe you’ll join me next time?”</i> Her tail twitches suggestively."); 
		output("\n\nSomething tells you that might not be a bad idea.");
	}
	if(flags["ANNO_HUSKARRED"] != undefined) pc.changeLust(25);
	else pc.changeLust(15);
	processTime(30);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoWorkoutShipSexyFunTimes():void
{
	clearOutput();
	author("Twin Flare Tails");
	showName("ANNO");
	showBust(annoBustDisplay(true));
	output("You ask if Anno wouldn’t rather have a little exercise back on the ship. The idea of a private exercise session seems to appeal to her and in almost no time at all, you’re back in your bedroom, with a sweaty [anno.race] girl giving you her sexiest smile."); 

	//Actually put PC in the ship interior
	currentLocation = "SHIP INTERIOR";
	generateMap();
	pc.energy(-20);

	output("\n\nYou begin with a workout for your lips. It’s an exercise quite unlike any other. Anno smells magnificent, the familiar damp scent of her body permeating your nostrils. The feel of her lips on yours is soft and refreshing, and every so often her wet tongue slips from between to tantalize you with its sensation. She has had a lot of practice."); 
	output("\n\nAs her hand grips tighter into your shoulder and an electric tingle runs through you, she draws back. <i>“I’m feeling kinda hot. We don’t want to overheat, do we? Better dress more appropriately for exercise like this.</i>");
	if(!pc.isNude())
	{
		output("\n\nAnno helps you out of your [pc.gear], taking her time and enjoying every inch of your [pc.skinFurScales] as it’s revealed. You’re eager to help her out of her exercise wear in turn, still damp with sweat. Her [anno.breasts] flop out of her tank top onto your [pc.chest], squishing into you with their characteristic soft warmth.");
	}
	else output("\n\nYou’re more than eager to help Anno strip off her exercise wear. Off comes her black top, still soaked in sweat. Her [anno.breastCupSize] puppies look even better out in the open air. As you help her out of her exercise shorts, the scent of her hot, dripping femininity overtakes you.");
	output("\n\n<i>“Well?”</i> Anno raises an eyebrow questioningly at you. <i>“Ready to try another kind of exercise? I believe we were going to do some laps.”</i>");
	output("\n\nYou move into an appropriate position to give Anno oral pleasure, prostrate in her lap. The scent of her wet sex is driving you crazy. As soon as you have it within reach, your tongue begins its assault on Anno’s puppyhole. Her luscious lower lips become your sole focus, everything else driven from your mind. Right now, you exist only to pleasure her. Your tongue work is having a powerful effect on Anno. As your [pc.tongue] explores the contours of her pussy, Anno gives a moan of appreciation. This just pushes you to pleasure her further.");
	output("\n\nYou switch the focus of your efforts to her clitoris, delivering slow flicks across it, teasing it. Anno’s love juice is leaking steadily across your taste buds, flooding your senses more completely with your [anno.race] lover. She begins to whine as you bring her closer to climax, alternating your technique between quick, short licks and long, flowing laps. As Anno reaches her limit, you press your lips to her bud and lightly blow on her most sensitive point. Her pussy clenches for purchase on a cock which isn’t there, milking the air for seed in desperate ecstasy.");
	output("\n\nWhen her orgasm has subsided, Anno leans back and rubs her lips, tentatively. <i>“That was great. I wish all my partners gave head that good. Now that I’m all warmed up, it’s time we gave your lower body some exercise.”</i> Her expression is positively feral, eyes burning with the fire in her loins. How could you refuse?");

	//Find if any dicks fit.
	var selCock:Number = pc.cockThatFits(anno.vaginalCapacity());
	//Pick a fork. 0 - vagina, 1 - dick.
	var sceneChoice:Number = 0;
	//Herms with fitty dickies get either.
	if(pc.isHerm()) sceneChoice = rand(2);
	//Dudes just the dicking.
	else if(pc.hasCock()) sceneChoice = 1;

	//Dick scene!
	if (sceneChoice == 1)
	{
		if (selCock != -1)
		{
			output("\n\nYou can hardly contain your excitement as [pc.oneCock] parts her folds, joining you together in the most sensuous way possible. Anno starts off at a pretty good pace. She’s obviously not an amateur in this kind of rodeo. How many bulls did she have to ride to get this good? Her expression is pure lust, urging you to let go of everything else and succumb to your mutual desire. It becomes increasingly difficult to resist as she rides you harder.");
			//Twas missing a dick virginity check
			pc.cockChange();
			output("\n\nYou’re just on the edge of ejaculating when she stops. <i>“Are you getting tired? We could call it good, if you’re ready to be done.”</i> You inform her just how close you actually are. Her smile widens so you can see just a hint of her canines. <i>“I better take it easy then. If I go too fast, you’ll blow before I do.”</i>"); 
			output("\n\nHer fluffy ears twitching mischievously, Anno slowly humps your [pc.cock " + selCock + "], not moving with much force or even in a rhythm, denying you from reaching your peak, so near yet so far. Your own hips thrust against her, struggling to push yourself over the edge. This startles Anno into letting out an involuntary moan. With a thrill, you realize she’s closer than she had let on. Anno rapidly loses her cool and sweaty hands cup your face as she leans in to kiss you. It’s then you notice just how much you’re sweating too. This really has turned into a workout! Your heaving bodies rub together fervently as each strives to drive the other to orgasm first. Only minutes later, it all becomes just too much. Your hips buck and you release every ounce of your ");
			if(pc.virility() == 0 ) output("ineffectual puppymakers");
			else output("egg-hunting swimmers");
			output(" into your [anno.race] workout partner. As she feels your [pc.cum] filling her, Anno loses it. Her legs squeeze tight around you and she buries her face in your [pc.chest]. The warm wetness of her orgasm soaks sheets already drenched with sweat.");
			output("\n\nYou lie back with Anno after you’ve both had some time to recover from the experience. She holds you close, breathing in your scent just as you are hers.");
			output("\n\n<i>“Who needs a gym when I’ve got you? Besides, this way I get free scratches.”</i>");
			if(flags["ANNO_HUSKARRED"] != undefined) output("\n\nYou oblige, giving her chubby belly a good rub. Anno squirms in your grip, laughing and swatting at your hand. She really is a good pup.");
			else output("\n\nTaking the hint, you give her a gentle scratch behind the ears. She leans into you, nuzzling appreciatively. It isn’t long before you’re both blissfully asleep.");
		}
		else
		{
			output("\n\nIt’s a pity you’re too big for Anno to take a proper ride, but as it is, she can still get you both off with the friction of rubbing your sexes together. Her slick slit slides up and down your shaft, with her hands keeping pressure on the opposite side of your phallus, mimicking the feel of a much larger passage. Anno’s pussy clenches at your shaft. She orgasms again as she rides your big dick.");
			output("\n\nThe way she’s getting off on your massive bone strokes your ego nicely. Not quite as nicely as her tits, which form a valley for your dong to slide through."); 
			if(flags["ANNO_HUSKARRED"] != undefined) output("Anno’s breasts are large enough that your [pc.oneCock] can barely squeeze between them. It’s tight enough to trick your dick into thinking it’s found an appropriately-sized pussy to leave a deposit in. With the sensation from her breasts and hands working in tandem to get you off, ");
			output("Anno does her best to push you over the edge.");
			output("\n\nAs she reaches her peak once again, you know you’ve reached your limit. You feel [pc.eachCock] unleash the tide you had been holding back. Spurts of [pc.cumVisc] cum douse Anno and mess the sheets. As the pressure in your loins fades and the throbbing sensation with it, Anno releases her grip and leans back to admire her work.");
		}
	}
	else
	{
		var selCunt:Number = rand(pc.totalVaginas());
		output("\n\nAnno hops off the bed for a moment and returns with a double-ended Ausar dildo. <i>“Equipment we can use together.");
		if(silly) output(" And best of all, it’s pink!");
		output("”</i>");
		output("\n\nWasting no time, you put yourself tail-to-tail with Anno so she can insert the device. It slips between Anno’s plump lips and penetrates your own [pc.pussy " + selCunt + "] in one swift motion. It’s not so large as to be uncomfortable, but big enough that it reaches your most sensitive places. Anno sure knows how to pick ‘em. You rock steadily back and forth, pushing and giving against Anno, the toy acting as your mutual phallus. Each of you gets the sensation of giving and receiving the pleasure of filling the other’s hole.");
		pc.cuntChange(selCunt,100);
		output("\n\nYou feel the pleasure build as your motions grow bigger and bigger. Anno takes it up a notch, aggressively fucking herself backwards into you. It feels like you’re really getting fucked, only instead of thighs slapping into your bottom, it’s Anno’s bulbous backside. After the heat that grew in you from eating her out earlier, it isn’t long before you’re close to achieving orgasm. If you had to guess, Anno must be close, too. Not wanting to be outdone, you set the pace yourself, fucking Anno’s pussy with your own [pc.pussy " + selCunt + "]."); 
		output("\n\nYour furious pace soon brings you both to climax. Your fingers clap to your [pc.clit], rubbing and massaging it as best you can to intensify your orgasm."); 
		output("\n\nA hot warmth spreads through your love tunnel. Anno must have chosen a model with synthcum. Behind you, Anno works her way through her own orgasm, her breath sharp and fast."); 
		output("\n\nWhen she has come the rest of the way down, Anno looks back over her shoulder at you. <i>“That was some exercise. I think I may have to try that routine again sometime.”</i> You attempt to pull free and express a similar sentiment, but find your ass glued to hers. <i>“Oh, right. This model is really faithful. It’s got the knot and everything. Guess we’ll just have to wait it out.”</i> There are worse ways to spend a cool down period. Only it’s too bad you’re not able to hold Anno in your arms while knotted together like this.");
	}
	pc.orgasm();
	processTime(30);
	//Ran back to ship, so some sweat:
	sweatyDebuff(1);
	clearMenu();
	addButton(0, "Next", mainGameMenu);	
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
	// -1 frame, +1 toward [Sore] debuff, +1 [Sweaty], -30 energy {Time: 30 minutes}
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
	// -3 frame, +2 toward [Sore] debuff, +2 [Sweaty], -50 energy {Time: 30 minutes}
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
	
	var isSwimChanged:Boolean = (pc.hasStatusEffect("Temporary Nudity Cheat") || pc.hasStatusEffect("Temporary Swimwear Cheat"));
	
	if (passDetector())
	{
		if (isSwimChanged)
		{
			output("\n\nA quick word buys you enough freedom to take a hasty rinse and the showers and the opportunity to don your gear once more before being ousted from the gym.");
			pc.removeStatusEffect("Temporary Swimwear Cheat");
			pc.removeStatusEffect("Temporary Nudity Cheat");
		}
		return true;
	}
	output("Tile covers the floor in this long room, and the whole place has a pleasant yet unfamiliar smell. A pool stretches nearly the entire length of the room, with black lines crossing its floor to designate swimming lanes. A sloping ramp leads down into the shallow end.");
	output("\n\nThis place seems more popular with the local cows than the other rooms, as there are groups of them swimming together. Many are clad in holstein-print swimsuits, while others – cow and bull alike – go naked. One naked cowgirl floats on her back, pink nipples pointing toward the ceiling, pushing herself along in a lazy backstroke.");
	output("\n\nYou wonder why it doesn’t smell like chlorine; surely they can’t go without something to keep the pool clean, with this many people in it. You dip two fingers into the pool water to test it, and find it smooth, almost slippery, the sign of a synthetic decontaminant. That explains the unfamiliar smell, and it’s probably a safer choice here, as you’re sure more than a few people have had sex in this pool.");
	output("\n\nA bubbling spa sits in one corner, big enough to hold fifteen to twenty people. It looks to be very popular; about a dozen cows and bulls sit in it, some on each others’ laps. You’re not sure if the motion in the water is entirely from the jets, or if there’s something going on beneath the bubbles. Probably both.");
	
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
	// +1 muscle tone, -1 frame, +1 toward [Sore] debuff, -30 energy {Time: 30 minutes}
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
	// +2 muscle tone, -2 frame, +2 toward [Sore] debuff, -50 energy {Time: 30 minutes}
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
	// +20 energy, +15-20 Lust {Time: 20 minutes}
	processTime(20);
	pc.energy(20);
	pc.changeLust(15+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Locker Room and Showers
public function lockerRoomAndShowersBonus():Boolean
{
	clearOutput();
	author("Slab Bulkhead");
	showName("LOCKER\nROOM");
	if (passDetector()) return true;
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

	pc.shower();
	processTime(10);
	flags["TTGYM_SHOWERED"] = 1;
	
	if (flags["TTGYM_BETSY_VICTORIA_HOME"] != undefined && flags["TTGYM_BETSY_VICTORIA_NEVER"] != 1 && rand(2) == 0 && pc.hasCock())
	{
		tentongymShowBetsyVictoria(true);
		output("\n\nThe hot water washes away your sweat and soreness, and it’s a significant improvement over your shipboard shower unit; the improved water pressure alone has you wanting to stay in for longer than necessary. But all good things must end.");
		output("\n\nRight as you’re about to turn the shower off and head out, you hear a familiar voice, and look up to see Betsy and Victoria walking toward you, each with one hand resting on the others’ ass.");
		clearMenu();
		addButton(0,"Next",showerWithBetsyAndVictoriaApproach);
		return;	
	}
	else if(pc.exhibitionism() < 33 || pc.lust() < 33)
	{
		output("\n\nThe hot water washes away your sweat and soreness, and it’s a significant improvement over your shipboard shower unit; the improved water pressure alone has you wanting to stay in for longer than necessary. But all good things must end, and you soon head out and towel yourself off, then get dressed again.");
		output("\n\nYou needed that.");
		// Remove all [Sweaty] {Time: 10 minutes}
	}
	else
	{
		output("\n\nYou’ve gotten yourself clean, but now that you’re done, you wouldn’t mind getting dirty again. And while it wouldn’t be the first time you got yourself off in the shower, with so many attractive people here, there’s no reason you should have to do it alone.");
		output("\n\nWith that in mind, you squirt another dollop of body wash into your hands, then turn your back to the shower, rubbing your hands all over your [pc.chest]. You work it into a good lather, stroking the slippery stuff all the way down to your [pc.belly] and massaging it into your [pc.crotch].");
		output("\n\nYou let out a moan, not too loud but enough to be heard among the sounds of rushing water and splashing footsteps. Surely someone’s watching by now.");
		output("\n\nSliding your foam-covered hands back up, you tweak your [pc.nipples], making yourself gasp. You turn it into a loud exhale, then spin to face the shower, stretching your arms out behind yourself and tilting your head back to let the water wash your [pc.chest] clean.");
		output("\n\nAfter holding the pose for a good long moment, you get another palmful of body wash, rub it onto both hands, then smack your [pc.ass] hard on both cheeks. You stroke your hands up your sides, then rub your shoulders for a moment, tilting your head back and forth, swaying your [pc.hips] all the while.");
		// If the PC has no cock, they will get the “no one interested” scene. If the PC has a cock, they’ll get the appropriate pre-Betsy and Victoria scene.
		if(!pc.hasCock() || pc.hasStatusEffect("Betsy and Victoria CD") || flags["TTGYM_BETSY_VICTORIA_NEVER"] == 1)
		{
			output("\n\nDespite the show you’ve just put on, it seems like nobody wants to play right now. You consider handling yourself right then, but really, what’s the point? If a room full of naked New Texans doesn’t want to get dirty with you, then you might as well get cleaned up and find someone who does.");
			//[Done] Go to Locker Room and Showers {Remove all [Sweaty]} {Time: 10 minutes} [+40 Lust] [+1% Exhibitionism]}
			pc.changeLust(30+rand(10));
			pc.exhibitionism(1);
		}
		else
		{
			tentongymShowBetsyVictoria(true);
			// PC has a cock AND hasn’t met B&V:
			if(flags["MET_SHOWER_GIRLS"] == undefined) output("\n\nYour show seems to have attracted some attention. As you turn around to wash your [pc.ass] and put your [pc.chest] back on full display, two cowgirls walk up to you, each with a hand on the other’s rear.");
			// PC has a cock AND has met B&V:
			else output("\n\nLooks like your show attracted some familiar attention. As you turn around to wash your [pc.ass] and put your [pc.chest] back on full display, Betsy and Victoria walk up to you. If both girls’ hard nipples and Victoria’s lengthening horsecock are any sign, they’re happy to see you.");
			//[Next] Go to Betsy and Victoria
			clearMenu();
			addButton(0,"Next",showerWithBetsyAndVictoriaApproach);
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
		if(flags["SEXED_QUENTON"] != undefined) output("<i>“Office is always open, if you’re up for some personal trainin’.”</i>");
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
	output("Quenton gives you a nod. <i>“Just here for a quick look or a quick lift? I gotcha.”</i> He taps a few buttons on his computer, then holds out a hand to you. <i>“That’ll be 500, friend.”</i>");
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
	generateMap();
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
	generateMap();
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
		
		rooms["569"].removeFlag(GLOBAL.NPC);
		rooms["TEN TON OFFICE"].addFlag(GLOBAL.NPC);
		moveTo("TEN TON OFFICE");
		
		output("\n\nDamn right you are. Quenton props a sign that says ‘Be Back Soon’ on the desk, then opens up the door to his office and invites you in, closing the door behind you both.");
		output("\n\nQuenton’s office is small but simple, with a desk and cabinet taking up about half of it. Lights shine down from the ceiling, and two of the walls are nothing but enormous mirrors.");
		output("\n\nThe short-horned bull takes a bottle of lube out of one desk drawer, then strips out of his shirt and pants, and spreads his arms and legs as he flexes for you. Quenton is ridiculously ripped, with veins standing out over rock-hard muscles bulging beneath his tanned skin. His foot-long horse cock also has thick veins standing out on either side, with a pair of bulging balls dangling behind it. He’s also entirely hairless, further making all of his muscles and his pronounced package stand out.");
		output("\n\nQuenton flexes his way through a few poses, then turns to you with a grin, clearly hoping you like what you see. <i>“You pitchin’ or catchin’, hardbody? I’m good for you either way.”</i>");
		
		processTime(1);
		
		// [Pitch] Go to Pitching Quenton {requires penis or strap-on}
		// [Catch] Go to Catching Quenton
		clearMenu();
		if (pc.hasHardLightEquipped() || pc.hasCock()) addButton(0, "Pitch", quentonTrainingPitch, undefined, "Pitch", "Use your tool to take him from behind.");
		else addDisabledButton(2, "Pitch", "Pitch", "You don’t have the proper equipment for this.");
		addButton(1, "Catch", quentonTrainingCatch, "catch", "Catch", "Have him take you from behind.");
	}
}
public function doYouEvenLiftBro():void
{
	clearOutput();
	output("Do you even lift, bro?" + pc.modTone(100));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function quentonTrainingFinish():void
{
	processTime(1);
	rooms["TEN TON OFFICE"].removeFlag(GLOBAL.NPC);
	rooms["569"].addFlag(GLOBAL.NPC);
	currentLocation = "569";
	mainGameMenu();
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
	if(!pc.hasHardLightEquipped() && pc.hasCock()) x = rand(pc.cocks.length);
	
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
		x = -1;
		if(pc.hasVagina()) x = rand(pc.vaginas.length);
		
		output("\n\nOnce you’ve got the hardlight dildo all the way in, you thrust just a little.");
		if(x >= 0) output(" The friction from your [pc.lowerUndergarment] rubs against [pc.oneVagina], a pleasing sensation that builds with every thrust.");
		output(" Quenton starts to push back against you, a low growl coming from his throat with every motion as he too eases into it. The muscles of his back and legs tighten and loosen, every movement pushing him into an easy rhythm. After a moment, you start thrusting a little harder, and Quenton drops one hand to his foot-long dong and starts stroking himself.");
		output("\n\n<i>“You got it, Steele,”</i> Quenton says, his voice low and husky, and lets out a long moan. <i>“Just keep on goin’.”</i>");
		output("\n\nYou plan to. Your grip tightens on his narrow hips, and as you pick up the pace, your hands slowly trace up his sides. Quenton straightens up and presses his muscled ass back against you, making your thrusts go deeper. You feel the heat coming off of him as he presses his back against your [pc.chest], and the scent of his musk is intoxicating.");
		output("\n\nQuenton’s hips are thrusting faster now, and you increase your pace again, and wrap your arms around his chest, getting a grip on his hard pecs. He growls, and slaps his free hand down on your [pc.thigh], squeezing it.");
		output("\n\nHe’s breathing faster, sweat beading on his forehead and trickling down the back of his neck. Your thrusts drive still deeper, making him let out a quick gasp with each one. His swollen balls swing forward with every one of your thrusts, to bang against the base of his horsecock");
		// if PC has balls:
		if(pc.balls > 0) output(", matched by your own [pc.balls] in the same rhythm slapping against his ass");
		output(". His head tilts back, and he squeezes your thigh, urging you on.");
		output("\n\n<i>“Harder,”</i> Quenton groans, his voice catching at the end.");
		output("\n\nYou drop your hands to his hips again, your fingers wrapping around them from the front, all for a better grip. His rear tunnel squeezes your strapon, and you push harder");
		if(x >= 0) output(", increasing the pressure against your [pc.vagina " + x + "]");
		output(" as you thrust again, the sound of your flesh slapping together filling the small office. The heat coming off of him is enough to make you start sweating, and you wonder if the mirrors will fog up before you two are done.");
		output("\n\nThe pleasure in your [pc.crotch] builds, bringing you closer to orgasm, but you force it down. No way you’re going to finish before him; you’ll show Quenton you’re stronger. Just to drive that home, you drop one hand to his swinging balls and give them a soft squeeze, then start stroking his swollen sack.");
		output("\n\nAnother long, low groan tears its way out of Quenton’s throat, and he arches his back, pressing his shoulders against your [pc.chest]. <i>“Gonna,”</i> he gasps out, <i>“gonna–”</i>");
		output("\n\nAnything else Quenton was going to say is lost in a throaty groan as his cock twitches and spurts out a long stream of pearly white cum, splattering against the mirror halfway across the office. You don’t let up, and give his balls a good squeeze as he shoots off again, his breathing rough and ragged. He gives his horsedong a few more tugs, squeezing out another quick shot, before leaning forward and resting his hands on his knees again.");
		output("\n\nWith the buff bull finished and drained, it’s time for you to get yours. You clench your hands on Quenton’s hips again and pound away, focusing on the sound of his low grunts and friction from every thrust");
		if(x >= 0) output(" as your [pc.lowerUndergarment] massages your [pc.vaginaNoun " + x + "]");
		output(". It’s not long before the sensation becomes too much. You look to the cum-spattered mirror, and see Quenton watching you both there, and give him a grin as you pound home one last time.");
		output("\n\n");
		if(x >= 0) output("Your [pc.vaginaNoun " + x + "] spasms as t");
		else output("T");
		output("he orgasm rips through you, your whole body clenching at once, and you let out a long groan of your own");
		if(x >= 0) output(" as your [pc.girlCum] turns your [pc.lowerUndergarment] slick and swampy");
		output(". Your hips thrust a few more times on their own, then your whole body sags.");
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
	addButton(0, "Next", quentonTrainingFinish);
}

// Catching Quenton
public function quentonTrainingCatch(response:String = ""):void
{
	clearOutput();
	author("Slab Bulkhead");
	showQuenton(true);
	clearMenu();
	
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
			output("\n\n<i>“</i>Damn<i>, you look good,”</i> Quenton grunts, sweat from his chest beading onto your bare back. <i>“Got to be... one of the best... bodies in my gym,”</i> he pants.");
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
			output("\n\n<i>“</i>Damn<i>, you look good,”</i> Quenton grunts, sweat from his chest beading onto your bare back. <i>“Got to be... one of the best... bodies in my gym,”</i> he pants.");
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
	addButton(0, "Next", quentonTrainingFinish);
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
			output("\n\nBy the time you get to the ninth weight, you and Simone have both slowed down a little, but she shows no signs of stopping. You take a deep breath and move up to the tenth weight. One... two... three... four... five. There’s an aching in your chest now, but you force yourself to keep lifting.");
			
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
	showBust("SIMONE_HALF_NUDE");
	clearMenu();
	
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
			else if(!pc.hasCock() || (pc.isHerm() && rand(3) == 0))
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
				IncrementFlag("TTGYM_SIMONE_ORAL");
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
				IncrementFlag("TTGYM_SIMONE_ORAL");
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
				IncrementFlag("TTGYM_SIMONE_DP_GYM");
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
				pc.changeHP(-1);
				pc.changeLust(50 + rand(21));
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
			
			pc.girlCumInMouth(chars["SIMONE"]);
			pc.girlCumInMouth(chars["SIMONE"]);
			pc.exhibitionism(2);
			pc.changeLust(30+rand(10));
			pc.applyPussyDrenched();
			
			if(!pc.hasGenitals() && flags["SIMONE_TEASED"] == undefined) flags["SIMONE_TEASED"] = true;
			
			IncrementFlag("SEXED_SIMONE");
			IncrementFlag("TTGYM_SIMONE_ORAL_GIVE");
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
	showBust("LOLA_NUDE");
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
			if(pc.hasHardLightEquipped())
			{
				if(pc.hasCock()) output("\n\nYou shake your head, and tell Lola that while you have a penis, you are not planning on using it at the moment.");
				else output("\n\nYou shake your head, and tell Lola that you don’t have the dong she’s looking for.");
				output("\n\n<i>“That’s too bad,”</i> she says, and gives your [pc.hip] a squeeze before pulling her hand away. <i>“And you look like you’d be fun, too. Darn.”</i>");
				if(pc.hasHardLightEquipped())
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
		
		if(!pc.hasHardLightEquipped() && !pc.hasCock())
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
		else if(pc.hasHardLightEquipped() || pc.hasCock()) addButton(0, "Yep", lolaPoolSex, "yep");
		else addDisabledButton(0, "Yep", "Yep", "You don’t have the proper equipment to do this!");
		addButton(1, "Nope", lolaPoolSex, "nope");
	}
}
public function lolaPoolSex(response:String = ""):void
{
	clearOutput();
	author("Slab Bulkhead");
	showName("\nLOLA");
	showBust("LOLA_NUDE");
	clearMenu();
	
	switch(response)
	{
		// FloatFuck
		case "yep":
			var x:int = -1;
			if(!pc.hasHardLightEquipped() && pc.hasCock()) x = rand(pc.cocks.length);
			
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
			IncrementFlag("TTGYM_LOLA_POOL");
			
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

// Betsy and Victoria
public function showerWithBetsyAndVictoriaApproach():void
{
	clearOutput();
	tentongymShowBetsyVictoria(true);
	
	if (flags["TTGYM_BETSY_VICTORIA_HOME"] != undefined)
	{
		tentongymBetsyVictoriaGymShowerHomeSexText();
	}
	else if(flags["MET_SHOWER_GIRLS"] == undefined)
	{
		output("One of the girls is a tanned blue-eyed blonde with a figure so much the New Texas ideal she could have stepped off of a travel brochure, her huge tits almost impossibly perky with pink nipples pointing straight at you. Her hair’s pulled back in low pigtails dangling past her shoulders.");
		output("\n\nThe other has long black hair with bangs trimmed straight above her eyebrows, and stands taller and a little less curvy, but with quite a bit more tone, clearly no stranger to the gym. She’s also packing eight inches of half-sheathed horsecock, an uncommon sight on the local girls.");
		output("\n\n<i>“Hello there, cutie,”</i> the blonde says, then giggles as she looks you over. <i>“I’m Betsy. This–”</i> She pauses to squeeze her partner’s ass, prompting the other girl to spank her, hand smacking hard across Betsy’s jiggling flesh. <i>“–is Victoria.”</i>");
		output("\n\n<i>“Hi,”</i> Victoria says, and gives you an appraising look. Her eyes are heavy-lidded, but she looks like she likes what she sees.");
		output("\n\nYou introduce yourself, and ask if the two come here often.");
		output("\n\n<i>“Most every time we’re here,”</i> Victoria says. <i>“It’s a good place to find new friends to play with.”</i>");
		output("\n\nYou mention that you haven’t seen many herms here on New Texas, though you’ve met quite a few others on your journeys. Victoria smiles, looking kind of proud, but it’s Betsy who speaks up, blushing as she laughs.");
		output("\n\n<i>“Oh, that’s a funny story. We used to use a strapon, but I kept breaking them. I, um, get a little rough sometimes.”</i>");
		output("\n\nYou stare at Betsy for a moment, and hope she’s talking about low-tech strapons. If the girl has a habit of breaking hardlights, you might be in for a rough time.");
		output("\n\n<i>“And,”</i> Victoria says, <i>“I always wondered what it felt like to have a cock. So I thought I’d give it a try.”</i> She strokes a hand down her length, joined by Betsy’s hand a moment later. <i>“I wouldn’t give up this thing for the world.”</i>");
		output("\n\n<i>“Sooooo,”</i> Betsy says, twirling a lock of blonde hair around one finger, <i>“you want to play with us? You can pick who gets to be in the middle.”</i>");
		
		flags["MET_SHOWER_GIRLS"] = 1;
	}
	else
	{
		output("<i>“Why hello there again, cutie,”</i> Betsy says, stepping forward to press her large chest against your [pc.chest]. She slips to your right, wrapping her boobs around your arm, as Victoria moves in from your left. <i>“Showing off like that, you wouldn’t be looking to see us again, would you?”</i>");
		output("\n\n<i>“Not that we’d blame you,”</i> Victoria says. She slides up against you, her dong rubbing up against your [pc.thigh], its slowly increasing length reminding you that Victoria is more a grower than a shower. <i>“And we’re always glad to see you again.”</i>");
		output("\n\nBetsy giggles. <i>“Especially if you keep bringing this around,”</i> she says, reaching down and wrapping one hand around the base of your [pc.cock]. Victoria’s hand joins her a moment later, stroking down along your shaft. <i>“");
		if(flags["SHOWER_SANDWICH"] == undefined) output("So, you up for a sex sandwich, [pc.name]? Like I mentioned before, you can choose who’s in the middle.");
		else output("So, you up for another sandwich, [pc.name]? You can choose who’s in the middle again.");
		output("”</i>");
	}
	
	processTime(1);
	
	// [Oh Yeah] Go to Sandwich Selection {Remove all [Sweaty]} {Time: 20 minutes}
	// [Just Teasing] Go to Sandwich Denial [+40 Lust] {Remove all [Sweaty]} {Time: 10 minutes}
	clearMenu();
	addButton(0, "Oh Yeah", showerWithBetsyAndVictoriaSelect);
	if (flags["TTGYM_BETSY_VICTORIA_HOME"] != undefined) addButton(1, "Not Now", tentongymBetsyVictoriaGymShowerNotNow);
	else addButton(1, "Just Teasing", showerWithBetsyAndVictoriaTease);
}
// Sandwich Selection
public function showerWithBetsyAndVictoriaSelect():void
{
	clearOutput();
	tentongymShowBetsyVictoria(true);
	
	if(flags["SHOWER_SANDWICH"] == undefined)
	{
		output("<i>“Ooh, good,”</i> Betsy says. <i>“I thought you looked like fun.”</i> She presses her wet body against you, her boobs slipping against your [pc.chest], while Victoria slides up against your other hip, and rubs her dong against your thigh.");
		output("\n\n<i>“Your choice, [pc.name],”</i> Victoria says.");
		if(pc.hasVagina()) output(" <i>“But so you know, if you want to be in the middle, I’m going right up your ass.”</i> She smirks.");
		output(" <i>“So, who gets to be the meat in this sandwich?”</i>");
	}
	else
	{
		output("<i>“Oh, goody,”</i> Betsy says, her voice dropping a little as she gives you a lustful look. She gives your [pc.ass] a squeeze, and adds, <i>“I was hoping you’d say yes.”</i>");
		output("\n\n<i>“Your choice, [pc.name],”</i> Victoria says.");
		if(pc.hasVagina()) output(" <i>“But remember, if you want the middle, I’m going right up your ass.”</i> She smirks.");
		output(" <i>“So, what’s it going to be this time?”</i>");
	}
	processTime(1);
	
	// [Betsy] Go to Betsy Sandwich
	// [Victoria] Go to Victoria Sandwich
	// [You] Go to You Sandwich
	clearMenu();
	addButton(0, "Betsy", showerWithBetsyAndVictoriaScene, "betsy", "Betsy Sandwich", "Have Betsy sandwiched in between you and Victoria.");
	addButton(1, "Victoria", showerWithBetsyAndVictoriaScene, "victoria", "Victoria Sandwich", "Have Victoria sandwiched in between you and Betsy.");
	addButton(2, "You", showerWithBetsyAndVictoriaScene, "you", (pc.short + " Sandwich"), "You will be sandwiched in between Betsy and Victoria.");
}
// Sandwich Denial
public function showerWithBetsyAndVictoriaTease():void
{
	clearOutput();
	tentongymShowBetsyVictoria(true);
	
	output("You give the two cowgirls a teasing smile, and tell them you just felt like showing off a little. It’s a flattering offer, but you’re not actually looking for sex right now.");
	output("\n\n<i>“Tease,”</i> Betsy says, and sticks her tongue out at you.");
	output("\n\nVictoria gives her a swat on her butt, and points over to another part of the showers. <i>“What about her?”</i> she asks Betsy.");
	output("\n\n<i>“Ooh, I like,”</i> Betsy says. The two lovers wander off toward their new potential partner.");
	
	processTime(10);
	pc.changeLust(30+rand(20));
	pc.exhibitionism(1);
	pc.shower();
	
	// [Done] Go to Locker Room and Showers [+1% Exhibitionism]
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function showerWithBetsyAndVictoriaScene(response:String = ""):void
{
	clearOutput();
	tentongymShowBetsyVictoria(true);
	
	var x:int = -1;
	
	switch(response)
	{
		// Betsy Sandwich
		case "betsy":
			x = rand(pc.cocks.length);
			
			// One of the following two scenes will appear, chosen randomly.
			if(rand(2) == 0)
			{
				output("You tell the girls you want Betsy to be in the middle. The blonde cowgirl giggles again, her eyes bright as she looks between you and Victoria – more specifically, at your and Victoria’s cocks. Betsy reaches down and starts to stroke both of you, her soft grip made slippery by water from the shower.");
				output("\n\n<i>“Hmm, who do I want where...”</i> She keeps stroking, and Victoria makes a low, approving sound at Betsy’s touch. Victoria’s horsecock is swelling and stretching out of its sheath, adding inches as her arousal grows, and your own [pc.cockNoun " + x + "] isn’t far behind. Betsy looks back and forth at the two dongs, then runs her tongue over her upper lip.");
				output("\n\nFinally, Betsy gives your half-erect [pc.cockNoun " + x + "] a squeeze. <i>“Lie down,”</i> she says, smiling at you. <i>“I want to go for a ride.”</i> She squeezes the base of Victoria’s cock in turn, and says, <i>“Looks like my ass is yours!”</i>");
				output("\n\n<i>“Well, I knew that,”</i> Victoria says with a quick laugh. <i>“Better lube me up plenty, babe.”</i>");
				output("\n\nBetsy presses gently on your shoulder, urging you down to the slick tile floor, not that you needed much encouragement. She straddles your [pc.hips], then lifts herself a little and presses her pink pussy against your [pc.sheath]. She’s already plenty wet, and she slides her lips back and forth along your length, preparing you to push inside her.");
				output("\n\nYou reach up and cup the cowgirl’s big tits in both hands, running your fingers across the sides of her fleshy mounds and brushing them against her stiff nipples. Betsy smiles as she moans, and leans forward, pressing her boobs against your palms. The two of you keep that up for a moment, teasing each other as your [pc.cock " + x + "] grows fully stiff, until Victoria steps over and stands above you both, facing Betsy.");
				output("\n\n<i>“So,”</i> Victoria says, sounding a little smug, <i>“about that lube?”</i>");
				output("\n\nBetsy leans forward and stays there, and her movement slows, sliding her pussy back and forth over your dick just a little as she moans again. Her voice is stifled, barely audible over the sound of the showers and the onlookers, but the slurping sounds make it clear she’s got Victoria’s cock in her mouth. Betsy’s hands slide up Victoria’s legs and grab hold of her tight, firm ass, pulling the herm cowgirl closer and deeper.");
				output("\n\nFrom where you lay, Victoria’s spread legs frame Betsy’s heaving boobs, and the two of them move together as Betsy slathers spit all along Victoria’s horsecock. It’s not a bad view.");
				output("\n\nVictoria lets out a satisfied sigh as Betsy pulls back with one last long slurp. She steps behind her girlfriend, a foot of fully firm dong sticking up from between her legs, then looks down at the two of you and grins. <i>“Better get her going, [pc.name],”</i> Victoria says. <i>“Don’t make me wait to get in on this.”</i>");
				output("\n\nBetsy giggles, then licks her lips and looks down at you. <i>“Hold still for just a second,”</i> she says, then leans forward and raises her curvy hips. Your [pc.cock " + x + "], nice and slick from her juices and no longer held down, leaps to attention, the head slapping against her pussy. Betsy laughs, then slides your dick up into her with a single stroke.");
				
				pc.cockChange();
				
				output("\n\nYou let out a grunt as smooth, squeezing flesh surrounds your cock, and Betsy’s hips slap against your [pc.hips] as she hits home, her boobs jiggling as she lands. A blissful expression spreads across her face, and she moans, <i>“Ooh. . .”</i> before leaning forward and planting her hands on the floor above your shoulders.");
				output("\n\n<i>“Hold on tight, cutie,”</i> Betsy says. <i>“You’re in for a ri–ide. . .”</i>");
				output("\n\nWithout another word, Betsy rises up a few inches on your cock and slams herself down again, and again, and again, her thick thighs flexing with every motion. You start thrusting back, and she cries out with every push, shoving herself down harder each time. Her big tits bounce up and down on her chest in rhythm, and you take hold of them both, squeezing them as you push your [pc.cock " + x + "] harder into her clenching cunt.");
				output("\n\nIf this is how Betsy likes to ride, you’re starting to see how she could have a problem with breaking strap-ons.");
				output("\n\nBetsy spreads her legs wider, slamming down harder on your cock with every motion, and leans forward, shoving her tits into your face. <i>“Come on in, Vicky!”</i> she gasps out, and holds her hips still for just a moment. <i>“I’m all ready for yo– </i>OOH!<i>”</i>");
				output("\n\nVictoria plants her legs to either side of Betsy’s hips and mounts her girlfriend. There’s a strange kind of pressure on your [pc.cockNoun " + x + "], buried deep inside Betsy as it is, as Victoria slides her horsecock up Betsy’s ass. The pressure slowly builds, and you guess it’s slow going into Betsy’s ass, as her eyes are squeezed shut tight and she hasn’t started hammering her hips against yours again.");
				output("\n\nAfter a moment, you see Victoria’s hands on Betsy’s wide hips, and the thrusting starts again, though it feels like Victoria’s the one doing it. Betsy’s too busy gasping, her voice high and her breaths short, to do much else.");
				output("\n\nWell, you can help with that. You match your thrusting pace with Victoria, both of you slowly picking up speed. Betsy’s pussy clenches tight around your [pc.cockNoun " + x + "], and she pulls in a deep breath, then pushes herself up, pulling her tits out of your face and letting loose with a cry that echoes throughout the shower room.");
				output("\n\n<i>“F–faster,”</i> Betsy gasps, and you’re happy to oblige. Her boobs shake as you and Victoria both thrust faster, throwing off drops of water from the showers. Betsy’s tongue lolls out of her mouth as she tilts her head back, utterly lost in the double-fucking.");
				output("\n\nYou lean to one side and look up at Victoria. She’s riding high with her cock buried up Betsy’s round ass, chest thrust out and nipples hard, her abs flexing with every rapid thrust. She catches you looking and grins, then takes a firmer grip on Betsy’s hips and hammers home harder, making her girlfriend squeal above you.");
				output("\n\nYou tweak Betsy’s nipples some more, giving her boobs a good stroke and squeeze. She can’t be too far off, not with the noise she’s been making and with you and Victoria both buried in her. Sure enough, she arches her back and screams as orgasm hits her, her pussy giving your [pc.cock " + x + "] one last hard squeeze before she sags forward against you, burying your face in her tits again.");
				output("\n\nIt’s about enough to drive you over the edge, and judging by the sound of her quick gasps, Victoria’s not far off either. You give Betsy’s pussy a few more quick thrusts as you feel your orgasm building, and a moment later, Victoria’s thrusting stops all at once as she moans loudly, then pumps rapid thrusts into Betsy’s ass as she comes.");
				output("\n\nThe motion sets you off, and you slam your hips against Betsy’s as [pc.cum] shoots through your [pc.cockNoun " + x + "], pouring into the busty cowgirl.");
				// If PC makes lots of cum:
				if(pc.cumQ() >= 2000) output(" Your hips twitch again and again as your [pc.cum] keeps spouting out, and Betsy’s flat belly bulges out as she tries to contain your load.");
				output("\n\nBetsy lets out a faint moan as Victoria pulls out of her ass, then rolls over onto the tile, sliding your dick out of her as well.");
				// If PC makes lots of cum:
				if(pc.cumQ() >= 2000) output(" A gush of your [pc.cum] spills out from between her lips, trailing down her thick thighs and across the tile floor.");
				output(" Victoria collapses to the floor next to her, white dripping from her horsecock, a dizzy look on her face.");
				output("\n\n<i>“We don’t do anal all that much,”</i> Victoria says, then leans against the shower wall, still trying to catch her breath. <i>“I love it, but she says it’s better when it’s not something we do every day.”</i>");
				output("\n\nBetsy giggles, looking flushed red with a silly grin on her face. <i>“And every time we do, I get a li–itle bit closer to saying we can do it all the time,”</i> she says. <i>“Especially with friends.”</i>");
				output("\n\nVictoria just smirks. <i>“Nice work down there, [pc.name],”</i> she says to you. <i>“Not everyone can handle being under Betsy like that.”</i>");
				output("\n\n<i>“But you can handle it again next time, right?”</i> Betsy asks. <i>“When we do this again?”</i>");
				output("\n\nYou smile at her, and say that you’d definitely be up for another round next time.");
			}
			else
			{
				output("You tell the girls you want Betsy to be in the middle. The blonde cowgirl’s eyes light up, a grin spreading across her pretty face.");
				output("\n\n<i>“I want a stand-up sandwich,”</i> Betsy says, then gives a very mischievous giggle. <i>“You up for that, Vicky?”</i>");
				output("\n\n<i>“Always,”</i> Victoria says, then gives you a sideways glance. <i>“You want me in front or back?”</i>");
				output("\n\nBetsy looks back and forth between your [pc.cock " + x + "] and Victoria’s horse-dong, then says, <i>“You get front. Our friend here can have my ass.”</i>");
				output("\n\nVictoria looks at you and smirks, then steps back until she’s against the shower wall. She takes her horsecock in both hands, and starts stroking it. <i>“Better give [pc.himHer] plenty of lube, babe,”</i> she says. Her cock swells rapidly between her hands, longer than it looked a moment ago.");
				output("\n\nWithout another word, Betsy steps close to you and takes your [pc.cockNoun " + x + "] in one hand, gently stroking along the underside, and slowly steps backward. She gives your dick a gentle tug, and you let her lead you along as she moves back toward the shower wall, a few feet in front of Victoria. There, she pulls you closer and gets on her knees, and gives you a kiss on your [pc.cockHead " + x + "].");
				output("\n\nThe kiss turns into a short lick, then a long lick, then a <i>“mmm”</i> as Betsy slides your [pc.cock " + x + "] between her soft lips. Her tongue slips back and forth along your shaft as she slowly works your length deeper into her mouth, bobbing her head forward and back as your [pc.cockNoun " + x + "] grows harder. You reach down and cup both of her large boobs in your hands, stroking their plump softness and making her smile around your dick.");
				output("\n\nBehind Betsy, Victoria’s horsecock has swollen to a full foot long. She strokes it with one hand as she watches Betsy blow you, her other hand rubbing at her perky tits. <i>“She’s good, isn’t she,”</i> Victoria asks, her eyes half-closed as she grins at you.");
				output("\n\nBefore you can form an answer, Betsy pushes herself all the way forward, deep-throating you. The sudden sensation of having your [pc.cockNoun " + x + "] completely engulfed makes you gasp, and you feel it harden even further. Betsy pulls back slowly, her tongue working to cover every inch of your stiffness in her spit, making sure you’re well-lubed. You run your thumbs across her nipples, and she moans around your [pc.cockHead " + x + "], then looks up and gives you a wink before sliding your dong down her throat again.");
				output("\n\nAfter a few more rounds of that, Betsy pulls away, leaving you with a raging spit-slicked boner. <i>“Looks like you’re all set for me, cutie,”</i> she says, then stands and turns to Victoria. <i>“You ready, Vicky – ooh, that’s a yes!”</i>");
				output("\n\n<i>“All set for you, babe,”</i> Victoria says, and gives her erect shaft a light slap. <i>“How’s [pc.heShe] taste?”</i>");
				output("\n\n<i>“Like this.”</i> Betsy presses herself against Victoria, trapping the other woman’s horsecock between them, and gives her girlfriend a deep kiss. Victoria’s hands drop to Betsy’s ass and squeeze, pulling the two of them even closer. They break it off after a moment, and Betsy lifts one leg up and rests it on Victoria’s hip. <i>“Okay, let’s go!”</i>");
				output("\n\nVictoria squats as Betsy pulls back just enough to align her wet pussy lips with the flat head of Victoria’s cock. With a heave and a thrust, Victoria lifts Betsy up and pulls the blonde down onto her dong, then stands up, her arms hooked under Betsy’s knees, her hands clutching Betsy’s shapely ass. Betsy lets out a high-pitched cry as Victoria’s cock slides into her, and wraps her arms around Victoria’s shoulders, squishing their boobs together as she leans forward.");
				output("\n\nOnce you’re sure that the girls have their balance, then step forward and press your [pc.chest] against Betsy’s back. The head of your [pc.cock " + x + "] prods against her pink asshole, and she looks back over her shoulder.");
				output("\n\n<i>“Don’t worry, cutie, didn’t... </i>aah<i>... forget about you,”</i> she breathes, already gasping. <i>“It’s just... doing it standing goes so deep, so fast... always gets me surprised!”</i>");
				output("\n\n<i>“Which is why she likes it so much,”</i> Victoria says, grinning at you. The muscles in her arms and thighs are standing out from how she’s holding Betsy, and while she looks like she can support her girlfriend’s weight, she probably wouldn’t mind some help.");
				output("\n\nVictoria confirms this a moment later, as she pulls Betsy’s squeezable cheeks apart and says, <i>“She’s all ready for you, [pc.name]. Slide on in!”</i>");
				output("\n\nYou press your [pc.cockNoun " + x + "] to Betsy’s asshole and pop the head in, and she lets out a squeak, tensing tight around your [pc.cockHead " + x + "]. You hold back for few seconds as her breathing quickens, then slowly slide your shaft in.");
				
				pc.cockChange();
				
				output("\n\nIt’s quite the squeeze, and you feel every one of Victoria’s slow thrusts pushing back against you. You time your own thrusts to oppose hers, and Betsy lets out a cry with every one, her head lolling back against your shoulder, her breath coming in gasps. Her rear passage clenches around your [pc.cockNoun " + x + "] every time Victoria thrusts, then relaxes to let you push in farther, as the three of you find the rhythm you need.");
				// If PC has large cock:
				if(pc.cockVolume(x) >= chars["BETSY"].analCapacity()) output("\n\n<i>“Oh, fu–uck,”</i> Betsy gasps. <i>“That didn’t – </i>ooh!<i> – feel so big in my mouth...”</i>");
				output("\n\nOnce you’re hilted in Betsy’s ass, you start thrusting faster, harder, hammering your [pc.crotch] at the cowgirl’s jiggly rear. Victoria picks up on your motion and pumps faster herself, a wet squelching sound rising over the sound of the showers and the onlookers as she pounds her horsecock into her girlfriend, giving Betsy as much as she can take.");
				output("\n\nBetsy’s breath comes faster and faster, and soon you and Victoria are thrusting at the same time, filling both of her holes just like she wanted. Her gasps become higher and higher pitched, and she tenses against your [pc.chest] and moans again, her ass clenching hard around your cock.");
				output("\n\nYou feel your orgasm building, and fight it down. Amazing as Betsy’s ass might be, there’s no way you’re going to come first here. You can hold out until–");
				output("\n\nBetsy’s moans rise into a scream, and her whole body shakes as she comes, her voice wavering in time with you and Victoria’s frantic thrusting. She sags forward against Victoria, and you take that as a cue to push in more, squishing Betsy between you and Victoria as the dark-haired cowgirl meets your gaze.");
				output("\n\nThat might be a dare you see in Victoria’s eyes. Does she want to see if she can outlast you? You’re close, but she’s breathing hard too, and you might be able to–");
				output("\n\nBetsy lets out a low giggle, and her ass clenches tight around you, making your breath catch. From Victoria’s sudden cry, it sounds like Betsy put the squeeze on her too. The two of you thrust a few more times, until you can’t hold back anymore and neither can she.");
				output("\n\nYou and Victoria come at the same time, two last hard thrusts into Betsy followed by gasping as orgasms rip through you both. Your [pc.cock " + x + "] twitches in Betsy’s ass as [pc.cum] shoots through it, your [pc.hips] still slamming into Betsy’s cheeks as you try to make the orgasm last as long as possible.");
				// If PC makes lots of cum:
				if(pc.cumQ() >= 2000) output(" The sheer amount of [pc.cum] pouring out of you is too much for her ass to handle, and it washes out around your dick, a fountain of [pc.cumColor] spilling out of her and splattering across the floor.");
				output(" Victoria lets out a long, whining moan, her eyes squeezed shut as her horsecock empties itself into her girlfriend’s pussy, her hands clenched tight on Betsy’s thick thighs.");
				output("\n\nAfter a moment of heavy breathing from everyone, you and Victoria slowly pull out and make sure Betsy gets down without falling down. The three of you collapse against the tiled wall with Betsy in the middle");
				// If PC makes lots of cum:
				if(pc.cumQ() >= 2000) output(", your [pc.cum] still dripping out of her ass");
				output(", everyone shaky and tired and in need of another shower.");
				output("\n\nBetsy recovers first, and moans, <i>“Ooh, I needed that.”</i> She giggles. <i>“Even if I’ll be walking bow-legged for a few days. Totally worth it.”</i>");
				output("\n\n<i>“Damn right,”</i> Victoria says, still breathing hard. <i>“Feel like I worked out twice today.”</i>");
				output("\n\n<i>“Best workout ever,”</i> Betsy says with a giggle. She reaches out to you and Victoria both and rubs at both of your sticky cocks, then licks her lips. <i>“We’ll do this again sometime, right?”</i>");
				output("\n\nThat, you agree, sounds like a really good idea.");
			}
			break;
		// Victoria Sandwich
		case "victoria":
			x = rand(pc.cocks.length);
			
			// One of the following two scenes will appear, chosen randomly.
			if(rand(2) == 0)
			{
				output("You tell the girls you want Victoria to be in the middle. Victoria grins, then looks at Betsy and says, <i>“Hear that, babe? Looks like we both get to go for a ride.”</i>");
				output("\n\nBetsy bites her lower lip as she grins, then starts stroking your [pc.cock " + x + "] and Victoria’s horsecock at the same time. <i>“Ooh, you know that’s one of my favorites,”</i> Betsy says. <i>“You going forward or reverse this time?”</i>");
				output("\n\nIt looks like Victoria’s thinking it over, though she might just be enjoying the feel of Betsy’s hand on her dong. Both of you are swelling up as Betsy’s fingers work their way from your bases to your heads, her strokes growing a little faster every time. Victoria cups one of Betsy’s fat tits in her hand, and you reach out and do the same, running your thumb over her pink nipple. Betsy makes a quick gasp, but keeps up her handiwork.");
				output("\n\n<i>“Forward,”</i> Victoria says after a long moment. <i>“It’s more fun that way, and I want to see everything.”</i>");
				output("\n\n<i>“Okay!”</i> Betsy gives you and Victoria both a grin, then squeezes your hard cocks one last time. <i>“Looks like you’re both ready to go, so...”</i>");
				output("\n\n<i>“So get on the floor, [pc.name],”</i> Victoria says, smirking at you. <i>“I’ll show you how me and Betsy do this.”</i>");
				output("\n\nNo surprise they know exactly what they’re doing here. Betsy giggles as you lie down on the shower floor, and she lowers herself too, straddling your [pc.thighs] as you make yourself as comfortable as you can on the wet tile. The view’s a little odd at first, with the busty cowgirl above you but with your own [pc.cockNoun " + x + "] sticking up between you and her. Then Victoria steps over and spreads her legs to either side of you, holds up her horse dong so you can see the tight, tan pussy lips beneath it.");
				output("\n\n<i>“Bring it on down, Vicky!”</i> Betsy says, and gives your cock a few more strokes. <i>“[pc.HeShe]’s all ready for you!”</i>");
				output("\n\nThe muscles in Victoria’s thighs stand out as she squats, slowly lowering herself until your [pc.cockHead " + x + "] meets her wet twat. Betsy’s hand, still on your dick, guides it home as Victoria slides all the way down, taking you into her until her thighs rest on either side of your [pc.hips]. The fit cowgirl’s cock slaps against your [pc.belly], the flat head pointing right at your face.");
				
				pc.cockChange();
				
				output("\n\nVictoria lets out a low sigh and starts to rock her hips back and forth, her movements slow as she gets used to having you up inside her. After a moment, she starts moving her hips in a circle, and grins down at you, her pussy squeezing around your [pc.cockNoun " + x + "]. <i>“Aah,”</i> she moans, and shivers just a little. <i>“Been a while.”</i>");
				output("\n\nBehind her, Betsy giggles. <i>“Vicky doesn’t take as much cock anymore, not since she grew her own,”</i> she says. Her hands slide around and cup her girlfriend’s perky tits, tweaking her nipples and making Victoria jump, prompting a quick squeeze from her pussy around your cock. <i>“But I know she still li–ikes it!”</i>");
				output("\n\n<i>“Kind of a lot,”</i> Victoria says. Her rocking hips work their way into a rhythm, more forward and back now as you start to thrust along with her. She leans back against her girlfriend’s plump boobs, and asks, <i>“You gonna hop on, babe? I know I’m in the middle here, but I know you’re not where you love to be.”</i>");
				output("\n\nBetsy gives Victoria’s breasts one more quick squeeze, then stands up and moves in front of her, standing over you just like Victoria did a moment ago. You have just enough time to appreciate the view before she also squats down, her round ass heading for her girlfriend’s crotch. Victoria takes hold of the base of her horsecock and aims it up, pointing the flat head right at Betsy’s wet pussy.");
				output("\n\n<i>“Ooooh...”</i> Betsy moans as Victoria’s dong slides into her with ease, her lips spreading as she takes her lover up to the hilt. Her legs slide into place in front of Victoria’s, and her boobs press against your [pc.chest], the fleshy globes spilling forward into your face.");
				output("\n\nVictoria starts thrusting into her girlfriend, and you take hold of the toned cowgirl’s hips and pick up the pace, your [pc.cock " + x + "] trapped between her tight lips. Both girls find the rhythm quickly, and suddenly it’s like you’re fucking both of them at the same time, every one of your motions passing from Victoria into Betsy through the cowgirl’s own cock.");
				output("\n\nVictoria lets out a cry, and for a second you think she’s finished already, not that you could blame her. Fucking and being fucked at the same time would be enough to drive most anyone to the edge quickly. But no, she keeps going, and a moment later you hear a wet thwack as she slaps Betsy’s curvy butt. <i>“Nice try, babe,”</i> Victoria says with a laugh, <i>“but you can’t squeeze one out of me that quick.”</i>");
				output("\n\nBetsy only giggles again. <i>“Just teasing,”</i> she gasps, then arches her back, pulling her tits off of your [pc.chest] and planting her hands on the floor to either side of you. She shoves her hips and ass back against Victoria, her boobs bouncing with every thrust.");
				output("\n\nVictoria reaches around and grabs Betsy’s plump tits, her tan hands against the other cowgirl’s paler skin, then thrusts faster, her cunt sliding up and down your [pc.cockNoun " + x + "]. The sound of flesh slapping against flesh echoes throughout the shower, water from the spouts spattering against your coupling bodies. You reach around to grab Victoria’s firm ass, take hold and thrust harder, doing all you can to keep up with her rapid motion.");
				output("\n\nAs Betsy starts to gasp with every breath, Victoria lets go of her tits and reaches up to grab both of the blonde’s pigtails, pulling her back and making her moan. With Betsy’s boobs jutting forth like that, you can’t refuse the invitation, so you reach up and take them in your hands, giving the plump mounds a good squeeze.");
				output("\n\n<i>“Do her nipples, [pc.name]”</i> Victoria says, though it comes out as more of a groan as Betsy pushes even harder back against her. <i>“Make her – aah!”</i>");
				output("\n\nBetsy must have given her another good squeeze, if the look of focused bliss on Victoria’s face is any sign. And she passes that squeeze right on to you, her pussy wrenching tighter around your [pc.cock " + x + "], holding you in her as the two cowgirls fuck on top of you. There’s no telling how much longer you’ll be able to last, though it looks like both the girls are getting close too.");
				output("\n\nThe girls’ thrusting reaches a frenetic pace, their thighs slapping together to either side of your hips, Betsy’s boobs bouncing in your hands as her lover pounds her from behind. Victoria’s ass slams against your [pc.crotch], fluid from her tight twat trickling down between your legs. Betsy’s moans reach a higher pitch, her eyes squeezed shut, her nipples hard as rocks under your fingers.");
				output("\n\nHold on just a little longer, you tell yourself, just a little–");
				output("\n\n<i>“Fuck!”</i> Victoria shouts, rearing back as her pussy clenches hard around your [pc.cockNoun " + x + "] one last time, her whole body shaking. Her hips slam against Betsy’s ass as she thrusts wildly through her orgasm, and it’s enough to set Betsy off as well. The curvy cowgirl lets out a long, shuddering moan, suddenly throwing herself downward as she comes, her tits slamming against your [pc.chest].");
				output("\n\nVictoria’s final squeezes take you over the edge as well, and you push yourself as hard as you can into her, [pc.cum] shooting through you and up into her pussy.");
				// If PC makes lots of cum:
				if(pc.cumQ() >= 2000) output(" Your [pc.cockNoun " + x + "] spurts into her again and again, and you feel your [pc.cum] squirting out of her and splattering across her thighs and yours.");
				output(" She thrusts along with you as you come, riding out your orgasm like an aftershock of her own, breathing hard the whole way.");
				output("\n\nWith Betsy slumped and gasping atop you and Victoria’s hips still twitching, it’s a moment before any of you can pull yourselves apart. Betsy separates first, sliding her boobs out of your face and pulling herself free of her girlfriend’s cock. She rolls halfway over, cum dripping out of her pussy, a delirious look on her face. <i>“Oo–oh,”</i> she moans, and it sounds like you’re not going to get much more out of her.");
				output("\n\nVictoria slowly stands, her legs shaky,");
				// If PC makes lots of cum:
				if(pc.cumQ() >= 2000) output(" her thighs coated with your [pc.cum],");
				output(" her cock trailing down and dripping white across your [pc.belly]. She sits down next to you and Betsy, laughing a little as she tries to catch her breath. <i>“That one... always takes it out of me,”</i> she breathes.");
				output("\n\n");
				// If PC has low/average physique and/or tone:
				if(pc.PQ() <= 66 || pc.tone < 66) output("You can see why. If that had lasted much longer, you’re not sure if you could have walked away from it. You manage to sit up against the shower wall, and just rest there for a moment. ");
				// If PC has high physique and/or tone:
				else output("Victoria’s not kidding. Even with the time you’ve spent getting stronger and staying in shape, you feel like you’ve had one hell of a workout. You sit up against the shower wall, your body definitely in need of a rest. ");
				output("Betsy might be the one with the habit of breaking strap-ons, but it wouldn’t surprise you if Victoria had done the same at least once.");
				output("\n\n<i>“Can we do that again?”</i> Betsy asks with a giggle. <i>“I mean, not... not right now. But some other time? Sometime soon?”</i>");
				output("\n\n<i>“I’m good for it if you are, [pc.name],”</i> Victoria says. The smirk is back on her face, tired but somehow triumphant.");
				output("\n\nYou tell the girls you’ll definitely be up for another round sometime.");
			}
			else
			{
				output("You tell the girls you want Victoria to be in the middle. Before Victoria can say anything, Betsy gets a wicked smile on her face, and kneels in front of you and her girlfriend.");
				output("\n\n<i>“Sounds good!”</i> Betsy says. <i>“Let’s get you both going.”</i> She starts stroking your cock and Victoria’s at the same time, her hands giving your [pc.cock " + x + "] soft squeezes as you and Victoria both start to swell. She leans forward and plants a kiss on Victoria’s flat cock-head, then on your [pc.cockHead " + x + "], then back to Victoria’s, then back to you, using more and more tongue each time until you and Victoria are both fully hard.");
				output("\n\nOnce Victoria’s cock is swollen to a full foot long, Betsy takes it between her lips and slides about halfway down the shaft, her eyes closing as she makes a <i>“mmm...”</i> sound. Her head bobs up and down, and Victoria moans, one hand resting on the back of her girlfriend’s head. Betsy pulls away after a few more bobs, and she turns to give you the same treatment, her skilled tongue slipping back and forth along your shaft as she takes your dong into her mouth.");
				output("\n\nBetsy slurps and licks at your [pc.cock " + x + "] more than she did at Victoria’s, and presses herself down farther, doing her best to deep-throat you. When she pulls away, you’re slick and wet nearly to the base, and you watch as she slips Victoria’s horsecock between her plump, bouncy boobs.");
				output("\n\nVictoria bites her lip and moans again as Betsy’s tits wrap around her dong, and she strokes the sides of her girlfriend’s boobs as Betsy licks and sucks at her cock’s head. After a few good sucks, Victoria tweaks Betsy’s swollen pink nipples, making her squeak. When Betsy pulls away, Victoria looks disappointed, but keeps stroking her shaft, watching as Betsy returns to your cock.");
				output("\n\nBetsy opens up and fully deep-throats you this time, sliding your [pc.cockNoun " + x + "] all the way into her mouth, her tongue swirling along your shaft all the way down. She slurps at your dick again, eyes closed in lust and concentration, then finally pulls all the way off, her cheeks flushed red. Instead of returning to Victoria, she hefts up her tits and squishes your slippery cock between them, gives you a few good pumps.");
				output("\n\n<i>“Feels like you’re all ready for her,”</i> Betsy says, then turns to face Victoria’s crotch again. But instead of resuming her titfuck, she grabs both of Victoria’s firm asscheeks and spreads them wide, revealing the cowgirl’s small, dark asshole. Betsy smiles up at you. <i>“All yours, cutie!”</i>");
				output("\n\n<i>“Oh, babe, you’re too good to me,”</i> Victoria says, then looks over her shoulder at you and grins. <i>“C’mon, [pc.name]. Shove it in so Betsy can suck me dry.”</i>");
				output("\n\nNo reason to refuse an invitation like that. You line up your [pc.cockHead " + x + "] with Victoria’s rear entry and slowly start to push in. Victoria’s breath catches, and her firm ass clenches, but she relaxes after a moment. The tight, hot tunnel of her ass slowly opens up as you slide your [pc.cock " + x + "] all the way in, until your [pc.hips] press against her tanned skin.");
				
				pc.cockChange();
				
				output("\n\nVictoria tenses, and let out a quivering moan.");
				// If PC has large cock:
				if(pc.cockVolume(x) >= chars["VICTORIA"].analCapacity()) output(" Her voice catches, and she gasps out, <i>“That’s – aah! I didn’t realize you were that big, [pc.name]...”</i>");
				output(" And then, Betsy slides Victoria’s horsecock between her fat tits, and starts to suck on her head again.");
				output("\n\nYou start with gentle thrusts, making sure you don’t shake Victoria’s cock out of where Betsy has it. Then again, you see as you look down, Betsy has Victoria’s dong firmly trapped between her boobs, and her lips wrapped around the flat head, so it doesn’t look like that dick is going anywhere.");
				output("\n\nVictoria cries out again, her hips shaking, the dual treatment clearly more than she can take for long. You slide your hands along her sides, stroking over her tight abs up to her firm, pert boobs, and stroke your fingers over her dark nipples.");
				output("\n\n<i>“Fuck, fuck – aaaaah!”</i> Victoria’s hips thrust and buck, shoving back against you as she comes. Betsy makes slurping noises as she swallows her girlfriend’s semen, riding out the orgasmic thrusts, her lips still squeezed around Victoria’s cock. Victoria sags against you for just a second, then starts thrusting her hips back against yours, like she’s trying to take even more of your cock up her ass.");
				output("\n\n<i>“Tasty girl,”</i> Betsy says with a giggle. <i>“You good for another round?”</i>");
				output("\n\n<i>“You know it,”</i> Victoria says. She reaches back and squeezes your [pc.ass], then spanks you hard on one cheek. <i>“Maybe two, if our friend here can last.”</i>");
				output("\n\nThat sounds like a challenge. You squeeze Victoria’s nipples with both hands, and she yelps, then pushes back against your [pc.cock " + x + "] with a laugh. There’s no telling what having the Treatment and adding a cock did to Victoria’s system, but she clearly can keep it hard if she wants. She starts moaning again as you keep pounding away, harder this time, her cock sliding between Betsy’s tits faster now.");
				output("\n\nBetsy’s boobs bounce against Victoria’s crotch as she sucks on the first three or four inches of Victoria’s cock, her eyes half-closed, her hard pink nipples sticking up and waving with every bounce. There’s a blissful look on her face as she works away at Victoria’s head, clearly enjoying herself.");
				output("\n\nBut not nearly as much as Victoria. Her nipples are hard as rocks between your fingers, and she moans as you squeeze them, her breath coming in short gasps. She still has one hand on your [pc.ass], and she clenches it again, squeezing one cheek as she starts to tremble.");
				output("\n\nBetsy wraps her arms around her tits, hiding most of Victoria’s cock between the plush pillows, and squeezes hard. You give Victoria’s boobs a squeeze as well, and slam hard into her, feel her asshole clench around your [pc.cockNoun " + x + "]. One, two, three more thrusts, and Victoria yells out her orgasm, her whole body pressing back against yours as Betsy sucks her cum down again.");
				output("\n\nEven when Victoria stops gasping, Betsy doesn’t let up, and you don’t either. Victoria’s breathing hard now, still on her feet but barely, and her asshole relaxes a little around your cock. But she doesn’t say to stop, so you pick up the pace again, rolling her dark nipples between your fingers as you pound away.");
				output("\n\n<i>“One... one more,”</i> Victoria breathes, her abs and thighs flexing as she manages to keep her feet. <i>“That’s all I’ve got left.”</i>");
				output("\n\n<i>“Aww, I knew you had it in you, Vicky,”</i> Betsy says, then gives Victoria’s cockhead another long lick, prompting a moan from the herm cowgirl. <i>“Go ahead and let it out!”</i>");
				output("\n\nAnd now you have to make sure you don’t do the same before Victoria’s done. Her ass is squeezing your cock hard again, still tight despite the extended pounding, and she’s hot and sweaty against you. She drops her other hand to your [pc.ass] as well, squeezes both your cheeks, and says in a husky voice, <i>“Come on, [pc.name]. Give it to me...”</i>");
				output("\n\nYou’re getting close, but you know you can hold out, and tell Victoria that she’ll finish before you do. She starts to laugh, but it turns into another gasp as you thrust harder, and she leans her head back, her breaths quick.");
				output("\n\nBetsy bounces her tits up and down the length of Victoria’s shaft, with only her girlfriend’s cockhead in her mouth, the rest of it surrounded by rapidly-sliding boobs.");
				output("\n\nVictoria moans again, louder than before. She’s close. You pump still harder, your [pc.hips] slapping against her firm, toned ass. Betsy’s mouth is open, her tongue circling around Victoria’s flat cockhead, driving her lover ever closer to orgasm. And then–");
				output("\n\n<i>“Aaa – aaaah!”</i>");
				output("\n\nVictoria’s entire body clenches as the last orgasm hits her, her ass squeezing around your cock, pulling you over the edge. Your [pc.cock " + x + "] twitches and fires streams of [pc.cum] up her ass as your hips thrust even faster, the two of you riding out the simultaneous orgasm, gasping and moaning.");
				// If PC makes lots of cum:
				if(pc.cumQ() >= 2000) output(" The sheer amount of [pc.cum] you shoot out fills Victoria’s ass and splatters out back at you in jets, leaving your [pc.crotch] and her ass covered in [pc.cumColor].");
				output(" It takes a moment for both of you to slow down, and her ass keeps squeezing even as you feel yourself start to go soft, making it feel like you might be stuck in her for a moment.");
				output("\n\nYou look and see that Betsy’s tits are now covered in Victoria’s white cum. The blissed-out look on her face, though, suggests she did that on purpose. She hefts up one of her boobs and licks a glob of semen off, then stands up and presses herself against Victoria, kissing her and getting them both dirty enough to need another shower.");
				output("\n\nYou slowly pull yourself out of Victoria while she’s distracted, and lean up against the shower wall, tired and sweaty.");
				// If PC makes lots of cum:
				if(pc.cumQ() >= 2000) output(" More of your [pc.cum] gushes out of Victoria’s ass, trailing down her thighs and pooling down toward a floor drain.");
				output(" When the two lovers separate, Victoria gives you a sheepish look, kind of out of place between the sweat on her forehead and her own cum smeared across her chest.");
				output("\n\n<i>“That’s what Betsy calls draining me dry,”</i> Victoria says, still breathing hard while Betsy gives you a very pleased smile. <i>“It’s sort of her special thing.”</i>");
				output("\n\n<i>“And I lo–ove doing it,”</i> Betsy says, then giggles. She gently pokes Victoria in one sticky boob. <i>“You know you owe me a good long ride when you recover, right?”</i>");
				output("\n\nVictoria laughs. <i>“Of course, babe,”</i> she says, then lets out all her breath at once. <i>“Just give me... an hour, maybe?”</i>");
				output("\n\nThe three of you shower off together, and the girlfriends head off, but not before saying they hope to see you here again.");
			}
			break;
		// You Sandwich
		case "you":
			x = rand(pc.cocks.length);
			
			// One of the following two scenes will appear, chosen randomly.
			if(rand(2) == 0)
			{
				output("You tell the girls you want to be in the middle. Victoria looks at Betsy and asks, <i>“Want to put the squeeze on [pc.himHer], babe?”</i>");
				output("\n\n<i>“Ooh, sounds good,”</i> Betsy says. She looks back and forth between you and Victoria, then kneels in front of the two of you. <i>“Stand close so I can get you both ready, okay?”</i>");
				output("\n\nYou’re not quite sure what she has in mind, but it’s not like you’re going to say no. You and Victoria move closer to each other, and she reaches over to rest a hand on your [pc.ass]. You do the same, giving her firm butt a squeeze. Betsy starts to stroke your [pc.cockNoun " + x + "] and Victoria’s horsecock at the same time, her fingers tracing along the undersides of both dicks as she looks between the two of them and licks her lips.");
				output("\n\nOnce you’re mostly hard, Betsy slides your cock between her plump tits and grabs your free hand, placing it on the side of one of her boobs. She leans over and wraps her lips around the flat head of Victoria’s cock, then starts gently bobbing her head up and down, her eyes slipping closed as she sucks on her girlfriend.");
				output("\n\nNot a bad way to start things. You let go of Victoria’s ass and hold onto Betsy’s breasts with both hands, squeezing them tighter around your [pc.cockNoun " + x + "]. Next to you, Victoria leans in closer, aiming for a better angle as she tries to get more of her dong into Betsy’s mouth. You thrust gently as your dick grows harder, trying not to disturb Betsy’s blowjob as she slowly bobs her head down farther onto her girlfriend’s cock.");
				output("\n\n<i>“Come on, babe, you can do more than that,”</i> Victoria says with a laugh. <i>“I’m going up [pc.hisHer] ass, remember? Better make sure I’m plenty lubed.”</i> She winks at you.");
				output("\n\nBetsy raises her head from Victoria’s cock. <i>“I’ll give you–”</i> She bobs her head down again, giving her girlfriend’s shaft a long slurp. <i>“–all the lube–”</i> She bobs again and starts to stroke your [pc.cockHead " + x + "] where it sticks up from between her tits. <i>“–when you’re both ready, okay?”</i>");
				output("\n\nVictoria laughs again, her hands at work on the base of her dick. She’s grown to a full foot long, and after having your dick squished between Betsy’s boobs, you’re not far from being fully stiff yourself. After a moment, Betsy pulls away from her girlfriend and lavishes your cock head with a few long licks, then gives your tip a kiss.");
				output("\n\n<i>“Looks like you’re all set, cutie,”</i> she says, and releases your [pc.cockNoun " + x + "] from between her tits. <i>“Now give me just a second...”</i>");
				output("\n\nBetsy turns and deep-throats Victoria all at once, making the fit cowgirl’s breath hitch. She pulls back from Victoria’s cock slowly, and you see her tongue lashing back and forth around Victoria’s shaft. When Betsy finishes, Victoria’s horsecock is slick with spit, hard and ready to go.");
				output("\n\nVictoria catches you looking at her prick and smirks at you again. It’s clear she’s looking forward to this.");
				output("\n\n<i>“And now...”</i> Betsy rises from her knees and takes hold of your cock. She leads you with it to the shower wall, then lets go and leans back against the tile, pressing her round ass against the wall and raising one leg to expose her pink pussy lips. <i>“Your turn!”</i> she says, holding out her arms in invitation.");
				output("\n\nYou step forward, aim your [pc.cock " + x + "] at Betsy’s waiting twat, and slide on in. She’s wet and warm and slick, and she takes you all in one thrust, her eyes opening wide as you hilt yourself in her. Her fat boobs press against your [pc.chest] as you slide home, and she wraps her arms around your shoulders, gasping into your [pc.ear]. You moan as her pussy gives your length a good, hard squeeze, and start to thrust, squishing her against the shower wall.");
				
				pc.cockChange();
				
				output("\n\n<i>“H–hold me up,”</i> Betsy says, and hooks her right leg over your hip. <i>“It’s... aah... better like this...”</i>");
				output("\n\nYou take hold of the cowgirl’s jiggly ass, get a good grip, and lift her up as she wraps her left leg around your waist. She giggles, and you squeeze her rear harder as you pick up your pace a little.");
				output("\n\nAfter a few more thrusts, Betsy reaches down and takes hold of your [pc.ass] in both hands, then opens her legs from where they were wrapped around you. <i>“Come and get [pc.himHer], Vicky!”</i>");
				output("\n\nSomething hot and slick prods against your [pc.asshole], and you freeze in your thrusting as Victoria’s flat horsecock head pushes into you. Behind you, Victoria lets out a low moan, and keeps pushing, her foot-long dong sliding all the way up your ass.");
				
				pc.buttChange(chars["VICTORIA"].cockVolume(0));
				
				output("\n\nUnable to help yourself, you cry out as Victoria’s hips press against your [pc.ass], the feeling of penetrating and being penetrated nearly enough to drive you over the edge. You shove forward harder into Betsy, making her gasp again, and Victoria steps forward too, making sure her cock stays fully buried in you.");
				output("\n\nThen, once the two cowgirls have you held tight between them, they start to thrust at the same time, grinding themselves against you. Betsy’s tits squish hard against your [pc.chest], her nipples pressing into your [pc.skinFurScales]. Victoria’s firm boobs press into your back as well, her nipples likewise hard against you.");
				output("\n\nAfter a few more thrusts, Betsy’s legs swing down to wrap around you and Victoria both, pulling you all even closer together. Victoria leans forward and puts her toned arms around you and Betsy, her hands on her girlfriend’s shoulders, fully trapping you between the two of them. Betsy does the same, only serving to press her chest more firmly against your own.");
				output("\n\nYou understand, now, what she meant by putting the squeeze on you.");
				output("\n\nBound up in the cowgirl sandwich, you don’t have much room to thrust, but you shake your [pc.hips] as much as you can. The constant friction around your cock and up your ass is mind-blowing, and you’re soon breathing hard, doing all you can to keep up with the constant motion.");
				output("\n\nBetsy gasps as you and Victoria both pound her into the wall, her cunt clenching around your [pc.cock " + x + "] with every breath. Her tits are squished up against you so much that they reach her chin, and her ass is slapping against the tile, the sound echoing through the showers.");
				output("\n\nBehind you, Victoria’s chest and taut abs smack against your back every time she thrusts into you, her dong twitching as it fills your [pc.asshole]. She’s breathing hard, but keeping her pace steady, though you hear her breath hitch occasionally, making it sound like she’s trying not to come too soon.");
				output("\n\nYou know there’s no way you’re going to outlast them, though. No matter how you try to fight it, you can feel your orgasm building, and it’s only a matter of time before the double-fuck becomes too much for you to bear. You’re the only one getting it from both ends, but – wait, you can fix that.");
				output("\n\nIt takes a second to focus, but you shift your grip on Betsy’s round ass, and slide your fingers further until you feel – there. Her tight little asshole is right at the edge of your grip. You press her harder against the wall, making sure she doesn’t fall, then move your hand farther in and slide a finger up Betsy’s ass.");
				output("\n\nBetsy cries out, her eyes opening wide. Her pussy clenches around your cock, even harder than before, and her legs tighten around you and Victoria. That’s a good sign. You slip a second finger up her ass, all you can manage and still hold her up, and–");
				output("\n\nBetsy cries out as she comes, her whole body shaking, her asshole squeezing your fingers as her cunt wrenches tight around your [pc.cockNoun " + x + "]. Victoria chooses that moment to thrust harder into you than before, pounding into your asshole and driving you over the edge.");
				output("\n\nYou moan loudly as the orgasm hits, your [pc.asshole] twitching around Victoria’s horsecock and your [pc.cock " + x + "] firing off stream after stream of [pc.cum] into Betsy’s pussy.");
				// If PC makes lots of cum:
				if(pc.cumQ() >= 2000) output(" You feel the cowgirl’s belly start to swell as your [pc.cum] fills her up, but with her squeezing you so tight, she’s got no room to grow. Your [pc.cum] spurts back out at you, spraying forth from her pussy, covering her tits and your [pc.chest].");
				output(" Before you can even think to catch a breath, Victoria finishes too, moaning into your ear as her cum streams up your ass, her thrusts faster and faster against your [pc.ass] as she orgasms.");
				output("\n\nThe three of you stay in place for a few long moments, everyone breathing hard, the falling water a welcome relief from the heat you made by being pressed so tight against each other. Then, as you and Victoria both start to go soft, you separate, slowly helping Betsy down.");
				output("\n\nThe two cowgirls lean against the wall to either side of you. Cum drips down all of you, from Betsy’s legs");
				// If PC makes lots of cum:
				if(pc.cumQ() >= 2000) output(" and glazed boobs and your [pc.chest]");
				output(" and the tip of Victoria’s dick, and all three of you slide down to the floor together. Victoria leans forward and looks at you and Betsy.");
				output("\n\n<i>“Nothing like a good squeeze,”</i> Victoria says, laughing and sounding out of breath. <i>“Knew you’d be a good one for it, [pc.name].”</i>");
				output("\n\n<i>“And you’ll be up for it again, right?”</i> Betsy asks, her eyes bright as she looks at you. <i>“Right?”</i>");
				output("\n\nYou manage a laugh, and tell the girls you’d definitely be up for getting the squeeze again.");
			}
			else
			{
				output("You tell the girls you want to be in the middle. Betsy looks from you to Victoria and back, then giggles, rubbing her hands together.");
				output("\n\n<i>“Okay,”</i> she says, <i>“both of you up against the wall, I’ll get you lubed up. Because if she’s gonna have your ass,”</i> she continues, looking at you, <i>“then you can have mine.”</i> She pauses. <i>“I wish I’d brought a dildo or something, so Vicky could have her ass done too...”</i>");
				output("\n\n<i>“Next time, babe,”</i> Victoria says, then puts an arm around your shoulders and pulls you back against the shower wall, until your [pc.ass] hits the wet tile. She drops a hand to your [pc.cockNoun " + x + "] and starts stroking, then gestures for you to do the same.");
				output("\n\nYou reach over and wrap your hand around the base of Victoria’s horsecock, then give it a nice squeeze all the way up to the flat tip. Her dong swells at your touch, growing warmer and fatter, adding another few inches to its length as Victoria grows hard. She gives a soft murmur at your touch, and matches her strokes to yours, making your own member swell to match hers. At her skilled touch, it’s not long before you’re hard and ready to go.");
				output("\n\nBetsy kneels before the two of you, and licks her lips at the two cocks pointing at her. <i>“Never get tired of this,”</i> she says, her voice low, then starts stroking you and Victoria both. Her touch is lighter than Victoria’s, and the sensation of two different hands on your [pc.cock " + x + "] makes you shudder. Betsy leans in and runs her tongue over Victoria’s flat cockhead, then slips over and licks across your [pc.cockHead " + x + "]. Victoria gives your base a squeeze as Betsy licks, and you return the favor when it’s your turn, adding to the dual sensations for both of you.");
				output("\n\nAfter a few good licks each, Betsy starts going down deeper on both you and Victoria in turn, slathering your dicks with spit, making sure to get you both plenty lubed up. She deep-throats Victoria’s foot-long dong, then pulls herself off it with a gasp, and turns to your [pc.cockNoun " + x + "] with a smile.");
				output("\n\nBetsy slips your head past her lips, then moves down your shaft, her skilled tongue working back and forth all the way down your length, until she kisses your base. She pulls away again, then gently strokes you and Victoria both.");
				output("\n\n<i>“Nice and wet, feels like you’re good,”</i> she says, then grins up at you and Victoria, her eyes bright. <i>“You ready?”</i>");
				output("\n\n<i>“Damn ready,”</i> Victoria says, giving her hard dick a light slap. <i>“Slide on down, [pc.name].”</i>");
				output("\n\nYou step over and present your [pc.ass] to Victoria. She plants one hand on your [pc.hip] and, a moment later, you feel her flat cockhead pressing against your ass, gently seeking entry. You shift to align it with your [pc.asshole], and slowly press back against it.");
				
				pc.buttChange(chars["VICTORIA"].cockVolume(0));
				
				output("\n\nVictoria lets out a low grunt as her horsedong’s head slips into your asshole, and you gasp at the penetration. She takes hold of your other hip and slowly guides you down onto her, her cock sliding into you inch by inch, hot and stiff and utterly filling your rear entry. Your breath hitches somewhere around eight inches in, and Victoria eases you toward her, holding on as you take a step back and take all of her up your ass.");
				output("\n\nYour [pc.ass] bumps against Victoria’s hips, and she shifts her hands to take hold of your own hips from the front, gently thrusting herself against you. She presses her chest against your back, her firm tits rubbing against your [pc.skinFurScales]. The feeling of her cock buried up your ass makes you cry out, and she laughs quietly behind you.");
				output("\n\n<i>“Better hop on soon, babe,”</i> Victoria says to the waiting Betsy. <i>“Don’t want [pc.himHer] to blow before you get a chance!”</i>");
				output("\n\n<i>“I don’t know,”</i> Betsy says, still kneeling in front of you and Victoria. <i>“That might be kind of fun, but...”</i> She watches your [pc.cock " + x + "] bob up and down with Victoria’s thrusts, then shakes her head. <i>“Nope!”</i>");
				output("\n\nBetsy stands and turns and presses her jiggly ass against your dong, taking its slick length between her cheeks and giving it a little squeeze. Then, she hoists her butt up and spreads her cheeks wide, and starts to lean back.");
				output("\n\nYou only have a second to align your [pc.cockHead " + x + "] with her asshole before Betsy pops it into her. You and her both gasp, and she turns it into a moan as she slides down your shaft, her tight passage squeezing you hard the whole way, until her ass bounces against your hips, your [pc.cockNoun " + x + "] fully buried up in her.");
				// If PC has large cock:
				if(pc.cockVolume(x) >= chars["BETSY"].analCapacity()) output(" Betsy breathes hard as she settles against you, her asshole stretching around your member. She gasps, <i>“So... much... cock...”</i>");
				
				pc.cockChange();
				
				output("\n\nYou clench down hard and force yourself not to come. The twin sensations of Victoria’s cock up your ass and your own in Betsy’s are almost too much to bear. But you don’t want this to end so quickly, not when you’re just getting started.");
				output("\n\nBetsy leans her back against your [pc.chest], and you reach up and take hold of her plump tits, giving them a good squeeze as her ass bounces against your crotch. Victoria’s hands move to the sides of your [pc.hips], and she picks up the pace, her thrusts coming faster and harder. You can’t help but thrust harder into Betsy thanks to that, and she starts to gasp again as her ass squeezes your cock hard, clenching around your base.");
				output("\n\nVictoria’s hands dig into your hips as she pounds herself into your [pc.asshole] again and again, her foot-long dong throbbing inside you. The sound of her ass slapping against the tile wall echoes through the showers, and as her breathing grows faster, you feel it against the back of your neck. Her strong thighs rub against your [pc.thighs], smooth and warm.");
				output("\n\nYou squeeze Betsy’s big pink nipples, making her squeal, and her ass tightens even more around your [pc.cockNoun " + x + "]. She gasps, <i>“Harder!”</i>, and you obey, thrusting your [pc.hips] against her bouncy ass as hard as you can. Victoria’s cock slides just a little out of your ass, and she tightens her grip on you and pounds it back in, making you moan.");
				output("\n\nYour moan turns into rapid gasps as the two cowgirls shove themselves against you in synch, Betsy trying to force even more of your [pc.cock " + x + "] up her ass as Victoria makes sure her horsecock never gets more than an inch out of your [pc.asshole]. It feels like they’re both getting close to orgasm, but it’s more than you can take, and the last few dual thrusts push you over the edge.");
				output("\n\nYou throw your head back and shout as orgasm hits you, your asshole squeezing hard around Victoria’s cock, your [pc.cum] geysering out to fill Betsy’s ass, your [pc.cockNoun " + x + "] spasming in her tight confines.");
				// If PC makes lots of cum:
				if(pc.cumQ() >= 2000) output(" Your dick fires again and again, and your [pc.cum] soon splatters out from Betsy’s asshole, [pc.cumColor] streams spilling forth as you give her more than she can take.");
				output(" But your hip-thrusting never stops, and Betsy moans out her own orgasm a moment later, her whole body shaking, her nipples hard in your grip.");
				output("\n\nIt only takes Victoria a few more thrusts as well. She digs her fingers into your [pc.hips] and cries out as her cock explodes up your ass. The rush of her cum sends a shiver through you, and your asshole’s death grip around her dong finally relaxes. Betsy’s ass does the same a moment later, setting you free.");
				output("\n\nThe three of you pull apart, hot and sweaty and dripping cum everywhere, and collapse against the shower wall. It takes some time before any of you can catch your breath, and Victoria gives you a heavy-lidded look.");
				output("\n\n<i>“Sorry if I... went a little rough on you back there,”</i> she says, her pert chest heaving. <i>“We don’t do anal all that often, so I get really into it when we do.”</i>");
				output("\n\n<i>“But she’s re–eally good at it,”</i> Betsy says. She looks dazed, and her nipples are bright red from your squeezing. Not that she seems to mind. <i>“So are you, cutie. We do this again, you can have my ass anytime.”</i>");
				output("\n\nVictoria chuckles. <i>“You up for another round sometime, [pc.name]?”</i>");
				output("\n\nYou laugh, and tell the girls you’d definitely be up for this another time. Though it seems like all three of you will need a little time to recover.");
			}
			
			pc.loadInAss(chars["VICTORIA"]);
			break;
	}
	
	processTime(20 + rand(11));
	pc.orgasm();
	pc.exhibitionism(2);
	pc.shower();
	
	IncrementFlag("SHOWER_SANDWICH");
	
	// Maybe a cooldown of 3 hours?
	pc.createStatusEffect("Betsy and Victoria CD", 0, 0, 0, 0, true, "", "", false, 180);
	
	// [Done] Go to Locker Room and Showers [+2% Exhibitionism]
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

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
	soreChange(arg);
	
	return pc.statusEffectv1("Sore Counter");
}

public function soreChange(arg:int = 0):void
{
	if(arg != 0)
	{
		if(!pc.hasStatusEffect("Sore Counter")) pc.createStatusEffect("Sore Counter");
		pc.addStatusValue("Sore Counter", 1, arg);
	}
	if(arg > 0)
	{
		if(pc.statusEffectv1("Sore Counter") >= 9 && !pc.hasStatusEffect("Worn Out"))
		{
			pc.removeStatusEffect("Sore");
			pc.removeStatusEffect("Very Sore");
			pc.createStatusEffect("Worn Out", 0, 0, 0, 0, false, "Icon_Crying", "You are worn out and unable to regain energy. Working out is also impossible in this state. Sleep to recover.", false, 0, 0xFF0000);
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
	if(arg < 0)
	{
		if(pc.statusEffectv1("Sore Counter") < 3 && pc.isSore())
		{
			pc.removeStatusEffect("Sore");
			pc.removeStatusEffect("Very Sore");
			pc.removeStatusEffect("Worn Out");
		}
		else if(pc.statusEffectv1("Sore Counter") < 6 && pc.statusEffectv1("Sore Counter") >= 3 && !pc.hasStatusEffect("Sore"))
		{
			pc.createStatusEffect("Sore", 0, 0, 0, 0, false, "Icon_Crying", "You are sore and will regain energy slower. Sleep to recover.", false, 0, 0xFFFFFF);
			pc.removeStatusEffect("Very Sore");
			pc.removeStatusEffect("Worn Out");
		}
		else if(pc.statusEffectv1("Sore Counter") < 9 && pc.statusEffectv1("Sore Counter") >= 6 && !pc.hasStatusEffect("Very Sore"))
		{
			pc.removeStatusEffect("Sore");
			pc.createStatusEffect("Very Sore", 0, 0, 0, 0, false, "Icon_Crying", "You are very sore and will regain energy much slower. Sleep to recover.", false, 0, 0xFF8080);
			pc.removeStatusEffect("Worn Out");
		}
	}
	
	if(pc.hasStatusEffect("Sore Counter") && pc.statusEffectv1("Sore Counter") <= 0)
	{
		pc.removeStatusEffect("Sore");
		pc.removeStatusEffect("Very Sore");
		pc.removeStatusEffect("Worn Out");
		pc.removeStatusEffect("Sore Counter");
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

//This scene takes place after lifting weights at any intensity. Non repeatable. Also random.
public function liftVoyeurism():void
{
	clearOutput();
	showName("\nLIFTING!");
	author("Altair Hayes");

	var watchedNico:Boolean = (flags["WATCHED_NICO"] != undefined);
	var watchedLee:Boolean = (flags["WATCHED_LEE"] != undefined);

	if(watchedNico && watchedLee) showName("LEE\n& NICO");

	var sore:Boolean = pc.hasStatusEffect("Sore");
	var verySore:Boolean = pc.hasStatusEffect("Very Sore");
	var wornOut:Boolean = pc.hasStatusEffect("Worn Out");

	output("After your workout, you stretch ");
	//if PC is Sore:
	if(sore) output("and rub some of your more exhausted muscles");
	else if(verySore) output("and try to relax, your whole body having taken a bit of a toll from your last workout");
	else if(wornOut) output("and chuckle as the endorphins in your system mask your aching pain with a light euphoria");
	else output("and do a little jog in place, full of energy and ready to work your ass off again");
	output(". But instead of ");
	if(!sore && !verySore && !wornOut) output("heading to the track for a light jog");
	else output("heading back to your ship for a shower and a nap");
	output(", you decide to take a moment to sit down and enjoy the ambient grunts and clanking of metal. You find an empty bench and sit on it, just relaxing as you lazily scan the room around you. Your gaze eventually fixes itself on a ");
	//if PC has watched Lee:
	if(watchedLee) output("familiar");
	else output("particularly");
	output(" bottom heavy cow doing back squats right next to you. Her attire consists of a form fitting tank top and a pair of yoga pants, which not only accentuates her delectable rear end, but also shows off her cameltoe. Chances are, she’s probably not even wearing underpants.");

	output("\n\n");
	if(watchedLee) output("Lee");
	else output("She");
	output(" goes about her own business, working her body and yoga pants to their limits, her ass extending backwards every time she does a rep. You watch for a few minutes, the rhythmic up and down motion of her ass drawing out a ");
	if(pc.isTreated()) output("particular primal urge");
	else output("certain perverted interest");
	output(". She works out for quite a while, around half an hour of non stop squatting. Sadly though, all good things must come to an end, and she puts the bar back on the rack and takes a moment’s rest, she leans on the bar, so exhausted even her tail droops lamely. She reaches for a water bottle and douses her face with ice cold water before taking a moment to fix her hair, a decent amount of hair strands sticking out of her black ponytail.");

	output("\n\nFrom the corner of your eye you notice ");
	if(watchedNico) output("Nico, shirtless and heading toward the showers");
	else output("a shirtless bull heading to the showers");
	output(", and judging from the damp towel hanging around his neck along with the residual moisture condensing on his bare chest, he’s just gone through a heavy workout. He runs a hand through his chestnut hair, pushing it upwards to reform the cowlick his workout had most likely ruined. And just like you, his gaze is drawn to ");
	if(watchedLee) output("Lee’s");
	else output("the cow’s");
	output(" massive rear. His mouth shifts to a faint smile as he walks by, his path gravitating a bit towards her as he gets close enough to smack her ass, which bounces in response to the force of his hand.");
	if(watchedNico) output(" Nico");
	else output(" The bull");
	output(" continues on his merry way, failing to notice that the cow hasn’t quite ignored his gesture. It’s only after her hand grasps his wrist that he turns around.");
	output("\n\n<i>“Hey there,”</i> ");
	if(watchedLee) output("Lee");
	else output("the cow");
	output(" says, pressing her chest against his, guiding his hand into her pants as she leads him back to the squat rack, <i>“don’t go around teasing girls like that.”</i>");

	output("\n\n");
	if(watchedNico) output("Nico");
	else output("The bull");
	output(" feigns ignorance, putting on a smirk as he pulls down her yoga pants. <i>“Whaddya mean?”</i>");

	output("\n\n<i>“Oh c’mon. One day you’re gonna leave a cow all wet and lonely, aching for a big strong bull,”</i> by this point her pants are around her ankles and she’s blushing profusely, the pheromones radiating off of ");
	if(watchedNico) output("Nico");
	else output("the bull");
	output(" must be intoxicating. She looks at him, hoping he’ll make the first move, but he’s just standing there, his fingers slipping in and out of her vagina with the simplest of ease. She shudders in pleasure.");
	output("\n\n<i>“Sorry, was just going out to get a bite to eat, something I can really dig into. Probably a taco with a milkshake or two,”</i> ");
	if(watchedNico) output("Nico’s");
	else output("the bull’s");
	output(" eyes are utterly fixated on her breasts, and she does a little half hop when she hears the word “milkshakes”.");

	output("\n\n<i>“Well, you don’t have to go out to eat out,”</i> ");
	if(watchedLee) output("Lee");
	else output("the black haired cow");
	output(" looks up at the bull, who only has a few inches of height on her, trying to fast forward through his little charade. Her intentions are quite clear, yet ");
	if(watchedNico) output("Nico");
	else output("the bull");
	output(" continues to feign ignorance, shrugging his shoulders.");
	output("\n\n<i>“I guess I can get delivery and eat at home.”</i>");
	output("\n\nHer patience finally snaps and she grabs him by the horns and pulls him down to his knees, pressing his nose into her dripping cunt. <i>“Jeez, just eat me out already!”</i>");

	if(watchedNico) output("\n\nNico");
	else output("\n\nThe bull");
	output(" tries and fails to stifle a laugh. <i>“Hah, finally you get to the fun part. Two words would have done it for me. ‘Eat me’”</i> And while he would have most likely gone on teasing her, his words were quickly muffled by her sopping wet cunny as she finally forces herself onto him.");

	output("\n\nAs if by instinct, his tongue immediately starts assaulting her vagina, his intensity quickly going from gently teasing her clit to flat out tongue fucking her. Her mouth silently hangs open, screaming out moans of pleasure that no one will hear. Her grip around the his horns tightens as she gets more and more into it, her eyes shut tight from the sheer pleasure of his tongue. He pays no attention to her cunt liquor drooling down his mouth, chin, and chest -- instead, he is tonguefucking her pussy like it’s the last thing he’ll ever eat. Whatever he doesn’t lap up takes the form of a <i>“milk mustache”</i> which he’ll wear with pride for the few moments before inevitably he goes to wipe or lick it off. But for now, none of that matters, his entire world has condensed into the sight and taste of the woman before him, accompanied by the audio of her now audible moans.");
	if(pc.isTreated()) 
	{
		output("\n\nYou take a moment to look around and as you’ve expected, you can see most if not all spectators are profusely pleasuring themselves to the lewd acts on display before them. Not one to ignore your own impulses, you");
		if(!pc.isCrotchExposed()) output(" quickly take off your gear and");
		output(" start to play with your ");
		if(pc.hasCock()) output("[pc.cockBiggest]");
		else if(pc.hasVagina()) output("[pc.pussy]");
		else output("[pc.nipples]");
		output(" satisfied that you can take a load off, watch some hot cow on bull action, and ");
		if(pc.hasCock()) output("blow your load");
		else if(pc.hasVagina()) output("cream yourself");
		else output("get off");
		output(" in public.");
	}
	output("\n\nAfter a minute or so of nonstop tongue lashing, her knees give in and she collapses onto ");
	if(watchedNico) output("Nico");
	else output("the bull");
	output(", who falls backwards onto the gym floor. He however, takes no notice, as he’s completely focused on the taste of ");
	if(watchedLee) output("Lee’s");
	else output("the cow’s");
	output(" squirting cunny. Before much longer, she starts to grind into his face, her breath getting shorter and her moans growing in volume until she’s biting a knuckle to keep from flat out screaming like the matriarch of all cows getting the dicking of a lifetime. It’s obvious that she’s close, and ");
	if(watchedNico) output("Nico");
	else output("the bull");
	output(" decides to switch things up. Right before she climaxes, he stops, picks her up, and turns her around so she’s facing the snake trapped in his pants.");
	output("\n\n<i>“Oh!”</i> is all she says before she goes to work on ");
	if(watchedNico) output("Nico’s");
	else output("the bull’s");
	output(" length, pulling it out of his gym shorts and jockstrap, taking a brief moment to gaze at it like a kid in a candy store. ");
	if(silly) output("Only the candy is dick... and she’s a fully grown woman. ");
	output("As soon as she takes a whiff of his pre-coated cock, a bit of drool escapes her mouth. She fishes for some words but nothing quite escapes, she she decides to use actions instead of words. With her drooling mouth she engulfs the mast within an instant. She takes a moment to get used to his mast, before beginning to deepthroat the beefstick before her. And judging from ");
	if(watchedNico) output("Nico’s");
	else output("the bull’s");
	output(" moans, he seems to enjoy it.");

	output("\n\nBut before long the slutty shivering mess of a cow starts to find herself approaching orgasm yet again, and this time the bull’s not going to stop her, he keeps tonguefucking her cunny, her juices now streaming out of her pussy. She bucks against ");
	if(watchedNico) output("Nico’s");
	else output("the bull’s");
	output(" mouth, her muffled moans begging for more. She clenches her fists and pulls herself off of the bulls mast, letting out a bellowing moo as she cums, her cunny squirting the last of her fem-lube onto the lucky bull’s face.");
	output("\n\nShe takes a moment to compose herself, slowly standing on her shaky legs. Almost falling if it weren’t for ");
	if(watchedNico) output("Nico");
	else output("the bull");
	output(" catching her. He holds her close until she catches her breath, her face pressed between the bulls pecs. She fails to notice that the bull’s raging erection is between her thighs, coated in saliva, pre, and growing amounts of her own girl-cum.");
	output("\n\nAfter a while she finally gets control of herself and looks up, giving his chin a brief kiss before thanking him.");
	output("\n\n<i>“Aren’t you forgetting something?”</i> he says jokingly.");
	output("\n\n<i>“No... I don’t think s-OH!”</i> she jumps a little in surprise when he starts to slowly thrust between her thighs.");
	output("\n\n<i>“Don’t go around teasing guys like that. One day you’re gonna leave a bull alone all hard and lonely, aching for a beautiful soft cow.”</i> He reaches around her and grabs her monumental ass. <i>“I think you owe me a little something.”</i> He starts fucking her thighs as she blushes, tracing her finger in circles on his pectoral.");
	output("\n\n<i>“Well, how about I spend a couple of hours at your place, see if I can repay you, maybe cook something up for you,”</i> she pulls herself away and grabs her duffle bag, not bothering to pull up her yoga pants, instead choosing to take them off and stuff them into said bag.");

	if(!watchedNico || !watchedLee)
	{
		output("\n\n<i>“I’d like that, uh.”</i>");
		output("\n\n<i>“Lee.”</i>");
		output("\n\n<i>“Lee, nice. Name’s Nico,”</i> and without another word he scoops her up, much to her surprise, and walks out with her giggling like a schoolgirl.");
	}
	else
	{
		output("\n\n<i>“Sure thing. You know what I like, after all.”</i>");
		output("\n\n<i>“I’m still not sure which you like more - my ass or my cooking.”</i>");
		output("\n\n<i>“Only one way to find out, right?”</i> and without another word he scoops her up, much to her surprise, and walks out with her giggling like a schoolgirl.");
	}

	if(pc.isTreated()) output("\n\nYou start to wonder what they’ll get up to when they arrive at Nico’s house. Your Treated mind scans thousands of perverted possibilities, but eventually settles on the assumption that they’ll end up sitting on a couch, Nico flipping through channels on his holoscreen fingering Lee with his spare hand as she sucks his cock for hours on end. Next to Nico would be a plate stacked tall with homemade Tacos, slowly being chipped away at as the sunlight hours dwindle away. A good way to spend the rest of your day after a hard workout.");
	else output("\n\nYou wonder what they’ll get up to when they arrive back at Nico’s house. Stars only knows what kinky exploits they’ll have.");

	processTime(40);
	if(pc.isTreated())
	{
		pc.orgasm();
	}
	else pc.changeLust(25);

	//processTime(40);
	//+25 lust, another 25 to Treated PC
	//Has watched Nico
	//Has watched Lee
	flags["WATCHED_NICO"] = 1;
	flags["WATCHED_LEE"] = 1;
	pc.createStatusEffect("Lift Voyeur CD");
	pc.setStatusMinutes("Lift Voyeur CD",1440);

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}