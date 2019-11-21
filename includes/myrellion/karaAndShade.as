import classes.Creature;
import classes.Engine.Combat.DamageTypes.TypeCollection;

/*FLAGS
SHADE_PAID_YOU
	1 = collected your 20k
KARA_PAID_YOU
	1 = collected your pay
TAKEN_SHADES_HARDLIGHT
	1 = caught a hardlight
SHADE_DEFEATED_WITH_KARA
KARA_DEFEATED_WITH_SHADE
LOST_TO_SHADE_WITH_KARA
SEXED_SHADE
	1 - had intercourse with shade
SHADES_CUNTTAIL_FED
	1 = fed dat little shit
LET_SHADE_AND_KARA_DUKE_IT_OUT
	1 - Queued up
BETRAYED_KARA
	1 - Told on Kara to Shade
	2 - Beat up Kara with Shade
DISTRACTED_SHADE
	1 - The PC flirted with Shade, distracting her for Kara to get away
TRIPPED_ON_SHADE
	1 - PC tried the ol' trip & fall. It didn't work.
SHADE_AND_KARA_RESOLVED_THINGS_THEMSELVES
	1 - PC let the cats handle their own stuff.
LAST_MINUTE_KARASHADE_HELPED
	"Shade" or "Kara" depending on who you helped all last minute like.
*/

/*Character Background & Design

In a nutshell: Kara's a futa kaithrit who escaped slavery to become a smuggler.

Kara's a natural hermaphrodite kaithrit from a backwater colony world, Tarilia, that suffers from an even worse case of male deficiency than most kaithrit worlds. Because of this, males are jealously guarded breeding stock on her planet, and while lavishly and tenderly cared for, are little more than slaves in terms of rights and freedoms. As one of the very rare hermaphrodites born, Kara was sentenced to live as a male in her tribe, to be used as breeding stock and little else. 

Eventually, Kara caught the eye of a space-borne vagabond by the name of Rourke "Blackstar" Volke. He helped her to escape the planet, and took her onto his crew. Rourke taught her the art of piloting, gunslinging, swordsmanship, and eventually, the art of thievery and smuggling. Kara remained on his crew for two years, falling somewhere between a daughter and a wife to her captain. Happiness doesn't last, though, as she soon found out: Rourke was betrayed by a contact of his and imprisoned by the U.G.C., along with most of his crew. Kara managed to grab the ship and get away. 

Vital Statistics:
>Height: 6'1. Herm Kaithrit are bigger and stronger than normal females, who overbear on males on the species. 
>Cup Size: Big EE
>Cock Size: 10 inch feline cock. Fairly hefty trap pouch underslung between it and her cunt.
>Hair: Cobalt blue, worn short and windswept.
>Tattoos: Several. Rosevines on her shoulders and most of her back, and into a half-sleeve of the left arm. Has a set of broken chain tats on her ankles and wrists.
>Piercings: Bar nipple piercings. Several studs in the ears (much like Saen has). A clit ring. 
>Has JoyCo cybernetic eyes (bright green, feline). Her real eyes were shot out by the pirate lord Mirian Bragga. They look slightly... off, and on close inspection have cybernetic patterns running through the irises. 

Ship & Crew:
>Ship: The Silence. Medium-haul freighter, refitted for armed smuggling. Stealthy, fast, heavily shielded but lightly armored. Carries four light laser batteries and a multi-purpose launch system (probes and torpedoes).
>Crew: Pyra, raskvel engineer. Tarik, male naleen bruiser. Logan, ace pilot and Throbb/gene mod addict. 
>A.I.: Connie, a "repurposed" Nova Securities fleet V.I. from the corvette Constellation. Relatively simple, but quite competent. Has been loaded into an expensive pleasure bot frame, and Kara's been mucking around with her programming for... other purposes. 


Kara's Outfit:
>Leather knee-boots
>Leather tassets, armor like
>Lacey half-skirt over her left leg.
>Boyshorts & Sports Bra
>Skintight top with inlaid tech shit to monitor status, works with her Stealth Field Generator. Added bonus, seriously accentuates DEM TITTIES. Has elbow and knee-pads, a wristband computer, and a shoulder-holster rig. Basically, think Leon in RE4.
>Leather collar w/ tiny little cat bell.
>Has lockpicks, a knife, and spare ammo slung on the back of her belt. 

Armament:
>Dagger (back of belt)
>Force blade (purple hardlight blade, hilt worn on the hip). 
>Plasma Bolt-thrower pistol (shoulder holster, batteries on back of belt)
>Compact, bullpup DMR (Suppressed. Loaded with tranq or lust rounds, not usually carried) 


Quest Outline & Design, Part 1

PC first meets Kara by, literally, bumping into her at a bar. Specifically, she approaches the PC for help upon entrance: there's a bounty hunter in the bar looking for her, and she cons the PC into distracting the huntress long enough for Kara to slip away, ending with Kara pulling the PC into a big kiss to disguise the both of you as the bounty hunter leaves. 

Meet Kara
Dialogue tree with female kaithrit bounty hunter (attempt to distract). Possible fail state: bar shootout; alternate: tell huntress about Kara for a share of the reward.
Kara rewards PC with credits, bugs out of the bar.


Adventure 1: A Damsel in Distress, you say?
*/

public function showKara(asNude:Boolean = false):void
{
	author("Savin");
	showName("\nKARA");
	showBust(karaBustDisplay(asNude));
}
public function karaBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "KARA";
	if(nude) sBust += "_NUDE";
	return sBust;
}
public function showShade(asNude:Boolean = false):void
{
	author("Savin");
	showName("\nSHADE");
	showBust(shadeBustDisplay(asNude));
}

//Play on entering the bar. Possibly first time entering the bar. 
public function karaFirstTimeBarStuff():void
{
	clearOutput();
	showCandice();
	flags["BEEN_TO_MYRELLION_BAR"] = 1;
	output("You make your way into the big, smoky lounge labeled “Tavern,” pushing through bat-wing doors into a crowded room full in equal measures of myr and off-worlders. What might have once been a military barracks has been cleared out by the pioneers who’ve taken over this airfield, turning it into a surprisingly cozy tavern. A long wooden bar and stools have been set up along one wall, and several makeshift tables are scattered throughout the wide room.");
	output("\n\nYou saunter over to the bar and take a seat, heaving a sigh as you take a load off. Going through interstellar customs is trying at the best of times; customs on a planet on the brink of self-destruction is near maddening. You rub your temples and signal to the bartender, a perky half-ausar girl in a short-cropped halter top that shows off a delightful amount of taut belly.");
	output("\n\n<i>“Hey, " + pc.mf("handsome","cutie") + ",”</i> she says with a wink, flicking a rag over her shoulder. <i>“What can I get you?”</i>\n\nYou look over the menu and order something light to start.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",firstTimeBuyADrinkForKaraShits);
}

//[{Drink}]
//Don’t charge PC for it.
//Individual tooltips for drinks go here.
public function firstTimeBuyADrinkForKaraShits():void
{
	clearOutput();
	showCandice();
	output("<i>“Sure thing!”</i> the bartender says, skipping off to fetch your drink.");
	output("\n\nShe returns a moment later with your order. You reach for your creditstick, but she stops you before you can get it out. <i>“With compliments from the girl at the end of the bar,”</i> she says, nodding to your left. You lean back, looking around the handful of bodies between you and your benefactor.");
	output("\n\nAt the far end of the bar, you catch a glimpse of a kaithrit female with a windswept head of cobalt-blue hair, dressed in a skin-tight gray top that accentuates a pair of big EE-cups on her chest. She flashes you an inviting smile and a come-hither wink.");
	processTime(1);
	clearMenu();
	//if Silly OR Bimbo: 
	if(silly || pc.isBimbo()) addButton(0,"Go Over",goOverToKaraSloot,undefined,"Go Over","Hey, a cute kitty! Go over and introduce yourself. She certainly seems interested.");
	else addButton(0,"Go Over",goOverToKaraSloot,undefined,"Go Over","Go over and introduce yourself. She certainly seems interested.");
	addButton(1,"Ignore Her",ignoreDisBitch,undefined,"Ignore Her","Ignore the cat-girl and enjoy your free drink. ");
}

//[Ignore Her]
//Back to bar main menu.
//Ignore the cat-girl and enjoy your free drink. 
public function ignoreDisBitch():void
{
	clearOutput();
	showCandice();
	author("Savin");
	output("Fuck that. Knowing your luck, she probably just wants something from you. You resume your seat and knock back your drink, enjoying the view of the bartender working in her jean-shorts and blatantly nonexistent bra in front of you. By the time you finish your drink and stand up, the bothersome kitten is long gone.");
	flags["LET_SHADE_AND_KARA_DUKE_IT_OUT"] = 1;
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Go Over]
public function goOverToKaraSloot():void
{
	clearOutput();
	showKara();
	flags["MET_KARA"] = 1;
	output("You pick up your drink and meander over to the generous cat-girl, ");
	if(!pc.isTaur() && !pc.isNaga()) output("planting yourself in the open seat beside her.");
	else
	{
		if(!pc.isNaga()) output("sitting");
		else output("coiling");
		output(" your bestial lower body down beside her.");
	}
	output("\n\n<i>“Hey there, " + pc.mf("handsome","cutie") + ",”</i> she says, swivelling in her seat to face you, a hand extended. <i>“The name’s Kara.”</i>");

	output("\n\n<i>“Steele. [pc.name] Steele,”</i> you answer, shaking her hand. <i>“Thanks for the drink.”</i>");

	output("\n\nShe watches you with big, green feline eyes as you knock back your drink, never taking them off of you. ");
	if(pc.characterClass != GLOBAL.CLASS_ENGINEER) output("Something seems... off, about them. But in the dim, smoky light, you can’t quite place it. ");
	else output("After a few moments of that treatment, you quickly realize something’s just slightly... off about her eyes. You steal a closer glance when you can, catching glimpses of what looks like circuitry well hidden in her slitted irises. Her eyes are cybernetic, and top-quality too.");

	output("\n\nAfter a long moment, her flirtatious smile slips away. <i>“Consider the drink a down payment,”</i> she says, reaching into her pocket and flashing you a credit chit marked with C1,000. <i>“You look like a [pc.man] who can handle [pc.him]self, and I need a pretty big hand. Think you could spare a few minutes to help a girl out?”</i>");
	output("\n\n<i>“What do you need?”</i> you ask, looking the cat-girl over warily. Is this some sort of scam, or a trap?");
	if(silly) output(" Dad always said to be wary of people offering you cash in bars.");

	output("\n\nShe gives a subtle little nod over your shoulder. <i>“Don’t look. There’s a kaithrit girl over there, same kind of figure as me, but with silver hair and a tacky duster. I need you to distract her for me. Just keep her attention for a couple of minutes, and this is yours,”</i> she says, flicking the credit chit between her fingers.");

	processTime(3);
	//[Okay] [Not Interested] [Why?]
	addButton(0,"Okay",helpDisKaraSlut,undefined,"Okay","Help Kara.");
	addButton(1,"NotInterested",notInterestedSavinYourOCsCreepMeOut,undefined,"Not Interested","Refuse her request.");
	addButton(2,"Why?",whyShouldIHelpDisFukkinSavinWithHisQuest,undefined,"Why?","Why does she need you to distract somebody? What’re you getting yourself into here?");
}

//[Why?]
//Why does she need you to distract somebody? What’re you getting yourself into here?
public function whyShouldIHelpDisFukkinSavinWithHisQuest():void
{
	clearOutput();
	showKara();
	output("<i>“Why?”</i> you ask, giving the cat-girl an incredulous look.");
	if(pc.isNice() || pc.isAss()) output(" <i>“You in some kind of trouble?”</i>");

	output("\n\nKara leans back against the bar with a glint in her eye that’s hard to read: <i>“I owe her money. A lot more than this grand. Can’t pay her back yet, and she’s going to kick my ass if she catches me. It’ll be awfully hard to get that money together with a couple of broken kneecaps. Understand?”</i>");
	output("\n\nSomehow, you’re not convinced the kaithrit’s telling you the truth.");
	processTime(1);
	//Same menu minus why?
	clearMenu();
	addButton(0,"Okay",helpDisKaraSlut,undefined,"Okay","Help Kara.");
	addButton(1,"NotInterested",notInterestedSavinYourOCsCreepMeOut,undefined,"Not Interested","Refuse her request.");
	addDisabledButton(2,"Why?","Why?","Are you serious? I just explained that to you.");
}

//[Not Interested]
//Refuse her request.
public function notInterestedSavinYourOCsCreepMeOut():void
{
	clearOutput();
	showKara();
	output("<i>“Thanks for the drink,”</i> you say, finishing her gift off and standing up.");
	output("\n\nHer feline ears twitch, the cool confidence rushing out of her as you get ready to go. Before you can leave, she reaches up and grabs your arm, an imploring look in her ");
	if(pc.characterClass != GLOBAL.CLASS_ENGINEER) output("strange");
	else output("cybernetic");
	output(" eyes. <i>“Come on. Please. I don’t want to get into a fight here, but that bitch isn’t going to let me get out of here without one. You’re " + pc.mf("the toughest looking son of a bitch here","the most bad-ass looking babe here") + ". Somebody who can handle themselves. And I need help.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Alright",helpDisKaraSlut,true,"Alright","Accede to her request. The girl’s obviously in trouble.");
	addButton(1,"Still No",stillSayNoToKaraYouGiganticFuckingAsshole,undefined,"Still No","Leave.");
}

//[Still No]
//Leave
public function stillSayNoToKaraYouGiganticFuckingAsshole():void
{
	clearOutput();
	clearBust();
	showName("\nLEAVE");
	output("You shake your head and step away from the cat-girl, leaving her to her fate.");
	flags["LET_SHADE_AND_KARA_DUKE_IT_OUT"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Okay]
//Help Kara
public function helpDisKaraSlut(finishedDrink:Boolean = false):void
{
	clearOutput();
	showKara();
	showBust("KARA","SHADE");
	showName("KARA &\nMYSTERY GIRL");
	output("<i>“Fine,”</i> you say, ");
	if(!finishedDrink) output("knocking back the last of your drink");
	else output("setting your empty drink aside");
	output(". <i>“I’ll help you.”</i>");
	output("\n\nKara flashes you a smile. <i>“You’re a lifesaver, [pc.name]. Just keep her eyes on you for a minute. I’ll meet you outside, okay?”</i>");
	output("\n\nYou nod and stand, bracing yourself for the task at hand. Looking around the bar, it isn’t hard to find the only other kaithrit in the joint. She’s sitting in the far corner, her back to the wall and boots up on the table, eyes scanning the smoky room. The angle is just right so that Kara’s been sitting in the only place your mark couldn’t see, shielded by the throng of people at the bar. You walk over toward her, going over your play again and again in your mind, trying to decide exactly <i>how</i> you’re going to keep a total stranger distracted.");
	output("\n\nYou take her in as you approach: at a glance, she’s your standard kaithrit cat-girl, with silver hair playing wildly around her shoulders, parted by a pair of cute feline ears atop her head. She’s a bit older than most folk you meet on the frontier, maybe in her late thirties, and holds herself with a grim determination that exudes experience. A long duster flows down from around her shoulders, intricately patterned with faintly luminescent blue wires and lightning bolt patterns. The way she’s sitting, you can’t help but notice a heavy looking pistol slung on her hip.");
	output("\n\nShe gives you a small but friendly nod as you approach. A single serpentine tail slithers up from behind her, covered in green scales rather than the usual kaithrit fur and ending in a wet-looking opening.");
	if(pc.hasCuntTail()) output(" Your cunt-tail twitches at the sight of it, as if it can sense a kindred spirit.");
	//if Codex: Cunt snake unlocked:
	if(CodexManager.entryUnlocked("Cunt Snakes")) output(" You can easily recognize an attached cunt snake when you see it.");
	output("\n\nWhat do you do? ");

	processTime(3);
	//[Trip and Fall] [Flirt] [Tell About Kara] [Back Off]
	clearMenu();
	addButton(0,"Trip & Fall",tripAndFallOnShade,undefined,"Trip & Fall","Trip and make a mess right in front of the huntress; try and distract her with some good old-fashioned stoogery.");
	addButton(1,"Flirt",flirtWithShade,undefined,"Flirt","Flirt with the cat-girl hunter. Who knows, you might get laid AND paid!");
	addButton(2,"Tell",tellAboutKara,undefined,"Tell","Betray Kara and tell the mystery cat-girl where she’s at.");
	addButton(3,"Back Off",backOfAndScrewOverKaraYouAsshat,undefined,"Back Off","Forget it. Kara’s in trouble, but that’s her problem.");
}

//[Back Off]
//Back to bar menu
//Forget it. Kara’s in trouble, but that’s her problem.
public function backOfAndScrewOverKaraYouAsshat():void
{
	clearOutput();
	author("Savin");
	showName("BACK\nOFF...");
	showBust("SHADE");
	output("As smoothly as you can, you change course away from the armed kaithrit and back toward the bar - well away from where Kara was sitting. Nobody said anything about guns. Kara’s on her own.");
	processTime(1);
	flags["LET_SHADE_AND_KARA_DUKE_IT_OUT"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Tell About Kara]
//Betray Kara and tell the mystery cat-girl where she’s at.
public function tellAboutKara():void
{
	clearOutput();
	showShade();
	output("<i>“A little birdy told me you’re looking for Kara,”</i> you say by way of introduction. ");
	output("\n\nThe kaithrit’s ears and tail perk up instantly. <i>“Maybe I am. You know where I can find her?”</i>");
	output("\n\nYou nod and subtly indicate the half-hidden seat where Kara’s skulking, getting ready to make a break for it. Her hunter looks from you to the bar, a slight smile playing across her full lips. <i>“Nice. Saves me some work, friend. Name’s Shade, by the way. Who do I have to thank for the tip?”</i>");
	output("\n\n<i>“Steele. [pc.name] Steele,”</i> you answer, offering a hand which she shakes vigorously.");
	output("\n\n<i>“Steele, huh?”</i> she says, a flicker of mirth playing across her face as she speaks, as if savoring the word. <i>“Well, you look like someone who can handle themselves, and the kitten over there’s going to be a bitch to wrangle. I’ll cut you in for a share of the bounty if you’ll get my back here.”</i>");
	output("\n\n<i>“Bounty?”</i>");
	output("\n\nShe grins. <i>“Why do you think I’m after her? Black Void’s put a bounty on her head so high, every two-bit chump with a gun’s after her. Must have pissed somebody off pretty bad. Now, I’m pretty decent at slinging a gun, but Kara Volke’s put six hunters in the ground already. Wouldn’t mind sharing some of the reward to double my chances, capiche? So what do you say?”</i>");
	flags["BETRAYED_KARA"] = 1;
	pc.addHard(5);
	processTime(2);
	clearMenu();
	addButton(0,"Deal",itsADealToBetrayKaraSloots,undefined,"It’s a Deal","Take Shade up on her offer and go after Kara.");
	addButton(1,"No Thanks",turnDownAChanceToCaptureKara,undefined,"No Thanks","Refuse the bounty hunter’s offer. You’re out of here.");
}

//[No Thanks]
//Refuse the bounty hunter’s offer. You’re out of here. 
public function turnDownAChanceToCaptureKara():void
{
	clearOutput();
	showShade();
	output("You shake your head. <i>“Good luck with that.”</i>");
	output("\n\nShade kicks back the whiskey shot in front of her, draws a deep breath, and nods. <i>“Better clear out, kid. Could get hairy here in a minute.”</i>");
	output("\n\nCouldn’t have said it better. You step away.");
	processTime(1);
	flags["LET_SHADE_AND_KARA_DUKE_IT_OUT"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//[It’s a Deal]
//Take Shade up on her offer and go after Kara.
public function itsADealToBetrayKaraSloots():void
{
	clearOutput();
	showBust("KARA","SHADE_COMBAT");
	author("Savin");
	showName("SHADE\n& KARA");
	pc.addHard(10);
	output("<i>“Deal,”</i> you say, planting a hand on your [pc.rangedWeapon]. <i>“Let’s get her.”</i>");
	output("\n\nShade grins, standing up and rolling her shoulders. She draws a gun from her belt, a sleek hand cannon emblazoned with lightning bolts. <i>“Right on.”</i>");
	output("\n\nYou fall in behind her, brushing through the crowd in the bar back toward Kara’s seat. Just before you get there, you feel something hot and heavy press against the back of your head. Your heart skips a beat, and you freeze in place. Uh-oh.");
	output("\n\n<i>“" + pc.mf("Bastard","Bitch") + ",”</i> Kara hisses. You hear an energy weapon charging in your ear, ready to fire on a hair trigger’s pull.");
	output("\n\nInstead of a gunshot, your ears explode with the sound of flesh crashing into flesh, a body crumpling to the ground. You duck and draw down, just in time to see Kara tumbling back across the deck, wiping blood from the corner of her mouth. Shade’s beside you, gun leveled at Kara. The huntress gives you a slight nod, distracting her just long enough for Kara to leap to her feet. ");
	output("\n\n<i>“Come on then, you pirate bitch. Come and get me!”</i> she shouts, finger coming down on the trigger.");
	processTime(2);
	flags["BETRAYED_KARA"] = 2;
	//[Fight!]
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors([pc, shade]);
	CombatManager.setHostileActors(kara);
	CombatManager.victoryScene(pcAndShadeBeatKara);
	CombatManager.lossScene(pcAndShadeDefeated);
	CombatManager.displayLocation("KARA");
	
	shade.updateDesc();
	kara.updateDesc();
	
	addButton(0,"Next", CombatManager.beginCombat);
	kara.HP(-15);
}

//[Flirt]
//Flirt with the cat-girl hunter. Who knows, you might get laid AND paid!
public function flirtWithShade():void
{
	clearOutput();
	showShade();
	pc.addMischievous(5);
	output("<i>“Hey, there,”</i> you say, sliding into the booth across from the cat-girl, casually putting your body directly between her seat and Kara’s. <i>“Can I buy you a drink?”</i>");
	output("\n\nThe cat-girl flicks her gaze around the room, sighs, and waves over a gold-plated myr waitress. <i>“Sure. I wouldn’t mind the distraction, to be honest. Rough day.”</i>");
	output("\n\nPerfect. You order a couple of stiff drinks and ask her what’s making her day so rough.");
	output("\n\nShe chuckles, rubbing the back of her neck. <i>“Oh, I’ve been tracking a quarry for the last couple of weeks. I’m a bounty hunter, right? Person I’m tracking came here to Myrellion, but it looks like I’ve lost track of her. Thought I saw her come into the bar here, hell of a lucky break, but I must have been seeing things. No sign of her anywhere.”</i>");
	output("\n\n<i>“A bounty hunter?”</i> you say, starting to lay on the Steele charm. You carry it on as your drinks arrive, flirtatiously telling her how dangerous a profession that is - and how dangerous <i>she</i> must be. Sure enough, that does the trick, getting the huntress to open up to you, and give you her undivided attention. She’s more than happy to show off some of her tools and tricks: a lightning-shooting stun pistol, tranq dart launchers, net guns, and more. You can see why Kara wanted to avoid fighting her.");
	output("\n\nA few minutes pass in surprisingly pleasant conversation, during which you can only assume Kara’s managed to slip away through the crowd. You start looking for a place to break off with the bounty hunter, but the conversation takes an unexpected turn:");
	output("\n\n<i>“You know, I haven’t even gotten your name,”</i> she laughs, reclining in her seat. Her arms slip around the back of her chair, which serves to thrust her big E-cups forward, straining the front of her T-shirt. <i>“I’m Shade. Shade Irons.”</i>");
	output("\n\n<i>“Steele,”</i> you answer. <i>“[pc.name] Steele.”</i>");
	output("\n\nShe smiles at that, a twinkle in her eyes. <i>“Steele, huh? Look, I don’t want to come off the wrong way here, but look: I’m a little drunk, I’m pretty sure I’ve lost the bitch I’ve been tracking, and you’ve been fun to talk to. My ship’s parked on the tarmac outside, and I could use some cheering up. What do you say we get out of here?”</i>");
	output("\n\nThat was unexpected. Maybe you laid on the charm a little harder than you’d expected. Either way, looks like Shade here’s looking for a little fun.");
	flags["DISTRACTED_SHADE"] = 1;
	pc.lust(3);
	processTime(16);
	//[Sure] [Sorry, No]
	clearMenu();
	addButton(0,"Sure",sureIWantSomeShadePussayTailFuckYes);
	addButton(1,"Sorry, No",sorryNoIDontWantToGetLaidShade);
}

//[Sorry, No]
public function sorryNoIDontWantToGetLaidShade():void
{
	clearOutput();
	showShade();
	output("You shake your head, telling the huntress you’re not looking for a one night stand with her. ");
	output("\n\nShe shrugs, sighing. <i>“Fair enough, I guess. Thanks for the drink. Why don’t you leave me to it, huh?”</i>");
	output("\n\nYou stand and leave. A quick glance shows that Kara’s long gone. Mission accomplished.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Sure]
public function sureIWantSomeShadePussayTailFuckYes():void
{
	clearOutput();
	showShade(true);
	output("<i>“Sounds good,”</i> you say, grinning. <i>“Lead the way.”</i>");
	output("\n\nShe laughs. <i>“I always do.”</i>");
	output("\n\nYou follow Shade out of the bar and back through the airfield, north towards one of the bigger hangars. She leads you over to a big, sleek MSXI with a pair of massive engines looming over the hull. The gangplank lowers automatically as you approach, and Shade flashes you a smile. Her long, reptilian tail flicks up, the wet tip caressing your arm as you follow her up. Its wandering crown slides down slowly, tickling your [pc.belly] before delving down to your [pc.crotch], ");
	if(pc.isCrotchExposed()) output("openly teasing your bare loins with its pussy-like lips");
	else output("teasing you through your clothes");
	output(".");

	output("\n\nHer tail’s motions are ceaseless, completely independent of its owner’s confident stride forward. The scaled length of cunt-tail coils around your waist and [pc.leg], playful and alluring, actually managing to pull some of your gear away. Its dexterity is incredible");
	if(pc.hasCuntTail()) output(" - something your own tail-pussy could learn from -");
	output(" as it starts to peel away your [pc.gear]");
	if(!pc.isNude()) output(", working to strip you bare");
	output(" while you walk.");

	output("\n\nIt’s a short trip to Shade’s bunk, but you’re buck naked by the time you reach it. The kaithrit huntress gives you a lascivious wink over her shoulder as she pops the door open and guides you through. Her quarters are cluttered, a random assortment of clothes, gun parts, and chunks of armor scattered across the floor beneath punk rock posters and kaithrit grav-balls. In one fluid motion, she faces you, slips her arms out of her jacket sleeves, and pulls her shirt off over her head, giving you an eyeful of big, E-cup tits barely restrained by a black sports bra. Shade takes a single step towards you, pressing herself tight against you, letting you feel those lush mounds compress against your [pc.chest]... before she gives you a rough shove onto the bed, sending you tumbling onto your back. Her pants hit the deck with an audible <i>thump</i> of a gunbelt clattering on steel before she hops in after you, straddling your [pc.hips] and slipping a hand under her bra to cup her breast, slipping the garment off to reveal the sun-kissed mounds beneath it.");
	output("\n\n<i>“Now then... what to do with you...?”</i>");
	pc.lust(30);
	processTime(15);
	moveTo("602");
	//Shade’s Scenes go Here
	shadeSexMenu(true);
}

public function shadeSexMenu(intro:Boolean = false):void
{
	clearMenu();
	//Shade starts straddling the PC. Still wearing her undies, no bra or clothes.
	//[Cunt Tail Fuck]
	//Shade queens the PC, uses her tailcunt on [pc.cock " + x + "].
	if (pc.hasCock()) addButton(0, "Cunt Tail", cuntTailShadeFux, undefined, "Cunt Tail", "Let her use her cunt tail on you. It probably feels pretty good.");
	else addDisabledButton(0, "Cunt Tail", "Cunt Tail", "Let her use her cunt tail on you. (Requires a cock.)");
	
	//[Take Hardlight]
	//vagOrAss. PC gives tailcunt oral. 
	addButton(1,"CatchHardlight",takeShadesHardlightPenisInYerBoot,undefined,"CatchHardlight","Take it from a hardlight strapon.");
	
	//[Rim & Wank] (if PC has no cunt; else) [Lick & Wank]
	//PC must have taken Shade’s hardlight strapon at least once. Must be effeminate enough to use female pronouns and possess a cock. Is a [vagOrAss] scene.
	if (pc.hasCock() && pc.mf("he","she", true) == "she" && flags["TAKEN_SHADES_HARDLIGHT"] != undefined)
	{
		if (pc.hasVagina()) addButton(2,"Lick & Wank",rimAndWankOrLickAndWankWhoKnowsSloot,undefined,"Lick & Wank","Get licked and wanked.");
		else addButton(2,"Rim & Wank",rimAndWankOrLickAndWankWhoKnowsSloot,undefined,"Rim & Wank","Get rimmed and wanked off.");
	}
	else if (flags["TAKEN_SHADES_HARDLIGHT"] == undefined) addDisabledButton(2,"Wank?","Wank?","You have to have taken Shade’s hardlight strapon to qualify for this scene, as well as be a girly femmy-type guy.");
	else addDisabledButton(2,"Wank?","Wank?","You aren’t enough of a girlyboy to get wanked off like some kind of femboy.");
	
	//Shade Tailcock v. Tailcunt Scene
	//Because it’s only been requested literally 50 billion times. Just another add to her normal sex menu.
	if (pc.hasTailCock() && pc.tailCount > 0) addButton(3,"Tailsex",shadeTailSex,undefined,"Tailsex","You’ve got a tail-cock, Shade’s got a tail-cunt... it seems like a match made in heaven, so why not let your tail-genitalia have some fun together?");
	else addDisabledButton(3,"TailSex","TailSex","You would need some kind of tail-mounted penis to try this...");
	
	//PC + Shade Double Titfuck. Add to Shade's sex menu. PC must have a dick of at least 18 inches, and breasts of at least D-cup.
	if (pc.hasCock() && pc.biggestCockLength() >= 20 && pc.biggestTitSize() > 4) addButton(4, "DoubleTitfuck", shadeDoubleTitfuck, undefined, "DoubleTitfuck","You and Shade are both pretty stacked, and your cock’s already so hard against your belly... maybe the two of you could put your tits to use to give you some relief.");
	else addDisabledButton(4,"DoubleTitfuck","DoubleTitfuck","You’d need big tits and a bigger cock to coax Shade into a double titfucking!");
	
	if (!intro && pc.hasGenitals()) addButton(5, "Boobship", shadeBoobWorship, undefined, "Boob Worship", "Get hands on with Shades glorious chestpillows.");
	else if (!intro) addDisabledButton(5, "Boobship", "Boob Worship", "You need genitalia to properly worship Shade’s chestpillows.");
	else addDisabledButton(5, "Locked", "Locked", "Maybe if you got to know her a little better...");
	
	if(!intro) addButton(14,"Back",shouldIShadeOrShouldIGo);
}

//[Trip and Fall]
//Yes, from all the way BACK UP THERE, JESUS I NEED A FLOWCHART
//Trip and make a mess right in front of the huntress; try and distract her with some good old-fashioned stoogery. 
public function tripAndFallOnShade():void
{
	clearOutput();
	showBust("KARA","SHADE_COMBAT");
	showName("SHADE\n& KARA");
	author("Savin");
	pc.addMischievous(5);
	output("You saunter over towards the cat-girl, looking for your opportunity. You find it quickly: a waitress with an over-laden tray of drinks, making her way toward a table full of rowdy looking interstellar miners. You slow your pace, just enough to make sure you’re on a collision course with the overburdened waitress, and let her distraction take its course. She slams face-first into you, giving a startled yelp as her tray of glasses goes flying, crashing into the floor. You intentionally trip yourself over her leg, sending the both of you tumbling down in a wet heap on the deck.");
	output("\n\nAll eyes in the bar seem to be on you, a quiet hush settling over the place as the sounds of shattering glass reverberate through the bar. <i>“OhmyGodI’msorry!”</i> the waitress babbles in a panic, trying to simultaneously wipe the beer splattered over you up with a rag and collect the couple of mugs still intact. You make a show of rubbing your head, looking dazed and confused, watching the waitress blush in embarrassment, suddenly aware of how many people are staring at the pair of you.");
	output("\n\nHopefully Kara got the hint and bugged out already. You look around at the bar full of staring faces, letting your gaze play around the place towards the silver-haired kaithrit hunter. You’ve got her full attention for the moment. Good. With a grunt of effort, you haul yourself to your [pc.feet] and give the embarrassed waitress a hand up, smiling and nodding at her stream of apologies. A quick glance towards the bar shows you a distinct absence of Kara - looks like she did slip out in the momentary confusion.");
	output("\n\nExcept not. You catch a flash of movement in the corner of your eye, turning just in time to see the huntress standing, drawing a big, bulky hand cannon from her belt. Kara’s across the span of the bar from her, twisting in place just in time to avoid an arc of lightning slamming across the bar and blasting into a wall. Kara dives to the side, kicking a table over and drawing a gun from under her cloak.");
	output("\n\n<i>“[pc.name], help!”</i> Kara shouts over the din of people running screaming from the bar, flooding out every door in the place. To the other kaithrit, she adds, <i>“Shade! It’s not too late to stop this. We can both walk out of here.”</i>");
	output("\n\n<i>“You know how this goes, Kara. Cross the Void, and your life’s forfeit,”</i> the silver-haired huntress, Shade, answers.");
	output("\n\nThe Void? As in Black Void? Uh-oh. That’s only the biggest cartel of space pirates and outlaws in the galaxy! And Kara’s managed to get on their bad side? That’s a tall order for one cat. Do you help her?");
	processTime(2);
	flags["TRIPPED_ON_SHADE"] = 1;
	clearMenu();
	addButton(0,"Yes",karaAndPCVersusShadeFightIntroduction,undefined,"Yes","Help Kara against Shade.");
	addButton(1,"No",fuckThisShiiitImNotGettingInACatNDogFight,undefined,"No","Fuck this. She’s on her own.");
}

//[Yes]
//Kara + PC vs Shade fight
public function karaAndPCVersusShadeFightIntroduction():void
{
	clearOutput();
	author("Savin");
	showBust("KARA","SHADE_COMBAT");
	showName("SHADE\n& KARA");
	output("You steel yourself and stand, ready to stand beside Kara.");
	output("\n\n<i>“You brought friends?”</i> Shade spits, taking a step back and leveling the lightning gun at you. <i>“Big mistake, friend.”</i>");
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors([pc, kara]);
	CombatManager.setHostileActors(shade);
	CombatManager.victoryScene(pcAndKaraBeatShade);
	CombatManager.lossScene(loseWithKaraYouSlut);
	CombatManager.displayLocation("SHADE");
	
	kara.updateDesc();
	shade.updateDesc();
	
	addButton(0,"Next", CombatManager.beginCombat);
}

//[No]
//Take PC outside the bar, pass 10 minutes.
public function fuckThisShiiitImNotGettingInACatNDogFight():void
{
	clearOutput();
	clearBust();
	showName("FUCK\nTHIS!");
	author("Savin");
	output("Fuck this. You hop into the crowd of people fleeing, ducking out of the bar to the sounds you hear gunfire behind you.");
	output("\n\nYou spend a few minutes in the crowd of people before myr security guards come rushing, weapons drawn, and charge into the bar. More gunfire ensues over another minute or so, until a guard steps outside and waves the people back in, saying that the issue has been resolved. Taking a peek in the doors, you see a great number of bullet holes in the walls and the back door hanging open. Looks like Kara and Shade booked it. You doubt you’ll see them again.");
	flags["SHADE_AND_KARA_RESOLVED_THINGS_THEMSELVES"] = 1;

	processTime(10);

	moveTo("606");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function karaAndShadeUnfinished():Boolean
{
	if(flags["SHADE_DEFEATED_WITH_KARA"] != undefined || flags["KARA_DEFEATED_WITH_SHADE"] != undefined || flags["LOST_TO_SHADE_WITH_KARA"] != undefined) return false;
	if(flags["DISTRACTED_SHADE"] != undefined) return false;
	if(flags["SHADE_AND_KARA_RESOLVED_THINGS_THEMSELVES"] != undefined) return false;
	if(flags["MET_KARA"] == undefined) return false;
	return true;

}


//Last Chance
//If PC didn’t help Kara. Play when leaving the bar.
public function lastChanceForHelpingKara():void
{
	clearOutput();
	author("Savin");
	showBust("KARA","SHADE_COMBAT");
	showName("SHADE\n& KARA");
	output("You head out of the bar, trying to put the strange kaithrit’s request out of your mind. You make it all the way to the batwing doors, ready to head out into the street when you hear a scream behind you.");
	output("\n\nYou cast a glance over your shoulder, just in time to brace yourself for a stream of people running for the doors, trying desperately to escape. Behind them, you can see a pair of kaithrit women standing in the middle of the bar leveling handguns at each other: Kara on one side, a woman dressed in a long duster that parts around a single reptilian tail behind her on the other.");
	output("\n\n<i>“Shade! It’s not too late to stop this. We can both walk out of here.”</i>");
	output("\n\n<i>“You know how this goes, Kara. Cross the Void, and your life’s forfeit,”</i> the silver-haired huntress, Shade, answers.");
	output("\n\nThe Void? As in Black Void? Uh-oh. That’s only the biggest cartel of space pirates and outlaws in the galaxy! And Kara’s managed to get on their bad side? That’s a tall order for one cat.");
	output("\n\nKara flashes a look your way, a pleading glint in her ");
	if(pc.characterClass != GLOBAL.CLASS_ENGINEER) output("strange");
	else output("artificial");
	output(" eyes. The other woman, Shade, follows her glance. Looking you up and down, she says, <i>“You there. This woman has a pirates’ bounty on her. Help me bag her, and I’ll cut you in on it.”</i>");
	output("\n\n<i>“Please,”</i> Kara shouts, taking a step back. <i>“I can match what she’s paying. Easy.”</i>");
	output("\n\nShe scoffs. <i>“Take it or leave it, friend. You can just walk away.”</i>");
	
	moveTo("609");
	clearMenu();
	addButton(14,"Leave",fuckDisBarShit,undefined,"Leave","Fuck this. You hop into the crowd of people fleeing, ducking out of the bar to sounds of gunfire behind you.");
	addButton(0,"Help Shade",helpShadeOutLastChance,undefined,"Help Shade","Help out Shade, the bounty hunter.");
	addButton(1,"Help Kara",helpKaraOutLastChance,undefined,"Help Kara","Help Kara, the down on her luck kaithrit.");

}

//[Leave]
//Fuck this. You hop into the crowd of people fleeing, ducking out of the bar to sounds of gunfire behind you. 
public function fuckDisBarShit():void
{
	clearOutput();
	clearBust();
	author("Savin");
	output("You spend a few minutes in the crowd of people before myr security guards come rushing, weapons drawn, and charge into the bar. More gunfire ensues over another minute or so, until a guard steps outside and waves the people back in, saying that the issue has been resolved. Taking a peek through the doorway, you see a great number of bullet holes in the walls and the back door hanging open. Looks like Kara and Shade booked it. You doubt you’ll see them again.");
	flags["SHADE_AND_KARA_RESOLVED_THINGS_THEMSELVES"] = 1;
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Help Shade]
public function helpShadeOutLastChance():void
{
	clearOutput();
	author("Savin");
	showBust("KARA","SHADE_COMBAT");
	showName("SHADE\n& KARA");
	output("Can’t argue with a little bounty work. You ");
	if(pc.hasMeleeWeapon()) output("draw your weapon");
	else output("pick up a particularly vicious looking rock");
	output(" and step up beside the huntress. She gives you an approving nod as Kara looks around in a panic.");
	processTime(1);
	flags["LAST_MINUTE_KARASHADE_HELPED:"] = "Shade";
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors([pc, shade]);
	CombatManager.setHostileActors(kara);
	CombatManager.victoryScene(pcAndShadeBeatKara);
	CombatManager.lossScene(pcAndShadeDefeated);
	CombatManager.displayLocation("KARA");
	
	shade.updateDesc();
	kara.updateDesc();
	
	addButton(0,"Next", CombatManager.beginCombat);
}

//[Help Kara]
public function helpKaraOutLastChance():void
{
	clearOutput();
	author("Savin");
	showBust("KARA","SHADE_COMBAT");
	showName("SHADE\n& KARA");
	output("You can’t leave a damsel in distress, can you? You ");
	if(pc.hasMeleeWeapon()) output("draw your weapon");
	else output("pick up a particularly vicious looking rock");
	output(" and step up beside Kara. The bounty hunter curses, waving her weapon between the two of you as she realizes things just took a turn for the worse.");
	flags["LAST_MINUTE_KARASHADE_HELPED:"] = "Kara";
	processTime(1);
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors([pc, kara]);
	CombatManager.setHostileActors(shade);
	CombatManager.victoryScene(pcAndKaraBeatShade);
	CombatManager.lossScene(loseWithKaraYouSlut);
	CombatManager.displayLocation("SHADE");
	
	shade.updateDesc();
	kara.updateDesc();
	
	addButton(0,"Next", CombatManager.beginCombat);
}

public function karaQuestTurninNeeded():Boolean
{
	if(flags["KARA_PAID_YOU"] != undefined) return false;
	if(flags["SHADE_DEFEATED_WITH_KARA"] != undefined) return true;
	if(flags["DISTRACTED_SHADE"] != undefined) return true;
	return false;
}

//Quest Complete - Meet Kara in the Back Alley
//Add [Kara] to the Back Alley room menu. 
public function meetUpWithKaraInTheBackAlley():void
{
	showKara();
	output("\n\n<i>“You’re here,”</i> Kara says, taking a step out of the shadows and lowers the hood down to her shoulders, letting her cobalt-blue cat ears peek out at you.");
	//if PC fucked Shade:
	if(flags["SEXED_SHADE"] != undefined) output("\n\n<i>“Finally! I thought you weren’t coming. Then again, maybe you </i>did<i> cum huh? ");
	else output("<i>“");
	output("Looks like I made a good call with you. You’ve more than earned your reward.”</i>");

	output("\n\nShe produces a credit chit and hands it over to you. <i>“You’re a lifesaver, [pc.name]. Thank you.”</i>");
	output("\n\nYou smile and nod, pocketing the chit. Kara gives you a quick wink before pulling her hood back up and stepping past you, heading toward the spaceport.");
	output("\n\nYou get the distinct feeling you’ll see her again.");
	pc.credits += 1000;
	flags["KARA_PAID_YOU"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Combat End
// PC + Kara defeat Shade
public function pcAndKaraBeatShade():void
{
	showBust("KARA","SHADE");
	showName("KARA\n& SHADE");
	author("Savin");
	output("<i>“Fuck this,”</i> Shade grunts, clutching her wounds. She drops her gun and fumbles a grenade off of her belt, throwing it between you and her. It explodes in a white flash, sending you stumbling back, shielding your eyes. By the time you’re able to blink away the light, the kaithrit huntress is gone, vanished through the back door.");
	output("\n\nLooks like she dropped her lightning gun on the way out.");
	output("\n\nA moment later, you hear jackboots stomping down the street towards the bar. Kara sucks in a breath and pulls her cloak up over her ears, flashing you a wink before she shields her face. <i>“Meet me in the back alley!”</i> she whispers before holstering her gun and running out the door. You follow her out, trying to blend into the crowd before the myr soldiers arrive.\n\n");
	//relocate to alley
	//Add Arc Caster to inventory
	flags["SHADE_DEFEATED_WITH_KARA"] = 1;
	moveTo("606");
	CombatManager.genericVictory();
}

//PC + Shade defeat Kara
public function pcAndShadeBeatKara():void
{
	showBust("KARA","SHADE_COMBAT");
	showName("KARA\n& SHADE");
	author("Savin");
	output("Kara collapses under the hail of fire, slumping to the ground with a groan of pain.");
	output("\n\n<i>“Nice,”</i> Shade grins, blowing the smoke from her Arc Caster’s barrel before dropping it into its holster. She takes a few steps over to where Kara’s collapsed and slaps a pair of handcuffs on her, securing her bounty. Once done, Shade keys a button on her holoband and snaps a picture, uploading it to whoever it was that wanted Kara caught. The device beeps after a few moments, and Shade smiles approvingly.");
	output("\n\n<i>“Just gotta make the delivery now. Bounty on this kitten should set me up for a while. You too. Meet me back here tomorrow, after I’ve dropped her off and gotten payment, and I’ll make sure you’re compensated. Couldn’t have done it without you.”</i>");
	output("\n\nShe gives you a friendly clap on the shoulder and hauls Kara up over her shoulder, carrying the stunned kaithrit out of the bar. You make your way outside, too, before the myr soldiers can arrive and arrest you for shooting the place up.\n\n");
	flags["KARA_DEFEATED_WITH_SHADE"] = 1;
	processTime(2);
	moveTo("606");
	CombatManager.genericVictory();
}

//PC + Kara Defeated
public function loseWithKaraYouSlut():void
{
	showBust("KARA","SHADE_COMBAT");
	showName("KARA\n& SHADE");
	author("Savin");
	output("You’ve had enough. You throw down your [pc.rangedWeapon] and put your hands up - better a little indignity than death. Kara isn’t much better off, and slowly lowers her own weapon.");
	output("\n\n<i>“Could have saved me the effort,”</i> Shade spits, walking over and punching Kara square in the gut. The blue-haired kaithrit collapses with a grunt, and Shade’s quick to cuff her.");
	output("\n\n<i>“And you,”</i> the bounty hunter adds, turning to you as she hefts Kara up over her shoulder. She looks you up and down, huffs");
	if(pc.credits >= 3) 
	{
		output(", and reaches into your pack. Her hand comes back with several credit chits, which she pockets. <i>“For the extra effort. Learn to pick your battles better, kid.”</i>");
		pc.credits -= (Math.round(pc.credits/5) + 3);
		if(pc.credits < 0) pc.credits = 0;
	}
	output("\n\nShe gives you a wink, pockets the chits, and saunters out of the bar, dragging Kara with her. You leave once you’re sure she’s gone, joining the crowd of people outside before the local security can get here.\n\n");
	flags["LOST_TO_SHADE_WITH_KARA"] = 1;
	processTime(2);
	CombatManager.genericLoss();
}

//PC + Shade Defeated
public function pcAndShadeDefeated():void
{
	clearOutput();
	showBust("KARA","SHADE");
	showName("KARA\n& SHADE");
	author("Savin");
	output("You’ve had enough. You throw down your [pc.heldWeapon] and put your hands up - better a little indignity than death. Shade grunts in disgust, but puts her hands up too - she’s not much better off than you are, after all. The victorious Kara takes one stride towards the both of you, glowers at you, and raises her gun.");
	output("\n\nYou wince, closing your eyes as she pulls the trigger. You hear the scream beside you, though, and look to see Shade on the deck, collapsed in a pool of blood and burning plasma. Kara gives a huff and turns her gun toward you.");
	output("\n\n<i>“You could have just walked away,”</i> she breathes, the last thing you hear before the glow of green flame takes your life.");
	badEnd();
	addDisabledButton(0,"Game Over","Game Over","You died. Tough luck.");
}

//Shade’s Sex Scenes
//Shade starts straddling the PC. Still wearing her undies, no bra or clothes.
//[Cunt Tail Fuck]
//Shade queens the PC, uses her tailcunt on [pc.cock " + x + "].
public function cuntTailShadeFux():void
{
	clearOutput();
	showShade(true);
	var x:int = pc.cockThatFits(chars["SHADE"].vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("As Shade looms over you, you feel her scaled tail coiling around your [pc.leg], the wet slit at its tip leaving a drooling trail up your bare thigh. Its owner casts a quick glance over her shoulder, watching her tail caress you. She leans back, planting her hands on her hips, and gives you a smirking grin. <i>“Looks like somebody likes you, Steele,”</i> she chuckles as her parasitic tail traces up your [pc.leg], slowly meandering towards your [pc.crotch]. Shade shifts up on her knees, giving her cunt-tail room to work its way up to your [pc.cock " + x + "], ");
	if(pc.cockTotal() > 2) output("selecting that particular member out of your bundle of cocks and ");
	else if(pc.cockTotal() == 2) output("choosing it over its brother and ");
	output("rubbing its wet, slitted head up along your shaft. You try and suppress a groan as her tail takes hold of your prick, working its way up towards your crown.");

	output("\n\nShade’s hips shift back ever so slightly, letting her wiggle out of her panties and toss them aside, keeping her tailcunt planted firmly around your [pc.cockHead " + x + "] until she’s done. As her black undergarments fall to the floor, Shade leans back and down, bringing her tight asscheeks to rest against the stiffening span of your [pc.cock " + x + "], trapping you between two eager cunts.");
	output("\n\n<i>“Which of this pussy’s pussies do you want first?”</i> the cat-girl teases, grinding her hips and tail up and down your shaft, slathering you in warm wetness. One of her hands slips down between her spread legs, rubbing at the prominent mound of her clit. She doesn’t give you the chance to formulate a response to her question, moving faster until your mouth twists open in a groan of pleasure. Grinning at her obvious effect on you, Shade leans down, pressing her big, soft tits into your [pc.chest] and wrapping her lips around yours, letting her tongue slip into you, playing across your own [pc.tongue].");
	output("\n\n");
	showImage("ShadeTailfuck");
	output("Her tail coils up behind her, angling it’s cunt-like slit with your [pc.cockHead " + x + "] and delving down. You moan around Shade’s mouth as her tail swallows up your [pc.cock " + x + "], ");
	if(pc.cocks[x].thickness() >= 3) output("stretching its bulbous head to take your girth, straining to wrap around your massive shaft");
	else output("wrapping your prick in tight, wriggling cuntflesh as tight as any normal pussy could ever be");
	output(". Arching her back, Shade breaks the kiss and lets out a soft, surprisingly feminine moan, closing her eyes and enjoying the sensation of your cock filling her tail’s welcoming hole.");
	pc.cockChange();

	output("\n\n<i>“Ah... good old tail needed that,”</i> Shade purrs, rising to her knees and running a hand back along the length of her reptilian tail, from the tiny clit over its slit to the base, where scales meld into flesh. Her other hand plants itself firmly on your [pc.chest]");
	if(pc.biggestTitSize() < 2) output(" to steady herself");
	else 
	{
		output(", cupping one of your breasts and giving it a rough squeeze");
		if(pc.isLactating()) output(", just hard enough to draw a bead of milk from your bountiful bosom");
	}
	output(". Her tail moves on its own behind her, completely independent of the cat-girl’s own actions: it starts to pump your prick, shifting its full weight up and down your shaft with slow, steady strokes, more using its incredible muscle control to wring and caress your manhood than outright fucking you.");
	output("\n\nYou lie back on the bed, content to enjoy the alien ministrations of Shade’s tail. Her hips move slowly with the shifting mass of her tail, gently guiding the movements of her alien genitalia towards a quickening pace, steadily pumping your shaft. Between that and her hand roaming across your chest, squeezing your [pc.nipples] and caressing your ");
	if(pc.biggestTitSize() < 1) output("flat, tight chest");
	else if(pc.biggestTitSize() < 4) output("burgeoning bosom");
	else output("sizable breasts");
	output(", you find yourself moaning more and more, breath quickening in response to her tender touches.");

	output("\n\n<i>“That mouth looks like it could use something to do,”</i> Shade teases, drawing her finger up from your [pc.chest] to your [pc.lip], hooking it under your lower lip and giving you the gentlest tug. When her finger pops free of you, Shade flashes you a playful grin and steps forward, moving her knees from your [pc.hips] and planting them in the pits of your arms, making her tailcunt stretch back to reach your [pc.cock " + x + "]. More pressing, though, you’re suddenly presented with a small, pink slit slick with moisture, holding barely an inch over your [pc.face]. You try to look up at Shade, but find your view of the kaithrit’s face totally obstructed by the hefty swells of her breasts, jutting proudly from her chest.");
	output("\n\nStill, it doesn’t take a genius to figure out what she wants, and if it merits you more of her wondrous tail’s attention, you’re more than happy to give the huntress what she wants. You slip your hands up to the cat-girl’s hips, caressing her wide, motherly curves, letting your fingers brush the tight muscles of her backside. She lets out a breathy moan, and you feel her tailcunt slither around your dick, squeezing you tighter in response. Using your newfound purchase on the feline vixen, you guide her stance downwards, bringing that juicy little cunny of hers into tongue’s reach. You open wide, planting a sloppy kiss on Shade’s lower lips, letting your [pc.tongue] slip out and probe between them. The moment you do, you wince as her tailcunt clenches around your [pc.cock " + x + "], squeezing your shaft as tight as her lube-slick channel can manage, slipping down to take you to the base.");
	output("\n\n<i>“Juuuuust like that, kid,”</i> Shade groans, grinding against your face, shivering from tail-tip to toe around your probing tongue. You grip her tighter, refusing to let her move too quickly - you’re going to enjoy this too, damn it! Your tongue slips deeper into her, slithering through the tight channel of Shade’s sex, lapping at the sweet juices that bead out in answer to your every motion. Shade’s mounting excitement translate in a steady increase in her tailcunt’s pace, making it’s slitted tip bounce on your shaft. She echoes <i>“Just like that,”</i> again and again, stroking your [pc.hair] with one hand, cupping and squeezing her breasts with the other, giving you a chance to finally see your lover’s face again. Her eyes are rolled and half-closed, mouth agape with silent cries of pleasure.");
	output("\n\nLooks like your lover’s quickly losing herself to pleasure - not far behind you. Her tail’s muscles wring harder and fast, jacking you off in its wet, hot grip, working hard to milk the seed out of you. You can feel your orgasm building, your [pc.balls] churning with cum ready to shoot off. Her vaginal parasite seems to sense the buildup inside you, and that sensation drives it wild, making it move in inhuman ways around you, sucking and fucking until you can’t take it anymore.");
	output("\n\nThe next few moments are less you blowing your load so much as the voracious cunt-tail sucking the sperm out of you, draining your [pc.balls] with unyielding motions and an alien suction that feels like you’re trapped in a lubed-up cockmilker. You try to scream in pleasure, but no sound comes but a muted gasp, drawn out as your back arches into the overwhelming urgency of your orgasm. Shockwaves of pleasure hit you seconds after the first spurts of cum leave you, forcing your body rigid and breathing hard, trying to keep up with the suckling tail.");
	output("\n\nOvertop you, Shade chews on her lip, moving her hips faster - clearly enjoying the sensation of cum pouring into her parasitic appendage. As your orgasm abates, she licks her lips and looks down at you, planting her hands on the headboard and flashing you a predatory grin.");
	output("\n\n" + pc.mf("<i>“A gentleman shouldn’t cum first,”</i>","<i>“Tsk. You came first,”</i>") + " she coos, drawing her tail off your still-spurting cock and wrapping it around herself, bringing the pussy-shaped slit close enough to lick a little trickle of spooge from its lips. <i>“Still, my little friend here says ‘thank you.’ Who knows, maybe she’ll get an egg out of that.”</i>");

	output("\n\nYou start to reply, but get a slightly painful thigh-squeeze from the huntress. <i>“Who said you could stop? Keep that tongue in there.”</i>");

	output("\n\n");
	if(!pc.isAss()) output("Well, it’s only fair. ");
	else output("Bitch. ");
	output("You swat her taut ass but settle back into her thighs, slurping at her sweet little cunt. Your [pc.tongue] makes quick, shallow, rhythmic motions, probing in to find the kaithrit’s most sensitive spot; your fingers slip back around her hips and make for the perky red pleasure-buzzer over her slit. One touch makes her shiver in pleasure - a few careful strokes have her quivering in your hands, her dominant tone fading to moans of pleasure and bucks of her hips, trying to draw your tongue deeper. You lick and kiss your way ");
	if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("through her inner walls");
	else output("deep inside her, your inhumanly long tongue like a writhing tentacle inside her");
	output(", teasing and caressing for minute after minute. Her breathing grows faster and more shallow, her heart racing enough to let you feel it through the walls of her drooling pussy. She’s so close that you can - literally - taste it, feeling the sweltering heat of her sex washing over your cheeks and chin, bathing you in moisture.");

	output("\n\nShade’s climax washes over you in a rush of femcum and a scream of pleasure that reverberates through her quarters. You keep on licking, just doing what you’re doing and letting the kaithrit huntress ride through it. Her hips move faster, bouncing on your probing tongue through her orgasm until she’s nothing more than a gasping, moaning puddle of mewling pleasure in your hands. With a final groan, she rolls off of you, flopping onto her back beside you. Her cunt-tail coils around her leg, coming to rest on your [pc.crotch], lips brushing back against your well-milked prick.");
	processTime(24);
	pc.orgasm();
	IncrementFlag("SEXED_SHADE");
	inseminateShadesCuntTail();
	clearMenu();
	addButton(0,"Next",shadePostCoitusHangouts);
}

//[Take Hardlight]
//vagOrAss. PC gives tailcunt oral. 
public function takeShadesHardlightPenisInYerBoot(xmasVers:Boolean = false):void
{
	clearOutput();
	showShade(true);
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("Shade looms over you for a moment, her big slitted eyes playing over your bare body as she decides what to do with you. After a moment of thought, she leans back on her knees and plants a hand on her hip. Rather than taking her panties off, though, the kaithrit huntress instead presses a tiny button hidden in the waistband. In a flash of light, a thick, turgid holographic cock sprouts from her crotch, flopping onto your [pc.belly] with a perceptible weight.");
	//if PC knows about Hardlight dicks: 
	if(flags["ANNO_EVER_STRAPONED"] != undefined) output(" Looks like somebody’s been shopping at Aliss’s!");
	else output("\n\n<i>“Hardlight strapon,”</i> Shade purrs, reaching down to run a hand along her glowing shaft. She can’t help but shiver as her fingers play across its glittering length. <i>“Complete with one-to-one tactile sensation. Heh, I have too much fun with this.”</i>");
	output("\n\nAs if by well-ingrained instinct, her cunt-tail swerves around her hips, lips spreading open eagerly. She gives it a playful swat, murmuring, <i>“Not for you, dumbshit.”</i> Her tail slips back like a whipped dog, getting out of the way as Shade starts to stroke her hardlight cock, angling it down towards the ");
	if(x >= 0) output("lips of your sex");
	else output("ring of your [pc.asshole]");
	output(". Before she gets there, though, she hooks her arms under your [pc.legOrLegs] and gives you a rough pull, yanking you down and up; before you know it, your [pc.legOrLegs]");
	if(pc.legCount == 1) output(" is");
	else output(" are");
	output(" hiked over Shade’s shoulders, leaving your ");
	if(x >= 0) output("pussy");
	else output("ass");
	output(" tantalizingly close to the glowing cock sprouting from her panties. She leans in, pushing your backside up off the bed and curling your spine in as she goes, " + pc.catDog("making full use of your feline flexibility", "putting your flexibility to the limit") + " as she crawls up your prone body, trailing kisses up your belly, [pc.chest], and neck. Finally, she reaches your [pc.lips], pressing hers to yours and slowly urging your mouth open, just wide enough to let her tongue slip in.");

	output("\n\nYou moan into her mouth as Shade’s hands slip down your [pc.legOrLegs], finding the cheeks of your [pc.butt] and digging in, squeezing your butt until you squeal. She breaks the kiss at that, a hungry look in her eyes as you give voice to your pleasure. You feel a hand release your cheek, traveling up your thigh toward the haft of her energy-cock, grasping it and guiding it back down toward your eagerly waiting hole. Your breath catches as the tingling crown caresses your [pc.skinFurScales], brushing against your [pc.vagOrAss " + x + "]. You shiver with anticipation, sucking in a breath as Shade’s holographic cock aligns with your eager hole. From this position, there’s nothing you can do but let it happen, no force you can exert to drive her onward but to wiggle your hips invitingly, trying to relax as best you can as Shade enters you.");

	output("\n\nThe first instant of contact with her cock is a shock of pleasure and a static tingling that spreads through your body, culminating in a muted gasp as you feel her sliding into you, spreading your [pc.vagOrAss " + x + "] around the two inch thick shaft. She pushes in slowly but inexorably, bringing her hips to meet with yours in a single, lengthy thrust. The further in she goes, the more you have to bend with her, supporting her weight on your [pc.legOrLegs]. She leans between them to plant another kiss on your lips, touching them just as her hips brush against your up-raised [pc.butt]. You moan into your kaithrit lover’s mouth, letting a hand play across your [pc.belly], enjoying the feeling of fullness in your ");
	if(x >= 0) output("pussy");
	else output("ass");
	output(".");
	if(x >= 0) pc.cuntChange(x,200);
	else pc.buttChange(200);

	output("\n\nShade holds still for a long moment, letting you adjust to the feeling of her inside you - and by the look on her face, trying very hard to keep in control herself. Her breath comes hot and heavy against your neck, shuddering out as your [pc.vagOrAss " + x + "] writhes around her tingling cock, squeezing it in all the right ways to drive her wild. Her hands draw up your body, playing up to your [pc.legOrLegs] and thighs, spreading and caressing them in preparation. You relax again thanks to her gentle touches, loosening your vice-like grip on her strapon. Soon, she starts to move again, drawing back and then slamming in again, so fast that you can’t help but scream.");
	output("\n\nOnce the floodgate is down, your voice becomes a symphony of moans and cries, playing to the beat of Shade’s increasing pace. Your sultry sounds only seem to urge the huntress on, driving her to thrust faster into you. <i>“Scream for me, slut,”</i> she murmurs into your [pc.ear], drawing close against your [pc.chest] and running her tongue across one of your [pc.nipples]. With Shade tucked against you, you can see her pussy-tipped tail curling up behind her, its rosy lips spreading eagerly as it coils around Shade’s back. She glares at it over her shoulder, but the parasitic organ’s instincts drive it on against its owner’s desire, making it seek out the source of her pleasure. Flashing Shade a grin, you reach up and grab the tail’s head in both hands, pulling it up over her back and planting a big, wet kiss on its drooling lips. Your lover sucks in a sharp breath, trying not to voice her reaction as your tongue slithers into her tail’s channel.");
	output("\n\n<i>“From both ends, huh?”</i> Shade purrs, her back arching as you tease her tailcunt’s clit. She chuckles and plants a hand over yours, guiding you to hold her tail where both of you can reach it. Giving you a sultry little wink, the cat-girl rolls her long tongue out and caresses her own pussylip, joining you in sating her parasitic tail’s insatiable need. Your [pc.tongue] soon starts to play with Shade’s, teasing and probing each other’s mouths as much as her pussylips, turning it into a messy, fem-cum slathered makeout session. The taste of your lover’s lips mix with the sweet juice of her pussy, tinged by waves of pleasure wracking your body, spreading from your [pc.vagOrAss " + x + "] up through the rest of you as Shade pounds you harder, driven faster by your squirming hole and skillful tongue.");
	output("\n\nUnder Shade’s constant assault, you can’t last long - then again, neither can she, if the way she’s breathing hard is any indication. You cup her cheek, distracting her from her tailcunt and drawing the kaithrit into a long, tongue-filled kiss, pushing back against her jackhammering hips as best you can until you feel the swelling pressure inside you reach its crescendo.");
	if(pc.hasCock()) output(" Trapped between your belly and Shade’s, [pc.eachCock] strains against its confines, growing turgid with cum and ready to burst. Pre drools out of your [pc.cockHeads], turning the space between your bellies into a swamp of sticky [pc.cumNoun].");
	output(" You let out a quiet mewl to announce your orgasm, a soft squeal of pleasure pumped out of you by Shade’s relentless fucking.");
	output("\n\nYour [pc.vagOrAss " + x + "] contracts hard around the hardlight cock buried in it, trying to squeeze out a load of cum that will never come. Under pressure, her hardlight prick tingles and buzzes, sending electric waves of pleasure through your spasming hole. You clutch at your lover with arm and [pc.leg], drawing her deeper into the kiss as you ride out your climax.");
	if(pc.hasCock()) output(" [pc.Cum] bursts out of your [pc.cocks], plastering your [pc.belly] with [pc.cumNoun]. Shade gasps as the hot, sticky spurt of seed splatters onto her, but makes no complaint.");

	output("\n\n<i>“Not done... yet,”</i> Shade moans, barely audible over your own gasps of pleasure. Her hips move faster, hammering into your backside and driving your orgasm on. She races to follow you over the edge, and you’re all too eager to help her: your [pc.vagOrAss " + x + "] writhes around her, sending tactile feedback up the tingling hardlight shaft and into the kaithrit’s loins. She’s in for a mindblowing male orgasm, starting with a back-arching scream as she thrusts herself crotch-deep into you, slamming her panty-clad groin into your [pc.butt]. She holds still after that, panting and gasping and trailing kisses up your neck, letting your [pc.vagOrAss " + x + "] shepherd her through her climax.");

	output("\n\nWhen she comes down from her orgasmic high, Shade’s head comes to rest on your [pc.chest] as she catches her breath. Slowly, one of her hands works its way back and flips off the hardlight, leaving you suddenly empty without the satisfaction of withdrawal. You groan, but coil your [pc.legOrLegs] tightly around your lover’s neck. Shade gives your thigh an affectionate pat before extricating herself from your grasp, rolling onto her back beside you.");
	processTime(20);
	pc.orgasm();
	IncrementFlag("SEXED_SHADE");
	IncrementFlag("TAKEN_SHADES_HARDLIGHT");
	clearMenu();
	if(xmasVers)
	{
		processTime(8*60);
		addButton(0,"Next",shadeCleanupEpilogue);
	}
	else addButton(0,"Next",shadePostCoitusHangouts);
}

//[Rim & Wank] (if PC has no cunt; else) [Lick & Wank]
//PC must have taken Shade’s hardlight strapon at least once. Must be effeminate enough to use female pronouns and possess a cock. Is a [vagOrAss] scene.
public function rimAndWankOrLickAndWankWhoKnowsSloot():void
{
	clearOutput();
	showShade(true);
	var x:int = pc.biggestCockIndex();
	var y:int = -1;
	if(pc.hasVagina()) y = rand(pc.totalVaginas());
	output("She leans back on her knees, cupping one of her big, heavy breasts and squeezing the nipple between her fingers, shivering with the sensation. Her other hand slowly slips down to the hem of her panties and the hidden switch of her hardlight projectors. Before she can turn it on, you reach up and grab her wrist, stopping her a bare inch from the button. The buxom kaithrit looks down at you, cocking an eyebrow.");
	output("\n\nYou lace your fingers through hers, holding her hand steady as you whisper that ");
	if(hours < 6 || hours > 17) output("tonight");
	else output("today");
	output(", you’d like something a little gentler from your lover - a more tender touch.");

	output("\n\n<i>“Is that right?”</i> Shade says, the corner of her mouth twitching into something like a smile. The tension in her arm evaporates, turning into a gentle hold on your own hand. Shade leans down overtop you, pressing the soft swells of her chest against your [pc.chest] and cupping your cheek. <i>“I guess I can do that,”</i> she whispers, nibbling on your [pc.ear].");

	output("\n\nYou moan and relax in her embrace, your back arching ever so slightly as she teases your ears and neck with little kisses and bites. One of your hands slips around Shade’s waist, pulling her tight against you, holding her close as her lips brush against your own. She kisses you, just for the blink of an eye, before slipping down, curling her back at an inhuman arch to put her mouth to your [pc.nipple], giving it a gentle suckle.");
	if(!pc.isLactating()) output(" You gasp at the sudden shock of pleasure, your back arching opposite her own");
	else output("You gasp and squirm as a little trickle of [pc.milkNoun] seeps out onto her tongue, lapped up with a relish and a delighted purr from the cat woman");
	output(".");

	output("\n\nSlowly but surely, Shade works her way down until her feline dexterity will take her no further. She uncurls herself, leaning back on her knees, back to straddling your [pc.hips]. Her hands gently slip around your waist, giving you just enough of a push to urge you onto your [pc.belly]. Shade chuckles as you move under her, squirming around to meet her demand. The change of position ends in her resting her ass flush against your own [pc.butt], her tight cheeks firmly pinning you to the bed beneath her. You groan happily as her strong hands rest on the backs of your shoulders, kneading the");
	//if high Phys:
	if(pc.physique()/pc.physiqueMax() >= .75) output(" tense, strong");
	output(" muscles beneath your [pc.skinFurScales] until you’re relaxed again. She massages the tension from you, firm fingers working out every bit of hesitation and doubt until you’re like putty in her hands.");
	output("\n\nA shiver runs through you as the wet, warm slit of Shade’s pussy-tail brushes across your [pc.leg], leaving a sticky trail up your thigh, getting dangerously close to your half-hard dick.");
	output("\n\n<i>“Oooh, she’s getting impatient,”</i> Shade purrs, grabbing her tail by the tip and coiling it around her waist to look at it. <i>“Desperate for a taste, aren’t you?”</i>");
	output("\n\nShade shifts slightly, scooting down your prostrate body until she can get her hands around your [pc.hips] and pull you up, getting you on your hands");
	if(pc.legCount == 1 && pc.hasKnees()) output(" and [pc.knee]");
	else if(pc.hasKnees()) output(" and [pc.knees]");
	output(" and leaving your [pc.cock " + x + "] dangling");
	if(pc.legCount > 1) output(" between");
	else output(" against");
	output(" your [pc.legOrLegs]. Her fingers brush across your length, a simple touch that has you from half mast to diamond hard by the time she’s reached your [pc.cockHead " + x + "].");
	
	output("\n\n<i>“I love a [pc.manWoman] with a nice, hard cock between [pc.hisHer] legs.");
	if(pc.isGoo() || pc.isNaga()) output(" Or [pc.legOrLegs], in your case.");
	output("”</i> Shade says, leaning in and planting a kiss ");
	if(pc.balls > 0) output("on your [pc.balls], sending an electric wave of pleasure tingling through your body");
	else 
	{
		output("on the bare space between your cock and [pc.vagOrAss " + y + "] where your balls might have been, her tongue rolling out to caress ");
		if(pc.hasVagina() && pc.hasClit()) output("[pc.oneClit]");
		else output("your taint");
	}
	output(". You curl your arms under the pillow, resting your head against it, and give your [pc.hips] an enticing little wiggle.");

	output("\n\nShade answers it with a playful grope, sinking her fingers into your [pc.butt] until you draw a sharp, gasping breath. A glance over your shoulder shows Shade grinning, her pussy-tail swishing happily behind her as she stretches languidly out behind you, nestling her cheeks against your raised behind. You feel her tongue snake out again, this time caressing the ");
	if(y >= 0) output("outer lips of ");
	else output("dark, sensitive skin around ");
	output("your [pc.vagOrAss " + y + "]. You hear a pleased little purr behind you and a thrum of vibration on the");
	if (pc.hasVagina()) output(" lips");
	else output(" rim"); 
	output(" of your hole as Shade’s lips press against your [pc.vagOrAss " + y + "].");

	output("\n\nYou moan and bite your lip, hard, as Shade’s tongue traces around your hole, licking and teasing, drawing closer and closer to the entrance. Instinctively, your fingers clutch at the pillow under your head, clawing for purchase. Your lover carries on relentlessly, dragging her tongue through the cleft of your ");
	if(y >= 0) output("cunt");
	else output("crack");
	output(", pressing the tip firmly into your hole. A shiver runs through you as Shade puts progressively more pressure on your opening, slowly but surely driving the rounded head of her tongue through your defenses. Reflexively you clench around her probing muscle, your body trying at odds to repel it and draw it in, milking it as you might at cock.");

	output("\n\nShade chuckles softly, her voice melting into a long, low purr that vibrates through your [pc.vagOrAss " + y + "], teasing your passing as she slowly licks in and around your opening. Her movements become regular, rhythmic, almost relaxing in their little bursts of pleasure. You find yourself gasping and moaning under Shade’s tender ministrations, pushing your hips back against her, burying her face in your [pc.butt]. Her hands rub and caress you in turn, squeezing your cheeks and plying them open, letting her dig deeper into you.");

	output("\n\nYou gasp as her hands move, shifting down from your [pc.butt] to the dangling breadth of your [pc.cock " + x + "]. With a gasp, you arch your back and squirm under the sensation of Shade’s warm, strong fingers wrapping around your member, gently stroking your to full hardness to the beat of her tongue’s lashing. Her hand moves with surety, gliding from tip to stem, using her thumb to caress your [pc.cockHead " + x + "] until the digit comes away with a nice [pc.cumColor] glaze.");
	output("\n\n<i>“Right there,”</i> you moan softly, trembling as Shade’s hand works you. <i>“Faster...”</i>");
	output("\n\nHer oral ministrations stop, just long enough to say <i>“If you wanted it fast...”</i> a lick across your [pc.vagOrAss " + y + "] makes you gasp. <i>“Just relax, kid. Let it all go.”</i>");
	output("\n\nYou did that a while ago, but for her sake, you make a show of burying your face in her pillow and swaying your hips invitingly. She takes the implicit offer, moving back between the cheeks of your [pc.butt] and driving her tongue deep into you. Under that kind of treatment, you soon feel your rising lusts burning under your [pc.skin]. Your cock throbs in Shade’s hand");
	if(pc.balls > 0) output(", [pc.balls] churning with your mounting need.");

	output("\n\nShade shifts ever so slightly, bringing the coiling, slithering length of her tail to bear on you. Her tail’s pussy-lips rub against the crown of your [pc.cock " + x + "]. She holds it just a hair’s breadth from your shaft, letting you feel the sultry heat radiating from its gaping slit. Her tailcunt drools a trickle of excitement down its scaled body, eagerly awaiting your climax - but unwilling to give it to you, leaving that honor to Shade’s tongue and deft fingers.");
	output("\n\nIt isn’t much longer before Shade’s work pays off. With a final, gasping moan, you unleash a squirt of [pc.cumNoun] that splatters across the face of Shade’s tail, slathering her pussy-lips in seed. Shade coos but stays steady, keeping her tongue and hand busy on your cock and hole, leaving your orgasm to her tail’s purview. The lips lunge up at the first taste of cum, driven wild by the prospect of more. Finally its lips wrap around your [pc.cock " + x + "], swallowing your crown to keep you from wasting one more drop. For your part, you’re happy to have something warm and wet to blow your load into. You cum and cum, letting your lover’s expert ministrations milk your [pc.balls] to completion.");
	output("\n\nYou’re panting and gasping by the time you’ve squirted your last. Shade’s tail makes an almost imperceptible hissing noise, sounding pleasantly sated by your cummy offering as it pops wetly from your crown.");
	output("\n\n<i>“Enjoy yourself, girl?”</i> Shade asks. You almost think she’s talking to you, until you look back and see her scratching her tail’s bulbous end.");
	output("\n\nShade finishes by giving you a light, playful smack on the ass.");
	processTime(17);
	pc.orgasm();
	IncrementFlag("SEXED_SHADE");
	inseminateShadesCuntTail();
	IncrementFlag("TAKEN_SHADES_HARDLIGHT");
	clearMenu();
	addButton(0,"Next",shadePostCoitusHangouts);
}

//Shade Tailcock v. Tailcunt Scene
//Because it’s only been requested literally 50 billion times. Just another add to her normal sex menu.
//[Tailsex]
//Tooltip: You’ve got a tail-cock, Shade’s got a tail-cunt... it seems like a match made in heaven, so why not let your tail-genitalia have some fun together?
public function shadeTailSex():void
{
	clearOutput();
	showShade(true);
	author("Savin");
	
	output("<i>“I’ve got a few ideas,”</i> you answer the buxom kaithrit overtop you, playing your hands up her ample thighs and over her smooth, flared hips. She smiles down at you, gently rocking in your embrace and letting you watch those huge, perfect tits of hers sway hypnotically over your face. You shiver in anticipation at the thought of burying your face between those titans of titflesh, just losing yourself in them... worshipping them with your mouth. Gently, you start to urge Shade down, bringing the smoking hot kitty lower until you can lick your tongue along one of her hefty orbs, teasing the tip across what must be a very sensitive teat. She gasps and arches her back into you, laying her taut belly flat against your [pc.belly] and easing her cleavage down around your face.");
	output("\n\nThough your world goes dark, completely obscured by soft, sensual flesh, your body only seems all the more sensitive for it. Every subtle movement of your lover overtop you, every brush of skin or movement of her sultry tail around your [pc.legs] sends electric currents of sensation tearing through you.");
	if(flags["SHADE_BOOBWORSHIP"] != undefined && flags["SHADE_TALKED_ABOUT_MODS"] != undefined && shade.isLactating()) output("\n\nAnother sensation then hits you and rolls down your boob-sandwiched face... a warm, wet stream flowing along your cheeks - This MILF’s milk no doubt! <i>“I should invest in more milk mods,”</i> Shade murmurs, slipping a hand behind your head and pulling you tight into her rack. <i>“I bet you love my big, milky tits. Don’t you want to snack on them while I fuck you silly?");
	else output("\n\n<i>“Maybe I should invest in milk mods one of these days,”</i> Shade murmurs, slipping a hand behind your head and pulling you tight into her rack. <i>“I bet you’d love it if I did... get a pair of big, milky tits for you to snack on while I fuck you.");
	output(" You’d let momma Shade have her way with you all day like that, wouldn’t you?”</i>");
	output("\n\nYou murmur something like <i>“God, yes,”</i> from between her tits, kissing and licking at the insides of her fleshy mounds, loving the perfumed taste of her skin on your [pc.tongue].");
	output("\n\nShe laughs, but the idea of lounging around for hours on end in the beautiful cat-girl’s embrace just drives you even wilder. Trapped under her as you are, your lusts can only take themselves out on your [pc.tails], ");
	if(pc.tailCount > 1) output("one of ");
	output("which flicks up from between your [pc.legs] to draw its way along Shade’s tight little ass.");

	output("\n\n<i>“Oh, that’s how you want to play it?”</i> she purrs, leaning down to nip at your [pc.ear]. <i>“And here I was hoping you were just going to lay there and tongue-bathe my tits all ");
	if(hours < 20 && hours >= 5) output("day");
	else output("night");
	output(".”</i>");

	output("\n\nWell, it wouldn’t take much to talk you into that... but for right now, you’ve got a powerful lust to quench, and your cock-tipped tail is the easiest means of doing so.");
	output("\n\nYou start guiding your tail up Shade’s thigh, leaving a nice trail of hot, sticky excitement up the insides of her legs until you’re so near to her slit that you can feel the sultry heat radiating off of it, begging for your touch... until suddenly you feel something thick and strong wrapping around the slender tendril of your cock-tail, pulling you away from Shade’s sex.");
	output("\n\n<i>“Two can play at this game, kiddo,”</i> Shade laughs, running her fingers ");
	if(pc.hasHair()) output("through your hair");
	else output("across your bald pate");
	output(" before throwing you flat against the bed, pinning you down at the shoulders with both hands. A moment of panic hits you, until your amazonian lover drops flat overtop you and presses her lips to yours, entwining your [pc.tongue] in a passionate kiss while your tails intertwine, slowly feeling their way towards each others’ tips. Shade lets out a soft little moan, barely audible from within your kiss, and you know you’ve found your mark: the hot, sodden gash on the underside of her tail’s tip, wet and ready for you...");
	output("\n\nYou press forward, slapping Shade’s ass with both hands as you do, making the amorous cat-girl cry out in pleasure. <i>“Fuck... oh!”</i> she growls, teeth clenches as your [pc.tailCock] parts the lips of her drooling twat-tail and slithers into the squeezing, slippery channel within. You and Shade both moan, hands and lips tight against each other as your tails make passionate love.");
	output("\n\nShade moves like liquid heat over you, rocking forward and back as her tail is filled with inch after inch of throbbing tail-cock. You feel her big, soft breasts glide over your [pc.chest]; her thighs gripping your [pc.hips] and the wet heat of her other, unused cunt ");
	if(!pc.hasGenitals()) output("dragging across your body.");
	else if(pc.hasVagina()) output("grinding against your [pc.cunt], sending shivers of pleasure up your spine.");
	else output("grinding across the underside of your cock, driving you wild with even greater pleasure.");

	output("\n\n<i>“Double the pleasure, right?”</i> she purrs, reaching down to ");
	if(pc.hasGenitals()) 
	{
		output("run her long fingers across your ");
		if(pc.hasVagina()) output("pussy");
		else output("cock");
	}
	else output("grab the hand resting on her ass, urging you to squeeze her tighter");
	output(".");

	output("\n\nYou have to admit, having a tail-mounted cock is pretty great too... feeling her sinuous, curling cunt-tail move and squeeze around your lengthy appendage, milking it with superhuman skill is enough to drive you mad with lust, already eager to bust your nut deep inside the kaithrit’s parasitic pussy. With every one of her graceful, powerful movements, your body becomes more tense, more overloaded with sexual ecstasy until you’re fighting to keep it down.");

	output("\n\n<i>“What’re you holding back for?”</i> your lover chastises, her voice nothing more than a husky whisper in your [pc.ear]. <i>“Come on... my tail’s so hungry for you...”</i>");
	output("\n\nHer encouragement is all you need to stop holding back, and with a cry of pleasure you feel the tension draining out of you, just as [pc.cumNoun] drains from your tail-prick’s slit, splattering the wet-velvet walls of Shade’s cunt. The cat-girl moans, back arching as her tail is bred, pumped full of your creamy load. Your hands dig into her ass, gripping hard as pleasure wracks you, making you groan and buck underneath her; still, Shade’s weight keeps you pinned, and when you start to get loud, you promptly find your mouth occupied by another kiss, silencing you with her tender affection.");

	output("\n\nWhen your orgasm passes, you’re left slumped back in Shade’s bed, panting and sweating in the afterglow. Your lover rests atop you, her breasts ");
	if(pc.biggestTitSize() >= 1) output("pressed against your own [pc.chest]");
	else output("flat against your chest");
	output(", smiling down at you with a twinkle in her golden eyes. One of her fingers traces along your collarbone, and you can feel her breath hot against your cheek, the smells of alcohol and sex intertwining in an intoxicating aroma.");

	output("\n\n<i>“You treat me like that more, and I’ll start to think we were made for each other,”</i> Shade purrs, reaching back to run a hand along your tail’s shaft, up to the lips of her cunt. You shiver as her digit pushes in ever so slightly, wiping up a trickle of escaping seed. She licks it up with lusty hunger, cleaning her finger in a way that makes you wonder what she could do to your [pc.tailCock]. <i>“Our bodies certainly seem like perfect matches, huh? I’m sure you’ll give my little friend back there a nice, plump little egg, too...”</i>");

	output("\n\nNow she’s just trying to get you horny again... and its working. Sliding out of her tail-pussy is an agony of over-sensation, and when you finally pull out of her, you’re left with such a cold and exposed sensation that you can’t help but moan.");

	output("\n\nShade tsks her tongue down at you, but reaches down beneath her and grabs your");
	if(pc.hasParasiteTail()) output(" writhing parasite");
	else output(" [pc.tail]");
	output(" by its tip, dragging it all the way up your body until it’s stretching flat against your belly and up to your [pc.chest]. When it is, Shade lies back down, pressing herself tight against you, and putting all of her heat and weight around your over-sensitive cock-tail. You suck in a sharp breath when those beautiful tits of hers wrap around your prick-like tip, just low enough that the tip peeks out. Still drooling the aftershocks of your orgasm, you note, which quickly forms a little puddle of heat ");
	if(pc.biggestTitSize() < 1) output("on your chest.");
	else output("between your tits. You note gleefully that your tits and Shade’s make a perfect sheathe for your tail-cock.");

	output("\n\n<i>“Think you can go again, [pc.name]?”</i> Shade asks, not looking at your face as she does so. You answer by spurting a little cum out of your prick, not quite able to get hard that quickly. <i>“Aww, well, I guess we’ll just have to give you a little boost first... won’t we?”</i>");

	output("\n\nYour eyes go wide, but you can’t find the willpower... or the desire... to stop her from running her rough tongue along your cockhead, teasing the slit and squeezing her tits around it like a hot, soft vice of flesh. Oh, God, that’s nice...");

	output("\n\nShade chuckles as she works, clearly enjoying the way you squirm and moan at her touch. Eventually, though, her laughs fall away to grunts of effort, her concentration entirely focused on pleasuring your cock, getting you back to full mast in record time. In what seems like a blissful blink of the eye, Shade’s tongue, tits, and undulating body all working in tandem.");

	output("\n\n<i>“See? Ready to go already,”</i> Shade purrs, planting both hands on your chest and pushing herself up to her knees - and taking your cock with her, keeping it trapped between the pliant mounds of her breasts.");

	output("\n\nIn one fluid motion, Shade flips around on her knees and catches your cock with her own tail, coiling around your squirming member as she mounts you reverse-cowgirl");
	if(pc.hasCock()) output(", her <i>“normal”</i> twat left rubbing dangerously against your [pc.cock]");
	output(". Her tail pulls yours taut, dragging your cock through the crack of its mistress’s ass before enveloping your crown in her rosy lips.");

	output("\n\n<i>“Oooh, that’s the stuff,”</i> Shade groans, reaching back to grab her own butt and giving you an awesome view of her tail bulging around your own. You ram deep into her, writhing down into the deepest depths of her tail-pussy using your first orgasm’s hot spunk like lube to glide easily against her clenching muscles.");

	output("\n\nGiving you a wink over her shoulder, Shade grabs the bottom posts of her bed and leans way down between them to show off that ass of hers, her winking slit, and the squirming mix of your tails linking the two of you together. You reach down to get your hands on those hips and butt, sliding your hands along Shade’s rockin’ curves until your fingers are brushing her pussy, teasing the bud of her clit until she’s gasping - and her tail clenches so hard around your tail-cock that you’re afraid you might cum again already.");

	output("\n\nThis time, though, you keep yourself restrained until your lover’s openly moaning, and her tail feels so luridly wet that stains are forming under her - from both cunts, you’re pleased to see. You slip your fingers into the one between her legs, making the lusty cat groan as you spread her nice and wide to the beat of your thrusting tail-cock. Shade reaches her climax with a scream that reverberates off the bulkheads, throwing her head back and arching her back in a way only a cat-girl could do, her body all but convulsing in pleasure.");

	output("\n\nHer tail mirrors the rest of her body, squeezing and massaging your cock as it floods with fem-cum. You grunt and let loose, your obligations to the amorous cat-girl fulfilled in the most pleasurable way you can imagine. [pc.CumNoun] spurts from your tail’s slit, filling Shade’s sloppy passage with another hefty helping of spooge.");

	output("\n\nThe cat-girl flops back beside you a moment later, breathing hard. You watch her breasts rise and fall, enjoying the feeling of her tail squeezing your still-spasming tail-cock.");
	processTime(30);
	pc.orgasm();
	pc.orgasm();
	//[Next] //to Combine
	IncrementFlag("SEXED_SHADE");
	inseminateShadesCuntTail();
	clearMenu();
	addButton(0,"Next",shadePostCoitusHangouts);
}


//Add to Shade's sex menu. PC must have a dick of at least 18 inches, and breasts of at least D-cup.
public function shadeDoubleTitfuck():void
{
	clearOutput();
	showShade(true);
	author("Savin");
	output("Shade casts a glance down, running a pair of her long-clawed fingers along the tender underside of your [pc.cock]. You’re already rock-hard under the amazonian kaithrit, and her gentle touch only serves to make you moan, and to cause your over-sized prick to throb needily in her grasp.");

	output("\n\n<i>“Where’d you get something this big, anyway?”</i> Shade purrs, brushing her fingertips back and forth along your length. <i>“Trying to build up for some galactic size-queen, hmm; or were you just trying to get so you could suck yourself off?”</i>");

	output("\n\nThough you try and respond, your words are cut off by a gasp of pleasure as Shade grabs your cockhead and grinds the pad of her thumb into your cum-slit, churning the lake of pre building up inside. <i>“Let’s see,”</i> she murmurs, moving her thumb in rhythmic circles and guiding your prick to lie flat against your belly, as long and as hard as it’s ever been. Your dick fits snugly into the valley of your own cleavage, echoing the beat of your heart into your tits’ pillowy embrace. A moan escapes your lips as Shade keeps moving her thumb and massaging your crown with her hand, getting your manhood exactly where she wants it.");

	output("\n\n<i>“Gotta say, kiddo,”</i> she grins, leaning down, <i>“I didn’t see the appeal of larger-than-life cocks like yours until I saw one strapped to a smoking hot babe, nestled between a glorious pair of tits.”</i>");

	output("\n\nShade licks her lips and slips her hands down to either side of your [pc.boobs], pushing them together around your [pc.cock]. You moan again, arching your back as the MILFy cat-girl starts to massage your tits up and down on either side of your shaft. <i>“Good " + pc.mf("boy","girl") + ",”</i> your lover purrs, leaning in a little more and flicking her rough tongue around your crown. When she does, her own ample bust presses down against yours, compressing both your racks and trapping your [pc.cock] completely between two pairs of sinfully soft breasts. <i>“How’s that? Feels amazing, doesn’t it?”</i>");

	output("\n\nYou nod eagerly, whimpering with pleasure. She chuckles and moves her whole body forward, humping her cleavage against your manhood in opposite motions to the way she man-handles your own tits.");
	if (shade.isLactating()) output(" As she does, the pressure on Shade’s rack seems to really start getting to her: she gasps, chewing her lip and flushing brightly. It takes you a second to realize why: [shade.milk] is leaking from her stiff nipples, drooling in thick rivulets into your cleavage’s tight embrace.");
	else output(" “Better lube this big bastard up if you want to get off,”</i> Shade teases, running her tongue along your underside in long, lavish licks. You shiver, but the added lubrication instantly makes her movements faster, smoother - more pleasurable. That’s all the convincing you need to lean in and start mirroring her movements, slathering your [pc.cockHead] with your tongue.");

	output("\n\n<i>“That’s better,”</i> Shade moans, moving faster as your cock gets more and more lubed-up. <i>“Damn, I can feel it <b>throbbing</b> in there... gettin’ bigger by the second. Gonna cum for me, [pc.name]? Do it - I wanna see your face get absolutely <b>plastered</b> in it!”</i>");

	output("\n\nYou grit your teeth and groan, not sure if you can hold back after an invitation like that - especially with Shade licking her lips and purring at your cock, like she’s ready to lap up every creamy drop you end up bathing yourself in. Squirming with pleasure, you grope at Shade’s plush behind and chiseled thighs, trying to urge her to move faster. She smiles down at you, leaning off your cockhead for a moment to plant a kiss flush on your [pc.lips].");

	output("\n\nThe kiss pushes you over the edge, spurs you to climax in the cat-woman’s arms. Your [pc.cock] throbs and swells between your breasts, forcing a lurid moan from your lips as your pent-up load surges out. Shade gets her face out of the way just in time, dodging the first thick glob of [pc.cum] that sprays out of your [pc.cockHead] and splatters your [pc.face]. Laughing, you recoil and close your eyes, coating yourself with spunk. Shade keeps your tits bouncing along your length, using your chest and hers to milk your cock of every last, creamy drop. While you squirt your load all over yourself, Shade leans down and runs her rough feline tongue across your cheeks and laps up the thick streaks of spooge clinging to your [pc.skinFurScales].");

	output("\n\n<i>“Tasty,”</i> Shade chuckles between sensuous licks. Your cock keeps drooling [pc.cum], emptying your [pc.balls] across your face, neck, and cleavage for the feline huntress to lap up like cream. Her breasts squeeze and knead your shaft, massaging you until you’ve completely squirted out your load, and your cock is left throbbing emptily. Shade just keeps licking, cleaning you off like a mother cat.");

	output("\n\nExhausted, drained, and slathered in your own semen, you flop back against the catgirl’s bed with a contented sigh. Shade chuckles and curls up beside you, tracing a finger along the curve of your cheek... and wiping up a little left-over cum as she does so.");
	processTime(30);
	pc.orgasm();
	//[Next] //to Combine
	IncrementFlag("SEXED_SHADE");
	clearMenu();
	addButton(0,"Next",shadePostCoitusHangouts);
}


//Combine All
public function shadePostCoitusHangouts():void
{
	clearOutput();
	showShade(true);
	//Daytime Version
	if(hours > 6 && hours < 19)
	{
		output("<i>“Fuck,”</i> she sighs, lacing her hands behind her head. <i>“That was good.”</i>");
		output("\n\nYou flash your lover a smile, reaching down to stroke the hefty end of her pussy-tipped tail. Like an animal of its own, the tail squirms in your grasp, nuzzling against your palm. After a few moments though, Shade slips out of bed and rolls her shoulders; her tail coils up, winking at you as its owner yanks her pants up. You watch with appreciation as the curvaceous kaithrit dresses, especially as she turns your way and spends a moment stuffing her");
		if(flags["SHADE_ON_UVETO"] == undefined) output(" chest into her bra and shirt");
		else output(" twat-tail into a tan sock to keep it warm -- which involves a great deal of bending over, letting her breasts sway pendulously while she wrestles with the uncooperative appendage");
		output(". When she’s finished, she casts a glance over her shoulder at you and gives you a playful wink.");
		output("\n\n<i>“Enjoy the show?”</i> she asks,");
		if(flags["SHADE_ON_UVETO"] != undefined && shadeIsHome()) output(" straightening her clothes");
		else output(" picking up her duster and tossing it over her shoulder");
		output(". <i>“I’m going");
		if(flags["SHADE_ON_UVETO"] != undefined && shadeIsHome())
			output(
				RandomInCollection(
					" to freshen up in the bathroom",
					" to cook something in the kitchen",
					" to clean the living room",
					" to check on my drones"
				)
			);
		else output(" back to the bar");
		output(". Let yourself out when you’re ready.”</i>");
		output("\n\nYou nod, and watch Shade");
		if(flags["SHADE_ON_UVETO"] != undefined && shadeIsHome()) output(" leave the bedroom");
		else output(" on her way out");
		output(". After a few minutes to catch your breath, you hop out of your lover’s bed and collect your [pc.gear] from the corridor. You get your gear in order and let yourself out");
		if(flags["SHADE_ON_UVETO"] == undefined)
		{
			output(". Shade’s ships seals tight behind you.");
			//PC is left in the far north of the airfield.
			moveTo("602");
		}
		else
		{
			output(" shortly after. Shade’s house seals tight behind you, leaving you to quickly make your way back to the bar to get out of the searing cold.");
			currentLocation = "UVI P32";
		}
		
		processTime(15);
		
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Night Version
	else
	{
		output("<i>“Fuck,”</i> she sighs, lacing her hands behind her head. <i>“That was good.”</i>");
		output("\n\nYou flash your lover a smile, reaching down to stroke the hefty end of her pussy-tipped tail. Like an animal of its own, the tail squirms in your grasp, nuzzling against your palm. Shade gives a big yawn and stretches, reaching up toward the small light switch over the headboard.");
		output("\n\n<i>“Nothing like a good fuck before you go to sleep,”</i> Shade purrs, turning toward you with a slight smile. <i>“Unless you have somewhere to go, anyway.”</i>");
		
		//[Stay] [Go]
		clearMenu();
		addButton(0,"Stay",stayWithShade);
		addButton(1,"Go",shouldIShadeOrShouldIGo);
	}
}

//[Go]
public function shouldIShadeOrShouldIGo():void
{
	clearOutput();
	showShade(true);
	
	output("You hop out of Shade’s bed and start gathering your [pc.gear]. The kaithrit shrugs and lies back, watching you until you’re ready to go.");
	output("\n\n<i>“Show yourself out, hmm?”</i> she purrs, giving you a parting smile before shutting off her light. You slip on out of the");
	if(flags["SHADE_ON_UVETO"] == undefined)
	{
		output(" ship, and head out into the airfield.");
		moveTo("602");
	}
	else
	{
		output(" house and back to the bar.");
		currentLocation = "UVI P32";
	}
	
	processTime(3);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Stay]
public function stayWithShade():void
{
	clearOutput();
	showShade(true);
	output("You tell Shade that you’ve got nowhere to be, which earns you a playful smile from the buxom kaithrit as she flips the lights off.");
	if(pc.biggestTitSize() < 1) output(" You feel a long, strong arm lock around your waist, and Shade’s cheek nuzzle against your [pc.chest].");
	else output(" One of Shade’s arms slips under you, and you feel yourself being pulled over onto your side, planting your face squarely into the valley of her ample cleavage. You nuzzle in, getting comfortable on your makeshift pillows, and letting yourself slowly drift off to sleep in Shade’s arms, enjoying the embrace of her soft breasts and her overly affectionate tail.");
	
	processTime(10);
	
	clearMenu();
	addButton(0,"Next",recoverWithShade);
}

public function recoverWithShade():void
{
	clearOutput();
	showShade(true);
	
	//Pass 8 hours
	processTime(474);
	sleepHeal();
	
	output("You wake up a good while later, rested and relaxed, with a great big yawn to announce your waking. After a moment, you note a distinct absence of busty cat-girl in the bed, and the faint sound of running water beating down nearby. You take the opportunity to gather your [pc.gear] scattered all through the ship and get ");
	if(!pc.isNude()) output("dressed");
	else output("yourself re-equipped");
	output(". By the time you’re done, the shower’s turned off and Shade appears through her bathroom door, an open-faced towel draped from her shoulders, exposing her chest and sex for your viewing.");
	output("\n\n<i>“Still here?”</i> she teases, letting the towel fall to the ground as she strides over to her dresser, bending over to pull out a fresh pair of underwear, and giving you a view to die for. She gets dressed quickly, though not without giving you quite the show as she does so. When she’s done, Shade slips an arm through yours and gives you a rough pull out of her");
	if(flags["SHADE_ON_UVETO"] == undefined) output(" cabin");
	else output(" bedroom");
	output(". <i>“C’mon, can’t lounge around </i>all<i> day.”</i>");
	if(flags["SHADE_ON_UVETO"] == undefined)
	{
		output("\n\nYou chuckle and let yourself be led off the ship, following Shade back out to the airfield. Her ship seals tight behind you, and your lover gives you a final smack on your [pc.butt] before trotting off towards the tavern.");
		moveTo("602");
	}
	else
	{
		output("\n\nBefore you know it, your lover has very adamantly planted you at her table, and the smell of sizzling eggs and bacon starts wafting through the house. A few minutes later a big, piping hot plate of breakfast is in front of you, followed by a lovely kaithrit sitting cross-legged and eating with one hand, reading off a datapad with the other. Considering the night’s events, there’s little need for small talk -- just quiet companionship with your lover, punctuated by the occasional murmured headline from Shade’s datapad or her pussy-tail wandering up your [pc.leg] before one or the other of you swats it off.");
		output("\n\nWhen you’ve both had your fill, one of Shade’s canid drones pads into the room and lifts your plate off the table and carries it off to the sink. Shade cleans up after it, putting those surprising domestic skills of her on display as she whisks away any trace of mess and leaves you with a steaming mug in your hands to kick start your day.");
		if(flags["SHADE_ON_UVETO"] != undefined && shadeIsHome())
		{
			output("\n\n<i>“You better get going,”</i> Shade offers, pulling you to your [pc.feet]. <i>“As much as I like your company, I’ve got some errands I need to take care of around here.”</i>");
			output("\n\nShade leads you up the stairs and you head back out, into the blowing gale of the Uvetan winds. Just before you step out, though, Shade pulls you into a quick kiss and gives you a final smack on your [pc.butt] before you trot off towards the tavern.");
		}
		else
		{
			output("\n\n<i>“Let’s get going,”</i> Shade offers, pulling you to your [pc.feet]. <i>“Much as I’d like to lounge around here all day, I’ve got business to chew through, and a powerful need for bar snacks and warm drink to do it.”</i>");
			output("\n\nWith an arm around your waist, Shade leads you up the stairs and back into the blowing gale of the Uvetan winds. Just before you step out, though, Shade pulls you into a quick kiss and gives you a final smack on your [pc.butt] before trotting off towards the tavern.");
		}
		processTime(15);
		eatHomeCooking(15);
		currentLocation = "UVI P32";
	}
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function shadeQuestNeedsTurnIn():Boolean
{
	if(flags["KARA_DEFEATED_WITH_SHADE"] != undefined)
	{
		if(flags["SHADE_PAID_YOU"] == undefined) return true;
	}
	return false;
}
public function shadeAtTheBar():Boolean
{
	if(!shadeIsActive()) return false;
	if(flags["SHADE_ON_UVETO"] != undefined) return false;
	if(flags["SHADE_AND_KARA_RESOLVED_THINGS_THEMSELVES"] != undefined) return false;
	if(flags["SHADE_DEFEATED_WITH_KARA"] != undefined) return false;
	if(karaAndShadeUnfinished()) return false;
	return true;
}

//First Time Repeat - Captured Kara (One Time)
//+20,000 Credits
public function getPaidByShade4Kara():void
{
	clearOutput();
	showShade();
	output("<i>“Hey, Steele,”</i> Shade says, looking up from her holo data as you approach. <i>“Thanks again for the help earlier. Been tracking Kara for weeks. Tough kitty, but we took her down.”</i>");
	output("\n\nShe reaches into her duster and retrieves a credit stick. She tosses it to you with a wink, watching with mirth as you turn it over in your hand and read the number printed on it.");
	output("\n\n<i>“Twenty thousand?”</i>");
	output("\n\n<i>“Heh. Told you she was worth a ransom,”</i> Shade chuckles. <i>“You earned it, kid.”</i>");
	output("\n\nYou give the huntress an appreciative nod and tuck the chit away.");
	output("\n\nShade leans back in her seat, giving a slight nod to the chair across from her. <i>“So, now that we’re square, what do you say you buy me a drink to celebrate - or do you have something else in mind?”</i>");
	flags["SHADE_PAID_YOU"] = 1;
	pc.credits += 20000;
	shadeMenu();
}

public function shadeApproach():void
{
	if(flags["SHADE_ON_UVETO"] != undefined)
	{
		shadeUvetoBarApproach();
		return;
	}
	
	clearOutput();
	
	// Shade left for Uveto Hotfix!
	if(flags["MYRELLION_PROBE_CASH_GOT"] != undefined && (flags["TOLD_SHADE_SHES_YER_SIS"] != undefined || flags["SHADE_PAID_YOU"] != undefined || flags["SEXED_SHADE"] != undefined))
	{
		if(flags["TOLD_SHADE_SHES_YER_SIS"] != undefined)
		{
			output("Before you get the chance to approach her, Shade stands up and leaves in a hurry, not once looking up or making eye-contact with you. She is obviously in a hurry... off to Uveto like she said she would, you guess.");
			
			processTime(2);
		}
		else
		{
			output("Before you get the chance to approach her, Shade stands up, throws on her duster and adjusts her utility belt. She is obviously in quite a hurry to leave...");
			output("\n\n<i>“Hey, Steele,”</i> Shade greets you soon as she makes eye contact with you. <i>“Sorry I can’t stay and chat. I’ve been on this dust ball for a long enough");
			if(flags["SHADE_PAID_YOU"] != undefined) output(" -- my job here is done, my bounty’s been collected,");
			output(" and I’m having that maternal urge to meet my family back home.”</i>");
			output("\n\nYou ask her where exactly she is off to.");
			output("\n\n<i>“On the frozen ice ball known as Uveto VII,”</i> she says as she walks by.");
			if(!uvetoUnlocked()) output(" <b>Your codex beeps when you receive the coordinates to location of the moon and its station.</b>");
			output(" <i>“Feel free to come by and pay me a visit. " + (flags["SEXED_SHADE"] != undefined ? ("We can have a lot of fun together, " + pc.mf("handsome", "cutie", true) + ".") : "Would be nice to have company over.") + "”</i> With that, she leaves the bar and out of your view.");
			
			processTime(4);
		}
		output("\n\n");
		
		if(flags["UVETO_UNLOCKED"] == undefined) flags["UVETO_UNLOCKED"] = 1;
		if(flags["SHADE_ON_UVETO"] == undefined) flags["SHADE_ON_UVETO"] = 1;
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	showShade();
	//Repeat, Not Sex’d
	if(flags["SEXED_SHADE"] == undefined)
	{
		output("<i>“Hey, Steele,”</i> Shade says, giving you a friendly nod towards the chair across from her. You take a seat across from the kaithrit, and she closes down the holo terminal between you, dropping it like a veil so that you can see each other.");
		output("\n\n<i>“So,”</i> she says, leaning back and lacing her fingers behind her head, <i>“What can I do for you?”</i>");
	}
	//Repeat, Sex’d
	else
	{
		output("<i>“Steele,”</i> Shade says by way of greeting, flicking off her holo terminal and pushing the other chair out for you. You take your seat and Shade leans back in hers, shifting so that her ample bust strains the front of her shirt in a wonderfully eye-catching way.");
		output("\n\n<i>“So,”</i> she says after a moment, <i>“Up for a couple drinks, kid? Or do you have something else in mind?”</i> she asks, with a visible glint in her eye.");
	}
	shadeMenu();
	if(flags["SHADE_INSEMINATION_COUNTER"] != undefined && flags["SHADE_INSEMINATION_COUNTER"] >= 20)
	{
		clearMenu();
		addButton(0,"Next",tailCuntOvipositionForShade);
	}
}

public function shadeMenu():void
{
	if(flags["SHADE_ON_UVETO"] != undefined)
	{
		shadeUvetoBarMenu();
		return;
	}
	
	clearMenu();
	addButton(0,"Talk",talkToShadeAbootStuff,undefined,"Talk","Chat up Shade.");
	if(pc.lust() >= 33) addButton(1,"Sex",askShade4Sex,undefined,"Sex","Get into some mischief under the covers.");
	else addDisabledButton(1,"Sex","Sex","You aren’t aroused enough for that.");
	addButton(2,"Appearance",shadeAppearance,undefined,"Appearance","Take a good look at the cat-girl bounty hunter.");
	addButton(14,"Leave",mainGameMenu);
}

//Appearance
public function shadeAppearance():void
{
	clearOutput();
	showShade();
	output("Shade Irons is a tall, athletic woman in her mid thirties, with enough age and experience under her belt to show, but not damage her killer figure. She’s sporting a head of silver hair that runs just past her shoulders, parting at the top to make way for a pair of cute little cat ears, both of which are a little chewed up around the edges. She’s got tanned, sun-kissed skin over toned muscle and voluptuous curves: a pair of big, motherly hips and " + (!shade.canLactate() ? "E-cup" : "voluminous EE-cup") + " breasts take her tough exterior and meld it into something like out of an ultraporn holo.");
	output("\n\nShade’s wearing a bulky jet blue duster, covered in silvery circuits and lightningbolt patterns. Underneath it, she’s got a pair of scruffed up old jeans");
	if(flags["SHADE_ON_UVETO"] != undefined) output(" and a tan-colored sweater that hugs her curves nicely, subtly straining with every breath");
	else output(", a shirt, and a low-cut ballistic vest loaded with body armor plates. Slung low on her hip is a bulky white hand cannon, loaded with an oversized JoyCo battery and a barrel almost long enough to reach Shade’s leg. A second gun, a compact little holdout pistol, is barely visible on the back of her belt.");
	output("\n\nBehind her, Shade’s sporting something a little different than the normal pair of kitty-tails her race possesses. A green-scaled reptilian tail coils out behind her,");
	if(flags["SHADE_ON_UVETO"] != undefined) output(" but it’s been stuffed into a full-body wool sock to protect it from the cold. You can just barely make out its shape.");
	else output(" tipped with a rosy pink slit that perfectly mimics a terran vagina, drooling with moisture as its lips spread and flick through the air.");
	if(flags["SEXED_SHADE"] != undefined) output("\n\nShe has a pussy of her own, wet and nicely accommodating, tucked between her legs. She has a single, tight little asshole between her taut buttcheeks, right where it belongs.");
	shadeMenu();
}

//Sex
public function askShade4Sex():void
{
	clearOutput();
	showShade(true);
	output("You ask Shade if she’d be up for a little fun.");
	output("\n\nShe eyes you up and down, a slight smile spreading on her lips. <i>“I might be. What do you say we get out of here - my ship’s parked just down the tarmac.”</i>");
	output("\n\n<i>“Lead the way,”</i> you say, standing.");
	output("\n\nShe laughs. <i>“I always do.”</i>");
	output("\n\nYou follow Shade out of the bar and back through the airfield, north towards one of the bigger hangars. She leads you over to a big, sleek MSXI with a pair of massive engines looming over the hull. The gangplank lowers automatically as you approach, and Shade flashes you a smile. Her long, reptilian tail flicks up, the wet tip caressing your arm as you follow her up. Its wandering crown slides down slowly, tickling your [pc.belly] before delving down to your [pc.crotch], ");
	if(pc.isCrotchExposed()) output("openly teasing your bare loins with its pussy-like lips");
	else output("teasing you through your clothes");
	output(".");

	output("\n\nHer tail’s motions are ceaseless, completely independent of its owner’s confident stride forward. The scaled length of cunt-tail coils around your waist and [pc.leg], playful and alluring, actually managing to pull some of your gear away. Its dexterity is incredible");
	if(pc.hasCuntTail()) output(" - something your own tail-pussy could learn from -");
	output(" as it starts to peel away your [pc.gear]");
	if(!pc.isNude()) output(", working to strip you bare as you walk");
	output(".");

	output("\n\nIt’s a short trip to Shade’s bunk, but you’re buck naked by the time you reach it. The kaithrit huntress gives you a lascivious wink over her shoulder as she pops the door open and guides you through. Her quarters are cluttered, a random assortment of clothes, gun parts, and chunks of armor scattered across the floor beneath punk rock posters and kaithrit grav-balls. In one fluid motion, she faces you, slips her arms out of her jacket sleeves, and pulls her shirt off over her head, giving you an eyeful of big, E-cup tits barely restrained by a black sports bra.\n\nShade takes a single step towards you, pressing herself tight against you, letting you feel those lush mounds compress against your [pc.chest]... before she gives you a rough shove onto the bed, sending you tumbling onto your back. Her pants hit the deck with an audible <i>thump</i> of a gunbelt clattering on steel before she hops in after you, straddling your [pc.hips] and slipping a hand under her bra to cup her breast, slipping the garment off to reveal the sun-kissed mounds beneath it, and letting a slim silver necklace fall free, dangling over you.");
	output("\n\n<i>“Now then,”</i> Shade purrs, <i>“what to do with you...?”</i>");
	
	processTime(15);
	moveTo("602");
	
	//Shade’s Scenes go Here
	shadeSexMenu();
}

//Talk
public function talkToShadeAbootStuff():void
{
	clearOutput();
	showShade();
	output("You ask Shade if she wouldn’t mind just talking for a bit.");
	output("\n\n<i>“Sure, " + (shadeIsLover() ? pc.mf("handsome", "beautiful") : "kid") + ",”</i> she says with a slight shrug. <i>“What’s on your mind?”</i> ");
	shadeTalkMenu(talkToShadeAbootStuff);
}

public function shadeTalkMenu(arg:Function):void
{
	clearMenu();
	//Family
	if(arg == talkToShadeAboutTailCunt) addDisabledButton(0,"Tail","Tail","You just talked about that.");
	else addButton(0,"Tail",talkToShadeAboutTailCunt,undefined,"Tail","Ask her about her odd tail.");
	//Her Ship
	//PC must have been to Shade’s ship (ie, prolly fucked her).
	if(flags["SEXED_SHADE"] != undefined)
	{
		if(arg == talkAboutShadesShip) addDisabledButton(1,"Her Ship","Her Ship","You just talked about that.");
		else addButton(1,"Her Ship",talkAboutShadesShip,undefined,"Her Ship","Ask her about her ship.");
	}
	else addDisabledButton(1,"Her Ship","Her Ship","You don’t know enough about Shade to broach this topic yet.");
	//Family
	if(arg == talkToShadeAboutHerFamily) addDisabledButton(2,"Family","Family","You just talked about that.");
	else
	{
		if(!shadeIsSiblings()) addButton(2,"Family",talkToShadeAboutHerFamily,undefined,"Family","Ask her about her family.");
	}
	//Lightning Gear
	if(arg == lightningGearShadeTalk) addDisabledButton(3,"Lightning","Lightning","You just talked about that.");
	else addButton(3,"Lightning",lightningGearShadeTalk,undefined,"Lightning","Ask her about her lightning theme.");
	//Runes
	//Must have talked about Lightning Gear and Family first
	if(flags["SHADE_TALKED_ABOUT_LIGHTNING"] != undefined && flags["SHADE_TALKED_ABOUT_FAMILY"] != undefined)
	{
		if(arg == runesYouTurdShade) addDisabledButton(4,"Runes","Runes","You just talked about that.");
		else addButton(4,"Runes",runesYouTurdShade,undefined,"Runes","Ask her about the runes she’s got all over.")
	}
	else addDisabledButton(4,"Runes","Runes","You don’t know enough about Shade to broach this topic yet.");

	if (flags["SHADE_BOOBWORSHIP"] != undefined)
	{
		if (flags["SHADE_TALKED_ABOUT_MODS"] == undefined)
		{
			if (arg == talkToShadeAboutMods) addDisabledButton(5, "Mods", "You just talked about that.");
			else addButton(5, "Mods", talkToShadeAboutMods, undefined, "Mods", "Ask Shade if she’s ever thought about getting some mod work done... especially for those rockin’ tits of hers. You can only imagine suckling some rich, creamy milk from them...");
		}
		else
		{
			if ((!shade.canLactate() || shade.milkType != GLOBAL.FLUID_TYPE_MILK) && (pc.hasItemByClass(Lactaid) || pc.hasItemByClass(MilkCaramelGushers, 5)))
			{
				addButton(5, "Mods", gibShadeModItems, undefined, "Mods", "Give Shade some mod goodies.");
			}
			else if (shade.milkType != GLOBAL.FLUID_TYPE_HONEY && (pc.hasItemByClass(Honeyizer) || pc.hasItemByClass(Honeydew)))
			{
				addButton(5, "Mods", gibShadeModItems, undefined, "Mods", "Give Shade some mod goodies.");
			}
			else if (shade.milkType != GLOBAL.FLUID_TYPE_CHOCOLATE_MILK && pc.hasItemByClass(Chocolac))
			{
				addButton(5, "Mods", gibShadeModItems, undefined, "Mods", "Give Shade some mod goodies.");
			}
			else
			{
				addDisabledButton(5, "Mods", "Mods", "You don’t have anything to give Shade.");
			}
		}
	}
	else
	{
		addDisabledButton(5, "Mods", "Mods", "You need to get hands on with Shades chestpillows before talking to her about modding ‘em up some.");
	}

	addButton(14, "Back", shadeApproach);
	
	if(flags["SHADE_INSEMINATION_COUNTER"] != undefined && flags["SHADE_INSEMINATION_COUNTER"] >= 20)
	{
		clearMenu();
		addButton(0,"Next",tailCuntOvipositionForShade);
	}
}

//Tail Cunt
public function talkToShadeAboutTailCunt():void
{
	clearOutput();
	showShade();
	output("<i>“So, what’s the story there?”</i> you ask, nodding towards the parasitic tail");
	if(flags["SHADE_ON_UVETO"] == undefined) output(" sprawled out in the seat beside her");
	else output("nestled in her lap");
	output(". As if prodded, the");
	if(flags["SHADE_ON_UVETO"] == undefined) output(" pussy-lipped tip peeks up, twisting in the air");
	else output(" sock-wrapped tip peeks up, wiggling blindly in the air until Shade settles it with a soothing pat");
	output(".");
	output("\n\n");
	if(flags["SHADE_ON_UVETO"] == undefined) output("Shade chuckles, patting it on the head. ");
	output("<i>“This old thing? Picked her up on Florus, tracking down a real bastard of a kui-tan. A gene modder, been experimenting with some kinda mind control he slipped into designer modifications. Used people like meat puppets to pull off robberies and worse, and they never remembered it come morning. Hell of a thing. Open bounty went up for him after he knocked over a couple of big-name casinos on New Vegas, and I picked up his trail heading back to the kui-tan homeworld. I managed to track him down to his labs on a trail of whores and drugs, but he had some... unique guard dogs waiting for me. Didn’t he, girl?”</i>");
	output("\n\nHer tail coils around her arm in response,");
	if(flags["SHADE_ON_UVETO"] == undefined) output(" its cunt-lips sucking up a pair of her fingers");
	else output(" brushing its lips against her arm through its protective sock");
	output(" and sending a shiver of pleasure through its owner. <i>“Had about a dozen of these girls wandering around the garden in the middle of his lab. I bumped into them, took a few out with the shocker here,”</i> she pats the lightning gun on her hip.");
	output("\n\n<i>“Few too many of ‘em, though, and this clever girl managed to get in behind me. Jumped up and bit me right in the ass, started burning into my skin. I got my backup gun out and put a bullet through her head while she was melding - took out a hunk from my back, too, just about paralyzed myself; I’ll admit I was panicking pretty hard. Eating a six-millimeter right in the middle of it must have fouled up whatever fuses a cunt-snake to your nervous system, because this new tail of mine’s got a mind of her own still. Don’t you, girl?”</i>");
	output("\n\nHer tail wriggles around her arm,");
	if(flags["SHADE_ON_UVETO"] == undefined) output(" drooling lube onto her leg");
	else output(" staining its sock with lube");
	output(". Shade chuckles and rubs it under what passes for a chin, just under its lips. <i>“Anyway, I managed to stop bleeding all over myself long enough to bust into the lab proper and pistol whip the doctor about five steps from his hover car door. Narrow catch, but the bounty set me up nice and cozy for the rest of the year.”</i>");
	output("\n\n<i>“So you decided to keep the tail?”</i>");
	output("\n\n<i>“Heh, ‘decided’ might be a little strong of a word. When she bit into me, my cat-tail burned off to make room. Hurt like a bitch. Didn’t feel right walking around without a tail, and while I had the doc tied down, my new one decided to feed on him. For a couple of hours. Good thing kui-tan are </i>productive<i>, because she has an insatiable appetite. After that, I figured I’d keep her around. She’s a pain sometimes, but I feel everything she does... and it’s pretty amazing.");
	if(pc.hasCuntTail() || pc.hasCockTail()) output(" You’d know, huh?");
	output("”</i>");
	processTime(4);
	shadeTalkMenu(talkToShadeAboutTailCunt);
}

//Kui-Tan Doc
//Gated behind the Tailcunt talk; PC must have completed KaraQuest 2.
public function kuitanDoc():void
{
	clearOutput();
	showShade();
	output("<i>“So, whatever happened to that kui-tan doctor you mentioned?”</i> you ask, thinking back to the huge-balled bastard you bumped into underneath the Black Void compound.");
	output("\n\nShade leans forward in her seat, resting her chin over laced fingers. <i>“Why, you thinking about turning some folks into mind-controlled puppets? Or maybe you’re just wondering where he got a crate full of pussy-snakes.”</i>");
	output("\n\nYou gasp as her tail coils around your [pc.leg], gently caressing you under the table.");
	output("\n\n<i>“No,”</i> you say, and quickly run down your encounter for her - making sure to leave out the part about Kara being there with you.");
	output("\n\nShe grunts noncommittally when you describe the mind-control tech the kui-tan you met was using. <i>“Your guess is as good as mine, kid. Hope you gave him a good kick in the nads for me.”</i>");
	if(pc.intelligence() + rand(20) > 40) output("\n\nSomehow, you get the feeling Shade’s not telling you the whole truth, but you doubt you’ll get much more from her now.");
	processTime(5);
	shadeTalkMenu(kuitanDoc);
}

//Her Ship
//PC must have been to Shade’s ship (ie, prolly fucked her).
public function talkAboutShadesShip():void
{
	clearOutput();
	showShade();
	output("<i>“That’s a killer ship you’ve got, you know.”</i>");
	output("\n\nShe smirks. <i>“In more ways than one, kid. But yeah, she’s a beaut. Nova designed her to be a rich playboy’s pleasure yacht, with enough kick to keep the little snots from getting kidnapped by the first pirate to stroll by. She’s not as fast as I’d like even after I stripped out half the crew space for engine mods, but good weapons and good shields make up for it, and I don’t plan on getting into too many ship chases anyway. I don’t have any delusions about being some kinda ace pilot.”</i>");
	output("\n\n<i>“MS-XIs are kind of expensive, too,”</i> you add.");
	output("\n\n<i>“Not that bad,”</i> Shade says with a mischievous glint in her eyes. <i>“Especially when you claim it off of some sleazebag slaver operating off of one of Rosha’s moons. Rich, arrogant bastard operated right in the limelight, playing off as some kind of billionaire investor in extranet dating. Half the guys you’d meet on his sites were his agents, see, and they’d scout out unsuspecting kids and spike the drinks of the prettiest ones. Next thing they know, they’re in a stockade being marched on stage for rich perverts to bid on.");
	output("\n\n<i>“One of his goons picked the wrong girl, though: a pretty twenty-something that happened to be the daughter of Pyrite’s last president who’d lied about who she was on her profile. You can imagine the size of the reward that went out for her safe return... and the bounty for the fella who took her. Had to beat some answers out of her crooked date, and do a little hacking on the side, but I figured out what was going on before long.”</i>");
	output("\n\nYou cock an eyebrow. <i>“Hacking?”</i>");
	output("\n\n<i>“What?”</i> Shade says, scowling, <i>“Just because I’m not a cutesy nerd with a comp-sci degree doesn’t mean I don’t know my way around a computer. Hell, half my job is tracking people down on the ‘net. Saves a lot of time versus beating the streets, especially between planets. I’m no master hacker like my mother was, but I can do a little computer wizardry.");
	output("\n\n<i>“So I hacked my way into the site, figured out what was going down and who owned the thing. Turns out he had a gala going on that night, a charity thing to ‘raise awareness for the victims of cybercrime.’ What a crock. So naturally I invited myself, found the host, and batted my eyelashes at him until I was tumbling onto his yacht with my skirts falling off faster than I could blink. Lucky me, he didn’t find the stun gun slung on my thigh till after he locked us in his cabin.”</i>");
	output("\n\nYou laugh as Shade makes an exaggerated <i>“ZAP”</i> sound. <i>“After that, well, let’s say I have my ways of making a naked, horny, and very confused kaithrit boy talk. Once I had a confession, I steered his ship right to his holding pens and saved the girl, all chivalrous like. I left the creep buck naked in his own slave pens for the cops to pick up. Not that there was much left of him by the time they got there.”</i>");
	output("\n\n<i>“");
	if(pc.isNice()) output("Sounds like a happy ending");
	else output("Sounds like he got what he deserved");
	output(",”</i> you chuckle.");
	output("\n\n<i>“More than you know. And let’s just say my new ship’s pleasure suite got plenty broken in before I got the girl back to her folks,”</i> Shade says with a proud grin.");
	processTime(5);
	shadeTalkMenu(talkAboutShadesShip);
}

//Family
public function talkToShadeAboutHerFamily():void
{
	clearOutput();
	showShade();
	
	//PC hasn't revealed Sibling status.
	if(flags["SHADE_ON_UVETO"] != undefined)
	{
		output("<i>“So, you have any family, Shade? Other than Astra, that is.”</i>");
		output("\n\n<i>“Everybody’s got family,”</i> she chuckles. <i>“I didn’t just grow out of a pod, you know.”</i> ");
		output("\n\nYou");
		if(pc.isNice() || pc.isMischievous()) output(" roll your eyes");
		else output(" scowl");
		output(" and say that’s not what you mean.");
		output("\n\nShade smirks and leans back, crossing one leg over the other. <i>“Fine, fine. You want to know, then it’s your funeral. Standard sob story: dad didn’t stick around when I was a kid, some rich playboy that seduced my mother. She was a hacker, a real extranet hound, ended up working e-security for CassTech to make ends meet while I was growing up.”</i>");
		output("\n\n<i>“Was?”</i>");
		output("\n\n<i>“Was,”</i> Shade confirms. <i>“Mom passed a couple years ago. Anyway, never knew my dad, but I didn’t miss him. My mother was a good woman, more than enough parent for me. Heh, I hope I was half as good a mom as she was... but I guess I know better.”</i>");
		output("\n\nShade chuckles, then sighs. <i>“I had my baby girl when I was real young. Barely past eighteen -- probably the only time </i>my<i> mom threatened to kill me. And I got plenty of shit bringing her up, too, since she’s half-ausar to boot. Between being so young, and having a job that kept me on the road... I wasn’t around as much as I’d have liked. Left most of the raising part to the Stormguard temple whenever I was off-world.”</i>");
		output("\n\nCurious, you ask if Shade wouldn’t mind talking a little more about Astra’s father.");
		
		// Didn't meet Shade in KQ2:
		if(flags["KQ2_SHADE_ENCOUNTERED"] == undefined)
		{
			output("\n\nShade flashes you a grin. <i>“Her </i>other mother<i> you mean. Her sire, as terms go these days. Met her when I was just starting out in the hunter business; she was leading a crew of construction drones on a kaithrit colony, and they’d turned up my next lead while excavating: a body, buried in the jungle. Nasty business. She was older than me, and bigger, but just enough to take the lead and buy me a drink the next time I talked to her. One thing led to another, as they say, and by the time I’d brought in my quarry I was starting to show. One night, one time, without protection and look what happens. Still, I wouldn’t change a thing... I love my little girl and, I’ll be honest, I see her sire from time to time. We stay friends, though she was too much of a play-girl to commit more than that. Has a trail of bastards behind her other than mine, I hear.”</i>");
		}
		// Met Shade in KQ2:
		else
		{
			output("\n\n<i>“Amara? Well, you’ve met her,”</i> Shade chuckles, leaning back and rubbing at her tail’s crown. <i>“She’s a huge bruiser of an ausar, bigger and taller and older than I am. Enough to take the lead when I met her, all those years ago... in more ways than one. For a woman as beautiful as she is, sure has a dominant streak. Must be what makes her such a great pirate lord.”</i>");
			output("\n\nShe laughs, then looks you in the eye. <i>“You want to get to know her, you’ll have to talk to her again. Who knows -- if I put in a good word, she might not shoot you on sight.”</i>");
			output("\n\nYou can tell she’s teasing, but the subtle threat isn’t lost on you. You didn’t make any friends that day on Myrellion");
			if(flags["KQ2_BETRAYED_KARA"] != undefined) output(", even if you did turn on Kara in the end");
			output(". For the moment, though, you ask if Shade has anything she’d be willing to share nonetheless.");
			output("\n\n<i>“Hm. Alright, I’ll bite. What’s the harm? As far as she’s told me, Amara’s the granddaughter of one of the Void’s founders. Aldus or Aedus or something like that. Real big badass from centuries ago, made a fortune in the early Rushes. Practically established his own empire, the way Amara tells it. No idea who her parents are, though; never mentioned ‘em. At this point I assume she popped out of her grandpa’s head like Athena. She commanded a warship for a bit, a heavy cruiser, around the time I met her first. Masquerades as some kinda construction crew while she scouts out planets and ships to raid -- ‘course I didn’t know that then.”</i>");
			output("\n\nShade didn’t know Amara was a pirate when they first got together?");
			output("\n\nShe snorts. <i>“God, no. Never woulda touched her if I had. When we met, she was a smooth-talking, confident amazon. A real hunk of ausar. Heh, she knew how to treat a girl right, too... but no, I didn’t know. Just about had a heart attack when I found out... when I was seven months pregnant. Came this close to shooting her; instead, I made a choice for my baby girl. I guess it was the right one -- she loves Amara, and I wouldn’t deprive her of that for the world.”</i>");
			output("\n\n<i>“And before you ask... I worried about the influence Amara would have on our daughter, sure, but when you actually get to know her... she’s a decent woman, all in all. She does things I don’t think even she’s proud of, but when she’s off the clock, Amara’s as amicable and lovely as can be. If she’d just stick around for more than a day or two at a time, I’d almost call her a decent parent. Certainly not a bad influence. Maybe even a better one than I am.”</i>");
			output("\n\nSomehow, you find that hard to believe.");
			output("\n\nShade shrugs. <i>“What do you want me to say, kid? I’ll tolerate a pirate in my ranks if it means my daughter gets to grow up happier. It could be a lot worse.”</i>");
			
			processTime(3);
		}
	}
	else
	{
		var metSaendra:Boolean = flags["SAEN MET AT THE BAR"] != undefined;
		
		output("<i>“So, you have any family, Shade?”</i>");
		output("\n\n<i>“Everybody’s got family,”</i> she chuckles. <i>“I didn’t just grow out of a pod, you know.”</i>");
		output("\n\nYou ");
		if(pc.isNice() || pc.isMischievous()) output("roll your eyes");
		else output("scowl");
		output(" and say that’s not what you mean.");
		output("\n\nShade smirks and leans back, crossing one leg over the other. <i>“Fine, fine. You want to know, then it’s your funeral. Standard sob story: dad didn’t stick around when I was a kid, some rich playboy that seduced my mother. She was a hacker, a real extranet hound, ended up working e-security for CassTech to make ends meet while I was growing up.”</i>");

		output("\n\n<i>“Was?”</i>");

		output("\n\n<i>“Was,”</i> Shade confirms. <i>“Mom passed a couple years ago. Anyway, never knew my dad, but I didn’t miss him. My mother was a good woman, more than enough parent for me. Heh, I hope I was half as good a mom as she was.”</i>");

		output("\n\nYou cock an eyebrow, and Shade chuckles. <i>“I was getting to that, but yeah, I’ve got a girl of my own. She’s about your age, I’d guess, maybe a little younger. Had her real early, barely past eighteen - probably the only time </i>my<i> mom threatened to kill me. And I got plenty shit bringing her up, too, since she was half-ausar to boot.”</i>");

		output("\n\n<i>“Her father was an ausar?”</i> you ask");
		if(metSaendra) output(", thinking back to Saendra and suddenly hoping you haven’t accidentally fucked both Shade and her daughter");
		output(".");

		output("\n\nShade flashes you a grin. <i>“Her </i>other mother<i> was, yeah. Met her when I was just starting out in the hunter business; she was leading a crew of construction drones on a kaithrit colony, and they’d turned up my next lead while excavating: a body, buried in the jungle. Nasty business. She was older than me, and bigger, but just enough to take the lead and buy me a drink the next time I talked to her. One thing led to another, as they say, and by the time I’d brought in my quarry I was starting to show. One night, one time, without protection and look what happens. Still, I wouldn’t change a thing... I love my little girl and, I’ll be honest, I see her sire from time to time. We stay close, though she was too much of a play-girl to commit more than that. Has a trail of bastards behind her other than mine, I hear.”</i>");

		output("\n\n<i>“This daughter of yours have a name, by the way?”</i>");
		if(metSaendra) output(" you press, crossing your fingers under the table.");

		output("\n\n<i>“Astra. Astra Irons. I’d say I hope you get to meet her sometime, ");
		if(flags["SEXED_SHADE"] != undefined) output("but knowing you, I’d have to kill you afterwards");
		else output("but I’d rather not have to kill you down the line");
		output(",”</i> Shade laughs, though there’s a noticeable edge in her voice.");
		if(metSaendra) output(" Well, at least it’s not Saendra....");
	}
	
	processTime(6);
	flags["SHADE_TALKED_ABOUT_FAMILY"] = 1;
	
	shadeTalkMenu(talkToShadeAboutHerFamily);
}

//Lightning Gear
public function lightningGearShadeTalk():void
{
	clearOutput();
	showShade();
	output("<i>“So, what’s up with the lightning motif?”</i> you ask, pointing a finger at the lightning bolts and old-earth runes emblazoned on her blue duster.");
	output("\n\n<i>“It’s stylish as fuck, that’s what,”</i> Shade laughs. <i>“Picked the duster up from a leithan girl with the biggest tits I’ve ever seen while I was on New Texas for some, heh, R-and-R a few years back. Biggest lightning storm you’ve ever seen rolled in right after I got there, grounded all craft and tore the ranches up pretty nasty. Apparently it’s a regular thing around there, thanks to the rolling flat plains that stretch out forever. I bought this, stepped outside, and immediately got hit with lightning. I kid you not, two steps from the store and ZAP from heaven. Probably would have roasted me if I hadn’t been wearing this.”</i>");
	output("\n\nFor emphasis, Shade rubs her knuckles across the smooth surface of the duster, indicating a pretty nasty scorch pattern around the shoulders. <i>“Been a kind of lucky charm ever since. Plus its decent against stun guns and all sorts of zappers. Not too many people carry ‘em, but a little extra protection doesn’t hurt.");
	output("\n\n<i>“As for the lightning gun,”</i> she says, drawing the cannon from her hip with deliberate slowness and setting it out on the table between you. Your eyes are drawn instantly to the pattern of faintly-glowing runes engraved along the barrel, matching those on the fringe of her duster and vest. <i>“Lothar Inc. Arc Caster. Experimental prototype I picked up on a job, took it off a target. Supposed to be for crowd control, totally non-lethal, but packs enough charge to burn through shields and knock a target out cold. Best thing about it, though, is the ‘arc’ part. Bolts jump from one target to another, if you aim it right. That got it disqualified from actual police work, but when you’re a solo hunter bagging bastards like I do, it’s a godsend. Solid gun, as long as I don’t run into somebody else with a lightning duster like mine. But I’ve got a six-mil holdout in reserve, just in case.”</i>");
	flags["SHADE_TALKED_ABOUT_LIGHTNING"] = 1;
	processTime(3);
	shadeTalkMenu(lightningGearShadeTalk);
}


//Runes
//Must have talked about Lightning Gear and Family first
public function runesYouTurdShade():void
{
	clearOutput();
	showShade();
	output("<i>“Any reason for the rune motif?”</i> you ask, pointing to the sigils stitched across Shade’s vest. You’ve seen similar ones on the fringe of her duster ");
	if(flags["SEXED_SHADE"] == undefined) output("and her gun");
	else output(", her gun, and even the silver necklace hanging between her breasts");
	output(". They all look like something you’d find in an old-earth museum, or else some kind of fantasy game.");

	output("\n\nShade chuckles, picking at the hem of her coat as if to make sure the symbols are still there. <i>“There is. Though it’s a long story.”</i>");
	output("\n\nYou tell Shade you’ve got time, and make yourself comfortable.");
	output("\n\n<i>“Suit yourself,”</i> she says, reclining in her chair and waving a waitress over with a couple of drinks. <i>“Have to go way back for this. I was... eighteen, maybe nineteen, just starting out as a bounty hunter. I thought I was at the end of my career, too. Thought my life was over, really. I’d just found out I was pregnant with Astra, her father was nowhere to be found, and my mother was threatening to disown me or kill me or whatever else. It was terrifying at the time.”</i>");
	output("\n\nShe shakes her head at herself as the waitress drops off her drinks. Shade takes a long swig from her mug, letting out a hiss of a breath afterwards. <i>“So I was afraid. Scared shitless, really. Between my mother throwing me out, and the woman I thought was my lover abandoning me, I decided to stow away on a ship and just... leave. I had to get away from home. It was my first time in space, huddled up in a half-empty supply crate headed for the far edge of the frontier. Ended up on");
	if(flags["SHADE_ON_UVETO"] == undefined)
	{
		output(" a god-forsaken ice ball of a moon called Uveto VII, owned by those little bastards.”</i> She points to ");
		if(flags["MET_BRILLIG"] != undefined) output("Madame Brillig.");
		else output("a tiny, stuffed-animal-like creature sitting in the bar.");
	}
	else output(" this frozen iceball here.”</i>");
	output("\n\n<i>“I woke up in a church, laid up beside a fire and covered in blankets. Apparently I lost consciousness in the cold, sitting in a warehouse out in the open for half a day. Nearly died before somebody heard me shivering in a crate and crowbarred it. I was lucky I didn’t lose my baby, not to mention a few extremities.");
	if(flags["SHADE_ON_UVETO"] == undefined) output(" A human religious sect on-world took me in after the docs were finished with me. Uveto was");
	else output(" The temple took me in after the docs were finished with me. Uveto is");
	output(" a protectorate-world, and I’d be in big trouble for sneaking in, they said, as if stowing away on a ship was nothing. I didn’t have much choice but to stay with them: I was weak, half-starved, and didn’t stop shivering for days.”</i>");
	output("\n\nShade finishes her drink, knocking back the rest of the mug and slamming it down on the table, hard enough to make you jump. <i>“Better them than the ausar, I guess. ");
	if(pc.isAusar()) output("Uh, no offense. ");
	output("Planet was lousy with them, all heavy-set and snowy-haired. I guess they must have been the main colonists, since there were only a few hundred humans I ever saw. No kaithrit in sight, but then, we tend to colonize in the opposite direction of the Federation if we can. Not much good blood between ausar and kaithrit... heh, says the woman with a half-ausar kid. Sorry, I’m rambling, I know. You wanted to know about these runes, right?");
	if(flags["SHADE_ON_UVETO"] == undefined) output(" Well, the church that took me in was some kind of old-Terra-style pagan sect, thought they’d found the promised land on a stormy ball of ice. Neo-norse, some of the locals called ‘em. I don’t know much about terran mythology, but the cult - the Stormguard - were obsessed with their thunder god. They told me the only way I’d ever get off the planet was by joining them, to squeeze through the same legal loopholes they did to exist on an otherwise locked-down world. I figured, ‘what the hell?’, and joined up.");
	output("”</i>");
	if(flags["SHADE_ON_UVETO"] == undefined)
	{
		output("\n\nYou cock an eyebrow at that. <i>“So you were part of a cult?”</i>");
		output("\n\n<i>“Am part,”</i> Shade corrects with a little smirk, pulling ");
	}
	else
	{
		output("\n\n<i>“Well, the church that took me -- the Stormguard -- their temple is just north of here, down the street a ways. They’re a Terran faith, old-guard pagans that thought they’d found the promised land on this stormy ball of ice. Neo-norse, some of the locals called ‘em. I don’t know much about terran mythology, but the church is obsessed with their thunder god. They told me the only way I’d ever get off the planet was by joining them, to squeeze through the same legal loopholes they did to exist on an otherwise locked-down world. I figured, ‘what the hell?’, and joined up.”</i>");
		output("\n\nYou cock an eyebrow at that. <i>“So you joined a cult?”</i>");
		output("\n\n<i>“Sure did,”</i> she grins, pulling ");
	}
	if(flags["SHADE_CULT_TALK"] != undefined) output("her necklace out as a reminder.");
	else 
	{
		output("a small, silver necklace out from her shirt. It looks like a vertical bar pierced by a triangle, sort of like a sideways hat.");
		flags["SHADE_CULT_TALK"] = 1;
	}
	output(" <i>“I told their leader I didn’t buy into the whole gods and giants thing, but he just smiled at me and nodded, all fatherly understanding. Said belief wasn’t what mattered, but the way you behaved. He told me about their philosophy, honor in battle, wisdom before action. They preached self-empowerment and courage more than gods; hell, some of the oldest members confessed to me while I was there that </i>they<i> didn’t believe in the gods, but they liked the message. I suppose I could have picked a worse religion to fall in with than one that encouraged me to be a warrior, even trained me. Plus they" + (flags["SHADE_ON_UVETO"] == undefined ? " had" : "’ve got") + " a pretty serious fertility and sex-potency undertone going on, so it didn’t hurt that I came to them with a kid on the way.”</i>");
	if(flags["SHADE_ON_UVETO"] == undefined) output("\n\n<i>“You talk like you stayed there for a while. Didn’t you join up just to leave?”</i>");
	else output("\n\n<i>“Didn’t you join up just to leave? What’re you still doing here?”</i>");
	output("\n\nShade chuckles. <i>“I did. But it dawned on me I didn’t really have anywhere to go. I was too afraid to go " + (flags["SHADE_ON_UVETO"] == undefined ? "home" : "back to Rosha") + ", and I wasn’t exactly well to do back then. Not like now, that’s for sure. Plus I was pregnant, and starting to show. I wasn’t going to be doing much bounty hunting while waddling around " + (flags["SHADE_ON_UVETO"] == undefined ? "in a couple months" : "with a big baby belly") + ". So yeah, I stayed with them. For a couple of years, actually. I had Astra, then went in for their warrior training. It was grueling, near military, and all about discipline and keeping cool under pressure. I’ll tell you this: I was a better woman for it, and a better hunter when I set out again. When I decided to go, they sent me off with a feast and well wishes, loaded me down with rune-carved gear and presents for my little girl.”</i>");
	output("\n\nYour companion gets a wistful look in her eyes, staring far away as she finishes. <i>“");
	if(flags["SHADE_ON_UVETO"] == undefined) output("I still go back from time to time, either to Uveto or their other churches scattered all over.");
	else output("That’s why I moved back, I guess. When it came time to start putting my roots down, this place always felt like home more than anywhere else.");
	output(" Like I said, I don’t buy into the higher powers shit, but I... heh, I guess I just like being part of something. Makes me feel good, and gives me something to believe in, even if it’s just philosophical. You can understand that, right?”</i>");
	
	processTime(7);
	
	CodexManager.unlockEntry("Stormguard");
	
	shadeTalkMenu(runesYouTurdShade);
}

//Set to 1 on insemination. Counts up every hour. Resets on its own after a week.
public function inseminateShadesCuntTail():void
{
	if(pc.virility() <= 0) return;
	
	if(flags["SHADE_INSEMINATION_COUNTER"] == undefined)
	{
		flags["SHADE_INSEMINATION_COUNTER"] = 1;
		pc.clearRut();
	}
	IncrementFlag("SHADES_CUNTTAIL_FED");
}

//Tailcunt Oviposition
//Unlock after PC’s boned Shade’s tailcunt. Now it can get preggers! 
//Play near/at the end of Tailcuntpreggers time, at the end of any Talk scene. If no scene triggered any time near due date, egg is laid without PC intervention. 
public function tailCuntOvipositionForShade():void
{
	clearOutput();
	showShade();
	output("As you’re thinking about where to take the conversation next, your kaithrit companion suddenly sucks in a sharp breath and puts a hand on her belly. Shade leans back in her seat, groaning and loosening her vest a bit. You’re about to ask if she’s feeling sick when she turns to her wriggling, green-scaled tail and mumbles");
	if(flags["SHADE_ON_UVETO"] != undefined) output(" into its protective sock");
	output(" <i>“Really? Right now... in the middle of a conversation?”</i>");
	output("\n\nThe pussy-tail perks up, its head dancing from side to side emphatically.");
	output("\n\n<i>“For fuck’s... Ugh. Sorry, kid, I gotta go take care of something. </i>Your<i> something, probably.”</i> Shade shakes her head and slips out of her seat, throwing her great big blue duster over her shoulder. You grab her arm before she can get past you, cocking an inquiring eyebrow at her until she relents and adds, <i>“Guess the old girl here’s got some eggs to drop. Don’t wait up... this could take a while.”</i>");
	
	processTime(1);
	//[Go With] [Let Her Go]
	clearMenu();
	addButton(0,"Go With",goWithShadeToTakeCareOfBusinessYuSlut,undefined,"Go With","Ask Shade if she needs any help. Or at least, would like some company while she lays.");
	addButton(1,"Let Her Go",takinCareOfBusinessEveryDayWithShadeSheWorksForUPS,undefined,"Let Her Go","Let Shade take care of business.");
}

//Let Her Go
//Let Shade take care of business.
public function takinCareOfBusinessEveryDayWithShadeSheWorksForUPS():void
{
	clearOutput();
	showShade();
	output("You release your lover’s arm, and she rewards you with a slight grin. <i>“Back in a while.");
	if(!pc.hasTailCunt()) output(" If you’re real lucky I might save one of her clutch for you.”</i> She leans in to your own quivering tailpussy and gives it a scratch. <i>“You’d like a little sister, wouldn’t you?");
	output("”</i>");
	output("\n\nShade passes you by with an affectionate squeeze of your shoulder, heading");
	if(flags["SHADE_ON_UVETO"] == undefined) output(" off to the women’s room.");
	else output(" towards her home with an obvious urgency in her step.");
	
	processTime(3);
	flags["SHADE_INSEMINATION_COUNTER"] = undefined;
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Go With
//Ask Shade if she needs any help. Or at least, would like some company while she lays.
public function goWithShadeToTakeCareOfBusinessYuSlut():void
{
	clearOutput();
	showShade();
	output("<i>“Need a hand?”</i> you ask, squeezing her hand affectionately. <i>“Like you said, they’re probably mine anyway.”</i>");
	output("\n\nYour lover thinks on it for a second, until another birthing pang makes her wince. <i>“Yeah, sure. ");
	if(flags["SHADE_GOT_HELP_WITH_LAYING"] == undefined)
	{
		output("I’m used to dealing with it alone, but I guess I wouldn’t mind the company");
		flags["SHADE_GOT_HELP_WITH_LAYING"] = 1;
	}
	else output("You were a peach last time, after all");
	output(".”</i>");

	output("\n\nShade gives you a hand up and turns on a heel");
	if(flags["SHADE_ON_UVETO"] == undefined)
	{
		output(", away from the women’s room towards the tarmac. It’s a quick walk from the bar to the airfield");
		currentLocation = "602";
	}
	else
	{
		output(" towards the stairs out of the bar. It’s a quick walk from the tavern back to her home");
		currentLocation = "UVI P30";
	}
	generateMap();
	output(", though even in that short time, you can see Shade becoming progressively more uncomfortable: the hand not holding yours rarely leaves her belly, and her pace becomes erratic as you near her");
	if(flags["SHADE_ON_UVETO"] == undefined) output(" ship");
	else output(" doorstep");
	output(". A grimace is plastered on her face by the time the two of you are");
	if(flags["SHADE_ON_UVETO"] == undefined) output(" aboard");
	else output(" going downstairs");
	output(", and a bit of sweat sheens her brow.");
	if(flags["SHADE_ON_UVETO"] != undefined) output(" You have to steady her more than once on the way down; her tail curls around your thigh, trying on its own to help its mistress keep herself upright.");
	
	processTime(15);
	flags["SHADE_INSEMINATION_COUNTER"] = undefined;
	
	clearMenu();
	addButton(0,"Next",helpShadeLayHerEgg2);
}

public function helpShadeLayHerEgg2():void
{
	clearOutput();
	showShade();
	output("Before she gets started, though, Shade");
	if(flags["SHADE_ON_UVETO"] == undefined) output(" grabs her tail by its bulbous");
	else output(" yanks the sock off her tail’s wriggling");
	output(" head and brings it around to stare her straight in the face. Or as close as it can, given that it’s tip is it’s backside. ");
	if(flags["SHADE_ON_UVETO"] != undefined) output("\n\n");
	output("<i>“Think you could give me a little more warning next time?”</i> she growls at it. Her chastisement is cut short by a wince of discomfort, and she angles the tip down into the bucket");
	if(flags["SHADE_ON_UVETO"] != undefined) output(" with a contemptuous grunt");
	output(".");
	output("\n\nYou don’t think Shade’s in pain per se, but the expression on her face makes it clear she’s not in a good place. Her fingers dig into her bedspread, and she takes a slow, deep breath.");
	output("\n\n<i>“If you want to help... grab my tail and rub the tip. Help it relax.”</i>");
	output("\n\nThat you can do. You reach out with tentative hands, gently wrapping them around the bulbous crown of Shade’s reptilian tail. The squirming creature struggles in your grasp for a moment before your massaging fingers settle it down, lulling it into a fitful acquiescence. With the tail calmed, you begin to gently caress its length, massaging the head around the drooling pussylips. A bit of moisture trickles onto your fingers, letting you move along its polished scales easily. The length of her tail swells slightly after a moment, and Shade throws her head back with a low moan as the egg starts to move down the vaginal passage.");
	output("\n\nShade’s hand shifts up to her breast, cupping and squeezing through the straining fabric of her shirt. <i>“Oh, fuck, now we’re getting somewhere,”</i> she moans, breathing hard and grunting as she forces the egg down her tail. Femcum and lube squirts out of the tailpussy, slathering your hands and drenching the stuffing at the bottom of the bucket.");
	output("\n\nA mischievous grin spreads across your lips as your bear witness to Shade’s sexual moans. You shift the lips of her tail up to your mouth and let your [pc.tongue] play across them, licking her reptilian cunt its owner makes a cry of pleasure. The egg traveling down her passage starts coming faster in answer to your movements, sliding through her passage with increasing speed as you eat her tail-pussy out. Shade’s voice quavers as she moans, trying to tell you to either lick faster or fuck her - she wobbles in between extremes, her voice picking up to an ecstatic scream. You keep your [pc.tongue] moving quickly, teasing the hooded little clit near her tail’s broad tip until you can feel the lips spreading, parting around the thick, white surface of the cunt-snake’s egg.");
	output("\n\nShade screams as an orgasm rocking through her, spurred on by the egg cresting from her pussylips. You get your face out of the way and level her cunt-tail with the bin, letting the egg roll out of her twat and onto the thick layer of stuffing waiting for it. Shade groans and flops onto her back, breathing hard, hands on her belly.");
	
	// Very small chance if Astra's around:
	var astraWAT:Boolean = false;
	if(flags["SHADE_ON_UVETO"] != undefined && astraIsHome() && rand(5) == 0)
	{
		output("\n\n<i>“Mom!?”</i> you hear from the other room. You twist around just in time to see");
		if(flags["MET_ASTRA"] == undefined) output(" her red-eared daughter,");
		output(" Astra shoving the door open, one hand on her holster. She freezes when she sees you on the floor between her mother’s spread legs, tail-cunt juices and an egg sloshing in your hands and more splattered on your cheeks. Shade giggles and cups her hands to her mouth, blushing furiously -- a motion mimicked by her daughter a second later.");
		output("\n\n<i>“OH OKAY GROSS GOODBYE!”</i> Astra babbles, backpedaling right out the door and, if the loud bang that follows her is any indication, out of the house entirely.");
		output("\n\nShade erupts in laughter, flopping back on the bed with her hands around her emptied belly. <i>“Oh wow. Chock one up for ‘giving your daughter mental scars,’ captain.”</i>");
		output("\n\nYou can’t help but snicker, even as you’re drying the egg off.");
		
		astraWAT = true;
		if(flags["MET_ASTRA"] == undefined) flags["MET_ASTRA"] = 1;
		IncrementFlag("SHADE_OVI_ASTRA_RUN_IN");
	}
	
	output("\n\n<i>“Oof. Never get used to that,”</i> she laughs, running a hand through her silver hair. You cover the egg up with some fluff and crawl into bed beside your lover, slipping an arm around her waist. She gives you a wan smile, and her juicy tail caresses your [pc.leg].");
	
	processTime(15);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",helpShadeLayHerEgg3, astraWAT);
}

public function helpShadeLayHerEgg3(astraWAT:Boolean = false):void
{
	clearOutput();
	//Daytime Version
	if(hours >= 6 && hours < 20)
	{
		showShade();
		output("<i>“Was that everything you were hoping it would be?”</i> she asks after a while, sitting up and grabbing her duster. <i>“I’m going back to the bar, I think.");
		if(astraWAT)
		{
			output(" Try and find Astra before she vomits.");
		}
		output(" Coming?”</i>");
		output("\n\nYou nod and follow Shade back to the bar, hand in hand. As you walk, her tail curls around your waist, more affectionate than normal.");
		
		processTime(1);
		if(flags["SHADE_ON_UVETO"] == undefined) currentLocation = "609";
		else currentLocation = "UVI P32";
		generateMap();
		
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Night Version
	else
	{
		showShade(true);
		output("Shade gives a big yawn and stretches. <i>“I think that’s about taken everything out of me,”</i> Shade purrs, turning toward you with a slight smile. <i>“Thanks for the company, kid. That was... not bad.");
		if(astraWAT)
		{
			output("Though I’m sure Astra’s going to have my head off whenever she’s done vomiting.");
		}
		output("”</i>");
		output("\n\nShade shifts in bed, pulling her boots and pants off and making for the covers. <i>“You’re welcome to stay, as always,”</i> she offers, pulling her shirt off to give you a view of her big, soft love pillows. The thought of resting your head against them tonight is almost too much to resist. ");
		//[Stay] [Go]
		clearMenu();
		addButton(0,"Go",skipTownAfterHelpingThisSlootLayEggs);
		addButton(1,"Stay",stayWithShadeAfterLayingAnEgg);
	}
}

//[Go]
public function skipTownAfterHelpingThisSlootLayEggs():void
{
	clearOutput();
	showShade(true);
	output("You hop out of Shade’s bed and start gathering your");
	if(flags["SHADE_ON_UVETO"] == undefined) output(" [pc.gear]");
	else output(" scattered belongings");
	output(". The kaithrit shrugs and lies back, watching you until you’re ready to go.");
	output("\n\n<i>“Show yourself out, hmm?”</i> she purrs, giving you a parting smile before shutting off her light. You slip on out of the ship, and head out into the airfield.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//[Stay]
public function stayWithShadeAfterLayingAnEgg():void
{
	clearOutput();
	showShade(true);
	output("You tell Shade that you’ve got nowhere to be, which earns you a playful smile from the buxom kaithrit as she flips the lights off. ");
	if(pc.biggestTitSize() < 1) output("You feel a long, strong arm lock around your waist, and Shade’s cheek nuzzle against your [pc.chest].");
	else output("One of Shade’s arms slips under you, and you feel yourself being pulled over onto your side, planting your face squarely into the valley of her ample cleavage. You nuzzle in, getting comfortable on your makeshift pillows, and letting yourself slowly drift off to sleep in Shade’s arms, enjoying the embrace of her soft breasts and her overly affectionate tail.");
	clearMenu();
	addButton(0,"Next",stayWithShadeAfterLayingAnEgg2);
}
public function stayWithShadeAfterLayingAnEgg2():void
{
	clearOutput();
	showShade(true);
	
	//Pass 8 hours
	processTime(477);
	sleepHeal();
	
	output("You wake up a good while later, rested and relaxed, with a great big yawn to announce your waking. After a moment, you note a distinct absence of busty cat-girl in the bed, and the faint sound of running water beating down nearby. You take the opportunity to gather your [pc.gear] scattered all through the ship and get ");
	if(!pc.isNude()) output("dressed");
	else output("yourself re-equipped");
	output(". By the time you’re done, the shower’s turned off and Shade appears through her bathroom door, an open-faced towel draped from her shoulders, exposing her chest and sex for your viewing.");
	output("\n\n<i>“Still here?”</i> she teases, letting the towel fall to the ground as she strides over to her dresser, bending over to pull out a fresh pair of underwear, and giving you a view to die for. She gets dressed quickly, though not without giving you quite the show as she does so. When she’s done, Shade slips an arm through yours and gives you a rough pull out of her");
	if(flags["SHADE_ON_UVETO"] == undefined) output(" cabin");
	else output(" bedroom");
	output(". <i>“C’mon, can’t lounge around </i>all<i> day.”</i>");
	if(flags["SHADE_ON_UVETO"] == undefined)
	{
		output("\n\nYou chuckle and let yourself be led off the ship, following Shade back out to the airfield. Her ship seals tight behind you, and your lover gives you a final smack on your [pc.butt] before trotting off towards the tavern.");
	}
	else
	{
		output("\n\nBefore you know it, your lover has very adamantly planted you at her table, and the smell of sizzling eggs and bacon starts wafting through the house. A few minutes later a big, piping hot plate of breakfast is in front of you, followed by a lovely kaithrit sitting cross-legged and eating with one hand, reading off a datapad with the other. Considering the night’s events, there’s little need for small talkjust quiet companionship with your lover, punctuated by the occasional murmured headline from Shade’s datapad or her pussy-tail wandering up your [pc.leg] before one or the other of you swats it off.");
		output("\n\nWhen you’ve both had your fill, one of Shade’s canid drones pads into the room and lifts your plate off the table and carries it off to the sink. Shade cleans up after it, putting those surprising domestic skills of her on display as she whisks away any trace of mess and leaves you with a steaming mug in your hands to kick start your day.");
		output("\n\n<i>“Let’s get going,”</i> Shade offers, pulling you to your [pc.feet]. <i>“Much as I’d like to lounge around here all day, I’ve got business to chew through, and a powerful need for bar snacks and warm drink to do it.”</i>");
		output("\n\nWith an arm around your waist, Shade leads you up the stairs and back into the blowing gale of the Uvetan winds. Just before you step out, though, Shade pulls you into a quick kiss and gives you a final smack on your [pc.butt] before trotting off towards the tavern.");
		output("\n\n<i>“Till next time!”</i>");
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function shadeBoobWorship():void
{
	clearOutput();
	showShade(true);

	output("You can’t take your eyes off of the two perfect orbs of unblemished flesh looming over you, resting low on your lover’s chest and punctuated with a pair of broad, pink teats. The way your lover’s breasts rise and fall with her heavy, husky breaths fills you with lust; Shade coos and chews her lower lip as");
	if (pc.hasCock())
	{
		output(" your [pc.cocks] stiffen");
		if (pc.cocks.length == 1) output("s");
		output(", rubbing against her thigh.");
	}
	else output(" she feels the heat and moisture radiating off your [pc.cunt], grinding into her dark blue panties.");
	output(" <i>“Like what you see, junior?”</i> she grins, squeezing one of her breasts and rocking her hips against your crotch.");

	output("\n\nNodding eagerly, you reach up to run your fingers across her other tit, sinking them into Shade’s flawless flesh. She gives you an approving moan, tail riggling happily behind her. The parasitic appendages own pussy brushes wetly against your [pc.leg], subtly");
	if (pc.hasCock())
	{
		output(" creeping towards your throbbing prick");
		if (pc.cocks.length > 1) output("s");
	}
	else output(" searching for a nice, thick cock to gets its lips around");
	output(". The more your hands squeeze and cup her chest, the heavier Shade’s breathing gets, and the more her pair of cunts grind against you, seeking out every avenue of pleasure in your foreplay.");

	output("\n\n<i>“You really like big tits, huh?”</i> she teases, putting a hand over yours on her breast and shifting her knees forward, getting her chest positioned perfectly over your head.");
	if (shade.canLactate())
	{
		output(" <i>“Guess I should have expected that... after all, you’re the one who gave me these mods. So, want to put ‘em to use?");
	}
	else
	{
		output(" <i>“Good. I’m damn proud of mine... and I’ll let you in on a secret: I love having ‘em played with. Think you could do that for me?");
	}
	output("”</i>");

	output("\n\n<i>“");
	if (pc.isNice()) output("Definitely!”</i> you grin, giving her a playful squeeze.");
	else if (pc.isMischievous())
	{
		output("You better believe it!”</i> you say with a playful grin, pinching the nipple you’ve got your hand on until she sucks in a sharp breath");
		if (shade.canLactate()) output(" and squirts a bit of moisture onto your fingers");
		output(".");
	}
	else if (pc.isAss()) output("Damn straight,”</i> you tell her, squeezing her hard enough to make the huntress squeal.");
	output(" She flashes you a sultry smile and grabs your shoulders, pulling you up to a sitting position and mashing her chest into your face. You gasp and squirm, suddenly blinded and smothered by your lover’s chest. Shade takes the opportunity to adjust herself, moving up until she’s straddling your [pc.hips] and grinding her crotch against yours. Her cunt-tail reaches in behind to rub at your bare");
	if (pc.hasCock()) output(" cock");
	else output(" cunt");
	output(", teasing you relentlessly while Shade’s breasts batter your cheeks.");

	output("\n\nWhen the lusty kaithrit finally leans back, you’re treated to the intoxicating sight of two huge");
	if (shade.canLactate()) output(", milky");
	output(" breasts with diamond-hard nipples on full display, a mere inch from your [pc.lips]. You’re almost drooling with anticipation, yearning to taste the perky pink mountains");
	if (shade.canLactate()) output(" and the bounty of sweet, sweet [shade.milkNoun] within them");
	output(". Shade seems to wait for you to take the initiative for once, giving you the chance to wrap your hands around her tight ass and pull her back against you, drawing one of her prominent nipples right into your mouth.");

	output("\n\n<i>“There ya go,”</i> she groans, arching her back and pressing forward, squeezing her tit between your face and her chest. Shade’s arms wrap around your shoulders, letting you play with her ass and pussy to your heart’s content: she’s clearly focused on her boobs, of making sure you get as much of her teat into your mouth as you can, that the one you aren’t servicing is rubbing against your cheek, demanding attention. Your hands are drawn back up, around Shade’s motherly hips and up to her big, womanly bust again, squeezing hard");
	if (shade.canLactate()) output(" until a thick, squirting stream of [shade.milk] shoots into your mouth");
	output(". Shade moans, rolling her head back and letting out a feral grunt of pleasure. <i>“Just like that, kid... just like that,”</i> she breathes into your [pc.ear].");

	if (shade.canLactate())
	{
		output("\n\nYour lover clearly enjoys having her tits milked - she’d never admit it, but you’re pretty sure she likes having them nice and full of [shade.milkNoun], bigger and more sensitive than they ever were before, between sessions of letting you nurse your fill from her. As if to confirm your thoughts, you hear her breathe <i>“I feel like a new mother again,”</i> just on the edge of hearing. You lock your gaze on Shade’s bliss-filled face, squeezing her tit and sucking out a steady stream of her delicious [shade.milkNoun] until she gives a pleasured cry and presses her chest hard against your face.");
	}

	output("\n\nIt’s hard not to enjoy the feeling of your lover’s breast in your hands");
	if (shade.canLactate()) output(", the taste of her bounty trickling into your mouth");
	output(", the heat of her body as it presses against your own. Her crotch is a sultry inferno beside your own, radiating heat and desire until all you can think about");
	if (pc.hasCock() && !pc.hasVagina()) output(" is your own cock, so close to her slit... it would be effortless to slip it inside her, to join her in bliss");
	else if (pc.hasVagina() && !pc.hasCock())output(" is your pussy, soiling Shade’s panties with your sexual excitement as she grinds against you - then again, she’s in no better shape than you are, all but drooling through her undies as her body revels in its excitement");
	else output(" are your [pc.cocks] and [pc.cunts], overwhelming you in a mix of need and desire. What you wouldn’t give to rip those panties aside and slam yourself into Shade’s slit while you suckle, joining her in bliss");
	output(". As if reading your mind, Shade gives you a fierce grin, and you feel her hand slipping down to your crotch...");

	output("\n\n<i>“Fair’s fair,”</i> she insists, running her fingers along your sex. <i>“Switch tits for me, though?");
	if (!shade.canLactate()) output(" Other one’s feeling a little left out...");
	else output(" Starting to run dry there...");
	output("”</i>");

	output("\n\nThat’s a hell of a trade. You nod eagerly, popping off her well-sucked boob with a wet squelch");
	if (shade.canLactate()) output(" and a squirt of [shade.milkNoun]");
	output(". The other is just as succulent and alluring as the first, and when you start to tease your [pc.tongue] around her pink areola, her hand rewards you in the most pleasurable ways.");
	if (pc.hasCock())
	{
		output(" Shade’s slender, strong fingers wrap around your [pc.cock], giving you a few experimental pumps before starting to move your member. You shiver and let the cat-like amazon angle your prick back, caressing her toned thigh before she pulls the backside of her panties aside and lets your prick slip in under them.");

		output("\n\nRather than angling your [pc.cock] into her sweet little honeypot, though, Shade lets your cock run through the sodden lips of her vulva, then back behind her thighs and into the crack of her ample rear. Flashing you another grin, she lets her panties snap back, pressing your prick fiercely between her cheeks. Using you for support, Shade starts to move her big ol’ hips, using her backside like a silken, wet vice to fuck your prick.");

		output("\n\n<i>“Like it?”</i> she teases, pacing her movements to the same rhythm of your sucking. Damn, do you ever...");
	}
	else
	{
		output(" As she plays with you, Shade’s cunt-tipped tail slips up between her legs and eagerly seeks out a little pleasure for itself. <i>“Ah, wanna play, do you?”</i> she laughs, scratching the bulb at her tail’s tip under what passes for a chin before guiding it to your sex. The huntress favors you with a wink as she runs the wet tip of her tail against your [pc.cunt], sending shockwaves of pleasure through the both of you.");

		output("\n\n<i>“That’s more like it,”</i> Shade moans, rubbing her tail’s clit against your");
		if(pc.hasClit()) output(" own");
		else output(" slit");
		output(". You have to agree - and show your appreciation by running your tongue all over her breast, slathering her in a glistening glaze of spit");
		if (shade.canLactate()) output(" and [shade.milkNoun]");
		output(". Indeed, there’s a lot more to the amazonian’s perfect bust than just those nipples you’ve been worshipping.");
	}

	output(" You dig your fingers into Shade’s ample bosom, licking your tongue from one nipple all the way to the other, then down to the neglected undersides, finding your way around where her tits join her chest. The taste of her flesh, tinged with the sweat and excitement of your lovemaking, is exquisite: you moan lustily in appreciation, squeezing at Shade’s chest until");
	if (!shade.canLactate()) output(" she gasps with a mix of pleasure and pain");
	else output(" [shade.milk] squirts out all over your [pc.face]");
	output(". You grin with delight, and no small amount of pleasure thanks to Shade’s tireless ministrations.");

	output("\n\nBetween moans and shakes of her hips, Shade manages to murmur into your ear, <i>“Getting close, kiddo... real close.”</i> As if on cue, her words bring a new wave of lust hammering through you, making your");
	if (pc.hasCock())
	{
		output(" [pc.cocks] drool into the crack of her ass, throbbing with need and ready to blow.");
	}
	else
	{
		output(" [pc.cunts] drool with excitement, slathering your");
		if (pc.vaginas.length == 1) output(" pussy");
		else output(" pussies");
		output(" and Shade’s lewd tail with a delicious mix of juices.");
	}
	output(" Cumming with her wouldn’t be so bad at all, would it? You surrender yourself to it, and wrap your lips around one of Shade’s");
	if (shade.canLactate()) output(" milky");
	output(" tits to suckle as you do so.");

	output("\n\nA few moments later, amid Shade’s most sultry and bombastic moans,");
	if (pc.hasCock())
	{
		output(" you feel your [pc.cocks] swell and erupt, blasting a wad of [pc.cumNoun] all across Shade’s marvelous ass");
	}
	else
	{
		output(" you find yourself reaching climax, hurtling into bliss in the cat-girl’s wake. Your cunts rub together, grinding hard and fast and oh-so wonderfully until you’re both screaming in ecstasy")
	}
	output(". Shade’s head rolls back on her shoulders, tits all but smothering you as she cries and cums and bucks in your lap.");

	output("\n\nWhen she finishes, you’re left with a heaving chest in your face, and a cat-babe who’s panting and moaning heavily clinging to you. <i>“That...”</i> she starts to say, trailing off as she catches her breath.");

	output("\n\nSomething tells you you know what she’s going to say anyway. You wrap your arms around your lover’s waist and close your eyes, letting the afterglow wash over you until Shade’s finally calmed down and rolls off of you with a contented sigh.");

	//[Next] //Same after-sex scene as normal
	processTime(20);
	IncrementFlag("SEXED_SHADE");
	IncrementFlag("SHADE_BOOBWORSHIP");
	
	if (shade.canLactate())
	{
		pc.milkInMouth(chars["SHADE"]);
	}
	pc.orgasm();

	clearMenu()
	addButton(0, "Next", shadePostCoitusHangouts);
}

public function talkToShadeAboutMods():void
{
	clearOutput();
	showShade();

	output("<i>“So, what’s your thoughts on mods?”</i> you ask your lover with a bright smile, unabashedly looking at the plump breasts resting over her black vest.");
	
	output("\n\nShade cocks a silver eyebrow at you, her feline eyes narrowing at you. <i>“Oh boy, this conversation,”</i> she grunts, taking a long drink from her mug. <i>“Look, [pc.name], I’m almost forty - and kaithrit don’t live all that long to begin with. You don’t look this good at my age without a little help.”</i>");
	
	output("\n\nYou blink, a bit taken aback. For a moment, you’d thought Shade was about to tell you off for bringing the topic up. Instead, she doesn’t seem hesitant to tell you she’s used mods of her own accord. Like your father, Shade’s probably invested in some over the counter drugs to keep her looking young and hale. They’re working, too: for a woman in her species’ middle ages, she looks remarkably good - barely past twenty, firm and perky in all the right places.");
	
	output("\n\nModern medicine really is a marvel.");
	
	output("\n\n<i>“I’m up here, junior,”</i> Shade laughs, giving an exasperated sigh as she draws your attentions back to her face. She rolls her eyes and leans back in her chair, clearly not all that displeased with your wandering gaze. Indeed, her slutty little tail rubs affectionately against your [pc.foot]. <i>“So, was there a point to that question? Want to tell me how you’d rather be with a MILF who looks her age... or are you one of those anti-mod weirdos?”</i>");
	
	output("\n\n<i>“Not at all,”</i> you grin. <i>“Actually, I was going to talk about you getting some...”</i>");
	
	output("\n\nShade chuckles and drinks again. <i>“Oh, well, that’s another story entirely. I haven’t really had much work done other than cosmetics, but I’m not entirely opposed to some simple mods. Just don’t expect me to go turning into a centaur or something");
	if (pc.hasCock()) output(" just so you can get wood");
	output(".”</i>");
	
	output("\n\nYou didn’t have anything that drastic in mind, you assure her. <i>“Maybe just something to enhance those tits of yours? Ever thought about lactating, for instance?”</i>");
	
	output("\n\n<i>“Shit, I don’t need mods for that,”</i> Shade laughs, the hearty motions making her chest bounce alluringly. <i>“You know I’ve had a kid, right? Gotta admit, being all milky was actually pretty great: my chest plumped up, got even more sensitive... and nursing! There’s something alluringly feminine about it, don’t you think?”</i>");
	
	output("\n\nThe way she says that, you think Shade might have a bit of a fetish hiding behind that lusty grin. Maybe this’ll be easier than you thought...");
	
	output("\n\n<i>“Tell ya what, [pc.name],”</i> she says, kicking her feet up on the edge of the table between you. <i>“You bring me the mods you want, maybe Lactaid or a handful of milk gushers to actually get me started, and I’ll give you first dibs on draining me dry. Sound like a deal?”</i>");
	
	output("\n\n<i>“Deal!”</i> you say, smiling wide. You can’t wait to taste what Shade has to offer...");

	flags["SHADE_TALKED_ABOUT_MODS"] = 1;
	shadeTalkMenu(talkToShadeAboutMods);
}

public function gibShadeModItems():void
{
	clearOutput();
	showShade();

	output("Grinning at the cat-girl, you reach into your pack and tell her <i>“Got something for you!”</i>");
	
	output("\n\n<i>“Oh?”</i> she says, cocking an eyebrow as you pull out...");

	// Honeyizer
	// Chocolac
	// Honeydew

	clearMenu();
	if (!shade.canLactate() || shade.milkType != GLOBAL.FLUID_TYPE_MILK)
	{
		if (pc.hasItemByClass(Lactaid, 1)) addButton(0, "1x Lactaid", gibShadeModItemsII, "lactaid");
		else addDisabledButton(0, "1x Lactaid", "Lactaid", "You don’t have any Lactaid.");

		if (pc.hasItemByClass(MilkCaramelGushers, 5)) addButton(1, "5x M.Gush", gibShadeModItemsII, "gushers");
		else addDisabledButton(1, "5x M.Gush", "Milk Gushers", "You don’t have enough Milk Gushers.");
	}
	
	if (!shade.canLactate())
	{
		addDisabledButton(2, "1x Hnyizr", "Honeyizer", "Shade needs to be lactating before she can change lactation type!");
		addDisabledButton(3, "1x Chclac", "Chocolac", "Shade needs to be lactating before she can change lactation type!");
		addDisabledButton(4, "1x Hnydew", "Honeydew", "Shade needs to be lactating before she can change lactation type!");
	}
	else
	{
		if (pc.hasItemByClass(Honeyizer)) addButton(2, "1x Hnyizr", gibShadeModItemsII, "honeyizer");
		else addDisabledButton(2, "1x Hnyizr", "Honeyizer", "You don’t have any Honeyizer.");

		if (pc.hasItemByClass(Chocolac)) addButton(3, "1x Chclac", gibShadeModItemsII, "chocolac");
		else addDisabledButton(3, "1x Chclac", "Chocolac", "You don’t have any Chocolac.");

		if (pc.hasItemByClass(Honeydew)) addButton(4, "1x Hnydew", gibShadeModItemsII, "honeydew");
		else addDisabledButton(4, "1x Hnydew", "Honeydew", "You don’t have any Honeydew");
	}

	addButton(14, "Back", talkToShadeAboutMods);
}

public function gibShadeModItemsII(selItem:String):void
{
	clearOutput();
	showShade();
	
	switch (selItem)
	{
		case "lactaid":
			pc.destroyItemByClass(Lactaid, 1);
			shade.milkType = GLOBAL.FLUID_TYPE_MILK;
			shade.milkMultiplier = 75;
			shade.milkFullness = 75;
			break;
		case "gushers":
			pc.destroyItemByClass(MilkCaramelGushers, 5);
			shade.milkType = GLOBAL.FLUID_TYPE_MILK;
			shade.milkMultiplier = 75;
			shade.milkFullness = 75;
			break;

		case "honeyizer":
			pc.destroyItemByClass(Honeyizer, 1);
			shade.milkType = GLOBAL.FLUID_TYPE_HONEY;
			break;

		case "honeydew":
			pc.destroyItemByClass(Honeydew, 1);
			shade.milkType = GLOBAL.FLUID_TYPE_HONEY;
			break;

		case "chocolac":
			pc.destroyItemByClass(Chocolac, 1);
			shade.milkType = GLOBAL.FLUID_TYPE_CHOCOLATE_MILK;
			break;

		default:
			output("WELP ITEM FUGGED HALP:" + selItem);
			break;
	}
	
	output("... and hand");
	if (selItem != "gushers") output(" it");
	else output(" them");
	output(" over to her. Shade takes your gift and smiles to herself, eyeing the lactic treat. <i>“Aha. I see you’re still obsessed with my tits, huh, [pc.name]?”</i>");
	
	output("\n\nYou don’t bother to deny it. You’re more interested in how she’s going to put your gift to use.");
	
	output("\n\n<i>“Alright, let me go back to my ship. I know how these things can make you a little less than decent when you use them. I’ll be back in a minute, sweetheart. Don’t go anywhere...”</i>");
	
	output("\n\nShade flashes you a wink and stands up, heading towards the door. Her hand brushes your shoulder as she goes, pursing her lips in a blown kiss when you turn to watch her leave.");

	processTime(5);

	clearMenu();
	addButton(0, "Wait", shadeComesBackForBoobystuff);
}

public function shadeComesBackForBoobystuff():void
{
	clearOutput();
	showShade();

	output("A few minutes later, Shade returns to you. Her breasts look plump and full, and you can see a pair of moisture stains on her shirt, only partially hidden by her coat and vest. Her skin is flushed red, too, and she’s breathing harder than before. Looks like you missed quite the event.");

	output("\n\n<i>“Whew,”</i> Shade sighs, resuming her seat and leaning in to give you an enticing view of her cleavage. <i>“That was... something. Gonna need to invest in one of those Magic Milkers if we keep this up. Had to clean up a little bit of a mess.”</i>");

	output("\n\nShe grins, and licks her lips. You notice her tongue still has traces of [shade.milk] on it. <i>“So, back to my place? I know you’re dying to give my rack a little worship after that. Can barely wait to get your hands on ‘em, can you?”</i>");

	processTime(5);
	pc.lust(33);

	// [Shade Options Here]
	shadeMenu();
}
