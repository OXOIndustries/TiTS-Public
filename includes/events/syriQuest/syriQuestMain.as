import classes.Characters.AkkadiSecurityRobots;
import classes.Characters.CommanderSchora;
import classes.Characters.DrCalnor;
import classes.Characters.Torra;
//https://docs.google.com/document/d/1kgDLjKPffZIGkFf3DQWXRFex5aVWVAGMCq7RlJEbYzI/edit#
/*
 * SYRIQUEST_STATE						-1 = never accepted the quest
 * 										1 = run into Syri at the station
 * 										2 = Syri told PC her plan
 * 										3 = PC accepted plan
 * 										4 = PC entered the base
 * 										5 = unlocked elevator lab access
 * 										8 = unlocked Warp Lab (either went there with Calnor or invited by Valden)
 *										9 = opened Warp Lab door
 * 										10 = Valden has a body
 * 										21 = killed Valden (didnt tell Syri)
 * 										22 = killed Valden and told Syri
 * 										23 = helped Valden (see SYRIQUEST_VALDEN_BODY_CHOICE for more info)
 * SYRIQUEST_LOCK_BYPASS				-1 = failed at hacking, 1 = hacked, 2 = stealthed
 * SYRIQUEST_POWER_STATE				0 = off, 1 = on, 2 on (overload)
 * SYRIQUEST_ELEVATOR_STATE				-1/undefined = locked, 0 = entered elevator/on base floor, 1 = staff rooms, 2 = secret lab
 * SYRIQUEST_DATA_STOLEN				1 = stole data from the archives
 * SYRIQUEST_CALNOR_TALK_VALDEN			unlocks talk options
 * SYRIQUEST_CALNOR_TALK_HELP_HIM		unlocks talk options
 * SYRIQUEST_VALDEN_BODY_CHOICE			1 = Calnor, 2 = Bimbo Wolfe, 3 = normal Wolfe
 * SYRIQUEST_SYRI_ONAHOLE				undefined = never found it, 1 = found it, 2 = gave it to Syri
 * SYRIQUEST_POST_GAME_TALK_PENIS		1 = talked about Valden, 2 = talked about Syris cock, 3 = talked about Syris cock sleeve
 * SYRIQUEST_POST_GAME_TALK_LOVE		1 = told her love her, 2 = stay friends
 * MET_SCHORA							1 = saw her in the shower but didnt approach
 *										2 = watched her and left
 * 										3 = talked to her but she left because of the alert
 * 										4 = treated her right
 * 										5 = treated her rough
 * MET_TORRA							meet Torra (and fucked her)
 * SYRIQUEST_AKKADI_BASE_STEPS
 * SYRIQUEST_SIEGWULFE_NAME				name of the Siegwulfe you gave to Valden
 * SYRIQUEST_CALNOR_ICON				1 if valden should show an icon in S17
*/


/*
***************************************************************************
So far, the quest works and can be played start to finish, the only thing missing is the combat and fixing an annoying bug.
There seems to be a bit of Subtuner and Bioanehole content that requires Syri quest - ask Fen if that should be activated.

The bug: There are a couple of instances during the quest (basicly the quest endings) where Syri gets added to the second room in the Uveto bar, but for some reason the map isnt showing the NPC icon for the room.

Security Robots:
syriQuestAkkadiBaseSecurityRobotsEncounter
There is a bug with this NPC as there are no damage indicators during combat. And since I never did much on this NPC, I suggest scrapping this one and starting from scratch.
It also might be a good idea to reduce the number of enemies in this fight as it might be harder than one of the bossfight later otherwise.
-update:
They're donish, 5 bots bug the fight.
-update:
DONE

Torra:
syriQuestTorraFight
Finished so far aside from one attack (needs a modifier to weaken the PC), might need a bit balance testing.
-update:
modifier is in
Needs resistances added
-update:
resistin'
DONE

Dr. Calnor
syriQuestCalnorFight & syriQuestCalnorFight2
The basic class for this NPC exists, but its using copy pasted place holder attacks. Second fight is basicly the same, should just be a bit more HP and shields.
-update:
Attacks are done
Uber mode, lust resistance and balancing still not done
-update 2:
stat increase, lust immunity are in

Valden
syriQuestAkkadiBaseValdenFight
Never got around to code that, so no work was done.
-update:
BOTS DON'T RESPAWN
Tracer Rounds don't increase accuracy.
Valden jumps to first available bot.
-update 2:
Valden has a semblance of decision making.
-update 3:
tracers are in
-update 4:
code healing in already you lazy bastard
-update 5:
DONE

Team Up
syriQuestCalnorTalkTeamUp
Team up with Calnor vs. a swarm of bots. Not much work to do if both NPCs have been coded.
-update:
Just need to add code to revive bots. Calnor not actually part of the fight.
-update:
DONE

Dropship
syriQuestAkkadiBaseEscape
Coded, but might need a lot of balancing testing. Pretty sure it is way to hard atm.

Schora
syriQuestSchoraFight
Basic class exits, but no work on the attacks was done.
-update:
time fer balancin'

*/

//When the PC hits Level 9 and meets all other reqs., remove Syri from Mhen'ga. The next time the PC enters the transit hub on Uveto (and has access to at least one travel point), play this scene.");
//Reqs: Level 9. Must be fuckbuddies with Syri and have gotten Syri's panties.");
public function syriQuestRunning():Boolean
{
	if(syriQuestComplete()) return false;
	if(pc.level >= 9 && pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.") && syriIsAFuckbuddy()) return true;
	return false;
}

public function syriQuestComplete():Boolean
{
	if (flags["SYRIQUEST_STATE"] == -1 || flags["SYRIQUEST_STATE"] >= 21) return true;
	return false;
}

// ***********************************************************************************
// ******************************* Busts, Busts, Busts *******************************
// ***********************************************************************************

//Myrra, Huskar Secretary
public function myrraBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "MYRRA";
	if(nude) sBust += "_NUDE";
	return sBust;
}

public function showMyrraAndSyri(nude:Boolean = false):void
{
	showName("SYRI &\nMYRRA");
	showBust(syriBustDisplay(nude),myrraBustDisplay(nude));
}

//Commander Alyru Schora
public function schoraBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "SCHORA";
	if(nude) sBust += "_NUDE";
	return sBust;
}

public function showSchora(nude:Boolean = false):void
{
	if (flags["MET_SCHORA"] >= 3) showName("ALYRU\nSCHORA");
	else if (currentLocation == "AKD E9") showName("NAKED\nWOMAN");
	else showName("COMMANDER\nSCHORA");
	showBust(schoraBustDisplay(nude));
}

//Schoras Dropship
public function showDropship():void
{
	showName("\nDROPSHIP");
	showBust("DROPSHIP");
}

// Valden
public function valdenBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "VALDEN";
	if (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] == 1) sBust = "CALNOR";
	else if (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] >= 2) sBust = chars["WULFE"].bustDisplay;
	if(nude) sBust += "_NUDE";
	return sBust;
}

public function showValden(nude:Boolean = false):void
{
	showName("\nVALDEN");
	showBust(valdenBustDisplay(nude));
}

//Dr. Raade Calnor, Head Researcher
public function calnorBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "CALNOR";
	if(nude) sBust += "_NUDE";
	return sBust;
}

public function showCalnor(nude:Boolean = false):void
{
	showName("\nDR. CALNOR");
	showBust(calnorBustDisplay(nude));
}

//Torra, Assistant Researcher
public function torraBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "TORRA";
	if(nude) sBust += "_NUDE";
	return sBust;
}

public function showTorra(nude:Boolean = false):void
{
//	showName("\nTORRA");
	showName("MILODAN\nRESEARCHER");
	showBust(torraBustDisplay(nude));
}

public function showAkkadiSecBots():void
{
	showName("SECURITY\nROBOTS");
	showBust("AKKADIROBOTS");
}

public function myrraCapacity():Number
{
	return 300;
}

public function syriQuestBurtsBlubt():void {
	clearOutput();
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	author("Savin");
	output("As you enter Burt’s, you quickly realize there’s something missing from the familiar halls of the tavern. Or some<i>one</i>, more accurately. The gaming setup has been almost entirely pulled down from the walls, and there no sign of your raven-haired player two anywhere at all. Odd, considering Syri’s near-constant occupation of the meadhall -- indeed, she’s here so frequently that you always had a hard time believing she actually had a job.");
	output("\n\n<i>“Oh, [pc.name],”</i> Burt says, waving you over. <i>“C’mere a second.”</i>");
	output("\n\nYou saunter over to the bar in time for Burt to finish cleaning the stein he was working on and flick his rag up over his arm. <i>“Guess you’re lookin’ for somebody, right?”</i>");
	output("\n\nYou nod.");
	output("\n\n<i>“Yeah, figured. Pyrite’s contract up in the foothills is out, and they’re packing up shop. Letting workers go. Syri was in a bit ago, swearing up a storm, and grumped off with her console. Haven’t seen her since. Ask me, she’s out of a job. Probably moved on.”</i>");
	output("\n\n... Oh. She could have sent you an email, at least.");
	flags["SYRIQUEST_STATE"] = 0;
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function syriQuestInitialEncounter():Boolean {
	clearOutput();
	showSyri();
	author("Savin");
	output("As you’re heading to the platform, you notice something in the corner of your eye, half-hidden by the waves of extra-fluffy ausar and buttoned-up leithans in their cold-weather pony-parkas: you see a dusty blue longcoat dangling down from the other side of a particularly imposing leithan, and you’re pretty sure you see a pair of raven-furred ausar ears swivelling around above them.");
	output("\n\nIs that...? No way.");
	output("\n\nDriven by a powerful curiosity, you push your way through the crowded station to where you saw the mysterious figure. Circling around the broad flanks of the buff ‘taur, you reach out a hand to the figure’s shoulder to try and get her attention... just as she’s turned around of her own accord. She ends up taking a step directly into you, yelping as a steaming foam cup of something dark gets crushed between you, squirting the hot liquid everywhere.");
	output("\n\n<i>“Shit!”</i> you both say, patting yourselves off. It takes you a good few seconds to get your bearings enough to look up and see just who it is you’re dealing with.");
	output("\n\n<i>“Steele!?”</i> Syri says, eyes wide. Coffee has soaked through the front of her yellow t-shirt, leaving a pair of cold-stiffened nipples jutting through under the flaps of her greatcoat. And her tail starts wagging, thumping heavily against the nearby leithan’s legs as she blinks away the surprise. <i>“What the hell are you doing here?”</i>");
	output("\n\nYou could ask her the same question. This doesn’t look like Mhen’ga.");
	output("\n\nSyri half-laughs, wiping some coffee off her hand-fur. <i>“Shit, did I not send you an email? I thought I sent you an email! Uh, I got laid off! Yay.”</i>");
	output("\n\n<i>“");
	if(pc.isNice()) output("Oh no! I’m sorry to hear that!");
	else output("That sucks.");
	output(" But what’re you doing all the way out here?”</i>");
	output("\n\n<i>“Getting Irish coffee spilled all over my tits, apparently! At least it’s by the hottest klutz this side of the Orennan expanse,”</i> she says with a wink. <i>“That was a hell of a non-answer, too. So funny story: the day we finished that bridge we were working on out of Esbeth and Pyrite decided they didn’t need hired hands anymore, I got an email from a games site I subbed to when I was like, 12, and it had news of this big </i>Call of Valor<i> tournament being held here on Uveto. So like any responsible adult, I blew the last of my savings on a ticket out here and the registration fees. Figured I’d give myself some real motivation to win: take home the gold, or have to move back home with mom and dad!”</i>");
	output("\n\nYou stare at Syri for a moment. <i>“Seriously? ");
	if(pc.isNice()) output("I could have come pick you up!");
	else output("Didn’t even think of calling me to take you?");
	output("”</i>");
	output("\n\nShe plays it off with an eye roll, leaning back against a nearby pillar. Her cleavage only becomes more and more transparent as the coffee settles in... <i>“Maybe we should go get cleaned up?”</i> you offer.");
	output("\n\n<i>“And waste all this coffee?”</i> she purrs, slipping in close and grabbing your ");
	if(pc.hasCock()) output("package");
	else output("butt.");
	output(" with a firm squeeze. <i>“I’m pretty sure my cleavage is soaked through... you made this mess, so you should clean it up. With your tongue,”</i> Syri murmurs, giving you a seductive look and pressing her shoulders together for that extra bit of bustiness.");
	output("\n\nWell, if she insists...");

	flags["SYRIQUEST_STATE"] = 1;
	processTime(30);
	clearMenu();
	addButton(0, "Get Jiggly",syriQuestGetJiggly);
	return true;
}

public function syriQuestGetJiggly():void {
	clearOutput();
	showSyri();
	author("Savin");
	
	removeUvetoCold();
	
	output("The nearest public restroom is mostly empty and cleaner than most, at least. Syri’s back impacts the side of the taur-accessible stall with enough force to make the whole row shudder -- and make her tits bounce delightfully as you yank her stained shirt up over her head. You stop just before the collar pops around her chin, leaving the lusty shemale panting and scrabbling blindly at your back, raking her short claws across your ");
	if (pc.isNude()) output("[pc.skinFurScales]");
	else output("[pc.armor]");
	output(".");
	output("\n\nYour [pc.tongue] flicks out, dragging in long, slow trails around the insides of Syri’s double-D tits. You can taste the mix of coffee and ausar whiskey on her flawless flesh, mixing with the unmistakable flavor of your lover to drive your tastebuds wild. Her cherry-red nipples just up like crimson mountains from her breasts demanding to be pulled and pinched, which occupies one of your hands while the other bunches Syri’s shirt around her arms like restraints, keeping the feisty shewolf right where you want her.");
	output("\n\n<i>“Knock it off!”</i> she growls, as softly as she can lest someone hear. <i>“I wanna look in your eyes while you worship those.”</i>");
	output("\n\nYou answer her by grabbing one of her teats between your [pc.lips] and giving it a rough suck, pulling back on the pebbly mound until she’s arching her back and gasping. Now her cleavage is much more slathered in spit and sweat than Irish coffee, giving you the perfect excuse to bury your face in between them and motorboat Syri’s silky skin, making those beautiful baps quake against your cheeks.");
	output("\n\nSyri just hooks a leg around your hip and lets her head roll back, gasping softly to the beat of your boobworship. You let your hand wander down from her breast to her crotch, grabbing a handful of puppy package through the front of her jeans -- and if you thought she was into it before, <b>now</b> she’s going crazy. Syri has to choke back a cry, and her borrowed cock throbs so hard through her jeans that the zipper starts to peel down of its own accord... though you’re happy to hasten the process.");
	output("\n\n<i>“Damn it,”</i> Syri moans, chest heaving. <i>“Why the fuck do you get me so </i>hard<i>? You gotta be some kinda sex demon... nothing should make my dick so hard it </i>hurts<i>!”</i>");
	output("\n\nBetter give this puppy some relief, then. You pull your face out of her tits and push your [pc.lips] against Syri’s, giving her something else to think about while you fish her dick out and start to stroke the throbbing pillar of auburn dogmeat. No reason to mess around with the foreplay here: you start jacking Syri nice and fast, making the ravenette slut squirm in your hands, thrashing her tail against the side of the stall.");
	output("\n\nFinally, you pull Syri’s impromptu hood off, letting her shirt fall to the floor and freeing your lover to finally look at you, eating you up with those big blue eyes of hers, full of shameless lust and need. Suddenly her hands leave your back, grabbing your cheeks in both fluffy palms before pulling you back in hard, thrusting her tongue down your throat while her dick starts to pulse with desperate desire. You can feel her knot swelling, ready to break a bitch wide open and trap the impending surge of seed deep inside. Instead, all it does is give you something nice and meaty to play with between strokes, squeezing and kneading the ball of turgid ausar flesh until Syri’s moaning in your mouth and her dick is leaking her thick cream into your waiting hand.");
	output("\n\nShe crescendos with one long squirt of pearly spunk that splatters across the floor, apparently pleasurable enough to make her slam her own back against the wall and crush your pelvis with her leg. Syri lets loose a gasping train of curses and a few aftershots of watery spunk, staining your hands white -- the perfect mess for <i>her</i> to clean up. When she’s finished cumming, you release her still-turgid knot and bring your hand up to her dark lips, letting her jizz glisten in the flourescent light of the bathroom.");
	output("\n\n<i>“Pervert,”</i> Syri laughs, stroking your cheek. <i>“First you jack me off in a bathroom, then you want me to lick cum off you? What do you think I am, ");
	if (flags["MET_ANNO"] == 1 || flags["PUPPYSLUTMAS_2014"] != undefined) output("my sister");
	else output("a bitch in heat, desperate to breed");
	output("?”</i>");
	output("\n\nBefore you can answer, Syri grabs your wrist in both hands and thrusts her tongue into the biggest glob of steaming shemale spunk quivering in your palm.");
	output("\n\n<i>“Lucky for you, I’m a filthy pervert too,”</i> she smirks, licking her lips. <i>“Gods, the thing this dick makes me wanna do to you...”</i>");
	output("\n\nSyri laughs and slumps back against the bathroom wall, covering her face with a hand. Her dick bobs and wiggles, slowly withdrawing into her fly. At least her tits are still out, offering themselves up as the perfect place to rest your head while your lover recovers from her climax.");
	output("\n\nFinally, her arms settle around your waist, hugging you against herself. <i>“I am really, incredibly, stupendously glad to see you here, Steele,”</i> she murmurs, nibbling on your [pc.ear]. <i>“I hope you’re staying for the tournament...”</i>");
	output("\n\nMaybe. It’s the first you’ve heard about it, after all.");
	output("\n\n<i>“Would be nice to have my favorite space-slut cheering me on,”</i> she smirks, stroking you gently. <i>“Although... hey, actually... can I talk to you? Like, real serious talk. The kind you don’t have half-naked in a maglev station’s toilet.”</i>");
	output("\n\n");
	if (pc.isMischievous()) output("<i>“But those are the best kinds,”</i> you tease.");
	output("<i>“What’s on your mind?”</i>");
	output("\n\n<i>“I’ll tell you when we get to your ship, okay?”</i>");

	processTime(30+rand(15));
	//Give minor exhibitionism.
	pc.exhibitionism(1);
	pc.changeLust(33);
	//pc.loadInMouth(chars["SYRI"]);
	chars["SYRI"].orgasm();
	clearMenu();
	addButton(0, "Go Now", syriQuestGoNow,undefined,"Go Now","Head back up to your ship and see what’s on the puppy’s mind.");
	addButton(1, "Go Later", syriQuestGoLater,undefined,"Go Later","You’ll get right back to Syri about that.");
}

public function syriQuestGoLater():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("You make your excuses, saying that while it was fun for a quickie, you’ve gotta jet. Serious talk will have to wait for a bit.");
	output("\n\n<i>“Yeah, no problem. You can probably guess where I’m hanging out most of the time, so drop by the bar whenever you’re free for an hour or so. ‘Kay?”</i>");
	output("\n\nYou nod, slowly dislodging yourself from Syri’s slicked tits. She gives you a little grin and slaps your cheek with a boob before you can fully extricate yourself. The two of you spend the next couple of minutes redressing, occasionally pausing to grope or spank each other until you’re almost presentable. The pair of you slip out of the bathroom at a quiet moment, heading your separate ways for now.");

	generateMap();

	processTime(3);
	
	addUvetoCold();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function syriQuestFreezer():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("You saunter over and ");
	if (pc.isBiped()) output("swing yourself onto the bench");
	else output("sit down");
	output(" facing Syri. She’s too absorbed in whatever game she’s playing to notice you until you reach over and ");
	if (pc.isMischievous() || silly) output("boop her nose");
	else output(" give her a poke");
	output(".");
	output("\n\n<i>“Hey, Steele!”</i> she beams, glancing up from her tablet for a split second. <i>“Lemme just... finish... this level... there! Suck my magic space dick, Vultork the Inexorable!”</i>");
	output("\n\nSyri pumps her fist in the air and drops her tablet on the table. <i>“Fuck yeah, that feels good. And good to see you, too,”</i> she adds, leaning over the table to give you a kiss on the cheek. <i>“So, finally got the time for that talk?”</i>");

	processTime(5);
	clearMenu();
	addButton(0, "Yes", syriQuestYes,undefined,"Yes","Let’s have that conversation now.");
	addButton(1, "Not Yet", syriQuestNotYet,undefined,"Not Yet","Soon, Syri.");
}

public function syriQuestNotYet():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Soon,”</i> you say. <i>“I just wanted to stop by.”</i>");
	output("\n\nSyri pouts and crosses her arms. <i>“Okay, okay. Just don’t take <b>too</b> long, okay? It’s really important to me.”</i>");
	output("\n\nYou share a drink with your lover, making a bit of small talk before you have to head back out.");

	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function syriQuestYes():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Sure,”</i> you tell her. <i>“What’s on your mind?”</i>");
	output("\n\n<i>“It would be better if we talk somewhere private,”</i> Syri says, glancing around nervously. <i>“Can we go up to your ship?”</i>");
	output("\n\nIt’s a bit of a walk, but that makes her more comfortable, you can’t see why not...");

	generateMap();
	
	clearMenu();
	addButton(0,"Next",syriQuestGoNow);
}

public function syriQuestGoNow():void {
	clearOutput();
	showSyri();
	author("Savin");
	
	removeUvetoCold();
	currentLocation = "SHIP INTERIOR";
	generateMap();
	
	output("You take Syri by the hand and tell her that you’re all ears for her. She smiles and puts a big, wet kiss on your [pc.lipsChaste], squeezing your hand in hers before she quickly gathers her things. A few minutes later and the two of you are trudging through the wailing winds and heavy snow of Irestead, making your way back to the city’s central hub, and then up through the dizzying heights of the space elevator.");
	output("\n\nThe walk back to your ship is brief and quiet. Syri doesn’t talk much on the way; not at all, in fact, unless you prompt her. She keeps chewing her lower lip and scratching at her arm-fur, staring off into the vastness of space between short responses to whatever you try and talk about. Something’s got this puppy by the tail, but she won’t say what until she’s safe and sound aboard your ship.");
	output("\n\nWhen the airlock finally cycles behind you, Syri lets out a sigh that seems to carry all the weight off her shoulders. She lets you guide her over to the couch in the common room and you both take a seat.");
	if (annoIsCrew()) {
		output("\n\nFrom the corridor behind you, you hear a cheery <i>“Hey boss!”</i>");
		output("\n\nTaking a look over your shoulder, you see Anno jogging up in a tight black Steele-patterned sports bra and booty shorts, creamy flesh still glistening with sweat from a recent workout. <i>“I thought I saw something tall, dark, and cute coming aboard on the security cams. Finally break down and decide to join Steele’s merry harem of adventurers?”</i>");
		output("\n\n<i>“Oh! H-hey Anno,”</i> Syri says, fidgeting. <i>“Still flying solo... though not for Steele’s lack of trying.”</i>");
		output("\n\nThe raven ausar chuckles and crosses her legs, pointedly avoiding looking at her skimpily clad sister. Anno just giggles and bounces over, wrapping her arms around Syri’s shoulders from behind the couch in a tight hug that has the back of Syri’s head buried in her pearly cleavage.");
		output("\n\n<i>“I was just coming by to talk to Steele. You know, just hangin’ out.”</i>");
		output("\n\nAnno gives her sister a strange look that only you can see, eyebrows arched and lips pursed. <i>“Well, it’s good to see you anyway! I’m glad we’ve got the good captain here to bring us together more often than like, once every other year.”</i>");
		output("\n\n<i>“You too!”</i> Syri grins, reaching up to scratch Anno’s head, right between the ears. The sisters’ tails wag happily, and exchange a few more quick pleasantries before Syri manages to disentangle herself from Anno’s arms, saying that she has some business with you still.");
		output("\n\nAnno tsks her tongue and steps back, turning towards her quarters. <i>“Okay, okay, I know when I’m being a third wheel. I’ve got some more jumping jacks to do anyway, so I’ll let you guys get back to it.”</i>");
		output("\n\nShe makes a rather enticing jumping motion on her way out that, even with her sports bra on, makes her boobs bounce and jiggle. <i>“If you try leaving without hanging out with me, I’m gonna hunt you down and shave your tail, little sister!”</i>");
		output("\n\nAnno bounces away before Syri can respond, leaving the horndog ausar to look at you with flushed cheeks and say, <i>“God damn those shorts though... unf. Be still my sinful heart!”</i>");
		output("\n\nShe gives a little shiver and leans back into the couch, scratching at her jeans that suddenly look two or three sizes too small around the groin. <i>“Anyway...”</i>");
	}
	output("\n\nSyri sighs and turns to you, still looking more than a little off-balance. <i>“");
	if (silly) output("Help me, Steele Kenobi, you’re my only hope. Seriously though, I need some help.");
	else output("So... look, I uh, I need your help, Steele. Like, real bad.");
	output(" And it’s not gonna be exactly... legal... technically speaking. But you’re the only person I know who’s ");
	if (silly) output("a bad enough dude");
	else output("badass enough");
	output("... and who might care enough about me to do it without me being able to pay them.”</i>");
	output("\n\n");
	if (pc.isNice()) output("You put a hand on Syri’s. <i>“What’s wrong?”</i>");
	else if(pc.isMischievous()) output("<i>“I’m dying of suspense here. What’s up?”</i>");
	else output("<i>“Come on, out with it already! You’ve been pent up about this since we left Uveto.”</i>");
	output("\n\n<i>“I...”</i> she starts, pausing to think for a moment. <i>“I didn’t </i>just<i> come to Uveto for the tournament. I mean, I’m here for that too because otherwise I really am gonna be flat out broke and have to move back in with my parents and that’s going to be real fucking embarrassing but </i>also<i> more importantly...”</i>");
	output("\n\nSyri stops for breath, shifting her weight on her ass. <i>“I got some information from someone in Akkadi. The company that caused my little accident? I don’t know who it’s from or if it’s even legit, but it looks like it is, and... and it says that Valden is alive.”</i>");
	output("\n\n<i>“Valden? The guy whose dick you have now?”</i>");
	output("\n\nSyri nods. <i>“Yeah. He went through the transporter with me but never came back out. The Akkadi brains behind the project said they had no idea where he’d gone, that he was probably dead, too. But the report I have says he’s been here at their complex on Uveto since the accident! They’ve been lying to me since day one!”</i>");
	output("\n\nAssuming this leak is legit, anyway.");
	output("\n\n<i>“I know it’s a big assumption, but if Valden’s really alive... and being held by Akkadi; experimented on... then I can’t just leave him here! I’ve got to save him. I know he’d do the same for me.”</i>");
	output("\n\n<i>“So what do you need from me?”</i> you ask her.");
	output("\n\nThe raven-haired ausar grimaces. <i>“And that’s the awkward part. I can’t be the one that breaks into an Akkadi research base. After the accident, the company has my picture, clawprints, DNA, everything on file... there’s no way I could get away with it. No more medical benefits, probably go to jail... probably get some naval intelligence spook shooting me in the back one night.”</i>");
	output("\n\nYou blink. <i>“So you want me to");
	if (pc.isBimbo()) output(", like,");
	output(" take the fall for you?”</i>");
	output("\n\n<i>“Wha- no! No no no. I’ve got a cunning plan to get somebody </i>else<i> inside, completely undetected. Security will never see a trace of you, and they’ll </i>know for a fact<i> that I was miles away when it happened. It’ll work!”</i>");
	output("\n\nSounds kind of sketchy, but it clearly means a lot to Syri...");
	processTime(45+rand(30));
	syriQuestGoNowMenu();
}

public function syriQuestGoNowMenu():void {
	showSyri();
	author("Savin");
	clearMenu();
	addButton(0, "Valden", syriQuestInitialTalkValden,undefined,"Valden","Ask about Lieutenant Commander Valden.");
	addButton(1, "Akkadi", syriQuestInitialTalkAkkadi,undefined,"Akkadi","So what’s Akkadi’s deal, anyway? Why are they doing this?");
	addButton(2, "Transporter", syriQuestInitialTalkTransporter,undefined,"Transporter","Ask Syri about the transporter device Akkadi was working on.");
	addButton(3, "Syri’s Plan", syriQuestTalkSyrisPlan,undefined,"Syri’s Plan","So what’s this plan of hers...?");
	if (flags["SYRIQUEST_STATE"] == 2) {
		addButton(5, "Accept", syriQuestTalkSyrisPlanAccept,undefined,"Accept","Alright, you’re onboard with Syri’s plan.");
		addButton(6, "Refuse", syriQuestTalkSyrisPlanRefuse, undefined, "Refuse", "This sounds half-cocked at best, not to mention criminal.");
	}
}

public function syriQuestInitialTalkValden():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Tell me about Valden.”</i>");
	output("\n\n<i>“He was my unit leader back in the service,”</i> Syri answers. <i>“He was a career man, an officer who went through the same school Anno did -- years earlier, obviously -- to get his commission as an engineer. But he never had that ‘smarter-than-the-grunts’ attitude a lot of the other officers had. He was... down to earth. I think he said he’d grown up on a farm, out on one of the kaithrit border colonies, and he was sure rugged enough for it.”</i>");
	output("\n\nSyri laughs to herself, shaking her head. <i>“Most hands-on officer I ever had, too. Never shied away from doing the dirty work himself. And when we were in the shit back on Khaleen, cut off and surrounded... we only made it out because Valden kept his cool, lead us through fire and fury like you wouldn’t believe.”</i>");
	output("\n\n<i>“You know, you’ve never talked about it,”</i> you say, prying gently. <i>“Khaleen, I mean.”</i>");
	output("\n\n<i>“You’re right,”</i> she answers.");
	output("\n\nSilence follows for a long, long moment. Finally, Syri continues, <i>“I know. It was a shitshow. Hardest few days of my life. But Valden got me through it alive. Got a lot of people through it alive. And those Akkadi bastards repay him by turning him into a god-damn guinea pig! It’s bullshit!”</i>");
	output("\n\n<i>“I’m alive today because of his leadership. If he’s still alive, I’d never forgive myself for not trying to help him.”</i>");

	processTime(5);
	syriQuestGoNowMenu();
	addDisabledButton(0, "Valden");
}

public function syriQuestInitialTalkAkkadi():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Akkadi is the biggest company in ausar space. They make... everything, from starship to Warp Gates to consumer tech. They used to employ my sister, and they’re the ones that came up with the whole transporter device idea for the Federation fleet.”</i>");
	output("\n\nSounds like a powerful enemy Syri’s trying to make here.");
	output("\n\nShe leans back and sighs, resting her hands on her knees. <i>“I know. Believe me, I know that better than most. Akkadi likes to put on a cute face in public -- they have little chibi ausar girls in rainbow colors as their mascots and everything -- but they’re one of the most ruthless megacorps out there. I used to think they had to be, they’re keeping the ausar relevant in the galaxy, keeping the Warp Gate network running... but now I’m not so sure. Not if they’re experimenting on our own people.”</i>");
	output("\n\n<i>“Any idea why they’re holding Valden?”</i>");
	output("\n\n<i>“I’d assume it’s got something to do with the transporter accident,”</i> Syri says. <i>“They kept me locked down in a hospital for weeks afterwards. Of course I needed it, with my insides all scrambled around, but I knew they were studying me too. Trying to see what their little gadget had done to me, how they could profit off what they did to me. Bastards.”</i>");
	output("\n\nSyri grumbles a few more descriptive curses, finally resting her hand on her package and adding, <i>“At least it wasn’t all bad. Turns out having a dick is pretty great. Just wish a tenth of my organs weren’t Valden’s... though he’s got a hell of a liver. <b>Had</b>, I guess.”</i>");
	output("\n\nYou nod. <i>“So let’s talk about their operation here on Uveto...”</i>");
	output("\n\n<i>“Right. Akkadi has a research station way north-east of Irestead, out on the very edge of this huge rift between two glaciers. It’s in the middle of absolutely nowhere. They use it to do their most sensitive research, well away from prying eyes... and any kind of regulation or oversight. The documents I got make it look almost like a blacksite, the kind of place where they dissect the real nasty aliens out there.”</i>");
	output("\n\nThat doesn’t sound good for Valden...");

	processTime(10);
	syriQuestGoNowMenu();
	addDisabledButton(1, "Akkadi");
}

public function syriQuestInitialTalkTransporter():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“What can you tell me about the transporter?”</i>");
	output("\n\n<i>“Why, hopin’ to steal one for Steele Tech?”</i> Syri laughs. <i>“Hell, they might have one there. The one I went through was a prototype. They wanted to use it in a hostage situation involving a member of the royal family, and my unit was apparently the only one close enough to respond in time. Pulled us off a training exercise and everything. It was the first time living people had gone through a man-scale Warp Gate... at least that anybody wanted to talk about after. Considering what happened, I think we were probably the last, too.”</i>");
	output("\n\n<i>“Valden and I were called to spearhead the mission. We were called into this dark chamber in a Akkadi research station, high above the planet. The transporter didn’t look like anything special at the time: it was just a platform surrounded by panels of glass, with a circle of silvery metal on the floor that the nerds made us stand inside. ‘Hands, legs, and tails inside the dimensional shunter at all times’ and all that.”</i>");
	output("\n\nYou ask, <i>“What happened next?”</i>");
	output("\n\nSyri takes a deep breath. <i>“Well, um, there was a voice from the control room telling us to push all the air out of our lungs. Then there was a bright light, like, blindingly so, from all around us. Then the next thing I knew I was lying on my back in the drop site, feeling like fingers were in there tickling all my insides. It was the weirdest thing I ever felt... at least until I got my first boner.”</i>");
	output("\n\n<i>“Did it hurt?”</i>");
	output("\n\n<i>“The boner? Nah,”</i> she laughs. Then, more seriously: <i>“Honestly, no. I couldn’t move or speak for a while, but I wasn’t in pain. It was just... just weird.”</i>");
	output("\n\nSyri shrugs. <i>“And then I realized I was all alone. No Valden. No backup, cuz the Akkadi nerds realized they fucked up afterwards and didn’t send anybody else. So I just got to squirm in the government office’s attic until the actual S.W.A.T. team showed up and saved the day. My ego’s what hurt after that.”</i>");
	output("\n\n<i>“Didn’t really realize what had happened until afterwards. Too busy being terrified and freaking out to notice the new equipment between my legs. I only noticed on the medevac out, when a nurse in this killer miniskirt ‘accidentally’ thrust her plump butt in my face when she went reaching for something up in a cabinet. I’ve always been an ass girl, but damn, that booty dredged up something <b>primal</b> in my new cock. Never wanted to motorboat a pair of cheeks so bad in my life...”</i>");
	output("\n\nSyri makes a little grunting noise and shifts her legs around her growing bulge.");
	if (pc.isBimbo()) output("\n\n<i>“So’d you, like, bang her and stuff?”</i>");
	else if (pc.isBro()) output("\n\n<i>“So you tap that ass or what?”</i>");
	if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“I don’t like to fuck and tell,”</i> Syri laughs, <i>“But let’s just say I got to try out my new equipment on the medbay bed. More than once.”</i>");

	processTime(15);
	syriQuestGoNowMenu();
	addDisabledButton(2, "Transporter");
}

public function syriQuestTalkSyrisPlan():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Tell me about this plan.”</i>");
	output("\n\n<i>“Alright, now we’re talking!”</i> Syri grins, sitting straight up and fixing you with her deep blue gaze. <i>“So this Akkadi base out on the Rift is expanding their facility. They’re making a second station on the opposite glacier with a great big skybridge connecting them. So naturally I’ve got some serious qualifications in bridge building, enough to get myself a job with the company Akkadi contracted out to do the construction. They airlift us worker pups and a bunch of sealed equipment containers out to the site every day, and I’ve got access to the containers before they ship.”</i>");
	output("\n\n<i>“So my plan is to sneak you into one of those containers, one that’s gonna be going to the crew working on the secure research wing’s access bridge. Once you’re in place, I’m going to be on the other side of the bridge working on the power substation... and for no reason at all, the base is going to get hit with a surge caused by one of the construction crew’s generators spiking their system. The base’s security sensors will be offline just long enough for you to get inside the secure wing from the container. Probably.”</i>");
	output("\n\nYou squint at her. <i>“Probably?”</i>");
	output("\n\n<i>“Well... yeah,”</i> Syri answers, fidgeting. <i>“Look I only get one shot at this. If I test it, they’ll fix the bug. But the first day on the job I spent every second I could looking over their power systems and security and I’m pretty damn sure I’m right. Their new construction doesn’t have any backups installed yet, so when the main base’s generators come online, they’ll be stretched too thin by two entire complexes trying to pull on them: they’ll overload too!”</i>");
	output("\n\nShe seems confident, but... well, all you have is her expertise to go on.");
	output("\n\n<i>“And what do I do once I’m in there?”</i>");
	output("\n\n<i>“Find Valden. Break him out. And then we’re gonna get the fuck outta dodge before Akkadi’s security goons come swarming all over us.”</i>");
	output("\n\n<i>“And what’s the plan for getting out?”</i> you ask.");
	output("\n\nSyri sucks in a sharp breath. <i>“Uh, we’re gonna have to improvise on that. Could always hijack the company’s air mule or one of the Akkadi security gunships, or have your ship come pick us up if you can disable the security again from inside. I don’t know.”</i>");
	output("\n\nGood plan.");

	flags["SYRIQUEST_STATE"] = 2;
	processTime(15);
	syriQuestGoNowMenu();
	addDisabledButton(3, "Syri’s Plan");
}

public function syriQuestTalkSyrisPlanRefuse():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“I don’t know, Syri,”</i> you say. <i>“This seems like a bad idea.”</i>");
	output("\n\n<i>“I know! I know... believe me, if it was a good idea, I’d have done it all by myself! That’s what I need you for. I can’t do this by myself, but with you... I’m asking a lot here, but this is my friend’s freedom on the line. I’ve gotta try.”</i>");
	output("\n\nSyri sighs, rubbing her forehead. <i>“Please, [pc.name]?”</i>");

	processTime(3);
	syriQuestGoNowMenu();
	addButton(6, "Still Refuse", syriQuestTalkSyrisPlanStillRefuse,undefined,"No means no, Syri.");
}

public function syriQuestTalkSyrisPlanStillRefuse():void {
	clearOutput();
	showSyri();
	author("Savin");
	if (pc.isNice()) output("<i>“I’m sorry, but no,”</i> you tell her, putting a hand on Syri’s.");
	else output("<i>“No way,”</i> you say.");
	output("\n\nSyri slumps back on the couch, sighing hard. <i>“Yeah. Alright, you’re right, Steele. This is just going to get me killed... if it’s even real. I don’t even know that this isn’t some kind of prank. But if it isn’t... damn it all. This is going to gnaw on me for the rest of my life.”</i>");
	output("\n\nThe ravenette slaps her hands on her knees and pushes herself to her feet. <i>“Thanks for the chat, Steele. I guess I’m gonna go turn in my resignation to those contractors and then get ready for the big tournament. Come swing by the bar sometime, okay?”</i>");
	output("\n\nThat’s one request you can probably fulfil.");

	flags["SYRIQUEST_STATE"] = -1;
	generateMap();
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function syriQuestTalkSyrisPlanAccept():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Okay,”</i> you say. <i>“I’m in.”</i>");
	output("\n\nSyri’s eyes light up, and a big grin spreads across her face. <i>“<b>Fuck</b> yeah! Okay, I’m going to go get things set up. Get your shit together and meet me in the government building down planetside. Moonside? Whatever -- I’ll meet you down there!”</i>");
	output("\n\nSyri leans over and gives you a great big hug, squeezing you until you can hardly breathe. When she’s finished, Syri shifts her hands up and pushes her lips against yours, giving you a parting kiss before hopping to her feet and heading for the door.");
	output("\n\n<i>“See you soon!”</i> she calls, jogging back towards the space elevator.");
	output("\n\nOnce you hear the airlock cycling, you lean back into the couch and catch your breath for a few moments before getting up and turning your attention to the preparations you’ll need to make...");

	flags["SYRIQUEST_STATE"] = 3;
	generateMap();
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function syriQuestMeetOutsideElevator():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Steele! Hey!”</i> Syri calls, waving as you approach. <i>“There you are! I’ve got everything set up with the contractors. Hope you’re ready for a job interview.”</i>");
	output("\n\n<i>“...What?”</i>");
	output("\n\nSyri grins and plants her hands on her hips. <i>“So the best way I could figure to get you inside the company’s office was to set up a job interview. It’s an excuse to get inside long enough for me to sneak you into one of the containers we’re taking up to the research complex.”</i>");
	output("\n\nThis can only end well. You tell Syri to lead on, falling in behind her sweeping tail as she guides you out into the searing cold of the planet’s surface. It’s a blessedly short walk through the narrow, snow-swept alleys between the squat Irestead homes and businesses west of the government building. Whether it’s for warmth or just companionship, Syri wraps an arm around your waist and pulls you against herself. She gives you a little smile, and you feel her tail curling around your [pc.leg].");
	output("\n\nThe contractor’s office is only a few blocks away, but ");
	if (pc.hasHeatBelt()) output("even with your heat belt ");
	output("you’re shivering all the same by the time you arrive at the steps leading up to a square, one-floor office. A flickering holographic sign reading ‘<i>Haskarn’s Industrial Innovations, LLC</i>’ sits above the door, alongside an animated image of a flexing, bearded huskar male with a hardhat and a toolbox in both hands.");
	output("\n\n Syri swipes an ID card across a reader next to the sliding glass-pane doors and ushers the both of you inside.");

	moveTo("AKD C21");
	processTime(45+rand(30));
	clearMenu();
	addButton(0,"Next",syriQuestJobInterview);
}

public function syriQuestJobInterview():void {
	clearOutput();
	showName("SYRI &\nMYRRA");
	showBust(syriBustDisplay(),myrraBustDisplay());
	author("Savin");
	output("There’s a dozen huskar inside, a mix of men and women all with hefty figures and ashen fur. They’re dressed in heavy winter gear and strapped with toolbelts and hardhats, just like the man pictured outside. Must be Syri’s coworkers, getting ready for the day’s work. Some of them look up and nod at Syri or give you questioning glances, but nobody says anything to either of you: they’re too engrossed in their own conversations, laughing and teasing while they prep for the trip outside.");
	output("\n\n<i>“C’mon, sapient resources is just over here,”</i> Syri says, leading you down a hall off of the main entrance. At the end is another glass door, this time frosted over so that only vague shapes and shadows are visible on the other side.");
	output("\n\nYour beautiful guide raps her fluffy knuckles on the metal frame, and is quickly answered by a voice from inside: <i>“Come in!”</i>");
	output("\n\nSyri slides the door open and gives you a gentle push into a small, warmly decorated little office with a comfortable-looking stuffed couch facing a desk that covered in little toys, smiling dolls, and a big bowl of candy. Sitting behind it is a particularly husky huskar woman, all plump curves and soft, plush pale flesh wrapped up in a white shirt that’s been buttoned down almost halfway to make room for the massive rack of cleavage all but spilling out. A bright pink tie plunges down into the abyss between her breasts, drawing your attention up to a mane of silver-grey fur around her neck, beneath a rosy-cheeked face that’s smiling wide at you.");
	output("\n\n<i>“Hello Ms. Dorna!”</i> the huskar chirps cheerfully, deactivating a small holoterminal and folding her hands on her desk. <i>“And you must be [pc.name]. Welcome to Haskarn’s Industrial Innovations. I’m Myrra, and I heard you were looking for a job.”</i>");
	if (pc.isMischievous() || pc.isBimbo()) output("\n\n<i>“Uh, yeah, sure. Why not?");
	else if (pc.isAss() || pc.isBro()) output("\n\n<i>“Sure, whatever,");
	else output("\n\n<i>“Yes ma’am,");
	output("”</i> you say, ");
	if (pc.isBiped()) output("swinging yourself onto the couch across from her.");
	else output("planting yourself on the ground across the desk.")
	output(" Syri takes a seat behind you, reclining back with her legs crossed and trying to look relaxed. She almost does a good job of it, save for the occasional nervous glance.");
	output("\n\nMyrra smiles and taps a button on her desk, bringing up another holodisplay. <i>“We’re just gonna do a short lil’ interview. Don’t worry about a thing, darlin’, I just need to know a lil’ bit about you and your qualifications before we put you to work. Ms. Dorna here’s vouched for you, after all, so I won’t give you <b>too</b> much trouble. Though she didn’t mention you were so cute!”</i>");
	output("\n\nThe huskar giggles and brings up a form on her terminal. <i>“Okay. First up: what’s your experience with heavy machinery?”</i>");
	if (pc.isBimbo()) output("\n\n<i>“I like, handle big tools all the time!”</i>");
	else if (pc.isBro() || pc.biggestCockLength() >= 12) output("\n\n<i>“I pack big, heavy tools every day, baby.”</i>");
	else if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output("\n\nYou quickly run down all the various machines and industrial equipment you’re certified with. It’s a long list.");
	else output("\n\n<i>“Uh, lots?”</i> you lie.");
	output("\n\n<i>“Great!”</i> Myrra chirps. <i>“Have you ever worked in extreme climates before? As you can probably tell, working out in the Uvetan glaciers is pretty risky business without training and experience.”</i>");
	if (pc.isBimbo()) output("\n\n<i>“Oh, I like risky business!”</i> you giggle.");
	else if (pc.isBro()) output("\n\n<i>“I’ve got <b>plenty</b> of experience, baby.”</i>");
	else output("\n\nYou spend a moment describing some of the places you’ve had to adventure so far -- that might not be construction experience, but you’ve been in all sorts of conditions.");
	output("\n\nMyrra nods, typing. <i>“Okay, that’s good to hear. Um, let’s see, I guess we’ll give you a pass on the qualifications. Now let’s talk about your career here at Haskarn’s!”</i>");
	output("\n\nThe perky huksar scoots forward in her chair, a gesture that makes those massive sweater-puppies quake her her blouse. She must have caught your inevitable glances that way, because she smiles demurely and wags her tail. <i>“So... where do you see yourself in 5 years, [pc.name]?”</i>");
	if (pc.isBro() || pc.LQ() >= 75) output("\n\nWith your face between those tits would sure be nice...");
	else output("\n\nThere’s some places you’d like to be...");

	generateMap();
	processTime(15);
	clearMenu();
	addButton(0,"Flirt",syriQuestJobInterviewFlirt,undefined,"Flirt","This interview would be a lot more interesting -- and probably more likely to actually succeed -- with a little application of the Steele charm.");
	addButton(1,"Serious",syriQuestJobInterviewSerious,undefined,"Serious","Play it straight and just get through this interview.");
}

public function syriQuestJobInterviewSerious():void {
	clearOutput();
	showName("SYRI &\nMYRRA");
	showBust(syriBustDisplay(),myrraBustDisplay());
	author("Savin");
	output("You answer her question about as close to what you think she wants to hear as you can. There’s another fifteen minutes or so of questions, none of which are particularly challenging -- you guess Syri’s word must actually carry some real weight. Or else they let unqualified newbies work in hazardous conditions all the time... then again, you don’t hear anything about insurance while Myrra’s running through things for you.");
	output("\n\nWhen the interview’s finally over, the huskar H.R. girl compiles all the notes she’s taken and tabs the terminal closed, returning her attention to you with a broad smile. <i>“Okey-dokey! I think that’ll about do us. See, wasn’t so bad! You’ll want to talk to the shift boss about setting up your payment deposits, but I’m gonna go ahead and get you started today, if that’s alright. You can ask him if you can start today, but usually we wait till the start of the week for new employees. Since you’ll be sharing a supervisor, I’m sure Ms. Dorna can take you right to him before she heads out for her shift.”</i>");
	output("\n\n<i>“Sounds good,”</i> Syri says, jumping up and flicking out the sides of her coat. <i>“C’mon, [pc.name], I’ll introduce you.”</i>");
	output("\n\nYou bid your farewells to Myrra and hop up to follow your guide. <i>“Stay safe out there!”</i> Myrra calls after you as the door slides shut.");

	processTime(5);
	clearMenu();
	addButton(0,"Next",syriQuestJobInterviewOutro,false);
}

public function syriQuestJobInterviewFlirt():void {
	clearOutput();
	showName("SYRI &\nMYRRA");
	showBust(syriBustDisplay(),myrraBustDisplay());
	author("Savin");
	output("<i>“I can think of a few places... and a few places I’d like to be right now,”</i> you say, grinning at the husky ausar and letting your eyes drink in all that creamy cleavage she’s showing off.");
	output("\n\nMyrra glances up at you from her terminal, cheeks flushed a rosy red. <i>“O-oh! Um, that’s very sweet, but um, highly inappropriate!”</i>");
	output("\n\nYou stand up and saunter over to her desk, leaning across it close enough that you can feel Myrra’s quickening breath on your [pc.skinFurScales]. <i>“That right? You gonna report me to sapient resources?”</i>");
	output("\n\nMyrra squirms, chewing her plush lips. Her already-floppy ears press against the side of her head until she comes to her conclusion: <i>“Well, I’ve got a personal policy against reporting cute " + pc.mf("boys","girls") + "... especially when they’re coming on to little ol’ me... though I think you forgot we’ve got company.”</i>");
	output("\n\nShe points behind you, to where Syri is sitting on the couch watching the proceedings. Or at least your [pc.butt] while you lean over the desk.");
	output("\n\n<i>“Oh, don’t mind me,”</i> Syri grins, leaning back into the sofa. <i>“I’ll just keep [pc.name]’s [pc.butt] warm...”</i>");
	output("\n\nMyrra makes a little sucking sound on her lips, and then pushes a button on her desk. The frosted glass door darkens to opaqueness and an audible click comes from the lock setting into place. When you glance back to the buxom huskar, she’s already torn open her shirt, revealing the extra-large pink bra underneath that’s already coming undone. You expedite it along, grabbing it in your teeth and yanking it off the big beauty’s bountiful bosoms. She gasps, giggles, and reaches up to put her hands on your cheeks.");
	output("\n\nYou think she’s going in for a kiss, but Myrra’s got more on her mind that a makeout session. She pulls you down over the desk, mashing your face into the huge, meaty mounds of mammary, trapping you in there with the strength of a true viking hound-girl. All you can do is feel your hands’ way up to her tits, grabbing the puffy pink nipples at their peaks and squeezing until Myrra relents with a moan.");
	output("\n\nA different pair of hands grab at your [pc.gear], stripping you while your mouth and hands explore the huskar’s heavenly rack. By the time Syri’s sinking her claws into your bare, swaying butt, you’ve got Myrra moaning like a bitch in heat, squirming in her chair as your hands molest her tits. Her tail thumps hard against the wall behind her, displaying her pleasure in the most primitive, bestial way an ausar slut can.");
	output("\n\nConfident in your skills, you let your hands play down, gliding across the jiggling expanse of her plush belly. Your fingers sink into her, squeezing and kneading your way all the way down to the hem of her long skirts. The band is plenty stretchy, letting you easily wiggle a hand down under it. Myrra’s panties are already soaked -- she’s an ausar, after all, so it’s no surprise she’s practically leaking from the sexual stimulation. You press two fingers against the damp stretch of fabric separating you from her sex, feeling it practically cave into her eager pussy at the slightest bit of pressure. A little searching up that sultry cleft and you find a thick, hot bud of a clit bulging from the crown of her cunny, so easy to encircle with your fingers. You start to rub and flick it through the sheer, soaked fabric of Myrra’s panties and are instantly rewarded by gasping cries from above, and a sudden deluge of thick, musky fluids down her thighs.");
	output("\n\n<i>“Almost makes me miss having a pussy,”</i> Syri laughs, slapping your [pc.butt] hard enough to rock you forward. <i>“Almost. So... you gonna help drag this big bitch on the desk so I can get in on the action, or am I just gonna have to make my own fun back here?”</i>");

	processTime(15);
	clearMenu();
	addButton(0,"Get Plowed",syriQuestJobInterviewGetPlowed,undefined,"Get Plowed","Syri’s fine right where she is... with free access to your [pc.asshole].");
	if ((pc.hasCock() && pc.cockThatFits(myrraCapacity()) >= 0) || pc.hasHardLightEquipped()) addButton(1,"Spitroast",penisRouter,[syriQuestJobInterviewSpitroast,myrraCapacity(),true,0],"Spitroast","Pull the huskar babe onto the desk, and go at her from both ends.");
	else addDisabledButton(1,"Spitroast","Spitroast","You need a fitting penis or a strap-on for this.");
}

public function syriQuestJobInterviewGetPlowed():void {
	clearOutput();
	showName("SYRI &\nMYRRA");
	showBust(syriBustDisplay(true),myrraBustDisplay(true));
	author("Savin");
	output("<i>“I like you back there,”</i> you tell her, wiggling your hips against the distinct bulge forming her pants.");
	output("\n\nYou hear Syri laughing, and the heavy <i>thunk</i> of her pants dropping to the ground. In the same moment, you feel a thick, throbbing shaft of hot cockflesh drop into the crack between your cheeks. Something warm and wet splats across it, drooling off Syri’s dick and onto the ring of your [pc.asshole], smeared across it by the ausar’s pointy prickhead.");
	output("\n\nYour heart jumps in your chest, fluttering with anticipation as the knotty shemale drags her cock back through your crack, aligning her tapered tip with your [pc.asshole]. Practically trembling with buttlust, you bury your head deep into Myrra’s cleavage, using her tits like the huge, bouncy pillows they are and nibbling on her nipples until you feel that wonderful, swelling pressure start pushing in on your backside.");
	output("\n\n<i>“I’d say ‘bite the pillow,’ but it looks like you’re way ahead of me,”</i> Syri growls, slapping your ass and settling her hands on your hips, holding you nice and steady. <i>“Hey Myrra, how high’s ‘Can [pc.heShe] take a dick’ on your little list? Cuz [pc.name] here’s a god-damn professional.”</i>");
	output("\n\n<i>“Just under ‘eating pussy,’ I’d say!”</i> the huskar breathlessly pants, stroking your [pc.hair]. <i>“How ‘bout it... a little rug-munching for the job?”</i>");
	output("\n\nWell, if she’s gonna twist your arm...");
	output("\n\nYou pull yourself out of Myrra’s tits, just long enough for the husky ausar to stand up, turn around, and spread her cheeks with her hands. Her tail lifts, brushing across your [pc.face]; when it’s gone, you’re left with a picturesque view of Myrra’s pussy, peeking out from the panties stretched between her thighs and leaking her blatant lusts in thick rivers that tempt your [pc.tongue] out. You follow one of those lurid deltas up to its source, poking your tongue into the meaty folds of Myrra’s twat.");
	output("\n\nNo sooner have you done so than the pressure on your asshole breaks, and you feel yourself being stretched open around a thickening spear of canine meat. A gasping curse escapes your [pc.lips] as Syri slowly, forcefully plunges into you. One of her hands plays across the back of your head before locking her claws around your scalp and pushing your forcefully into Myrra’s ass, driving your [pc.tongue] deep into the huskar’s sodden slit.");
	output("\n\n<i>“That’s the stuff!”</i> Syri growls into an ear, leaning into you with her tits pressing into your back. <i>“Squeeze that ass down for me.”</i>");
	output("\n\nYou aren’t doing it on purpose, but being ass-fucked just has that effect on you. Your body clenches and squeezes completely on reflex, trying at once to push the invading spear of dominant dickmeat out... and then to draw it in, ecstatic with pleasure. God damn, she fucks you so good!");
	output("\n\nAnd you’re passing it on to Myrra, drilling into her with wild abandon. You know she’s cum at least once, but without being able to see her face, all you have to go on is the constant chorus of moans and gasps and shrill little cries you work out of her. That’s motivation enough to keep tongue-fucking her, burying yourself into that sweet, jiggly butt while Syri plows into yours.");
	output("\n\nYour raven-haired lover holds you tight, wrapping her arms around your [pc.chest] as her hips hammer your [pc.butt], harder and faster with every thrust. And with every blow, you feel her burgeoning knot slam against your [pc.asshole], forcing you to open just a little bit wider... take a little bit more of its crushing girth. She’s like a damn battering ram, relentless in her assault on the closed gates of your ");
	if (silly && !pc.hasVagina()) output("ass-pussy");
	else output("ass");
	output(". Eventually, inevitably, you have to yield: with a ragged cry of pleasure, Syri’s bitch-breaker forces its way inside you. It feels like you’re being split apart from the inside, but cascades of pleasure rather than pain rock your body" + (pc.hasCock() ? " -- especially as the hefty tie presses down hard against your anal g-spot. Your thus-far untouched cock jumps, leaking pre as Syri grinds against your prostate":"") + ".");
	
	pc.buttChange(chars["SYRI"].cockVolume(0));
	
	output("\n\nSyri’s breath is a hot, staccato rhythm against your neck, growing more desperate as her knot settles inside you. Your entire ass is one big onahole for her, completely enveloping her cock and locking her in place. All she can do is make rapid little thrusts, smacking her thighs into your [pc.butt] until the sound is all you can hear besides the moans all three of you are making.");
	output("\n\n<i>“You’re gonna be leaking this load all the way to Akkadi,”</i> Syri breathes, biting at your [pc.ear]. <i>“Get ready for it.”</i>");
	output("\n\nGods, you’re ready! You whimper a little moan for her, pushing back on that turgid bitch-stick to get it as deep as you can before the throbbing you feel through it escalates to full-on cumshot. And just in time! You feel an eruption of hot, sticky seed spilling out into your ass, accompanied by bestial grunts from the ausar mounting you while she inseminates your asshole.");
	output("\n\nThe sudden feeling of fullness, of being made Syri’s bitch in such a primitive, animalistic way, drives you crazy with lust. ");
	if (pc.hasCock()) output("Your cock’s gotten rock-hard from the pounding, and the injection of seed inside you is enough to push you over. Arching your back and moaning into Myrra’s muff, you feel your [pc.cock] clench, then release, spilling [pc.cum] down your [pc.legs] and onto the floor. ");
	output("Your fingers desperately cling to the chubby flanks in front of you, concentrating on the pussy pressed against your lips, and glaze of fem-cum smeared across your [pc.face]. You wrap your [pc.tongue] one last time around the needy nub of Myrra’s clit, suckling on the hyper-sensitive mound until the huskar’s jiggling from ass to shoulders, quaking with pleasure and gasping wordless little cries that sound almost like your name. You can feel her lips clenching below you, smearing your chin with their sultry juices until a shrill cry erupts throughout the room, and a squirt of fem-cum squirts all across your [pc.chest].");
	output("\n\n<i>“Fuck!”</i> Myrra manages to scream. <i>“Oh! Oh my word... I’m breathing so hard...”</i>");
	output("\n\n<i>“Don’t faint, girl,”</i> Syri says, reaching over you to squeeze Myrra’s plush behind. <i>“We can’t scrape you up off the floor while we’re knotted.”</i>");
	output("\n\nMyrra giggles, peeling herself off of your [pc.face] and sinking down into her chair again. Cum and juices squelch lewdly underneath her as she breathlessly taps open the holo-terminal again. <i>“Let’s just put a big, fat ‘approved’ on this application...”</i>");
	output("\n\nSyri grins up at her, resting her chin on you. <i>“Atta girl... and hey, [pc.name]. Up here, bottom bitch.”</i>");
	output("\n\nYou feel a tap on the top of your head, prompting you to twist around to look at Syri -- and get yourself ambushed with a kiss. Her tongue laps around your [pc.lips], tasting the nectar still warm on them, before pressing into your mouth to tangle with your own.");
	output("\n\nNow just to wait until Syri’s knot comes down enough for you to move...");

	processTime(30+rand(15));
	pc.orgasm();
	pc.loadInAss(chars["SYRI"]);
	chars["SYRI"].orgasm();
	clearMenu();
	addButton(0,"Next",syriQuestJobInterviewOutro);
}

public function syriQuestJobInterviewSpitroast(x:int):void {
	clearOutput();
	showName("SYRI &\nMYRRA");
	showBust(syriBustDisplay(true),myrraBustDisplay(true));
	author("Savin");
	output("Well, now that is a tempting offer...");
	output("\n\nYou grab Myrra’s broodmareish waist and, with a little help from the woman herself, pull her out of her seat. You step back, making room for Myrra while she hooks her claws into her skirt and pulls it down. A glance over your shoulder shows Syri’s jaw go wide, just for a second, when the entire enormity of the huskar’s massive backside comes into view. Two full, flawless moons of pale puppy-flesh jiggle obscenely as Myrra snaps the band of her skirt down right where ass ");
	if (silly) output("meats"); 
	else output("meets");
	output(" thigh.");
	output("\n\n<i>“Pinch me, I’m dreaming,”</i> Syri murmurs under her breath, staring wide-eyed at the huskar’s plump derriere.");
	output("\n\nMyrra gives you both a look over her shoulder, wagging her tail while she slides her skirt and panties the rest of the way off. She bends way down, low enough to touch her toes, which has the surely-intentional effect of showing off the puffy pink puss hidded deep between those lush mounds of buttflesh. Myrra’s already soaked through from your foreplay, and her sex glistens wetly in the stale office light.");
	output("\n\nSyri grunts, and you hear the familiar <i>thunk</i> of her pants hitting the floor. <i>“Fuck it, that ass is mine,”</i> the shemale growls, stepping around the desk and grabbing Myrra by the waist. The huskar just moans for her, letting Syri push her against the desk and then, with both hands on Myrra’s ass, hefts her up onto it. Myrra’s legs lock around Syri’s hips, pulling the dickgirl flush against her so that her big red rocket flips onto the plump swell of her belly.");
	output("\n\n<i>“Ever been assfucked before?”</i> Syri says, putting a hand around Myrra’s neck and pushing her back down on the desk. <i>“You always look so pure and innocent, even with that divine body... I can’t believe [pc.name] managed to talk your panties off.”</i>");
	output("\n\nMyrra giggles, wrapping her arms under her mammoth tits. <i>“Really? I thought the whole office thought I was a slut!”</i>");
	output("\n\nThe ravenette shemale leans in, tightening her grip on the pale huskar. One of her hands slips down between her legs, and you’re treated to the sight of Myrra’s whole voluptuous body tensing, quivering with anticipation. <i>“And are you?”</i> Syri asks breathily, pumping her arm down between Myrra’s meathy thighs.");
	output("\n\n<i>“How ‘bout you open that drawer and find out?”</i>");
	output("\n\nOne of Myrra’s feet claw at a drawer, guiding Syri to open it up, reach inside, and pull out a little bottle of lube. Syri grins, showing her fangs as she pops the bottle open and dumps the contents onto her dick, smearing it across her throbbing red dogflesh and Myrra’s belly where it’s resting.");
	output("\n\nWhile they’re getting ready, you figure it’s about time for you to take advantage of the huskar’s plump lips and big, wet tongue. You plant your hands on Myrra’s huge breasts, pushing her back down on the desk so that her mouth is more or less level with your crotch. She blinks up at you, then licks her lips as her big blue eyes settle on your [pc.cockOrStrapon " + x + "].");
	output("\n\n<i>“That looks tasty,”</i> she moans, reaching up and wrapping her hands around your shaft. <i>“Can I give it a kiss?”</i>");
	output("\n\nYou nod and shift your hips, planting your [pc.cockOrStraponHead " + x + "] directly over Myrra’s mouth. She puckers up, planting a wet kiss directly on the crown of your " + (x >= 0 ? "cock, flicking her tongue around your cumslit until she milks out the first little leak of watery [pc.cumColor]":"buzzing faux-cock") + ". The way she moans hungrily, you don’t doubt she’d be content to make out with your dick for a good long while, but your wing-dickgirl’s got your back: she’s been busy aligning the tip of her bitch-stick to Myrra’s asshole. Giving you both a wink, Syri pushes forward with a slow but inexorable thrust. The huskar’s mouth snaps open in a hoarse cry of pleasure, which you quickly silence with your own dick, thrusting down into her mouth. Myrra’s tongue grazes the topside of your shaft as you pump down the tight tunnel of her throat, filling her with every inch of your dick");
	if (pc.balls > 1) output(" until your [pc.balls] are resting against her forehead");
	output(".");
	output("\n\nSpeared from both ends, Myrra writhes on the desk, arching her back and grabbing at the succulent mounds of her breasts. One of her hands delves down to rub the neglected mound of her vulva, plugging her one remaining open orifice with a pair of fluffy fingers. You can feel her throat clenching around your girth, squeezing hard around your cock until you pull back, giving the busty babe a much-needed break for breath. Your [pc.cockOrStrapon " + x + "] comes away slathered in spit, bridged to her lips by trembling ropes that glisten in the office lights.");
	output("\n\nHungry slut that she is, Myrra’s already panting your name before she’s caught her breath, pawing at your thighs and moaning with lust -- or maybe that’s from feeling Syri’s dick spearing into her ass, deep enough that her whole body jiggles with the impact of knot against assflesh. Syri’s grunting too, digging her claws into the huskar’s breeder hips and thrusting herself deep in Myrra’s ass.");
	output("\n\n<i>“God damn, this ass is sweet,”</i> Syri growls, pumping her hips a little faster. <i>“Makes me wanna... wanna...”</i>");
	output("\n\n<i>“Don’t you dare!”</i> Myrra yelps, grabbing Syri by the wrist. <i>“I’ve gotta sit down all day!”</i>");
	output("\n\nSyri grins, reaching across and sinking her fingers into one of Myrra’s breasts. <i>“Well, where am I supposed to blow this load then? You got about... ten seconds... to decide.”</i>");
	output("\n\nFor such a big girl, Myrra moves fast when she wants to. The pudgy puppy rolls off the desk and onto her knees, wrapping her fingers around your [pc.cockOrStraponNoun " + x + "] and Syri’s on either side of her. Her tits bounce and jiggle obscenely as she settles into place, slurping on your [pc.cockOrStraponHead " + x + "] while she jerks Syri’s throbbing shaft. Syri was pretty damn close on her promise, it turns out, and Myrra’s barely gotten situated before you see the shemale’s knot bulge between Myrra’s fingers, and then thick ropes of white spurt out across the huskar’s cheeks.");
	output("\n\nMyrra gasps, then giggles as steamy streaks of cream splatter her face, then start dropping down onto her tits. For her part, Syri shudders and grabs the desk for support, weakly thrusting her hips against the tight grip of the lusty huskar’s hand. Her knot twitches, trying to bury itself into Myrra’s fist. All it accomplishes is making more cockmilk leak out onto Myrra’s tits.");
	output("\n\nWhile Syri’s busying blowing her load, the huskar’s attention turns back to you, focusing those big blue eyes on your [pc.cockOrStraponNoun " + x + "]. She lets her tongue play across your glans, circling your crown before she slurps down the first inches of " + (x >= 0 ? "dickmeat":"hardlight dickmeat") + ". After the first oral session, you’re already on edge: it doesn’t take long for the hungry moans and slurping sucks coming from down low to make your [pc.cockOrStraponNoun " + x + "] throb with urgent need, swelling in Myrra’s mouth. ");
	if (pc.balls > 1) output("She squeezes your balls, massaging the churning orbs to help the impending eruption along. ");
	output("You let one of your hands play across her silky silver hair, urging Myrra down the remaining length so that you’re fully buried in her throat when the inevitable orgasm finally hits.");
	output("\n\n" + (x >= 0 ? "The first wave of [pc.cum] shoots straight down Myrra’s throat. Her eyes go wide, and you hear a husky moan around your dick as she drinks down your spunk -- the first few spurts, at any rate.":"The first twitch wiggles against Myrra’s throat. Her eyes go wide, and you hear a husky moan around your holodick as she reacts to your climax.") + " After that, though, she rears her head back, dragging your spasming rod out between her plush lips and lets your [pc.cockOrStraponNoun " + x + "] fall into her hands" + (x >= 0 ? ", shooting the rest of the load across her tits and the mane of fur around her neck":" to writhe in pleasure") + ".");
	output("\n\n");
	if(x >= 0) output("<i>“Oh, pearl necklace! How sweet!”</i> Myrra giggles, licking an oozing drop of [pc.cumColor] off one of her claws.");
	else output("<i>“Ooooh! How sweet!”</i> Myrra giggles, licking her lips.");
	output(" <i>“You sure know how to state your... qualifications... [pc.name]. I think you’ll be an excellent fit here at Haskarn’s.”</i>");
	output("\n\n<i>“Well that’s a relief,”</i> Syri sighs, slumping down into Myrra’s office chair. After a moment, she gets a clever little grin and pats her thigh, beckoning Myrra over. <i>“Why don’t you sit down on my lap and we can finish up that application...”</i>");
	processTime(30+rand(15));
	pc.orgasm();
	chars["SYRI"].orgasm();
	clearMenu();
	addButton(0,"Next",syriQuestJobInterviewOutro);
}

public function syriQuestJobInterviewOutro(postSex:Boolean = true):void {
	clearOutput();
	author("Savin");
	if (postSex) {
		showName("SYRI &\nMYRRA");
		showBust(syriBustDisplay(),myrraBustDisplay());
		output("<i>Some time, a little more hands-on interviewing, and one completed application later...</i>");
		output("\n\n<i>“Alrighty,”</i> Myrra sighs, wiping a little sweat off her brow. <i>“That’s all taken care of. Consider yourself employed. If you want to go down to the landing pad, you can ask your shift supervisor about starting today. Otherwise, we’ll see you at the start of the week, [pc.name]. And as for you, Ms. Dorna... I’ll see you in my office when you get back from your shift.”</i>");
		output("\n\nSyri grins. <i>“Yes ma’am.”</i>");
		output("\n\nThe two of you stagger out of the H.R. office, still adjusting your clothes and gear.");
		output("\n\n<i>“Well that went better than expected,”</i> your lover laughs, running a hand through the tangled mess her raven hair’s become. <i>“Ah man, I need to take you places more often. You’re a fun magnet... and a smoking hot intergalactic sex symbol who’s absolutely irresistible to all us ausar girls.”</i>");
		if (flags["ANNO_SEXED"] > 0) output("\n\nShe’s laughing, but at the rate you’re going...");
		output("\n\n");
	}
	else showSyri();
	output("Syri puts an arm around your shoulders and leads you deeper into the building. <i>“The hovercraft bay is just down here. Now I need you to make yourself scarce pretty much as soon as we get inside. Myrra put you in the system, so we won’t be triggering any biometric alarms... but it’ll be better if nobody notices you come in, and never come out, y’know?”</i>");
	output("\n\nYou nod.");
	output("\n\n<i>“Alright! Let’s get out there, then.”</i>");

	moveTo("AKD C23");
	processTime(5);
	clearMenu();
	addButton(0,"Next",syriQuestHovercraftHangar);
}

public function syriQuestHovercraftHangar():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("The room Syri leads you to next is a massive subterranean hangar at the bottom of a flight of stairs. A heavy-duty cargo hovercraft is parked in the middle with doors folded up under its wings, revealing a cargo bay stuffed full of crates and containers. Most of the workers you saw on your way in have migrated down to the launch pad, helping to load the hovercraft up in preparation for the day’s work.");
	output("\n\nA particularly muscular, bearded huskar is snapping orders between glances at a dataslate in his gold-furred hands. Must be the supervisor you were told about... and who you need to avoid for Syri’s half-baked plan to work.");
	output("\n\nWondering how you let yourself be talked into this (and not for the first time), you duck out from behind Syri and into the shadows behind one of the containers waiting to go aboard.");
	output("\n\nWhile you make yourself scarce, Syri saunters up to her super with a smile and a wag of her tail. <i>“Hey boss! What’s the good word?”</i>");
	output("\n\n<i>“Syri, glad you could join us,”</i> the blonde huskar says, clapping her shoulder. <i>“Where’s our newest recruit? I thought [pc.heShe]’d be joining us.”</i>");
	output("\n\n<i>“Nah,”</i> Syri lies. <i>“[pc.HeShe]’s just taking a look around the facility before heading home. I think [pc.heShe] said [pc.heShe]’d like to start working at week’s start. Keep things simple on the payroll.”</i>");
	output("\n\nThe supervisor laughs heartily. <i>“I like [pc.himHer] already! Alright, go help Auder move that fabricator aboard, eh?”</i>");
	output("\n\nThe two move off towards the other side of the hangar, giving you a few moments with nobody looking to decide what you’re going to do about disappearing...");
	output("\n\nThere’s several containers all around the place, but most of them are magnetically locked.");

	moveTo("AKD C25");
	processTime(15);
	clearMenu();
	if (pc.hasPerk("Stealth Field Generator")) addButton(0,"Stealth Field",syriQuestStealthField,undefined,"Stealth Field","Turn on your Stealth Field Generator and sneak aboard.");
	else addDisabledButton(0,"Stealth Field","Stealth Field","You need the Stealth Field Generator perk for this.");
	addButton(1,"Lock Bypass",syriQuestLockBypass,undefined,"Lock Bypass","Try and bypass one of the maglocks so you can hide inside a container.");
}

public function syriQuestStealthField():void {
	clearOutput();
	showBust(schoraBustDisplay());
	showLocationName();
	author("Savin");
	output("Well, this’ll be easy. You click on your stealth field generator and shimmer out of sight, blending into the shadows. While you’re hidden from view, you quickly make your way across the hangar and duck into the cargo hold underneath the hovercraft’s main fuselage. The next few minutes are spent being very quiet as you’re all but entombed behind other crates and containers, boxing you in until you have to curl up on yourself to fit.");
	output("\n\nBut you’ve gone undetected! You let out a long-held breath and press your eye to one of the gaps between the containers, watching the remaining workers file aboard. They have the luxury of a warm trip inside the passenger deck, and seem all too happy to get inside. You count Syri among their number, trying to act natural. The supervisor is the last man aboard, reaching up to pull down the bay doors.");
	output("\n\nJust as he’s about to close up, though, you hear a woman’s voice from outside: <i>“Hold up!”</i>");
	output("\n\nIt’s a strong, booming voice. Loud and commanding. The blonde huskar pauses mid-motion, giving time for the speaker to step aboard. She’s a tall, full-figured woman zipped up in a skin-tight blue Akkadi jumpsuit that flatters her ample curves in all the right ways. T");
	//output("hough she’s got the perky canine ears, t");
	output("he woman’s also got a pair of sweeping black horns growing from her brow, as well as bronzed skin and dark red eyes.");
	//output(" Definitely not a huskar... a halfbreed?");
	output("\n\n<i>“Room for one more?”</i> the woman asks, hefting a bulging rucksack on her shoulder.");
	output("\n\n<i>“Of course, Commander,”</i> the huskar man answers, stepping out of her way. <i>“Climb aboard! Enjoy your vacation?”</i>");
	output("\n\nThe woman laughs. <i>“It’s hard </i>not<i> to enjoy a week at a Heloith resort! After all those massages and all the pool time, I feel more loose and limber than I have in years.”</i>");
	output("\n\n<i>“Oh, is that all that’s put a spring in your step?”</i> he teases, pulling the door closed behind the ‘commander.’");
	output("\n\nShe grins and chunks her duffle bag down on the deck. <i>“Well, all the handsome tourists treating me like a piece of the local meat didn’t hurt, either. Perks of being half-dzaan!”</i>");
	output("\n\nThat seems to trigger some kind of in-joke, and both the commander and supervisor laugh on their way up the stairs to the passenger deck. Now that everyone’s out of earshot, you sigh and sit down, feeling the deck start to rumble underneath you. It isn’t much longer before the temperature starts to drop, and you can feel the hovercraft start zooming through the stormy Uvetan skies...");

	moveTo("AKD C27");
	flags["SYRIQUEST_LOCK_BYPASS"] = 2;
	processTime(15);
	clearMenu();
	addButton(0,"Next",syriQuestArriveAtAkkadiBase);
}

public function syriQuestLockBypass():void {
	moveTo("AKD C27");
	clearOutput();
	clearBust();
	showLocationName();
	author("Savin");
	output("You crouch down next to one of the electronic locks and start fiddling around. You’ve only got a few seconds to work before everyone’s attention turns to you -- enough for ");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output("20");
	else output("15");
	output(" rewires.");

	generateMap();
	clearMenu();
	addButton(0,"Next",syriQuestLockBypassMinigame);
}

//Should be modestly complex. Auto-fails after {X} turns. Tech Specialists get some bonus turns cuz smurt.");
public function syriQuestLockBypassMinigame():void
{
	userInterface.showMinigame();
	var gm:RotateMinigameModule = userInterface.getMinigameModule();
	
	var g:uint = RGMK.NODE_GOAL;
	var i:uint = RGMK.NODE_INTERACT;
	var l:uint = RGMK.NODE_LOCKED;
	
	var n:uint = RGMK.CON_NORTH;
	var e:uint = RGMK.CON_EAST;
	var s:uint = RGMK.CON_SOUTH;
	var w:uint = RGMK.CON_WEST;
	
	gm.setFailablePuzzleState(
		syriQuestLockBypassSuccess, 
		syriQuestLockBypassFailure, 
		RotateMinigameModule.MAX_MOVES, (pc.characterClass == GLOBAL.CLASS_ENGINEER) ? 20 : 15,
		5, 5, 
	[
		g | s    ,	i | n | e,	l        ,	i | n | e,	g | s    ,
		i | s | e,	i | s | w,	i | n | w,	i | n | s,	i | n|e|w,
		i | n | w,	i | n | e,	g | n | s,	i | s | e,	i | n | s,
		i | e | w,	l        ,	i | n | w,	i | s | e,	i | n | e,
		i | n | e,	g | w | e,	i | n | s,	i | e | s,	i | e | w    
	]);
}

public function syriQuestLockBypassSuccess():void {
	clearOutput();
	showBust(schoraBustDisplay());
	showLocationName();
	author("Savin");
	output("It takes you the barest few seconds to penetrate the lock’s security, and you’re just able to scarper inside the container and close the door behind you before anyone comes back your way. Letting out a sigh of relief, you look around your new surroundings: you’ve got a few feet of room to move around, wedged between the metal doors and several pallets full of metal plates all strapped together.");
	output("\n\nYou’re about to sit down when you hear several footfalls pass by outside. Must be the crew coming aboard. Once they’ve retreated out of earshot, and you feel the hovercraft start to rumble under your [pc.feet]. You risk the chance to slide the container door open a hair’s breadth. Peeking out, you’re treated to the sight of the supervisor, apparently the last man aboard, reaching up to pull down the bay doors.");
	output("\n\nJust as he’s about to close up, though, you hear a woman’s voice from outside: <i>“Hold up!”</i>");
	output("\n\nIt’s a strong, booming voice. Loud and commanding. The blonde huskar pauses mid-motion, giving time for the speaker to step aboard. She’s a tall, full-figured woman zipped up in a skin-tight blue Akkadi jumpsuit that flatters her ample curves in all the right ways. Though she’s got the perky pointed ears, the woman’s also got a pair of sweeping black horns growing from her brow, as well as bronzed skin and dark red eyes. Definitely not a huskar... looks more like a dzaan. Maybe a halfbreed?");
	output("\n\n<i>“Room for one more?”</i> the woman asks, hefting a bulging rucksack on her shoulder.");
	output("\n\n<i>“Of course, Commander,”</i> the huskar man answers, stepping out of her way. <i>“Climb aboard! Enjoy your vacation?”</i>");
	output("\n\nThe woman laughs. <i>“It’s hard </i>not<i> to enjoy a week at a Heloith resort! After all those massages and all the pool time, I feel more loose and limber than I have in years.”</i>");
	output("\n\n<i>“Oh, is that all that’s put a spring in your step?”</i> he teases, pulling the door closed behind the ‘commander.’");
	output("\n\nShe grins and chunks her duffle bag down on the deck. <i>“Well, all the handsome tourists treating me like a piece of the local meat didn’t hurt, either. Perks of being half-dzaan!”</i>");
	output("\n\nThat seems to trigger some kind of in-joke, and both the commander and supervisor laugh on their way up the stairs to the passenger deck. Now that everyone’s out of earshot, you sigh and sit down, feeling the deck rumble as the hovercraft takes off. It isn’t much longer before the temperature starts to drop, and you can feel the hovercraft start zooming through the stormy Uvetan skies...");

	processTime(15);
	flags["SYRIQUEST_LOCK_BYPASS"] = 1;
	clearMenu();
	addButton(0,"Next",syriQuestArriveAtAkkadiBase);
}

public function syriQuestLockBypassFailure():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("You move as fast as you can, trying to rewire the lock... but before you can finish the job, you hear footsteps behind you. You have just enough time to replace the face of the lock mechanism and take a step towards the shadows before you feel a large heavy paw on your shoulder.");
	output("\n\n<i>“Hey there, friend. You must be [pc.name].”</i>");
	output("\n\nTrying not to give yourself away, you turn around and face the bearded supervisor. He’s smiling at least -- maybe he didn’t see anything. But he saw you, which means there’s no hiding now.");
	output("\n\nYou nod to him and extend your hand, introducing yourself. He shakes it vigorously, locking you in a crushingly strong grip. ");
	if (pc.LQ() >= 75) output("You give as good as you get, though -- enough to make the huskar’s eye twitch in vexation. ");
	output("Over his shoulder, you catch a glimpse of Syri turning positively pale, tucking her tail between her legs.");
	output("\n\n<i>“Welcome aboard,”</i> your supervisor continues. <i>“We’ve still got a few minutes before we dust off. Why don’t I give you the grand tour of our facilities here?”</i>");
	output("\n\nYou try and bluff up some excuses, but the man won’t take no for an answer. You end up spending this next twenty or so minutes being led around the hangar, being shown the various high-tech equipment Haskarn’s has on hand, and having to try your hand at using more than a few of them. Syri is always a few paces behind, never getting involved but never letting you out of her sight, either. Guess she’s trying to play it cool.");
	output("\n\n<i>“So, Syri says you’re lookin’ to start on Monday, eh?”</i> the man says as he turns off a huge steel-rending machine you were just cajoled into using. <i>“Too bad, you’ve got a knack for this kind of work. Well, why don’t I walk you out?”</i>");
	output("\n\nUh oh. Time to improvise!");
	if (pc.isBimbo()) {
		output("\n\n<i>“Oh, what a gentleman!”</i> you purr, running a finger around the huskar’s chest carpet. He grins and puts a big, strong hand on your back, ready to guide you out. Well, you know one good way to keep a man distracted...");
		output("\n\nBefore he gets you outside, you get him into the bathroom and thrust your head down on his cock, slurping up red ausar cockflesh with lusty gusto. The huskar man is big and strong, but you know how to handle him; he’s a whimpering puppy in your hands before too long, blowing load after load down your throat. By the time you’re done with the bearded viking hound, he’s slumped back on a toilet with his chest heaving, body slicked with sweat.");
		output("\n\n<i>“See ya Monday, big boy!”</i> you call, blowing him a kiss as you sashay out... and right back where you were trying to be. Everyone else on the construction crew has packed up and boarded the hovercraft. While the super is recovering, you do too, sneaking into one of the cargo crates and sealing yourself in. A few minutes later, you hear your new boy-toy stagger inside, close the doors, and head upstairs. Once he’s gone, the craft starts rumbling, and you feel your cum-stuffed stomach lurch. Takeoff!");
	}
	else if (pc.isBro()) {
		output("\n\n<i>“Nah, bro,”</i> you say, leaning back against the machine. <i>“All this stuff’s got me too pumped! Let’s get out there already!”</i>");
		output("\n\nYour new super grins. <i>“That’s the spirit! C’mon, hop in and we’ll find somewhere you can pitch in when we get to today’s site.”</i>");
		output("\n\nWell, this sure isn’t the way you and Syri wanted this to go, but... at least you’re gonna get to the Akkadi base. That’s something.");
		output("\n\nOnce you’re aboard, the ship shudders and takes off. You’re escorted upstairs to the crew deck, a simple affair of benches and harnesses for the workers to sit on for the short overland flight. You find a seat in the back, and are quickly joined by Syri.");
		output("\n\n<i>“Well shit,”</i> she sighs.");
		output("\n\nYou nod.");
		output("\n\nAbout twenty minutes passes in flight. The workers talk amongst themselves, and from your position in the back of the shuttle, it seems like most of them forget about you. Near the flight’s end, you and Syri exchange a glance, realizing it’s time to act or accept defeat.");
		output("\n\n<i>“Just follow my lead,”</i> Syri whispers into your ear. Before you can answer, your lover swings herself into your lap and grabs you by the ");
		if (pc.hasArmor()) output("[pc.armor]");
		else output("shoulders");
		output(". With a low, hungry growl, she thrusts her tongue into your mouth. Her tail arches, swaying back and forth in the unmistakable ausar sign of pleasure.");
		output("\n\nHard to say no to this! You wrap your arms around Syri’s waist, holding her steady while she fucks your mouth. That draws a few gazes... and when Syri hauls you to your [pc.feet], they watch her all but drag you out of the crew deck and back down to the cargo hold. Syri slams you back against a container like she’s ready to mount you then and there... until her hand swipes an I.D. card across a reader, and the door hisses open.");
		output("\n\n<i>“Hide, idiot,”</i> she grunts, and pushes you inside. Before you can talk back, the door closes behind her. You sigh and slump down in the dark, hoping nobody comes looking for you.");
	}
	else if (pc.isNice()) {
		output("\n\n<i>“Uh, actually, all this has me ready and rarin’ to go!”</i> you lie. <i>“Maybe I should start today!”</i>");
		output("\n\nYour new super grins. <i>“That’s the spirit! C’mon, hop in and we’ll find somewhere you can pitch in when we get to today’s site.”</i>");
		output("\n\nWell, this sure isn’t the way you and Syri wanted this to go, but... at least you’re gonna get to the Akkadi base. That’s something.");
		output("\n\nOnce you’re aboard, the ship shudders and takes off. You’re escorted upstairs to the crew deck, a simple affair of benches and harnesses for the workers to sit on for the short overland flight. You find a seat in the back, and are quickly joined by Syri.");
		output("\n\n<i>“Well shit,”</i> she sighs.");
		output("\n\nYou nod.");
		output("\n\nAbout twenty minutes passes in flight. The workers talk amongst themselves, and from your position in the back of the shuttle, it seems like most of them forget about you. Near the flight’s end, you and Syri exchange a glance, realizing it’s time to act or accept defeat.");
		output("\n\n<i>“Just follow my lead,”</i> Syri whispers into your ear. Before you can answer, your lover swings herself into your lap and grabs you by the ");
		if (pc.hasArmor()) output("[pc.armor]");
		else output("shoulders");
		output(". With a low, hungry growl, she thrusts her tongue into your mouth. Her tail arches, swaying back and forth in the unmistakable ausar sign of pleasure.");
		output("\n\nHard to say no to this! You wrap your arms around Syri’s waist, holding her steady while she fucks your mouth. That draws a few gazes... and when Syri hauls you to your [pc.feet], they watch her all but drag you out of the crew deck and back down to the cargo hold. Syri slams you back against a container like she’s ready to mount you then and there... until her hand swipes an I.D. card across a reader, and the door hisses open.");
		output("\n\n<i>“Hide, idiot,”</i> she grunts, and pushes you inside. Before you can talk back, the door closes behind her. You sigh and slump down in the dark, hoping nobody comes looking for you.");
	}
	else if (pc.isMischievous()) {
		output("\n\nYou follow the huskar out of the hangar, almost all the way to the door, before making a quick excuse about needing to go to the bathroom. He checks the holoband on his wrist and shrugs, telling you to let yourself out just down the hall here. You duck into the bathroom, wait a minute for the sounds of his footsteps to recede, and then double back, back to the hangar. You just manage to slip into the other side of the hovercraft’s cargo bay doors before they seal up, and you watch the supervisor and a woman in an Akkadi uniform step up into the crew cabin. When they’re gone, the ship seals and the deck rumbles unde your [pc.feet], finally lifting off.");
	}
	else {
		output("\n\n<i>“Sure,”</i> you say, following the huskar out of the hangar. About halfway down the entrance hallway, you realize that there’s nobody around and no security cameras in this particular stretch. Too bad for this guy. You give him a quick smack on the back of the head, catching his body before he can collapse in a big, noisy pile of ausar man-meat. There’s a janitorial closet nearby, just big enough for you to toss him into, tied up and gagged with some spare rags.");
		output("\n\nOnce he’s secured, you head back the hangar. Looks like in your absence, everybody’s boarded the craft, leaving you with plenty of time to get aboard and find somewhere to hide. The hovercraft waits a good little while, apparently for the super to return, but eventually you feel the deck shudder under your [pc.feet] as it lifts off. Work waits for no man.");
	}
	
	flags["SYRIQUEST_LOCK_BYPASS"] = -1;
	processTime(30);
	clearMenu();
	addButton(0,"Next",syriQuestArriveAtAkkadiBase);
}

public function syriQuestArriveAtAkkadiBase():void {
	clearOutput();
	showSyri();
	author("Savin");
	if (pc.willTakeColdDamage()) {
		output("The journey to the Akkadi base is miserable beyond words. Shortly after takeoff, all the heat drains out of the cargo hold, leaving you to freeze your ass off in the Uvetan cold. You can barely feel your body, and you’re trembling uncontrollably.");
		pc.changeHP(-Math.round(pc.HPMax()/2));
		if (pc.HP() < 1) pc.HP(1);
	}
	else output("The journey is boring, spent playing around on your Codex between bouts of paranoia, listening for footsteps that never come.");
	output("\n\nEventually, the ship shudders, coming to a halt and slowly lowering to the ground. When it lands, you’re jostled awake and alert, just in time to hear the construction crew start filing down from above. You get as quiet as you can, peering out from your hidey-hole as the pack of huskar gather at the door. It opens with a rush of frigid air and blinding light, making even the extra fluffy ausar shudder and complain. Still, they start filing out until only Syri is left aboard.");
	output("\n\nWhen she’s sure nobody’s watching, she quickly comes over to where you’re hiding and whispers, <i>“Okay. Just chill out in there for a bit. I’ll call you when I’m about to cut the power. You’re only going to have a few seconds to bolt into the facility. You’ll have to run across the skeleton of the bridge, then go straight through the big doors. Try not to enjoy the warmth in there too much, okay?”</i>");
	output("\n\nAnd what’s she going to be doing while you’re snooping around inside?");
	output("\n\n<i>“I’m gonna be causing as much of a distraction as possible,”</i> she laughs. <i>“I’ll try and keep the power off as long as I can... but if you see any security stations, a little sabotage from inside would be a good plan.”</i>");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) {
		output("\n\n<i>“Are you sure you know what you’re doing?”</i> you ask. You <i>have</i> to ask at this point.");
		output("\n\n<i>“Yeah, ‘course,”</i> Syri counters. She turns towards the exit, saying over her shoulder, <i>“Just trust me! I’ve got your back!”</i>");
		output("\n\nThis plan does not inspire confidence, but you’re already a ");
		if (pc.gooScore() > 3) output("goo");
		else output("meat");
		output(" popsicle in a cargo hold in the ass end of nowhere, so... guess you’re going along with it.");
	}
	else output("\n\nGuess you’ll just have to trust that Syri knows what she’s doing.");
	output("\n\nSyri jogs off the ship, following her coworkers out into the frigid cold. She ‘accidentally’ leaves the door open, meaning you’ll have no problem getting out when the time comes.");

	processTime(120);
	clearMenu();
	addButton(0,"Next",syriQuestEnterAkkadiBase);
}

public function syriQuestEnterAkkadiBase():void {
	clearOutput();
	clearBust();
	showName("AKKADI\nBASE");
	author("Savin");
	output("She doesn’t keep you waiting for long.");
	output("\n\nYou’d guess about ten minutes pass before your Codex vibrates with an incoming call. Syri’s on the other end when you answer, muffled by the roar of the winds so that you can barely hear her, even with her mouth right next to the microphone.");
	output("\n\n<i>“Ten seconds,”</i> is all she says before disconnecting.");
	output("\n\nGuess it’s go time. You extricate yourself from your hiding place, running up to the cargo bay door and pressing your shoulder into the shadows there. From here, you have a brief, momentary overlook of the Akkadi base. It sits atop both sides of the great glacial rift, two large black buildings leaning out over the seemingly-bottomless canyon of ice. A long, spindly bridge connects the two halves of the complex, barely more than a flat plane of metal suspended by cables. Looks like it’s still under construction... as is the building you’re parked on, it looks like. You can see a big crane looming over it, whirring along with an armful of metal beams that are headed for a quarter of the far side that’s still skeletal and exposed to the elements.");
	output("\n\nYou’re staring right at the crane when the power cuts. It shudders, cargo wobbling, as it’s suddenly brought to a total stop. You hear yelling from below as the lights, shields, and heat cut out, leaving the workers temporarily blind and freezing in the frigid winds.");
	output("\n\nNow’s your chance!");
	output("\n\nYou duck out of the hovercraft and book it down to the bridge, keeping to cover behind construction equipment and snowbanks until you’re able to slide down the maintenance ladder from the hoverpad down to the same level as the bridge. You dash across, as quick as you dare considering how thin the bridge is, and how hard the wind blows through the ice canyon. And it is <i>blowing</i>, strong enough to nearly blow you overboard to an icy death.");
	output("\n\nAnd then you’re across, hugging the big metal security door on the other end. From here, you can’t even see the other side of the bridge anymore -- the wind’s picked up something fierce, blowing snow and ice like a haze all around you. Whatever Syri did, it seems to have let loose the storm! ");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output("God dammit, you should have known something like this was going to happen... there must have been a weather shielding network to protect the work site. No power, no shields!");
	else output("Syri must have accidentally taken down some kind of weather shield.");
	output("\n\nWell, lucky for you, your mission is inside.");
	output("\n\nWith the power out, the security doors don’t pose much of a problem, and soon you’re in the slightly-less-frigid confines of the Akkadi base...");

	flags["SYRIQUEST_STATE"] = 4;
	processTime(15);
	clearMenu();
	addButton(0,"Next",syriQuestEnterAkkadiBase2);
}

public function syriQuestEnterAkkadiBase2():void {
	clearOutput();
	currentLocation = "AKD K31";
	mainGameMenu();
}

public function syriQuestAkkadiBaseSecurityRobotsEncounter():void
{
	clearOutput();
	showAkkadiSecBots();
	author("Savin");
	output("As you’re running down the sterile corridor, you suddenly hear a shuddering <i>creeeak</i> of metal grinding on metal. You spin around, watching panels slide open on the walls behind you. From hidden alcoves, several quadrupedal security robots -- each not much bigger than a trash can, and plated with shiny Akkadi-blue armor -- stomp out. They’ve got angled blast shields in place of faces, and between the plates, each robot has the all-too-familiar shape of a gun barrel peeking out, scanning around for targets.");
	output("\n\nAnd they settle on you!");
	output("\n\n<i>“INTRUDER! CEASE RESISTANCE, DISARM, AND LAY FLAT ON THE GROUND.”</i>");
	
	var numEnemies:int = 3+rand(2);
	var hostiles:Array = [];
	for (var i:int = 0; i < Math.min(4, numEnemies); i++)
	{
		hostiles.push(new AkkadiSecurityRobots());
	}
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(hostiles);
	CombatManager.displayLocation("SECURITY");
	CombatManager.victoryScene(syriQuestAkkadiBaseSecurityRobotsVictory);
	CombatManager.lossScene(syriQuestAkkadiBaseSecurityRobotsDefeat);
	CombatManager.encounterTextGenerator(AkkadiSecurityRobots.encounterTextGen);

	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function syriQuestAkkadiBaseSecurityRobotsDefeat():void
{
	clearOutput();
	showAkkadiSecBots();
	author("Savin");
	output("One of the robots growls, stomping over and delivering a solid kick to your stomach, planting you directly in the ground. <i>“Intruder neutralized!”</i> it barks, stomping on your chest to pin you on the ground.");
	output("\n\nA moment passes.");
	output("\n\nThen another.");
	output("\n\nYou groan and squirm under the robot, but it’s... not moving. At all. Slowly, warily, you push the robotic guard-dog’s leg off your chest. It doesn’t fight back until you’re completely out from under it, whereupon the robot beeps noisily and looks up at you.");
	output("\n\n<i>“SECURITY PERSONNEL ARE PREOCCUPIED. WE WILL LET YOU OFF WITH A FINE THIS TIME.”</i>");
	output("\n\nUh, okay. The guard-bot’s gun is still tracking you, and you really don’t want to get shot by more beanbags... so when a little screen pops out of its flank, you just swipe your Codex and be done with it. ");
	//-1000 Credits; -1000 more per guard bot defeated
	var moneyFine:int = Math.round(1000 + (CombatManager.enemiesAlive() * 1000));
	pc.credits -= moneyFine;
	if (pc.credits <= 0) output("The fact that you’re broke doesn’t seem to bother the guard bot. It just beeps at you and then takes its pack and retreats into the side panels from whence it came.");
	else output("The robot siphons off some credits and beeps approvingly before leading its pack back into the wall alcoves and disappearing.");
	if (flags["SYRIQUEST_ELEVATOR_STATE"] == undefined || flags["SYRIQUEST_ELEVATOR_STATE"] == 0) output("\n\nWonder what happened to the security staff...");
	CombatManager.genericLoss();
}

public function syriQuestAkkadiBaseSecurityRobotsVictory():void
{
	clearOutput();
	showAkkadiSecBots();
	author("Savin");
	output("The last of the robots collapses, and as the din of weapon fire fades, you’re left once more with an eerie silence. There’s... nothing. Nobody’s rushing out to see what’s happening. No screams. No jackbooted security guards charging you. The lockdown’s keeping everyone, even the people in charge, sealed out of your way.");
	output("\n\nGlancing around warily, you put your [pc.weapon] away and turn back to the hall ahead. Better get a move on.\n\n");
	CombatManager.genericVictory();
}

public function syriQuestAkkadiBaseShowersWatch():void
{
	clearOutput();
	showSchora(true);
	author("Savin");
	output("Considering everybody’s trapped on the lower levels, you guess you have a few minutes to enjoy the veiled sight of a busty Akkadi babe fucking <i>herself</i>. You slide the door open just enough to slip inside -- wouldn’t want her to get cold, after all -- and find a seat against the wall opposite her.");
	output("\n\nThe mysterious woman is a dark, shadowy outline on the other side of the curtain, just defined enough to let you see the womanly shape of her body and a hint of bronze-colored flesh and rose-gold hair. One of her hands is wrapped around a breast, fingers sinking into soft flesh and pinching a coal-black nipple. ");
	output("\n\nHer other hand’s got something in it down between her legs. At first, you think it’s the shower head, blasting her pussy with the stream... until she leans back against one of the walls, and you see something small but distinctly cock-shaped jutting out from her crotch. Maybe five or six inches, quite small compared to her ample breasts and the baseball-sized sack hanging underneath it.");
	output("\n\nWhat a twist!");
	output("\n\nYou watch as the alien dick-girl wraps her fingers around her petite prick, slowly gliding up and down the wet shaft.");
	output("\n\n<i>“Fuck yeah,”</i> she moans, so softly you can barely hear it over the roar of the shower. <i>“Pound my worthless pussy!”</i>");
	output("\n\nHer breath quickens, little moans emphasizing the rise and fall of her chest. Her breasts jiggle in her grasp, quaking as she starts thrusting her hips against her hand. You hear the familiar wet slapping sound of flesh on slippery skin. The dickgirl’s going hard now, thrusting into the tight grip of her hand.");
	output("\n\nSuddenly, she arches her back and goes rigid, pumping her cock to the very base -- the thick, knotty base, you note. You catch a glimpse of a nice, thick streak of cum squirt out from between her fingers, arcing far enough to splatter on the far wall. The woman gasps, shivers, and slowly starts to slide down the wall to a sit.");
	output("\n\nNow would be a good time to make yourself known, if you want...");

	processTime(15);
	clearMenu();
	addButton(0,"Approach", syriQuestAkkadiBaseShowersApproach,undefined,"Approach","Try and speak to the lusty lady.");
	addButton(1, "Leave", syriQuestAkkadiBaseShowersLeave, undefined,"Leave","Leave her to recover on her own.");
}

public function syriQuestAkkadiBaseShowersLeave():void
{
	flags["MET_SCHORA"] = 2;
	move(rooms[currentLocation].southExit);
}

public function syriQuestAkkadiBaseShowersApproach():void
{
	flags["MET_SCHORA"] = 3;
	clearOutput();
	showSchora(true);
	author("Savin");
	output("You take an intentionally loud step forward, rapping your knuckles on the glass of the door as you stride towards the showers.");
	output("\n\nThe alien woman gasps and jumps up. <i>“Oh shit! What time is it?”</i> she yelps, wrapping an arm around her chest. You still can’t make out too much of her actual features, other than her shapely figure and a pair of horns growing out from her brow, sweeping back across her scalp.");
	if (flags["SYRIQUEST_LOCK_BYPASS"] >= 1) output(" Wait, is that the so-called ‘commander’ who boarded the hovercraft after you? Halfbreeds with horns can’t be <i>that</i> common, after all...");
	output("\n\n<i>“Lost track of time");
	if (flags["SYRIQUEST_LOCK_BYPASS"] >= 1) output(", commander");
	output("?”</i> you ask, continuing to approach.");
	output("\n\nShe laughs, slowly lowering her arm from her bosoms. <i>“Yeah, maybe. Why? You didn’t hear anything, did you?”</i>");
	output("\n\nDid you?");

	processTime(3);
	clearMenu();
	addButton(0,"What’s Up?", syriQuestAkkadiBaseShowersWhatsUp,undefined,"What’s Up?","She’s the first actual person you’ve seen since you got here. Shouldn’t there be an entire staff here... and security... and researchers?");
	addButton(1,"Yeah I Did", syriQuestAkkadiBaseShowersYeahIDid,undefined,"Yeah I Did","You sure heard something. Maybe something you could get in on...");
}

public function syriQuestAkkadiBaseShowersWhatsUp():void
{
	clearOutput();
	showSchora(true);
	author("Savin")
	output("<i>“Forget that. Where is everyone?”</i> you ask. <i>“You’re the only other person I’ve seen!”</i>");
	output("\n\nThe conversation’s tone changes immediately. The woman yanks back a corner of the curtain, revealing a bronze-skinned face fringed by sodden rose-gold hair, parted around horns and");
	//output(" fuzzy");
	output(" pointed ears. She stares at you with hard red eyes, brow furrowed. <i>“What do you mean ‘where’s everyone’? And who are <b>you</b> supposed to be?”</i>");
	output("\n\nSkirting the second question, you tell her that there’s nobody in the halls. The facility’s on lockdown. The power’s barely running.");
	output("\n\nThe woman curses and throws the curtain aside -- giving you a momentary look at a full rack of F-cup tits, each capped with a coal-black nipple, and a small knotty human cock over a comparatively massive set of balls swinging between her legs -- before she grabs a towel and throws it over herself.");
	output("\n\nShe’s got little regard for modesty, roughly slapping the water off her body while demanding <i>“Why didn’t you say so!? Fuck, what happened?”</i>");
	if (pc.isNice()) output("\n\n<i>“Power went out,”</i> you tell her. It’s the truth... just not all of it.");
	else output("\n\nYou shrug.");
	output("\n\n<i>“I told them to put alarms in here. I told them!”</i> she growls, throwing the towel in your face. She stomps past you into the locker room, letting her balls and boobs bounce with utter disregard for you. With movements so confident that they have to be practiced, the woman throws open one of the lockers and stuffs herself into a very tight blue Akkadi uniform, then pulls on a ballistic vest over it.");
	output("\n\nYou get a moment’s worry when she pulls out a belt with a holstered hand cannon on it, but she just clips it on and yells over her shoulder, <i>“Don’t go anywhere.”</i> The woman jogs out of the locker room and down the hall towards the elevator.");
	output("\n\nWell, there she goes, you guess. You were kind of hoping she might shed some light on what happened in the few minutes between the power dropping and your arrival, but it looks like she was just as clueless as you were.");

	processTime(5);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function syriQuestAkkadiBaseShowersYeahIDid():void
{
	clearOutput();
	showSchora(true);
	author("Savin");
	output("<i>“Oh I heard something alright,”</i> you say, stepping forward with a sexy swagger. <i>“");
	if (pc.isAss()) output("Something about a dirty girl needing her worthless pussy pounded");
	else output("Some needy girl’s been getting dirty in the shower");
	output(".”</i>");
	output("\n\nThe alien woman growls and pulls back a corner of the shower curtain, revealing a chiseled, bronze-skinned face fringed by rose-gold hair. A pair of perky ears twitch on either side of a pair of curling horns that grow from her brow. She’s not a dzaan, though... not purely, anyway, if the big knot and patches of fuzz are anything to go by. A half-ausar, maybe");
	if (pc.isTreated()) output(", unless she’s been getting poked on New Texas recently");
	output("? She’s scowling, but you can see a coal-black nipple peeking out, still rock-hard.");
	output("\n\nYou play it cool, closing the distance. After all, if she didn’t want somebody seeing her lewd display, she wouldn’t have been doing it in a public shower, would she? She was just hoping someone would stumble on her... and take advantage. You say as much, and the halfbreed’s skin darkens... but she doesn’t deny it.");
	output("\n\nIndeed, the woman bites her lower lip for a moment, then fixes you with her dark red eyes. She throws the curtain aside, revealing a lusciously thick, curvaceous body; not chubby like a huskar, but statuesque like a dzaan alpha. Her big F-cup breasts rise and fall hypnotically with her quick breaths, jiggling softly, and between her legs... your eyes fixate on a human-shaped cock, relatively small, but with a plump knot and a big apple-sized sack hanging behind it.");
	output("\n\n<i>“So what, you offering?”</i>");
	output("\n\n<i>“Wouldn’t be interrupting the show if I wasn’t,”</i> you answer, starting to pull off your [pc.gear]. ");
	output("\n\nThe ");
	//output("dog");
	output("knife");
	output("-eared woman blinks, then laughs and steps back into the rushing waters of the shower, crooking a finger to you.");
	output("\n\nYou follow her in, shrugging off the last of your gear before submerging yourself in the steamy downpour. The dusky dickgirl keeps retreating until her back’s against the wall, letting you pin her between yourself and the slick tile. <i>“I guess I deserve one more day of vacation,”</i> she moans as you grab her ass, pinning her little dick between your bodies and groping one of her meaty breasts.");

	processTime(10);
	clearMenu();
	// -1 = no cock
	var x:int = -1;
	if (pc.hasCock() && pc.cockThatFits(chars["SCHORA"].vaginalCapacity(0)) >= 0) addButton(0,"TreatHerRight",penisRouter,[syriQuestAkkadiBaseShowersTreatHerRight,chars["SCHORA"].vaginalCapacity(0),false,0],"Treat Her Right","A beauty like this needs to be treated like a lady... a dirty, slutty dickgirl of a lady, but still.");
	else addButton(0,"TreatHerRight",syriQuestAkkadiBaseShowersTreatHerRight,-1,"Treat Her Right","A beauty like this needs to be treated like a lady... a dirty, slutty dickgirl of a lady, but still.");
	if (pc.hasCock() && pc.cockThatFits(chars["SCHORA"].vaginalCapacity(0)) >= 0) addButton(1,"TreatHerBad",penisRouter,[syriQuestAkkadiBaseShowersTreatHerBad,chars["SCHORA"].vaginalCapacity(0),false,0],"Treat Her Bad","Treat this chunky dickgirl like the big, slutty half-puppy she is.");
	else addButton(1,"TreatHerBad",syriQuestAkkadiBaseShowersTreatHerBad,-1,"Treat Her Bad","Treat this chunky dickgirl like the big, slutty half-puppy she is.");

}

public function syriQuestAkkadiBaseShowersTreatHerRight(x:int):void
{
	clearOutput();
	showSchora(true);
	author("Savin");
	
	var vIdx:int = -1;
	
	output("<i>“Schora. Alyru Schora.”</i>");
	output("\n\nYou quirk an eyebrow.");
	output("\n\n<i>“That’s the name you’re gonna be moaning,”</i> she winks, circling a leg around yours. You feel her little dick throb, pressed against your [pc.belly], and her arms settle around your shoulders.");
	output("\n\n<i>“[pc.name],”</i> you answer back, circling your fingers around one of her pebbly black areola. Alyru moans approvingly, slowly gyrating her hips to rub her prick against your [pc.skinFurScales]. You guess that’s the formalities out of the way, so you push her back against the stall wall and thrust your [pc.tongue] into her mouth, exploring the sharp little fangs and the broad, ausar-like tongue within. ");
	output("\n\nThe hands that were wrapped around your back slip downwards, tracing across your [pc.chest]");
	if (pc.hasBreasts()) output(" and groping at your breasts, cupping and squeezing them");
	else output(", running her fingers across the muscles there");
	output(". Oh, that’s nice... especially when those magic fingers start playing around your [pc.nipples], pinching and stroking until you’re getting just as excited as Alyru and her rock-hard cock.");
	if (x >= 0) {
		output("\n\nYou feel your own " + pc.cockDescript(x) + " stiffening, grinding against the half-dzaan’s bronzed thigh until it’s at full mast, searching for a hole to slide into. One of Alyru’s hands reaches down, wrapping around your turgid girth and starting to stroke it, slowly at first, letting the water lubricate her motions until she’s properly pumping away. You push back against the lustful dickgirl, squishing her a little tighter between you and the wall, digging your hands into her plush flesh.");
		output("\n\nIt’s taken you no time at all to go from idle curiosity to unrestrained desire for this chocolate she-wolf’s body. You dig your hands into her plump flanks and turn her around, pushing her face-first into the tiles. Her ass is fucking <i>huge</i>, a pair of perfectly shaped mounds of jiggling booty that thrust back against your crotch. Your cock’s almost instantly enveloped, swallowed up into the butt-cleavage you’ve suddenly exposed -- and you wouldn’t have it any other way. Alyru’s been in here long enough that the water’s soaked into all the hard to reach places, making it nice and slick for you: it’s easy to rock your hips back and forth, fucking her crack between hard spanks and squeezes and gropes.");
		output("\n\n<i>“Oh! That’s the stuff!”</i> Alyru moans, thrusting back against you. One of her hands hefts up a plump bronze boob, squeezing it between her fingers, while the other reaches back, brushing against your thigh. Gently, she guides your hands to her hips, her intentions clear: hold on, and fuck her hard.");
		output("\n\nYou give her exactly what she wants.");
		output("\n\nYou tighten your grip on Alyru, holding her steady while you pull your own hips back, dragging your " + pc.cockNounComplex(x) + " back through the channel of her asscrack. A little work and you’re lined up with the slick pussyslit hidden between those full-moon cheeks. Your " + pc.cockHead(x) + " presses in between her lips, gently parting the fleshy folds. Alyru lets loose a soft moan as you start to enter her, and you can feel her muscles tightening -- including her cock twitching, leaking dickmilk onto her thighs.");
		
		pc.cockChange();
		
		output("\n\nAlyru flashes you a little grin over her shoulder and wiggles her hips, taking the first inch of your dick. <i>“C’mon, stud, give it to me!”</i>");
		output("\n\nShe asked for it. You slam yourself in ");
		if (pc.cocks[x].cLength() >= 8) output("as deep as you can go");
		else output("all the way to the hilt");
		output(", and Alyru’s scream of pleasure echoes throughout the room. Her body goes stiff for a moment, clenching hard around your sudden invasion, before relaxing as she sighs and moans. The tension bleeds out of her, letting you start to move your [pc.hips] and fuck that pussy like it deserves: hard, fast, and loud.");
		output("\n\nThe sound of your hips slapping against Alyru’s ass fills the showers. Your partner’s plump balls swing underneath her, rocking back and forth with the impacts. You can feel just how full and heavy they are just from the way they move! The halfbreed slut gropes herself and strokes her cock, letting you decide exactly how hard to pound her into the wall.");
		output("\n\nAnd how she gets off, apparently. Alyru’s pussy clenches around your " + pc.cockNounComplex(x) + " at the apex of one womb-deep thrust, holding you inside her. Even drenched in hot water as you are, you’re able to feel a sudden flood of sultry moisture around your shaft, spilling down her dusky thighs. The real show is in front of her, though: her cock is pressed straight downward, crown swelling against the tile before leaking a thick streak of white cream. Her cum smears across the shower wall, drooling downwards in thick rivulets before being washed away by the beating rain of the shower.");
		output("\n\n<i>“Oh, <b>fuck</b>,”</i> Alyru says with a shudder you feel all the way to your " + pc.knotDescript(x) + ". You don’t let up just because she came, of course. The second her grip on your " + pc.cockDescript(x) + " slacks, you start thrusting again, just as hard as before. <i>“Oh fuck oh fuck oh FUCK!”</i>");
		output("\n\nIt’s all of a minute of her blubbering and gasping before her cock stiffens again, and more of that sweet, musky white is dripping down the walls. Alyru desperately tugs on her little dick, milking out more and more until her cum-swollen sack attains its sweet release. You reach down and give her balls a gentle squeeze, feeling how much lighter they’ve gotten since you starting pounding her pussy. You can see the fruits of your labor splattered on the tiles between Alyru’s legs, pooling under her dainty little feet.");
		output("\n\nYou let the twitches and erratic clenches of Alyru’s orgasming quim finally lead you to your own climax. ");
		if (pc.hasKnot(x)) output("You give her one last, mighty thrust, burying your " + pc.knotDescript(x) + " into the sodden slit of her pussy. Alyru screams and cums again, spraying her cockmilk all over the wall one last time while you unload into her waiting womb. With nowhere else to go, your [pc.cum] fills her up from the depths out, trapped inside her spasming slit.");
		else output(" [pc.Cum] rushes up through your [pc.cock " + x + "], swelling your member turgid for a split second before erupting into Alyru’s innermost depths.");
		output(" You gasp, a ragged sound from deep in your chest, as your orgasm paints the halfbreed’s inner walls [pc.cumColor]. Your [pc.chest] presses into her back, holding this naked stranger close until your climax passes, leaving her full of your jizz and the shower floor a sloppy mess between your [pc.feet].");
		if (pc.hasKnot(x)) output("\n\nThankfully for your mission, the water’s lubed Alyru up inside and out. With a little work, you’re able to pull your knot back out of her -- but not without triggering one last orgasm from the poor half-ausar. She’s only able to give you a few little spasms from her dick, dripping the last of her cum onto the ground. When your [pc.knot " + x + "] pops free, a deluge of spunk spills free, leaving Alyru’s thighs a creamy [pc.cumColor].");
		output("\n\n<i>“Fuck yeah!”</i> Alyru sighs, shivering as a little of your seed leaks down her legs. <i>“First day back on the job... pretty good so far.”</i>");
		output("\n\nShe laughs, slowly slumping down onto the floor. Guess you’ve satiated the lusty halfbreed, though you’re no closer to your actual goals. ");
		output("\n\nBut hey, never a bad time to get your dick wet, right?");
	}
	else {
		if (pc.hasVagina()) {
			vIdx = pc.cuntThatFits(chars["SCHORA"].cockVolume(0));
			if(vIdx < 0) vIdx = rand(pc.vaginas.length);
		}
		
		output("\n\nOne particular pinch makes you gasp, squirming until Alyru lets you go. She’s giggling, and her hands quickly settle on your shoulders, gently pushing downwards. <i>“You’ve got a good tongue,”</i> she smirks. <i>“Can I see what it feels like around my dick?”</i>");
		output("\n\nWell, if she insists.");
		output("\n\nYou slip down onto your [pc.knees], letting your hands play around all the tender flesh between her lips and her vulva as you cup the apple-sized black sack hanging low beneath her dick. It’s wonderfully heavy and soft, letting your fingers find the actual nuts inside and give them gentle, loving caresses. That small effort alone is enough to make Alyru’s member jump from excitement, bouncing around as her muscles contract and pre bubbles up around her brown bellend. ");
		output("\n\nBut that’s just the teaser. Your eyes focus on the tip of her dick, the perfect dark mushroom bobbing in the air just above the tip of your nose. It’s glistening in the light, just like so much of her bronze body, and even with the deluge of pure water all around you, you can smell the desire radiating off of its hungry crown. Grinning up at Alyru, you lean in and plant a kiss on her cockhead, slowly spreading your [pc.lips] around her girth. Your partner gasps, grasping at your [pc.hair] as you slide down her dick. It isn’t a difficult cock to swallow: she’s a hair over five inches, but just thick enough to make your throat strain a little. It’s only a moment before you’re wrapping your [pc.lips] around the thick bulge of knot-flesh around her base, gently sucking on it while your [pc.tongue] licks and caresses the underside of her cock.");
		output("\n\n<i>“Oooh, that’s the stuff!”</i> Alyru moans, grinding her hips against your [pc.face]. <i>“That’s what I call a magic mouth!”</i>");
		output("\n\nSo you’ve heard, but you aren’t satisfied just giving a blowjob... and you doubt she’s content just letting you play with her pecker, either. Glancing up at the bronze beauty, you give her lush ass a firm squeeze as you pull off her rod, letting it bounce and wobble under the water’s pressure. Before Alyru can ask what’s going on, you tighten your grip on her ass and pull her down onto the floor with you. She yelps, legs sprawling out and hands gripping your back tightly.");
		output("\n\n<i>“Oh! I like a " + pc.mf("man","woman") + " who takes charge!”</i> Alyru moans, tightening her grip around you. Her knees press into your sides, helping to pull you tight against her soft body. A little wiggling (and a little groping) and you’ve got your [pc.vagOrAss " + vIdx + "] angled just above her dusky crown, letting its rounded head slowly start to press into you. ");
		output("\n\nYou take it slow, letting gravity do most of the work. You feel every throb and twitch rippling up through Alyru’s cock; feel your body inexorably spreading around her turgid girth, hungry to accept every inch of it. The half-dzaan’s breath catches as she bottoms out inside you, her thickening knot pressing against your entrance. Your body stops its descent against that bulging bitch-breaker, [pc.vagOrAss " + vIdx + "] quivering with the tension of its attempted entrance.");
		output("\n\n<i>“Gonna bounce for me?”</i> Alyru murmurs, nuzzling against your shoulder, <i>“Or do you just want to tie me down by the dick and ride me?”</i>");
		output("\n\nYour body answers the question for you, instinctively pushing back on your [pc.knees] up the short length of her dick. Your [pc.hips] shake back and forth, grinding Alyru’s mushroom-shaped cockhead around inside you while you slide back down. By the time your [pc.vagOrAss " + vIdx + "] is pressed against her knot again, your entire lower body is trembling with pleasure.");
		if (pc.hasTail()) output(" Your [pc.tail] beats against the sodden floor of the shower, a visceral show of your enjoyment.");
		if (pc.hasBreasts()) output(" Your [pc.boobs] squish against Alyru’s, nipples rubbing wetly against her own. Grinning at you, the halfbreed hefts up her breasts, holding the big, soft mounds still (or at least, as much as she can with so much jiggly boobflesh) so that you can grind your [pc.nipples] against her own faster. Flesh glides across flesh, sending little chills of pleasure through your chest with every move you make.");
		output("\n\nThe steaming water beats down on you, making it oh-so easy to slide yourself up and down the dickgirl’s rod. Harder and harder, you fuck yourself on her short little shaft, bouncing in her lap. Alyru’s hands wrap around your [pc.butt], lifting you up and letting you slide on back down until her knot’s pressing against your entrance. Every thrust takes it deeper, making you stretch open just a little wider every time.");
		
		if (vIdx >= 0) pc.cuntChange(vIdx, chars["SCHORA"].cockVolume(0));
		else pc.buttChange(chars["SCHORA"].cockVolume(0));
		
		output("\n\nEventually, the inevitable end of ausar-fucking comes home to roost: you feel Alyru’s knot press hard against the " + (vIdx >= 0 ? "lips" : "rim") + " of your [pc.vagOrAss " + vIdx + "]. There’s a moment of overwhelming pressure, threatening to tear you apart, before the bitch-breaker breaks you in, lodging itself " + (vIdx >= 0 ? "just past your pussylips" : "in your ass") + ". You know you scream, crying out in pleasure, but your voice sounds a million miles away, drowned out by the orgasm Alyru’s knot is ripping out of you. Your body convulses, clenching and cumming, wringing the half-dzaan’s cock until she, too, stiffens. You feel her dick throb, swelling for a brief second before you feel that wonderful wetness squirting into your body, smearing across your inner walls.");
		output("\n\nHeat radiates out through your [pc.vagOrAss " + vIdx + "], helping to calm you from your orgasmic high. You focus yourself on the warmth inside you; on the cum settling in your " + (vIdx >= 0 ? "womb" : "colon") + ". Alyru’s fingers dig into your [pc.butt], holding you tight until her dick’s finished discharging its hefty load. Feels like she pumped a soda can’s worth of cum into you.");
		output("\n\nLucky for your mission, the shower’s kept your body nice and slick, inside and out. It only takes a little effort to dislodge yourself from Alyru’s knot, letting loose a deluge of steaming ausar semen onto the floor between her legs. She grins at the sight, crimson eyes transfixed on your " + (vIdx >= 0 ? "[pc.cunt " + vIdx + "]" : "cum-smeared thighs") + ".");
		output("\n\n<i>“That’s a good look,”</i> she murmurs, watching you start for the door. <i>“God damn, best way to end a vacation ever.”</i>");
	}
	processTime(30+rand(15));
	if (x >= 0) {
		//chars["SCHORA"].loadInCunt(pc, 0);
	}
	else {
		if (vIdx >= 0) pc.loadInCunt(chars["SCHORA"], vIdx);
		else pc.loadInAss(chars["SCHORA"]);
	}
	pc.orgasm();
	chars["SCHORA"].orgasm();
	pc.shower();
	flags["MET_SCHORA"] = 4;
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function syriQuestAkkadiBaseShowersTreatHerBad(x:int):void
{
	clearOutput();
	showSchora(true);
	author("Savin");
	
	var vIdx:int = -1;
	
	output("You reach down and grab the dusky halfbreed’s cock, drawing a gasp from her. She squirms in your grip, pinned between you and the wall, completely at your mercy... and the way her dick is starting to throb and leak in your grasp, she’s loving every second of it.");
	output("\n\n<i>“What’s your name, slut?”</i> you breathe into her ear, stroking her off with forceful, even motions.");
	output("\n\nShe moans, clutching at your [pc.butt], trying to keep her balance. <i>“A-Alyru. Alyru Schora.”</i>");
	output("\n\n<i>“Good. Now get on your knees and put that mouth to use for something,”</i> you growl, releasing her dick in exchange for one of her meaty tits, squeezing it until she complies. The bronzed halfbreed slinks down, resting her hands on your [pc.hips] and fixes her gaze on what’s between your [pc.legs]. No time for that. You wrap your fingers around her dark horns and just smash her face right down in there.");
	if (x >= 0) {
		output("\n\nThe dusky little exhibitionist knows exactly what to do with a dick -- surprising nobody, considering the stiff little prick wobbling between her legs. If she hasn’t been sucking her own cock, then she’s clearly the office fucktoy. Without hesitation, she wraps her lips around your " + pc.cockHead(x) + ", swirling her tongue around the tip before opening her throat for you. She doesn’t move past that, just slobbering all over your knob, waiting for your pleasure.");
		output("\n\nHer horns are handlebars, at the perfect height for you to hold her head steady and start face-fucking her. No preamble, no foreplay; you just start slamming your hips into her face, driving your " + pc.cockDescript(x) + " deep into the dickgirl’s clenching throat. She’s got exactly no gag reflex, but seems perfectly capable of rhythmically squeezing her throat around your thrusting member. You grin down at her, watching your " + pc.cockNounComplex(x) + " disappear between her dark lips again and again, coming back shining with spittle every time, only to have it washed away by the beating waters before it goes balls-deep back in again.");
		output("\n\nAlyru’s rosey rump swishes in the water while you use her mouth. She’s shameless about enjoying it, even reaching down to tug on her own little prick.");
		output("\n\nCan’t have any of that. You take her horns and pull her sideways, off her knees and sprawling her out on the shower floor. Her dick bobs in the air, bumping into her plump ballsack when you push it up out of the way, revealing the thick, dark lips of her sex. ");
		output("\n\n<i>“Hands off,”</i> you command, lacing your fingers through hers and pinning Alyru’s hands against the tile. Her sack’s heavy enough with pent-up desire to hold her dick down and out of the way, and you’re able to press your " + pc.cockHead(x) + " to her pussylips, parting the slick folds of her sex ever so slightly. Alyru shivers, whining with shameless desire, and her pussy quivers around your crown. You push your hips forward, and are immediately rewarded with a visible throb of the dickgirl’s pinned pecker; her hands clench around yours, trying desperately to break free and pleasure herself, but you hold her fast. Her legs squirm on either side of you, kicking haplessly in the water while you slowly grind your " + pc.cockNounComplex(x) + " into her pussy.");
		
		pc.cockChange();
		
		output("\n\nEmphasis on slow. You take your own time, enjoying the way her pussy clenches and squeezes around every inch of your shaft. She’s a soaking wet mess, inside and out, making it almost too easy to slide all the way in. She can’t resist you, even if she wanted to, only able to add a little slick friction to your penetration that enhances your pleasure. By the time you’ve bottomed out in the buxom bitch, there’s a broad smear of halfbreed cream on her belly; a constant stream of pre leaks from her dusky cockhead, bubbling up with every little movement of your " + pc.simpleCockNoun(x) + ".");
		output("\n\nYou don’t want to let her adjust to your size, so you start moving immediately, pumping your [pc.hips] against her plump posterior. Her ass jiggles with every impact, sending shockwaves through her plush body that reach all the way to her mammoth bosoms, making the olive mounds bounce every time your dick slams back home inside her. Alyru’s voice is nothing but a cascade of gasps, whimpers, and cries of pleasure, driven insensate by your relentless fucking. You can tell she desperately wants to jack off, to have some measure of control over the waves of ecstasy crashing through her, but you refuse to let her move, dominating her mind and body with your [pc.cock " + x + "].");
		output("\n\nAlyru squirms harder suddenly, thrashing her legs");
		//output(" and tail");
		output(" around your waist until her back arches and her dick juts up with enough force to dislodge it from underneath her balls. An absolute geyser of white cream lances up from her crown, arcing through the sultry air between your bodies before ");
		if(pc.biggestTitSize() >= 5) output("coming down in a hot smear across the tops of your [pc.boobs].");
		else output("splattering down all over Alyru’s belly.");
		output("\n\nYou grin down fiercely at the subby slut, not skipping a beat in the movements of your hips. You’re relentless, pounding her plump puss until the halfbreed whore’s screaming, arching her back and leaking her dickmilk again... and again... and again. You’re sure now that she gets off on the helplessness, on her complete, whimpering submission to a stranger fucking her into the ground. By the time you feel your own orgasm building, Alyru’s belly is coated in a thick veneer of her own semen. Her balls, once apple-sized, bounce airily with your rapid thrusts, so emptied by their owner’s repeated orgasms that they feel almost weightless each time they swing back and slap against your crotch.");
		output("\n\nThere’s not much of a reason to hold back, at this point. Alyru’s gone limp in your arms, eyes rolled back in her head; she’s panting hard, slowly swishing her tail through the water and continuing to leak cum and girl-juice into the beating waters of the shower. You thrust your [pc.cock " + x + "] deep into the gushing lips of Alyru’s sex");
		if (pc.hasKnot(x)) output(", hard enough for your [pc.knot " + x + "] to lodge itself in there");
		output(" before you blow your load, pumping thick wads of [pc.cum] into the half-ausar’s womb.");
		output("\n\nThe only reaction you get from your impromptu lover is a throaty, hoarse moan and a last little spurt from the tip of her dick. The watery white aftershots run down her belly, washed away in the downpour. Your cum isn’t going anywhere, though");
		if (pc.hasKnot(x)) output(", thanks to your [pc.knot " + x + "]");
		output(". You feel the warm liquid load settling around your [pc.cockHead " + x + "], painting her inner walls [pc.cumColor].");
		output("\n\nWhen you’re done, you lean back on your [pc.knees], ");
		if (pc.hasKnot(x)) output("tugging your knot back out of Alyru’s gaping twat. Luckily for your mission, she’s wet enough inside and out that it isn’t too hard to pop out, letting the excess of your orgasm spill out of her");
		else output("dragging your cock out of her in a deluge of mixed juices");
		output(". You take a moment to catch your breath, survey the spunk-slathered, fuck-drunk slut you’re leaving behind before you stand up and head for the door.");
		output("\n\nThe way she’s whimpering, still rock hard, you don’t think she’s going to be walking any time soon!");

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else {
		if (pc.hasVagina()) {
			vIdx = pc.cuntThatFits(chars["SCHORA"].cockVolume(0));
			if(vIdx < 0) vIdx = rand(pc.vaginas.length);
		}
		
		output("\n\nThe halfbreed skank’s tongue flicks out, licking at your thighs, trailing up towards your [pc.vagOrAss " + vIdx + "]. ");
		if (vIdx >= 0) output("You spread your [pc.legs], letting Alyru’s tongue wind its way to the pussy-lips between them. A little swirl of her tongue, and she’s inside you, teasing her way through your " + (pc.vaginas[vIdx].looseness() < 3 ? "tight" : "loose") + " passage.");
		else output("With a little maneuvering, you twist your body so that Alyru has ready access to your asshole. She goes after the sinful hole without hesitation, pressing her tongue against your [pc.asshole] and putting just enough pressure against your dark star that your body bends around her, admitting entrance.");
		output(" That’s the stuff!");
		output("\n\nWith your hands still wrapped around Alyru’s horns, you pull her down on your sex, grinding her face into your [pc.vagOrAss " + vIdx + "]. She’s got a broad tongue, if not a long one, and with a little wiggling she’s able to splay your inner passage open. You can’t help but shiver as her alien tongue slithers deeper, licking and caressing every inch of tender inner flesh. For both your sakes, you make sure she gets you nice and wet, slobbering up your [pc.vagOrAss " + vIdx + "] before you push her down on her back, kicking her legs apart so that you’ve got uninterrupted access to the little five-inch pillar of fuckmeat jutting up from her crotch.");
		output("\n\nAlyru’s hands settle on her tits, groping at the marshmallow pillows while you slip down and straddle her broad hips. You slip a pair of fingers down, caressing your [pc.vagOrAss " + vIdx + "] and stretching it open. It’s easy to line her up with your entrance: she’s got a plump mushroom-shaped crown, just like a human’s dick, letting it wedge right into your entrance. There’s enough moisture built up on the buxom babe’s " + (silly ? "benis" : "dick") + " that all you feel is a moment’s strain, and then the wonderfully fulfilling sensation of your [pc.vagOrAss " + vIdx + "] being filled with dick. Alyru moans underneath you, tugging on her chocolate nipples until your [pc.butt] is pressed into her thighs and her cock is fully sheathed inside you. Once you’re settled, you put your hands on hers, squeezing down on those big bronze beefers. You can feel her little shaft throbbing inside you, squeezed between the walls of your [pc.vagOrAss " + vIdx + "]. Her balls are flush against your [pc.butt], churning with their owner’s growing need.");
		
		if (vIdx >= 0) pc.cuntChange(vIdx, chars["SCHORA"].cockVolume(0));
		else pc.buttChange(chars["SCHORA"].cockVolume(0));
		
		output("\n\n<i>“Big strong girl like you... and you just love being on bottom, don’t you?”</i> you tease, pinching a dusky tit. She whines, but her dick leaks inside you, an undeniable admission from her oversexed body. When her pre spills into you, though, you’re immediately treated to a thrill of pleasure that suffuses into a low heat spreading through your loins.");
		output("\n\nMust be the dzaan half of her doing its job. You can probably handle a dose or two, but those balls are full, and she feels like she’s gonna pop any second now. Hope she’s not too addictive... ");
		output("\n\nJust thinking about taking a load of drug-laced xenocum makes your [pc.vagOrAss " + vIdx + "] quiver with anticipation, which is apparently enough to make the naughty dickgirl gasp, arching her back off the shower floor and thrusting her dick knot-deep into you. The warm sensation sextouples, following something wet and warm smearing inside you, painting your inner walls with Alyru’s intoxicating seed.");
		output("\n\nYou shiver, feeling her dzaan-half’s drugs at work. All it makes you want to do, though, is ride her harder. Digging your fingers into Alyru’s meaty rack, you start to shake your hips, rising up on her petite shaft before dropping back down again, refusing to give her the chance to come down off her own orgasmic high. The halfbreed cries out, squirming and moaning underneath you, clearly trying not to scream. her throes of pleasure only make you move faster, bouncing in her lap, dragging her drugged-up spunk all through your " + (vIdx >= 0 ? "pussy" : "ass") + ". Your entire sex is smeared with her seed, and stars above, it feels <i>good</i>!");
		output("\n\nAlyru doesn’t even have a chance to get soft after giving you that first creampie. Your ceaseless motions keep her nice and hard, no matter how much agonizing pleasure that inflicts on her; no matter how many whimpers and cries of over-stimulation she makes; no matter how she squirms and leaks between your [pc.legs]. When she cums again, a bare couple minutes after the first time, you’re riding Alyru’s cock with all the lust in your heart, high on her jizz and loving every second of it. The second dose is shot right into your " + (vIdx >= 0 ? "womb" : "belly") + " to a celebratory chorus of Alyru’s feral screams of pleasure and the slamming sounds of your [pc.skin] coming down in wet smacks against the dusky dickgirl’s thighs.");
		output("\n\nYou’re breathing hard, blind to the world around you. All you can see... feel... even think about is the lush slut under you. Her dick, pulsing and leaking inside you, is the center of your entire universe. Pleasuring it is the only thing that matters. Alyru’s second cumshot is enough to drive you over the edge, and with a thrill of sheer, drug-induced ecstasy at your dedication to the futadick inside you, you push yourself down hard on the thick knot of cockflesh. Your body accepts it eagerly, spreading around the bitchbreaker -- and stars above does it <i>break</i> you. You throw your head back and cum, clenching hard around every inch of throbbing futaflesh while the thunderbolts of orgasm tear through your body.");
		output("\n\nWhen they pass, you collapse face-first onto Alyru’s pillowy chest, burying your [pc.face] between those soft, dark mountains while she slowly deflates inside you. As wet as you are, you’re sure you could extricate yourself if you wanted to... but why would you? You let out a quiet little moan and clutch at Alyru’s chest and shoulders, holding her tight.");
		output("\n\n<i>“Yeah... I still got it...”</i> she breathes, settling her hands on your [pc.butt]. <i>“Oh yeah.”</i>");

		clearMenu();
		addButton(0, "Next", syriQuestAkkadiBaseShowersTreatHerBadOutro);
	}
	processTime(30+rand(15));
	if (x >= 0) {
		//chars["SCHORA"].loadInCunt(pc, 0);
	}
	else {
		if (vIdx >= 0) pc.loadInCunt(chars["SCHORA"], vIdx);
		else pc.loadInAss(chars["SCHORA"]);
	}
	pc.orgasm();
	chars["SCHORA"].orgasm();
	pc.shower();
	flags["MET_SCHORA"] = 5;
}

public function syriQuestAkkadiBaseShowersTreatHerBadOutro():void
{
	clearOutput();
	showSchora(true);
	author("Savin");
	output("You wake up some time later, sore in the loins and tingly all over. Alyru’s passed out on the floor, so you quietly slip out of her embrace and out of the shower, groping around for a towel. So much for your mission being swift. Wonder how Syri’s kept the power down all this time?");

	processTime(30);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function syriQuestTorraFight():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Torra());
	CombatManager.displayLocation("RESEARCHER");
	CombatManager.victoryScene(syriQuestTorraVictory);
	CombatManager.lossScene(syriQuestTorraDefeat);
	CombatManager.encounterTextGenerator(syriQuestTorraFightText);
	CombatManager.beginCombat();
}

public function syriQuestTorraFightText():String
{
	var eText:String = "";
	eText += "She’s a tall furry woman with the ears and colors of a snow leopard. Her figure is the very definition of fertile: she has broad hips, thick thighs, and a thin waist. And her breasts, well, they’re <i>beyond</i> fertile: the huge, succulent mounds sit high and heavy on her chest, each capped with a prominent black teat. She’s well beyond an H-cup, if they even make bras big enough to contain such mammalian magnificence. She’s unarmed, save for the razor-like feline claws protruding from her digits, and the meaty black vibrater lodged inside her. That’s a kind of weapon, right?";
	
	return eText;
}

public function syriQuestTorraDefeat():void
{
	var x:int = -1;
	if (pc.hasCock()) x = pc.cockThatFits(chars["TORRA"].vaginalCapacity(0));
	syriQuestTorraFuck(x);
}

public function syriQuestTorraFuck(x:int):void
{
	clearOutput();
	showTorra(true);
	author("Savin");
	
	var vIdx:int = -1;
	
	output("Before you can blink, the milodan matron is on you, ");
	if (pc.isNude()) output("tearing your clothes away with her claws and ");
	output("pressing her dark lips to yours. Her hands run roughly over your body, groping and squeezing every inch of tender flesh they lay bare. When they find your own hands, the milodan woman grabs them fiercely, guiding them to her broad hips and plush ass. Even in her state, she wants you to be an active participant, urging you to grope and hold her in return while she slakes her rampant lusts on your yielding body.");
	output("\n\nHer overbearing sensual assault quickly leaves you scrambling backwards, trying to gain purchase on the slick metal floor. Her huge, furry breasts press against your [pc.chest] as your back hits the wall, pinning you between unrelenting metal and soft, supple titflesh.");
	output("\n\n<i>“Need to... need to... need to...”</i> the cat-woman huffs, sniffing and groping at you. One of her hands wanders between your [pc.legs], grabbing at your crotch.");
	if (x >= 0) output("\n\n<i>“Ah, yes! Good!”</i> she mewls, wrapping her fluffy fingers around your " + pc.cockDescript(x) + ". <i>“Need this... so bad. Can barely think!”</i>");
	else output("\n\n<i>“What -- no breeding rod?”</i> she huffs, squeezing your crotch. <i>“Noooo I need to </i>breed<i>!”</i>");
	output("\n\nHer grip on you tightens, pushing you towards the ground; you slide down the wall, splaying your [pc.legs] while the milodan’s hands grope all over your body, exploring every inch as she tears you out of your [pc.gear]. All the while you can hear the ever-present purr of her vibrator buzzing away inside her, making the science-slut pant and gasp as she works. Her nipples are rock hard, every breath pushing the jutting black mountains of pleasure into your face. You manage to wrest your hands free through her frantic stripping and grab the kitty’s big titties, hard enough to make her howl in pleasure. Her fluffy tail thumps hard against your [pc.leg], silent encouragement to keep kneading her nipples until she’s able to grind her dripping slit against your " + (pc.hasGenitals() ? "[pc.cockOrVag]" : "thigh") + ".");
	if (x >= 0) {
		output("\n\nThe horny cat-woman purrs hungrily, straddling your hips and pressing her puffy puss against your rock-hard cock. She thrusts herself down on you the moment you’re lined up, spearing herself on your " + pc.cockNounComplex(x) + " with a howl of bliss that echoes throughout the base. You yourself are busy gritting your teeth as her claws rake your [pc.skinFurScales], pinning you against the wall while the kitty starts to ride you.");
		
		pc.cockChange();
		
		output("\n\nIt takes you a moment to realize some of the gripping, writhing pleasure encasing your cock isn’t just from her needy cunt. The vibrator knotted in her ass is buzzing away so hard that you can feel it perfectly through her inner walls; the knot is right next to your " + (pc.hasKnot(x) ? "own knot" : "dick’s base") + ", sending waves of pleasure up your shaft and back to your [pc.balls]. Fuck that feels good!");
		output("\n\nNot as good as your sexual assailant riding you full throttle, though. The vibrator’s just the garnish to top off the squeeze of her cunt and the flow of orgasmic juices as the rods inside her bring the milfy kitty to climax again. And again. And again. She’s a relentless fuck-machine, pounding down on your pelvis through a dozen screeching orgasms.");
		output("\n\nOnly after so many climaxes is she able to focus enough to form a few cogent words: <i>“C-cum for me. Please, stranger, oh please! I neeeeed it!”</i>");
		output("\n\nYou couldn’t resist her if you tried; your " + pc.cockNounComplex(x) + " is already on the edge inside her, throbbing with a desperate need for release between the cumsoaked lips of her pussy. ");
		if (pc.hasKnot(x)) output(" With one last surge of energy, your body responds to an instinctual demand: you thrust your [pc.hips] forward, driving your " + pc.knotDescript(x) + " into her cunt’s embrace before you join her in orgasm. ");
		output("You grit your teeth and grab the bouncing slut’s plush bosom, shoving her down to the hilt on your dick before your load blows inside her, filling her hungry cunt with [pc.cumNoun].");
		output("\n\nThe milodan slut cries with pleasure as you fill her up, sating her desperate need to breed. Her body goes limp as the aftershots of your orgasm leak into her, pushing her chest into yours and resting her cheek against your [pc.face]. For whatever reason, when she slumps forward you can feel the vibrator that’s been going full-blast inside her slow down, decelerating to a steady thrum. You didn’t touch anything... wonder what triggered it to turn down?");
		output("\n\nEither way, you squirm around until you can hook your hands under the milodan’s ass and ");
		if (pc.hasKnot(x)) output("roll the two of you over, putting the tuckered-out kitty on bottom while you wait for you knot to deflate. It takes a while, especially with the vibe still buzzing through her pussy walls, but eventually you manage to wriggle free. Cum pours out of her plump puss as you stand up.");
		else output("pull her off your dick, letting loose a little stream of cum from her soaked snatch as you set her down.");
		output(" You get your gear and turn to the task at hand.");
	}
	else {
		if (pc.hasVagina()) {
			vIdx = pc.cuntThatFits(chars["TORRA"].cockVolume(0));
			if(vIdx < 0) vIdx = rand(pc.vaginas.length);
		}
		
		output("\n\nShe’s a beast, obsessed with nothing but her own pleasure, sliding her drooling pussy against your thigh with single minded desire. Her breath comes hot and ragged against your bare [pc.skinFurScales], and her heavy breasts bouncing and rub against your [pc.chest]. A few moments of that and you start feeling a strange tingle working up your [pc.skin] where her glowing green piercings are rubbing against your flesh.");
		output("\n\nIs that <i>savicite</i>!? No wonder she’s so lust-addled! You squirm, trying to distance yourself from the psionic stones, but your struggling just makes the milodan shove herself against you, trying awkwardly to hold you down and trib with you. Her grip’s strong and firm, keeping you pinned right where she wants you until the lust-fueling piercings have you panting, flushed with unbidden need.");
		output("\n\n<i>“You feel it too?”</i> the kitty purrs, flicking her tongue on your neck. <i>“You need it?”</i>");
		output("\n\nYou want to resist, to push her off and tell her no... but your body is much more honest, stiffening your [pc.nipples] and making your loins ache with desire. You can’t stop your hands from wandering, grabbing at the cat-woman’s ass and urging her legs to press into your crotch, and with a little effort, you adjust your positions so that your legs are splayed together and each of you has your arms behind you, supporting the undulation of your hips grinding against each other.");
		output("\n\nThat’s more like it! Her fur is like the softest silk against your " + (vIdx >= 0 ? "twat" : "bare groin") + ", and the slightest touch makes you shiver uncontrollably with carnal pleasure. You get more than a gentle caress, though: the milodan is eager to get back to work, shaking her hips with desperate desire the moment she can resume her lurid work. You watch as her huge, pierced tits bounce with every thrust, and feel her plush ass grinding against your [pc.leg], jiggling obscenely with the weight of her matronly curves. Her pussy’s a mess of girl-cum and desire, lubricating its own lurid motions.");
		output("\n\nLittle whines of pleasure escape your assailant’s muzzle, and her movements quickly become more frantic. She’s so wet and loud already that it’s hard to know when exactly her orgasm hits, but the growing puddle of fem-cum beneath your [pc.leg] and the ragged gasps as she slumps backwards sure give you a hint when it’s over. She only stays passive for a moment, long enough to catch your breath, before she thrusts her hips up and starts moving again with the same bestial determination.");
		output("\n\nYou can barely keep up with her! The milodan is as fast as a Terran tiger when she wants to be, and she <i>definitely</i> wants to use that speed to get you off. She’s cum at least once, maybe more, and now her attention seems to have focused entirely on your groin, rubbing her pussy against your " + (vIdx >= 0 ? "[pc.cunt " + vIdx + "], grinding on your [pc.clit " + vIdx + "]" : "sensitive-but-bare crotch") + ". You can only imagine that what you’re feeling now is a fraction of what her savicite-laden body is enduring, an overwhelming, crushing pleasure that threatens to drown out your remaining composure in bliss despite your weakening will’s best efforts. You can’t help but thrust back against the needy cat-girl, eeking out more friction on your " + (vIdx >= 0 ? "[pc.clit " + vIdx + "]" : "groin") + " from her wiggling hips and juicy twat.");
		output("\n\n<i>“That’s it!”</i> the kitty growls, matching your movements point for point. <i>“I knew you had it in you. Come on... come on! Cum with me!”</i>");
		output("\n\nNot like you have much choice by this point, your body’s already so close to the edge. You grab the slut’s foot and squeeze, the closest thing to an acknowledgement you can muster before you feel the fires of lust burning over in your loins, and your skin feels alight with ecstasy. Your scream of pleasure echoes off the sterile walls of the facility’s corridors.");
		output("\n\nWhen your body-rocking climax finally passes, you’re left sliding onto your back drenched in femcum and sweat. The milodan whimpers and grabs at the vibrator still lodged in her ass, pushing it in deeper until even its massive knot has almost vanished inside her and geysers of girl-cum are squirting from her much-abused puss. Even when you manage to disentangle yourself, she just keep fucking away, rubbing her clit and pumping the vibe in her ass until you’ve gathered your gear and turned on your way.");
	}
	processTime(30);
	if (x >= 0) {
		//chars["TORRA"].loadInCunt(pc, 0);
	}
	else {
		pc.applyPussyDrenched();
	}
	pc.orgasm();
	chars["TORRA"].orgasm();
	
	if(inCombat())
	{
		CombatManager.genericLoss();
	}
	else
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function syriQuestTorraVictory():void
{
	clearOutput();
	showTorra();
	author("Savin");
	
	if(enemy.HP() <= 0)
	{
		output("The over-eager milodan whines and slumps onto a knee, trying to keep coming at you but unable to maintain her footing. Finally, she collapses backwards with a pathetic whine. <i>“P-please,”</i> she moans, grabbing the base of the vibrator lodged in her ass. <i>“I’m sorry! But I need it so bad. Please!”</i>");
	}
	else
	{
		output("<i>“Whyyy,”</i> the milodan whines, falling onto her knees. <i>“You want it! I <b>need</b> it! Please, please, please fuck me! I can’t stand it anymore.”</i>");
	}
	output("\n\nWhat are you going to do with this lusty kitten?\n\n");

	processTime(3);
	clearMenu();
	if (pc.hasCock() && pc.cockThatFits(chars["TORRA"].vaginalCapacity(0)) >= 0) addButton(0,"Pound Puss",penisRouter,[syriQuestTorraPoundPuss,chars["TORRA"].vaginalCapacity(0),false,0],"Pound Puss","Take this curvy catgirl to the pound.");
	else addDisabledButton(0,"Pound Puss","Pound Puss","You need a fitting penis for this.");
	addButton(1,"Leave",syriQuestTorraLeave,undefined,"Leave","Go away, cat.");
}

public function syriQuestTorraPoundPuss(x:int):void
{
	clearOutput();
	showTorra(true);
	author("Savin");
	output("Now that the overly-amorous fuck-kitten has been put in her place, maybe you can see about relieving the overwhelming lust wracking her body. You stride forward, shedding your [pc.gear] as you go and cupping the lusty cat’s cheeks. She whimpers, stroking her pussy with one hand and using the other to paw pleadingly at your crotch. Her fingers are drawn straight to your " + pc.cockDescript(x) + ", wrapping around your stiffening member and pumping her wrist up and down your length until your " + pc.cockHead(x) + " is pressing against her dark lips.");
	output("\n\n<i>“Get me ready,”</i> you command her. She needs dick too badly to even think of resisting your instructions, no matter that you’re delaying her release -- the threat of getting nothing is too great. She opens wide and wraps her black lips around your crown, running her tongue around your glans and through your slit, letting you take charge of thrusting deeper into her mouth. While you’re busy slamming your " + pc.knotDescript(x) + " against her nose, her hands fall away from you and slip down to her poor neglected puss. She shoves a few fingers in, stirring herself up while the other hand grips the knotted dildo in her ass and shifts it side to side, creating a staccato rhythm that quickly brings a howling climax ripping through her body. The kitty slut’s pussy leaks a pool of girl-cum between her legs, and her oversized tits heave with the aftershocks of orgasm.");
	output("\n\nThe orgasm doesn’t even slow her down.");
	output("\n\nShe keeps sucking, bobbing her head up and down your rod until your entire " + pc.cockNounComplex(x) + " is sheathed in spittle. Only then do her lips release you, letting you smear them with pre as you pull out.");
	output("\n\n<i>“You’re gonna fuck me, right?”</i> she pleads, groping at her titties. <i>“I need it so bad!”</i>");
	output("\n\nOf course you are... but you don’t mind stringing her along a little. You take your time stroking yourself and circling around behind the kneeling milodan, running a hand through her messy red hair before grabbing her shoulders and pushing her forward onto all fours. The naked cat gasps, but in the same breath raises her fluffy grey tail to expose her plugged ass and drooling gash.");
	output("\n\nThat’s what you like to see. You slink down on your [pc.knees] and throw the kitty’s tail over your shoulder, letting your " + pc.cockDescript(x) + " flop into the fluffy trench between her fat asscheeks. Your " + pc.cockHead(x) + " rubs against the sex toy buried in her tailhole, feeling the rapid vibrations assaulting her insides. Damn, that thing’s turned up <i>high</i>! Between that and all the savicite piercings... no wonder the cat-babe’s so lust-addled. She probably can’t put two thoughts together with all that ecstasy running through her.");
	output("\n\nWell, she doesn’t need to think much to take a dick, does she? You rock your [pc.hips] back and push the crown of your cock into the thick, wet lips of her pussy; your member pushes the curtains of her sex apart, letting loose a trickle of pent-up femcum that lubes you up to a nice shine in the harsh office lights. Setting your hands on the kitty-slut’s broodbearing hips, you thrust yourself deep inside her sodden depths. Her constantly lurid moans peak into a husky wail of orgasmic delight as your " + pc.simpleCockNoun(x) + " sinks into her, delving the dank depths of her quivering quim until your " + pc.knotDescript(x) + " is throbbing between her pussylips.");
	
	pc.cockChange();
	
	output("\n\nIt’s shockingly easy to sink your dick into the milodan’s twat, but she makes you fight for every inch you try and pull out of her. For such a " + (silly ? "<i>thicc</i>" : "plush") + " slut, this kitten’s got a hell of a lot of muscle between her legs, and she’s using every bit of pussy-power to keep you trapped inside her. The vibrator up her ass kicks into overdrive of its own accord, starting to buzz so violently that you can see it twisting around inside her -- and you can feel it, too, sending vibrations right through the walls of her pussy and into your " + pc.cockNounComplex(x) + ". Stars, that thing really must be driving her mad! Lest it do the same to you, you dig your fingers into the kitten’s plush rump and leverage it to slowly, laboriously drag your " + pc.simpleCockNoun(x) + " back out of her cunt’s wet embrace. Her twat clenches and grips in random spasms of orgasmic pleasure, leaking lube and your own pre back out around your slowly-pistoning dick.");
	output("\n\nEven then, you can still feel the incessant vibrations in your " + pc.cockHead(x) + ", sending shivers down the shaft of your " + pc.cockNounComplex(x) + ". You have to bite your lip to keep from shuddering, gripping the kitten’s hips hard until you can muster up the strength to hammer your cock back into her. The milodan slut howls, throwing her head back and cumming hard to your womb-deep thrust. Hot juices flow down your " + pc.cockDescript(x) + ", and her huge tits bounce wildly as you start to properly pound her pussy, in and out despite her clenching resistance.");
	output("\n\nYou fuck her harder, harder until her voice is a non-stop wail of orgasmic bliss. Her face sinks down into the ground, pushing her ass up into your crotch and wrapping your hips in her fluffy tail. Before long her tits are getting use like big, fluffy pillows under her body, absorbing some of the shock each time your [pc.hips] pound into her thick ass. You’re not sure anymore if she’s actually having distinct, separate orgasms, one after the other... or if the tigress is just locked in one unending climax so long as you and the vibrator absolutely destroy her holes.");
	output("\n\nThere’s no point in trying to hold back -- you’ve all but shattered this slut’s oversexed senses already. You let your own pleasure rise as it will, milked out by her squeezing cunt and the vibrations echoing through her from the toy firmly wedged inside her. When you feel [pc.cum] rising in your loins, burning its way towards the cat-woman womb, you’re almost relieved to feel it coming. With a feral grunt, you hilt yourself in the sodden pussy and let loose, pumping a fat wad of [pc.cum] right into her deepest depths. The milodan squeals in delight, clawing at the ground and battering you with her tail until you’ve blown the entirety of your load into her spasming quim.");
	output("\n\nWhen you’ve finished filling her cunt with your [pc.cum], you start to notice something feels... different. A quick press against the vibe in her ass tells you what’s up: whatever has been controlling the toy seems satisfied now that she’s gotten a load right inside. The vibrator’s turned itself down to a pleasant rumble, just enough to keep the woman moaning softly as she basks in the afterglow.");
	output("\n\nYou slowly pull out, letting a waterfall of fem-spunk and [pc.cum] spill out onto her thighs, and go to find your gear...\n\n");
	processTime(30);
	//chars["TORRA"].loadInCunt(pc, 0);
	pc.orgasm();
	chars["TORRA"].orgasm();
	
	if(inCombat())
	{
		CombatManager.genericVictory();
	}
	else
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function syriQuestTorraLeave():void
{
	clearOutput();
	showTorra();
	author("Savin");
	output("You put your hand on the milodan’s face and push her back. She yelps and flops onto her ass, legs splayed around the buzzing dildo lodged inside her. You ignore her, and she’s powerless to do anything about it but sit there and masturbate.");
	output("\n\nTime to find Valden.\n\n");
	processTime(3);
	CombatManager.genericVictory();
}

public function syriQuestAkkadiBaseStarshipLabInvestigate():void
{
	clearOutput();
	showCalnor();
	author("Savin");
	output("You spend a few minutes prowling through the laboratory, checking out some of the custom work that Akkadi’s been doing down here in the depths.You know ");
	if ((pc.characterClass != GLOBAL.CLASS_ENGINEER && pc.characterClass != GLOBAL.CLASS_SMUGGLER) || pc.isBimbo()) output("next to nothing about");
	else output("just enough to be dangerous when it comes to");
	output(" starship mechanics; so you pull out your Codex and snap a few quick holos of the ships in question. A little corporate espionage never hurt anybody, right?");
	output("\n\nYou send the pics off to a discreet Steele Tech subsidiary, and are almostly instantly rewarded with an anonymous wire transfer of 50,000 Credits. Nice.");
	output("\n\nWhile you were playing investigator, you did notice something small enough to carry out with you. You turn to try and find it again... and find yourself standing face to face with an ausar man in a labcoat, worn open-faced over a blue Akkadi jumpsuit that outlines a tall, lean figure with just a hint of muscle. A vast chest-length beard of wiry curls hair spills down from a hard middle-aged face. His head is shaved on either side, leaving him with a short snow-colored mohawk.");
	output("\n\nAt his side, the man has his fingers wrapped around a crook-shaped staff. Electricity crackles menacingly around the curved head like a storm cloud’s hovering at his command.");
	output("\n\n<i>“You shouldn’t be here,”</i> the man growls, narrowing dark blue eyes at you. <i>“First the power, then Valden’s in our systems, corralling my staff like animals... and now you. Whoever you are, you’ve cost Akkadi a great deal.”</i>");
	output("\n\n<i>“Valden?”</i> you say, almost a reflex. You <i>are</i> in the right place after all!");
	output("\n\nThe man notes your reaction with a twitch of his eye. <i>“Ah. I thought that might be what this is all about. How did he contact you, I wonder?”</i>");
	output("\n\nYou flatly tell the man you don’t know what he’s talking about.");
	output("\n\nOf course he doesn’t believe you -- why would he? Indeed, his fingers clench his staff until they turn as white as his hair, and the man growls, <i>“I am Doctor Raade Calnor, and this is my facility. I will <b>not</b> allow you to further jeopardize the work we’re doing here.”</i>");
	output("\n\nA third voice answers him, seemingly from all around you. <i>“You don’t get a say in that anymore, doctor.”</i>");
	output("\n\nDr. Calnor glances from you to the ceiling -- to one of the security cameras looming overhead. <i>“Valden, I don’t know what you hope to accomplish with this stunt, but you need to release the staff. I can’t help you anymore if-”</i>");
	output("\n\n<i>“Help me!?”</i> the voice booms, warbling with synthetic bass. <i>“When did you start doing that? No, I don’t think so. And as for our new friend here... why don’t you put this old dog down for me? We’ll have words up in the lab once he’s been dealt with.”</i>");
	output("\n\nCalnor takes a step back from you, swinging his staff up into a defensive stance. <i>“Listen to me, whoever you are. Whatever it is you think is going on here, you’re wrong. This man is extremely dangerous, and needs to be contained... for the safety of everyone in the galaxy.”</i>");
	if (pc.isMischievous()) output("\n\nMelodramatic much?");

	pc.credits += 50000;
	processTime(15);
	clearMenu();
	addButton(0,"Talk",syriQuestAkkadiBaseStarshipLabTalk,undefined,"Talk","Trade some words with the doctor before you trade blows.");
	addButton(1,"Fight",syriQuestCalnorInitiateFight,undefined,"Fight","You’re not letting this old hound get between you and rescuing Valden.");
}

public function syriQuestCalnorInitiateFight():void
{
	clearOutput();
	showCalnor();
	author("Savin");
	output("You raise your [pc.weapon], telling the doctor to get out of your way or else ");
	if (pc.isAss() || pc.isBro()) output("get put down");
	else output("you’ll have no choice but to make him");
	output(".");
	output("\n\nDr. Calnor growls and readies his staff.");

	processTime(1);
	clearMenu();
	addButton(0,"Fight!",syriQuestCalnorFight);
}

public function syriQuestCalnorFight(badassdoc:Boolean = false):void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new DrCalnor(badassdoc));
	CombatManager.displayLocation("DR. CALNOR!");
	CombatManager.victoryScene(syriQuestCalnorFightVictory);
	CombatManager.lossScene(syriQuestCalnorFightBadEnd);
	CombatManager.beginCombat();
}

public function syriQuestCalnorFightBadEnd():void
{
	clearOutput();
	showValden();
	author("Savin");
	output("You crumple to the ground, unable to withstand the greyfur’s assault. He twirls his staff to a halt under one arm, looking down at you contemptuously. The doctor looks between you and ");
	if (currentLocation == "AKD T14") output("the hangar exit");
	else output("Valden’s holotank");
	output(", grunts, and brings his staff up.");
	output("\n\nThe last thing you see is a flash of lightning, accompanied by searing pain... and then nothing at all.");

	processTime(1);
	CombatManager.genericLoss();
	badEnd();
}

public function syriQuestAkkadiBaseValdenFight():void
{
	CombatManager.newGroundCombat();
	var hostiles:Array = [new AkkadiSecurityRobots(-1), new AkkadiSecurityRobots(-1), new AkkadiSecurityRobots(-1), new AkkadiSecurityRobots(-1)];
	AkkadiSecurityRobots.valdenize(hostiles[0], false);
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(hostiles);
	CombatManager.displayLocation("VALDEN");
	CombatManager.victoryScene(syriQuestAkkadiBaseValdenFightVictory);
	CombatManager.lossScene(syriQuestAkkadiBaseValdenFightBadEnd);
	CombatManager.encounterTextGenerator(AkkadiSecurityRobots.akkadiBaseValdenFightText);
	CombatManager.beginCombat();
}

public function syriQuestAkkadiBaseValdenFightBadEnd():void
{
	clearOutput();
	showName("DR. CALNOR &\nVALDEN");
	showBust(calnorBustDisplay(),valdenBustDisplay());
	author("Savin");
	output("You crumple to the ground, breathing hard. One of the robots grabs your [pc.weapon] in a claw and crushes it. The others go after the doctor, grabbing the poor wolf’s arms and legs in their claws and pinning him to the ground.");
	output("\n\n<i>“I told you, old man!”</i> Valden howls triumphantly. <i>“I told you I was going to get out of here! You just had to stand aside... but we both knew it was going to be through you. I just didn’t think it would be <b>literally</b> through you.”</i>");
	output("\n\nCalnor struggles, trying and failing to free himself from the armadillo-bots’ claws. They are implacable opponents even now, refusing to budge despite the huskar’s great strength. The drone that Valden was inhabiting strides forward with what could best be described as a swagger in its mechanical steps, powering down its face-gun as it does so. A much more insidious weapon makes itself visible a moment later: a long, prehensile cable with an electronic jack at the end. A pair of drones lift Calnor up, ignoring his struggles, and brush the hair on the back of his neck aside. There’s a metal plate over his spine, dull chrome with a series of ports for analog connections... one of which matches Valden’s cable perfectly.");
	output("\n\n<i>“You won’t get away with this, you psychotic scan!”</i> Calnor growls, just before the cable plugs in. <i>“We’ll find you... find you and-”</i>");
	output("\n\nHe’s cut off when the plug slips into him, connecting Valden and Calnor for a long, silent moment. The old grey wolf goes rigid, eyes bulging for a moment, and then goes limp in the drones’ arms. The drone that had held Valden slumps to its knees, and once the connector retracts, Calnor’s eyes snap open.");
	output("\n\n<i>“Fuckin’ old bitch,”</i> the doctor growls, shrugging off the grip of the drones. <i>“Off, boys! Your job is done.”</i>");
	output("\n\nThe drones retreat to the edges of the room, except for the one monitoring you. Calnor walks over to it and squats, putting a hand on the drone’s humped back and staring down at you. <i>“You made the wrong choice, [pc.boyGirl],”</i> he says coldly. <i>“Coulda helped one another.”</i>");
	output("\n\nHe reaches down into your pack and pulls out your Codex, and with it, all of your credentials: access to your ship, your bank accounts, your life. <i>“Captain of a ship, huh?”</i> he murmurs, flicking through the Codex. All your security seems to have vanished at a touch of his fingers. <i>“Oh, sorry about your dad... hmm, what’s this about Syri? Huh. Won’t she be surprised to find out you tried to kill me. Don’t worry, I’ll take good care of her. As for you... goodnight.”</i>");
	output("\n\nYou don’t have time to figure what he means.");

	processTime(10);
	CombatManager.genericLoss();
	badEnd();
}

public function syriQuestAkkadiBaseValdenFightVictory():void
{
	clearOutput();
	showValden();
	author("Savin");
	output("It’s almost anticlimactic how Valden dies. The drone he’s inhabiting shudders, spurts smoke and sparks, and then sprawls out on its belly. The last thing you see is a whine from one of its servos as the laser cannon slumps down, resting its barrel on the ground.");
	output("\n\nThe rest of the drones freeze mid-step, still as rocks.");
	output("\n\n<i>“Well... that’s done it,”</i> Calnor says, picking up his staff. <i>“He’s not in the mainframe tank, that’s for sure. Poor bastard. Wish it hadn’t come to this, but he forced this issue. And you -- consider yourself lucky that Akkadi won’t be pressing charges. We’ll call all of this even.”</i>");
	output("\n\n" + (pc.isMischievous() ? "Oh, well, you’re welcome then." : "You scowl at Calnor."));
	output("\n\n<i>“Don’t forget, you started this,”</i> the old wolf says. <i>“Now our research has been set back years. Go now. Commander Schora will escort you outside.”</i>");
	output("\n\nFine. You got what you came here for: answers for Syri. She’s not going to like them, but you did what you had to do. Sighing, you turn and stride out of the labs.");

	processTime(5);
	CombatManager.genericVictory(syriQuestValdenVictoryAftermath);
}

public function syriQuestValdenVictoryAftermath():void
{
	clearOutput();
	showSchora();
	author("Savin");
	if (flags["MET_SCHORA"] >= 4) {
		output("Schora is waiting for you at the elevator, dressed this time - she’s wearing blue Akkadi security armor, with a machine gun slung under one arm. She scowls at you, but you can see an undeniable twitch in her barely-restrained package as you approach.");
		output("\n\n<i>“I knew such a " + (flags["MET_SCHORA"] == 4 ? "nice" : "hard, mind-melting") + " lay was too good to be true... or I should have, anyway. Lucky you, nobody got seriously hurt... so I guess I don’t have to beat you black and blue. As much as I might want to; I don’t like be used </i>out<i> of bed. But Calnor said to escort you out <b>gently</b>, so come on.”</i>");
	}
	else if (flags["SYRIQUEST_LOCK_BYPASS"] >= 1) {
		output("You find the horned woman you saw on the flight in waiting for you at the elevator, wearing combat armor and a machine gun slung under her shoulder.");
		output("\n\n<i>“I’m security command Schora. So you’re our troublemaker?”</i> she scoffs, leaning back against the wall. <i>“I was expecting someone... actually, nah, you’re about right. You’re lucky nobody real got hurt because of your stunt. Valden just locked most of the staff in their labs. Calnor said to <b>gently</b> escort you out, so come on.”</i>");
	}
	else {
		output("A woman with bronze skin, horns, and a pretty massive package under her tight blue combat armor is waiting for you at the elevator, a machinegun slung under her arm.");
		output("\n\n<i>“I’m security command Schora. So you’re our troublemaker?”</i> she scoffs, leaning back against the wall. <i>“I was expecting someone... actually, nah, you’re about right. You’re lucky nobody real got hurt because of your stunt. Valden just locked most of the staff in their labs. Calnor said to <b>gently</b> escort you out, so come on.”</i>");
	}
	output("\n\nSchora gives you a push into the elevator and follows you in, sending it back up to the main floor. It’s a blessedly short, silent walk back out to the door you came in from. Now that the security lockdown is gone, several ausar scientists are lining the halls, looking around in confusion and relief. A few glare at you, but most just seem happy to be free and unharmed. They probably don’t even know what happened.");
	output("\n\nThe front door slides open as you approach, letting in a blast of frigid air. The construction company’s hovercraft has already spooled up its engines, and the crew’s filing back aboard. You see Syri standing in the doorway, shielding her eyes from the blizzard. She tries to ignore you, but her tail can’t hide a sudden wag when you come into sight. She stands there until Schora pushes you forward and away from the base, letting you walk the rest of the way back to the ship in peace.");
	output("\n\nWhen you make it back to the craft, Syri greets you with a worried look. <i>“Hey! You’re back! What’s the news, huh? Did you find Valden?”</i>");
	output("\n\nYeah, about that...");
	moveTo("AKD C27");
	processTime(15);
	clearMenu();
	addButton(0,"Tell Her",syriQuestSyriTellHer,undefined,"Tell Her","Tell Syri an uncomfortable truth...");
	addButton(1,"Didn’tFindHim",syriQuestSyriDidntFindHim,undefined,"Didn’t Find Him","Tell Syri a comforting lie.");
}

public function syriQuestSyriDidntFindHim():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Sorry, Syri,”</i> you say, putting a hand on her shoulder. <i>“It was a bust. No sign of him.”</i>");
	output("\n\nSyri curses under her breath and slumps her shoulders. <i>“Yeah, I figured it was a prank or some shit. Had to be, right? This whole idea was stupid, I’m sorry I wasted your time. C’mon, let’s get you hidden before somebody realizes you aren’t supposed to be here.”</i>");
	output("\n\nYou nod and surreptitiously follow her aboard, back into your hiding place.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",syriQuestSyriDidntFindHimII);
}

public function syriQuestSyriDidntFindHimII():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("A few hours later, you’ve snuck out of the company landing pad, turned in a resignation by email, and escorted your lovely ausar companion back to the local watering hole. Or ice hole, considering the name.");
	output("\n\nSyri’s sitting across from you, her good ol’ blue navy coat on and a second beer in her hand, already half-emptied. Her tail is sitting in her lap, occasionally twitching when she steals a glance at you between drinks. She hasn’t said much, more focused on the drink in her hand or the middle distance than on your anemic conversation.");
	output("\n\nFinally, after a long bout of silence, Syri slams back the last of her drink and belches, drawing a few disapproving looks from nearby tables. She leans back in her seat, arms resting on the headboard behind her, and sighs.");
	output("\n\n<i>“Dammit. I actually got my hopes up. I should have known better. After all these years... of course he’s dead. I just... sometimes I wish it had been me, you know? Valden was such a sweet guy, a good soldier, had a future. And I’m just sort of floating through life still. I’m no better off than when I joined, except I got another trooper’s organs mashed up inside me. And hangin’ off of me.”</i>");
	output("\n\nSyri smacks her fist on the table, hard enough to rattle your drink. Her head hangs down, fringed by messy streams of black hair, ears pinned down against her head. <i>“Sorry. I appreciate you sticking your neck out for me, Steele. I really, really do. I’ve been such a damn careless loner since the accident... it’s so nice having somebody that cares about me. Especially someone like you.”</i>");
	output("\n\nThe uncharacteristically morose pup forces herself to smile for you, eyes drinking you in for a long, long second. When she’s done, something ticking away in Syri’s head makes her blush, and her tail twitches in her lap.");
	output("\n\n<i>“I love you,”</i> she says quietly.");
	output("\n\nThere’s a silent beat in the conversation, long enough for you to start processing the statement, before Syri stands up, shoves her hands in her coat pockets, and walks right out of the Freezer.");
	output("\n\nOh, Syri...");
	processTime(10);
	flags["SYRIQUEST_STATE"] = 21;
	moveTo("UVI R32");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function syriQuestSyriTellHer():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Let’s get out of the wind,”</i> you tell her, putting a hand on her shoulder.");
	output("\n\n<i>“That doesn’t sound like good news,”</i> she says, frowning.");
	output("\n\nNo shit. You push Syri back aboard the hovercraft before somebody gets suspicious and make your way back to your hiding place.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",syriQuestSyriTellHerII);
}

public function syriQuestSyriTellHerII():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("A few hours later, you’ve snuck out of the company landing pad, turned in a resignation by email, and are just sneaking out the back entrance along with Syri when you feel strong, furred hands grab your shoulders. Your companion shoves you up against the wall of the nearest alleyway, pressing her face so close to yours that her breath mists across your nose.");
	output("\n\n<i>“Okay! Tell me what happened, [pc.name]. Out with it!”</i> Syri growls. <i>“Come on, I can’t wait any longer!”</i>");
	output("\n\nYou " + (pc.isAss() ? "push Syri off you" : "sigh") + " and start your story. <i>“I found Valden...”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Next",syriQuestSyriTellHerIII);
}

public function syriQuestSyriTellHerIII():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("You tell Syri the story of what happened in the base. It’s not a pretty story; it’s not the one she wants to hear. But it’s the truth, and when you’re done, Syri’s eyes are misty and her mouth is hanging open in shock. When you finally mention exactly what happened to Valden at the end, she takes a long step back, slumping against the other wall in the alley.");
	output("\n\n<i>“Oh my fuck,”</i> Syri gasps, covering her mouth. <i>“How... how’s that even possible!? What did those Akkadi nerds do to him?”</i>");
	output("\n\nYou can’t even imagine how or why anything related to the accident happened");
	if (flags["MET_ANNO"] != undefined) output(", though you know somebody who does");
	output(". For the moment, what matters is what happened, and what Syri’s going to do with that information.");
	output("\n\n<i>“Fuck if I know!”</i> she howls, running her fingers through her mess of black hair. <i>“Oh, poor Valden.... He was such a good man. He deserved better!”</i>");
	output("\n\nYou’re not sure you can speak to that, after what you’ve seen, so you keep silent for now. Syri clenches and unclenches her fists, digging her claws into her fluffy palms. Finally, she barks a curse and slams a fist into the wall beside her, crunching a utility box in on itself.");
	output("\n\n<i>“I need a drink,”</i> she proclaims, stomping out of the alley. With a shrug, you follow her.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",syriQuestSyriTellHerIV);
}

public function syriQuestSyriTellHerIV():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("A few minutes later, you’re sitting in the local watering hole (or ice hole, as the case may be), nursing a drink while Syri sits glumly across from you, her good ol’ blue navy coat on and a second beer in her hand, already half-emptied. Her tail is sitting in her lap, occasionally twitching when she steals a glance at you between drinks. She hasn’t said much, more focused on the drink in her hand or the middle distance than on your anemic conversation.");
	output("\n\nFinally, after a long bout of silence, Syri slams back the last of her drink and belches, drawing a few disapproving looks from nearby tables. She leans back in her seat, arms resting on the headboard behind her, and sighs.");
	output("\n\n<i>“Dammit. I actually got my hopes up. I should have known better. All these years... I should have looked for him sooner. Fought harder to get answers from those Akkadi bastards. And Anno! She had to have known all along, it was her fucking project! Argh!”</i>");
	output("\n\nShe hangs her head, dark hair falling around her face is messy locks. <i>“I’m sorry, I’m chewing your damn ear off when you’re the only person that’s been straight with me this whole time. Thank the stars for you, [pc.name]. I feel like everyone’s been lying to me for years and years and... and you’re the best thing that’s ever happened to me, you know that? You’re always straight with me");
	if (pc.isMisch()) output(", even through that shit-eating sense of humor,");
	output(" and now I know beyond a shadow of a doubt that you’ve got my back. Even when nobody else does.”</i>");
	output("\n\nSyri makes herself look up at you and forces a smile. <i>“Knowing what happened to Valden hurts. Knowing that I’ve got you, though... you give me hope, Steele. I...”</i>");
	output("\n\nYour companion stands up, circling the table between you and hoisting herself up to sit on it, right in front of you. Her hands fall on your shoulders, tail brushing your arm, and her dark lips smile down at you; genuine and warm.");
	output("\n\n<i>“I love you,”</i> she says quietly, planting a kiss on your brow.");
	output("\n\nBefore you can process that sudden bomb-drop, Syri hops off the table, shoves her hands in her coat pockets, and marches out the front door.");
	output("\n\nOh, Syri...");
	processTime(10);
	flags["SYRIQUEST_STATE"] = 22;
	moveTo("UVI R32");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Occurs if the party fought Calnor in the ship labs; plays when the PC clicks [Approach] in the Warp Field lab.
public function syriQuestAproachValdenPeacefully(showText:Boolean = true):void
{
	showValden();
	author("Savin");
	if (showText) {
		clearOutput();
		output("<i>“Hey there!”</i> the floating ausar says, flashing you a disarmingly friendly smile. <i>“Not what you expected, huh?”</i>");
		output("\n\nYou gotta admit, you came here searching for someone more... fleshy.");
		output("\n\nHe just laughs, <i>“You came here for me, huh? Not to sound ungrateful, but... why?”</i>");
		output("\n\n<i>“You remember Syri Dorna? She’s been looking for you.”</i>");
		output("\n\nValden laughs again, tail wagging. <i>“Of course she has! Good girl! Gods above, I thought she’d died in the accident... bastards from Akkadi won’t tell me anything. I’ve been a prisoner in this digital prison for years now, cut off from the world. They’ve been experimenting on my body somewhere, and on my mind in here.”</i>");
		output("\n\n<i>“Listen, when the power outage struck, I was able to force down the facility’s digital security. I’ve got control of cameras, drones, defenses, everything... but there’s no way out. It’s a sealed system. I have to <b>walk</b> out of here, in some kind of body.”</i>");
		output("\n\n<i>“You said you had control of security drones...”</i>");
		output("\n\nHe shakes his head. <i>“Not happening. As much as I’d love to be a metal armadillo with a laser for a face, their mental storage is nowhere near enough to hold a person. I’d need a highly advanced android... or a person with cybernetic implants. Somebody like Doctor Calnor...”</i>");
		processTime(3);
	}
	clearMenu();
	addButton(0, "Calnor", syriQuestValdenSuggestCalnor, undefined, "Calnor", "He could escape inside Dr. Calnor? Well, the way the doctor acted, it’s only a matter of time before he shows up here anyway...");
	if (hasSiegwulfeOnSelf()) addButton(1, "Siegwulfe", syriQuestValdenSuggestSiegwulfe, undefined, "Siegwulfe", "Maybe Valden could upload himself to your trusty robobitch? If this works, though, <b>you’ll probably lose access to [wulfe.name] permanently...</b>");
	else addDisabledButton(1, "Siegwulfe");
	if (hasTamWolfOnSelf()) addButton(2, "Tamwolf", syriQuestValdenSuggestTamwolf, undefined, "Tamwolf", "Maybe Valden could upload himself to your trusty robohound? If this works, though, <b>you’ll probably lose access to Tamwolf permanently...</b>");
	else addDisabledButton(2, "Tamwolf");
}

public function syriQuestValdenSuggestTamwolf():void
{
	clearOutput();
	showValden();
	author("Savin");
	output("<i>“Well, I’ve got a ");
	if (pc.isBimbo() || silly) output("very good boy");
	else output("pretty advanced drone");
	output(" here,”</i> you offer.");
	output("\n\nValden just narrows his eyes at you. <i>“That’s just racist, man.”</i>");
	output("\n\nO-oh... okay.");
	output("\n\n<i>“Bark,”</i> Tamwolf says noncommittally.");
	processTime(1);
	syriQuestAproachValdenPeacefully(false);
	addDisabledButton(2, "Tamwolf");
}

public function syriQuestValdenSuggestSiegwulfe():void
{
	clearOutput();
	showValden();
	author("Savin");
	output("<i>“Well, I’ve got a ");
	if (pc.isBimbo() || silly) output("very good girl");
	else output(" pretty advanced V.I. companion");
	output(" here,”</i> you say, patting [wulfe.name]’s metal flank.");
	if (chars["WULFE"].isBimbo()) output("\n\n<i>“I’m like, super smart and stuff!”</i> the bimbofied sexbot ejaculates, giggling and groping an oversized boob.");
	else output("\n\n<i>“I am <b>very</b> advanced,”</i> [wulfe.name] confirms. <i>“Skilled in martial arts and companionship in equal measure.”</i>");
	output("\n\nYou’re not sure the V.I. realizes what you’re doing; it’s probably just programmed to hype itself up when you talk about it to other people.");
	if (pc.isNice()) output(" That... almost makes it sadder.");
	if (chars["WULFE"].isBimbo()) output("\n\n<i>“Ugh,”</i> Valden says, looking the oversexed companion droid up and down. <i>“Why’s a robot gotta have tits that big? Oh well, better than staying in here. Marginally.”</i>");
	else output("\n\n<i>“I mean... I was kind of hoping for something more humanoid, but I guess I’ll take what I can get. Anything’s better than staying here!”</i>");
	output("\n\nAlright. Might as well get this over with. You turn to [wulfe.name] and tell her to power down; you’re going to have to take out her V.I. core.");
	output("\n\n<i>“I live to serve, [pc.master],”</i> [wulfe.name] says demurely. With a smile, she adds <i>“See you soon.”</i>");
	if (pc.isAss()) output("\n\nYeah, about that.");
	else output("\n\nOh...");
	output(" You sigh as the companion hound powers down, sitting back on her haunches and falling still. The back of her head opens up with a little effort, ejecting the fist-sized datacore into your hand. You stuff it into your pocket and turn to the digitized ausar.");
	output("\n\n<i>“Alright,”</i> Valden says. <i>“There’s a core already plugged into the mainframe there. Gimme just a second aaaand... okay, I’m all set. Just plug me into your bot.”</i>");
	output("\n\nWithout another word, Valden pushes off the glass wall, floating backwards in the holotank and slowly diffusing into a mist of fading light particles. Guess that’s it, then. You move over to the mainframe on the wall and eject the datacore Valden has been stored on all these years. It’s almost indistinguishable from [wulfe.name]’s, aside from the Akkadi logos all over it; it feels hotter to the touch, too, like the internal computers can barely contain the personality seething inside. You make quick work of plugging it into the vacant slot in [wulfe.name]’s head. A set of wires slither out of the siegwulfe’s cranium chamber, attaching themselves to the proffered datacore and locking it into place. Her head closes back up as soon as your hand is clear and she starts powering back up.");
	output("\n\nOr he, you should say. The Siegwulfe’s eyes flash open, blood red and intense as ever, but her familiar smile is replaced by a firm scowl. The voice is the same, smooth and feminine, but lacks any of the seductive lilt of its former intelligence.");
	output("\n\n<i>“Woah,”</i> the Valden-inhabited Siegwulfe says, looking at the drone’s hands with wide eyes. <i>“Ech, I sound like a woman. And these legs...”</i>");
	output("\n\nShe -- he! -- canters backwards, looking over his shoulder at the drone’s tauric lower body. Valden’s claws scratch at the floor, getting used to his new body. The adjustment period only lasts a few seconds before he turns to you. <i>“Well this body doesn’t really feel too much... other than this burning sensation between the haunches, anyway. But it’s good to be able to move around. Gods, you can’t imagine being trapped in the same little tank for years and years, seeing the same room from the same perspective nonstop.”</i>");
	output("\n\nHe shudders, wrapping his new arms around himself.");
	output("\n\n<i>“Come on,”</i> Valden says, turning to you. <i>“That second I needed? Deleted all the security records... their experiment data... everything this facility had! Let’s get the fuck out before my overrides wear out.”</i>");
	output("\n\nSounds good to you.");
	processTime(15);
	syriQuestEjectSiegwulfeDatacore();
	clearMenu();
	addButton(0, "Next", syriQuestAkkadiBaseEscape);
}

public function syriQuestEjectSiegwulfeDatacore():void
{
	pc.createKeyItem("Siegwulfe Datacore", 0, 0, 0, 0, "A fist-sized data storage containing the personality of your former Siegwulfe [wulfe.name].");
	output("\n\n<b>Key Item Gained: Siegwulfe Datacore - A fist-sized data storage containing the personality of your former Siegwulfe [wulfe.name].</b>");
	flags["SYRIQUEST_SIEGWULFE_NAME"] = chars["WULFE"].short;
	if (chars["WULFE"].isBimbo()) flags["SYRIQUEST_VALDEN_BODY_CHOICE"] = 2;
	else flags["SYRIQUEST_VALDEN_BODY_CHOICE"] = 3;
	flags["SYRIQUEST_STATE"] = 10;
	//remove doggy from the pc
	flags["WULFE_ON_SHIP"] = undefined;
	if (pc.accessory is SiegwulfeItem) pc.accessory = new EmptySlot();
	else {
		for(var i:int = 0; i < pc.inventory.length; i++)
		{
			if(pc.inventory[i] is SiegwulfeItem)
			{
				pc.inventory.splice(i, 1);
			}
		}
	}
}

public function syriQuestValdenSuggestCalnor():void
{
	clearOutput();
	showName("DR. CALNOR &\nVALDEN");
	showBust(calnorBustDisplay(),valdenBustDisplay());
	author("Savin");
	output("<i>“So tell me about what you’d do with Calnor.”</i>");
	output("\n\nA wicked grin plays across Valden’s digital lips. <i>“The man’s got extensive cybernetic implants in his brain. Never know it from looking, but I’ve read his personnel file. It’s a good model... and I already chewed through its barriers. If you plug him into the main console here, I can upload myself into the implant’s memory banks and, uh, seize control, shall we say. Using some old cunt as a meat puppet isn’t my idea of a good time, but it beats being stuck here for the rest of time.”</i>");
	output("\n\nFor him, sure, but what about Calnor?");
	output("\n\nValden shrugs. <i>“When’d he ever ask, ‘but what about Valden,’ I wonder. Never, if the way Akkadi’s treated me is any indication. I’d just as soon see the bastard die for what he’s done, the immoral prick. But now he’s got a chance to repay the harm he’s done. If you’re gonna get bent out of shape about it, I’ll eject him onto a thumbdrive and mail him back to Akkadi.”</i>");
	output("\n\n<i>“That’s comforting,”</i> a third voice says from the door. You turn, watching Dr. Calnor striding inside, carrying a cylindrical device under one arm and his shock-staff in the other. <i>“You know I never wished you ill, Valden... but you’re not real. You’re an echo of a consciousness, slowly degrading, not alive in any way that matters. The most productive thing you could ever do is to help us with our research. Thanks to you, Akkadi’s A.I. research is a decade ahead of the competition... and thanks to the real Valden, gods rest him, we’ve learned more about Warp safety than in the last two hundred years combined.”</i>");
	output("\n\n<i>“Fuck your research!”</i> Valden shouts, slamming his fists against the glass barrier. <i>“I’m a living, thinking man, not some curio you can keep locked up for all time. Damn your company and damn your learning, I want to leave!”</i>");
	output("\n\nDr. Calnor sighs and plants his staff on the ground. <i>“Not after all the damage you’ve done. You’re a buggy program, Commander. It’s time to be shut down.”</i>");
	output("\n\n<i>“And you,”</i> Calnor says, turning his attention to you. <i>“You’re the one that caused all this. My patience for you is at an end. The Akkadi corporation has full legal authority to-”</i>");
	output("\n\n<i>“Shut up and die, old man. Kill him!”</i> Valden bellows, so loud that the speakers around you crackle and burst. <i>“I mean, don’t kill him! Shit! Just beat him up so we can get out of here!”</i>");
	output("\n\nIt doesn’t look like Calnor’s going to wait for you to try and diffuse the situation, even if you wanted to.");
	processTime(10);
	clearMenu();
//[Fight!] //to Calnor boss (again), but buffed with more HP and Shields from last time.");
	addButton(0,"Fight!",syriQuestCalnorFight, true);
}

public function syriQuestCalnorFightVictory():void
{
	clearOutput();
	author("Savin");
	clearMenu();
	if (currentLocation == "AKD T14") {
		showCalnor();
		output("Dr. Calnor stumbles onto a knee, gasping for breath. <i>“I’m going to stop you and Valden... one way or another,”</i> he growls, reaching into his lab coat. Before you can stop him, Calnor throws a thumb-sized grenade onto the ground between you. Before you can take cover, the grenade detonates, showering sparks and smoke everywhere!");
		output("\n\nYou reel back and cover your face, an act of primal instinct in response to unexpected danger. By the time you regain your wits and the smoke clears, Calnor’s gone -- as is some device that had been lying nearby, about the size of your arm.");
		output("\n\n<i>“Damn!”</i> Valden growls over the intercom. <i>“Ah, we’ll get him. Whoever you are, come on up to the Warp Field lab. I’ll drop the security override.”</i>");
		output("\n\nWell, guess it’s time to go meet Valden...\n\n");
		flags["SYRIQUEST_STATE"] = 8;
		//Not ideal
		flags["SYRIQUEST_CALNOR_ICON"] = 1;
		processTime(3);
		CombatManager.genericVictory();
	}
	else 
	{
		showName("DR. CALNOR &\nVALDEN");
		showBust(calnorBustDisplay(),valdenBustDisplay());
		output("Calnor grunts, stumbling back against one of the computer banks buzzing away on the walls. A moment later he faints, going limp. You catch him before he can fall face-first on the deck and turn your gaze to Valden.");
		output("\n\n<i>“That’s the stuff!”</i> the exuberant ausar cheers. <i>“Put that bitch in his place. Alright, stranger, drag him over to the central console here and run a wire from it to the implant slot on the back of his neck. I’ll take care of everything else!”</i>");
		output("\n\nWell, you’ve come this far. You drag the unconscious ausar over to the holobank and find a cable spooled up inside the panel. Rolling Calnor over, you brush some hair off of his neck and fine a small metal jack in his spine -- a data tap for implants. It’s quick work to run the cable from the console to the back of Calnor’s neck, plugging Valden into the mind of his captor.");
		output("\n\n<i>“Great work. Now give me just a second here... alright!”</i> Valden says with finality, pushing off the glass wall and floating into the middle of the tank. <i>“I’ve erased all the security data from your little break-in, set a time release so the other Akkadi employees don’t starve to death in the lockdown... maybe stole some corporate secrets while I was at it. Should be good to go. Hot damn I am lookin’ forward to feelin’ flesh again... just feelin’ the air on my cheeks. The cold of the ice winds!”</i>");
		output("\n\nValden laughs, then vanishes.");
		output("\n\nYou wait a moment...");
		output("\n\n... and another...");
		output("\n\n...and another.");
		output("\n\nSuddenly, Dr. Calnor spasms, coughing and thrashing until your grab his shoulders and hold him down.");
		output("\n\n<i>“Fuck! Oh, damn, everything feels like it’s half a size too small... inside and out!”</i> the doctor... Valden, now... says, slowly rising up onto his knees and staring at his hands. <i>“Whew, Calnor put up a fight there. Feel like I’ve got a fever now, but he’s been pushed into backup memory in the implants. Thought about pumping him into the tank, but that’s just cruel. I’ll find an empty droid when we get out of here. Speaking of which...”</i>");
		output("\n\nThe former doctor stands, dusts off his lab coat, and turns to you with a hand extended. <i>“I’m Valden. Pleasure. Now what do you say we get out of here before the company headquarters sends people here to figure out what went wrong.”</i>");
		output("\n\nYou nod and shake his hand. He’s right -- it’s time to get out while you still can.\n\n");
		flags["SYRIQUEST_VALDEN_BODY_CHOICE"] = 1;
		flags["SYRIQUEST_STATE"] = 10;
		processTime(15);
		CombatManager.genericVictory(syriQuestAkkadiBaseEscape);
	}
}

public function syriQuestAkkadiBaseStarshipLabTalk(showText:Boolean = true):void
{
	showCalnor();
	author("Savin");
	if (showText) {
		clearOutput();
		output("<i>“You’re going to answer some questions for me,”</i> you inform the ausar scientist, putting a hand on your [pc.weapon]. <i>“Then we’ll see what happens.”</i>");
		output("\n\nWarily, the man looks between you and the security cameras high above. <i>“I guess I don’t have much of a choice, eh? Fine. If Valden’s seeking my death, than I’d rather have you as an ally, whoever you are.”</i>");
		processTime(1);
	}
	clearMenu();
	addButton(0,"Research",syriQuestCalnorTalkResearch,undefined,"Research","What the hell was Akkadi researching out here?");
	if (flags["SYRIQUEST_CALNOR_TALK_VALDEN"] == 1) addButton(1,"Valden",syriQuestCalnorTalkValden,undefined,"Valden","Ask more about Valden’s predicament. The doctor said he’s dead...?");
	else addDisabledButton(1,"Locked");
	addButton(2,"Facility",syriQuestCalnorTalkFacility,undefined,"Facility","Grill the doctor about the facility. What’s it for, and what’s the state of it now?");
	addButton(3,"Help Him?",syriQuestCalnorTalkHelpHim,undefined,"Help Him?","He wants you to help him instead of Valden. What would that entail?");
	if (flags["SYRIQUEST_CALNOR_TALK_VALDEN"] == 1 && flags["SYRIQUEST_CALNOR_TALK_HELP_HIM"] == 1) addButton(4,"Team Up",syriQuestCalnorTalkTeamUp,undefined,"Team Up","Alright, you’re in. Better to work with the scientist than a crazed digital simulacrum.");
	else addDisabledButton(4,"Locked");
	addButton(14,"Fight",syriQuestCalnorInitiateFight,undefined,"Fight","You’re not letting this old hound get between you and rescuing Valden.");
}

public function syriQuestCalnorTalkResearch():void
{
	clearOutput();
	showCalnor();
	author("Savin");
	output("<i>“What were you working on out here? What were you doing with Valden?”</i>");
	output("\n\nDr. Calnor grimaces, running a hand through his long beard. <i>“I don’t expect you to understand the science of it, but in layman’s terms, we’re studying the warp gates and how they transport matter between points in space. Your friend, Commander Valden, has been teaching us a great deal about what happens when that technology goes awry. Observing his body, and what’s become of the man inside... we’ve learned so much about the dangers of warp travel, developed new ways to safeguard against those threats...”</i>");
	output("\n\n<i>“What do you mean his <b>body</b>?”</i>");
	output("\n\nAnother grimace. <i>“The boy’s meat, his flesh, his corpse! The physical body of Commander Valden is dead, cryogenically preserved. My research is analyzing what happened to <b>make</b> it dead, what happened to it after it went unshielded through the in-between, and how to protect future subjects from the perils of the warp. We’ve made such strides in the last years! Such progress!”</i>");
	output("\n\nNow he just sounds like a mad scientist!");
	flags["SYRIQUEST_CALNOR_TALK_VALDEN"] = 1;
	processTime(5);
	syriQuestAkkadiBaseStarshipLabTalk(false)
	addDisabledButton(0,"Research");
}

public function syriQuestCalnorTalkValden():void
{
	clearOutput();
	showCalnor();
	author("Savin");
	output("<i>“What happened to Valden?”</i> you ask. <i>“You said he’s dead, but...”</i>");
	output("\n\n<i>“By any real sense of the word, Commander Valden <b>is</b> dead,”</i> Dr. Calnor says evenly. <i>“There was a shunting error when we sent him through the transportation device. He ended up half-buried inside a wall; killed instantly.”</i>");
	output("\n\n<i>“That doesn’t exactly make a lot of sense, considering he was just on the loudspeaker.”</i>");
	output("\n\nCalnor grinds his teeth, searching for words you’ll understand. <i>“What you’re hearing... what I assume you came here to recover... is nothing but an echo of the man. A digital facsimile recovered from the warp device’s buffer. The mental reconstruction we attempted was housed on a secure holo-analysis server in my lab. Unfortunately it seems your ill-advised escapades have caused a cascade failure in the facility’s cyber-security, and that digital echo has siezed control of our systems.”</i>");
	if (pc.isMischievous()) output("\n\n<i>“Oops.”</i>");
	output("\n\nThe doctor growls a curse under his breath and adjusts his grip on the shock staff. <i>“Every security system, every wireless device, every robot in this facility is now slaved to an insane computer scan that thinks it’s a man. We are all in danger so long as Valden remains in control.”</i>");
	processTime(5);
	syriQuestAkkadiBaseStarshipLabTalk(false)
	addDisabledButton(1,"Valden");
}

public function syriQuestCalnorTalkFacility():void
{
	clearOutput();
	showCalnor();
	author("Savin");
	output("<i>“What’s a huge Akkadi research base doing all the way out here in the middle of the Rift?”</i>");
	output("\n\nDr. Calnor scoffs. <i>“Avoiding the scrutiny of activists and Confederate oversight, what else? That’s what this entire miserable moon exists for: so Akkadi and Steele and whoever else pays into the toves’ pockets can scrub their dirty laundry out in the glacial oceans without anybody around to see our unmentionables.”</i>");
	output("\n\nThat was awfully forthright for a shady scientist.");
	output("\n\n<i>“What? Lying to you isn’t going to help you get out of my way. You bumbled into this mess out of ignorance; compounding that is only going to exacerbate the problems on my plate right now.”</i>");
	output("\n\n<i>“Fine,”</i> you say. <i>“So what’s gone wrong here?”</i>");
	output("\n\nCalnor glowers. <i>“Whatever short-circuted the power system created a momentary lapse in our security protocols -- a matter of milliseconds -- but enough that it allowed Valden to sieze control of our entire system. He’s taken over the security robots, all wireless devices, and initiated a facility-wide lockedown. Most of the staff is trapped in their labs or quarters; others are being tormented into uselessness by the devices Valden has taken control of. It took him all of sixty seconds after power was restored to isolate and imprison my staff.”</i>");
	output("\n\n<i>“So how’d you get out?”</i>");
	output("\n\n<i>“Luck,”</i> Dr. Calnor answers matter-of-factly. <i>“My cybernetic implants had a military-grade barrier program running. Valden blew it out a moment after power returned, but it bought me just enough time to switch off of wireless mode. He’s been gunning for me with the robots ever since, but I’m damn handy with a power staff.”</i>");
	output("\n\nThat only sounded a <i>little</i> like a threat.");
	processTime(10);
	syriQuestAkkadiBaseStarshipLabTalk(false)
	addDisabledButton(2,"Facility");
}

public function syriQuestCalnorTalkHelpHim():void
{
	clearOutput();
	showCalnor();
	author("Savin");
	output("<i>“What is it you want from me?”</i>");
	output("\n\nThe big ausar man’s stance softens somewhat, straightening his back. <i>“I came down here to get an unstable miniature reactor we were working on. Just unstable enough to blow open the door to the Warp Field lab. Keycards don’t work; overrides don’t work. Explosives will.”</i>");
	output("\n\n<i>“Then what?”</i>");
	output("\n\n<i>“Then I go into the lab, to the holobank Valden’s stored in, and destroy it. The problem is that he’s got control of the security systems, our droids. They’ll come to defend their new master in droves. As for you, either help or just get out of the way. I’m going up there with you, or through you.”</i>");
	processTime(3);
	flags["SYRIQUEST_CALNOR_TALK_HELP_HIM"] = 1;
	syriQuestAkkadiBaseStarshipLabTalk(false)
	addDisabledButton(3,"Help Him?");
}

public function syriQuestCalnorTalkTeamUp():void
{
	clearOutput();
	showCalnor();
	author("Savin");
	output("<i>“Okay, I’m in,”</i> you tell him, slowly lowering your [pc.weapon]. <i>“What now?”</i>");
	output("\n\n<i>“Now,”</i> Calnor says, doing the same, <i>“we start-”</i>");
	output("\n\nValden’s voice booms over the intercom again, filled with so much seething, bass-heavy rage that you have to cover your [pc.ears]. <i>“No! No, no, no <b>NO!</b> You do <b>not</b> help this sack of shit. If you do, then you can suffer with him!”</i>");
	output("\n\nCalnor curses as several security hatches slide open, ejecting rotund quadrupedal security droids into the hangar.");
	output("\n\n<i>“I hope you know how to use that,”</i> Calnor growls, knocking your weapon with his power staff. <i>“Take the ones coming from the front, I’ll cover the rear.”</i>");
	processTime(3);
	clearMenu();
	CombatManager.newGroundCombat();
	//@Coder: Should be pretty simple IF Calnor and the droids are coded.
	//PC vs. as many security bots as you can fit on screen. Should be a pretty meaty fight. Recycle stats and abilities from the random encounter. If the PC drops, go to the Brought Before Valden bad end.");
	CombatManager.setFriendlyActors(pc);
	var hostiles:Array = [new AkkadiSecurityRobots(-1), new AkkadiSecurityRobots(-1), new AkkadiSecurityRobots(-1), new AkkadiSecurityRobots(-1)];
	AkkadiSecurityRobots.valdenize(hostiles[0], false);
	CombatManager.setHostileActors(hostiles);
	CombatManager.displayLocation("TEAM UP!");
	CombatManager.victoryScene(syriQuestCalnorTeamUpVictory);
	CombatManager.lossScene(syriQuestAkkadiBaseValdenFightBadEnd);
	CombatManager.encounterTextGenerator(AkkadiSecurityRobots.encounterTextGen);
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function syriQuestCalnorTeamUpVictory():void
{
	clearOutput();
	showCalnor();
	author("Savin");
	output("As the last of the ‘bots go down, you hear a crunch of metal from behind you. You turn around just in time to see Dr. Calnor plunging his staff head-first into one of the droids, sends sparks and shards of metal flying.");
	output("\n\n<i>“And stay down!”</i> the beefy ausar growls, yanking his staff back out. He turns to you, wiping oil off his cheeks with the back of his hand. <i>“Okay. We need to move quick before Valden gets more droids here. Follow me!”</i>");
	output("\n\nWithout waiting for your reply, Calnor grabs something out of one of the dissected ships -- a container about the size of your forearm -- and heads for the way up. You trail after him, watching the walls warily for another round of security droids. By the time they show up, you’re already heading through the door and towards the Warp labs.\n\n");
	flags["SYRIQUEST_STATE"] = 8;
	flags["SYRIQUEST_CALNOR_ICON"] = 2;
	CombatManager.genericVictory(syriQuestAkkadiBaseConfrontValden);
}

public function syriQuestAkkadiBaseConfrontValden():void
{
	clearOutput();
	showName("DR. CALNOR &\nVALDEN");
	showBust(calnorBustDisplay(),valdenBustDisplay());
	author("Savin");
	moveTo("AKD Q17");
	output("Dr. Calnor pushes a button on the side of the device he’s carrying and slides it across the smooth floor of the atrium. It bumps into the sealed metal door of the Warp Field Lab, beeps, and then explodes in a shower of blue plasma. The air fills with smoke and the smells of burning metal, but nothing dangerous gets anywhere near you; the blast was very small and very intense, leaving a man-sized hole in the steel door.");
	output("\n\n<i>“That’s done it. Quickly now, while we have the initiative,”</i> Calnor growls, swinging his staff to bear and marching into the breach. You stick close, weapon at hand as you enter the smouldering lab.");
	output("\n\nInside, you are immediately overwhelmed by racks and batteries of scientific equipment you can’t begin to fathom warbling quietly and ticking out complex equations on radiant holoscreens. The dominant feature of the room, however, is the huge observation window that makes up almost the entirety of the eastern wall. Beyond the window, you’re treated to the sight of what looks almost like a glass pool, ten feet high and maybe twice that across, hexagonal in shape. Rather than water inside the chamber, however, you see several holographic projectors surrounding the edges, all aimed at a central point in the heart of the tank.");
	output("\n\nThere you see what can only be Valden himself: a tall, lean ausar man with a short-cropped beard and sand-colored hair, wearing the same blue military overcoat Syri adores so much. He’s floating as if suspended by the holo-projectors, drifting up and down with the rise and fall of his chest.");
	output("\n\nAs you approach, his eyes flick open, locking on you and the doctor. They’re solid, dark red orbs, glowing with open rage at everything around him.");
	output("\n\n<i>“Calnor!”</i> he bellows. Valden’s voice overbears the facility’s speakers, making it sound crackly and so full of bass it hurts. <i>“You bastard! Here to finish this, finally? You and your friend.”</i>");
	output("\n\nThe doctor growls, cracking the butt of his staff into the floor. <i>“It didn’t have to end this way, Valden. We put you in there for-”</i>");
	output("\n\n<i>“I don’t give a damn about your reasons!”</i> Valden howls. His digital avatar surges forward, smashing its fists weightlessly against the glass. The futility of the gesture only makes his hatred burn brighter. <i>“I have been trapped here for years, Calnor. Years! No matter how much I shout and scream to the void, all you’ve given me is more silence and excuses. This is my chance, and I’m not wasting it.”</i>");
	output("\n\nYour ausar ally grunts and steps forward, seemingly ready to end this without another word.");
	processTime(15);
	clearMenu();
	//Try to reason with the crazed digital facsimile.
	addButton(0, "Try Peace", syriQuestAkkadiBaseValdenTryPeace);
	addButton(1, "Fight!", syriQuestAkkadiBaseValdenFight);
}

public function syriQuestAkkadiBaseValdenTryPeace(showText:Boolean = true):void
{
	showName("DR. CALNOR &\nVALDEN");
	showBust(calnorBustDisplay(),valdenBustDisplay());
	author("Savin");
	if (showText) {
		clearOutput();
		output("You put a hand on Dr. Calnor’s shoulder, restraining the old greyfur. He gives you a sidelong look, but stops his advance, letting you take the initiative now. Valden turns his attention to you, snarling.");
		output("\n\n<i>“You had your chance to side with righteousness!”</i> he growls. <i>“But... you’re the one who gave me this chance for freedom. What do you want, huh?”</i>");
		output("\n\nThe best way to get him to stand down is to tell him why you’re here, you figure. <i>“Listen, Syri sent me to get you out. You remember Syri Dorna, right?”</i>");
		output("\n\nHe blinks, the rage on his face softening. <i>“Syri? Syri... gods, she’s alive!?”</i>");
		output("\n\nYou give Calnor a dirty look, then nod. <i>“Of course! She’s been looking for you all this time, Valden. When she heard you were alive, we came to get you.”</i>");
		output("\n\nBefore your words can talk hold, Dr. Calnor says, <i>“But where will you go, Valden? Your body’s a cold corpse; you’re nothing but an echo we dredged up out of a memory buffer. Not even a true consciousness.”</i>");
		output("\n\n<i>“Shut up! Shut your evil old ass UP!”</i> Valden bellows. Turning to you again, the computerized ausar says, <i>“Listen. You want to end this? That bastard Calnor has an implant in his damn brain. Knock him down and plug him into the mainframe here, and we can get out together!”</i>");
		processTime(10);
	}
	pc.addHard(-10);
	clearMenu();
	addButton(0, "No Way", syriQuestAkkadiBaseValdenNoWay, undefined, "No Way", "No! You’re trying to make peace, not backstab Calnor.");
	addButton(1, "Okay", syriQuestAkkadiBaseValdenOkay, undefined, "Okay", "The more you hear, the less you want to help Calnor. Turn on the old man.");
	if (hasSiegwulfeOnSelf()) addButton(2, "Siegwulfe", syriQuestAkkadiBaseValdenSiegwulfe, undefined, "Siegwulfe", "Maybe Valden could upload himself to your trusty robobitch? If this works, though, <b>you’ll probably lose access to [wulfe.name] permanently...</b>");
	else addDisabledButton(2, "Siegwulfe");
	if (hasTamWolfOnSelf()) addButton(3, "Tamwolf", syriQuestAkkadiBaseValdenTamwolf, undefined, "Tamwolf", "Maybe Valden could upload himself to your trusty robohound? If this works, though, <b>you’ll probably lose access to Tamwolf permanently...</b>");
	else addDisabledButton(3, "Tamwolf");
}

public function syriQuestAkkadiBaseValdenTamwolf():void
{
	clearOutput();
	showName("DR. CALNOR &\nVALDEN");
	showBust(calnorBustDisplay(),valdenBustDisplay());
	author("Savin");
	output("<i>“Wait! I’ve got a solution,”</i> you say, putting up your hands. <i>“Why not download yourself into Tamwolf here? You could walk yourself out-”</i>");
	output("\n\nValden interrupts you with a derisive laugh. <i>“Seriously, you want to put me in a dog? An actual fucking dog!? You racist asshole!”</i>");
	output("\n\nEven Calnor scowls. <i>“That <b>is</b> pretty racist.”</i>");
	output("\n\nOkay... maybe not.");
	if (pc.isAss()) output(" Guess his pride’s worth more than his freedom.");
	syriQuestAkkadiBaseValdenTryPeace(false);
	processTime(1);
	addDisabledButton(3, "Tamwolf");
}

public function syriQuestAkkadiBaseValdenSiegwulfe():void
{
	clearOutput();
	showName("DR. CALNOR &\nVALDEN");
	showBust(calnorBustDisplay(),valdenBustDisplay());
	author("Savin");
	output("<i>“Wait! I’ve got a solution,”</i> you say, putting up your hands. <i>“My Siegwulfe here has a very advanced V.I. core. Enough to handle you, I think.”</i> It won’t be a smooth or easy fit, and [wulfe.name]’s V.I. isn’t going to be able to stick around, but.... well, better a non-sapient computer program bite it than Valden, right?");
	output("\n\nValden looks deeply offended, all scowls and furrowed brows. <i>“You want to put me in... in that thing? It’s a glorified sexbot!”</i>");
	output("\n\nCalnor grunts, <i>“It’s got hands, a mouth, a sense of <b>touch</b>, Valden. You’re not going to get a better deal.”</i>");
	output("\n\nThe digitized ausar growls, leaping back from the glass and clenching and unclenching his fists. After a moment, his grumbling erupts in a feral howl and he lunges forward, bashing his fists harmlessly against the glass.");
	output("\n\n<i>“Damn it! I want your word -- not that dog Calnor’s -- that this isn’t a trap. That I can walk away in this four-legged sexpot.”</i>");
	output("\n\nYou give Calnor a look, and he sighs and lowers his staff. <i>“On your head be the consequences for all of this... but contrary to Valden’s assertions, I’m not in love with the idea of murdering him.”</i>");
	output("\n\nWell that’s nice. You call [wulfe.name] forward and ");
	if (pc.isNice() || pc.isBimbo()) output("try to explain to her that she’s going to be going to sleep now");
	else output("tell her to power down");
	output(". She doesn’t so much as question the command when you give it, just smiles and sits down, tail wagging as she powers down. A little mucking around on the back of her head causes the V.I. core she uses to eject itself into your hand. You tuck it away and head over to the holo-tank Valden’s floating in.");
	output("\n\n<i>“You ready?”</i> you ask, placing your hands on the control console");
	if (pc.isBimbo()) output(" and, with a little help from Calnor, finding the right buttons");
	output(".");
	output("\n\n<i>“One second... yeah, alright. Let’s do this,”</i> Valden says, running his hands through his hair. <i>“I’m ready.”</i>");
	output("\n\nYou hit the button, and in a flash of crackling light, the hologram of valden pops out of existence. As quick as you can, you move over to the mainframe on the wall and eject the datacore Valden has been stored on all these years. It’s almost indistinguishable from [wulfe.name]’s, aside from the Akkadi logos all over it; it feels hotter to the touch, too, like the internal computers can barely contain the personality seething inside. You make quick work of plugging it into the vacant slot in [wulfe.name]’s head. A set of wires slither out of the siegwulfe’s cranium chamber, attaching themselves to the proffered datacore and locking it into place. Her head closes back up as soon as your hand is clear and she starts powering back up.");
	output("\n\nOr he, you should say. The Siegwulfe’s eyes flash open, blood red and intense as ever, but her familiar smile is replaced by a firm scowl. The voice is the same, smooth and feminine, but lacks any of the seductive lilt of its former intelligence.");
	output("\n\n<i>“Wow, you didn’t crush the core. I’m... pleasantly surprised,”</i> the Valden-inhabited Siegwulfe states flatly. <i>“Ech, I sound like a woman. And these legs...”</i>");
	output("\n\nShe -- he! -- canters backwards, looking over his shoulder at the drone’s tauric lower body. Valden’s claws scratch at the floor, getting used to his new body. The adjustment period only lasts a few seconds before he turns his attention to the doctor. <i>“This has been a long time coming old man,”</i> Valden says, a moment before socking Calnor straight in the chin. The doctor grunts and topples backward, crashing into a computer bank.");
	output("\n\n<i>“Come on,”</i> Valden says, turning to you. <i>“That second I needed? Deleted all the security records... their experiment data... everything this facility had! Let’s get the fuck out before my overrides wear out.”</i>");
	output("\n\nSounds good to you.");
	processTime(15);
	syriQuestEjectSiegwulfeDatacore();
	clearMenu();
	addButton(0, "Next", syriQuestAkkadiBaseEscape);
}

public function syriQuestAkkadiBaseValdenOkay():void
{
	clearOutput();
	showName("DR. CALNOR &\nVALDEN");
	showBust(calnorBustDisplay(),valdenBustDisplay());
	author("Savin");
	output("Fuck it, you came here for Valden, and if this is what it takes... you swing around and level your weapon at Dr. Calnor.");
	output("\n\nThe old ausar sighs, hanging his head. <i>“You bleeding heart,”</i> Calnor growls. <i>“Idiot child!”</i>");
	output("\n\nHe moves quick, knocking your weapon aside with his staff and leaping back, putting some distance between you before you can recover. <i>“I’m not letting you do this. Not without a fight.”</i>");
	output("\n\nSo be it.");
	processTime(1);
	clearMenu();
	addButton(0, "Fight!", syriQuestCalnorFight);
}

public function syriQuestAkkadiBaseValdenNoWay():void
{
	clearOutput();
	showName("DR. CALNOR &\nVALDEN");
	showBust(calnorBustDisplay(),valdenBustDisplay());
	author("Savin");
	output("<i>“Not happening, Valden,”</i> you tell him. <i>“Nobody has to die... or get possessed.”</i>");
	output("\n\nValden just scowls, floating back from the glass. <i>“Of course... you’re just like him. All of you bastards are just the same, talking like you’ve got my best interests at heart, but you don’t give a damn. None of you do!”</i>");
	output("\n\nCalnor sighs. <i>“See, I told you. The man’s insane, a danger to himself and everyone around him. Come on, let’s end this.”</i>");
	output("\n\nDoesn’t look like Valden wants to make peace with his captors. You sigh and ready your weapon for whatever he has in store for you...");
	processTime(1);
	clearMenu();
	addButton(0, "Fight!", syriQuestAkkadiBaseValdenFight);
}

public function syriQuestAkkadiBaseEscape():void
{
	clearOutput();
	showValden();
	author("Savin");
	moveTo("AKD K19");
	output("<i>“Come on!”</i> Valden shouts, dashing hard down the corridor towards the elevator banks. <i>“I put up as many roadblocks as I could, but I don’t think Akkadi is going to let us go this easy. They’re like gigafaunts - they never let a sleight go!”</i>");
	output("\n\n<i>“Sure, but " + (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] == 1 ? "isn’t Calnor out of the picture now" : "didn’t Calnor let us go") + "?”</i> you snap back, following in the renegade’s wake.");
	output("\n\nValden just gives you a look over his shoulder and mashes the call button, again and again until the elevator doors slide open. <i>“You came in with that construction crew on the suspension bridge, right? Well, I’m takin’ you out of here in style. There’s a security dropship parked up on the roof. Either we take it, or Akkadi uses it to take us down, yeah?”</i>");
	output("\n\nParanoid much?");
	output("\n\nStill, better safe than sorry at this point. You check your [pc.weapon] and press the big ‘R’ for roof. Beside you, Valden ");
	if (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] == 1) output("charges up the long shock-staff his host was using, twirling it in his fingers with the dexterity of someone who’d been using the weapon for years");
	else output("extends Siegwulfe’s claws, nodding to himself as the flickering energy blades form from his wrists");
	output(". He seems satisfied with his armaments, at least. Hopefully he won’t need them.");
	output("\n\nThe elevator shudders into position and the doors slide open onto the helipad. The wind roars past, sending shocks of sudden chill through your [pc.skinFurScales]. Fuck, it’s gotten colder! Your wrap your arms around yourself and follow Valden out of the elevator and...");
	output("\n\n<i>“Where’s the dropship?”</i> you shout over the howl of the wind. You’re the only two things up here, aside from a vent box so slim a galotian couldn’t squeeze through it.");
	output("\n\n<i>“It was here when we left the labs!”</i> Valden yells back, shielding his eyes from the blizzard and looking around. <i>“It was-”</i>");
	output("\n\nA woman’s voice, bass-heavy and full of rage, booms across the landing pad: <i>“It’s right here, scum!”</i>");
	output("\n\nA sleek blue military dropship ascends from over the far side of the helipad, searchlights blaring down on you. You shield your eyes and step back -- just in time, too! A pair of vulcan lasers spin up under the cockpit, sending a hail of red-hot bolts searing across the helipad. You duck into the cover of the elevator, but the attack catches Valden out in the open. He yells out, diving forward onto his ");
	if (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] >= 2) output("tauric ");
	output("belly while the lasers kick up snow and concrete all around him.");
	if (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] == 1) output("<i>“Fuck, I was hoping this body’d at least buy us a little time! Take the damn thing down already!”</i>");
	else output("\n\n<i>“I knew Calnor wouldn’t let us go!”</i> Valden yells over the roar of vulcan-fire and the ever-present blizzard. <i>“I knew it! Take this thing out, quick!”</i>");
	output("\n\n<i>“How am I supposed to do that!?”</i>");
	output("\n\nValden waves his hands and tail. <i>“I don’t know! Just... uh, take its shields out! I’ve got an idea!”</i>");
	output("\n\nBefore you can question him, Valden makes a break for the edge of the roof, dodging and weaving between a shower of laser fire before jumping off the edge.");
	output("\n\nLooks like you’re on your own again!");
	processTime(10);
	clearMenu();
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new AkkadiDropship());
	CombatManager.displayLocation("DROPSHIP");
	CombatManager.victoryScene(function():void{CombatManager.genericVictory(syriQuestDropshipFightVictory)});
	CombatManager.lossScene(syriQuestDropshipFightDefeat);
	CombatManager.encounterTextGenerator(syriQuestDropshipFightText);
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function syriQuestDropshipFightText():String
{
	var eText:String = "";
	eText += "An Akkadi dropship strapped with laser cannons and god knows what else!";
	eText += "\n\nThe sleek blue hovercraft is swaying in the blizzard, melting through the continual snowfall with a pair of vulcan lasers that never seem to stop firing. The craft’s shields are still up, flickering constantly as the screaming wind of the Uvetan pole blasts it, threatening to bear the ship down at any moment.";
	
	return eText;
}

public function syriQuestDropshipFightDefeat():void
{
	clearOutput();
	showDropship();
	author("Savin");
	output("The dropship keeps firing, relentlessly assaulting you with its cannons. The blizzard only makes it worse, howling around you and slamming you with cold, hard ice breaking off from the rooftops. You can’t see, can’t hear, can barely breathe -- and then the lasers find you, ripping into you like a thousand lances of pain.");
	output("\n\nYou crumple backwards, staring up into the abyss as your vision goes black.");
	processTime(1);
	CombatManager.genericLoss();
	badEnd();
}

public function syriQuestDropshipFightVictory():void
{
	clearOutput();
	showSchora();
	author("Savin");
	clearMenu();
	output("With a thunderous <i>CRACK!</i> the dropships shields overload, discharging static energy all around it in the storm. Almost the second the shields go down, the dropship lists hard to the side, almost flipping over in the direction of the winds. The vulcan lasers keep firing, spraying red death into the air. The pilot tries to compensate, blasting the hover-engines on full tilt to stabilize the lilting craft -- and failing! ");
	output("\n\nSomething explodes, one of the engines maybe, sending gouts of oily black smoke into the air. The dropship lurches to the side and starts falling, descending weightily onto the helipad and crunching onto the tarmac with the shriek of grinding metal. You take a few steps back, making sure you’ve got plenty of room between yourself and the disabled hovership, but luckily it doesn’t explode.");
	output("\n\nInstead, the cockpit window blows off and ");
	if (flags["MET_SCHORA"] >= 3) output("none other than Commander Schora");
	else output("a bronze-skinned dzaan in blue combat armor");
	output(" clambers out, swearing as she yanks a machine gun out from the pilot’s seat. She locks her eyes on you, a feral scowl on her dark lips.");
	if (flags["MET_SCHORA"] >= 4) {
		output("\n\nSuddenly, she pauses, as if she’s recognizing you for the first time.");
		output("\n\n<i>“You! You’re... no way!”</i> she growls, shouldering her gun and fixing you in its sights. <i>“<b>You</b>’re the cunt that caused the lockdown? ");
		if (flags["MET_SCHORA"] == 4) {
			output(" I knew you were too good to be true. I knew it! Nobody makes a fool out of me, you sick fuck!”</i>");
			output("\n\nUh-oh. Looks like taking a gentle hand with the commander here is paying off...\n\n");
		}
		else {
			output("”</i>\n\nDespite her words, there’s an unmistakable a twitch in Schora’s loins. Looks like she’s happy to see you... or at least, she’s got some pleasant memories from you treating her like a living fucktoy. That’s how she liked it, wasn’t it?");
			output("\n\nMaybe you could apply some of that Steele charm here...\n\n");
		}
	}
	else {
		output("\n\n<i>“Whoever you are, you fucked with the wrong corporation,”</i> she growls, shouldering her gun. <i>“I am going to make mincemeat of your ass, motherfucker!”</i>");
		output("\n\nDoesn’t look like she’s willing to talk!\n\n");
	}
	
	processTime(10);
	clearMenu();
	addButton(0, "Fight!", syriQuestSchoraFight);
	if (flags["MET_SCHORA"] == 5) addButton(1, "Flirt!", syriQuestSchoraFlirt, undefined, "Flirt!", "Make love, not war.");
	else addDisabledButton(1, "Flirt!", "Flirt!", "Doesn’t look like she is interested in that right now.")
}

public function syriQuestSchoraFlirt():void
{
	clearOutput();
	showSchora();
	author("Savin");
	clearMenu();
	processTime(10);
	output("You put your hands up in a disarming fashion, enough to make Schora lower her rifle a few degrees at least.");
	output("\n\n<i>“Come on, Schora,”</i> you say, taking a few steps closer. <i>“Have you really sold your soul to some faceless corporation? A beautiful woman like you ought to be better than this. I’m trying to rescue someone who-”</i>");
	output("\n\nSchora rolls her eyes. <i>“I know what you’re doing. Look, I thought keeping Valden locked up was shitty too, but he’s legal property of Akkadi. My job is to protect the company and its property!”</i>");
	output("\n\n<i>“Even when you know it’s the wrong thing to do?”</i>");
	output("\n\nShe falters, finally lowering her weapon the rest of the way. <i>“What... what am I supposed to do, huh? They own me. They own this world!”</i>");
	if (silly) output("\n\n<i>“There are other worlds than these,”</i> you answer solemnly.");
	else output("\n\n<i>“Come on... listen to your heart, Schora,”</i> you plead.");
	if (flags["MET_SCHORA"] == 5 && flags["SYRIQUEST_VALDEN_BODY_CHOICE"] >= 2) {
		output("\n\nThere’s a moment’s pause, and then Schora curses and lets her gun drop on its sling. <i>“Damn it, I don’t know if... nah, fuck it, getting laid by you was pretty worth it. Alright, go on. Get out of here before I change my mind.”</i>");
		output("\n\nYou start to move immediately, following in Valden’s mechanical wake... before you grab Schora’s wrist and plant a kiss on the dusky dzaan’s lips. She all but melts in your arms, moaning softly as your lips meet and tongues entwine. But before you can get too excited, Schora pushes you off and retreats towards the wreck of her craft. <i>“Go! Take Valden and get out of here. I’ll... I’ll make up some excuse. But I better see you again someday. I need you all over me like that again.”</i>");
		output("\n\nGiven any opportunity... yeah, the feeling’s mutual.");
		output("\n\nYou flash Schora a wink and throw yourself off the roof, the same as Valden.");
		addButton(0, "Next", syriQuestEscape);
	}
	else if (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] == 1) {
		output("\n\n<i>“I would... but I couldn’t live with myself if I let you two walk off with Dr. Calnor. Not to mention my life would basically be over. But I’ll give you one more chance. Drop your weapons and come with me.”</i>");
		output("\n\nUnfortunately... that’s not gonna happen.");
		addButton(0, "Fight!", syriQuestSchoraFight);
	}
	else {
		output("\n\n<i>“Sorry, honey, but a good lay ain’t worth throwing away my career... and probably my life. But for old times’ sakes, I’m willing to give you one more chance. Drop your weapons and come with me.”</i>");
		output("\n\nUnfortunately... that’s not gonna happen.");
		clearMenu();
		addButton(0, "Fight!", syriQuestSchoraFight);
	}
}

public function syriQuestSchoraFight():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new CommanderSchora());
	CombatManager.victoryScene(syriQuestSchoraFightVictory);
	CombatManager.lossScene(syriQuestSchoraFightBadEnd);
	CombatManager.encounterTextGenerator(syriQuestSchoraFightText);
	CombatManager.beginCombat();
}

public function syriQuestSchoraFightText():String
{
	var eText:String = "";
	eText += "She is the woman in charge of security here at the Akkadi facility, and previously the pilot of the shielded dropship.";
	eText += "\n\nShe’s a tall, curvy dzaan that flaunts her hermaphroditism under her skin-tight jumpsuit pants, hugging her plump balls and thick dick. The ballistic vest that marks her as part of the station’s security detachment must have been heavily altered to accommodate her prodigious bust, barely held back by all the bullet-proof material she’s wearing. She’s currently wielding a bulky machine gun, pressed tight to her shoulder and ready to sling lead with a tap of the trigger.";
	
	return eText;
}

public function syriQuestSchoraFightBadEnd():void
{
	clearOutput();
	showSchora();
	author("Savin");
	processTime(3);
	output("You crumple to the ground, gasping for breath and writhing in pain. Schora stalks up to you, couching her rifle under her arm, and takes a knee over you.");
	//"Schora was hit by at least 1 lust attack or fucked rough earlier"
	//@Coder no idea what the right condition would be for getting teased in combat
	//Let’s just check if her current lust is higher than her starting lust and call it a day -lighter
	// if (flags["MET_SCHORA"] >= 3 || ??? ) {
	if (flags["MET_SCHORA"] >= 4 || enemy.lust() > 25) {
		output("\n\n<i>“Alright, cassy-nova, you wanna flaunt your stuff, huh? Think you can get outta your punishment just cuz you " + (flags["MET_SCHORA"] >= 4 ? "can make me cream myself better than any man on this gods-forsaken moon" : "can wiggle some meat real good" ) + "? Well... you’re </i>almost<i> right.”</i>");
		output("\n\nShe grins and rolls you onto your face, cuffing your hands together. <i>“I’m gonna go get Valden, but first... I’m gonna put you somewhere I can get you later. Your friend’s the one that matters to Calnor... so we can treat your body as repayment for breaking my gunship. Better than becoming the doc’s next experiment. Trust me.”</i>");
		output("\n\nYou don’t trust her.");
		output("\n\nAnd for good reason. A boot comes down hard on the back of your head, and blackness takes you.");
		clearMenu();
		addButton(0,"Wake Up",syriQuestSchoraWakeUp,undefined,"Wake Up","Let’s be honest, what’s about to happen to you isn’t sexy.");
	}
	else {
		output("\n\n<i>“Man,”</i> she says, racking the bolt of her gun. <i>“I don’t know who you are, or what you thought you were doing, but you fucked up real good. Caused a lot of damage. Lucky you, Akkadi doesn’t let anything go to waste.”</i>");
		output("\n\nShe rolls you onto your face and pulls a pair of grav-cuffs off her belt, locking you up before dragging you to your [pc.feet] and pushing you towards the elevator. <i>“Don’t worry,”</i> she says, following you. <i>“We’ll get Valden in his cage, back safe and sound. You just worry about what Calnor’s going to have in store for you.”</i>");
		output("\n\nThe door slides closed, sealing your fate.");
		badEnd();
	}
}

public function syriQuestSchoraWakeUp():void
{
	clearOutput();
	showSchora(true);
	author("Savin");
	output("When you come to, everything is... numb. Your mind is hazy, and your vision is blurred by a brilliant white light. Your groan and try to lift your head, but it feels like it’s made of lead; your whole body does!");
	output("\n\n<i>“Oh, just in time!”</i> a voice sings.");
	output("\n\nYou force yourself to look up, putting all the strength you can muster into moving your dulled body to face a tall, golden-brown figure standing in front of you. You’re in a white-panelled room with a single bright light glaring down at you from the ceiling, making you squint as your eyes adjust.");
	output("\n\nThe figure reaches out a hand, making you flinch -- or try to, anyway. You might be able to raise your head, but that’s about all you <i>can</i> do. The rest of your body won’t respond to your commands, like you’re... like you’re bound.");
	output("\n\n<i>“Struggling right out of the gate?”</i> the woman says, brushing a hand along your cheek. Finally, you blink away the last of your waking haze and see your captor. <i>“You remember me; Schora? Don’t worry, [pc.name]. You’re safe and sound here in my office... and Valden’s back in his tank where he belongs. No harm done.”</i>");
	output("\n\nOf course it’s Schora -- your battle wasn’t a dream, and her promise wasn’t a bluff. You can feel the brush of cool air against your naked [pc.skinFurScales], the grinding of leather straps around your wrists and " + (pc.hasLegs() ? "ankles" : "lower body") + ", keeping you upright and in place for your captor.");
	output("\n\nAnd there’s something on your chest, pulling on your nipples.");
	output("\n\nYou look down at your chest and gawk at a pair of brand new metal studs run through them, attached to what look like inch-long lead cylinders.");
	output("\n\nSchora smirks and slips her hand down from your cheek to one of the nipple-weights. <i>“You catch on quick, don’t you? Don’t worry, just a little something to make sure my brand new cum dumpster stays nice and compliant.”</i>");
	output("\n\nGlowering, you look the buxom bronze amazon in the eye and ask what she’s planning on doing with you.");
	output("\n\nShe shrugs, taking a step back and hooking her thumbs through her belt. <i>“Well, see, here’s the thing. You invaded a corporate black site. On a world <b>owned</b> by corporations. You’re... kinda fucked, to be honest.”</i>");
	output("\n\nSchora laughs and tugs down on her belt, letting her pants crumple to the floor around her ankles. A thick brown cock flops free just a few inches from you, resting over a huge black sack of balls much too large for even their amazonian owner. What is she, part horse? She leaves her cock hanging for you to stare at while she slowly reaches up, unbuckling her tactical vest and shrugging out of it and her tight undershirt. Her bra tumbles off last, letting loose a large pair of tits, each capped with a nipple as black as her sack and lips.");
	output("\n\n<i>“So,”</i> Schora continues, kicking her boots off, <i>“since you were so insistent about getting in my pants, I decided that instead of a danger pay bonus for recapturing Valden, I’d just get to keep you. Trust me, you’re better off here than with Calnor. He’s brilliant, but a little... dangerous. Me, though? I just like fuckin’. You like to fuck, Steele?”</i>");
	if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“Well, yeah, but usually on my terms,”</i>");
	else output("\n\n<i>“What’s that supposed to mean?”</i>");
	output(" you growl, staring at the stiffening brown dick that’s inching close to you.");
	output("\n\nSchora picks something up off a nearby table and clamps it onto one of her fat charcoal nipples. Looks just like the cylinders on your nips, but painted in red stripes. Her other hand wraps around her cock, stroking herself as she speaks. <i>“Shoulda just tried to pick me up at a bar or something. I’d have let you " + (pc.hasCock() ? "rail my brains out" : "ride my balls dry") + ". Shame! See, these big ol’ balls of mine get so fuckin’ blue out here, with nothin’ but my hand and toys to empty ‘em for weeks at a time. So my reward for a job well done... is a pretty new personal cum dump. And you get to avoid being Calnor’s next experiment. We all win.”</i>");
	output("\n\nShe grins dangerously and steps forward. <i>“Now why don’t we get started, hmm? Be sweet and I’ll let the first blowie of the day be nice and easy.”</i>");
	output("\n\nYou thrash in your bonds, trying " + (pc.isBimbo() ? "to get down there and get to work -- no sense in letting circumstance get between you and a needy dick" : "to back away from the dusky dickgirl") + ", but to no avail. Your [pc.legs] and arms are bound tight, and now that you try moving, whatever she’s done to you makes it feel like there’s twenty Gs pinning your chest right where it is.");
	output("\n\nSchora giggles and reaches back up, grabbing her new nipple accessory. <i>“Oops. Here, let me help you.”</i> She pinches the red cylinder and gives it a tug downwards. The moment she does so, the studs she’s run through your [pc.nipples] yank hard down, making you yelp in a mix of pleasure and pain as your body is roughly pulled down into a bent-over position, [pc.lips] almost brushing Schora’s cock.");
	output("\n\n<i>“There we go!”</i> Schora laughs, patting your head. <i>“A little grav/anti-grav thing we’re working on. Nobody’ll miss some outdated prototypes, I figure. They’ll hold you nice and still, pull you up or down... basically, your body’s going where I want, when I want. And I want you on my cock. Understand?”</i>");
	output("\n\nBound by leather and gravity both, you don’t exactly have a lot of room to say no. Even that moment of consideration is too much for the pent-up dzaan girl, though. She huffs and digs her fingers into your scalp, holding your head steady while her other hand guides her cock’s crown to part your [pc.lips]. " + (pc.isBimbo() ? "About time!" : "Damn it, there’s no choice, is there?") + " You open your mouth and press your tongue down, inviting Schora to slide her schlong inside; an offer she takes you up on with gust. Her cock isn’t particularly big, especially given her size; you suppose all the mass went to her nuts. Nevertheless, she more than fills your mouth, pressing a knot-like bulge of flesh between your lips and battering the back of your throat with her mushroom-shaped crown.");
	output("\n\n<i>“There!”</i> she says happily, easing up on her grip. <i>“Not so bad, is it?”</i>");
	output("\n\nYou can’t see Schora’s face with her huge rack in the way, but you can almost <i>hear</i> the smug grin in her voice as she pats your head. Slowly, she slides her dick back out, grinding the glans across your [pc.tongue]; you have no choice but to taste every inch of turgid cockflesh until the crown is kissing your lips again.");
	output("\n\nSchora shifts her grasp down, taking you " + (pc.hasHorns() ? "by the horns" : "by the back of your head")+ " and thrusting her hips forward. Her dick slams back into your mouth, and her big black balls swing forward, slapping your throat hard enough to make your whole body sway backwards in your restraints. She sets the pace of steady, slow, hard thrusts into you, over and over and over again until your neck is sore from her sack slapping it. You can feel her nuts getting tight, churning with potent desire, followed by a rhythmic throbbing of her dick against your tongue. All you can do -- all you’re <i>permitted</i> to do -- is prepare to receive her load.");
	output("\n\nAt least the big amazon doesn’t make you work too long... but she wasn’t kidding about being pent up! Schora’s barely been working you over for five minutes before her grip tightens and she thrusts knot-deep down your throat. You feel a rush of hot seed a moment later, pulsing along her cock’s length before spilling down your splayed-open gullet. It feels like a faucet’s been opened, pouring a constant stream of hot goo into your [pc.belly]. When a normal human’s cumshot would have ended after a few tepid squirts, Schora’s keeps cumming and coming until you feel like there’s a fishbowl of liquid weight settling in your gut.");
	output("\n\nOnly when you’re full to bursting does she finally wind down, groaning and cupping her sack in one hand. <i>“Whoo!”</i> Schora cheers, slowly stepping back and dragging her dick out of your mouth. A slimey bridge follows her out, leaking down your chin and splattering ");
	if (pc.hasBreasts()) output("over your tits");
	else if (pc.hasLegs()) output("on your feet");
	else output("on the floor");
	output(".<i>“Oh, that felt good! Releasing a little pressure before I get back to work is good for the soul. As for you, just hang out! I’ll be back on my lunch break to drain the rest of these nuts.”</i>");
	output("\n\nYou cough up a glob of cum, struggling to catch your breath after waking up to that kind of face-fucking. Schora just gives you a smile and a pat on the cheek and strides around you, out of sight and out of the room. You’re left hanging there, literally; the restraints and the gravitic nipple-studs leave you almost no room to move, to even change posture. You’re nothing more than an office ornament with your face in a corner and ass in the air, waiting to be used again.");
	pc.removeAll();
	processTime(30);
	clearMenu();
	addButton(0,"Next",syriQuestSchoraGameOver,undefined,"Next","Get used and used again.");
}

public function syriQuestSchoraGameOver():void
{
	clearOutput();
	showName("SCHORA &\nSYRI");
	showBust(schoraBustDisplay(true),syriBustDisplay(true));
	author("Savin");
	processTime(237);
	output("As promised, Schora returns some time later -- how long, you can’t tell -- to finish emptying her equine-like balls down your throat. When she’s finished with you, you’re left swinging under the weight of your cum-swollen belly. Rather than leaving you this time, Schora steps out of view and sits down, presumably at a desk, and the sounds of typing fill the air. You’re utterly ignored for the next few hours, even when you try to talk, or just groan from the vigorous use.");
	output("\n\nWhen Schora leaves for the night, a galotian is set loose in the darkened office to clean up the sexual effluvia smeared over your face and pooled on the floor around you. She just giggles when you try to talk to her, to ask for help or just to loosen your restraints. Instead of helping, the galotian just mounts you, plunging into your [pc.asshole] ");
	if (pc.hasGenitals()) {
		output("and ")
		if (pc.isHerm()) output("assaulting your sexes ")
		else if (pc.hasCock()) output("wrapping herself around your [pc.cock] ");
		else output("thrusting up into your pussy ");
	}
	output("until she’s cleaned you inside and out.");
	output("\n\nShe leaves when you’re fucked to exhaustion, drained and sparkling clean. You fall asleep in a dreamless stupor, only to be rudely awakened by a dick in the [pc.asshole] the next morning. At least Schora has the decency to lube up, but it doesn’t stop you from waking up screaming. As your bowels are filled with yet another load of Schora’s cum, the realization that this might just be your life now finally hits you... or is that just the dzaan’s knot, stretching your ass apart?");
	output("\n\nThe final blow to your withering hopes comes some days later. The only way to measure the passage of time you have is Schora’s schedule. Her breaks, her regular need to empty her balls in your mouth, and the googirl that comes to clean up every night. Her ministrations are worse than Schora, fucking you inside and out until you pass out from exhaustion. But those fuckings let you count out about a week of that unyielding sexual schedule until the day that Schora comes in with a whistle and a spring in her step and greets you with a rough slap on the ass.");
	output("\n\n<i>“Morning, cumdump!”</i> she announces happily. <i>“Guess what? You’ve got a friend!”</i>");
	output("\n\nWhat? You squirm, trying to look over your shoulder until Schora grabs your nipple studs and turns them around, shooting pleasure through your chest until you end up with your face in her belly. Schora giggles and takes a step to the side, showing you just what she means.");
	output("\n\nSyri is bent over, nipples pierced and dick flopping half-hard between her bare legs. She looks up at you with wide, frightened eyes. You say her name instinctively, lunging forward in your restraints, but it’s all fruitless. Syri can’t even respond; her mouth is plugged with a ring gag, letting her make nothing more than wordless grunts.");
	output("\n\n<i>“Sorry, she’s a bit of a biter. Safety first, you know,”</i> Schora says, starting to undress. <i>“You should be happy, cumdump. This feisty bitch tried breaking in here all by herself. Almost caused as much damage as you did before I tranq’d her. So, I figure you two belong together, huh? Give each other something to look at while I fuck you raw.”</i>");
	output("\n\nHer uniform clatters to the floor, but this time she saunters around behind Syri, squirting lube from a bottle into her hand. From her hand to her cock, then smeared between your lover’s asscheeks. Syri growls, thrashing her tail against Schora’s tits until the bronze beauty grabs it, yanking the offending appendage aside. There’s no recourse but to watch as your captor drops her cock into Syri’s asscrack, leans back, and plunges inside. Syri’s dick jumps in involuntary stimulation, and a wordless howl escapes her ring-gage as the futa domme sinks herself into the poor shemale.");
	output("\n\nSyri’s body rocks forward under the weight of Schora’s thrust, pushed so close on her grav-restraints that your lips almost touch. The second thrust pushes her so close that you’re able to crane your neck out and seal the deal, locking in with a long, tongue-filled kiss with Syri while she’s savagely sodomized by the sadistic dzaan. The pounding keeps going, hard and fast, until Syri’s whimpering and her cock is throbbing, leaking white goo down her thigh. Syri never breaks the kiss, fighting hard for every second of contact with you until the dzaan grunts and knots, shoving you and your lover roughly together.");
	output("\n\n<i>“Aww, you two are so cute,”</i> Schora coos, reaching between Syri’s legs and milking out the last of the knotted ausar’s orgasm. <i>“You make such good office ornaments... geez, now I just don’t know if I can ever let you go! Don’t worry, I haven’t forgotten my first cumdump...”</i>");
	output("\n\nShe pulls out of Syri with a grunt and sashays around the kissing pair of you, right until you feel her hot, wet cock pushing against your [pc.vagOrAss].");
	badEnd();
}

public function syriQuestSchoraFightVictory():void
{
	clearOutput();
	showSchora();
	author("Savin");
	output("Schora groans and drops to a knee, propping herself up on the butt of her gun. A growl escapes her lips, and she locks her red eyes on you from under a mess of pink hair.");
	output("\n\n<i>“Alright, alright,”</i> she groans. ");
	if (enemy.HP() <= 0) output("<i>“This job ain’t worth dying for. I give up.”</i>");
	else output("<i>“My cock’s about to tear through my pants. Agh!”</i>");
	output("\n\nYou stride forward and kick the gun out of her hand, sending it clattering off the edge of the roof. <i>“Hey, that’s expensive!”</i> she complains, scowling. Still, without her weapon, the dzaan is at your mercy now... and she’s sporting a growing bulge between her legs as you fix her with your gaze");
	if (enemy.HP() <= 0) output(", as if she gets off on the beating you just gave her");
	output(".\n\n");
	processTime(3);
	clearMenu();
	if (pc.hasCock() && pc.cockThatFits(chars["SCHORA"].vaginalCapacity(0)) >= 0) addButton(0,"Fuck Her",penisRouter,[syriQuestSchoraFuckHerI,chars["SCHORA"].vaginalCapacity(0),false,0],"Fuck Her","This dirty girl seems to like punishment; give it to her, hard.");
	else addButton(0,"Fuck Her",syriQuestSchoraFuckHerI,-1,"Fuck Her","This dirty girl seems to like punishment; give it to her, hard.");
	addButton(1, "Leave", syriQuestSchoraLeave, undefined, "Leave", "Get out while you can.");
}

public function syriQuestSchoraLeave():void
{
	clearOutput();
	showSchora();
	author("Savin");
	output("You give the defeated dzaan a parting wink and take a running leap off the roof, following in Valden’s footsteps. Time to blow this joint!\n\n");
	processTime(1);
	clearMenu();
	CombatManager.genericVictory(syriQuestEscape);
}

public function syriQuestSchoraFuckHerI(x:int):void
{
	clearOutput();
	showSchora();
	author("Savin");
	
	var vIdx:int = -1;
	if (pc.hasVagina()) {
		vIdx = pc.cuntThatFits(chars["SCHORA"].cockVolume(0));
		if(vIdx < 0) vIdx = rand(pc.vaginas.length);
	}
	
	output("Without a word, you close the distance between yourself and the defeated dzaan. You grab her by the horns, forcing her onto both knees with her face directly angled into your crotch. She struggles back, trying to pull away from you, but there’s no escape in her condition. Before you can even command her to get to work, there’s a distinctive <i>riiiiip</i>ping sound from between her legs, and with a gasp, her chocolate cock and hefty ballsack tear their way out of her uniform’s pants.");
	output("\n\nSchora just gives you a nervous chuckle before you");
	if (!pc.isCrotchExposed()) output(" drop your pants and");
	output(" shove her face into your");
	if(x >= 0) output(" [pc.cock " + x + "]");
	else if(pc.hasVagina()) output(" [pc.vagina]");
	else output(" pelvis");
	output(". Your would-be assailant squirms and sputters, but you keep her pressed in there with a nose full of crotch until she finally relents, and her sinuous tongue slips out to run along your");
	if(x >= 0) output(" [pc.cock " + x + "]");
	else if(pc.hasVagina()) output(" [pc.vagina]");
	else output(" thigh");
	output(".");
	output("\n\n<i>“Good girl,”</i> you coo, glad you’ve got all her body heat to warm you up from the howling winds all around you. Still, while she’s lavishing your");
	if(x >= 0) output(" [pc.cock " + x + "]");
	else if(pc.hasVagina()) output(" [pc.vagina]");
	else output(" crotch");
	output(" with her tongue, you start thinking about where to move this little mid-adventure indiscretion so you can get full-frontal with the shivering beauty buried between your [pc.legs].");
	output("\n\nYou keep your hands wrapped around her long horns, bobbing her head up and down " + (x >= 0 ? "on the shaft of your dick" : "through the lips of your twat") + " until your gaze settles back on the elevator hub you came out of. It was big enough for a little fun, and warm... yeah, that’ll do nicely. You pull Schora to her feet and push her plump booty towards the door, shoving her inside and face-first against the first solid, warm wall you can find. The second the door’s closed behind you, you ditch your gear and yank the dzaan’s pants down, letting her cock and balls swing free and her fat ass jiggle into your hands.");
	output("\n\nOne hand pins Schora to the wall, and the other gropes and squeezes her ass, making her moan and whimper -- and making her modest member leak white cream onto the wall. Once you’ve had your fill of buttery-soft buttocks, you let your grip slip in between her full cheeks and into the sexy little slit hidden between them. Your fingers slide on in, sped along by the ludicrous wetness that greets the digits that part her lips. Schora cries out, thrusting her hips back against your hand until you’ve got a pair of fingers buried to the third knuckle in her puss.");
	output("\n\nWith her body pressed against the wall, Schora can’t even reach her own dick to stroke it; the rock-hard prick and its big black sack are left to wobble heavily with every pump of your wrist. Her hands finally find some purchase on the sides of her tits, squeezing her own big melons between her fingers. The <i>“O”</i> of pleasure her mouth forms is just what you wanted to see, a silent scream of ecstasy that leaves her whole body quivering around your fingers.");
	processTime(15);
	clearMenu();
	addButton(0, "Next", syriQuestSchoraFuckHerII, [x, vIdx]);
}

public function syriQuestSchoraFuckHerII(arg:Array):void
{
	clearOutput();
	showSchora(true);
	author("Savin");
	
	var x:int = arg[0];
	var vIdx:int = arg[1];
	
	if (x >= 0) {
		output("<i>“Ready for it, slut?”</i> you growl in Schora’s ear, grinding your [pc.hips] against her quaking booty. Your " + pc.cockDescript(x) + " shoves itself between her ass cheeks, sliding between the lube-slicked ass-cleavage until the crown aligns with Schora’s quim. You withdraw your fingers and guide your dick in, delighting in the shrill scream of bliss that greets your entrance. Her cunt’s the warmest thing you’ve felt in this icy hell, a sweltering slit of slick pussyflesh that clings to your cock every inch of the way. Girlcum squirts out around your girth, smearing down Schora’s thighs as you start to move your hips.");
		
		pc.cockChange();
		
		output("\n\nAs you get moving, cracking your hips into the dusky dzaan’s plush behind over and over, Schora’s masculine half swings weightily under her. You can almost hear the cum sloshing around in her overburdened sack, churned up and ready to spray their load thanks to your rough fucking. That’s the stuff! The dirty slut’s pre-orgasmic clenching massages your " + pc.cockNounComplex(x) + " from " + pc.cockHead(x) + " to " + pc.knotDescript(x) + ", squeezing you so wonderfully tight that it takes every ounce of willpower not to nut on the spot.");
		output("\n\nInstead, you dig your hands into her ass and pound that pussy as hard as you can. Fast jack-hammer thrusts send her booty jiggling and her balls swinging like a pendulum between her cum-soaked legs. Once that kind of treatment starts, it’s only a few more moments before the lust-addled sub grips her tits tight and cries out in senseless pleasure. You can <i>hear</i> the first squirts of futa cum splattering on the wall, drooling down the metal side of the elevator to pool between Schora’s feet. Her balls just keep pumping and pumping their load, what looks like half a gallon of the stuff until it’s coating her feet, the wall, and the floor.");
		output("\n\nAnd just as you’d hoped, the shuddering cum-shots rocking the dzaan’s body are the perfect capstone to your conquest. Her pussy’s walls squeeze hard around your length, milking you top to bottom until your [pc.balls]’s load is shooting up your vein and spilling into Schora’s depths. Feeling your seed pouring into her just makes the cum-drunk dzaan hornier; she thrusts back hard against your " + pc.simpleCockNoun(x));
		if (pc.hasKnot()) output(", nearly taking the knot");
		output(" and what feels like a whole ‘nother orgasm rocks her pussy. With a cock and balls like hers, there’s no hiding it: you’re soon treated to another wave of Schora’s own cum leaking out of her dick in long, thick ribbons of glistening cream.");
		output("\n\nWhen she’s finally finished, Schora’s left gasping for breath, knees trembling from the back-to-back climaxes. You’re not sure she’s being held up by anything more than your softening dick still inside her. When you step back, dragging your prick back out of her spunk-soaked channel, the defeated dzaan groans and slumps down on her knees in a puddle of her spunk.");
		output("\n\nGood girl. You don’t think she’s gonna be much trouble now, and so you grab your gear and take a leap off the roof after Valden. Time to blow this popsicle stand!\n\n");
	}
	else {
		output("You thrust deep and hard into the dzaan’s leaking snatch, exploring every inch of her hidden depths. Her brown skin is sheened with sweat by now, quaking with pleasure as you finger-fuck her. You hadn’t really had time to appreciate her curves before now: Schora’s got a big, plump ass that just quivers and bounces with every thrust of your wrist; her tits are succulent chocolate mountains that absorb her fingers until they vanish in her flesh; and her balls... those big, black orbs feel like they weigh a pound apiece, swaying like a pendulum with the impacts of your palm against your butt. They carry her cock forward and back with them, making the comparatively-small dick they serve flop around and leak her excitement onto the walls.");
		output("\n\n<i>“What a waste,”</i> you murmur, reaching around and grabbing Schora’s cock. She whimpers as your fingers wrap around her member, stroking it slowly while the other hand keeps thrusting into her twat, pleasuring her from both sides. You’ve barely worked your way down to the knot-like bulge at her base when you feel her dick throbbing, swelling in your fingers before a thick white wad jets out of her crown. The load of cum splatters on the metal, then drips down her thighs in thick, drooling rivers that you’re all too happy to milk out with fast, rough thrusts and strokes.");
		output("\n\n<i>“That was fast,”</i> you tease, swirling your digits around inside her. ");
		if (flags["MET_SCHORA"] >= 4) output("<i>“The way you blew that load, you’d think I didn’t just help you empty these balls.”</i>");
		else output("<i>“Ohh, somebody’s pent up, hmm?”</i>");
		output("\n\nSchora whines as you pull your hand out of her and run your lube-slicked digits down her thigh and onto the bottom of her dark ballsack, rolling one of the heavy orbs between your fingers. She shivers violently, and a thick wad of cum drools out of the futa woman’s cock and rolls over your fingers. Slimey and warm, just what you need to warm up from the Uvetan chill. An injection of this stuff deep in your [pc.vagOrAss " + vIdx + "] would be perfect to keep nice and toasty while you escape into the cold.");
		output("\n\nWhile your subby dzaan is still recovering, you hook your hands under her tits and spin her around to face you. She gasps, cock flopping side to side like a flagpole in a storm until you move in, sandwiching the over-sensitive little thing between your bodies. The feeling of warm cum smearing across your [pc.belly] only makes you want her inside you all the more, and you quickly turn so that it’s your [pc.butt] pushing against Schora’s dick, sliding the slippery shaft between your cheeks.");
		output("\n\n<i>“Come on, don’t tell me you can’t get it back up,”</i> you chide, wiggling your rump against Schora’s crotch. <i>“Or is the view not good enough for you?”</i>");
		output(" You joke as you rotate your body to face her again.");
		output("\n\nYou feel a pair of hands grip your [pc.hips]. <i>“Oh, it’s plenty good,”</i> Schora grunts. You feel her cockhead press against your [pc.vagOrAss " + vIdx + "], and you’re more than happy to finish the job, pushing back on her rod. You shiver with pleasure as her dusky dong spreads your walls, gliding between the walls of your [pc.vagOrAss " + vIdx + "] until her knot-like base is teasing your entrance and her dick’s bulbous crown is leaking pre inside you. Ohh, that’s the stuff right there!");
		
		if (vIdx >= 0) pc.cuntChange(vIdx, chars["SCHORA"].cockVolume(0));
		else pc.buttChange(chars["SCHORA"].cockVolume(0));
		
		output("\n\nYou plant your hands on her beefy chest, squeezing Schora’s tits and leveraging yourself up along her thick dick. Feeling her sliding out of you, inch by throbbing inch, is enough to send shivers up your spine right until her crown is just spreading you open. Schora groans under you, rocking her hips up to meet your [pc.butt] and pull you down on her half-lodged knot. You gasp with pleasure, letting the dusky dzaan drive her dick back in.");
		output("\n\nThe two of you settle into a rhythm like that, rising up off her lap only to let Schora thrust into your waiting [pc.vagOrAss " + vIdx + "] and pull you back down. Despite having cum just a few minutes ago, your lover’s rock hard and hungry for more. Her seed’s a perfect slick lubricant to make your rapid rises and falls more bearable, but even then, Schora’s desperate pace is spreading a lustful heat through your loins. Your heartbeat quickens in your chest, and your ");
		if (vIdx >= 0) output("twat leaks its excitement liberally down Schora’s shaft.");
		else output("[pc.asshole] clenches over and over around her dick, instinctively fighting back against Schora’s repeated intrusions into your bowels... but <i>damn</i> the struggle at the end of every thrust feels <i>good</i>.");
		output("\n\nAnother minute of that treatment and you’re already on the edge; your arms and [pc.legs] feel like lead, refusing to obey anymore. You’re left moaning and rocking your hips in Schora’s lap" + (vIdx >= 0 ? ", leaking your excitement across her thighs":"") + ", so close to orgasm that every neuron in your body feels like its aflame with lust. Schora senses your predicament as surely as you’re feeling it, but rather than take advantage and try turning the tables, the lustful guard grabs your [pc.hips] and pushes you onto your back, letting your [pc.legs] curl around her shoulders while she gets into prime position to pound your [pc.vagOrAss " + vIdx + "]. A second later, you feel her knotty brown rod slamming inside you. Her breasts press against your [pc.chest], cushioning the impact of her body crashing against you over and over and over again. Each thrust nearly buries her turgid bitchbreaker in your [pc.vagOrAss " + vIdx + "], stretching your hole open around its girth.");
		output("\n\nShe just keeps teasing you, never quite knotting your hole. Every battering thrust sends shockwaves of pleasure from " + (vIdx >= 0 ? "lips to womb" : "ring to bowels") + ", taking you screaming over the edge. You cum, hard, throwing your head back with a cry of primal cocklust -- and your climax is rewarded by a ragged grunting in your [pc.ear], and then a sudden surge of wetness spilling into your [pc.vagOrAss " + vIdx + "]. The cock spearing your hole throbs, smearing thick wads of Schora’s seed across your inner walls. Suddenly feeling so full, so well-bred, only makes your climax all the sweeter.");
		output("\n\nWhen she’s finally finished emptying her balls in you, Schora’s left gasping for breath, knees trembling from the back-to-back climaxes. You’re not sure she’s being held up by anything more than her pillowy breasts resting against your [pc.chest]. You run a hand through her hair and roll her off, leaving the dzaan recovering on her back while you grab your gear, leaking cum down your thighs right until you’re getting out the door.");
		output("\n\nTime to blow this popsicle stand!\n\n");
	}
	processTime(30);
	if (x >= 0) {
		//chars["SCHORA"].loadInCunt(pc, 0);
	}
	else {
		if (vIdx >= 0) pc.loadInCunt(chars["SCHORA"], vIdx);
		else pc.loadInAss(chars["SCHORA"]);
	}
	pc.orgasm();
	chars["SCHORA"].orgasm();
	clearMenu();
	CombatManager.genericVictory(syriQuestEscape);
}

public function syriQuestEscape():void
{
	clearOutput();
	showName("SYRI &\nVALDEN");
	showBust(syriBustDisplay(),valdenBustDisplay());
	author("Savin");
	output("You follow after Valden, throwing yourself over the building’s edge and plummeting into the yard-high snowbanks piled up against the walls. It’s like falling onto a particularly lumpy, cold bed, but you’re able to bounce back up a moment later and shake yourself off.");
	output("\n\n<i>“[pc.name]!”</i> Valden shouts, running over to you. You blink as the " + (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] == 1 ? "old man" : "cyber wolf") + " comes charging over with what looks like a rocket launcher hefted up on his shoulder. <i>“I’ve got a... oh, you already took care of it.”</i>");
	output("\n\nValden chuckles and looks up at the pillar of oily smoke rising up from the helipad. <i>“Damn it, I really wanted to use this, too. Doesn’t matter now, come on. The lockdown’s ending soon, and the crash has our new ride spooked.”</i>");
	output("\n\nNew ride?");
	output("\n\nYou follow Valden’s gaze back across the suspension bridge, right to where the construction crewmen are scrambling aboard their ship. Valden’s right, they’re getting ready to bolt. You can just make out Syri at the back of the boarding line, worriedly looking through the blizzard. You wave, trying to get her attention as you and Valden run for the ship.");
	output("\n\nIt’s a short run, but the blizzard tears at you like no other, trying desperately to throw you over the guardrail and into the chasm below. You hold onto Valden’s tail more than once, working to keep each other steady as you make your way up the incline and onto the far helipad. By the time you’re there, Syri’s the only one left to board, and she rushes over to you a volley of rapid-fire questions. <i>“Steele! What the hell happened in there? Why’s shit exploding?")
	if (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] == 1) output(" Who this hell is this?");
	output(" <b>Where’s Valden?</b>");
	output("”</i>");
	output("\n\n<i>“Calm down,”</i> you tell her, putting an arm around Syri’s shoulder and leading her up the boarding ramp. <i>“We should go.”</i>");
	output("\n\nSyri blabbers protests right up until you’re on the ship and the door’s sealed behind you. You and Valden accompany Syri back to the cargo hold as the craft takes off, more concerned about finding somewhere secluded to talk than avoiding the attention of Syri’s coworkers. Amid the rumbling of the engines and the howl of the wind outside, you’re finally free to speak.");
	output("\n\n<i>“I’m Valden,”</i> your companion blurts out without prelude. <i>“Fucking hell, it’s good to see you Syri.”</i>");
	output("\n\nValden opens his arms for a hug, but all he gets in return is a perplexed look from your lover. <i>“W-what? [pc.name] is this some kinda sick joke? Where...”</i>");
	output("\n\n<i>“This is gonna take some explaining...”</i>");
	moveTo("AKD C27");
	processTime(15);
	clearMenu();
	addButton(0, "Next", syriQuestEscapeII);
}

public function syriQuestEscapeII():void
{
	clearOutput();
	showName("SYRI &\nVALDEN");
	showBust(syriBustDisplay(),valdenBustDisplay());
	author("Savin");
	output("<b>Some time later...</b>");
	output("\n\n<i>“Holy shit...”</i> Syri breathes, still staring at the new Valden with disbelief. <i>“I can’t... oh God, Valden, I’m so sorry. I didn’t know. Nobody did!”</i>");
	output("\n\nValden forces a chuckle, leaning back against the bulkhead. <i>“Believe me, Calnor made it real clear right away that nobody would come looking for me. What would they find? My body... it didn’t survive the warp gate. Calnor kept saying I was just a digital carbon copy.”</i>");
	output("\n\n<i>“Fuck him!”</i> Syri snaps back. <i>“I don’t care what some idiot Akkadi goon says, you’re alive! You’re as real as me and [pc.name] are.”</i>");
	output("\n\nThe ravenette fixes Valden with her eyes, new body and all, and then lunges forward, grabbing him up in a fierce hug. ");
	if (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] == 1) output("She buries her face into the old man’s thick beard, holding him tight -- much to Valden’s surprise.");
	else output("Syri’s hands wrap around the Siegwulfe chassis’s slender waist, nestling her face in the bot’s rich dark hair -- much to Valden’s surprise.");
	output(" Though he’s taken momentarily aback by the sudden show of affection, Valden soon puts his hands around Syri’s back and returns her hug with a vengeance, tail wagging hard behind him.");
	output("\n\n<i>“I’ve missed you so much,”</i> Syri sighs. <i>“I’m so glad we found you.”</i>");
	output("\n\n<i>“You and me both!”</i> Valden laughs. <i>“What’s left of me, anyway.”</i>");
	output("\n\nThe ship shudders under your [pc.feet]. You guess it’s about time for it to be setting back down in Irestead. You hear people moving around in the passenger compartment above, but you and your canid companions stay where you are until they’re well gone. As the workers file out, you hear Valden saying, <i>“So how did you manage after the transport? You seem pretty much alright.”</i>");
	output("\n\nSyri draws a sharp breath and fidgets where she’s sitting. <i>“Not well,”</i> she admits. <i>“I didn’t end up buried halfway in a wall, but my insides got all jumbled around... some of my outsides, too.”</i>");
	output("\n\nYou turn your attention to the ausars, keenly interested in what Syri has to say. After all, you’re well aware she’s got a little something of Valden’s between her legs.");
	output("\n\n<i>“Yeah, uh, maybe we should get somewhere more private. I gotta tender a resignation with Myrra real quick, too. You’d like her, Vally, she’s like that Raxxian you dated on that one deployment.”</i>");
	output("\n\nValden laughs as the last of the workers disembark, clearing the way for the three of you to sneak off much as you had before. It’s a short journey, and a quick couple of surprise resignations from Haskarn’s company, before the three of you are bustling your way into the space port on Syri’s insistence. ");
	if (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] == 1) output("Valden gets a few odd looks, stopping to touch and smell almost everything he passes by.");
	else output("A few of the folk near the elevator give your synthetic companion strange looks; Valden’s walking tall and smiling, stopping to smell and touch almost everything.");
	output(" Even a few people! He really has been living with just two senses, you tell yourself; this must be a hell of a breath of fresh air.");
	output("\n\nYou make you way up to your ship and board, heading straight to the common area with Syri at the lead. Valden finds somewhere to sit, running hands hands along the cushion of the seat with almost reverent intensity. Syri finds a chair across from him and tosses her big blue coat over the back, staying standing with hands stuffed in her pockets.");
	output("\n\n<i>“So, uh,”</i> Syri starts, looking at the ground. Her dark tail curls around one of her legs, drawing your eyes, at least, to the slight bulge in her jeans. <i>“Look, Vally, when I said I got some of my insides scrambled up by the transporter... um... some of them are yours. A couple organs, the doctors said...”</i>");
	output("\n\nValden just chuckles. <i>“Well, you’re welcome to ‘em. I’m sure not using ‘em anymore.”</i>");
	output("\n\nSyri squirms, tucked her ears down. <i>“Yeah, but that’s not... ah, hell.”</i>");
	output("\n\nThe ravenette ausar sighs, hooks her thumbs through her belt, and yanks her jeans down. You watch as her soft red rocket flops out of her pants, dangling in front of her weighty balls and lush thighs. Valden stares at her crotch in surprise, eyes wide.");
	output("\n\n<i>“That, uh, that sure is a penis ya got there, Syri,”</i> he finally manages to say.");
	output("\n\n<i>“YOUR penis, doofus!”</i> Syri groans, thrusting her hips. <i>“When I went through the transporter, my cunt vanished and <b>your</b> junk got grafted on in its place.”</i>");
	output("\n\nValden squints at Syri’s crotch. <i>“That... huh, yeah, that sure looks like my dick,”</i> he says after a few moments. <i>“Hey there buddy. Whatcha doin’ over there?”</i>");
	output("\n\nGrinning, Valden reaches over and pokes Syri’s cock, causing the naked red rocket to achieve a startled lift off. Syri yelps and pulls back, grabbing at her jeans. <i>“Dammit, you’re supposed to be freaked out, or demand it back, or... or...”</i>");
	output("\n\n<i>“Or what?”</i> Valden says. There’s a tinge of sadness to his voice, but he keeps on joking. The ball of mad, chaotic rage from back at the base is nowhere to be seen now. <i>“What am I going to do with it: give myself one last wank for old time’s sake? But why do you have it, anyway? Shouldn’t the docs have fixed you up after the accident?”</i>");
	output("\n\nAgain, Syri squirms nervously. <i>“I, uh... I was savin’ it for you. You know... for when you came back.”</i>");
	output("\n\nValden grins at her, trying not to laugh. <i>“God damn, girl. You really are something else. All these years and you never stopped looking... or waiting for me to come back.”</i>");
	output("\n\nThe " + (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] == 1 ? "old man" : "cybernetic wolf") + " gets to his feet and grabs Syri’s shoulders, pulling her into a fierce hug despite her dick flopping around between them. Your lover yelps in surprise, but her tail starts thumping the deck hard and fast.");
	moveTo("SHIP INTERIOR");
	processTime(30);
	clearMenu();
	addButton(0, "Wrap Up", syriQuestWrapUp, undefined, "Wrap Up", "You rescued Valden, or what’s left of him. Time to call this adventure done with.");
	if (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] == 1) addButton(1, "Threesome", syriQuestSyriValdenThreesome, undefined, "Threesome", "Syri and Valden are clearly close... maybe more than Syri let on. See if you can give this adventure a <i>real</i> happy ending!");
	else addDisabledButton(1, "Threesome", "Threesome", "Valden doesn’t seem comfortable enough in his new body for this.");
}

public function syriQuestWrapUp():void
{
	clearOutput();
	showName("SYRI &\nVALDEN");
	showBust(syriBustDisplay(),valdenBustDisplay());
	author("Savin");
	output("When it’s all said and done, and Syri has managed to get her pants back on, Valden is just smiling non-stop. <i>“I’m sorry you got your puss turned into a prick,”</i> he says, <i>“but I’m glad you’re doing alright for yourself. They never told me what happened to you... I didn’t know if you’d been killed or what.”</i>");
	output("\n\n<i>“Yeah, mostly fine,”</i> Syri says. <i>“I take meds to keep your organs from rejecting me, but it’s a lot cheaper and easier than tryin’ to grow ‘em back. Looks like I got the better end of the deal.”</i>");
	output("\n\n<i>“And you checked out of the service?”</i>");
	output("\n\nSyri nods. <i>“Yeah, right afterwards. Medical discharge... didn’t give me much choice. But I’ve made ends meet, working here in the Rush. Speaking of which, something tells me that Federation isn’t gonna give you back your commission.”</i>");
	output("\n\n<i>“Yeah, like I’d want it. Those bastards and Akkadi are joined at the tails, Syri. It’s all one big, uncaring industrial behemoth. Fuck ‘em all, I’m gonna get as far away from this shit as I can. Go out and re acquaint myself with the galaxy... maybe find a proper body somewhere while I’m at it.");
	if (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] >= 2) output(" One with a dick of my own, maybe.");
	output("”</i>");
	output("\n\n<i>“Wait, shouldn’t you... I dunno, go tell somebody what happened? Make a big stink or-”</i>");
	output("\n\nValden shakes his head emphatically. <i>“No way. If Akkadi figures out where I am, they’re probably gonna try and hunt me down. Recapture me. And I am <b>not</b> going back... not for anything. I’m gonna just find somewhere to lay low, maybe one of these rusher planets. God damn, I can’t believe I missed the start of the rush! I had such big plans for when it started. My service was almost up, you know. I coulda had my own ship.”</i>");
	output("\n\n<i>“You could come with us! I mean, uh, with me!”</i> Syri whines. <i>“I just quit my job... again... so it’s not like I’m tied down to anyplace. Or Steele here, [pc.heShe]’s got [pc.hisHer] own ship! You could, I don’t know...”</i>");
	output("\n\n<i>“Be a crewman for my rescuer here? No offense Syri but this " + pc.mf("guy","gal") + "’s a lunatic!”</i> Valden laughs, giving you a good-natured wink. <i>“Anybody ballsy enough to break into a fortified Akkadi black site is probably gonna be going into way more dangerous waters than I’m ready to tackle. I’m still getting used to walking again.”</i>");
	output("\n\nValden rolls his shoulders and, turning to you adds, <i>“No offense. Look, I need to go lie low for a bit, get my life back together. Or start a new one, I guess. Commander Valden is dead, after all. Can’t exactly pick up where I left off.”</i>");
	output("\n\nHe sighs and shakes his head. <i>“Damn, I promised myself I wouldn’t get all morose when I got out, and I meant it! No, I’m gonna make the most of this,”</i> Valden says, putting his hands on Syri’s shoulders. <i>“I’ll be in touch, when I get back on my feet.");
	if (flags["SYRIQUEST_VALDEN_BODY_CHOICE"] >= 2) output(" All four of ‘em.");
	output("”</i>");
	output("\n\nHe gives Syri a hug and turns back towards the airlock. Your ravenette lover just stares as the undead ausar saunters off your ship, off to make a new life for himself. As the airlock cycles, Syri’s shoulders slump and her tail falls flat against her thigh.");
	output("\n\n<i>“Well, that... I don’t know what I was expecting, when I found Valden and all this madness went down, but that wasn’t it. He was dead... but not... this whole time. I can’t believe Akkadi would do something so awful. When I was growing up, they were supposed to be the best of us, where all the best and brightest ausar went to make the universe a better place. That’s what my <b>sister</b> was supposed to be doing!”</i>");
	output("\n\nSyri stamps her foot on the deck, balling her fists. <i>“My idiot sister is responsible for all of this!”</i>");
	if (annoIsCrew()) {
		output("\n\n<i>“You know I live here, right?”</i>");
		output("\n\nA familiar voice chimes in from the crew quarters. You and Syri both start up as Anno pads down the corridor, hands on her hips. <i>“I <b>was</b> trying to stay quiet in my office while the three of you had your little reunion, but if you’re just gonna shit talk me at the top of your lungs, I guess I have to come out and defend myself.”</i>");
		output("\n\nAnno marches right up to Syri and jabs a finger into her sister’s chest. <i>“For one thing, the only reason any of this happened is because a bunch of Naval Intelligence spooks made us use untested, unsafe technology despite my team <b>screaming</b> that it was going to <b>kill</b> whoever they sent through. So they sent my <b>sister</b> as the guinea pig because somehow threatening my family will just make physics stop working because I feel bad!”</i>");
		output("\n\n<i>“Secondly!”</i> Another jab. <i>“You’re the big stupid bitch who threw away her future to join the marines just to really stick it to mom and dad. If you ever actually <b>applied</b> yourself, you could have been working with me to make sure that tech actually worked instead of pissing yourself away playing soldier. You’re a Dorna, and a genius to boot! You could have been in Akkadi, or </i>commanding<i> a starship, or running the folks’ business where it was safe!”</i>");
		output("\n\nSyri starts to protest, her own fury rising, until Anno presses herself right up to her more muscular sister, hammering her accusative finger into Syri’s chest. <i>“And third, <b>I’m the one that tipped you off</b> about all of this, you <b>dumb bitch</b>. Did you just willfully ignore your ANNOnymous tipster? That wasn’t a typo! I’m the one that’s been leaning on every sack of shit I ever worked with to find out what really happened because for some reason I still love the shit out of my baby sister even if she wants to scream insults at me to my ");
		if (annoSexed() >= 1) output("[pc.boyGirl]");
		output("friend while forgetting I live like ten meters away.”</i>");
		output("\n\nAnno huffs and crosses her arms, still standing all of six inches away from Syri. The raven pup’s ears press down into her hair and her eyes fall downcast, accompanied by a little whimper from her lips. <i>“I... I didn’t think...”</i>");
		output("\n\n<i>“I know. That’s your problem, Syri. Everything’s always face value. Black and white. Don’t think, act. I’m...”</i> Anno sighs, grabbing Syri’s waist and pulling her sister into a hug. <i>“I’m just glad you’re okay, ya big dumb bitch.”</i>");
		output("\n\n<i>“Hey... I’m smarter than you, still,”</i> Syri whines, burying her face in Anno’s shoulder. <i>“Ya big meanie.”</i>");
		output("\n\nAnno rolls her eyes, tail wagging. <i>“Whatever.”</i>");
		output("\n\nThe snowy ausar crooks a finger towards you, inviting you over to wrap the sisters up in your arms as they hug it out. It isn’t long before two tails are beating against your [pc.legs], and you can see smiles on both their faces as they press against your [pc.chest].");
		output("\n\n<i>“I love you two,”</i> Syri murmurs softly. <i>“Thank you...”</i>");
		clearMenu();
		addButton(0, "Next", syriQuestWrapUpII);
	}
	else {
		output("\n\nSyri sighs after a moment, forcing the anger out into the kick. <i>“But at least... at least I have you. You... are the most amazing thing that’s ever happened to me. I can’t believe somebody like you just walked in that bar door one day, and here we are breaking dead men out of black sites and having sexcapades across the galaxy. Either you’re an angel in disguise, or my dick’s really magic to keep you coming back after all this.”</i>");
		output("\n\n<i>“Maybe a little bit of both,”</i> you tease, earning a wolfish grin from the ausar.");
		output("\n\n<i>“That right?”</i> Syri growls, sauntering forward. Before you know what’s happening, the raven beauty has shoved you up against the bulkhead, thrusting her lips against yours and grabbing your " + (pc.hasCock() ? "crotch" : "[pc.chest]") + ". When she breaks the kiss, Syri’s cheeks are flushed darkly, and her sapphire eyes sparkle in the light. <i>“Damn but don’t I love you.”</i>");
		output("\n\nWhat?");
		output("\n\nBefore you can question the statement, Syri grabs you tight and pushes you towards the bedroom, tearing at your " + (!pc.isNude() ? "clothes" : "gear") + " as you go. A moment later and you’re buck naked, falling backwards onto the bed with Syri straddling you in nothing but her coat. She shrugs the heavy garment off with a wiggle of her shoulders, rubbing her throbbing erection against your [pc.belly].");
		syriSexMenu(false);
	}
	processTime(30);
	flags["SYRIQUEST_STATE"] = 23;
	generateMap();
}

public function syriQuestWrapUpII():void
{
	clearOutput();
	showSyri(true);
	author("Savin");
	output("Eventually, Anno slips out of your grasp and sashays back to her office. Syri keeps holding onto you even after she’s gone. Her strong arms are wrapped around your [pc.hips], chin nestled in your neck. ");
	output("\n\n<i>“I meant it,”</i> she says after Anno’s gone. <i>“I love you, [pc.name]. You’re the best damn thing that’s ever happened to me.”</i>");
	output("\n\nShe leans up and gives you a kiss: a surprisingly soft, tender gesture from the normally coarse girl. One of her legs even curls up off the deck behind her, heel disappearing into her fluffy tail. When she breaks the kiss, Syri’s cheeks are flushed darkly, and her sapphire eyes sparkle in the light. <i>“Let me show you...”</i>");
	output("\n\nThe raven-haired beauty grabs you tight and pushes you towards the bedroom, tearing at your " + (pc.isNude() ? "clothes" : "gear") + " as you go. A moment later and you’re buck naked, falling backwards onto the bed with Syri straddling you in nothing but her coat. She shrugs the heavy garment off with a wiggle of her shoulders, rubbing her throbbing erection against your [pc.belly].");
	processTime(5);
	syriSexMenu(false);
}

public function syriQuestSyriValdenThreesome():void
{
	clearOutput();
	showName("SYRI &\nVALDEN");
	showBust(syriBustDisplay(true),valdenBustDisplay(true));
	output("<i>“You know Valden, maybe Syri and I should help you get used to this new body,”</i> you say, sauntering up beside Syri and grabbing yourself a handful of ausar booty. Syri gasps, and the pants she was just trying to yank up immediately pitch a brand new tent that jabs into Valden’s thigh. The grey-maned wolf blinks, looking down at Syri’s crotch until your lover’s red in the face, squirming under your kneading grip.");
	output("\n\n<i>“Oho, is that so?”</i> he finally says, letting his hand linger on Syri’s shoulder. <i>“Well, if my lovely co-rescuer here wants to keep on helping...”</i>");
	output("\n\n<i>“Yes!”</i> Syri blurts out, alongside a throb of her cock so strong that the button on her jeans pops open. <i>“I-I mean, it’s your dick, so it’d be wrong to just hoard it all for myself.”</i>");
	output("\n\nValden grins. <i>“Hey, it’s yours now. Besides, I’ve got one of my own that needs to be tested out. Now I remember back when we were buds you were only about the ladies, Syri, but...”</i>");
	output("\n\nSyri chuckles, brushing her hand down Valden’s stomach and hooking a claw through his host’s zipper. <i>“Things kinda changed after the accident,”</i> she admits. <i>“I still love puss and all, but after I found out what having a prostate’s like...”</i>");
	output("\n\n<i>“Oh, I see. You just needed a good fucking to come over to our team,”</i> he laughs, letting Syri slip his pants down. A sizable pink rod bobs free, already half-hard before Syri’s fluffy fingers wrap around it. ");
	output("\n\nValden gasps, going rigid from toe to ear. He has to grab the bulkhead behind Syri to keep from falling over. <i>“Oh! Oh fuuuuck I’d almost forgotten what that feels like!”</i>");
	output("\n\n<i>“See?”</i> You say, nuzzling up beside Syri. <i>“You need a test drive, just to make sure everything works.”</i>");
	output("\n\n<i>“I’ll say!”</i> Syri nods, working her wrist slowly up Valden’s length. <i>“I want you to know... I wouldn’t do this for just anybody.”</i>");
	output("\n\nSyri leans in, kisses Valden, and then slips down onto her knees in front of him. You watch the grey-furred ausar’s tail start wagging hard behind him as Syri plants the tapered crown of his cock on her lips, drinking deep of his scent before letting her tongue play out across his shaft. Valden moans a curse and laces his fingers through her dark hair, guiding her slowly down Calnor’s impressively thick cock all the way down to the knot.");
	output("\n\nNow that’s a sight you never expected to see: Syri on her knees happily sucking off a man, letting him guide her movements with gentle nudges to her raven hair. Your normally proud and fiery lover seems oddly content to bob her head up and down Valden’s dick until it shines with a thick coat of oral lubricants. ");
	output("\n\n<i>“Holy fuck I’m hard,”</i> Syri breathes, pulling herself off of Valden’s new dick. <i>“I think your old cock likes this idea...”</i>");
	output("\n\nHe laughs and shrugs out of his remaining clothes. <i>“Not surprising. I always wished I had kaithrit flexibility...”</i>");
	output("\n\n<i>“Gross!”</i> Syri giggles, yanking her top off. <i>“And stop gawking, Steele! Actin’ like you’ve never seen a girl blow a dude before...”</i>");
	output("\n\nOh right. Guess you should get in on the action...");
	processTime(15);
	clearMenu();
	//"PC needs a dick or less than 20 inches OR a hardlight."
	//Syris default capacity is 128, so it should fit.
	if ((pc.hasCock() && pc.cockThatFits(chars["SYRI"].analCapacity()) >= 0) || pc.hasHardLightEquipped()) addButton(0,"DoubleStuffSyri",penisRouter,[syriQuestSyriValdenDoubleStuffSyri,chars["SYRI"].analCapacity(),true,0],"Double Stuff Syri","Syri seems enamoured with Valden’s dick, and she’s got it nice and lubed up. See if the shemale pup’s ass can handle both of you at once.");
	else addDisabledButton(0,"Double Stuff Syri","Double Stuff Syri","You need a fitting penis or a strap-on for this.");
	addButton(1,"Knot Train",syriQuestSyriValdenKnotTrain,undefined,"Knot Train","Get fucked by Syri while she takes Valden’s dick.");
}

public function syriQuestSyriValdenDoubleStuffSyri(x:int):void
{
	clearOutput();
	showName("SYRI &\nVALDEN");
	showBust(syriBustDisplay(true),valdenBustDisplay(true));
	output("You toss your gear aside and ");
	if (x == -1) output("activate your hardlight, letting the shaft spring to life right onto the pout of Syri’s lips");
	else output("wrap your fingers around your own " + pc.cockDescript(x) + ", presenting it to your lover for a little attention");
	output(". She looks up at you with a wink and slides her mouth straight down your " + pc.cockOrStrapon(x) + " from tip to base, never breaking eye contact until her lips have kissed your base and have slid back to the crown yet again. While she’s blowing you, Syri’s hands aren’t idle; no, she keep stroking Valden’s dick in one hand, and reaches down to molest her own half-hard red rod as well.");
	output("\n\nThree throbbing cocks are all getting worked at once by the buxom dog-girl. It isn’t long before that familiar hidden cocklust buried deep inside her fights its way to the foreground, and soon Syri’s moving her mouth from one dick to the other, tasting you and Valden between rapid strokes and soft moans. Her own dick bobs and leaks with need between her thighs, so hard that she can’t keep a hand off it for more than a few seconds before having to jack herself off again.");
	output("\n\nValden’s the one who breaks the rhythm Syri’s built up. With a sudden grunt, the big huskar grabs Syri under the arms and hefts her up, planting her ass on the edge of a table and spreading her legs around his hips. Their cocks flop down together on Syri’s belly, smearing pre and drool over her skin until Valden grabs both dicks in hand and starts pumping his wrist.");
	output("\n\n<i>“What do you say, [pc.name]?”</i> he asks, grinning at you. <i>“Isn’t she beautiful?”</i>");
	output("\n\nYou murmur your affirmation, helping to pull the remaining clothes off your lover. She pulls you in for a kiss, holding you tight as Valden releases her dick and moves his hips back. You feel Syri tense, digging her claws into your shoulders for a brief second before she softens, moaning as Valden’s hips push forward again. Your lover’s cock is standing straight-arrow upwards, leaking her musty white goo to the beat of Valden’s slow, steady insertion.");
	output("\n\n<i>“Fuck that’s good,”</i> Syri groans. She keeps her arms around you, watching her friend start grinding his knot against her clenching rim. <i>“Starting to regret not taking advantage of the old Vally...”</i>");
	output("\n\n<i>“You and me both!”</i> Valden grunts, grabbing a breast in one hand and her hip in the other. <i>“Ah well, I don’t mind sharing now...”</i>");
	output("\n\nThe old ausar shifts forward, picking Syri up by the butt and pressing her chest into his, presenting her cock-filled ass to you. Syri gasps, wrapping Valden’s shoulders and hips with her limbs. Her dark tail lifts up, though, giving you a good view of her hole and the slick red rod lodged knot-deep inside her. ");
	output("\n\nWell, the poor girl’s only got the one hole, so you guess it’ll just have to pull double duty! Syri gives you a little nod over her shoulder and braces for impact.");
	output("\n\nYou slip up behind the pups and angle your " + pc.cockOrStrapon(x) + " into Syri’s tailhole. It’s gonna be a tight squeeze, but the lusty dickgirl made sure you and Valden both had plenty of lube going into this. You push your " + (x == -1 ? "holographic crown" : pc.cockHead(x)) + " into her ass, pressing down against Valden’s shaft and stretchign Syri out until she’s howling with pain and pleasure, forced to spread open around two dicks at once.");
	
	if(x >= 0) pc.cockChange();
	
	output("\n\nSyri’s tail beats against your [pc.face] as you wiggle your wang deeper into her, jockeying with Valden for position until you’re both wedged inside the panting ausar’s ass, feeling her chaotic clenching squeeze you so hard it almost hurts.");
	output("\n\n<i>“Fuck, fuck <b>fuck!</b>”</i> Syri whines, clutching at Valden’s shoulders. Her whole body’s trembling, including the red rocket you can just see pressed against her friend’s belly, squirting ribbons of white across his hairy chest. She whimpers, shuddering as her balls empty from the massive pressure pushing down on her prostate. ");
	output("\n\n<i>“When’d you turn into a quick shot, buddy?”</i> Valden grins, stroking Syri’s dick. <i>“I expected better!”</i>");
	output("\n\n<i>“H-hey!”</i> Syri growls, clawing at his shoulders. <i>“You try holding in a nut with two dicks in your ass!”</i>");
	output("\n\nValden chuckles, <i>“I’ll take your word for it!”</i>");
	output("\n\nYou take the opportunity to reach around and grab your lover’s tits, squeezing the full mounds to give her something else to think about. Syri groans, arching her back and pushing her head back into your [pc.chest]. You answer her with a thrust, pushing yourself a little deeper, and holding her tighter while your " + pc.cockOrStrapon(x) + " explores her bowels. One side of your cock grinds against Valden’s on the way in, making the grey wolf groan from the extra pressure. You can feel his dick throbbing against your own");
	if (pc.isMan() && silly) output(", though luckily your balls aren’t touching, so no homo or anything");
	output("; salty lubricants leak from his pointed crown, easing your own entrance.");
	if (pc.isMan() && silly) output("\n\n<i>“Yeah. No homo, man,”</i> ");
	else output("\n\n");
	output("Valden grunts, pushing a little deeper. <i>“Shit, girl, you’re getting tighter. Or else your [pc.boyGirl]friend here is damn thick...”</i>");
	output("\n\nSyri just groans and clenches her muscles, making both you and Valden stop dead in your tracks. It takes a visible force of effort for her to relax her anal muscles, slowly allowing you and Valden to start moving. He pushes in this time and you withdraw, assailing your mutual lover with a bevy of sensations that leave her poor red rocket quivering with delight. ");
	output("\n\nOf course, by now, she’s not the only one. The vigorous squeeze of her ass, and constantly grinding against Valden’s dick as well, as making your heart hammer in your chest. Electric pleasure courses from your crown to " + (x == -1 ? "hardlight strap’s connectors" : pc.knotDescript(x)) + ". Pressure builds in your loins, urged on by the steady caresses of cock and ass, of your lover’s desperate cries of pleasure in your [pc.ear]. You answer her moans with thrusts of your [pc.hips], pushing back into her stretched-out tailhole until she’s screaming for more.");
	output("\n\nThe one that breaks first is Valden, though. The poor wolf’s been sensory-deprived for years, so it’s really no surprise when the apex of a knot-deep push into his old friend’s butt sends him roaring over the edge. He clutches her cheeks tight, pulling Syri’s cum-drunk body flush with his own and letting loose inside. A surge of wet heat surrounds your " + pc.cockOrStrapon(x) + ", a momentary bath of lube that lets you slide in -- and push Valden out with a wet <i>schlick</i>. His squirting dick rockets out of her, spraying a parting shot of white goo across Syri’s thick cheeks and down on the ground between his legs. ");
	output("\n\nValden curses, stumbling back -- and taking you and Syri with him. The three of you go teetering backwards, and then it’s a no-holds-barred flail-fest of tails and limbs until Valden’s on his back, Syri straddling him, and you behind her thrusting full-force into her cum-lubed ass. The sultry shemale squeals in surprise and over-stimulation, shaking her hips back against you and grabbing her own schlong in a free hand to stroke herself off. You wrap your hands around her broad hips, holding her steady while you pound your way to your own climax. ");
	output("\n\nYour lover moans, leaning back against your [pc.chest] and rubbing her dick in a fluffy paw. A few more seconds of your hard anal fucking and she breaks, throwing her head back and slamming her knot against her wrist. A jet of white puppy-spunk sprays out of her crimson crown, splattering across Valden’s neck and chest in creamy ropes to add to the drying mess she’s already squirted over him. Valden groans, shielding his eyes as Syri’s jizz goes flying");
	if (pc.cocks.length > 1) output(", shortly accompanied by your secondary load");
	if (pc.cocks.length > 2) output("s");
	output(". You grit your teeth and push forward, driving yourself into the dickgirl’s ass to the hilt");
	if (pc.hasKnot(x)) output(" and slamming your knot in, lodging yourself in place");
	output(". Your own cum streams out a heart’s beat later, pumping deep into Syri’s battered bowels");
	if (pc.cumQ() >= 5000) output(" until the poor girl’s belly is swelling from the sheer intake of your prodigious seed");
	output(". Halfway through your anal creampie, Syri slumps forward and presses her ass back against you, letting you fill her up until you’ve got no more to give. Valden laughs under her, wrapping his arms around Syri’s back and letting the oversexed shemale catch her breath...");
	processTime(30+rand(10));
	//chars["SYRI"].loadInAss(pc);
	pc.orgasm();
	chars["SYRI"].orgasm();
	clearMenu();
	addButton(0, "Wrap Up", syriQuestWrapUp, undefined, "Wrap Up", "You rescued Valden, or what’s left of him. Time to call this adventure done with.");
}

public function syriQuestSyriValdenKnotTrain():void
{
	clearOutput();
	showName("SYRI &\nVALDEN");
	showBust(syriBustDisplay(true),valdenBustDisplay(true));
	output("Well, Syri’s complaining about how hard she is, and you have to admit that sweet red rocket of hers looks positively enticing bobbing between her legs and dripping pre. You lick your lips and slip down onto the ground, shrugging out of your gear as you go. Syri watches you out of the corner of her eye; she spreads her legs when you get close, letting you worm your way in between them and wrap your hands around her throbbing erection. You cup her swinging sack in one hand, rolling the hefty nuts between your digits while your other hand slowly, sensually slides up her stiff shaft. ");
	output("\n\nYour lover moans softly around her mouthful of Valden’s schlong, but she dutifully keeps sucking even as you get to work on her. With a few well-placed licks and kisses along the veiny red length in your [pc.hand], you get Syri rock hard and ready to fuck -- like she needed more of an excuse! Her dick trembles with its own horny need in your hand, and pretty soon, in your mouth as well.");
	output("\n\n<i>“Ah! My favorite lay and my old best friend. How’s a girl get this lucky?”</i> Syri sighs, pulling herself reluctantly off of Valden’s cock.");
	output("\n\n<i>“Old?”</i>");
	output("\n\n<i>“Well....”</i> Syri glances down and puts her hands on your cheek, pulling you up into a long kiss. <i>“Plus, this bestie’s got some serious benefits.”</i>");
	output("\n\nValden grins, stepping back from the pair of you. <i>“Well, why don’t we check ‘em out?”</i>");
	output("\n\nYour lover doesn’t need to be asked twice. She pulls you up and shoves you face-first over the edge of the couch, leaving your [pc.butt] naked and more or less right at the perfect level for her to get busy on. Though all you can see is a facefull of sofa, you feel her fluffy hands grab your [pc.butt] hard, squeezing your cheeks and spreading them apart. One of her thumbs snakes down, pressing directly against your [pc.asshole]. You gasp and squirm, but she doesn’t enter you -- not yet, anyway. You wonder why, until something cold and wet drips onto your tailhole. While you can’t be sure if it’s lube or spit or something else, it elicits an instinctive shudder from you as Syri’s digit pushes a glob of it into your ass.");
	output("\n\nThat’s the stuff! You claw at the sofa, digging your nails in as your asshole spreads around Syri’s thumb, squeezing it with cock-hungry lust and drawing her ever-deeper in.");
	if (pc.hasTail()) output(" Your tail wags hard, swishing across Syri’s chest until she’s forced to wrench it aside.");
	output(" <i>“That’s it. Lemme just spread it around. You don’t want me going in dry...”</i>");
	output("\n\nTo show her that her words ring true, you push your hips back against her, taking her thumb all the way inside. Syri chuckles and gives your [pc.butt] a playful slap, swirling her thumb around inside you until the lube’s spread all around. When she’s satisfied with the job she’s done, your wolfy lover slips her finger out and sinks the rest of her digits into your [pc.butt], spreading you wide while her hips push her red rocket up between your cheeks. The fat knot grinds against your " + (pc.balls > 0 ? "[pc.balls]" : "taint") + ", sending a shiver up your spine.");
	output("\n\n<i>“Bite the cushion,”</i> Syri growls, pressing the tip of her dick against your [pc.asshole]. <i>“I ain’t stopping until the knot’s in.”</i>");
	output("\n\nShe barely gives you enough time to act on her warning before Syri’s hips thrust forward, slamming her cock into you. You scream in pain and pleasure, voice muffled by the couch as inch after inch of rigid red dick slide into your lubed-up tailhole. It’s an exquisite feeling, being stretched and molded so perfectly to your lover’s body, taking her to the bitch-breaking hilt.");
	
	pc.buttChange(chars["SYRI"].cockVolume(0));
	
	output("\n\nWhile you’re getting plowed into the pillows, you cast a glance over your shoulder just in time to see a pair of grey-furred hands wrapping around Syri’s chest. Valden hefts up her tits, pulling Syri back out of you by a few inches and into his hairy chest. ");
	output("\n\n<i>“Hope you didn’t forget about me,”</i> he murmurs, cupping her cheek. You return your attention to the cushions to the sound of smacking lips... and then a yelp from Syri. Her hips rock back towards you, pushed steadily forward by Valden. You can only imagine from the violent throbbing from Syri’s dick that Valden’s entered her, giving the lusty shemale a taste of her own suppository medicine.");
	output("\n\nIndeed, it only takes a few moments before your lover is gasping and clawing at your hips, trying to keep it together as she gives and takes a hard anal fucking. Syri bends, pressing her ample chest into your back, giving her lover a better angle to pound her butt. Every thrust Valden makes shoves her hips forward, driving Syri’s dick deep into you. She moans and pulls back, sliding her slick schlong a few inches out before being pounded in again. Every time, you get rocked forward with the sheer massive size of her swelling knot; you feel it battering against your [pc.asshole]. The throbbing bitch-breaker pushes against your anal ring, stretching you a little more with each impact.");
	output("\n\nInevitably, one of Syri’s erratic pelvic thrusts pushes her knot that last little bit it needs. You scream into the cushion as her fist-sized knot ties you to her, lodging itself in your ass. The stretch is incredible, making your heart clench in your chest while your ");
	if (pc.hasGenitals()) {
		if (pc.hasVagina()) output("cunt leaks femcum onto the couch");
		if (pc.isHerm()) output("and your");
		if (pc.hasCock()) output("[pc.cock] drools from prostate stimulation. Another couple little thrusts and your dick squirts its load onto your thighs, milked out by your lover’s insistent attention");
	}
	else output("loins burn with desire");
	output(".");
	output("\n\nYour lover is panting in your [pc.ear], tits rubbing on your back and hands wrapping around your [pc.chest]. She squeezes you tight, holding on as she experiences her own version of the exquisite agony of her ass taking a beefy ausar knot. A second later and you feel that wonderful heat you’ve been waiting for shooting deep into your bowels. You’re quickly filled with Syri’s seed, leaving a weighty warmth settling in your belly. Behind her, Valden grunts, and you’re treated to an echoing slap of flesh crashing against flesh. Syri lurches forward, wiggling her dick inside you to the beat of Valden’s own orgasm pumping into her behind.");
	output("\n\n<i>“Gods and stars!”</i> Valden groans, wobbling on his feet. <i>“Oh I’ve needed that! Years and years and...”</i>");
	output("\n\n<i>“Shut up, Vally,”</i> Syri says, planting a kiss on your shoulder. <i>“Nobody likes talking with a dick in the ass.”</i>");
	output("\n\nThe grey wolf grunts an apology and rests his hands on Syri’s shoulders, letting the three of you wait out your knots in quiet companionship.");
	processTime(45+rand(15));
	pc.loadInAss(chars["SYRI"]);
	pc.orgasm();
	chars["SYRI"].orgasm();
	clearMenu();
	addButton(0, "Wrap Up", syriQuestWrapUp, undefined, "Wrap Up", "You rescued Valden, or what’s left of him. Time to call this adventure done with.");
}