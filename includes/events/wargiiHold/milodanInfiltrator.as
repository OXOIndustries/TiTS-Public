//By Wsan

public function showMiloInfiltrator(nude:Boolean = false):void
{
	showName("MILO\nINFILTRATOR");
	showBust("MILO_INFILTRATOR" + (nude ? "_NUDE":""));
}
//Intro
public function milodanInfiltratorEncounter():void
{
	showMiloInfiltrator();
	author("Wsan");
	if(flags["MET_MILO_INFILTRATOR"] == undefined)
	{
		output("\n\nAn energy round flies past your head before you can even react, but you’re fast enough to duck under the second. Raising your head beyond the small cover you’ve found, you can see the culprit: a milodan man lying down with a laser rifle braced against his shoulder, lining up another shot. You throw your head back down and a second later hear something sizzle against the rock in front of you. Peeking back up, you can see him struggling with the rifle - you don’t know what it is, but something’s wrong with it and you’re going to take advantage!");
		output("\n\nHe spots you dashing towards his position and begins frenetically struggling with the gun, losing precious seconds as you rapidly gain on his position, until finally he fixes it. It’s too late, though, and you’re far too close for him to bring the unwieldy gun to bear! He desperately draws a sidearm from a back holster and fires wildly, but misses with all of his shots. Then you’re on top of him.");
		output("\n\nYou bring down your [pc.meleeWeapon] on his outstretched arm, his shield generator crackling to life and holding, the impact forcing you backwards. In the space between you, he slaps a new magazine into the pistol and raises it.");
	}
	else
	{
		output("\n\nYou spot another milodan infiltrator before he can get the drop on you - but his eyes widen in recognition at the same time as your own. Drawing a pistol, the hostile sabercat closes in.");
	}
	output("\n\n<b>You have to fight!</b>");
	IncrementFlag("MET_MILO_INFILTRATOR");
	//start combat here
	startInfiltratorFight();
}

public function startInfiltratorFight(noCaptive:Boolean = false):void
{
	var tEnemy:MilodanInfiltrator = new MilodanInfiltrator();
	setEnemy(tEnemy);
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(takeDownAnInfiltratorKitty);
	CombatManager.lossScene(loseToInfiltrator);
	CombatManager.displayLocation("INFILTRATOR");
	if(!noCaptive) randomKorgSavingProcChances();
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//Loss
public function loseToInfiltrator():void
{
	showMiloInfiltrator(true);
	author("Wsan");
	output("Crumpling in defeat, you try and steady yourself by putting out an arm and instead topple sideways, collapsing to the ground. You hazily realize you never actually put out your arm at all, too weakened and disoriented by your now-captor too even notice. He looms over you now, his rifle slung across his back and carrying his autopistol. Crouching down, he notes your state of consciousness and curiously prods you with the gun’s barrel. You groan, already imagining what he wants with you.");
	output("\n\n-");
	output("\n\nYou could have guessed. Far too tired to resist, you lie under him moaning as he eagerly takes his fill of you, his cock impossibly hard as he spears your [pc.vagOrAss]. Thankfully, he doesn’t try and knot you. Instead, you discover in dismay, he just stays hard and starts to fuck you again, grabbing your asscheeks and spreading you wide while he pounds your " + (pc.hasVagina() ? "cunt":"asshole") + ". Prostrate and helpless, you wind up cumming before his second, unable to resist being so dominantly taken.");
	if(pc.hasVagina()) pc.cuntChange(0,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));
	output("\n\nWhen darkness finally takes you, it’s on the back of four or five orgasms. Thanks to your fading consciousness and lack of recognition of the passage of time, it feels like they all come one right after another, matching his own as he repeatedly fills you up with his spunk and then starts all over again. You’re almost thankful to escape his treatment of you, but a small, traitorous part of you wants to stay awake even as you spin into the abyss just to keep feeling him.");
	for(var x:int = 0; x < 5; x++) { pc.orgasm(); }
	if(pc.hasVagina())
	{
		pc.loadInCunt(enemy,0);
		pc.loadInCunt(enemy,0);
	}
	else
	{
		pc.loadInAss(enemy);
		pc.loadInAss(enemy);
	}
	clearMenu();
	addButton(0,"Next",wargiiBadEnds);
}

//Win
public function takeDownAnInfiltratorKitty():void
{
	if(enemy.HP() <= 1) output("Defeated, the milodan crumples to the ground facedown, battered under your relentless assault. You approach him with care, wary of a sneaky surprise attack, but by the time you’re standing next to him you’ve relaxed. This guy is out like a light, or very close to it. He groans when you tap him with your foot, at least.");
	else output("The milodan falls to his knees, a bulge showing through his infiltration suit, but he can’t do anything with it; he’s too sluggish and hypnotized by your form, dazed but never breaking eye contact as his mouth hangs open. He must be so needy and pent-up what with all the stims he probably has going. Unafraid, you approach him, his weapons having been discarded in favour of rubbing himself through his suit.");
	output("\n\nYou effortlessly strip him out of his clothes, undoing his suit’s back and pushing him down on the ground, wresting him free of his constrained, form-fitting bodywear. Oh - he’s actually rather lithe and muscular, the body of a swimmer, and his face isn’t bad either. The way he’s " + (enemy.HP() <= 1 ? "glaring at you reproachfully":"looking up at you needily") + " is nice, too. His cock isn’t overly large for his species, but looks extremely hard. It might be fun to pay him back a little for attacking you...\n\n");
	//[Fuck ass] [Rimjob] [Oral] [Docking]
	processTime(3);
	clearMenu();
	if(pc.lust() >= 33)
	{
		if(pc.hasCock())
		{
			if(pc.cockThatFits(1000) >= 0) addButton(0,"Fuck Ass",penisRouter,[fuckInfiltratorAss,1000,false,0],"Fuck Ass","Fuck this milodan’s ass good and hard.");
			else addDisabledButton(0,"Fuck Ass","Fuck Ass","You’re too well-endowed for this.");
		}
		else addDisabledButton(0,"Fuck Ass","Fuck Ass","You need a penis for this.");
		if(pc.hasCock()) addButton(1,"Get Rimjob",rimJobInfiltrator,undefined,"Get Rimjob","Make the milodan eat your ass.");
		else addDisabledButton(1,"Get Rimjob","Get Rimjob","You need a penis for this.");
		addButton(2,"Oral",getOralFromInfilBoi,undefined,"Oral","Put him to work on servicing your [pc.crotch] with his mouth.");
		if(pc.biggestCockVolume() >= 1000) addButton(3,"Docking",dockingSeasonBiiiiyaaatch,undefined,"Docking","Force the milodan to pump his load into your dick.");
		else if(pc.hasCock()) addDisabledButton(3,"Docking","Docking","You aren’t big enough to take his dick inside your dick.");
		else addDisabledButton(3,"Docking","Docking","You need a really big dick for this." + (silly ? " Absolutely YUGE!":""));
	}
	else
	{
		addDisabledButton(0,"Fuck Ass","Fuck Ass","You aren’t aroused enough.");
		addDisabledButton(1,"Get Rimjob","Get Rimjob","You aren’t aroused enough.");
		addDisabledButton(2,"Oral","Oral","You aren’t aroused enough.");
		addDisabledButton(3,"Docking","Docking","You aren’t aroused enough.");
	}
	captiveRescueButton(5);
	if(fightHasCaptive()) addDisabledButton(14,"Leave","Leave","You can’t leave the captive behind!");
	else addButton(14,"Leave",wargiiLeaveCombatEnd);
}

//[Fuck ass]
//Dikk only.
//Tooltip: Fuck this milodan’s ass good and hard.
public function fuckInfiltratorAss(x:int):void
{
	clearOutput();
	showMiloInfiltrator(true);
	author("Wsan");
	output("Yeah, this guy would look better on his front with his ass in the air for you to fuck. You get off him and flip him over with your [pc.foot], the milodan landing face-down on the ground with a thud and a whimper. Damn, he’s pretty good-looking from this side too. He’s got a fit, tapered back that leads down to his narrow waist and an ass that’s big enough for you to sink your hands into.");
	output("\n\n<i>“Someone’s been doing their squats,”</i> you mutter, positioning yourself behind him and tugging his hips upwards, exposing his butt.");
	output("\n\nYou lick your finger and, having coated it liberally in saliva, slip it into the milodan’s ass.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.hasPerk("Myr Venom"))//Red myr venom:
	{
		output(" The response is immediate. He whines, quietly at first then with more urgency as your " + (pc.hasPerk("Myr Venom") ? "myr ":"") + "venom is immediately taken up by his body. Realizing you’ve done something to him, he groans desperately and starts thrusting his ass back at you");
	}
	else output(" He whines at first, but the more you sink in the more receptive he gets. Soon enough he’s moaning under the ministrations of your hand and by the time you take your finger out he’s panting, his dick dripping already");
	output(". Now that’s what you like to see.");

	output("\n\n<i>“Okay pup, brace yourself,”</i> you say, grinning and spreading his cheeks. Flexible and springy, the way the flesh of his butt feels in your grip inspires you to spank him, but you’ll have to wait until you’re inside. He’d be far too tight otherwise. <i>“Open up.”</i>");

	output("\n\nWith a ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.hasPerk("Myr Venom")) output("desperate, keening whine of relief");
	else output("long, pained whine of sorrow");
	output(", the milodan sags in your grip as you sink the first few inches of your [pc.cock " + x + "] inside his tight and narrow asshole.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.hasPerk("Myr Venom")) 
	{
		output(" With the venom having spread inside him, you don’t even have to force it inside. He does it all on his own, getting up on all fours and arching his back, grunting and trying to fit more and more of your dick into his asshole; anything to assuage the red heat inside him.");
	
		output("\n\n<i>“Is this any way for a proud soldier to act?”</i> you murmur to him, grinning fiercely. What a sight. Not even a few minutes ago he was trying to kill you, and now he’s urgently trying to sink your cock to the hilt. <i>Now</i> you give him a spank, but not even the pain or the way he recoils from the impact stops him from taking more of you in.");
		if(pc.cocks[x].cLength() < 9) output("Successfully having gotten you " + (pc.balls > 1 ? "balls-deep":"sheathed") + " inside him, he moans and halts for a scant second");
		else output("You’re too big for him to get you " + (pc.balls > 1 ? "balls-deep":"sheathed") + " initially, but he groans and continues pushing back. Having taken enough of you to have your [pc.cockHead " + x + "] make a subtle showing under his tummy’s skin, he pauses and pants");
		output(", regathering his strength.");

		output("\n\nYou’re content to wait, knowing he won’t find relief unless he takes it into his own hands. Sure enough, he slowly begins to slide forwards before realizing he needs to keep you deep inside him to stave off the sensation of heat. With a desperate moan, he starts rocking back and forth as fast as he can, his asshole stretching taut around your cock with every thrust.");
		output("\n\nSo worked up" + (enemy.lust() >= enemy.lustMax() ? " and still harboring the need from the battle":"") + ", it doesn’t take him much to cum. Rather than a loud, wild cry, he lets loose a desperate groan, sinking back down to the ground as he shudders and shakes on your dick. His prick flexes and strains, spurting weakly into his stomach fur and onto the surface below while he moans in release. You simply wait, enjoying the way his ass practically massages your cock, squeezing and stretching out with every ejaculation.");
		output("\n\nSo caught up in the feeling, it takes the milodan a few seconds to notice he’s not free of the heat. With a despondent whine he thrusts himself back onto all fours, his arms shaking with the effort of keeping himself . Panting hard with exertion, he begins anew with a long, deep thrust that has you ");
		if(pc.cocks[x].cLength() < 9) output("wholly inside him");
		else output("showing on his tummy");
		output(", lining his insides with precum. You don’t know how long he’ll keep this up, but you’re curious to see how far he’ll go.");
		pc.cockChange();
		output("\n\nAs it turns out, he can’t do it for long. He holds out for another five minutes, cumming twice more in that time owing to the venom and his heightened sensitivity, but he’s too weak to get back up. That doesn’t mean he’s any less desperate, though. He wants it so bad it looks like he’s on the verge of tears, from what you can see as he turns his head back.");
		output("\n\n<i>“You want relief from the heat?”</i> you whisper to him, bent over his prostrate body.");
		output("\n\n<i>“Yes,”</i> he moans in a weak, accented voice. <i>“Please, yes! Fuck me!”</i>");
		output("\n\n<i>“Fine, I’ve got your relief right here,”</i> you say, pulling your head back and planting your hands on his shoulders. You draw your [pc.hips] back once and slowly sink yourself back inside, enjoying his delighted croon of pleasure. <i>“Nnnnn... more where that came from.”</i>");
		output("\n\n<i>“Ohhh! Ohhhhhh!”</i> the milodan cries, the loudest he’s been since you beat him. He bends his sore, shaking legs to weakly press his heels into your back, imploring you all the while. <i>“More! More!”</i>");
		output("\n\nYou bring him to a massive, body-shaking orgasm almost immediately, one that you suspect has nothing to do with the venom itself. The milodan almost passes out at its zenith, his eyes fluttering as you grunt above him, still pumping him full of cock. You sit up and pull the milodan into your lap, bouncing him up and down roughly while he cries out in pleasure. His dick spurts out another rope of jizz every time he lands in your lap, unable to hold himself back from his basest instincts.");
		output("\n\nTaking advantage of how receptive the milodan is to your every action, you change his position multiple times. Still taking him from below in your lap, you have him facing you now, enabling you to see his overexcited expression of ecstasy. His mouth hangs open, his panting like music to your ears, and you can feel his stomach flexing with the effort of pleasing you every time he bounces. He gazes at you with something between despair and awe, your performance clearly expanding the Uveto native’s horizons.");
		output("\n\nFrom there, you lay him on his back and push his legs up, resting them atop your shoulders as you roughly grasp his hips and fuck him on the ground. He makes a massive mess with his now-limp dick, still splattering his groin and stomach fur with pearly-white jizz with his feet in the air and his toes curling in pleasure.");
		output("\n\nFeeling your own orgasm rapidly approaching with the way you’re pounding the fuck out of this milodan’s tight ass, you put him back on his stomach and lay him out prone so you can fuck him from above, grunting with the effort of burying your cock as deep as possible inside him. The milodan, for his part, doesn’t seem to mind, crying out in joy no matter how you take him.");
		output("\n\nWith a deep, strained groan through grit teeth, you finally cum in the milodan’s asshole, your [pc.cum] surging from your [pc.cockHead " + x + "] and filling his insides after the painstaking half an hour of fucking the hell out of him. He moans in lewd, decadent pleasure, laid out on the ground and feeling your spunk coat his innards.");
		if(pc.cumQ() < 1000) {}
		else if(pc.cumQ() < 3000) output(" The imprint of your dick on his stomach disappears as your cum distorts his tummy, obscuring the view");
		else if(pc.cumQ() < 5000) output(" Your loads leave his tummy slightly swollen after you’re done, some of it spraying back out of his stretched-taut asshole");
		else if(pc.cumQ() < 10000) output(" By the time you’re done, your voluminous loads leave him with a swollen tummy, carrying a gallon or two of your cum while the excess spurts down his thighs");
		else if(pc.cumQ() < 25000) output(" Your massive loads pump into the milodan almost endlessly, plumping up his belly with your cum until he looks like he’s pregnant with a litter of leithans. The excess flows from his ruined asshole like a river, but it doesn’t diminish the size of his tummy at all");
		else 
		{
			output(" The gush of hot, thick semen into the milodan’s tummy swells it out almost immediately, ballooning in size with every passing second until the milodan’s moans cut off.");
			output("\n\nHis mouth continues to open and close, his eyes betraying his lack of understanding, right up until he realizes what’s happening and they spring open in alarm. Opening his mouth, the only thing that comes out is a gout of body-temperature jizz. Straining atop your cock, he opens his mouth again and again, seed violently spraying from his overused throat. You’re using him as nothing more than a toy, and he’s helpless to do anything about it. By the time you’re finished, he sags on the ground in despair.");
			output("\n\n<i>“Impressive display, doggy,”</i> you murmur, patting him on the back. <i>“Didn’t think you’d be able to handle it.”</i>");
		}
		output("\n\nYou pull out as the milodan begins to pass out.");
		if(pc.isAss()) 
		{
			output(" Right as he’s on the verge of unconsciousness, you lie down on top of him and calmly bite his neck. His reaction is quiet, but strong as the powerful venom begins to flow into him, overloading his sensory systems and sending him spiralling into a fugue state where all he can do is buck underneath you and cum his brains out. You keep your fangs sunk into him until he genuinely passes out, though the shaking never stops. You can see a pool of his spunk growing underneath him, still cumming even as you step away" + !(pc.isCrotchExposed() ? " and reclothe yourself":"") + ".");
			output("\n\nTaking your leave, you move on. He’ll have to come find you if he wants more.");
		}
		else
		{
			output("\n\nYou idly wonder how this milodan is ever going to sate his newfound urges for red myr venom when you’re not around. The dose you gave him was low enough he’ll no doubt be fine without looking for more, but if he ever finds another source... you suspect he won’t stop until he gets his fill.");
			output("\n\n" + (!pc.isCrotchExposed() ? "Reclothing yourself and s":"S") + "tanding up, you take your leave and move on.");
		}
		processTime(30);
		enemy.loadInAss(pc);
		enemy.applyCumSoaked();
		pc.orgasm();
		output("\n\n");
		wargiiFightWinRouting();
	}
	else
	{
		output("\n\nHe’s reluctant, as you might expect, but you’re about to show him the pleasure of submitting utterly to his new master. That drooling cock of his is a sign of things to come, that’s for sure - he’ll never cum again without thinking of the way you’re going to make him feel.");
		output("\n\n<i>“Definitely a virgin back here, huh?”</i> you murmur to him, patting his butt. <i>“That’s too bad, pup. This’ll hurt a little.”</i>");
		output("\n\nHands stretching him as wide as he’ll get, you sink your length another few inches inside him as he hisses in pain, gaining that much more leverage to work with. You experimentally withdraw a few inches, precum drooling from your dick and lubing your passage, and slowly slide back in. Now he moans instead, the sensation of physical rejection giving way to debased pleasure. He can’t help the way his body reacts, not with how you’ve conquered him.");
		output("\n\n<i>“Good doggy,”</i> you say with a grin. <i>“Now for the rest.”</i>");
		output("\n\n");
		if(pc.cocks[x].cLength() < 10) output("You manage to sheathe yourself with a few more slow, deliberate thrusts into the milodan’s stretched-taut asshole, your " + (pc.balls > 0 ? "[pc.balls] resting against his taint":"groin nestled into his butt") + ". You let him have a few seconds to relax, panting with the effort of having taken you, before you make any moves.");
		else if(pc.cocks[x].cLength() < 15) output("It takes you a lot of work and a lot of very slow, deliberate thrusting to break down the milodan’s instinctive defense against his being penetrated, but you do it. You finally sheathe yourself " + (pc.balls > 1 ? "balls-deep":"to the hilt") + " inside his tight asshole, wrapped around your cock so tight it’s difficult to even move. He whimpers slightly up front, and you let him take some time to try and relax before you thrust again.");
		else if(pc.cocks[x].cLength() < 21) output("You can’t sheathe your entire length, but you get damn close. Only a few inches of your dick remain outside of the milodan’s overtaxed asshole, over a foot of it buried in his guts and creating a large bulge through the fur and skin of his tummy. Hearing the way he whimpers and keens from up front, you let him relax a little before you start thrusting.");
		else output("There’s no way you were ever going to get your entire length into an anal virgin this tight, but you’ve given it a good try. Over a foot of your dick is burrowed into the milodan’s stretched-out asshole, a sizeable bulge imprinted on the skin and fur of his tummy. He pants and whines up front, shaking on the end of your dick like he’s a masturbation toy. You give him a few seconds of trying to relax before you do anything.");
		output("\n\nDrawing back, you slowly withdraw your entire length from his hot, grippy asshole, leaving only the head at his entrance. He squeezes down on you, wordlessly discarding his opportunity for a momentary reprieve in favor of trying to stop you from getting free. You’ve gotten him this far, now you have to push him over the finish line.");
		output("\n\nIt doesn’t take long" + (enemy.lust() >= enemy.lustMax() ? ", especially not with how turned on he was during the fight":"") + ". The first thrust back inside has him weakly balling his fists, squeezing your dick while he tries to fight it and just relax. On the second, he begins to pant and whine, shivering almost imperceptibly in your hands as his cock steadily drips on the ground. On the third he groans and tries to thrust back into you while you’re holding him still, and on the fourth he finally cums with a loud, desperate cry of relief.");
		output("\n\n<i>“Yes! Yesyesyesyes,”</i> the milodan moans, sounding almost like he’s pleading, begging you to keep going with the first words he’s said since you encountered him. <i>“Ohhhhh, finally...”</i>");
		output("\n\nYou don’t let him stop there, maintaining the slow and steady pace of your [pc.hips] rolling into him. His back arches up and then down, his body instinctively seeking to drive himself further down on your dick, to get you further inside and enhance the feeling of being pleasurably impaled. He drips, dribbles and spurts all over the ground, a rope of jizz shooting from the tip of his dick every time you bottom out inside him.");
		output("\n\n<i>“Hhhuuuhhh, hngh,”</i> he grunts in both exertion and pleasure, shakily pushing himself up on all fours. <i>“Grrrgh-!”</i>");
		output("\n\n<i>“Pretty pent up, aren’t you?”</i> you say innocently, shifting your grip around his narrow waist. <i>“Lemme help you with that a bit.”</i>");
		output("\n\nYou have him howling in unabashed joy not even a few minutes later, pounding his ass hard enough " + (pc.balls > 0 ? "to make your [pc.balls] loudly slap against his taint":"that your hips make a loud smack every time they meet the pliable flesh of his butt") + ". This time he cums even harder than the last, jizz flowing freely from his member.");
		output("\n\n<i>“That’s right, get it all out,”</i> you murmur to him encouragingly, not stopping your body-rocking fucking for even a second. You can see his fingers curling and uncurling with every massive ejaculation, wads of thick cum splattering the ground. <i>“By the time I’m done with you, we’ll </i>both<i> be totally empty.”</i>");
		output("\n\nWhen he’s done cumming you roll him over and take him on his back, smirking down at the writhing milodan when he weakly wraps his shaking legs around your [pc.thighs]. He’s definitely come around to the idea of letting his better take control. You expertly guide him to yet another orgasm, his back arching off the ground as his midriff contracts and flexes, his cock straining as it pours a pool of seed across his groin.");
		output("\n\nBefore he’s even finished you put your hands on his thighs and push them up, surprised by the milodan’s flexibility as you manage to get his legs looped behind his head. Holding him down with one hand and supporting yourself with the other, you start to fuck him as hard as you can from above - something about having a moaning, cumming milodan balled up in this position is too fucking hot to resist. It looks like you’re doing a porn shoot and with the way he’s sweetly crooning in your ear, sounds like one too.");
		output("\n\nHe cums twice more like that, unable to move or resist at all when the sensation of pleasure is forced upon him. You can feel your own orgasm approaching as you speed up, fucking him so hard the dull impact of your hips slamming against his cum-soaked fur echoes in the hold.");
		output("\n\nHis face is so close, and he’s looking up at you with nothing less than utter adulation in those wide eyes of his.");
		processTime(25);
		pc.changeLust(25);
		enemy.lust(100);
		clearMenu();
		addButton(0,"Kiss",kissDatKittyCat,x);
		addButton(1,"Don’t",dontSmoochMiloBoysThatsGross,x);
	}
}

//[Kiss]
public function kissDatKittyCat(x:int):void
{
	clearOutput();
	showMiloInfiltrator(true);
	author("Wsan");

	output("You grab the surprised milodan’s head and pull it back, roughly planting your lips on his and kissing him right as you begin cumming in his asshole. He groans into your mouth, closing his eyes and leaning into your embrace as best he can. ");
	if(pc.cumQ() < 1000) output("Hips pressing insistently into his ass, you fill him with the load you’ve built up over half an hour of fucking his lithe body. By the time you pull back and out, he’s passing out from tiredness as he cums all over his stomach again.");
	else if(pc.cumQ() < 5000) output("Pressing against his matted, sweaty fur you can feel his tummy beginning to swell outwards, lightly pushing against your [pc.stomach] as he’s filled with your cum. Each roll of your hips fills him just a little bit more until finally, he starts to pass out from the exhaustion and you pull out");
	else if(pc.cumQ() < 10000) output("You can feel his tummy swelling, inflating against your [pc.stomach] with every ejaculation you let loose inside him, pouring more than a gallon into his depths. It’s a nice feeling having your own warmth pressed against you insulated by a layer of fur and skin, and apparently the same goes for the milodan. He cums all over the underside of his own stomach as he starts to pass out, overtired from the hard work getting fucked in the ass.");
	else if(pc.cumQ() < 25000) output("Holding him down, you can feel first-hand the urgency of his first few moans into your mouth as your cum gushes into his body. Rather than pulling away though he pushes against you even harder, trying to wrap his legs around your back while you pump him full of virile jizz. He proves too weak to lift his legs and as his tummy balloons to a size you’re inclined to call erotic, he starts to pass out, his head waving from side to side. You finish cumming inside him and roll him off you, sending him onto his side. Even unconscious, he cradles his warm, sloshing tummy.");
	else 
	{
		output("Holding him down, you can feel his eyes spring open in alarm when he feels the liquid warmth of your seed begin to violently jet into his body, then flutter closed again. Giving himself over to your desires, he relaxes in your grip as you slide a hand under his lower back, supporting him as his stomach begins to jiggle and rapidly swell. Your thick, hot jizz fills his tummy almost immediately, ballooning him to a size befitting a well-used cumdump and nothing less. Knowing what’s coming after this, you...");
		processTime(5);
		enemy.loadInAss(pc);
		pc.orgasm();
		clearMenu();
		addButton(0,"Keep Kiss",keepKissykissysmoochsmooch,x,"Keep Kissing","Keep kissing him... even if it means your own cum washes into your mouth.");
		addButton(1,"Avoid",notKissyKissyCumshotKitty,x,"Avoid","No need to taste your own product.");
		return;
	}
	processTime(5);
	enemy.loadInAss(pc);
	pc.orgasm();
	infiltratorDoneButtfuck();
}

//Don’t go to a new scene for these, just start the first line right after the ellipsis.
//[KeepKissing]
public function keepKissykissysmoochsmooch(x:int):void
{
	output(" throw caution to the wind and kiss him all the harder, not letting him go even as he begins to gag.");
	output("\n\nWhat turns you on the most, though, is that he <i>knows</i>. He knows that he’s your living cumdump, forced to cough up your hot, salty jizz into your mouth, but that’s not stopping him from desperately kissing you back even as he rests on the very edge of consciousness. You can feel his stomach pushing against you from below as it swells, the excess beginning to spurt, pump, and gush between your [pc.lipsChaste]. You dutifully swallow it down humping the milodan the whole time, sharing in the experience. It’s every bit as thick and concentrated as it was when it was pumped from your " + (pc.balls > 0 ? "[pc.balls]":"nethers") + ", but the addition of the sexy milodan’s saliva helps you get it down.");
	output("\n\nWhen you’ve truly run out of spunk to give the quaking milodan you’re sporting a nice baby bump yourself, your stomach swollen full of warm, sloshing seed. You can’t help it - you’re just such a dedicated cumslut you’ll even eagerly suck down your own. With his last iota of strength, the milodan raises his arm and lets it fall across your neck, catching you in an embrace as he begins to pass out.");
	processTime(5);
	pc.loadInMouth(pc);
	infiltratorDoneButtfuck();
}

//[Avoid]
public function notKissyKissyCumshotKitty(x:int):void
{
	output(" roll onto your side and put his head over your shoulders.");
	output("\n\nNot even a second later he gags and coughs and then, seemingly caught off-guard, gurgles wetly as your spunk begins to spew forth from his throat. You hump him slowly, each movement matching a gigantic ejaculation from his mouth, seed running down the lips you were kissing just moments before and dripping steadily from his chin.");
	output("\n\nWhen at last your colossal orgasm finally ends, you give him one last wet, salty kiss as he begins to pass out.");
	processTime(3);
	infiltratorDoneButtfuck();
}

//[Don’t]
public function dontSmoochMiloBoysThatsGross(x:int):void
{
	clearOutput();
	showMiloInfiltrator(true);
	author("Wsan");
	output("Thinking better of it, you instead pull him tightly against you, enveloping him in your arms as you grunt and start pumping cum into the tight passage of his asshole. He sighs in your grip, closing his eyes and hugging you as tightly as he can while you fuck your jizz into him from below.");
	output("\n\n");
	if(pc.cumQ() < 1000) output("You hold him in place and strain, cumming deep inside the milodan’s fit ass. You can feel him squeezing down on you, milking your dick from base to tip as you finish pouring your load inside him. Lifting him off and letting him unfold back on the ground, seed spurts from the milodan’s well-fucked asshole as his legs hit the ground");
	else if(pc.cumQ() < 5000) output("Your thick loads shoot upwards into the milodan one by one as you hold him in place, his insides wrapped around your cock. You can feel his tummy begin to swell and warm as he takes on your liquid weight and by the time you lift him off and put him back on the ground, he’s got a bit of a sagging paunch");
	else if(pc.cumQ() < 10000) output("Your massive loads surge into the milodan’s well-fucked ass, splashing through his guts and painting them [pc.cumColor]. His tummy almost instantly bulges outwards, sagging and groaning as it takes on more than a gallon of your thick semen. When you roll him off your dick and onto the ground, he lands face-down and the pressure on his pregnant-looking belly sends a fountain of jizz back out his ass");
	else if(pc.cumQ() < 25000) output("Cum fountains upwards into the milodan from the [pc.cockHead " + x + "] of your dick, the milodan’s eyes shooting open as he begins to weakly struggle in your hands. He soon gives into the torpor, though, and lets his tummy swell with your thick seed. You can feel it inflating against you, its warmth pressing more and more insistently into your [pc.stomach] as you fill your cumdump from the bottom up. When you put him back on the ground he rolls onto his side, cradling his tummy while jizz slowly and rhythmically pumps back out of his fucked-open asshole");
	else 
	{
		output("Your gargantuan loads gush upwards into the milodan, causing him to struggle against the potentially dangerous sensation until finally it’s too much to take. Against his will he relaxes in your grip while you put his head over your shoulder, knowing what’s coming. His tummy rapidly swells outwards, threatening to wrap around you before he suddenly gags from beside your head, making a small choking noise that suddenly gets cut off.");
		output("\n\nThough you don’t look to see, you can hear it. His mouth hangs open, the torrent of spunk rising from his gut forcing his jaw open with the pressure. He vomits seed over your shoulder, a veritable spout of hot, thick spunk shooting from his mouth and splattering across the ground. He manages one inhale before the pace of your inhuman loads arriving outmatches his holding capacity, and suddenly it spurts from his nose as well.");
		output("\n\nYou don’t let him get away. You keep him there, held firmly in your lap, while you vent everything you have to give him. You did promise that you’d both be empty by the end after all, though looking down at him now after tossing his unconscious form back on the ground like a rag you suppose that was a lie - he’s not going to be empty for a <i>long</i> time. Your jizz fountains from both ends, the milodan lying on his side with his arms around his insanely ballooned tummy while he coughs up seed");
	}
	output(".");
	processTime(5);
	enemy.loadInAss(pc);
	pc.orgasm();
	infiltratorDoneButtfuck();
}

//merge kiss/dont here
public function infiltratorDoneButtfuck():void
{
	output("\n\nThe milodan, finally fucked beyond consciousness, passes out while you" + (!pc.isCrotchExposed() ? " dress and":"") + " get up. You walk away from the encounter confident in the knowledge he’ll spend the rest of his life looking for someone to fuck him the way you did and never will - unless he has the fortune to run into you another time.\n\n");
	wargiiFightWinRouting();
}

//[Rimjob]
//Tooltip: Make the milodan eat your ass.
public function rimJobInfiltrator():void
{
	clearOutput();
	showMiloInfiltrator(true);
	author("Wsan");
	output("You waste no time in pushing him down and shuffling up his body, turning around and " + (!pc.isAssExposed() ? "pulling your [pc.crotchCovers] down, ":"") + "planting your [pc.ass] right on his pretty boy face with a sigh. He struggles weakly against you but with your knees on his arms, there’s not much he can do about it save for one thing.");
	output("\n\n<i>“Start licking, bitch,”</i> you tell him, placing your hands on his chest. <i>“Maybe if you’re lucky I’ll let you get off too.”</i>");
	output("\n\nYou can hear - and feel - him grumbling, but he knows you’re in charge. He experimentally licks your [pc.buttcheek], taste-testing your butt, and apparently decides he likes it. The next thing you feel is a warm, wet tongue probing your [pc.asshole], licking all around your pucker and swishing across it feather-light.");
	output("\n\n<i>“Nnnn, that’s more like it,”</i> you grunt, leaning forward and arching your back in pleasure. <i>“Don’t tease me for too long, pup...”</i>");
	output("\n\nYou grin when you feel the milodan place his hands on your cheeks and spread them wide, stretching out and exposing your asshole for him to lick. You lightly clench and unclench, giving him a nice winking greeting, then groan as you feel his tongue slip inside you. It’s gradual at first but between the pup’s insistence and your own desires, it’s not long until he’s rapidly spearing his entire tongue into your depths, licking your insides. You can’t help but shiver at the feeling of it, the warm prehensile muscle inside your rim just unlike any other experience.");
	output("\n\n" + (!pc.isAssExposed() ? "Undergarments already out of the equation, y":"Y") + "ou");
	if(pc.hasCock()) output(" wrap a hand around [pc.oneCock], beginning to slowly jack yourself off");
	else if(pc.hasVagina()) output(" slide a hand down to [pc.oneVagina] and begin teasing your [pc.clits], rubbing and stroking");
	else output("r hands slide up your [pc.stomach] to your [pc.chest], alighting upon your nipples and teasing yourself");
	output(" while the milodan tonguefucks your asshole. Fuck, he’s doing pretty well... maybe you should give him a reward.");
	output("\n\nYou can see the milodan is still outrageously hard, occasionally pumping his hips upward just out of instinct. His bright red doggy dick, as hard as ever, is dripping with slick precum.");
	processTime(10);
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Jerk Him",jerkDatKittykaaaat);
	addButton(1,"Don’t",nojerkies4KittyBois);
}

public function jerkDatKittykaaaat():void
{
	clearOutput();
	showMiloInfiltrator(true);
	author("Wsan");
	output("<i>“Good boy,”</i> you mutter, " + (pc.hasCocks() ? "letting go of your second dick and ":"") + "grabbing ahold of his straining cock.");
	if(silly && pc.hasCocks()) output(" You’ve never wanted to have four arms more than you do right now.");
	output(" <i>“Fuck, you are </i>stiff<i>... does puppy need to cum?”</i>");
	output("\n\nThe ensuing whine against your butt and the flexing in your hand tells you he does.");
	output("\n\n<i>“Yeah, I guess you want a reward, huh?”</i> you continue, jacking him off at the same pace you’re rubbing yourself. <i>“For being such a good, obedient boy.”</i>");
	output("\n\nHis dick immediately pumps a dollop of precum into your fingers, smearing it across his surface. You smirk. He <i>likes</i> being told that. You could have guessed what with the way he’s eagerly tonguing your asshole, but it’s always nice to be proven right. Well, maybe he does deserve his reward after all.");
	output("\n\nThe milodan’s warm tongue penetrates your asshole over and over while you jack the both of you off, your nose flaring with each pleasured exhalation. You’re getting close, your hands speeding up, both of them slick with precum. With a deep breath and a last-second buck of your hips, you close your eyes and cum, settling your ass back on the milodan’s face.");
	output("\n\nIt feels great. To be calmly seated atop your captive’s face while he licks and sucks on your [pc.asshole], your [pc.cockBiggest] pumping seed all over his stomach even as his own mirrors it. You groan, your head tilting back with the pleasure. You really wouldn’t mind doing this more often...");
	output("\n\nBy the time you’ve both finished cumming, panting and moaning, his fur is drenched and matted with sticky seed. It’s going to be a pain in the ass for this guy to clean up, but it’ll be a nice reminder of who bested him. Finally lifting your [pc.ass] off his face you stand up and stretch, sighing in satisfaction.");
	rimkittyEpilogueOutroShit();
}

//[Don’t]
public function nojerkies4KittyBois():void
{
	clearOutput();
	showMiloInfiltrator(true);
	author("Wsan");
	output("On second thought, he <i>did</i> try to kill you, you muse. You’d be better off just using him to get off and then ditching, his pleasure be damned. ");
	if(pc.hasCocks()) output("Besides, it’s not often you get to jack off " + (pc.cockTotal() == 2 ? "both":"two") + " of your cocks while someone eats your ass. ");
	output("You begin rolling your [pc.hips], rubbing yourself on his face while his warm tongue penetrates your asshole again and again.");
	output("\n\n<i>“Nnnn, fuck,”</i> you grunt, breathing hard as you feel yourself getting closer to the peak, your [pc.cockBiggest]" + (pc.hasCocks() ? " and [pc.cockSmallest]":"") + " straining in your hand" + (pc.hasCocks() ? "s":"") + ", precum flowing from the" + (pc.hasCocks() ? "ir tips":" tip") + ". <i>“G-gonna... rrrgh!”</i>");
	output("\n\nWith a loud, satisfied growl, you cum explosively while the milodan sinks his tongue as deep into your asshole as he can get it. Your eyes roll back in your head at the feeling, your ass instinctively clenching on him while you ejaculate sticky cum all over his furred stomach, drenching it in warm seed. Your hand" + (pc.hasCocks() ? "s":"") + " only get" + (!pc.hasCocks() ? "s":"") + " rougher and faster as you cum, stroking yourself from sensitive tip to throbbing base while you empty your " + (pc.balls > 0 ? "[pc.balls]":"self") + " all over the lower half of the milodan.");
	output("\n\nWhen you’re finally done, you groan in relief and lean back, steadying yourself with a hand. Having withdrawn his tongue the milodan gives you a last few exhausted licks, the tip caressing your [pc.asshole] lovingly. You smirk at his subservience, allowing him to pay his respects before lifting yourself off with a sigh of satisfaction.");
	//merge jerk him and don’t here
	rimkittyEpilogueOutroShit();
}

public function rimkittyEpilogueOutroShit():void
{
	output("\n\nYou lean down to the exhausted milodan and whisper in his fluffy, twitching ear. <i>“Good dog.”</i>");
	output("\n\nHis longing gaze follows you as you " + !(pc.isAssExposed() ? "dress and ":"") + "walk away.");
	processTime(30);
	pc.orgasm();
	enemy.applyCumSoaked();
	output("\n\n");
	wargiiFightWinRouting();
}

//[Oral]
//Tooltip: Make the milodan give you some short but sweet oral service.
public function getOralFromInfilBoi():void
{
	clearOutput();
	showMiloInfiltrator(true);
	author("Wsan");
	output("You know exactly how you want to blow off some steam. " + (!pc.isCrotchExposed() ? "Taking off your [pc.crotchCovers], y":"Y") + "ou");
	if(pc.isHerm()) 
	{
		output(" plant your [pc.pussy] right on the milodan’s face, rubbing your [pc.clits] against his nose. Your [pc.cocks] stand" + (!pc.hasCocks() ? "s":"") + " upright, demanding attention as well.");
		output("\n\n<i>“Hands and mouth, boy,”</i> you tell him. <i>“And you’d better make me cum.”</i>");
		output("\n\nIf nothing else, he knows who’s in charge. You exhale through your nose in pleasure as his long, warm tongue slips from his mouth and slides between your lower lips, licking you from top to bottom before thrusting inside. At the same time, his hands meander up your [pc.thighs] and find your waiting erection" + (pc.hasCocks() ? "s":"") + ", stiff and already exuding precum. You let a smirk of satisfaction cross your face as he submits entirely, beginning to jack you off with both hands while he tonguefucks you.");
		output("\n\nTo your mild surprise, he isn’t completely without technique. He rubs, strokes and massages to draw your attention to the pleasure in your cock" + (pc.hasCocks() ? "s":"") + " before he recaptures it by sucking on your oversensitive clit" + (pc.totalClits() > 1 ? "s":"") + ", stealing your breath and making you rock atop him.");
		output("\n\nDoubled over and groaning in pleasure, you spot the milodan’s bright red doggycock, hard as a rock and dribbling precum. It looks like he could use relief. Your train of thought is abruptly derailed when the milodan’s tongue finds a particularly sensitive spot in your pussy, curling up and back around to lick your walls.");
		output("\n\n<i>“Oh. Oh, </i>god<i>,”</i> you mutter, your hips beginning to buck instinctively. <i>“Fuck, I’m gonna cummmm - nnnnnngh!”</i>");
		output("\n\nYou bite your lip and throw your head back, grunting in deep, animal pleasure as the milodan brings you to vaginal orgasm with his tongue. It feels like he’s everywhere at once, spearing you deeply with the warm muscle while he wraps it around your [pc.clits] and strokes. With the pleasure coursing through your body from your pussy, it’s not long until his rough, frantic strokes make you cum from your other set of genitals.");
		output("\n\n<i>“Oh! Ooohhhh, fuck!”</i> you groan, panting desperately while jizz begins to spurt from " + (pc.hasCocks() ? "both of ":"") + "your dick" + (pc.hasCocks() ? "s":"") + ", spattering the milodan’s furred stomach. <i>“Uuuugh!”</i>");
		output("\n\nHe’s <i>really</i> milking you, gripping you hard enough that it almost hurts. He squeezes down on your cock" + (pc.hasCocks() ? "s":"") + " so roughly that the flow of seed is momentarily halted behind his fingers, then runs his hand up your prick" + (pc.hasCocks() ? "s":"") + " while you shudder in uncontrollable pleasure. He forces rope after rope of hot, thick [pc.cum] from the tip" + (pc.hasCocks() ? "s":"") + " of your throbbing penis" + (pc.hasCocks() ? "es":"") + ", handling your ejaculations like a matter of course.");
		output("\n\nBy the time you’ve finished cumming, both of you are drenched. The milodan in your cum both male and female, and you in sweat. You’re panting, shaking, and still riding the high of pleasure from cumming with both sets of genitalia at the same time.");
	}
	else if(pc.hasCock())
	{
		output(" shuffle up his body until you’re kneeled above his face, leering down at him with a predatory grin. You rest your " + (pc.balls > 0 ? "[pc.balls]":"[pc.cock]") + " on his warm, soft lips and speak.");
		output("\n\n<i>“Lick.”</i>");
		output("\n\nTo his credit, the milodan recognizes immediately that it’s not a request. His tongue unfurls from his lips without hesitation, lapping at the " + (pc.balls > 1 ? "surface of your balls":"underside of your dick") + ", getting you ready. You relax and let him pay his dues, moving your hips when you want him to focus elsewhere. Eventually, he’s covered the entire surface area of your " + (pc.balls > 0 ? "[pc.balls] and ":"") + "cock" + (pc.hasCocks() ? "s":"") + " in his warm saliva.");
		output("\n\nYou grin. <i>“This is my favorite part.”</i>");
		output("\n\nLeaning over his open mouth, you thrust downwards into his throat with one stroke. ");
		if(pc.cockTotal() > 1)
		{
			output("His jaw strains and his cheeks bulge as you force ");
			if(pc.cockTotal() == 2) output("both");
			else if(pc.cockTotal() == 3) output("all three");
			else output("three");
			output(" of your cocks inside, rubbing against each other and the inside of his mouth");
		}
		else output("His jaw stretches wide as your dick enters him, his eyes watering slightly, but he still strokes you with his tongue");
		output(". You start fucking him immediately, his neck bulging outwards obscenely with your intruding cock" + (pc.hasCocks() ? "s":"") + ".");
		output("\n\n<i>“Ah fuck, that’s good,”</i> you sigh, rolling your hips against the milodan’s face, his nose pressing against your groin. <i>“You’re not a bad fuck, boy.”</i>");
		output("\n\nNot that he really has any choice in the decision. Wet impacts resound from between your legs as you fuck his face, his fur providing a nice cushion for your insistent thrusts. With his head against the ground he’s forced to just take it, unable to keep your cock" + (pc.hasCocks() ? "s":"") + " from sliding down his throat while he gags and chokes around them, his unpracticed body trying to force you out and failing. The end result is one of the wettest and messiest blowjobs you’ve ever had, but fuck if it isn’t great.");
		output("\n\n<i>“Nnngh- not long now, doggy,”</i> you pant, putting a hand on his head and starting to fuck him so hard the back of it begins bouncing against the ground, <i>“gonna give you a nice, nutritious treat!”</i>");
		output("\n\nTrue to your word, you groan in pleasure as you " + (pc.balls > 1 ? "go balls-deep":"hilt yourself") + " in his face, slipping as deep as you can get. [pc.cum] erupts from the end of your ");
		if(!pc.hasCocks())
		{
			output("cock, spurting ");
			if(pc.cocks[0].cLength() < 10) output("against the back of his throat and being washed down into his stomach by the followups");
			else output("down his throat and being rapidly joined by the followup ejaculations");
		}
		else if(pc.cockTotal() == 2) output("two cocks, both spurting in sync with each other, rapidly filling the milodan’s overwhelmed stomach with thick seed he’s forced to swallow down");
		else if(pc.cockTotal() >= 3) output("three cocks, two of them spurting in sync and the smallest following up strongly. The longer your orgasm goes on the more the milodan’s stomach is filled with thick seed, splattering against the back of his throat and being washed downwards by immediate subsequent loads");
		output(".");
		output("\n\n<i>“God fucking damn,”</i> you grunt, shuddering uncontrollably while you hold the milodan between your [pc.thighs], emptying yourself into him. <i>“</i>Fuck<i>, that’s good...”</i>");
		output("\n\nBy the time you’ve finished, the milodan");
		if(pc.cumQ() < 1000) output(" has almost passed out, sporting a dazed, vacant expression");
		else if(pc.cumQ() < 4000) output(" is sporting a small baby bump through his fur, evidence of his submission to you");
		else if(pc.cumQ() < 8000) output(" looks like he’s carrying a litter of your kids what with the way his stomach is swelling");
		else if(pc.cumQ() < 16000) output("’s stomach is so swollen he looks like he’s on the verge of delivering kits. Too bad he can’t, but you have to admit the sight of him positively gravid with your warm, sticky spunk is fucking sexy");
		else if(pc.cumQ() < 25000) output(" has a stomach fit to burst, so full of your hot spunk that his eyes are rolled back in vacant pleasure. His hands weakly rub his cumdump of a tummy, his submission readily evident");
		else output(" is so full of your cum he might as well be a condom, ballooning with the effort of containing your heady surplus of spunk. You’re pretty damn sure that it’s all he’ll be tasting for the next month or so");
		output(".");
	}
	//puss, no cock:
	else
	{
		output(" sit right on his face, smriking down at the wide-eyed milodan.");
		output("\n\n<i>“Start licking, boy.”</i>");
		output("\n\nThankfully, you don’t need to ‘persuade’ him - his tongue is out and lovingly caressing your [pc.clits] before you’ve even finished your sentence. You sigh in happiness, having found an opponent that just gets right to business. He’s not even half bad, either - in fact, what he’s doing feels pretty great. The way he licks between your lower lips, spears your [pc.pussy] with his tongue and then has it wrapped around your clit" + (pc.totalClits() > 1 ? "s":"") + " makes it feel like he’s everywhere at once.");
		output("\n\n<i>“Uh, fuck,”</i> you mutter in pleasure, shuddering atop him with your hands on his chest to steady yourself. <i>“Keep going, that’s a good boy...”</i>");
		output("\n\nOh, he <i>likes</i> being called that. You cry out in joy at the way his tongue curls back around, licking a sensitive spot not far from the entrance of your pussy, and feel yourself start to cum. Pleasure radiates outward from between your [pc.thighs], your moans not going unheard by the milodan, who slows his frenetic pace to accentuate rather than override the sensation. Panting, you ride his face and " + (pc.isSquirter() ? "squirt":"dribble") + " juices all down his chin, more than happy to let him stay down there and keep licking you.");
		output("\n\n<i>“Hooo god,”</i> you groan, raising your hips when the after-orgasm sensitivity becomes too much to bear. You look down at him and run your hands through his bedraggled hair. <i>“Still awake, boy?”</i>");
		output("\n\nHe nods, albeit weakly, and licks his lips.");
		output("\n\nYou grin. <i>“Again?”</i>");
		output("\n\nYou both already know the answer to that one. You instruct him to go <i>slowly</i> this time, letting him tease and caress, riding the slowly-mounting pleasure all the way. By the time he’s built you back up to cumming again, you’re about ready to have the most explosive orgasm of your life.");
		output("\n\n<i>“O-oh ffffu-u-uck,”</i> you groan in desperation, unable to stop yourself from humping his face as your pussy clenches. <i>“Cumming, I’m cumming, I’m cuuuunnnhhhh-!”</i>");
		output("\n\nThis time it’s you who nearly passes out from lack of air, breathlessly holding your mouth open in a silent scream of pleasure, your [pc.stomach] flexing while you cum all over the milodan’s face. When at last you manage to draw air, it’s a shaky, unsteady gasp that’s immediately expelled as a cry of ecstasy. When it’s over, you find yourself just sitting atop him and panting in the afterglow.");
	}
	//merge
	output("\n\n<i>“Fuuuck...”</i> you sigh at last, lifting yourself off his face and slowly getting to your feet. <i>“I needed that. Thanks for the ride.”</i>");
	output("\n\nYou " + (!pc.isCrotchExposed() ? "get yourself re-dressed and ":"") + "head out, walking away from the milodan looking after you as he passes out.\n\n");
	processTime(30);
	if(pc.hasCock()) enemy.loadInMouth(pc);
	if(pc.hasVagina()) enemy.girlCumInMouth(pc);
	pc.orgasm();
	wargiiFightWinRouting();
}

//[Docking]
//Requires massive equine dong.
//Tooltip: Force the milodan to pump his load into your dick.
public function dockingSeasonBiiiiyaaatch():void
{
	clearOutput();
	showMiloInfiltrator(true);
	author("Wsan");
	var x:int = pc.biggestCockIndex();
	output("<i>“Ooh, lucky you,”</i> you murmur, looking at how incredibly hard the athletic milodan boy is. <i>“That looks like it might just fit inside me...”</i>");
	output("\n\nKneeling above him" + (!pc.isCrotchExposed() ? " and undoing your [pc.crotchCovers]":"") + ", you let your [pc.cock " + x + "] flop right onto his furred washboard abs, the impact of your slab of meat sounding every bit like you slapped him across the face with it. You can tell he’s confused; you spoke of your own penetration, but now you’re pulling out your cock - he has no idea what to think. You can hardly help but grin down at him.");
	output("\n\n<i>“Ready for some sex ed, doggy?”</i>");
	output("\n\nIt requires a little bit of maneuvering to get your frustratingly stiff, pent-up " + (pc.cocks[x].cType == GLOBAL.TYPE_EQUINE ? "horse":"") + "cock in a position where his own iron-hard length can penetrate it, but at last you settle on just sitting on his face and facing his dick. It keeps things simple, plus his snout feels nice against your [pc.ass]. Leaning forward, you put one hand on his cock and another on your own and begin to align them, letting him catch and slip into your cumnozzle before you start moving your hips.");
	output("\n\nYou start slow. Half because you should, and half because you really, really want to tease this guy. You don’t want him to be anything less than desperately backed up, the need to cum grating on his sanity until he has no choice but to grab you and start pumping your cock full of his cum. Just the thought has your [pc.tongue] licking at your lips, already anticipating how much of a load he’s going to give you.");
	output("\n\nYou groan as his pointed tip slowly caves your " + (pc.cocks[x].cType == GLOBAL.TYPE_EQUINE ? "flare":"[pc.cockHeadBiggest]") + " inward, gradually being pushed inside your small, extremely sensitive cumslit. The first thing impressed upon you is how good it feels to have him inside you, but the next is how <i>hot</i> he is. You can feel every single inch of him such is his warmth, your mouth hanging slightly open as you get more and more of him inside. A much quieter, muffled whine of need comes from beneath you as the milodan weakly reaches downwards, but you stop him before he does anything.");
	output("\n\n<i>“You just stay there and be good,”</i> you murmur to him before beginning to push your [pc.hips] forward again.");
	output("\n\nFuck, he’s so <i>hard</i>. Closing your eyes and moaning as you approach his last few, precious inches, you stay completely aware of exactly how deep he is inside you. With a loud, shuddering gasp of pleasure, you finally get his entire dick down your cockhole, completely engulfing the smaller man’s prick, and fuck does it feel good. You open your eyes to the reality of having six or seven inches of milodan cock inside your own gigantic " + (pc.cocks[x].cType == GLOBAL.TYPE_EQUINE ? "equine ":"") + "member and you find yourself seized by the urge to start fucking him in earnest.");
	output("\n\nWith a long, drawn-out ‘sshlck’, you slide him back out, your fat dick feeling absurdly empty in his absence. Then you slowly let him back in, warming the inside of your engorged penis all over again. A full-body shiver passes through you as you sit atop the milodan’s face, just revelling in the feeling. It feels heavenly, and you want more.");
	output("\n\nGradually, the minutes going by as though time is standing still, you fuck his cock with your own until you’re moaning with the pleasure, completely taken in by how good it feels. You’ve been on the edge of cumming for a little while now, the milodan’s dick covered in a thin coat of slick pre-cum, your gaped-open cockhole drooling it freely over his length. Still, though, you have no intention of letting this end early - you’re going to fuck his little cock until he pops inside you.");
	output("\n\nThe thought of it spurs you onwards, lifting butt off his face in your excitement, your hips starting to work faster and faster. Precum squirts out around the milodan’s cock, both his and your own, as your breathing gets heavier and more labored. The milodan lifts his hands up to your " + (!pc.isTaur() ? "[pc.thighs]":"hindlegs") + " even as you securely grasp his waist. With your grips on each other, finally united in the cause of getting off, you can feel him getting closer by the second. The way his sweat-covered hands grope, trying to get a steady grip so he can buck his hips into you, tell you all you need to know.");
	output("\n\nYou settle into a steady rhythm, lewd, wet noises emanating from the connection of your cocks, both of you thrusting your hips and panting with need. You can see his balls beneath his cock, starting to swell up with warm seed, and lean down to encourage him.");
	output("\n\n<i>“Awww, you gonna cum?”</i> you whisper down to him, swaying your hips. <i>“Gonna pump out all that hot, sticky semen right down my shaft" + (pc.balls > 1 ? " and into my balls":"") + "? C’mon big boy, let me have it...”</i>");
	output("\n\nHis submissive, needy whine is like music to your ears. He <i>needs</i> to cum in your tight, enveloping cock, you can feel how much he wants it. Rolling off him and letting him slip free, you lie down as the adrenaline surges through his body, driving him to mount you, kneeling right above <i>your</i> face and grabbing your cock with both hands.");
	output("\n\nAll thoughts of fighting long-since forgotten, he urgently reinserts himself and groans in relief when he sinks himself balls-deep inside your pliant " + (pc.cocks[x].cType == GLOBAL.TYPE_EQUINE ? "equine ":"monster-") + "cock. His fingers wrapped tightly around your length to keep it in place, you get a front-row seat to his increasingly rapid and desperate thrusts, his balls growing more heavy and plump by the second until suddenly, his breath catches in his throat and his oversized balls begin to tighten.");
	output("\n\n<i>“Yes, yes, yes,”</i> you chant in an excited whisper, your breath hot against his sweaty balls, <i>“cum in me! Gimme that spunk, babe!”</i>");
	output("\n\nWith a loud, final groan to signify the last bastion of his resistance being worn down, he lets go. The base of his cock bulges momentarily with his load and then it’s inside you, being pumped through your cocknozzle. You can feel his hot, bubbling spunk shooting down your length, intermingling with your precum as it surges down your cumvein, forced ever downwards by the pressure of more and more thick jizz.");
	output("\n\n<i>“Oooohhhhh, god, yeah,”</i> you groan in self-indulgent joy, one hand on your giant, pulsing cock and another " + (pc.balls > 1 ? "cupping your slowly swelling balls. You can feel how <i>tight</i> they are":"lightly tracing your cumvein. You can feel it growing") + ", the sensation of being overtaxed by another’s sperm pooling inside irresistibly pleasurable. <i>“That’s right, keep cumming for me... Empty your balls, baby...”</i>");

	output("\n\nGod, <i>fuck</i>! You throw your head back into the ground and grit your teeth in pleasure. He might not be the biggest boy around but god damn if he doesn’t cum like one. Sweat breaks out on your forehead with the effort of letting him do as he pleases, his voluminous ejaculations seemingly growing larger instead of smaller as time goes on. You’re going to have to make a decision whether to cum all of this thick, piping-hot jizz back out... or to keep it inside you, like a good little cockslut.");
	processTime(25);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Cum",cumThatCumIntoThatKitty,x);
	addButton(1,"Keep",keepTheKittiesCummies);
}

public function cumThatCumIntoThatKitty(x:int):void
{
	clearOutput();
	showMiloInfiltrator(true);
	author("Wsan");
	output("\n\nYou’ve let him have his fun and now it’s time to remind him who won the fight. The milodan is so weak by now he can barely stay on his knees and you take advantage of that by lightly shoving him back on the ground, his cock coming free of your own. Your dick immediately begins to drool a thick rope of milodan seed, but you’ve got a lot more where that’s from. Standing over him, you begin to roughly jack yourself off, your legs starting to shake as one of the strongest orgasms you’ve ever had rocks your body.");
	output("\n\n<i>“Ohhhh, god,”</i> you grunt through grit teeth, almost doubling over as the sensation of utter relief begins to roll upwards from your groin, radiating through your lower half. <i>“Fuuhhhh- oh god, fuuuck! Nnnnn! Nnnnnngghhh! Guuuh!”</i>");
	output("\n\nYour massive, engorged cock pointing directly upwards, it’s reminiscent of a fountain as you finally cum, spunk spurting from your gaped cockhole in gigantic ropes. You absolutely drench the milodan in your [pc.cum], plastering his fur with enormous, dense dollops of mixed seed as he lies below you. It doesn’t stop, either, more and more coming out of your cock until it feels like you have a hose attached to your groin, your masturbation growing rougher and rougher until you’re on your knees before the milodan feverishly jerking yourself with two hands.");
	output("\n\nWith your head down and your eyes squeezed shut in the pleasure of release, you only reopen them a couple of minutes later, panting, sweaty, and utterly spent. Your surroundings are completely coated in [pc.cumColor] spunk, and the milodan... well, it’s going to take him a very, very long time to wash this out of his fur. You can see he’s finally stopped cumming, at least, and you take the time to position yourself right above him and squeeze out the last bit of cum from your urethra right onto his forehead. His eyes flutter closed not long afterwards, his purpose served as unconsciousness welcomes him into its embrace.");
	output("\n\nYour prey sufficiently used and marked, you feel incredibly satisfied in the wake of employing him as a masturbation toy. Maybe you should do this more often." + (!pc.isCrotchExposed() ? " Your [pc.cock " + x + "] slipping back into your clothes, y":" Y") + "ou turn away from the gigantic puddle of spunk and head onwards.");
	processTime(30);
	pc.orgasm();
	output("\n\n");
	wargiiFightWinRouting();
}

//[Keep]
public function keepTheKittiesCummies():void
{
	clearOutput();
	showMiloInfiltrator(true);
	author("Wsan");
	output("No... it’s either admiration for this milodan having the strength and stamina to fill you up after being beaten so soundly, or just your own slutty desires, but either way you want his dense, virile essence inside you. A slutty grin spreads across your lips as you lie there, completely acquiescent to his desire, letting him fuck your oversized behemoth of a dick like it’s nothing more than a toy for him to masturbate into. Stretching out in a comfortable position beneath him while his hips continue to piston into you, you guess maybe it really is. He might not even be conscious enough to know the difference.");
	output("\n\n<i>“Ohooooh, fuuuuck,”</i> you moan in pleasure beneath your partner" + (pc.hasToes() ? ", your toes curling":"") + " while you desperately fight the urge to cum. You <i>have</i> to resist it, you <i>need</i> to keep all of him inside you. <i>“K-keep going, baby! Pump me full of that hot fucking spunk,”</i> you gasp, staring up at his pulsing balls as if imploring them to never stop. <i>“Oh fuck, you’re so </i>good<i>!”</i>");
	output("\n\nWith a strained, desperate high-pitched moan, the milodan collapses on top of you, his strength gone but his virility still very much present. His hips might be stationary, but the process of pumping you full of his jizz hasn’t stopped or slowed at all.");
	output("\n\n<i>“Oooohhhh, fuck, thank you,”</i> you gasp breathlessly, clawing the ground and trying your utmost not to cum. <i>“Nnnn... nnnnngh!”</i>");
	output("\n\nWhen the rich flow has slowed to a small trickle you finally withdraw, pulling your swollen cock off the milodan’s. You angle your well-fucked prick upwards as he slips free, ensuring none of the man’s seed escapes, and you can feel it slowly travelling down your shaft. It’s a heady rush to know you were used so ruthlessly, and a feeling of intense gratefulness towards this beastman for bestowing his cum unto you wells up inside your chest. Your keen eyes spot that despite jizzing what feels like a gallon of well-kept seed, the milodan’s cock is still very hard, pointing straight up.");
	output("\n\nWell, no-one’s watching... you <i>really</i> want to pay this stud back for what he’s done for you. Hurriedly sinking to your knees, you immediately place your whole mouth over his exposed cock and begin needily sucking him off, muffled groans and orgasmic slurps the only noises coming from your mouth for the next several minutes.");
	output("\n\nBy the time you’re done he’s cum another three times, albeit with less strength than when he fucked your dick. Licking your lips, you lift yourself off his gradually softening length and see he’s smiling in his sleep. Finally satisfied with the worship you’ve paid him, you stand and make to leave,");
	if(pc.balls > 0) output(" your swollen, overripe ball" + (pc.balls > 1 ? "s":""));
	output(" absolutely crammed full of foreign seed.");
	//Blue balls debuff for keeping the milodan’s cum
	processTime(30);
	pc.applyBlueBalls();
	pc.changeLust(5);
	output("\n\n");
	wargiiFightWinRouting();
}