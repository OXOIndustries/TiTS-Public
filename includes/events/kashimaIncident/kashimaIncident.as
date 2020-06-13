/* Flagshit:
KASHIMA_STATE:
	0/undefined 	not offered yet
	1 				in progress
	2 				done, pc did the good shit (medbay)
	3 				done, pc did the good shit (henderson)
	4 				ended without curing shit
	-1 				avoided/abandoned/failed

CHIEF_NEYKKAR_WITH_PC
	0/undefined		not with pc/unknown cause
	1 				with pc
	2 				removed during event
*/
public function sendKashimaMessage(destination:String):void
{
	MailManager.unlockEntry("KashimaMail", GetGameTimestamp());
	MailManager.readEntry("KashimaMail", GetGameTimestamp());

	clearOutput();
	author("Savin");

	output("Your ship’s comms display lights up with the incoming message, marked as being from Steele Tech company headquarters. That’s... unexpected, to say the least. You key the holoscreen and bring up the message:");
	
	output("<i>");
	output("\n\nDear "+pc.mf("Mr", "Ms") +". Steele,");
	
	output("\n\nAfter some discussion among the executive board, we have decided to inform you of an opportunity for work in the Myrellion system, which");
	if (reclaimedProbeMyrellion() == false) output(" we have on good authority that");
	output(" you have recently visited. One of the company’s asteroid mining vessels, the </i>U.G.C.S. Kashima<i>, recently went dark in the orbit of Myrellion’s second moon. The assignment should have been relatively safe, and due to the Confederate presence in the sector, we do not believe it to have fallen victim to piracy. Whether the </i>Kashima<i>’s failure to report is due to technical difficulties or some other problem is unknown, though its transponder appears to be active.");
	
	output("\n\nSteele Tech has taken the precaution of contracting a Nova Securities support-rescue vessel to investigate and either recover the crew or assist in repairs as needed. However, due to your proximity to the </i>Kashima<i> and the value of its cargo, it may prove prudent to have a representative of the company such as yourself present as well. And, of course, will necessitate a contractor’s fee for yourself.");
	
	output("\n\nThe </i>Kashima<i>’s last known location has been included with this message. Act accordingly.");
	
	output("\n\nKindest regards,");
	output("\n\nWilliam B. Brannagan, Director");
	output("\n\nSteele Tech Job Services Department");
	output("</i>");

	output("\n\nWell, they weren’t kidding: that missing mining vessel is just a couple of hours away if you hurry. A quick sensor ping shows a Nova Securities ship heading into the asteroid field from the direction of the system’s Warp Gate. Looks like you’ve got to make a decision now.\n\n");
	
	processTime(2);

	clearMenu();
	addButton(0, "Help Nova", startKashimaJobbo, destination, "Help Nova", "Take Steele Tech up on their offer and investigate the <i>Kashima</i>. Even if it’s just a technical glitch, it’s still worth a fair bit from the contract price.");
	addButton(1, "Abandon", abandonKashimaJob, destination, "Abandon", "The Nova Securities crew has this covered. That’s their job, after all. No point in you dealing with it.");
}

public function abandonKashimaJob(destination:String):void
{
	clearOutput();
	author("Savin");

	output("You swipe the message into your trash folder and get back to your business. You’ve got bigger fish to fry today.");

	flags["KASHIMA_STATE"] = -1;

	clearMenu();
	addButton(0, "Next", flyToWrapper, destination);
}

public function finishKashimaJobFlyAway():void
{
	showBust("");
	flyToWrapper(flags["STORED SHIP DESTINATION"]);
}

public function startKashimaJobbo(destination:String):void
{
	clearOutput();
	author("Savin");

	output("You override the flight path you’ve been following and enter in the <i>Kashima</i>’s coordinates, bringing your ship about. You’ll likely meet up with the Nova ship just beyond the asteroid belt at this speed, a couple of hours from now. Just enough time to take a quick nap");
	if (annoIsCrew() && flags["ANNO_MISSION_OFFER"] == 3) output(" and maybe grill your favorite puppy-slut on why the company’s been tracking you");
	output(".");

	flags["KASHIMA_STATE"] = 0;
	
	sleep(false);
	pc.lustRaw = pc.lustMin();
	flags["STORED SHIP DESTINATION"] = destination;
	
	currentLocation = "SPACE";
	generateLocation(currentLocation);

	clearMenu();
	addButton(0, "Next", actuallyStartKashimaJob);
}

public function actuallyStartKashimaJob():void
{
	clearOutput();
	author("Savin");

	output("A couple of hours later, you’re suited up, refreshed, and ready for action. You’re just coming up to the asteroid belt around Myrellion’s second moon, able to just barely get a visual on the Steele Tech ship you’ve been sent to find: she’s a slender, long craft with a bulbous pair of spherical cargo holds near her back, swollen with the mined ores and other materials harvested from the various stellar bodies she’s been servicing. The <i>Kashima</i> has extended long, slender limbs out from its side like a spider’s, anchoring itself to a particularly jagged, icy-white clump of space rock.");

	output("\n\nThe Nova Securities ship is pulling up aside you now, having hailed you a few minutes past. They were alerted to your possible presence by headquarters, though the woman who you talked to didn’t seem overly thrilled by having a “corporate tag-along” with them. You cast a glance out your starboard viewport, getting a good look at the Nova ship: a sleek, orange-and-white vessel that just barely qualifies as a corvette, with a small shuttle bay in its back and a pair of light gun turrets mounted on either side of its prow. Swooping, sans-serif letters painted on her side identify her as the <i>Sunny Nebula</i>. A cheerful name for a warship.");

	output("\n\nThe Nova corvette bows her nose towards the <i>Kashima</i> and starts to putter towards it, filling the quantum airwaves with open-channel hailing calls and queries directed towards your company’s miner. You listen in to a one-sided conversation: the mining vessel doesn’t respond to the Nova captain’s increasingly irritated shouts. Finally, you hear a curse, and another comms channel opens to you:");

	output("\n\n<i>“Steele, either your friends’ comms are fucked, or something’s going on over there. We’re gonna form a boarding party. Come along if you want.”</i>");

	output("\n\nYou respond that you do, and quickly find yourself boarding a small shuttle full of mercenaries and techs zooming towards the eerily silent bays of the <i>Kashima</i>.");

	processTime(30+rand(10));

	clearMenu();
	addButton(0, "Next", actuallyStartKashimaJobII);
}

public function actuallyStartKashimaJobII():void
{
	clearOutput();
	author("Savin");

	output("Thanks to your company credentials, you’re able to remotely open the ship’s docking bay, allowing your shuttle to zip inside and set down. The craft shudders heavily as the landing struts meet the deck of the <i>Kashima</i>’s bay, and the engine cuts out with a distant whine. The Nova mercs stand up and grab their gear: mostly repair tools and other tech, though being a private military force, everyone’s armed with at least a handgun. A couple of them even have laser carbines, looking like the actual security goons of the group. They’re the ones who pull open the shuttle door with a hiss, leading the way out into the bay.");
	
	output("\n\nAnd then there’s the expedition’s commander. You’re treated to the sight of a towering leithan woman, with shiny black plates and dark gray skin shrouded by heavy orange-and-white heavy armor. Her six long, strong legs click heavily on the shuttle’s deck as she paces forward, and her reptilian tail sweeps around, whacking laggardly crewmen on the ass to get them in gear. She cuts an imposing figure, thick-set and muscular, with black hair pulled into a long ponytail that goes all the way down her back and a stern, hard chin bearing a scar that runs along her jaw.");
	
	output("\n\n<i>“Alright, Steele,”</i> she grunts at you, hefting up a heavy machinegun from a rack on the side of the shuttle. <i>“Just stay behind me and");
	if (pc.hasRangedWeapon()) output(" try not to shoot anybody");
	else output(" try not to hurt someone");
	output(".”</i>");

	output("\n\n");
	if (pc.isNice()) output("<i>“Yeah, sure, of course,”</i> you say, turning to follow her off the shuttle.");
	else if (pc.isMisc() || pc.isBro()) output("<i>“Yeah, I’ll watch your back lady,”</i> you grin, scoping out the broad, bestial behind of the tauric amazon. She grunts and gives you a hard shove back with her tail.");
	else output("<i>“Yeah, fuck you too,”</i> you scowl, following her out.");

	output("\n\nYou duck out of the shuttle’s hatch, into an open space that’s almost completely pitch black. Red emergency lights flicker overhead from a couple of still-active points. Cabling hangs like vines from the ceiling, sparking occasionally as the dead lights try and activate. A couple of the engineers around you flinch as a loud <i>snap-crack</i> of electricity echoes through the landing chamber.");

	output("\n\nA quick glance around in the moments of light shows that there aren’t any other shuttles in the bay, though there definitely should be at least one in a vessel of this size.");

	output("\n\nYou advance a couple of paces, right up until your [pc.foot] accidentally lands in something cold, wet, and sticky. You glance down and catch sight of a pool of... something... splattered on the deck. Something white and musky.");

	output("\n\n<i>“What the...”</i> the leithan officer snarls, hiking one of her clawed feet up, trailing a wet web of the same substance off the ground. A few of the Nova people seem to find similar pools, groaning and grimacing and starting to watch their step. Flashlights turn on from helmets, casting cones of light across the hangar bay.");

	output("\n\n<i>“Us docking should’ve sent a shipwide alert,”</i> your self-appointed shepherd murmurs, wiping the sludge off on the side of a nearby crate. <i>“If that didn’t do it, the shuttle landing should have rocked the deck enough to let ‘em know we’re here. So where the fuck’s the crew?”</i>");

	output("\n\nShe casts a glance at you over her shoulder, somehow expecting you to know the answer. All you can do is shrug. Looks like you’ll have to look around...");

	processTime(15);
	
	currentLocation = "KI-E29";
	generateLocation(currentLocation);
	flags["KASHIMA_STATE"] = 1;
	flags["CHIEF_NEYKKAR_WITH_PC"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function chiefNeykkarHeader(asNude:Boolean = false):void
{
	showName("CHIEF\nNEYKKAR");
	author("Savin");
	showBust(asNude ? "USHAMEE_NUDE" : "USHAMEE");
}

public function kiCargoLiftLoss():void
{
	clearOutput();
	author("Savin");

	output("A tide of mutated, tentacle-laden bodies washes over you and the desperate Nova troopers, throwing you to the ground and tearing at your");
	if (!pc.isNude()) output(" [pc.armor]");
	else output(" gear");
	output(", lashing at your mouth and rump");
	if (pc.hasVagina())
	{
		output(" and twat");
		if (pc.vaginas.length > 1) output("s");
	}
	output(" with dozens of slimy, drooling tentacles. You lack the power to resist anymore, and your will crumbles under a haze of red mist seeping from the creatures’ mouths.");

	output("\n\nYou black out.\n\n");

	CombatManager.genericLoss();

	clearMenu();
	addButton(0, "Next", kiMutantBadEnd);
}

public function kiCargoLiftVictory():void
{	
	showBust("USHAMEE");
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	moveTo("KI-L22");
	
	output("You’ve dropped the closest of the creatures, buying yourself some time, but the elevator’s still clogged with bodies now. Most of the Nova troops have been dragged to the deck by writhing tentacles, their armor torn open and their bodies violated. More and more of your mutated employees are leaping down from the open doors, grabbing at whoever’s left standing.");
	
	output("\n\nYou have to get out of here. Right now.");
	
	output("\n\nDesperately looking around, you quickly sight in on your way out: the elevator doors are still open, and one’s coming up fast. You’ve got to move fast, though, or you’re going to get dragged into the growing orgy pit of violated Nova marines. And more crewmen are coming to join the fun, crawling up from the sides or diving down from above.");
	
	output("\n\n<i>“We’ve gotta go!”</i> you shout, grabbing your leithan protector by the shoulder before making a break for the edge of the car. You hope she follows, but you can’t spend the time to make sure. You shove aside one of the mutants, batting aside tentacles and slavering fangs as you rush towards the exit.");
	
	output("\n\nThe gaping doors rush down to meet you, blessedly devoid of more fuck-hungry mutants. You spin, shoving back another slavering mutant, desperately throwing off lunging tentacles as more of the creatures turn their eyes toward you, moaning hungrily. Shit.");
	
	output("\n\nBefore they can close the distance, though, you hear a bestial roar echoing through the chamber, even over the screaming and the gunfire. For a moment, you fear something even deadlier is coming your way... and you’re right. Thankfully, it’s not another tentacled abomination. Instead, Chief Neykkar comes barrelling through the crowd after you, smashing skulls with the butt of her gun until she’s beside you again, eyes wide in terror and horror. Behind her, the last of the Nova troops goes down, dragged to the deck by a half dozen lust-addled bodies.");
	
	output("\n\n<i>“Your crew sucks, Steele,”</i> she growls, kicking one of them back into several of its fellows. <i>“Go. I’ll cover you.”</i>");
	
	output("\n\n<i>“What? Come on!”</i> you yell, watching the open door draw so near you could almost reach up and grab it.");
	
	output("\n\nThe chief scowls over her shoulder. <i>“No. I’m not-”</i>");
	
	output("\n\nThe door slides past. You grab her by the lizard-tail and yank, pulling the headstrong ‘taur with you kicking and screaming. She ducks down just in time as the elevator zings past the deck, tumbling onto the floor behind you as you narrowly make your escape. The sounds of screaming and fucking echo past as the elevator vanishes up the shaft. Then silence settles, penetrated only by your hammering heart and the heavy, ragged breaths of the leithan warrioress you plucked from the clutches of... of whatever has happened to your company’s employees.");

	clearMenu();
	addButton(0, "Next", kiCargoLiftVictoryII);
}

public function kiCargoLiftVictoryII():void
{
	clearOutput();
	showName("VICTORY:\nCARGO LIFT");
	author("Savin");
	showBust("USHAMEE");

	output("<i>“What the fuck,”</i> your leithan companion says, almost matter-of-factly, as she staggers up to her feet. You expect her to turn on you, to start screaming about forcing her to follow you or yanking on her tail or... something. Instead, she just stares at the elevator shaft a long moment before picking up her gun and turning around. Her armor is slathered with pink and white gunk from the mutants, but she herself seems unharmed, at least.");
	
	output("\n\n<i>“We’ve gotta... gotta get to the bridge. Send for backup. Quarantine,”</i> she says shakily. <i>“What the fuck was <b>wrong</b> with those people, Steele?”</i>");

	output("\n\nYou don’t have the answers.");
	if (pc.characterClass == GLOBAL.CLASS_MERCENARY) output(" You’ve seen some crazy shit, but that damn near takes the cake.");
	else if (pc.characterClass == GLOBAL.CLASS_SMUGGLER) output(" You’ve seen all kinds of fucked-up drugs and parasites in your career, but nothing that’d do <i>that</i> to someone.");
	else output(" And for a nerd like you, that’s really saying something.");
	output(" But she’s right: you’ve got to get moving. You’re not doing anything to save your crew or the Nova troops sitting on your ass.");

	output("\n\nThe Chief tells you to lead the way: <i>“You know your way around better than I do. Just stay close.... Last thing I need is you getting dragged off by those bastards.”</i>\n\n");

	CombatManager.genericVictory();

	processTime(5);
	
	flags["KI_ELEVATOR_DEFEATED"] = 1;
	moveTo("KI-L20");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lustyBugpony():void
{
	clearOutput();
	chiefNeykkarHeader(true);

	output("Despite the danger of your surroundings, you find your rising lusts are getting the better of you. It’s getting damn hard to keep your eyes focused ahead, and not on the swishing tail and grandiose hips of the leithan woman beside you. You can feel your heart hammering in your chest, desirous heat spreading all through you.");

	output("\n\n<i>“What’re you staring at?”</i> Chief Neykkar grunts, glancing at you over her shoulder. Her plated tail coils around one of her rear legs, shielding her rump from view as if you could see through her Nova armor. Even if you can’t see what you imagine as a lush, black, dripping equine sex, the sashay of her tremendous hips alone is positively hypnotic. You have to try not to drool just thinking about it,");
	if (pc.hasCock()) output(" though you can’t help the boner you’re popping.");
	else if (pc.hasVagina()) output(" though your [pc.cunts] "+ (pc.vaginas.length == 1 ? "has" : "have") +" something to say about that.");
	else output(" though you can’t hide the flush in your cheeks.");

	output("\n\nAs you walk, the Chief keeps glancing at you. She scowls at first, then softens as she sees just how red you’ve gotten, how hard you’re breathing. Your lusts have left you an open book, easily read by the amazonian centauress.");

	output("\n\nFinally she stops, planting all six legs on the deck and turning to face you, hands on her hips.");
	if (flags["FUCKED_CHIEF_NEYKKAR"] != undefined)
	{
		output("<i>“Again?”</i> she huffs, looking you up and down. Slowly, she starts unbuckling the breastplate of her armor, using her tail to lift the hind plates. Her gray skin darkens as she does so, and as her bodysuit comes aside, you’re assaulted with a familiar, overwhelming feminine musk. <i>“The first time was... fuck, whatever. As long as it gets your head back in the game.”</i>");

		output("\n\n<i>“You enjoyed it,”</i> you smirk, glancing at her ample rear. The Chief huffs, coiling her tail around herself and fidgeting with her armor straps. No matter how she may try and deny it, though, the flush in her cheeks is clear for you to see. <i>“Don’t worry. I did too.”</i>");
	}
	else
	{
		output("\n\n<i>“What’s your problem?”</i> she snaps, scowling");
		if (pc.tallness < 72) output(" down");
		output(" at you. After a moment, she glances away, and you suddenly notice that her gray skin has become very dark, flushed not unlike your own.");

		output("\n\n<i>“You feel it too, don’t you?”</i> the Chief asks, quietly. <i>“Whatever those creatures were spouting. Those... people. My body hasn’t felt right since the elevator. I feel like I’m burning up inside. It’s hard to focus.”</i>");

		output("\n\n<i>“Me too,”</i> you say, eyes fixated on the mammoth mounds jutting forward from the Chief’s chest, perfectly rounded and, your mind insists, doubtlessly soft beyond compare even under all that armor. A [pc.manWoman] could lose [pc.himHer]self in a rack like that, no doubt. The Chief scratches one of her forelegs on the deck, her starry blue eyes lidded heavily. You can see the uncertainty, the desire writ on her face.");
	}

	output("\n\nShe’s frozen for a moment, not answering your admission. In that moment, your body, and your lusts, take control. You step forward, past the leithan’s flicking tail and muscular lower body until you stand so close that you can feel her hot and heavy breath on your face");
	if (pc.tallness < 72) output(", though she’s leaning well down to see you now");
	output(". Flashing her a self-confident smile, you reach out and grab her shoulders, just beside the buckles holding her chest armor together, and say that the two of you can’t just go on like this.");

	output("\n\n<i>“Wait-”</i> she starts to say, cut off by you planting your lips on hers and flicking your fingers across the straps of her armor, disengaging them. The Chief goes completely rigid for the span of a heartbeat, eyes wide with shock and tail sticking straight out behind her. Then she softens, moans, lets your lips play across her own. The armor plates holding back her tremendous bust clatters to the floor, letting the Chief’s breasts spill out and into your hands.");

	output("\n\nThey’re everything you imagined they would be, dark gray orbs the size of watermelons and as soft as silk, completely swallowing your fingers and rubbing their saucer-sized black teats against your palms. The Chief moans, more of a whimper than anything, and her arms grab weakly at your [pc.hips]. All illusions of tough, no-nonsense amazon warrior melt away in your arms. She’s practically swooning, chest heaving as you grope and squeeze her titanic tits.");

	output("\n\n<i>“Okay, okay,”</i> she breathes, coming up for air. <i>“I need it too.");
	if (pc.hasCock())
	{
		output(" Just... just get behind me and");
		if (pc.isTaur()) output(" mount up. Gimme everything you’ve got!");
		else output(" get going. Just take it easy, I’ve never fucked " + indefiniteArticle(pc.raceShort()) + " like you before.");
	}
	else output(" This is... going to be kind of awkward. I guess we’ll have to take turns, unless you’re way stretchier than you look.");
	output("”</i>");

	processTime(10 + rand(5));
	pc.changeLust(15);
	
	clearMenu();
	if (pc.isHerm())
	{
		output("\n\nLooks like you are eligible for some options... Which do you choose to do?\n\n");
		
		addButton(0, "Oral", lustyBugponyNoDongle, undefined, "Oral Sex", "Orally pleasure each other.");
		addButton(1, "Use Penis", lustyBugponyCocked, undefined, "Use Your Penis", "Fuck her with your cock.");
	}
	else if (pc.hasCock()) addButton(0, "Next", lustyBugponyCocked);
	else addButton(0, "Next", lustyBugponyNoDongle);
}

public function lustyBugponyNoDongle():void
{
	clearOutput();
	chiefNeykkarHeader(true);

	if (pc.hasCock()) output("You figure setting your masculine urges aside to give her some oral attention. You undress her with your eyes, glancing between the leithan’s mighty rack and those thunderous thighs of hers...");
	else output("Awkward is right, you realize, glancing between the leithan’s mighty rack and those thunderous thighs of hers... almost six feet behind them. You’re pretty sure there’s nothing in the Kama Sutra about sixty-nining a centaur, but even so, you figure you can give it a shot.");

	output("\n\nSlipping out of the Chief’s arms, you ditch your [pc.gear] and start to walk around her lengthy frame, brushing your hands along her scales and armored plates as you go. She follows you with her eyes for a while, craning her neck until you’re right behind her. <i>“Hey, why don’t you let me-”</i> she starts to say, right up until your eyes settle on the puffy black lips of her pussy, and just can’t resist the urge to slip a finger right in. She gasps, scratching her clawed feet on the deck and instinctively bucking back against your hand.");

	output("\n\nYou smirk, positioning yourself directly behind the towering titan of a woman and slinking down on your [pc.knees], putting your [pc.face] so close to the teardrop-shaped slit that your nose brushes against the swollen black clit sitting proudly at its base. The Chief’s whole sex winks at you when you do, giving you a first-hand show of her dusky lips and the lush pink flesh inside them. It’s hard not to just dive into the perfect, equine sex on offer, but you restrain yourself - a pussy this luscious, this wet and ready for you, needs to be handled with a gentle touch. At least, at first - you’ve got every intention of making the Chief scream while you go fist deep in her before too long!");

	output("\n\n<i>“What, did you fall in back there?”</i> the Chief grunts, putting her hands on her hips. <i>“Don’t be a tease. Get going already.”</i>");

	output("\n\nYou answer her with a firm but gentle grope of her ass, digging your fingers into the soft flesh right where her flank’s armor ends. She sucks in a sharp breath, tail swinging up and straight out with surprise. That quiets her long enough for you to finally bring your hands to bear on her thick pussylips, using your thumbs to pull the pair apart and reveal the deep, wet hole they hide. You");
	if (pc.isTaur()) output(" know full well");
	else output(" can only imagine");
	output(" how much cock a woman like her could take, with a body as long as hers and a slit this big and welcoming. She’d be a perfect match for any");
	if (pc.isTreated()) output(" New Texan bull");
	else output(" ultraporn stud");
	output(", not to mention the leithan boys that must line up around the block for a chance to sink themselves into a pretty quim like this.");

	output("\n\nSlowly drawing yourself back to the present, you manage to stop admiring the Chief’s twat long enough to lean in and flick your [pc.tongue] out across its thick, meaty lips. You trace a circle from bottom to top, stopping to lick and kiss around the thumb-sized bud of her clit, and back down again. You can feel its owner shiver, barely holding back a moan, and are quickly treated to your first thick, earthy taste of leithan excitement. The taste sends your heart aflutter in your chest, and moreover, compels you to keep licking deeper and deeper, munching your way right into the sodden embrace of the horsecunt before you. Regardless of how utterly smeared your face gets, you push yourself deeper, caressing every last inch of the Chief’s tender slit you can possibly reach.");

	output("\n\n<i>“Gah! W-what’re you...”</i> she starts to whine, pushing her rump back against your face hard enough that you’re afraid you might actually pop your head right into her! <i>“Ah, that feels amazing.”</i>");

	output("\n\nYou bet it does, if how positively drenched you now are is any indication. Maybe you’re the first person to ever slow down and take it nice and gentle with this pretty slit? That, or she’s way more sensitive than a big, tough amazon like her has any business being!");
	
	output("\n\nThe way you’ve got her moaning and leaking, shivering and groping at her big ol’ tits... it all only serves to make you hornier. To want to fuck this stallion of a woman, hard and sloppy until you’re both a mess. But the way your bodies are arranged just won’t let it be, so you content yourself with the surety that if she likes what you’re doing this much, you’re sure to give her the orgasm of a lifetime.");
	
	output("\n\nPulling your face back and coming up for air, you wipe away some of the thick slime that’s built up on your face against the fleshy underside of the Chief’s tail, earning a grunt of irritation from her. You just chuckle and plant your soggy hands on her flanks, staring down her pussy one last time before you get to see it violated. It’s so perfect, so dark and meaty and heavenly-smelling... you almost hate to do this. But with a nod of affirmation to yourself, you clench your hand into a duck’s bill shape and plant your fingertips between the Chief’s lips.");

	output("\n\n<i>“Wait! Let me-”</i> she starts saying, trailing off into a cry of pleasure as you slide your arm forward. Her pussylips part like silken curtains, gently hugging your wrist as you spear her sex. Even her gasp of pleasure fades into a wordless, almost soundless moan the deeper you go, further and further into the clenching embrace of her sex until you’re pressing your shoulder into the Chief’s ass and still not finding bottom!");

	output("\n\nFrom what sounds like a mile away, you can vaguely hear the Chief trying to form words - and failing, descending into blubbering little moans of pleasure when you ball your fingers up into a fist, stretching her out just as wide as a proper leithan’s cock, and maybe just as deep. The sudden motion is rewarded by a trickle of sweet, sweet slime drooling out around your arm, splattering your [pc.legOrLegs] and the deck below you. She’s starting to form a puddle down there, basting her back pair of feet in her own juices!");

	output("\n\nAnd all that just from making a fist? You grin wickedly to yourself as you start to pull your arm back - just a foot at first, before pile-driving it back home again. The tauric beauty over you cries out again, grabbing helplessly at her tits as you start to assault her juicy pussy harder and harder. Before long you’re practically punching her, driving your lubed-up fist shoulder-deep again and again, over and over until she’s screaming in pleasure and cumming her brains out in a shower of thick fem-cum. You just turn your face away in time to avoid the worst of the blast, but there’s no doubt you’re positively covered in the Chief’s aroma now!");

	output("\n\nYour lusts only drive you more wild after that, prompting you to just keep pounding away through the Chief’s body-rocking orgasm, loving the way her silky channel clenches and grabs at you, trying to milk your arm like a proper cock. If you were");
	if (!pc.isMasculine() && !pc.hasCock()) output(" a boy");
	else if (!pc.hasCock()) output(" properly equipped");
	else output(" sheathed properly inside her pulsing pussy")
	output(", you’ve got no doubt you’d be blowing your load right about now, pumping the needy amazon full of your " + (pc.hasCock() ? "[pc.cumNoun]" : "spunk") + ". And you’re equally sure she’d love every second of it, if her greedy snatch is any indication.");

	output("\n\nA few more minutes of your vigorous fist-fucking has the Chief barely hanging on, knees wobbling and chest heaving against the cold bulkhead. She’s desperate for purchase, something to throw her weight against so that she can just lift her ass for you and cum again and again. Eventually, she gives up with a cute little whine, collapsing onto her front two knees and leaning against the wall, letting you do with her what you pleasure. Though most of your vision is blocked by the leithan’s titanic ass, you make sure to glance around her flanks to take in the way her breasts spill like putty against the bulkhead, huge and soft and easily shaped by the way her chest presses against it. Mmm, you’re suddenly tempted to give up this assault to go play with those beauties... with nipples as big and hard as the Chief’s, you don’t doubt they’re so sensitive you could have her cumming again just from playing with her teats.");

	output("\n\nIn fact, the way your loins are flaring with needy desire... you might have to do just that! As much as getting the chief on her knees in a fuck-hungry mess around your fist is fulfilling some deep fantasies, she can’t really return the favor from back here. Resigning yourself to the fact, you pound out one more orgasm for the Chief, eliciting a wail of overbearing pleasure from her now-hoarse throat before you stumble back, getting your arm free of her silken embrace.");

	processTime(5+rand(2));

	clearMenu();
	addButton(0, "Next", lustyBugponyNoDongleII);
}

public function lustyBugponyNoDongleII():void
{
	clearOutput();
	chiefNeykkarHeader(true);

	output("The moment you do, an absolute flood of fem-cum comes pouring out as well, easily a gallon of thick lube splattering all over the <i>Kashima</i>’s deck. You blink in surprise, more than a little surprised at just how wet the Chief’s gotten... she’s completely soaked her thighs and ass, not to mention the mess you’re in. Leithan-on-leithan fucking must be brutal if they need that much lube!");
	
	output("\n\n<i>“Oh. Ohhhh wow,”</i> the Chief manages to moan out, still slumped against the bulkhead. <i>“That was... you’re an animal, Steele! Nobody’s ever fucked me like");
	if (flags["FUCKED_CHIEF_NEYKKAR"] == undefined) output(" that before");
	else output(" you do");
	output("!”</i>");
	
	output("\n\nYou’re sure of that much, at least. Giving her a pat on the behind, you make your way back around to her front, just as she’s mustering up the strength to pull her head back from its rest.");

	output("\n\nAnd right into your [pc.vagOrAss], presented for her inspection. You flash her a grin, wiggling your hips and bracing your hands against the bulkhead, all but thrusting your [pc.butt] in her face. The Chief splutters and leans back on herself, grabbing your [pc.hips] to keep you from pursuing her.");

	output("\n\n<i>“Just... just gimme a second here,”</i> she groans, still breathing hard. <i>“I’d almost forgotten...”</i>");

	output("\n\nAlmost forgotten you? Tsk, she should have known better: no way you’re not making her pay you back for orgasms like those! The Chief gives you the closest thing she can to a scowl - really more of a lusty pout - and adjusts her grip on you so that her thumbs are on your ass-cheeks, pulling them apart to show off your [pc.vagOrAss].");

	output("\n\n<i>“Fine. Just... don’t expect much. ");
	if (pc.isFeminine() || !pc.hasCock())
	{
		if (pc.hasCock()) output("I’m not usually into girls.");
		else output("I’m not usually into, uh... not dicks, I guess.");
		output("”</i>");
		output("\n\nAww, how sweet. It’s always nice to know you can sometimes bend a person’s sexuality a bit... if they’re horny out of their minds and desperate for release, anyway! ");
	}
	else output(" You did a pretty good number on me, Steele.”</i>\n\n");

	output("You assure her that she’ll do fine, if she starts with a few loving little licks...");

	output("\n\n<i>“Does that mean I get to shove my fist up there after?”</i> she huffs before leaning in and giving you an experimental lick. A shudder of pleasure rocks you, following by a spreading tingle of excitement as the Chief starts to explore your body with her mouth and hands. She’s as gentle as... well, not a nine-foot amazon, that’s for sure... as she caresses your hole and the surrounding flesh with her tongue, using her hands to massage and squeeze your [pc.butt], always keeping you nice and spread out for her. For someone claiming no experience, she knows how to make you feel like you’re floating on a cloud of lust. And that in mere moments!");

	output("\n\nA solid minute of her oral treatment has you gasping, clawing at the wall with your nails and desperate for more. Another minute, and she’s got you begging for it, bucking your hips against her face to try and persuade her to push forward. But she doesn’t, seemingly content to just tease around your [pc.vagOrAss] and never go further. At least, not until you’re almost as much of a mess as she was, barely able to keep standing with the way your " + (pc.hasLegs() ? "[pc.legs] are" : "[pc.lowerBody] is") + " wobbling.");

	output("\n\nOnly when she’s exacted a suitable vengeance for the way you surprise-fisted her does the Chief finally push her tongue forward into your desperate hole. Your body opens up for her without a hint of hesitation or resistance, not in the state you’re in. You just relax your [pc.vagOrAss] and let her slither inch after inch of alien tongue into your lusty body to play around in your over-sensitive passage. She licks all around your insides, too, slathering your walls with spit even as her lips are passionately kissing your");
	if (pc.hasVagina()) output("s");
	else output(" ass");
	output(".");

	output("\n\nAnd just like that, you feel all the fight go out of your body, completely surrendering to the amazon’s oral assault. You");
	if (pc.hasLegs()) output("r [pc.legs]");
	output(" buckle, but as strong as she is, she easily supports you right where you stand, taking your weight on her hands and face. All you can do is grind your [pc.hips] against her face, letting yourself be carried to orgasm in the amazon’s arms. When your climax arrives, it comes hard. A sudden and explosive release that’s been pent up for what feels like an eternity comes crashing down on you in cascades of roiling, mind-melting pleasure. The Chief keeps her tongue going the whole time, massaging your spasming insides until with a final, shuddering gasp, you fall back into her arms in utter contentment.");

	output("\n\n<i>“Could have been worse,”</i> she chuckles, catching your head in her pillowy tits. If you were anywhere... anytime... else, you’d desperately want to cuddle up there and fall asleep. But sadly, you know you can’t.");

	output("\n\n<i>“C’mon... I don’t think either of us is gonna be walking right, but we gotta move soon.”</i>");

	output("\n\nYou nod sadly, reaching for your gear.");

	processTime(10+rand(5));
	IncrementFlag("FUCKED_CHIEF_NEYKKAR");
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lustyBugponyCocked():void
{
	clearOutput();
	chiefNeykkarHeader(true);

	var cIdx:int = pc.biggestCockIndex();

	if (!pc.isTaur())
	{
		output("You do just as the towering amazon directs, beating feet behind her. The Chief takes a clearly uncomfortable step forward, bracing her hands against one of the bulkheads and curling her tail up over her back. The tip prods at a small buckle on her flank, and with a metallic clatter, her heavy armor falls away to expose a vast expanse of black chitin and dark gray flesh, intermixed with glowing patches wherever the two meet. From where you’re standing, you’re suddenly assaulted by a musky cloud of pent-up feminine desire billowing into your face. You blink, and find yourself staring down the gulf between a pair of slick, thick black lips. Her sex is almost pear-shaped, narrowing around the hood of a broad, black clitoris, and drawing your eyes upwards to a sinfully dark, silky-soft looking donut ring above it.");
		
		output("\n\nDrawn forward by your mounting desires and the intoxicatingly alien appearance of the leithan’s sex, you grasp at her broad flanks and pull your face in close enough to run your tongue experimentally around one of her dark pussy-lips. The taste is otherworldly, rich and earthy and so wet that your [pc.tongue] comes away bridged by a thick rope of slime. The Chief moans throatily, and her six legs buckle underneath her.");
		if (pc.tallness < 96) output(" She slinks down onto her knees to give you better access to her titanic rump, putting it right about on crotch level with you.");
		else output(" Thanks to your immense height, the towering taur is just the perfect height for you to fuck.");
		
		output("\n\n<i>“Come on, don’t be a fucking tease,”</i> your leithan lover huffs from what feels like a mile away. Tough as she might be, you can definitely hear the whimper of pleasure she’s trying to hold back as your tongue plays around in her equine sex. Her tail weakly swats at your cheek, not quite enough to really sting. <i>“I can’t do anything up here, you ass. If you’re gonna make this all foreplay, come back around or something!”</i>");
		
		output("\n\nIf you didn’t know any better, you’d say she sounds awfully self-conscious about being the only one getting off at the moment. Grinning to yourself behind the shielding mass of leithan butt, you flick your tongue back out across the Chief’s black sex, adding a couple of fingers to the mix and probing knuckle-deep into her drooling slit. She grunts, stamps her legs, and flicks her tail at you some more, but ultimately her protestations give way to moans and gasps of pleasure. Her pussy winks at you, clenching around what it desperately wishes was a huge, throbbing leithan erection spearing it. Instead, all you give it are progressively more fingers, adding on until your whole fist is pulling her womanhood open - and even that feels like it pales in comparison to the kinds of meat this buxom beauty was made to take!");

		if (pc.biggestCockLength() >= 24)
		{
			if (pc.biggestCockLength() >= 36)
			{
				output("\n\nWell, you’ll give her a run for her money! As monstrously hung as you are, even a mighty leithan’s quim is barely enough to contain your manhood. You have every intention of leaving her a gaped, orgasming mess by the time you’re done!");
			}
			else
			{
				output("\n\nShe looks like a perfect fit for someone as ludicriously endowed as you!");
			}

			output("\n\nWhen it’s all said and done, the opportunity to slam your [pc.cock "+cIdx+"] into a leithan’s titanic pussy sends a thrill through you: finally, someone who can actually take all of your incredible length! No more bottoming out in a girl after just the tip, oh no. Leithans are built to take ‘em, and considering the Chief’s a big girl even among her own towering kind, you’re sure that horsebutt of hers can take all you’ve got to offer!");

			output("\n\nLicking your lips with anticipation, you shuck your [pc.gear] and grab your [pc.cock "+cIdx+"], making sure to pump the meaty shaft to full mast while the Chief’s still glancing at your over her shoulder. Her eyes widen with what you assume to be animalistic lust as she’s given the full show of what you’re packing.");

			if (pc.biggestCockLength() >= 36)
			{
				output("\n\n<i>“Holy shit,”</i> she gasps as you swing your mammoth erection to bear on her cunny, dropping the [pc.cockHead "+cIdx+"] to rest right on the lips of her black quim. <i>“What kind of cock-drugs have you been taking!?”</i>");

				output("\n\n<i>“The kind that make you perfect for pounding naughty leithans into the ground,”</i> you answer with a smirk.");
			}
			else
			{
				output("\n\n<i>“Woah,”</i> the Chief says, eyeing you with clear appreciation. <i>“Never would have expected something like that on");
				if (pc.tallness < 72) output(" a little thing like you");
				else output(" anybody but a leithan!");
				output("”</i>");

				output("\n\nYou grin with the raw compliment on your immense physique, even as you’re busy hefting your member up and aligning it with the Chief’s black slit.");
			}

			output("\n\n<i>“Ready?”</i> you ask, stirring your cockhead around in the earthy, musky swamp of the Chief’s horsecunt.");

			output("\n\nShe shivers visibly, locking her fingers around the big, dark mounds of her pornstar’s rack, nodding hurriedly over her shoulder. <i>“Q-quit pussyfooting and put it in already!”</i>");
			
			output("\n\nWell, if that’s what she wants! You reach forward, digging your fingers into the amazon’s plated flanks and use them like anchors to pull yourself in. Inch by inch, your [pc.cock "+cIdx+"] sinks into the silken slit of the Chief’s quim, spreading the slick, hot walls wide open around your animalistic girth. The sheer force of your entry, even as slow as it is, makes the Chief gasp and stagger forward, pressing her chest against the bulkhead as you steadily fuck your way into the steamy embrace of her quim.");
			
			output("\n\n<i>“O-oh <b>fuck!</b>”</i> she cries out, clawing her fingers at the unyielding steel of the bulkhead. <i>“S-so big... take it slow!”</i>");
			
			output("\n\nYou can’t go much slower, unless she wants you to cum before you’re half way in. Then again, the way her pussy’s clenching and squirting around your shaft, something tells you she doesn’t <i>want</i> you to slow down. Quite the opposite. Giving her a reassuring rub on the haunch, you give the buxom amazon a second of stillness to adjust to you as best she can... before you grab two handfuls of ass and ram yourself in to the hilt.");

			output("\n\n<i>“Gah!”</i> she screams, knees buckling. She staggers, groping helplessly at the smooth metal around her until she’s slinking onto her forelegs’ knees, body still rocking with the ecstatic shockwaves of your surprise attack. You can’t help but appreciate the way her big tits spread out like clay on the cold steel, and the spastic way her twat squeezes and cums around your shaft, spraying your thighs with thick, musky leithan fem-cum. <i>“B-"+ pc.mf("bastard", "bitch") +"! I said-”</i>");

			output("\n\nYou shush her, affectionately rubbing her up-raised rump. Her tail weakly swats at your face, trying to punish you for taking her down like that... but ending up just caressing your cheek like a lover’s tender hand. With your cock buried to the hilt in her gaping twat and your hands sensuously massaging her broad behind, the Chief can’t seem to muster the will to do anything more but moan and grope at her chest - she can’t even get up! Considering the way her body’s still clenching like mad around your member, you can only imagine how weak-kneed you’ve made her with one thrust!");

			output("\n\nNow that she’s down on the deck, ass in the air and wetter than a whole gang of ausar cum-sluts, you can finally go to work. Still squeezing and caressing her horse’s ass, you gingerly rock your entire body back, hips and all, to drag your behemoth cock back through her slick passage. The Chief moans ecstatically, squirting even more leithan-juice around your shaft to ease your movements. She’s a veritable lube-factory back here, so wet that you’re practically sliding right out of her, as far as the awkward angle can take you, before hammering back home.");

			output("\n\nThe first few thrusts like that make the Chief scream, a mix of profanities and condemnations that only a star-sailor like her could come up with, but that’s a passing phase that her body completely betrays, convincing you of her absolute enjoyment by treating your cock like a king inside her, caressing and squeezing it in her lube-bath slit like nothing you’ve felt before. So you fuck her harder, steadily picking up speed until you’re baring down on the prostrate leithan, fingers dug into her hips and pounding away.");

			output("\n\n<i>“Oh fuck! Oh fuckohfuckohfuck!”</i> she screams, flailing her tail and scrambling her legs weakly on the ground as you hammer her cunt amid a geyser of juices. <i>“H-Harder! Faster! Don’t let up!”</i>");
			
			output("\n\nNow that’s what you like to hear. You give her a smart smack on the ass for good measure, keeping her embroiled in pleasurable sensation while you fuck her just as hard as you want, taking every advantage of the eager cock-sleeve you’ve made. The Chief’s pussy feels absolute tailor-made for your [pc.cock "+cIdx+"], conforming to its every ridge and contour like a glove as its owner squeezes you again and again, rhythmically massaging your entire shaft from crown to base.");
			
			output("\n\nThe way she’s treating your prick, it’s not long before you feel the inevitable, wonderful pressure start churning in your [pc.balls]. You grunt, trying to hold it back, to take every second of ecstasy you can from the perfect pussy between the Chief’s ample haunches, but your baser side simply won’t be denied.");
			
			output("\n\n<i>“Gonna-”</i> you manage to grunt out between gritted teeth. The Chief gasps, suddenly squirming under you, but your lusts take full control and slam your hips against her ass, burying yourself to the hilt and leaving her a cumming mess on the floor for you to pump full of [pc.cum]. She lets out an orgiastic cry of pleasure as your [pc.cock "+cIdx+"] throbs and spurts, letting loose a thoroughly-milked load of [pc.cumNoun] deep into her womb.");

			output("\n\nWhen the orgasm passes, the Chief’s left panting, gasping for breath, resting her bunny-eared head against the bulkhead while you pump her sodden slit full of cum. Her chest heaves, making those amazing tits of hers jiggle and quake with every breath, and her twat is a waterfall of lurid juices even before you finally pull out of her.");

			if (pc.race().indexOf("leithan") != -1) output("\n\n<i>“W-what did... ugh,”</i> the chief finally manages to say when you’re thoroughly-spent cock flops out of her gaping slit. A rush of [pc.cumNoun] comes with it, splattering in thick clumps across the deck. <i>“Gimme some warning next time... should really ask before you dump a load in a girl like that!”</i>");
			else output("\n\n<i>“Ugh,”</i> the chief finally manages to say when you’re thoroughly-spent cock flops out of her gaping slit. A rush of [pc.cumNoun] comes with it, splattering in thick clumps across the deck. <i>“I’m gonna be swimming in my armor after this, aren’t I?”</i>");

			output("\n\nConsidering that, from where you’re standing, the Chief’s backside looks like she just took a kui-tan cumbath... yeah, pretty much.");

			output("\n\nShe huffs, slowly staggering up onto all sixes. When she does, the real result of your lusty interlude cums rushing out of her wide-open sex, all but pouring back onto the deck. She blushes darkly, biting her lip as her thick slit discharges the leftovers of your fucking... though you know that there’s still plenty left inside, sloshing around in her slippery channel.");

			output("\n\n<i>“Shut up,”</i> she snaps, even though you’ve not said a word, putting an arm around her chest and using her tail to pick up her armor from where it fell on the deck. Half of it’s plastered in spunk, of course.");

			output("\n\nYou hide a smirk as she ends up slathering her tits in your cum under her armor, but eventually end up helping her strap on her back plates before gathering up your own, equally soaked, gear. At least your Codex is water-proof. Right?");

			pc.changeEnergy(-5);
			pc.changeLust(15);
			pc.orgasm();
			processTime(10+rand(3));
			sweatyDebuff(1);
			IncrementFlag("FUCKED_CHIEF_NEYKKAR");

			clearMenu();
			addButton(0, "Next", mainGameMenu);
		}
		else
		{
			output("\n\nThere’s no way you’re going to be able to fill that pussy.");
			if (pc.biggestCockLength() >= 6) output(" You’re not small by any means, but the Chief’s hole is so wide-open and cock-hungry that you doubt you’d be able to touch more than one wall at a time!");
			else output(" Your comparatively tiny cock would barely feel like more than a finger for her, and you’d be tossing a hotdog down a hallway for yourself!");
			output(" So you turn your sights elsewhere, tracing your gaze up her powerhouse of a rear. As much as her slavering pussy might try to draw your attention back, you find yourself more and more fixated on the puffy black ring riding above it.");

			output("\n\n<i>“H-hey! What’re you-”</i> the Chief gasps as you trace a finger around her backside. <i>“That’s...”</i>");

			output("\n\nYou cut her off by sliding a finger in, spreading out the clenching little hole. It’s nice and tight, feeling much more like a human pussy than the gaping slit beneath it. Her butt squeezes gently around your finger, massaging you like a hot, silky glove. The Chief grunts uncomfortably at first, but the way she bites her lip and scrapes her feet along the deck, you don’t doubt she enjoys a little anal play.");
			
			output("\n\nPulling your digit out, you squirm out of your [pc.gear] and toss your kit aside, grabbing your [pc.cock "+cIdx+"] and moving your [pc.hips] in line with the Chief’s own. Her tail lifts and curls around your waist, locking you tight against her and pulling you in until your [pc.cockHead "+cIdx+"] is pushing against the silken-soft donut of her ass.");
			
			output("\n\n<i>“Just take it gentle,”</i> she finally says, trying to relax her clenching muscles. <i>“Last thing I need is to be sore after this.”</i>");

			output("\n\nYou promise you’ll be the perfect gentle [pc.manWoman] with her ass, and start to softly grind your hips in. The Chief gasps and clutches at her tits, biting hard on her lip to suppress what you imagine to be a hell of a moan. For your part, you grunt and gasp as your [pc.cock "+cIdx+"] is slowly submerged into the puffy black ring and the roiling heat inside.");

			output("\n\nThe pressure is incredible, crushing down on you with all the might you’d expect from the titanic amazon. She’s not inherently all that tight, though, so you’re able to make slow but steady progress against the Chief’s instinctive attempts to push you out. You’d worry you’re doing something wrong, if that juicy cunny of hers wasn’t splattering your thighs with fem-slime while she pinches her big black nipples and bucks uses her tail to hold you close. It takes what feels like an agonizingly pleasurable eternity before you’re fully buried inside her, probing her colon with your cockhead.");

			output("\n\nAfter a few moments, the Chief finally relaxes enough for you to try and move. You know to take it nice and easy with her, gently rocking your hips back and forth and letting the steamy embrace of leithan ass work wonders on your dick. The way her muscles contract and squeeze with every inch you move is heavenly, a sure sign of her own growing enjoyment. The Chief lets out a sultry moan, groping at her massive tits and pushing back against your thrusts with steadily growing intensity. A few moments of that treatment, and you’re not sure who’s fucking who anymore: she’s got you grabbed firm, holding you right where she wants to while her mighty tauric frame pounds back against your [pc.cock "+cIdx+"], taking it to the hilt with ease again and again.");

			output("\n\nResigning yourself to your fate, you hook your fingers into the Chief’s plated flanks and hold on as the leithan butt-slut takes you for a ride!");

			output("\n\n<i>“D-didn’t I say to take it easy!?”</i> she grunts over her shoulder, even as she’s pinching a black nipple and using four of her legs to pump her ass back against you. <i>“Can’t believe I’m... ahhh... letting you...”</i>");

			if (pc.isAss())
			{
				output("\n\n<i>“Oh, shut up!”</i> you snap back, slapping the Chief right on her rump.");
			}
			else
			{
				output("\n\n<i>“Yeah, yeah,”</i> you moan through gritted teeth, trying not to let the vice-like grip of her backdoor just milk you to orgasm right then and there.");
			}
			output(" For someone claiming to be an anal novice, the Chief’s definitely got some serious talent back there! She huffs at you, feigning offense, but a thrust of your [pc.hips] to drive your [pc.cock "+cIdx+"] ");
			if (pc.balls > 0) output("balls-");
			else output("deep in her turns her voice into a whining moan of pleasure.");

			output("\n\nThe Chief’s clawed feet scrape heavily against the deck, grinding her brick house of a behind against you just as hard as you’d imagine a creature as huge as she is would. Her pussy is a veritable furnace, rubbing ceaselessly");
			if (pc.balls <= 0) output(" against your thighs");
			else output(" against your churning balls");
			output(" and smearing you with a growing coat of musky leithan excitement. Her tail squeezes you tight, never letting you do much more than move your own hips against hers, doubling the speed of her anal violation. Her former protestations fade away, replaced by grunts of approval, then cries of your name and how much she wants you to fuck her harder, faster, deeper.");

			output("\n\n<i>“Keep it up, Steele,”</i> she all but screams, throwing her head back and stamping her powerful legs. <i>“This isn’t... isn’t half as bad as I thought.”</i>");

			output("\n\n<i>“Is that all?”</i> you quip, reaching a hand down and shoving a few fingers effortlessly into her equine-like quim.");

			output("\n\nShe shrieks, fingers disappearing into the yielding flesh of her chest as she succumbs to the sudden pleasure. <i>“Fine! It’s fucking great!”</i> she growls, moving a little faster. You shove your arm deeper, going full-fist into her silken slit between vigorous thrusts of your hips against her asshole. <i>“Better than great! Amazing!”</i>");

			output("\n\nYou grin, trying to ignore how close you are to climax. Something inside you demands you make sure the amazon orgasm first, to make her eat her words about this being the wrong way. Then again, the way she’s moaning and gushing slime all over your crotch from her gaping pussy, you don’t think she’s got much resistance left. All there’s left to do, really, is hold out longer than she can: fight back your basest desires and hammer yourself deep inside.");

			processTime(10+rand(3));
			pc.changeEnergy(-5);
			pc.changeLust(15);
			sweatyDebuff(1);
			clearMenu();
			addButton(0, "Next", lustyBugPonyCockedNotTaurII);
		}
	}
	else
	{
		if (pc.originalRace.indexOf("leithan") != -1) output("You were born for this, formed from birth to mount luscious beauties like the Chief here and drive your [pc.cock "+cIdx+"] deep into their slavering, hungry wombs.");
		else output("You’ve long since changed yourself into the perfect form for just this occasion, ready and eager to thrust yourself deep inside this leithan beauty to spear her womb, flood it with your potent seed.");
		output(" You canter around the Chief’s tauric body, finding the clasps of her armor and tearing them open as you go. By the time you’re behind her, the Nova Securities plates clatter to the deck, leaving her black and yellow leithan chitin exposed.");

		output("\n\nThat, and the lush black lips of her sex, and the dark donut above it. The Chief’s pussy is nice and wide, perfectly tear-drop shaped and smeared with slimy, sweet-smelling leithan arousal. You drink the smell in, letting it burn into your mind and set your heart ablaze. Blushing over her shoulder, the Chief curls her tail up and over her back, completely exposing herself to you, making way for your manhood. Before the fun starts, though, you can’t help but reach down and give her rump an appreciative grope, brushing your fingers along the thick black lips of her sex.");

		output("\n\nShe gasps, and your fingers come away smeared with slime that bridges their tips to the Chief’s pussy. You lick your fingers clean, getting a taste for the thick, rich lubricant the amazonian warrior is swamped with. <i>“Stop perving out!”</i> the Chief snaps, whacking your hand with her tail. <i>“Just get on with it already - I feel like my whole body’s on fire!”</i>");
		
		output("\n\n<i>“Alright, alright,”</i> you answer, rubbing your wrist. While she recovers, you grab your [pc.gear] and peel it off, letting your stiffening cock bob freely. The Chief curls her tail back out of the way and wiggles her hips enticingly, giving you the last bit of motivation you need. You step back, aligning yourself with the Chief’s hindquarters, and take a running lunge up onto her. She yelps, knees buckling and hands grasping at the deck as your bestial weight settles atop her, [pc.legs] grasping at her toned flanks and [pc.chest] pushing against her back.");
		
		output("\n\nThe Chief’s feet scramble on the deck, bucking under your massive weight. <i>“O-oh <b>fuck</b>!”</i> she gasps, feeling your tumescent manhood prodding blindly at her silken slit. <i>“I feel it! I feel-”</i>");

		output("\n\nHer words twist into a roar of pleasure as your [pc.cock "+cIdx+"] finds its mark, ramming into the sodden channel between her legs. The Chief’s pussy grasps hard around your spearing length, like a hot silk glove giving you a handy every inch of the way until you’re utterly buried inside her");
		if (pc.balls > 0) output(" and your [pc.balls] are bouncing on her rump");
		output(". Her tail curls around one of your [pc.legs], pulling you as close against herself as she can as juices pour like a waterfall around your shaft. Damn, but she was ready for this!");

		output("\n\nYou grab a handful of tit and squeeze, making her clench down all the harder on your [pc.cock "+cIdx+"]. Her back arches against your [pc.chest], hands desperately grabbing at your human half’s hips and your own hands, trying to find something to hold on to while you hammer your [pc.hips] against her plated ass, pounding in that amazonian cunny. The sheer force of your fucking sends the pair of you staggering forward, pushing the Chief’s chest against one of the bulkheads and spreading her malleable tits out in a lake of quaking gray flesh.");

		output("\n\nThe sight of her body bouncing against the wall, feeling her breasts flow like dough through your fingers and her velvety pussy squeeze you so tightly... it all combines to drive you absolutely wild with lust. It isn’t long before you feel the rush of need building in your loins, the insatiable desire for release - the absolute biological imperative to spill your seed into the Chief’s eager womb.");

		output("\n\nBy the way her cunt is contracting and splattering the deck with fem-spunk, she’s clearly ready for you. Your [pc.balls] churn");
		if (pc.balls <= 1) output("s");
		output(", swelling with rising orgasm. The bliss of climax burns through you, raging in your loins until you can contain it no longer. With a feral roar, you slam your [pc.hips] flush with the Chief’s mighty rump, burying your [pc.cock "+cIdx+"] as deep as you can into the leithan’s silken cunny before you bust your nut and flood her womb with [pc.cumNoun]. The Chief screams as the first gush of steaming hot [pc.cumNoun] bastes her insides.");

		if (pc.race().indexOf("leithan") != -1) output("\n\n<i>“D-did you...”</i> the Chief whines, shuddering as you just keep pouring cum into her. <i>“Asshole!”</i>");
		else output("\n\n<i>“Ugh,”</i> the chief grunts, shivering in a way that makes her tits positively quake in your hands while you dump spunk into her. <i>“Dammit. You could at least ask before you bust a nut in a girl!”</i>");

		output("\n\nShe tries to glare at you over her shoulder, but one good squeeze of her bust turns her look into a lustful moan and a final clench around your member. Her cheeks are still nice and flushed by the time your softening member droops out of her, unleashing a small flood of your mixed juices. You give the Chief’s supple flanks a parting squeeze with your lower legs before skittering back and dropping onto the deck with a might <i>THUNK</i>.");

		output("\n\nThe Chief canters around to face you, using her tail to lift up some of her discarded armor plates. <i>“Gotta admit,”</i> she murmurs, buckling her breastplate back on to cover her heaving breasts. <i>“Feel a whole lot better now. I guess the cure for whatever those monster spew is just to... just to give in and do it.”</i>");

		if (pc.isMisc())
		{
			output("\n\n<i>“Or do you,”</i> you tease, giving her a swat on the rear.");

			output("\n\nThe Chief huffs and returns it with a less than friendly punch on the shoulder. <i>“Behave, pervert. Unless you </i>want<i> that to be");
			if (flags["FUCKED_CHIEF_NEYKKAR"] == undefined) output(" a one-time deal");
			else output(" the last time I let you do that");
			output(".”</i>");

			output("\n\nYou roll your eyes. Something - like the way her black lower lips are winking wetly at you - tells you that it’s a very, very hollow threat.");
		}
		else
		{
			output("\n\nGood thing the two of you have that figured out. If either of you get blasted by the mutants’ pink gunk again, you’ll just have to be ready to... help out... the other. Can’t go into battle half out of your mind with lust, right?");
		}

		output("\n\nGiving the Chief a smile, you grab your gear and kit back up.");

		processTime(10+rand(5));
		IncrementFlag("FUCKED_CHIEF_NEYKKAR");
		pc.orgasm();

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function lustyBugPonyCockedNotTaurII():void
{
	clearOutput();
	chiefNeykkarHeader(true);

	output("The next few seconds stretch out like an eternity, a lifetime spent indulging in unspeakable pleasures of the flesh that have your whole body on edge, tingling with the pent-up need to spill your seed into the welcoming embrace of the leithan’s bowels. Finally, though, the Chief lets out a shrill scream, and her pussy clenches hard around your fist, drawing your [pc.arm] deeper and deeper in with the sudden, violent contractions. At the same time, her dark asshole gives you a firm but surprisingly gentle squeeze, a mere echo of the tumultuous chaos that’s going on between her legs. But it’s enough - more than enough by a Jovian mile - to pull you over the edge with her.");

	output("\n\nYou cum. Not a gentle, loving climax, but a violent eruption of pent-up [pc.cum] that seems to tear its way out of your fatigued body. You can’t even manage a scream, not even a grunt of effort, just a silent gasp of pleasure as you’re drawn as deep into the cock-hungry leithan as you’ve ever been and forced to plaster her silken insides with every last drop of [pc.cum] you have to your name.");

	output("\n\n<i>“Oh, <b>fuck!</b>”</i> the Chief grunts, even as you’re still spasming and squirting the aftershots of your orgasm deep inside her ass. <i>“Fuck, Steele... that was... you were...”</i>");

	output("\n\nYou manage a ragged groan, gradually realizing that at some point in the proceedings the Chief’s cantered back and slammed you against a bulkhead, crushing you between her massive body and the unyielding steel. Every bone in your body starts feeling sore a moment later, like you’ve been running track for ten hours straight.");

	output("\n\nEither not noticing, or not acknowledging, your condition, the Chief unfurls her tail and steps forward, leaving you to support yourself for the first time in what might have been several minutes. You almost collapse, only keeping upright by grabbing two big handfuls of leithan rump. She gasps, glancing over her shoulder with a noticeable dark-gray flush on her cheeks. You glance down, and see that your unintended grope has somehow massages a nice, thick, [pc.cumColor] trickle to come out of her black donut, dripping viscously to the floor.");

	if(flags["FUCKED_CHIEF_NEYKKAR"] == undefined)
	{
		output("\n\n<i>“Unf. I hope you’re proud of yourself, Steele,”</i> she says with a roll of her starry eyes. <i>“Taking a poor woman’s anal virginity like that... and now I’m going to be a mess inside my armor! You’re lucky we’re kind of in the shit here, or I might just make you clean that up!”</i>");

		output("\n\nSomehow, you don’t doubt it.");

		output("\n\nWearily, you persuade your fingers to release the Chief’s ass and start fumbling for your gear. While you’re bent over searching for your [pc.weapon], your newly-christened lover canters around and grabs you by the shoulders. You look up just in time to get your face mashed between the biggest, softest pair of tits you’ve seen in what feels like an eternity.");

		output("\n\n<i>“Thanks,”</i> she whispers, barely audible over the ambient groans of the <i>Kashima</i>’s hull. <i>“I think that’ll keep my head in the game for a good, long while.”</i>");

		output("\n\nShe’s got a strange way of saying, <i>“Thanks for the lay.”</i>");
	}
	else
	{
		output("\n\n<i>“What did I say about gentle?”</i> the chief huffs, trying to sound annoyed even as she’d dripping a mix of your cum and hers all over her thighs. <i>“Ought to keep you pinned to that bulkhead until you’ve cleaned up this mess with your tongue.”</i>");

		output("\n\nYou roll your eyes, letting her pretend to be all tough and put out about the whole thing. Whatever helps her keep her cool. Still and all, after a few moments of awkward silence, you’re treated to a busty hug from the towering hunk of leithan, and then it’s back to business, all armor and guns as she turns her attention to the dangers around you.");
	}

	IncrementFlag("FUCKED_CHIEF_NEYKKAR");

	processTime(5+rand(5));
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}


public function kiHendersonVictory():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	clearOutput();
	author("Savin");
	showName("VICTORY:\nHENDERSON");
	showBust("USHAMEE_NUDE_PREG");

	// used the cure to end the fight
	if (enemy.hasStatusEffect("Parasite Cure") && enemy.statusEffectv1("Parasite Cure") == 5)
	{
		output("You turn to her with a smile, saying that you and that doctor made a cure. Everything’s going to be alright now... assuming you can get that miniature tentacle out of her. As if on cue, she grunts and kicks up her middle two legs around her swollen belly, clutching it tight as the gray flesh and chitin plates bulge. Whatever’s taken root in there is still plenty active!");

		output("\n\nWhile Chief Neykkar is holding her belly, you’ve got a moment to think. You might be able to get the parasite out of her in the MedBay");
		if (flags["KI_VANDERBILTS_SECRET"] != undefined) output(", assuming Elenora hasn’t succumbed to her own medicine, anyway. You don’t really know how to use all that medical tech yourself");
		output(". Then again, despite how dangerous these parasites are, Steele Tech could make a killing off them with a little research... the applications of a copywritten species are nearly limitless, the sort of thing that can make or break smaller companies. Sex toys, military applications, even medicine - it’s hard to know what these little bastards could turn into, if you just bring back live, unharmed samples. One that hasn’t bonded to a victim, and won’t be harmed in removal. Like the one in the Chief’s womb...\n\n");
		
		flags["KI_CURE_USED"] = 1;
		// key item is removed during course of fight if we ended up here
		
		CombatManager.genericVictory();
		
		processTime(2);
		
		clearMenu();
		addButton(0, "MedBay", kiHendersonMedbay, undefined, "Medical Bay", "Take Chief Neykkar to the MedBay and see about removing the parasite. Given half a chance, she’ll probably kill it.");
		addButton(1, "SteeleTech", kiHendersonSteeleTech, undefined, "Steele Tech", "Call for retrieval from Steele Tech and convince Chief Neykkar to let them take the parasite.");
	}
	// has the cure, but either didn't attempt to, or didn't complete using it during the fight
	else if (pc.hasKeyItem("Parasite Cure") && (!enemy.hasStatusEffect("Parasite Cure") || enemy.statusEffectv1("Parasite Cure") < 5))
	{
		output("Under your sustained");
		if (enemy.lust() >= enemy.lustMax()) output(" sensual");
		output(" assault, Henderson throws his head back with a bestial roar... and then collapses. You give a long, weary sigh and put away your [pc.weapon].");
			
		if (!enemy.hasStatusEffect("Free Chief"))
		{
			output("\n\n<i>“[pc.name]!”</i> the leithan merc behind you yelps, struggling in bonds. The tentacle is still brutally fucking her horse-like twat, making her whole body shudder. She wiggles urgently in the tentacles’ grasp as you run over and pull them off her limbs, hurrying before more mutants show up. You slice away most of the tentacles, quickly getting the Chief free... save for the one huge, thick tentacle lodged in her cunt.");
			
			output("\n\nIt’s lodged in tight, preventing the belly-bloated ‘taur from moving. While you still have time, you hop around behind her and grab the tentacle, hoping to yank it out of her. Instead, the tentacle pulsates, creampies the Chief with an explosion of pink juices that make her shriek, and then detatches from its host, breaking off and slithering out of your hands... and disappearing into Chief Neykkar’s belly. She grunts and gasps, flailing her arms at her belly as it bloats out even more. You can see her skin writhing under her chitin plates, squirming as the tentacle moves inside her. Oh, shit.");
			
			output("\n\n<i>“Fuck. Ah-ah no God fuck it’s ins- fuck I’m cumming aahhh!”</i>");
			
			output("\n\nShe clenches, screaming and flopping bonelessly onto her side and spilling fuck-juices like a waterfall out of her horsecunt.");
		}
		else
		{
			output("\n\n<i>“[pc.name]!”</i> the leithan merc beside you yelps. The tentacle slithering around deep in her horse-like twat seems aware of its breatherens defeat, its squirming struggles redoubling the moment the ex-commander hit the deck.");
		}
			
		output("\n\nDammit. You look around in a panic, with no idea what to do about that - other than use the cure. You tell the chief to keep calm before running towards the Fire Supression controls, throwing it open and hacking away another squirming tentacle that’s worked its way inside the box. When it’s gone, you’re able to replace the fire foam sample with the cure in the matter replication system, and then trip the alarm.");
		
		output("\n\n A klaxxon starts blaring from overhead, a shrill alert against an imaginary flame. Jet-sprays appear from the walls and ceiling and start gushing geysers of nano-machines over the deck. The tendrils covering the room start writhing, then withdrawing. They uncurl from around the trapped Nova and Steele crewmen, who collapse limply to the ground as tentacle-cocks withdraw from their every hole and slither back into Hendersone’s prone form.");
		
		output("\n\nThe deck is clear in minutes. The tentacles that had covered Engineering all seem to make their way back into Henderson, bloating him immeasurably.");
		if (silly) output(" He looks like a damn pile of spaghetti now!");
		
		output("\n\n<i>“Holy shit!”</i> Chief Neykkar gasps,");
		if (!enemy.hasStatusEffect("Free Chief")) output(" struggling to her feet");
		else output(" lowering her weapon");
		output(". <i>“You... you did it! What did you do?”</i>");

		output("\n\nYou turn to her with a smile, saying that you and that doctor made a cure. Everything’s going to be alright now... assuming you can get that miniature tentacle out of her. As if on cue, she grunts and kicks up her middle two legs around her swollen belly, clutching it tight as the gray flesh and chitin plates bulge. Whatever’s taken root in there is still plenty active!");

		output("\n\nWhile Chief Neykkar is holding her belly, you’ve got a moment to think. You might be able to get the parasite out of her in the MedBay");
		if (flags["KI_VANDERBILTS_SECRET"] != undefined) output(", assuming Elenora hasn’t succumbed to her own medicine, anyway. You don’t really know how to use all that medical tech yourself");
		output(". Then again, despite how dangerous these parasites are, Steele Tech could make a killing off them with a little research... the applications of a copywritten species are nearly limitless, the sort of thing that can make or break smaller companies. Sex toys, military applications, even medicine - it’s hard to know what these little bastards could turn into, if you just bring back live, unharmed samples. One that hasn’t bonded to a victim, and won’t be harmed in removal. Like the one in the Chief’s womb...\n\n");

		
		flags["KI_CURE_USED"] = 1;
		
		// Cure could have been removed on the lead up to this point-- if not, remove it now
		if (pc.hasKeyItem("Parasite Cure")) pc.removeKeyItem("Parasite Cure");
		
		//[MedBay] [Steele Tech]
		CombatManager.genericVictory();
		
		processTime(5);
		
		clearMenu();
		addButton(0, "MedBay", kiHendersonMedbay, undefined, "Medical Bay", "Take Chief Neykkar to the MedBay and see about removing the parasite. Given half a chance, she’ll probably kill it.");
		addButton(1, "SteeleTech", kiHendersonSteeleTech, undefined, "Steele Tech", "Call for retrieval from Steele Tech and convince Chief Neykkar to let them take the parasite.");
	}
	// doesn't have the cure at all
	else
	{
		output("Under your sustained");
		if (enemy.lust() >= enemy.lustMax()) output(" sensual");
		output(" assault, Henderson throws his head back with a bestial roar... and then collapses. You give a long, weary sigh and put away your [pc.weapon].");

		if (!enemy.hasStatusEffect("Free Chief"))
		{
			output("\n\n<i>“[pc.name]!”</i> the leithan merc behind you yelps, struggling in bonds. The tentacle is still brutally fucking her horse-like twat, making her whole body shudder. She wiggles urgently in the tentacles’ grasp as you run over and pull them off her limbs, hurrying before more mutants show up. You slice away most of the tentacles, quickly getting the Chief free... save for the one huge, thick tentacle lodged in her cunt.");

			output("\n\nIt’s lodged in tight, preventing the belly-bloated ‘taur from moving. While you still have time, you hop around behind her and grab the tentacle, hoping to yank it out of her. Instead, the tentacle pulsates, creampies the Chief with an explosion of pink juices that make her shriek, and then detatches from its host, breaking off and slithering out of your hands... and disappearing into Chief Neykkar’s belly. She grunts and gasps, flailing her arms at her belly as it bloats out even more. You can see her skin writhing under her chitin plates, squirming as the tentacle moves inside her. Oh, shit.");

			output("\n\n<i>“Fuck. Ah-ah no God fuck it’s ins- fuck I’m cumming aahhh!”</i>");
			
			output("\n\nShe clenches, screaming and flopping bonelessly onto her side and spilling fuck-juices like a waterfall out of her horsecunt. Dammit. You look around in a panic, with no idea what to do about that... but you don’t have much time to decide. You can hear screeching and snarling from all around - more infected coming to play! And worse, with Henderson down on his face, the Nova and Steele crew plastered to the walls start moving, shivering and shuddering and opening glowing pink eyes.");
		}
		else
		{
			output("\n\n<i>“[pc.name]!”</i> the leithan merc beside you yelps. The tentacle slithering around deep in her horse-like twat seems aware of its breatherens defeat, its squirming struggles redoubling the moment the ex-commander hit the deck. You look around in a panic, with no idea what to do about that... but you don’t have much time to decide. You can hear screeching and snarling from all around - more infected coming to play! And worse, with Henderson down on his face, the Nova and Steele crew plastered to the walls start moving, shivering and shuddering and opening glowing pink eyes.");
		}
		
		output("\n\nOh, fuck. You look around in rising panic, grabbing your [pc.weapon]");
		if (!enemy.hasStatusEffect("Free Chief")) output(" and shoving the Chief’s machinegun into her hands");
		output(". <i>“Come on!”</i> you shout, pulling her to her feet. <i>“We. Are. LEAVING!”</i>");
		
		output("\n\nShe shoulders her weapon unsteadily, staring at her own crew as they wriggle out of the tentacle restraints. <i>“What... what about...”</i>");
		
		output("\n\n<i>“Forget ‘em!”</i> you shout, turning towards the exit. No way the Chief is fitting in the vents, so the cargo elevator is your only hope. The only thing still working. As quick as you can, you start running for the entrance, all but dragging the Chief with you. Luckily, the elevator’s already on your level, full of mutants that are quickly bashed or shot until they fall aside. You punch the elevator, telling it to take you back to the Command Deck.");
		
		output("\n\nChief Neykkar curses and shouts all the while, yelling that she’s not going to abandon her crew. Not like this. And the whole time, she’s punctuating her sentances with shrieks of pleasure, groaning and cantering about as her parasitic tag-along squirms around inside her. Poor thing.");
		
		output("\n\nYou reach over and put a reassuring hand on her flank. The best you can do in the circumstances. She scowls at you, looking away to check her weapon’s giant drum. There’s nothing you can do for her crew - especially not now, when the Engineering deck is flooded with dozens of mutants. Maybe every one of them left aboard.");
		
		output("\n\nFor now, you and your companion come first. You make it to the medical bay and pound on the door, trying to get Elenora’s attention. She opens it a moment later, just as you’re starting to hear distant screeches from down the corridor.");
		
		output("\n\n<i>“Get in, quick!”</i> the doc yelps, ushering you and the Chief in with wide eyes. She seals the door behind you, putting her back to it as the first mutants arrive and start banging away at it. <i>“W-what happened down there?”</i>\n\n");

		CombatManager.genericVictory();
		
		processTime(3);
		
		clearMenu();
		addButton(0, "Next", kiHendersonNoCure);
	}
}

public function kiHendersonNoCure():void
{	
	clearOutput();
	author("Savin");
	showName("VICTORY:\nHENDERSON");
	showBust("ELENORA", "USHAMEE_NUDE_PREG");

	output("<i>“The whole crew’s infected. Of both ships,”</i> you say, casting a glance to the leithan beside you. She’s too busy staggering and rubbing her belly to acknowledge you. <i>“The ship’s crawling with them, now.”</i>");

	output("\n\nElenora sighs heavily, glancing between you and the mutants now battering at the sealed doors. <i>“What are we supposed to do, then? How do we...?”</i>");
	
	output("\n\nThe Chief grunts and staggers over, planting her hands on the desk across from Elenora and scowling at the both of you. <i>“Look. I don’t know who you are, lady. I don’t care. My whole crew’s been taken over by these... these things. I’ve got one - ugh! - in my gut right now. You’ve been here longer, so answer me. What the <b>fuck</b> are these things, and how do I kill them?”</i>");
	
	output("\n\n<i>“I-I don’t know?”</i> Elenora murmurs, recoiling from the over-aggressive leithan. <i>“I didn’t even detect them when they first came aboard, and nothing any of us have tried could stop them. Or their hosts. They regenerate too quickly, only stay down for a few seconds. They’re unstoppable now!”</i>");
	
	output("\n\n<i>“Bullshit!”</i> Chief snaps, pounding a fist on the table. <i>“We have to be able to do something!”</i>");
	
	output("\n\nYou try and catch her attention, urge her to calm down, but the pregnant leithan is having nothing of it. She bares down on Elenora until the doctor is hunkering down in her chair, squirming under the Chief’s withering gaze.");
	
	output("\n\n<i>“I-I’m sorry, but even if we had some kind of cure, we’d never be able to distribute it to everyone. Not with what we have on-hand, and without getting swarmed and infected ourselves. Or worse!”</i>");
	
	output("\n\nThe Chief curses, turning away and grabbing her bloating belly. <i>“Dammit all! Where do we get a cure? How?”</i>");
	
	output("\n\nYou shake your head, putting a hand on her shoulder. <i>“It’s hopeless. We’ve got to get out of here, before...”</i>");
	
	output("\n\n<i>“We’re infected,”</i> Elenora says, cutting you off. <i>“She and I. I... I don’t know how long I can hold out.”</i>");

	if (flags["KI_VANDERBILTS_SECRET"] != undefined)
	{
		output("\n\nYou knew that, but... hearing her say she’s losing her grip doesn’t help your faltering mental state.");
	}
	else
	{
		output("\n\n<i>“W-what? You’re...”</i>");

		output("\n\nThe doctor casts her eyes down, avoiding your gaze. <i>“Since the captain found me. One of his tentacles... I can feel it inside. Inside my... pussy. Becoming a part of me. Making me want things, feel things....”</i>");

		output("\n\nShit.");
	}

	output("\n\nYou run a hand");
	if (pc.hairLength > 1) output(" through your hair");
	else output(" across your head");
	output(" and look between the two parasite-infested women. With both crews running the halls en-masse, there’s no way you can get out of the MedBay without being overrun. Even the vents will only lead you to more danger. What’s there left to do?");

	output("\n\nA long moment passes between the three of you. Finally, Elenora speaks up. Her voice is low, quiet; barely audible. <i>“This ship is too dangerous for you, [pc.name]. You need to leave.”</i>");

	processTime(2);
	
	clearMenu();
	addButton(0, "Next", kiHendersonNoCureII);
}

public function kiHendersonNoCureII():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nHENDERSON");
	showBust("ELENORA", "USHAMEE_NUDE_PREG");
	
	flags["KI_ESCAPE_UNCURED"] = 1;

	output("<i>“Hey, what-”</i> the Chief starts to say.");
	
	output("\n\nAgain, Elenora cuts her off. <i>“We’re infected. Dangerous. [pc.name] isn’t. [pc.HeShe] needs to leave, before we... before we hurt [pc.himHer]. Someone has to go for help. And you know it can’t be us. We can’t risk spreading the parasites.”</i>");
	
	output("\n\nShe’s not wrong, but still...");
	
	output("\n\nThe Chief curses and stomps around, but doesn’t countermand her. She knows Elenora’s right, no matter how much it makes her rage. When she calms down, the fire goes out of her completely, and she collapses onto the floor with all six legs spread out under her. <i>“Fine. Steele, you send someone to help us, alright? Don’t you dare abandon us!”</i>");
	
	output("\n\nHow are you even supposed to get off the <i>Kashima</i>? The shuttle is sealed, and there’s infected all over the halls.");
	
	output("\n\n<i>“I still have the key,”</i> the Chief says slowly. Her tail curls up, rubbing at her backside. <i>“I managed to hide it. Before the bastards ripped my gear off. I, uh.... Is there a changing room in here, doctor?”</i>");

	output("\n\nElenora points the way, and turns to you while the Chief slinks off to retrieve her key. <i>“You can still get around in the vents, I think. There may be infected in the launch bay, but if there are... you’ll just have to take that chance. I’m sorry. With communications still jammed, and the escape pods all gone... there’s no other choice. Just fly away and contact Steele Tech. Tell them what happened. The company will... they’ll take care of everything. I hope.”</i>");
	
	output("\n\nYou nod. Confederate C.D.C. probably won’t touch this, after all - way too far beyond their borders. And good luck convincing the Myr to, either. Steele Tech will have to handle the issue where you and Nova Securities failed.");
	
	output("\n\nA few minutes later, the Chief returns with the shuttle key. Wiped clean in the sink, at least. You stuff it in your pack and grab your [pc.weapon]. With a firm nod to the Chief and a parting farewell to Elenora, you scramble into the vents and start making your way down towards the hangar deck.");

	processTime(3);
	
	currentLocation = "KI-E25";
	generateLocation(currentLocation);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiApproachingEscapeShuttle():Boolean
{
	if (flags["KI_ESCAPE_UNCURED"] != undefined && flags["KI_ESCAPE_FIGHT"] == undefined)
	{
		output("\n\nYou hear a horrible screech of metal buckling and tearing. You spin around in time to see a vent shaft above you explode outwards, and several mutants crawl out of it, leaping down onto the deck just feet away from you. Oh, shit, here we go again!");

		var h:Array = [];
		for (var i:int = 0; i < 4; i++)
		{
			h.push(new InfectedCrewmember());
		}

		h[0].inventory.push(new SteeleTechSuit());
		h[0].createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);

		CombatManager.newGroundCombat();
		CombatManager.setFriendlyActors(pc);
		CombatManager.setHostileActors(h);
		CombatManager.displayLocation("INFECTED CREW");
		CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
		CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
		CombatManager.victoryScene(kiFinalFightVictory);
		CombatManager.lossScene(kiRandomMutantLoss);

		clearMenu();
		addButton(0, "Fight!", CombatManager.beginCombat);

		return true;
	}
	
	return false;
}

public function kiFinalFightVictory():void
{
	flags["KI_ESCAPE_FIGHT"] = 1;
	kiRandomMutantVictory();
}

public function kiEscapeShuttle():void
{
	clearOutput();
	showBust("");
	author("Savin");
	showName("ESCAPE\nKASHIMA");

	output("You use the key to access the shuttle, quick to seal it behind you again before you get any unexpected company. You quickly boot up the shuttle’s computer, spool the engines, and start to back out of the bay. Infected crewmen begin pouring out of the elevator shafts, drawn by the sound and vibration of takeoff. They’re smart enough, at least, not to try and push through the oxygen barrier while you zoom out into space. You have one last, parting look at the derelict <i>Kashima</i> before coming about and heading back towards your own ship.");
	
	output("\n\nWhen you reboard your vessel, you have to fly a long, long way away before the jamming signals <i>Kashima</i> is outputting fade enough for you to get a message out. You tell Steele Tech what happened, and the dangers the next team will face. You ask them to resolve it quickly, before Elenore and the Chief can come to too much harm.");
	
	output("\n\nBut there’s nothing more you can do for them now. Nothing but find a doctor and make sure you’re okay. First, though, a long rest...");

	moveTo("SHIP INTERIOR");
	flags["KASHIMA_STATE"] = 4;
	
	processTime(25);
	if(eventQueue.indexOf(kiEscapeShuttleFollowup) == -1) eventQueue.push(kiEscapeShuttleFollowup);

	clearMenu();
	addButton(0, "Next", finishKashimaJobFlyAway);
}
public function kiEscapeShuttleFollowup():void
{
	clearOutput();
	showBust("");
	showName("KASHIMA\nFOLLOWUP");
	
	output("Your codex beeps, alerting you of a message sent from Steele Tech communications. Apparantly, the incident you’ve witnessed on the <i>Kashima</i> was no laughing matter. While the note doesn’t go into detail on if and how the issue is being resolved, it acknowledges the harrowing trials you’ve gone through with a small payment for the inconvenience.");
	output("\n\nWell, that’s better than nothing, you guess.");
	
	pc.credits += 8000;
	processTime(2);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kiHendersonMedbay():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nHENDERSON");
	showBust("ELENORA", "USHAMEE_NUDE_PREG");

	currentLocation = "KI-H16";
	generateLocation(currentLocation);

	output("<i>“Everything’s going to be okay,”</i> you say, pulling out your Codex. The jamming is still in full effect, but down here in engineering, it’s a simple task the find the source: somebody had hotwired a comm panel, blasting every channel around with impenetrable white noise. Like they didn’t want rescue to come - they knew it was too dangerous. You yank a wire, and jamming’s gone. A quick email to Steele Tech ensures that a ship is on the way to collect you and the crew, now that they’re pacified. But before they arrive, you have to take care of your leithan companion.");
	
	output("\n\n<i>“Come on,”</i> you say, waving the Chief over. <i>“We need to get that thing out of you.”</i>");
	
	output("\n\n<i>“Damn right,”</i> she groans, rubbing at her belly with her middle thighs. You give her an encouraging pat on the flank and guide her towards the cargo elevators - now devoid of infected and safe to use. The two of you take a short ride up all the way back to the command deck.");
	output("\n\nYou keep your weapon out, just in case, but nothing else jumps out at you. It seems the cure really has worked: several crewmen are slumped against the walls, snoring heavily. The parasites in them are out cold, taking the infected crew with them. You give a sigh of relief, passing by the intersection where your companion was first taken from you.");
	
	output("\n\nA few more steps take you back to the MedBay. The door is still sealed, but a quick override has it sliding open, ushering you back into the comforting, sterile mess of the medical bay. The suppression system is still sprinkling a gray mist all over.");

	if (flags["KI_VANDERBILTS_SECRET"] != undefined)
	{
		output("\n\nElenora’s collapsed over her desk, as you should expect. The infection within her is stopped, but like the rest of the crew, she’s out cold.");

		output("\n\n<i>“Hey, it’s that woman,”</i> Chief says, poking the doctor’s shoulder. <i>“From the bridge.”</i>");

		output("\n\nYou nod. <i>“She’s the one that made the cure. She managed to fight off the infection just long enough to help me.”</i>");
	}
	else
	{
		output("\n\n<i>“Hey, it’s that woman,”</i> Chief says, trotting around one of the desks. You follow her, and find Elenora slumped over it, completely unconscious. Oh, shit... was she...?");

		output("\n\nYou curse. How the hell did you not see it? She could have jumped you at any moment, but instead... instead she helped you make the cure. Was she fighting against the infection the whole time?");
	}

	output("\n\nWith Elenora down for the count, you’re going to have to figure out the MedBay’s tech on your own.");
	if (pc.IQ() >= 75) output(" Shouldn’t be a problem for a genius like you!");
	output(" You find a medical scanner and tell Chief Neykkar to sit down. She does so as much as she can around her hugely pregnant gut, curling her legs and tail under herself with a gasp of pleasure. Though the power’s still unreliable at best, you manage to get the scanner working and pass it around her plated flanks, trying to ascertain where the parasite has gone.");

	output("\n\nIt’s lodged itself right in her womb, and it’s only getting bigger. Where before it was about the size of your forearm, the mass of tentacles has now grown ten times its original size: it’s easily as big as a proper leithan child - or a Terran pony - with no signs of stopping.");

	output("\n\nAnd, as you think about it, it’s not infecting the Chief. Unlike every other parasite. What’s it doing, then?");
	
	output("\n\n<i>“Everything okay, [pc.name]?”</i> she asks, seeing the concern on your face. The hard exterior you’d seen before is all but gone, now, replaced by fear and uncertainty. <i>“Can you - ah! - can you get it out?”</i>");
	
	output("\n\nYou suppress a grimace and tell her it’s going to be okay. Glancing around the MedBay for anything that might do the trick, you at first only see mico-surgeon injectors and medi-gel dispensers. Modern medicine to cure almost any woe, but doubtless ineffectual against parasites of this scale and scope. No way. So you turn your attention to other devices, first to surgery tools and then... and then to a big robotic claw in the corner of the bay, used to automatically grab and assemble nano-bot tubes. The claw’s as big as your hand, stronger than a human, and smooth as butter. As terrifying as the prospect may be, well... the parasite’s not bonding with the Chief’s body, and you do have to get it out somehow.");
	
	output("\n\n<i>“No. No way,”</i> she says, waving her hands defensively in front of herself as you explain your plan. Her starry eyes glance worriedly over at the smooth, rubbery robotic arm you’ve wheeled over, and her tail curls between her haunches to cover her horse-like twat.");
	
	output("\n\n<i>“Come on. We have to get that thing out of you,”</i> you say, rummaging out a hefty vial of medical lube and starting to slather it on your hands.");
	
	output("\n\nShe blanches, but a sudden shift in her belly nearly doubles her over, and you’re assaulted with the unmistakable smell of feminine orgasm gushing down onto the deck. She whimpers, wrapping her arms around her chest and prodding the tip of her tail around her pussy. <i>“C-can’t you, aahhh, can’t you just use your hand!?”</i>");
	
	output("\n\nDid she just ask you to, for all intents and purposes, fist her?");
	if (pc.isTreated() || pc.LQ() >= 85 || pc.lust() >= 75) output(" Damn, that’s a tempting offer....");
	output(" No way you can do that, though: the parasite’s lodged too deep inside her, and it’s big and squirmy besides. You’d never pull it out by hand.");

	output("\n\n<i>“Fuck,”</i> the Chief growls, fidgeting on the floor. After a long moment of thought, she moans weakly and shuffles around so that her hindquarters are pointed at you. Her reptilian tail lifts, revealing a dark, cherry-sized clit and a pair of coal-black lips that are gaped open around an onyx passage. Her pussy is a veritable swamp, bridged by thick ropes of feminine slime and drooling arousal onto the deck even between frequent, body-clenching orgasms. You can’t see the tentacle inside her, even when you hook your thumbs in her labia and spread her wide open. The Chief yelps, squirming as you peer inside her cavernous hole. You could easily fit your arm in there wholesale, barely able to brush the entrance to her womb with your fingers.");

	output("\n\nShaking the thought off, you slather a little extra lube from your hands around her pussy’s channel. The rest goes all over the rubbery hand of the robotic arm, covering everything but the gripping surface in so much lube that it’s positively dripping. Once you’re satisfied with it, you step around the leithan’s prone form and pick up the scanner in one hand and the robot controller in the other.");

	output("\n\n<i>“Hold onto something,”</i> you suggest, powering up the robo-arm. Chief Neykkar bites her lip, grabs your wrist, and squeezes her eyes shut. You pat her hand and guide the robot arm forward, eyeing the scanner display to make sure you’re going right through the middle. Seeing her pussy spread open around the claw, wider and wider until you swear you could fit your head in its wake. Neykkar cums, again and again, screaming and bucking back against the machine; inside her the monster’s tentacles squirm and thrash around, only adding to her pleasure. And it’s still growing!");

	output("\n\n<i>“Take it easy. Relax,”</i> you murmur as the robo-arm brushes the Chief’s cervix.");

	output("\n\nShe grunts, squeezing your arm tight. <i>“I-I can’t! Can’t... can’t... aahhh!”</i>");

	output("\n\nYou watch a veritable flood of girl-cum spill out around the thick robotic appendage. Neykkar’s body shudders, tail whipping wildly behind her. No way you’re getting the arm through until she relaxes. And if you have to work the tension out for her, so be it.");
	if (silly) output(" Shut up, it’s porn logic.");

	output("\n\nRather than pushing forward, you start to back the claw out, dragging the lubed-up rubber hand through her arm-deep passage. She moans, loudly and lewdly, groping her own tits and wiggling her hips. Her body’s on auto-pilot now: your efforts seem to be mixing its signals between taking a huge leithan cock and giving birth. Nothing you can do but keep with it, jack-hammering the robotic arm into her gaping pussy until she’s a moaning, cumming mess of a woman. The whole med bay reeks of sex now, hot and humid.");

	output("\n\nYou can’t deny the effect on yourself.");
	if (pc.hasCock())
	{
		output(" Your [pc.cock] throbs with need");
		if (pc.isCrotchGarbed()) output(", straining against your [pc.lowerGarment]");
		output(" until you can’t stop yourself from grabbing it.");
	}
	else if (pc.hasVagina())
	{
		output(" Your [pc.cunt] is a swamp of lusts, making your [pc.legOrLegs] quake beneath you.");
	}
	output(" Struggling to keep your attentions on the Chief, you keep working the robotic arm right up until you’re finally able to squeeze the claw down and push it into where the steadily-growing tentacle monster has lodged itself. It starts squirming and thrashing about the moment you near it, bulging the Chief’s stomach with its every thrash.");

	output("\n\nGrimacing, you drive the robotic arm deeper, opening its claws to grab at the slimy tentacle. The creature clearly doesn’t want any of it, but there’s nowhere for it to go. The Chief groans, eyes bulging and legs scrabbling across the smooth deck. Keeping your eyes glued to the scanner, you guide the robot arm in a merry chase around the Chief’s stretched-out womb, grasping at the fat, fleshy body of the creature. No matter how it squirms and wriggles, you pursue it until it’s backed into the deepest depths, and you finally manage to grab it. Chief cums again as soon as you start pulling it out, gushing cum down her thighs while you reel the robot arm back out like a finishing line. You pull and pull until the arm’s nearly out, and you can see the first throbbing red shaft of parasite squirming out of the Chief’s black twat.");

	output("\n\n<i>“Oh fuck oh fuck!”</i> she screams, clenching her cunt and gripping your arm with all of her crushing might. <i>“Getitoutgetit<b>out</b>!”</i>");

	output("\n\nYou get it out. With one final, mighty yank, the tentacle comes out and gets thrown onto the deck in a slimy wet pile. The Chief shrieks, staggers to her feet, and leaps on the stunned parasite. You look away just before a horrible splattering sound echoes through the medbay, followed by silence. Silence, and the Chief’s ragged, heavy breathing.");

	output("\n\n<i>“Get fucked you little bastard,”</i> she grunts, scraping the parasite off of her clawed foot. <i>“That’s for my crew.”</i>");

	output("\n\nShe’s barely finished speaking when you hear a thunderous <i>CLANG</i> from just outside. You spin around as the MedBay doors slide open, and several armed and armored men in Steele Tech suits storm in, covering you with laser sights. They’re all kit up in HAZMAT gear, vacuum-sealed and shielded. They shout to stay calm and put your weapons down. You do so, making sure the Chief’s nice and calm, even as she’s yelling about lights in her eyes and people staring at her crotch. Back to her old self, it seems!");
	
	processTime(11);
	
	clearMenu();
	addButton(0, "Next", kiHendersonMedbayII);
}

public function kiHendersonMedbayII():void
{
	moveTo("SHIP INTERIOR");
	
	clearOutput();
	author("Savin");
	showName("KASHIMA\nEPILOGUE");
	showBust("");

	output("A couple of hours later, everyone aboard the <i>Kashima</i> has been secured in quarantine on the rescue ship, and a decontamination crew is sweeping through the decks, destroying the tentacles and securing the <i>Kashima</i> herself. It’ll be a while before she returns to duty, but according to the commander you talk to, she’ll be sailing the stars again someday. Perhaps even with her original captain, if your medical science department can in fact heal the crew.");

	output("\n\nThe Nova marines and your Steele Tech employees are all secured on the rescue boat, including the Chief and Elenora. You ask the captain to update you on their statuses when they’ve recovered. If, in Elenora’s case. He nods, confirms your extranet addresses, and after getting a signature on a few forms, hands over the promised payment from Corporate HQ, plus a sizable danger bonus. <b>25,000 credits are transferred to your accounts</b>.");

	output("\n\nThere’s not much more for you to do here, so once you’re sure that the HAZMAT crew is well on their way, you catch a shuttle ride back to your ship for a much-needed rest.");

	processTime(142);
	
	pc.credits += 25000;
	flags["KASHIMA_STATE"] = 2;

	clearMenu();
	addButton(0, "Next", finishKashimaJobFlyAway);
}

public function kiHendersonSteeleTech():void
{
	clearOutput();
	author("Savin");
	showName("VICTORY:\nHENDERSON");
	showBust("ELENORA", "USHAMEE_NUDE_PREG");

	output("<i>“Alright, listen,”</i> you say, putting a reassuring hand on the Chief’s flank. She moans, curling her tail under herself to hide her visibly swollen, drooling pussy-lips. Even with both arms around her chest, her tits are so big, and her nipples so wide and stiff, that she can do little to hide them. You try and smile for her");
	if (pc.isTreated() || pc.isBimbo() || pc.LQ() >= 85 || pc.lust() >= 66) output(", hiding your own arousal as much as you can");
	output(". <i>“We’re gonna get that thing out of you,");
	if (flags["KASHIMA_BRIDGE"] != 1 && flags["KASHIMA_BRIDGE"] != 2) output(" Chief Neykkar");
	else output(" Usha");
	output(". I promise.”</i>");

	output("\n\nShe groans. <i>“Why the fuck didn’t your cure kill it? What-”</i>");
	
	output("\n\nYou shake your head, saying the cure only paralyzes the parasite. Puts it to sleep long enough for Steele Tech to come out and secure everyone. So they can remove the parasite without hurting the host.");
	
	output("\n\n<i>“Ah, shit... how long before they get here, you think? I can’t-”</i> she moans, shivering from head to clawed toe. Heavy globs of leithan moisture drip from her twat, splattering in a musky pool behind her. You can still see the tentacle inside her, squirming inside. Orgasm shudders through her, making her whimper with alien pleasure. <i>“I can’t hold on much longer...”</i>");

	output("\n\n<i>“Everything’s going to be okay,”</i> you say, pulling out your Codex. The jamming is still in full effect, but down here in engineering, it’s a simple task the find the source: somebody had hotwired a comm panel, blasting every channel around with impenetrable white noise. Like they didn’t want rescue to come - they knew it was too dangerous. You yank a wire, and jamming’s gone. A quick email to Steele Tech ensures that a ship is on the way to collect you, the crew, and your living sample.");

	output("\n\nIn the meantime, though, you’ve got to keep the Chief calm. Every few seconds, the smell and wet sounds of leithan orgasm assault your senses, and she’s constantly moaning and scuffling her feet on the floor, even while she tries to get the unconscious Nova troops somewhere comfortable. The best you can do is stick with her, saying comforting things and trying not to stare at her naked pussy and tits, through orgasm after orgasm. The crewmen don’t wake up, sedated by their infected parasites’ slumber. It’s just you and the Chief, who’s growing ever more desperate as the minutes turn to hours.");
	if (flags["KI_VANDERBILTS_SECRET"] == undefined) output(" You wonder what happened to Elenora... she should have come down by now, right?");
	output(" You sigh, putting a gentle hand on the leithan amazon’s bare flank.");

	if (pc.hasGenitals() && (pc.lust() >= 33 || flags["FUCKED_CHIEF_NEYKKAR"] != undefined))
	{
		output("\n\nThe gentle hand, though, turns lecherous as time passes. The intense, overwhelming smell and sounds of leithan orgasm become more and more overwhelming, making your [pc.skinFurScales] burn with unbidden desire. No matter how horrifying the parasite inside her is, the naked, climaxing woman holds an animalistic appeal that speaks to your body’s innermost desires. Before you know it, your hand is wandering down the leithan woman’s flank, fingers brushing the dark lips of her engorged sex. They come away matted with thick feminine slime. Your companion gasps, her gray skin flushing with a hint of crimson.");

		output("\n\n<i>“S-Steele,”</i> she groans, fidgeting her front legs and staring at you with wide eyes.");
		
		output("\n\n<i>“[pc.name],”</i> you correct, rubbing your fingers around her black pussylips. Her tail flicks at your arm, at first pushing at you but, when you show even the slightest insistence, her tail-tip coils around your arm, drawing it in. In her state, she’s a slave to her desires, unable to preserve what little is left of her dignity.");
		
		output("\n\nShe moans, pushing back against your hand. Three of your fingers slip effortlessly inside her, and with a little bit of effort, the rest of your fist as well. The leithan’s back arches, and a girlish gasp escapes her lips. Her eyes narrow lovingly, and her tail pulls your arm deeper into her cavernous pussy.");

		output("\n\n<i>“I-I guess I owe you for saving me, don’t I?”</i> she murmurs, trying to justify the way her arms are snaking over your");
		if (pc.isNude()) output(" bare body");
		else output(" [pc.armor]");
		output(", moving towards your crotch. You let her pull your gear aside,");
		if (pc.hasCock()) output(" grabbing your [pc.cock] and giving it an experimental stroke.");
		else output(" slipping a plated finger into your own [pc.cunt].");
		

		output("\n\nYou share a lustful smile with the horny ‘taur, and strip your gear all the way off. She hungrily grabs your hips and nestles down on her legs and belly, putting her mouth as close to crotch-level as she can get - neither of you want to risk spreading the infection through her sex, but the Chief herself doesn’t seem to be. Her mouth will have to do, and with the lustful, blissed-out look on her face, she seems more than content with the pleasure of her parasitic infestation.");

		output("\n\nThe Chief’s reptilian tongue flicks past her lips, and");
		if (pc.hasCock()) output(" around your cock");
		else output(" into your pussy");
		output(", eagerly exploring your sex. While she does, you run your hands through her dark hair, guiding her forward until her lips are planted on your crotch, vigorously licking all around. Slowly, you shift your grip up, through her lustrous hair and up to the bases of her black, chitin-clad bunny-ears. She gasps, murmuring in pleasure as your thumbs rub them, massaging the tender gray flesh inside. Her ears twitch rapidly, and every caress you give her increases the tempo of her tongue around your");
		if (pc.hasCock()) output(" [pc.cock]");
		else output(" [pc.cunt]");
		output(". For a warrior-woman, she’s damn good at showing her appreciation.");

		output("\n\nWhile her human-looking half is busy lavishing you with oral attention, her hands grab her tits, pinching and tugging at her nipples, and her tail coils in on itself and plunges into her cunt. You feel her go rigid for a moment, then completely go languid beneath you. Her head bobs faster, tongue thrusting to the tempo of her tail defiling her own pussy.");
		if (pc.originalRace.indexOf("leithan") == -1 && pc.race().indexOf("leithan") == -1) output(" You guess that answers the age-old questions of how leithans masturbate!");
		output(" The parasite in her belly reacts to the added stimulation, squirming against her belly until she looks like she’s packing a whole, flailing person in her undercarriage - and in turn, you see an absolute waterfall of girl-cum pouring out of her cunt, splattering lewdly across the deck that makes a musky mess of her thighs.");

		output("\n\nJust the smell is enough to drive you wild, let alone her rapidly more desperate");
		if (pc.hasCock()) output(" blowjob");
		else output(" rug-munching");
		output(". Your [pc.hips] start moving of their own volition, grinding against the Chief’s orgasmic face and getting as much of her tongue on you as you can. She murmurs unintelligibly, eyes fluttering closed. She’s completely engrossed in pleasure, vigorously assailing her black nipples and thrusting into her cooch.");

		output("\n\nThe oversexed leithan barely notices when you start to cum, not even reacting until");
		if (pc.hasCock()) output(" you blast her throat with a thick gulp of [pc.cumNoun], bulging her cheeks with a sudden rush of seed");
		else output(" you’re smearing her face with [pc.girlCumNoun], marking the Chief’s body as thoroughly as she’s covered the deck with her own fem-cum");
		output(". Her tongue doesn’t stop when you climax, though her hands grab at your waist, holding you fast as she redoubles her efforts to pleasure you. She doesn’t let up, not for a second, until you hear a smash from somewhere above you and a flare of light from on high.");
	}
	else
	{
		output("\n\nYou stay with her, keeping the ever-more-gravid leithan calm until eventually, you hear a smash from somewhere above you and a flare of light from on high.");
	}

	output("\n\nYou squint, shielding your eyes as the lights consolidate into several flashlights, carried by Steele Tech security personnel, all armed and armored. They look down at you from under HAZMAT visors, shouting for everyone to stay calm and put your weapons down. You do so, making sure the Chief’s nice and calm");
	if (pc.hasGenitals() && (pc.lust() >= 33 || flags["FUCKED_CHIEF_NEYKKAR"] != undefined))
	{
		output(" when she gets off your crotch");
		IncrementFlag("FUCKED_CHIEF_NEYKKAR");
	}
	output(". Per your communique, they quickly surround Chief Neykkar and, as gently as they can, surround her in a quarantine forcefield and start to cart her off. She looks around confused, glancing at you for reassurance. You tell her everything’s going to be fine all the way until the security folks have her aboard their rescue boat.");

	processTime(12);

	clearMenu();
	addButton(0, "Next", kiHendersonSteeleTechII);
}

public function kiHendersonSteeleTechII():void
{
	moveTo("SHIP INTERIOR");
	
	clearOutput();
	author("Savin");
	showName("KASHIMA\nEPILOGUE");
	showBust("");
	
	output("A couple of hours later, everyone aboard the <i>Kashima</i> has been secured in quarantine on the rescue ship, and a decontamination crew is sweeping through the decks, destroying the tentacles and securing the <i>Kashima</i> herself. It’ll be a while before she returns to duty, but according to the commander you talk to, she’ll be sailing the stars again someday. Perhaps even with her original captain, if your medical science department can in fact heal them.");
	
	output("\n\nWhile they’re extracting the crew, you have to ask what happened to Elenora.");
	if (flags["KI_VANDERBILTS_SECRET"] == undefined)
	{
		output(" After checking a dataslate, the commander tells you that they found her in the medical wing, unconscious like the other infected.");
	
		output("\n\n<i>“Other infected?”</i> you breathe, staring at him for a long moment. Was she... when did that happen? When you were down in the crew quarters, or was she infected the whole time?");

		output("\n\nYou shake your head in confusion, but")
	}
	else
	{
		output(" He informs you that she was found on the upper decks, knocked-out cold like everyone else.");

		output("\n\nYou sigh and");
	}
	
	output(" ask him to update you on her status and Chief Neykkar’s when they’ve recovered. If. He nods, confirms your extranet address, and after getting a signature on a few forms, hands over the promised payment from Corporate HQ, plus a sizable danger bonus. <b>25,000 credits are transferred to your account</b>.");
	
	output("\n\nThere’s not much more for you to do here, so once you’re sure the sample in Chief Neykkar is secure and that the HAZMAT crew is well on their way, you catch a shuttle ride back to your ship for a much-needed rest.");

	processTime(136);
	
	pc.credits += 25000;
	flags["KASHIMA_STATE"] = 3;

	clearMenu();
	addButton(0, "Next", finishKashimaJobFlyAway);
}

public function kiMutantBadEnd():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMapForLocation("GAME OVER");
	
	clearOutput();
	showBust("");
	author("Gardeford");
	showName("ONE OF\nTHE INFECTED");
	
	processTime(65);
	
	pc.removeAll();
	
	output("You awaken with a start, Spread eagle and stretched. Writhing tentacles coil around your limbs, but as far as you can feel none of them have gotten to your orifices yet. With a mad rush of strength, you pull with all of your body, somehow managing to escape the grip before it can tighten to trap you.");
	
	output("\n\nThe tendrils attempt to chase after you, but you roll away, staggering through what appears to be one of the ship’s maintenance tunnels. It doesn’t seem like any of them are continuing to chase you, at least for now. By sheer luck, you find an unlocked hatch leading to one of the ships hangar bays. It’s not the one your ship is in, but it appears devoid of tentacle infested crewmen.");
	
	output("\n\nA flutter of warmth bubbles in your stomach as you open the hatch, but you pass it off as nervousness. Your nanomachines must be powerful enough to stop something like this, if nothing else you’ll just get some fancy transformation like always. What matters now is getting off this ship alive. No amount of nanomachines can stop you getting bred by tentacles for an eternity.");
	
	output("\n\nMiraculously, your codex appears to be fully functional again. As quickly as you can, you send out a general distress signal. You aren’t sure whether Steele Tech’s assistance will make it in time, but you send a more detailed distress signal to them as well. Within minutes you get an <i>“On the way”</i> ping from the general beacon that places the responder within a short distance of the station.");
	
	output("\n\nA rush of warmth floods to your nethers, along with a twisting pleasure in your gut. Nervousness might be too much to wish for now, but the responders will be able to help you. You think a mass of tentacles growing within you would be uncomfortable, but every part of it just feels a different kind of amazing, and you find yourself struggling to stay focused.");
	
	output("\n\nJust when you think you might not last, the unmistakeable form of a ship appears in the blackness outside the hangar. At least, you think it does; your vision has tinted a few shades of red. As the ship approaches it becomes more clear, a small and sleek personal cruiser. The thing doesn’t look like much, but it looks fast enough to get you where you need to be. You compose yourself as best you can, trying to ignore a growing feeling of hunger closing around your thoughts.");
	
	output("\n\nBy the time you focus enough to regain your bearings, the ship has landed, and a hatch opens from its side. A middle-aged kaithrit woman rushes down to meet you, an impressive bust bouncing as she does. You miss her first words as your eyes bounce along with it. Her entirety shines in an intoxicating shade of the pink that covers your vision, and you struggle to reply.");
	
	output("\n\nSex, sex, sex is all you can think of when you try to form words. You hold up a hand, attempting to warn her about the infected crew and ask for an airlift to safety, but pitch forward into a full bodied hug and kiss. A hot-pink tendril surges up through your throat, burying itself in the unsuspecting woman’s open mouth. Her eyes go wide as a pulse of hot sex juice follows suit, bubbling out of her clenched lips and nose.");
	
	output("\n\nA second tentacle emerges from your " + (pc.hasGenitals() ? "sex" : "ass") + ", slipping under the kaithrit’s shirt and slithering around her breasts. It emerges from her cleavage only to blast the both of you with pink aphrodisiac cum. You shudder and lose your footing as another wave of cum pushes through the tendril in your throat, taking the both of you to the ground.");
	
	output("\n\nHeaving E-cups press into your [pc.chest] as their hapless owner pulls you in closer as her tongue lolls around the invading member. Even more tentacles springing from your body search her for orifices, plugging each one with breeding fervor as you tear her clothing away. Her body feels pleasantly cool on your lust heated [pc.skinNoun] as you explore every inch of it until it matches your boiling temperature.");
	
	output("\n\nWith a great deal of effort, you pull yourself away from her face, remembering vague whisps of something you were supposed to be doing; someone else who was coming to rescue you. Oh well, they can join in when they get here. You dismiss all thoughts, diving back down to taste more of your new friend.");

	if(inCombat()) CombatManager.postCombat();
	badEnd();
}

public function kiHendersonLoss():void
{
	kiHolmesLoss(true);
}