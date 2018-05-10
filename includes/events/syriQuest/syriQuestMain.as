//https://docs.google.com/document/d/1kgDLjKPffZIGkFf3DQWXRFex5aVWVAGMCq7RlJEbYzI/edit#
/*
 * SYRIQUEST_STATE						1 = run into Syri at the station
 * 										2 = Syri told PC her plan
 * 										3 = PC accepted plan
 * SYRIQUEST_LOCK_BYPASS				1 = hacked, 2 = failed
 * SYRIQUEST_POWER_STATE				0 = off, 1 = on, 2 on (but too high)
 * SYRIQUEST_ELEVATOR_STATE				0 = nothing, 1 = entered elevator, 2 = unlocked lab access
 * SYRIQUEST_RESOLUTION					-1 = never accepted the quest
 * SYRIQUEST_SYRI_ONAHOLE				undefined = never found it, 1 = found it, 2 = gave it to Syri
 * SYRIQUEST_POST_GAME_TALK_PENIS		1 = talked about Valden, 2 = talked about Syris cock, 3 = talked about Syris cock sleeve
 * SYRIQUEST_POST_GAME_TALK_LOVE		1 = told her love her, 2 = stay friends
 * MET_ALYRU							meet Commander Alyru Schora
*/

//Ask Savin about:
/* syriTalksAboutAnno scene
 * Mhenga Landig pad scene with syri
 * Should CuntSleve be aviable even if Valden died?
 * 
*/
 
//When the PC hits Level 9 and meets all other reqs., remove Syri from Mhen'ga. The next time the PC enters the transit hub on Uveto (and has access to at least one travel point), play this scene.");
//Reqs: Level 9. Must be fuckbuddies with Syri and have gotten Syri's panties.");

public function syriQuestRunning():Boolean
{
	if (syriQuestComplete()) return false;
	if(pc.level >= 9 && pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.") && syriIsAFuckbuddy()) return true;
	return false;
}

public function syriQuestComplete():Boolean
{
	if (flags["SYRIQUEST_RESOLUTION"] != undefined) return true;
	return false;
}

public function myrraBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "MYRRA";
	if(nude) sBust += "_NUDE";
	return sBust;
}

public function showMyrraAndSyri(nude:Boolean = false):void
{
	showName("SYRI &\nMYRRA");
	showBust(myrraBustDisplay(nude),syriBustDisplay(nude));
}

public function alyruBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "ALYRU";
	if(nude) sBust += "_NUDE";
	return sBust;
}

public function showAlyru(nude:Boolean = false):void
{
	if (flags["MET_ALYRU"] == 1) showName("\nALYRU");
	else showName("NAKED\nWOMAN");
	showBust(alyruBustDisplay(nude));
}

public function syriQuestInitialEncounter():Boolean {
	clearOutput();
	showSyri();
	author("Savin");
	output("As you're heading to the platform, you notice something in the corner of your eye, half-hidden by the waves of extra-fluffy ausar and buttoned-up leithens in their cold-weather pony-parkas: you see a dusty blue longcoat dangling down from the other side of a particularly imposing leithan, and you're pretty sure you see a pair of raven-furred ausar ears swivelling around above them.");
	output("\n\nIs that...? No way.");
	output("\n\nDriven by a powerful curiosity, you push your way through the crowded station to where you saw the mysterious figure. Circling around the broad flanks of the buff 'taur, you reach out a hand to the figure's shoulder to try and get her attention... just as she's turned around of her own accord. She ends up taking a step directly into you, yelping as a steaming foam cup of something dark gets crushed between you, squirting the hot liquid everywhere.");
	output("\n\n<i>“Shit!”</i> you both say, patting yourselves off. It takes you a good few seconds to get your bearings enough to look up and see just who it is you're dealing with.");
	output("\n\n<i>“Steele!?”</i> Syri says, eyes wide. Coffee has soaked through the front of her yellow t-shirt, leaving a pair of cold-stiffened nipples jutting through under the flaps of her greatcoat. And her tail starts wagging, thumping heavily against the nearby leithan's legs as she blinks away the surprise. <i>“What the hell are you doing here?”</i>");
	output("\n\nYou could ask her the same question. This doesn't look like Mhen'ga.");
	output("\n\nSyri half-laughs, wiping some coffee off her hand-fur. <i>“Shit, did I not send you an email? I thought I sent you an email! Uh, I got laid off! Yay.”</i>");
	output("\n\n<i>“");
	if(pc.isNice()) output("Oh no! I'm sorry to hear that!");
	else output("That sucks.");
	output(" But what're you doing all the way out here?”</i>");
	output("\n\n<i>“Getting Irish coffee spilled all over my tits, apparently! At least it's by the hottest klutz this side of the Orennan expanse,”</i> she says with a wink. <i>“That was a hell of a non-answer, too. So funny story: the day we finished that bridge we were working on out of Esbeth and Pyrite decided they didn't need hired hands anymore, I got an email from a games site I subbed to when I was like, 12, and it had news of this big </i>Call of Valor<i> tournament being held here on Uveto. So like any responsible adult, I blew the last of my savings on a ticket out here and the registration fees. Figured I'd give myself some real motivation to win: take home the gold, or have to move back home with mom and dad!”</i>");
	output("\n\nYou stare at Syri for a moment. <i>“Seriously? ");
	if(pc.isNice()) output("I could have come pick you up!");
	else output("Didn't even think of calling me to take you?");
	output("”</i>");
	output("\n\nShe plays it off with an eye roll, leaning back against a nearby pillar. Her cleavage only becomes more and more transparent as the coffee settles in... <i>“Maybe we should go get cleaned up?”</i> you offer.");
	output("\n\n<i>“And waste all this coffee?”</i> she purrs, slipping in close and grabbing your ");
	if(pc.hasCock()) output("package");
	else output("butt.");
	output(" with a firm squeeze. <i>“I'm pretty sure my cleavage is soaked through... you made this mess, so you should clean it up. With your tongue,”</i> Syri murmurs, giving you a seductive look and pressing her shoulders together for that extra bit of bustiness. ");
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
	output("The nearest public restroom is mostly empty and cleaner than most, at least. Syri's back impacts the side of the taur-accessible stall with enough force to make the whole row shudder -- and make her tits bounce delightfully as you yank her stained shirt up over her head. You stop just before the collar pops around her chin, leaving the lusty shemale panting and scrabbling blindly at your back, raking her short claws across your ");
	if (pc.isNude()) output("[pc.skinFurScales]");
	else output("[pc.armor]");
	output(".");
	output("\n\nYour [pc.tongue] flicks out, dragging in long, slow trails around the insides of Syri's double-D tits. You can taste the mix of coffee and ausar whiskey on her flawless flesh, mixing with the unmistakable flavor of your lover to drive your tastebuds wild. Her cherry-red nipples just up like crimson mountains from her breasts demanding to be pulled and pinched, which occupies one of your hands while the other bunches Syri's shirt around her arms like restraints, keeping the feisty shewolf right where you want her.");
	output("\n\n<i>“Knock it off!”</i> she growls, as softly as she can lest someone hear. <i>“I wanna look in your eyes while you worship those.”</i>");
	output("\n\nYou answer her by grabbing one of her teats between your [pc.lips] and giving it a rough suck, pulling back on the pebbly mound until she's arching her back and gasping. Now her cleavage is much more slathered in spit and sweat than Irish coffee, giving you the perfect excuse to bury your face in between them and motorboat Syri's silky skin, making those beautiful baps quake against your cheeks.");
	output("\n\nSyri just hooks a leg around your hip and lets her head roll back, gasping softly to the beat of your boobworship. You let your hand wander down from her breast to her crotch, grabbing a handful of puppy package through the front of your jeans -- and if you thought she was into it before, <b>now</b> she's going crazy. Syri has to choke back a cry, and her borrowed cock throbs so hard through her jeans that the zipper starts to peel down of its own accord... though you're happy to hasten the process.");
	output("\n\n<i>“Damn it,”</i> Syri moans, chest heaving. <i>“Why the fuck do you get me so </i>hard<i>? You gotta be some kinda sex demon... nothing should make my dick so hard it </i>hurts<i>!”</i>");
	output("\n\nBetter give this puppy some relief, then. You pull your face out of her tits and push your [pc.lips] against Syri's, giving her something else to think about while you fish her dick out and start to stroke the throbbing pillar of auburn dogmeat. No reason to mess around with the foreplay here: you start jacking Syri nice and fast, making the ravenette slut squirm in your hands, thrashing her tail against the side of the stall. ");
	output("\n\nFinally, you pull Syri's impromptu hood off, letting her shirt fall to the floor and freeing your lover to finally look at you, eating you up with those big blue eyes of hers, full of shameless lust and need. Suddenly her hands leave your back, grabbing your cheeks in both fluffy palms before pulling you back in hard, thrusting her tongue down your throat while her dick starts to pulse with desperate desire. You can feel her knot swelling, ready to break a bitch wide open and trap the impending surge of seed deep inside. Instead, all it does is give you something nice and meaty to play with between strokes, squeezing and kneading the ball of turgid ausar flesh until Syri's moaning in your mouth and her dick is leaking her thick cream into your waiting hand. ");
	output("\n\nShe crescendos with one long squirt of pearly spunk that splatters across the floor, apparently pleasurable enough to make her slam her own back against the wall and crush your pelvis with her leg. Syri lets loose a gasping train of curses and a few aftershots of watery spunk, staining your hands white -- the perfect mess for <i>her</i> to clean up. When she's finished cumming, you release her still-turgid knot and bring your hand up to her dark lips, letting her jizz glisten in the flourescent light of the bathroom.");
	output("\n\n<i>“Pervert,”</i> Syri laughs, stroking your cheek. <i>“First you jack me off in a bathroom, then you want me to lick cum off you? What do you think I am, ");
	if (flags["MET_ANNO"] == 1 || flags["PUPPYSLUTMAS_2014"] != undefined) output("my sister");
	else output("a bitch in heat, desperate to breed");
	output("?”</i>");
	output("\n\nBefore you can answer, Syri grabs your wrist in both hands and thrusts her tongue into the biggest glob of steaming shemale spunk quivering in your palm.");
	output("\n\n<i>“Lucky for you, I'm a filthy pervert too,”</i> she smirks, licking her lips. <i>“Gods, the thing this dick makes me wanna do to you...”</i>");
	output("\n\nSyri laughs and slumps back against the bathroom wall, covering her face with a hand. Her dick bobs and wiggles, slowly withdrawing into her fly. At least her tits are still out, offering themselves up as the perfect place to rest your head while your love recovers from her climax.");
	output("\n\nFinally, her arms settle around your waist, hugging you against herself. <i>“I am really, incredibly, stupendously glad to see you here, Steele,”</i> she murmurs, nibbling on your [pc.ear]. <i>“I hope you're staying for the tournament...”</i>");
	output("\n\nMaybe. It's the first you've heard about it, after all. ");
	output("\n\n<i>“Would be nice to have my favorite space-slut cheering me on,”</i> she smirks, stroking you gently. <i>“Although... hey, actually... can I talk to you? Like, real serious talk. The kind you don't have half-naked in a maglev station's toilet.”</i>");
	output("\n\n");
	if (pc.isMischievous()) output("<i>“But those are the best kinds,”</i> you tease. ");
	output("<i>“What's on your mind?”</i>");
	output("\n\n<i>“I'll tell you when we get to your ship, okay?”</i>");

	processTime(30+rand(15));
	//Give minor exhibitionism.
	pc.exhibitionism(2);
	pc.lust(33);
	chars["SYRI"].orgasm();
	clearMenu();
	addButton(0, "Go Now", syriQuestGoNow,undefined,"Go Now","Head back up to your ship and see what's on the puppy's mind.");
	addButton(1, "Go Later", syriQuestGoLater,undefined,"Go Later","You'll get right back to Syri about that.");
}

public function syriQuestGoLater():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("You make your excuses, saying that while it was fun for a quickie, you've gotta jet. Serious talk will have to wait for a bit.");
	output("\n\n<i>“Yeah, no problem. You can probably guess where I'm hanging out most of the time, so drop by the bar whenever you're free for an hour or so. 'Kay?”</i>");
	output("\n\nYou nod, slowly dislodging yourself from Syri's slicked tits. She gives you a little grin and slaps your cheek with a boob before you can fully extricate yourself. The two of you spend the next couple of minutes redressing, occasionally pausing to grope or spank each other until you're almost presentable. The pair of you slip out of the bathroom at a quiet moment, heading your separate ways for now.");

	rooms["UVI R32"].addFlag(GLOBAL.NPC);
	generateMap();

	processTime(3);
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
	output(" facing Syri. She's too absorbed in whatever game she's playing to notice you until you reach over and ");
	if (pc.isMischievous() || silly) output("boop her nose");
	else output(" give her a poke");
	output(".");
	output("\n\n<i>“Hey, Steele!”</i> she beams, glancing up from her tablet for a split second. <i>“Lemme just... finish... this level... there! Suck my magic space dick, Vultork the Inexorable!”</i>");
	output("\n\nSyri pumps her fist in the air and drops her tablet on the table. <i>“Fuck yeah, that feels good. And good to see you, too,”</i> she adds, leaning over the table to give you a kiss on the cheek. <i>“So, finally got the time for that talk?”</i>");

	processTime(5);
	clearMenu();
	addButton(0, "Yes", syriQuestYes,undefined,"Yes","Let's have that conversation now.");
	addButton(1, "Not Yet", syriQuestNotYet,undefined,"Not Yet","Soon, Syri.");
}

public function syriQuestNotYet():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Soon,”</i> you say. <i>“I just wanted to stop by.”</i>");
	output("\n\nSyri pouts and crosses her arms. <i>“Okay, okay. Just don't take <b>too</b> long, okay? It's really important to me.”</i>");
	output("\n\nYou share a drink with your lover, making a bit of small talk before you have to head back out.");

	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function syriQuestYes():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Sure,”</i> you tell her. <i>“What's on your mind?”</i>");
	output("\n\n<i>“It would be better if we talk somewhere private,”</i> Syri says, glancing around nervously. <i>“Can we go up to your ship?”</i>");
	output("\n\nIt's a bit of a walk, but that makes her more comfortable, you can't see why not...");

	rooms["UVI R32"].removeFlag(GLOBAL.NPC);
	generateMap();
	syriQuestGoNow();
}

public function syriQuestGoNow():void {
	clearOutput();
	showSyri();
	author("Savin");
	moveTo("SHIP INTERIOR");
	output("You take Syri by the hand and tell her that you're all ears for her. She smiles and puts a big, wet kiss on your [pc.lipsChaste], squeezing your hand in hers before she quickly gathers her things. A few minutes later and the two of you are trudging through the wailing winds and heavy snow of Irestead, making your way back to the city's central hub, and then up through the dizzying heights of the space elevator.");
	output("\n\nThe walk back to your ship is brief and quiet. Syri doesn't talk much on the way; not at all, in fact, unless you prompt her. She keeps chewing her lower lip and scratching at her arm-fur, staring off into the vastness of space between short responses to whatever you try and talk about. Something's got this puppy by the tail, but she won't say what until she's safe and sound aboard your ship.");
	output("\n\nWhen the airlock finally cycles behind you, Syri lets out a sigh that seems to carry all the weight off her shoulders. She lets you guide her over to the couch in the common room and you both take a seat.");
	if (annoIsCrew()) {
		output("\n\nFrom the corridor behind you, you hear a cheery <i>“Hey boss!”</i>");
		output("\n\nTaking a look over your shoulder, you see Anno jogging up in a tight black Steele-patterned sports bra and booty shorts, creamy flesh still glistening with sweat from a recent workout. <i>“I thought I saw something tall, dark, and cute coming aboard on the security cams. Finally break down and decide to join Steele's merry harem of adventurers?”</i>");
		output("\n\n<i>“Oh! H-hey Anno,”</i> Syri says, fidgeting. <i>“Still flying solo... though not for Steele's lack of trying.”</i>");
		output("\n\nThe raven ausar chuckles and crosses her legs, pointedly avoiding looking at her skimpily clad sister. Anno just giggles and bounces over, wrapping her arms around Syri's shoulders from behind the couch in a tight hug that has the back of Syri's head buried in her pearly cleavage.");
		output("\n\n<i>“I was just coming by to talk to Steele. You know, just hangin' out.”</i>");
		output("\n\nAnno gives her sister a strange look that only you can see, eyebrows arched and lips pursed. <i>“Well, it's good to see you anyway! I'm glad we've got the good captain here to bring us together more often than like, once every other year.”</i>");
		output("\n\n<i>“You too!”</i> Syri grins, reaching up to scratch Anno's head, right between the ears. The sisters' tails wag happily, and exchange a few more quick pleasantries before Syri manages to disentangle herself from Anno's arms, saying that she has some business with you still.");
		output("\n\nAnno tsks her tongue and steps back, turning towards her quarters. <i>“Okay, okay, I know when I'm being a third wheel. I've got some more jumping jacks to do anyway, so I'll let you guys get back to it.”</i>");
		output("\n\nShe makes a rather enticing jumping motion on her way out that, even with her sports bra on, makes her boobs bounce and jiggle. <i>“If you try leaving without hanging out with me, I'm gonna hunt you down and shave your tail, little sister!”</i>");
		output("\n\nAnno bounces away before Syri can respond, leaving the horndog ausar to look at you with flushed cheeks and say, <i>“God damn those shorts though... unf. Be still my sinful heart!”</i>");
		output("\n\nShe gives a little shiver and leans back into the couch, scratching at her jeans that suddenly look two or three sizes too small around the ground. <i>“Anyway...”</i>");
	}
	output("\n\nSyri sighs and turns to you, still looking more than a little off-balance. <i>“");
	if (silly) output("Help me, Steele Kenobi, you're my only hope. Seriously though, I need some help.");
	else output("So... look, I uh, I need your help, Steele. Like, real bad.");
	output(" And it's not gonna be exactly... legal... technically speaking. But you're the only person I know who's ");
	if (silly) output("a bad enough dude");
	else output("badass enough");
	output("... and who might care enough about me to do it without me being able to pay them.”</i>");
	output("\n\n");
	if (pc.isNice()) output("You put a hand on Syri's. <i>“What's wrong?”</i>");
	else if(pc.isMischievous()) output("<i>“I'm dying of suspense here. What's up?”</i>");
	else output("<i>“Come on, out with it already! You've been pent up about this since we left Uveto.”</i>");
	output("\n\n<i>“I...”</i> she starts, pausing to think for a moment. <i>“I didn't </i>just<i> come to Uveto for the tournament. I mean, I'm here for that too because otherwise I really am gonna be flat out broke and have to move back in with my parents and that's going to be real fucking embarrassing but </i>also<i> more importantly...”</i>");
	output("\n\nSyri stops for breath, shifting her weight on her ass. <i>“I got some information from someone in Akkadi. The company that cause my little accident? I don't know who it's from or if it's even legit, but it looks like it is, and... and it says that Valden is alive.”</i>");
	output("\n\n<i>“Valden? The guy whose dick you have now?”</i>");
	output("\n\nSyri nods. <i>“Yeah. He went through the transporter with me but never came back out. The Akkadi brains behind the project said they had no idea where he'd gone, that he was probably dead, too. But the report I have says he's been here at their complex on Uveto since the accident! They've been lying to me since day one!”</i>");
	output("\n\nAssuming this leak is legit, anyway.");
	output("\n\n<i>“I know it's a big assumption, but if Valden's really alive... and behind held by Akkadi; experiment on... then I can't just leave him here! I've got to save him. I know he'd do the same for me.”</i>");
	output("\n\n<i>“So what do you need from me?”</i> you ask her.");
	output("\n\nThe raven-haired ausar grimaces. <i>“And that's the awkward part. I can't be the one that breaks into an Akkadi research base. After the accident, the company has my picture, clawprints, DNA, everything on file... there's no way I could get away with it. No more medical benefits, probably go to jail... probably get some naval intelligence spook shooting me in the back one night.”</i>");
	output("\n\nYou blink. <i>“So you want me to");
	if (pc.isBimbo()) output(", like,");
	output(" take the fall for you?”</i>");
	output("\n\n<i>“Wha- no! No no no. I've got a cunning plan to get somebody </i>else<i> inside, completely undetected. Security will never see a trace of you, and they'll </i>know for a fact<i> that I was miles away when it happened. It'll work!”</i>");
	output("\n\nSounds kind of sketchy, but it clearly means a lot to Syri... ");
	processTime(45+rand(30));
	syriQuestGoNowMenu();
}

public function syriQuestGoNowMenu():void {
	showSyri();
	author("Savin");
	clearMenu();
/*	addDisabledButton(0, "Talk:");
	addButton(1, "Valden", puppyslutmasMeetAnno);
	addButton(2, "Akkadi", puppyslutmasMeetAnno);
	addButton(3, "Transporter", puppyslutmasMeetAnno);
	addButton(4, "Syri's Plan", puppyslutmasMeetAnno);
*/
	addButton(0, "Valden", syriQuestInitialTalkValden,undefined,"Valden","Ask about Lieutenant Commander Valden.");
	addButton(1, "Akkadi", syriQuestInitialTalkAkkadi,undefined,"Akkadi","So what's Akkadi's deal, anyway? Why are they doing this?");
	addButton(2, "Transporter", syriQuestInitialTalkTransporter,undefined,"Transporter","Ask Syri about the transporter device Akkadi was working on.");
	addButton(3, "Syri's Plan", syriQuestTalkSyrisPlan,undefined,"Syri's Plan","So what's this plan of hers...?");
	if (flags["SYRIQUEST_STATE"] == 2) {
		addButton(5, "Accept", syriQuestTalkSyrisPlanAccept,undefined,"Accept","Alright, you're onboard with Syri's plan.");
		addButton(6, "Refuse", syriQuestTalkSyrisPlanRefuse, undefined, "Refuse", "This sounds half-cocked at best, not to mention criminal.");
	}
}

public function syriQuestInitialTalkValden():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Tell me about Valden.”</i>");
	output("\n\n<i>“He was my unit leader back in the service,”</i> Syri answers. <i>“He was a career man, an officer who went through the same school Anno did -- years earlier, obviously -- to get his commission as an engineer. But he never had that 'smarter-than-the-grunts' attitude a lot of the other officers had. He was... down to earth. I think he said he'd grown up on a farm, out on one of the kaithrit border colonies, and he was sure rugged enough for it.”</i>");
	output("\n\nSyri laughs to herself, shaking her head. <i>“Most hands-on officer I ever had, too. Never shied away from doing the dirty work himself. And when we were in the shit back on Khaleen, cut off and surrounded... we only made it out because Valden kept his cool, lead us through fire and fury like you wouldn't believe.”</i>");
	output("\n\n<i>“You know, you've never talked about it,”</i> you say, prying gently. <i>“Khaleen, I mean.”</i>");
	output("\n\n<i>“You're right,”</i> she answers.");
	output("\n\nSilence follows for a long, long moment. Finally, Syri continues, <i>“I know. It was a shitshow. Hardest few days of my life. But Valden got me through it alive. Got a lot of people through it alive. And those Akkadi bastards repay him by turning him into a god-damn guinea pig! It's bullshit!”</i>");
	output("\n\n”</i>I'm alive today because of his leadership. If he's still alive, I'd never forgive myself for not trying to help him.”</i>");
	processTime(5);
	syriQuestGoNowMenu();
	addDisabledButton(0, "Valden");
}

public function syriQuestInitialTalkAkkadi():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Akkadi is the biggest company in ausar space. They make... everything, from starship to Warp Gates to consumer tech. They used to employ my sister, and they're the ones that came up with the whole transporter device idea for the Federation fleet.”</i>");
	output("\n\nSounds like a powerful enemy Syri's trying to make here.");
	output("\n\nShe leans back and sighs, resting her hands on her knees. <i>“I know. Believe me, I know that better than most. Akkadi likes to put on a cute face in public -- they have little chibi ausar girls in rainbow colors as their mascots and everything -- but they're one of the most ruthless megacorps out there. I used to think they had to be, they're keeping the ausar relevant in the galaxy, keeping the Warp Gate network running... but now I'm not so sure. Not if they're experimenting on our own people.”</i>");
	output("\n\n<i>“Any idea why they're holding Valden?”</i>");
	output("\n\n<i>“I'd assume it's got something to do with the transporter accident,”</i> Syri says. <i>“They kept me locked down in a hospital for weeks afterwards. Of course I needed it, with my insides all scrambled around, but I knew they were studying me too. Trying to see what their little gadget had done to me, how they could profit off what they did to me. Bastards.”</i>");
	output("\n\nSyri grumbles a few more descriptive curses, finally resting her hand on her package and adding, <i>“At least it wasn't all bad. Turns out having a dick is pretty great. Just wish a tenth of my organs weren't Valden's... though he's got a hell of a liver. <b>Had</b>, I guess.”</i>");
	output("\n\nYou nod. <i>“So let's talk about their operation here on Uveto...”</i>");
	output("\n\n<i>“Right. Akkadi has a research station way north-east of Irestead, out on the very edge of this huge rift between two glaciers. It's in the middle of absolutely nowhere. They use it to do their most sensitive research, well away from prying eyes... and any kind of regulation or oversight. The documents I got make it look almost like a blacksite, the kind of place where they dissect the real nasty aliens out there.”</i>");
	output("\n\nThat doesn't sound good for Valden...");
	processTime(10);
	syriQuestGoNowMenu();
	addDisabledButton(1, "Akkadi");
}

public function syriQuestInitialTalkTransporter():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“What can you tell me about the transporter?”</i>");
	output("\n\n<i>“Why, hopin' to steal one for Steele Tech?”</i> Syri laughs. <i>“Hell, they might have one there. The one I went through was a prototype. They wanted to use it in a hostage situation involving a member of the royal family, and my unit was apparently the only one close enough to respond in time. Pulled us off a training exercise and everything. It was the first time living people had gone through a man-scale Warp Gate... at least that anybody wanted to talk about after. Considering what happened, I think we were probably the last, too.”</i>");
	output("\n\n<i>“Valden and I were called to spearhead the mission. We were called into this dark chamber in a Akkadi research station, high above the planet. The transporter didn't look like anything special at the time: it was just a platform surrounded by panels of glass, with a circle of silvery metal on the floor that the nerds made us stand inside. 'Hands, legs, and tails inside the dimensional shunter at all times' and all that.”</i>");
	output("\n\nYou ask, <i>“What happened next?”</i>");
	output("\n\nSyri takes a deep breath. <i>“Well, um, there was a voice from the control room telling us to push all the air out of our lungs. Then there was a bright light, like, blindingly so, from all around us. Then the next thing I knew I was lying on my back in the drop site, feeling like fingers were in there tickling all my insides. It was the weirdest thing I ever felt... at least until I got my first boner.”</i>");
	output("\n\n<i>“Did it hurt?”</i>");
	output("\n\n<i>“The boner? Nah,”</i> she laughs. Then, more seriously: <i>“Honestly, no. I couldn't move or speak for a while, but I wasn't in pain. It was just... just weird.”</i>");
	output("\n\nSyri shrugs. <i>“And then I realized I was all alone. No Valden. No backup, cuz the Akkadi nerds realized they fucked up afterwards and didn't send anybody else. So I just got to squirm in the government office's attic until the actual S.W.A.T. team showed up and saved the day. My ego's what hurt after that.”</i>");
	output("\n\n<i>“Didn't really realize what had happened until afterwards. Too busy being terrified and freaking out to notice the new equipment between my legs. I only noticed on the medevac out, when a nurse in this killer miniskirt 'accidentally' thrust her plump butt in my face when she went reaching for something up in a cabinet. I've always been an ass girl, but damn, that booty dredged up something <b>primal</b> in my new cock. Never wanted to motorboat a pair of cheeks so bad in my life...”</i>");
	output("\n\nSyri makes a little grunting noise and shifts her legs around her growing bulge.");
	if (pc.isBimbo()) output("\n\n<i>“So'd you, like, bang her and stuff?”</i>");
	else if (pc.isBro()) output("\n\n<i>“So you tap that ass or what?”</i>");
	if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“I don't like to fuck and tell,”</i> Syri laughs, <i>“But let's just say I got to try out my new equipment on the medbay bed. More than once.”</i>");
	processTime(15);
	syriQuestGoNowMenu();
	addDisabledButton(2, "Transporter");
}

public function syriQuestTalkSyrisPlan():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Tell me about this plan.”</i>");
	output("\n\n<i>“Alright, now we're talking!”</i> Syri grins, sitting straight up and fixing you with her deep blue gaze. <i>“So this Akkadi base out on the Rift is expanding their facility. They're making a second station on the opposite glacier with a great big skybridge connecting them. So naturally I've got some serious qualifications in bridge building, enough to get myself a job with the company Akkadi contracted out to do the construction. They're airlift us worker pups and a bunch of sealed equipment containers out to the site every day, and I've got access to the containers before they ship.”</i>");
	output("\n\n<i>“So my plan is to sneak you into one of those containers, one that's gonna be going to the crew working on the secure research wing's access bridge. Once you're in place, I'm going to be on the other side of the bridge working on the power substation... and for no reason at all, the base is going to get hit with a surge caused by one of the construction crew's generators spiking their system. The base's security sensors will be offline just long enough for you to get inside the secure wing from the container. Probably.”</i>");
	output("\n\nYou squint at her. <i>“Probably?”</i>");
	output("\n\n<i>“Well... yeah,”</i> Syri answers, fidgeting. <i>“Look I only get one shot at this. If I test it, they'll fix the bug. But the first day on the job I spent every second I could looking over their power systems and security and I'm pretty damn sure I'm right. Their new construction doesn't have any backups installed yet, so when the main base's generators come online, they'll be stretched too thin by two entire complexes trying to pull on them: they'll overload too!”</i>");
	output("\n\nShe seems confident, but... well, all you have is her expertise to go on.");
	output("\n\n<i>“And what do I do once I'm in there?”</i>");
	output("\n\n<i>“Find Valden. Break him out. And then we're gonna get the fuck outta dodge before Akkadi's security goons come swarming all over us.”</i>");
	output("\n\n<i>“And what's the plan for getting out?”</i> you ask.");
	output("\n\nSyri sucks in a sharp breath. <i>“Uh, we're gonna have to improvise on that. Could always hijack the company's air mule or one of the Akkadi security gunships, or have your ship come pick us up if you can disable the security again from inside. I don't know.”</i>");
	output("\n\nGood plan.");

	flags["SYRIQUEST_STATE"] = 2;
	processTime(15);
	syriQuestGoNowMenu();
	addDisabledButton(3, "Syri's Plan");
}

public function syriQuestTalkSyrisPlanRefuse():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“I don't know, Syri,”</i> you say. <i>“This seems like a bad idea.”</i>");
	output("\n\n<i>“I know! I know... believe me, if it was a good idea, I'd have done it all by myself! That's what I need you for. I can't do this by myself, but with you... I'm asking a lot here, but this is my friend's freedom on the line. I've gotta try.”</i>");
	output("\n\nSyri sighs, rubbing her forehead. <i>“Please, [pc.name]?”</i>");

	processTime(3);
	syriQuestGoNowMenu();
	addButton(6, "Still Refuse", syriQuestTalkSyrisPlanStillRefuse,undefined,"No means no, Syri.");
}

public function syriQuestTalkSyrisPlanStillRefuse():void {
	clearOutput();
	showSyri();
	author("Savin");
	if (pc.isNice()) output("<i>“I'm sorry, but no,”</i> you tell her, putting a hand on Syri's.");
	else output("<i>“No way,”</i> you say.");
	output("\n\nSyri slumps back on the couch, sighing hard. <i>“Yeah. Alright, you're right, Steele. This is just going to get me killed... if it's even real. I don't even know that this isn't some kind of prank. But if it isn't... damn it all. This is going to gnaw on me for the rest of my life.”</i>");
	output("\n\nThe ravenette slaps her hands on her knees and pushes herself to her feet. <i>“Thanks for the chat, Steele. I guess I'm gonna go turn in my resignation to those contractors and then get ready for the big tournament. Come swing by the bar sometime, okay?”</i>");
	output("\n\nThat's one request you can probably fulfil.");

	flags["SYRIQUEST_RESOLUTION"] = -1;
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function syriQuestTalkSyrisPlanAccept():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Okay,”</i> you say. <i>“I'm in.”</i>");
	output("\n\nSyri's eyes light up, and a big grin spreads across her face. <i>“<b>Fuck</b> yeah! Okay, I'm going to go get things set up. Get your shit together and meet me in the government building down planetside. Moonside? Whatever -- I'll meet you down there!”</i>");
	output("\n\nSyri leans over and gives you a great big hug, squeezing you until you can hardly breathe. When she's finished, Syri shifts her hands up and pushes her lips against yours, giving you a parting kiss before hopping to her feet and heading for the door.");
	output("\n\n<i>“See you soon!”</i> she calls, jogging back towards the space elevator.");
	output("\n\nOnce you hear the airlock cycling, you lean back into the couch and catch your breath for a few moments before getting up and turning your attention to the preparations you'll need to make...");

	flags["SYRIQUEST_STATE"] = 3;
	rooms["UVI H34"].addFlag(GLOBAL.NPC);
	generateMap();
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function syriQuestMeetOutsideElevator():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Steele! Hey!”</i> Syri calls, waving as you approach. <i>“There you are! I've got everything set up with the contractors. Hope you're ready for a job interview.”</i>");
	output("\n\n<i>“...What?”</i>");
	output("\n\nSyri grins and plants her hands on her hips. <i>“So the best way I could figure to get you inside the company's office was to set up a job interview. It's an excuse to get inside long enough for me to sneak you into one of the containers we're taking up to the research complex.”</i>");
	output("\n\nThis can only end well. You tell Syri to lead on, falling in behind her sweeping tail as she guides you out into the searing cold of the planet's surface. It's a blessedly short walk through the narrow, snow-swept alleys between the squat Irestead homes and businesses west of the government building. Whether it's for warmth or just companionship, Syri wraps an arm around your waist and pulls you against herself. She gives you a little smile, and you feel her tail curling around your [pc.leg].");
	output("\n\nThe contractor's office is only a few blocks away, but {even with your heat belt} you're shivering all the same by the time you arrive at the steps leading up to a square, one-floor office. A flickering holographic sign reading '<i>Hakon's Industrial Innovations, LLC</i>' sits above the door, alongside an animated image of a flexing, bearded huskar male with a hardhat and a toolbox in both hands.");
	output("\n\n Syri swipes an ID card across a reader next to the sliding glass-pane doors and ushers the both of you inside.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",syriQuestJobInterview);
}

public function syriQuestJobInterview():void {
	clearOutput();
	showMyrraAndSyri();
	author("Savin");
	output("There's a dozen huskar inside, a mix of men and women all with hefty figures and ashen fur. They're dressed in heavy winter gear and strapped with toolbelts and hardhats, just like the man pictured outside. Must be Syri's coworkers, getting ready for the day's work. Some of them look up and nod at Syri or give you questioning glances, but nobody says anything to either of you: they're too engrossed in their own conversations, laughing and teasing while they prep for the trip outside.");
	output("\n\n<i>“C'mon, sapient resources is just over here,”</i> Syri says, leading you down a hall off of the main entrance. At the end is another glass door, this time frosted over so that only vague shapes and shadows are visible on the other side. ");
	output("\n\nYour beautiful guide raps her fluffy knuckles on the metal frame, and is quickly answered by a voice from inside: <i>“Come in!”</i>");
	output("\n\nSyri slides the door open and gives you a gentle push into a small, warmly decorated little office with a comfortable-looking stuffed couch facing a desk that covered in little toys, smiling dolls, and a big bowl of candy. Sitting behind it is a particularly husky huskar woman, all plump curves and soft, plush pale flesh wrapped up in a white shirt that's been buttoned down almost halfway to make room for the massive rack of cleavage all but spilling out. A bright pink tie plunges down into the abyss between her breasts, drawing your attention up to a mane of silver-grey fur around her neck, beneath a rosy-cheeked face that's smiling wide at you.");
	output("\n\n<i>“Hello Ms. Dorna!”</i> the huskar chirps cheerfully, deactivating a small holoterminal and folding her hands on her desk. <i>“And you must be [pc.name]. Welcome to Hakon's Industrial Innovations. I'm Myrra, and I heard you were looking for a job.”</i>");
	if (pc.isMischievous() || pc.isBimbo()) output("\n\n<i>“Uh, yeah, sure. Why not?");
	else if (pc.isAss() || pc.isBro()) output("\n\n<i>“Sure, whatever,");
	else output("\n\n<i>“Yes ma'am,");
	output("”</i> you say, ");
	if (pc.isBiped()) output("swinging yourself onto the couch across from her.");
	else output("planting yourself on the ground across the desk.")
	output(" Syri takes a seat behind you, reclining back with her legs crossed and trying to look relaxed. She almost does a good job of it, save for the occasional nervous glance.");
	output("\n\nMyrra smiles and taps a button on her desk, bringing up another holodisplay. <i>“We're just gonna do a short lil' interview. Don't worry about a thing, darlin', I just need to know a lil' bit about you and your qualifications before we put you to work. Ms. Dorna here's vouched for you, after all, so I won't give you <b>too</b> much trouble. Though she didn't mention you were so cute!”</i>");
	output("\n\nThe huskar giggles and brings up a form on her terminal. <i>“Okay. First up: what's your experience with heavy machinery?”</i>");
	if (pc.isBimbo()) output("\n\n<i>“I like, handle big tools all the time!”</i>");
	else if (pc.isBro() || pc.biggestCockLength() >= 12) output("\n\n<i>“I pack big, heavy tools every day, baby.”</i>");
	else if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output("\n\nYou quickly run down all the various machines and industrial equipment you're certified with. It's a long list.");
	else output("\n\n<i>“Uh, lots?”</i> you lie.");
	output("\n\n<i>“Great!”</i> Myrra chirps. <i>“Have you ever worked in extreme climates before? As you can probably tell, working out in the Uvetan glaciers is pretty risky business without training and experience.”</i>");
	if (pc.isBimbo()) output("\n\n<i>“Oh, I like risky business!”</i> you giggle.");
	else if (pc.isBro()) output("\n\n<i>“I've got <b>plenty</b> of experience, baby.”</i>");
	else output("\n\nYou spend a moment describing some of the places you've had to adventure so far -- that might not be construction experience, but you've been in all sorts of conditions.");
	output("\n\nMyrra nods, typing. <i>“Okay, that's good to hear. Um, let's see, I guess we'll give you a pass on the qualifications. Now let's talk about your career here at Hakon's!”</i>");
	output("\n\nThe perky huksar scoots forward in her chair, a gesture that makes those massive sweater-puppies quake her her blouse. She must have caught your inevitable glances that way, because she smiles demurely and wags her tail. <i>“So... where do you see yourself in 5 years, [pc.name]?”</i>");
	if (pc.isBro() || pc.LQ() >= 75) output("\n\nWith your face between those tits would sure be nice...");
	else output("\n\nThere's some places you'd like to be...");

	rooms["UVI H34"].removeFlag(GLOBAL.NPC);
	generateMap();
	processTime(15);
	clearMenu();
	addButton(0,"Flirt",syriQuestJobInterviewSFlirt,undefined,"Flirt","This interview would be a lot more interesting -- and probably more likely to actually succeed -- with a little application of the Steele charm.");
	addButton(1,"Serious",syriQuestJobInterviewSerious,undefined,"Serious","Play it straight and just get through this interview.");
}

public function syriQuestJobInterviewSerious():void {
	clearOutput();
	showMyrraAndSyri();
	author("Savin");
	output("You answer her question about as close to what you think she wants to hear as you can. There's another fifteen minutes or so of questions, none of which are particularly challenging -- you guess Syri's word must actually carry some real weight. Or else they let unqualified newbies work in hazardous conditions all the time... then again, you don't hear anything about insurance while Myrra's running through things for you.");
	output("\n\nWhen the interview's finally over, the huskar H.R. girl compiles all the notes she's taken and tabs the terminal closed, returning her attention to you with a broad smile. <i>“Okey-dokey! I think that'll about do us. See, wasn't so bad! You'll want to talk to the shift boss about setting up your payment deposits, but I'm gonna go ahead and get you started today, if that's alright. You can ask him if you can start today, but usually we wait till the start of the week for new employees. Since you'll be sharing a supervisor, I'm sure Ms. Dorna can take you right to him before she heads out for her shift.”</i>");
	output("\n\n<i>“Sounds good,”</i> Syri says, jumping up and flicking out the sides of her coat. <i>“C'mon, [pc.name], I'll introduce you.”</i>");
	output("\n\nYou bid your farewells to Myrra and hop up to follow your guide. <i>“Stay safe out there!”</i> Myrra calls after you as the door slides shut.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",syriQuestJobInterviewOutro,false);
}

public function syriQuestJobInterviewSFlirt():void {
	clearOutput();
	showMyrraAndSyri();
	author("Savin");
	output("<i>“I can think of a few places... and a few places I'd like to be right now,”</i> you say, grinning at the husky ausar and letting your eyes drink in all that creamy cleavage she's showing off.");
	output("\n\nMyrra glances up at you from her terminal, cheeks flushed a rosy red. <i>“O-oh! Um, that's very sweet, but um, highly inappropriate!”</i>");
	output("\n\nYou stand up and saunter over to her desk, leaning across it close enough that you can feel Myrra's quickening breath on your [pc.skinFurScales]. <i>“That right? You gonna report me to sapient resources?”</i>");
	output("\n\nMyrra squirms, chewing her plush lips. Her already-floppy ears press against the side of her head until she comes to her conclusion: <i>“Well, I've got a personal policy against reporting cute " + pc.mf("boys","girls") + "... especially when they're coming on to little ol' me... though I think you forgot we've got company.”</i>");
	output("\n\nShe points behind you, to where Syri is sitting on the couch watching the proceedings. Or at least your [pc.butt] while you lean over the desk.");
	output("\n\n<i>“Oh, don't mind me,”</i> Syri grins, leaning back into the sofa. <i>“I'll just keep [pc.name]'s [pc.butt] warm...”</i>");
	output("\n\nMyrra makes a little sucking sound on her lips, and then pushes a button on her desk. The frosted glass door darkens to opaqueness and an audible click comes from the lock setting into place. When you glance back to the buxom huskar, she's already torn open her shirt, revealing the extra-large pink bra underneath that's already coming undone. You expedite it along, grabbing it in your teeth and yanking it off the big beauty's bountiful bosoms. She gasps, giggles, and reaches up to put her hands on your cheeks.");
	output("\n\nYou think she's going in for a kiss, but Myrra's got more on her mind that a makeout session. She pulls you down over the desk, mashing your face into the huge, meaty mounds of mammary, trapping you in there with the strength of a true viking hound-girl. All you can do is feel your hands' way up to her tits, grabbing the puffy pink nipples at their peaks and squeezing until Myrra relents with a moan.");
	output("\n\nA different pair of hands grab at your [pc.gear], stripping you while your mouth and hands explore the huskar's heavenly rack. By the time Syri's sinking her claws into your bare, swaying butt, you've got Myrra moaning like a bitch in heat, squirming in her chair as your hands molest her tits. Her tail thumps hard against the wall behind her, displaying her pleasure in the most primitive, bestial way an ausar slut can. ");
	output("\n\nConfident in your skills, you let your hands play down, gliding across the jiggling expanse of her plush belly. Your fingers sink into her, squeezing and kneading your way all the way down to the hem of her long skirts. The band is plenty stretchy, letting you easily wiggle a hand down under it. Myrra's panties are already soaked -- she's an ausar, after all, so it's no surprise she's practically leaking from the sexual stimulation. You press two fingers against the damp stretch of fabric separating you from her sex, feeling it practically cave into her eager pussy at the slightest bit of pressure. A little searching up that sultry cleft and you find a thick, hot bud of a clit bulging from the crown of her cunny, so easy to encircle with your fingers. You start to rub and flick it through the sheer, soaked fabric of Myrra's panties and are instantly rewarded by gasping cries from above, and a sudden deluge of thick, musky fluids down her thighs.");
	output("\n\n<i>“Almost makes me miss having a pussy,”</i> Syri laughs, slapping your [pc.butt] hard enough to rock you forward. <i>“Almost. So... you gonna help drag this big bitch on the desk so I can get in on the action, or am I just gonna have to make my own fun back here?”</i>");

	processTime(15);
	clearMenu();
	addButton(0,"Get Plowed",syriQuestJobInterviewGetPlowed,undefined,"Get Plowed","Syri's fine right where she is... with free access to your [pc.asshole].");
	if (pc.hasCock()) addButton(1,"Spitroast",syriQuestJobInterviewSpitroast,undefined,"Spitroast","Pull the huskar babe onto the desk, and go at her from both ends.");
	else addDisabledButton(1,"Spitroast","Spitroast","You need a penis for this.");
}

public function syriQuestJobInterviewGetPlowed():void {
	clearOutput();
	showMyrraAndSyri(true);
	author("Savin");
	output("\n\n<i>“I like you back there,”</i> you tell her, wiggling your hips against the distinct bulge forming her pants. ");
	output("\n\nYou hear Syri laughing, and the heavy <i>thunk</i> of her pants dropping to the ground. In the same moment, you feel a thick, throbbing shaft of hot cockflesh dropp into the crack between your cheeks. Something warm and wet splats across it, drooling off Syri's dick and onto the ring of your [pc.asshole], smeared across it by the ausar's pointy prickhead. ");
	output("\n\nYour heart jumps in your chest, fluttering with anticipation as the knotty shemale drags her cock back through your crack, aligning her tapered tip with your [pc.asshole]. Practically trembling with buttlust, you bury your head deep into Myrra's cleavage, using her tits like the huge, bouncy pillows they are and nibbling on her nipples until you feel that wonderful, swelling pressure start pushing in on your backside.");
	output("\n\n<i>“I'd say 'bite the pillow,' but it looks like you're way ahead of me,”</i> Syri growls, slapping your ass and settling her hands on your hips, holding you nice and steady. <i>“Hey Myrra, how high's 'Can [pc.heShe] take a dick' on your little list? Cuz [pc.name] here's a god-damn professional.”</i>");
	output("\n\n<i>“Just under 'eating pussy,' I'd say!”</i> the huskar breathlessly pants, stroking your [pc.hair]. <i>“How 'bout it... a little rug-munching for the job?”</i>");
	output("\n\nWell, if she's gonna twist your arm... ");
	output("\n\nYou pull yourself out of Myrra's tits, just long enough for the husky ausar to stand up, turn around, and spread her cheeks with her hands. Her tail lifts, brushing across your [pc.face]; when it's gone, you're left with a picturesque view of Myrra's pussy, peeking out from the panties stretched between her thighs and leaking her blatant lusts in thick rivers that tempt your [pc.tongue] out. You follow one of those lurid deltas up to its source, poking your tongue into the meaty folds of Myrra's twat.");
	output("\n\nNo sooner have you done so than the pressure on your asshoel breaks, and you feel yourself being stretched open around a thickening spear of canine meat. A gasping curse escapes your [pc.lips] as Syri slowly, forcefully plunges into you. One of her hands plays across the back of your head before locking her claws around your scalp and pushing your forcefully into Myrra's ass, driving your [pc.tongue] deep into the huskar's sodden slit.");
	output("\n\n<i>“That's the stuff!”</i> Syri growls into an ear, leaning into you with her tits pressing into your back. <i>“Squeeze that ass down for me.”</i>");
	output("\n\nYou aren't doing it on purpose, but being ass-fuccked just as that effect on you. Your body clenches and squeezes completely on reflex, trying at once to push the invading spear of dominant dickmeat out... and then to draw it in, ecstatic with pleasure. God damn, she fucks you so good!");
	output("\n\nAnd you're passing it on to Myrra, drilling into her with wild abandon. You know she's cum at least once, but without being able to see her face, all you have to go on is the constant chorus of moans and gasps and shrill little cries you work out of her. That's motivation enough to keep tongue-fucking her, burying yourself into that sweet, jiggly butt while Syri plows into yours.");
	output("\n\nYour raven-haired lover holds you tight, wrapping her arms around your [pc.chest] as her hips hammer your [pc.butt], harder and faster with every thrust. And with every blow, you feel her burgeoning knot slam against your [pc.asshole], forcing you to open just a little bit wider... take a little bit more of its crushing girth. She's like a damn battering ram, relentless in her assault on the closed gates of your ");
	if (silly && !pc.hasVagina()) output("ass-pussy");
	else output("ass");
	output(". Eventually, inevitably, you have to yield: with a ragged cry of pleasure, Syri's bitch-breaker forces its way inside you. It feels like you're being split apart from the inside, but cascades of pleasure rather than pain rock your body{cock: -- especially as the hefty tie presses down hard against your anal g - spot. Your thus - far untouched cock jumps, leaking pre as Syri grinds against your prostate}. ");
	output("\n\nSyri's breath is a hot, staccato rhythm against your neck, growing more desperate as her knot settles inside you. Your entire ass is one big onahole for her, completely enveloping her cock and locking her in place. All she can do is make rapid little thrusts, smacking her thighs into your [pc.butt] until the sound is all you can hear besides the moans all three of you are making.");
	output("\n\n<i>“You're gonna be leaking this load all the way to Akkadi,”</i> Syri breathes, biting at your [pc.ear]. <i>“Get ready for it.”</i>");
	output("\n\nGods, you're ready! You whimper a little moan for her, pushing back on that turgid bitch-stick to get it as deep as you can before the throbbing you feel through it escalates to full-on cumshot. And just in time! You feel an eruption of hot, sticky seed spilling out into your ass, accompanied by bestial grunts from the ausar mounting you while she inseminates your asshole. ");
	output("\n\nThe sudden feeling of fullness, of being made Syri's bitch in such a primitive, animalistic way, drives you crazy with lust. ");
	if (pc.hasCock()) output("Your cock's gotten rock-hard from the pounding, and the injection of seed inside you is enough to push you over. Arching your back and moaning into Myrra's muff, you feel your [pc.cock] clench, then release, spilling [pc.cum] down your [pc.legs] and onto the floor. ");
	output("Your fingers desperately cling to the chubby flanks in front of you, concentrating on the pussy pressed against your lips, and glaze of fem-cum smeared across your [pc.face]. You wrap your [pc.tongue] one last time around the needy nub of Myrra's clit, suckling on the hyper-sensitive mound until the huskar's jiggling from ass to shoulders, quaking with pleasure and gasping wordless little cries that sound almost like your name. You can feel her lips clenching below you, smearing your chin with their sultry juices until a shrill cry erupts throughout the room, and a squirt of fem-cum squirts all across your [pc.chest].");
	output("\n\n<i>“Fuck!”</i> Myrra manages to scream. <i>“Oh! Oh my word... I'm breathing so hard...”</i>");
	output("\n\n<i>“Don't faint, girl,”</i> Syri says, reaching over you to squeeze Myrra's plush behind. <i>“We can't scrape you up off the floor while we're knotted.”</i>");
	output("\n\nMyrra giggles, peeling herself off of your [pc.face] and sinking down into her chair again. Cum and juices squelch lewdly underneath her as she breathlessly taps open the holo-terminal again. <i>“Let's just put a big, fat 'approved' on this application...”</i>");
	output("\n\nSyri grins up at her, resting her chin on you. <i>“Atta girl... and hey, [pc.name]. Up here, bottom bitch.”</i>");
	output("\n\nYou feel a tap on the top of your head, prompting you to twist around to look at Syri -- and get yourself ambushed with a kiss. Her tongue laps around your [pc.lips], tasting the nectar still warm on them, before pressing into your mouth to tangle with your own.");
	output("\n\nNow just to wait until Syri's knot comes down enough for you to move...");

	pc.orgasm();
	pc.loadInAss(chars["SYRI"]);
	chars["SYRI"].orgasm();
	processTime(30+rand(15));
	clearMenu();
	addButton(0,"Next",syriQuestJobInterviewOutro);
}

public function syriQuestJobInterviewSpitroast():void {
	clearOutput();
	showMyrraAndSyri(true);
	author("Savin");
	output("Well, now that is a tempting offer...");
	output("\n\nYou grab Myrra's broodmareish waist and, with a little help from the woman herself, pull her out of her seat. You step back, making room for Myrra while she hooks her claws into her skirt and pulls it down. A glance over your shoulder shows Syri's jaw go wide, just for a second, when the entire enormity of the huskar's massive backside comes into view. To full, flawless moons of pale puppy-flesh jiggle obscenely as Myrra snaps the band of her skirt down right where ass ");
	if (silly) output("meats"); 
	else output("meets");
	output(" thigh.");
	output("\n\n<i>“Pinch me, I'm dreaming,”</i> Syri murmurs under her breath, staring wide-eyed at the huskar's plump derriere.");
	output("\n\nMyrra gives you both a look over her shoulder, wagging her tail while she slides her skirt and panties the rest of the way off. She bends way down, low enough to touch her toes, which has the surely-intentional effect of showing off the puffy pink puss hidded deep between those lush mounds of buttflesh. Myrra's already soaked through from your foreplay, and her sex glistens wetly in the stale office light.");
	output("\n\nSyri grunts, and you hear the familiar <i>thunk</i> of her pants hitting the floor. <i>“Fuck it, that ass is mine,”</i> the shemale growls, stepping around the desk and grabbing Myrra by the waist. The huskar just moans for her, letting Syri push her against the desk and then, with both hands on Myrra's ass, hefts her up onto it. Myrra's legs lock around Syri's hips, pulling the dickgirl flush against her so that her big red rocket flips onto the plump swell of her belly. ");
	output("\n\n<i>“Every been assfucked before?”</i> Syri says, putting a hand around Myrra's neck and pushing her back down on the desk. <i>“You always look so pure and innocent, even with that divine body... I can't believe [pc.name] managed to talk your panties off.”</i>");
	output("\n\nMyrra giggles, wrapping her arms under her mammoth tits. <i>“Really? I thought the whole office thought I was a slut!”</i>");
	output("\n\nThe ravenette shemale leans in, tightening her grip on the pale huskar. One of her hands slips down between her legs, and you're treated to the sight of Myrra's whole voluptuous body tensing, quivering with anticipation. <i>“And are you?”</i> Syri asks breathily, pumping her arm down between Myrra's meathy thighs.");
	output("\n\n<i>“How 'bout you open that drawer and find out?”</i>");
	output("\n\nOne of Myrra's feet claw at a drawer, guiding Syri to open it up, reach inside, and pull out a little bottle of lube. Syri grins, showing her fangs as she pops the bottle open and dumps the contents onto her dick, smearing it across her throbbing red dogflesh and Myrra's belly where it's resting.");
	output("\n\nWhile they're getting ready, you figure it's about time for you to take advantage of the huskar's plump lips and big, wet tongue. You plant your hands on Myrra's huge breasts, pushing her back down on the desk so that her mouth is more or less level with your crotch. She blinks up at you, then licks her lips as her big blue eyes settle on your [pc.cock].");
	output("\n\n<i>“That looks tasty,”</i> she moans, reaching up and wrapping her hands around your shaft. <i>“Can I give it a kiss?”</i>");
	output("\n\nYou nod and shift your hips, planting your [pc.cockHead] directly over Myrra's mouth. She puckers up, planting a wet kiss directly on the crown of your cock, flicking her tongue around your cumslit until she milks out the first little leak of watery [pc.cumColor]. The way she moans hungrily, you don't doubt she'd be content to make out with your dick for a good long while, but your wing-dickgirl's got your back: she's been busy aligning the tip of her bitch-stick to Myrra's asshole. Giving you both a wink, Syri pushes forward with a slow but inexorable thrust. The huskar's mouth snaps open in a hoarse cry of pleasure, which you quickly silence with your own dick, thrusting down into her mouth. Myrra's tongue grazes the underside of your shaft as you pump down the tight tunnel of her throat, filling her with every inch of your dick");
	if (pc.balls > 1) output(" until your [pc.balls] are resting against her forehead");
	output(".");
	output("\n\nSpeared from both ends, Myrra writhes on the desk, arching her back and grabbing at the succulent mounds of her breasts. One of her hands delves down to rub the neglected mound of her vulva, plugging her one remaining open orifice with a pair of fluffy fingers. You can feel her throat clenching around your girth, squeezing hard around your cock until you pull back, giving the busty babe a much-needed break for breath. Your [pc.cock] comes away slathered in spit, bridged to her lips by trembling ropes that glisten in the office lights.");
	output("\n\nHungry slut that she is, Myrra's already panting your name before she's caught her breath, pawing at your thighs and moaning with lust -- or maybe that's from feeling Syri's dick spearing into her ass, deep enough that her whole body jiggles with the impact of knot against assflesh. Syri's grunting too, digging her claws into the huskar's breeder hips and thrusting herself deep in Myrra's ass. ");
	output("\n\n<i>“God damn, this ass is sweet,”</i> Syri growls, pumping her hips a little faster. <i>“Makes me wanna... wanna...”</i>");
	output("\n\n<i>“Don't you dare!”</i> Myrra yelps, grabbing Syri by the wrist. <i>“I've gotta sit down all day!”</i>");
	output("\n\nSyri grins, reaching across and sinking her fingers into one of Myrra's breasts. <i>“Well, where am I supposed to blow this load then? You got about... ten seconds... to decide.”</i>");
	output("\n\nFor such a big girl, Myrra moves fast when she wants to. The pudgy puppy rolls off the desk and onto her knees, wrapping her fingers around your [pc.cock] and Syri's on either side of her. Her tits bounce and jiggle obscenely as she settles into place, slurping on your [pc.cockHead] while she jerks Syri's throbbing shaft. Syri was pretty damn close on her promise, it turns out, and Myrra's barely gotten situated before you see the shemale's knot bulge between Myrra's fingers, and then thick ropes of white spurt out across the huskar's cheeks.");
	output("\n\nMyrra gasps, then giggles as steamy streaks of cream splatter her face, then start dropping down onto her tits. For her part, Syri shudders and grabs the desk for support, weakly thrusting her hips against the tight grip of the lusty huskar's hand. Her knot twitches, trying to bury itself into Myrra's fist. All it accomplishes is making more cockmilk leak out onto Myrra's tits.");
	output("\n\nWhile Syri's busying blowing her load, the huskar's attention turns back to you, focusing those big blue eyes on your [pc.cock]. She lets her tongue play across your glans, circling your crown before she slurps down the first inches of dickmeat. After the first oral session, you're already on edge: it doesn't take long for the hungry moans and slurping sucks coming from down low to make your [pc.cock] throb with urgent need, swelling in Myrra's mouth. ");
	if (pc.balls > 1) output("She squeezes your balls, massaging the churning orbs to help the impending eruption along. ");
	output("You let one of your hands play across her silky silver hair, urging Myrra down the remaining length so that you're fully buried in her throat when the inevitable orgasm finally hits.");
	output("\n\nThe first wave of [pc.cum] shoots straight down Myrra's throat. Her eyes go wide, and you hear a husky moan around your dick as she drinks down your spunk -- the first few spurts, at any rate. After that, though, she rears her head back, dragging your spasming rod out between her plush lips and lets your [pc.cock] fall into her hands, shooting the rest of the load across her tits and the mane of fur around her neck.");
	output("\n\n<i>“Oh, pearl necklace! How sweet!”</i> Myrra giggles, licking an oozing drop of [pc.cumColor] off one of her claws. <i>“You sure know how to state your... qualifications... [pc.name]. I think you'll be an excellent fit here at Haskarn's.”</i>");
	output("\n\n<i>“Well that's a relief,”</i> Syri sighs, slumping down into Myrra's office chair. After a moment, she gets a clever little grin and pats her thigh, beckoning Myrra over. <i>“Why don't you sit down on my lap and we can finish up that application...”</i>");

	pc.orgasm();
	chars["SYRI"].orgasm();
	processTime(30+rand(15));
	clearMenu();
	addButton(0,"Next",syriQuestJobInterviewOutro);
}

public function syriQuestJobInterviewOutro(PostSex:Boolean = true):void {
	clearOutput();
	author("Savin");
	if (PostSex) {
		showMyrraAndSyri();
		output("<i>Some time, a little more hands-on interviewing, and one completed application later...</i>");
		output("\n\n<i>“Alrighty,”</i> Myrra sighs, wiping a little sweat off her brow. <i>“That's all taken care of. Consider yourself employed. If you want to go down to the landing pad, you can ask your shift supervisor about starting today. Otherwise, we'll see you at the start of the week, [pc.name]. And as for you, Ms. Dorna... I'll see you in my office when you get back from your shift.”</i>");
		output("\n\nSyri grins. <i>“Yes ma'am.”</i>");
		output("\n\nThe two of you stagger out of the H.R. office, still adjusting your clothes and gear. ");
		output("\n\n<i>“Well that went better than expected,”</i> your lover laughs, running a hand through the tangled mess her raven hair's become. <i>“Ah man, I need to take you places more often. You're a fun magnet... and a smoking hot intergalactic sex symbol who's absolutely irresistible to all us ausar girls.”</i>");
		if (flags["ANNO_SEXED"] > 0) output("\n\nShe's laughing, but at the rate you're going...");
		output("\n\n");
	}
	else showSyri();
	output("Syri puts an arm around your shoulders and leads you deeper into the building. <i>“The hovercraft bay is just down here. Now I need you to make yourself scarce pretty much as soon as we get inside. Myrra put you in the system, so we won't be triggering any biometric alarms... but it'll be better if nobody notices you come in, and never come out, y'know?”</i>");
	output("\n\nYou nod. ");
	output("\n\n<i>“Alright! Let's get out there, then.”</i>");

	processTime(5);
	clearMenu();
	addButton(0,"Next",syriQuestHovercraftHangar);
}

public function syriQuestHovercraftHangar():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("The room Syri leads you to next is a massive subterranean hangar at the bottom of a flight of stairs. A heavy-duty cargo hovercraft is parked in the middle with doors folded up under its wings, revealing a cargo bay stuffed full of crates and containers. Most of the workers you saw on your way in have migrated down to the launch pad, helping to load the hovercraft up in preparation for the day's work.");
	output("\n\nA particularly muscular, bearded huskar is snapping orders between glances at a dataslate in his gold-furred hands. Must be the supervisor you were told about... and who you need to avoid for Syri's half-baked plan to work.");
	output("\n\nWondering how you let yourself be talked into this (and not for the first time), you duck out from behind Syri and into the shadows behind one of the containers waiting to go aboard.");
	output("\n\nWhile you make yourself scarce, Syri saunters up to her super with a smile and a wag of her tail. <i>“Hey boss! What's the good word?”</i>");
	output("\n\n<i>“Syri, glad you could join us,”</i> the blonde huskar says, clapping her shoulder. <i>“Where's our newest recruit? I though [pc.heShe]'d be joining us.”</i>");
	output("\n\n<i>“Nah,”</i> Syri lies. <i>“[pc.HeShe]'s just taking a look around the facility before heading home. I think [pc.heShe] said [pc.heShe]'d like to start working at week's start. Keep things simple on the payroll.”</i>");
	output("\n\nThe supervisor laughs heartily. <i>“I like [pc.himHer] already! Alright, go help Auder move that fabricator aboard, eh?”</i>");
	output("\n\nThe two move off towards the other side of the hangar, giving you a few moments with nobody looking to decide what you're going to do about disappearing...");
	output("\n\nThere's several containers all around the place, but most of them are magnetically locked. ");

	processTime(15);
	clearMenu();
	if (pc.hasPerk("Stealth Field Generator")) addButton(0,"Stealth Field",syriQuestStealthField,undefined,"Stealth Field","Turn on your Stealth Field Generator and sneak aboard.");
	else addDisabledButton(0,"Stealth Field","Stealth Field","You need the Stealth Field Generator perk for this.");
	addButton(1,"Lock Bypass",syriQuestLockBypass,undefined,"Lock Bypass","Try and bypass one of the maglocks so you can hide inside a container.");
}

public function syriQuestStealthField():void {
	clearOutput();
	clearBust();
	showName("\nHANGAR");
	author("Savin");
	output("Well, this'll be easy. You click on your stealth field generator and shimmer out of sight, blending into the shadows. While you're hidden from view, you quickly make your way across the hangar and duck into the cargo hold underneath the hovercraft's main fuselage. The next few minutes are spent being very quiet as you're all but entombed behind other crates and containers, boxing you in until you have to curl up on yourself to fit.");
	output("\n\nBut you've gone undetected! You let out a long-held breath and press your eye to one of the gaps between the containers, watching the remaining workers file aboard. They have the luxury of a warm trip inside the passenger deck, and seem all too happy to get inside. You count Syri among their number, trying to act natural. The supervisor is the last man aboard, reaching up to pull down the bay doors.");
	output("\n\nJust as he's about to close up, though, you hear a woman's voice from outside: <i>“Hold up!”</i>");
	output("\n\nIt's a strong, booming voice. Loud and commanding. The blonde huskar pauses mid-motion, giving time for the speaker to step aboard. She's a tall, full-figured woman zipped up in a skin-tight blue Akkadi jumpsuit that flatters her ample curves in all the right ways. Though she's got the perky canine ears, the woman's also got a pair of sweeping black horns growing from her brow, as well as bronzed skin and dark red eyes. Definitely not a huskar... a halfbreed?");
	output("\n\n<i>“Room for one more?”</i> the woman asks, hefting a bulging rucksack on her shoulder.");
	output("\n\n<i>“Of course, Commander,”</i> the huskar man answers, stepping out of her way. <i>“Climb aboard! Enjoy your vacation?”</i>");
	output("\n\nThe woman laughs. <i>“It's hard </i>not<i> to enjoy a week at a Heloith resort! After all those massages and all the pool time, I feel more loose and limber than I have in years.”</i>");
	output("\n\n<i>“Oh, is that all that's put a spring in your step?”</i> he teases, pulling the door closed behind the 'commander.' ");
	output("\n\nShe grins and chunks her duffle bag down on the deck. <i>“Well, all the handsome tourists treating me like a piece of the local meat didn't hurt, either. Perks of being half-dzaan!”</i>");
	output("\n\nThat seems to trigger some kind of in-joke, and both the commander and supervisor laugh on their way up the stairs to the passenger deck. Now that everyone's out of earshot, you sigh and sit down, feeling the deck start to rumble underneath you. It isn't much longer before the temperature starts to drop, and you can feel the hovercraft start zooming through the stormy Uvetan skies...");

	processTime(15);
	clearMenu();
	addButton(0,"Next",syriQuestArriveAtAkkadiBase);
}

public function syriQuestLockBypass():void {
	clearOutput();
	clearBust();
	showName("\nHANGAR");
	author("Savin");
	output("You crouch down next to one of the electronic locks and start fiddling around. You've only got a few seconds to work before everyone's attention turns to you -- enough for ");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output("36");
	else output("27");
	output(" rewires.");
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
		RotateMinigameModule.MAX_MOVES, (pc.characterClass == GLOBAL.CLASS_ENGINEER) ? 36 : 27,
		5, 5, 
	[
		g | s    ,	i | n | e,	l        ,	i | n | e,	g | s    ,
		i | s | w,	i | n | w,	i | n | e,	i | n | s,	i | s | e,
		i | n | w,	i | s | e,	g | n | s,	i | s | e,	i | n | s,
		i | e | w,	l        ,	i | n | w,	i | s | w,	i | s | w,
		i | n | w,	g | w | e,	i | n | s,	i | e | s,	i | e | w    
	]);
}

public function syriQuestLockBypassSuccess():void {
	clearOutput();
	showName("\nHOVERCRAFT");
	author("Savin");
	output("It takes you the barest few seconds to penetrate the lock's security, and you're just able to scarper inside the container and close the door behind you before anyone comes back your way. Letting out a sigh of relief, you look around your new surroundings: you've got a few feet of room to move around, wedged between the metal doors and several pallets full of metal plates all strapped together.");
	output("\n\nYou're about to sit down when you hear several footfalls pass by outside. Must be the crew coming aboard. Once they've retreated out of earshot, and you feel the hovercraft start to rumble under your [pc.feet]. You risk the chance to slide the container door open a hair's breadth. Peeking out, you're treated to the sight of the supervisor, apparently the last man aboard, reaching up to pull down the bay doors.");
	output("\n\nJust as he's about to close up, though, you hear a woman's voice from outside: <i>“Hold up!”</i>");
	output("\n\nIt's a strong, booming voice. Loud and commanding. The blonde huskar pauses mid-motion, giving time for the speaker to step aboard. She's a tall, full-figured woman zipped up in a skin-tight blue Akkadi jumpsuit that flatters her ample curves in all the right ways. Though she's got the perky pointed ears, the woman's also got a pair of sweeping black horns growing from her brow, as well as bronzed skin and dark red eyes. Definitely not a huskar... looks more like a dzaan. Maybe a halfbreed?");
	output("\n\n<i>“Room for one more?”</i> the woman asks, hefting a bulging rucksack on her shoulder.");
	output("\n\n<i>“Of course, Commander,”</i> the huskar man answers, stepping out of her way. <i>“Climb aboard! Enjoy your vacation?”</i>");
	output("\n\nThe woman laughs. <i>“It's hard </i>not<i> to enjoy a week at a Heloith resort! After all those massages and all the pool time, I feel more loose and limber than I have in years.”</i>");
	output("\n\n<i>“Oh, is that all that's put a spring in your step?”</i> he teases, pulling the door closed behind the 'commander.' ");
	output("\n\nShe grins and chunks her duffle bag down on the deck. <i>“Well, all the handsome tourists treating me like a piece of the local meat didn't hurt, either. Perks of being half-dzaan!”</i>");
	output("\n\nThat seems to trigger some kind of in-joke, and both the commander and supervisor laugh on their way up the stairs to the passenger deck. Now that everyone's out of earshot, you sigh and sit down, feeling the deck rumble as the hovercraft takes off. It isn't much longer before the temperature starts to drop, and you can feel the hovercraft start zooming through the stormy Uvetan skies...");

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
	output("\n\nTrying not to give yourself away, you turn around and face the bearded supervisor. He's smiling at least -- maybe he didn't see anything. But he saw you, which means there's no hiding now.");
	output("\n\nYou nod to him and extend your hand, introducing yourself. He shakes it vigorously, locking you in a crushingly strong grip. ");
	if (pc.LQ() >= 75) output("You give as good as you get, though -- enough to make the huskar's eye twitch in vexation. ");
	output("Over his shoulder, you catch a glimpse of Syri turning positively pale, tucking her tail between her legs.");
	output("\n\n<i>“Welcome aboard,”</i> your supervisor continues. <i>“We've still got a few minutes before we dust off. Why don't I give you the grand tour of our facilities here?”</i>");
	output("\n\nYou try and bluff up some excuses, but the man won't take no for an answer. You end up spending this next twenty or so minutes being led around the hangar, being shown the various high-tech equipment Haskarn's has on hand, and having to try your hand at using more than a few of them. Syri is always a few paces behind, never getting involved but never letting you out of her sight, either. Guess she's trying to play it cool.");
	output("\n\n<i>“So, Syri says you're lookin' to start on Monday, eh?”</i> the man says as he turns off a huge steel-rending machine you were just cajoled into using. <i>“Too bad, you've got a knack for this kind of work. Well, why don't I walk you out?”</i>");
	output("\n\nUh oh. Time to improvise! ");
	if (pc.isBimbo()) {
		output("\n\n<i>“Oh, what a gentleman!”</i> you purr, running a finger around the huskar's chest carpet. He grins and puts a big, strong hand on your back, ready to guide you out. Well, you know one good way to keep a man distracted...");
		output("\n\nBefore he gets you outside, you get him into the bathroom and thrust your head down on his cock, slurping up red ausar cockflesh with lusty gusto. The huskar man is big and strong, but you know how to handle him; he's a whimpering puppy in your hands before too long, blowing load after load down your throat. By the time you're done with the bearded viking hound, he's slumped back on a toilet with his chest heaving, body slicked with sweat.");
		output("\n\n<i>“See ya Monday, big boy!”</i> you call, blowing him a kiss as you sashay out... and right back where you were trying to be. Everyone else on the construction crew has packed up and boarded the hovercraft. While the super is recovering, you do too, sneaking into one of the cargo crates and sealing yourself in. A few minutes later, you hear your new boy-toy stagger inside, close the doors, and head upstairs. Once he's gone, the craft starts rumbling, and you feel your cum-stuffed stomach lurch. Takeoff!");
	}
	else if (pc.isBro()) {
		output("\n\n<i>“Nah, bro,”</i> you say, leaning back against the machine. <i>“All this stuff's got me too pumped! Let's get out there already!”</i>");
		output("\n\nYour new super grins. <i>“That's the spirit! C'mon, hop in and we'll find somewhere you can pitch in when we get to today's site.”</i>");
		output("\n\nWell, this sure isn't the way you and Syri wanted this to go, but... at least you're gonna get to the Akkadi base. That's something.");
		output("\n\nOnce you're aboard, the ship shudders and takes off. You're escorted upstairs to the crew deck, a simple affair of benches and harnesses for the workers to sit on for the short overland flight. You find a seat in the back, and are quickly joined by Syri.");
		output("\n\n<i>“Well shit,”</i> she sighs.");
		output("\n\nYou nod.");
		output("\n\nAbout twenty minutes passes in flight. The workers talk amongst themselves, and from your position in the back of the shuttle, it seems like most of them forget about you. Near the flight's end, you and Syri exchange a glance, realizing it's time to act or accept defeat.");
		output("\n\n<i>“Just follow my lead,”</i> Syri whispers into your ear. Before you can answer, your lover swings herself into your lap and grabs you by the ");
		if (pc.hasArmor()) output("[pc.armor]");
		else output("shoulders");
		output(". With a low, hungry growl, she thrusts her tongue into your mouth. Her tail arches, swaying back and forth in the unmistakable ausar sign of pleasure.");
		output("\n\nHard to say no to this! You wrap your arms around Syri's waist, holding her steady while she fucks your mouth. That draws a few gazes... and when Syri hauls you to your [pc.feet], they watch her all but drag you out of the crew deck and back down to the cargo hold. Syri slams you back against a container like she's ready to mount you then and there... until her hand swipes an I.D. card across a reader, and the door hisses open.");
		output("\n\n<i>“Hide, idiot,”</i> she grunts, and pushes you inside. Before you can talk back, the door closes behind her. You sigh and slump down in the dark, hoping nobody comes looking for you.");
	}
	else if (pc.isNice()) {
		output("\n\n<i>“Uh, actually, all this has me ready and rarin' to go!”</i> you lie. <i>“Maybe I should start today!”</i>");
		output("\n\nYour new super grins. <i>“That's the spirit! C'mon, hop in and we'll find somewhere you can pitch in when we get to today's site.”</i>");
		output("\n\nWell, this sure isn't the way you and Syri wanted this to go, but... at least you're gonna get to the Akkadi base. That's something.");
		output("\n\nOnce you're aboard, the ship shudders and takes off. You're escorted upstairs to the crew deck, a simple affair of benches and harnesses for the workers to sit on for the short overland flight. You find a seat in the back, and are quickly joined by Syri.");
		output("\n\n<i>“Well shit,”</i> she sighs.");
		output("\n\nYou nod.");
		output("\n\nAbout twenty minutes passes in flight. The workers talk amongst themselves, and from your position in the back of the shuttle, it seems like most of them forget about you. Near the flight's end, you and Syri exchange a glance, realizing it's time to act or accept defeat.");
		output("\n\n<i>“Just follow my lead,”</i> Syri whispers into your ear. Before you can answer, your lover swings herself into your lap and grabs you by the ");
		if (pc.hasArmor()) output("[pc.armor]");
		else output("shoulders");
		output(". With a low, hungry growl, she thrusts her tongue into your mouth. Her tail arches, swaying back and forth in the unmistakable ausar sign of pleasure.");
		output("\n\nHard to say no to this! You wrap your arms around Syri's waist, holding her steady while she fucks your mouth. That draws a few gazes... and when Syri hauls you to your [pc.feet], they watch her all but drag you out of the crew deck and back down to the cargo hold. Syri slams you back against a container like she's ready to mount you then and there... until her hand swipes an I.D. card across a reader, and the door hisses open.");
		output("\n\n<i>“Hide, idiot,”</i> she grunts, and pushes you inside. Before you can talk back, the door closes behind her. You sigh and slump down in the dark, hoping nobody comes looking for you.");
	}
	else if (pc.isMischievous()) {
		output("\n\nYou follow the huskar out of the hangar, almost all the way to the door, before making a quick excuse about needing to go to the bathroom. He checks the holoband on his wrist and shrugs, telling you to let yourself out just down the hall here. You duck into the bathroom, wait a minute for the sounds of his footsteps to recede, and then double back, back to the hangar. You just manage to slip into the other side of the hovercraft's cargo bay doors before they seal up, and you watch the supervisor and a woman in an Akkadi uniform step up into the crew cabin. When they're gone, the ship seals and the deck rumbles unde your [pc.feet], finally lifting off.");
	}
	else {
		output("\n\n<i>“Sure,”</i> you say, following the huskar out of the hangar. About halfway down the entrance hallway, you realize that there's nobody around and no security cameras in this particular stretch. Too bad for this guy. You give him a quick smack on the back of the head, catching his body before he can collapse in a big, noisy pile of ausar man-meat. There's a janitorial closet nearby, just big enough for you to toss him into, tied up and gagged with some spare rags.");
		output("\n\nOnce he's secured, you head back the hangar. Looks like in your absence, everybody's boarded the craft, leaving you with plenty of time to get aboard and find somewhere to hide. The hovercraft waits a good little while, apparently for the super to return, but eventually you feel the deck shudder under your [pc.feet] as it lifts off. Work waits for no man.");
	}
	
	flags["SYRIQUEST_LOCK_BYPASS"] = 2;
	processTime(30);
	clearMenu();
	addButton(0,"Next",syriQuestArriveAtAkkadiBase);
}

public function syriQuestArriveAtAkkadiBase():void {
	clearOutput();
	clearBust();
	showName("\nHOVERCRAFT");
	author("Savin");
	if (pc.willTakeColdDamage()) {
		output("The journey to the Akkadi base is miserable beyond words. Shortly after takeoff, all the heat drains out of the cargo hold, leaving you to freeze your ass off in the Uvetan cold. You can barely feel your body, and you're trembling uncontrollably. ");
		pc.HP(-Math.round(pc.HPMax()/2));
		if (pc.HP() < 1) pc.HP(1);
	}
	else output("The journey is boring, spent playing around on your Codex between bouts of paranoia, listening for footsteps that never come.");
	output("\n\nEventually, the ship shudders, coming to a halt and slowly lowering to the ground. When it lands, you're jostled awake and alert, just in time to hear the construction crew start filing down from above. You get as quiet as you can, peering out from your hidey-hole as the pack of huskar gather at the door. It opens with a rush of frigid air and blinding light, making even the extra fluffy ausar shudder and complain. Still, they start filing out until only Syri is left aboard.");
	output("\n\nWhen she's sure nobody's watching, she quickly comes over to where you're hiding and whispers, <i>“Okay. Just chill out in there for a bit. I'll call you when I'm about to cut the power. You're only going to have a few seconds to bolt into the facility. You'll have to run across the skeleton of the bridge, then go straight through the big doors. Try not to enjoy the warmth in there too much, okay?”</i>");
	output("\n\nAnd what's she going to be doing while you're snooping around inside?");
	output("\n\n<i>“I'm gonna be causing as much of a distraction as possible,”</i> she laughs. <i>“I'll try and keep the power off as long as I can... but if you see any security stations, a little sabotage from inside would be a good plan.”</i>");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) {
		output("\n\n<i>“Are you sure you know what you're doing?”</i> you ask. You <i>have</i> to ask at this point. ");
		output("\n\n<i>“Yeah, 'course,”</i> Syri counters. She turns towards the exit, saying over her shoulder, <i>“Just trust me! I've got your back!”</i>");
		output("\n\nThis plan does not inspire confidence, but you're already a ");
		if (pc.gooScore() > 3) output("goo");
		else output("meat");
		output(" popsicle in a cargo hold in the ass end of nowhere, so... guess you're going along with it.");
	}
	else output("\n\nGuess you'll just have to trust that Syri knows what she's doing.");
	output("\n\nSyri jogs off the ship, following her coworkers out into the frigid cold. She 'accidentally' leaves the door open, meaning you'll have no problem getting out when the time comes.");

	processTime(120);
	clearMenu();
	addButton(0,"Next",syriQuestEnterAkkadiBase);
}

public function syriQuestEnterAkkadiBase():void {
	clearOutput();
	clearBust();
	showName("AKKADI\nBASE");
	author("Savin");
	output("She doesn't keep you waiting for long.");
	output("\n\nYou'd guess about ten minutes pass before your Codex vibrates with an incoming call. Syri's on the other end when you answer, muffled by the roar of the winds so that you can barely hear her, even with her mouth right next to the microphone.");
	output("\n\n<i>“Ten seconds,”</i> is all she says before disconnecting.");
	output("\n\nGuess it's go time. You extricate yourself from your hiding place, running up to the cargo bay door and pressing your shoulder into the shadows there. From here, you have a brief, momentary overlook of the Akkadi base. It sits atop both sides of the great glacial rift, two large black buildings leaning out over the seemingly-bottomless canyon of ice. A long, spindly bridge connects the two halves of the complex, barely more than a flat plane of metal suspended by cables. Looks like it's still under construction... as is the building you're parked on, it looks like. You can see a big crane looming over it, whirring along with an armful of metal beams that are headed for a quarter of the far side that's still skeletal and exposed to the elements. ");
	output("\n\nYou're staring right at the crane when the power cuts. It shudders, cargo wobbling, as it's suddenly brought to a total stop. You hear yelling from below as the lights, shields, and heat cut out, leaving the workers temporarily blind and freezing in the frigid winds.");
	output("\n\nNow's your chance!");
	output("\n\nYou duck out of the hovercraft and book it down to the bridge, keeping to cover behind construction equipment and snowbanks until you're able to slide down the maintenance ladder from the hoverpad down to the same level as the bridge. You dash across, as quick as you dark considering how thin the bridge is, and how hard the wind blows through the ice canyon. And it is <i>blowing</i>, strong enough to nearly blow you overboard to an icy death.");
	output("\n\nAnd then you're across, hugging the big metal security door on the other end. From here, you can't even see the other side of the bridge anymore -- the wind's picked up something fierce, blowing snow and ice like a haze all around you. Whatever Syri did, it seems to have let loose the storm! ");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output("God dammit, you should have known something like this was going to happen... there must have been a weather shielding network to protect the work site. No power, no shields!");
	else output("Syri must have accidentally taken down some kind of weather shield.");
	output("\n\nWell, lucky for you, your mission is inside.");
	output("\n\nWith the power out, the security doors don't pose much of a problem, and soon you're in the slightly-less-frigid confines of the Akkadi base...");

	processTime(15);
	clearMenu();
	addButton(0,"Next",syriQuestEnterAkkadiBase2);
}

public function syriQuestEnterAkkadiBase2():void {
	clearOutput();
	moveTo("AKD K31");
	mainGameMenu();
}