public function dallysTips():Number
{
	if(flags["DALLY_TIPS"] == undefined) flags["DALLY_TIPS"] = 0;
	return flags["DALLY_TIPS"];
}


//Intro Blurb
public function honeyNozzleClub():Boolean
{
	output("\n\nA male myr in little more than an oversized loincloth is dancing gracefully around a pole, much to the tittering delight of a feminine audience. His abdomen weighs heavy behind him and ponderously dips along with the more vigorous dance moves. A seat just opened up in front of him, if you want to approach.");
	if(flags["MET_DALLY"] == undefined) addButton(0,"M.Stripper",dallyApproach);
	else addButton(0,"Dally",dallyApproach);
	
	if (flags["FAZIAN_QUEST_STATE"] == undefined) flags["FAZIAN_QUEST_STATE"] = FAZIAN_QUEST_NOTSTARTED;
	
	if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_OFFERING && flags["FAZIAN_QUEST_TIMER"] + (48 * 60) < GetGameTimestamp())
	{
		output("\n\nHepane, the myr musician, is stood where she normally is, by the entrance to the cabaret. She doesn’t have her clipboard though, and she looks rather worried.");
		addButton(1, "Hepane", fazianQuestOpening);
	}
	else if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_STARTED)
	{
		output("\n\nHepane, the myr musician you’re trying to help find Fazian, is sat at a table near the back. She looks rather worried.");
		if (flags["FAZIAN_QUEST_SUCCESSES"] + flags["FAZIAN_QUEST_FAILURES"] < 3) addDisabledButton(1, "Hepane", "Hepane", "Collect clues on Fazian’s whereabouts before returning to Hepane.");
		else addButton(1, "Hepane", fazianQuestInvestigationDun, undefined, "Hepane", "Return to Hepane and share the clues you’ve collected on Fazian’s whereabouts.");
	}
	else if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_INVESTIGATED)
	{
		if (flags["FAZIAN_QUEST_TIMER"] + (24 * 60) < GetGameTimestamp())
		{
			output("\n\nHepane, the myr musician you’re trying to help find Fazian, is sat at a table near the back. She waves at you urgently the moment she catches sight of you.");
			addButton(1, "Hepane", fazianQuestInvestigationFollowup, undefined, "Hepane", "Go over and see what she has to say.");
		}
		else if ((hours > 15 && hours < 20) || (hours == 15 && minutes >= 30) || (hours == 20 && minutes <= 30))
		{
			output("\n\nThe entrance to the cabaret displays a sign that mentions a temporary delay in the evening’s showings.");
			addDisabledButton(1, "Cabaret", "Cabaret", "It looks like the entrance is closed at the moment.");
		}
		else
		{
			output("\n\nThe entrance to the cabaret is currently closed. The signage in front says that it is open from 15:30 to 20:30.");
			addDisabledButton(1, "Cabaret", "Cabaret", "It looks like the entrance is closed at the moment.");
		}
	}
	else if (!InCollection(flags["FAZIAN_QUEST_STATE"], [FAZIAN_QUEST_REJECTED, FAZIAN_QUEST_FAILED, FAZIAN_QUEST_RESCUE, FAZIAN_QUEST_BRIBED]))
	{
		if (flags["FAZIAN_QUEST_RESCUE_TIMER"] != undefined && flags["FAZIAN_QUEST_RESCUE_TIMER"] + (24 * 60) > GetGameTimestamp())
		{
			/* Give Fazian a 24-hour break before performing a new show after rescue. */
			output("\n\nThe entrance to the cabaret is currently closed. Perhaps to give Fazian some time to recover");
			addDisabledButton(1, "Cabaret", "Cabaret", "It looks like the entrance is closed at the moment.");
		}
		else
		{
			if ((hours > 15 && hours < 20) || (hours == 15 && minutes >= 30) || (hours == 20 && minutes <= 30))
			{
				if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_OFFERING)
				{
					output("\n\nThe entrance to the cabaret has a hastily-made sign posted that mentions a temporary delay in the afternoon’s showings. Technical difficulties perhaps?");
					addDisabledButton(1, "Cabaret", "Cabaret", "It looks like the entrance is closed at the moment.");
				}
				else if (flags["FAZIAN_SHOW"] == undefined)
				{
					output("\n\nOn the far side of the dusky room, a gold myr in a black dress is taking money from knots of other ant-women and ushering them through a curtain. A private show of some sort?");
					addButton(1, "Curtain", nozzleShowFirstTime, undefined, "Curtain", "See what it’s all about.");
				}
				else
				{
					output("\n\nOn the far side of the dusky room, you can see Fazian’s accompanist, Hepane, taking admissions for this afternoon’s show. You could go find out what the two of them are putting on this time.");
					addButton(1, "Cabaret", nozzleShowRepeat, undefined, "Cabaret", "Come in and watch a show.");
				}
			}
			else
			{
				if (flags["FAZIAN_SHOW"] == undefined)
				{
					output("\n\nThere is a curtain covering one of the far rooms, marking it as an entrance of some theater or showroom, perhaps.");
					addDisabledButton(1, "Curtain", "Curtain", "It looks like the entrance is closed at the moment.");
				}
				else
				{
					output("\n\nThe entrance to the cabaret is currently closed.");
					addDisabledButton(1, "Cabaret", "Cabaret", "It looks like the entrance is closed at the moment.");
				}
				output(" The signage in front says that it is open from 15:30 to 20:30.");
			}

			var bShow:Boolean = hasSeenNozzleShow();
			var bT1:Boolean = hours > 20 || hours < 2;
			var bT2:Boolean = hours == 20 && minutes >= 35;
			if (bShow && (bT1 || bT2))
			{
				if (flags["FAZIAN_QUEST_STATE"] != FAZIAN_QUEST_OFFERING || flags["FAZIAN_QUEST_TIMER"] + (12 * 60) >= GetGameTimestamp())
				{
					output("\n\nFazian, the anat cabaret performer, is sat at the quieter end of one of the bars, craned over a glass of honey wine. You could go and talk to him if you wished.");
					addButton(1, "Fazian", fazianApproach);
				}
				/*
				else
				{
					output("\n\nThe entrance to the cabaret is currently closed. The signage in front says that it is open from 15:30 to 20:30.");
					addDisabledButton(1, "Cabaret", "Cabaret", "It looks like the entrance is closed at the moment.");
				}
				*/
			}
		}
	}
	else if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_RESCUE)
	{
		output("\n\nThe entrance to the cabaret is currently closed. You should find Fazian soon!");
		addDisabledButton(1, "Cabaret", "Cabaret", "It looks like the entrance is closed at the moment.");
	}
	else if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_BRIBED)
	{
		CodexManager.unlockEntry("Tarratch");
	}

	if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_STARTED)
	{
		if (flags["FAZIAN_QUEST_GOLDMYR"] == undefined)
		{
			addButton(5, "Gold Myr", fazianQuestGoldMyr, undefined, "Gold Myr", "Ask a group of gold myr clientele if they have seen Fazian anywhere.");
		}

		if (flags["FAZIAN_QUEST_BARKEEP"] == undefined)
		{
			addButton(7, "Barkeep", fazianQuestBarkeep, undefined, "Barkeep", "Ask the barkeep if she’s seen Fazian.");
		}
	}
	
	vendingMachineButton(4, "XXX");
	
	return false;
}

public function showDally(nude:Boolean = false):void
{
	showName("\nDALLY");
	if(!nude) showBust("DALLY");
	else showBust("DALLY_NUDE");
}
public function getDallyPregContainer():PregnancyPlaceholder
{
	var ppDally:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppDally.cumType = GLOBAL.FLUID_TYPE_HONEY;
	ppDally.balls = 2;
	ppDally.ballSizeRaw = 20;
	ppDally.createPerk("Fixed CumQ", 9000, 0, 0, 0);
	return ppDally;
}

//Approach
public function dallyApproach():void
{
	clearOutput();
	showDally();
	processTime(3);
	//First Time
	if(flags["MET_DALLY"] == undefined)
	{
		output("Before you’ve finished ");
		if(pc.isTaur()) output("sitting down beside the chair because you brought your own - a giant horse-butt")
		else if(!pc.isBiped()) output("fidgeting and shifting your unorthodox frame into the primitive chair");
		else output("settling into your seat");
		output(", the dancer is in your face, twirling up the side of the stage and dropping to his knees, placing his bulging loincloth close enough for your surprised exhalation to make the fabric flutter. It smells faintly of some kind of sweetened perfume or cologne, the kind that might cover up the musky aroma of embedded pheromones - a common enough trick amongst strippers in the core.");
		output("\n\n<i>“Hello there, Star-Walker. Must have been a long journey to come to our little planet. I’m Dally. Do you want a dance or...?”</i> His hips twitch forward suggestively, filling your vision with a flash of clearly outlined phallus before the rippling white of his loincloth obscures it once more. <i>“...did you want to get some nectar?”</i> His length twitches beneath the immodest covering. <i>“I’m a male honeypot, you know - honey on tap.”</i>");
		flags["MET_DALLY"] = 1;
		//[Nectar?] [Dance] [Leave]
		clearMenu();
		addButton(0,"Nectar?",askDallyAboutNectarCauseYerADip,undefined,"Nectar?","Ask Dally about that nectar he mentioned earlier. He doesn’t have a serving tray...");
		addButton(1,"Dance",askDallyForADanceYaDunce,undefined,"Dance","Get a Dally to give you a personal dance. You wanna see behind that loincloth!");
		addButton(14,"Leave",leaveDally,true);
	}
	//Repeat Approach
	else 
	{
		output("You ");
		if(pc.isTaur()) output("look at a seat before plopping yourself down next to it");
		else if(!pc.isBiped()) output("squeeze yourself into a seat as comfortably as your unusual frame will allow");
		else output("sidle into a seat alongside the stage");
		output(". The dancer spins around a pole, leaning back to smile at you.");
		output("\n\n<i>“Ahh, the mysterious star-walker returns to my humble stage once more.”</i> Dally’s abdomen passes in front of you. It bobs heavily under its own weight. It almost looks out of place on his lean physique, all bulbous and frankly bloated. His muscles in his legs and back must be corded like iron to support it, a biological mesh designed to help him carry burden of being so prized by his own countrymen - and women.");
		output("\n\nThe male myr’s motions cause his loincloth to reveal a strapping, eight-inch cock that’s lengthening by the second. Someone’s happy to see you. <i>“Dance, a drink, or ...”</i> He shimmies closer, firmly holding your gaze in sable orbs. <i>“...something else?”</i>");
		dallyMenu();
	}
}

public function dallyMenu():void
{
	clearMenu();
	//[Nectar(?)] [Dance] [Leave]
	if(flags["DALLY_NECTAR_SPIEL"] == undefined) addButton(0,"Nectar?",askDallyAboutNectarCauseYerADip,undefined,"Nectar?","Ask Dally about that nectar he mentioned earlier. He doesn’t have a serving tray...");
	else addButton(0,"Nectar",nectarSuckFromDallyProper,undefined,"Nectar","Get some Nectar directly from his tap. It’s a totally normal thing for myr to do - why can’t you?");
	addButton(1,"Dance",askDallyForADanceYaDunce,undefined,"Dance","Get a Dally to give you a personal dance. You wanna see behind that loincloth!");
	addButton(2,"Talk",talkToDally,undefined,"Talk","Try to talk to Dally over the din of the blaring music.");
	if(flags["DALLY_FAVOR_OFFERED"] == 1) addButton(3,"Favor",getAFavorFromDally);
	else addDisabledButton(3,"Favor","Favor","But Dally doesn’t owe you any favors!");

	if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_STARTED && flags["FAZIAN_QUEST_DALLY"] == undefined)
	{
		addButton(4, "Fazian", fazianQuestDally, undefined, "Fazian", "Ask the male myr if he knows the whereabouts of his fellow dancer.")
	}

	addButton(14,"Leave",leaveDally,false);
}

//Leave
public function leaveDally(firstTime:Boolean = false):void
{
	clearOutput();
	showDally();
	//First Time
	if(firstTime)
	{
		output("You hastily back away from the stage before he manages to slap that <b>thing</b> against your face. <i>“");
		if(pc.isNice()) output("Sorry, but I think I need to go. Nice to meet you!");
		else if(pc.isMischievous()) output("I’m not really craving sausage at the moment, but I’ll catch you around, Dally.");
		else output("Not interested.");
		output("”</i>");
		output("\n\nDally shrugs and spins along the stage’s brightly lit edge, presenting his trim butt to a slim, low class ant-girl, shading her beneath his nectar-swollen abdomen. <i>“Suit yourself!”</i>");
	}
	//Leave AFTER interacted some
	else
	{
		output("You wave to Dally and send him on his way. More than a few myr girls have lined up along the stage, waiting for a chance at him. He nods to you, a little disappointment on his fair features, and goes on his way with a shimmy and a shake, his body synced to the thumping bass.");
	}
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Nectar?
//First time Nectar is chosen.
public function askDallyAboutNectarCauseYerADip():void
{
	clearOutput();
	showDally(true);
	output("You ask him for an explanation about his nectar; he’s certainly not carrying around any mugs.");
	output("\n\nDally’s pitch-black eyes shine with alien mirth while he takes a knee in front of you. <i>“And you’re the first " + pc.mf("guy","girl") + " to request a drinking vessel to sample my wares.”</i> He brazenly squeezes his half-hard length through his meager clothing. <i>“Most just lift the loincloth and give it a tug, maybe a suck. We don’t have ‘no touching’ rules like the fancy places I hear you have in the core.”</i> A smile crooks at the corner of his slim lips, and he rests his hand on his chin. <i>“You’re serious about this, huh?”</i> His grin widens, surprisingly genuine. <i>“You don’t know how a male honeypot works?”</i>");
	output("\n\nYou shake your head");
	if(pc.isBimbo()) output(" and giggle, licking your lips. You may not know how this works, but you’re looking forward to learning.");
	else if(pc.libido() <= 33) output(", trying not to blush.");
	else if(pc.libido() <= 66) output(", unsure if you should be blushing or leering.");
	else output(", trying not to leer to brazenly.");
	output("\n\nHe shakes his head and whistles appreciatively, discretely shifting himself beneath the white veil girding his loins. <i>“Pardon me if I get a little excited. It’s not everyday I get to talk to a star-walker, let alone one who might be interested in trying some nectar.”</i>");
	output("\n\nYou look on appreciatively. <i>“");
	if(pc.isBimbo()) output("Get as excited as you like.");
	else if(pc.isNice()) output("I wouldn’t expect anything else.");
	else if(pc.isMischievous()) output("Just don’t pass out trying to fill that snake up.");
	else output("I wouldn’t be talking to you if I was afraid of a stiff dick.");
	output("”</i>");
	output("\n\nChuckling, Dally drops the rest of the way down, crossing his legs so that his elbows rest on his knees - and his hardening cock is gently lifting the obscuring fabric. If it goes much higher, you’ll be able to see his balls. <i>“Okay, so gold myr, some of us are honeypots. We get way hungrier than our brothers or sisters, and when we eat all that food, our bodies convert all the nutrients, all the energy, into highly nourishing nectar.”</i> He shakes, leaving his black ponytail to swish behind him. <i>“I guess we’re a kind of living larder for our people or something.”</i>");
	output("\n\nYou note that Dally’s erection is flagging. If this discussion gets any drier, you fear it might vanish entirely.");
	if(pc.isBimbo()) output(" Smiling, you lean forward and exhale, fluttering his loincloth against it. He and his boner perk up right on cue.");
	else output(" You jerk your eyes back up to his once you realize you’re staring.");
	output(" <i>“So when does this get to be something sexy a stripper offers?”</i>");
	output("\n\nDally leans back against his swollen-looking abdomen and yanks the loincloth aside, revealing himself and a little more - a bead of amber rolling from the glans of his cocktip. <i>“When I offer my curious patron a drink from the tap.”</i> He curls his fingers around his length and gives himself a long, slow milking motion from his base all the way to his tip, squeezing out a thicker stream of what looks like honey. <i>“I assure you; it is quite delicious. There’s plenty there if you’re feeling peckish.”</i> Gathering the shining sample on a fingertip, he sucks it between his black-painted lips. <i>“Or I could get you that dance I offered. No pressure.”</i>");
	flags["DALLY_NECTAR_SPIEL"] = 1;
	processTime(5);
	pc.changeLust(4);
	dallyMenu();
}

//Dance
public function askDallyForADanceYaDunce():void
{
	clearOutput();
	showDally(true);
	output("<i>“A dance sounds");
	if(pc.isBimbo()) output(", like, really great");
	else if(pc.isNice()) output(" lovely");
	else if(pc.isMischievous()) output(" like more fun than just about anything else on this dirtball");
	else output(" fine");
	output(",”</i> you ");
	if(!pc.isBro()) output("answer");
	else output("rumble");
	output(".");
	output("\n\nDally pivots himself closer, his hips subtly jerking to the bass thudding through the primitive speaker system. Like the myr themselves, the tune is earthy and rich. Dally swivels closer, seeming almost to swim through the music. The slight distortions of the place’s imperfect acoustics and antiquated machinery ripple around him. He’s close enough for his loincloth to brush against your [pc.face] as he passes, an up-close-and-personal view of his thickening cock yours and yours alone. It’s gone a second later, covered by the curtain of his gauzy garment.");
	output("\n\nThis close to you, his sweet, undeniably masculine scent, hangs heavy around the beaded curtains of sweat upon his glistening body. As his gyrations become increasingly frenetic, a whiff of pheromone-laced perfume hits your nostrils, making your head spin. It’s the good stuff, and the closer he dances, the more you feel it affecting you, making your [pc.skin] flush hot, and your breath quicken in your chest.");
	output("\n\nYou catch yourself leaning forward, arm reaching toward the arthropod adonis, but halt yourself in time, controlling your impulses... ‘<i>It’s the right thing to do,</i>’ your brain stresses, but your body will have none of it, not with such a glorious model of masculinity so close. Your mouth waters at the thought of such a delicious smelling cock veiled behind perfumed silk, swishing back and forth hypnotically. You reach up once more, hand shaking, and eyes traveling up from Dally’s enticing, half-covered rod, over the expanse of his chiseled body, up to his face.");
	output("\n\nHe grabs the back of your head");
	if(pc.hasHair() && pc.hairLength >= 1.5) output(", fingers curling around a fistfull of your [pc.hair],");
	output(" and draws your face toward his increasingly tumescent ant-cock. His veins pulsing against your cheek, the beat of his body, swelling it thicker and longer against your face. He might be a stripper, used to clients wanting him, but it’s clear that he wants <i>you</i> now, and he’s clearly hard at the thought of pressing himself against you.");
	output("\n\nIt’s hard not to swoon; it’s hard to do much at all, other than nuzzle into it, pressing your lips against his meat in a sideways half-kiss. Drops of honey have left dark spots on his loincloth, and they’re wet against your lips, wet and sweet, as his golden rod rises, lifting it out of the way.");
	output("\n\n<i>“We don’t mind a little touching here,”</i> Dally confidently explains, his deft fingers twisting a snap on his hip. The once-white loincloth falls away, smeared with a liberal amount of sticky nectar. Strings of honey trail from his glans to his smooth, glistening sack, and before your eyes, something begins to leak from his tip. A thinner, clear slick has forced out the last of the nectar. Its aroma not as sweet, but far more like... like the rest of him - rich and inviting.");
	output("\n\nYour reply with a sigh of relief. You can let your inhibitions fall down around you like a house of cards in an earthquake, one the myr boy is all too happy to dance along to. There’s nothing to stop you from touching him if you want. You can enjoy his efforts as fully as you like, whether it’s exercising self-restraint and sitting on your hands or letting them flow along his length like steady, gentle waves.");
	output("\n\nDally, now completely erect, grinds himself against you once more. Do you get handsy or let him continue to dance unmolested?");
	processTime(10);
	pc.changeLust(10+rand(4));
	if(pc.hasCuntTail() && flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined && flags["DAYS_SINCE_FED_CUNT_TAIL"] >= 7)
	{
		output(" [pc.EachTail] twists out of hiding at the thought of an undrained dick. The hunger is overwhelming! You NEED to feed! The choice is out of your hands; you won’t be able to walk out of here without draining someone dry; it might as well be him.");
		clearMenu();
		addButton(0,"Next",talkMilkAnAntGuy);
	}
	//(Bimbo) 
	else if(pc.isBimbo()) 
	{
		output(" Like there was ever a choice! You giggle and bite your [pc.lip] as you prepare to handle this prancing studmuffin.");
		clearMenu();
		addButton(0,"Next",dallyDanceWithTheBadTouchYouAndMeBabyArentNothinButMammalsNoWaitInsects,undefined,"Touch","Get a hands-on dance. It might be a little messy.");
	}
	else
	{
		//[Touch] [No Touch]
		clearMenu();
		addButton(0,"Touch",dallyDanceWithTheBadTouchYouAndMeBabyArentNothinButMammalsNoWaitInsects,undefined,"Touch","Get a hands-on dance. It might be a little messy.");
		addButton(1,"No Touch",danceNoTouchDally,undefined,"No Touch","Don’t touch him while he dances.");
	}
}

//Tail Milking
public function talkMilkAnAntGuy():void
{
	clearOutput();
	showDally(true);
	output("Horny and filled with alien hunger, you barely manage to warn Dally before your tail leaps into action. <i>“G-g-gotta feed");
	if(flags["CUNTTAILED_DALLY"] != undefined) output(" again");
	output("!”</i>");
	output("\n\n");
	if(flags["CUNTTAILED_DALLY"] == undefined) output("It isn’t enough. He looks confused, maybe even concerned. He mouths something about nectar, but he’s wasted his chance to do anything about what’s to come.");
	else output("It doesn’t seem to phase him. He looks happy, maybe even a little eager. He mouths something you don’t quite hear, but he’s wasted his chance to do anything about what’s to come.");
	output("\n\n[pc.OneTail] flashes up to the myr boy’s rod faster than railshot, the drooling cunt snaring his glans in its too wet, altogether too warm interior, assaulting him with paralyzing levels of sensation. Though somewhat detached from the instinctive cock-capture, you still feel the folded flesh ripple and twist around him, quenching a thirst you still don’t fully understand, even after all this time with a");
	if(pc.hasParasiteTail()) output(" parasitic");
	else output("n alien");
	output(" cum-drinker.");
	output("\n\nDally slumps to the ground, tipping onto his back, murmuring, <i>“Stones...”</i> His hips futilely twitch upward, trying to wring some useless show of male authority from the rather one-sided copulation, but all it does is make it easier for your [pc.cuntTail] to slurp its way down another two inches of his rapidly-rising dick. Its own weight kept it dangling downwards before, but under your instinctive stimulation, Dally’s member has no choice but to rise to the occasion, full and throbbing.");
	output("\n\nThe harder (and larger) he gets, the more your tail has to stimulate. The hollow");
	if(pc.hasParasiteTail()) output(" parasite");
	else output(" tail");
	output(" undulates around its prey, slowly inching down to devour more and more. If you didn’t know better, you’d think it attached to you backwards and that the snake half was trying to eat him starting with his cock.");
	output("\n\nOf course, there’s no way such a thing should feel so good - sex isn’t normally like this! With its needs tended to, your bestial partner is all to happy to pass-through every delicious sensation... and a warm, satisfied glow that could rival post-coital bliss for enjoyability. It’s like being wrapped up in a warm fuzzy blanket with a mug of hot chocolate while simultaneously pounding the ever-loving fuck out of the worlds biggest, veiniest prick. You shiver and your seat and placidly lean forward to watch, your concern smothered away by enjoyment.");
	output("\n\nDally is writhing now, alternately moaning and murmuring <i>“Yes”</i> again and again. His hands curl into fists, rise up, and then open to slap palm-down against the stage whenever your tail touches something particularly sensitive. His eyes flick over to you, but they’re empty save for lust and desire. Still watching you, he grabs hold of the snake-like tail on his overstimulated dick and plunges it the rest of the way down, burying over fifteen inches of prime myr meat into your endlessly hungry passage.");
	output("\n\nIt must be your turn to moan like a whore, because you can’t hold your vocalizations inside. They rise up like licentious spirits, hanging around you until everyone in a ten foot radius knows just how horny and well-fucked your feeling, if you don’t show it in a way they understand.");
	output("\n\n<i>“F-fuck, I got this,”</i> Dally pants, pulling you most of the way off.");
	output("\n\nYour comfortable bliss fades away, leaving you with nothing but an endless hunger for his juice - his cum, whatever he can shoot into you. You’ll take it all. That warm, sticky goo will extinguish the fires raging at the base of your spin and give you the relief you need. All you need to do is make Dally cum!");
	output("\n\nRamming your [pc.cuntTail] down until its clit nestles against his balls, Dally starts fucking <i>you</i>, pounding your tailpussy like some kind of organic stroke-toy. The comfort returns in triplicate. Your eyelids droop, and your eyes roll back, giving up the visual spectrum for all things tactile. When Dally cranes his neck over to kiss you, you dopily return the motion, shivering with each lurid, lube-squirting thrust he delivers to your live-in spunk-tank. His antennae brush against your cheek with the softness of a lover’s fingertip, perhaps unintentionally, but it delights you all the same.");
	output("\n\n<i>“Mmm,”</i> you both whimper as your tail squeezes and sucks midway through Dally’s thrusts. The powerful twists and tugs take your insectoid lover to the heights of pleasure, robbing his lips and tongue of any dexterity. The kiss breaks with Dally moaning louder and bucking his hips, burying his wildly throbbing shaft wholly inside you. Damn, he’s so warm and hot and... oh.");
	output("\n\nPleasure explodes behind your eyes, whiting out what little you were able to take in. Each tail-distending squelch goes off like a bliss-bomb inside you, filling you with warm and shivers of ecstasy that circulate your body from your [pc.feet] to your fingers to the very ends of your ears. Sticky-sounding burbles can barely be heard over the music or your own hammering heart. You drool onto the side of the stage, weakly trembling, every single neuron devoted to extracting every ounce of cum from the overworked myr, and more importantly, enjoying it.");
	output("\n\nDally lets out little <i>“ahs”</i> of delight and periodically shivers, sometimes violently jerking his hips in response to the endless squeezes and tugs your [pc.cuntTail] provides him with. His orgasm seems endless, not that you particularly mind, of course. You could lie here and bathe in your tail’s heavenly delights for hours.");
	if(pc.hasVagina() || pc.hasCock())
	{
		output(" They might need to bring a mop in after you leave, though. The space beneath you is thoroughly soaked with ");
		if(pc.hasVagina()) output("[pc.girlCum]");
		if(pc.hasCock() && pc.hasVagina()) output(" and ");
		if(pc.hasCock()) output("[pc.cum]");
		if(pc.isCrotchGarbed()) output(", to say nothing of your stained [pc.lowerGarments]");
		output(".");
		if(pc.hasCock() || pc.isSquirter())
		{
			output(" You vaguely feel your organ");
			if(pc.cockTotal() > 1 || (pc.hasCock() && pc.hasVagina() && pc.isSquirter()) || (pc.totalVaginas() > 1 && pc.isSquirter())) output("s");
			output(" dump another fluid payload and giggle drunkenly. That sure hit the spot!");
		}
	}
	output("\n\nOhh, you’re getting full! You rub vaguely at your [pc.belly] without much thought, but your tail knows that its had its fill. It slips off Dally’s spooge-drenched prong with the wettest-sounding slurp you can imagine quietly retracts behind you, somehow leaking nothing but clear, girlish goo, the stripper’s cum locked away somewhere inside.");
	output("\n\n<i>“Sorry,”</i> you manage as your wits lazily wander back into place. <i>“");
	if(flags["CUNTTAILED_DALLY"] == undefined) output("I uh... don’t know what came over me.");
	else output("I’ll uh... try to give more warning next time.");
	output("”</i>");

	output("\n\nDally struggles up onto his knees and looks at his member in wonder. Are his balls a little smaller? <i>“");
	if(flags["CUNTTAILED_DALLY"] == undefined) output("N-no problem, star-walker. It was pretty fun, actually. Maybe keep that thing on a tighter leash in the future though, okay?");
	else output("N-no problem. It’s kind of fun coming to work, never knowing if star-walker is going to interrupt me mid-dance to ravish me like that.");
	output("”</i>");
	output("\n\nYou giggle to yourself and nod. This planet is awesome!");
	output("\n\nHe fastens a fresh loincloth on pivots around the pole, smiling one last time at you before returning to working the stage once more.");
	output("\n\nA flashing hologram pops into existence beside you with a fizz of static, displaying the word ‘Tip’. Small print appears below with the credit address for anything you’d like to give Dally. For backwater creatures, the myr seemed to have figured out payment terminals well enough.");
	output("\n\nDo you tip Dally?");
	if(flags["CUNTTAILED_DALLY"] == undefined) flags["CUNTTAILED_DALLY"] = 0;
	flags["CUNTTAILED_DALLY"]++;
	//[No Tip] [100 Creds] [250 Creds] [999 Creds]
	//4-5 cums
	var ppDally:PregnancyPlaceholder = getDallyPregContainer();
	pc.loadInCuntTail(ppDally);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	processTime(20);
	pc.orgasm();
	dallyTipMenu();
}

//No Touch
public function danceNoTouchDally():void
{
	clearOutput();
	showDally(true);
	output("Just because the savages on this world don’t abstain from openly fondling their dancers doesn’t mean that you need to stoop to their level, no matter how intriguing the show from the alluring ant-boy. You forcefully fold your hands and place them ");
	if(pc.isTaur()) output("against the bottom of your [pc.belly]");
	else output("in your lap");
	output(" to better keep them out of trouble. They might wiggle ");
	if(pc.isTaur()) output("and rub ");
	output("against your [pc.skinFurScales], trying to dart lower still, but you maintain the same kind of control over your rebellious digits that the dancer has over his thick prick.");
	output("\n\nDally’s wiggling display slows once he realizes you won’t be enjoying him in any physical capacity. Cocksure smile returning, he shrugs and launches into a flourishing dance that allows you a wonderful view of his endowments. His thighs flex, gleaming almost gold into the dim club’s light. He spins at the last second, his abdomen pointed straight up, giving you the best look at his slim, toned ass that you’ve seen to date.");
	output("\n\nYou could reach out and touch it. It’d be so easy, but instead you choose to fan your very flushed and overheated face. Shifting excitedly in your ");
	if(pc.isTaur()) output("spot");
	else output("seat");
	output(", you try not to focus on the ");
	if(pc.hasVagina())
	{
		if(pc.wettestVaginalWetness() < 3) output("wetness pooling beneath you");
		else if(pc.wettestVaginalWetness() < 4) output("wetness threatening to cascade down your thighs");
		else output("sensuous slickness building down south");
	}
	else if(pc.hasCock())
	{
		if(pc.isCrotchGarbed()) output("way [pc.eachCock] strains against your [pc.lowerGarment]");
		else output("way [pc.eachCock] is quivering excitedly");
	}
	else output("the way your [pc.asshole] tingles with excitement");
	output(". It’s almost too much, being this close to him and allowing him to so relentlessly excite you with his body.");
	output("\n\nGrinning over his shoulder, he bounces a few times, then presses his palm against the top of his dick, forcing it to hang down like a third leg. A stream of nectar drools out of the tip, threatening to connect him to the stage’s floor. He breaks it with a quick spin around. The sweet droplet smacks into your cheek and hangs there while he dances with his ass swaying, his cock bobbing, and his honey-stuffed abdomen lewdly carried along behind him to the tempo of the music’s gritty beat.");
	output("\n\nYou’re panting before long, a little dizzy on lust and whatever cologne he wears. He reaches out to brush a bead of sweat from your brow, concern on his face. <i>“Are you sure you’ll be okay? I’ve got to dance for some of the other girls, but don’t do anything stupid just because you’re all worked up, okay?”</i>");
	output("\n\nYou lick your lips and nod agreeably. The whole reason you kept your hands to yourself was because you wanted to stay in control, not get <i>fucked</i> like some <i>" + pc.mf("cock-addled twink","cock-sucking harlot") + "</i>.");
	output("\n\nDally’s blank, black orbs seem to study you for a long moment. <i>“All right.”</i> His grin returns, though his poor prong seems to be flagging a little. <i>“And maybe next time you can let your hands roam free.”</i> He winks and sashays down the stage to a crowd of cheering, intoxicated myr.");
	output("\n\nMaybe... you could try the local custom. A flashing hologram pops into existence beside you with a fizz of static, displaying the word ‘Tip’. Small print appears below with the credit address for anything you’d like to give Dally. For backwater creatures, the myr seemed to have figured out payment terminals well enough.");
	output("\n\nDo you tip Dally?");
	//output("\n\n[No Tip] [100 Creds] [250 Creds] [999 Creds]");
	pc.changeLust(75);
	processTime(15);
	dallyTipMenu();
}

//Dance - Touch
public function dallyDanceWithTheBadTouchYouAndMeBabyArentNothinButMammalsNoWaitInsects():void
{
	clearOutput();
	showDally(true);
	output("Dally’s balls, while not huge, are not inconsequential. The egg-sized spheroids slap against your neck from their owner’s vigorous motions, the ballast of his 15”</i> vessel. You grin and reach up, grabbing his length in one hand and his sack in the other. He’s slick with sweat and juices, and your fingers simply slide along his smooth length, beginning to stroke him much sooner than you had intended. A still grip seems an impossibility, not when his body is this smooth, wet, and effortlessly twisting.");
	output("\n\nDally’s dance subtly shifts as he strays further from the onstage pole and closer to place himself wholly at the mercy of your hands’ tender ministrations. Before you know it, though, he’s arching backwards towards the pole and shaking his hips so that his cock slides through your hands, leaking his inhuman pre-cum all over your hands and all but pressing his drooling tip to your cheek. The next sway of his hips sweeps it perilously close to your mouth - close enough to kiss.");
	output("\n\n");
	if(pc.isBimbo()) output("Like you’d miss an opportunity like this!");
	else if(pc.libido() <= 33) output("You’ve come this far, and some of the other patrons are doing lewder things. Why not?");
	else if(pc.libido() <= 66) output("You could just play with your hands, but to be completely honest, you’d rather go the rest of the way. Dally seems to like it.");
	else output("A bar where handsome studs dance at you and let you play with their junk to boot? You might have died and gone to the Heaven that the priests of the One God are always prattling on about.");
	output(" You edge forward until your [pc.lips] press against his swelling cockhead, parting just enough to let a trickle of his slowly-leaking enthusiasm onto your tongue.");
	if(pc.isTreated() && pc.isBimbo()) output(" Fuck, you’ll never get tired of tasting this stuff! It tastes like happiness melted down and mixed in with liquid marshmallow.");
	else output(" It’s still fairly sweet; they don’t call them honey ants for nothing!");
	output("\n\nDally inhales sharply and draws back, <i>“Star-walker, if you keep that up, I’m afraid I won’t be able to contain my excitement.”</i> His dick throbs heavily against your palm as a shiver of joy thrills up your spine.");
	output("\n\nYou let go of his nuts and cover your mouth ");
	if(pc.isBimbo()) output("to hide you licking the traces of his pre from your lips");
	else output("in mock offense");
	output(". <i>“That easily?”</i> you ask. Of course, your other hand maintains its grip on his shaft. His excited trembling has brought an impromptu end to his dance, and you’re forced to keep up the rhythm by sliding your palm back and forth along his slippery, golden skin.");
	output("\n\nGrinning eagerly, Dally tries to continue with the rhythm. His thighs rub sensuously against one another, his hips wiggling back and forth, twisting his lengthy, alien cock in your hands. He groans excitedly, head swelling as he does, warning, <i>“I hope you’re ready, " + pc.mf("mister","miss") + "!”</i>");
	output("\n\nYou ");
	if(pc.hasCock() && pc.hasVagina())
	{
		output("try to make the iron-hard bar");
		if(pc.cockTotal() > 1) output("s");
		output(" below stage level a little more comfortable while ignoring the boiling heat in your [pc.vaginas]. Sometime you’re going to have to ride this quick-shooting stripper.");
	}
	else if(pc.hasCock())
	{
		output("try to adjust the iron-hard bar");
		if(pc.cockTotal() > 1) output("s");
		output(" below stage level a little more comfortable.");
	}
	else if(pc.hasVagina()) 
	{
		output("try to ignore the sweltering furnace");
		if(pc.totalVaginas() > 1) output("s");
		output(" of lust that ");
		if(pc.totalVaginas() == 1) output("is");
		else output("are");
		output(" your [pc.vaginas]. Someday you’re going to have to take this quick-shooting stripper for a ride. Odds are he’s good for more than one go.");
	}
	else output("try to ignore how badly you want him to stuff that log up your ass and focus on the here and now.");
	output(" Now, will you let him go off in your mouth, on your face, make him cream all over the stage?");
	flags["DALLY_FAVOR_OFFERED"] = 1;
	//[Mouth] [Face] [Stage]
	pc.changeLust(40+rand(10));
	processTime(10);
	clearMenu();
	addButton(0,"Mouth",takeSomeDallySploogeInYerMouthYaSloooooot);
	addButton(1,"Face",makeDallyBlowALoadOnYerFaceYeSloot);
	addButton(2,"Stage",makeDallyCumOnStage);
}

public function makeDallyCumOnStage():void
{
	clearOutput();
	showDally(true);
	output("<i>“Mmm, you go ahead and cum, Dally. Just make it a big one.”</i>");
	output("\n\nNodding thankfully, the now-nude stripper bucks against pre-greased palm, abandoning musical rhythm for the fevered urges coming from his own bloated loins. A tremor runs through his body. You can feel it through his cock.");
	output("\n\nYanking down sharply, you pull his length down toward the stage and squeeze it firmly. He throws back his head and moans, cock swelling in your hand. The urethra bulges against your fingers. Obligingly, you relax them, allowing his first pearl-and-amber squirt to splatter against the stage floor. The stripper slut doesn’t show an ounce of shame as he blows his wad on the floor in front of everybody, putting his hands on your shoulders to balance as he humps your fingers for all he’s worth.");
	output("\n\nCheers and applause break around you while Dally wastes his virile load on the polished stone of the stage. Someone hoots, <i>“Dally popped his cork again!”</i>");
	output("\n\nAnother voice calls, <i>“Get me some of that, girl!”</i>");
	output("\n\nThe female myr crowd around you. The more brazen among them hold their hands beneath Dally’s quivering prick to catch a wad of his pearlescent issue. His antennae twitch as he cums, yet his virility doesn’t last more than thirty seconds or so. He sags back, leaning on the pole for support while his erection begins to flag. Less confident myr quietly ask if they can try his cum. Who are you to stop them?");
	//No cum, +horniness
	pc.changeLust(33);
	processTime(6);
	dallyDanceHJEpilogue();
}

//Face
public function makeDallyBlowALoadOnYerFaceYeSloot():void
{
	clearOutput();
	showDally(true);
	output("<i>“On my face, Dally. Cum on my face");
	if(pc.isBimbo()) output(". Soak me in jizz! Make me look like a spunk-doll!");
	else output(",");
	output("”</i> you instruct.");
	output("\n\nDally’s antennae raise in surprise, but his dick is practically thrumming in your hands, somehow harder than the rock the stage was hewn from and yet still jerking wildly with every twitch of the ant-boy’s abdominals. His hips quiver briefly, then slam forward, thrusting all fifteen inches of rigid antmeat through your fingers before you have a chance to react. His crown visibly expands a few inches from your face, filling your vision for the split-second it takes his spermy issue to reach the end of his urethra.");
	output("\n\nYou blink your eyes closed by reflex. There was no time for thinking or any sort of prepared plan - your body just slammed your eyelids closed like the windows on a starship before a plasma barrage, only this barrage feels... nice as it splatters against your skin. Thick, goopy warmth cascades down your forehead and cheeks. A droplet runs down the bridge of your nose before rolling off to collect at the corner of your mouth.");
	output("\n\nHe’s smothering you with his hot, sticky release. The smell is so thick to you that it’s almost cloying, musky and sweet at the same time. You can’t help but let your tongue slide out of your mouth to try a little. It’s ");
	if(pc.isBimbo()) output("divine");
	else output("better than it smells, honestly");
	output(". There must be some of his nectar mixing in with it. Some splashes down " + (pc.hasHair() ? "in your hair" : "on your head") + ", and you shudder, listening to the myr girls collect around you, cooing in excitement.");
	output("\n\nDally’s still going too. The deliciously warm ropes hitting you aren’t as big as the first ones, but there’s enough on you at this point that it must look like a solid mask to your audience. You wind up letting go of him at some point, but he keeps pumping, shooting more ");
	if(!pc.hasHair()) output("over the top of your head");
	else output("into your [pc.hair]");
	output(".");

	output("\n\nWhen hot tongues caress your cheek, you barely react, at first mistaking it for a particularly voluminous shot from the stud on stage, but more join it. More myr girls surround you, licking the rare male’s cum from your face. One slides in your mouth, sharing the load with you, curling around your tongue as lips match to lips and spit mixes with spunk. You shudder, riding high on the heady sensation, unable to voice any sort of protest. You don’t want to stop them. Their tongues are everywhere: on your ears, on your neck, lapping at the nape of it. You shiver and nearly cum from the attention alone.");
	output("\n\nDally’s voice is barely audible over the slurping, <i>“The boss wants me to move on, but line back up at the stage if you want another dance, okay? Maybe I can pay you back sometime.”</i>");
	output("\n\nA little later, the girls drift away with giggles and winks. You try to catch your breath, acutely aware that not a single drop of cum remains on your body. That was fun.");
	pc.exhibitionism(1);
	//No pc cums, +lotsa horniness
	pc.changeLust(33);
	mimbraneFeed("face");
	processTime(6);
	dallyDanceHJEpilogue();
}

//Mouth
public function takeSomeDallySploogeInYerMouthYaSloooooot():void
{
	clearOutput();
	showDally(true);
	output("<i>“Ready?”</i> You shake your head. <i>“Not yet, let me try this...”</i> You open your mouth and place your lower lip against the underside of his drooling honeynozzle. It’s warm, wet, and more importantly, tasty. <i>“Now I’m ready.”</i> You flick your [pc.tongue] out");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" all the way down his length to his balls, lewdly slurping every inch of him at once");
	else output(" to slurp as much of him as you can reach");
	output(".");
	output("\n\nA full-body shiver runs through Dally’s body, but you make sure he doesn’t stray too far from your mouth. You don’t want the sticky treat he’s about to give you to be wasted, not after so much delectable build-up!");
	output("\n\nDally gasps outright, his antennae twitching as if he can’t quite believe what’s about to happen. He trembles, trying not to erupt like a over-pressurized oxygen tank. <i>“You sure?”</i>");
	output("\n\nYou wiggle your [pc.tongue] back and forth and lean a little bit further forward in answer, devouring the first two inches of his substantial length.");
	output("\n\nThe stripper, for all his supposed experience, moans with overwhelming excitement. Coos and titters run through the assembled audience; most sound equal parts excited and jealous. They can’t feel him pulsing on their tongue or throbbing against their palate. Their hands can’t admire his girth or the virile weight of his shuddering balls. And there’s no chance in all of space’s vast expanse that they can taste the first sugar-tinged blobs as they squirt from his orgasmically-jerking dick.");
	output("\n\nDally tastes a little salty but more sweet, and in the span of two seconds it becomes the only thing you can taste. He floods your mouth with it. Trickles of his whitish goo leak from the corners of your mouth. You swallow as best you can, but more escapes to drip from your chin, fed from a seemingly unending stream of virile jism. Dally bathes your mouth in his syrupy load, painting your lips with the excess, forcing you to gulp again and again.");
	output("\n\nWhen you can handle no more, you pull back and gasp for breath, offering his still-spurting rod to an ant-girl who has appeared beside you, mouth open in anticipation. She feeds the spurting shaft into her gullet and sucks with the kind of earnest eagerness that speaks of a sort of wanton hunger for cock. You watch and dab the dripping spooge from your face, offering it to another myr. She sucks the proffered digits clean one after another, relishing it.");
	output("\n\nDally finishes not long after - you clearly got the lion’s share of his load. Even now, you can feel it sloshing in your tummy. The dancer extricates himself from his fan’s sucking maw with a bit of difficulty and gives you a grateful nod. His balls actually look a little lighter thanks to your intervention. <i>“Thank you ladies, but I’ve got to walk the rest of stage before the boss gripes at me. I’ll try and return the favor if I ever get the chance.”</i> He winks at you and turns away, launching into a dance as well as his tired legs will allow.");
	var ppDally:PregnancyPlaceholder = getDallyPregContainer();
	pc.exhibitionism(1);
	pc.loadInMouth(ppDally);
	//Doesnt get the unified epilogue
	processTime(6);
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Dally Dance HJ Epilogue
//Attach to the three cum forks, no new page!
public function dallyDanceHJEpilogue():void
{
	output("\n\nDally wipes the sweat from his brow and gives you a pleased smile. <i>“I hope you enjoyed yourself as much as I did. I’d better get to some of the other customers before my boss kills me, though. If you ever want a dance or... anything else, just come find me, okay? Maybe I can repay the favor sometime.”</i>");
	output("\n\nSure. You’re about to stand up when a flashing hologram displaying the word ‘Tip’ appears alongside you. Small print appears below with the credit address for anything you’d like to give Dally. For backwater creatures, the myr seemed to have figured out payment terminals well enough.");
	output("\n\nDo you tip Dally?");
	//output("\n\n[No Tip] [100 Creds] [250 Creds] [999 Creds]");
	dallyTipMenu();
}

public function dallyTipMenu():void
{
	//output("\n\n[No Tip] [100 Creds] [250 Creds] [999 Creds]");
	clearMenu();
	addButton(0,"No Tip",payDally,0);
	if(pc.credits >= 100) addButton(1,"100 Creds",payDally,100);
	else addDisabledButton(1,"100 Creds","100 Creds","You don’t have that much.");
	if(pc.credits >= 250) addButton(2,"250 Creds",payDally,250);
	else addDisabledButton(2,"250 Creds","250 Creds","You don’t have that much.");
	if(pc.credits >= 999) addButton(3,"999 Creds",payDally,999);
	else addDisabledButton(3,"999 Creds","999 Creds","You don’t have that much.");
}

public function payDally(amount:int = 0):void
{
	clearOutput();
	showName("PAYMENT\nTERMINAL");
	if(amount == 0) 
	{
		output("You shake your head at the terminal and step back");
		if(pc.credits < 100) output(", wishing you could afford to spare some token of your gratitude");
		else if(pc.credits < 500) output(", wishing you were a little bit richer");
		output(".");
	}
	else
	{
		output("You transfer " + amount + " credits to Dally’s digital tip jar. Of course, the establishment probably takes a healthy cut, but that can’t be helped, right?");
		pc.credits -= amount;
		if(flags["DALLY_TIPS"] == undefined) flags["DALLY_TIPS"] = 0;
		flags["DALLY_TIPS"] += amount;
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Nectar Suck
public function nectarSuckFromDallyProper():void
{
	clearOutput();
	showDally(true);
	output("<i>“I think I could use a quick drink from the tap.”</i> ");
	if(pc.isBimbo()) output("You lick your lips to show just how ready you are.");
	else if(pc.isNice()) output("A warm smile slowly spreads across your features. <i>“A handsome myr told me it was quite delicious.”</i>");
	else if(pc.isMischievous()) output("You look him and down, a mischievous grin on your features. <i>“If the tap still works after a long day on stage.”</i>");
	else output("You spare him a hungry look.");
	output("\n\nAn excited tremor runs through Dally’s antennae. His sable eyes glimmer black and blue from the club’s phosphorescent light, unreadable save for a sense of excitement. <i>“Then prepare to sample my people’s fruit... or my incarnation of them, anyway.”</i> He flips his loincloth up and out of the way while he fiddles with a clasp on his hip. It releases with an audible pop, the garment drifting to the floor to lie in a tiny, nectar-stained heap.");
	output("\n\nDally isn’t hard. If anything, he’s smaller than he looked when you approached. An arched eyebrow garners a smirk from the chitinous stripper.");
	output("\n\n<i>“My body anticipates a different kind of relief, star-walker. Were I hard, it would be quite difficult to give you the nectar you seek. Perhaps you might get dribs and drabs, a little mixed with cum even, but you would not get to taste the pure delight I’m offering.”</i> Dally squats to place himself level with your head, his knees parted to either side of your ears. It’s impossible to ignore the rich, sweet scent of his manhood with his musky cologne or the way his glans bobs an inch or two from your chin.");
	output("\n\nThe dancer’s breathing is heavy and excited. His gold-toned skin is flushed. Every facet of his posture and appearance betrays arousal save for his dick. The limp noodle between his legs seems even softer now, though a trickle of honey flows freely from its tip, like a bottle tipped on its side.");
	output("\n\nYou take a deep breath, getting a whiff of pheromones, as you ");
	if(flags["DALLY_NECTAR_DRANK"] == undefined) output("nervously");
	else output("excitedly");
	output(" grab hold. His skin down there is remarkably smooth and supple. It feels good on your fingers. You guide him into your mouth hesitantly, unable to stop yourself from looking around nervously. A few ant-girls are watching, but they’re clearly jealous, not judging. Their envious looks are all you need to let him make contact with your tongue.");
	output("\n\nHe tastes <i>amazing</i>. Sugar and the finest spices would struggle to compare to the flavor of gold myr nectar. Even the parts of your tongue that taste nothing but his prick are bathed in the residual, sweet flavor. His very skin seems inundated with it. You swallow the sample and give a satisfied ");
	if(pc.race() == "kaithrit" || pc.race() == "half-kaithrit") output("purr");
	else output("sigh");
	output(".");
	//First time:
	if(flags["DALLY_NECTAR_DRANK"] == undefined) 
	{
		output("\n\nThen, you realize that he’s barely trickling any more onto your tongue. You pull off, brows knitting in irritation and ask, <i>“Where’s all the honey?”</i>");
		output("\n\nDally looks down at you and chuckles, his cheeks flushed, <i>“You’ve got to suck it out. Kind of like cum in that regard, only it’ll flow more or less as long as you keep sucking.”</i>");
		output("\n\nBlushing in embarrassment, you nod and gobble him back up once more, this time hollowing your cheeks to give his sugary prick a proper suckle. Dally trembles up on stage, but the honey flows as promised, bathing your tongue in more of his ambrosial goo. It’s thicker than the honey produced by terran bees and with a different flavor, almost like maple syrup. You gulp it down, the lingering bits clinging to your palate and teeth, and decide it isn’t that much like syrup either. You wouldn’t be able to drink it straight so easily.");
	}
	//Repeats
	else
	{
		output("\n\nIt’s just as easy to get him started as last time: a little suck and he’s pouring more ambrosia directly onto your tongue. You swish it around your mouth while you draw out enough to fill your mouth the rest of the way, internally giggling when you swallow it down. The ant-man is trembling from enjoyment and pouring forth greater quantities for you to enjoy. It tastes like the unholy child of maple syrup and honey, yet is somehow more palatable to your tongue than either. You could drink this all night!");
	}
	//Merge
	output("\n\nThe source of your delectable treat is happily smiling and leaning against a pole for support. His abdomen is blushed so orange that it is practically glowing at this point, or is that the nectar itself? You resolve to look into it when you have some free time - when you aren’t sucking a snack in the middle of a packed club, your [pc.lips] sealed tightly around a prong.");
	output("\n\nThe sweet myr boy moans and gyrates against your face. He’s still limper than a wet noodle against your tongue but somehow enjoying himself all the same. One of his hands is stroking up and down his trim middle, sometimes pausing to tweak a small nipple and squeeze out a gasp of delight, giving himself over to the pleasure entirely. Gems scatter across the stage, thrown from a group of cheering ant-girls to your left. Two of them have begun to finger each other while they watch, and a third is pressing against your side in her excitement.");
	output("\n\nYou shiver a little yourself. You might not be getting any proper stimulation");
	if(pc.isTreated() && pc.isBimbo()) output(", but what Treated " + pc.mf("person","girl") + " doesn’t get a little twitterpated from feeling a cock on " + pc.mf("his","her") + " tongue? If he was hard, you’d probably manage to bring yourself off from raw excitement alone. Something about a rigid tool just makes you so light-headed and well... happy.");
	else output(", but there’s no denying the apparent sensuality of the situation. Moaning myr surround you, male and female alike, envious or moaning. You’re lapping at a deliciously tasty prick and filling your belly at the same time. What more could a " + pc.mf("guy","girl") + " ask for?");
	output("\n\nChitinous fingers weakly press down against the back of your head, forcing a little bit more of Dally’s still-sizeable length into your maw. He isn’t strong enough to hold you down. If it hadn’t been a surprise, you probably wouldn’t have moved an inch, but what’s it hurt to have a little more of his dick in your mouth? The poor guy is trembling so hard that he’s either feeling an immense amount of ecstasy or having a seizure. The moans coming out of his mouth assure you it’s the former.");
	output("\n\nThe myr girl next to you is cheering while her friends slump down against the side of the stage, vigorously frigging each other, filling the air with wet squelches and their own fragrant pussy-musk. You’d love to keep drinking, but you’re starting to get full. You swear that if you drink any more, you’re going to wind up looking positively pregnant");
	if(pc.isPregnant()) output(", or more pregnant than normal, anyway");
	output(". You give Dally one long hard suck by way of thanks and let him slip free.");
	output("\n\nA river of golden honey trails from your chin to the stage below him, and he’s still drizzling more. His eyes are closed and fluttering while his hips feebly pump. The ant-girl beside you brazenly reaches out to catch his slippery issue in a hand, switching to another when the first fills, determined not to waste a single droplet.");
	output("\n\nA burp escapes your mouth before you can stifle it. It tastes like Dally’s dick. You’ve got ant-cock breath. The girls around you giggle excitedly at the shocked look on your face. One of them offers to make out with you, but you pass for now, licking the last of the residue from your lips.");
	output("\n\nBy the time you rouse from your daze, Dally has gotten to his feet and moved down the stage. You’re about to stand up when a flashing hologram displaying the word ‘Tip’ appears alongside you. Small print appears below with the credit address for anything you’d like to give Dally. For backwater creatures, the myr seemed to have figured out payment terminals well enough.");
	if(flags["DALLY_NECTAR_DRANK"] == undefined) flags["DALLY_NECTAR_DRANK"] = 0;
	flags["DALLY_NECTAR_DRANK"]++;
	//Gain some HP and energy whynot
	pc.changeHP(Math.round(pc.HPMax()*.3333));
	pc.changeEnergy(pc.energyMax());
	pc.changeLust(15);
	output("\n\nDo you tip Dally?");
	processTime(17);
	pc.exhibitionism(1);
	//output("\n\n[No Tip] [100 Creds] [250 Creds] [999 Creds]	");
	dallyTipMenu();
}

//Talk
public function talkToDally():void
{
	clearOutput();
	showDally();
	//Haven’t tipped more than 250 creds to him.
	if(dallysTips() < 250)
	{
		output("<i>“I just want to");
		if(!pc.isBimbo()) output(" talk, Dally");
		else output(" like, talk and stuff");
		output(",”</i> you tell him.");

		output("\n\nDally smiles and shakes his head. <i>“Sorry babe, but if I spend a couple hours talking without pulling in any creds or gems, the boss’ll have my head.”</i> He scratches at the back of his head nervously, antennae dropping. <i>“I get a lot of leeway here on account of being such a rarity, but that doesn’t mean I can ignore my job and still keep it.”</i>");
		output("\n\nWell, you could always give him a tip to stick around and talk. What’ll it be?");
		processTime(1);
		//[Leave] [Tip 100 Creds] [Tip 250 Creds] [Tip 999]
		clearMenu();
		addButton(0,"No Tip",payDally4Talk,0);
		if(pc.credits >= 100) addButton(1,"100 Creds",payDally4Talk,100);
		else addDisabledButton(1,"100 Creds","100 Creds","You don’t have that much.");
		if(pc.credits >= 250) addButton(2,"250 Creds",payDally4Talk,250);
		else addDisabledButton(2,"250 Creds","250 Creds","You don’t have that much.");
		if(pc.credits >= 999) addButton(3,"999 Creds",payDally4Talk,999);
		else addDisabledButton(3,"999 Creds","999 Creds","You don’t have that much.");
		addButton(0,"Leave",leaveDally);
	}
	//Already tipped
	else
	{
		output("<i>“I just want to");
		if(!pc.isBimbo()) output(" talk, Dally");
		else output(" like, talk and stuff");
		output(",”</i> you tell him.");
		output("\n\nDally eagerly grins and spins himself down a nearby pole to the club’s floor. He saunters over to the tempo of the thumping bass and ");
		if(pc.isTaur()) output("sidles up next to you, his inky eyes twinkling.");
		else 
		{
			output("slides into your lap crossways so that his abdomen is dangling off one end and his tight rear is square positioned over your crotch.");
			if(pc.hasCock()) output(" Did he give you a little wiggle when he felt the bulge of [pc.oneCock]?");
		}
		output(" <i>“So what do you want to talk about, star-walker? I’m all antennae.”</i>");
		dallyTalkMenu();
	}
}

public function payDally4Talk(amount:int):void
{
	//Tip Creds to talk
	clearOutput();
	showDally();
	output("You summon a payment terminal with a tap on a nearby pillar and transfer " + amount + " credits into his account. <i>“");
	if(!pc.isAss()) output("I hope that’s enough for your boss.");
	else output("What about now?");
	output("”</i>");

	output("\n\nDally shakes his head disbelievingly. <i>“That’ll do. It’ll be a nice change of pace to talk instead of shake it. Besides...”</i> He runs a hand through his hair and smiles. <i>“...it’ll be nice to actually know I’ve got a tip ahead of time, not that the girls here are that stingy. It’s just nice to know what’s coming ahead of time.”</i> He nimbly climbs from the stage");
	if(pc.isTaur()) output(" and presses himself against you");
	else output(" to seat himself in your lap, one arm around neck");
	output(". <i>“What do you want to talk about?”</i>");
	pc.credits -= amount;
	if(flags["DALLY_TIPS"] == undefined) flags["DALLY_TIPS"] = 0;
	flags["DALLY_TIPS"] += amount;
	dallyTalkMenu();
}

//Talk menu
public function dallyTalkMenu(arg:Function = undefined):void
{
	clearMenu();
	if(arg == talkToDallyAboutHisJoerb) addDisabledButton(0,"His Job","His Job","You just finished talking about that.");
	else addButton(0,"His Job",talkToDallyAboutHisJoerb,undefined,"His Job","Ask Dally how he likes his job.");
	if(arg == gotJob) addDisabledButton(1,"Got Job?","Got Job?","You just finished talking about that.");
	else if(flags["DALLY_JOB_TALK_UNLOCKED"] == undefined) addDisabledButton(1,"Got Job?","Got Job?","You have no segway into that conversation. Maybe ask him about something else first?");
	else addButton(1,"Got Job?",gotJob,undefined,"Got Job?","Ask Dally how he came to work here.");
	if(arg == askDallyWar) addDisabledButton(2,"The War","The War","You just finished talking about that.");
	else addButton(2,"The War",askDallyWar,undefined,"The War","Ask him about the war.");
	if(arg == talkToDallyAbootHisFamiry) addDisabledButton(3,"Family","Family","You just finished talking about that.");
	else addButton(3,"Family",talkToDallyAbootHisFamiry,undefined,"Family","Ask him about his family. What were they like?")	
	if(arg == askDallyRedAnts) addDisabledButton(4,"Red Ants","Red Ants","You just finished talking about that.");
	else addButton(4,"Red Ants",askDallyRedAnts,undefined,"Red Ants","Ask him about the red ants. Has he ever met them?")	
	addButton(14,"Leave",leaveDally);
}

//[His Job]
//Talk: His Job
public function talkToDallyAboutHisJoerb():void
{
	clearOutput();
	showDally();
	output("You ask how he likes his job.");
	output("\n\nDally gestures grandly around the club with his left arms. <i>“You mean all this?”</i>");
	output("\n\nYou nod.");
	output("\n\n<i>“Honestly, I love it. People come in to meet me, to spend time with me, and to enjoy the atmosphere this place provides. I may not be in charge, per se, but I’m like a prince, and this place is my castle.”</i> He shifts himself against you, settling in. <i>“I get money and gifts just for being a gracious host. All I have to do is give a little wiggle and have a little fun.”</i>");
	output("\n\nYou arch an eyebrow. <i>“What if you get an ugly customer?”</i>");
	output("\n\nDally lets out a short, good-natured chuckle. <i>“Then I pretend she looks prettier than she is... or see if I can find something to like about her personality. It is still a job - the show must go on, and no one deserves to be ignored just because they have a crooked antennae or weak chin. Honestly, people like that probably deserve the attention more than a pretty tradeswoman. I get to bring them happiness.”</i>");
	//Treated
	if(pc.isTreated() && pc.isBimbo())
	{
		output("\n\n<i>“That makes total sense! Like, if I saw a sad bull on New Texas that hadn’t had his cock sucked in like, a day or something, I’d do everything I could to make him happy!”</i> You wipe some drool from your cheek.");
		output("\n\nDally chuckles, <i>“Sort of like that I guess. I wish I shared your boundless enthusiasm for it, though. It can be trying at times.”</i>");
	}
	//Untreated
	else
	{
		output("\n\n<i>“It must be hard to summon up that kind of affection even when you aren’t necessarily feeling it.”</i>");
		output("\n\nDally chuckles, <i>“It can be, I admit. It’s harder when the client is a jerk than simply ugly. There’s a lot of very sweet girls unfortunate enough to have been cursed with a bland face or narrow hips. Being a bitch? That’s something the girl chooses for herself.”</i>");
	}
	//Merge
	output("\n\nYou nod, silently wondering if you fall into either of those categories.");
	output("\n\nPerhaps sensing your concern, Dally ");
	if(pc.hasHair()) output("ruffles your [pc.hair]");
	else output("strokes the back of your head");
	output(" and explains, <i>“You’re lucky. A star-walker like you is going to have exotic allure no matter what you look like, and you don’t look bad, I assure you.”</i> He pauses thoughtfully. ");
	if(pc.isAss()) output("<i>“Though you could relax a little. You come off a little... severe.”</i>");
	else if(pc.isBimbo()) output("<i>“You’re sweet too. A little too unconcerned I think, but sweet.”</i>");
	else output("<i>“You’re driven too. It’s a good quality.”</i>");

	output("\n\nWell, that’s a relief.");
	output("\n\nDally squeezes you warmly and leans back. <i>“Any other questions?”</i>");
	//Unlocks <i>“Got Job?”</i>
	flags["DALLY_JOB_TALK_UNLOCKED"] = 1;
	processTime(7);
	dallyTalkMenu(talkToDallyAboutHisJoerb);
}

//Talk: Got Job?
//Ask Dally just how he came to be a dancer.
public function gotJob():void
{
	clearOutput();
	showDally();
	output("You give him a friendly squeeze and ask, <i>“How’d you get the job then? It does seem pretty cushy.”</i>");
	output("\n\nDally laughs richly at that. <i>“I didn’t even want this job at first. I was convinced it would be degrading.”</i>");
	output("\n\nYou tilt your head quizzically. <i>“So why’d you take it?”</i>");
	output("\n\n<i>“Because I couldn’t get anything else.”</i> Dally sighs heavily. <i>“You star-walkers wouldn’t really understand.”</i>");
	output("\n\n<i>“Make me understand.”</i> You pat him encouragingly. <i>“");
	if(pc.isNice()) output("I want to.");
	else if(pc.isMischievous()) output("I’m cleverer than you think.");
	else output("I’m paying you for it.");
	output("”</i>");
	output("\n\nDally’s shoulders slump as he gives in. <i>“I-I’ll try. You know how few males there are in our society, right?”</i>");
	output("\n\nYou nod. <i>“One for every nine girls, or so I’m told.”</i>");
	output("\n\n<i>“Exactly. No matter where I went, I was a curiosity, different even in the homology of our hive. My coworkers would inevitably see me as little more than a sex object. My bosses would try to seduce me or fire me to keep their subordinates from competing for my affection. Customers wouldn’t take me serious. They saw me as little more than eye candy. When I walked home at night, I’d have to look over my shoulder to make sure a few girls drunk on mead didn’t try to force themselves on me. It’s happened more than a few times.”</i> His antennae droop.");
	output("\n\nYou squeeze his shoulder.");
	output("\n\nDally continues on, his lopsided smile returning, <i>“It wasn’t that bad, honestly - more an inconvenience than a violation. We don’t view sex the same way as your people. Public orgies aren’t exactly uncommon, and inebriated passersby hooking up is more common than the queens care to admit. Still, it adds up, another annoyance piled on top of hundreds of others. The girls don’t realize how good they have it, being able to be valued for their minds instead of just their bodies.”</i>");
	output("\n\nThat sounds pretty similar to things you’ve heard about a number of planets, New Texas included");
	if(pc.isBimbo()) output(", but that’s like, totally wrong. Whatever");
	output(". <i>“So you decided to work here out of desperation?”</i>");
	output("\n\n<i>“Not at first.”</i> Dally’s antennae droop. <i>“I applied to be one of Irellia’s drones at first. I figured if I had to make my living off my sex, I could at least do it in service of my country. Deeps, that was messier than a honeypot’s tits in there! A few hundreds of us had to line up for inspection - nude - and prove our physical fitness. They don’t want a lame sire, you see.”</i> He snorts. <i>“You’d be surprised how many wound up flunking out at that stage for a variety of reasons. I made it all the way to the last round.”</i>");
	output("\n\nYour eyebrows raise in surprise. <i>“But you didn’t get the job?”</i>");
	output("\n\nThe well-endowed male shakes his head. <i>“No way. The last half-dozen of us got to meet her one-on one so that she could choose her mates.”</i> He bows his head, antennae almost entirely limp. <i>“It didn’t go well. Even though I’m a honeypot, she didn’t choose me.”</i>");
	output("\n\nYou look at him carefully. There’s a tension about him. He’s holding something back. <i>“Why not?”</i>");
	//Tipped Dally a bunch
	if(dallysTips() >= 1000)
	{
		output("\n\n<i>“It’s embarrassing, but...”</i> He sighs <i>“...I guess it won’t hurt to share a little with my best customer.”</i> Dally runs his hand through his hair, collecting his thoughts. <i>“When I met the queen, I was stunned. She was beautiful, more so than any girl I’d met before. I think I felt a little like the women who had hounded me - fascinated by the exotic form before me and giddy with desire. I barely managed a half-dozen words, and I think I spent most of the interview staring at her tits - all four of them.”</i>");
		//Met the queen: 
		if(flags["MET_IRELLIA"] == undefined) output("\n\nYou remember your own meeting. <i>“It’s pretty hard not to.”</i>");
		//Didn’t meet her: 
		else output("\n\nYou find yourself nodding.");
		output("\n\n<i>“And then she told me to mount her. She wanted to see what kind of lover I was. Dally’s loincloth tents at the memory.”</i> He pauses and idly adjusts himself beneath the cloth veil. <i>“I got so excited I went off trying to line it up with her like some kind of hatchling fresh from the thollum!”</i> The blush on his face nearly colors him orange. <i>“She was great about it, and I still got to go down on her. She even told me I had some of the best cum she’d ever tasted, but she still didn’t pick me. I guess she wanted her kids to have a little more stamina.”</i> He hangs his head in shame.");
		output("\n\n");
		if(pc.isNice()) output("You put a comforting hand on his shoulder and ");
		else output("You ");
		output("wait for him to continue.");
		output("\n\n<i>“I guess I blew my load and my chances at the same time.”</i> Dally’s smiles, and some of the tension leaves his face. <i>“I still got to meet a queen face to face. It’s more than most ever get, and on the way out, one of my brothers suggested putting in at this place. I was in a pretty low place, so I didn’t see much point in protesting. It turned out to be one of the best decisions of my life.”</i> He thoughtfully pauses. <i>“And I got a lot of practice at not going off so quickly.”</i>");
		flags["DALLY_IRELLIA_STORY_TOLD"] = 1;
	}
	//Didnt tip much
	else
	{
		output("\n\n<i>“That’s a story I don’t quite feel like reliving right now. Suffice to say, I didn’t get the gig, and while those of us who didn’t get the job wandered out, a few of us decided to try putting in here. I was in a pretty low place, so I didn’t see much point in protesting. It turned out to be one of the best decisions of my life.”</i>");
	}
	//ALL END
	output("\n\nThe male honey ant sighs wistfully and leans back, <i>“But I can’t help but wonder what could have been. Got anything else you wanna talk about?”</i>");
	processTime(8);
	dallyTalkMenu(gotJob);
}

//The War?
//You ask Dally about the war.
public function askDallyWar():void
{
	clearOutput();
	showDally();
	output("His friendly expression wavers. <i>“Can we not talk about it? War is one step removed from politics, and that’s queen business. There’s nothing a little drone like me can do about the war. Might as well just hope for the best and try to enjoy what time we have.”</i> The mostly-nude myr scratches nervously at his neck. <i>“So, was there something else we could talk about?”</i>");
	dallyTalkMenu(askDallyWar);
}

//Family?
//You ask him about his family.
public function talkToDallyAbootHisFamiry():void
{
	clearOutput();
	showDally();
	output("<i>“My what?”</i> Dally looks a little confused.");
	output("\n\nMaybe it didn’t translate that well. <i>“Your family, you know, brothers and sisters, mom and dad?”</i>");
	output("\n\nDally throws his head back and laughs. <i>“Oh man, you really should’ve spent more time reading up on us. We don’t have </i>families<i> like the ones you star-walkers are so fond of.”</i> He gestures across the room. <i>“I probably have thirty sisters in this room alone, not to mention the thousands of others in the city. Technically, Queen Irellia is my sister too, for what little it matters.”</i>");
	output("\n\nYou arch an eyebrow. <i>“");
	if(pc.isNice()) output("What about incest, genetic diversity and all that?");
	else if(pc.isMischievous()) output("So you’re all into the brother-sister love shit, then? How come the kids don’t come out all deformed?");
	else output("Must be pretty rough having a bunch of mutant kids with all the incest.");
	output("”</i>");

	output("\n\n<i>“It’s not like that. Most of us can’t reproduce, so there isn’t any reason to stigmatize relations between family members. Two sisters pairing off with a drone straight out of their Thollum isn’t exactly uncommon.”</i> Dally scratches his chin. <i>“Though you’ve got a point when a queen gets involved. They’ve always taken most of their drones from each other’s broods. It’s always been seen as a way to strengthen unity within a large colony, but perhaps it has other benefits as well.”</i>");

	output("\n\nThe dancer is blushing and rubbing at his neck. <i>“Some of the queens still take relatives as drones from time to time, but they’re a minority.");
	if(flags["DALLY_IRELLIA_STORY_TOLD"] != undefined) output(" I guess I was almost part of that minority, huh? Fuck, if wanting Irellia is wrong, I don’t know if anything can be right.");
	output("”</i> Tugging thoughtfully at his ponytail, he adds, <i>“Maybe that’s how the reds and us got so screwed up. They wound up all red and near-infertile, and we wound up with only a few queens to propagate our race.”</i>");
	output("\n\nYou shrug. <i>“It’d take a scientist to know for sure.”</i>");
	output("\n\nNodding in agreement, Dally adds, <i>“Good thing your governments and corporations seem intent on smothering us in biologists. Barely a day passes without some scientist knocking at my door wanting a sample. I’m tempted to give them a jar of sugar water and see if they have a mental breakdown trying to process it.”</i>");
	output("\n\nThe two of you share a grin at the thought.");
	output("\n\n<i>“Got anything else to talk about, or shall I go titillate the rest of the club with my exciting talks of inbred children?”</i> Dally asks with a sarcastic-looking wink.");
	processTime(6);

	dallyTalkMenu(talkToDallyAbootHisFamiry);
}

//Red Ants?
public function askDallyRedAnts():void
{
	clearOutput();
	showDally();
	output("You look at him slyly. <i>“Ever meet a red ant?”</i>");
	output("\n\nDally’s eyes go wide at the question, and his voice drops to a whisper barely audible above the hard-thumping music. <i>“Are you trying to get me in trouble? That isn’t exactly a popular topic of discussion around here. Aside from being, you know, at war with us, they’re also walking, talking drug-dispensers. Make out with one enough and you’ll be selling out your best friends for just one more kiss. They’re dangerous, aggressive, and most of all, not welcome in Gildenmere, not after their infiltrators took out Jirenkur overnight.”</i>");
	output("\n\nLooking him up and down, you realize he’s flushing and trembling. Most telling of all, his loincloth has visibly tented since you posed the question. <i>“You didn’t answer my question...”</i>");
	output("\n\nDally sighs and pointedly tries to ignore the wet patch forming on the front of the white-hued crotch-drape. <i>“Yes, I knew a red ant girl, back when there was trading between the cities. She was a real fire-cracker, that one. I didn’t even want her at first, but she found ways to attract my interest, and after the first kiss... Well, after the first kiss I couldn’t get enough of her - her scent, her taste, even just being around her seemed a narcotic high.”</i>");
	output("\n\nHe shifts so that the jutting rod isn’t pointed quite so squarely at you.");
	if(pc.isBimbo()) output(" Phooey!");
	output(" <i>“Jessa had me jumping to obey her and literally cumming on command. I was a real quick shot then, and she only made it worse.”</i> Dally shivers and blushes, trapped somewhere between excitement and shame. <i>“I thought I was in love at the time. I had never felt anything like that in my life before. She had me convinced that we could have a wonderful life with her. All I had to do was move back to her home in the Federation with her.”</i>");
	output("\n\n<i>“You didn’t, obviously.”</i>");
	output("\n\nDally shakes his head sadly, his antennae limp and his cock soon to join them. <i>“No, I didn’t. I was supposed to meet her the next day to leave, but I rushed back to her place, convinced I wanted to spend the night with her. She wasn’t alone.”</i>");
	output("\n\nOh. Poor guy.");
	output("\n\n<i>“Jessa had another male on the bed, covered in kisses, and she was telling him things, the exact same things she told me - that he was special and she adored him like none other. She filled him with so much nonsense that he seemed barely conscious of. Jessa was going to have him come on another transport.”</i> Dally visibly winces. Though no longer fresh, he can’t ignore that deep of a hurt. <i>“I hid while the other guy left, and she called up another guy. I don’t know how many she had on the hook, but I had had enough.”</i>");
	output("\n\n<i>“What’d you do?”</i> you ask.");
	output("\n\nDally straightens and looks you firmly in the eye. <i>“I did what any honorable drone would. I reported her activities to the security council anonymously and went through two weeks of agonizing withdrawal.”</i> His voice quiets, undercut by steely determination. <i>“I nearly jumped a red I saw on the street. I needed a fix that bad, but I beat it. I beat it, star-walker, and I’d do it again and again.”</i>");
	output("\n\nYou tilt your head. <i>“What happened to her?”</i>");
	output("\n\n<i>“She got picked up on her way out of the city and interrogated. The official story is that she was miffed about her inability to get males within the Federation and set up her own private slaving operation here to capture new lovers.”</i> Dally shakes his head. <i>“It wouldn’t surprise me if the whole thing was part of a government scheme, though. They’ll do anything for an edge, and we weren’t even at war back then.”</i>");
	output("\n\n<i>“Wow.”</i>");
	output("\n\nDally nods, a smile returning to his features. His antennae perk up. <i>“You know what the funniest part of it all was? She wouldn’t touch my nectar. Not once. No matter how intimate we got or how much I reassured her, she wouldn’t take a single drink. I guess it goes to show you that as much as I trusted her, she never really trusted me. I wonder if the reds think our honey is as villainous as their spit. That might explain it.”</i>");
	output("\n\nYou nod in agreement.");
	//Not sure on if the talk where that comes up has a flag
	if(flags["MET_NEHZARA"] != undefined) output(" Nehzara seemed to think similarly.");

	output("\n\nDally leans back against the pole. <i>“I haven’t had any dealing with them since. The prohibition on their spit and their presence in the city was a welcome change as far as I’m concerned.”</i> He looks at the ants lining up alongside the stage. <i>“Got something else to talk about or shall I tend to the backlog?”</i>");
	processTime(16);
	dallyTalkMenu(askDallyRedAnts);
}

//Favor
public function getAFavorFromDally():void
{
	clearOutput();
	showDally();
	//1st Time
	if(flags["DALLY_FAVORS_OFFERED"] == undefined)
	{
		output("You put on your winningest smile. <i>“You mentioned returning a favor, or something along those lines, after one of your dances. I thought I’d cash it in.”</i>");
		output("\n\n<i>“Did you now?”</i> Dally appears genuinely pleased. His antennae wiggle. <i>“I’d be paying you back here, in front of everybody. Think you can climb up on the stage for a little fun?”</i>");
		flags["DALLY_FAVORS_OFFERED"] = 1;
	}
	//Havent gotten paid back yet
	else if(flags["DALLY_FAVORS"] == undefined)
	{
		output("You grin and say, <i>“So how about that favor?”</i>");
		output("\n\nDally asks, <i>“Did you change your mind about getting it on the stage?”</i> He winks outlandishly.");
	}//Repeat
	else
	{
		output("You tilt your head and playfully ask, <i>“Interested in putting on another two-person show?”</i>");
		output("\n\nDally’s antennae twitch. <i>“Oh, are you? Well if you’re sure, we can put on another show.”</i>");
	}
	//All
	output("\n\nDo you put on a show with Dally?");
	//[Get Sucked][Get Licked] [Back]
	processTime(1);
	clearMenu();
	if(pc.hasCock()) addButton(0,"Get Sucked",dallySucksYouOff);
	else addDisabledButton(0,"Get Sucked","Get Sucked","You need a penis to get sucked off by Dally.");
	if(pc.hasVagina()) addButton(1,"Get Licked",getDallyLicked);
	else addDisabledButton(1,"Get Licked","Get Licked","You need a vagina for a proper licking.");
	addButton(14,"Back",dallyBackFromFavorMenu);
}

//[Back]
public function dallyBackFromFavorMenu():void
{
	clearOutput();
	showDally();
	output("Dally chuckles. <i>“Maybe next time, then. Not everyone has the balls to be up here, after all.”</i> He coyly flashes his. <i>“Want a dance?”</i>");
	//Dally menu
	dallyMenu();
}

public function dallyFavorsBump():void
{
	if(flags["DALLY_FAVORS"] == undefined) flags["DALLY_FAVORS"] = 0;
	flags["DALLY_FAVORS"]++;
}

//Dally LIIIIICK
public function getDallyLicked():void
{
	clearOutput();
	showDally();
	var x:int = rand(pc.totalVaginas());
	output("You vault up onto the stage as an answer");
	if(!pc.isNude()) output(", shedding your [pc.gear] faster than an Ikainan whore");
	else output(", rocking your [pc.hips] back and forth");
	output(". <i>“I think I can handle a little stage time.”</i>");
	if(pc.exhibitionism() < 33) output(" You try your best not to show just how nervous you’re feeling.");

	output("\n\n<i>“Is that so?”</i> Dally makes a show of dropping to his knees, grabbing the stripper pole and slowly sliding to the stage floor into a sensuous display. <i>“");
	if(pc.legCount == 1) output("Stones, it’s strange to see one smack in the middle instead of you instead of on an abdomen like a normal girl’s.");
	else if(pc.isTaur())
	{
		output("Stones, it’s not quite back on an abdomen, but it is behind your legs - a pair ");
		if(pc.legCount >= 6) output("or two ");
		output("of them, anyway. Guess we aren’t that different after all.");
	}
	else output("Stones, it’s strange to see one there between your legs instead of on an abdomen like a normal girl’s.");
	output("”</i> He flashes a white-toothed smile your way. <i>“Not that I mind trying something new.”</i>");

	output("\n\n");
	if(pc.legCount != 2) output("You shift");
	else output("You spread your [pc.legs]");
	output(" to ");
	if(!pc.isTaur() && pc.legCount != 2) output("better present your [pc.vaginas] to the ant-boy.");
	else output("to better allow the ant-boy to crawl between them");
	output(". You’re uncomfortably aware of your own wetness, exposed as you are in the center of the stage. Dally’s so close to you too, and getting closer by the second. He licks his golden lips and openly ogles [pc.oneVagina]. You can almost feel his stare. It sends shivers of delight and anxiety up your spine");
	if(pc.hasClit())
	{
		output(", and makes you entirely too aware of how your [pc.clits] feel");
		if(pc.totalClits() == 1) output("s");
	}
	else output(" and");
	output(" between your lips. Your [pc.nipples]");

	if(pc.hasLipples()) output(" practically drool with excitement, their lips parting ever-so-slightly.");
	else if(pc.hasFuckableNipples()) output(" grow so moist that your areolae shine with wetness. You could probably shove a few fingers inside without an ounce of resistance, just like down below.");
	else output(" perk up like little turkey timers, declaring you fit for consumption.");

	output("\n\n<i>“Ready for this?”</i> Dally waggles his tongue at you. It’s long and... thick, deliciously so.");
	output("\n\nYou shudder and nod, biting your lip.");
	output("\n\nThe well-endowed male flashes his teeth at you once more and wiggles closer to your [pc.vaginas], pausing once he’s an inch or two away to gently blow on it. His breath is hotter than you would’ve imagined. You swear you can feel yourself lubricating, easing hot droplets of [pc.girlCum] into your dewy slit");
	if(pc.totalVaginas() > 1) output("s");
	output(" one after another.");
	if(pc.wettestVaginalWetness() >= 3) 
	{
		output(" Thankfully, the loud club music drowns out the sounds of luridly dripping snatch");
		if(pc.totalVaginas() > 1) output("es");
		output(".");
	}
	output(" You shift to put yourself closer to the source of your arousal, but he edges away at the last minute");
	if(pc.hasClit()) output(", blowing against [pc.oneClit]");
	output(".");
	output("\n\nYou whimper, earning you a cheer from the assembled female myr. Most of them, you note, have placed themselves so that their abdomens are upraised and exposed to the myr behind them, and more than one inquisitive finger has slipped into its neighbor’s nectar-scented pocket. It’s not fair that they get more stimulation than you! You look back at Dally imploringly, batting your eyelashes for effect.");
	output("\n\nThe impertinent stripper doesn’t even bother to look at your face. He’s too busy nosing around your [pc.vagina " + x + "] for that, quite literally so. You gasp at the sudden intrusion and buck against him. He grabs you by the [pc.butt] to steady you and shifts, dragging his face past ");
	if(pc.hasClit())
	{
		if(pc.totalClits() > 1) output("a");
		else output("your");
		output(" clit");
	}
	else output("your mound");
	output(" to properly align his lips to yours. His kiss radiates electric tingles through your [pc.vagina " + x + "], making you hungry for more - hungry for his tongue inside you. You look enviously down at his loincloth-tenting boner. You should’ve requested that!");
	output("\n\nThrowing your head back, you moan at the feeling of Dally’s kissing growing more eager. His tongue plunges inside of you, french-kissing your pussy, rhythmically exploring the interior. That thick muscle presses here and there, searching with snake-like wriggles. Finally, it presses against something inside you, and you see stars. Dimly, you hear your own voice lilting in an ecstatic scream, but the raw volume of tactile bliss flooding from your drenched cunt overwhelms all other sensory input.");
	output("\n\n");
	if(pc.isTaur()) output("If it weren’t for your inhuman instincts, you’d have collapsed. As it is, your torso is leaning dangerously, back arched to better present your [pc.chest], ");
	else 
	{
		output("You collapse into a twitching heap, ");
	}
	output("but your oral accomplice never abandons his duty, keeping his lips sealed to yours, brushing his tongue back and forth");
	if(pc.hasClit()) output(" against [pc.oneClit]");
	output(" until your ");
	if(pc.isSquirter()) output("spraying juices have thoroughly soaked both his face and the stage. Rivulets of the stuff drip from his shoulders.");
	else output("juices dribble down his cheeks and fill his mouth with your flavor.");
	output(" He drinks from you like a thirsty man at an oasis, unable to conceive of anything but the [pc.girlCumFlavor] taste on his tongue.");
	
	//You are a taur, god this gets boring!
	if(pc.isTaur())
	{
		output("\n\nYou take a half-step back to better bury his face in your [pc.vagina " + x + "], wiggling your rear for that extra bit of friction. He keeps right on licking, of course. The cunt-hungry ant acts like he’s in love with your rear-mounted twat, so hungry for something new that the opportunity to eat out an offworlder has him going wild. His cock has transformed his loincloth into a crudely-pitched, pre-soaked tent. Girls in the crowd are screaming out, offering to suck it, but he doesn’t answer.");
		output("\n\nThen, with sudden shift, he");
		if(pc.hasClit()) output(" suckles [pc.oneClit]");
		else output(" nibbles your libia");
		output(" directly, fluttering his tongue along it, bombarding you with mind-blanking bliss.");
		output("\n\nYou cream yourself all over his face and scream yourself raw at the same time. Dally’s face is drenched with [pc.girlCum]");
		if(pc.isSquirter()) output(", so much so that it cascades down his shoulders and puddles on the floor around him, scenting his whole body with your pussy");
		output(". He keeps stimulating you for what feels like hours, but it must only be a few seconds at the most. Your [pc.legs] shake unsteadily, and the tongue-happy stripper wisely evacuates, pulling a way a second before you drop onto the stage, twisting in climax.");
		output("\n\nWhen you come to, you’re being lowered back to the ground by a group of gently cooing girls");
		if(!pc.isNude()) output(" along with your gear");
		output(". One of them tells you how lucky you were to have gotten so much of Dally’s attention. Speaking of Dally, you look around for him - he’s moved on to another part of the stage.");
		output("\n\nThe male myr calls back, <i>“Let me know if you’d like to cash in another favor!”</i>");
	}
	//Not taur - jerk him off. BROJOB
	else
	{
		showBust("DALLY_NUDE");
		output("\n\nIn between waves of ecstasy, you manage to take note of something else: Dally’s need. The pearlescent fabric obscuring his cock has fallen away to reveal his rigid amber length, drooling honey-tinted pre-cum as it wildly throbs. He’s making you feel so good and not getting anything in return. Maybe it’s the pleasure swimming through your head, but you reach back and take hold of him, wanting him to feel every bit as good as you.");
		output("\n\nDally’s tongue inadvertently thrusts deeply into you in surprise, momentarily losing focus when your fingers close around his girthy, honey-scented prick, but he’s back to form a second later, stirring your honeypot like a pro. You inexpertly jack him off through the pleasure, finding it difficult to control your fingers, even for an action as simple as this. He drizzles so much pre-cum that your pumping transforms into noisily squelching jacking, and you feel his moans thundering through your [pc.vaginas].");
		if(pc.totalVaginas() > 1) output(" He’s licking them at random, changing targets whenever he pauses to take a breath.");
		output("\n\nYou’re aware of cheers and applause but little else. Too much of your mind is focused on interpersonal bliss - the fervent wiggling inside of you and the firmness of Dally’s lust in your hand. You milk him until you feel honey-tinged cum spilling over your fingers in a perverse rain, giving you a spermy-sweet glove almost to the elbow. [pc.EachVagina] spasms to the realization, wringing Dally’s tongue and your nerves raw.");
		output("\n\nSlumping back, you fall apart, Dally in a puddle of his own cum and you in yours. Your audience cheers, at least the parts of it that aren’t vigorously frigging each other’s slits or pawing at exposed breasts.");
		output("\n\n<i>“Fuuuuck,”</i> he exhales. <i>“You didn’t have to...”</i>");
		output("\n\nYou struggle to climb off the stage, more than a little woozy from repeated oral orgasms. <i>“I wanted to.”</i>");
		output("\n\nDally nods and helps you down, his own shaky. <i>“Thanks I guess, and if you ever need to cash in another favor, you know where to find me, don’t you, honeypot?”</i> He licks his lips.");
		output("\n\nYou assure him that you do and gather your things, trying to ignore stray caresses from the crowd.");
	}
	processTime(22);
	pc.orgasm();
	pc.orgasm();
	dallyFavorsBump();
	pc.exhibitionism(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Dally Suck
public function dallySucksYouOff():void
{
	clearOutput();
	showDally(true);
	var x:int = pc.biggestCockIndex();
	output("You vault up onto the stage as an answer and ");
	if(!pc.isNude()) output("shed your [pc.gear], kicking out of sight backstage.");
	else output("shake your hips for the assembled ladies, making your [pc.cocks] bounce licentiously.");
	output(" <i>“You ");
	if(pc.cumType == GLOBAL.FLUID_TYPE_HONEY) output("aren’t the only one packing a dickful of honey.");
	else output("aren’t the only one needing a good suck.");
	output("”</i>");
	output("\n\n<i>“Is that so?”</i> Dally makes a show of dropping to his knees, grabbing the stripper pole and slowly sliding to the stage floor into a sensuous display. <i>“Stones, it’s strange to look at someone else’s up close.”</i> He flashes a white-toothed smile your way. <i>“Not saying I mind, just that most of my practice has been... self-fulfilling.”</i>");
	output("\n\nYou grab hold");
	if(pc.cockTotal() > 1) output(" of your biggest cock");
	else output(" of your cock");
	output(" and waggle it back and forth in front of him. <i>“");
	if(pc.isNice()) output("Go on, then. There’s no better way to get practice, right?");
	else if(pc.isMischievous()) output("Go ahead, it’s more of a spitter than a biter.");
	else 
	{
		output("Never heard of a stripper afraid of a lil’ dick.");
		if(pc.biggestCockVolume() >= 500) output(" Or should I say a lot?");
	}
	output("”</i> A fresh surge of blood stiffens your [pc.cocks] in unspoken agreement." + pc.mf(""," You try not to giggle too much."));
	output("\n\nDally shakes his head. <i>“It’s not like that, I was just enjoying the view.");
	if(pc.biggestCockLength() < 11) output(" Even a little guy like this looks cute in his own way.");
	else if(pc.biggestCockLength() < 20) output(" It’s not every day I get to meet my match.");
	else output(" It’s not every day I bump into someone that dwarfs me. They must breed ‘em big out there in the void.");
	output("”</i> He licks his golden lips, making them shine like jewelry under the garish stage lights, and bends down to plant a soft kiss upon your [pc.cockHeadBiggest]. He watches you out of the corner of his eye, waiting for a reaction.");
	output("\n\nYour sharp intake of breath startles even you. It feels good, and his tongue is swirling obscenely between his barely-parted dick-suckers, roving back and forth across your sealed urethra until the sensation is nearly overwhelming. The ant-like stripper pulls back with a smile, a single strand of spit connecting his lower lip to your tip. He breaks it with a finger, then sucks on it knowingly.");
	output("\n\nWhy did he have to stop? You look on with a mix of impatience and hunger. They’re so intermingled that it’s impossible to tell one from the other. A " + pc.mf("growl","whine") + " crawls up the back of your throat, but you stifle it with a gulp that sounds far too noisy to your ears.");
	output("\n\nMoving with cat-like grace, Dally turns you to face the side, presenting a profile view of you");
	if(pc.biggestTitSize() >= 3) output(", your boobs,");
	output(" and your dick");
	if(pc.cockTotal() > 1) output("s");
	output(" for the assembling audience. You’d appreciate his showmanship a little more if he hadn’t got your motor running first, but then your [pc.cockBiggest] wouldn’t be so perfectly rigid and visibly pulsing, would it? You lean back to give the gold myr ladies a better view, and try your best to patiently await your oral service.");
	output("\n\nDally leans low once more, but rather than immediately wrapping his lips around your shaft, he grabs you in his chitinous fingertips, his mouth hovered an inch above. His hot breath washes over you like feathery tickles, setting your eager nerves alight with near-phantom sensation. His fingers give you a gentle squeeze, and with a wink at the crowd, he extends his tongue and begins to lick you, starting at the [pc.cockHeadBiggest] and going all the way down to your [pc.sheathBiggest].");
	if(pc.hasSheath(pc.biggestCockIndex())) output(" Once there, he slithers his lewd muscle into the musky scabbard and licks at the sensitive, unprepared parts of your cock.");

	output("\n\nYou let your eyes drift closed and moan");
	if(pc.isTreated() || pc.exhibitionism() >= 66) output(" whorishly for the crowd. Might as well give the people a show, and if it gets you off that much harder, so much the better!");
	else if(pc.exhibitionism() >= 33) output(" confidently. The crowd doesn’t really bother you; if anything, having so many adoring eyes locked on your shaft has your heart beating faster.");
	else output(" nervously, too turned on by Dally’s service not to and yet still nervous in front of a crowd. Jumping on stage and displaying yourself is one thing; realizing that there’s three dozen sets of eyes watching your every move is another.");
	output(" When that wondrous tongue reverses direction and slides up the sensitive underside of your shaft, you forget their stares entirely, letting your eyes drift closed to fully focus your attentions on the divine sensations radiating from your rod.");
	output("\n\n<i>“You like that?”</i> Dally asks once he launches past the [pc.cockHeadBiggest].");
	output("\n\nYou bite your [pc.lip] and nod. He’s started rubbing his thumb back and forth across the wet patch his talented tongue left behind.");
	output("\n\n<i>“Then you’ll love this.”</i> He dives down without another word, his mouth wide-open.");

	//OHSHIT FEN CANT HELP BUT HAVE SIZE VARIANTS :/
	//Dally can fit that wangasaurus rex in his mouth.
	if(pc.cocks[pc.biggestCockIndex()].thickness() <= 5)
	{
		output("\n\nThe monumental difference between hanging free and being imprisoned in a warm, wet mouth rocks you to your core. An ecstatic whimper escapes your throat. The assembled myr ladies love it, catcalling for more. Ever-obliging, Dally slides lower on your length, taking ");
		if(pc.biggestCockLength() <= 8) output("the entire thing");
		else output("the first seven inches into his mouth");
		output(". Any further and you’d be sliding directly into his throat. Inky eyes flick up at you, but you’re numb to the world, entirely subsumed in a world of your own pleasure.");
		output("\n\nOnce comfortable with ");
		if(pc.biggestCockLength() <= 8) output("the portion he’s chosen to devour");
		else output("holding you in his mouth");
		output(", the magnificent myr puts his tongue to work, sliding it back and forth along the underside, sometimes dragging it in short back-and-forth strokes. His fingertips ");
		if(pc.biggestCockLength() <= 8) output("gently stroke at your taint, wringing bubbles of pleasure from the rare-stimulated flesh with ease.");
		else output("wrap around the exposed portion of your [pc.cockBiggest] and tenderly stroke it, wringing bubbles of pleasure from the otherwise ignored flesh");
		output(". He’s so deft, so wonderfully skilled at this. He must have more practice than he lets on with how comfortably his lips seem sealed around your [pc.cockHeadBiggest].");
		output("\n\nDally’s cheeks hollow, bringing with them a welcome suction. Your [pc.cockBiggest] surges past what you thought was your maximum tumescence; you’re so hard and ready that you feel like you could burst at any moment. Your [pc.hips] jerk against Dally’s gold-glossed lips, but he holds you in place with firm pressure from one of his palms, showing you in no uncertain terms that you’ll need to wait if you want to continue to feel this good.");
		output("\n\nOf course you do! You moan whorishly and lean further back. A hand from the crowd caresses one side of your chest, making you jerk in surprise. A noisy slurp and accompanying bolt of delirious desire calms your worries before you can object, and didn’t you agree to it anyway? Most of the strippers are getting groped by someone. You chose to climb up here and present yourself. Another hand finds your [pc.nipple] and gently plays across it");
		if(pc.hasFuckableNipples()) output(", suddenly changing attack vector when a finger sinks inside the all-too fuckable orifice");
		else if(pc.hasDickNipples()) output(", suddenly drawing back when its actions inadvertently reveal your [pc.dickNipples]. A braver soul tentatively touches them with two of her hands, curious at first and then increasingly eager. In no time at all, your dick-topped teats are being vigorously jacked off");
		output(".");
		output("\n\nDally plays your [pc.cockBiggest] like Myrellion’s greatest maestro, the unskilled but eager attentions to your ");
		if(pc.hasDickNipples()) output("[pc.dickNipples]");
		else output("[pc.nipples]");
		output(" providing an ecstatically pulsing harmony that hammers through your body on your rapid heartbeats. Sliding back and forth to that same tempo, Dally’s mouth maintains its tight seal, coaxing drop after drop of pre-cum to spill into his throat. His occasional gulps are the only things that interrupt the constant wet-sounding slurps and cheering cat-calls.");
		output("\n\n<i>“I’m c-close!”</i> you stammer, trying to warn him before you go off in his mouth like a malfunctioning nova bomb.");
		//Ballz!
		if(pc.balls > 0)
		{
			output("\n\nYour warning doesn’t seem to hold any weight to the prick-polishing stripper. He keeps right on sucking. Fingers wrap around your [pc.sack] a moment later, gently squeezing and kneading at your [pc.balls] as if he could coax the [pc.cumNoun] out with pressure alone. There’s a fine line between pleasure and pain, and Dally rides it expertly, fondling you with chitin-hardened fingers until their tips are slick with your ball sweat and gliding effortlessly across your twitching sack.");
		}
		//No nuts!
		else
		{
			output("\n\nYour warning falls on deaf ears. The prick-polishing stripper doesn’t show any signs of slowing or stopping, and his fingers get even more exploratory, stroking softly around your [pc.sheathBiggest] and firmly rubbing at your taint as if he could milk the [pc.cumNoun] from you by pressure alone. He keeps at it until his chitin-hardened fingers are slick with cocksweat and effortless gliding against your trembling flesh.");
		}
		//Merge nuts/nonutz
		output("\n\nIt’s too much. You start to scream <i>“cumming”</i> but all that comes out is low moan of pleasure, loud enough to be heard over your audience. Your [pc.cockHeadBiggest] swells in the back of his mouth");
		if(pc.hasCockFlag(GLOBAL.FLAG_FLARED,x)) output(", bloated so wide that it threatens to seal off his throat");
		output(". ");
		if(pc.hasKnot(x)) 
		{
			output("On the other end, your [pc.knotBiggest] balloons up to its full size");
			if(pc.cocks[x].thickness() * pc.cocks[x].knotMultiplier < 5) output(", nearly locking you inside the ant-slut’s greedy maw before he manages to pull back and gasp");
			else output(", too big around for the ant-slut’s fingers to properly encompass it. All he can do is stroke and polish your swollen knot, coaxing it to feed him your [pc.cum]");
			output(". ");
		}
		output("Your abdominals clench in reflexive bliss a moment before [pc.eachCock] throbs");
		if(pc.cumQ() < 4) output(", spewing a few weak drops of [pc.cum]. Maybe you should take a break before your next blowjob.");
		else if(pc.cumQ() < 100) 
		{
			output(", launching wet ropes into Dally’s [pc.cum]-vacuum of a mouth");
			if(pc.cumQ() >= 50 || pc.cockTotal() > 1) output(" and across his handsome face");
			output(".");
		}
		else if(pc.cumQ() <= 250)
		{
			output(", spraying thick ropes directly into Dally’s [pc.cum]-sucking mouth");
			if(pc.cockTotal() > 1) output(" and painting him in a [pc.cumColor] mask");
			output(". His throat bobs, noisily working to swallow it all while the crowd chants, <i>“Chug! Chug! Chug!”</i>");
		}
		else 
		{
			output(", hosing geysers of [pc.cum] directly into Dally’s spunk-receptacle");
			if(pc.cockTotal() > 1) output(" and across his face and hair, completely soaking in him in [pc.cumColor]");
			output(". He valiantly tries to swallow it, but even with his cheeks bulging and his throat noisily swallowing, beads of your [pc.cumNoun] roll out of the corners of his mouth. Not even the audience’s cheers of <i>“Chug! Chug! Chug!”</i> can help him keep up with the flow.");
			if(pc.cumQ() >= 1500) output(" He pulls back, dazed, gasping for breath while you continue to vent across his near-nude form, splattering [pc.cum] on smooth skin and gleaming carapace alike. So much hangs from his antennae that they’re nearly plastered to his forehead, droopy and limp.");
		}
		output("\n\nYou thrust your hips, managing to squirt a few last droplets, and finally sag back, spent, your [pc.cocks] twitching and ever-so-slowly wilting");
		if(pc.libido() >= 75) output(", though you doubt they’ll ever go completely soft");
		output(". Dally licks his lips appreciatively");
		if(pc.cumQ() > 250 || (pc.cumQ() >= 50 && pc.cockTotal() > 1)) output(" and does his best to clean up");
		output(" while panties and bras rain down around you. More than one pair of fingers are lodged in a dripping myr-twat, and a quartet of girls have found a male in the back to polish with their tongues.");
		output("\n\n<i>“How’s that?”</i> Dally asks with a cocksure grin");
		if(pc.cumQ() >= 1500 || (pc.cumQ() >= 50 && pc.cockTotal() > 1)) output(", steadfastly ignoring the caked-on [pc.cumNoun] that drips from his body");
		output(".");

		output("\n\nYou stumble trying to climb off the stage, but the friendly girls catch you, guiding you back into your seat with only a few squeezes to your [pc.cocks] and one kiss against the nape of your neck. <i>“Pretty damned good,”</i> you admit with a smile.");
		output("\n\nBowing, Dally gives you a wave and wink, <i>“Of course it was. Let me know if you ever need me to help out with those favors again, okay? I have a feeling it’ll do my gem pouch wonders.”</i> He staggers off a little unsteadily");
		if(pc.cumQ() >= 1500 || (pc.cumQ() >= 50 && pc.cockTotal() > 1)) output(", mopping [pc.cum] from his cheek with a drenched bra");
		output(".");
	}
	//2Big4U
	else
	{
		output("\n\nHis lips spread obscenely, but he just can’t manage to wrap them around the obscenely thick sausage you’ve provided him with. If he was some sort of snake-man that could unhinge his jaw, maybe, but you’re stuck with an ant who can’t quite manage to wrap his twin-sized cock-pillows around your king-sized dong. He slobbers over you admirably before giving up on giving you a proper suck-off and getting a little more aggressive with his hands.");
		output("\n\nWith one palm pressing on either side of anaconda and his thumbs meeting at the middle, he begins to pump you, never stopping his oral assault. You rock your hips gently against him, unable to prevent millions of years of reproductive evolution from asserting themselves, reveling in his spit-lubed stroking. The weight of your [pc.cockBiggest] helps to keep you from pushing too forcefully. It’s a wonder you can walk at all.");
		output("\n\nDally’s eyes shine with a different kind of wonder. You don’t think he’s ever had the pleasure of handling such a titanic rod before, let alone one big enough for him to stuff his entire tongue into the urethra with ease. Gasping from the shock of his sudden invasion, you writhe on the stage. You’ve been stretched wider by cumshots, but cumshots aren’t part of another person, rubbing determinedly around inside you in search of the most exciting spots. He has all " + Math.round(pc.biggestCockLength()) + " inches pulsating and twitching, squeezing droplets of pre-cum around his tongue.");
		//BALLS!
		if(pc.balls > 0)
		{
			output("\n\nOne of the exhibitionist’s hands winds down to your [pc.sack] to caress your [pc.balls] while the other continues its efforts to rhythmically milk your [pc.cockBiggest]. His touch is gentle, and the hard, smooth surface of his chitinous fingertips is both alien and exquisite. He’s able to slide them around and easily caress ");
			if(pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output("your scaled sack, almost without friction.");
			else output("using only sweat for lubricant.");
			if(pc.balls > 1) output(" Rolling your cum-factories back and forth between his fingers, he gives them a gentle squeeze of encouragement.");
			else output(" Gently rolling your single cum-factory back and forth across his fingers, he gives it an affectionate squeeze.");
			output(" You swear you can feel a squirt of extra pre shoot into his mouth.");
		}
		//merge back in after balls
		output("\n\n<i>“Delicious,”</i> he comments while stopping to lick his lips clean. He leans in closer, pressing your titanic member against his chest. <i>“Absolutely delicious. More.”</i> He vigorously pumps your shaft while lapping at the underside of your [pc.cockHeadBiggest]. You can feel his heart hammering through your cock, a staccato thump-thump-thump of affection that even now causes his own member to rise against yours. His honey-seeping head snakes higher by the moment.");
		output("\n\nYou throw your head back and cry out in ecstasy, twisting your hips back forth to better rub against him and his own plus-sized tumescence. His fingertips dance across your veiny length, tickling your nerves until they’re practically sparking with delight, overloading the connections to the pleasure-centers of your brain with white-hot lust. You barely manage to warn, <i>“Gonna cum!”</i>");
		output("\n\nHot breath against your [pc.cockHeadBiggest] answers, <i>“Go on; do it!”</i>");
		output("\n\nAs if you were capable of doing anything else. Your eyes flutter partway open, though only to halfway back from the waves of bliss. Magma-hot pulses shiver your [pc.cockBiggest] from stern to stem, ");
		if(pc.cumQ() < 10) output("expelling a few meager droplets of [pc.cum]. You should probably give yourself a chance to recharge before committing yourself to public blowjob shows...");
		else
		{
			output("launching [pc.cumVisc] [pc.cumNoun] globules against Dally’s pristine features, burying them under a mask of [pc.cumColor]. He isn’t shocked in the slightest by this development, even angling himself to ensure that every part of him gets an even coat.");
			if(pc.cumQ() < 100) output(" A disappointed look spreads over his features when you go dry. He was about to bend down and catch the next spurt in his mouth.");
			else output(" Abruptly, he plants his open mouth over your sperm-spilling urethra, noisily gurping down as much as he can handle.");
			if(pc.cumQ() >= 1000) output(" Dally’s quite a trooper, but no mortal man or woman could keep up with the torrential flow from your [pc.cockBiggest]. He pulls off with cheeks so bulged that he may as well be part-squirrel.");
		}
		output("\n\nAn almost deafening cheer reverberates through the crowded club. A pair of panties lands on stage next to Dally. A bra flops onto your head. Several of the girls are openly fondling each other, and one lucky male is getting vigorously licked by a half-dozen honies.");
		output("\n\nDally tosses you his loincloth. <i>“I-err... got some honey on you.”</i> He blushes sheepishly");
		if(pc.cumQ() >= 10) output(" and uses the rain of lingerie to wipe most of your [pc.cum] from his face");
		output(". <i>“You can toss it when you’re done, I’ve got plenty.”</i>");
		output("\n\nAfter you wipe the sticky nectar from your [pc.cockBiggest], Dally helps you off the stage, even absorbing most of the attention from the crowd so that you can re-dress. He calls back from amidst the sea of groping hands, <i>“Just let me know if you need any more favors!”</i>");
		output("\n\nYou will.");
	}
	dallyFavorsBump();
	processTime(20);
	pc.exhibitionism(2);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
