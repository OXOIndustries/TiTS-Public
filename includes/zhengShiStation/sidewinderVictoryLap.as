import classes.ShittyShips.NPCShips.TeyaalsMSXI;
//Don’t Be Upsetti, Have a Lasetti
//By Savin

//TEYAAL_DRIFTED		- Tracks if you left her drift in the final encounter, which likely means dead via gas leak.
//TEYAAL_SHIPFITES		- Tracks the number of shipfites you've had with Teyaal (which means your victories, really)

//Play when the PC first brings the Sidewinder back to Zheng Shi, without having earned the respect of the captains.
public function zhengShiReturnDoof():void
{
	if(flags["TEYAAL_SHIPFITES"] == undefined)
	{
		clearOutput();
		author("Savin");
		output("It almost feels like running a victory lap, bringing the [pc.ship] back around to its home berth at Zheng Shi. You stole it fair and square, though - surely if anybody can appreciate that, it’s a bunch of raggedy pirates?");
		output("\n\n...or maybe not. As you’re breaking through the asteroid cloud surrounding the station and angling in for final approach, your emergency radio crackles to life and a shrill, angry voice screams over it, <i>“You " + (pc.mf("bitch","bastard")) + "! That’s my baby you’ve stolen! Bring her back right now!”</i>");
		//Olympia on crew:
		if(olympiaIsCrew()) 
		{
			output("\n\nThe radio cuts, and then you hear Olympia coming over it from down in Engineering. <i>“[pc.HeShe] didn’t steal me, Doctor Teyaal. I left. And I have no intention of coming back.”</i>");
			output("\n\n<i>“O-Olympia? Bah! I’m not talking about you, you stupid sexbot, [pc.heShe] stole the </i>Sidewinder<i>!”</i>");
		}
		else
		{
			output("\n\nThat... that sounds like Dr. Teyaal.");
		}
		output(" Of course the ship’s chief designer would find a way to be a thorn in your side once again. You grab the horn and tell her that if she wants her damn ship back, she’s going to have to come and take it.");
		output("\n\n<i>“Gladly!”</i>");
		output("\n\nYou see another ship coming around from the far side of the asteroid, a sleek purple job with huge engines roaring behind it. The suped-up freighter comes barrel down at you, and your sensors quickly report several weapon batteries coming online all over it. Guess she’s not kidding!");
		output("\n\nYou hop into the captain’s chair" + (pc.isBimbo() ? ", activate the hardlight dildo to help keep you focused,":"") + " and bring your defenses online. Time for a fight!");
	}
	//Second Encounter
	else if(flags["TEYAAL_SHIPFITES"] == 1)
	{
		output("This time, when you bring the [pc.ship] back around to Zheng Shi, you’re ready for Teyaal’s ambush. Her ship comes around from the dark side of an asteroid this time, weapons and shields up - and so are yours.");
		output("\n\nYour radio crackles, and the doctor’s voice comes over. <i>“The first show was impressive, but you won’t be so lucky this time. I designed that ship. I know it’s every weakness!”</i>");
		output("\n\n<i>“What weakness?”</i> you laugh back.");
		output("\n\nSilence follows, followed by the thunder of weapons.");
	}
	//Third & Final Encounter
	else
	{
		output("For the third time, Teyaal’s ship come screaming out of the shadows as you approach Zheng Shi. Her ship’s clearly still damaged, held together by duct tape and hope, but she’s coming at you with weapons live and ready.");
		output("\n\n<i>“YOU " + (pc.mf("SON OF A ","")) + "BITCH!”</i> she screams over the radio. <i>“I won’t let some random space jockey steal my greatest creation!”</i>");
		output("\n\nOf course, it’s time for a fight.");
	}
	//[Fight!]
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(shits["SHIP"]);
	CombatManager.setHostileActors(new TeyaalsMSXI());
	CombatManager.victoryScene(defeatyDocTeyaaaaal);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, shits["SHIP"]);
	CombatManager.lossScene(becomeACapnChair);
	CombatManager.displayLocation("DR. TEYAAL");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//Insert Space Fight here
//Dr. Teyaal commands an MS-XI with suped-up shields and nothing but energy weapons of various kinds. She’s extremely reckless/aggressive in this fight, but her ship should have lots of tech gadgets - she’s an engineer after all.

//PC Victorious
public function defeatyDocTeyaaaaal():void
{
	clearOutput();
	showName("\nVICTORY!");
	if(flags["TEYAAL_SHIPFITES"] == undefined)
	{
		output("Teyaal’s ship finally shoots up a distress flare, and you detect its weapons powering down. It seems that the doctor’s ship is no longer able to fight - by the looks of things, it can barely fly.");
		output("\n\nYour radio crackles again. <i>“Damn you! DAMN YOU! I won’t forget this. Doctor Imryllia Teyaal won’t be defeated so easily!”</i>");
		output("\n\nHer ship’s engines flare, and it starts limping away back to the safety of the asteroid base’s main hangar, and the many defensive cannons covering it. Fuck. You won’t be chasing the bitch down today. Best just land and tend to your business... this time.\n\n");
	}
	else if(flags["TEYAAL_SHIPFITES"] == 1)
	{
		//Second Victory
		output("Teyaal’s ship once again starts limping away as her defeat becomes obviously inevitable. To her, at least - there was hardly any doubt in your mind, after all.");

		output("\n\n<i>“What weaknesses? There are none!”</i> she huffs over the radio. <i>“You... you’re just riding on my coat-tails, you’re only winning because of <b>my</b> ship! Damn you!”</i>");

		output("\n\nYeah, whatever. You watch her ship limp off, a little more slowly this time. Looks like the last repair job was just a patchwork. Better her than you.\n\n");
	}
	//Final Victory
	else
	{
		output("This time, Teyaal’s ship shoots up a flare, but you don’t hear any screaming over the radio. No gloating or swearing vengeance... nothing. The ship’s weapons and shields all power down, and according to your sensors, all power’s going to life support and structural integrity. Seems like her patchjob has finally worn out, leaving her ship dead in the metaphorical water.");
		output("\n\nYou doubt, in this condition, that she’s likely to be a threat again. But maybe, just maybe, she’d learn a lesson in humility if you went and helped her...");
		IncrementFlag("TEYAAL_SHIPFITES");
		//[Leave Her] [Dock]
		clearMenu();
		addButton(0,"Leave Her",leaveTeyaalFloat,undefined,"Leave Her","Bye, bitch.");
		addButton(1,"Dock",dockWivTeyaal,undefined,"Dock","Board Teyaal’s ship and give her the business.");
		return;
	}
	IncrementFlag("TEYAAL_SHIPFITES");
	CombatManager.genericVictory();
}

//PC Defeated
//Bad end. PC becomes Teyaal’s permanent captain’s chair.
public function becomeACapnChair():void
{
	clearOutput();
	//show her daughter 2!
	showTeyaal(true);
	showBust("TEYAAL_NUDE","GRYVAIN_AGENT");
	author("Savin");
	output("You’ve barely had time to surrender before Dr. Teyaal’s ship has docked with yours, securing the <i>Sidewinder</i> with clamps and grapples. You’re still reeling from the fight as an umbilical extends between your ships, and the airlock security codes are bypassed. Teyaal swaggers aboard with her plasma pistol in hand, followed by another gryvain at her heels. ");
	//fought Agent:
	if(flags["SATELLITE_GRYVAIN_DEFEAT"] != undefined) output("It takes you a few moments to recognize the satellite huntress you fought all the way back on Mhen’ga - and the way her eyes go wide behind the older science-slut, the recognition is mutual. ");
	output("She’s much younger than Teyaal, you notice, but besides that, they’re awfully similar: same scale and hair color, similar builds with big, heavy tits that can’t help but bounce as they walk. Teyaal’s got much thicker thighs and a wider set of hips, but besides that, the similarity is uncanny.");
	output("\n\nMother and daughter?");
	output("\n\n<i>“Well, well!”</i> Teyaal laughs, sauntering onto the bridge. <i>“You should have known better than to try and fight me in my own ship! Defeat was all but inevitable.”</i>");
	output("\n\nThe younger gryvain draws her laser pistol on you as well, circling around so there’s no way you can get to cover. You can hear other footfalls in the corridors outside; more pirates moving to secure the ship, to deal with your crew. The two busty dragon-babes stick you up and take your weapons, your Codex, and everything else of value in short order. Teyaal’s grinning triumphantly the whole while, her naked cock rock-hard as scaled tail slowly wraps and squeezes your [pc.leg].");
	output("\n\n<i>“Selarith, dear,”</i> she says, turning to her daughter. <i>“Why don’t you go secure Engineering. See if you can find whatever happened to my dear Olympia.”</i>");
	output("\n\n<i>“Ugh. I don’t want to go looking for your second-hand sexbot, mom,”</i> the younger dragon groans. Still, she holsters her pistol");
	//fucked her:
	if(flags["FUCKED_TEYAALS_DAUGHTER"] != undefined) output(", gives you a rough slap on the ass,");
	output(" and turns towards the hatch.");
	output("\n\nTeyaal just waves her off and strides towards you, running a hand across the chain connecting her stiff cobalt nipples. One of her clawed hands grasps your shoulder and shoves you back down into the captain’s chair, hard enough to knock the wind out of you, and her tail pins you down on it.");
	output("\n\n<i>“Ah, that’s better,”</i> she grins, holstering her gun and wrapping that hand around her azure spear, stroking her hard length. <i>“Mmm, that’s a good look for you. I never liked this chair; got it used from some brain-addled galotian at an estate sale. You’ll make a much better seat for the </i>Sidewinder<i>’s rightful captain.”</i>");
	output("\n\nTeyaal shrugs off her lab coat, the only thing even pretending to keep the oversexed mad scientist modest, and turns away from you with that massive draconic rump thrust out. You have just enough time to brace for what’s coming as the " + (silly ? "dummy thicc ":"") + "dragon-milf comes right down on your lap, crushing you between fat ass, leathery wings, and pillowy seat cushions. Her tail pins your arms to the rests as she shakes her hips side to side, grinding into your crotch in a mocking attempt to get comfortable on her new chair. After a few moments, though, she tuts and reaches down, cranking the lever on the side of the captain’s chair; with so much pressure going backwards against it, the moment the lock’s disengaged the chair goes completely flat, leaving you prone and staring at the sky - for about a second, until two full pale moons overshadow you. A deep blue tunnel winks down at you, ringed internally by countless concentric groups of clitoral mounds.");
	output("\n\n<i>“Open wide for mommy,”</i> Teyaal coos, still stroking her cock as her ass comes down to smother your face. Juicy blue folds of pussy-meat slap your [pc.lipsChaste] and swallow your nose, and her thick draconic cock strikes your chin, rubbing on your [pc.skinFurScales] as the doctor settles into her new perch. You can feel her lean forward, patting your thighs before taking the <i>Sidewinder</i>’s controls for the first time.");
	output("\n\nThe deck thrums under you, making you gasp in surprise - and accidentally open your mouth into the dark depths of gryvain cunt all around it. One unfiltered inhalation of Teyaal’s pussymusk is enough to leave your head spinning, flesh flushed with desire. Her myriad clitorises just inside the slit all bear down on your nose, and - and your [pc.tongue], too. You don’t even remember having thrust it out, but there it is, wriggling between the nubby walls of Teyaal’s pussy.");
	output("\n\nThe doctor laughs and shakes her hips, grinding her cunt down on your while she spools up the engines for her victory lap. The ship starts moving, silky smooth once the momentary extra Gs pass, and you immediately feel something <b>wet</b> and <b>hot</b> spilling onto your neck and chest, a steaming goo that slowly drools down from the crown of Teyaal’s rock-hard reptilian member.");
	output("\n\n<i>“It’s so good!”</i> the doctor cries, moving her hips faster. <i>“That’s it, baby. Purr for mommy!”</i>");
	output("\n\n<i>“Ohhh, I walked in at a bad time,”</i> you hear another voice - her daughter - muffled by the gryvain MILF’s thick asscheeks. <i>“" + (olympiaIsCrew() ? "Found your sexbot, too. Deactivated her and gave her a memory wipe... I, uh, think I’ll go break her in for you... yeah...":"No Olympus or whatever her name was... your new [pc.boyGirl]friend must have spaced her. Guess I’ll start looting.") + "”</i>");
	output("\n\nTeyaal snorts, <i>“Sure, dear, have fun.”</i>");
	output("\n\n<i>“You clearly are,”</i> the younger dragon huffs. She closes the hatch behind her as she leaves you at her mother’s utter mercy.");
	processTime(25);
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Next",docTeyaalBadEndPart2);
}

public function docTeyaalBadEndPart2():void
{
	clearOutput();
	showBust("TEYAAL_NUDE","GRYVAIN_AGENT");
	author("Savin");
	//Give the PC a 16”</i> gryvain cock, or TF current dick into one.
	var cockChange:int = -1;
	if(!pc.hasCock()) 
	{
		pc.createCock();
		cockChange = 1;
	}
	if(!pc.cocks[0].cType == GLOBAL.TYPE_GRYVAIN)
	{
		pc.shiftCock(0,GLOBAL.TYPE_GRYVAIN);
		pc.cocks[0].cLengthRaw = 16;
		if(cockChange == -1) cockChange = 2;
	}

	output("It’s another raid today.");
	output("\n\nNobody <b>tells</b> you that, of course, but you’ve learned to listen in pretty closely to Captain Teyaal’s bridge crew. Of course, that’s pretty much the only sense you have left anyway: your mouth is clenched open around an O-ring gag, and your long, mutated tongue is basically numb without a pussy clenched around it. The rest of your face is covered by the vicromask your owner bought you a year ago, shortly after her first victory against the remnant leadership of Zheng Shi, and you can’t remember the last time your eyes saw the light. Your limbs are securely fastened and splayed out on luxuriously cushioned backboard. It’s not for your sake, of course, but to absorb the impacts of your captain’s fat, jiggly ass.");
	output("\n\nYou feel almost naked without it.");
	output("\n\nA klaxon blares, and there’s a rushing of boots and pirate coats across the deck. You hear the shields powering up, then the weapons, and then your heart leaps into your throat as the engines roar to life.");
	output("\n\nThe hatch slams open, and a pair of naked scaled feet pad onto the deck. Your ");
	if(cockChange == 1) output("new, thick dragon dick");
	else if(cockChange == 2) output("modded cock, now a near-mirror of Teyaal’s");
	else output("[pc.cock]");
	output(" leaps to attention as an officer shouts, <i>“Captain on the bridge!”</i>");
	output("\n\n<i>“At ease!”</i> Teyaal laughs, sauntering over with her tail swishing on the ground behind her. Long, hot fingers brush your naked erection, stroking you once before her thick thighs come to straddle you, clenching around your masked face. Your lengthy tongue is thrusting up to meet the captain’s quim before she’s even sat down, earning a little gasp and a sigh of pleasure as she takes her accustomed seat.");
	output("\n\n<i>“So what’s on the menu today, boys?”</i> Teyaal asks the bridge.");
	output("\n\n<i>“Steele Tech vessel, captain. She hasn’t seen us yet.”</i>");
	output("\n\nYou can feel your captain’s rush of excitement in pussyjuices and pre, and her hand around your ‘control rod’ tightens. <i>“Well take us in, then! Let’s find us some new booty.”</i>");
	output("\n\nThe fight barely lasts five minutes. You gasp and squirm as the <i>Sidewinder</i>’s shields shrug off impacts from defensive cannons, but it seems light and random, and it doesn’t last long. You barely focus on it anyway; your duty is to your captain’s cunt, and you worship it fearlessly all through the battle. Her cock erupts before the battle even ends, painting your [pc.chest] with an explosive orgasm a few moments before the target ship’s shields pop.");
	output("\n\nTeyaal howls with victory, thrusting her ass down on you hard enough to make your mask creak and let your tongue batter the deepest recesses of her egghole. Her subordinates clap, and the ship shudders as its grappling guns fire to secure the prey.");
	output("\n\nThat was fast! You huff in disappointment; you only got one orgasm from the captain today. She doesn’t give you treats unless you get at least <b>five</b>!");
	output("\n\nTeyaal turns around on top of you, dunking her still-leaking pole into your mouth as some commotion goes on around you. Whatever. You moan softly and suckle, running your tongue all over Teyaal’s throbbing erection. She shudders as you go to work on her, cleaning off every inch of cobalt cock while you have the chance.");
	output("\n\nYou could swear your captain’s close to cumming again when suddenly the hatch opens and someone is thrown in, collapsing on the deck with a <i>thud</i>.");
	output("\n\n<i>“[pc.name]!?”</i> a shrill voice cries, gasping.");
	output("\n\nCaptain Teyaal laughs. <i>“Nobody here by that name. This is Chair.”</i>");
	output("\n\nYou gurgle around her cock in vague recognition. A good chair is quiet, though - at least when you aren’t flipped over so the captain has access to your ass. You feel an excited throb in the captain’s rod, and a thick cream oozes onto the back of your throat.");
	output("\n\n<i>“L-listen, I have money! I’m the CEO of Steele Tech!”</i> the voice pleads, <i>“This doesn’t have to be a big thing. Just tell me where to wire a few million... we can make a deal.”</i>");
	output("\n\nYou’ve heard that approach plenty of times. You vaguely remember that you once said something like that, before your captain got tired of your voice and put your gag in. That was the last time you spoke, come to think of it... and you don’t <b>like</b> thinking about it. Better to focus on sucking Captain Teyaal off while she’s busy; you might be able to get another load from her at this rate!");
	output("\n\nCaptain Teyaal chuckles, and suddenly the cock is withdrawn from your mouth. You feel cold and empty for all of a second before she scoots up on you, planting her pussy back on your tongue and squeezing your head between her thick thighs, leaving her cock bobbing over the top of your head.");
	output("\n\n<i>“I can get credits anywhere, dear,”</i> your captain drawls. <i>“Sure, I’ll take yours too, but you’ve got to give me a better reason not to just sell you to my slaver friends than a fat wallet. Like maybe those plump little lips of yours.”</i>");
	output("\n\n<i>“W-what? You can’t expect me to-”</i>");
	output("\n\nThe captain’s pussy squeezes around your tongue, and you can feel her length bob on your forehead. <i>“Why not? Your little chair friend here’s been at it for years now. Probably doesn’t remember anything else... one little blowjob is hardly even a slap on the wrist compared to what I did to the stupid, brainless slut that stole my ship.”</i>");
	output("\n\n<i>“[pc.HeShe]’s not my friend,”</i> the prisoner huffs. <i>“[pc.name] is... was... [pc.heShe]’s...”</i>");
	output("\n\n<i>“[pc.HeShe]’s just Chair now,”</i> Teyaal corrects [rival.himHer]. <i>“Now get over here and suck my cock, unless you want to be the new seatback.”</i>");
	output("\n\nThat honestly sounds kind of nice...");
	//output("\n\nGAME OVER");
	days += 365;
	badEnd();
}

//Leave Her
//Bye, bitch.
public function leaveTeyaalFloat():void
{
	clearOutput();
	author("Savin");
	output("Fuck her, the evil bitch. You kick your [pc.feet] up and cruise on into the docks, content to go about your business.\n\n");
	flags["TEYAAL_DRIFTED"] = 1;
	CombatManager.genericVictory();
}

//Dock
//Board Teyaal’s ship and give her the business.
public function dockWivTeyaal():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("Maybe after three rounds of getting her ass whooped in a row, Teyaal’s ready to learn a lesson in humility. You guide your stolen ship over to where hers has broken down and extend the docking umbilical. It’s almost a surprise when nothing explodes on her ship; no weapons fire, no trap springs. You get a confirmation of hard seal and good air aboard her vessel, and the airlock on the derelict vessel cycles open in anticipation.");
	output("\n\nYou make sure your [pc.weapon] is at hand as you make your way down to the airlock. ");
	//Olympia on crew: 
	if(olympiaIsCrew()) 
	{
		output("Olympia is waiting for you halfway down the umbilical, shoving shells into the back of a Stormbull. " + (silly ? "Where’d she get another one of those? ":"") + "She glances up when you approach and gives you a firm nod. <i>“Ready when you are, captain.”</i>");
		output("\n\n<i>“You’re coming?”</i>");
		output("\n\nThe gynoid racks the shotgun’s slide in answer. Alright then. Considering she has the scattergun: ladies first.");
		output("\n\nYou follow Olympia");
	}
	else output("\n\nYou step");
	output(" onto the gryvain vessel a few moments later, waving your hand defensively over your face as smoke billows from overloaded panels in the walls and ceiling. Cables hang in sparking clumps from every other surface, making you duck and weave on your way up to the bridge.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",dockWivTeyaal2);
}

public function dockWivTeyaal2():void
{
	clearOutput();
	showTeyaal(true);
	author("Savin");
	output("The door to the bridge slides open, revealing a small command center surrounding a single captain’s chair, a large and lavish affair in which the near-naked doctor is sprawled out on. She’s the same thick MILF as ever, huge tits heaving through the open face of her lab coat. Her cyan hair is a disheveled mess, and her legs are splayed across the command dias, revealing the ribbed, knotty length of her draconic cock.");
	output("\n\nShe has her plasma pistol still, but it’s fallen out of her hands, scattered off across the floor and well out of reach. Slowly, you ease your hand off your [pc.weapon].");
	output("\n\n<i>“I can’t win,”</i> she groans, regarding you with half-conscious golden eyes. <i>“You... you’re pushing the </i>Sidewinder<i> far beyond how it should be able to perform! I knew its weaknesses, knew its blindspots... but none of it worked against you. Why?”</i>");
	output((olympiaIsCrew() ? "\n\n<i>“Because I knew them too. I can compensate. Help my captain kick your ass every time,”</i> Olympia says. Her normally even keel wavers for a moment, a mixture of pity and hatred in even measure. After a moment, she sighs, and tucks her shotgun under an arm.":""));
	output("\n\nTeyaal leans forward, enough to make her tits sway and strain against the chain binding them together. <i>“It’s because <b>you</b>’re the captain she always needed! I made the ship too damn good for anything less than you, the captain </i>Sidewinder<i> deserved. I see that now. She would have been wasted on some grubby Jumper thief or a Corona slut hopped up on rads.”</i>");
	output("\n\nThe doctor leans back suddenly, laughing hysterically. Her tits and naked cock bounce as her chest rises and falls chaotically, and her scaled limbs run through her mess of hair. You’re not sure if the fumes have gotten to her or if Teyaal’s really, finally managed to get it through her head that she’s lost, but it’s a nice change of pace. Unfortunately, she’s too out of it to really have any fun with in her current state - you’re surprised she even recognizes you, and her eyes are hazy and unfocused now.");
	output("\n\n...And you’re starting to feel a little light-headed, too, now that you think about it.");
	output("\n\nOh yeah, there’s a gas leak somewhere.");
	output("\n\nYou grab Teyaal’s arm and drag her back to the airlock before you get properly poisoned.");
	if(olympiaIsCrew())
	{
		output("Your gynoid companion sighs in defeat and grabs the doctor’s other arm, helping you carry her. An arched eyebrow in her direction earns an almost apologetic shrug from Olympia. <i>“I hate her. But I can’t let an organic die... damn programming.”</i>");
		output("\n\nDidn’t all her programming get scrambled?");
		output("\n\nOlympia pointedly ignores the question and takes the lead.");
	}
	output(" A few moments later and you have Teyaal aboard the [pc.ship]. You speed back the Zheng Shi, leaving the doctor’s vessel drifting in the black, and park in the normal spot well away from the attention of the pirate lords themselves.");
	output("\n\nShe’s still loopy when you land, but has recovered enough to walk - if she uses all four wings and both arms to steady herself. She wobbles around beside your captain’s chair, dick flopping uncomfortably close to your [pc.face] until the ship shudders underfoot, settling, and Teyaal slumps forward against the hatch out of the bridge.");
	output("\n\n<i>“You’ve impressed me, captain!”</i> she drawls drunkenly. <i>“Four times now, you’ve beaten me. Made better use of my ship than I would have!" + (olympiaIsCrew() ? " Even stole my sexbot! My sweet little Olympia...":"") + "”</i>");
	output("\n\nThe doctor sighs, then throws her head back and laughs from the belly. <i>“Haha! Look me up sometime on the recreation deck... you’re not so bad after all.”</i>");
	output("\n\nYou’re not sure if that’s a compliment, coming from a mad scientist, but you guess that’s the closest to friendly you’re likely to get to the doctor at this point. You let Teyaal go - there’s not much you can do with her in her state - and lean back in your chair as she staggers off across the deck.");
	if(olympiaIsCrew()) 
	{
		output("\n\n<i>“I feel... contented,”</i> Olympia says softly, resting a hand on your shoulder. <i>“Watching her humiliate herself and call you a good captain is nice. At any rate, I’ll be in the engine room if you need me. Thank you for winning again, captain.”</i>");
		output("\n\nAll in a day’s work.");
	}
	output("\n\n");
	processTime(10);
	CombatManager.genericVictory();
}