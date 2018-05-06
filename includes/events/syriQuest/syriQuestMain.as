//https://docs.google.com/document/d/1kgDLjKPffZIGkFf3DQWXRFex5aVWVAGMCq7RlJEbYzI/edit#
/*
 * SYRIQUEST_MET_SYRI_AT_MAGLEV_STATION	1 = run into Syri at the station
 * SYRIQUEST_HEARD_SYRIS_PLAN			1 = Syri told PC her plan
 * SYRIQUEST_RESOLUTION					-1 = never accepted the quest
 * SYRIQUEST_SYRI_ONAHOLE				undefined = never found it, 1 = found it, 2 = gave it to Syri
 * SYRIQUEST_POST_GAME_TALK_PENIS		1 = talked about Valden, 2 = talked about Syris cock, 3 = talked about Syris cock sleeve
 * SYRIQUEST_POST_GAME_TALK_LOVE		1 = told her love her, 2 = stay friends
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

	flags["SYRIQUEST_MET_SYRI_AT_MAGLEV_STATION"] = 1;
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
	if (pc.isBiped()) output("sit down");
	else output("swing yourself onto the bench");
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
	if (flags["SYRIQUEST_HEARD_SYRIS_PLAN"] == 1) {
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

	flags["SYRIQUEST_HEARD_SYRIS_PLAN"] = 1;
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

	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}