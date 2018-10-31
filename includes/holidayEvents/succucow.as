//Night Trap's Succubus Cow Hween event
//https://docs.google.com/document/d/1l0PZ1lt2mIfIP_8zTQhdnqR2NiQH5fHR590zHAuCS7I/edit#

public function succucowEmailText():String
{
	var eText:String = "";
	
	eText+="Hey there, [pc.name].";
	eText+="\n\nI’ve been getting reports of suspicious activity from some of the locals about an abandoned cabin some ways away from Big T’s ranch. People around here have said for years that it’s haunted, but that’s just a dumb urban legend of course. ";
	eText+="\n\nIn the last week though, a group of teens said somebody fixed up the interior and that they’ve seen lights on inside at night. These kinds of stories circulate about that place every few years, so I think it’s just hysteria. The cabin’s on public land anyway, so none of what’s been reported is a crime. I just want to avoid the headache of calls from frantic mothers when their dumb kids start sneaking out there in the middle of the night like the last time this happened.";
	eText+="\n\nMy department’s going to be short-staffed for a few weeks, and no laws have been broken or anything, so I was told not to waste resources on this. I’ll pay you 500 credits if you spend the night in that cabin to prove there’s nothing interesting there. If you’re interested, talk to me about it at the Bucking Bronco in the evening.";
	eText+="\n\nStay safe,";
	eText+="\nCiaran";
	
	return ParseText(eText);	
}

public function succucowHook():void
{
	clearOutput();
	clearMenu();
	showCiaran();
	author("Night Trap");
	
	flags["SUCCUCOW'D"] = 1;
	
	output("You let Ciaran know that you read his email and that you’re ready to visit that cabin.");
	output("\n\nThe lawman smiles in relief and wags his tail gently. <i>“Damn, am I glad to hear that. Thanks for doing this, kid. You’ll be saving me a lot trouble. C’mon, I’ll take you out there now.”</i> Ciaran gestures for you to follow as he stands up from the table. You [pc.walk] along behind him, allowing him to lead you outside and to his vehicle. It’s a hovertruck with a government logo on the doors and hood and the words “Department of Wildlife” emblazoned beneath each one.");
	output("\n\nCiaran opens your door for you and helps you into the seat before climbing into the driver’s side himself. There he swaps his cowboy hat for a flat-brimmed one with a game warden’s badge pinned on the front, the warden’s one concession to actually wearing his uniform on the job. Things <i>really</i> must be lax around here...");
	output("\n\nWhile you’re still musing over lackadaisical dress code enforcement, Ciaran cranks the truck and begins driving to your destination. After a few minutes of silence, he glances over to you with a grin. <i>“So, know anything about this place, kid?”</i>");
	output("\n\nYou confess that you’re totally ignorant aside from what he mentioned in his email.");
	output("\n\nThere’s a flash of mischief across the hellhound’s scarred face before he masters himself. <i>“Well then I guess you don’t know the stories about what happened there.”</i>");
	output("\n\nYou frown at Ciaran. Is he seriously trying to spook you before you go spend the night alone, as a favor to him no less?");
	output("\n\nHe laughs at your reaction and smiles apologetically. <i>“Sorry, you’re right. It’s an old habit of mine. Ghost stories were always popular in my home, so I get a kick out of scaring people with them. Still, it’s a fairly long drive there. Do you want to hear them without the flashlight under my face?”</i>");
	output("\n\nYou roll your eyes, but you admit that you are a bit curious.");
	output("\n\nCiaran adopts a more serious tone and engages the autopilot so he can look at you and gesture freely. <i>“Alright, so this place has been abandoned for a few decades, long before I moved to New Texas. It was just some rancher who owned it, and he had a small but prosperous business. He lived out here with three wives, all of them sisters. Then one day, for seemingly no reason, the rancher sold his entire herd, donated his land to the government, and moved off planet.”</i> Despite his previous promise, you can tell that Ciaran is still embellishing the tale a bit for dramatic effect. His tone is somber and melodramatic, as if he were speaking over a campfire.");
	output("\n\n<i>“There are a lot of stories about why he abandoned the place. One story says that another local legend, a monster called the Chupacabro, took all three of his wives in the night. Another says that the ranch was built on an old alien burial ground. The most popular one though is also my favorite. The story goes that the eldest and youngest sisters were absolute beauties that had bulls tripping over themselves to catch a glimpse of. The middle sister was not so lucky though.”</i> The DILF pauses dramatically. In spite of yourself, you find that you are being drawn into the story. Even if his delivery is cheesy, Ciaran is a surprisingly good storyteller once he gets going.");
	output("\n\nSensing your interest, the hellhound continues his tall tale. <i>“In comparison to her sisters, the middle cow was modest at best. Her husband said he loved her just as much as her sisters, but she grew more and more bitter with envy over the years. And so the story goes that one night when her husband was away for a few days, a demon came to her. He offered to make her the most beautiful creature in the galaxy, if she would only sell him her soul and those of her sisters and husband. She agreed of course, and the demon did as he promised.”</i> When Ciaran pauses this time, you’re practically on the edge of your seat.");
	output("\n\nIt’s plain from his proud grin that the DILF is enjoying your interest, and he dives into the climax of the story with glee. <i>“The middle sister became truly beautiful, but the demon made her so by turning her into a demon herself. When the rancher returned home, he found the other two sisters had been hypnotized and enslaved by the new demon. Luckily for the rancher, he somehow managed to escape. He fled New Texas, selling everything without telling anyone what happened, knowing no one would ever believe him. Without her husband’s soul, the cow demon was trapped in the cabin forever. She waits there to this very day, stealing the souls of any who spend the night there, in hopes of finding her husband’s soul and setting herself free. Anyway, enjoy your night at the cabin, kiddo!”</i>");
	output("\n\nWait, what? You blink your eyes in confusion for a moment, and Ciaran chuckles evilly to himself. <i>“You were so entranced in my amazing storytelling that you didn’t notice, but we’re at the cabin now. See?”</i> He gestures out your window, and sure enough, there’s a weathered-looking building behind you, silhouetted blindingly against the sunset. <i>“Don’t worry, I’ll come inside with you.”</i> The ausar man smirks as he puts on his duty belt.");

	processTime(45+rand(10));
	
	addButton(0, "Next", ciaranThisPlaceIsSpooky, undefined, "", "");
}

public function ciaranThisPlaceIsSpooky():void
{
	clearOutput();
	clearMenu();
	showCiaran();
	showName("SPOOKY\nCABIN");
	author("Night Trap");
	
	output("You huff indignantly and clamber out of the truck, trying not to give Ciaran any satisfaction. The two of you walk up to the doorstep. The wood of the cabin is weathered and splintered, though the arid climate of New Texas has stymied any rot that might have happened in a building of this age elsewhere. The warden holds his arm out to block you. <i>“I’ll check the place out first. I’m sure there’s nothing in here, but I’m not going to chance you getting hurt.”</i>");
	output("\n\nCiaran swings the door open and shines a high-powered flashlight inside before drawing his laser pistol from its holster and walking in. You wait outside in the dying light, watching the beam of Ciaran’s flashlight illuminate the windows of the cabin one by one. After a few minutes, all the lights in the building flip on at once. Shortly after that, the hellhound appears outside again with a comforting smile.");
	output("\n\n<i>“Well, the place is clear, and I found the circuit breaker. It’s cleaned up inside for some reason, but there’s no traps, no contaminants. Really no sign of any living thing having been in there. There was a security system though, and I was able to rewrite it. Now if anybody comes in the house tonight after you’ve armed it, we’ll know right away. You can also reach me on this if need be.”</i> Ciaran hands you a small communicator bearing the same logo as his truck. <i>“It’ll also let you reach any other emergency services you might need, like if a fire breaks out. You </i>are<i> old enough to know not to play with matches though, right?”</i> The older ausar teases.");
	output("\n\nYou don’t want to give Ciaran the satisfaction of getting under your skin any more than he already has, so you simply hold your tongue.");
	output("\n\nHe laughs bemusedly before ruffling your " + (pc.hasHair() ? "[pc.hair]" : "scalp") + " in apology. <i>“Sorry, kiddo. I just couldn’t resist.”</i> Ciaran’s tone and expression then become utterly serious as he looks you straight in the eye. <i>“Listen. If you have </i>any<i> trouble at all, promise me you’ll call me right away. I’ll be here as fast I can. I could never forgive myself if you got hurt because of me.”</i>");
	output("\n\nYou’re a little taken aback by the sincerity in Ciaran’s words and demeanor. You smile at him and thank him, giving your assurance that you’ll call if you need him.");
	output("\n\nCiaran smiles warmly and clasps a hand on your shoulder comfortingly. <i>“Stay safe tonight, [pc.name]. I’ll be back at sunrise.”</i> After you say your farewells, the warden climbs into his hovertruck and drives away. The flat terrain of New Texas allows him to stay in sight for a long time, but eventually the sun sets, and the only visual reminder of your ausar companion is reduced to a tiny pair of twinkling taillights on the horizon, until eventually the rolling plains swallow up even that small comfort, leaving you in utter, overwhelming solitude. You are totally alone now...");
	
	processTime(15+rand(10));
	
	addButton(0, "Next", ciaranPleaseDontLeaveMeAllAlone, undefined, "", "");
}

public function ciaranPleaseDontLeaveMeAllAlone():void
{
	clearOutput();
	clearMenu();
	showName("SPOOKY\nCABIN");
	author("Night Trap");
	
	output("You’re grateful for the electricity in the cabin, and doubly so for the security system. Now that you’ve been here for a few hours, you’re " + (pc.willpower() >= pc.willpowerMax()/2.0 ? "not even a little frightened" : "fairly unnerved") + " by the memory of the story Ciaran told you on the way here. Monsters? Ghosts? So what? You remind yourself you’ve been ready to face worse things than that on your adventures. Still, the whole situation is unsettling; why in the universe would someone fix up the interior of an abandoned cabin and then do nothing with it?");
	output("\n\nThe thought is pushed from your mind by a powerful yawn. You’ve got nothing better to do, so you decide to go ahead and sleep for the night. As uneventful as the last few hours have been, this should be the easiest 500 credits you’ve ever earned. You make sure everything is locked and the security system is armed before making your way upstairs to the master bedroom. There’s an absolutely enormous bed there, " + (pc.tallness >= 8*12 ? "something you’re very grateful for given your equally enormous stature" : "large enough for you to sprawl out in whatever direction you want") + ". In fact, it’s big enough for four New Texans to sleep in. ");
	output("\n\nYou’re so drowsy that you don’t give that any more thought. Instead, you strip off your [pc.gear] and crawl under the sheets. They smell freshly laundered, and they’re amazingly soft. ");
	if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_PAMPERED) output("The threadcount’s almost as high as the sheets you had on your bed as a child. ");
	output("It’s so comfortable that you find your eyes fluttering shut in a manner of minutes after you turn out the lights. ");
	output("\n\n<b>You’re not sure how long you’ve been asleep when you’re roused by the sound of the <i>locked</i> bedroom door opening...</b>");
	
	processTime(60+rand(240));
	
	addButton(0, "Next", ohNoThatLockedDoorOpeningOnItsOwnIsPrettySpooky, undefined, "", "");
}

public function ohNoThatLockedDoorOpeningOnItsOwnIsPrettySpooky():void
{
	clearOutput();
	clearMenu();
	showName("SPOOKY\nCABIN");
	author("Night Trap");
	
	output("Sitting bolt-upright in bed, you reach for the lights, only to find to your horror that they’re dead. Your heart is hammering in your throat, but you strain your [pc.ears] to hear anything. The only light in the room is the pallid square of moonlight filtering in the through the window, leaving the rest of the room in an almost unnatural darkness. " + (pc.earType == GLOBAL.TYPE_FELINE ? "Your night-attuned eyes leave you wishing they were a little less keen when you manage to make out the glint of the door knob in the darkness. The position it’s in only confirms that the door is open." : "") + "");
	output("\n\nYou almost jump out of your [pc.skinFurScales] when you hear a soft <i>clop</i> on the wooden floor. Another one a second later is followed by another, each <i>clop</i> sounding deafening in the inky black silence, growing a little louder as the source of the sounds approaches you. You fumble in the darkness for your Codex in hopes of using its flashlight function, but it’s nowhere in reach. You search for the communicator Ciaran gave you, but it’s vanished too! With your lifelines cut off and without any other way to protect yourself, you grab the dead lamp off of the nightstand, preparing yourself for a desperate battle.");
	output("\n\nBefore you can leap out of bed or die of a heart attack, something steps into the pool of moonlight in the middle of the room. A hoofed leg disturbs the dust particles floating in the moon beams. The appendage is covered in fur so black that it seems to almost swallow the light. What feels like an eternity later, a figure steps fully into the light. It’s imposingly tall, winged, and crowned with curved horns. As soon as the figure comes into view, a cloud passes over the moon, plunging it into darkness again. A scream claws at your throat, held in only with clenched teeth and failing willpower. Then, just before you finally succumb to your terror, the lights flash on.");
	
	processTime(5);
	
	addButton(0, "Next", ohItsJustASexyCowDemon, undefined, "", "");
}

public function ohItsJustASexyCowDemon():void
{
	clearOutput();
	clearMenu();
	showName("\n" + (silly ? "SUCC-U-COW" : "SUCCUCOW"));
	showBust("SUCCUCOW");
	author("Night Trap");
	
	output("The change in brightness is blinding, forcing you to cover your eyes with a hand. You brandish the lamp in front of you defensively, flailing around and trying to look tough. The silence of the night is broken by girlish giggling that worms into your mind. You stop swinging your arm at once, and when you think you’ve adjusted enough to the light, you move your hand from your eyes. Standing at the foot of the bed is the most beautiful woman you’ve ever seen. She’s statuesque, her face, proportions, and even posture perfect, but she’s unmistakably inhuman. She has two cute little black horns, flawless pink skin, black-furred legs ending in cloven hooves, a swishing, bovine tail, and small, batlike wings on her shoulders.");
	output("\n\nAll of this might be impossible to miss if not for one thing: the heaving H-cup breasts that sit defiantly high on her chest. They’re capped with pale, puffy nipples that dribble milk constantly, leaving her boobs with a shine that draws your eyes like a magnet. Sure, the rest of her body is mouth-watering; her soft, dick-sucking lips, her trim waist that emphasizes her flared, grabbable hips, the pudgy little clit inviting you into her juicy pussy, her plush thighs that are already slick with her own feminine moisture. None of it can hold your gaze for long though. Your stare always helplessly trails back to those marvelous tits.");
	output("\n\n<i>“Oh gosh, darlin’, did I startle you?”</i> That musical voice fills your ears again. You answer yes before you consciously process the words.");
	output("\n\nThe creature’s voice is so beautiful, so sweet, that you just want to do what it says as soon as you hear it. Wait, that’s not normal. You shake your head to try to clear your thoughts, shutting your eyes for a moment before looking into the buxom fiend’s perfect face. It’s a monumental struggle to keep your eyes there and not on her tits, but you manage to ask her what she is.");
	output("\n\nShe gasps cutely before leaning forward in a way that jiggles her breasts tantalizingly. <i>“Don’t you know? I’m a succubus.”</i> Her tone makes it sound like this is the most obvious thing in the world, and you find yourself nodding your head in understanding without even meaning to.");
	output("\n\n<i>“I was a drab little cow, and now I’m the most beautiful thing in the whole wide ‘verse! All it cost me was a few souls. You’re here to give me yours too, right?”</i>");
	output("\n\nIn your conscious mind you see yourself hurling the lamp at her and running for the door, but the only thing your body does is smile and dreamily sigh <i>“Yeeeaahhh...”</i> You marshal all of your ");
	if(pc.willpower() >= pc.willpowerMax()*.8) output("considerable ");
	else if(pc.willpower() < pc.willpowerMax()*.4) output("meager ");
	output("will and slap yourself across the face as hard as you can, shocking yourself back to your senses. You shake your head vigorously and sternly tell her no, careful to keep her in your peripheral vision this time.");
	output("\n\nThe succubus huffs angrily, and some part of you feels ashamed for making her mad. <i>“Now why’d you have to do something silly like that? You shouldn’t hurt yourself, and you shouldn’t be mean to me and say no. Everyone who comes here always gives me their soul. It’s so much fun for them! I’d bet you’d like it too, sugar. How about you just <b>look at my tits.</b>”</i>");
	output("\n\nIt’s phrased like a question, but the last four words cut through your self-discipline like a knife as an unmistakable command. Although you’re screaming at yourself on the inside to stop, your head turns slowly back towards the succubus. Somehow though, you manage to keep your eyes off of her breasts with the last shred of your control. You stare into her golden eyes, deep yellow pools that threaten to swallow you up. Before you’re consumed by her gaze, your peripheral vision notices the smile beneath those soulless orbs.");
	output("\n\n<i>“Oooh, that is just the most precious thing when y’all mortals try to resist. You don’t even know what you’re missing by not just giving up right away, sugar. You should just plum <b>give in and look down.</b>”</i>");
	
	pc.lust(15);
	processTime(10+rand(8));
	
	addButton(0, "Next", wowThoseAreSomeFineAssTiddies, undefined, "", "");
}

public function wowThoseAreSomeFineAssTiddies():void
{
	clearOutput();
	clearMenu();
	showName("\n" + (silly ? "SUCC-U-COW" : "SUCCUCOW"));
	showBust("SUCCUCOW");
	author("Night Trap");
	
	output("Ha! Is she kidding? You’re still in control of yourself. You figure that the best way to prove that is to glance at her breasts and then look back up. Then she’ll know you can do what you want. You smirk defiantly at the demonette and move your eyes down to her milky jugs. You’re just going to glance at them to prove your point, but once you’re looking, they’re just so nice. Why would you want to stop? The way her mammaries glint in the light, the way her puffy teats practically throb with the lactic bounty behind them. There’s a lot more to take in here than you first though. She’ll still get the message if you look back up after eyefucking her chest for a few minutes.");
	output("\n\nThe woman attached to your new favorite things coos happily and squeezes her arms together, lifting and compressing her breasts until milk actually streams out of them. You lick your lips hungrily at the sight. <i>“Good [pc.boyGirl]! That’s a very good [pc.boyGirl]! <b>You like my boobs more than anything, don’t you</b>?”</i> Her praising words send shivers of pleasure through you, and her question seems like it doesn’t even need to be answered. Of course you like those perfect breasts!");
	output("\n\n<i>“So then, you’d do anything to get to look at your mistress’s breasts more? You want to <b>look at them and only them?</b>”</i> The bovine succubus emphasizes her words by just barely shaking her shoulders, even this small movement making her milk jugs jiggle like a galotian on a sybian. It seems inefficient at this point to use energy speaking that could be used staring at titties, so you just nod your head dumbly, careful not to nod too emphatically and disrupt your view. You don’t remember agreeing to accept this demon as your mistress, but it makes sense to you that she would be. After all, she’s the one whose chest is the center of your world. If you said no, she might cover it up, or worse, turn around, and you can’t bear the thought of that.");
	output("\n\nThe succubus grabs her nipples with her fingertips and begins tugging on them, dripping a small tsunami of milk with each yank. Every few seconds she dips her palm down to collect some and smears it all over her breasts, polishing her boobflesh to a blinding shine and mooing softly as she does. Blinking seems like a punishment at this point, since it deprives you of those all-important orbs for a split second.");
	output("\n\nWhen she starts speaking again, she begins squishing and moving the fleshy spheres in a pattern that is tantalizingly close to being decipherable. Maybe if you just look closely enough, you can figure out what that pattern is? You lose your resolve to puzzle it out in a matter of seconds. There’s no real conscious thought left. Everything in your brain has been replaced with thoughts of big, soft breasts and the sweet sound of your mistress’s voice.");
	output("\n\n<i>“Now you’re gonna <b>give your soul to your mistress</b>, right?”</i> It occurs to you as you nod in agreement that the only thing you enjoy as much as watching your mistress’s boobs is obeying her. You don’t need a soul to keep your eyes open and locked on her chest. Why hold on to something you’re not going to need anymore? ");
	
	pc.lust(50);
	processTime(10+rand(6));
	
	addButton(0, "Next", okayLessCowAndMoreDemonButStillPrettySexy, undefined, "", "");
}

public function okayLessCowAndMoreDemonButStillPrettySexy():void
{
	clearOutput();
	clearMenu();
	showName("\n" + (silly ? "SUCC-U-COW" : "SUCCUCOW"));
	showBust("SUCCUCOW_TRUE");
	author("Night Trap");
	
	output("The peal of evil laughter that would’ve chilled you to the bone a few minutes ago only fills you with instinctive happiness now. <i>“That’s so sweet of you! I’ll get started in two shakes of a lamb’s tail!”</i> The lights flicker out for a moment. When they turn on again, your mistress is upon you, but she’s much more demonic than before. Her pink skin is scarlet now, her nubby horns are long and curved, her bovine tail is now bare and spaded, and her black wings are wider than she is tall. She stares down at you with now wickedly slit pupils and a monstrous, toothy smile. A long, forked tongue darts out to lick pillowy lips in a show of hunger.");
	output("\n\nThe succubus’s clawed hands tear the sheets to shreds as she rips them off the bed. When she sees your exposed [pc.crotch], her engorged slit begins to drip strands of cunny honey onto your [pc.legs] as she towers over you on the bed. The spade on her tail engorges vulgarly moments before plunging into its owner’s squishy box and thrusting at an almost frightening speed. The demonette moans like a whore in heat and bucks her fertile hips, splattering you with a deluge of tangy girl juice on your [pc.skinFurScales].");
	output("\n\nThough you had been distracted until now, you realize all at once how painfully aroused you are. With a needy cunt so close at hand, [pc.eachCock] is already slick with pre and throbbing hard enough to hurt. ");
	if(pc.isHerm()) output("Further down, [pc.eachVagina] floods over with [pc.girlCum] in sympathy with your mistress. ");
	output("\n\nEven as horny as you are, you don’t even think of masturbating; your demonic mistress didn’t tell you to.");
	output("\n\nYour sexual need only grows as the succubus fucks herself deeper and harder, leaking a constant stream of her perverted fluid down her phallic tail to puddle under your [pc.ass] as her moans grow in volume. Her motions are vigorous enough to cause her nipples to leak generous amounts of sweet milk, and as she bucks her hips harder, it too begins to rain down on you. When you begin whining pitifully in need and begging your mistress to fuck you, it pushes her over the edge. She lets out a throaty, feminine shriek and creams all over her tail. Her inhuman cunt squirts torrents of translucent ladyspunk, the overwhelming majority of it hitting you right in the face. Your [pc.tongue] darts out unthinkingly, licking up every sweet drop you can. Your mistress is kind enough to squirt a generous amount on your [pc.chest] too, the slippery tide seeming endless as her spade fucks more and more of the stuff out onto you.");
	output("\n\nMercifully, or to your perverted new mind, cruelly, the feminine bukkake ends, and the demonette gazes down at your wickedly. <i>“Aaahhh, that took the edge off. Maybe now I’ll take your soul.”</i>");
	
	pc.lust(50);
	processTime(5);
	
	addButton(0, "Next", yaasssSlayMeSuccucow, undefined, "", "");
}

public function yaasssSlayMeSuccucow():void
{
	clearOutput();
	clearMenu();
	showName("\n" + (silly ? "SUCC-U-COW" : "SUCCUCOW"));
	showBust("SUCCUCOW_TRUE");
	author("Night Trap");
	
	output("You babble incoherently, pleading with the succubus to rob you of your humanity, if only she’ll give you relief. She cackles in delight before lowering herself down to your [pc.crotch]. <i>“Then let’s begin.”</i>");
	output("\n\nThe scarlet seductress drops to her knees and rubs her slippery mound against your [pc.cocksLight]. You begin to twitch and throb with the start of an orgasm, but a clawed hand twists your [pc.nipples] painfully. <i>“I didn’t say cum,”</i> the succubus hisses in a heartless tone. You apologize shamefully and beg her for forgiveness.");
	output("\n\n<i>“I reckon I can just this once,”</i> she murrs, tracing a claw along your twitching [pc.cockBiggest]. <i>“<b>You can’t spurt until I say so.</b> Not that it will matter soon anyway.”</i> With those ominous, overpowering words, she grabs your cock and slips it into her pussy. If you thought you were close to orgasm before, it’s nothing compared to what you experience now as you slowly hilt inside this monster. Her folds are impossibly tight, wet, and soft, and still twitching with the aftershocks of orgasm. It’s like she was made for you to fit inside her, like a key into lock. Her velvety tunnel clings to you tight enough that it would leave friction burns if she weren’t drooling an ocean of femlube down your length. You groan with the effort of containing your orgasm, sweat beading on your forehead.");
	output("\n\nThe succubus begins bouncing on your [pc.cockBiggest] at a rapid clip as soon as she bottoms out. One of her hands moves to her oversized clit and begins frigging it mercilessly. The other hand grabs you under your head and lifts your face into one of her gigantic tits. She doesn’t need to say anything for you to seal your lips around her puffy teat and begin sucking. Your mouth floods with sweet milk as soon as you do, and you find yourself on the border of chugging to take it all in.");
	output("\n\nTo your surprise and delight, the succubus cries out in orgasm just a few seconds later. That happy feeling turns to despair when her folds crunch in on your [pc.cockBiggest] in frantic milking motions. You cry out under the strain of holding back your own orgasm, causing you to choke on the milk you’re currently gulping down. The succubus mercilessly holds your face against her breast, sending her lactic essence everywhere and nearly suffocating you before her orgasm winds down. She never slows the movements of her hips, and when she finally finishes creaming your cock, she even speeds up.");
	output("\n\nYour " + (pc.balls > 0 ? "[pc.balls] lurch" : "prostate throbs") + " as you spurt massive blobs of creamy pre-cum into her tunnel. Finally, you stop resisting, and give yourself over to orgasm... except you can’t. You moan whorishly and look down at where you’re connected to the demon. She giggles at the look of despair on your face before explaining. <i>“I said you couldn’t cum if I didn’t tell you to, darlin’. That wasn’t a command. It was a statement of fact.”</i> She cries out sweetly and gushes more girlcum as she bottoms out on your dick, stopping to grind your swollen organ around her clenching tunnel while she’s at it.");
	output("\n\nYou ball up your fists so tightly that your nails cut your palms and curse at the top of your lungs. The demonette just laughs and clenches her vaginal muscles even tighter to torment you with more hellish pleasure. It all just feels so good, but you need to cum! Your cock is so engorged with blood that it feels half again as thick as usual, something your mistress relishes in as she returns to bouncing her fertile hips. It doesn’t take her long to torture you with another wonderful, horrible, clenching climax from her box. You’re at least prepared for the spray of milk this time, but the sweet white liquid is small consolation. You can’t stand the pleasure anymore, but that doesn’t stop the succubus. She rides you through three more orgasms before coming to a stop.");
	
	pc.lust(pc.lustMax());
	processTime(35+rand(20));
	
	addButton(0, "Next", okayEnoughForeplayLemmeSeedThatDemonPussy, undefined, "", "");
}

public function okayEnoughForeplayLemmeSeedThatDemonPussy():void
{
	clearOutput();
	clearMenu();
	showName("\n" + (silly ? "SUCC-U-COW" : "SUCCUCOW"));
	showBust("SUCCUCOW_TRUE");
	author("Night Trap");
	
	output("Your cock is so sensitive that you can barely notice the change, but when you do, you look up at your mistress questioningly.");
	output("\n\n<i>“It’s time for a change of pace now. I’m gonna turn around on your cock, and from now on <b>as soon as I bottom out, you’re gonna cum.</b>”</i> You’re so far gone that you missed most of the her sentence, but the final words slither in your ears and bury themselves in your subconscious. As close as you are to orgasm, you wouldn’t even need this order. You groan wearily in joy, but the demon just grins toothily before spinning around on your [pc.cockBiggest].");
	output("\n\nHer ass is enormous and shapely, round scarlet mounds of flesh crafted by the most perverted sculptor in the galaxy. She rests on the balls of her feet and begins bouncing her hips, cruelly avoiding bottoming out. Just when you think your mind will snap, she rises all the way up so that just your [pc.cockHead] is still parting her lips before slamming back down with a wet, meaty slap. You grab the sheets and scream in pleasure, cumming in her cunt like your life depends on it.");
	output("\n\nThe succubus throws her head back and shrieks in ecstasy as your fill her slit, her own ejaculation momentarily overpowering yours and washing some of your sperm out of her. Your long-denied orgasm is so powerful that it doesn’t lose out for long against the scarlet woman. ");
	if(pc.cumQ() > 2500) output("Even though you normally jizz like a fire hose, you’re backed-up enough that your first spurt of [pc.cum] is the size of half your normal load. Your inhuman virility doesn’t seem to matter to the equally inhuman woman atop you though. When you would expect her belly to bloat in a matter of seconds, she stays totally flat. ");
	output("Your cumshot lances towards her womb, her orgasmic contractions greedily carrying every drop of it upwards and pulling still more cum from you.");
	output("\n\nYou cum for what feels like an eternity, but just as you do, the succubus bottoms out again with an even wetter slap. Her fat ass wobbles, and you grab it like a life preserver as your drown in the pleasure of a second orgasm before the first is even finished. Your [pc.balls] churn" + (pc.balls > 1 ? "s" : "") + " out an ocean of pleasure as they go into overdrive, and when the succubus creams your cock and bottoms out with every bounce of her hips, you black out. ");
	output("\n\nYou jizz in the crimson cumslut even while you’re unconscious, fading in and out as she bounces atop you in a few different positions. Your sadistic mistresses uses you like a fuckstick to please herself, but she makes you feel amazing too. Eventually, the pleasure is so great that you can’t even pass out. You ran out of cum some time ago, and now you might as well be running out of brain cells. Eventually, you feel something inside you start to fade. Your vitals are all fine, but it still feels like color is starting to drain out of the world. <i>“Oooh, sugar, your soul’s SO GOOOOOOD!”</i> The bovine succubus screams as she fucks you faster than ever before. All the color and life in the world seems to be draining away, replaced with pleasure you couldn’t have even imagined before tonight. A split second before it all bleeds out, you hear a knock on the door.");
	
	processTime(30+rand(15));
	pc.orgasm();
	
	addButton(0, "Next", thisIsGettingOutOfHandPleaseSaveMe, undefined, "", "");
}

public function thisIsGettingOutOfHandPleaseSaveMe():void
{
	clearOutput();
	clearMenu();
	showCiaran();
	showName("SPOOKY\nCABIN");
	author("Night Trap");
	
	output("You bolt upright in bed, covered in sweat and [pc.cum]. Was it all just a dream?");
	output("\n\n<i>“Hey, [pc.name], you okay in there?”</i> You hear Ciaran’s voice outside the window as he knocks on the door of the cabin.");
	output("\n\nYou grab your [pc.gear] " + (!pc.isNude() ? "and redress quickly " : "") + "before wobbling downstairs on shaky legs. When you open the door, you see Ciaran smiling in relief. When he sees you, his smile turns into a look of concern. <i>“Hey, kid, are you okay? You look like you’ve seen hell!”</i>");
	output("\n\nYou assure the hellhound that you’re fine. You simply had a nightmare.");
	output("\n\nCiaran sniffs the air before grinning and looking towards your [pc.cocks]. <i>“Well I’ve heard of wet dreams, but never wet nightmares. Care to explain?”</i>");
	output("\n\nYou tell him that you’ll explain on the ride back. He chuckles richly and leads you to his truck.");
	output("\n\nAs you float along the plains of New Texas in the early morning light, you start to feel more relaxed. You begin explaining your dream to Ciaran, who listens spellbound. His breathing gets a little heavier as you describe the bovine succubus to him, and by the end of it, he’s packing a sizeable erection.");
	output("\n\nHe adjusts the crotch of his pants to be a little more comfortable before giving you his thoughts. <i>“Well, you’ve got one hell of an imagination, kid. If I could have dreams like that whenever someone told me a ghost story, maybe I’d listen to them more often. But you’re not going to believe this: that cabin? It’s been bought. Turns out it was some eccentric who doesn’t want people to know he visits New Texas, and paid a lot of extra money to the local government to keep the purchase quiet. It was all just a ‘left hand doesn’t know what the right’s doing’ situation.”</i> He shakes his head in bemusement. <i>“New Texas is just full of silly shit like this.”</i>");
	output("\n\nYou gawp in disbelief. So there was no need for you to even go out there?");
	output("\n\nCiaran grins apologetically with a shrug of his shoulders. <i>“I guess not. Sorry for putting you to through the trouble, kid. But hey, at least you got some money out of it.”</i> He tosses you a credit chit with the promised payment on it. You look down at the little piece of plastic, trying to make up your mind on if it was worth it or not. " + (pc.libido() > 70 ? "You decide pretty quickly that a dream with that much sex in it would’ve been worth having for free." : "") + "");
	output("\n\nThe two of you pass the rest of the trip in friendly conversation, and all too soon you’re back at Big T’s ranch. Ciaran parks his truck and walks you back to the Bucking Bronco. <i>“Thanks for helping me out with this, [pc.name]. I hope you didn’t consider this a waste of time. Come see me sometime!”</i>");
	output("\n\nYou wave farewell to the hellhound and tell him you’ll see him soon. With some extra money in your pocket and a very vivid dream in your memory, you return to your adventure.");
	
	//Set Time to 8:00
	if(hours >= 8) processTime(60*(23-hours) + (60-minutes));
	processTime(60*(7-hours) + (60-minutes));
	
	pc.credits += 500;
	pc.applyCumSoaked();
	currentLocation = "505.5";
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}