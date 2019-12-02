public function tanisHeader():void
{
	showName("\nTANIS");
	showBust("TANIS");
	author("Savin");
}

public function hasMetTanis():Boolean
{
	return flags["TANIS_BOW_INTRO"] == 1;
}

public function tanisBowIntro():void
{
	flags["TANIS_BOW_INTRO"] = 1;
	
	clearOutput();
	tanisHeader();
	
	output("You wander up to the leithan man’s desk, and he looks up from a steaming cup of coffee with <i>“Galaxy’s Best Dad”</i> printed on it in big, friendly letters and gives you a welcoming smile.");
	
	output("\n\n<i>“Hey!”</i> he says, setting the mug aside. <i>“Welcome back. Anything I can... hey, " + pc.mf("man", "lady") + ", that’s a badass bow you’ve got there!”</i>");
	
	output("\n\nHe points one of his yellow-clawed fingers at the bow slung over your shoulder. You blink in surprise - you’d expect to get compliments on a cool new-tech gun or a plasma sword or something, but a simple bow? You’re only a few thousand years out of date there. Still, you can’t help but grin at the comment, out of left field as it is.");
	
	output("\n\n<i>“Can’t beat the classics, right? I used to do a lot of bowhunting back on Leitha, myself. One of the reasons I volunteered to come out here, too: plenty of wild game, and a good recurve bow puts me right on level with the natives. Makes it a fair fight when they try to get a little frisky.”</i> He laughs and clatters up onto his long, clawed feet, giving you a first-hand look at his impressive height: he’s nearly ten feet tall, a gray-skinned humanoid from the waist up sat atop of a glowing insectile body on six slender legs. A reptilian tail coils behind him, dexterously avoiding the shelves of hunting trophies behind the desk.");
	
	output("\n\n<i>“Big game bowhunter, huh?”</i> you ask, eyeing the trophies behind him.");
	
	output("\n\nHe grins, extending a hand to you. <i>“Pretty much. Name’s Tanisaran, by the way. Tanisaran Alhelvan. Tanis for short.”</i>");
	
	output("\n\nYou shake it, noticing his grip is surprisingly gentle - though that may just be him trying not to score your hand with his sharpened claws. <i>“Anyway! You probably wanted to rent a shuttle, right? Something tells me you didn’t just come around to gab about bows.”</i>");
	
	//Add [Bow Training] to Tanis's menu. Rename him to Tanis in menu/bust/etc.
	clearMenu();
	addButton(0, "Next", mhengaScoutAuthority);
}

public function tanisBowTraining():void
{
	if (flags["TANIS_BOW_TRAINING"] == 12) 
	{
		tanisGetHisBow();
	}
	else if (flags["TANIS_BOW_TRAINING"] == undefined) 
	{
		tanisBowTrainingFirstTime();
	}
	else if (flags["TANIS_BOW_TRAINING"] <= 6)
	{
		tanisBowTrainingRepeat();
	}
	else
	{
		tanisBowTrainingFinaleRepeats();
	}
}

public function tanisBowTrainingFirstTime():void
{
	clearOutput();
	tanisHeader();
	flags["TANIS_BOW_TRAINING"] = 1;

	output("<i>“Hey,");
	if (pc.isFeminine()) output(" big game hunter");
	else output(" man");
	output(",”</i> you say, stepping over to Tanis’s desk. As you walk, you pull the bow off from over your shoulder and plant the butt of it on the ground beside you. His eyes instantly light up at the sight of it, and his ashen lips twist into a hint of a smile.");
	
	output("\n\n<i>“‘Sup,”</i> he answers, eyes wandering over your bow. <i>“Gotta say, if you’re trying to hold up the place, you could have picked a weapon that is a little less conspicuous.”</i>");
	
	output("\n\nYou chuckle and counter, <i>“Actually, I was wondering if you’ve got some pointers for me. Haven’t exactly had a lot of training using something like this before.”</i>");
	
	output("\n\nHe smiles and rises to his feet, six bestial legs stretching out from under his centaur-like body. <i>“Sure, I guess I could show you the basics. Not much else to do");
	if (flags["SALVAGED VANAE CAMP"] != 2) output(" with the nav beacons down anyway");
	else output(" ever since they shipped those new robot drivers out here");
	output(".”</i>");

	output("\n\nHe fishes around beneath his desk for a moment, pulling a towering bow out from under it. It’s not <i>quite</i> like your bow: bigger, though proportional to his size, and made of a material you can’t quite place. Some alien wood, you’d imagine, though the way he hefts it around makes you think it’s much heavier than any bow you’ve ever seen before. He waves you over around the counter to a small back door that leads you out to the edge of the Mhen’gan jungle.");
	
	output("\n\n<i>“So, no formal training, right?”</i> Tanis says, less a question and more an amused statement of fact. When you nod, he chuckles. <i>“Don’t worry about it. Most people don’t. Bowmanship’s kind of a lost art these days, you know. Some of us leithans keep up the old art: nowhere in the galaxy has game like Leitha, though you have to be ready to be prey as much as predator on our homeworld. A strong, silent shot will get you further than the big bang of a rifle when there’s monsters the size of houses eager to eat you. If you can bring down a kill without drawing unwanted attention, well, you can’t do much better than a bow.”</i>");

	output("\n\nAs if for emphasis, Tanis pulls an arrow from his back and, in one swift motion, nocks and looses it into the side of a nearby tree. A muted <i>twang</i> echoes as the bowstring snaps home, but you have to admit he’s right: the shot’s an order of magnitude quieter than a gunshot.");
	if (pc.characterClass == GLOBAL.CLASS_MERCENARY) output(" Never mind that it’s not hard to get a suppressor for a gun. You’re here to learn, not be pedantic.");
	
	output("\n\n<i>“So yeah!”</i> he grins, resting his hands on the top of his bow. <i>“My family’s been handing down these shooting techniques for centuries. I can show you the quick and dirty rundown of the basics today, but if you wanna get </i>really<i> good with this,”</i> he says, reaching over to run a finger along the curve of your bow. <i>“It’ll take some time and dedication, you know.”</i>");

	output("\n\nYou nod.");
	
	output("\n\n<i>“Cool! Yeah, alright, so come over here and let’s start talking about stance.”</i>");
	
	output("\n\nTanis waves you over, and for the next several minutes you’re treated to an expert study in planting your [pc.feet] a certain way.");
	if (pc.isBiped()) output(" Tanis certainly seems to be experienced with teaching humanoids, as he seems to know your lower body just as well as you do. He’s quickly got you standing like a shining example of an archer.");
	else if (pc.isNaga()) output(" Your alien lower body seems to get in the way a bit, since you’ve got no proper feet to place. Tanis spends as much time trying to figure your body out as he does instructing you. Eventually, though, he finds a stance that he thinks will work for you, though it’s a bit awkward to hold for more than a few moments. <i>“Gotta build up those abdominal muscles!”</i> he declares, using a hand to straighten your back out.");
	else if (pc.isTaur() || pc.isDrider()) output(" Tanis is an experienced teacher, of that you have no doubt. He circles your tauric body with a serpent-like grace, using his bow like a staff to shove your legs into proper form. You suck in a sharp breath when his hand is suddenly on your back, forcing you to sit up straight as an arrow.");
	output(" <i>“There we go, much better. Just hold that pose for a minute. Pretty different from just shooting a gun, right? It’s all about the stance, trust me. Well, that and a lot of hand-eye coordination.");
	if (pc.AQ() >= 66) output(" But I think you’ve got that covered.");
	else output(" But we’ll work on that. No worries.");
	output("”</i>");

	output("\n\nYou dutifully follow Tanis’s direction, following the shirtless centaur with your eyes as he sidles up beside you and draws back another arrow. He guides you through it, correcting slight imperfections in your draw and the way you hold your arrows. All the while, he’s nothing but positive, all smiles and bright eyes even as he’s correcting the same silly mistake for the third time.");

	output("\n\nFinally, you’re ready to take your first actual shot of the session. Tanis plants a guiding hand on your shoulder, pressing in close enough that he’s practically looking down the shaft of your arrow with you. He points out a low-hanging purple fruit on a nearby tree and gives the word to bring it down.");

	//Aim check here!
	if (pc.AQ() > 50 + rand(31))
	{
		output("\n\nYou draw back, breathe out, and let fly. The arrow sinks into the fruit with explosive force, splattering it all over the forest floor. You pump a victorious fist in the air, and are rewarded with a slap on the back from your tauric teacher.");
		
		output("\n\n<i>“Haha! Awesome work. You’re a natural, [pc.name].”</i>");
	}
	else
	{
		output("\n\nYou let loose, and watch with a sinking heart as the arrow sails wide, barely nicking your target before hammering into the tree’s bark. With a sigh, you slump your shoulders and plant your bow in the dirt.");
		
		output("\n\n<i>“Hey, don’t give up,”</i> Tanis laughs, squeezing your shoulder. <i>“That was damn close. We’ll get you there, don’t you doubt it.”</i>");
		
		output("\n\nEasy for him to say.");
	}

	output("\n\n<i>“Alright, let’s call it here for now,”</i> Tanis says, stretching enough to audibly crack his back. <i>“Can’t just leave the shop abandoned all day, after all. You’ve got the basics down, I think, but we can pick it up again if you want to really dig into it. Especially if you want to use that bow of yours for self defense. Some might say that’s a suboptimal choice compared to, say, a laser pistol or a plasma caster, but a bow like this is a real tack-driver. A more precise weapon from a more noble time, you know.”</i>");
	
	output("\n\nGiving you another pat on the shoulder, Tanis grabs his arrows off the ground and starts heading back inside. You follow close behind, feeling more confident about your archery skills for having trained with him.");

	processTime(25+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function tanisBowTrainingRepeat():void
{
	clearOutput();
	tanisHeader();
	flags["TANIS_BOW_TRAINING"]++;

	//PC must have a bow in inventory or equipped. Pass ~30 minutes.
	// 50-Aim % - Chance to increase Aim by a point, up to level max.

	if (rand(100) >= 50 && pc.aim() < 25 && pc.AQ() < 50)
	{
		pc.slowStatGain("aim",1);
	}

	output("<i>“Hey, Tanis,”</i> you say, leaning over the leithan’s desk. <i>“Think you could spare a few minutes to do some bow practice?”</i>");
	
	output("\n\n<i>“I dunno,”</i> he laughs, looking around the otherwise empty office. <i>“There’s this big line behind you. I’d hate to keep them all waiting.”</i>");
	
	output("\n\nYou give him a look, and he grins and laughs. <i>“Alright, alright, if you’re gonna twist my arm. C’mon out back, and let’s set some targets up.”</i>");
	
	output("\n\nHe hops up from behind the desk, onto his six black-scaled legs, and grabs the compound bow he was using last time from underneath. With it, Tanis pulls out several paper shooter’s targets rolled up with a rubber band, and tucks them under his bare arm. You follow him outside once he’s collected his gear, and spend a few minutes tacking up the targets to the sides of the trees closest to the edge of the back lot.");
	
	output("\n\n<i>“Cool!”</i> he announces when you’ve got a good selection of targets up, ranging from black silhouettes to images of terrifying alien abominations attacking particularly buxom leithan girls... you’re not sure those are actually meant to be used as targets, but hey. <i>“Alright, remember what I taught you about stance? Let’s get you standing like a marks");
	if (pc.isFeminine()) output("wo");
	output("man, and we’ll get started.”</i>");
	
	output("\n\nYou do as Tanis tells you, resuming the shooter’s stance he taught you during your first session. He quickly corrects a few small errors, making sure you’re standing perfectly before you bring your bow to bear on the closest target.");
	
	output("\n\n<i>“Looks good. Now let’s just warm up first, get the blood flowing.”</i>");
	
	output("\n\nUnder Tanis’s supervision, you take several well-placed shots at the target, getting into the groove of quickly drawing, aiming, and letting fly in fluid motions. When you’ve turned the first target into a porcupine of feathered shafts, Tanis moves you onto the next, putting you through simple drills, then more complex ones, gently correcting every mistake until you’re landing every shot in the center ring.");
	
	output("\n\n<i>“Gettin’ pretty badass with that bow!”</i> Tanis laughs, giving you a friendly thump on the shoulder. <i>“See, you don’t need fancy head’s up displays and holographic sights to be a sharpshooter. It’s all about the skill and dedication, right?”</i>");
	
	output("\n\nYou nod in agreement - you really feel like you’re starting to get the hang of this.");
	if (pc.hasVagina()) output(" Then again, you almost wish you weren’t - the way Tanis presses his chest to your back when he adjusts your stance, the sight of his rippling muscles tensing as he draws his own bow back... yum.");
	
	output("\n\n<i>“Keep practicing like this, and I might have to take you hunting sometime,”</i> Tanis laughs, watching you plant another arrow into a tentacle-monster target. <i>“See how you do against some of the </i>real<i> monsters back on Leitha.");
	if (pc.level >= 7) output(" I think you’d do pretty well.");
	else output(" Well, maybe with a little more experience, anyway.");
	output("”</i>");
	
	output("\n\nThe two of you do a few more short drills, but fatigue is starting to set in, slowing your movements until Tanis calls for a break. <i>“Alright, I think that’s enough for today. Good job, [pc.name]. You’re really improving!”</i>");
	
	output("\n\nYou give him a grin and sling your bow over your back, following the towering ‘taur back into the scout office.");
	if (pc.isTreated()) output(" You can’t help but look at that big, muscular ass all the way in.");

	processTime(25+rand(5));
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function tanisBowTrainingFinaleRepeats():void
{
	clearOutput();
	tanisHeader();

	flags["TANIS_BOW_TRAINING"]++;

	//PC must have a bow in inventory or equipped. Pass ~30 minutes.
	// 80-Aim % - Chance to increase Aim by a point, up to level max.

	if (rand(100) >= 80 && pc.aim() < 25 && pc.AQ() < 50)
	{
		pc.slowStatGain("aim",1);
	}

	output("<i>“Still think you could learn a thing or two from me?”</i> Tanis says, recognizing the familiar look in your eye. <i>“I think you’ve got the basics pretty much nailed down, you know.");
	if (pc.level >= 5) output(" You’re a pretty accomplished hunter on your own, I bet.");
	else output(" If you really want to improve, you’ve got to go out there and put these skills to the test.");
	output("”</i>");
	
	output("\n\nAfter a moment’s thought, though, Tanis chuckles and says <i>“Fine, fine, if only for the camaraderie of it. I’ve enjoyed our training sessions, you know. It’s been more fun than I’d have thought, passing the family tradition on.”</i>");
	
	output("\n\n<i>“So let’s go,”</i> you say, nodding towards to the door. Tanis grins and grabs his bow, along with several targets, and leads you out into the back lot. The two of you go through the usual drill, tacking targets to trees and stretching out your muscles with a few practice shots.");
	
	output("\n\nWhen the warm-up’s done, though, Tanis doesn’t start you on the same drills as your first few sessions. Instead, the towering leithan hunter rolls his shoulders and pulls a strange arrow off of his back, tipped with something blinking and clearly electronic. You cock an eyebrow and, at Tanis’s beckoning, step back. He flashes you a grin, nocks the arrow, and lets fly at a tree near the back of the lot.");
	
	output("\n\nThe arrow slams home, quivering audibly as it sticks into the bark of the tree. A moment passes, and then a deafening roar blasts through the woods, kicking up leaves and grass in a explosive bubble.");
	
	if (flags["TANIS_BOW_TRAINING"] == 8)
	{
		output("\n\nYou cover your eyes, gasping as the shockwave rolls over you. The first thing you hear, once you’re able to again, is Tanis laughing hysterically. <i>“I guess I should have said, uh, ‘fire in the hole’ or something, right?”</i>");
		
		output("\n\n<i>“Trick arrows are the key to keeping bow hunting relevant today,”</i> he says. <i>“I made these myself - concussive arrows. Sends a shockwave that’ll stun just about anything, even most robots. Give you time to plunge a few more arrows, or a good blade, into whatever’s trying to fight you. Here, take a few to test out. I’ll show you how to make ‘em later.”</i>");
		
		output("\n\nA quiver of arrows is shoved into your hand, and you strap them on.");
	}
	else
	{
		output("\n\n<i>“You’ve got your own, I presume?”</i> he says, brushing leaves off his bare shoulders. <i>“I did show you how to make ‘em, right?”</i>");
	}
	
	output("\n\nYou draw one of your special leithan arrows and nock it, aiming at the same tree Tanis just shot - it looks completely unharmed, for all the force just brought against it. You aim and let fly, sending another beeping arrow to slam home into the gray bark. It detonates a moment later, blasting the targets you’d tacked up off the trees - and setting off a cacophony of howling animals, screeching birds, and a car alarm from inside the shop’s lot.");
	
	output("\n\n<i>“Whew, that was loaded a little heavy!”</i> Tanis laughs, clapping you on the shoulder, almost hard enough to stagger you. <i>“Good shot, though. Now, the trick is to stun your target, then use the opportunity to hit it as many times as possible while it’s staggered - or to get the hell away, if you’re in a bad spot. Opening with a concussion shot can save your life if you’re ambushed while wounded or exhausted. So, let’s see you do some quick follow-up shots.”</i>");
	
	output("\n\nYou give Tanis a nod, and let fly with a concussive arrow, blasting one of the few remaining targets left standing. The moment the arrow detonates, you draw one of your mundane arrows, nock, and let fly as close to the first point of impact as you can. In what feels like the span of a heartbeat, you hammer three more arrows where the first hand landed.");
	
	output("\n\n<i>“Quick as a cuntsnake,”</i> Tanis says as you lower your bow. <i>“I think you’ve got the idea. Now let’s drive it home, [pc.name]...”</i>");
	
	output("\n\nThe rest of your session is spent in quick-shot drills and testing out different mixes of concussive arrows. Tanis works you hard - harder than he ever has before - leaving you panting and sweaty by the time he finally calls it. You muscles ache from drawing your bow so many times... but it’s a good pain, one you earned through hard work, and growing skill. Tanis smiles at you, an arm around your shoulder to guide you back inside.");
	
	output("\n\n<i>“Let’s take a break... and maybe get you a shower,”</i> he chuckles. <i>“Good work out there, [pc.name]. You’re getting damn good with a bow");
	if (pc.race().indexOf("leithan") == -1) output(" - maybe there’s a little leithan in you!");
	else if (pc.race() == "half-leithan") output(". I think the leithan part of you’s really taking off!");
	else output(" Man, it feels good to be passing along the family skills. Maybe I ought to open an archery school some time.");
	output("”</i>");
	
	if (flags["TANIS_BOW_TRAINING"] == 8)
	{
		output("\n\nAfter you get inside, Tanis grabs a data slate off his desk. <i>“Oh, hey, hold up a second [pc.name]. Lemme give you something. What’s your e-mail address?”</i>");
		
		output("\n\nYou tell it to him, and after he hits a few keys on his pad, your Codex beeps out that it’s received a new message. <i>“Cool. So, those are the plans to make concussive arrows like the ones we were just using. If you’ve got some technical expertise, or a couple hours to dick around on the extranet, you should be able to fix some up for yourself.”</i>");
		
		output("\n\n<i>“Wow, thanks,”</i> you say, pocketing your Codex after a quick look. The plans seem simple enough.");
		
		output("\n\nHe grins. <i>“Any time, man. Let me know how they work out for you!”</i>");
		
		output("\n\n<b>(Perk Gained: Concussive Shot - Grants the ability to fire explosive-tipped arrows when equipped with a bow in combat. The arrows have a chance to stun for 1 to 2 combat rounds. Requires a bow-type weapon.)</b>");
		
		pc.createPerk("Concussive Shot", 0, 0, 0, 0, "[altTooltip ConcussiveShot]");
	}
	
	if (flags["TANIS_BOW_TRAINING"] >= 8 && !MailManager.isEntryUnlocked("tanisarrows"))
	{
		AddLogEvent("<b>New Email From Tanisaran Alhelvan (Tanis_Alhelvan@UGC.gov)!</b>", "passive");
		MailManager.unlockEntry("tanisarrows", GetGameTimestamp());
	}

	processTime(25+rand(5));
	pc.shower();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function tanisGetHisBow():void
{
	clearOutput();
	tanisHeader();

	flags["TANIS_BOW_TRAINING"]++;

	//Play on 11th time trying to get training from Tanis

	output("<i>“Hey, [pc.name],”</i> Tanis grins as you start to ask about a training session. <i>“Hold that thought a second - I got something for you.”</i>");
	
	output("\n\nYou follow the big leithan with your eyes as he hops up onto his hexapedal legs and goes around to a small box leaning against the wall. He hefts it up and hands it to you: the box is fairly narrow but very long, three or four feet at least, but feather-light despite its size. <i>“Check it out,”</i> he urges, lizard tail swishing quickly behind him.");
	
	output("\n\nYou open it, tearing away a string and popping the top off. Inside the box, nestled amongst a bed of packing peanuts and shredded paper, is a compound bow made of the same alien wood and of the same tremendous length that Tanis has been using during your training sessions. With wide eyes, you pick the bow up and heft it in your hands - it weighs next to nothing, and an experimental draw makes the heavy string feel like pulling air thanks to the network of wheels and pulleys supporting your motions.");
	
	output("\n\n<i>“It’s awesome,”</i> you breathe, aiming down the shaft of an imaginary arrow.");
	
	output("\n\nTanis grins big. <i>“Glad you like it. It’s yours - if you want it. I figured an expert archer like you deserves a bow worthy of the title. This one’s straight from my family back on Leitha.");
	if (pc.tallness <= 60) output(" It, uh, might be a little big for you, but with the wheels on it you shouldn’t have any trouble with the draw.");
	else if (pc.tallness >= 96) output(" I’d almost say it’s a little small for you, but that just means you can pull the string harder and faster, right?");
	output("”</i>");
	
	output("\n\nThat’s an incredibly generous gift. You");
	if (pc.isAss()) output(" give Tanis a curt nod of thanks");
	else output(" thoroughly thank your patient trainer");
	output(", and sling the bow over your shoulder.");
	
	output("\n\nTanis steps forward and plants a hand on your shoulder. <i>“Put it to good use, alright? I want to hear some kick-ass stories some day, alright?”</i>");
	
	output("\n\nYou can probably manage that!\n\n");

	processTime(25 + rand(5));

	quickLoot(new TanisBow());
}
