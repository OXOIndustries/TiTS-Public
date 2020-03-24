/* 
 * 
 * Fisianna: The VERY Shy Nekomata - https://docs.google.com/document/d/1ENkFyTaKsNNPt0Etn50buBx6Cmjx3CQm2zc8ZAkPbqw/edit#
 * 
 * #Flags:
 * FISI_MET				1 if player has met Fisianna, else undefined
 * FISI_NAH				1 if player said "Nah" to Fisianna, else undefined
 * FISI_AT_RES_DECK		1 if Fisianna just moved to the Res. Deck, 2 if player has met Fisianna at the Res. Deck, else undefined
 * FISI_TALK_FISI		1 if talked to Fisi about herself, else undefined
 * FISI_TALK_TAVROS		1 if talked to Fisi about Tavros, else undefined
 * FISI_TALK_PROG		1 if talked to Fisi about programming, else undefined
 * FISI_TALK_GAMING		1 if talked to Fisi about gaming, else undefined
 * FISI_TALK_FRIENDS	1 if talked to Fisi about her friends, else undefined
 * FISI_TALK_MODS		1 if talked to Fisi about her mods, else undefined
 * FISI_TALK_BG			1 if talked to Fisi about her background, else undefined
 * FISI_TALK_PARENTS	1 if talked to Fisi about her parents, else undefined
 * FISI_HANG_ARCADE		1-3 stores which friend variation was last seen for arcade hangout, undefined if never done arcade hangout
 * FISI_HANG_SHOPPING	1-3 stores which friend variation was last seen for shopping hangout, undefined if never done shopping hangout
 * FISI_HANG_MOVIES		1-3 stores which friend variation was last seen for movies hangout, undefined if never done movies hangout
 * FISI_SLEPT_WITH		1 if player had a sleepover with Fisi, else undefined
 * FISI_MAX				1 if done Fisi's Maxt Trust Scene
 * FISI_LOVER			1 if player and Fisi are lovers, else undefined
 * FISI_REJECTED		1 if player is heartless, else undefined
 * FISI_DATE_NUMBER		1-6 which dates the player has gone on with Fisi, undefined if never been on a date
 * FISI_REL_TYPE		Relationship type, 1 = Monogamous, 2 = Open Relationship, 3 = Polyamorous, undefined if haven't been on 6th date
 * FISI_SEX_NUMBER		1-4 which sex scenes the player has done up to with Fisi, 1 = tailjob, 2 = eat out, 3 = 69, 4 = vaginal, undefined if never sexed Fisi
 * FISI_TIMES_SEXED		0-infinity, how many times you've sexed Fisi, undefined if haven't unlocked sex menu
 * FISI_TIMES_TJ		0-infinity, how many times you've gotten a tailjob from Fisi, undefined if haven't unlocked sex menu
 * FISI_TIMES_EATEN		0-infinity, how many times you've eaten out Fisi, undefined if haven't unlocked sex menu
 * FISI_TIMES_69		0-infinity, how many times you've 69'd with Fisi, undefined if haven't unlocked sex menu
 * FISI_TIMES_VAG		0-infinity, how many times you've fucked the pussy's pussy, undefined if haven't unlocked sex menu
 * FISI_HARDLIGHTED		1 if used a hardlight dildo on Fisi, else undefined
 * FISI_TRUST			0-100 based on how much she trusts the player, undefined if Fisi still at bar
 * 
 * #Sex n' Cuddles Expansion - https://docs.google.com/document/d/1NQYF3TTCc2ei5Am2TceAN2MwXmh7powIiji3-tGAcCA/edit#heading=h.v5k6zldvc6r5
 * FISI_PRURIENCE		0-100, similiar to an affection setting for other NPCs
 * FISI_HL_PANTIES		1 if player has unlocked the "Give Panties" option, 2 if they gave Fisi the HL thong, else undefined
 * FISI_TIMES_CUDDLED	0-infinity, how many times you've cuddled Fisi, also used to make sure the scene plays in order
 * FISI_TIMES_MASSAGED	0-infinity, how many times you've Fisi massaged you. Unlocks the menu button if bigger than 0
 * FISI_TIMES_ANAL		0-infinity, how many times you've fucked the pussy's ass, undefined if haven't unlocked sex menu
 * FISI_TIMES_ORAL		0-infinity, how many times you've fucked the pussy's mouth, undefined if haven't unlocked sex menu
 * FISI_TIMES_FS		0-infinity, how many times you've fucked the pussy's pussy silly, doenst appear in menu
 * FISI_TIMES_RIDDEN	0-infinity, how many times has she ridden you
 * FISI_TIMES_PEGGED	0-infinity, how many times has she pegged you
 * FISI_TIMES_EDGED		0-infinity, how many times has she edged you
 * FISI_TIMES_SEXY_CUDDLED		0-infinity, how many times have you sexy cuddled with her
 * FISI_TIMES_BREED		0-infinity, how many times have you breed her
 * FISI_TIMES_BET		0-infinity, how many times have you bet with her
 * FISI_TIMES_WON		0-infinity, how many times have you won against her
 * FISI_TIMES_LOST		0-infinity, how many times have you lost her
 * FISI_BET_RESULT		0 if lost last bet, 1 if won last time
 * FISI_LAST_SEXED		last date PC & Fisi had sex, used for auto triggering the breeding scene
 * FISI_BODY_TYPE		undefined = nekomimi, 1 = anthro (for future Xpacks)
 * FISI_PREGNANCY		undefined/0 n= not pregnant, used a placeholder for future Xpacks
 * 
 * HOW DO I TELL WHAT MY RELATIONSHIP IS WITH FISI?????
 * if FISI_LOVER == 1, you're lovers
 * if FISI_REJECTED == 1, you're ex-friends
 * if FISI_AT_RES_DECK == undefined, you're acquaintances
 * if FISI_MAX == 1 && FISI_LOVER == undefined && FISI_REJECTED == undefined, you're best friends
 * if FISI_AT_RES_DECK == 1 && FISI_MAX == undefined, you're friends
 */

//Since she has 3 bust variations and you can't tell which to use based on flags (without adding new ones and obnoxiously setting them), it's gunna take an int instead of a boolean
public function showFisi(variation:int = 0):void
{
	if (flags["FISI_MET"] != undefined) showName("\nFISIANNA");
	else showName("NEKOMATA\nGIRL");
	showBust(fisiBustDisplay(variation));
}
 
//0 for regular, 1 for bra, 2 for nude
public function fisiBustDisplay(variation:int = 0):String
{
	var sBust:String = "FISIANNA";
	if (variation == 1) sBust += "_BRA";
	else if (variation == 2) sBust += "_NUDE";
	return sBust;
}

public function fisiAtAnons():Boolean
{
	if (hours >= 18 && flags["FISI_AT_RES_DECK"] == undefined && !pc.hasStatusEffect("Fisianna Disabled")) return true;
	return false;
}

public function fisiAtResDeck():Boolean
{
	if (hours >= 16 && flags["FISI_AT_RES_DECK"] != undefined && flags["FISI_REJECTED"] == undefined && !pc.hasStatusEffect("Fisianna Disabled")) return true;
	return false;
}
 
//Makes Fisi unavailable for the specified number of days. 1 = "until tomorrow", 2 = "until 2 days from now", etc. NOT 1 = 24 hours, etc.
public function setFisiAway(iDays:int = 1):void
{
	if (hours < 3) iDays -= 1;
	if (iDays <= 0) return;
	var time:int = ((23 - hours) * 60) + (60 - minutes);
	time += (24 * 60) * (iDays - 1);
	
	pc.createStatusEffect("Fisianna Disabled", 0, 0, 0, 0, true, "", "", false, time);
}

public function fisiPrurience(arg:Number = 0):Number
{
	if(flags["FISI_PRURIENCE"] == undefined) flags["FISI_PRURIENCE"] = 30;
	if(arg != 0) flags["FISI_PRURIENCE"] += arg;
	if(flags["FISI_PRURIENCE"] > 100) flags["FISI_PRURIENCE"] = 100;
	else if(flags["FISI_PRURIENCE"] < 0) flags["FISI_PRURIENCE"] = 0;
	return flags["FISI_PRURIENCE"];
}

public function fisiWonLastBet():Boolean
{
	if (flags["FISI_BET_RESULT"] == 1) return true;
	return false;
}

public function fisiAtAnonsAddendum(btnSlot:int = 0):void
{
	output("\n\n");
	
	if (flags["FISI_MET"] == undefined) output("You notice a particularly giggly group of girls in a corner booth inside the bar.");
	else output("The group of exotic girls looks to be back at the corner booth again.");
	output(" They seem to be casting their gazes towards you in particular, giving you both friendly waves and smiles. You could put that Steele charm of yours to work and entertain these ladies.");
	
	if (pc.isTaur()) addDisabledButton(btnSlot, "Girls", "Girls", "It doesn’t look like there’s enough room at the booth to fit someone of your anatomy.");
	else addButton(btnSlot, "Girls", approachGirls, undefined, "Girls", "Go entertain the ladies.");
}

public function fisiAtResDeckAddendum(btnSlot:int = 0):void
{
	if (!fisiAtResDeck()) {
		if (flags["FISI_REJECTED"] != undefined) output("\n\nYou don’t see Fisianna at her usual spot on the park bench. From the way things went down the last time you saw her, you doubt you’ll ever see her here again.");
		else if(flags["FISI_AT_RES_DECK"] != undefined)output("\n\nYou don’t see Fisianna at her usual spot on the park bench right now. It might be a good idea to check back at a later time to see if she is there.");
		return;
	}
	
	if (flags["FISI_AT_RES_DECK"] == 1) output("\n\nIt looks like Fisianna is here at the time the two of you agreed upon at Anon’s Bar. She is sitting on a park bench in the distance taking in the scenery. You could go see what she wanted to be alone with you about.");
	else output("\n\nFisianna is sitting on a park bench in the distance. She has not taken notice of you yet as she eyes the scenery around her. You could drop by and see how she is doing.");
	
	addButton(btnSlot, "Fisianna", approachFisi, undefined, "Fisianna", "See if the nekomata would like some company.");
}

public function approachGirls():void{
	clearOutput();
	author("Lkynmbr24");
	showName("\nGIRLS");
	clearMenu();
	
	if (flags["FISI_MET"] == undefined)
	{
		flags["FISI_MET"] = 1;
		flags["FISI_TRUST"] = 0;
		output("You figure you may as well take the open invitation if it means joining the company of a few pretty ladies. You make your way over to the group of giggling girls while they shimmy over to make room for you. From what you can tell, they are a group of four, and almost all of them look heavily modified.");
		output("\n\nThe first woman that catches your attention is an avian reminiscent of a harpy with bright yellow and green-patterned feathers and eye-catching clothing. She is dressed rather skimpily with a tie dye tank top supporting E-cups and blue micro jeans. Her feather pattern trails her arms to her elbows and her hair is also more feather-like, with her legs looking very avian down past her mid-thigh area. She also looks to be supporting just as equally colorful <i>“wings”</i> folded into her forearms; the wings look big enough to be flight-capable.");
		output("\n\nThe second lady that catches your eye looks like an anthropomorphic dragon-girl; similar to a gryvain except a lot more animalistic, albeit she seems wingless as far as you can tell. She is also dressed fairly skimpily with a pair of black low-cut yoga pants that let her powerful-looking tail wiggle free. The dragoness has on what looks like a dark red sleeveless halter top supporting G-cup breasts that despite her somewhat rugged appearance, jiggle with the slightest movement. She looks to be fully-scaled with the exception of her front area, which gives a lighter shade of tan in contrast to her ebony-black scales. The back length hair atop her draconic head matches her tanned frontside, however.");
		output("\n\nThe third girl you see looks vulpine in appearance with her tall triangular ears peeking through a mane of fiery red hair, and equally bright red fur along her arms and legs. However, you notice a lot of movement behind her. You squint your eyes and make out two, no... three, four, five... nine tails!? It looks like someone went with a kitsune look. Her tails all look soft to the touch, practically inviting to you to take a nice rest on them. Her sizeable double D’s look just as comfortable to lay on, with her black sleeveless crop top and matching tight jeans showing off all of her assets.");
		output("\n\nFrom what you can see so far, only one word comes to mind: <i>exotic</i>. When you look to the fourth girl however, you notice that she looks a lot more... <i>“normal”</i> compared to her colorful companionship. At first glance, she looks like a typical kaithrit, though you can’t really discern much more than that other than her orange hair with white highlights. She is the only one of the group that doesn’t seem as thrilled about your approach. She has her hands tucked away under the table, looking down and not making any eye contact with you.");
		output("\n\nPutting on your best smile, you take a seat at the end of the booth with the exotic ladies after a brief greeting, placing yourself next to the dragoness. After you sit down, she is quick to start wrapping an arm around your shoulder.");
		output("\n\nThe harpy-girl is the first to talk. <i>“Heya! What brings a " + pc.mf("hunk", "cutie") + " like you to this place?”</i>");
		output("\n\nBefore you can answer the question, the fox-girl chimes in while rolling her eyes slightly, <i>“Why do you THINK [pc.heShe]’s here, Aya? [pc.HeShe]’s here to have fun, just like us! Duh!”</i>");
		output("\n\n<i>“Don’t be a such a ball-buster, Tara. I’m just trying to make our guest feel welcome.”</i>");
		output("\n\n<i>“More like tryin’ to make [pc.himHer] feel welcome in your pants.”</i> The fox-girl snidely remarks. The bird-girl immediately and slightly amusingly ruffles her feathers in exasperation before she casts a death glare at the kitsune in retaliation for her outburst.");
		output("\n\n<i>“TARA! Don’t you start!”</i> The feathered girl breathes out a heavy sigh after her scolding, to which both the dragoness and the vulpine both laugh heartily.");
		output("\n\n<i>“Sorry about those two... Let me start over. My name’s Aya. The smart-ass, hot-headed fox over there is Tarariel. The dragon-gal with you is Britannia, and the kitty girl here is Fisianna!”</i> At that cue, Aya starts to prod Fisianna softly with her elbow. The feline jumps slightly at the nudges, but she continues to look demurely down at her lap.");
		output("\n\nFisianna manages to murmur a barely audible, <i>“H-hi,”</i> before returning to silence, never lifting her gaze from her lap.");
		output("\n\nBritannia leans in to your [pc.ear] whispering, <i>“She’s a shy little kitten she is. We’re trying to break her in on her intergalactic travels and get a little more friendly with the locals.”</i>");
		output("\n\nWell, that seems to have straightened things out a little bit anyways, though it does make Fisianna stand out even more from the group of colorful women. Where the other three girls seem outgoing and comfortable in their own skin, and scales... and fur... and feathers, Fisianna just looks very <i>“delicate”</i> comparatively.");
		output("\n\nYou give Britannia a small nod of understanding and move on to introduce yourself, not wanting to dwell on the subject.");
		output("\n\n<i>“My name is [pc.name]. [pc.name] Steele. ");
		if (pc.isNice()) output("It’s a pleasure to meet you ladies.”</i>");
		else if (pc.isMischievous()) output("I have to say...”</i> You pause for dramatic effect, curling your [pc.lips] into a devious smile and putting on your best suave voice. <i>“I’m looking forward to what sort of trouble you gals might be.”</i>");
		else output("Lookin’ forward to hanging with you gals for the night.”</i>");
		output("\n\nThe three talkative girls all immediately light up upon hearing your name, with Fisianna giving a small twitch of her ears, but otherwise still unmoving. ");
		output("\n\n<i>“No fuckin’ way! You’re <b>the</b> [pc.name] Steele?! Now you’re just tryin’ too hard to impre-OW!”</i> Tarariel manages to blurt out before being sharply ribbed by Aya. The harpy-morph quickly clears her throat after giving Tarariel another one of her death stares.");
		output("\n\n<i>“What she <b>meant</b> to say was, it’s nice to meet a multi-billionaire magnate’s " + pc.mf("son", "daughter") + " and heir to his company all the way over here... in a seedy bar no less!”</i> ");
		output("\n\nAya looks visibly embarrassed having put that fact to light now. <i>“So what <b>does</b> bring someone like you to this place?”</i> She repeats. <i>“I wouldn’t have thought someone of your import would be here instead of chasing after your fortune.”</i>");
		output("\n\n<i>“Well, I’m not heir to the Steele Tech company yet anyways. I’m working on that currently. ");
		if (pc.isNice()) output("Also, it doesn’t hurt to have a moment of reprieve every once in awhile in between traversing planets on this big planetary rush, especially in the company of such lovely gals.”</i> ");
		else if (pc.isMischievous()) output("Also, it doesn’t hurt to have a moment of reprieve every once in awhile in between traversing planets on this big planetary rush, especially with such an interesting group of ladies.”</i> ");
		else output("Also, it doesn’t hurt to have a moment of respite every once in awhile in-between traversing planets on this big planetary rush, especially with a bunch of... unique women like yourselves.”</i> ");
		output("\n\nAya and Tarariel both lean their heads in towards each other, whispering to one another in fevered tones, though with the noise of the bar around you, you can’t discern what they’re talking about. Britannia squeezes your shoulder again before turning her attention towards Fisianna who, now that you look at her, has her gaze set squarely on you in a trance-like state. For the first time, you are able to see her visage in the dim light of the bar. She has a cute and very feminine face, despite not having much makeup on as far as you can tell. She has long eyelashes that shadow her bright golden feline eyes that you could become lost in almost as much as she seems lost in staring at you. You also notice that she has furred arms tipped with paws, which isn’t something you normally would see on a kaithrit. It seems she has more in common with the group of girls than she initially let on.");
		output("\n\nBritannia apparently notices that Fisianna is staring hard at you, too. <i>“Yoohoo... wakey wakey.”</i> The dragon woman gently coos as she waves her hand lightly in front of Fisianna’s view to grab her attention. The catgirl lets out a small yelp of surprise as she slightly jumps in her seat. Her cheeks start to turn pink from embarrassment and looks hurriedly down at her lap again. <i>“Everything alright, kitten?”</i> Britannia asks in a gentle, almost soothing manner.");
		output("\n\n<i>“U-uhm... yeah. I’m o-ok. Just... I kind of, I mean, u-uh...”</i> Fisianna babbles, struggling to find the right words until her cheeks start flowing a deeper red. <i>“I need to go... to the bathroom I-I mean. Please excuse me.”</i> ");
		output("\n\nYou and Britannia shift out of your seats to let Fisianna go on her way. The catgirl hurriedly stands up and walks past the both of you, not making eye contact. You can tell from a quick glance at her face that she looks on the verge of tears, possibly out of embarrassment from what you can surmise. You also notice that she does not seem to be heading directly towards the bar’s bathroom but rather an emergency side exit. Britannia moves to sit back down, but not before glancing at the door Fisianna went through and giving you a look of concern. You can choose to follow the feline to see what is wrong, or trust that she will come back to her friends once she is better. ");
		
	}
	else
	{
		output("You make your way towards the exotic girls again, eager to share some more stories with them. Britannia the dragoness scooches over to give you room to sit at the end of the booth and wraps a familiar arm around your shoulder when you sit down next to her.");
		output("\n\n<i>“[pc.name]! Good to see you again! I’ve been <b>dying</b> to get to know more about you!”</i> Aya, the harpy-morph chirps giddily.");
		output("\n\nTarariel, the fiery-headed kitsune-morph next to her adopts a wolfish grin on her face. <i>“Yeah, I bet you do! We know about ALL the things you wanna do t-<b>mmm-mph!</b>“</i> Is all she can manage to say before the bird-girl brings a feathered hand to the fox-girl’s mouth, cutting her off.");
		output("\n\nAya gives you a nervous laugh before blurting, <i>“Just ignore her.”</i>");
		output("\n\nYou and Britannia laugh heartily at that. Soon, a waitress approaches your table so that you and the girls can order some drinks. She gives you an unsubtle wink before she sashays over to the bar. When she arrives with drinks in hand, she places them down on the table and leaves to serve other patrons. After taking a sip of your beverage, you start to swap stories between each other. In-between tales you look over towards Fisianna. She still seems as shy as can be, unmoving and unspeaking as the night wanes on. Britannia of course notices your wayward glances towards Fisianna and smiles reassuringly at you whenever she catches your eye.");
		output("\n\nBetween one particularly juicy story that you tell about a haywire computer you used which ran amok because of a virus it contracted from an elicit site, Britannia softly nudges Fisianna asking, <i>“Hey, Kitten. Wanna share a little story to add to that? You’re pretty techy when it comes to that stuff!”</i>");
		output("\n\nFisianna shifts in her chair a bit, taking a small sip of her fizzy drink before murmuring, <i>“U-uh... It’s ok. I actually... k-kind of need to use the bathroom... I-I drank too much.”</i>");
		output("\n\nFisianna’s drink actually looks barely touched by your observation. Britannia gives Fisianna a brief look of concern before ushering you to move and conceding to slide out of her seat to let Fisianna out of the booth.");
		output("\n\n<i>“Yeah, go ahead.”</i> Britannia says warily.");
		output("\n\nFisianna hurriedly stands up and walks past the both of you, not making eye contact. ");
		if (flags["FISI_NAH"] != undefined) output("You can tell from a quick glance at her face that she looks on the verge of tears, though you have a fairly good idea of why that is. ");
		else output("You can tell from a quick glance at her face that she looks on the verge of tears. ");
		output("You also see that she doesn’t seem to be headed directly towards the bar’s bathroom, but rather an emergency side exit. Britannia moves to sit back down, but not before glancing at the door Fisianna went through and giving you a look of concern. You can choose to follow the feline to see what is wrong, or trust that she will come back to her friends once she is better.");
	}
	
	processTime(15 + rand(10));
	addButton(0, "Follow", followFisi, undefined, "Follow", "Follow Fisianna to see what’s wrong.");
	addButton(1, "Stay", stayGirls, undefined, "Stay", "Stay with the group of girls. She’s probably fine.");
}

public function followFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	output("Something about how things played out just then doesn’t sit well with you. The quick glimpse you caught of her face made her seem quite pained. You turn to the dragoness and offer to go after Fisianna to see if she is alright. Britannia wastes no time in giving you an approving nod and a slight smile, to which you then excuse yourself to her and the other ladies and proceed to tail after Fisianna.");
	output("\n\nYou proceed through the bar to the emergency side exit that Fisianna just passed through. Upon opening the door, you take a look to your left down the alleyway and then your right, and find Fisianna knelt against the wall wiping off a few trailing tears from her face with her paws. ");
	if (flags["FISI_NAH"] == undefined)output("\n\nNow that Fisianna isn’t crowded between the table and the girls, you can more clearly see the mod jobs she has done on her body. She has a cute pair of cat-like paws on her hands and feet, which are both left bare, and her two tails are quite long and luxurious. She’s also fairly petite in physique, but still has a distinctly feminine shape to her. Hugging her form is a black, fur-hooded sleeveless vest over a printed purple t-shirt, with blue bell-bottom jeans. She certainly isn’t dressed as racy as her companions are.");
	output("\n\nYou cross the threshold of the exit and make your way over to Fisianna before taking a seat next to her. She still seems oblivious to your arrival as she’s still wiping off tears and looking at the ground. You are not exactly sure how to break the ice, or in this case the ice<i>berg</i>, but you are willing to try to goad this catgirl to open up a little more. ");
	if (silly) output("Perhaps you can even manage a smile out of her, or your name isn’t [pc.name] Steele! ");
	else output("Perhaps you can even manage a smile out of her!");
	output("\n\n");
	if (pc.isNice()) output("You decide to approach her in as gentle of a manner as you can, since she seems like a sensitive person. <i>“Hey, Fisianna. Is everything ok? You didn’t seem like you were doing too well and I wanted to check up on you.”</i> ");
	else if (pc.isMischievous()) output("You decide it might be a good idea to open with a lighthearted joke to soften Fisianna up. <i>“Hey there! Didn’t figure you the type to be an alley cat! Can I <b>paw</b>-sibly do anything for you to help you feel better?”</i> ");
	else output("You struggle to come up with anything to tell Fisianna to comfort her, but before the silence grows awkward, you manage to say, <i>“Hey. You doin alright there, uh... Kitten?”</i>");
	output("\n\nFisianna in response starts to sit down fully against the wall and tuck her tails and her head between her knees, still not looking up. You can hear her groan faintly, which comes off in a sad, pitiful tone.");
	output("\n\n");
	if (pc.isNice()) output("<i>“It’s ok. It’s only me, there’s nothing to be afraid of. I won’t judge you for what happened or anything. Trust me.”</i>");
	else if (pc.isMischievous()) output("<i>“Hey, I won’t bite! Lighten up a little bit! It’s only me here. You can tell me what’s <b>t</b>-ailing you.”</i> ");
	else output("<i>“Listen, it’s only me. C’mon. I’m not THAT bad of a person. Open up a little!”</i>");
	output("\n\nFisianna hesitantly but slowly raises her head out from between her knees and looks your way with her golden, piercing, but dewy, tearstained eyes. <i>“T-thanks. I’m sorry about that.”</i> Sniffling, she straightens herself to more properly face you.");
	output("\n\n<i>“It’s ok, though I’m kind of curious what that was all about; that is if you don’t mind my asking?”</i>");
	output("\n\n");
	if (flags["FISI_NAH"] != undefined) output("<i>“I was just thinking of the last time we met each other here... and... I-I feel really bad. No no! Not at not being able to see you alone, but I feel bad for the way I acted. I might have made you feel bad about it. I-I’m not the strongest of people. I-I don’t know why I tried to run away again. I... I just...”</i>");
	else output("<i>“O-oh...”</i> Fisianna looks down at her paws before she continues. <i>“I’m... not really that great around new people that I meet. I tend to clam up really badly, and then... I-I just get really embarrassed and then... and then...”</i> She looks up at you for a brief moment to which you give an encouraging nod to keep going. <i>“I’m sorry if I might have come off as rude, bolting out of there like that...”</i>");
	output("\n\nYou assure Fisianna that everything is fine, though you point out that her friends might be worried about her sudden departure. Upon mention of her friends she straightens up with sudden realization while her ears perk high and her tails waggle at a fever pitch. <i>“O-oh! Hng... I should go back and let them know that I’m okay.”</i>");
	output("\n\nYou give Fisianna an approving nod before you rise up from the wall and offer a hand to her, which she accepts graciously as you help her to her feet. The feline paw in your hand feels luxuriously fluffy and soft to the touch, and you can’t help but to give a gentle squeeze on her pink ");
	if (silly) output("toe bean");
	else output("paw pad");
	output(". When she feels the slight pressure on her paw, Fisianna tries to hide a bit of a blush but ultimately fails, making you feel a bit warm inside. After letting go, you start to [pc.walk] towards the emergency exit to go back in, but you stop when you hear Fisianna squeak your name. Turning around you see Fisianna lightly shuffling her feet. Her ears are downturned, tails waggling slowly behind her as she looks down shyly at her feet and rubs her forepaws together nervously.");
	output("\n\n<i>“L-listen... um. D-do you.. Do you wanna... um, m-meet up with me sometime after tonight? M-maybe somewhere a bit... quieter... and a-alone? I wanna start over.”</i> Fisianna looks almost beet red around the face right now. <i>“T-that is if you want.”</i> She quickly adds.");
	
	processTime(5 + rand(5));
	addButton(0, "Sure", sureFisi, undefined, "Sure", "The catgirl at least seems curious. Take her up on her offer.");
	addButton(1, "Nah", nahFisi, undefined, "Nah", "You’ve got better things to do at the moment.");
}

public function stayGirls():void
{
	clearOutput();
	author("Lkynmbr24");
	showName("\nGIRLS");
	clearMenu();
	
	output("You decide after a moment of thought to take your seat back next to Britannia and resume talking with the three exotic ");
	if (silly) output("animorphs");
	else output("animal-morphs");
	output(".");
	if (flags["JUNGLE_STEP"] != undefined)
	{
		output("\n\nYou tell them about random adventures you had on planets you recently visited, ");
		if (pc.isBimbo() || pc.isBro() || pc.lust() >= 33) output("making sure to spare no detail");
		else output("skipping over the more salacious details");
		output(" as the ladies become wrapped up in your stories.");
	}
	else
	{
		switch(flags["PC_UPBRINGING"])
		{
			case GLOBAL.UPBRINGING_PAMPERED: output("\n\nYou regale the ladies with stories of your childhood, telling them about a lavish party you attended and the interesting people you met there."); break;
			case GLOBAL.UPBRINGING_ATHLETIC: output("\n\nYou regale the ladies with stories of your childhood, telling them about a rather intense game you played while growing up and making a big play that won your team the championship."); break;
			case GLOBAL.UPBRINGING_BOOKWORM: output("\n\nYou regale the ladies with stories of your childhood, telling them about a particularly interesting sci-fi book that you read as a child that wound up becoming true."); break;
			case GLOBAL.UPBRINGING_AUSTERE: output("\n\nYou regale the ladies with stories of your childhood, telling them about the struggles of finding a suitable job while living a tough but hard working life."); break;
			case GLOBAL.UPBRINGING_BALANCED: output("\n\nYou regale the ladies with stories of your childhood, telling them about things you did with your father while growing up and reflecting on things you wish you did with him now that he is gone."); break;
			default: output("\n\nMISSING FLAVOR TEXT FOR AN UPBRINGING.");
		}
	}
	output("\n\nBy the time you’re finished, you decide to depart despite the reluctance of the ladies, but you are rather worried now since Fisianna still hasn’t shown up. Assuring them you will be back another day, you bolt towards the emergency exit that Fisianna went through. When you peek out of the door, there isn’t a soul to be seen as you look left and right down the narrow alleyway. You make your way to the front of Anon’s Bar and outside to see if she might be there, but you see no sign of Fisianna in the now-diminished late night crowd of people. You guess she must have gone home for the night. Maybe you will get another chance to see her another night if her friends show up again.");

	if (hours >= 16) processTime(((23 - hours) * 60) + (60 - minutes));
	processTime(((1 - hours) * 60) + (60 - minutes));
	processTime(rand(15));
	addButton(0, "Next", mainGameMenu);
}

public function sureFisi():void
{
	flags["FISI_TRUST"] = 5;
	flags["FISI_AT_RES_DECK"] = 1;
	
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	output("<i>“Sure. That sounds good to me.”</i>");
	output("\n\nFisianna jerks her head and ears up at those words in surprise, looking about as candid as you have seen her so far. She’s staring at you wide-eyed in disbelief as she whispers, <i>“Really?”</i> You nod your head in response.");
	output("\n\nFisianna’s tails start to waggle faster behind her at hearing you wanting to spend some one-on-one time with her. You even notice her start to form a cute little smile on her lips for the first time you have seen until she immediately recomposes herself, looking downward and shuffling her feet on the ground shyly again.");
	output("\n\n<i>“Where did you have in mind?”</i> You ask Fisianna.");
	output("\n\n<i>“Ah. Mmm... h-how about at the plaza at the residential area? The northeast area by the elevators. I-is that fine with you?”</i>");
	output("\n\n<i>“Sounds fine to me. It’s a date.”</i>");
	output("\n\nFisianna upon hearing those words starts to blush furiously, still shyly staring down at her feet and scraping her foot paw on the ground at a faster pace. You don’t figure she is blushing out of arousal, but more out of embarrassment, but you have to admit that she looks rather cute when she blushes.");
	output("\n\nAfter agreeing upon a time to meet up, you [pc.walk] towards the emergency exit again and hold the door open for Fisianna. She briefly steps up to the doorway and walks inside, where you follow her to the group of exotic girls to spend the rest of the night talking about various things and happenings around Tavros before excusing yourself, much to the ladies’ chagrin.");
	
	
	if (hours >= 16) processTime(((23 - hours) * 60) + (60 - minutes));
	processTime(((1 - hours) * 60) + (60 - minutes));
	processTime(rand(15));
	addButton(0, "Next", mainGameMenu);
}

public function nahFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	flags["FISI_NAH"] = 1;
	
	output("Regrettably, you tell Fisianna that you will likely be busy later on with the Rush. Fisianna’s ears droop even lower with disappointment and her tails stop moving as she utters softly, <i>“O-oh... okay. I-it was silly of me to ask that of you. Y-you have that fortune to chase. I-I wouldn’t want to get in the way of that...”</i> Fisianna laughs weakly, though her face certainly shows no amusement. She actually looks very sad.");
	output("\n\n<i>“I’m sorry Fisianna, though I’ll likely be around again. Please tell your friends this as well. It was a fun night. It really was. For now, I should probably get going.”</i>");
	output("\n\n<i>“R-right. I’ll see you again, maybe? I wish you luck on your adventures. I-I really do.”</i> She sniffles.");
	output("\n\nYou nod in acknowledgement before you [pc.walk] down the alleyway towards the front of Anon’s Bar. Though you can’t see it, you can feel that Fisianna is staring you down while you make your exit. As you reach the end of the alleyway you hear the telltale click of the emergency exit door closing, indicating that Fisianna just went back inside. Hopefully she didn’t feel too hurt by your refusal. ");
	
	if (hours >= 16) processTime(((23 - hours) * 60) + (60 - minutes));
	processTime(((1 - hours) * 60) + (60 - minutes));
	processTime(rand(15));
	addButton(0, "Next", mainGameMenu);
}

public function approachFisi():void
{
	//We went to her sleepover, she trusts us loads, and we haven't had this scene yet - Time for a Max Trust Scene
	if (flags["FISI_MAX"] == undefined && flags["FISI_SLEPT_WITH"] != undefined && flags["FISI_TRUST"] == 100)
	{
		maxTrustScene();
		return;
	}
	//Disable for the first 24h after sex 
	if (largestCockIndexThatFitsFisiDimensions() >= 0 && flags["FISI_TIMES_BREED"] > 0 && flags["FISI_LAST_SEXED"] + 24*60 < GetGameTimestamp() && !pc.hasStatusEffect("Fisi Breeding Cooldown") ) {
		//Breeding scene - increase chance by 20% every couple of days
		if (rand(5) <= Math.floor((GetGameTimestamp() - flags["FISI_LAST_SEXED"]) / (60*24*3))) {
			breedFisiI();
			return;
		}
		// prevent the PC from asking Fisi until they get lucky
		else pc.createStatusEffect("Fisi Breeding Cooldown", 0, 0, 0, 0, true, "", "", false, 60*12);
	}

	clearOutput();
	author("Lkynmbr24");
	showFisi();

	//First time seeing Fisi here
	if (flags["FISI_AT_RES_DECK"] == 1)
	{
		flags["FISI_AT_RES_DECK"] = 2;
		output("You [pc.walk] over to Fisianna and announce your arrival. Fisianna jumps slightly when you speak up, but quickly relaxes when she turns to you and recognises your voice.");
		output("\n\n<i>“Ah! Y-you startled me for a second, [pc.name]... I’m glad you came.”</i>");
		output("\n\n<i>“Of course I would. Did you have to wait long?”</i>");
		output("\n\n<i>“No... not really, no. Even if I had, the scenery here is actually pretty amazing for being on a space station. It could definitely keep me entertained for a good while.”</i> Fisianna pauses for a moment, then gasps while bringing a paw to her lips, quickly adding, <i>“O-oh! Not that you’re not entertaining or a-anything. I-I mean ah... sorry.”</i> She finishes while her cheeks rapidly turn pink in pure embarrassment again. ");
		if (pc.isNice()) output("\n\nYou give Fisianna as sincere a grin as you can manage while placing a reassuring hand on her shoulder. <i>“It’s ok, no harm done. I understand what you meant to say.”</i> Fisianna gives a small sigh of relief after you tell her this and visibly relaxes.");
		else if (pc.isMischievous())
		{
			output("\n\nYou lightheartedly laugh at the predicament Fisianna put herself into. <i>“Hah! Me? Not entertaining!? I’ll show you just how entertaining I am! I’m <b>hiss</b>-terical!”</i>");
			output("\n\nFisianna giggles softly at your corny cat pun, after which she casts a sideways glance at you with a small smirk on her face. <i>“Those puns were <b>paw</b>-ful.”</i> You are a bit surprised to hear her joke back, but you can admit that one was pretty good!");
		}
		else output("\n\nYou decide to forgive her this time. Giving a dismissive shrug, you tell her, <i>“It’s fine. I figure you didn’t mean it that way anyways.”</i> Fisianna gives a small sigh of relief after you tell her this and visibly relaxes.");
		output("\n\nYou sit down next to Fisianna on the bench. You both look ahead at the palm trees for a brief moment before she speaks up.");
		output("\n\n<i>“Mmm... a-anyway, I wanted to meet up with you here to, uh... start over from the night at Anon’s. Y-you know... to get to know each other better. I still owe you for storming out on you that night. You seem like a good person, s-so if you’ll give me a chance...”</i> Fisianna trails off, looking worriedly at you.");
		output("\n\n<i>“Like I said before, it’s ok! I wouldn’t be here if I wasn’t intending on giving you a chance. Relax!”</i> You give Fisianna your best reassuring smile.");
		output("\n\n<i>“R-right.”</i> After a pregnant pause, Fisianna continues. <i>“Sooo... Is there anything you wanted to talk about? M-maybe we can tell each other a bit about ourselves?”</i>");
	}
	//Nothing special, whats up Fisi
	else
	{
		if (flags["FISI_TRUST"] < 25)
		{
			output("You [pc.walk] over and take a seat next to Fisianna. When you sit down, Fisianna breaks her gaze from the scenery around you and looks a bit surprised at your arrival, but softens up when she sees it is you.");
			output("\n\n<i>“O-oh hey [pc.name]. How are you? W-was there anything you wanted to talk about?”</i>");
		}
		else if (flags["FISI_TRUST"] < 50)
		{
			output("You [pc.walk] over and take a seat next to Fisianna. When you sit down, Fisianna breaks her gaze from the scenery around you, giving you a smile when she sees it is you.");
			output("\n\n<i>“Hey, [pc.name]! I’m glad you’re here. Did you want to talk about something, o-or did you want to go do something together?”</i>");
		}
		else if (flags["FISI_TRUST"] < 75)
		{
			output("You [pc.walk] over and take a seat next to Fisianna. When you sit down, Fisianna breaks her gaze from the scenery around you, blushing slightly as she gives you a warm smile.");
			output("\n\n<i>“[pc.name]! I-I was looking forward to seeing you again! Did you want to go somewhere together, or do you just want to talk? I’m fine with whichever.”</i>");
		}
		//Friends
		else if (flags["FISI_LOVER"] == undefined && flags["FISI_MAX"] == undefined)
		{
			output("You [pc.walk] over and take a seat next to Fisianna. When you sit down, Fisianna breaks her gaze from the scenery around you, blushing profusely as she fidgets in her seat and beams at you.");
			output("\n\n<i>“Hey [pc.name]. I’m really, really glad you’re here. I-I’m looking forward to what you have planned for us today. I-if you have plans that is?”</i>");
		}
		//Lovers
		else if (flags["FISI_LOVER"] != undefined)
		{
			output("You [pc.walk] over and take a seat next to Fisianna. When you sit down, Fisianna breaks her gaze from the scenery around you, leaning over to give you a short and soft kiss on your [pc.lipsChaste]. When you break the kiss, she looks shyly at you and avoids direct eye contact.");
			output("\n\n<i>“Mmm, [pc.name]... I was wondering when you would come back. I-I missed you a lot. I hope you missed me too.”</i> Fisianna raises her eyes to meet yours and gives you a cheerful smile. <i>“Is there anything you need of me?”</i>");
		}
		//Best friends
		else if (flags["FISI_LOVER"] == undefined && flags["FISI_MAX"] != undefined)
		{
			output("You [pc.walk] over and take a seat next to Fisianna. When you sit down, Fisianna breaks her gaze from the scenery around you, leaning over to give you a friendly hug.");
			output("\n\n<i>“Hey [pc.name]! I was wondering when you would show up! We should hang out again! If you just want to talk though, that’s fine too!");
		}
	}
	
	processTime(1);
	
	fisiMainMenu();
}

public function fisiMainMenu(fromBack:Boolean = false):void
{
	clearMenu();

	addButton(0, "Appearance", appearanceFisi, undefined, "Appearance", "Get a good look at the catgirl.");
	addButton(1, "Talk", talkFisi, undefined, "Talk", "Get to know Fisianna better.");
	
	if (flags["FISI_TRUST"] >= 25) addButton(2, "Hangout", hangoutFisi, undefined, "Hangout", "Go hangout someplace with Fisianna. You might bump into a friend of hers.");
	else addDisabledButton(2, "Hangout", "Hangout", "You don’t know her well enough to know where she might like to hang out.");
	
	//Date Button
	if (flags["FISI_LOVER"] != undefined && flags["FISI_DATE_NUMBER"] != 6)
	{
		if (pc.isTaur() && flags["FISI_DATE_NUMBER"] == 5) addDisabledButton(3, "Date", "Date", "It doesn’t look like she wants to take things further due to your formidable anatomy.");
		else if (flags["FISI_DATE_NUMBER"] == undefined && pc.credits < 200) addDisabledButton(3, "Date", "Date", "You don’t have enough credits to taker her out on a date.");
		else addButton(3, "Date", dateFisi, undefined, "Date", "Go out on a date with Fisianna.");
		
		if(!fromBack) addDisabledButton(4, "Sex", "Sex", "You’ll have to get her to open up to you more to do this with her.");
		else addDisabledButton(4, "Sex", "Sex", "It doesn’t look like she is comfortable enough with you to do this yet.");
	}
	//Sex Button
	else if (flags["FISI_DATE_NUMBER"] == 6)
	{
		addDisabledButton(3, "Date", "Date", "You’ve already been on all the dates with her.");
		
		if (pc.lust() < 33) addDisabledButton(4, "Sex", "Sex", "You aren’t aroused enough for this.");
		else if (flags["FISI_SEX_NUMBER"] == undefined && !pc.hasGenitals()) addDisabledButton(4, "Sex", "Sex", "You can’t access this without genitals first.");
		else if (pc.isTaur()) addDisabledButton(4, "Sex", "Sex", "It doesn’t look like she is comfortable doing this with someone of your formidable anatomy.");
		else addButton(4, "Sex", sexFisi, undefined, "Sex", "Have some fun with the kitten!");
	}
	else 
	{
		addDisabledButton(3, "Locked", "Locked", "You must be lovers with Fisianna in order to be able to do this.");
		addDisabledButton(4, "Locked", "Locked", "You must be lovers with Fisianna in order to be able to do this.");
	}
	
	//Xpack
	if (flags["FISI_LOVER"] == undefined) addDisabledButton(5, "Locked", "Locked", "You must be lovers with Fisianna in order to be able to do this.");
	else addButton(5, "Cuddle", cuddleFisi, undefined, "Cuddle", "Cuddle with the cute kitten for a while.");

	if (flags["FISI_TIMES_MASSAGED"] == undefined) addDisabledButton(6, "Locked", "Locked", "Maybe you should relax with Fisi after a long workout...");
	else addButton(6, "Massage", massageFisi, undefined, "Massage", "Get a relaxing, and intimate rub-down from Fisianna.");

	//Dont show button until the scene has played
	if (flags["FISI_HL_PANTIES"] == 2) addDisabledButton(13, "Give Panties", "Give Panties", "You already gave her the panties.");
	else if (flags["FISI_HL_PANTIES"] == 1) {
		addDisabledButton(13, "Give Panties", "Give HL Panties", "You’ll need a pair a panties with a hardlight strap-on upgrade for this!");
		for (var i:int = 0; i < pc.inventory.length; i++)
		{
			if (pc.inventory[i] is PlainPanties && pc.inventory[i].hardLightEquipped)
			{
				addButton(13, "Give Panties", givePantiesToFisi, i, "Give Panties", "Give her a pair of hardlight strap-on equipped panties as a present!");
				break;
			}
		}
	}
	
	// Override buttons for special cases
	if (pc.hasGooSkin()) {
		//if (flags["FISI_LOVER"] != undefined) addDisabledButton(5, "Cuddle", "Cuddle", "The cuddles would be more effective with a more solid body type.");
		if (flags["FISI_TIMES_MASSAGED"] != undefined) addDisabledButton(6, "Massage", "Massage", "The massage would be more effective with a more solid body type.");
		//if (flags["FISI_HL_PANTIES"] == 1) addDisabledButton(13, "Give Panties", "Give Panties", "This would be more effective with a more solid body type.");
	}
	if (pc.isTaur()) {
		if (flags["FISI_LOVER"] != undefined) addDisabledButton(5, "Cuddle", "Cuddle", "It doesn’t look like she is comfortable doing this with someone of your formidable anatomy.");
		if (flags["FISI_TIMES_MASSAGED"] != undefined) addDisabledButton(6, "Massage", "Massage", "It doesn’t look like she is comfortable doing this with someone of your formidable anatomy.");
		if (flags["FISI_HL_PANTIES"] == 1) addDisabledButton(13, "Give Panties", "Give Panties", "It doesn’t look like she is comfortable doing this with someone of your formidable anatomy.");	
	}
	
	addButton(14, "Leave", leaveFisi);
}

public function cuddleFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();

	if ((pc.isSore() || pc.HP() <= pc.HPMax() * 0.75) && !pc.hasGooSkin() && !pc.isTaur()) {
		massageFisi();
		return;
	}
	
	//Play them in order the first time, after that its just random
	var cuddleScene:int;
	if (flags["FISI_TIMES_CUDDLED"] <= 12) cuddleScene = flags["FISI_TIMES_CUDDLED"];
	else cuddleScene = rand(13);
	
	switch(cuddleScene)
	{
		default:
			output("You scootch over to Fisianna and gently wrap your arms around her shoulders. She yelps in surprise when you pull her to your chest, but quickly relaxes when she sees your intent and makes herself comfortable against you. The two of you recline on the park bench, your feline lover content on listening to the ambience of your steady heartbeat.");
			break;
		case 1: 
			output("You interlace your fingers with Fisianna’s while she gives you a meaningful look. Your lover leans into your shoulder and gently rests her head against it. After her eyes fully close, you can hear her murmur, <i>“I love being with you like this, [pc.name]...”</i> She smiles and purrs as the two of you spend the rest of your time together in comfortable silence.");
			break;
		case 2:
			output("When you least expect it, Fisianna reaches over and gives you a quick peck on the cheek. She has a sly smile on her peachy lips and giggles softly at your surprised reaction. Not one to be outdone, you pounce on the unfortunate kitty, smothering whatever parts of her face you can catch with kisses. She lets out a small shriek of mock-fear and laughs jovially while she folds under your relentless assault.");
			break;
		case 3:
			output("You feel Fisianna shifting steadily closer to you. When you look over to her, she plants a kiss square on your [pc.lipsChaste] before you can react. The feline’s golden eyes close shut while she sinks deeper into you, forcing you to lean against the arm of the bench. You wrap your arms around your lover as you spend the next few minutes making out.");
			break;
		case 4:
			output("Fisianna rises up from the bench without any forewarning, making you wonder if she is about to leave you. Before you can ask if anything is wrong, however, she turns to you and smiles widely while she steps in front of you. Your feline lover rotates in place to face away from you before bending over to plant her twin-tailed bottom on your lap.");
			output("\n\n<i>“Sorry, I just feel more comfy sitting here than on the hard bench... Y-you don’t mind, right?”</i> Fisianna asks coyly while sensuously running the tip of one of her tails along your chin. You wrap your arms around her waist to answer her question and relax back against the bench, with the soft feline purring providing the most enjoyable accompaniment.");
			break;
		case 5:
			output("You lean over to Fisianna and scoop her cheek into your hand before planting a kiss to her peachy lips. She reacts on instinct and presses herself into you before you can think to pull away; not that you wanted to, anyways. Your feline lover moans into your mouth as she prolongs the kiss and leans heavily into you, almost making the two of you fall off the bench. When you shift position to keep your balance, Fisianna suddenly pulls back from you, gasping at her own boldness as soon as your and her lips part.");
			output("\n\n<i>“A-ah! S-sorry, [pc.name]! I don’t know what came over me... I-I kinda lost control for a moment there.”</i> She smiles sheepishly. Trying your best not to chuckle, you straighten yourself out and pet the amorous kitten between her ears, letting her know that you forgive her. She smiles in relief and settles in to lean against you, content with spending the rest of your time together this way.");
			break;
		case 6:
			output("You hear a soft mewling next to you while you relax against the bench. Turning to Fisianna, you see that she is looking at you with glimmer in her golden eyes that tells you she really wants something. You can’t help but smile at her overly cute display and gently pat your lap, welcoming her to climb on.");
			output("\n\nFisi’s face lights up as she eagerly accepts the invitation, rising up from the bench to settle down sideways onto your lap. Fisianna leans into your chest, happily purring while watching the passersby go about their business.");
			break;
		case 7:
			output("You can feel the bench vibrating dully beneath you as you relax. Moments later, you feel Fisianna’s head nuzzling into your shoulder as she tries to get your attention with her animalistic affections. You laugh and wrap an arm around her, stopping to scritch under her soft, rounded chin. On contact, the feline’s ears twitch and flatten against her head. She has a blissed out expression on her face, and her purring intensifies as you gently pet her.");
			break;
		case 8:
			output("You feel a furred arm wrap itself around yours while the two of you relax on the bench. Fisianna gives you a light tug while she leans in to peck your cheek.");
			output("\n\n<i>“I love you so much, [pc.name]. Just thought I’d tell you that!”</i> she says sweetly as she rests against you. You return her affections with your own kiss, and the two of you spend a pleasurable few moments in each other’s arms.");
			break;
		case 9:
			output("Fisianna wraps her furred arms around one of yours, pulling it close to herself and squeezing it tightly. When you turn your head to look at her, she has a very anxious expression on her face while she gazes at you.");
			if(pc.isNice()) output("<i>“You look worried about something. What’s the matter?”</i> you ask Fisianna gently.");
			else if(pc.isMischievous())	output("<i>“Alright, alright! I’m not going anywhere! What’s gotten you so worked up?”</i > you ask Fisianna lightheartedly.");
			else output("<i>“Alright, something’s obviously got you bothered. Spit it out.”</i > you tell Fisianna bluntly.");
			output(" Your lover fidgets in her seat for a few moments before inching closer to hug you.");
			output("\n\n<i>“I... I just worry about you sometimes while you’re away on the Rush, about all the dangers that might await you - or that you might have already had to face; about how soon you would come back to me... or even if at all. I don’t know if I could handle potentially losing you...”</i> Fisianna sniffles and buries her head into your side. With your free arm, you reach around to gently pet the feline, stroking your fingers through her long hair, telling her everything will be okay and that you’ll make sure to come back in one piece for her.");
			break;
		case 10:
			output("While looking ahead and enjoying the companionable silence the two of you are sharing, you feel something long, skinny and furry start to snake up and around your body. A second tendril-like object coils itself around your midsection, squeezing close to your form. The moment you look towards your lover, she flashes you a sweet smile, and you feel her tails’ grip tightening gently. Their embrace feels lovely, and when she wraps her arms around your torso, you feel as comfy as if you were wrapped with a downy blanket.");
			output("\n\nYou wrap your arms around Fisianna in appreciation for the warm snuggle and gently scritch her behind the ears. She coos at the returned gesture of affection and begins to purr in your arms. The two of you spend the next few minutes cuddling comfortably.");
			break;
		case 11:
			author("Nnxx");
			output("While your half-cat lover is looking away, you wrap your arms around her chest and gently pull her against you. She emits a cute squeak, surprised by your action and turns around only to be greeted by a deep kiss.");
			output("\n\nAfter pulling away from her lips, you spend several moments lost in her golden gaze, gently running one hand through her hair and keeping her close to you with the other. Eventually, your kitty lover wraps her arms around your neck and pulls you into a deeper and longer kiss.");
			output("\n\nWhen you finish making out with Fisianna, she nuzzles on your shoulder while you both enjoy the tranquility, the relaxing purr from your feline lover being the only sound you pay attention to.");
			break;
		case 12:
			author("Miakoda");
			output("Without saying a word, Fisianna gently scoots over to you. She then lifts her legs onto the bench and lays her head down on your lap, effectively turning it into a pillow. After a brief moment of relaxation, she begins to purr slightly, sending gentle vibrations through the seat and directly into you. She looks up towards your face, her golden eyes quickly finding yours.");
			output("\n\n<i>“It’s ok if I just lay my head here, right [pc.name]? You’re just so comfy...”</i> She murmurs, her last words slowly drifting away. Instead of giving a direct answer, you bring your hand to her head, gently scritching between her perked feline ears, while your other hand softly wraps around her waist. As a result, Fisianna begins to purr more deeply, letting herself melt under your touch. You can see a faint smile curl on her peachy lips, and you can’t help but smile as well. Leaning back against against the bench, you let yourself enjoy the sensation of Fisi’s purring while the two of you sit together.");
			break;
	}

	IncrementFlag("FISI_TIMES_CUDDLED");
	processTime(10);

	if (pc.hasHardLightEquipped() && flags["FISI_TIMES_VAG"] != undefined && flags["FISI_HL_PANTIES"] == undefined && rand(4) == 0) {
		addButton(0, "Next", cuddleFisiHLI);
		return;
	}
	
	addButton(0, "Next", cuddleFisiBack);
}

public function cuddleFisiBack():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	
	output("<i>“Hehe, that was a lot of fun, [pc.name]! Did you want to cuddle a little more, or did you feel like doing anything else? I’m up for anything you have in mind!”</i> Fisianna smiles sweetly at you, patiently awaiting your decision.");
	
	fisiMainMenu(true);
}

public function cuddleFisiHLI():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();

	output("<i>“Say, [pc.name], I’ve been thinking. Usually whenever we’re together and when we... erm... ‘fool around’, we always wind up going to my place. I’ve always loved your company there, but I’ve been wondering what it would be like at </i>your<i> place. I’d love to see it whenever we would get the chance... M-maybe spend a night there together.”</i> Fisianna blushes furiously while she shyly looks away towards the palm trees ahead. <i>“T-that is, if you want to...”</i>");
	output("\n\nYou think for a moment about inviting the feline aboard your ship for a night alone. While you normally wouldn’t have any problem going there with most other people, ");
	if(crew(true) == 0) output("it’s admittedly very empty and not very homey.");
	else output("you feel that Fisianna could get a little worked up upon meeting some of your crewmates.");
	output(" You spend some time figuring out a solution, but then realize that while you are on Tavros you ");
	if (visitedNursery()) output("supposedly");
	output(" have access to a perfectly comfortable private apartment on the Nursery deck. ");
	if (visitedNursery()) output("It has a lot of the things that you had while growing up, so what better place to bring a date than there?");
	else output("Surely, a room your Dad left you to stay in while preggers can’t be <i>that</i> bad.");
	output("\n\n<i>“Sure, I have a place around here that we can go to for the night. Did you want to go tonight or-?”</i> you ask before being cut-off mid question.");
	output("\n\n<i>“Yes! Yes! Yes! I’d <b>love</b> to!”</i> Fisianna is practically bouncing in her seat. She is grinning giddily while her tails waggle in an orange and white blur behind her. The excited feline doesn’t bother hiding her feelings this time when she gives you a tight hug, her twitching ears tickling your face all the while. When she lets go, she’s still all smiles as she stands up from her seat.");
	output("\n\n<i>“So, where to, [pc.name]? I’m dying to see where you live!”</i> she asks jovially while you straighten yourself out and rise from your seat. You laugh at the feline’s eagerness and wave your hand invitingly to her, beckoning her to follow.");
	output("\n\n<i>“This way,”</i> you croon to Fisianna. She follows without hesitation as the two of you make your way to the elevators in the center of the plaza.");
	output("\n\nWhen the elevator stops and lets you off at the Nursery deck, you lead Fisianna past the foyer and up the stairs to the second floor. The feline’s eyes and ears are a blur, taking in her surroundings while the two of you make your way to your personal apartment.");
	output("\n\n<i>“I-is this your own <b>personal</b> nursery?”</i> Fisianna asks while she marvels at the sheer amount of rooms spread across the grandiose deck. After seeing you nod your head in confirmation, the feline’s eyes open wide in shock.");
	output("\n\n<i>“R-really? Wow... your father really must have went all-out for you: to get a whole deck on Tavros just for you and your children! I can’t say that I’m not a little envious...”</i> she adds wistfully with a distant look on her face. In her moment of reverie, you catch the corners of her mouth curl into a slight smile while she thinks aloud. <i>“Mmm... to think that all manner of children can grow in such a well-to-do environment, being well taken care of by dedicated staff and maternal figures alike. I wonder: if I’d ever have children, would they be really happy here...? I would obviously visit them as often as I can");
	if (ChildManager.numChildrenAtNursery() > 1) output(", and they would love to play with all their brothers and sisters");
	output("...”</i> Fisianna looks up towards the ceiling, deep in thought. You can’t help but chuckle at the catgirl’s errant musings, which snaps her out of them when she hears you. She blushes dark pink as she avoids your gaze, trying her best to pretend that she didn’t say anything.");
	output("\n\nWhen the two of you arrive at your apartment, Fisianna waits patiently while you open the door and welcome her to your home. Once you enter, your lover follows you inside, her eyes and ears still busily darting about. After briefly showing her your kitchen, living room and dining room areas, you lead her to your bedroom. Once inside, the catgirl immediately starts to curiously poke and prod a few devices scattered about the room.");
	output("\n\n<i>“Wow, your place looks very nice! It’s certainly a lot more simplistic than I was expecting from one growing up under one of the wealthiest business magnates in the galaxy...”</i> Fisianna walks around your bed to point out a few posters on one of your walls. <i>“Oh, you’re a fan of </i>Space Wars<i>!? I <b>loved</b> this series growing up! I can’t believe they’re still making movies, and even games! They’ve been around for so long!”</i> The excited feline squeals before moving on to the next poster. <i>“And </i>Watchers of the Universe<i>!? It seems we have a little more in common than I initially knew!”</i>");
	output("\n\nShe smiles widely as she moves on from the posters to your old gadgets and gizmos, breathlessly explaining her experiences with similar devices. When Fisianna finally manages to calm down, she looks winded as she smiles shyly. <i>“Hehe... sorry. I-I guess my inner nerd decided to come out there...”</i>");
	output("\n\nYou smile and explain to Fisianna that this genuine, dorky side is one of the things you love about her, regarding your room as a ‘real blast from the past’. After talking more about your shared interests in various old nerd flicks and devices, you settle down on your bed. Your feline companion joins you immediately afterwards and climbs onto your lap. Her peachy lips hungrily seek yours as she presses her whole pliant body into you with a loving passion. Overwhelmed by your lover’s amorous advances, you lay back on the bed, taking her with you as the two of you continue making out.");
	output("\n\nAfter a few moments of sloppy kissing, the two of you wrap your arms around each other. You reach down and attempt to slide a hand under Fisianna’s jeans. Her breath catches the moment she feels it and she separates herself from your mouth with a bright blush and a small frown on her face.");
	output("\n\n<i>“U-um... as much as I want you to do unimaginably ");
	if (silly) output("LOOD");
	else output("lewd");
	output(" things to me, I was thinking we could just... y’know... snuggle together, just for tonight.”</i> The disappointment on your face must be quite apparent, since Fisianna immediately stammers an apology while blushing a brighter red. <i>“I know, sorry if you feel like I led you on, b-but we can uh... snuggle... naked, if that satisfies you?”</i>");
	output("\n\nYou bring a hand up to your chin and look towards the ceiling in exaggerated mock-thought. The feline whines at your acting job. <i>“C’mon, [pc.name]... It’s only for one night here. You’re so ");
	if (silly) output("thirsty");
	else output("insatiable");
	output("!”</i> She nudges your arm playfully. You can no longer keep up your charade and burst into laughter.");
	output("\n\n<i>“Fine, fine! ");
	if (pc.isAss()) output("But remember that you owe me for this,”</i> you tease.");
	else output("Whatever you’re comfortable with doing, Fisi,”</i> you concede.");
	output(" You give Fisianna a parting kiss before you slide off of the bed. <i>“I’ll go get ready then,”</i> you tell her as you grab a nearby towel and head to your shower to freshen up. You can see your lover curiously eyeing a device she initially missed, before you disappear into the bathroom.");
	output("\n\nWhen you’re done showering, you wrap the towel around yourself, and pile your gear ");
	if (!pc.isNude()) output("and clothes ");
	output("in a corner of the room. You come out to find that Fisianna is still examining the same item, though now she has progressed to tinkering with it instead of just looking. You clear your throat to let the neko know that she can use the shower to freshen up now. With a slight start, she puts down the device and grabs a spare towel, but not before giving your body a playful tease with one of her long tails. Now who is being ");
	if (silly) output("thirsty");
	else output("insatiable");
	output("! When she disappears into the bathroom, you make the final preparations before slinking under the bed covers completely nude.");
	output("\n\nThe catgirl finally emerges out of the shower after a ten minute wait and strolls into the room in all her naked glory. Her long hair is a waterfall of orange and white behind her, and her perky tits bounce enticingly with every step. She smiles while she walks over and climbs onto the bed with you. In the warm afterglow of her hot shower, she feels smooth to the touch as you cradle her into your arms. After her head settles onto your [pc.chest], Fisianna softly purrs, picking up in frequency when you begin to stroke her hair. If it wasn’t for the adorable smile she is giving you, by now you would have lost control of your urges and taken things further. Instead you reach down to kiss the top of the feline’s head and can hear her murmur sleepily, <i>“I love you too.”</i> With that, you settle back on the pillow and let her bodily vibrations lull you to sleep.");

	processTime(30+rand(15));

	moveTo("NURSERYG4");
	clearMenu();
	addButton(0, "Next", cuddleFisiHLII);
}

public function cuddleFisiHLII():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);

	output("When you wake up, the first thing you notice is that you no longer feel Fisianna purring. But it’s the second thing you notice that causes your eyes to shoot open. Your lover doesn’t seem to be in bed with you anymore. Furthermore, you can hear very faint whimpers and moans coming from somewhere nearby. Without stirring too much, you take a brief look around the room.");
	output("\n\nYou see Fisianna in the other side of the bedroom sitting down sideways on a chair. You are about to greet her with a good morning, but then notice that her eyes are closed and that her mouth is partially open. Assuming she moved from the bed and fell asleep on the chair, you start to turn in your bed to go back to sleep when you also notice a dim light coming from her belly, as well as subtle hand movements. On closer inspection, you can see that she has underwear on, and not just any underwear, but your own [pc.lowerGarment]! It takes you a moment to realize that the dull light on the feline’s stomach is coming from the hardlight projector.");
	output("\n\nYou can see a furred paw slowly working its way up and down the shaft of light while Fisianna’s hips wiggle in ecstasy. She bites her bottom lip and inhales sharply from hitting a particularly sensitive spot. Her paw’s movements rise in tempo as she works the base of the dildo, and her other hand slips between her thighs to rub at her slit through the fabric. It doesn’t take long before you hear her huff, and with a buck of her hips, she gushes her girlish nectar into your [pc.lowerGarment]. The sweet and tangy smells of her excess arousal fill the air while she continues to ride her orgasm. You can hear her breathing shakily and see her whole body shuddering from the aftermath of her release. After she strokes the light phallus and her spasming cunny a few more times, she slumps against the chair, raising the hand she was stroking her pussy with to her lips. While she laps up her juices, you take the opportunity to speak up.");
	if (pc.isNice()) output("\n\n<i>“Fisi?”</i> you call out to her.");
	else if (pc.isMischievous()) output("\n\n<i>“So, I take it that you like my toy, huh?”</i> you ask her with a big shit-eating grin on your face. ");
	else output("<i>“You just couldn’t help yourself, could you? And I thought you didn’t want to do any funny stuff...”</i> You frown and shake your head in mock-disappointment.");
	output(" The moment you speak up, the sated kitten pops her fingers out of her mouth and mewls in surprise, almost jumping out of her skin and nearly falling off of the chair.");
	output("\n\n<i>“A-ah! [pc.name]! I didn’t know you were watching! I-I mean, I thought it would be sexy if you woke up while I was wearing your underwear, b-but then when I put your underwear on, I accidentally flipped the hardlight on. I-I felt new... pleasurable things I never felt before a-and... well...”</i> Fisianna sinks back into the chair, looking defeated. <i>“Well... no explaining my way out of this one, huh? Curiosity sure killed this cat.”</i> She covers up the blush on her face by facepalming. You slide out of bed to make your way to your embarrassed lover and plant a reassuring kiss on her cheek.");
	output("\n\n<i>“Hey, it’s ok, Kitten. No need to be shy about it. It looked like you were really enjoying yourself with that thing... Tell you what: how about I stop by Aliss’s </i>Mi Amour<i> shop next time I can and get you a pair just like mine? Maybe we can have more fun next time with a toy to share, hm?”</i> you propose to Fisianna. You see a finger on her face slide over, revealing one of her bright, golden eyes.");
	output("\n\n<i>“R-really? You’d do that? T-that... uhm... would be nice, thank you, [pc.name].”</i> She slides her hands off of her face and rises up from the chair to give you a hug. When you release each other after the brief embrace, Fisianna shimmies out of your underwear and hands them to you.");
	output("\n\n<i>“Uh... sorry that I got them wet... It just felt so good...”</i> she says apologetically. You tell her not to worry about it while you put your [pc.lowerGarments] back on. Sure enough, the wet spot on the undergarment feels slightly cold to the touch, but you’ll bear for the time being. You gather the rest of your gear while the both of you get ready to head back to the plaza. Once done, you make your way out of the nursery and head down the elevators to the residential deck.");
	output("\n\n<i>“Thank you again for letting me see your home, [pc.name]! I’d love to be able to do this again with you whenever you have time to.”</i>");
	output("\n\nYou bid Fisianna farewell as she gives you a goodbye kiss and heads home.");

	processTime(120+rand(15));
	if (flags["FISI_HL_PANTIES"] == undefined) flags["FISI_HL_PANTIES"] = 1;

	pc.changeLust(20);

	clearMenu();
	addButton(0, "Next", moveToResidentialLift);
}

public function moveToResidentialLift():void
{
	moveTo("LIFT: RESIDENTIAL DECK");
	mainGameMenu();
}

public function givePantiesToFisi(i:int):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();

	output("<i>“Hey, Fisi. I have a little present for you, but we’ll have to go to your home to open it. Did you want to go there now?”</i> you ask your feline companion, all the while smiling ");
	if (pc.isNice()) output("warmly")
	else output("mischievously")
	output(". She tilts her head slightly to the side and shoots an inquisitive look at you.");
	output("\n\n<i>“U-um, sure, [pc.name], but why at my home and not here?”</i> the feline questions, attempting to scan the bundle in your hand. You rise up from the seat, hiding your present behind your back.");
	output("\n\n<i>“Ah ah ah... you’ll see.”</i> You tut at the catgirl, which prompts a disappointed mewl from her. Conceding defeat for now, your curious girlfriend stands up and leads you to her apartment. Once there, you insist that you go to her bedroom to give her your gift. When the both of you walk into the bedroom, Fisianna sits on the edge of her bed with an excited smile on her face.");
	output("\n\n<i>“So... now you’ve got me really curious, and you know how cats can be when they’re curious, so please show me what you have for me! I’m dying from anticipation!”</i> Fisianna begs, barely able to contain herself. Her tails wiggle behind her in a blur as you start to bring your present to light. When you hold the bunched-up panties in front of you, you unfurl them, fully revealing the underclothing to her. You can see the neko’s face fill instantly with color while her eyes widen in surprise and she looks away in embarrassment.");
	output("\n\n<i>“U-um... [pc.name]. I-I er... thank you, b-but I uh... already have plenty of panties.”</i> Fisianna smiles sheepishly. Before you let her reject your gift, you shift your fingers towards the hem of the panties and turn a hidden dial, letting the hardlight dildo manifest from the unassuming fabric. The catgirl yelps in shock and almost falls backwards onto the bed when the dildo nearly materializes right in her face.");
	if (silly) output("\n\n<i>“Nyaaa!");
	else output("\n\n<i>“Ack!");
	output(" P-please... a little warning next time would be nice...”</i> Fisianna sighs while she tries to calm down and looks wonderingly at the protruding light-phallus. <i>“I-is this what I think this is?”</i> Her golden eyes are wide with curiosity as she brings a clawed finger up to the panties. You nod in confirmation, to which your lover gives you a look in awe. <i>“A-and this is for me?”</i> she asks, running her finger down the length of the hardlight dildo. Another nod from you nearly sends the catgirl to tears.");
	output("\n\n<i>“Wow... this is really nice of you! I’ve been wondering about these things ever since... uh....”</i> Fisianna trails off with a slight cough and a bright pink blush on her face. <i>“Really, [pc.name], thank you so much!”</i> The catgirl takes the panties in her paws, thoroughly examining the fabric. You can see her eyes light up like a child receiving a new toy while she analyzes the mechanisms that allow the dildo to manifest and the cloth that makes up the undergarment.");
	output("\n\n<i>“Mmm... this is an incredible piece of work indeed. From what I understand of this fabric, it can change colors and patterns via an electrical pulse. I think this can be changed through an application on my tablet. I wonder if they have a preset my preferred design? If not I can always just manually manipulate this to the design I want. I’m sure I can do it!”</i> the feline muses to herself. <i>“As for the holo-light projectors themselves, I bet I could also change the shape and length of the dildo to give more of a variety of choices! Pretty sure I’d void any warranty, but that shouldn’t be a hard thing to do. I bet I could even make a dial for how sensitive the neural feedback is on this thing!”</i> Fisianna continues on, talking at length about different modifications she wants to make to the panties before you snap her attention back to you with a shrill whistle and a <i>“Terra to Fisi. Come in!”</i>");
	output("\n\n<i>“O-oops... inner nerd​ came out again...”</i> Fisianna laughs sheepishly. <i>“I suppose I should try these on for you then.”</i> She slowly raises herself from the bed and unbuckles her jeans. With a <i>thwump</i>, they fall in a heap around her feet. Fisianna’s lacy cat-patterned panties are next to follow as she slowly shimmies them down her thighs and past her fur-covered feline legs in a tantalizing strip tease. Once her panties join her jeans by her feet, she steps out of them and picks her undergarment up.");
	output("\n\n<i>“Before I put these on, I thought I’d give you a little something in return as thanks. Close your eyes please.”</i> You do so and feel Fisianna slip something into your hand while giving you a peck on the cheek. You look down at your hand, and sure enough, the feline’s cat-print panties are in your hand, slightly warm from just being freshly worn, and her scent emanating powerfully from them. It takes every ounce of your being to not bury your face in them at this moment, but Fisianna snaps your attention away just in time, letting you know that she has your own present wrapped around her waist.");
	output("\n\n<i>“Sooo? Like it? I know I do!”</i> The catgirl giggles while she twirls on the spot, showing off her curves as the hardlight dildo bobbles in front of her. After a minute of modeling her new clothing for you, Fisianna shuts off the artificial phallus and puts her jeans back on. She turns towards you once more, looking at you in an endearing manner.");
	output("\n\n<i>“I still can’t thank you enough for this present, [pc.name]! I can’t wait to tinker with this and give it a try!”</i> She walks up to you and wraps her arms around you in a tight hug. You return her affection in kind, pulling back afterwards to plant your [pc.lipsChaste] onto hers. When the kiss becomes more intense, your feline lover jumps into your arms and presses her face closer to yours. You grab her soft bottom for support as she starts to grind against you from her precarious position. When you feel you’re about to lose your grip, you throw Fisianna onto the bed and follow her only a moment after.");
	output("\n\n<i>“Y’know... I still owe you from our cuddle session before. I still want you to do unimaginably lewd things to me... right... ");
	if (silly) output("meow");
	else output("now");
	output(",”</i> Fisianna practically purrs the last part as she looks into your eyes with unadulterated lust. It seems giving her those panties has put her in a very amorous mood. Thoughts swim through your head on how you would like to take your feline lover.");
	output("\n\n<b>You’ve acquired Fisianna’s panties!</b>");

	pc.createKeyItem("Panties - Fisianna's - Lacy, white panties with a cute cat pattern.");
	pc.inventory[i].quantity--;
	if(pc.inventory[i].quantity <= 0) pc.inventory.splice(i, 1);

	flags["FISI_HL_PANTIES"] = 2;
	processTime(45+rand(10));
	moveTo("RESIDENTIAL DECK FISIS APARTMENT");
	sexFisi(true);
}

public function massageFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();

	if (flags["FISI_TIMES_MASSAGED"] == undefined) {
		output("While the two of you are relaxing side by side, Fisianna sees it fit to wrap her arms around you lovingly. Normally, you would welcome the embrace more readily, however thanks to your past strenuous activities, you’re feeling ");
		if (pc.hasStatusEffect("Worn Out") || pc.HP() <= pc.HPMax() * 0.25) output("as if you’re being squeezed by a powerful, vice-tight grip");
		else if (pc.hasStatusEffect("Very Sore") || pc.HP() <= pc.HPMax() * 0.5) output("pretty tender");
		else output("a little sore");
		output(" under her furred limbs. You silently wince");
		if (pc.HP() < pc.HPMax()) output (" in pain");
		output(", trying to weather the hug out as best as you can. Fisianna is quick to notice the grimace on your face, however, and immediately loosens her grip.");
		output("\n\n<i>“O-oh! I’m sorry, [pc.name]... A-are you hurt?”</i> The color on Fisianna’s face drains rapidly while she flusters over you.");
		if (pc.HP() < pc.HPMax()) {
			output (" Truth be told, ");
			if (pc.HP() <= pc.HPMax() * 0.25) output("you feel like you were hit by a space freighter.");
			else if (pc.HP() <= pc.HPMax() * 0.5) output("you <i>are</i> feeling pretty battered up right now.");
			else output("you do feel kind of scratched up. ");
		}
		output("\n\nHer hands gingerly rub across your arms and legs. She stops and flinches whenever you jump from her hitting an especially tender spot, but continues quickly afterwards. Once she is done, she looks into your eyes with ");
		if (pc.hasStatusEffect("Worn Out") || pc.HP() <= pc.HPMax() * 0.25) output("a surprisingly stern expression");
		else if (pc.hasStatusEffect("Very Sore") || pc.HP() <= pc.HPMax() * 0.5) output("very worried expression");
		else output("frown");
		output(" on her face.");
		if (pc.hasStatusEffect("Worn Out") || pc.HP() <= pc.HPMax() * 0.25) {
			output("\n\n<i>“[pc.name]! Your body is an absolute train wreck right now! H-how in the world are you still able to go on in that state?”</i> Fisianna’s eyes begin to water while she shakes her head, though her serious expression is still unfaltering on her face. She then grabs your hand, more forcefully than you are used to from her. <i>“Come on. ");
			if (pc.HP() <= pc.HPMax() * 0.25) output("If you insist on not taking care of yourself and going to a hospital, then ");
			output("I’m taking you to my home to treat you, and I’m not taking ‘no’ for an answer. You really shouldn’t be pushing yourself this hard.<i>“");
		}
		else if (pc.hasStatusEffect("Very Sore") || pc.HP() <= pc.HPMax() * 0.5) output("\n\n<i>“Y-you’re really hurt! Please, don’t try to tough it out or anything. I know you’re a Rusher, but you really need to take a break to recuperate too! Let me help you... Please... I’m really worried for you.”</i> Fisianna looks into your eyes with tears starting to well up in hers while she pushes her hand into yours. She seems like she is genuinely worried about you. Will you take her up on her offer to help you feel better, or would you rather hang in there and wait for another opportunity to recover?");
		else output("\n\n<i>“Mmm... you seem to be quite a bit sore. I could take care of that - i-if you want me to, of course? I’d hate for it to affect you if you come to any danger. I wouldn’t want that on my conscience if it was anyone else, let alone you, [pc.name]...”</i> Fisianna eyes you with a fretful look and gently takes your hand. She looks like she is genuinely worried about you. Will you take her up on her offer to help you feel better, or would you rather tough it out?");
		if (pc.hasStatusEffect("Worn Out") || pc.HP() <= pc.HPMax() * 0.25) {
			addButton(0, "Yes", massageFisiYesI, undefined, "Yes", "It doesn’t look like you have much of a choice in this matter. Fisianna’s mind is set.");
			addDisabledButton(1, "No", "No", "It doesn’t look like you have much of a choice in this matter. Fisianna’s mind is set.");
		}
		else {
			addButton(0, "Yes", massageFisiYesI, undefined, "Yes", "Take her up on her offer for some good ol’ medical care, with love!");
			if (silly) addButton(1, "No", massageFisiNo, undefined, "No", "You can shrug off the pain for now. You eat pain for breakfast!");
			else addButton(1, "No", massageFisiNo, undefined, "No", "You can shrug off the pain for now.");
		}
	}
	else {
		output("You bring up the prospect of receiving another massage from the lovely catgirl. Her eyes light up in surprise upon your request.");
		output("\n\n<i>“O-oh, of course! You need only to ask! Let me just check you out really quickly...”</i> Fisianna’s soft hands search your body for any sore or tender spots with a caring gentleness. After about a minute of doing this, she finally lets you go with a ");
		if (pc.hasStatusEffect("Worn Out") || pc.HP() <= pc.HPMax() * 0.25) {
			output("very worried look");
		}
		else if (pc.hasStatusEffect("Very Sore") || pc.HP() <= pc.HPMax() * 0.5) {
			output("concerned look");
		}
		else if (pc.hasStatusEffect("Sore") || pc.HP() < pc.HPMax()) {
			output("thoughtful frown");
		}
		else {
			output("relieved expression");
		}
		output(" on her face.");
		if (pc.hasStatusEffect("Worn Out") || pc.HP() <= pc.HPMax() * 0.25) {
			output("\n\n<i>“I swear, [pc.name], you’ll be the end of me someday... I really <b>really</b> worry for you out there, and seeing you like this just...”</i> Fisianna trails off, visibly shuddering from an unpleasant thought. <i>“I just can’t bear the thought of potentially losing you if things would have turn out even worse for you. I don’t know what I would do without you...”</i> She turns to you with weary eyes after shaking off the unwelcome possibility. <i>“I’ll do whatever I can to help you along the way while you’re out in the Rush. Just please, for my poor heart, please be more careful in the future...<i>“");
		}
		else if (pc.hasStatusEffect("Very Sore") || pc.HP() <= pc.HPMax() * 0.5) {
			output("\n\n<i>“[pc.name]! You’re hurting... and pretty badly at that. I know the Rush is dangerous but... seeing you like this never puts my heart at ease.”</i> Fisianna stares into your eyes with a sorrowful expression on her face. <i>“Of course I’ll fix you up. I would be more than happy to.<i>“");
		}
		else if (pc.hasStatusEffect("Sore") || pc.HP() < pc.HPMax()) {
			output("\n\n<i>“Mmm... you do seem like your muscles are a little tender. I’ll help take care of that, no worries! After all, it’s best to go out there in peak condition!”</i> Fisianna dotingly smiles at you.");
		}
		else {
			output("\n\n<i>“Mmm, well you seem like you’re perfectly fine to me... thank goodness,”</i> Fisianna whispers, the last part more to herself than to you. <i>“Still, if all you want is a massage, I would be more than happy to help you limber up and relax.”</i> She smiles dotingly at you.");
		}

		addButton(0, "Next", massageFisiYesI);
	}
	processTime(10);
}

public function massageFisiYesI():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();

	if (flags["FISI_TIMES_MASSAGED"] == undefined) {
		output("You look towards Fisianna’s hand and agree to have her massage you.");
		output("\n\n<i>“Great! Let’s go then. I have a nice and comfortable futon I can use for you, with some medicinal oils and everything.”</i> She gently squeezes your hand in reassurance.\n\n");
	}
	output("With that, the two of you rise up from the bench. Fisianna walks ahead of you, leading you towards her apartment. Once the two of you arrive, she ushers you inside to take a seat on the living room sofa.");
	if (pc.HP() < pc.HPMax()) {
		output("\n\n<i>“Mmm alright, first off, let’s take care of any cuts and bruises. We don’t want those becoming an issue later on during the massage. One moment while I get my first aid kit.”</i> Fisianna starts towards her spare bedroom door, but stops just short of it before turning back around to you. ");
		if (!pc.isNude()) output("<i>“In the meantime, can you uhm... strip down for me? It’ll be hard to apply any bandages and ointments otherwise,”</i> she adds hurriedly, with a pink blush already flooding onto her face. ");
		else output("In the meantime, please relax as best as you can for me,”</i> she instructs you with an almost professional tone to her voice.");
		output("When she disappears to her bedroom, you take the time to ");
		if (!pc.isNude()) output("strip out of your gear and ");
		output("recline to a comfortable position while you wait.");
		output("\n\nFinally, the impromptu nurse emerges from her workroom with a hi-tech looking medkit. You grin to yourself, figuring that this is one of the perks of having close family ties to the medical business. You sit up in your seat once Fisianna places the kit on the table next to you. A blush starts to creep across her face when she makes eye contact with your naked form, but she stays completely composed otherwise.");
		output("\n\n<i>“I’ll need to scan for any injuries you might have sustained. The massage won’t be quite as enjoyable with anything like those lingering around...”</i> With a button click, Fisianna’s medkit opens with a soft ‘psshh’, revealing its contents. Inside is a wide array of top-of-the-line bandage wrappings, ointments and gauzes, as well as some high tech tools like an electric thermometer, a stethoscope, and even a sphygmomanometer! Fisianna reaches for a complex-looking scanner on the edge of the medkit and points it at your mid-section.");
		output("\n\n<i>“Okay, try not to move for a few seconds, [pc.name]. The scan will be inaccurate if you make any sudden movements.”</i> Fisianna instructs. You relax back in your seat once more, allowing for your lover to do her work. After about fifteen seconds, she speaks up again. <i>“Alright, you’re good to move again. Thankfully, any damage done to you is pretty much all topical, so just a few ointment applications to your cuts and bruises should be all we need to super-speed the healing process! Let’s get to it then!”</i> she says with audible enthusiasm in her voice.");
		output("\n\nOver the course of the next few minutes, Fisianna dresses your wounds with fast-absorbing oils. Within seconds of each application, you can feel the medicines tingle wherever you were hurting, causing a delightful sense of relief to flow through you. By the time she is done, you feel virtually no pain on your cuts anymore! You rub your [pc.skinFurScales], and sure enough, the ointments have already been fully absorbed by your body, leaving behind no discomfort or residue. Fisianna smiles in satisfaction when she no longer sees you wincing from simply touching your previously sensitive abrasions.");
		output("\n\n<i>“Phew, I’m glad you feel all better, even moreso that my brother and sister hooked me up with the best JoyCo has to offer!”</i> Fisianna pats her medkit a few times. She then looks wistfully towards the ceiling. <i>“I-I suppose I should also thank my upbringing for this as well. Even though it wasn’t the most enjoyable of experiences, I’m still thankful I’ve retained knowledge of at least the basics.”</i> With a shake of her head, she places the medicines and tools back into the medkit and closes it back up.");
	}
	output("\n\n<i>“Alright, I’ll just need a few minutes and I’ll be right back with you, okay, [pc.name]?”</i> After you nod your head in acknowledgement, Fisianna starts for her bedroom door. You stare after her for a while when she suddenly turns around and ");
	if (!pc.isNude() && pc.HP() >= pc.HPMax()) output("calls back, <i>“Oh, do you mind stripping down as well? It’ll be hard to do anything with clothes on, admittedly.”</i> She disappears into her bedroom immediately after. Following her instructions, you shuck your gear off and lay them aside.");
	else output("shoots a sweet smile at you before disappearing into her bedroom.");

	processTime(15+rand(10));
	moveTo("RESIDENTIAL DECK FISIS APARTMENT");
	clearMenu();
	addButton(0, "Next", massageFisiYesII);
}

public function massageFisiYesII():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(1);

	output("For the next few moments, you sit patiently in silence while you wait for Fisianna to reappear. With nothing else to do, you idly fumble with a nearby remote and press a few buttons in hopes of turning the holoscreen on. Oddly, when you press the power button to what you are sure of is the controller to the television, the screen doesn’t turn on, but instead some admittedly relaxing music starts playing. Right at that moment, a white towel flashes by your vision and falls on your lap, while at the same time, a pair of orange and white arms wrap around your shoulders from behind, enveloping you in a gentle hug.");
	output("\n\n<i>“Hey, music! Good idea!”</i> Fisianna giggles past your ear. <i>“It’s a universal remote; it controls a good amount of appliances around the house. You just happened to trigger the music player, so sorry if you wanted to watch something while you waited. Sorrier still that it took me a bit long to get back to you but... I needed to ‘dress for the occasion’.”</i > Curious, you turn around to your lover, and ");
	if (flags["FISI_TIMES_MASSAGED"] == undefined) output("double-take");
	else output("smile");
	output(" when you see what sort of attire she has picked...");
	output("\n\nFisianna looks to have changed out of her usual garb and into a familiar oversized baby-blue t-shirt dress that stops just around the top of her thighs. The neck-hole of the shirt is large enough to expose her smooth shoulders, and look like they’re dangerously close to slipping past them. You can clearly see her white bra-straps poking out from under her shirt as well. Looking more closely, you can see a large black paw print on the chest. You just barely manage to catch a glimpse of a pair of white panties underneath the long hem.");
	output("\n\n<i>“Hehe, you like it? I mainly wear it when I’m at home by myself, but I thought it might be good to have us both wear something comfy.”</i> Fisianna grins at you while she makes her way around the couch to lay a futon on the floor in front of it. After you give your approval, she rolls out the mat and places various massaging oils next to it. <i>“I’m glad you like it though! Now, why don’t you wrap that towel around you so we can get started?”</i> she asks excitedly while kneeling down to pick out which oils to use.");
	output("\n\nYou promptly rise up from the couch and wrap the short towel around your waist. Afterwards, Fisianna gently pats the futon in front of her, beckoning you to lie down. You comply and spread yourself on the mat, lying on your front-side and crossing your arms on the flat, soft pillow beneath your head.");
	output("\n\nAt the very moment that you fully settle down, Fisianna pops open one of the bottles of aromatic oil next to her and pours some onto her hand. She then spreads the oil along your back, gently kneading the warming liquid into your [pc.skinFurScales]. While she works the ointment into you, she delicately pokes and prods at certain places on your back with her soft paw pads, feeling for any tense spots and knots. After she’s finished working on your back, you can feel her hesitate slightly before she passes over your glutes, though not without giving one of your buttcheeks a gentle squeeze. She then moves on to the back of your [pc.legs] and spreads more of the oil there in the same fashion. Finally, she spreads the last bits around your arms, working hard to cover as much surface area as possible on you.");
	output("\n\n<i>“Mmm, okay. That should be everywhere. Just tell me if anything starts hurting, alright?”</i> Fisianna asks in a soothing voice. You groan in response when she begins the massage itself, starting from your [pc.legs]. She clearly doesn’t have the same expertise as you might expect from a professional masseuse, but her unique hands definitely help make up for the difference. They are plush enough to not strain you further, yet at the same time firm enough to grind down deep into your ");
	if (pc.isSore()) output("sore ");
	output("muscles.");
	output("\n\nOnce she has taken care of all of the ");
	if (pc.isSore()) output("sore");
	else output("tight");
	output(" spots on your [pc.legs], Fisianna’s hands work their way up your body, gently kneading at your posterior before moving on to your lower back. A sigh escapes your lips when you feel her rub all of the right areas");
	if (pc.hasTails()) output(", which causes your [pc.tails] to happily wag in response");
	output(" while her paws creep further upwards. When she reaches your upper back, she applies the most pressure near the middle, working her way towards your sides. You groan again, though more with relief than discomfort, as you feel your bones crick and crack with each circular grinding motion she makes. ");
	if (pc.hasWings()) output("Fisianna’s hands are especially delicate when she nears the tightly grouped muscles at the base of each of your [pc.wings], making sure to loosen them up so they can beat strongly when you need them to. ");
	output("Finally, she makes her way up to your shoulders, tenderly massaging them to the point where they feel nice and limber.");
	output("\n\nAfter Fisianna finishes massaging your shoulders, you can feel her soft paws pull away from your body. You wish that she wasn’t done yet, but you are feeling <i>much</i> more relaxed than you did to begin with, so much so that you find it difficult to will yourself to move again.");

	processTime(15+rand(15));
	if (pc.statusEffectv1("Sore Counter") > 1 ) soreChange( -3);
	else pc.changeLust(0, true);

	clearMenu();
	addButton(0, "Next", massageFisiYesIII);
}

public function massageFisiYesIII():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(1);
	
	output("<i>“Whew... that felt amazing, Fisi.”</i> You sigh again in bliss. Out of the corner of your eye, you can see her smiling visage look down at you adoringly. Suddenly you see her shift out of view before you feel a pair of furred legs straddle your bottom.");
	output("\n\n<i>“Hehe... it’s not quite over yet, [pc.name]. I want to make absolutely sure that I get every spot at once for you,”</i> Fisianna says with a sly undertone to her voice. Well, she hasn’t steered you wrong yet, so you comply and lie still. Soon enough, you can feel her carefully lie down along your back, ");
	if (pc.hasWings()) output("nestling between your wings and ");
	output("wrapping her arms under your shoulders to cradle you. You can feel her warm breath on your the nape of your neck while she nuzzles into it. She’s very light, so you feel very little pressure between her and the futon. It’s quite comfortable, really. However, nothing could prepare you for what happens next.");
	output("\n\nOnce you feel Fisianna breathily sigh into your neck, she begins to purr. Her undulations of contentment and pleasure immediately wash over your entire body like a refreshing wave of cool water. She wraps her legs tightly around your sides, making sure you can feel the full effects of her bodily vibrations from top to bottom. All the while during this, she plants light kisses onto your neck, sending intense tremors down your spine with each one.");
	output("\n\n<i>“Mmm... does it still ache anywhere, [pc.name]?”</i> she murmurs in-between kisses.");
	output("\n\n<i>“Ooooh...”</i> is all you can blurt out in response as your mind draws a total blank for anything intelligible to say to your lover. You feel as if you are completely melting into nothingness under her, and loving every waking moment of it.");
	output("\n\nAfter a few moments of this, you gently lift Fisi’s arms and roll yourself onto your back, careful to stay under the still purring neko so that you are hugging her close to you. She looks lovingly into your eyes as you pull her into a kiss. You silently thank her to taking such good care of you, putting those emotions into the embrace while you snuggle together. When you break the kiss, she cradles your face with one of her soft paws.");
	if (pc.HP() < pc.HPMax() || pc.isSore()) output("\n\n<i>“I hope I could at least help a little for your future adventures this way. I still worry for you whenever you aren’t here, but... I thank goodness anytime you come back at least relatively unharmed. I’ll be wishing that you find your father’s probes as soon as possible so I don’t have to keep worrying.”</i>");
	else output("\n\n<i>“I’m glad for any chance I could do this for you, especially for moments like this... I know I can’t keep you here forever, but I do hope that you can find your father’s probes as soon as possible so you could possibly be here all the time.”</i>");
	output(" Fisianna smiles wistfully. You pet her between her fuzzy ears, assuring her that you will do your best in finding your father’s legacy for her sake, as well as yours.");
	output("\n\nWith a parting kiss, the two of you rise up from the futon and pack up from the massage session. After you return Fisianna’s towel and ");
	if (pc.isNude()) output("gather your belongings");
	else output("equip your [pc.gear]");
	output(", you stretch and find yourself completely loose and limber, fully ready to tackle whatever challenge comes your way.");
	output("\n\n<i>“Please don’t be afraid to ask me to do this for you again if you feel hurt in any way, [pc.name]. I would, as always, be more than happy to make sure you’re at least in tip-top shape.”</i> Fisianna assures you, affection full in her voice. With a final kiss and a wave goodbye, you head out of her apartment and onto the street in front of it. After that massage, how could you <i>not</i> want another one?");

	pc.changeHP(pc.HPMax());
	pc.changeEnergy(pc.energyMax());

	currentLocation = "RESIDENTIAL DECK 13";
	IncrementFlag("FISI_TIMES_MASSAGED");
	processTime(30+rand(10));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function massageFisiNo():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	
	output("You tell Fisianna that you are fine, and that you can deal with your discomfort another time. In response, she looks down towards your interlaced hands.");
	output("\n\n<i>“I-I... but...”</i> she stammers, struggling to find the words to say to you. With a small sniffle, Fisianna speaks up again. <i>“A-alright, [pc.name], but please... <b>please</b> be very careful for me. It really pains me to see you hurt and not be able to do anything about it. M-maybe it’s partially from having a medical upbringing, but... it’s mainly because I love you so much. Promise me you’ll still be in one piece when this is all over,”</i> Fisianna pleads. You nod your head, and gingerly hug your caring lover, assuring her that you will be okay.");
	
	processTime(5);
	clearMenu();
	addButton(0,"Next",fisiMainMenu, true);
}

public function betFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();

	output("<i>“Say, I was actually thinking, how about we do something a little more... </b>stimulating</b> this time around?”</i> you ask your feline lover coyly. Her ears twitch while she gives you a questioning look.");
	output("\n\n<i>“U-um... sure. What did you have in mind?”</i> Fisianna inquires, with a small hint of excitement in her voice.");
	output("\n\n<i>“Well, I was wondering if we could play a little bit of video games together, perhaps with a special ending?”</i> you suggest, dramatically dragging on the last words for extra effect. Fisianna chuckles at this.");
	output("\n\n<i>“As much as I like the idea of mixing play with pleasure, don’t you think playing video games <b>now</b> would kind of break the mood?”</i>");
	output("\n\nYou shake your head. <i>“No, no. What I meant was that we could have a little bet... a <b>sexy</b> bet.”</i> Fisianna’s eyes snap wide open as she gasps and her face flushes with color for a split second before it returns to normal. Her competitive gaming nature gets the better of her however, and as a result, her peachy lips curl into a grin while her eyelids lower seductively.");
	output("\n\n<i>“Go on, [pc.name], I’m listening,”</i> the feline purrs while stroking your arm delicately with a finger. Trying your best not to jump on the playful kitten right then and there, you continue.");
	output("\n\n<i>“Well, I thought we could play a little game of COV 8 against each other. First to three kills wins. Loser has to do a sexy favor for the winner, as long as it isn’t anything we aren’t comfortable with. Sounds good to you?”</i> you propose to Fisianna. Her smile widens so much that it almost looks predatory.");
	output("\n\n<i>“Oh, you’re on! I hope you know there’s no way I’m gonna let you win easily with a prize like this!”</i> Your lover giddily slides off of the bed and rushes out of the room. You follow her soon after, and by the time you meet her in the living room, she already has the game fully set up for the both of you. With a small laugh, you settle down on the couch next to Fisianna and strap your holo-harness on, jumping straight into the action.");

	IncrementFlag("FISI_TIMES_BET");
	if (flags["FISI_TIMES_WON"] == undefined) flags["FISI_TIMES_WON"] = 0;
	if (flags["FISI_TIMES_LOST"] == undefined) flags["FISI_TIMES_LOST"] = 0;
	processTime(15+rand(5));
	clearMenu();
	addButton(0,"Next",betFisiWinLossRouter);
}

public function betFisiWinLossRouter():void
{
/*	var won:Boolean = false;
	var misses:int = 0;
	
	for(var i:int = 0; i < 20; i++)
	{
		if(rangedCombatMiss(pc,chars["FISIANNA"],-1,2.5)) misses++;
	}

	if (misses <= 1) won = true;
*/
// Lets ignore the skills and jusst go with a random 2in3 chance so lowlevel and highlevel PCs geht to see the scenes

	var won:Boolean = (rand(3) != 0);

	if (won) betFisiWinI();
	else betFisiLoseI();
}

public function betFisiWinI():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	showName("\nVICTORY!");
	
	output("The two of you play extremely cautiously while you search for each other in the densely forested map. The fact that the both of you are wearing camouflaged armor doesn’t exactly help with that. A few minutes into the match, you come to a small clearing. You have your weapon at the ready, keeping an eye out for any signs of movement. At the last second before turning around, you notice a metallic glint in the distance. Instinctively, you dive to the ground as a bullet whizzes past your head, barely grazing you. In the same leaping motion, you raise your rifle towards where you saw the bright flash and fire. You manage to hit home as the faraway gleam quickly disappears, followed by a ‘You killed: KittyLuvalle’ message scrolling across your HUD. Breathing a sigh of relief from narrowly escaping immediate danger, you move on to search for where Fisianna may have spawned next.");
	output("\n\nEventually in your travels, you arrive at a large river. After concluding that the waters are too deep and fast-moving to traverse safely, you decide to wait it out behind some nearby bushes along the edge for any sign of Fisianna. The sound of rushing water makes it hard to hear any other noises, but it doesn’t obscure your vision at least. After waiting a few minutes, you decide it would be best to move on. Before you can do so however, you hear the telltale click of a gun cocking a bullet into its chamber behind your head. Not wasting any time, you pull out your combat knife and whirl around, swinging it at the sound. You make contact with Fisianna’s pistol and knock it out of her hand as it goes off from the impact, firing at a nearby tree. She quickly reaches for her own blade to try to defend herself, but you are too quick to the draw. You sink your knife into her avatar, which instantly kills her. Brushing yourself off from your close-quarters encounter, you gather your nerves and move on, away from the river.");
	output("\n\nRight now you are feeling calm and collected, since you have a comfortable two to zero lead over Fisianna. She has shown remarkable resourcefulness by attempting to kill you sneakily, but so far you have thwarted her at every try. With the thought of your game-winning point on your mind, you take a look at your surroundings. You find that you are within an area full of exceptionally large trees. Some of them have old looking structures built near the top of them; most likely abandoned lookout posts.");
	output("\n\nAfter briefly devising a plan to ambush Fisianna here, you decide it would be a good idea to take the high ground. You make your way to one of the weathered step-ropes, giving it a pull once you’re there to test its integrity. When you are convinced it will hold your weight, you holster your weapon and climb the ladder as fast as you are able. Once you climb into the dilapidated lookout post, you ready your rifle and scan the forest below.");
	output("\n\nFor a while, everything below you is unmoving and silent. Just when the waiting starts to lull yourself into a false sense of security, you hear a shot ring out in the distance, followed by a surprising shock to your shoulder. You stagger backwards in bewilderment, wondering where the shot came from, but in your frantic state of mind, you forget about the trapdoor entrance you came through. The floor disappears beneath your feet as you fall through the hatch, plummeting to your impending doom. Midway through your flight down the tree, you notice the metallic glint of Fisianna’s rifle in the bushes far away. Without a second thought, you aim and fire your gun in the blind hope that you can at least score a lucky hit. The moment that you take your shot, your screen flashes red as a ‘You were sniped by: KittyLuvalle’ message scrolls across your kill feed, followed by a ‘You rifled: KittyLuvalle’ text. After displaying the final score for the match, everything fades to black while the game shuts itself off.");

	flags["FISI_BET_RESULT"] = 1;
	IncrementFlag("FISI_TIMES_WON");
	processTime(15+rand(5));
	clearMenu();
	addButton(0,"Next",betFisiWinII);
}

public function betFisiWinII():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();

	output("You take your holo-harness off and smile in triumph at Fisianna. You beat her fair and square, albeit with a little luck on your side, and now she has a bet that she has to own up to.");
	if (fisiPrurience() < 25) output("\n\n<i>“Mmm... so I lost. I might be losing my touch. Either that or you are just getting way better than me.”</i> Fisianna looks down at her lap dejectedly for a moment. When you are about to say something, she raises her head to give you a small smile. <i>“W-well, a bet is a bet after all. I’m yours to do whatever you want with. Just please... b-be gentle.”</i>");
	else if (fisiPrurience() >= 25 && fisiPrurience() < 50) output("\n\n<i>“Ah... I guess I lose this time. I should practice a little more to give you more of a challenge.”</i> You can see a small hint of disappointment creep across her face, though it’s gone as quick as it came. She smiles warmly at you as she pats your arm. <i>“W-well, you won the bet, so I’m yours to do with what you will.”</i>");
	else if (fisiPrurience() >= 50 && fisiPrurience() < 75) output("\n\n<i>“Oh wow, nice shot! I can’t say I would be able to pull off the same thing in that situation. If that wasn’t luck, great job!”</i> Fisianna giggles gently while she rests a paw on your arm. <i>“Well... it looks like I’m all yours this time. What do you have in store for me, [pc.name]?”</i>");
	else output("\n\n<i>“Oh, no way! How were you able to do that? I thought for sure that I had you there! No fair...”</i> The neko sulks and pouts. <i>“I’ll definitely get you next time... but since you won...”</i> Fisianna pauses for dramatic effect and runs a pawed finger along one of your arms. <i>“What did you have in mind for us to do, [pc.name]?”</i> She purrs sensually.");
	output("\n\nOnce inside, you make your way over to the bed and throw Fisianna onto it. She giggles as she lands, shooting you the most adorable bedroom eyes. ");
	if (silly) output("Upon impact, a small white pomf cloud poofs out from under her. <i>“Nyah... what are we gonna do on the bed?”</i> the coy kitten asks.");
	output("Shortly afterwards, you follow her onto the bed and plant your lips onto hers. Before she can get too into the kiss, you pull away and hungrily glare at your lover, wondering how you would like to reap your reward for winning against her...");

	processTime(15+rand(5));
	clearMenu();
	var cIdx:int = largestCockIndexThatFitsFisiDimensions();
	if (cIdx >= 0 || pc.hasVagina()) addButton(0, "Oral", oralFisi, undefined, "Oral", "Have the kitten service you!");
	else addDisabledButton(0, "Oral", "Oral", "You can’t access this without genitals.");
	if (cIdx >= 0 || (pc.hasHardLightEquipped() && pc.hasVagina())) addButton(1, "Anal", analFisiI, undefined, "Anal", "Give the feline some good ol’ butt loving!");
	else addDisabledButton(1, "Anal", "Anal", "You need a cock that fits, or a vagina and a hardlight strapon for this.");
	if (cIdx >= 0 || (pc.hasHardLightEquipped() && pc.hasVagina())) addButton(2, "Fuck Silly", fuckFisiSillyI, undefined, "Fuck Silly", "Send the kitten into an orgasmic frenzy!");
	else addDisabledButton(2, "Fuck Silly", "Fuck Silly", "You need a cock that fits, or a vagina and a hardlight strapon for this.");
	addButton(3, "Let Her Lead", betFisiWinLerHerLead, undefined, "Let Her Lead", "Let Fisianna decide what she wants to do.");
}

public function oralFisi(fromMenu:Boolean = false):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(1);

	if (!fromMenu) fisiPrurience(-5);

	var x:int = largestCockIndexThatFitsFisiDimensions();
	if(x < 0 && pc.hasCock()) x = rand(pc.cocks.length);
	//Randomize between penile and vaginal variants if PC has both.
	var cockOrCunt:int = -1;
	if (x >= 0 && pc.hasVagina()) cockOrCunt = rand(2);
	else if (x >= 0) cockOrCunt = 0;
	else if (pc.hasVagina()) cockOrCunt = 1;
	
	output("You break your eye contact with Fisianna to sit at the edge of the bed, your mind made up. You suggest that ");
	if (pc.isNude()) output("she");
	else output("the both of you");
	output(" should take your clothes off first, since what you have planned could be fairly messy.");
	output("\n\n<i>“O-oh. Alright then...”</i> The catgirl complies, jumping off of the bed and slowly shedding her garments in both anxious excitement and bashful shyness. Once she is down to her underwear, ");
	if (pc.isNude()) output("you smile at the sight of the half-naked kitten before you");
	else output("you are already done stripping your gear off");
	output(". <i>“So... like this?”</i> she asks with a cute, sincere smile on her peachy lips, which looks adorable and makes the idea of kissing them extremely enticing... and kiss them you do. You pull the shy kitten close to you, pressing your lips to hers in a long passion-filled make-out session. When the two of you finally break apart from each other, Fisianna is slightly out of breath, still flushing from your sudden embrace.");
	output("\n\n<i>“Mmm, your lips are so wonderfully soft and tasty. I would have them for a meal every day if I could,”</i> you flirt with your lover, hoping to draw out more of a blush from her. Your attempt proves successful as she fidgets in your arms slightly and her cheeks redden in color.");
	if (fisiPrurience() < 50) output("\n\n<i>“T-thank you. It means a lot to hear that,”</i> she says meekly while fiddling with some of her long hair.");
	else output("\n\n<i>“Thank you, [pc.name]. They’re all for you - and more, of course,”</i> she giggles while gently rubbing her hands against your body.");
	if (cockOrCunt == 0) {
		if (fisiPrurience() < 50) {
			output("\n\n<i>“I mean it, though...”</i> You curl your lips into a gentle smile. <i>“Truth be told, I think they would feel great in other places as well.”</i> You subtly hint downwards towards your lap. Fisianna gasps at first when she picks up on your intentions, then slowly shifts lower until she is kneeling in front of your " + pc.cockDescript(x) + ".");
			output("\n\n<i>“Y-you mean here, right?”</i> she asks innocently, breathing steadily heavier the closer she brings your turgid rod to her face. You don’t acknowledge your lover’s question with a direct answer, but instead nod slowly when her golden, slitted eyes look into yours for approval.");
		}
		else {
			output("\n\n<i>“Alright then, I think they would feel pretty nice on other pla-”</i> you start to propose, but are cut off when you feel a soft paw already wrapping around your " + pc.cockDescript(x) + ". The rest of your words are replaced instead with a gasp of pleasure when she starts to slowly pump her hand up and down your pole. You look down and see Fisianna smiling coyly, matching your gaze to her’s. She is kneeling snuggly ");
			if (pc.legType == GLOBAL.TYPE_SNAKE || (pc.legType == GLOBAL.TYPE_GOOEY && pc.hasLegFlag(GLOBAL.FLAG_PREHENSILE))) output("against");
			else output("between");
			output(" your [pc.legs], breathing heavily against your turgid rod.");
			output("\n\n<i>“Did you mean here, by chance?”</i> She smirks, breathing steadily heavier the closer she brings your phallus to her face. You would say something about her overt cheekiness, but you are too blissed out to care at the moment.");
		}
		output("\n\nWith that, Fisianna draws closer to your " + pc.simpleCockNoun(x) + " until her face is practically touching it. Her eyes lock on your cock as if it is a ");
		if (pc.cocks[x].cLength() <= 8) output("work of art");
		else output("religious monolith");
		output("; she stares at it, mesmerized, until she can no longer resist. The catgirl’s first few pecks against your " + pc.simpleCockNoun(x) + " are very light and affectionate. She continues peppering your phallus with kisses from tip to " + pc.knotDescript(x) + " with each one becoming progressively harder and sloppier. She stops eventually to let your cock flop over her cute nose, with her mouth gently sucking ");
		if (pc.balls > 0) output("at the area between your dickflesh and scrotum");
		else if (pc.hasVagina()) output("at the area between your dickflesh and your [pc.clits]");
		else output("at the area right below your dickflesh");
		output(". While she nibbles at you, you can hear her audibly sniff in your masculine scent and exhale in a slow shudder afterwards, which has the added effect of pleasantly warming your groin up even more.");
		output("\n\n<i>“Haa-aah... y-you smell... good. I could get lost down here,”</i> Fisianna sighs dreamily before resuming her cock-worshiping. You can’t help but reach down to the lustful kitten to pet her between her perky ears. When you make contact, she momentarily loses her focus, breaking her gaze from your " + pc.simpleCockNoun(x) + " to shoot you the most adorable look of validation.");
		output("\n\nWith a light scritch from your fingertips, Fisianna’s ears twitch and she smiles brightly before going back to work. She places a few soft kisses to your " + pc.cockHead(x) + " before enveloping her peachy lips around it. The feline bounces her head in short strokes, barely breaking the crown of your penis. You don’t feel disappointed however, since her tongue is doing wonders for you to make up for the shallow penetration. Her tongue flicks at the entrance of your urethra, dabbing up any precum that leaks from it. Whenever she can’t find any purchase, she bobs her head steadily lower down your shaft with each stimulating movement.");
		output("\n\nBy the time she works her way midway down your " + pc.cockDescript(x) + ", she slides you out of her mouth with a wet <i>“muahhh.”</i> You feel the cold air on your cockflesh, though the sensation doesn’t last for long at all. Fisianna is quick to the attack, assaulting the base of your dick with loving licks. Her somewhat rough tongue slathers the underside of your " + pc.simpleCockNoun(x) + " with a mix of her saliva and your pre.");
		output("\n\nThe neko’s hands aren’t at all idle during this, either. Using one of her free paws, she strokes the other side of your penis with her soft fingertips. The mixture of soft and slightly rough texture on you feels somewhat odd, but also extremely pleasurable. You look down at your feline companion again and find that she has her lacey panties shifted to the side, with her other paw busily working under her. ");
		if (silly) output("What a lewd kitty!");
		else output("Naughty girl...")
		output(" With a smile, you give Fisianna another appreciative pat on the head for the impromptu show; it’s good to see that she’s getting off on this as much as you are.");
		output("\n\nYou gently caress the side of her face, and once your hand reaches her cheek, Fisianna flashes you another smile before opening her mouth wide to engulf as much as she can for your " + pc.simpleCockNoun(x) + ". With a loud slurp, she slides down as far as she can until she ");
		if (pc.cocks[x].cLength() <= 8) output("slips down to the base");
		else output("can slip down no further without gaggin");
		output(". She slightly adjusts herself before she begins to move again. The neko places a paw on your waist while she continues to jill herself off with the other. Her mouth busily works on you, sinking you in as deep as her throat will allow, meanwhile her tongue lolls out, dripping out copious amounts saliva and pre. Between the frisky feline’s show and her fervent fellatio, you find yourself alarmingly close already.");
		if (rand(2) == 0) {
			output("\n\nTry as you might, you can’t utter in time the words to tell her that you are about to blow; you are too far gone in the throes of pleasure to say anything wholly intelligible. All that does escape your lips, however, is a low groan, filled with urgency. With a small upward thrust of your hips, you blow your load into Fisianna’s mouth.");
			output("\n\nHer eyes shoot wide open in surprise when the first jet of your seed ricochets off the back of her throat and down her gullet. You can faintly hear her squeak before you feel her mouth clamp down harder on your pulsing rod. Thankful that she didn’t back off from your unannounced orgasm, you moan out in satisfaction while still clutching the feline’s head with one arm. ");
			if (pc.cumQ() >= 750) output("You continue to pump your virile seed into the kitten until you can feel her stomach bulge against you. ");
			output("Fisianna whimpers weakly at the same time as you feel a splash of girlcum hit your [pc.legs]. Her throat continues to milk you until you can offer no more for the ravenous neko.")
		output("\n\nFinally, she slips you out of her mouth and rests her head on your hip with your weakly throbbing [pc.cockNounSimple] resting against her cheek. She breathes heavily, though she has a wide smile on her lips while her eyes start to flutter lower...");
		}
		else {
			output("\n\nYou manage to blurt out that you are about to cum, even through your lust-addled state, and ask where she wants you to blow. Fisianna stops her fellatio and wetly pops you out of her mouth while shooting you a hungry and spaced-out expression.");
			output("\n\n<i>“Here...”</i> she states huskily, after which she opens her mouth wide. Fisianna moves the hand that isn’t busy strumming her clit to your " + pc.cockDescript(x) + ". She grips it lightly, but firmly, jacking you off towards your grand finish. You fidget in her grasp until you can take no more.")
			output("\n\nWith a groan you lurch your hips upwards into her paw, releasing your seed into the catgirl’s awaiting gullet. The first few jets of [pc.cumNoun] miss their mark, plastering her hair and cheeks. She then points your cock lower so that it shoots with more precise aim towards her open lips. The next few spurts of cum hit their mark, slowly pooling in her mouth until it reaches the point where it overflows out of her mouth.");
			if (pc.cumQ() >= 750) output(" Fisianna hastily swallows in between pumps and opens up her mouth again to let more of your [pc.cumColor] seed flood her cheeks. This continues until she grows a small pooch to her stomach from all that she has swallowed of your essence.");
			output("\n\nWith a loud gulp, Fisianna sighs, lowering her head to rest it on your hip with your weakly throbbing [pc.cockNounSimple] resting against her cheek. She breathes heavily, though she has a wide smile on her lips while her eyes start to flutter lower...");
		}
	}
	else if (cockOrCunt == 1) {
		if (fisiPrurience() < 50) {
			output("\n\n<<i>“I mean it, though...”</i> You curl your lips into a gentle smile. <i>“Truth be told, I think they would feel great in other places as well,”</i> you subtly hint downwards towards your lap. Fisianna gasps at first when she picks up on your intentions, then slowly shifts lower until she is kneeling in front of your [pc.vaginas].");
			output("\n\n<i>“Y-you mean here, right?”</i> she asks innocently, breathing steadily heavier the closer she brings her face to your wet slit. You don’t acknowledge your lover with a direct answer, but instead slowly nod when her cute, golden eyes look into yours for approval.");
		}
		else {
			output("\n\n<i>“Alright then, I think they would feel pretty nice on other pla-”</i> you start to say, but are cut off when you feel a soft paw already sliding towards your [pc.clit]. The rest of your words are replaced with a gasp of pleasure when she starts to strum your [pc.vaginaColor] pearl. You look down and see Fisianna smiling coyly, matching your gaze to hers. She kneels snuggly ");
			if (pc.legType == GLOBAL.TYPE_SNAKE || (pc.legType == GLOBAL.TYPE_GOOEY && pc.hasLegFlag(GLOBAL.FLAG_PREHENSILE))) output("against");
			else output("between");
			output(" your [pc.legs], breathing heavily against your moist pussy.");
			output("\n\n<i>“Did you mean here by chance?”</i> she smirks, breathing heavier the closer she brings her face to your wet slit. You would say something about her overt cheekiness, but you are too blissed out to care at the moment.");
		}
		output("\n\nWith that, Fisianna draws her face closer to your [pc.vagina], until she is practically touching it. Her eyes lock on your slit, looking at it like it is a cave full of wonders. She stares mesmerized at it until she can no longer resist her temptations. Her tongue slithers out from her mouth, fully slathered in saliva from the building anticipation. She brings it to the entrance of your vagina to flick at your [pc.vaginaColor] bud a few times. The effect is immediate. Your passage instinctively lubricates itself with your juices, producing a potent aroma in response. In between licks, you can hear the catgirl sniff loudly, drinking in your wonderful scent.");
		output("\n\nWith a lustful sigh, Fisianna resigns from the playful flicking of your sensitive bud and wraps her lips around it instead. She lightly suckles your pleasure buzzer, sending multiple shockwaves of ecstasy throughout the entirety of your body. You can’t help but to reach down to the lascivious kitten to pet her between her perky ears. When you make contact, she momentarily loses her focus, breaking her gaze from your cooch to shoot you the most adorable look of validation.");
		output("\n\nWith light scritching from your fingertips, Fisianna’s ears twitch, smiling brightly from the affectionate touch before going back to work. She lightly flicks at your [pc.clit] a final time before moving on to your engorged vulva. Her tongue is plenty wet from the mix of saliva and your own juices as it trails along the outer edge of your lower lips. Once your labia is lubricated enough, she brings her tongue to the entrance of your love tunnel, delicately lapping up any droplets of girly nectar that escape your depths.");
		output("\n\n<i>“Don’t be shy this time, Kitten. Feel free to go to town,”</i> you encourage Fisianna, speaking out to your growing need for her tongue to work inside of you rather than outside. Sure enough, you see her eyes narrow in concentration while she extends it out of her mouth. In the next moment, she dives in headfirst into your muff, spearing your folds in the same motion. This elicits a quiet moan to escape your lips, and with a smile, you lay back and let her do her thing.");
		output("\n\nYou can feel Fisianna’s tongue flicking rather wildly inside of you, probing you to test your reactions. She slathers your walls with her own saliva, further wetting your depths more than they already are. At first she licks near the entrance of your pussy, feeling out how elastic you are. While working her way deeper, her tongue tip focuses on a particular spot whenever your body responds to the stimulating sensation. After rubbing against these areas for a few pleasurable seconds, she moves on to swirling her tongue in a circular motion inside of you. ");
		if (pc.vaginas[0].type == GLOBAL.TYPE_GRYVAIN) output("Thanks to the thousands of mini-clits lining your inner walls, every tantalizing pass of her tongue over them threaten to make you cum right then and there.");
		else output("You can feel each of her somewhat rough tongue buds stimulate your walls, adding just the right amount of friction to bring to you closer and closer to orgasm.");
		output(" Fortunately you are able to keep control of your mounting climax for now, though only barely. You look down at your feline lover again and find that she has her lacey panties shifted to the side, with her other paw working busily under her. ");
		if (silly) output("What a lewd kitty!");
		else output("Naughty girl...")
		output(" With a smile, you give Fisianna another appreciative pat on the head for the impromptu show; at least she’s getting off on this as much as you are.");
		output("\n\nOnce your hand reaches her cheek, Fisianna flashes you another smile before diving back into the sodden gulf ");
		if (pc.legCount >= 2) output("between your legs");
		else output("below you");
		output(". Right after doing so, you feel her free paw creep past your midsection down to your nethers. Soon enough, the neko’s fingers make contact with your clit, where they begin to sensually strum the pleasure buzzer. Fisianna presses her face as hard as she can into your nethers, so much so that you start to become concerned if she is able to breathe properly. Your worries quickly recede once her tongue penetrates deep inside of you again, hitting your g-spot. With a body shaking moan, you lay back onto the bed, quickly losing yourself to the throes of pleasure once more. Between the naughty neko’s impromptu show and her eager cunnilingus, you find yourself alarmingly close again.");
		output("\n\nNo longer being able to hold back, your hips jerk upwards into Fisianna’s face while the great pressure growing in your nethers finally releases. Your body trembles and vibrates violently, and a ");
		if (pc.wetness() >= 4) output("deluge of [pc.girlcum] sprays forcefully");
		else output("a trickle of [pc.girlcum] dribbles");
		output(" into her mouth. Upon feeling the wild spasms of your vaginal walls, the neko’s moans out, her breath coming out in hot shudder against your loins. She eagerly drinks in your essence, lapping and gulping down any amount of your girlish nectar that she can manage to get. Fisianna whimpers weakly at the same time you feel a splash of girlcum hit your [pc.legs]. Your inner walls continue to milk her tongue for it’s non-existent purchase while you ride out the remainder of your orgasm. When you finally wind down, the catgirl raises her head from your still-dripping cunny and shoots you a weary, but sweet smile with her eyes half-lidded.");
	}
	else {
		output("\n\n<b>ERROR: No valid penis or vagina detected!</b>");
	}
	if (fisiPrurience() < 50) output("\n\n<i>“I hope that felt good enough for you, [pc.name]...”</i>");
	else output("\n\n<i>“I don’t think I could ever get tired of doing this for you, [pc.name]... Mmm... If I had the choice to, I could go for doing this all day.”</i>");
	output(" Fisianna purrs, which inadvertently stimulates your ");
	if (cockOrCunt == 0) output(pc.cockDescript(x) + ". You can also see her unconsciously rubbing her stomach tenderly, your seed certainly sating the catgirl’s appetite.");
	else if (cockOrCunt == 1) output("[pc.vagina]. She also licks her lips clean of your juices, staring into your eyes dreamily while she does so.");
	else output("<b>ERROR: No valid penis or vagina detected!</b>");
	output("\n\nYou shoot a smile to Fisianna to which she rises up and climbs atop you, planting a kiss to your lips. The potent mix of your sexual fluids and her sweet peachy lips are extremely strong in taste as your tongues take turns probing each other’s mouths. When the embrace ends, the two of you lie together for another minute before sliding off of the bed to wash off the tryst of your labors. As soon as you finish, you bid farewell to Fisianna for now, very much looking forward to ");
	if (fisiWonLastBet()) output("the next chance you have to beat her again in CoV.");
	else output("the next chance you have to do this again with her.");

	IncrementFlag("FISI_TIMES_ORAL");
	IncrementFlag("FISI_TIMES_SEXED");
	flags["FISI_LAST_SEXED"] = GetGameTimestamp();

	currentLocation = "RESIDENTIAL DECK 13";
	processTime(60+rand(30));
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function analFisiI(fromMenu:Boolean = false):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);
	if (!fromMenu) fisiPrurience(-10);

	var x:int = largestCockIndexThatFitsFisiDimensions();

	output("Your hands wander idly over Fisianna’s shapely thighs and hips. Her breath becomes labored while you continue to grope her affectionately. When you reach her shapely posterior, you give it a firm squeeze, prompting a soft mewl to escape her lips. You continue kneading her soft bum while snaking your hand towards her belt buckles. With relative ease, you undo the clasps binding them together and slide her jeans off. After unceremoniously throwing them to the side, you are treated to the lovely vision of an already stained-through pair of lace panties, leaving her aroused vulva on full display for you.");
	output("\n\n<i>“Well then... someone’s raring to go,”</i> you tease the kitten, smiling coyly while easing the rest of her clothing off. ");
	if (fisiPrurience() < 50) output("Fisianna flushes a dark shade of scarlet at your comment, but otherwise stays silent, ");
	else output("Fisianna smiles back in response as if saying, ‘Of course I am,’ ");
	output("breathing steadily heavier while you disrobe her. Once you strip her naked, you ");
	if (!pc.isNude()) {
		output("follow suit in shedding your own gear ");
		if (x < 0) output(" except for your hardlight-equipped [pc.lowerGarment] ");
		output("and ");
	}
	output(" pounce on the catgirl, littering her face and neck with frantic smooches. She giggles lightly from your attack, cupping your head into her body with her paws, driving you in deeper to taste her soft [fisianna.skinFurScales]. Your hands continue to roam her somewhat plump bottom until they reach the cleft of her butt cheeks. You briefly pass your hands over her engorged mons, staining your hands with her arousal, which already provides you with an ample amount of natural lubrication. Fisianna’s breath catches the moment you leave her lower lips unattended and gasps once you reach the other entrance just under her twinned tails.");
	if (flags["FISI_TIMES_ANAL"] == undefined) output("\n\n<i>“I-I... [pc.name], that’s my...”</i> the neko stammers with a somewhat worried expression on her face.");
	else output("\n\n<i>“A-are... Did you...?”</i> the neko stammers with a knowing expression on her face.");
	output(" You shoot a grin back at her in response while proposing the idea that the two of you could engage in some ");
	if (flags["FISI_TIMES_ANAL"] != undefined) output("more "); 
	output("anal play.");
	output("\n\n");
	if (flags["FISI_TIMES_ANAL"] == undefined) {
		output("With that proposal, Fisianna’s face turns a beet red and she continues to babble a mile a minute. <i>“B-but... I don’t know. What if I’m too small? What if it doesn’t feel as good? W-what if it... hurts?”</i> she says the final word with a worried frown, apprehension clear in her voice. At least that doesn’t sound like a ‘no.’ You can’t help but to chuckle a little bit at the timid kitten. With a warm smile, you assure her that you’ll keep her pleasure in your best interest, and that if she ever felt pained or otherwise uncomfortable to let you know about it. Finally you can see her visibly relax again.");
	output("\n\n<i>“T-thank you, [pc.name].”</i> Fisianna gives you a small smile before raising a paw towards a nearby drawer. <i>“There’s some lube in the table over there we can use. It... might be best to use some of that for the both of us. Please... don’t ask.”</i> She avoids direct eye contact with you when she points this out, but you can see the blush intensifying on her face.");
	}
	else output("<i>“O-oh, okay. I’m fine with that. The last time we did that it felt... good, despite having to stand up to work afterwards.”</i> Fisianna giggles and raises a paw towards a nearby drawer. <i>“There’s some lube in the table over there we can use. Just... so it’s more comfortable.”</i> She avoids direct eye contact with you when she points this out, but you can see the blush intensifying on her face.");
	output("\n\nYou take a moment to slide off of the bed to retrieve Fisianna’s bottle of lube, rejoining her after having done so. After you pop open the cap, you pour some of the clear, slippery liquid onto your fingers, rubbing them onto the [pc.skinFurScales] on your hand until it is sufficiently covered. With a light tap on your lover’s thigh, she rolls over and presents her ample, heart-shaped bottom to you in its full glory. A stray drop of saliva nearly escapes your lips at the mouth-watering sight. You shake your head slightly, attempting to recover your composure and gulp loudly at the marvel before you. At this moment, Fisianna turns her head to look back at you, shooting you a nervous smile from under the curtain of hair partially obscuring her face.");
	output("\n\nTaking no more time to delay, you place a hand on Fisianna’s soft derriere and pry her cheeks apart, revealing the ");
	if (flags["FISI_TIMES_ANAL"] == undefined) output("unsullied");
	else output("near-unabused");
	output(" hole just under her twinned tails. It winks tight once exposed to the steamy air between the two of you. With your lube covered digits, you bring them to her pucker, attempting to gain entrance against her tight entrance, but no matter your efforts, she stays shut tighter than a vacuum sealed airlock.");
	output("\n\n<i>“Fisi, try to relax a little,”</i> you encourage her, gently rubbing her bottom and giving it a few light scritches. She unconsciously raises her bottom higher in the air in response to your scratches and lowers her head into her arms. You can feel her tailhole start to unclench under your affectionate touch, and with a gentle prod, you ease a digit slowly into her depths. A muffled <i>“mmf”</i> escapes the catgirl’s lips the moment your finger penetrates her. Her anal walls grip you with a tremendous tightness making any further movements difficult despite the lubricant.");
	output("\n\n<i>“J-just... need a moment to get used to this. This is... intense, to say the least.”</i> Fisianna stammers, her breath coming out very shakily. After a few moments of shallow stroking with your finger, she finally becomes loose enough to slip a second digit inside. This time you are met with much less resistance than during the initial insertion. You give the neko’s bottom an appreciative squeeze and liberally slide your fingers in and out of her. When you crook your digits in a hook-like manner, Fisianna’s head rises to let out one of the loudest moans you’ve ever heard from the usually quiet kitten. Her knees nearly buckle underneath of her, visibly trembling as a string of her own fem-lube dribbles from her now sodden snatch. When she finally settles down, she looks back towards you in astonishment.");
	if (flags["FISI_TIMES_ANAL"] == undefined) output("\n\n<i>“W-what <b>was</b> that just now? It kind of hurt a little, but it also felt... amazing!");
	else output("\n\n<i>“I don’t know how you make me do that every time, but I can’t get enough of that when you do...");
	output("”</i> Fisianna smiles sheepishly at you. You chuckle in response and gently slide your fingers out of her, satisfied with your handiwork. Not letting her girlcum go to waste on the bed sheets, you gather a few droplets from her dripping cunny onto your hand and slather the fragrant liquid all over your [pc.cockOrStrapon " + x + "]. Once it is sufficiently lubed up, you shift your hips behind the catgirl’s and align the glans of your ");
	if (x >= 0) output("penis");
	else ("tool");
	output(" with her pucker.");
	
	processTime(30 + rand(10));
	clearMenu();
	addButton(0, "Next", analFisiII, x);
}

public function analFisiII(x:int):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);

	if (flags["FISI_TIMES_ANAL"] == undefined) {
		output("Once your [pc.cockOrStrapon " + x + "] brushes against Fisianna’s tailhole, you are met with fierce resistance once more as she clenches. You look upwards towards her and find that she has her eyes clenched just as tightly as her sphincter. When you ask her if anything is wrong, her eyes open slightly.");
		output("\n\n<i>“I-I um... this being my first time doing... this, I just want to be doubly assured that you’ll be gentle with me.”</i> Fisianna fidgets and looks vacantly to the side of you. You can’t help but to observe how... ‘vulnerable’ she looks at this moment. Her long hair lays in a thick curtain over her back. Her arms are folded beneath of her head, bracing for the reaming to come. She is still trembling slightly under you, though whether from nervousness or her recent orgasm you can’t really tell. With a soft squeeze of one of her buttocks, you lean in and plant a quick kiss to her cheek, promising her that you will be as delicate as possible.");
		output("\n\n<i>“Thank you... I think I’m ready now.”</i> Fisianna declares after a long pause. After a breathy sigh, she raises her bottom as high as her exceptional flexibility allows her to. Her twinned tails sway hypnotically back and forth in front of you, practically inviting you to take her. At this sight, you give her cheeks another appreciative pinch and spread them wide, aligning your cock head to her backdoor once more.\n\n");
	}
	output("With a slow, gentle thrust of your sides, you push your [pc.cockOrStrapon " + x + "] inside of Fisianna. The feline’s eyes shoot wide open and she gasps as you inch deeper inside of her. ");
	if (x >= 0 && pc.cThickness(x) >= 2) output("When you are about halfway in, her teeth clench and she hisses in pain. <i>“Wai wai wait... Slow down for a second!”</i> She bats her paw against your hand in emphasis. You temporarily halt your progress for the moment to let her adjust to your meatier length");
	else output(" When you are about halfway in, you can feel her clench around your length incredibly tightly, temporarily halting your progress");
	output(". After a few more moments, you can feel her walls slacken their hold on you just enough for you to continue. At a snail’s pace, you slide in again, gritting your teeth against the incredible tightness that is Fisianna’s tailhole.");
	output("\n\nYou finally hilt yourself to the " + pc.knotDescript(x) + " after what seems like an eternity, breathing a sigh of relief when you do. Almost automatically, you reach downwards and around the feline’s midsection to rub her belly, hoping to comfort her further to the ");
	if (x >= 0 && pc.cocks[x].cLength() > 9) output("impressive ");
	output("length inside of her. ");
	if (x >= 0 && pc.cocks[x].cLength() > 12) output("Satisfyingly enough, you can quite distinctly feel your cock head bulging out from her tummy rather obscenely. ");
	else if (x >= 0 && pc.cocks[x].cLength() > 9) output("Satisfyingly enough, you can just barely feel your cock head poking through her tummy. ");
	output("Thankfully this also seems to relax the kitten as well.");
	output("\n\n<i>“I-I wish I could explain how this feels in words other ther than ‘full’...”</i> Fisianna cracks a sidelong smile up to you. <i>“I... think I’m okay for you to start moving now, [pc.name].”</i> For emphasis, the little kitten presses her rotund bottom into your hips, encouraging you to ravish it to your delight.");
	output("\n\nNot one to keep her waiting, you separate your hips for the briefest of moments before striking home within Fisi again. You start up slowly, still giving her time to fully adjust to your ");
	if (x >= 0) output("turgid");
	else ("glowing");
	output(" tool. Thankfully she is no longer clamping on you with a crushing tightness, but with a snug, loving grip just taut enough to ");
	if (x >= 0) output("keep healthy blood flow running to your cock");
	else ("allow freedom of movement");
	output(". A low, quiet growl escapes your lips as you relish this feeling, withdrawing your hips once you’re satisfied.");
	output("\n\nYou look downwards at the perfect curvature of Fisianna’s sizable bottom. You let your hands wander over the pair of ");
	if (flags["FISI_BODY_TYPE"] == undefined) output("tan");
	else output("orange and white");
	output(" globes, kneading your fingers into her supple booty. With a quick thrust, you set in motion a hypnotising shockwave throughout her entire backside. A quiet grunt escapes her lips from the sudden impact. Her eyes start to glaze over, no longer worried about any discomfort she might be in, but feeding on the feeling of your [pc.cockOrStrapon " + x + "] penetrating her ");
	if (flags["FISI_TIMES_ANAL"] == undefined) output("unspoiled");
	else output("near-unspoiled");
	output(" rosebud. This provides all the encouragement that you need to repeat your performance. You pull out and thrust in again, determined to bring the both of you to the throes of anal-pleasure the likes you two have never experienced before.");
	output("\n\nSoon enough, you hips move rhythmically faster and faster against her sizable tush. With each thrust, you attempt to angle your ");
	if (x >= 0) output("cock");
	else ("tool");
	output(" just right to brush against her most sensitive areas. Just when you manage to push against a particularly soft spot within her with your ");
	if (x >= 0) output(pc.cockHead(x));
	else ("dildo tip");
	output(", Fisianna yowls and tenses up. Her walls tighten around your [pc.cockOrStrapon " + x + "], seemingly milking you to orgasm while a familiar dampness creep down your [pc.legs]. You don’t think that she’s orgasmed just yet anyways, just that she’s finally fully comfortable with the anal coition. You make the most out of the situation and stimulate anything that you can while she is riding her sexual high. While leaning over, you cup her pert C-cup breasts in your hands, kneading her soft inverted nipples until they poke out from their confines. Once they emerge, you gently play with them, twiddling the supple buds between your fingers and seeing what motions make Fisi tick the most. Surprisingly, she holds your weight on her back despite how wracked up with pleasure she is.");
	output("\n\nThe two of you keep this up for a few minutes at this pace. The wet sound of your hips crashing into Fisianna’s bum is already ingrained into your head, as well as the many groans and moans coming from your feline partner. Looking down, you can see that her bottom is deep red from the amount of times you’ve slapped your hips and occasionally your hand against them. Fisianna herself looks fairly relaxed by now, letting you take full advantage of what her shapely body has to offer to you. You aren’t far from " + (x >= 0 ? "blowing your load into" : "climaxing to") + " that fine piece of ass, and with each thrust, it proves more and more difficult to hold back, especially with her milking your [pc.cockOrStrapon " + x + "] for what it’s worth. Before long, you find yourself at the brink of release. You clench your eyes shut, trying your best to quell your mounting orgasm before it is too late.");
	output("\n\n<i>“[pc.name]! P-please, cum... If you’re close, please... ");
	if (silly) output("just DO IT!");
	else output("just let it go...");
	output(" I c-can’t hold it muh... mu-<b>aaah</b>!”</i> With that, Fisianna’s tailhole clenches on you extremely tightly while she trembles uncontrollably under you. Your lover in her orgasmic daze raises a paw towards one of your hands that are massaging her breasts and interlocks her fingers with yours. The sweet sideways smile that she shoots you is the icing on the cake to convince you to bring your efforts home.");
	if (x >= 0) {
		output("\n\nWith an almost savage grunt, you drop all restraints and shove as much of your " + pc.cockDescript(x) + " inside of Fisianna as you can. ");
		if (pc.hasKnot(x)) output("Unfortunately, with her being as tight as she is while mid-orgasm, you can’t find enough slack in that tight hole of hers for your " + pc.knotDescript(x) + " to slip inside. ");
		output("Once you are ");
		if (pc.hasKnot(x)) output("as fully hilted as possible");
		else output("fully hilted");
		output(", you blast your churning load into her hungry orifice, painting her walls utterly [pc.cumColor]. The force that it exits you is so great that your strength is almost immediately sapped out of you, and all you can do is wrap your arms around Fisianna’s tummy and hold on for dear life. ");
		if (pc.cumQ() >= 750) output("Thanks to your over-productive [pc.balls], her stomach begins to distend outwards from all of the [pc.cumNoun] being pumped inside of it. With a loving, tender affection, you massage the growing mass until her gravid belly is touching the bed underneath the both of you.");
		else output("With a loving, tender affection, you massage her smooth belly, lightly scritching it while you fill her with your essence.");
		output(" The neko purrs a soft <i>“Mmmnn...”</i> in what is likely a wordless appreciation for your extra care.");
	}
	else {
		output("\n\nWith an almost savage grunt, you drop all restraints and shove as much of your [pc.cockOrStraponFull " + x + "] inside of Fisianna as you can. Once you are fully hilted, you cream your [pc.lowerGarment], utterly painting them in ");
		if (pc.hasCock() && pc.hasVagina() && [pc.cumColor] == [pc.girlCumColor]) output("[pc.girlCumColor] and [pc.cumColor]");
		else if (pc.hasCock()) output("[pc.cumColor]");
		else output("[pc.girlCumColor]");
		output(". The force that it exits you is so great that your strength is almost instantly sapped out of you, and all you can do is wrap your arms around Fisianna’s tummy and hold on for dear life. With a loving, tender affection, you massage her smooth belly, lightly scritching it to make her feel as comfortable as possible. The neko purrs a soft, <i>“Mmmnn...”</i> in what is likely a wordless appreciation for your extra care. She likely knows that you aren’t actually filling her belly up with your cum, but she seems to be grateful for the sentiment all the same.");
	}
	output("\n\nOnce the both of you wind down, the two of you slump together side by side on the bed, absolutely winded from your tryst. You are still buried deep inside of Fisianna with your arms wrapped tightly around her. You litter the nape of her neck with light kisses while she purrs happily in your embrace.");
	output("\n\n<i>“Stars... I didn’t think doing anal could be <b>that</b> enjoyable. You especially made it feel just as passionate as any other thing we do together. ");
	if (flags["FISI_TIMES_ANAL"] == undefined) output("I-I was nervous as heck about it at first, but with you, you... just make it work out so well. ");
	output("Granted... it still kinda hurts a little, but it’s a good kind of hurt. I’m just glad I could do this with you.”</i> Fisianna smiles and reaches back to stroke your cheek with her soft paw. It feels so comfortable to you that you nuzzle into the feline’s neck. With the combination of her gentle petting and her purring, it doesn’t take you long before you drift off to sleep...");

	processTime(30 + rand(10));
	clearMenu();
	addButton(0, "Next", analFisiIII, x);
}

public function analFisiIII(x:int):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();

	output("When you awaken again, you find that you are alone on the bed, and any signs of your previous endeavors have already been cleaned up. With a stretch, you slide off of Fisianna’s bed");
	if (!pc.isNude()) output(", gather your belongings");
	output(" and head towards the living room. Once you arrive, Fisianna quickly rises from the sofa, rushing over to give you a hug. Midway over however, she stumbles, almost falling head-over-heels in front of you. You just manage to catch her in your arms right before she can do so and raise her upright again. She still clutches to your chest for support, since her feline legs are wobbling an awful lot.");
	output("\n\n<i>“A-ah... ehehe... sorry about that, [pc.name]. As you can probably tell, it’s still very difficult for me to stand up straight, let alone sit down on my bum thanks to you...”</i> Fisianna pouts at you, though that facade quickly melts away to a heart-warming smile. <i>“Still, I think it’s worth having to deal with this for the time being. It’ll help me remind me of you while you’re gone.”</i> She giggles and leans in to give you a quick kiss.");
	output("\n\n<i>“As hopeless a romantic as ever...”</i> You muse aloud, prompting Fisianna to punch your arm. It actually kind of hurt this time around, despite her weakened state. With a laugh, you guide her to the sofa to rest up, after which the two of you exchange your goodbyes before you head out of her apartment.");

	IncrementFlag("FISI_TIMES_ANAL");
	IncrementFlag("FISI_TIMES_SEXED");
	flags["FISI_LAST_SEXED"] = GetGameTimestamp();

	processTime(15 + rand(5));
	pc.orgasm();
	fisianna.orgasm();

	currentLocation = "RESIDENTIAL DECK 13";
	processTime(10);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}


public function fuckFisiSillyI():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);

	var x:int = largestCockIndexThatFitsFisiDimensions();

	output("Wasting no more time, you spring on Fisianna again, playfully sucking and biting at her neck. She squeals with delight while you assault the soft [fisianna.skinFurScales] at her collarbone. You’re​ feeling especially generous this time. You want her to feel <i>really</i> good by the end of this. What better way is there than to drive the nekomata into an orgasmic frenzy?");
	output("\n\nYou separate from Fisi temporarily, resting your hands on her slender hips. With an loving smile on your face, you slide your hands underneath of her shirt, lifting the bottom hem up and over her head. She eagerly leans up to assist you, placing her paws atop of yours while you take off her shirt and vest. Once they are thrown aside, you reach behind her while she is upright, undoing the clasps that bind her bra together. With a sigh of relief from the catgirl, the garment slips off, exposing her peachy inverted nipples.");
	output("\n\nLike a bull to a matador’s cape, you charge, already attacking Fisianna’s pebbly areolae with your oral affections. She moans into your touch, all the while frantically scrabbling at your ");
	if (pc.hasWings()) output("[pc.wings]");
	else output("back");
	output(" for something to hold on to. You tease the slits of her supple boobflesh until her pert nipples peak out of them. You figure you may as well start the orgasmic ");
	if (silly) output("combo");
	else output("chain");
	output(" by giving her a mind-wracking boobgasm.");
	if (!pc.isNude()) {
		output(" Taking another brief moment to separate from Fisianna, you quickly shed your ");
		if (pc.hasCock()) output("[pc.gear].");
		else {
			output("[pc.armor]");
			if (pc.hasUpperGarment()) output(" and [pc.upperGarment]");
			output(" so that only your hardlight equipped [pc.lowerGarment] remains on. You turn a dial on it to reveal your glowing dildo, much to your lover’s delight.");
		}
		output(" Once you are done shedding your garments, you dive back into her modest chest.");
	}
	output("\n\nContinuing the attack on her now erect nipples, you suckle at one of them ");
	if (flags["FISI_PREGNANCY"] > 0) output("drawing out some of their milky bounty from it");
	else output("as if attempting to draw its non-existent milky bounty from it");
	output(". Fisianna inwardly hisses and pushes her chest up and into you, forcing more of her soft mammary into your mouth. From there, you pull your [pc.lipsChaste] back to lightly clench her perky nipple between your teeth. Gently, you pull on her bud, eliciting a squeal from your feline lover. You draw your [pc.tongue] to rub against the peachy bead between your teeth. After a brief moment of this, you sink your head back down into Fisianna’s chest, though you don’t release her nipple from your clenched teeth. Instead, you start to lightly grind them along the front of them, attempting to stimulate her sensitive melons.");
	output("\n\nOne of your hands busily works her other tit, pinching and rubbing the exposed nipple. It switches up in its movements, never doing the same thing for more than a few seconds. When you aren’t teasing Fisianna’s pert nipples, you grope at different areas of her boobflesh; sometimes lifting and cupping the underside of them, other times just simply rubbing your hand along the soft ball of flesh to feel their warmth. On occasion, you gently squeeze at her breast, drawing a small gasp from the neko each time.");
	if (fisianna.isLactating()) output("This has the added effect of dribbling some of the catgirl’s thin, but bountiful milk onto your fingers, lubricating them for smoother movement.");
	output("\n\nYour other hand sneaks its way downwards while you’re busy up top, undoing the buckle of her jeans. Once you open the clasp of her belt, you sneak your hand lower and dip an experimental finger inside of her depths. The moment you do, her walls clench tight around it, quick to flutter around the phallus-like object inside of her.");
	output("\n\nWell then! She seems about ready to burst at any moment! Figuring it’s as good a time as any, you quickly release your hold on Fisianna’s breasts and withdraw your digits from her quim to straddle her chest. In her lustful state, she pays no mind to the sudden shift in your position. She welcomes the new view she has of you towering over her.");
	output("\n\nYour [pc.cockOrStrapon " + x + "] nestles between the valley of her pert tits. Without a second thought, you begin to slowly rock your hips forward and backwards, grinding your ");
	if (x >= 0 ) output("tumescent rod");
	else output("hardlight tool");
	output(" in her cleavage. Shooting a sweet smile at you, she brings her paws to her mammaries to squeeze them together. Her boobflesh molds around most of your member, acting as a soft and supple cock-sheath for you.");
	output("\n\nYou continue to thrust into the gap between Fisianna’s breasts progressively faster while you work her to her peak. When her eyes flutter closed in concentration, you reach behind you to slide one of your hands between her clenched thighs. As soon as your fingers brush against her stubby button, she seizes up and let’s out a sweet, high pitched whimper as a tide of girlcum rushes onto your hand, flooding her panties. Her eyebrows scrunch together while you opt to tease her sensitive clitty. The grasp on her breasts loosen considerably, no longer stimulating you as much as you would like.");
	output("\n\nTime for a different strategy! With as much grace as you can manage, you slide off of Fisianna’s chest and quickly maneuver around the bed so that you are right between her feet. There are only a few moments to spare before her orgasmic high tapers. You hurriedly pull her jeans off by the leggings with one clean motion. This draws a surprised yelp from the catgirl, and inadvertently aligns your [pc.cockOrStrapon " + x + "] with her still spasming cooch; though there is still the matter of her panties. That, and you aren’t quite ready for the main event... <i>yet</i> anyways. With equal fervor, you slide Fisianna’s lacy undergarment from her legs and over your head. On the sight of your lover’s still spasming pussy, you spread her thighs apart and dive in between to lap up her sweet nectar.");
	output("\n\nFighting back the flow of girlcum that gushes out to meet your face, you close your lips around her sodden slit, drinking in the tangy liquid that dribbles out in a somewhat steady stream. With your tongue, you plumb into her spasming walls as deep as she will allow you to. You can feel her walls instantly seize your [pc.tongue] in a vice-grip, though her passage is wet enough to not restrict your ministrations by a noticeable margin.");
	output("\n\nWith your upper lip, you begin to tease Fisianna’s bud while with your tongue, you retract and extend it repeatedly inside of her tight and squirming pussy. A high pitched squeal, and a familiar squeeze on the sides of your head nearly breaks your concentration. You are suddenly lurched forwards into the neko’s pulsing snatch, your vision darkened, and breathing restricted. This time, you are prepared, and with Fisianna still orgasming intensely below you, you resolve to quickly bring her to her second climax.");
	output("\n\nWith a huff, you wrap your arms around Fisianna’s thighs and continue to probe her wet nethers. You press against her labial lips hard, eager to reach her deepest depths, which in turn earns you a pair of paws to the back of your head. Paying them no mind, you hilt yourself in, flicking the tip of your tongue along the deepest parts of her inner walls.");
	output("\n\nWithout warning, another intense jet of fem-cum rushes into your mouth, nearly drowning you from the sheer surprise of the sudden tide. Thankfully, Fisianna’s thigh grip loosens on you at the same moment. You take the moment to gulp the veritable amount of girlcum in your mouth, and barely manage a cough before her paws push you back in. With her legs spread wide, she bucks her hips into your face, which cause your tongue to slip back inside. As much as you don’t want to fight back against this, you have other plans in mind to deliver the final blow. Then again, she <i>really</i> seems to be enjoying the oral attention a <i>lot</i>! You only have a split moment to decide how you would like to finish your feline lover while she’s riding her second orgasm...");

	processTime(30+rand(15));

	clearMenu();
	if ((pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) || pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.hasPerk("Myr Venom")) {
		if (silly) addButton(0, "Use Mouth", useMouthFisi, undefined, "Use Mouth", "Go for a swim. Remember to breathe! Where’s that spelunking helmet when you need it...?");
		else addButton(0, "Use Mouth", useMouthFisi, undefined, "Use Mouth", "Go for a swim. Remember to breathe!");
	}
	else addDisabledButton(0, "Use Mouth", "Use Mouth", "You’ll need a special type of tongue, or Myr Venom for this.");
	addButton(1, "Fuck Her", fuckHerFisi, x, "Fuck Her", "Stick with the plan. Fuck the kitten’s brains out!");
}

//Only available if the PC has long & prehensile tongue, and/or aphrodisiac tongue. Also available to PCs with Myr Venom perk.
public function useMouthFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);

	var useVenom:Boolean;
	//If PC has all, randomize between both variants.
	if ((pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) && (pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.hasPerk("Myr Venom"))) {
		if (rand(2) == 0) useVenom = true;
		else useVenom = false;
	}
	else if (pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) useVenom = false;
	else useVenom = true;

	output("You decide that for this time, you’ll deviate from the plan to what Fisianna might prefer at the moment. Without resisting, you face the oceanic tide that is her pussy head-on!")
	output("\n\nTo keep yourself from choking on the onslaught of girlcum, you wrap your [pc.lipsChaste] around her lower pair again, filtering most of the surge inside of your mouth. Since Fisianna’s thighs are no longer wrapped around your head this time, you can properly breathe through your nose. The scent of nekomata nethers is <i>extremely</i> strong, and a pool of her liquid grows quickly underneath of you. It takes every ounce of your ");
	if (pc.WQ() < 50) output("meager");
	else output("sizeable");
	output(" willpower to not be selfish and rut the girl. Vigorously shaking the thought, you put forth your best efforts into cunnilingusing your lover into a gibbering pool of mush.");
	if (useVenom) {
		output("\n\nThanks to the special aphrodisiac qualities of your saliva, you have <i>just</i> the method in mind to <b>really</b> push her over the edge! You take a brief moment to retract your tongue to apply some of your unique lust-venom onto it. With your tongue now laced with aphrodisiacs, you probe the outer lips of her womanhood. The effect is immediate. Fisianna’s breath catches while her loins rapidly increase in temperature.");
		output("\n\n<i>“I... Haaah, [pc.name]! M-my... s-so <b>hot</b>! I-I can’t!”</i> the neko babbles while you continue to work her puffy lower lips. Once you feel that they are aroused enough, you lick your own lips and press them to her engorged vulva and clit. While your venoms go to work on the outside, your insert your [pc.tongue] into her still undulating tunnel. Thankfully, while she is still on an orgasmic high, she grips onto your faux-phallus with considerable force. She is so tight that it is easy work spreading your lust venom throughout her entire passage. You proceed to pump your [pc.tongue] in and out of Fisianna.");
		output("\n\nIt only takes a few tongue thrusts before a fresh tide of her girly nectar ");
		if (silly) output("cums");
		else output("comes");
		output(" out to meet you. Not bothering to swallow this time, you continue to tongue-fuck her relentlessly, eventually working the poor catgirl to a fourth, then to a fifth, then a sixth body-shaking orgasm. By the time you’ve lost count of how many climaxes you’ve put her through, the entirety of her body shakes and vibrates madly below you, before laying still. You finally raise your head from between Fisianna’s legs to find that she has fallen asleep, purring and smiling peacefully as she does so. She must have passed out sometime in the middle of her last orgasm. Chuckling at the cute sight, you climb up her body to plant a kiss to her cheek before pulling the covers over the both of you. Shortly afterwards, you drift off to sleep with your lover, arm in arm.");
	}
	else {
		output("\n\nThankfully, you have just the way to deliver the coup de grâce, thanks to your special tongue! You elongate your alien oral muscle, steadily feeding it inside of Fisianna’s clenching inner walls. You can feel them grip tightly around your wet organ, though given how exceedingly wet she is, this does little to deter your progress. Once the tip of your [pc.tongue] brushes against her cervix, another splash of girlcum rushes out to meet you. After drinking down the brunt of it, you curl your lips into a devious grin, as you push more of your lengthy tongue inside.");
		output("\n\n<i>“A-aaah, o-oh whoa woaaahhn!”</i> Fisianna cries out when your tongue folds over on itself inside of her. At this sound, you feed it into her faster and faster until a visible bulge starts to poke from the kitten’s stomach. Now, for the real finish! You set every one of your muscles in your tongue to work, twisting and writhing the mass of flexible flesh inside of her, stimulating every facet of her vagina at once.");
		output("\n\n<i>“Aaahaan! [pc.name]! I-I! Hnnng!”</i> She screams out before a fourth body wracking orgasm claims her. You keep it going, despite your mouth rapidly filling with her tangy assets, until she reaches a fifth, then a sixth orgasm. By the time you’ve lost count of how many climaxes you’ve put her through, the entirety of her body shakes and vibrates madly below you, before falling still. You retract your tongue and finally raise your head from between Fisianna’s legs to find that she has fallen asleep, purring and smiling peacefully as she does so. She must have passed out sometime in the middle of her last orgasm. Chuckling at the cute sight, you climb up her body to plant a kiss to her cheek before pulling the covers over the both of you. Shortly afterwards, you drift off to sleep with your lover, arm in arm.");
	}

	pc.changeLust(40);
	fisiPrurience(5);
	processTime(30+rand(15));
	fisianna.orgasm();
	pc.loadInMouth(fisianna);

	clearMenu();
	addButton(0, "Next", fuckFisiSillyII);
}

public function fuckHerFisi(x:int):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);

	output("Nah, you’re going to stick to the plan just as you intended with a finish that will satisfy the both of you! As gently as you can, you pat the sides of Fisianna’s thighs, hoping that you can get through to her through her orgasmic haze. Thankfully, her grip on your ");
	if (pc.hairLength >= 3) output("[pc.hair]");
	else output("head");
	output(" loosens in response. When you raise you head from her spurting pussy, your lover looks into your eyes with a truly blissed-out expression. After shooting her a warm smile, you raise yourself up so that you are kneeling between her furred legs. When your [pc.cockOrStrapon " + x + "] aligns perfectly with her nethers, you attempt to slide it in. The passage inside is incredibly tight, as you would imagine from her still being in climax. Thanks to how sopping wet she is however, she provides more than enough natural lube for movement to be possible.");
	output("\n\nNot bothering to hold back at all, you thrust inside as hard as you can. Fisianna gasps aloud at the sudden penetration, squirming under you for a short while before relaxing again. While adjusting to your length, she reaches up to you with her large paws. You intertwine her fingers with yours, thankful for the extra support. Once you steady yourself, you supply the beat, starting off blisteringly fast. At this moment, you want to rush to a quick finish to join the kitten in orgasmic heaven. Fisianna moans loudly and intensifies her grip, both on your hands and on the phallus inside of her. In response, you thrust even harder, sending droplets of her girlish goo flying everywhere.");
	output("\n\nYou focus all of your senses on every lascivious detail that you can to help bring you that much closer to joining Fisianna in release. Flaring your nostrils, you inhale the strong, aromatic scent of her girl juices. After a strong shudder rolls through your body, you twitch your [pc.ears]. The sound of the bed creaking underneath of you, groaning in rhythm with the incredibly loud smacking of hips to hips, as well as the neko’s loud whimpering and moaning fills you with an unimaginable glee.");
	output("\n\nYour hands travel downwards past the neko’s thighs and towards her fluffy digitigrade legs. With one hand, you grab one of her legs to bring the bottom of her foot into view. You rub the soft fur covering her paws, and the plush ");
	if (silly) output("toe-beans");
	else output("pads");
	output(" underneath. With the other hand, you bring it down to gently rub Fisianna’s pink pearl. When you make contact, a sharp gasp draws your attention to Fisi’s face. She looks into your eyes, hers unfocused from the intense love-making you are giving her. A lengthened canine clamps down on her lower lips as she attempts to stifle a particularly loud mewl of pleasure.")
	output("\n\nHer playful lip-biting draws attention to your own lips. Passing your [pc.tongue] around them, you can still strongly taste ");
	if (silly) output("the pussy");
	else output("Fisianna’s sweet nectar"); 
	output(" on them, drawing another full-body shudder from you. Finally, a crushing tightness on your loins, as well as a warm and very wet stream of femcum that drains down your ");
	if (pc.balls > 0) output("[pc.balls]");
	else if (pc.hasVagina()) output("[pc.vagina]");
	else output("loins");
	output(" tips you well over the edge.");
	if (pc.hasHardLightEquipped()) {
		output("\n\nAfter a great deal of effort, you slip your [pc.cockOrStraponFull " + x + "] as far inside of Fisianna as you can. With explosive force, you utterly cream your [pc.lowerGarment] making a fairly large mess of your loins. With a body rattling shudder, you groan aloud while your arms and [pc.legs] tremble under you. You continue to weakly thrust into her until your orgasm winds down.");
		output("\n\nWhen you steal another look at Fisianna, you find that she is already sound asleep, purring peacefully all the while. She is still wearing a soft smile on her face while she dozes. With a light chuckle, you give her a peck on the cheek before pulling the sheets over the both of you. You lay down as comfortably as possible on top of your lover while you drift off to sleep with her.");
	}
	else if (pc.hasKnot(x)) {
		output("\n\nAfter a great deal of effort, you force your [pc.knot] against Fisianna’s tight, sodden hole. Since she is still in the middle of an intense orgasm, it proves very difficult to gain enough slack to slip it inside, even with how wet she is! Just as you are about to blow, her walls separate just wide enough to allow the engorged ball of flesh to sink inside. In one smooth motion, you hilt yourself to the very base, locking yourself with the squirming neko below.");
		output("\n\nWith explosive force, you blow your load into her quivering depths like an erupting volcano. Your [pc.cockHeadBiggest] pumps spurt after spurt of your seed into her, bathing her canal and creating a potent mix of both of your sexual fluids. A groan of relief escapes your lips while your arms and [pc.legs] tremble under you.");
		if (pc.cumQ() >= 750) output(" Your over-productive [pc.balls] churn out so much of their [pc.cumVisc] contents into your lover that it steadily distends her stomach outwards. She brings a paw to her swelling belly, smiling lazily at you all the while. You develop the distinct feeling that she really enjoys being filled with your liquid love!");
		output("\n\nYou continue to weakly thrust into her until your [pc.balls] can produce no more [pc.cumNoun]. When you steal another look at Fisianna, you find that she is already sound asleep, purring peacefully all the while. She is still wearing a soft smile on her face while she dozes. With a light chuckle, you give her a peck on the cheek before pulling the sheets over the both of you. You lay down as comfortably as possible on top of your lover while you sleep the knot off.");
	}
	else {
		output("\n\nAfter a great deal of effort, you slip your as far inside of Fisianna as you can. With explosive force, you blow your load into her quivering depths like an erupting volcano. Your [pc.cockHeadBiggest] pumps spurt after spurt of your seed into her, bathing her canal and creating a potent mix of both of your sexual fluids. A groan of relief escapes your lips while your arms and [pc.legs] tremble under you.");
		if (pc.cumQ() >= 750) output(" Your over-productive [pc.balls] churn out so much of their [pc.cumVisc] contents into your lover that it messily backwashes onto your loins and the bed.");
		output("\n\nYou continue to weakly thrust into her until your [pc.balls] can produce no more [pc.cumNoun]. When you steal another look at Fisianna, you find that she is already sound asleep, purring peacefully all the while. She is still wearing a soft smile on her face while she dozes. With a light chuckle, you give her a peck on the cheek before pulling the sheets over the both of you. You lay down as comfortably as possible on top of your lover while you drift off to sleep with her.");
	}
	fisiPrurience(-10);
	processTime(30+rand(15));
	fisianna.orgasm();
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", fuckFisiSillyII, x);
}

public function fuckFisiSillyII(x:int = -1):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);
	
	output("When you come to, you immediately notice that Fisianna is still fast asleep, and still purring softly. You gently brush some of the long strands of hair away from her face to have a look at her serene visage.");
	if (pc.isNice()) {
		output("\n\nAn idea springs to mind at the sight of the sleeping catgirl. The thought of treating your lovestruck companion to a breakfast-in-bed fills you with glee. You slide off of Fisianna, being very careful not to accidentally wake her. Once you maneuver off the bed, you let out a small sigh of relief when you see that she is still dozing peacefully.");
		output("\n\nStealthily, you exit the bedroom and make your way to the kitchen. You rummage through the different kinds of food in the refrigerator for something wholesome, yet refreshing. Eventually you decide to make a simple egg and toast platter for her. ");
		if (flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_PAMPERED || flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_BOOKWORM) output("You whip up a mean omelette from recipes that you learned while growing up, as well as the spices and herbs Fisianna has available. It’s made with just the right amount of toppings with golden brown toast topped with a small amount of butter. Pleased with the final result, you prepare a yokto shake for a drink. Afterwards, you place the shake on a nearby tray, along with Fisianna’s eggs and head back to the bedroom.");
		else output("You make a plate of fried eggs to the best of your ability, though you’re fairly confident they came out okay. After sprinkling some various salts and spices, you throw a few slices of bread into the toaster. While you’re waiting for the bread, you find a carton of orange juice and pour a glass for Fisianna. Once the bread finishes toasting, you place everything on a nearby tray and bring the food back to the bedroom.");
		output("\n\nYou enter the room carefully, thankful to find that Fisianna is still fast asleep. With tray in hand, you approach the sleeping neko. You set the tray down beside her on the bedside table, which makes a soft clinking sound. The resulting noise causes her ears and feet to twitch cutely. She stirs a brief moment later, yawning audibly while she rises from the bed.");
		if (silly) output("\n\n<i>“Nyaaa...");
		else output("\n\n<i>“Haaah...");
		output(" Gods and stars... My legs feel like they’re made of galotean goo. I didn’t think I could ever get off <b>that</b> hard before... You’re an amazing " + pc.mf("boyfriend", "girlfriend") + ". I hope you know that !” </i> Fisianna sits upright as best as she can on the bed. When she settles against the headrest of her bed, she sniffs audibly while her ears twitch cutely.");
		output("\n\n<i>“Mmm... what is that delicious smell? [pc.name], do you have anything to do with it?”</i> Fisianna asks as she turns her head towards you. You return her look with a smile and place the breakfast tray on her lap. Her eyes widen with realization over the fact that you made her breakfast in bed.");
		output("\n\n<i>“I figured I’d make you a meal to help you get your energy back. Go on, have some!”</i> you encourage her to try your cooking. Fisianna’s golden eyes begin to water while she shakes her head.");
		output("\n\n<i>“I... you didn’t have to do all of that for me... b-but thank you!”</i> your lover beams at you, then proceeds to sample your eggs. ");
		if (flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_PAMPERED || flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_BOOKWORM) output("<i>“O-Oh my goodness, this is so delicious! Where did you learn to cook like this?! If you weren’t a rusher, you could be a professional cook!”</i> she cheerfully exclaims while she scarfs down her food.");
		else output("<i>“Mmm... this is good! I don’t think I could ask for anything more from you,”</i> she beams at you in between bites.");
		output("\n\nOnce she finishes her food, you grab the emptied tray and set it aside. Fisianna slumps back into her bed with a wide smile on her face.");
		output("\n\n<i>“Please forgive me, but I think I still need some rest before I can get up. Don’t worry about the mess, I’ll... clean it up when I’m more awake. If you’re leaving, please be safe on your travels.”</i> Fisianna stifles another yawn while you cover her up with the bedsheet. Once she is comfortable, you lean down to give her a peck on her peachy lips.");
		output("\n\n<i>“Mmm... Love you, [pc.name]...”</i> The neko murmurs before turning on the bed and closing her eyes. With a warm feeling in your chest, you ");
		if (!pc.isNude()) output("reequip your [pc.gear] and ");
		output("leave your lover to rest and exit her apartment silently.");
	}
	else if (pc.isMischievous()) {
		output("\n\nA small grin creeps across your face while you watch the sleeping catgirl. She looks like she’s practically <i>begging</i> to be petted!");
		output("\n\nYou decide to indulge yourself and reach a hand up to one of Fisianna’s pointy ears. On contact, it twitches out of your reach a few times before finally settling down. From the base of her feline ear, you lightly scritch her dense fur and hair, very slowly working your way down her head. In her sleep, the neko begins to smile cutely when you reach her cheek.");
		output("\n\nYou stop your progress temporarily to gently rub the soft [fisianna.skinFurScales] on her face. Fisianna lightly presses her cheek into your hand, her smile growing steadily wider. You keep this up for about a minute before you move your hand to her neck. Once it reaches there, you lightly pass two of your fingers repeatedly over the area under her chin and just above her voice box. A heavy vibration begins to tickle your digits while you scritch her chin. Her purrs emanate strongly from her throat, traveling throughout her entire body, and to your own, greatly soothing you in the process.");
		output("\n\nThe relaxing feeling doesn’t last for very long however.");
		if (x >= 0) output(" During your playful petting, you realize that you are still hilted inside of Fisianna.");
		output(" Her bodily purring inadvertently stimulates your phallus, causing ");
		if (pc.hasHardLightEquipped()) output("an uncomfortable arousal to build in your loins");
		else ("you to become hard again");
		output(". You begin to squirm, trying your best not give into your growing desire to thrust while your teasing backfires, even more so when her eyes flutter open in response to your fidgeting.");
		output("\n\n<i>“Mmm... hey, [pc.name]. I’m happy to see you too!”</i> Fisianna sleepily giggles while she shifts gingerly under you. <i>“I’m surprised you’re still in the mood given how hard we both... uh... got off, but unfortunately, I still need some rest. Y-you did quite a number on me...”</i> she groans, smiling sheepishly at you. <i>“Still... I could use some more of what you were doing before, to help me fall back asleep. Can you, please?”</i> she asks with pleading, expectant eyes. After shaking off your clear embarrassment, you oblige, figuring it’s the least you owe her from waking her from her nap. You pull out of her and lay to her side so you don’t repeat the same mistake again, after which you resume petting Fisianna.");
		output("\n\nYou keep this up for a few minutes until her eyes finally flutter closed again. When you are sure that she has fallen back asleep, you slide out of the bed to stretch. After you’re done, you ");
		if (!pc.isNude()) output("reequip your [pc.gear] and ");
		output("exit Fisianna’s apartment silently.");
	}
	else {
		output("\n\nYou think it would be best not to disturb her further while she is sleeping so peacefully. Without rocking the bed too much, you slide off of Fisianna and the bed. Once you gather your belongings, you take another look at the sleeping neko. A thought creeps into your mind, telling you it would at least be prudent to leave a note behind of some kind before you left. Once your mind is made up, you search the room carefully for any blank notepads to use.");
		output("\n\nLuckily you find one in a drawer inside her bedside table. You settle down at the desk opposite of the bed and push aside the number of tech books strewn across the surface. It takes longer than you initially thought to write a convincingly heartfelt letter telling her how much you enjoyed the time with her and how much you love her, and that you’re sorry for leaving so soon after. After reading it over a few times, with a nod of satisfaction, you lay the pad next to her head so that she will easily be able to find it when she wakes. Once you cover her back up fully with the bedsheet, you exit Fisianna’s bedroom and apartment, your good deed done for the day.");
	}

	IncrementFlag("FISI_TIMES_FS");
	IncrementFlag("FISI_TIMES_SEXED");
	flags["FISI_LAST_SEXED"] = GetGameTimestamp();
	processTime(30+rand(15));
	currentLocation = "RESIDENTIAL DECK 13";

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function betFisiWinLerHerLead():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	
	output("You decide to let Fisianna call the shots this time. Her eyes light up in surprise when you tell her this.");
	output("\n\n<i>“B-but you won, fair and square. I thought you might have wanted to...”</i> Fisianna trails off. You smile and reassure her that you’re okay with letting her lead, and that it is perfectly within your right as the winner to choose to play the more passive role.");
	output("\n\n<i>“I... well, okay. If you say so, [pc.name]. I kind of wasn’t expecting you to be this... generous with me. It might not feel the same, but I’ll think of something we can do!”</i> she stammers. After a few moments of thought her golden eyes finally light up with a mischievous twinkle to them.");
	output("\n\n<i>“Alright! I know what we can do for the moment...”</i>");

	processTime(10);
	clearMenu();
	var nextScene:Array = [sexyCuddlesWithFisiI];
	var cIdx:int = largestCockIndexThatFitsFisiDimensions();
	if (fisiPrurience() >= 25 && cIdx >= 0) nextScene.push(getRiddenByFisiI);
	if (fisiPrurience() >= 50 && flags["FISI_HL_PANTIES"] == 2) nextScene.push(getPeggedByFisiI);
	if (fisiPrurience() >= 75 && cIdx >= 0) nextScene.push(GetEdgedByFisiI);
	addButton(0, "Next", nextScene[rand(nextScene.length)]);
}

public function betFisiLoseI():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	showName("\nDEFEAT!");
	
	output("The two of you play extremely cautiously while you search for each other in the densely forested map. The fact that the both of you are wearing camouflaged armor doesn’t exactly help with that. A few minutes into the match, you come to a small clearing. You have your weapon at the ready, keeping an eye out for any signs of movement. At the last second before turning around, you notice a metallic glint in the distance, but it is too late by then. Your display flashes red as a ‘You were sniped by: KittyLuvalle’ message scrolls across the kill feed. Cursing yourself for not reacting sooner, you respawn and resume the search for Fisianna.");
	output("\n\nEventually in your travels, you arrive at a large river. After concluding that the waters are too deep and fast-moving to traverse safely, you decide to wait it out behind some nearby bushes along the edge for any sign of Fisianna. The sound of rushing water makes it hard to hear any other noises, but it doesn’t obscure your vision at least. After waiting a few minutes, you decide it would be best to move on. Before you can do so however, you hear the telltale click of a gun cocking a bullet into its chamber behind your head. You whirl around to find yourself face to face with the barrel of a pistol. Another flash of red appears the next moment after, followed by a ‘You were killed by: KittyLuvalle’ message on your HUD. Damn this cat is sneaky!");
	output("\n\nYou can feel your frustrations mounting when you respawn. Your sly feline lover has a two to zero lead on you, with one more kill to go until she wins. Taking a moment to calm down, you take a look at your surroundings. You find that you are within an area full of exceptionally large trees. Some of them have old looking structures built near the top of them; most likely abandoned lookout posts.");
	output("\n\nAfter briefly devising a plan to ambush Fisianna here, you decide it would be a good idea to take the high ground. You make your way to one of the weathered step-ropes, giving it a pull once you’re there to test its integrity. When you are convinced it will hold your weight, you holster your weapon and climb the ladder as fast as you are able. Once you climb into the dilapidated lookout post, you ready your rifle and scan the forest below.");
	output("\n\nFor a while, everything below you is unmoving and silent. Just when the waiting starts to lull yourself into a false sense of security, you hear a shot ring out in the distance, followed by a surprising shock to your shoulder. You stagger backwards in bewilderment, wondering where the shot came from, but in your frantic state of mind, you forget about the trapdoor entrance you came through. The floor disappears beneath your feet as you fall through the hatch, plummeting to your impending doom. Moments before you hit the ground, you hear another distant shot ring out over the rush of air blowing past your ears. Your display flashes red once more as a ‘You were sniped by: KittyLuvalle’ message appears on your kill feed. After displaying the final score for the match, everything fades to black while the game shuts itself off.");

	flags["FISI_BET_RESULT"] = 0;
	IncrementFlag("FISI_TIMES_LOST");
	processTime(15+rand(10));

	clearMenu();
	addButton(0, "Next", betFisiLoseII);
}

public function betFisiLoseII():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	
	output("You take your holo-harness off and look incredulously at Fisianna. You were beaten handily, and are now at the mercy of your feline companion.");
	if (fisiPrurience() < 25) {
		output("\n\n<i>“I-I won? I didn’t think I would this time around... I guess I was lucky this time. I-I haven’t even thought of what I would like to do with you yet...”</i> Fisianna looks at you in disbelief as she raises her paw to her [fisianna.face] in wonder. After a few moments of thought, you can see Fisianna’s ears flick as her mouth curls into a sweet smile.");
		output("\n\n<i>“I-I think I figured out what I’d like to do with you, [pc.name]...”</i>");
	}
	else if (fisiPrurience() >= 25 && fisiPrurience() < 50) {
		output("\n\n<i>“I-I won... I guess a little bit of extra practice pays off after all...”</i> Fisianna smiles sheepishly as she raises a paw to her [fisianna.face] in thought. Finally, she lowers her paw as her ears flick and her smile grows slightly wider.");
		output("\n\n<i>“I think I know what we can do, [pc.name]...”</i>");
	}
	else if (fisiPrurience() >= 50 && fisiPrurience() < 75) {
		output("\n\n<i>“Oh hey, I won! Awesome!”</i> Fisianna cheers gleefully. After she winds down, she brings a paw to her [fisianna.face] while wondering aloud, <i>“Hmm... now, what to do with you?”</i> Finally she lowers her paw as her eyelids lower seductively and her smile grows wider.");
		output("\n\n<i>“Alright. I think I’ve decided how I’d like to take care of you, [pc.name]...”</i>");
	}
	else {
		output("\n\n<i>“Yes! Looks like I win! I’m getting pretty good at this, understandably so with such... motivation...”</i> Fisianna purrs the last part with obvious sultry undertones. She raises a paw to her [fisianna.face] in thought as she slowly paces in front of you. Her movements are more akin to a predator toying with their prey. Finally she lowers her paw as her eyelids lower seductively and she smiles confidently at you.");
		output("\n\n<i>“Mmm... I believe this kitty has decided what she would <b>love</b> to do with you...”</i>");
	}
	output("\n\nFisianna stands up from the couch and makes her way to the bedroom door. With a finger, she points it at you and crooks it inwards in a “come hither” gesture before disappearing inside. At that sexy invitation, you spring up from your seat and follow your lover into the room. Once you enter, the amorous kitten is nowhere in sight. You start to wonder where she may have gone off to this quickly, when suddenly, you feel a furry paw press against the small of your back. You don’t resist and let your lover guide you along, your curiosity increasing with each step forward.");
	output("\n\nWhen you meet the edge of the bed, Fisianna’s paw gently, but forcefully shoves you onto it. You fall face-first into the mattress in front of you, temporarily blinded from the sheets snapping up with you on impact. Shaking off the cloth from your face, you turn around to face her, only to have the catgirl jump onto the bed after you, pinning you below her. Despite the sweet smile on her face, her eyes look hungry. She leans in and mashes her lips to yours for only a brief moment before laying beside you. You wonder what she has in store for you...");
	
	processTime(15+rand(10));
	
	var cIdx:int = largestCockIndexThatFitsFisiDimensions();
	var nextScene:Array = [sexyCuddlesWithFisiI];
	if (fisiPrurience() >= 25 && cIdx >= 0) nextScene.push(getRiddenByFisiI);
	if (fisiPrurience() >= 50 && flags["FISI_HL_PANTIES"] == 2) nextScene.push(getPeggedByFisiI);
	if (fisiPrurience() >= 75 && cIdx >= 0) nextScene.push(GetEdgedByFisiI);
	addButton(0, "Next", nextScene[rand(nextScene.length)]);
}

public function getRiddenByFisiI(fromMenu:Boolean = false):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);

	if (!fromMenu) {
		if (fisiWonLastBet()) fisiPrurience(5);
		else fisiPrurience(10);
	}

	var x:int = largestCockIndexThatFitsFisiDimensions();

	if (fisiPrurience() < 50) {
		output("<i>“I-I was thinking... maybe...” </i> Fisianna stammers while blushing profusely. Despite her reservedness, you can feel her snaking a paw ");
		if (pc.isNude()) output("towards your [pc.cocks]");
		output("underneath of your [pc.lowerGarment]");
		output(". <i>“M-maybe I could um... ride you... Ah! It’s just so you don’t have to do all of the work, I mean.”</i>");
	}
	else {
		output("<i>“Say, [pc.name]? I’ve been thinking... really <b>long</b>... and really <b>hard</b> about this.”</i> Fisianna purrs coyly while she ");
		if (pc.isNude()) output("slides a paw towards your [pc.cocks]");
		else output("snakes a paw underneath of your [pc.lowerGarment]");
		output(". <i>“I was thinking... maybe I could go for a ride, that way you don’t have to do all of the work.”</i>");
	}
	output("\n\nYour " + pc.cockDescript(x) + " stands up in attention immediately at this proposition, which consequently brushes against Fisianna’s​ plush paw pads. ");
	if (fisiPrurience() < 50) output("Her eyes light up slightly in surprise as she gingerly rubs the underside of your phallus. <i>“O-oh! Good... I take it that you would like that idea then?”</i> the catgirl asks you innocently. When you nod your head in confirmation, she smiles sweetly before stopping her ministrations to stand up on the bed.");
	else output("She softly giggles in response as she gingerly rubs the underside of your phallus. <i>“It seems like you like that idea! Alright then...”</i> The catgirl gives you a sidelong smirk before she stops her teasing ministrations to stand up on the bed.");
	output("\n\nYou look up towards the grand view of the feline beauty looming over you. She has you pinned between her fluffy digitigrade legs, which tempts you to rub the soft fur on them. Fisianna smiles down at you while she slowly strips her vest off, followed by her t-shirt. Even though her chest isn’t very big, it looks mountainous from your perspective. She unhooks her bra next, letting her supple boobflesh break free from their confines. You catch a glimpse of the neko’s ");
	if (fisiPrurience() < 50) output("passion-filled smile");
	else output("coy wink");
	output(" before your vision is obscured by her lacy bra. The heavy scent of her mammaries fills your nostrils, almost becoming too much to bear already. By the time you shake the garment off of your face, she is already shimmying out of her jeans. Her pants fall with a soft ‘thud’ on your chest. Lifting one of Fisianna’s fluffy feet, you help her slide them off one leg, then do the same for the other.");
	output("\n\nLooking up in anticipation, you witness Fisianna hooking her fingers under the hem of her panties. She slowly teases the fabric down to her thighs, bringing along a thin trail of fem-lube that connects her lacy panties to her already wet pussy. When she slips it past her knees, the strand of kitty-juice breaks, much to your dismay. When the neko’s panties hit your chest, you help her take them off of her ankles and take a brief sniff of the undergarment. On top of the scent of her breasts, the smell of her wet nethers leaves you fidgeting with need underneath of her, silently begging to have her smother you. She notices this immediately and kneels atop of you, pulling you into a deep kiss for a few long moments.");
	if (!pc.isNude()) output("\n\n<i>“Now... I think it’s your turn.”</i> Fisianna whispers breathlessly into your ear after breaking the kiss. Taking only a brief moment to move beside you, she helps you slide out of your [pc.gear]. Once she finishes, she is on top of you again and resumes the long-winded make-out session.");
	output("\n\nIn the middle of your embrace, Fisianna sinks into you, letting you fully feel her warmth throughout your entire body. Consequently, the underside of your " + pc.simpleCockNoun(x) + " lays pinned against your belly and her moist pussy lips. It pulses weakly while dribbling droplets of precum whenever she moves slightly.");
	output("\n\nEventually, Fisi releases the lip-lock on you and presses her paws against your chest for support. She pushes off of you, once again straddling your frame. Once she has a firm center of balance, her ample hips begin to move in a slow undulating motion along your shaft. The neko exhales breathily once she picks up speed, absolutely slathering your cock with her arousal. The gulf between her engorged labial lips feels tantalizingly soft and wet, with friction lessening with each grinding motion she makes. She progressively shifts faster atop of you, setting the bed below you in motion in rhythm with her sides.");

	processTime(15+rand(10));

	clearMenu();
	addButton(0, "Next", getRiddenByFisiII, x);
}

public function getRiddenByFisiII(x:int):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);

	output("Fisianna keeps this up for the better part of a minute before finally stopping to rest. She pants heavily while sliding a paw under her towards your pussy-drenched " + pc.simpleCockNoun(x) + ". Once she reaches it, her fingers envelop your length, providing you with a soft sheathe, for the time being. The kitten briefly separates her hips from yours while lining up the tip of your cock with her sopping wet vulva.");
	output("\n\nYour lover jerks your cock a few times before lowering her bottom, letting your " + pc.cockHead(x) + " spear her folds. The pleasure you feel mounts up fast while she slowly descends, enveloping your turgid rod with her moist inner warmth. ");
	if (pc.cocks[x].cLength() < 8) output("Eventually you feel her hips press against yours, now that you’ve fed all of your length inside of her.");
	else output("Eventually, your penis comes to an impassible tightness within her as she have bottomed out.");
	output("\n\nA shuddered, low moan escapes from her lips the moment she settles. Her golden feline eyes fixate on you with a laser-like focus while she lifts her ample hips again, that cute smile of hers never fading from her peachy lips. She bites her bottom lip as the crown of your cock meets the entrance of her love tunnel once more. A small mewl escapes her when she slides back down, hitting an especially sensitive area within her. Fisianna’s entire body starts to shudder in ecstasy when your " + pc.simpleCockNoun(x) + " hits the very back walls of her depths.");
	output("\n\n<i>“H-hhnnn...”</i> she groans as she struggles to seize control of her spasming body. Her arms nearly buckle under her while she uses your [pc.breasts] as leverage to keep herself from collapsing on you. Once she regains control, she smiles sheepishly at you and resumes her ministrations on you.");
	output("\n\nYou place your hands on Fisianna’s thighs when she increases the tempo of her thrusts against you. In response, she smiles wider, appreciating the additional affectionate touch. Her wet canal makes passage easy within her, though her walls grip you with a gentle tightness. In between the undulations of her hips, you feel her inner muscles unconsciously wringing your cock, completely independent of her own conscious movements. The sensation brings you alarmingly close to orgasm in a hurry, though you grit your teeth and use sheer willpower to keep yourself from climaxing too soon.");
	output("\n\nWet, lurid smacking sounds fill the air as your lover continually bashes her hips into yours. ");
	if (pc.balls > 0) output("You feel one of Fisianna’s tails cup your [pc.balls], gently sloshing their viscous contents that are aching to burst free.");
	else output("You feel one of Fisianna’s tails start to rub against the base of your " + pc.simpleCockNoun(x) + ", adding further to the stimulation you are already receiving.");
	output(" In response to this, you tighten your grip on her thighs and attempt to move your own [pc.hips] upward in rhythm with the neko’s. At first, her eyes start to lose focus when you penetrate the deepest recesses of her vagina. She then plants her paws down on your shoulders and presses her hips down hard onto you, ceasing your upward thrusting.");
	if (fisiPrurience() < 50) output("\n\n<i>“N-no...”</i> your feline lover whines, shaking her head from side to side while she wears a small frown on her face. <i>“I wanted to take care of you so you don’t have to do anything... Please, relax and don’t exert yourself for my sake.”</i> Fisianna leans down and plants a short, gentle kiss to your lips before sitting up on your lap again.");
	else output("\n\n<i>“Mm-mmh... None of that.”</i> your feline lover purrs, though aren’t sure if there was a subtle undertone of a growl as well. She shakes her head from side to side while she wears a sweet, but slightly predatory smile. <i>“I said I would take care of you, so relax, [pc.name]...”</i> Fisianna leans down and plants a short, gentle kiss to your lips before sitting up on your lap again.");
	output("\n\nInstead of thrusting her hips like she was doing previously, the catgirl grinds up and down against you. Her vaginal walls grip you gloriously tighter as she takes your phallus on a wild ride within her.")
	output("\n\n<i>“Haaah, hah, aah, h-uuhnn...”</i> She moans to the ceiling, her tongue lolling from her mouth in pure bliss. Fisianna gyrates her hips progressively faster while her cries rise higher in pitch. Your " + pc.cockDescript(x) + " batters against her inner walls as she uses your masculine tool to caress her G-spot. When she starts to purr, her bodily trembling stimulates your cock to the point of no return. You let out an involuntary whimper when you reach the precipice of your self-restraint over your impending release.")
	if (pc.hasKnot(x)) {
		output("\n\n<i>“Nnnngh. Yes! P-please cum...”</i> Fisianna coos while she grinds into you as hard as she can. Her already wet passage allows your " + pc.knotDescript(x) + " slip inside of her with relative ease. She lets out a delighted squeal when the swollen ball of flesh penetrates her and holds out her paws towards you. You reach up and interlace your fingers, giving Fisi additional support while she continues to grind into your knotted tool. A low grunt escapes your mouth when your control over your coming orgasm finally slips. Despite the pressure against your hips, they lurch upwards, slightly elevating her.");
		output("\n\nWith force akin to a bomb, you explode inside of her, blasting your pent-up seed directly into her cervix. In response, her walls spasm wildly around your length, milking you for all you are worth. Spurt after spurt of your [pc.cumVisc] cum bastes Fisianna’s womb. With your " + pc.knotDescript(x) + " lodged firmly inside her, your ");
		if (pc.cumQ() >= 750) output("highly productive load swells her belly with each orgasmic pulse until she looks positively pregnant. Your feline lover releases your hands to gently rub her gravid stomach in an almost maternal manner. <i>“Stars... I never would have known it would feel so good to be filled with so much of your ‘liquid love’ if I didn’t meet you...");
		else output("[pc.cum] stays well-trapped within her while your cock continues to throb heartily against her vibrating walls. Your feline lover releases your hands to gently rub her belly in an almost maternal manner. <i>“Stars... I never would have thought that I would grow to love being tied together like this before I met you...");
		output(" I love you so much, [pc.name]...”</i> She smiles at you dreamily, still blissed out from the afterglow.");
	}
	else {
		output("<i>“Nnnngh. Yes! P-please cum...”</i> Fisianna coos while she grinds into you as hard as she can. She lets out a delighted squeal when she sinks the whole of your length inside of her and holds out her paws towards you. You reach up and interlace your fingers, giving her additional support while she continues to grind into the base of your " + pc.simpleCockNoun(x) + ". A low grunt escapes your mouth when your control over your coming orgasm finally slips. Despite the pressure against your hips, they lurch upwards, slightly elevating her.");
		output("With force akin to a volcano, you erupt inside of her, blasting your pent-up seed directly into her cervix. In response, her walls spasm wildly around your length, milking you for all you are worth. Spurt after spurt of your [pc.cumVisc] cum bastes Fisianna’s womb.");
		if (pc.cumQ() >= 750) output(" Your highly productive load backwashes out of her vagina in rhythmatic pumps, making a veritable mess of both of your lower bodies, as well as the bed.");
		else output(" You start to see some of your [pc.cumNoun] pool at the base of your shaft while it throbs heartily against her vibrating walls.");
		output(" Your feline lover releases your hands to gently rub her belly in an almost maternal manner. <i>“Stars... I never knew it would feel so good to make love like this before I met you... I love you so much, [pc.name]...”</i> She smiles at you dreamily, still blissed out from the afterglow.");
	}
	output("\n\nWhile still leaving you buried inside of her, Fisianna leans over and nuzzles into your neck, peppering it with kisses. The aroma of her hair, which smells pleasantly of citrus extract, is strong in your nose. You hug her close as her gentle purring begins to lull you to sleep.");

	processTime(30+rand(15));
	fisianna.orgasm();
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", getRiddenByFisiIII);
}

public function getRiddenByFisiIII():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);

	output("When you come to, you find that you are completely alone in Fisianna’s room. From the looks of things, she’s cleaned up any evidence of your trysts already and covered you in a light blanket while you were resting. All of your belongings are neatly piled nearby on a table, as well as a small snack with a note on top. Smiling to yourself, you slide out of bed to retrieve the paper and open it up.");
	output("\n\n<i>I had a wonderful time with you, [pc.name]! I very much look forward to the next time we can do this again! I’m so sorry I couldn’t stay and sleep with you for long, but I had to finish a repair job I had to do on a faulty VI chip. I left a little snack for you to replenish yourself after our little... romp. I hope you enjoy it! ~Love, Fisianna.</i>");
	output("\n\nYou look towards the table with your belongings and observe that the snack is a fairly small, well seasoned filet of salmon with a spring mix salad. Thanking Fisianna silently, you graciously eat the snack that she lovingly prepared for you. ");
	if (pc.isNude()) output("Once done, you gather your belongings before heading out of the bedroom.");
	else output("Once done, you grab your gear and re-equip it before heading out of the bedroom.");
	output(" You knock twice gently on the door to your Fisi’s workroom to let her know that you are headed out.");
	output("\n\n<i>“Ah, alright, [pc.name]. Take care on your travels! Love you lots!”</i> Fisianna calls to you through the closed door. Before you step away from the door, you hear Isis exclaim, <i>“Oh! " + pc.mf("Mr.", "Ms.") + " Steele is outside!?”</i> and then a loud crash inside. When you are about to open the door to check if everything is okay, you hear Fisianna’s voice again.");
	output("\n\n<i>“I-I’m fine! This happens sometimes!”</i> Fisianna laughs nervously. <i>“Isis, please be a little more careful...”</i> she scolds the AI with a hushed, but stern tone.");
	output("\n\n<i>“A-apologies Fisianna. I shall attempt to be more cautious in the future. If you can hear me, I would like to see you again at your earliest convenience, " + pc.mf("Mr.", "Ms.") + " Steele!”</i> Isis gushes. You laugh to yourself and head out of Fisianna’s apartment, eager for the next chance you have to see Fisianna and Isis again.");

	IncrementFlag("FISI_TIMES_RIDDEN");
	IncrementFlag("FISI_TIMES_SEXED");
	flags["FISI_LAST_SEXED"] = GetGameTimestamp();

	processTime(15 + rand(5));
	
	//Apply Home Cooking buff.
	eatHomeCooking(100);
	currentLocation = "RESIDENTIAL DECK 13";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function getPeggedByFisiI(fromMenu:Boolean = false):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);

	if (!fromMenu) {
		if (fisiWonLastBet()) fisiPrurience(5);
		else fisiPrurience(10);
	}
	output("<i>“You know... I never have too many chances to field test that ‘present’ you gave to me before. I think I would love to do so this time around.”</i> Fisianna smiles innocently​. You flush at the idea of feline companion pegging you with her new hardlight dildo panties. She giggles lightly when she sees the growing grin of excitement on your face. <i>“Alright then! It looks like you’re on board with the idea! I’m glad...”</i> She slides off of the bed while giving you a wide smile in glee.");
	if (!pc.isNude()) output("\n\n<i>“First things first though...”</i> Fisianna croons seductively as her paws settle on your [pc.legs]. You watch quietly while her hands wander further up your body. She gives your crotch a playful grope before she moves her hands up to your chest. In a flash, she removes your [pc.gear], abandoning her previously slow paced teasing. Once she finishes, the catgirl steps backwards, looking in marvel at your now naked body. <i>“Okay, now it’s my turn...”</i>");
	output("\n\nFisianna brings her paws to her chest and slowly removes her vest in an impromptu strip tease. She then lowers her hands to her hips, grabbing the hem of her shirt and hiking it and up and over her head, revealing her lacy white bra. While still keeping her eyes focused squarely on you, she unhooks it and lets it fall to the floor. The neko’s perky mammaries bounce heartily once they are freed of their confines.");
	output("\n\nShe notices you watching the hypnotic sway of her tits and pauses her strip tease to cover them up teasingly with her paws. Fisianna squeezes and kneads her supple boobs between her fingers, as if to taunt you with the fact that they are out of reach. To further tantalize you, she lifts one of her breasts to her mouth and gives her inverted nipple a long, drawn-out lick, making it pop out in response to the stimulation. Upon seeing the desperate look on your face, she giggles and stops teasing you to finish her strip tease.");
	output("\n\nAfter bringing her paws from her breasts to her hips again, Fisianna unbuckles her jeans and shimmies out of them. Once she is in nothing but her panties, she slowly stalks towards you, flipping on her hardlight dildo along the way. As if on instinct, you turn yourself around on the bed and hike your [pc.butt] in the air, presenting your ");
	if (pc.hasVagina()) output("[pc.vagina] and ");
	output("pucker to the seductive kitty.");
	if (pc.hasTail()) {
		output(" Your [pc.tails] wag");
		if (pc.tailCount == 1) output("s");
		output(" excitedly back and forth in anticipation.");
	}
	output("\n\n<i>“O-oh, wow... Someone’s certainly eager, and I thought it was just me. I’m not that used to taking charge yet...”</i> Fisianna sheepishly laughs, genuinely caught off-guard at your show of submission. <i>“Still... I think it might be best if we, uh... prepped you up first.”</i>");
	if (pc.hasVagina()) output(" You can hear the neko stop in her tracks before speaking up again. <i>“But um... was there a part you wanted me to specifically focus on for this? I do have a couple of choices here...”</i>");

	processTime(15+rand(10));

	clearMenu();
	if (pc.hasVagina()) {
		addButton(0, "Vaginal", getPeggedByFisiII, 1);
		addButton(1, "Anal", getPeggedByFisiII);
		addButton(2, "Let Her Pick", getPeggedByFisiII, 2);
	}
	else addButton(0, "Next", getPeggedByFisiII);
}

public function getPeggedByFisiII(nextScene:int = 0):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);

	var vIdx:int = -1;
	if (nextScene == 1 || (nextScene == 2 && rand(2) == 0))
	{
		vIdx = rand(pc.vaginas.length);
	}

	if (nextScene == 0) output("<i>“Alright then, I’ll try to give that butt some extra love and care. Just tell me if I ever get to rough.”</i> Fisianna purrs behind you.");
	else if (nextScene == 1) output("<i>“Alright then, I’ll try to give your vagina some extra love and care.”</i> Fisianna purrs behind you.")
	else output("<i>“O-oh, are you sure? I hope you don’t mind my choice in the matter, but unfortunately I can’t pick both since only one dildo. Hehe, well then... eeny, meeny, miny... moe!”</i> Your Fisianna playfully exclaims behind you.");
	if (vIdx >= 0) {
		output("\n\nYou hear Fisi take a few steps towards you before feeling a soft paw grope your [pc.butt]. After a few tense moments, you feel another paw join the first. Her hands gently spread your cheeks, and you feel a small draft of cool air against your loins. You can hear the neko audibly sniffing at your [pc.vagina " + vIdx + "], taking in the sweet scent of your arousal. Afterwards, a wave of warmth flows through you as the neko shakily ");
		if (silly) output("sexhales.");
		else output("exhales.");
		output("\n\nA pleasurably wet tongue soon makes contact with your [pc.vagina " + vIdx + "], slowly lapping at your labial lips. You involuntarily whimper at the wonderful sensation, wanting more of that feeling. Fisianna delivers, increasing the pace of her oral ministrations and centering her efforts towards your awaiting entrance. Once her tongue makes it there, she buries her face into your bottom, spearing your inner folds as deep as she can manage. You moan loudly to the ceiling while her tongue works it’s magic within you, making you wetter as she continues.");
	}
	else {
		output("\n\nYou hear Fisi walk a few steps away, and then the sound of a drawer opening. Out of curiosity​, you turn your head towards her to find that she has a bottle of reflexive lube in her paws. You give her a questioning look as if silently asking: <i>“What are <b>you</b> of all people doing with a bottle of <b>that?</b>”</i> She smiles sheepishly when she notices your stare of intrigue.");
		output("\n\n<i>“Eh... heh. I-I dabble sometimes when you aren’t around, plus this stuff works great for all types of things! A-anyways!”</i> She gives you resolute look while she approaches your hindquarters with bottle in hand. You face forward when one of her plush paws gently rubs your bottom and lightly squeezes your [pc.butt]. For a brief moment, she removes her paw from your bottom to apply some of the lube onto her fingers. She then spreads your buttocks with one hand, fully exposing your back door to her.");
		output("\n\nYou feel a cold shock when Fisianna’s digits first make contact with your asshole. The frigid sensation causes you to clench tightly, which draws a complaintive whine from Fisianna.");
		output("\n\n<i>“I-I’m sorry... I know it’s a bit cold to start with, but I can’t do anything about it unfortunately. Please, try to relax as best as you can.”</i> She pleads with you. You divert your mind away from the somewhat unpleasant chilliness of her digits while the catgirl reapplies them to your backdoor. She gently rubs her fingers around the outer rim of your hole, caressing it softly until her paw pads no longer feel cold to the touch.");
		output("\n\nOnce you begin to relax, Fisianna slides a lube slathered finger into your butthole. You groan in response, throughly enjoying the feeling of having your bum finally filled with something. Her finger twists and turns inside of you, making sure to spread as much lube around your anal walls as she can. The lone digit is soon joined by a second, and then a third as you feel the effects of the slippery oils working their magic already. For a short while, your lover pumps her fingers in and out of you until the lube covers just about everywhere inside of you.");
	}
	output("\n\nOnce your [pc.vagOrAss " + vIdx + "] is sufficiently lubed, Fisianna withdraws from the orifice, leaving you with a feeling of agonizing emptiness. You whimper pitifully, begging for more, but all you receive is another paw placed on your bottom.");
	output("\n\n<i>“You... really want this badly. I have to admit, you look really cute when you’re antsy. Stars, you make me feel like such a delinquent doing that... Not that I’m complaining or anything. Hehe, alright then. I think we’re ready.”</i> Her paw gingerly rubs your [pc.butt] and moves to your hips. You feel a wonderful tingling sensation when her dildo rubs against your ");
	if (vIdx >= 0) output("vaginal");
	else output("anal");
	output(" entrance.");
	output("\n\nThanks to Fisianna’s earlier preparations, you are nice and slick for her cat-shaped hardlight shaft to slip inside of you easily. Your ");
	if (vIdx >= 0) output("folds");
	else output("inner walls");
	output(" clench tightly to her while she slowly pushes her way in. The catgirl gasps aloud when she reaches the halfway point and stops there. Even though you can feel her trembling, your patience quickly runs thin from the stoppage of progress, and you push yourself against her the rest of the way. A sharp moan burst out of the neko’s mouth and her grip on your [pc.hips] tightens so much, that you can feel her retractile claws poking against your [pc.skinFurScales].");
	
	if(vIdx >= 0)
	{
		if (pc.vaginalVirgin) output("\n\n<b>Congratulations; you’ve lost your virginity!</b>");
		pc.cuntChange(vIdx, 300, (pc.vaginalVirgin ? false : true));
	}
	else
	{
		if (pc.analVirgin) output("\n\n<b>Congratulations; you’ve lost your anal virginity!</b>");
		pc.buttChange(300, (pc.analVirgin ? false : true));
	}
	
	if (silly) output("\n\n<i>“M-meowrf! That’s r-tight! Really tight!”</i>");
	else output("\n\n<i>“A-aaahn! I-I think I may have dialed up the sensitivity a little <b>too</b> much... Haah... Just need a moment to adjust.”</i>");
	output(" Fisianna slowly, but steadily loosens her grip on you while she struggles to grasp control of her nerves. You spend the next few moments utterly stuffed with her toy, loving every second of it. When Fisi stops trembling, you feel her hips slightly withdraw from you. <i>“Okay... I think I’m alright to start moving. Are you?”</i> She asks while she thrusts back into you in a shallow motion.");
	output("\n\nYou nod your head in approval and lay the top of your body on the bed, further hiking your [pc.butt] in the air for Fisianna to use. Her thrusts start off small while she adjusts to the overly stimulative phallus. She eventually picks up the pace, moving her hips progressively faster and with increasing force. The sound of slapping hips soon becomes more audible, as well as both of your moans of pleasure. With each wet bang against your ");
	if (vIdx >= 0) output("vaginal");
	else output("anal");
	output(" walls, you brace against the impact, not letting your [pc.legs] give out. You carefully​ adjust yourself in between thrusts to aid your lover into hitting the right spots.");
	output("\n\nOn one particular thrust of her hips, an almost euphoric sensation washes over you when she hits a particularly sensitive area. You moan into the sheets and reach out behind you with both of your hands. Soon after you feel the familiar, plush pads of Fisianna’s fingers intertwine with yours. Using the new leverage, her thrusts against you begin to hit the deepest parts of your [pc.vagOrAss " + vIdx + "].");
	if (pc.hasGenitals()) {
		output(" The head of her hardlight dildo repeatedly bumps against your ");
		if (vIdx >= 0) output("cervix");
		else output("prostate");
		output(", milking ");
		if (pc.hasCock() && pc.hasVagina()) output("globs of pre from [pc.eachCock], as well as droplets of [pc.girlCum] down your legs.");
		else if (pc.hasVagina()) output("droplets of [pc.girlCum] down your legs.");
		else output("globs of pre from [pc.eachCock].");
	}
	output("\n\nFisianna’s grip on your hands tighten when she stops momentarily to bury herself up to the hilt inside of you. She whimpers softly while she rotates her hips behind you, making her tool rub sensuously against every facet of your ");
	if (vIdx >= 0) output("vaginal");
	else output("anal");
	output(" walls. <i>“Hnng... t-this feels amazing... <b>You</b> feel amazing!”</i> Fisianna blurts out before she begins to move her hips again.");
	output("\n\nFor the next few minutes, the catgirl ruts you nonstop. The thick musk of both of your sexes fills the air around you. All self-awareness is lost from you at this point. You clench as tightly as you can, feeling every single nub of Fisianna’s kitty-shaped dildo inside of you. Your mounting orgasm draws closer with every rhythmatic pump of her faux cat-dick inside of your [pc.vagOrAss " + vIdx + "].");
	output("\n\nAt last, your ");
	if (vIdx >= 0) output("vaginal");
	else output("anal");
	output(" walls begin to spasm wildly as the first waves of your release flow through your loins. You push back against Fisianna’s hips, desperate to stuff as much of her phallus inside you as you can. She pushes herself into you with equal force, letting your inner muscles do the rest of the work.");
	if (pc.hasVagina() && pc.wetness() >= 3)
	{
		output(" Your vaginal walls unleash a torrent of [pc.girlCum] all over Fisianna’s panties, your [pc.legs] and the sheets");
		if(vIdx >= 0) output(". Her phallus squelches loudly in your flooded tunnel while your vaginal walls milk");
		else output("--all while your backdoor milks");
		output(" her hardlight dildo for an unobtainable purchase.");
	}
	else if (pc.hasCock() && pc.cumQ() >= 750) output(" Like a fire hydrant, [pc.eachCock] burst their [pc.cumVisc] contents all over your [pc.chest] and the bed. The feeling of your warm, [pc.cum] all over you spurns your gushing phallus" + (pc.totalCocks() == 1 ? "" : "es") + " on, making a big mess of the sheets.");
	else if (pc.hasCock()) {
		output(" [pc.EachCock] dumps ");
		if (pc.totalCocks() > 1) output("their");
		else output("its");
		output(" [pc.cumVisc] contents below you, making a fair mess of your [pc.chest] and the bedding.");
	}
	output("\n\n<i>“H-ooh... Nnngh!”</i> Your lover groans in the middle of your orgasm. In the next moment, a powerful wave of a feminine musk hits your senses when she joins you in orgasm. You can feel her already damp hips become wetter with a fresh layer of femcum spreading through her panties. Fisianna unconsciously thrusts into you a few more times while she trembles uncontrollably. When she finally settles down, she lets go of your hands. The next thing you feel are a pair of soft chest pillows on your back and a fuzzy arm wrap around you. You look up and are buffeted with a cascade of orange and white hair while the lustful kitten kisses your cheek.");
	if (pc.hasCock()) output(" Her other hand snakes it’s way down to your faintly pulsing " + pc.simpleCockNoun(0) + ", milking the last of your [pc.cumNoun] out of it.");
	else if (pc.hasVagina()) output(" Her other hand snakes it’s way down to your faintly pulsing [pc.vaginaNoun] to stroke at your [pc.clits] while you ride out the rest of your orgasm.");
	output("\n\n<i>“Haah... that was great. I can’t tell you enough how glad I am that you got these panties for me.”</i> Fisianna sighs dreamily while nibbling on your [pc.ear]. You reach up and gently stroke the side of her head. The neko purrs with delight at first contact and nuzzles into your hand in a show of affection.");
	output("\n\n<i>“You know, before today... no, before we started having sex, I don’t think I would have <b>ever</b> imagined myself topping you... at all. I’m normally content with you calling the shots, leaving my body for you to ravish to your delight. It’s... an admittedly weird feeling to have the situation reversed.”</i> Fisianna laughs into your ear abashedly. <i>“Somehow... you just bring out another side of me I never knew I had sometimes. Honestly, I’m just happy to, well, be able to cut loose only in front of you, and I’m even more glad that you enjoy that side of me. Thank you, [pc.name].”</i> She kisses the nape of your neck and hugs you tighter, which sends more intense vibrations down your spine from her gentle purring.");
	output("\n\nAfter a few moments of post-coital cuddling, the two of you slide off of the bed to clean up. Once the two of you finish showering, you ");
	if (!pc.isNude()) output("put your [pc.gear] back on and ");
	output("meet up with Fisianna in the living room. She gives you another peck on the cheek when you say your farewells to her at the doorway of her home.");
	output("\n\n<i>“Take care on your adventures, [pc.name]! I’ll be here as always.”</i> Fisianna waves you goodbye with a big smile on her face.");

	IncrementFlag("FISI_TIMES_PEGGED");
	IncrementFlag("FISI_TIMES_SEXED");
	flags["FISI_LAST_SEXED"] = GetGameTimestamp();

	processTime(45+rand(15));
	fisianna.orgasm();
	pc.orgasm();

	currentLocation = "RESIDENTIAL DECK 13";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Multiple willpower checks at increments of 25% of max willpower, complete variants up to 75% of max willpower.
public function GetEdgedByFisiI():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);
	clearMenu();

	IncrementFlag("FISI_TIMES_EDGED");
	IncrementFlag("FISI_TIMES_SEXED");
	flags["FISI_LAST_SEXED"] = GetGameTimestamp();

	fisiPrurience(10);
	currentLocation = "RESIDENTIAL DECK 13";

	var x:int = largestCockIndexThatFitsFisiDimensions();

	output("<i>“Well... I was thinking this time, I’d like to do something for you! I <b>really</b> want to help you feel really good!”</i> Fisianna smiles sweetly at you. <i>“I promise, you’ll like this... especially at the end. Just...”</i> She trails off before she hops off of the bed and starts to feel up your [pc.legs]. ");
	if (!pc.isNude()) output(" Her eyelids lower seductively as she fumbles with your gear. The next thing you know, you’re lying stark naked in front of her. ");
	output("Her soft paw rubs dangerously close to your manhood, nearly brushing against it on several occasions. You start to tense up in anticipation when she speaks again, still wearing the same disarming grin.");
	output("\n\n<i>“Relax, please...”</i> Fisianna leans in briefly to plant a kiss to your lips. <i>“Come, let’s get you to the edge of the bed first.”</i> For emphasis, she lightly pats the edge of the bed next to you. You oblige, your mind still wondering what this catgirl is up to. Once your [pc.legs] are hanging off of the edge of her bed, her hands are once more upon you. You sit upright, just as you witness Fisianna kneel down close to your " + pc.cockDescript(x) + ". When you make eye contact with her again, she smiles again, however this time she looks a little nervous.");
	output("\n\n<i>“[pc.name], I know it might be hard but... I... please try not to cum if you can help it... At least not until I say. Let me know if you’re close at all and I’ll ease up, okay?”</i> Fisianna wraps a paw around your semi-erect cock while she softly coos at it. <i>“I want to build you up... build you up until you can’t possibly take it anymore... I want a big, pent up load for you to fill me with... I want you to feel so... good... Haaah...”</i> Fisi sighs longingly to your phallus before snapping out of her lustful haze and avoiding eye contact with you. The fact that such dirty talk just came from a usually shy and reserved person leaves you feeling extremely flushed. At those sultry words, your " + pc.simpleCockNoun(x) + " instantly swells up to diamond-hard firmness.");
	output("\n\n<i>“Mmmnn...”</i> Fisianna moans as she begins to pump her paw up and down your length. She grips your shaft with a light, but firm pressure. Her soft, velvety pads feel almost like rubbing against silk. Your feline lover alternates her jerking motions with subtle twists and pulls. On occasion, she points your turgid rod towards your belly, focusing her efforts on the underside of it. Finally, she tilts your penis towards her, and directly to her peachy lips.");
	output("\n\nWithout any hesitation, Fisianna wraps her soft mouth around your " + pc.cockHead(x) + ". She teases the very tip of it, tracing small circles around the circumference with her tongue. Once your penis head is thoroughly slathered in her saliva, the catgirl pumps her hand progressively faster along your " + pc.simpleCockNoun(x) + ". Droplets of spittle and precum escape the wet seal around your cock head, dripping down to the neko’s pistoning paw. The extra lubricant covers your phallus more and more with each movement of her hand, generating less friction and more pangs of pleasure.");
	output("\n\nBetween the initial dirty talk, and Fisianna’s eager hand and blowjob, you momentarily forget to control yourself. By the time you realize it, you find yourself already alarming close to the edge already! Gently, you place a hand to your lover’s cheek. In response, she looks up cutely at you, batting her long eyelashes a few times.");
	output("\n\n<i>“Hrngh... getting too close, Fisi...”</i> You grimace while trying your best reign your orgasm back. Fisianna’s eyes light up in surprise when she pops your " + pc.cockHead(x) + " out of her mouth. Her hand movements slow to an excruciatingly sedate pace.");
	output("\n\n<i>“O-oh! Already...?”</i> Fisianna whines, though a small smile of self-gratification creeps into her pursed lips, betraying any signs of serious disappointment on her face. <i>“Please... not yet... I’ve only just started.”</i> The feline beams at you when she gives your cock head small peck.");

	processTime(15+rand(10));

	addButton(0, "Next", GetEdgedByFisiII, x);
}

public function GetEdgedByFisiII(x:int):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);
	clearMenu();

	if(pc.WQ() < 25) {
		output("The pressure built up on your loins is just far too great for you to hold on any longer, despite her slowing down.");
		if (silly) output(" White spots begin to dance across your vision, quickly obscuring your sight until all you see is a blank canvas of pearlescent.");
		if (silly) output(" <i>“I’m... I’m going to shoot my dick milk... it’s... I’m CUUUUUUMMMIIIIIIIIINNNGGG!!!”</i>");
		else output("<i>“Urg... sorry, I ca-caahaNNT!”</i>");
		output(" You blurt out before the first jet of cum erupts from your " + pc.cockDescript(x) + ", splattering loudly on Fisianna’s cheek. The catgirl yelps in surprise when hit with the first string of [pc.cumNoun], though she recovers from her initial shock quickly. Her paw jacks you off <i>hard</i> after the second spurt, intent on riding you through the entirety of your premature ejaculation.");
		output("\n\nFisianna hastily wraps her mouth around your " + pc.cockHead(x) + " again, drinking down all she can after the third jet of cum goes to waste on her hair. ");
		if (pc.cumQ() >= 750) output("There seems to be no end to how much is churned out of your [pc.balls]. You can see your lover’s stomach begin to swell outwards as she furrows her eyebrows in concentration. By the time she grows a little belly pooch, the neko baulks, popping your length out of her mouth to sputter and cough noisily, though cutely. The last remaining lines of cum that pump out of your shaft paint her chin and chest. You can’t entirely blame her for not being able to handle your entire load.");
		else output("You look down in awe and slight embarressment, caressing her cheek throughout the whole of your orgasm as she swallows each drop of your [pc.cum] lovingly. When your rod throbs the last of its payload into her ravenous gullet, Fisianna swallows loudly and gives your urethra a parting lick, making sure she consumes every last drop possible.");
		output("\n\n<i>“Haaah... not exactly the way I was planning to have you fill me up...”</i> Fisianna giggles, smiling brightly at you. You are a little surprised that she doesn’t look at all disappointed by your quick release. <i>“It makes me feel... really good that you got off that fast just for me. I’m glad you find me that... <b>sexy.</b> At least enough for that.”</i> The neko looks down and away shyly while wiping her cum slathered cheek with a paw and taking an idle lick at it. You rise up from the bed and take the kitten in your arms, giving her a tight hug. Fisianna mewls in surprise before she sinks into your embrace. You can feel her begin to purr violently when she wraps her fur-covered arms around you. Her fingers play a piano tune across your ");
		if (pc.hasWings()) output("[pc.wings]");
		else output("back");
		output(", gently caressing you. Once you let go, you take her chin in your hand, pulling it closer to taste her peachy lips. You can still strongly taste your own [pc.cumFlavor] cum on her mouth. After a session of tongue-tying fun, you finally let go of Fisianna, who is blushing brightly.");
		output("\n\n<i>“Of course you are! Don’t let anyone else tell you otherwise!”</i> You encourage her. <i>“And sorry that I couldn’t control my nerves that time. I’ll make it up to you next time.”</i> You apologise. Fisianna smiles at you brightly while grabbing one of your arms.");
		output("\n\n<i>“Don’t worry about it, [pc.name]! I don’t really mind you getting off earlier than intended. I still love you all the same!”</i> she beams at you while giving your arm a gentle squeeze. <i>“Still, you did make quite a mess on me... hehe. I’ll have to take a shower, but if you have to leave when by the time I’m done, then I really wish you the best! Cum is a bit of a long process to wash out of this much hair... I’ll be practicing so we can do this more often! CoV I mean!”</i> Fisianna sticks out a playful tongue at you before retiring to her personal bathroom. Once the telltale sound of a shower head is heard through the door, you ");
		if (pc.isNude()) output("gather your belongings");
		else output("put your [pc.gear] back on");
		output(" and exit her apartment, counting your blessings for meeting such a sweet catgirl.");
		fisianna.orgasm();
		pc.orgasm();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	output("With a deep breath, you manage to calm yourself and stave back your impending release... for now. You sigh in relief, thankful that Fisianna slowed her ministrations on you when she did. The neko giggles when she feels your cock throbbing violently in her hand.");
	output("\n\n<i>“S-sorry about that, [pc.name]. I didn’t mean to work you up <b>that</b> quickly... If you’re good to keep going, then...”</i> Fisianna gives your phallus a parting lick before she lets it go. She stands up, raising her paws to her vest. In the same swift motion, she discards the furred garment aside and moves her hands to the bottom of her t-shirt. In a tantalizingly slow strip tease, she raises the hem of her shirt up to her pert breasts. She stops momentarily to slide her fingers under her lace bra, pulling both the undergarment and her purple tee over her head. Her perky breasts spill out, jiggling jovially once they are free of their confines. You are a little surprised to see the catgirl stop her strip tease short to kneel down in front of you again.")
	output("\n\n<i>“Alrighty... let’s move on to...”</i> the neko murmurs, more to herself than to you. You only have about a second to wonder what Fisianna has in store for you next before she takes her next action. She brings her paws to the sides of her tits, pushing them together to create a fairly amount of cleavage between them. She lifts them up over your pre-leaking dick and brings them down on each side, fully enveloping your cock in boobflesh.")
	output("\n\n<i>“Aaaah...”</i> Fisianna sighs, basking in the warmth of your tumescent rod between her sensitive melons. With a smile and a giggle, she starts to move, gliding your " + pc.simpleCockNoun(x) + " up and down the gulf of her chest. Thanks to the earlier blowjob, the extra lubrication makes the passage all the more smoother for you. ");
	if (pc.cocks[x].cLength() < 7) output("Fisianna squeezes her breasts together as tightly as she can around your length, making sure every inch is being stimulated by her scrumptiously soft bozom. Occasionally she idly laps at the top of her cleavage, as if trying to taste your cock head within the crease, though unfortunately you aren’t quite big enough for that. This doesn’t dissuade your rapturous lover however.");
	else if (pc.cocks[x].cLength() >= 7 && pc.cocks[x].cLength() < 9) {
		output("In between thrusts into her chest, Fisianna cranes her head downwards to peck at your " + pc.cockHead(x) + " whenever it peeks out from the top of her cleavage. With each successful smooch against your cock tip, a ");
		if (silly) output("lewd");
		else output("lubricious");
		output(" line of pre attaches to her lips, which she promptly laps up.");
	}
	else output("Fisianna cranes her neck downwards, enveloping whatever length is poking out of the top of her cleavage with her soft, wet mouth. She, almost expertly now, works her tongue within your cum slit while keeping her lips sealed around the rest of your length, making sure every inch is being wrapped up by her silky body.");
	output(" It doesn’t take long before you feel the familiar pressure in the base of your " + pc.cockDescript(x) + " and your [pc.balls] again.");
	output("\n\n<i>“Hmm... cutting it close again, Kitten,”</i> you grunt, all the while thinking of some of the nastiest things you can conjure up in your mind to stave off your orgasm.");
	if (silly && flags["ANNO_SEXED"] == undefined) output(" Your mind comes to the thought of the possible " + (flags["ANNO_SEXED"] + 1 + rand(20)) + " times your old man fucked Anno... Okay, maybe that’s going a little <b>too</b> far!");
	output("\n\nFisianna looks squarely into your eyes and shakes her head from side to side. <i>“N-noooo... Not yet, please? There’s still a few things I wanted to do first!”</i> she frowns, and separates her breasts from around your " + pc.simpleCockNoun(x) + ". You lover shoots an over-exaggerated pout your way, which would, under normal circumstances, make you laugh at how silly she actually looks.");
	
	processTime(15+rand(10));
	addButton(0, "Next", GetEdgedByFisiIII, x);
}

public function GetEdgedByFisiIII(x:int):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);
	clearMenu();
	
	if(pc.WQ() < 50) {
		output("<i>“Hgn... no good, Fisi. Gotta...”</i> you blurt out before the first spurt of cum escapes from your " + pc.cockHead(x) + ", splattering messily against Fisianna’s average bust. She yelps out in surprise when hit with the viscous liquid, though she recovers quickly from her initial shock. Your lover grabs her breasts again to press them around your pulsating cock, providing a soft and supple sheath for it. [pc.CumNoun] begins to gush from the top of her cleavage like an oil leak. A few jets of spooge manage to escape so forcefully that they uppercut Fisianna’s chin and cheeks, with some managing to reach her long hair. This keeps going until your orgasm finally winds down at last. The catgirl idly licks a stray speck of [pc.cumNoun] from her lips in a cat-like manner before unclasping her breasts from your phallus.")
		output("\n\n<i>“Mmm... Aww... I was hoping all of this would have been inside me.”</i> Fisianna smears some of your seed across her bosom, smiling all the while to your surprise. <i>“Still... I suppose I don’t mind a little mess every once in awhile either. Hopefully next time...”</i> She trails off, shooting you a pair of bedroom eyes that would normally make you rock hard if you didn’t just cum your brains out all over the neko’s chest. With a slight giggle, Fisianna rises up. <i>“For now though, I should shower. You did make quite a mess on me... hehe. If you have to leave when by the time I’m done, then I really wish you the best! Cum is a bit of a long process to wash out of this much hair... I’ll be practicing so we can do this more often! CoV I mean!”</i> Fisianna sticks out a playful tongue at you before retiring to her personal bathroom. Once the telltale sound of a shower head is heard through the door, you ");
		if (pc.isNude()) output("gather your belongings");
		else output("put your [pc.gear] back on");
		output(" and exit her apartment, counting your blessings for meeting such a sweet catgirl.");
		fisianna.orgasm();
		pc.orgasm();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	output("With another series of deep breaths, and a good deal of your willpower, you manage to quell your coming climax, though you aren’t sure how much longer you can keep this up for. Fisianna stands upright once more, flashing you a giddy smile.");
	output("\n\n<i>“Thank goodness. Please hang on for a little while longer, [pc.name]. You’ll love the end, but I just want to do this before we get there...”</i> Fisianna teases you with a playful smirk. You almost sigh in exasperation, wondering how long she is planning to build you up for. Your dick has stopped throbbing for now, though it doesn’t feel like it will take much more to tip you over the edge.");
	output("\n\nA muffled ‘thwump’ turns your attentions back towards Fisianna. Looking down, you see her jeans bundled around her pawed feet. When you look back up, you are treated to a <i>very</i> fine view of the catgirl’s derriere. Her long tails swish alluringly from side to side while she slides her fingers under the hem of her panties. The rounded curves of the topside of her bottom are soon revealed when she begins to slide them off. Fisianna bends over gracefully while sliding the undergarment the rest of the way down, leaving her pretty, unadulterated pussy on display. From between her legs, your flexible lover flashes you an adorable upside-down smile.");
	output("\n\nWith a giggle, Fisianna stands upright again, though she doesn’t turn around to face you. Instead, she slowly backs up, using her tails to feel for you until they make contact. Once they do, your feline lover slowly leans backwards to settle down onto your lap, with your " + pc.simpleCockNoun(x) + " nestled snuggly inside the cleft of her bottom.");
	output("\n\n<i>“Hmm... it feels so warm. So... comfortable. We’re almost there, [pc.name]. Thank you for holding on so far...”</i> Fisianna pats one of your hands just as she starts to move her ample hips back and forth. Your already-slick cock slides up and down smoothly through the crack of her plush backside. It only takes a few strokes before your brain sends all-too-familiar warning signals to you; signs that you’re still at the precipice of release. Instead of letting up however, Fisi grinds her hips into you even harder. She saws her shapely hips into you as though she were actually fucking you, though you <i>really</i> wish you were at this point.");
	output("\n\n<i>“Fisi, if you keep this up...”</i> you murmur to her, though your plea falls to deaf ears. She seems way into the hot-dogging at the moment, if by the way she is pressing into your lap even harder is any indication. The best you can do is grab onto Fisianna’s gyrating sides and hold on for dear life until she snaps out of her lustful haze.");

	processTime(15 + rand(10));
	addButton(0, "Next", GetEdgedByFisiIV, x);
}

public function GetEdgedByFisiIV(x:int):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);
	clearMenu();

	if(pc.WQ() < 75) {
		output("Unfortunately, you’re way too pent up to weather the tornado that is Fisianna’s ass right now. No matter how many times you signal to her, she just doesn’t stop. With an odd-sounding grunt, your body locks up before letting loose a forceful burst of [pc.cumColor] [pc.cumNoun] from your cock. The first jet shoots up about a foot in the air before gravity takes over and brings it down on the curvature of her shapely bottom. Fisianna is still too far gone to notice that you are blasting off behind her, since she still sees it fit to rubbing the rest out of you. More and more cum pulses from your phallus, painting your lover’s hair and backside. By the time your orgasm winds down, Fisianna slows her grinding to a crawl while shooting you a side-long smile, her eyes half-lidded seductively.");
		output("\n\n<i>“Mmmph. A-alright then... I think we can move on to the nex-”</i> Fisianna cuts herself off with a sharp gasp when she finally realizes that you already blew your top. <i>“O-oh no! I went too far! I’m so sorry... I wasn’t intending on ending things that way...”</i> she apologises, disappointment clear on her face. You lean up to her, turning her head towards you to give her a kiss on her peachy lips. It takes a fair amount of convincing to cheer her up, though you eventually manage to do so. You hug her close to you in an added attempt to comfort Fisi.");
		output("\n\n<i>“Thank you, [pc.name]. You’re the absolute best.”</i> Fisianna pauses for a moment before continuing. <i>“You know... if I ever get um... ‘lost’ like that again, you can... er... give my bottom a smack or something if I go a bit too far... Just to bring me to my senses.”</i> Fisianna blushes heavily while looking away. <i>“Sometimes I become so swept up with you when we do it. It’s an amazing feeling, but if the end result might turn out better, it would be okay to do that to let me know to stop teasing.”</i>");
		output("\n\nYou nod your head in understanding, though the thought of being able to roughly grope that plush butt of hers is a pleasant idea to entertain. Your attentions are inevitably drawn back to Fisianna once she rises up from her seat on your lap. A few droplets of cum spill onto the carpet from her behind, while others trail down her legs in a slow crawl.");
		output("\n\n<i>“That being said, I should shower now. You did make quite a mess on me... hehe. If you have to leave when by the time I’m done, then I really wish you the best! Cum is a bit of a long process to wash out of this much hair... I’ll be practicing so we can do this more often, and next time I’ll try to control my emotions a bit better!”</i> Fisianna sticks out a playful tongue at you before retiring to her personal bathroom. Once the telltale sound of a shower head is heard through the door, you ");
		if (pc.isNude()) output("gather your belongings");
		else output("put your [pc.gear] back on");
		output(" and exit her apartment, counting your blessings for meeting such a sweet catgirl.");
		fisianna.orgasm();
		pc.orgasm();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	output("After enduring for an agonizing minute of intense grinding, you determine that there is no way that you’ll be able to hold on any longer if Fisianna keeps up this pace. She hasn’t slowed down any since she started, and she has your pre-drooling phallus locked firmly in place between her plump buttocks. You figure you’ll have to intervene more directly if you don’t want to blow your top all over Fisi’s backside.");
	if(pc.PQ() < 50) {
		output("\n\nYou release your grip on one of Fisianna’s sides and raise your arm as far back and behind you as you can. With as much force as you can muster, you bring your hand down onto one of her bubbly butt cheeks, causing shockwaves from the force of the hit to ripple through it. The kitten mewls in shock, immediately stopping her ministrations to rub her bottom gingerly.");
		output("\n\n<i>“Ahh! [pc.name]! N-not so rough...”</i> Fisianna pouts as she slowly lifts herself up from your lap.");
	}
	else {
		output("\n\nYou release your grip on one of Fisianna’s sides and raise your arm as far back and behind you as you can. With as much force as you can muster, you bring your hand down onto one of her bubbly butt cheeks, causing an obscene amount of shockwaves to ripple through it from the impact. The kitten hisses in shock, immediately standing up from your lap and almost falling over from the force of the smack.");
		output("\n\n<i>“Ssss... Ow, [pc.name]! You didn’t have to slap it <b>that</b> hard!”</i> Fisianna winces while she gingerly rubs her bottom.");
	}
	if (pc.isNice()) output("\n\n<i>“It was the only way I could think of to quickly warn you that I was close. You were just <b>that</b> into it. If you kept going any longer, it would have been too late,”</i> you explain sincerely to the catgirl.");
	else if (pc.isMischievous()) output("\n\n<i>“As nice as getting off on your bum would be, I <b>do</b> believe you had other plans, did you not?”</i> you smirk slyly at the catgirl, somehow able to keep your composure.");
	else output("\n\n<i>“Hey, if I didn’t do that, then I wouldn’t get to fill you up in the end, now would I, Kitten? That <i>is</i> what you wanted.”</i> You bluntly tell the catgirl.");
	output(" Her face lights up in shock at the realization over the fact that you almost came because of her.");
	output("\n\n<i>“O-oh my goodness! That’s right! What was I thinking...?”</i> Fisianna blushes a crimson shade of red and flusters on the spot. Not wanting to ruin the moment, you shoot her a disarming smile.");
	output("\n\n<i>“Well... in any case, I’m still hanging in there. Anything else you have left to dish out?”</i> you challenge her playfully. This draws Fisianna’s sweet smile back out of her. She saunters over to you again, placing a furred finger under your [pc.face]. Her other paws wanders over to your still sensitive " + pc.cockDescript(x) + ". As soon as she wraps her cute fingers around it, it throb madly once again. Damn, it’ll take almost anything to finish you off at this point, especially with how close she came to actually making you do so multiple times! The neko shakes her head when she feels your cock pulsing in her hand.");
	output("\n\n<i>“Mmm, no. I think... we can move on.”</i> Fisianna declares huskily before she climbs atop you. You lay back on the bed, letting her straddle your hips. She grabs a hold of your slick shaft, aligning it carefully with her aroused vulva. Excruciatingly slowly, she lowers her hips, letting only your " + pc.cockHead(x) + " pierce her folds. Her peachy lips fall agape to let out a shaky sigh. Once she fully exhales, she continues to slowly feed your length inside of her.");
	output("\n\nYou want to buck your hips upwards the rest of the way and finally obtain your release, but you manage to hold firm... mostly anyways. Your [pc.legs] twitch madly while you try not to succumb under Fisianna; the pleasantly warm and wet feeling of her enveloping your cock is hard not to concentrate on. After a few tense moments, she finally bottoms out");
	if (pc.cocks[x].cLength() >= 9) output(", though you can see a small and cute abdominal bulge poking out from her tummy");
	output(".");
	if (pc.hasKnot(x)) output(" It takes a bit of additional effort on her part, but after a small struggle, she just manages to slip your swollen knot inside of her as well.");
	output("\n\nFisianna stays still atop you for a few seconds, content with simply staring into your [pc.eyes]. She reaches out to you moments later with both of her adorable paws. You take them in your own hands, interlacing her fingers with yours. Though she stays unmoving on top of you, the moment you claim Fisianna’s furred paws in your own, you can feel her velvety folds move of their own accord. You gasp in surprise at this wonderful sensation now flowing through your cock. She is quick on the attack, however. Before you can fully enjoy this titillating feeling, she pulls herself into you to press her lips squarely on yours. Her tongue already finds entrance into your mouth, twisting wildly with yours while silky her walls continue to ripple around your " + pc.simpleCockNoun(x) + ".");
	output("\n\nOnce she finally finishes the kiss, you feel like you on the verge of blowing. That’s when the unexpected happens; your hips and your cock start to vibrate! ...Or rather, Fisianna begins to purr, sending delightful, undulating waves of pleasure through your entire lower body. With a groan, you reach up to your feline lover, wrapping your arms around her waist and pulling her close to you. Fisi’s bosom squeezes snugly against your [pc.chest], and her purring intensifies while you hug her. You can feel her hot breath flow past your [pc.ear], simultaneously warming the side of your face. After a light giggle, you <i>finally</i> hear the words you have been dying to hear for what seemed like an eternity.");
	output("\n\n<i>“Nnn... cum. Cum in me now, [pc.name]. Fill me full up with your [pc.cumVisc] seed. I want it... <b>bad!</b>”</i> She whispers hungrily into your ear. You can feel her breathily exhale before she lightly clamps her teeth on your [pc.ear]. With a light groan, she pulls and nibbles at it and shifts her hips to make sure she’s locked you in to shoot as deeply as possible into her.");
	output("\n\nYou don’t need any further encouragement to do what she asks, not like you have much of a choice in the matter anyways. With a single buck of your hips, you burst with force akin to an underground geyser into Fisianna’s tight and vibrating pussy. Your [pc.balls] pump");
	if (pc.balls < 2) output("s");
	output(" load after load of [pc.cumNoun] into her fertile womb, making filling her up quick work.");
	if (silly) output("\n\n<i>“Nyaaah...”</i>");
	else output("\n\n<i>“Mmm... yeah...”</i>");
	output(" your feline lover sighs happily with her tongue lolling lazily out of her mouth while you continue to climax. ");
	if (pc.hasKnot(x) && pc.cumQ() >= 750) output("Her stomach swells outward with each throb of your cock inside her. This makes it hard to hug her close, though the growing pooch bulging against your tummy feels very squishy and comfortable. It fills you with a certain sense of pride that you held on long enough to build up so much cum to plug Fisianna with, just like she asked for!");
	else if (pc.hasKnot(x)) output("You can feel your cum backwashing out of Fisianna’s pussy with each throb of your cock, making a huge mess of both of your hips and her bedding, but you don’t care. It fills you with a certain sense of pride that you held on long enough to build up so much cum to blast Fisianna’s womb with, just like she asked for!")
	output(" By the time your [pc.balls] empty, your " + pc.simpleCockNoun(x) + " begins to ache as it continues pulsing weakly, even with your payload already well spent.");
	output("\n\n<i>“Ooh... gods and stars... I couldn’t have asked for a better ending than that.”</i> Fisianna sighs dreamily after giving you another kiss. <i>“I-if you don’t mind, can we stay like this for a while longer? I love being joined up with you like this!”</i> she asks you giddily. ");
	if (pc.hasKnot(x)) output("Seeing as you are still plugged inside of her with a swollen knot, you have little choice in this matter anyways.");
	else output("You don’t think you can move right now if you wanted to anyways from how explosive your orgasm was.");
	output("You nod your head in agreement and keep Fisianna close to you.");
	output("\n\nFor as long as the two of you are tied together, you whisper sweet nothings to each other, telling each other how much you appreciate one another. At times, the two of you talk simply sit in silence, with you affectionately petting Fisianna’s long hair and ears. She still purrs happily while you embrace her, which has the side effect of stimulating your spent cock; though to your small relief, you still don’t become hard enough to go at it again. You just want to enjoy the intimate moment as much as you can for the time being.");
	output("\n\nEventually your snuggle fest has to come to an end. Gingerly, Fisianna lets herself off of you, with your " + pc.simpleCockNoun(x) + " plopping out of her, consequently releasing a small bit of what you shot into her.");
	output("\n\n<i>“Thank you for hanging on so long for me. It definitely was worth it in the end. Whew... That being said, I definitely will be needing to freshen up, hehe. I’ll be practicing so we can do this more often! CoV I mean! I love you as always!”</i> Fisianna sticks out a playful tongue at you before retiring to her personal bathroom. Once the telltale sound of a shower head is heard through the door, you ");
	if (pc.isNude()) output("gather your belongings");
	else output("put your [pc.gear] back on");
	output(" and exit her apartment, counting your blessings for meeting such a sweet catgirl.");

	processTime(15+rand(10));
	fisianna.orgasm();
	pc.orgasm();
	addButton(0, "Next", mainGameMenu);
}

public function sexyCuddlesWithFisiI():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);

	var x:int = largestCockIndexThatFitsFisiDimensions();
	if(x < 0 && pc.hasCock()) x = rand(pc.cocks.length);
	//Randomize between penile and vaginal variants if PC has both.
	var cockOrCunt:int = -1;
	if (x >= 0 && pc.hasVagina()) cockOrCunt = rand(2);
	else if (x >= 0) cockOrCunt = 0;
	else if (pc.hasVagina()) cockOrCunt = 1;

	output("<i>“Mmm... I was thinking that this time, we can just cuddle together on the bed... Naked. I don’t think I get to do that enough with you.”</i> Fisianna smiles innocently at you. You have mixed feelings about the fact that she didn’t have anything more libidinous planned for the both of you. ");
	if (fisiWonLastBet()) output("You <i>did</i> leave the decision of what the two of you would be doing together with her, despite you winning the bet.");
	else output("You lost the bet fair and square, so such is the price to pay for your inferior play.");
	output(" Seeing as you have no choice in the matter, you agree to your lover’s terms.");
	output("\n\n<i>“Great!”</i> Fisianna cheers as she hurries to her bathroom door. <i>“I’ll just go and get ready first. Be right back with you, [pc.name]!”</i> With a wink and a playful flick of her tails, she disappears into the bathroom. ");
	if (pc.isNude()) output("You take advantage of the neko’s absence to jump onto her bed, striking a sexy pinup pose when you land.");
	else output("You take advantage of the neko’s absence to strip yourself of your [pc.gear] and jump onto her bed, striking a sexy pinup pose after you land.");
	output("\n\nWhen Fisianna reenters the room, you notice that she is only wearing a small white bathrobe around her figure. Her eyes widen in surprise for a brief moment when she sees you posing on the bed, then she quickly hides her face while she tries to hold back from laughing. <i>“Snrkk... [pc.name]. What are you doing?”</i>");
	if (silly) output("\n\n<i>“I want you to paint me like one of your French girls...”</i> You pause for dramatic effect, shooting the most suave smile that you can at Fisianna. When the silence starts to become awkward, she breaks out into a laughing fit over how silly you look. With a subtle roll of your eyes, you pat the bed next to you, ushering Fisianna to join you.");
	else if (pc.isAss()) output("\n\nYou resist with all of your might to roll your eyes, though a small smirk creeps across your lips. <i>“Just tryin’ to look sexy for you. Well? If it worked then come on and join me.”</i> You call to Fisianna, though in a sterner tone of voice than you intended.");
	else output("\n\n<i>“I thought it would be a nice surprise to come back to a ready and waiting Steele. What’re you waiting for, kitten? Come on in!”</i> you croon to Fisianna in a sultry a voice as you can manage.");
	output(" With a small shrug and a giggle, the catgirl casts aside her bathrobe and hops onto the bed with you.");
	output("\n\nThe two of you spend the next few moments​ playfully tussling and wrestling each other, with plenty of make-out sessions in between. When you finally settle down, you find yourself spooning Fisianna, your bodies delightfully warming one another’s. You repeatedly kiss the nape of her neck while your arms wrap around her waist. She lays her hands atop of yours as she pushes herself further into you.");
	if (cockOrCunt == 0) {
		output("\n\nBeing so close to Fisianna’s attractive body like this, you can’t help but to feel hot down low. You can feel the blood rushing to your " + pc.cockDescript(x) + " as it lengthens between the neko’s thigh gap. Her breath catches when it brushes against her vulva. ");
		if (fisiPrurience() < 50) output("She turns her head towards you with a plaintive frown on her face. <i>“[pc.name]... Please... d-don’t be mean teasing me like this...”</i> Fisianna whines futilely. After waiting it out for about a minute, your erection doesn’t become any softer against her. The neko sighs in resignation while she pushes her bottom into your hips, burrowing the entirety of your length into her soft thighs. <i>“Fine... we can do it a little bit if it will help you sleep. Go ahead.”</i> She ushers to you while she wiggles her sides slightly.");
		else output("She turns her head towards you to give you a coy, sideways smirk. <i>“Mmm... I thought there wouldn’t be any funny stuff tonight... still, I have the feeling neither of us will be able to sleep with Mr. Snake trying to make his way into his burrow.”</i> Fisianna pushes her bottom into your hips, burrowing the entirety of your length into her soft thighs. <i>“Well then... let’s just break him in until he’s nice and comfy then.”</i> She coos while she gives her sides a little wiggle.");
		output("\n\nNeeding no further encouragement, you start to buck your [pc.hips] into Fisianna’s thighs. The valley of velvety smooth [fisianna.skinFurScales] is very warm and inviting, even moreso when you start to feel a distinct wetness lubricate your passage. Her arousal dribbles around your phallus with each thrust, making it feel almost as if you were actually penetrating her. With each brush against her clit, she exhales sharply. You slide your arms higher up her body, coming to rest once you reach the supple mounds on her chest. Gently, you cup each supple breast in your hands, slipping her already pert nipples between your fingers. Adding to her pleasure, you twist and twiddle the tiny bulbs of sensitive flesh, drawing higher pitched moans from the kitten.");
		output("\n\nYou keep it going for a few minutes without stopping. The pressure mounting in your [pc.balls] starts to become noticeable as your climax draws close. Fisianna’s manages to cum first, however. She clenches her thighs hard around your [pc.cock] as it brushes against her pink bean. In consequence, this causes you to accidentally​ spear her spasming folds with your following thrust, which immediately grip onto your phallus now that they have an object to milk. Hurriedly, you pull back out before she can notice, but not before an especially loud moan escapes her peachy lips. The neko pushes her backside into you with near crushing force as her grip on your hands tighten.");
		output("\n\n<i>“Huurrgh... hnnn-please, [pc.name]! Cum! P-please! Cream my thighs!”</i> she cries sweetly, though you notice a subtle tone of ");
		if (fisiPrurience() < 50) output("desperation");
		else output("aggressiveness");
		output(" in her voice as well. On command, you let go of your restraints and release. With a final thrust, your throbbing [pc.cock] bursts small rivulets of [pc.cumNoun] through her thigh gap. ");
		if (silly) output("\n\n<i>“Nnnnyyyaaannn...");
		else output("\n\n<i>“Nnnnyyyeeeaaahhh");
		output("”</i> Fisianna sighs as the both of you watch jet after jet of ejaculate spurt in front of her and onto the bed. ");
		if (pc.cumQ() >= 750) output("<i>“I... w-wow. You really must have been holding back for a while. Imagine if that was all inside of me...”</i> she looks almost longingly at the ever-growing pool of [pc.cumNoun] then to your still-pumping cock. ");
		output("The room is filled with the potent aroma of your coital endeavors, though neither of you care to point it out while you both ride out your orgasms.");
	}
	else if(cockOrCunt == 1) {
		output("\n\nBeing so close to Fisianna’s attractive body like this, you can’t help but to feel a little hot and bothered. Your hands creep lower down her waist until your fingers brush against her love trail. Her breath catches when you make your way to her pink clitoris. ");
		if (fisiPrurience() < 50) output("She turns her head towards you with a plaintive frown on her face. <i>“[pc.name]... S-stop... Don’t tease me like this...”</i> Fisianna whines futilely. Unfortunately for her, this doesn’t dissuade you from fondling the kitten further, for your own desire for her continues to grow. After about a minute of subtle fondling, the neko sighs in resignation while she pushes her bottom into your hips, her ever-growing warmth growing obvious. <i>“O-ok, fine, I give! We can fool around a tiny bit. Just... please continue.”</i> She huffs while giving her sides a little wiggle.");
		else output("She turns her head towards you to give you a sideways smirk. <i>“Mmm... I thought we wouldn’t be doing any funny stuff tonight... still, from the looks of it, neither of us are going to be able to sleep without <b>some</b> release...”</i> Fisianna pushes her bottom into your hips, her ever-growing warmth becoming obvious. <i>“Mmm... alright. I suppose we can at least work each other off a bit.”</i> She coos while she gives her sides a little wiggle.");
		output("\n\nNeeding no further encouragement, your fingers start to move over Fisianna’s sensitive bead. The response is almost immediate, as her clit slickens to your touch. You deftly thrum your digits slowly and gently against it, building up in pace as time progresses. The neko’s thighs gently clamp down on your fingers as they do their handiwork. With a gentle moan, she separates herself from you to lay on her backside and reaches towards your own nethers.");
		output("\n\nAll it takes is a gentle touch of her paw against you to realize how much you have been worked up yourself. You lay down on your back to let Fisianna’s progress to continue unimpeded while she returns the favor in kind.");
		output("\n\nFisi mirrors the movements of your hand on her vagina to yours without missing a step. She slowly rubs her soft paw pads against your [pc.clits], their velvety smoothness feeling unlike anything you’ve ever felt down there before. A gasp of surprise escapes your lips at this strange, but wonderful sensation. Closing your eyes, you allow yourself to become temporarily lost in euphoria to Fisianna’s minstations.");
		output("\n\nA small whine from the catgirl breaks you out of your moment of reverie. You look over to your feline lover wondering what is the matter. Fisi pouts at you while rubbing her thighs against your now idle hand. <i>“[pc.name]... you stopped. No fair...”</i> The neko mewls fretfully. After coming to the realization that you selfishly ceased your handjob on her, you resume and redouble your efforts.");
		output("\n\nAfter about a minute of clitoral stimulation, you slide your hand lower to probe Fisianna’s depths. She does the same with her’s as the both of you insert a digit into each other. Simultaneously, your walls grip each other’s fingers with a welcoming tightness. You are first to break the symmetry between each other. You begin to encircle her entrance, making sure to dab every bit of your tactile member with her own natural lube. Once satisfied, you move progressively deeper as she accommodates more of your digits inside of her. With a particularly loud moan, the neko bucks her hips into your palm. Meanwhile, her own padded fingers are busy within you, hooking to search for that tender g-spot.");
		output("\n\nAfter one particular crook of Fisianna’s digits, you feel a sharp and sudden pressure in your loins as a tidal wave of ecstasy​ hits you. With a hearty groan, your vaginal walls clench tightly around the catgirl’s fingers. Your climax hits you with the speed and force of an asteroid. ");
		if (pc.wetness() >= 3) output("A spray of [pc.girlCum] plasters Fisianna’s hand and your thighs.");
		else output("A small trickle of [pc.girlCum] bastes Fisianna’s hand.");
		output(" Her pawed extremities continue to press the sensitive button inside of you, gently massaging you through your intense orgasm.");
		output("\n\nYou are far from passive this time with your own ministrations on Fisianna. While on your own orgasmic high, your fingers busily work inside of the neko’s inner channel. By this point, she is delightfully moist, making passage easy-going inside of her. Wanting to bring Fisianna to her own climactic finish alongside of you, you plunge your digits into her deepest recesses. You feel around as fast as you can for her own special spot. When you rub against a particularly bumpy spot within her folds, the kitten’s legs clamp tight around your hand, and a sweet, high-pitched moan escapes her lips. After a few moments of rubbing that particular area in her vaginal walls, you can feel her folds undulate as a veritable tide of her girlcum splashes all over your hand. You keep it up with massaging the same spot, her legs fidgeting all the while, until the both of you wind down.");
	}
	else {
		output("\n\n<b>ERROR: No valid penis or vagina detected!</b>");
	}
	output("\n\nAfter you recover, when you lean over to plant an affectionate smooch to Fisianna’s cheek, she suddenly turns to you. A passion-filled look filled with desire for you flashes in her golden, slitted eyes. Without warning, she mashes her peachy mouth-pillows to yours, tongue already breaking past the barrier of your [pc.lipsChaste]. The pressure on your [pc.face] is heavy from the passion behind the kiss, but light enough to not be harmful. She keeps it up with you for a few long moments, intertwining tongues lovingly before she breaks the kiss to rest her head onto your neck." );
	output("\n\n<i>“Hahh... Have I ever told you how much I love you?”</i> Fisianna purrs softly while she nuzzles further into your neck");
	if (pc.isNice()) output("\n\n<i>“I believe I’ve heard it plenty, but another time never hurt,”</i> you smile warmly at your feline lover.");
	else if (pc.isMischievous()) output("\n\n<i>“Hm? I’m sorry. I didn’t hear you there. Would you mind repeating that, please?”</i> You raise one of your arms and bring a finger to your ear, twisting it as if to clear any build up.");
	else output("\n\n<i>“Nah. I don’t think I hear it enough. Might have to say it a few more times,”</i> you tell your feline lover half-jokingly.");
	output(" She playfully bats a paw at your face and rests it there to caress your cheek.");
	output("\n\n<i>“Well, I do. I can’t say it enough!”</i> Fisianna giggles into your neck before giving it a gentle kiss. You can feel the catgirl beginning to purr, which reverberates through your neck and to your entire body. The dull vibrations start to lull you to sleep, compounding with your efforts from your earlier endeavors. You idly scritch her between her perky feline ears while your eyelids steadily become too heavy to keep open...");

	processTime(30+rand(15));
	fisianna.orgasm();
	pc.orgasm();

	if (fisiWonLastBet()) fisiPrurience(5);
	else fisiPrurience(10);
	clearMenu();
	addButton(0, "Next", sexyCuddlesWithFisiII, cockOrCunt);
}

public function sexyCuddlesWithFisiII(cockOrCunt:int = 0):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);

	output("When your eyes flutter open again, you can still feel that dull vibrating sensation throughout your body. Fisianna is still sound asleep, peacefully purring. Her head is settled comfortably atop of your [pc.breasts]. You take this moment to run a few fingers through her smooth, orange and white waterfall of hair. After a few passes, you gently trace your fingers along the side of Fisianna’s [fisianna.face]. A smile grows across her mouth, and she nuzzles into your affectionate touch instinctively.");
	output("\n\n<i>“Mmm.. [pc.name]. That’s a nice way to wake up. I hope you slept well enough too.”</i> Fisianna purrs sensually while leaning in to plant a kiss to your lips. You graciously accept them, and settle in for a long make-out session. After a few long minutes of tongue-tying fun, your lover separates herself from you, smiling all the while.");
	if (fisiWonLastBet()) output("\n\n<i>“Thank you for letting me have this. It really means a lot to me to have this moment together. I couldn’t be with anyone nicer...”</i> Fisianna gazes into your [pc.eyes] lovingly for a few moments before she pecks you on the nose. Afterwards she slides off of you and the bed.");
	else {
		output("\n\n<i>“Maybe, I should keep practicing my skills on CoV, just so I can keep having moments like this,”</i> she teases as she sticks her tongue out playfully. You don’t feel that you particularly lost out with ");
		if (cockOrCunt == 0) output("getting to grind and snuggle")
		else if (cockOrCunt == 1) output("getting to engage in some finger-play");
		else output("<b>ERROR: No valid penis or vagina detected</b>");
		output(" with the pretty kitty in the end of things. Despite this, you boop Fisianna on the nose, telling her that you don’t intend to make things any easier for her next time. She giggles and pecks you on the cheek before she slides off of you and the bed.")
	}
	output("\n\nOnce Fisianna exits the bedroom, you take the moment to clean yourself off quickly in her shower before re-entering the bedroom. When you return, ");
	if (pc.isNude()) output("you find that the bed is already cleaned up; her cleaning droid lays idle nearby. With a smile, you exit the bedroom to meet up with Fisianna. ")
	else output("you find that the bed is already clean and your belongings lay neatly on the edge of the bed. With a smile, you put on your [pc.gear] before heading out of the bedroom to meet up with Fisianna.");
	output("When you arrive in the living room, she is nowhere in sight. Assuming that she went into her private workroom, you turn around to receive a surprise hug from your lover.");
	output("\n\n<i>“You didn’t think I’d let you leave without saying goodbye first, did you?”</i> Fisianna beams at you. You pull the catgirl into a heartfelt hug, to which she sighs ");
	if (pc.tallness > 72) output("into you chest");
	else if (pc.tallness > 60 && pc.tallness <= 72) output("into your shoulder");
	else output("over your shoulder");
	output(". You can faintly feel her purring again before you pull away.");
	output("\n\n<i>“Take care, [pc.name]. Let’s play again next time you’re around! I’ll be waiting to test my skills again!”</i> Your feline lover gives you a sincere smile as you make your way out of her apartment door and onto the walkway outside.");

	IncrementFlag("FISI_TIMES_SEXY_CUDDLED");
	IncrementFlag("FISI_TIMES_SEXED");
	flags["FISI_LAST_SEXED"] = GetGameTimestamp();

	processTime(15+rand(10));

	currentLocation = "RESIDENTIAL DECK 13";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Triggers if PC hasn't sexed Fisianna in over 24 hours.
//Triggers at a default 20% chance on encounter after 24 hours.
//Chance increases in 20% increments every 3 solar days afterwards until chance reaches 100%
public function breedFisiI(fromMenu:Boolean = false):void
{
	clearOutput();
	showFisi(2);

	var x:int = largestCockIndexThatFitsFisiDimensions();
	if(x < 0) x = pc.biggestCockIndex();

	if (fromMenu) {
		author("Night Trap");
		if (fisiPrurience() < 50) {
			if (flags["FISI_TIMES_BREED"] == undefined) {
			output("Even as close as the two of you have grown, Fisianna still has some trouble with her shyness in the bedroom from time to time. The neko sometimes seems like she’s holding back, or at the very least like she’s embarrassed to be doing something so base and carnal. As you ponder on ways to help the catgirl come out of her shell, your mind drifts to the Breeder’s Bliss you’re carrying. If Fisianna enjoys her feline mods, maybe she’d enjoy experiencing heat like a feline too?");
				output("\n\nWith this thought in mind, you smile at your diminutive lover before broaching the topic with her. <i>“Hey, Fisi? Have you ever wondered what it would be like to be in heat?”</i>");
				output("\n\nThe neko blushes brightly when she hears your question, and her tails shoot out straight in embarrassment. <i>“I- wha? N-no! I mean... not really... w-why do you want to know?”</i>");
				output("\n\nYou grin at Fisi with a doubting expression. <i>“Really? You’ve never once thought about it? I bet it would feel </i>really<i> good for you.”</i>");
				output("\n\nFisianna takes a deep breath to calm herself before answering. <i>“Alright, y-yes, I have wondered a few times what it would feel like. Still, I-I’d like to know why you would suddenly ask about something like that.”</i>");
				output("\n\nYou produce the two small pills - enough to put Fisianna into a deep heat - and offer them to the blushing feline. <i>“I thought we could have a really special bit of fun. What do you say, Kitten?”</i>");
			}
			else {
				output("Remembering how comparatively uninhibited Fisianna becomes when she goes into heat, you decide it would be fun if she tried it once more. <i>“Hey, Fisi. What would you say to going into heat again?”</i>");
				output("\n\nThe cute girl’s eyes go wide and her face blushes brightly when she hears your question, but she looks just a little excited. She nods her head and rubs her arm shyly while averting her gaze, muttering her reply where you can barely hear it, <i>“U-um, I have some pills on hand already. If you wanted to... do that again.”</i> She doesn’t make eye contact with you, but you follow her gaze to a cabinet in the room. Before you can move to grab the pills for her, Fisianna jumps up and speeds across the floor almost comically quickly. She produces two doses of Breeder’s Bliss in mere moments before scurrying back to you.");
			}
			output("\n\nFisianna shyly pops the two pills into her mouth, surprising you by swallowing them dry. Just a few seconds later, her pupils dilate and her already blushing face flushes with even more blood, along with the rest of her body. The neko draws in a deep breath before bringing her paws up to her head. She releases a shuddering sigh as she trails her paw pads down from her scalp, tracing the contours of her shoulders, breasts, and hips before sliding her hands over her crotch, lightly bucking her hips into her paws just one small time in an involuntary reflex.");
		}
		else {
			if (flags["FISI_TIMES_BREED"] == undefined) {
				output("Fisianna has begun to truly come out of her shell these days. You wonder if she might be willing to indulge any fantasies she hasn’t told you about yet, chiefly, going into heat like a real cat. The Breeder’s Bliss you’re carrying with you could let the two of you have a lot of fun if she were willing to try it. To that end, you smile at your diminutive lover and broach the topic with her. <i>“Hey, Fisi? Have you ever thought about what it would be like to be in heat?”</i>");
				output("\n\nFisianna’s face colors, but she doesn’t clam up like she might have in the past. <i>“Well, I have thought about it in the past. The opportunity just never came up before now. Why do you ask?”</i>");
				output("\n\nYou produce the two small pills that would be required to put Fisianna into a deep heat and offer them to the blushing feline. <i>“I thought we could have a really special bit of fun. What do you say, Kitten?”</i>");
			}
			else {
				output("Remembering how utterly uninhibited Fisianna becomes when she goes into heat, you decide it would be fun if she tried it once more. <i>“Hey, Fisi. What would you say to going into heat again?”</i>");
				output("\n\nFisianna blushes darkly, but she gamely faces you down. <i>“I’m down for it if you are, [pc.name]. Just give me a minute to get what I need.”</i>");
			}
			output("\n\nThe diminutive nekomata separates from you and scurries over to a dresser. She pulls out two different drawers and grabs a few items. Then she turns around with her hands held behind her back and speaks to you in a breathy, eager tone. <i>“Why don’t you ");
			if (pc.isNude()) output("make yourself");
			else output("slip into something a little more");
			output(" comfortable? I’ll be back in just a moment.”</i> Then she excitedly steps out of the room. ")
			if (pc.isNude()) output("With no clothes to take off");
			else output("After you strip off your [pc.gear]");
			output(" you’re left waiting in breathless anticipation for Fisianna’s return. About a minute later, Fisi returns to the bedroom, with not a scrap of clothing covering her curvy body. For whatever reason, she’s still carrying the Breeder’s Bliss in her pawhand. She briefly strikes a little pose at the doorway, flushing scarlet as she does. You’re delighted to see your formerly-shy lover open up like this for you, and as she walks across the room to rejoin you, you notice there’s already a trickle of moisture trailing down her thigh.");
			output("\n\nOnce she’s closed the distance between the two of you, the blushing nekomata surprises you by swallowing the pills dry. Seconds later, her pupils dilate, she flushes even more darkly, and the tangy scent of her arousal dramatically increases in intensity. Not only that, the smell grows richer somehow, more fragrant, and you soon realize that Fisianna’s cunny honey is laced with delicious pheromones that quickly tease all the blood in your body not needed to keep you alive into your [pc.cocks].");
		}
	}
	else {
		author("Lkynmbr24");
		output("You walk over to where your diminutive neko girlfriend is sitting. Before you have the chance to sit down next to her, Fisianna abruptly stands up from her seat, much to your surprise. When you are about to ask how she is doing, she suddenly latches on tightly to you. Thinking that the amorous kitten just misses you that much after all the time that you were gone, you return her affections with your own innocent hug. After a few moments spent in the gentle embrace, you notice that your lover is exceptionally warm to the touch and take in a distinct scent that wafts from her body. She smells... pleasant to say the least, but it’s also faintly carnal in nature, with a hint of a pheromonal perfume. It grows more and more intense the longer you stay intimately close to her.");
		output("\n\nAfter you separate yourself from her, she stares into your eyes, her pupils dilated and filled with a feral hunger. Her face is flushed a deep shade of red, and she breathes heavily while shivering slightly on the spot. She inches closer to you until her breasts press against your");
		if (pc.biggestTitSize() > 1) output("s");
		else output(" chest");
		output(", nuzzling into your neck and purring <i>hard</i> against you.");
		if (flags["FISI_LAST_SEXED"] + 13 * 24 * 60 < GetGameTimestamp()) output("\n\n<i>“Nnguh... [pc.name]... I-It’s been <b>too</b> loong since... since... P-please... I want you... home.”</i>");
		else output("\n\n<i>“Haah... [pc.name]. M-my home... Please. T-take me there.”</i>");
		output(" Fisianna huffs and slumps against you, barely able to hold herself upright. If it weren’t for the now-overwhelming primal scent of her arousal, you would worry that she came down with something fierce, though you can only surmise that she took a double dose of Breeder’s Bliss ");
		if (flags["FISI_LAST_SEXED"] + 13 * 24 * 60 < GetGameTimestamp()) output("a long while");
		else output("sometime");
		output(" before your arrival. Naughty girl...")
		output("\n\nNot wanting anyone else to notice your partner’s super-libidinous state, you quickly usher her out of the park and towards her apartment. She clings to you the entire way, making it difficult to walk without tripping over each other. You swear you may have seen a head or two turn in your direction before you exit the plaza, though you pay it no further mind.");
		output("\n\nWhen you finally reach her home and open the door, Fisianna springs onto you, littering your face, neck, and anywhere else she can reach with kisses and lustful licks. You only have one small stretch to go to make it to her bedroom, but she does <i>not</i> make it easy for you. Your vision is obscured by her voluminous hair, and she vigorously dry humps you the entire way over. You pick her up and bridal carry her the rest of the way, kicking down the bedroom door once there and dumping the panting catgirl onto the bed. No sooner than she hits the mattress, she bounces up and pulls you on top of her, locking you in a fierce, sloppy kiss that lasts over a minute. When you break the kiss, she looks totally winded, her hair slightly disheveled from the rough handling.");
		output("\n\n<i>“I... I’ve b-been waiting, ever since you entered the system. I... hng... I took some of those... pills. This heat... P-please, [pc.name].”</i> Fisianna whimpers, almost melting into a gibbering puddle of horny kitten under you before you even get her naked. ");
		if (!pc.isNude()) output("You can feel her hands roaming all over your body and tugging at your clothing. ");
		output("Without a second thought, you raise yourself off of the neko");
		if (!pc.isNude() && fisiPrurience() >= 50) output(", shedding your gear and easing");
		else output(" and ease");
		output(" her off of the bed.");
		if (fisiPrurience() >= 50) output("\n\nYou help remove her garments one-by-one, starting from the top down. Her vest comes off easily enough, though Fisi fidgets madly when her t-shirt catches on her hair. <i>“Mrf... Stars...”</i> she curses under her breath in frustration while she struggles with the neck-hole. With some assistance on your part, the two of you successfully untangle her from the offending garment and toss it aside. You step in behind her to remove her lacy bra while she feverishly works on her jeans. You free her pert boobs from their confines at about the same time she slides herself out of her jeans, chucking them haphazardly across the room with a kick. Finally, almost forcefully, the catgirl rips her panties down from her waist with surprising speed, apparently very eager to be rid of them. She sighs with visible relief, finally free from the clothing that was barring you from being able to properly breed your libidinous girlfriend.");
	}
	processTime(30+rand(15));
	clearMenu();
	addButton(0, "Next", breedFisiII, x);
}

//Must have two "Breeder's Bliss" items to unlock the scene.
//Repeat scenes do not need the "Breeder's Bliss” item.
public function breedFisiII(x:int):void
{
	clearOutput();
	author("Night Trap");
	showFisi(2);

	if (fisiPrurience() < 50) {
		output("Fisianna looks down at herself with an almost confused expression before she begins disrobing urgently, softly grunting with effort. After she shrugs out of her vest, you help her lift her shirt above her head, though your assistance seems wholly unnecessary. The nekomata girl pants feverishly as she tears off her bra, baring her gloriously-flushed breasts, the soft orbs bouncing pleasantly from the force of their owner’s motions. When Fisi grunts <i>“Mmmf, stars!”</i> in frustration as she fumbles clumsily with her pants, you step in again to help her remove the offending garment.");
		output("\n\nYou crouch down to tug the jeans off, hooking your fingers into the waistband before yanking down. The moment you do, an overwhelmingly powerful scent hits you full-force, causing your nostrils to flare and your [pc.cocks] to thicken. Fisi’s panties have already soaked through with her excessive feminine moisture, and the smell of her nectar is incredible. It’s more tantalizing than even her usual tangy aroma. There’s a wonderfully sweet pheromonal undertone to the smell that just commands you to breathe in more of the stuff.");
		output("\n\nBefore you can do anything else, though, Fisianna gently tugs you up to a standing position again, nuzzling her face into your [pc.chest] with her eyes shut tight. She drinks in your scent, rubbing her nose against your body and purring happily as she huffs your personal smell. <i>“Mmmf, [pc.name], please! I-I don’t know why I feel so, like... I feel like I’m going to melt, but I just want to rub against you! Y-you smell so g-good, mmmm...”</i> The dripping wet nekomata trails her face down to your crotch, breathing deeply of your essence. She leans forward as if to nuzzle her face into your package, but opens her eyes at the last second and twirls away from you like she hadn’t been doing anything at all.");
		output("\n\nFisianna gives you a wonderful view of her soft bottom as she yanks down her ruined panties, trailing a thick strand of fragrant moisture from her pussy all the way down to her ankles before the strand snaps and sticks wetly to the inside of her leg. Even as she steps out of her undergarment, her box continues dripping sweet-smelling cunny honey between her furred feet. Fisi throws herself onto the bed and buries her face in the pillows shyly, but she spreads her legs and subtly lifts her hips, unconsciously winking her slippery pink entrance at you and crooking her tails invitingly.");
		output("\n\n");
		if (!pc.isNude()) output("You shuck your own clothing as quickly as you can, never taking your gaze off of Fisianna’s dripping womanhood. ");
		output("The scent of feline pheromones fills the room, polluting every breath you take with the odor of horny, fertile female. You’re certain that Fisi’s neighbors must be able to smell her needy little box at this point, and you delight in the knowledge that the horny neko girl is all yours. ");
		if (pc.inRut()) output("Given your own breed-focused state, Fisi’s heat scent is driving you wild. You groan as [pc.eachCock] throbs out pre-cum while you grow priapismically hard from being presented with a nubile, willing mate.");
		else output("Fisi’s heat scent clouds your mind with thoughts of her tight, wet hole. You don’t need to touch [pc.eachCock] to reach full hardness. Just the sight of your lover in such a desperately horny state is enough to make you painfully hard.");
		output(" You must have spent too long being entranced by Fisianna’s mound, because she lifts her head from the pillows to look back at you with a worried look on her face.");
		output("\n\n<i>“Haa, haa, [pc.name], please... I feel so hot. It’s like I’m on fire inside! But somehow, I know only you can put the flames out. I... I need you to cum in me! As much as you can!”</i> The catgirl’s inflamed pussy clenches hungrily as she speaks, dribbling more fragrant femlube to puddle under her erect clitoris.");
		output("\n\nThe instant the last words are out of Fisi’s mouth, she shamefully hides her face in the pillow she’s clinging to. She mewls pitifully and begins bucking her hips into the now-slippery sheets, dragging her throbbing button through the puddle of her own tangy juices in an effort that only causes her tight little slit to leak even more of those deliciously odiferous fluids. The sight is so incredibly erotic that part of you is tempted to start masturbating on the spot. Thankfully for Fisianna, the rest of your brain is still functional enough to delay your gratification, at least long enough for you to crawl across the bed and on top of your desperately horny, fertile-smelling girlfriend.");
	}
	else {
		output("Fisianna sighs breathily and traces the curves of her body, gasping at her own increased sensitivity. Her nipples quickly become erect, standing out hard and proud, signaling to you their desire to be pinched and teased. Before you can satisfy their demands though, their nekomata owner presses herself into your [pc.chest], breathing deeply of your scent. <i>“Mmmm, [pc.name], you smell so good. Why do you smell so good? Mmmm, I love your smell as much as I love you...”</i> she purrs happily and rubs her face against your [pc.skinFurScales], slowly moving her face down your body in a teasingly slow journey towards your [pc.cocks].");
		output("\n\nBefore her hot little mouth can reach your manhood though, Fisianna breaks away from you and clambers onto the bed, trailing drops of sweet-smelling nectar as she moves towards the head. She keeps her delightful bottom hidden from you teasingly, concealing her round softness with her tails. While normally she’d be using her tails for balance as she crawled, the neko holds them much closer than usual over her butt.");
		output("\n\nFisi moans softly and bends her head down under her body as she rests on all fours, hiding her blushing face from you in shame behind the curtain of her wonderful C-cup breasts. Her thighs are absolutely soaked in her lust, and her pussy is boiling over with hot, feminine moisture, translucent strands of the stuff dripping down to puddle on the sheets between her knees. <i>“Oh God... w-why am I so wet? You haven’t even touched me and I’m staining the sheets! Oooohh, [pc.name], I can’t stand it anymore! I feel like one of those Treated girls. Please, just fill me up so I don’t have keep ruining the linens all week!”</i>");
		output("\n\nFisi collapses onto the bed, but she hikes her hind end as high up into the air as possible as she lies prone, her shame combining with her instincts to put her womb in the perfect position to let gravity carry your virile seed to it, even as her pussy twitches and drips an even thicker strand of her fragrant nectar.");
		output("\n\nWhen the neko finally moves the tail that she’s been keeping suspiciously close to her heart-shaped butt, you notice another sort of heart entirely: Fisi has inserted a heart-shaped ruby buttplug into her tailhole. It glistens in the light almost as much as her dripping wet pussy. She looks back shyly over her shoulder, but she smiles at you. <i>“Um, I just really wanted your cum in my pussy, [pc.name], nowhere else, and I thought this would be a cute way to show that. It also makes me feel more full... I feel so empty right now. Please, fill me, [pc.name]! I need you to cum inside me so bad it hurts!”</i>");
		output("\n\nThere’s absolutely no way you can turn your lover down, not with her pussy clenching enticingly and leaking a torrent of pheromonal juices that flood your mind with thoughts of fucking your fertile-smelling mate pregnant. You practically pounce on her, placing your [pc.legs] between Fisi’s knees in order to spread her thighs. You run your shaft through her folds to lubricate your length, but even this brief second is too much of a tease for the horny feline. She whimpers as you thrust through her labia, only getting more desperate as your " + pc.cockHead(x) + " slots up with her entrance.");
		output("\n\nFisianna’s pitiful sounds are transformed into a neighborhood-waking yowl the moment you finally penetrate her. Her pussy is tight, wet, and above all else, <i>hot</i> - so much so that you lose your balance for a moment and slip forward, producing a lurid, wet squelching noise. Without so much as a warning, you inadvertently cram your cock into Fisianna’s defenseless slit ");
		if (pc.cocks[x].cLength() >= 8) output("until you run into her cervix");
		else output("until your [pc.knot] mashes into her vulva");
		output(", just managing to catch yourself with your hands on either side of the petite feline before going too deep.");
		output("\n\nYou don’t even have the time to think to ask Fisianna if you’ve just hurt her before she throws back her head and screams louder than you’ve ever heard her scream in normal circumstances. The rapid, frantic contractions of her velvety folds along your length definitively answers that she’s not screaming in pain. You cry out yourself and try not to cum as your " + pc.cockDescript(x) + " is clenched and milked by a primeval female reflex. The thick jet of pre-seed forced out of you by Fisianna’s tunnel is instantly washed away by the musky torrent of female ejaculate that splatters against your " + pc.cockHead(x) + ". <i>“Void, Fisi, slow down!”</i> you warn her.");
		output("\n\nThe neko girl’s curvy hips piston so fast that it causes her orgasmic shrieks to waver in pitch, her movements propelling her spasming folds up and down your shaft as she creams your cock. <i>“");
		if (silly) output("NNnnNYYaAaaNNnn");
		else output("NNnnNNaAaaHH");
		output("!!!”</i> Fisianna screams into her pillow, completely deaf to your pleas. Her pillowy ass pounds up into your groin, at one point pressing the ruby heart buttplug into you at just the right angle. Suddenly, the anal toy begins vibrating, adding more stimulation than Fisianna’s body can take. Her digitigrade legs start twitching and spasming wildly, and her motions as she fucks herself on your " + pc.cockDescript(x) + " become irregular and almost epileptic. You clench your teeth against an agonized groan of effort, struggling to hold out against this incredible cockmilking, an unbearably pleasurable process combining orgasm-inducing contractions honed by millions of years of evolution with the dick-melting mechanical vibrations that only human ingenuity could create.");
	}

	processTime(30+rand(15));

	clearMenu();
	addButton(0, "Next", breedFisiIII, x);
}

public function breedFisiIII(x:int):void
{
	clearOutput();
	author("Night Trap");
	showFisi(2);

	if (fisiPrurience() < 50) {
		output("You allow your " + pc.cockDescript(x) + " to flop between the soft cheeks of Fisi’s plush butt, causing the catgirl to tremble with excitement and need. She pushes back into your member rapidly, hotdogging you with her cushiony bottom until you groan and spurt a jet of creamy precum, much thicker than it would usually be at this point. You have to grab Fisianna by her flared hips to still her movements, lest you blow your load on her ass rather than deep in her hot little box. The nekomata mewls pathetically as you deny her motions, but her tails twitch excitedly at the feeling of you dominating her.");
		output("\n\nTrembling with lust and anticipation, Fisianna looks back at you over her shoulder, her scarlet face covered by her hair save for one widely-dilated feline eye. <i>“[pc.name]... </i>breed me!<i>”</i> She whispers your name, but she screams her plea as she lifts her butt higher even in spite of your grip. Fisianna’s entrance brushes your [pc.knot], the cock-ready orifice breathing out a wave after wave of incredibly wet heat and drooling slippery fluid on you like a hungry mouth. Almost as soon as you feel the first drop of wetness on your [pc.knot], you feel a heavy flow of your lover’s feminine essence dripping down your ");
		if (pc.balls > 0) output("[pc.balls]");
		else if (pc.hasVagina()) output("[pc.clits]"); 
		else("taint");
		output(". Fisianna wiggles her hips as much as she can while you hold them, painting you in her lust while trying to entice you to penetrate her.");
		output("\n\nIt’s all too much to resist. You take a deep breath of the rich, pheromonal air and place your [pc.legs] between Fisi’s knees in order to spread her thighs. You run your shaft through her folds to lubricate your length, but even this brief second is too much of a tease for the horny feline. She whimpers as you thrust through her labia, sounding more and more desperate as your " + pc.cockHead(x) + " slots up with her entrance. Fisianna’s pitiful sounds are transformed into a neighborhood-waking yowl the moment you finally penetrate her. Her pussy is tight, wet, and above all, <i>hot</i> - so much so that you lose your balance for a moment and slip forward, producing a lurid, wet squelching noise. Without so much as a warning, you inadvertently cram your cock into Fisianna’s defenseless slit ");
		if (pc.cocks[x].cLength() >= 8) output("until you run into her cervix");
		else output("until your [pc.knot] mashes into her vulva");
		output(", just managing to catch yourself with your hands on either side of the petite feline before going too deep.");
		output("\n\nYou don’t even have the time to think to ask Fisianna if you’ve just hurt her before she throws back her head and screams louder than you’ve ever heard her scream in normal circumstances. The rapid, frantic contractions of her velvety folds along your length definitively answers that she’s not screaming in pain. You cry out yourself and try not to cum as your " + pc.cockDescript(x) + " is clenched and milked by a primeval female reflex. The thick jet of pre-seed forced out of you by Fisianna’s tunnel is instantly washed away by the musky torrent of female ejaculate that splatters against your " + pc.cockHead(x) + ". <i>“Void, Fisi, slow down!”</i> you warn her.");
		output("\n\nThe neko girl’s curvy hips piston so fast that it causes her orgasmic shrieks to waver in pitch, her movements propelling her spasming folds up and down your shaft as she creams your cock. <i>“");
		if (silly) output("NNnnNYYaAaaNNnn");
		else output("NNnnNNaAaaHH");
		output("!!!”</i> Fisianna screams into her pillow, completely deaf to your pleas. Clenching your teeth against an agonized groan of effort, you struggle to hold out against this incredible cockmilking, an unbearably pleasurable process designed by millions of years of evolution to force you to cum.");
		if (pc.inRut()) output("\n\nIt’s a truly Herculean effort in your rutting daze");
		else output("\n\nIt’s difficult");
		output(", but your desire to please your lover wins out over the instinct to just dump your jizz deep into a fertile, unprotected pussy. Fisianna’s tails finally cease thrashing under you as the catgirl collapses back into the now massive puddle of her own pussy juice. The both of you take deep, shuddering breaths, she from exhaustion, you to master your own lust and tamp down your orgasm, something that proves incredibly difficult as Fisianna’s pussy continues to twitch and spasm with the aftershocks of her epic climax. <i>“D-don’t stop, please... You haven’t cum yet. I want your liquid love, [pc.name]...”</i> Fisianna gasps weakly between breaths.");
		output("\n\n<i>“It’s coming, Fisi. Just a bit more,”</i> you respond without even thinking. You gasp as the neko’s tunnel clenches happily around you at your response, and you can’t help but lean down to snare her lips in a kiss. It’s only a brief liplock, owing to your awkward position and shortness of breath, but your exhausted lover clenches her inner muscles even more tightly around your " + pc.simpleCockNoun(x) + " as your tongue slides into her mouth, making you wonder for a moment if this kiss will be enough to make the both of you cum.");
		output("\n\nOnce you feel in control of yourself again, you draw your hips upwards before beginning to thrust down into Fisi, relishing how sinfully <i>wet</i> she really is as her femcum splatters wetly onto her thighs, and ass, and your entire lower half with each damp clap of your hips against her soft bottom. The realization that you’re finally fucking her totally reenergizes Fisianna. <i>“Oh, yes, [pc.name]! <b>[pc.name]</b>!”</i> She mewls your name in delight and raises her hips up to meet your thrusts, somehow even more energetic than before she creamed your cock until she almost blacked out.");
	}
	else {
		if (pc.inRut()) output("It’s a truly Herculean effort in your rutting daze");
		else output("It’s difficult");
		output(", but your desire to please your lover wins out over the instinct to just dump your jizz deep into a fertile, unprotected pussy. Fisianna’s tails finally cease thrashing under you as the catgirl collapses back into the now massive puddle of her own pussy juice. The both of you take deep, shuddering breaths, she from exhaustion, you to master your own lust and tamp down your orgasm, something that proves incredibly difficult as Fisianna’s pussy continues to twitch and spasm with the aftershocks of her epic climax and the toy in her butt continues to vibrate.");
		output("\n\nHer box is so much tighter than usual, not just from her heat, but from the sex toy stretching her colon. There’s only so much room in Fisi’s pelvis, and the ruby plug combined with your " + pc.cockDescript(x) + " has packed the feline as full as she can possibly be, leaving her tunnel with nowhere to stretch to when you hilt yourself. Your " + pc.simpleCockNoun(x) + " is receiving a portion of the pleasure the buttplug is delivering to your lover, and it’s already enough to make your eyes cross when combined with the sopping wet, glove-tight folds of Fisianna’s pussy. How intense must the sensations be for her?");
		output("\n\nEvidently, incredibly intense, as the nekomata girl can barely form words. She pants desperately with her tongue hanging out, her mouth drooling in imitation of her leaky box. Fisianna eventually manages a few words, her voice breaking with pleasure every few seconds and jumping up an octave. <i>“P-P-LEase, [pc.name], p-plEASe, fUCK me! Yo-you hAVEn’t cum yet! I want yOOur looooove...”</i> She emphasizes her last words by weakly grinding her hips.");
		output("\n\n<i>“It’s coming, Fisi. Just a bit more,”</i> you reply without thinking. You gasp as the neko’s tunnel clenches happily around you at your response, and you can’t help but lean down to snare her lips in a kiss. It’s only a brief liplock, owing to your awkward position and shortness of breath, but your exhausted lover clenches her inner muscles even more tightly around your " + pc.simpleCockNoun(x) + " as your tongue slides into her mouth, making you wonder for a moment if this kiss will be enough to make the both of you cum.");
		output("\n\nThanks to the vibrations of the toy filling her ass, it really is enough for Fisi to climax. The feline girl moans deeply into your kiss and squirts a torrent of girlcum around your intruding manhood, her too-full tunnel pressurizing and splattering the slippery, pheromone-laced liquid all over the both of you while velvety contractions and intense vibrations assault your cock. There’s absolutely no hope of holding out this time, so you pull back from the kiss and begin fucking Fisianna as hard and as fast as you possibly can. You’re determined to get as much pleasure as possible out of this for both of you, and the shrieks of pleasure from your lover spur you on to hold out longer even while the lurid wet sounds her pussy makes as you stuff it full of dickmeat entice you to give in and seed her burning womb.");
		output("\n\nYou pound into Fisianna so hard that the both of you bounce off the mattress, gravity allowing you to fuck her harder and deeper than ever before. Every one of your thrusts slams into her g-spot with an incredibly loud squelch, the stimulation coaxing even more cunny honey out of Fisi’s sloppy slit and taking her voice away from her so that her cries of delight are cut off every half-second. The nekomata raises her hips up to meet every one of your thrusts, unconsciously keeping her vaginal opening angled higher than her uterus even at the nadir of her movements, instinctively positioning her reproductive system to allow gravity to carry your sperm to her eggs as efficiently as possible.");
	}

	processTime(30+rand(15));

	clearMenu();
	addButton(0, "Next", breedFisiIV, x);
}

public function breedFisiIV(x:int):void
{
	clearOutput();
	author("Night Trap");
	showFisi(2);

	if (fisiPrurience() < 50) {
		output("After just a few minutes of joyfully humping into you, Fisianna’s body locks up and begins trembling fitfully, the only warning you receive before your " + pc.cockDescript(x) + " is once more blasted with girljizz and assaulted by mind-numbing contractions. This time, you are so deep in your cups with lust that you have absolutely no hope of withstanding such a thorough cock-milking, and you realize it within the first seconds of Fisianna’s screaming orgasm. Instead of trying to hold out, you throw restraint to the winds and begin fucking Fisi as hard and fast as you can, intent on maximizing pleasure for both of you before you finally seed your feline mate’s burning womb.");
		output("\n\nYou pound into Fisianna so hard that the both of you bounce off the mattress, gravity allowing you to fuck her harder and deeper than ever before. Every one of your thrusts slams into her g-spot with an incredibly loud squelch, the stimulation coaxing even more cunny honey out of Fisi’s sloppy slit and taking her voice away from her so that her cries of delight are cut off every half-second. The nekomata raises her hips up to meet every one of your thrusts, unconsciously keeping her vaginal opening angled higher than her uterus even at the nadir of her movements, instinctively positioning her reproductive system to allow gravity to carry your sperm to her eggs as efficiently as possible.");
		output("\n\nSo blistering is the pace of your penetration that Fisianna never truly stops creaming around you, instead eventually winding down into a continual mini-orgasm that makes her eyes roll into the back of her head and her claws score ever-deeper slashes into the pillow she’s hugging in a death grip. Gone is the normally shy and reserved girl you’re used to. In her place is a needy female being given exactly what she wants and more.");
		output("\n\nEven as far gone to instinct and climax as she is, though, Fisianna is still a hopeless romantic at heart. She’s too blissed-out to form words, but her feline paw-hands reach out to yours. You get the message, and place your hands atop her cute, fuzzy paws, interlocking your fingers with hers. Not too long after, Fisi’s cunt gushes around you again, ratcheting up the pheromone concentration to the point where you’re certain that every ausar with a dick on Tavros must be sporting a stiffy now. Just knowing you’re the only person Fisianna is willing to let breed her like this is enough to make you cum.");
		output("\n\nYour lover’s sopping wet and oh-so-tight womanhood crushing your length in softness definitely doesn’t hinder you though. ");
		if (pc.hasKnot(x)) {
			output("The catgirl’s cunny is so ready to be seeded that your knot slips in on the first try, silencing Fisianna’s yowl of orgasm and forcing her eyes to open wide in shock at the overwhelming pleasure. You think she might be trying to speak, but she can barely move her jaw from the silent scream of pleasure it’s locked in. Your breeding bulb does everything a female in heat could ever want, stimulating her g-spot, stretching her walls, and sealing every single eager sperm your [pc.balls] can churn out inside her defenseless womb. ");
			if (pc.cumQ() >= 750) {
				output("Which in your case, is a very good thing. You cum, and cum, and cum, your [pc.balls] working until ");
				if (pc.balls > 1) output("they hurt");
				else output("it hurts");
				output(" in order to try as hard as possible to knock up your fertile-smelling lover. All Fisianna can manage in her fucked-mute state are little gasps and moans as her trim belly swells larger and larger with your [pc.cumNoun]. When the once-trim neko is pushed up off the bed slightly by her stretched middle, you finally run out of jizz to pump into her.");
			}
			else {
				output("You cum for what feels like ages, your [pc.balls] working until ");
				if (pc.balls > 1) output("they hurt");
				else output("it hurts");
				output(" in order to try as hard as possible to knock up your fertile-smelling lover. All Fisianna can manage in her fucked-mute state are little gasps and moans as you dump all of your [pc.cumNoun] into her pussy.");
			}
			output("\n\nYou’re not idle during your climax, even with your tie limiting your range of motion. You continue to hump into the petite girl beneath you in short, jerky thrusts as you kiss her back and neck, working with her orgasmic contractions to release as much as you can until finally, you run out of jizz.");
		}
		else {
			output("You ram your cock as deeply as possible into Fisianna, pressing your " + pc.cockHead(x) + " into her cervix just as you erupt in a torrent of [pc.cum]. ");
			if (pc.cumQ() >= 750) {
				output("You cum, and cum, and cum, your [pc.balls] working until ");
				if (pc.balls > 1) output("they hurt");
				else output("it hurts");
				output(" in order to try as hard as possible to knock up your fertile-smelling lover. Your first spurt of jizz alone is enough to completely fill Fisianna’s canal, the sheer volume of your ejaculate enough to force some spunk into her eager womb. The nekomata babbles throughout, trying to say your name and declarations of pleasure and love for you, but she’s just too stimulated to form words. With nothing to hold your [pc.cumNoun] in, your subsequent ejaculations gush back out in great gouts of seed, mixing with the tangy lake on the bed to form the most erotic cocktail imaginable.")
			}
			else {
				output("You cum for what feels like ages, your [pc.balls] working until ");
				if (pc.balls > 1) output("they hurt");
				else output("it hurts");
				output(" in order to try as hard as possible to knock up your fertile-smelling lover. The nekomata babbles throughout, trying to say your name and declarations of pleasure and love for you, but she’s just too stimulated to form words. Thanks to the position you’re both in and the angle Fisianna has placed her womanhood at, almost all of your [pc.cum] stays just where it belongs.");
			}
			output("\n\nYou’re not idle during your climax. You continue to hump into the petite girl beneath you, synchronizing your thrusts into her with each spurt of seed as you kiss her back and neck, working with her orgasmic contractions to release as much as you can, until you finally run out of jizz.");
		}
		output("\n\nYou collapse on top of Fisianna, feeling utterly exhausted, but fulfilled in the way that only comes from giving in to your basest instincts. Though she seems barely conscious, Fisi is purring as loudly as you’ve ever heard, if not more so. The vibrations feel incredible against your tired body, and you savor the sensation. To repay the favor for the neko, you squeeze her paws in your hands and begin kissing at her sweaty neck in the most sensual way you can manage.");
		output("\n\nFisianna’s purring intensifies, and after a moment to catch her breath, she turns her head so that the two of you can kiss again. You feel so close to her right now, and it’s obvious she feels exactly the same way. You dance your tongue past Fisi’s lips, leading her in the kiss, tasting her mouth and finding it in this moment to be the sweetest thing you’ve ever enjoyed, making you hungry for more. You both pour all of your passion and love for each other into the liplock, no longer simply two animals fucking, but two people making love, connecting with each other in a way more meaningful and fulfilling than anything mere beasts could ever experience.");
		output("\n\nYou kiss each other until you’re on the edge of blacking out, but Fisianna breaks away first. You gasp for air immediately, breathing so heavily that you almost miss your lover calling you in a breathless whisper, her eyes shut and most of her beautiful face covered by her hair. <i>“[pc.name]? I loved doing this with you. I loved this, and I love you so much. I don’t think I can say it enough.”</i>");
		output("\n\nYou can’t help but smile at the uninhibited declaration of love from Fisianna. You beam at her, even knowing she can’t see it. <i>“I love you too, Fisi. I can’t wait to love you like this again.”</i> You gently tuck her hair back from her face before planting a kiss on her cheek. Fisianna smiles even more at your response, and she giggles and nuzzles back into you when you roll onto your side and pull her against your [pc.chest]. The two of you fall unconscious with your arms around her, still holding hands and smiling even in your sleep.");
	}
	else {
		output("So blistering is the pace of your penetration that Fisianna never truly stops creaming around you, instead eventually winding down into a continual mini-orgasm that makes her eyes roll into the back of her head and her claws score ever-deeper slashes into the pillow she’s hugging in a death grip. The ruby heart stretching her sphincter never stops vibrating, driving pleasure for both of you to incredible heights. Fisi trembles and shudders in total ecstasy, thrilling in the primal sensation of being a needy female getting exactly what she wants and more.");
		output("\n\nEven as far gone to instinct and climax as she is, though, Fisianna is still a hopeless romantic at heart. She’s too blissed-out to form words, but her feline paw-hands reach out to yours. You get the message and place your hands atop her cute, fuzzy paws, interlocking your fingers with hers. Not too long after, Fisi’s cunt gushes around you harder than ever, ratcheting up the pheromone concentration to the point where you’re certain that every ausar with a dick on Tavros must be sporting a stiffy now. Just knowing you’re the only person Fisianna is willing to let breed her like this is enough to make you cum.");
		output("\n\nYour lover’s sopping wet and oh-so-tight womanhood crushing your length in softness definitely doesn’t hinder you though. ");
		if (pc.hasKnot(x)) {
			output("The catgirl’s cunny is so ready to be seeded that your knot slips in on the first try, silencing Fisianna’s yowl of orgasm and forcing her eyes to open wide in shock at the overwhelming pleasure. You think she might be trying to speak, but her eyes are rolled back into her head, and she can barely move her jaw from the silent scream of pleasure it’s locked in. Your breeding bulb does everything a female in heat could ever want, stimulating her g-spot, stretching her walls, and sealing every single eager sperm your [pc.balls] can churn out inside her defenseless womb. ");
			if (pc.cumQ() >= 750) {
				output("Which, in your case, is a very good thing. You cum, and cum, and cum, your [pc.balls] working until ");
				if (pc.balls > 1) output("they hurt");
				else output("it hurts");
				output(" in order to try as hard as possible to knock up your fertile-smelling lover. All Fisianna can manage in her fucked-mute state are little gasps and moans as her trim belly swells larger and larger with your [pc.cumNoun]. When the once-trim neko is pushed up off the bed slightly by her stretched middle, you finally run out of jizz to pump into her.");
			}
			else {
				output("You cum for what feels like ages, your [pc.balls] working until ");
				if (pc.balls > 1) output("they hurt");
				else output("it hurts");
				output(" in order to try as hard as possible to knock up your fertile-smelling lover. All Fisianna can manage in her fucked-mute state are little gasps and moans as you dump all of your [pc.cumNoun] into her pussy.");
				output("\n\nYou’re not idle during your climax, even with your tie limiting your range of motion. The toy in Fisi’s plush butt vibrates against your knot, pleasuring you so intensely that you helplessly hump into the petite girl beneath you in short, jerky thrusts as you kiss her back and neck, working with her orgasmic contractions to release as much as you can, until you finally run out of jizz.");
			}
		}
		else {
			output("You ram your cock as deeply as possible into Fisianna, pressing your " + pc.cockHead(x) + " into her cervix just as you erupt in a torrent of [pc.cum]. ");
			if (pc.cumQ() >= 750) {
				output("You cum, and cum, and cum, your [pc.balls] working until ");
				if (pc.balls > 1) output("they hurt");
				else output("it hurts");
				output(" in order to try as hard as possible to knock up your fertile-smelling lover. Your first spurt of jizz alone is enough to completely fill Fisianna’s canal, the sheer volume of your ejaculate enough to force some spunk into her eager womb. The nekomata babbles throughout, trying to say your name and declarations of pleasure and love for you, but she’s just too stimulated to form words. With nothing to hold your [pc.cumNoun] in, your subsequent ejaculations gush back out in great gouts of seed, mixing with the tangy lake on the bed to form the most erotic cocktail imaginable.")
			}
			else {
				output("You cum for what feels like ages, your [pc.balls] working until ");
				if (pc.balls > 1) output("they hurt");
				else output("it hurts");
				output(" in order to try as hard as possible to knock up your fertile-smelling lover. The nekomata babbles throughout, trying to say your name and declarations of pleasure and love for you, but she’s just too stimulated to form words. Thanks to the position you’re both in and the angle Fisianna has placed her womanhood at, almost all of your [pc.cum] stays just where it belongs.");
			}
			output("\n\nYou’re not idle during your climax. You continue to hump into the petite girl beneath you, synchronizing your thrusts into her with each spurt of seed as you kiss her back and neck, working with her orgasmic contractions and the vibrations of the toy in her plush butt to release as much as you can, until you finally run out of jizz.");
		}
		output("\n\nYou collapse on top of Fisianna, feeling utterly exhausted, but fulfilled in the way that only comes from giving in to your basest instincts. Though she seems barely conscious, Fisi is purring as loudly as you’ve ever heard, if not more so. The vibrations feel incredible against your tired body, and you savor the sensation. To repay the favor for the neko, you squeeze her paws in your hands and begin kissing at her sweaty neck in the most sensual way you can manage.");
		output("\n\nFisianna’s purring intensifies, and after a moment to catch her breath, she turns her head so that the two of you can kiss again. You feel so close to her right now, and it’s obvious she feels exactly the same way. You dance your tongue past Fisi’s lips, leading her in the kiss, tasting her mouth and finding it in this moment to be the sweetest thing you’ve ever enjoyed, making you hungry for more. You both pour all of your passion and love for each other into the liplock, no longer simply two animals fucking, but two people making love, connecting with each other in a way more meaningful and fulfilling than anything mere beasts could ever experience.");
		output("\n\nYou kiss each other until you’re on the edge of blacking out, but Fisianna breaks away first. You gasp for air immediately, breathing so heavily that you almost miss your lover calling you in a breathless whisper, her eyes shut and most of her beautiful face covered by her hair. <i>“[pc.name]? I loved doing this with you. I loved this, and I love you so much. I don’t think I can say it enough.”</i>");
		output("\n\nYou can’t help but smile at the uninhibited declaration of love from Fisianna. You beam at her, even knowing she can’t see it. <i>“I love you too, Fisi. I can’t wait to love you like this again.”</i> You gently tuck her hair back from her face before planting a kiss on her cheek. Fisianna smiles even more at your response, and she giggles and nuzzles back into you when you roll onto your side and pull her against your [pc.chest]. You take a second to turn off the buttplug’s vibrations. Fisi gasps as the sensation stops abruptly before giggling and nuzzling back into you. ");
		if (flags["FISI_TIMES_BREED"] == undefined) output("<i>“I didn’t even know that vibrated before now. I’m really glad I used it.”</i>");
		else output("<i>“I’m purring so hard I almost forgot that was still in there.”</i>");
		output(" The two of you fall unconscious with your arms around her, still holding hands and smiling even in your sleep.");
	}

	if (flags["FISI_TIMES_BREED"] == undefined) pc.destroyItemByClass(BreedersBliss,2);
	
	IncrementFlag("FISI_TIMES_BREED");
	IncrementFlag("FISI_TIMES_SEXED");
	flags["FISI_LAST_SEXED"] = GetGameTimestamp();

	currentLocation = "RESIDENTIAL DECK 13";

	pc.orgasm();
	fisianna.orgasm();
	processTime(30+rand(15));

	fisiPrurience(10);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function appearanceFisi():void
{
	
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	
	output("In the bright lights of the plaza, you are able to discern more of Fisianna’s features than you could back in Anon’s Bar. Upon noticing you starting to stare her down in an analytical manner, Fisianna’s ears twitch in surprise before gradually drooping lower on each side of her head in embarrassment, her cheeks flushing a subtle pink as she averts her gaze towards the ground. <i>“Um... [pc.name]? Y-you’re kinda... staring at me ah... really hard.”</i> she squeaks, barely audible to you.");
	output("\n\nFisianna stands at roughly 5\' 0\" in height. At first glance she looks similar to a full kaithrit; however, she has white fuzzy paws on the ends of her hands and feet which are kept bare, exposing the exquisitely plush pink pads on the underside of them. The fur at her bracelet-adorned wrists gradually fades into an orange and white striped hue as her fur trails close to her elbows, making her look very similar to a terran tabby cat. Her legs also follow a similar pattern; the fur on them tracks up to her knees and stops there, though her legs have a more animalistic bend at the ankles, making them digitigrade in appearance. Fisianna seems to have done quite a job matching her hair color to her fur, further accentuating the tabby cat look with ass length hair of orange with white highlights. She also has the same two cat tails that kaithrit sport which are covered with the same orange and white striped fur. Fisianna’s tails seem a bit longer than usual kaithrit tails, not to mention hers seem to be able to move in a more precise manner, making them almost as dextrous as third and fourth arms. She sports the natural litheness and flexibility of a cat, with a trim body to match. Fisianna’s skin is smooth and lightly tanned where she does not have fur.");
	output("\n\nFisianna looks purely female by appearance, with fairly luscious eyelashes shadowing her golden feline eyes. She has supple peach colored lips with high feminine cheeks and a soft jaw line that could melt almost anyone’s heart whenever she manages a smile. On top of her head, blending in with her hair she has triangular feline ears with an abundance of fluffy white hairs bordering the inside and pink inner ear skin. Her button nose appears slightly pinker than the rest of her visage.");
	output("\n\nIn terms of apparel Fisianna is sporting a black hooded and sleeveless vest trimmed with white fur at the hood area. Her vest is open, allowing you to view a light purple T-shirt that clings rather tightly to her form with a logo of a pixelated orange head of what you assume is a cat’s. Your curiosity gets the better of you as you look at the cat emblem, leaving you to guess what is underneath. Her bust size seems rather modest at what you guess are C-cups at the least. Your eyes trailing further down, you see Fisianna is wearing a cute pair of blue jeans that adorned with a tablet-like device on her hip. Her pants end with a bell-bottom-like hem, which drapes over her slightly enlarged foot paws. She has a pronounced feminine figure by the way her shirt and jeans hug her hips and butt, but nothing anywhere near as extreme as some of the things you’ve seen before. ");
	if (flags["FISI_SEX_NUMBER"] != undefined) output("Underneath those jeans you know she is wearing a cute pair of white, lacy cat patterned panties. These panties cover a small, thin love trail of orange fur that tracks down to her pink, wet, human vagina. She is also wearing a matching bra of white lacy cloth with the same paw print pattern that covers her perky hand-cuppable breasts with peach colored areola and inverted nipples that pop out at her most aroused state.");
	
	processTime(1);
	addDisabledButton(0, "Appearance", "Appearance", "You’re already looking at her.");
}

public function talkFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	output("<i>“I wouldn’t mind just having a little chat with you, if you wanted to?”</i>");
	output("\n\n<i>“Ah, ok. Sure, I don’t mind. Did you have anything in mind that you wanted to talk about?”</i> Fisianna asks sweetly.");
	
	addButton(0, "Fisianna", topicFisianna);
	
	if (flags["FISI_TALK_FISI"] != undefined){
		addButton(1, "Tavros", topicTavros);
		addButton(2, "Programming", topicProgramming);
		addButton(3, "Gaming", topicGaming);
	}
	else
	{
		addDisabledButton(1, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
		addDisabledButton(2, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
		addDisabledButton(3, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	}
	
	if (flags["FISI_TRUST"] >= 50) addButton(4, "Friends", topicFriends);
	else addDisabledButton(4, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TRUST"] >= 50 && flags["FISI_TALK_FRIENDS"] != undefined) addButton(5, "Mods", topicMods);
	else addDisabledButton(5, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TRUST"] >= 75 && flags["FISI_TALK_MODS"] != undefined) addButton(6, "Background", topicBackground);
	else addDisabledButton(6, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TALK_PARENTS"] != undefined) addDisabledButton(7, "Parents", "Parents","You don’t think it would be a good idea to bring up bad memories again with Fisianna.");
	else if (flags["FISI_TRUST"] >= 90 && flags["FISI_TALK_BG"] != undefined) addButton(7, "Parents", topicParents);
	else addDisabledButton(7, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	addButton(14,"Back",talkBack);
	
	processTime(1);
}


public function talkBack():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	
	output("You decide to change your mind about talking with Fisianna.");
	output("\n\n<i>“O-oh, ok, if that’s what you want. Did you have anything else in mind for us then?”</i> Fisianna asks tentatively.");
	
	fisiMainMenu(true);
}

public function topicFisianna():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	if (flags["FISI_TALK_FISI"] == undefined) output("<i>“Hmm... how about you tell me a bit about yourself for starters?");
	else output("<i>“Hmm... how about you tell me a bit about yourself?");
	output(" Tell me whatever you’re comfortable enough to share.”</i>");
	output("\n\n<i>“Oh, uh... sure, though I’m not all that interesting compared to someone like you.”</i> Fisianna raises a paw to her chin and looks upward in deep thought of what to share first.");
	output("\n\n<i>“Well, you know my name, right? It’s Fisianna Luvalle. Wait, of course you do... That’s a stupid question. Hng... This is kind of hard being put on the spot like this.”</i> Fisianna awkwardly chuckles to herself. ");
	output("\n\nYou give her a small nod to urge her to continue. Fisianna fidgets in her seat and stammers a little bit before you decide the give the poor girl a little help.");
	output("\n\n<i>“How about something... general? Something short and sweet, like life at home? Your job? Hobbies? Relationships? You don’t have to spill everything at once of course.”</i>");
	output("\n\n<i>“Oh o-ok. I think can manage that.”</i> Fisianna recomposes herself, taking a deep breath before exhaling very quickly.");
	output("\n\n<i>“W-well... I’m 24 years old. I just moved here a few months ago, so I’m kind of new here. I haven’t traveled much outside of my homeland. I’m a programmer for virtual and artificial intelligences, though I don’t work under any single company so I guess I’m a freelancer? Hobbies? Mmm... I do like to make my own programs once in awhile. I haven’t ever had a significant other in my life, so I’ve never been kissed or a-anything...”</i> Fisianna blushes furiously as she mentions this, but continues. <i>“I also like to play a lot of video games... oh my stars, I must sound so nerdy to you already, don’t I?”</i> Fisianna facepalms, or rather facepaws herself before letting a small groan loose.");
	output("\n\nYou can’t help but chuckle at how fast she exhaled that information, but if anything, it gives you a good amount of topics you can delve into and talk about in more detail if she is comfortable enough sharing them with you.");
	
	if (flags["FISI_TALK_FISI"] == undefined)
	{
		flags["FISI_TALK_FISI"] = 1;
		flags["FISI_TRUST"] += 5;
		if (flags["FISI_TRUST"] > 100) flags["FISI_TRUST"] = 100;
	}
	
	addDisabledButton(0, "Fisianna", "Fisianna", "You’re talking about this right now.");
	addButton(1, "Tavros", topicTavros);
	addButton(2, "Programming", topicProgramming);
	addButton(3, "Gaming", topicGaming);

	
	if (flags["FISI_TRUST"] >= 50) addButton(4, "Friends", topicFriends);
	else addDisabledButton(4, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TRUST"] >= 50 && flags["FISI_TALK_FRIENDS"] != undefined) addButton(5, "Mods", topicMods);
	else addDisabledButton(5, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TRUST"] >= 75 && flags["FISI_TALK_MODS"] != undefined) addButton(6, "Background", topicBackground);
	else addDisabledButton(6, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TALK_PARENTS"] != undefined) addDisabledButton(7, "Parents", "Parents","You don’t think it would be a good idea to bring up bad memories again with Fisianna.");
	else if (flags["FISI_TRUST"] >= 90 && flags["FISI_TALK_BG"] != undefined) addButton(7, "Parents", topicParents);
	else addDisabledButton(7, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	processTime(7);
	addButton(14,"Back",talkBack);
}

public function topicTavros():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	if (flags["FISI_TALK_TAVROS"] == undefined)
	{
		flags["FISI_TALK_TAVROS"] = 1;
		flags["FISI_TRUST"] += 5;
		if (flags["FISI_TRUST"] > 100) flags["FISI_TRUST"] = 100;
	}
	
	output("<i>“So, what brings a gal like you to Tavros? This isn’t the most tame of places for one as seemingly delicate as you are.”</i>");
	output("\n\nFisianna looks as though she is mulling something over before she responds, all the while blushing at your compliment. <i>“Y-yeah... you’re kind of right about that, but it is a place rife with opportunity as well. I-I figured it was as good a time as any to you know... make it big... maybe even find myself.”</i> ");
	if (flags["FISI_TRUST"] < 75) output("Something tells you that there’s a deeper meaning behind what she just said, but you don’t think she would be comfortable enough to divulge that information yet, if the way her face is slowly sinking in sadness is a clue.");
	output("\n\nFisianna straightens up after her brief moment of reverie and smiles softly. <i>“Even so, this isn’t a bad place to live, and I’m doing well enough for myself so far. There are some things that surprise me, and continue to surprise while I’m here. There’s so many interesting things to see here on a daily basis. Nothing really ever gets old, not like how it used to be where I lived before.”</i>");
	output("\n\n");
	if (silly) output("Well, you know what they say: that curiosity killed the cat. ");
	output("You figure that is a fair point, but you are definitely surprised that this particular kitten has a bit of a wanderlust and comment as such.");
	output("\n\n<i>“Mmm, believe me. Usually I’m more of a homebody myself, at least a <b>lot</b> more so before I met my friends. The ones you met at the bar with me.”</i>");
	
	
	addButton(0, "Fisianna", topicFisianna);
	addDisabledButton(1, "Tavros", "Tavros","You’re talking about this right now.");
	addButton(2, "Programming", topicProgramming);
	addButton(3, "Gaming", topicGaming);
	
	if (flags["FISI_TRUST"] >= 50) addButton(4, "Friends", topicFriends);
	else addDisabledButton(4, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TRUST"] >= 50 && flags["FISI_TALK_FRIENDS"] != undefined) addButton(5, "Mods", topicMods);
	else addDisabledButton(5, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TRUST"] >= 75 && flags["FISI_TALK_MODS"] != undefined) addButton(6, "Background", topicBackground);
	else addDisabledButton(6, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TALK_PARENTS"] != undefined) addDisabledButton(7, "Parents", "Parents","You don’t think it would be a good idea to bring up bad memories again with Fisianna.");
	else if (flags["FISI_TRUST"] >= 90 && flags["FISI_TALK_BG"] != undefined) addButton(7, "Parents", topicParents);
	else addDisabledButton(7, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	processTime(8);
	addButton(14,"Back",talkBack);
}

public function topicProgramming():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	if (flags["FISI_TALK_PROG"] == undefined)
	{
		flags["FISI_TALK_PROG"] = 1;
		flags["FISI_TRUST"] += 5;
		if (flags["FISI_TRUST"] > 100) flags["FISI_TRUST"] = 100;
	}
	
	output("<i>“I remember you saying that you program VIs and AIs. How is that going for you?”</i>");
	output("\n\nFisianna lights up immediately when you mention programming, her ears pitched up high and twitching with delight. <i>“Ooh, it’s exciting! I love it! I mean, well... it does get a bit frustrating when it comes down to the specialty in programming that I deal with. I usually deal more with the ‘personality’ of the programs when it comes to AIs. Grown AIs, as most people call them. It’s delicate work, especially when it comes to the AIs that are designed to grow as they experience things. These types of AI’s especially have a high rate of failure for inexperienced programmers. One little mistake in the program code or core, or one little extra letter or space in the wrong place and the whole thing could go haywire. It might be a bit tedious to double check, triple check... well... check as many times as you have to get it right! I don’t mind it at all though. I love programming AIs and VIs!”</i>");
	output("\n\nFisianna is as animated as you’ve ever seen her. As she explains her job in further detail, her tails move at a fever pitch while she smiles widely. She really must be devoted to her job! ");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER)
	{
		output("\n\nHaving dealt with your share of technology yourself, you add to the conversation with your own experiences with programming. ");
		output("\n\n<i>“Oh believe me, I know that struggle all too well. It took me forever to make my first ever functioning droid. Don’t even get me started on networking either...”</i>");
	}
	output("\n\n<i>“As for what company I work for, I would have to say I don’t work under anyone specifically. I take various job offers and temporarily help develop programs for anyone that really needs the outside assistance for their own companies. I sometimes take technical repair offers as well if there isn’t a job offer for any sort of programming. I don’t like to be tied down to any one company. I would rather be free. I guess you can call me a freelance programmer.”</i> There’s a hint of disdain in Fisianna’s voice as she says this, but that is quickly gone as she continues to talk about the specifics of her position.");
	if (flags["FISI_DATE_NUMBER"] >= 4) output("\n\nThe conversation eventually rounds to the subject of Fisianna’s personal AI, Isis. <i>“Y’know, Isis keeps telling me constantly how much she misses seeing you, and can’t wait to talk with you again! Next time you visit my apartment, you should go say hello again. I’m very sure she’d love it.”</i> Fisianna smiles sweetly.");
	else output("\n\nFisianna gasps in excitement after she talks about a recent AI project she worked on with KihaCorp. <i>“Speaking of AIs, I actually developed my own home grown AI that I’ve been working on in my spare time since I got here! She’s a cute thing she is! I ought to show her to you if you ever get a chance to drop by my apartment sometime! That’s where I keep her!”</i>");
	
	addButton(0, "Fisianna", topicFisianna);
	addButton(1, "Tavros", topicTavros);
	addDisabledButton(2, "Programming", "Programming","You’re talking about this right now.");
	addButton(3, "Gaming", topicGaming);
	
	if (flags["FISI_TRUST"] >= 50) addButton(4, "Friends", topicFriends);
	else addDisabledButton(4, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TRUST"] >= 50 && flags["FISI_TALK_FRIENDS"] != undefined) addButton(5, "Mods", topicMods);
	else addDisabledButton(5, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TRUST"] >= 75 && flags["FISI_TALK_MODS"] != undefined) addButton(6, "Background", topicBackground);
	else addDisabledButton(6, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TALK_PARENTS"] != undefined) addDisabledButton(7, "Parents", "Parents","You don’t think it would be a good idea to bring up bad memories again with Fisianna.");
	else if (flags["FISI_TRUST"] >= 90 && flags["FISI_TALK_BG"] != undefined) addButton(7, "Parents", topicParents);
	else addDisabledButton(7, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	processTime(4);
	addButton(14,"Back",talkBack);
}

public function topicGaming():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	if (flags["FISI_TALK_GAMING"] == undefined)
	{
		flags["FISI_TALK_GAMING"] = 1;
		flags["FISI_TRUST"] += 5;
		if (flags["FISI_TRUST"] > 100) flags["FISI_TRUST"] = 100;
	}
	
	output("You tell Fisianna that she mentioned she likes to play games as a hobby and ask what types of games she likes to play.");
	output("\n\n<i>“O-oh, all sorts of games! Puzzles, strategy, shooters, you name it! I’m particularly fond of adventure simulators myself. They’re kind of like what planetary rushes are in some cases, but none of the imminent danger... at least not real danger anyways. I suppose I’m pretty good at the shooters myself, feline reflexes and all.”</i> Fisianna adds jokingly with a giggle.");
	output("\n\n<i>“I’m pretty sure they have some gaming stations set up around here that we can probably play together. I’d like to see what you can do sometime in a game of Call of Valor 8.”</i> You suggest.");
	output("\n\nFisianna’s smile starts to turn into something that looks uncharacteristically devilish as her ears rotate forwards. <i>“Oh you’re ON! Just say when!”</i> The feline giddily bounces in her seat with her tails waggling wildly for a little while before at the flip of a switch, she realizes her excitement and straightens herself out, lightly coughing and turning into her usual meek self. <i>“T-that is, if you want.”</i>");
	if (flags["TIMES_WON_AGAINST_SYRI"] != undefined || flags["TIMES_LOST_TO_SYRI"] != undefined) output("\n\nYou start to develop the distinct feeling that Fisianna and Syri could become the best of friends if they ever met each other. Either that or the worst of gaming enemies knowing how Syri can behave during a game of Call of Valor.");
	
	addButton(0, "Fisianna", topicFisianna);
	addButton(1, "Tavros", topicTavros);
	addButton(2, "Programming", topicProgramming);
	addDisabledButton(3, "Gaming", "Gaming","You’re talking about this right now.");
	
	if (flags["FISI_TRUST"] >= 50) addButton(4, "Friends", topicFriends);
	else addDisabledButton(4, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TRUST"] >= 50 && flags["FISI_TALK_FRIENDS"] != undefined) addButton(5, "Mods", topicMods);
	else addDisabledButton(5, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TRUST"] >= 75 && flags["FISI_TALK_MODS"] != undefined) addButton(6, "Background", topicBackground);
	else addDisabledButton(6, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TALK_PARENTS"] != undefined) addDisabledButton(7, "Parents", "Parents","You don’t think it would be a good idea to bring up bad memories again with Fisianna.");
	else if (flags["FISI_TRUST"] >= 90 && flags["FISI_TALK_BG"] != undefined) addButton(7, "Parents", topicParents);
	else addDisabledButton(7, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	processTime(5);
	addButton(14,"Back",talkBack);
}

public function topicFriends():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	if (flags["FISI_TALK_FRIENDS"] == undefined)
	{
		flags["FISI_TALK_FRIENDS"] = 1;
		flags["FISI_TRUST"] += 5;
		if (flags["FISI_TRUST"] > 100) flags["FISI_TRUST"] = 100;
	}
	
	output("<i>“About your friends... they’re quite the colorful group of girls. I’m curious to know how you all met each other?”</i> You ask Fisianna.");
	output("\n\n<i>“O-oh. We actually met each other on the extranet back when I was a human on Terra.”</i> Fisianna absentmindedly rubs her paws together. <i>“They’re really nice people. They’re actually the ones that convinced me to come here, and they helped me get started with my life on Tavros.”</i> ");
	output("\n\n<i>“They sounded nice enough when I met them at the bar. They’re certainly entertaining at least.”</i> You think back about the night at Anon’s when you met Fisianna and how different their personalities were to Fisianna’s and can’t help but point that out to her.");
	output("\n\n<i>“Y-yeah... I know I’m not as outgoing as them. I-I kind of envy them for that.”</i> Fisianna looks wistfully at the palm trees ahead, ears downturning and sighing deeply as she continues. <i>“T-that night at Anon’s, that was one of their ideas to start to try to get me to open up. They know I’m as timid towards strangers as a tove is greedy for money. I didn’t want to do that at all, but they insisted. It wasn’t the first time they’ve tried something like that either. Each time a stranger would come up to us at anytime, I... I felt like I wanted to die. I’m just so awkward a lot of times... S-still...”</i>");
	output("\n\nFisianna turns towards you with a rather intense look in her eyes. She grabs your hand in her paw while she speaks. <i>“I-I’m really glad to have met you out of this though. I have them to thank for this. You’ve been a great new friend to me, a-and I couldn’t ask for anything more out of them.”</i>");
	output("\n\nYou thank Fisianna and give her paw a gentle squeeze. She blushes and lets go of your hand, looking back towards the palm trees with a contented look on her face.");
	
	addButton(0, "Fisianna", topicFisianna);
	addButton(1, "Tavros", topicTavros);
	addButton(2, "Programming", topicProgramming);
	addButton(3, "Gaming", topicGaming);
	addDisabledButton(4, "Friends", "Friends","You’re talking about this right now.");
	addButton(5, "Mods", topicMods);
	
	if (flags["FISI_TRUST"] >= 75 && flags["FISI_TALK_MODS"] != undefined) addButton(6, "Background", topicBackground);
	else addDisabledButton(6, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TALK_PARENTS"] != undefined) addDisabledButton(7, "Parents", "Parents","You don’t think it would be a good idea to bring up bad memories again with Fisianna.");
	else if (flags["FISI_TRUST"] >= 90 && flags["FISI_TALK_BG"] != undefined) addButton(7, "Parents", topicParents);
	else addDisabledButton(7, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	processTime(6);
	addButton(14,"Back",talkBack);
}

public function topicMods():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	if (flags["FISI_TALK_MODS"] == undefined)
	{
		flags["FISI_TALK_MODS"] = 1;
		flags["FISI_TRUST"] += 5;
		if (flags["FISI_TRUST"] > 100) flags["FISI_TRUST"] = 100;
	}
	
	output("<i>“So you said you ‘were’ human. What brought on the decision to start modding yourself? Especially with such unique mods.”</i> You point at one of Fisianna’s furred paws.");
	output("\n\n<i>“Ah, that’s an easy one. I really like cats!”</i> Fisianna giggles and starts to swing her legs under the bench. <i>“Back on Terra when I was a teen, I actually used to own a cat. She was the cutest little tabby cat. Her name was Isis. I used to play with her all the time. One day... she... she passed away. It was one of the saddest days of my life...”</i> Fisianna’s expression rapidly changes to that of solemn mourning after she says this.");
	output("\n\n<i>“I’m sorry to hear...”</i> You try to console her.");
	output("\n\n<i>“I-it’s ok, [pc.name]... I-it was just her time to go is all...”</i> Despite her efforts to try to stay strong, you can see tears start to well up in her eyes.");
	output("\n\nYou decide to try to move the conversation on as quickly as possible. <i>“So was Isis an inspiration for your mod changes then?”</i>");
	output("\n\nFisianna wipes an eye and sniffles slightly before answering, <i>“Largely, yes. I wanted to do these changes in memory of her. Part of it was also mere curiosity, which I suppose comes with being cat-like. I was also interested in those <i>“nekomata”</i> I read about in Japanese folklore. The main reason why I wanted to make the changes to myself was because... I wanted to differentiate myself from who I was. I just simply wasn’t very happy being a human and felt I needed to express how I really feel... on the outside. ");
	if (flags["FISI_TALK_PARENTS"] == undefined) output("I can tell you my parents were NOT happy to hear that...”</i> Fisianna’s face turns into a grimace after she says this.");
	if (flags["FISI_TRUST"] < 90)
	{
		output("\n\nYou ask her why that might be, but Fisianna’s face starts to contort into something very unfitting for her. She looks to be both simultaneously pained and... angry?");
		output("\n\n<i>“I-I’m sorry [pc.name]... This... isn’t something I’m the most comfortable talking about. Can we talk about it another time?”</i> She looks down at her hands and fumbles with some of the orange hair around her paw.");
		output("\n\nAt that earlier expression on her face, you definitely think it best to leave the subject be for now. You put a reassuring hand on her shoulder without thinking about it. Fisianna jumps slightly at your touch, but she turns her head to give you a small smile.");
	}
	else if (flags["FISI_TALK_PARENTS"] == undefined) output("\n\nFisianna sighs deeply. <i>“I-I suppose I owe you an explanation about them now. I-I just need a moment... I hate bringing them up again... <i>“");
	
	addButton(0, "Fisianna", topicFisianna);
	addButton(1, "Tavros", topicTavros);
	addButton(2, "Programming", topicProgramming);
	addButton(3, "Gaming", topicGaming);
	addButton(4, "Friends", topicFriends);
	addDisabledButton(5, "Mods", "Mods","You’re talking about this right now.");
	
	if (flags["FISI_TRUST"] >= 75 && flags["FISI_TALK_MODS"] != undefined) addButton(6, "Background", topicBackground);
	else addDisabledButton(6, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	if (flags["FISI_TALK_PARENTS"] != undefined) addDisabledButton(7, "Parents", "Parents","You don’t think it would be a good idea to bring up bad memories again with Fisianna.");
	else if (flags["FISI_TRUST"] >= 90 && flags["FISI_TALK_BG"] != undefined) addButton(7, "Parents", topicParents);
	else addDisabledButton(7, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	processTime(7);
	addButton(14,"Back",talkBack);
}

public function topicBackground():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	if (flags["FISI_TALK_BG"] == undefined)
	{
		flags["FISI_TALK_BG"] = 1;
		flags["FISI_TRUST"] += 5;
		if (flags["FISI_TRUST"] > 100) flags["FISI_TRUST"] = 100;
	}
	
	output("You wonder what Fisianna’s life was like on Terra.");
	output("\n\nFisianna purses her lips thoughtfully while she tries to recall her former home. <i>“Well... it wasn’t bad. I grew up on a small island on Earth, close to the mainland. Life was pretty quiet and uneventful for the most part there... almost boring sometimes. As you can probably guess, I was shy around others when I was a kid too. I used to get teased quite a bit for it too by the other kids there.”</i> Fisianna frowns while explaining.");
	output("\n\n<i>“Well that’s just mean. What would they know of this cool cat that I’m with now?”</i> You say trying to encourage Fisianna, trying to keep her spirits up. Fisianna giggles lightly at this.");
	output("\n\n<i>“Thanks. Yeah, what would they know?”</i> Fisianna smiles while continuing. <i>“I grew up liking technology a lot. It was just so interesting to just know how things worked. I would pick apart anything I could get my hands on just to see how things function and put them back together again. Later on I even began to improve some things I took apart and they would be working better than they did before. I guess you could say I was kind of a tech genius, even at a young age.”</i>");
	output("\n\nThis is the first time you have seen Fisianna with some iota of pridefulness in her. You take a look at her and see she’s smiling widely.");
	output("\n\n<i>“That’s great! I think I might know who to look to if there’s ever anything wrong with something on my ship.”</i> You tell Fisianna, only partially jokingly.");
	output("\n\nFisianna laughs, still adopting that wide smile. <i>“Well, I wouldn’t go <b>that</b> big in scale, I mean not as far as mechanical functions on a ship, but hey, if you have a busted terminal or a computer that’s on the fritz, I’m your kitty!”</i>");
	output("\n\nYou tell Fisianna that you will hold her to that offer if it comes to that. After the two of you settle down a bit, you inquire about her family.");
	output("\n\n<i>“Oh, I’m the baby of my family. I have one other brother and sister. Twins. They’re really nice. I think they work as scientists that develop medicines for JoyCo. They’re quite well-respected at their profession too. I keep in contact with them when I can to see how they’re doing.”</i>");
	output("\n\nYou nod your head as you listen to Fisianna talk about her brother and sister. <i>“They sound quite nice. I’d like to meet them one day if possible.”</i>");
	output("\n\nFisianna frowns. <i>“Mmm, often times they’re really busy, so I rarely get to talk to them much myself. Their field of work is way more demanding compared to mine anyways, especially with me being a freelancer.”</i>");
	output("\n\n<i>“That’s too bad...”</i> ");
	if (flags["FISI_TALK_PARENTS"] == undefined) output("After a momentary pause, you ask, <i>“What about your parents? What were they like?”</i>");
	if (flags["FISI_TRUST"] < 90)
	{
		output("\n\nFisianna’s face suddenly darkens at the mention of her parents. <i>“Mmm... c-can I tell you about them at another time? I promise I will, just... just not yet.”</i>");
		output("\n\nYou recall the conversation you had about Fisianna’s mods and how she reacted when she said her parents were not happy about her mods. You start to think it has something to do with that and that she may have had some sort of a dispute about it, but you choose not to press the issue. All you can do for now is apologise in earnest and lightly hug Fisianna to you to comfort her, patting her gently near her feline ears.");
		output("\n\n<i>“T-thanks, [pc.name].”</i> She lightly murmurs into your shoulder.");
	}
	else if (flags["FISI_TALK_PARENTS"] == undefined) output("\n\nFisianna sighs deeply as her expression grows somber. <i>“A-alright, I think I can tell you about them now. I just need a moment to prepare... a good amount of drama happened between us...”</i>");
	
	addButton(0, "Fisianna", topicFisianna);
	addButton(1, "Tavros", topicTavros);
	addButton(2, "Programming", topicProgramming);
	addButton(3, "Gaming", topicGaming);
	addButton(4, "Friends", topicMods);
	addButton(5, "Mods", topicMods);
	addDisabledButton(6, "Background", "Background","You’re talking about this right now.");
	
	if (flags["FISI_TALK_PARENTS"] != undefined) addDisabledButton(7, "Parents", "Parents","You don’t think it would be a good idea to bring up bad memories again with Fisianna.");
	else if (flags["FISI_TRUST"] >= 90 && flags["FISI_TALK_BG"] != undefined) addButton(7, "Parents", topicParents);
	else addDisabledButton(7, "Locked", "Locked","You don’t know her well enough to talk about this yet.");
	
	processTime(13);
	addButton(14,"Back",talkBack);
}

public function topicParents():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	if (flags["FISI_TALK_PARENTS"] == undefined)
	{
		flags["FISI_TALK_PARENTS"] = 1;
		flags["FISI_TRUST"] += 5;
		if (flags["FISI_TRUST"] > 100) flags["FISI_TRUST"] = 100;
	}
	
	output("From the past conversations you have had with Fisianna, it has become increasingly apparent whenever the subject was brought up that she has held some sort of angst against her parents. You have known each other for a good while, but you can see that whatever happened back then with her parents is still eating her up. After a brief moment of thought, you decide it would be best to try to relieve her of that pain and bring the subject to light. You place a hand on her shoulder and squeeze gently while giving her a serious look.");
	output("\n\nAs tactfully as you can, you attempt to persuade Fisianna to open up. <i>“Fisi, are you ready to talk about what happened with your parents? I know it might be a tough topic for you to bring up, but I don’t think you keeping it in is very healthy either, and frankly it’s unbecoming to see your face go sour at their mention. Please tell me what happened with them if you can. You can trust me as always. I won’t judge.”</i>");
	output("\n\nFisianna fidgets nervously under your touch and looks away to the ground in front of her for a long moment. She turns to you afterwards with a pained frown on her face. <i>“Mmm... O-ok, I think I can tell you... I-I still feel terrible for what happened then but... you’re right. I can’t keep it in forever.”</i> Fisianna sighs the longest sigh you think you have ever heard her utter and looks down at her lap before she continues.");
	output("\n\n<i>“W-well... I suppose it started in my early teens, when I was first developing my interest in computer technology. Around then my brother and sister were both finishing college to get their degrees in medicine. Those two were at the top of their class. Job offers were already being thrown to them from anywhere you can imagine, even before they graduated. My parents... they were the happiest I’ve ever seen them. Rightfully so, too. Any parent would be really proud of their children in that situation.”</i> Fisianna shifts her gaze towards the palm trees ahead.");
	output("\n\n<i>“I was happy for them too, of course. I still am! They’re some of the best at what they do... in fact, as far as I’ve known, in my family we all have been really successful when it came to practicing medicine, even past my great-great-great grandparents’ generation. So... yes, of course my parents also practiced medicine as well. Family tradition and all that.”</i>");
	output("\n\nYou start to piece two and two together from what she just explained, but Fisianna continues all the while staring ahead with a distant look in her golden eyes. <i>“So, y-yeah... Of course my parents were trying to condition me to follow in their, and my siblings’, footsteps too. They would try to cram any medical book they could into me while growing up. They also got me any tutors they could get to try to raise my knowledge of medicine as fast as possible so that I could go to the most prestigious medical schools. I... I just didn’t share their passion when it came to medicine. I-I guess I should tell you when I exactly started getting interested in technology, huh?”</i> Fisianna gives you a wan smile. You nod in response, listening intently.");
	output("\n\n<i>“W-well... I suppose it started when I was at the end of one of my tutoring sessions. I had a tablet that I worked off of to study my notes. Well... right after the tutor left, I went to take it out of its casing since I heard something loose in it. I wound up dropping the thing clumsily and it fell apart on me. Parts were everywhere. I was so scared that if my parents found out I broke it, I would get in big trouble... So I tried to piece it back together myself.”</i>");
	output("\n\n<i>“And were you able to do so?”</i> You ask in curiosity.");
	output("\n\nFisianna’s expression brightens and she gives you a prideful smile. <i>“You bet I did! Thankfully, the screen wasn’t broken so it made things a lot easier. Even better yet, the only tools I had available to me at the time were just a few medical supplies from an earlier lesson. Had to use just those tools to mend it. It was almost like... ‘mechanical surgery’. When I finished repairing it, the loose part was secure in place and my tablet was working faster than it ever did before! When I fixed it up I just knew that repairing and piecing together technology was for me. It was SO much fun!”</i>");
	output("\n\nFisianna starts to giggle at what must be the shocked expression on your face. She wasn’t exaggerating when she said that she was considered a tech genius.");
	output("\n\n<i>“Yeah, I know it’s an impressive feat. I wanted to show my parents so badly what I just did. Sure enough, when I went to tell them what I did, I was expecting them to be just as impressed. Well... I-I was dead wrong.”</i> Fisianna’s smile very rapidly deflates to a sad frown. <i>“When I showed the tablet to my parents and told them what I did to it, guess what they did? They scolded me... They scolded me for using the medical supplies improperly, telling me they were expensive materials and that I needed to better respect the equipment that can save lives. They even punished me for a whole month for that. I... I felt so crushed. I already felt like the one thing I was really passionate for in my life was just... stomped out... and so casually... just like that.”</i>");
	output("\n\nFisianna’s face by this point is contorted with a mix of anger and sadness as tears start to well up in her eyes from the painful memory. <i>“E-ever since then... my parents and I just grew very distant. I-I barely talked to anyone if at all. Meanwhile, my interest for technology continued to grow as I would try to find anything that was broken and fix it. I would steal my dad’s toolkit whenever I did find something. If I didn’t find anything that was broken, I would just fiddle with random computerized appliances, take them apart and piece them back together again, without my parents’ notice of course. My brother and sister noticed my change in behavior after a little while and I think they might have secretly convinced my parents to get me a cat to try to cheer me up. My parents were never really the type to keep pets, as they were strictly conservative, so the only other ones to have any sort of influence over them must have been my brother and sister.”</i>");
	output("\n\nFisianna looks down to her lap as she wipes a paw on her face to keep a tear from streaming down her face. <i>“When I got Isis, I... I instantly fell in love with the little cat. She was just so cute. I momentarily forgot all about my past pains while I had her. We played together all the time, and for the time I had her, I was content. Well... that was until when I just about turned 18 and was almost done with basic schooling. Isis... she passed away around then. All that past pain just came back to me... a-and it hit me like a ton of bricks. I-I was an emotional wreck. By then, my parents had already picked out a college for me to go to continue my medical education, but I didn’t want to go. I was very opposed to it, and I told them as much. W-we... got into a huge fight after that. My brother and sister weren’t around by then to stick up for me. It’s a miracle I wasn’t kicked out of my house after that argument... v-very hateful things were said that I would rather not repeat... I did the only thing that I could think to do after that; which was to call my brother and sister. I told them about the argument and about my interest in tech. Thankfully, they were really understanding of the situation I was in. They also must have had a good amount of connections already because within a few days after telling them this, they got me an on-campus setup at one of the most prestigious tech schools on Terra. I took that offer within a heartbeat and... ran away from home shortly after.”</i>");
	
	processTime(15);
	addButton(0, "Next", topicParents2);
}

public function topicParents2():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	output("<i>“While I was in college, I took on some repair jobs here and there to earn my keep. I mostly kept to myself when it came to interacting with others though, as I was still reeling from the loss of Isis and the argument with my parents. I just wanted a way to sort of... honor my memory of when I had Isis, so I looked on the extranet and that’s around when I found out about exotic gene mods. I was of course wary of this, but I also met a nice support group on one of the sites as well. They were college girls like me that went through things similar to what I went through and were really happy with their mod changes. I-I know it’s kind of silly to just go off of something you see on the extranet, and I wasn’t in the best state of mind, but I started to consider... changing myself the more I talked to these girls. Yes, [pc.name], they’re the very same girls you met at Anon’s.”</i>");
	output("\n\nWell that certainly sheds a new light on why she is with such an exotic group of girls. <i>“We talked a lot during my time in college. Funnily enough, besides my brother and sister, they were the only other people I’ve really interacted with much in my life.”</i> Fisianna shakes her head violently from side to side as if to shake something off before she continues. <i>“A-anyways, when I was almost done with college, I decided by then that I would get those transformative mods that could make me reminiscent of a nekomata. Of course it was as expensive as ever, but I saved up every " + (isAprilFools() ? "dogecoin" : "credit") + " from any job that I could get while working on all of my exams.”</i>");
	output("\n\nYour mind is spinning with the thought of the sheer amount of work and time that must have taken for Fisianna to reach this point in her life. She is definitely one of the most hard-working people you believe you have come across so far. Shaking the thought out of your head, you encourage her to continue.");
	output("\n\n<i>“When I graduated out of college and got my degree, about a week later I went and got my mods and transformed myself into what you see now. I felt it was an appropriate time as I conquered the hardest part of my life at that moment. My friends couldn’t be happier with me. My brother and sister were supportive of me all the way, transformation and all. When they suggested to me to try to get in contact with my parents again to tell them the good news, my heart froze... I hadn’t talked with them ever since I ran away. I trusted my brother and sister enough to at least give it a try though. It was the highest point in my life, despite it being against their wishes. I figured I could at least tell them I was successful walking my own path too. ...Worst decision of my life...”</i>");
	output("\n\nUh-oh... Whatever Fisianna has to say next can’t be good at all from what you have heard about her parents so far. She looks to be on the verge of tears again, though you feel she will definitely be pushed over the edge this time and consider that she may make a scene in public if that does happen.");
	output("\n\n<i>“We can stop here if you want, Fisianna. If the memory is getting too painful for you, we can always pick this up again another time.”</i> You attempt to persuade her.");
	output("\n\n<i>“...N-no... I-I want to keep going. I-I want to get this off my chest so... so badly.”</i> Fisianna struggles greatly, but manages to hold on to her composure. <i>“A-anyways, when I went to call them on a video feed, I felt sick to my stomach, but I eventually got through to them. When the call started... their look of utter confusion and disgust when they saw me I don’t think I’ll ever forget. Of course I explained that it was me, their daughter, and I quickly after told them about my college days after running away and my mods and the support group, as well as telling them that I successfully graduated tech school. I started to get that same happy feeling I got when I told them about the tablet. It felt... good, if only for a brief moment.”</i>");
	output("\n\nFisianna unexpectedly slams her paw against her thigh in anger, wearing an unbecoming grimace on her face as tears start to roll down her cheeks. <i>“M-m-my parents... T-they... they just... completely disowned me. T-they told me they were just very disappointed in me a-and that I was a shame to the family name. That I s-should have just become a d-doctor like they w-wanted... and to never speak to them again u-until I became one.”</i>");
	output("\n\nAt this point Fisianna’s emotional floodgates are let fully open and she begins bawling. You quickly reach over, pulling her onto your lap, making sure she is comfortable while she sobs wetly into your shoulder. You pat her back and whisper reassuring words into her fluffy ear as she cries, telling her it is not her fault and that she made the right decision for herself and anything else you can think of to comfort her. Other passers-by occasionally look towards the two of you on the bench and give you mixed looks of concern and antipathy, though with the free arm you aren’t using to pat the neko’s back, you wave them away to not disturb the two of you.");
	output("\n\nAfter a seemingly long while, Fisianna stops sobbing into your now soaked shoulder. You take the opportunity to ask her if she is going to be okay.");
	output("\n\n<i>“Y-yeah... I think so...”</i> Fisianna wipes a rogue tear away from her eye and tries to straighten to more properly face you while still sitting on your lap. <i>“T-that... felt good to let out. Y-you’re the only person I’ve ever told this to outside of my brother and sister... e-even my other friends. T-thank you so much for putting up with me through that.”</i> She wraps her paws around you in a tight hug and does not seem intent on letting go anytime soon. You wrap your arms around her in turn.");
	output("\n\n<i>“You’re welcome, Fisi. You went through a lot. Nobody should have to go through what you did.”</i>");
	output("\n\n<i>“At least I met some great friends in the process... especially you...”</i> Fisianna murmurs into your chest. You make yourself as comfortable as possible for her while the both of you rest in silence on the plaza bench. ");
	output("\n\nYou start to hear, and <i>feel</i> vibrations coming from Fisianna as time passes. It looks like she fell asleep sometime during your embrace and is snoring into your chest peacefully. To your surprise, and delight, the vibrations you feel aren’t from her snoring, but her whole body seems to be vibrating softly; she’s purring! You smile widely while you start to stroke the feline’s hair as she rests, making her purr more intensely.");
	output("\n\nFisianna wakes up after almost an hour of cuddling. She picks her head up from your chest, still dazed from her nap. When she realizes the position she’s in on your lap, she lets out a startled yelp and quickly takes her seat on the bench.");
	output("\n\n<i>“I-I-I’m SO sorry! I didn’t m-mean to fall asleep on you! H-honest! ...I-I just... felt really comfortable. I’m sorry!”</i> Fisianna looks at you wide-eyed, desperately babbling apologies a mile a minute before you eventually calm her down. Afterwards you tell her jokingly that she was very comfortable to pet, just like a cat. The catgirl’s face turns absolutely beet red at that remark.");
	output("\n\n<i>“I-I am not! [pc.name], don’t tease me like that! You know very well how s-sensitive I am to teasing like that...”</i> Fisianna pouts.");
	output("\n\n<i>“That’s the fun in it!”</i> You exclaim to her.");
	output("\n\nFisianna gives you a soft punch to your arm, nowhere close enough to hurting you. ");
	if (silly) output("<i>“B-baka...”</i> ");
	else output("<i>“M-meanie...”</i>");
	output("\n\nYou stick out your tongue and laugh, after which Fisianna joins in, looking more relaxed than you have ever seen her.");
	
	processTime(60 + rand(10));
	addButton(0, "Next", talkFisi);
}

public function hangoutFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	//Must have >=90 trust, done all hangout options, and talked about her parents for sleepover scene - non-repeatable
	if (flags["FISI_TRUST"] >= 90 && flags["FISI_HANG_ARCADE"] != undefined && flags["FISI_HANG_SHOPPING"] != undefined && flags["FISI_HANG_MOVIES"] != undefined && flags["FISI_TALK_PARENTS"] != undefined && flags["FISI_SLEPT_WITH"] == undefined)
	{
		goSleepover();
		return;
	}
	
	output("You turn in your seat towards Fisianna to ask if she would like to go somewhere else and pass the time doing something together.");
	output("\n\n<i>“Sure [pc.name]! Where did you have in mind?”</i>");
	
	addButton(0, "Arcade", goArcade, undefined, "Arcade", "Take a trip to the arcade with her.");
	addButton(1, "Shopping", goShopping, undefined, "Shopping", "Browse the merchant deck for a place to shop.");
	addButton(2, "Movies", goMovies, undefined, "Movies", "Take a trip to the movies with her.");
	
	addButton(14, "Back", hangoutBack);
}

public function hangoutBack():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	
	output("You decide to change your mind about traveling somewhere with Fisianna.");
	output("\n\n<i>“O-oh, ok. I’m perfectly fine with staying here too. Just let me know whenever you do want to go somewhere. I’m up for anything else you might have planned.”</i> Fisianna says expectantly.");
	
	fisiMainMenu(true);
}

public function goArcade():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	moveTo("MERCHANT'S THOROUGHFARE2");
	
	flags["FISI_TRUST"] += 5;
	if (flags["FISI_TRUST"] > 100) flags["FISI_TRUST"] = 100;
	
	if (flags["FISI_HANG_ARCADE"] != undefined)
	{
		var variation:int;
		do
		{
			variation = rand(3) + 1;
		}
		while (flags["FISI_HANG_ARCADE"] == variation)
		flags["FISI_HANG_ARCADE"] = variation;
	}
	else 
	{
		flags["FISI_HANG_ARCADE"] = rand(3) + 1;
	}
	
	output("You ask Fisianna if she would like to spend some time at an arcade that recently opened up on the Merchant Deck. She enthusiastically agrees and jumps out of her seat, already walking ahead of you, causing you to have to rush to catch up with her. You laugh to yourself while you follow Fisianna to the elevator lifts.");
	output("\n\nWhen the turbo-lift arrives at the Merchant Deck, Fisianna is already bolting out of the elevator door before it can fully open, nearly knocking over an ausar in the process. She quickly apologies to the ausar with a blush on her face before she is on her way again, with you struggling to catch up.");
	
	switch (flags["FISI_HANG_ARCADE"])
	{
		//Aya
		case 3:	output("\n\nAbout halfway to the arcade, you and Fisianna run into Aya, Fisianna’s harpy friend. Aya chirps a happy greeting to the both of you, after which you ask what she is up to.");
				output("\n\n<i>“Ah, nothing much really. Kinda bored after doing some window shopping. What about you two?”</i>");
				output("\n\n<i>“We were just about to head to the arcade! Wanna come with?”</i> Fisianna asks Aya, still giddy at the prospect of going to the arcade.");
				output("\n\n<i>“Sure, I’ve got some time to kill, besides, I still kinda owe ya after I messed up our co-op progress through the campaign of CoV 8...”</i> Aya frowns.");
				output("\n\n<i>“Nah, don’t worry about it. As long as we have fun. Besides, things might go better with a bit of extra help this time around.”</i> Fisianna reassures Aya, and gives you a cute wink.");
				output("\n\nWith Aya now in tow, the three of you arrive at the arcade after a fairly short walk. When inside, Fisianna rushes to the nearest open gaming station and starts to set up a game of CoV 8.");
				output("\n\n<i>“How about a 3 player co-op campaign? Legendary difficulty. Think you can handle that [pc.name]?”</i> Fisianna inquires.");
				output("\n\nYou tell Fisianna that you are game if everyone else is and look towards Aya to receive her opinion. She looks very nervous about taking such a challenge right off the bat, but concedes to try it with the two of you anyways.");
				output("\n\nThe three of you strap on your holo-harnesses and play for the better part of an hour. Fisianna is leading the charge through hordes of enemies with you holding your own and providing support. Aya seems to be having trouble keeping up with the two of you while you play, as she more often misses her targets than hits them. You and Fisianna pick up her slack as best as you are both able to, but you have to admit that with the difficulty of play that you are on, any mistakes you make as a group are near fatal, and it is growing increasingly harder to hold your ground against the seemingly neverending tide of enemies. ");
				output("\n\nSure enough, when the three of you arrive at an enemy base, a virtual army is waiting for you, forcing the three of you retreat to cover for a long battle of attrition. When there is a momentary lapse of gunfire, Aya takes the chance to move ahead towards a different vantage point to take cover. Fisianna tries to warn her not to move out into sight yet, but it is a moment too late. The game abruptly finishes when Aya runs ahead of you, only to be blasted by a stray grenade that she failed to see. As the three of you unstrap your holo-harnesses, Aya’s feathers look slightly ruffled from the shock she received from the grenade shrapnel and the holo-harness.");
				output("\n\n<i>“Sorry about that guys... I’m not as good as you two. I’ll get better though! Promise!”</i>");
				output("\n\nYou and Fisianna reassure her that everything is fine and that you all still had a blast. After grabbing a few snacks from a nearby vending machine, the three of you decide to head your separate ways. Hopefully you’ll all progress further in the campaign next time.");
				break;
		
		//Tarariel 
		case 2:	output("\n\nOn the way to the arcade, you run into Tarariel, Fisianna’s kitsune-morph friend. Tarariel waves and bounds over to the two of you.");
				output("\n\n<i>“Heya! So, what’re you two lovebirds up to? Hopefully not gettin’ into trouble, are we?”</i> Tarariel playfully nudges you.");
				output("\n\nFisianna blushes profusely and pouts. <i>“Tara... I told you not to-”</i>");
				output("\n\nTarariel cuts Fisianna off and starts slapping her shoulder, giggling in mirth. <i>“I’m just playin’ with ya, Fisi! Sheesh!”</i>");
				output("\n\nYou speak up before Fisianna can be embarrassed further. <i>“Speaking of playing around, we were just about to head over to the arcade.”</i>");
				output("\n\n<i>“That’s great! Would you mind if I tagged along? I’m soooo boooored... Plus, I still owe Fisi an ass-kicking. Don’t think I forgot what you did to me last time on CoV 8.”</i> Tarariel scowls.");
				output("\n\nYou look towards Fisianna for her approval. Surprisingly, she has a rather smug look on her face. <i>“Fine, Tara. You can come along, but I think I’ll be the one to kick you down on your nine tails again. Maybe [pc.name] here can even put one in for me too.”</i>");
				output("\n\nTarariel smiles devilishly at you. <i>“If you aren’t even half as good as Fisi here, then you won’t stand a chance against me! Best bring your A-game, Steele.”</i>");
				output("\n\nOh boy...");
				output("\n\nWhen the three of you arrive at the arcade, Fisianna and Tarariel are both already rushing over to the nearest open gaming station and setting up a game of CoV 8. Tarariel hurries you over to them and thrusts a holo-harness into your arms when you arrive.");
				output("\n\n<i>“We’re playing adversary mode of course. Free-for-all and first to ten kills wins, so don’t you two even THINK of teamin’ up on me, even though you’ll probably need it against me!”</i> Tarariel boasts.");
				output("\n\nFisianna rolls her eyes before she puts on her holo-harness. <i>“Please, Tara... we can both probably beat you one-on-one.”</i>");
				output("\n\n<i>“We’ll soon see then.”</i> Tarariel scoffs, putting on her own holo-harness.");
				output("\n\nYou strap your holo-harness on shortly after and jump into the thick of it straight away. The game seems to stretch on for a while. The three of you are neck and neck in your kill/death spreads and not giving an inch to each other. You take turns playing cautiously and aggressively as the three of you traverse the war-torn city to find and kill each other.");
				output("\n\nAfter about an hour of time has passed, the three of you are each at nine kills; one more kill away from the game winning kill. You are all playing with extreme caution, checking each corner and investigating each foreign sound. It is tense. You decide to take the high ground in this situation and climb to the top of a dilapidated four story building to overlook the street. ");
				output("\n\nAfter about five minutes of inaction, you’re about to move to change positions when you spot Fisianna’s avatar turning the corner into your line of sight. You adjust your rifle scope and align your sights to square up with Fisianna’s head. You’re about to take the game-winning shot when you notice movement behind her. Out of the corner of your scope you see Tarariel’s avatar sneaking up on Fisianna while toting an SMG. Seeing this you are momentarily distracted with thoughts of who you would rather score the game winning kill on. You see Tarariel’s face turn into a twisted grin while she starts to charge towards the unaware neko. Fisianna simultaneously notices the light reflection off of your rifle scope and raises her weapon to try to take you down before you can down her. You have to act FAST. Without thinking about it, you quickly aim your sight off of Fisianna and focus on Tarariel. You only have mere seconds to take the shot, though you are not properly aimed yet. Fisianna and Tarariel both simultaneously start opening fire at their intended targets. It is now or never. You fire your rifle and manage to strike home, hitting Tarariel’s neck. Her still firing SMG goes flying out of her hands. Fanfare goes off telling you that you won the game as the holo-harness shuts off.");
				output("\n\nWhen you take the holo-harness off of your head, you see that both Fisianna and Tarariel have their faces etched with rage.");
				output("\n\n<i>“What the fuck, Steele?! I had Fisi RIGHT where I wanted her, and you just HAD to pot-shot me! Damn it! I SO had that game won! I almost got my revenge!”</i> Tarariel stamps a foot down and sulks.");
				output("\n\n<i>“What are you talking about, Tara? I was moments away from getting [pc.name]! You trying to shoot me in the back made me ruin my shots!”</i> Fisianna retorts.");
				output("\n\nThe two of them continue arguing for about five minutes before eventually settling down. Tarariel walks over to you and shakes your hand. <i>“Hey, it was a good game and a fun time, but next time, both of your asses are mine!”</i>");
				output("\n\n<i>“Looking forward to it.”</i> You tell Tarariel as you squeeze her hand during the handshake. Afterwards Tarariel says her goodbyes to you and Fisianna before she leaves the arcade. ");
				if (flags["FISI_LOVER"] != undefined) output("Fisianna comes up to you and hugs you while giving you a kiss.");
				else output("Fisianna comes up to you and quickly hugs your arm.");
				output("\n\n<i>“By the way, thanks for saving me back there, even though you could have shot me. I didn’t want Tarariel lording it over me if she did manage to win. She still hasn’t been able to beat me yet, but that’s the closest she’s come to breaking my win streak over her, so thanks for also saving me from that too!”</i> Fisianna gives you a wide smile and a giggle as she lets go of your arm.");
				output("\n\nYou and Fisianna walk out of the arcade with smiles on both of your faces. It looks like the three of you had fun after all!");
				break;
			
		//Britannia
		case 1:	output("\n\nWhen you arrive at the arcade, you find Britannia, Fisianna’s dragon-morph friend already standing outside of the entrance talking to an ovir. The dragoness and the ovir exchange what look like pieces of paper with each other before going their separate ways. Britannia notices the two of you shortly afterwards and walks over to greet you both.");
				output("\n\n<i>“Hey, Kitten. Steele. Looks like you two are up to something, and judging by the look on the kitten’s face, it looks like you two are about to play some games together.”</i>");
				output("\n\nYou blink in amazement at Britannia’s perceptiveness, but before you can say anything about it, she laughs gently and swings her arms around you and Fisianna. <i>“Hehe. Don’t mind that. If you <b>are</b> about to play some games, would the two of you mind if I joined? So far the gamers I’ve come across aren’t really... competent to be perfectly honest. It would be refreshing to have a bit of a challenge, especially from the two of you.”</i>");
				output("\n\nYou turn your head towards Fisianna, who looks nervous. <i>“S-sure, but knowing you, I’d probably get creamed again... How about we just play something where we can work together?”</i>");
				output("\n\n<i>“Mmm, sure. I can do that too. How about you, Steele?”</i> Britannia asks.");
				output("\n\nYou tell Britannia that you don’t have a problem with that idea and ask for any suggestions on what game you all should play together. Fisianna is the first to speak up.");
				output("\n\n<i>“O-oh! I know of something that could be fun for the three of us! I’ve been following it for a while, it’s called Castle Mania. It’s a virtual reality game mostly based off of ancient terran mythology. Basically you can fight as warriors, mages, and archers that use holy artifacts to combat waves of demons and to fight the evil vampire terrorising the town. I-I know it sounds kinda cliche but game reviewers gave it good scores. I’d like to try it!”</i>");
				output("\n\n<i>“Sounds fun. Let’s get to it then!”</i> Britannia exclaims as she lets the two of you go and struts into the arcade.");
				output("\n\nYou and Fisianna follow Britannia to the nearest open gaming station and set up Castle Mania to play on your holo-harnesses. You all pick your classes; Fisianna picking the holy mage, Britannia picking the holy archer, and you picking the holy warrior. The three of you are thrown into the action as soon as you put on your holo-harnesses.");
				output("\n\nArriving at a castle graveyard with Fisianna and Britannia, you find that you are girded with rather heavy looking armor, and equipped with a faintly glowing mace on a chain as a weapon; definitely a lot more primitive than you are used to. You also have a rather gaudy metal shield that glows as brightly as your weapon. ");
				output("\n\nYou turn towards your two companions and see that Britannia has on tight but mobile leather clothing with various pieces of cloth flowing from whatever isn’t covering her body with leather. She has two glowing daggers ready at her hips. The dragoness is already taking test shots against grave headstones with her enchanted bow. ");
				output("\n\nFisianna has on very loose robes that make you wonder how she doesn’t trip over the hems constantly. She has a holy tome that floats nearby of its own volition. It glows brightly with magical energy as she channels a spell through it to illuminate the immediate area.");
				output("\n\nThe three of you take a few minutes to grow used to your weapons and roles before you decide to continue. When you make your way to the castle gateway, the door opens by itself with a loud creak to reveal a dark foyer. You lead the way inside with Fisianna and Britannia warily keeping watch for any dangers. The door behind the three of you suddenly shuts itself with a loud <i>“BANG.”</i> The foyer candlelights suddenly burst aflame, revealing a horde of zombies and ghouls that flood out of every crack and corner that you can see. You lead the charge as the three of you battle your way through the army of minions, bashing, shooting and zapping anything that impedes your progress. Your group trudges through several dungeons while you climb the castle heights, fighting many different, scary enemies. The teamwork the three of you display is phenomenal as none of you ever come to immediate danger at all, though things grow tougher as you reach the top."); 
				output("\n\nAfter defeating a particularly troublesome demonic chimera, the three of you walk into a very ominous hallway lined with candles that seems to stretch forever. Fisianna gulps nervously as you make your way through the hallway with no more opposition springing forward to meet you. When you reach the antechamber at the other side of the long hallway, you come across a giant wooden door that is absolutely splattered with blood. You nod at Fisianna and Britannia, indicating you are ready to proceed to what looks like your final challenge. When they nod back at you, you proceed to open the oaken doors. Their hinges produce a deafeningly loud groaning noise from their long period of disuse. Well... it looks like you won’t be surprising whatever is on the other side.");
				output("\n\nThe three of you step inside the throne room of the castle, where you are greeted by a handsome, but menacing, looking vampire. The door behind you slams shut as the vampire straightens up in his throne, swirling a wine glass filled with blood in his hand.");
				if (silly)
				{
					output("\n\nYou step forward to the vampire. <i>“Die, monster! You don’t belong in this world!”</i>");
					output("\n\n<i>“It was not by my hand that I’m once again given flesh. I was called here by <b>humans</b> who wish to pay me tribute.”</i> The vampire retorts.");
					output("\n\n<i>“Tribute?! You steal men’s souls and make them your slaves!”</i> You counter.");
					output("\n\n<i>“Perhaps the same could be said of <b>all</b> religions.”</i> The vampire idly swirls the blood in his wine glass.");
					output("\n\n<i>“Your words are as empty as your soul! Mankind ill needs a savior such as you!”</i> You raise your chained mace threateningly at the vampire.");
					output("\n\n<i>“What is a man?”</i> The vampire flings his wine glass aside. <i>“A miserable little pile of secrets! But enough talk! Have at you!”</i>");
				}
				output("\n\nThe three of you raise your weapons toward the vampire, after which he rises from his throne and starts to unleash a plethora of spectral beings and unholy magics at you. You raise your shield to brace yourself against the coming miasma. Fisianna quickly channels a spell that enchants your shield to be able to protect the three of you in a wider area as long as you hold it up. From behind the enhanced shield, Britannia starts to release a volley of holy arrows at the vampire, which steadily, but surely, whittles it down. ");
				output("\n\nWhen the vampire becomes weak enough, it transforms into a shapeless aberration and launches even deadlier waves of attacks than before. The three of you hold strong while Fisianna magically heals any wounds you or Britannia sustain. The dragoness is still letting loose a steady stream of arrows while gracefully dodging any attacks that manage to slip past your shield. You do your job to protect Fisianna and Britannia as best as you can, beating back any attack that nears them. ");
				output("\n\nThe demon falters after a long fought battle and the three of you move in to deliver the final blow. You raise your mace and crush it down on the aberration’s weakest spot just as Fisianna sends down a holy ray and Britannia looses a piercing arrow. The aberration writhes in defeat after each strike hits home and lies still. The three of you quickly exit the chamber while the castle starts to collapse. You dodge and weave past the falling debris as the three of you run to the entrance. Once outside you breathe a sigh of relief when the display fades to black.");
				output("\n\nBack to the real world at last, you take off your holo-harness to check on Fisianna and Britannia. They both look windswept as they take their harnesses off, but are both wearing incredibly large smiles.");
				output("\n\n<i>“...That was-”</i> Britannia starts, but is interrupted by Fisianna.");
				output("\n\n<i>“Awesome! We <b>definitely</b> need to play that again real soon!”</i> Fisianna pumps her paws in the air excitedly while her tails flick about rapidly behind her.");
				output("\n\n<i>“I’ll say. I wasn’t expecting that game to be such a treat. And you, Steele. You weren’t bad at all.”</i> Britannia smiles warmly at you and slaps a scaled hand on your shoulder.");
				output("\n\nYou thank the dragoness for the compliment, the game, and the company. After buying a few snacks to re-energize yourselves, Britannia decides to go on her separate way, leaving you and Fisianna alone.");
				output("\n\nYou turn to Fisianna and ask: <i>“If you know of any other games like that, please let me know. That game is intense!”</i>");
				output("\n\nFisianna giggles. <i>“Sure! I’ll keep a lookout to see what’s hot and tell you about it when I see something good.”</i>");
				output("\n\nAfter reminiscing about a few key moments you shared in the Castle Mania game together, you both decide to head out of the arcade and go your separate ways after your goodbyes.");
				break;
			
		default: output("ERROR WITH RANDOM VALUE :(");
	}
	
	processTime(60 + rand(15));
	addButton(0,"Next",mainGameMenu);
}

public function goShopping():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	moveTo("MERCHANT'S THOROUGHFARE2");
	
	flags["FISI_TRUST"] += 5;
	if (flags["FISI_TRUST"] > 100) flags["FISI_TRUST"] = 100;
	
	if (flags["FISI_HANG_SHOPPING"] != undefined)
	{
		var variation:int;
		do
		{
			variation = rand(3) + 1;
		}
		while (flags["FISI_HANG_SHOPPING"] == variation)
		flags["FISI_HANG_SHOPPING"] = variation;
	}
	else 
	{
		flags["FISI_HANG_SHOPPING"] = rand(3) + 1;
	}
	
	output("You ask Fisianna if she would be up for exploring some shops in the less seedy areas of the Merchant Deck.");
	output("\n\n<i>“Sure, I-I don’t mind doing a bit of shopping with you. Shall we?”</i> Fisianna happily smiles as she rises up from the park bench. You stand up and follow Fisianna to the elevator shafts.");
	output("\n\nWhen your elevator arrives at the Merchant Deck, you and Fisianna walk down the crowded corridors wondering where to go first.");
	output("\n\n<i>“So what did you have in mind, [pc.name]?”</i>");
	
	switch (flags["FISI_HANG_SHOPPING"])
	{
		//Aya
		case 3:	output("\n\nAfter a brief moment of thought, you suggest that the two of you can do a bit of browsing for clothes.");
				output("\n\n<i>“Sure! I’ve always been a bit curious about what other races like to wear. M-maybe I can find something new for myself to wear at home.”</i> Fisianna giggles as she scans the storefronts for a good starting point for your clothes shopping spree, ears perked and golden eyes on the move. Eventually she spots a store with a garish frontal display that advertises a myriad of both cool and strange-looking clothes. <i>“How about there, [pc.name]?”</i>");
				output("\n\nYou admit that you yourself are pretty curious about what could be inside if all of these unusual clothes are being displayed outside. You agree with Fisianna to start looking in this shop first before squeezing through the crowded entrance to the store.");
				output("\n\nOnce inside, you find that the store is almost as congested as the corridor was. There are a multitude of aliens and morphs alike doing their clothes shopping. The clothes themselves are aligned in an almost endless number of rows with glitzy sales tags dotting the aisles. When a rather flamboyant outfit catches your eye, you muse to yourself that it looks the type of apparel only a self-obsessed star would wear. At that moment, you hear a familiar voice behind you calling yours and Fisianna’s name. You turn around and see that Aya is making her way down the crowded aisle towards the two of you.");
				output("\n\n<i>“Hey Fisianna! [pc.name]! Didn’t think I’d meet the two of you here! It’s crowded as all heck in here... It’s hard to get any room to stretch the wings, y’know? What’cha two up to in here anyways?”</i> Aya asks while trying to make herself small enough to let a burly thraggen squeeze past her.");
				output("\n\n<i>“[pc.name] and I just wanted to do some browsing for clothes... Although... I-I could do without the crowd. It’s kind of making me uneasy to be honest.”</i> Fisianna states nervously.");
				output("\n\n<i>“Yeah... it’s way too crowded to do anything really meaningful here. Let’s try to go towards the back of the store; should be less crowded there.”</i> Aya suggests.");
				output("\n\nYou and Fisianna agree to the idea and make your way to the rear of the shop, where there are fewer people crowding the aisles. As the three of you walk down the row of outfits, the selection of clothing seems to grow skimpier the further you go. You can see that Fisianna notices this as she starts to visibly blush. Aya abruptly stops you, squealing excitedly while she reaches towards a rack of panties and pulls out a pair of white lacy cat patterned underwear.");
				output("\n\n<i>“Ah! Fisi, these would be perfect for you! How about you get these ones? They’re not very expensive either!”</i> Aya offers the panties to Fisianna. The catgirl turns a deep shade of pink while she shakes her head and waves her paws in front of her.");
				output("\n\n<i>“N-no, thanks. They look really cute, b-but I already have some like it and-”</i> Fisianna cuts herself off as she comes to a realization over what she just said. She gasps and claps her paws over her face, which is a deep red by now. <i>“P-please tell me you didn’t hear that, [pc.name]...”</i>");
				if (pc.isNice()) output("\n\nYou tell Fisianna a white-lie that you didn’t hear a thing over the crowd of people. Fisianna looks visibly relieved after hearing that as she exhales deeply. ");
				else if (pc.isMischievous()) output("\n\nYou tell Fisianna while doing your best to keep a straight face that you might have heard something, but it wasn’t very clear over the crowd of people. Fisianna looks visibly relieved after hearing that as she exhales deeply. ");
				else output("\n\nYou tell Fisianna that you definitely heard her say something about panties, but you couldn’t hear clearly over the crowd of people. Fisianna still looks embarrassed after you tell her this, but relaxes a little once you don’t say anything else about the issue.");
				output("\n\nAfter Aya places the cat print panties back on the rack, she walks further down the aisle before stopping to take out a pair of tight looking mini shorts. <i>“Oooh! Let me go try these on! I might get these!”</i> Aya exclaims giddily while she hurries over to the changing rooms. You and Fisianna browse the unmentionables for a little while longer before Aya comes out of the changing room with a grim look on her face.");
				output("\n\n<i>“I... I accidently ripped the pants. Darned talons got caught on the pant leg. I’ll have to pay for this thing.”</i> Aya says glumly. Sure enough the pants she holds up have a rather large gash in front of one of the legs. If it were touched up a little, it could still look fashionable.");
				output("\n\n<i>“Aw... I’m sorry that had to happen, but I can try to fix them for you if hand them to me?”</i> Fisianna offers.");
				output("\n\nAya gives a light chuckle, <i>“That’s ok, Fisi. I know you’re a genius at fixing computers, but I’m pretty sure I can get these pants looking good. This happens a bit too often for me... Thank you though!”</i>");
				output("\n\nThe three of you make your way back through the crowded aisle to the checkout counters. It takes a while for it to be your turn to check out, but when the three of you arrive at the register, Aya shows the rip to the cashier and offers to pay for the pants. The cashier disinterestedly throws the garment into a bag and accepts Aya’s " + (isAprilFools() ? "dogecoin" : "credit chit") + ", bidding you a farewell after the transaction.");
				output("\n\nWhen the three of you make it to the entrance of the store, Aya thanks you and Fisianna for the company before she goes home to repair her new pants. Fisianna also says her goodbyes to you when you arrive at the elevator lifts and thanks you for spending your time to shop with her.");
				break;
		
		//Tarariel 
		case 2:	output("\n\nAfter a brief moment of thought, you suggest that the two of you could check out the local food shops and grab a bite to eat.");
				output("\n\n<i>“Sure, [pc.name]. To be honest, I was feeling a bit peckish. I wonder if they have some decent chicken wings here. Even a nice salmon would hit the spot.”</i> Fisianna’s mouth begins to water at the thought having one of those delicacies while she licks her lips in a rather cute, cat-like manner. She notices you looking and blushes in embarrassment at her literal slip of the tongue.");
				output("\n\nThe two of you browse the corridors of the Merchant’s Deck for a suitable food place to satisfy your palates. You eventually come across a homely-looking diner that looks like it just recently opened up. There are signs along the entryway advertising grand opening sales on special entrees. When you [pc.walk] through the doors, you immediately run into a familiar face: it’s Tarariel. She turns around when she hears the jingling of the doorbells and her face lights up before she hurries over to the both of you.");
				output("\n\n<i>“Fisi! Steele! Great seein’ ya here! I assume ya’ll are here for a bite to eat? Yeah, me too! Let’s go! I’m starvin’!”</i>");
				output("\n\n<i>“...Uhm.”</i> Is all Fisianna can muster out of her mouth before Tarariel grabs her by the wrist and drags her to a nearby table. She looks at you helplessly while she takes a seat opposite to Tarariel at the table. You take your seat next to the hapless catgirl and subtly shrug back at her as Tarariel looks over a menu. You take a menu off of the table and browse at the selection. Eventually you come to the decision to order a steak with the trimmings, but before you can do anything else, Tarariel gasps aloud and calls to you to grab your attention.");
				output("\n\n<i>“Oh! Oh! Steele, look at this! They have the traditional 72 ounce steak challenge here! We oughta try it! Fisi, you too! It’s potentially free food if you can do it!”</i> Tarariel is practically bouncing in her seat. Fisianna looks the polar opposite in emotions to the fox-girl, frowning at the prospect of eating a giant slab of prime beef.");
				output("\n\n<i>“I-I’m ok Tara... I know for a fact that I wouldn’t be able to eat that much in such a short time.”</i> Fisianna groans.");
				output("\n\n<i>“Fair enough, Fisi... What about you Steele? You " + pc.mf("man", "woman") + " enough for the challenge?”</i>");
				output("\n\nAgainst your better judgement, you consider taking the challenge yourself, if Tarariel’s taunting wasn’t enough of a reason. After a short moment of thought, you tell her that you’ll attempt to take the challenge as well.");
				output("\n\n<i>“My kinda " + pc.mf("guy", "gal") + "! You picked a good one, Fisi!”</i> Tarariel unsubtly winks at Fisianna. The shy feline next to you blushes intensely and looks down at her menu, avoiding eye contact with you. The waitress arrives shortly after and takes each of your orders. At the mention the steak challenge, the waitress raises a knowing eyebrow at you and Tarariel. She smiles as she collects your menus and sashays back to the kitchen. After about fifteen minutes, she comes back with both steaks in hand, as well as Fisianna’s modest portion of grilled salmon.");
				output("\n\n<i>“Dig in, and good luck!”</i> She winks and presses a button that is set on the steak platters, which activates a holo-panel timer that sets to thirty minutes... Wait, only thirty minutes?!");
				output("\n\n<i>“Oh, it’s mostly to account for those species that have especially fast metabolisms, so we halved the time limit. Wouldn’t want to make it <b>too</b> easy on ‘em, or else we’d be out of business pretty quick.”</i> The waitress explains.");
				output("\n\n<i>“Doesn’t bother me, ma’am! I love the extra challenge!”</i> Tarariel excitedly exclaims, her mouth already watering at the succulent steak in front of her. You on the other hand are starting to feel differently about this. The waitress leaves you alone with your food and sashays over to a nearby table to serve them.");
				output("\n\n<i>“Hey! Hey, Steele! Let’s make it interesting! Let’s race to see who gets done first!”</i> Tarariel giddily challenges you, all the while eyeing her steak like a fierce predator that is about to go in for the kill. Goodness, this fox-girl knows no bounds! You look nervously at Fisianna, who has a look of concern etched on her face as she looks at the steak, then at you. Before you can think about backing out, Tarariel snaps her fingers, bringing both Fisianna’s and your attention back to her.");
				output("\n\n<i>“Hey, Fisi! Count us down! This is gonna be such an epic steak!”</i> Tarariel says as she readies her knife and fork. You sigh since there doesn’t look to be any way to back out of this now. You ready your own utensils as Fisianna sheepishly counts the two of you down.");
				output("\n\n<i>“U-um... three... two... one... go.”</i> On the word go, Tarariel is already savagely cutting off a big chunk of steak and chomping it down. You work on your own slab of beef, sawing off a piece and taking a bite. The meat tastes absolutely wonderful to you! It has just the right amount of tenderness and moistness as well as spices. You gulp down your first bite. It slides down your throat with relative ease. You’re beginning to think this won’t be so bad after all and quickly move on to your second bite.");
				output("\n\nAbout halfway through, you are starting to feel rather full, despite your carefully timed eating pace. Tarariel is about three-fourths done her steak and shows no signs of slowing down. You take a deep breath to gather your bearings and concentrate.");
				output("\n\n<i>“Not givin’ up now, are we, Steele?”</i> Tarariel smiles smugly at you after finishing a bite. You shake your head as a burp nearly escapes your mouth, which you silence by passing it through your nose. Fisianna is already done her salmon and watching the two of you eat, with more worry for you than Tarariel.");
				output("\n\nWhen you arrive at the twenty-eight minute mark, Tarariel slams her knife and fork down as she finishes the last bite of her steak. She punctuates her triumph over the challenge with a loud belch that could likely be heard throughout the entire diner. You are on your last bits of meat, which you estimate is about two more bites left. You decide to save these for the last minute or so, since your stomach feels almost ready to burst from all of the food.");
				output("\n\n<i>“Whew, that was great! I’m gonna need to work out for the next week straight to burn all this off. Looks like I win the race at least! C’mon, Steele! Only a couple bites left! You can do it!”</i> Tarariel cheers you on. Fisianna on the other hand is gripping your arm tightly in anxiety. You nod to her in reassurance that you will be able to finish the steak.");
				output("\n\nWhen the timer hits twenty-nine minutes, you take one of the last two pieces of beef and slowly chew it, tenderizing it as much as possible before gulping it down. It’s not as easy going down as it was to start off, but you manage to swallow the bite of steak down.");
				output("\n\nThirty seconds left on the timer. You pick the last piece up and shove it in your mouth, tenderizing the meat as much as possible before time is up. Ten seconds left. You swallow the steak in bit by bit, fighting to keep each morsel flowing down your throat. Five seconds. You down the last piece remaining and open your mouth to Tarariel to confirm you swallowed it. The timer stops with only a few seconds to spare, confirming you have eaten the whole steak. Your vision starts to swim. You can barely make out Tarariel cheering for you and in the very next moment you hear a worried gasp next to you as everything starts to fade to black...");
				output("\n\nWhen you come to, you are greeted by a warm, fuzzy feeling going through your [pc.hair], as well as a gentle breeze blowing in your face. You open your eyes to see Fisianna’s visage looking back at you, etched with anxiety. She has your head rested on her lap as she gently pets you, occasionally running her paws through your [pc.hair]. One of her tails is rapidly waving back and forth over you while fanning air to your face with a menu. ");
				if (silly) output("It looks like you came down with a case of the ‘itis. ");
				else output("It seems like you passed out after finishing the steak.");
				output("\n\nWhen you stir, Fisianna stops fanning you with her tail and eases you up to a sitting position. You are still in the diner from what you gather, but Tarariel is already long gone.");
				output("\n\n<i>“I-I’m sorry for that, [pc.name]. Tara can tend to get on a competitive streak too much for anyone’s good. Y-you didn’t have to take her challenge...”</i> Fisianna still looks at you with unease on her face.");
				output("\n\nTo ease Fisianna’s worries you tell her lightheartedly that you are fine and that you got a free steak out of it regardless, so everything worked out well. She sighs in relief and visibly relaxes.");
				output("\n\n<i>“Still... remind me to not eat another steak for at least a week.”</i> You request to the feline jokingly. Fisianna giggles at this.");
				output("\n\n<i>“Agreed.”</i> After Fisianna swipes her " + (isAprilFools() ? "dogecoin" : "credit chit") + " on the bill for her salmon, the two of you head out of the diner, thanking each other for the company and saying your goodbyes before going your separate ways.");
				break;
			
		//Britannia
		case 1:	output("\n\nYou try to think of something the two of you can shop for, but nothing immediately comes to mind. You shift the question back to Fisianna.");
				output("\n\n<i>“O-oh... um... hm...”</i> It seems like Fisianna wasn’t prepared to do any shopping for her own needs. She stands on the spot lost in thought for a while before she comes to a decision.");
				output("\n\n<i>“W-we could go to a hardware store or something. I kinda need more replacement parts for this droid that I’m building on the side. T-that is if you wanted to go too?”</i> Fisianna looks at you expectantly.");
				output("\n\nYou nod your head in agreement since you can’t think of anything else the two of you can do, plus it wouldn’t hurt to help her out as well. The two of you walk a little ways before reaching the nearest hardware store that you find. Once inside, she turns to you.");
				output("\n\n<i>“Alright. What I need to get are parts for a new processing core, some spare coupling wires, a bit of silicone, and I need a new welding torch. Mine burned out just recently. They shouldn’t be too hard to find, I imagine anyways...”</i> Fisianna perks her ears and does a quick visual scan of the shop. <i>“Yeah, I’m confident we’ll find what we need here. Let’s split up and look then. It might make things a bit faster that way, yes?”</i>");
				output("\n\nYou agree to Fisianna’s plan and head towards one end of the store while Fisianna searches the other. Looking down the aisles of gadgets and gizmos, you are quite amazed at the wide selection this store has. There is everything from electrified repair tools to media devices. You try your best not to distract yourself too much from the wide array of electronics and look out for the things Fisianna mentioned that she needed. Eventually you find some coupling wires, a welding torch, and some processing core parts in nearly the same area of the store. Pleased with your luck, you head towards the other side of the store to search for Fisianna and show her your finds.");
				output("\n\nWhen you arrive at the aisle that is featuring silicone on sale, you [pc.walk] down the narrow lane of branded rubbery material and find Fisianna, though she isn’t alone. From what you witness, she is in the middle of a discussion with a younger looking male human and ausar, though she seems less than pleased with the company. Her ears are downturned and her twinned tails are clung tightly to her body as she is constantly shying away from them, but they won’t give her an inch. Thinking she is in trouble, you move quickly to the catgirl to intervene. When in earshot, you can hear the ausar asking rather lewd things to Fisianna and increase your pace. The human sees you approaching and gestures to the ausar, who backs off of Fisianna and turns their attention to you.");
				output("\n\n<i>“Hey! What do you want? We’re talking science here! Ms. Kitty and I were just discussing about how we can make a little pleasure bot that can look just like her. She’s a perfect model for one! I was just asking how much silicone I’d need to capture her bust size!”</i> The ausar sneers. Fisianna shrinks and moves to hide behind you, trembling as she clings to you.");
				output("\n\n<i>“Where do you get the idea to go around asking a random person personal questions like that, especially if she’s clearly opposed to telling you?”</i> You question the ausar. You are starting to become a little hot under the collar at their brazenness for harassing Fisianna like this.");
				output("\n\nThe human steps up to you so close that you can feel his hot breath on your face. <i>“Yeah, well this isn’t any of your business, so if you ain’t gonna help, then let the little kitten answer.”</i>");
				output("\n\n<i>“You don’t mean <b>my</b> little kitten, do you?”</i> A calm and familiar, but also faintly threatening feminine voice chimes in. You see a scaled finger tap the human on the shoulder before he whirls around and comes face to face with Britannia’s smiling visage. Where did she come from?!");
				output("\n\n<i>“W-who the hell are you?!”</i> The human angrily snarls at Britannia. The dragoness doesn’t look fazed by him at all, since she is still wearing the same warm smile as when she first appeared. She does however step up closer to the man. Britannia then places her face so close to his that they are almost touching. The dragon-morph abruptly blows a puff a smoke through her nostrils that makes the human stagger back coughing. Her facial expression suddenly changes from that warm smile to an extremely, terrifyingly stern face.");
				output("\n\n<i>“The person that’s going to burn you to cinders if you don’t leave my friends alone.”</i> Britannia huffs another cloud of smoke towards the ausar to accentuate her threat. It looks like it works! The human and ausar look on in terror at the imposing dragoness standing up to them.");
				output("\n\n<i>“C’mon! This isn’t worth it, man!”</i> The ausar yelps before both he and his compatriot scramble past you and Fisianna as fast as they can. Britannia giggles and waves as they run while tripping over each other. When they turn the corner out of sight, Fisianna relaxes and comes out from hiding behind you.");
				output("\n\n<i>“T-thank you, [pc.name], a-and you as well Bri. Those two were unbearable...”</i> Fisianna sighs in relief. Britannia smiles at the two of you.");
				output("\n\n<i>“No worries, Kitten, though I imagine [pc.name] here could’ve handled it anyways. I just wanted to have a little bit of fun.”</i> Britannia laughs gently.");
				output("\n\nYou can’t help but wonder... <i>“Britannia, can you really breathe fire?”</i>");
				output("\n\nBritannia covers her mouth and opens her eyes wide in mock-surprise. <i>“Oh goodness, no! That would be incredibly dangerous, not to mention terribly expensive! I’m only modded to have some smoke sacs if I ever need to get the point across that I’m upset.”</i> Britannia winks at you. You make a mental note not to get on Britannia’s bad side if she can pull off such a convincing act.");
				output("\n\n<i>“W-what are you doing here anyways, Bri? I-I didn’t expect you to be here of all places.”</i> Fisianna asks.");
				output("\n\nBritannia scratches the back of her head as she laughs sheepishly. <i>“Well... I was actually looking for repair tools so I could fix something back home. Let’s just say I don’t know my own strength, so I’m going with the heavy duty stuff. From the looks of things, it looks like you’re doing your own fixing, Kitten?”</i>");
				output("\n\nFisianna nods her head. <i>“Y-yeah, I’m just looking for parts so that I can finish fixing a droid I was working on.”</i>");
				output("\n\nSpeaking of which, this reminds you that you have yet give the parts that you found for her. You present the items to Fisianna and hand them over to her.");
				output("\n\n<i>“That’s great, [pc.name]! Now I can finish this project off!”</i> Fisianna gives you a gentle hug and deposits the parts in a shopping bag that she is carrying. <i>“I guess that’s everything. Thank you again for the rescue Bri and [pc.name]! I should be on my way and get to work!”</i>");
				output("\n\nBritannia nods and smiles. <i>“Take care, and good luck with the droid! It was also nice seeing you again [pc.name]. Let’s all talk together again under not-as-hostile circumstances!”</i>");
				output("\n\nYou decide to escort Fisianna to the checkout and out of the hardware store after you say your goodbyes to Britannia. Fisianna gives you another hug and bids you farewell before heading home.");
				break;
			
		default: output("ERROR WITH RANDOM VALUE :(");
	}
	
	processTime(60 + rand(15));
	addButton(0,"Next",mainGameMenu);
}

public function goMovies():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	moveTo("MERCHANT'S THOROUGHFARE2");
	
	flags["FISI_TRUST"] += 5;
	if (flags["FISI_TRUST"] > 100) flags["FISI_TRUST"] = 100;
	
	output("You ask Fisianna if she would be up for watching a movie at a theater that you passed by on the Merchant Deck.");
	if (flags["FISI_HANG_MOVIES"] == undefined) output("\n\n<i>“Huh... I didn’t know a theater opened up there. On the Merchant’s Deck of all places too? That’s a weird place for a theater in my opinion, but sure! It sounds like it could be fun.”</i> ");
	else output("\n\n<i>“Sure, [pc.name]! It sounds like it could be fun.”</i> ");
	output("Fisianna rises up from her seat after you do and the both of you head towards the elevator shafts.");
	output("\n\nWhen you arrive on the Merchant’s Deck, the two of you make your way to the theater, discussing which movies you both have been wanting to see and talking about your favorite actors. You eventually arrive at the rather grandiose looking entryway of the theater. It is lined with holo-posters of popular movies, as well as schedules of when they air.");
	
	if (flags["FISI_HANG_MOVIES"] != undefined)
	{
		var variation:int;
		do
		{
			variation = rand(3) + 1;
		}
		while (flags["FISI_HANG_MOVIES"] == variation)
		flags["FISI_HANG_MOVIES"] = variation;
	}
	else 
	{
		flags["FISI_HANG_MOVIES"] = rand(3) + 1;
	}
	
	switch (flags["FISI_HANG_MOVIES"])
	{
		//Aya
		case 3:	output("\n\nThe two of you make your way inside. You are surprised to see that the theater lobby is heavily crowded. Numerous walkways lead into different screening rooms, giving you the impression that this theater is likely a multiplex. You can smell all of the delicious movie snacks being sold at the nearby stalls. As you look towards the different snack stalls, you spot a familiar flash of yellow and green feathers. Their owner turns towards you with an armful of popcorn, nachos, and soft drinks. Were they really intending on eating all of that by themselves? Upon taking notice of you, they hurry over to you, spilling a few popcorn kernels along the way. You come to realize that the feathered person is Aya, Fisianna’s harpy friend.");
				output("\n\n<i>“Heeeey! Fisi! [pc.name]! Great to see you both here!”</i> Aya chirps gleefully.");
				output("\n\n<i>“Hey Aya! I didn’t think we would see you here. Were you about to catch a movie yourself?”</i> Fisianna asks Aya, all the while eyeing the snacks in the avian’s arms.");
				output("\n\n<i>“Yeah, I was as a matter of fact! I was going to go see this great sci-fi comedy, <i>“Blubber”</i>. It’s about this scientist that’s too super busy with his experiments to pay attention to their loved ones, and they wind up modding this galotian to be super bouncy. Hey! If you two wanna, would you like to come watch it with me? I’ll share my snaaaacks!”</i> Aya asks elatedly while attempting to wave the bag of popcorn in her arms enticingly, sending even more popcorn kernels falling to the floor.");
				output("\n\n<i>“Ooooh, I have always wanted to see that one! I’ve heard Jay Williams was hilarious in this movie!”</i> Fisianna smiles excitedly. <i>“I think I’m sold Aya! How about you, [pc.name]?”</i> She asks while grabbing the box of nachos out of Aya’s arms, which unburdens her load by a little.");
				output("\n\nSeeing as it would be two versus one on any adverse decision you would make anyways, you are inclined to agree with the two girls. You grab the popcorn out of Aya’s arms so she won’t spill anymore, leaving her with the soft drinks. The three of you walk over to the ticket vendor to pay for your movie tickets. Aya steps in front with her bundle of soft drinks and offers to pay for your tickets, which you and Fisianna gratefully thank her for. Afterwards, you head towards one of the screening rooms. Once inside, you observe that the room is already very crowded. It must be a very popular movie! The three of you manage find seats in the middle of the room despite this, and Aya passes her extra drinks to you and Fisianna once everyone settles down in their chairs. Your group sits through about ten minutes of previews for other movies before the main attraction starts.");
				output("\n\nThroughout the entirety of the movie, the room is bursting with laughter at the scientist’s shenanigans. At one particular point in the film, the scientist mods a graviball with part of the galotian’s “blubber-like” like cellular structure. They send it careening across a room, knocking an innocent passerby out cold. Aya laughs so hard at this that she accidentally squeezes the soft drink bottle in her hand and sends its contents flying backwards onto an unfortunate laquine behind her. She gasps and apologises profusely with the lagomorph. You turn a sideways glance towards Fisianna, who meets your gaze halfway with a knowing smile, after which the two of you do your best to muffle your laughter. The rest of the movie runs on uneventfully from then on. When the " + (isAprilFools() ? "closing titles" : "ending credits") + " roll, the three of you make your way out of the screening room and into the theater lobby.");
				output("\n\n<i>“Ah... that movie was great! I think I’m gonna grow abs from laughing so hard!”</i> Aya remarks as she wipes tears of mirth from her eyes.");
				output("\n\n<i>“Hehe, yeah! That movie was a lot better than I was expecting! I wonder if they’ll make a second?”</i> Fisianna wonders while she throws her nacho box away into the nearby trash can.");
				output("\n\n<i>“Hopefully so! If they do come out with a sequel, you two will be the first people I invite to come see it with me!”</i> Aya exclaims excitedly.");
				output("\n\nThe three of you stick around the lobby for a little while longer, talking about your favorite parts of the movie. After the conversation winds down, you all walk out of the theater, exchanging your goodbyes and going your separate ways.");
				break;
		
		//Tarariel 
		case 2:	output("\n\nThe two of you make your way inside. You are surprised to see that the theater lobby is heavily crowded. Numerous walkways lead into different screening rooms, giving you the impression that this theater is likely a multiplex. You can smell all of the delicious movie snacks being sold at the nearby stalls. As you near the ticket vendors, you spot a familiar fiery multi-tailed figure standing in line: it’s Tarariel. She looks backwards in the line of moviegoers and her face lights up in recognition, after which she breaks from the line and strides over to the both of you.");
				output("\n\n<i>“Fisi! Steele! Nice seein’ ya two lovebirds here! How’re ya’ll?!”</i> Tarariel claps the both of you on the shoulders once she reaches you.");
				output("\n\n<i>“T-Tara... please...”</i> Fisianna groans while trying, and failing, to suppress a blush.");
				output("\n\nTarariel giggles at length before continuing. <i>“Anyways, I was actually JUST thinkin’ about you Fisi! I was about to go see this movie called <i>“The Exterminator.”</i> It’s a pretty sweet sci-fi action movie about an android with a rogue AI from an evil company known as Airnet. They send the android to the past to kill the mother of the future leader of the rebellion against Airnet’s army of androids. I thought you might like to see it, bein’ an AI techie and all!”</i>");
				output("\n\nFisianna looks both reluctant and interested at the same time while she considers if she wants to see this movie. Before she can decide however, Tarariel speaks up again. <i>“C’mon! It’s not gonna hurt ya to see it. Who knows? Maybe it might broaden your horizons a bit! What about you, Steele?”</i>");
				output("\n\nYou tell Tarariel that you are willing to see that movie if Fisianna is. The feline lowers her paw from her chin as she finishes contemplating the idea of seeing Tarariel’s movie of choice. <i>“Mmm... Okay, I’ll give this movie a chance. It does sound pretty interesting.”</i>");
				output("\n\n<i>“Great!”</i> The kitsune-morph pumps her fist in the air. <i>“Alright then, now that that’s settled, how about you two wait in line and buy us three tickets for the movie while I go get us some snacks? Figure I’d give you two some aloooone time!”</i> Tarariel winks as she passes a " + (isAprilFools() ? "dogecoin" : "credit chit") + " to you and saunters off towards the snack bars. Fisianna sighs while she avoids your gaze to suppress her blush again.");
				output("\n\nThe two of you eventually make it to the front of the long line and purchase three tickets to see <i>“The Exterminator.”</i> Tarariel makes it over with the snacks at about the same time you and Fisianna finish buying the tickets. You feed your tickets into the receptacle near the entrance of the screening room and head inside. The room is already heavily crowded. It takes a while to find three open seats but you find some near the front of the room.");
				output("\n\nThe movie starts just about when the three of you settle down and Tarariel screams in glee. The three of you sit back with your snacks and watch the movie, surrounded by cheers, gasps, and applause at the climax of each action scene. Fisianna seems glued to the screen. She is barely touching her snacks which you and Tarariel take advantage of and occasionally sneak a little helping. The fox-girl cheers especially loud near the end of the movie when the protagonists are able to finally destroy the rampaging android. Several people in the immediate vicinity of her try to quiet her down but the kitsune-morph is completely oblivious to them.");
				output("\n\nOnce the movie is over, the three of you head out into the still crowded lobby. Tarariel gives a big cheer as she raises her fist in the air. <i>“That was awesome! You guys <b>have</b> to see the sequel with me! You’re gonna be the first people I think of comin’ with me when that happens!”</i>");
				output("\n\nFisianna frowns slightly at Tarariel’s overexcitement. <i>“Mmm... it was ok. I mean... I would have to question a few things about the movie. Like in the future, how did those rogue AIs even get through proper screenings without the UGC noticing the faulty and malicious coding? They didn’t go <b>that</b> far back into the past where regulations would have been changed all that much. Why didn’t the hero bring back any sort of fail-safe to deactivate the AI first, seeing as they were fighting them in the future? I bet it would have been pretty easy to at least code <b>something</b> to stop that specific AI. Also, what abo-”</i> The rambling neko is stopped short when Tarariel firmly places a hand on her shoulder.");
				output("\n\n<i>“Jeez, Fisi! Relax! It’s just a fictional movie! It’s nothin’ to get your panties in a bunch about. So what if there’s a few... inconsistencies that the movie has compared to what ya do for a livin’. Just have fun pretending from the point of view of someone who doesn’t know any better! Live a little, girl! Sheesh!”</i> Tarariel sighs with an exasperated expression on her face. Fisianna blushes when she realizes that she might have taken her ranting a little too far.");
				output("\n\n<i>“O-oh... sorry. I kinda got carried away. My inner nerd was going crazy during that entire movie and just needed to come out. Heh...”</i> Fisianna smiles sheepishly. <i>“If it helps though, I did enjoy the action scenes, and it did help me broaden my horizons a bit when it comes to developing AIs, if only by a little.”</i>");
				output("\n\nTarariel’s expression sinks to one of worry and anxiety, which is a rarity from what you’ve seen of her so far. <i>“Say... I hope that doesn’t mean that you’re gonna start makin’ an army of killer robots to try to take over the galaxy, are ya?”</i> Tarariel laughs nervously.");
				output("\n\nAt first Fisianna’s eyes open wide in shock at that suggestion, but after noticing Tarariel’s rare show of unease, she forms a sly smile on her lips. <i>“Mmm, maybe... After seeing this movie, I am definitely thinking of doing something like that, and you’ll be my first victim.”</i> The neko subtly winks at you as Tarariel shrinks back in fear. The two of you laugh off the joke while fox-girl scolds Fisianna for scaring her. After Fisianna manages to calm her down, the three of you talk about possible advancements for AI programs before deciding to call it a day.");
				break;
			
		//Britannia
		case 1:	output("\n\nThe two of you make your way inside. You are surprised to see that the theater lobby is heavily crowded. Numerous walkways lead into different screening rooms, giving you the impression that this theater is likely a multiplex. You can smell all of the delicious movie snacks being sold at the nearby stalls. Among the crowd in the lobby, you spot a familiar ebony scaled dragoness: it’s Britannia! You and Fisianna make your way over to her while she breaks away from the small group of people she was previously conversing with.");
				output("\n\n<i>“Hello, Kitten. Hello, Steele. Pleasure meeting the both of you here.”</i> Britannia greets the both of you gently. <i>“I assume that you’re here to see a movie and don’t know what to see yet?”</i>");
				output("\n\nIs this woman psionic or something?!");
				output("\n\n<i>“W-wow, you’re right Bri!”</i> Fisianna exclaims with a wide-eyed stare in disbelief at Britannia. The dragon-morph laughs gently in response to Fisianna’s expression.");
				output("\n\n<i>“Mmm, I thought so. Tell you what? Would the two of you like to see a movie with me perhaps? I was feeling in the mood for a romance movie this time around. I’ll even pay for the tickets for you as gratitude for the company. Snacks included.”</i> Britannia smiles warmly as she waves a " + (isAprilFools() ? "dogecoin" : "credit chit") + " to emphasise her point. Who are you to pass that up?");
				output("\n\n<i>“A-a romance m-movie?”</i> ");
				if (flags["FISI_LOVER"] != undefined) output("You can see Fisianna visibly blushing while trying to hide a small smile.");
				else output("You can see Fisianna visibly blushing as she tries to avoid eye contact with you.");
				output(" <i>“Erm... sure, I-I mean, since you’re offering.”</i>");
				output("\n\nBritannia’s smile grows wider while she procures three tickets from her pocket and hands two of them out to you and Fisianna. <i>“So she already brought these ahead of time? She really <b>must</b> be psionic...”</i> You wonder aloud to yourself, but it looks like Britannia caught on to your external monologue.");
				output("\n\n<i>“No, not at all. I just bought too many tickets to start with.”</i> Britannia giggles. <i>“That’s why you saw me talking with that group of people before. I was wondering if they wanted to see it with me, but well... I think some people find me a little too... imposing to believe me to be interested in romance. Plus, I saw you two come in the theater so I thought it would be nice to treat two of my best friends, hm?”</i>");
				output("\n\nShe brings up a fair point. A suspicious, but still fair point. Before you can ponder on which side to believe, Britannia motions over towards the snack bar. <i>“I’ll go and buy us all some snacks to keep us entertained. You can go on in ahead of me and find us seats. I’ll be able to spot the both of you.”</i>");
				output("\n\nFisianna nods in agreement and leads you over to the screening room where your movie is airing. Once inside, you notice the room isn’t terribly full like the lobby was. There <i>are</i> a lot of couples seated together as you would expect. Some of them are already engaged in make out sessions. Fisianna notices this as well and the blush on her face darkens even more.");
				output("\n\n<i>“L-let’s just find room for all three of us, yeah?”</i> Fisianna asks sheepishly, trying to shake away the sight of the embracing couples in the screening room. The both of you make your way towards the first set of three seaters open near the entrance so it would be easier for Britannia to spot you when she comes back with the snacks. When the two of you sit down, you sit in ");
				if (flags["FISI_LOVER"] != undefined) output("silence, holding hands");
				else output("awkward silence");
				output(" for the good part of a minute before Fisianna speaks up.");
				output("\n\n<i>“U-um, [pc.name]?”</i> Is all she can manage to say before Britannia shows up with snacks in hand, and boy, she bought a <i>lot</i> of snacks!");
				output("\n\n<i>“Hehe, enjoy!”</i> The generous dragoness giggles as she passes the snacks around to you and Fisianna. She finishes just as the movie starts up, prompting all the embracing couples in the room to pay attention to the screen.");
				output("\n\nFor the most part during the movie, nothing happens outside of the norm for typical romance flicks. When the main characters reunite after a lengthy separation from each other and share a passionate kiss, most of the couples in the theater join in their example as well, turning the screening room into a softcore orgy. While observing this, you catch a glance at Britannia, who is already shooting you a look with a knowing sideways smile on her face. Before you can confirm if she is leading you on, she winks and makes a subtle gesture with her head pointing towards Fisianna. Turning the opposite way, you just manage to see Fisianna leaning slightly towards you with an expectant look in her eyes. A split second later, she realizes what she is doing and her eyes widen before she turns around rapidly, covering her face with a wave of orange and white hair. Britannia giggles before she turns back to the screen and eats a bite of popcorn. The movie finishes shortly after the actors finish kissing and the three of you make your way back the lobby.");
				output("\n\n<i>“Well, that was fun! Hopefully I can run into the two of you again to catch another movie. For now, I believe I’ll leave the two of you alone.”</i> Britannia says with a wink to you. <i>“I’m definitely going for another movie before I retire.”</i> She adds while she walks towards the ticket booth again. You and Fisianna thank her for treating you to a free movie and turn towards each other. Fisianna still has the remains of a bright blush on her face from earlier. With you and your feline companion alone, you have to wonder.");
				output("\n\n<i>“So, Fisi. What were you about to ask me when the movie was about to start?”</i>");
				if (flags["FISI_LOVER"] != undefined)
				{
					output("\n\n<i>“O-oh... I was just going to ask if you if you wanted to kiss me.”</i> Fisianna blushes even more profusely while fidgeting on the spot. You lightly chuckle at this and lean in to plant a gentle kiss on the shy kitten’s peachy lips. She takes your smooch in earnest, leaning in to your body to kiss you back just as passionately. After the two of you break the kiss, Fisianna smiles back at you warmly in gratitude.");
					output("\n\n<i>“Thank you so much for that sweet treat, [pc.name]. I had a fun time with you. I hope we can do this again. For now, I’m a little tired so I think I’ll go home and rest, okay?”</i>");
					output("\n\nYou nod in acknowledgement, happy to have satisfied Fisianna’s request. You bid her farewell when the two of you make it back out of the theater and by the elevator shafts on the Merchant Deck.");
				}
				else 
				{
					output("\n\n<i>“O-oh! Uh... N-n-nothing!”</i> Fisianna stammers nervously. You are about to press her when she backs away a step, almost running into a passerby. After profusely apologising to them, her blush deepens in embarrassment. ");
					output("\n\n<i>“I-I had a fun time with you, [pc.name]. I hope we can do this again. For now, I’m a little tired so I think I’ll go home and rest, okay?”</i>");
					output("\n\nYou nod in acknowledgement, deciding not to press her on the issue after all, since she seemed quite nervous about it. You bid her farewell when the two of you make it back out of the theater and by the elevator shafts on the Merchant Deck.");
				}
				break;
			
		default: output("ERROR WITH RANDOM VALUE :(");
	}
	
	processTime(120 + rand(15));
	addButton(0,"Next",mainGameMenu);
}

public function goSleepover():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	flags["FISI_TRUST"] += 5;
	if (flags["FISI_TRUST"] > 100) flags["FISI_TRUST"] = 100;
	
	flags["FISI_SLEPT_WITH"] = 1;
	
	output("You rack your brain trying to think of something else for you to do with Fisianna. So far you’ve had fun playing at the arcade with her, as well as shopping and watching some movies. In the middle of thinking of what new thing the two of you could do together, you spot all three of Fisianna’s friends coming up the walkway towards the both you. Upon seeing you and Fisianna sitting on the park bench together, their walking pace starts to quicken, though you can see Tarariel among them making a running beeline at you.");
	output("\n\n<i>“Heeeey! Fisiiii! Steeeeele!”</i> She yells as she runs over to hug Fisianna, and then you. Aya and Britannia catch up shortly after and offer their greetings.");
	output("\n\n<i>“So what’cha both up to?”</i> Aya asks while she absentmindedly sips a drink she has in her hand.");
	output("\n\n<i>“O-oh, nothing. We were actually just trying to think of something to do ourselves. I-I guess since you’re all here we can all think up something to do together.”</i> Fisianna proposes.");
	output("\n\n<i>“Actually, the three of us were thinking about doing something a little... different this time, that is, if you would be up for it.”</i> Britannia says with a slight smile on her face. <i>“You don’t have to do it if you wouldn’t want to, Kitten.”</i>");
	output("\n\nFisianna looks at Britannia in curiosity as she wonders what she and the others were intending to suggest. The catgirl doesn’t have to wait long until Tarariel speaks up.");
	output("\n\n<i>“Fisi! We were thinkin’ of havin’ a little sleepover tonight. You can even come along if you wanna, Steele!”</i>");
	output("\n\n<i>“A-a sleepover? Aren’t we a little... old to-”</i> Fisianna starts to question before she is cut off by Tarariel.");
	output("\n\n<i>“Yeah, yeah. We know, but it’s not like any of us had much of a childhood to enjoy to begin with anyways.”</i> Tararial says with a small frown on her face. Her frown is gone just about as soon as it came when she continues. <i>“Anyways, we thought it might be a good idea to just spend a night with each other, y’know? Play a few games, watch some shows, have a good ol’ pillow fight maybe. Stuff like that, yeah?”</i>");
	output("\n\n<i>“Sounds like a lot of fun when you put it that way, Tara!”</i> Aya pitches in. <i>“Though do you know who would be hosting said sleepover?”</i>");
	output("\n\n<i>“Hm... I haven’t thought that far into it...”</i> Tarariel laughs sheepishly. <i>“Well, my place is messy beyond repair so I won’t be able to host it tonight...”</i> She says with a shrug.");
	output("\n\n<i>“I’ve still got a bunch of feathers that need cleaning up from my last molt so... it’s a no-go for me.”</i> Aya adds with a disappointed tone in her voice.");
	output("\n\n<i>“Mmm... my place is still being de-fumed as well... It smells too much of smoke. I wouldn’t want you all to deal with that.”</i> Britannia says with a slight cough.");
	output("\n\n<i>“So... d-does that mean you want me to host the sleepover?”</i> Fisianna asks quietly. <i>“I-I mean I think my apartment is in a better shape than all of yours, so I suppose I could. I would still need to get it ready and all. This is coming rather suddenly.”</i>");
	output("\n\n<i>“So you’ll do it? Awesome! I’m gonna go get some sleepwear ready and bring a game or two with me! This is gonna be soooo great!”</i> Tarariel jumps in the air excitedly and starts to run towards her home before she is cut off by Aya.");
	output("\n\n<i>“Whoa there... hold on. Fisi didn’t even say yes yet! Calm down, girl!”</i> Aya explains to Tarariel as she tries to hold her down from trying to run home.");
	output("\n\nBritannia walks over to Fisianna and places a comforting hand on her shoulder. <i>“Again, you don’t have to do it if you don’t want to. It’s up to you, Kitten.”</i>");
	output("\n\nAfter a brief moment of thought, Fisianna smiles up to Britannia. <i>“Yeah, why not? I suppose I can host a sleepover at my apartment. It does sound like fun. [pc.name], of course you can come along as well if you’d like to?”</i>");
	output("\n\n<i>“Sure, I don’t have a problem with that.”</i> You tell Fisianna. The catgirl smiles widely at hearing this.");
	output("\n\n<i>“Great! Then it’s settled. Let’s meet at my house tonight then. I should go home and tidy up anything I need to and get things ready for the sleepover.”</i>");
	output("\n\n<i>“Nice! I should go get ready then. Meet you all there!”</i> Aya waves after she lets go of Tarariel, who continues running towards her home without another word. Aya tails after her, and you can faintly hear them arguing as they disappear out of sight.");
	output("\n\n<i>“Thank you Fisi for doing this for all of us. We’ll make it up to you someday.”</i> Britannia smiles warmly while she gently squeezes Fisianna’s shoulder.");
	output("\n\n<i>“Dont worry about it, Bri. I have a feeling this will be a great night for us. Ah, [pc.name]! I almost forgot to tell you, my apartment number is 124. It should be by the Northern walkway!”</i> Fisianna shoots a parting smile at you before rising up from her seat to run home and prepare for the sleepover.");
	output("\n\n<i>“I shall see you there, Steele. Let’s have some fun, shall we?”</i> Britannia winks at you before she turns away and heads towards her own home to prepare. You have your own preparing to do, so you head back to your ship and pack whatever is necessary for your night out and keep yourself occupied until it is time to meet up at Fisianna’s apartment.");
	
	addButton(0, "Next", goSleepover2);
}

public function goSleepover2():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	moveTo("RESIDENTIAL DECK FISIS APARTMENT");
	
	output("When the time arrives for Fisianna’s sleepover, you gather your belongings and make your way off of your ship wearing the best pair of pajamas you could find. You head up the elevator and out to the residential deck. Heading northwards you come across a lot of plain looking apartments while looking for Fisianna’s place. Eventually you find apartment number 124 and ring the buzzer to let Fisianna know you are outside.");
	output("\n\nWhen the door opens, you are greeted by the smiling feline. <i>“[pc.name]! I’m glad you’re here! Please come in!”</i> Fisianna steps aside to let you into her apartment. When inside you notice that all of Fisianna’s friends are already here and setting up her home gaming rig. You notice that everyone are wearing different variations of form-hugging tank tops with knee length pajama bottoms, except for Fisi. The catgirl has on an oversized baby blue t-shirt with a black paw print embroidered on the front, with matching black baggy pajama bottoms. They all give you a short hello and wave before concentrating their attention back on the gaming rig.");
	output("\n\nYou take a brief look around Fisianna’s apartment. It’s a fairly cosy space that looks like it receives a lot of love and care. There are a number of gadgets and gizmos that are neatly organized on various shelves in the living room area. At another end of the living room area are a few cleaning droids which you assume were just recently used. Fisianna has a rather comfortable home theater area set up in the middle of the room. It has a plush couch complete with glass tables opposite of a holoscreen. The gaming rig sits nearby the display, where her friends feverishly work to set it up and play. They seem to be having some trouble starting it up, however. You assume that her rig is still on the fritz.");
	output("\n\nHer dining room area looks just as comfortable with assorted fruits decorating the middle of the table. A bar-like setup next to a wide indoor window borders the living room area and kitchen. From what you can make out through the opening, her kitchen looks very modern and clean. There is a small narrow hallway past the kitchen to what you assume lead to the lavatory and bedrooms.");
	output("\n\nA cheer draws your attention back to the girls. It looks like they got Fisianna’s gaming rig fixed and set up. You already see the holoscreen displaying the title screen for CoV 8.");
	output("\n\n<i>“Fuck yes! I’ve been waitin’ for this <b>all</b> day! I hope you’re ready, Fisi! I’ll get my revenge tonight! I can feel it!”</i> Tarariel exclaims while she grabs a harness and jumps into the couch to set it up. ");
	output("\n\n<i>“You wish, Tarariel...”</i> Fisianna scoffs as you and the other girls shortly join the kitsune-morph on the couch and set up your own holo-harnesses. She sets up a free-for-all game for the five of you and you jump into it right after.");
	output("\n\nThe games go by fairly quickly since there is a big gap in skill between all five of you. Aya can’t seem to catch a break between getting caught in crossfire and flat out being in the wrong places at the wrong time. You, Tarariel and Fisianna keep a fairly even pace with each other, having a mostly equal amount of kills between the three of you, but Britannia comes out undeniably dominant over everyone. She barely ever dies during your games and racks up kills left and right. You would think that she would have military training if you didn’t know any better. Either that or she is secretly a professional gamer.");
	output("\n\nAfter a few rounds, the four of you eventually give up on trying to beat Britannia and take off your holo-harnesses.");
	output("\n\n<i>“Shit, Bri... You could go a bit easier on us, y’know! I can’t exactly take my revenge if you’re constantly killin’ us all mercilessly!”</i> Tarariel sighs in exasperation. Afterwards she audibly whispers to Britannia, <i>“Hey, can you give me some private lessons for CoV 8? I’m gonna need ‘em to beat Fisi!”</i>");
	output("\n\n<i>“I can hear you, you know...”</i> Fisianna pouts as her ears swivel adorably in emphasis. Tarariel sticks her tongue out at the sullen neko and blows a raspberry. Britannia giggles softly before rising up from her seat. She walks over to the pile of belongings that you and the girls created when you first entered the apartment. She reaches into her bag and pulls out a small holo projection unit and sets it down on the glass table in front of everyone.");
	output("\n\n<i>“I brought this over from home and thought we could try playing it next. It’s a little holoboard game called <i>Oligopoly</i>.”</i>");
	output("\n\nAya jumps in her seat in excitement. <i>“Oh! I know this game! It’s that one board game where you try to oligopolize, or uhh... rather take over every company you can and try to run everyone else out of business, right?”</i>");
	output("\n\nBritannia nods. <i>“Mhm, you’re right on the money, Aya. I thought we could play a little game of this to simmer down, while still tickling our competitive fancies...”</i> She adds the last part with a playful undertone towards Tarariel.");
	output("\n\nEveryone else in the room seems to be interested except for Tarariel, who looks unsure. <i>“Hm... it sounds interesting and all, though I have a feelin’ Steele’s gonna mop the floor with us, bein’ a business tycoon and all.”</i>");
	output("\n\n<i>“Hey, I don’t own Steele Tech... yet anyways. Besides, I doubt the game would be as complicated as real business is anyways.”</i> You say in your defense.");
	output("\n\nBritannia clears her throat, catching the attention of everyone in the room again. <i>“Alright, I will volunteer to be the banker. It’s up to you four on who you would like to team up with.”</i>");
	output("\n\nBefore anyone has a chance to speak up, Fisianna squeaks. <i>“I wanna team up with [pc.name]!”</i>");
	output("\n\nTarariel groans in disdain, to which Aya shoots a dangerous narrow eyed leer at her. <i>“Hey, I know about this game, and I’m pretty good at it! Let’s mop the floor with them and run ‘em out of town, Tara!”</i> Aya encourages the fox-girl.");
	output("\n\nTarariel nods and smiles in agreeance to Aya. She then turns and gives you and Fisianna an even more dangerous looking grin. Britannia boots up the holoboard and a square board pops up with little avatars for everyone’s tokens. You can see that almost each square holds names of all different types of companies that are still currently in business, from smaller chains to large mega corporations. You see lesser known corporations like J’ejune, to widely known ones like JoyCo, Reaper Armaments, and even your very own Steele Tech! Little indicators pop up telling how much each team has in credits. Afterwards a computerized six sided die pops up and transforms into a two-sided coin to decide which team moves first. It flips up and down on its display and lands on tails, indicating Tarariel and Aya would take the first turn.");
	output("\n\n<i>“Alright, may the best team win!”</i> Britannia smiles as the game begins.");
	output("\n\nThe four of you take turns moving around the game board buying any company that your avatars land on. By the time just about all of the companies are bought out, both your team and Tarariel’s team have about an even amount of companies owned. At this point in the game, it is more of a competition of who can wrest more money from another as you circle the board, having to pay a tax for landing on an opponent’s company. Both of you also buy more stocks from Britannia, investing them on strategic places on the board in the hope that your opponents will be unfortunate enough to land on them for a heavier tax.");
	output("\n\nAbout an hour passes after this stage and almost each company is maxed out in shares able to be bought. One wrong landing could be a game changer. On Fisianna’s turn, she very narrowly misses landing on Aya’s Xenogen Corp square as she passes over it and lands on her own KihaCorp square. On Aya’s turn, she lands on Fisianna’s owned JoyCo square, having to pay more credits than their team currently has. They are forced to sell stocks from other companies they own to pay the tax. It’s the game changer that your team needed! ");
	output("\n\nOn your turn, you land on square that gives you an event card. The card grants you and Fisianna a hefty reward for finding a rare mineral deposit on an offworld planet. You use the money earned to max out stocks on your Steele Tech owned square, which Tarariel can possibly land on during her next turn. If she lands on Steele Tech, there would be no way for her team to pay the insane tax for landing on that square. ");
	output("\n\nIt comes to Tarariel’s turn. She presses the button to roll the digital die and rolls a three, which is just the number you needed for her to land your now fully upgraded Steele Tech square! The kitsune-morph cries out in anguish as her avatar moves to your Steele Tech square, after which the game displays an <i>“insufficient funds”</i> message and declares bankruptcy for Aya and Tarariel.");
	output("\n\n<i>“Aaaargh, damn it! Steele, I hope this isn’t a preview of what you would really do if you took over Steele Tech...”</i> Tarariel leans in towards you to whisper into your ear. <i>“If it is, let me get a share of the cuts, yeah?”</i> She gives you a playful grin as she sits back in her chair. You chuckle while Britannia picks up the holoboard cube and puts it away in her bag.");
	
	processTime(((23 - hours) * 60) + (60 - minutes) + rand(15));
	addButton(0, "Next", goSleepover3);
}

public function goSleepover3():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	output("<i>“Mmm... it’s getting pretty late, and that game took a while to settle. I think it would be a good time to start getting ready for bed.”</i> Britannia yawns. You look at your codex for the time and are surprised to find how late it has gotten. The others mirror Britannia’s yawn as they nod in agreement. Everyone rises up from their seats to retrieve their belongings and head towards Fisianna’s bedroom.");
	output("\n\nWhen Fisianna opens the door to her private bedroom, you find that her room is surprisingly spacious, but expectedly girly. The feline’s room is heavily themed orange and white just like her, and decorated with peach colored curtains. Her room has dark wooden drawers and desks bordering the walls with white carpeting. She is also sporting a queen sized bed near the center of the room big enough for two people. Surrounding it are multiple blow up sleeping mats complete with comfy looking feather pillows. You notice there are only three floor mats.");
	output("\n\n<i>“Y-yeah... I’m sorry. I forgot to tell you all that I was only able to get three mats for us since I usually don’t expect company much, and my guest bedroom is my workstation...”</i> Fisianna shyly admits. <i>“I asked Bri ahead of time for an idea on who would get to sleep on the bed and well... we came up with the ‘Oligopoly’ idea. Bri volunteered to sleep on a mat so she wanted us to decide with that game. We figured it would be more fun that way! Since [pc.name] and I won, we get to sleep on the bed... t-together.”</i> Fisianna whispers the last word. The realization of her sleeping with you suddenly dawns on her and her face starts to flush with color. The catgirl stands in a daze for a few seconds before you see a flash of white fly past you. Fisianna is whiplashed backwards onto the bed as she is struck in the face by the fluffy object. Tarariel howls triumphantly while she readies another white weapon to throw. ");
	output("\n\n<i>“<b>PILLOW FIGHT!</b>“</i> Tarariel yells at the top of her lungs before she hucks the feathered object straight at your head. ");
	if (pc.RQ() >= 50) output("You just barely dodge the incoming projectile in time, while in the same dodging motion you pick up another pillow from the ground and throw it back at Tarariel in retaliation.");
	else output("You are unable to react in time to the incoming projectile and are hit squarely in the face by the feathery sack. You recoil from the strength of the hit, but you stand firm. When you recover, you throw the pillow back at Tarariel.");
	output(" She manages to dodge your counterattack, but it happens to strike Aya who was standing behind Tarariel. Aya quickly snatches the fluffy projectile from her face after recoiling from your blow and swings down diagonally to catch Tarariel while she is recovering from her dodge, but her swing is cut short when she strikes the back of Britannia’s head mid-swing.");
	output("\n\n<i>“O-oops! Sorry Bri! I was aiming for-<b>oomph!</b>”</i> Aya staggers backwards as she is struck by a soft pillowed blow to the stomach by Britannia. Afterwards the room is a blur of white pillows and feathers flying everywhere. Midway through the chaos you notice that Fisianna must have previously put away anything that could have been broken in the room in preparation for an event like this, so everyone could fight to their heart’s content.");
	output("\n\nAfter about ten minutes pass, everyone is too tired to throw or swing another pillow. Everyone gathers their bearings and pitch in to clean up all the loose feathers and stuff them back inside their bags while setting the room straight again. When everyone is finished, Aya, Tarariel and Britannia all climb into their respective sleeping mats when Fisianna turns the lights off. She then climbs into her bed and you follow suit. Though you can’t really see it, you can tell that she is blushing hard from her fast paced breathing and the slight warmth she is emanating from the other side of the bed. You hear her gulp nervously before she whispers to you in as hushed a tone as possible so that none of the other girls can overhear.");
	output("\n\n<i>“T-thanks, [pc.name]. Thank you for making this one of the most fun nights I’ve ever had in my life. I-I don’t know what I’d do if I didn’t meet you. I...”</i> Fisianna trails off. You nod in response, believing she will be able to see you with her sharp feline eyes. She confirms this by patting your hand with her paw.");
	output("\n\n<i>“Sleep tight, [pc.name].”</i> Fisianna whispers before she turns around the opposite way on the bed. You lay on your back and start to doze off yourself, still feeling warm from her complement.");
	
	processTime(((1 - hours) * 60) + (60 - minutes) + 15 - rand(30));
	addButton(0, "Next", goSleepover4);
}

public function goSleepover4():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	output("When your eyes flutter open again, the room is fairly brighter, indicating it is early to mid morning. You had a very comfortable time as Fisianna’s bed felt like sleeping on a cloud. Before you move however, you can feel the right side of your body vibrating. You raise your left arm over to the right side of your body and feel something soft and fuzzy on your torso. Whatever it is, it is vibrating more intensely than your body is. You also feel a faint warmness on your neck that comes and passes about every few seconds. You crane your neck down your body and find that Fisianna’s pawed arm is wrapped around your torso. You can also see parts of her animalistic right leg are wrapped over your [pc.legsNoun]. You turn your head right only to have your nose booped by a flicking feline ear. Fisianna’s head is nestled into your neck as she is snoring and purring peacefully. It seems in her sleep, she has taken to snuggling with you. You figure there is nothing else you can do to move without waking Fisianna up so you lie back and make yourself as comfortable as possible while enjoying the half body massage of her purring.");
	output("\n\nJust before you drift off to sleep again, you feel Fisianna grip you tighter in her snuggle while she mumbles softly in her sleep.");
	output("\n\n<i>“[pc.name]...”</i> Fisianna murmurs with a slightly aroused undertone as her breath starts to become increasingly ragged. The paw on your torso starts to shift as her leg that is wrapped around you starts to lightly grind against you in a carnal nature. You can feel Fisianna heating up against you while her purring intensifies, as well as the grinding motions on your [pc.legsNoun]. You do your best to not to become aroused while the neko’s pajamas start to become moist against you. When you’re near your breaking point, you decide it would be best to wake the sleeping catgirl and snap her out of her lustful dream before any of the other girls have a chance to catch on. You shake Fisianna gently when her grinding starts to reach its peak. As you shake her, the grinding motions on you slow to a stop. She groans as her eyes flutter open.");
	output("\n\n<i>“Unng... [pc.name]? W-what’s up?”</i> Fisianna whispers sleepily. In her daze, she briefly surveys the position she is in against you and it only takes a few moments after to realize that she is snuggled against you. When her tired eyes quickly snap open in shock and surprise, she quietly gasps. The distraught catgirl quickly releases you and shifts back to the other side of the bed, burying her head into the pillow. Through the pillow you can hear Fisianna shoot muffled apologies to you, but she is too afraid to show her face after her indelicate display. The best you can do is whisper back that everything is fine, that she doesn’t have to worry about it and that you won’t mention what happened to anyone. When you have convinced her enough, she raises her head out of her pillow to show you her beet red face. You give her your most sincere smile to ease her feelings of embarrassment. This seems to calm her down enough to lessen the color on her face, though she still looks uneasy.");
	output("\n\n<i>“I... I n-need to go get c-changed...”</i> Fisianna states as she slides out of the bed and heads to her private bathroom, picking up a new pair of panties along the way.");
	output("\n\nYou lay in bed until the other girls stir. They take their turns using the guest bathroom to freshen up, greeting each other groggily as they pass each other. After the other girls are finished sprucing up in the bathroom, you climb out of bed and take your turn to prepare for the day. By the time you are done, everyone is in the living room, including Fisianna. She still seems affected by the earlier accidental snuggle, as she has a faraway look in her eyes. She snaps out of her thoughts when you arrive and blushes brightly before turning to Britannia.");
	output("\n\n<i>“T-thank you all for coming to the sleepover, and thank you Bri for helping me organize this. It was a great night, as I thought it would be.”</i>");
	output("\n\n<i>“No, Kitten. Thank you for graciously hosting this for us. It couldn’t have happened without you.”</i> Britannia reflects.");
	output("\n\n<i>“Yeah, I’d definitely love to do this again whenever we can, and once I get my CoV 8 lessons from Bri, I’m gonna whoop everyone’s ass next time!”</i> Tarariel sneers gleefully. Everyone laughs, to Tarariel’s dismay. <i>“What? I will!”</i>");
	output("\n\nYou each say your goodbyes as you head out of the apartment one by one and go your own separate ways. Out of the corner of your eye, you can see Fisianna giving you a longing look from her doorway while you amble down the walkway. You head back towards the elevators and take one down to your ship, where you change out of your pajamas. ");
	if (pc.isNude()) output("You silently reflect on your night with Fisianna and her friends.");
	else output("You strap on your [pc.gear] and silently reflect on your night with Fisianna and her friends.");
	output(" That night will definitely be one to remember.");
	
	pc.changeLust(10)
	setFisiAway(2);
	processTime(((9 - hours) * 60) + (60 - minutes) + rand(15));
	sleepHeal();
	currentLocation = shipLocation;
	addButton(0,"Next",mainGameMenu);
}

public function dateFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	if (flags["FISI_DATE_NUMBER"] == undefined){
		flags["FISI_DATE_NUMBER"] = 1;
		firstDateFisi();
	}
	else if (flags["FISI_DATE_NUMBER"] == 1)
	{
		flags["FISI_DATE_NUMBER"] = 2;
		secondDateFisi();
	}
	else if (flags["FISI_DATE_NUMBER"] == 2)
	{
		flags["FISI_DATE_NUMBER"] = 3;
		thirdDateFisi();
	}
	else if (flags["FISI_DATE_NUMBER"] == 3)
	{
		flags["FISI_DATE_NUMBER"] = 4;
		fourthDateFisi();
	}
	else if (flags["FISI_DATE_NUMBER"] == 4)
	{
		flags["FISI_DATE_NUMBER"] = 5;
		fifthDateFisi();
	}
	else if (flags["FISI_DATE_NUMBER"] == 5)
	{
		flags["FISI_DATE_NUMBER"] = 6;
		sixthDateFisi();
		return;
	}
	else
	{
		output("SOMETHINGS FUCKED: UNHANDLED DATE NUMBER");
	}
	
	setFisiAway();
	if (flags["FISI_DATE_NUMBER"] == 3) processTime(60);
	processTime(60 + rand(15));
	currentLocation = "LIFT: RESIDENTIAL DECK";
	addButton(0,"Next",mainGameMenu);
}

public function firstDateFisi():void
{
	moveTo("MERCHANT'S THOROUGHFARE2");
	
	output("You ask Fisianna if she would like to go on a date with you, now that the two of you are a couple. Her ears perk up and her tails wiggle faster behind her when you raise the question of going out somewhere with her.");
	output("\n\n<i>“S-sure! I’d love to go with you! Was there anywhere you had in mind?”</i> Fisianna asks sweetly.");
	output("\n\nYou try to think of what would be a good place to have your first date as a couple on. Nothing comes to mind immediately, though Fisianna speaks up before the silence extends for too long.");
	output("\n\n<i>“U-um... I was thinking... would you like to go to the arcade again? Just the two of us?”</i>");
	output("\n\nYou wonder why Fisianna would want to go to the arcade of all places first, since you both can go there together at any time to have fun.");
	output("\n\n<i>“W-well... it’s the place I feel most comfortable in at the moment, besides next to you of course. I-I thought we could start dating with something in more familiar territory. You don’t have to spoil me with fancy dinners or anything, though that wouldn’t be a bad idea either...”</i> Fisianna adds the last part with a playful undertone to her voice. You pretend not to acknowledge the idea of a candlelit dinner, but keep it in mind just in case. You take up Fisianna’s offer for a date to the arcade and grab her paw in your hand as you both rise from the bench and head to the elevator shafts.");
	output("\n\nThe two of you eventually arrive at the arcade without running into anyone familiar. Fisianna is already looking towards every gaming station in sight. Wrought with indecision, your playful date turns towards you with a thoughtful look on her face. <i>“Mmm, what should we play first? We could play some CoV 8 if you wanted to, or Castle Mania, or anything else you have in mind. I’m up for anything!”</i> Fisianna smiles gleefully at you.");
	output("\n\nSince it is just the two of you at the arcade this time, you think it might be a good idea to do something different this time. In a corner of the arcade, you spot a number of games that look remarkably similar to games you would find at a terran carnival, complete with prizes. You point at the section with the carnival-like activities to Fisianna and ask if she would like to try her hand at playing those for now.");
	output("\n\n<i>“Oh sure! That looks like it could be some fun!”</i> Fisianna places her paw into your hand as you make your over to the carnival-like games together.");
	output("\n\nThe first activity that catches Fisianna’s eye is a <i>“Shoot the Target”</i> game. It looks pretty standard from what you can see. There are several red targets moving along a track, which can be shot down with what looks like a light gun about the size of a small rifle. A side display shows the prizes that can be won for hitting a certain amount of targets. One of the prizes catches Fisianna’s eye and she smooshes her face on the glass panel to try to find a better view of the item she is fawning over. It looks like an oversized stuffed cat that is mostly white in color with splotches of brown and black all over it. Once she is done examining the stuffed toy, she runs over to you and grabs your hands, giving you a pleading look. <i>“Please, please, please! Can you try to win me that cute stuffed cat? I’m not the best of shots and I’d <b>love</b> to have it back at my apartment!”</i>");
	output("\n\nSeeing no reason to refuse, you grant Fisianna’s request. You offer to pay for your tries at the targets, and once you swipe your " + (isAprilFools() ? "dogecoin" : "credit chit") + " past the receiver, the game springs to life. Three red targets move in a uniform line at a steady pace. You pick up a light gun, and a display shows that you have three chances to down the targets. You look towards the prize display to check how many shots you would need to win the cat. To your dismay, you find that will need to hit all three shots to be able to obtain that prize. Well... the pressure is on now!");
	output("\n\nAfter shaking off some nerves, you line up your shot and track one of the targets on your light rifle’s scope. It takes a few moments of careful aiming and adjusting before you make the attempt. Your first shot hits home, striking the target dead on. It falls backwards and out of sight as the display indicators flicker in response to your successful try. Fisianna whispers a near silent, <i>“yes!”</i> She smiles and waits for you to align your second shot.");
	output("\n\nAs you line up your second shot, you are beginning to think that this won’t be so hard after all, when to your chagrin, the targets begin to accelerate progressively faster. You silently curse your luck for underestimating the game and readjust your timing to the now increased pace of the targets’ movements. Once you have the timing down, you take your chance to fire at a carefully predicted spot where the two targets meet each other. You manage to hit the side of one of the intercepting targets, which folds over out of sight. Fisianna nods her head in approval, though she looks very nervous for you as she watches you ready up your third shot with bated breath.");
	output("\n\nYou take your aim at the last remaining target, which is moving at the same fast pace as before. You opt not to take the shot yet to watch for any changes in movement. Sure enough, the target starts to fluctuate in speed now. It is moving in very irregular patterns; sometimes moving blisteringly fast, other times tantalizingly slow. It even stalls to a standstill on occasion. It looks almost impossible to predict any sort of set pattern to take an easier shot on the lone target. Sighing, you take a deep breath to relax and train your sight on the target as best as you can, waiting for the moment when it slows down to a crawl. You hold your breath just as the target finally slows down enough to take aim at it. Taking the opportunity, you fire at it as soon as your crosshairs have it dead center on sight. At the moment you fire, the target jerks back to full speed, making you wonder for a split second if you hit it before the target just as abruptly stops again. You see that the target has a mark at the very edge of it, indicating a confirmed hit. The target folds back behind the line and out of sight, after which the prize panel lights up with a bright fanfare, declaring your victory. Fisianna rushes over to you and gives you a surprisingly crushing hug for someone of her small stature.");
	output("\n\n<i>“You did it! You really did it! I was so nervous for you, but you did it! You’re the best, [pc.name]!”</i> Fisianna looks into your eyes with joy written all over her face while her tails are wiggling a mile a minute behind her.");
	output("\n\nAfter Fisianna lets you go, you triumphantly [pc.walk] over to the prize panel and pick out the stuffed cat Fisianna wanted. After it drops into the nearby receptacle, you hand the plushie over to her. She hugs her new toy and sets it aside on a nearby table before wrapping her arms around you again.");
	output("\n\n<i>“T-thank you so much, [pc.name]. I’ll treasure this cute thing forever, since it was from you. I love you!”</i> Fisianna adds with a sweet smile.");
	output("\n\nThe two of you decide to play a few more carnival games together, with varying success. When about an hour has passed, you decide it would be a good time to take a break for today and head your separate ways for now. Fisianna gives you another kiss as you say your goodbyes outside of the arcade.");
	output("\n\n<i>“I had the best time with you, [pc.name]. Let’s do this again more often, just the two of us!”</i>");

	pc.credits -= 200;
}

public function secondDateFisi():void
{
	output("Fisianna lights up in excitement at the mention of going out on a second date. <i>“[pc.name]! I have some wonderful news! I just found out that a new deck just recently opened up here! It’s supposed to be a grand park of some sort. Luscious greenery everywhere complete with various ponds and waterfalls. It also has small forests to take hikes in. They even have artificial sky effects that work in real time as well! I hear it feels just like being outside.”</i>");
	output("\n\nFisianna reaches over her the side of the bench and procures a medium sized basket covered with a white cloth. The smells that emanate from the basket are tantalizingly delicious. <i>“So would you like to check it out with me for our second date, y-y’know... if you want to? I even brought a picnic set complete with snacks and drinks for the day!”</i> Fisianna smiles cutely. She already seems to have everything planned out so you aren’t one to say otherwise. You agree to go check out the new park, to which the excited feline jumps out of her seat with joy.");
	output("\n\n<i>“Yay! Thank you, [pc.name]! I promise you you’ll enjoy this!”</i> Fisianna says jubilantly as she waits for you to rise up from the park bench. You stand up, taking her free hand in yours, and you both make your way to the central elevators.");
	output("\n\nThe elevator ride takes you quite a ways upward and it takes about a minute before you finally arrive at the Park deck. Once outside, you find that the entryway is fairly crowded. You assume it is so packed here because there isn’t a great deal of nature to interact with on Tavros. ");
	output("\n\nThe park is just about as Fisianna described it earlier, and quite accurately too. A gentle, warm breeze flows through the air under an artificial blue sky that looks convincingly real. There is an artificial sun that generates a warm glow over the park. Green fields and shrubberies dotted with wildflowers fill the landscape, along with the occasional pond and small waterfalls. Surprisingly, the park looks devoid of wildlife. You remark to Fisianna as such.");
	output("\n\n<i>“Ah. I imagine since the park is so new, they just haven’t been able to gather the necessary wildlife together yet. They would have to be careful picking what wildlife to place here so that they don’t wind up wreaking havoc on the ecosystem, or make it hard for whoever maintains all of this.”</i> Fisianna shrugs. <i>“Anyways, I figure we have a good amount of time to kill. Let’s check out what’s beyond and walk around for a bit!”</i> Fisianna wraps your arm around hers with her free arm.");
	output("\n\nThe two of you disperse from the crowd by the elevator and make your way down to a walkway that leads to a forested area. Along the way, you see a number of occupied benches surrounding various small ponds. The bodies of water are so crystal clear that it looks almost good enough to drink from directly. Their surfaces reflect the sky as ripples flow from the central fountains. There are already quite a lot of people laying on the fields setting up their own picnics, with children running in between each camped out group. ");
	output("\n\nAs the two of you walk further down the pathway and into the forested area, you see less people walking the same route. The ground becomes hilly as you start to hear the artificial sounds of birds chirping around you; it looks they at least thought of a temporary fix for the lack of wildlife. Fisianna pulls on your arm gently and leads you off of the walkway onto a dirt path. While walking on the earthy pathway, you notice that there are various trees with holographic markers to prevent anyone from losing their way. You lean out and touch one of the trees with a free arm and sure enough, it feels like the real deal.");
	output("\n\nThe two of you keep walking down the path until you come to a mid-sized clearing that is remarkably devoid of passersby.");
	output("\n\n<i>“Alrighty, this looks like a nice spot. Let’s take a picnic break here! We can keep going afterwards, but for now I’m getting pretty hungry from smelling this food the whole entire way...”</i> Fisianna takes the cloth off of the picnic basket she is holding and lays it across the grass. She then places a number of containers full of different types of foods and snacks on one side of the mat. When you sit down next to her, she hands you two bottles of liquids. One of them feels quite warm to the touch, while the other is refreshingly cold.");
	output("\n\n<i>“I wasn’t so sure which you would like, so I made a yokto milkshake in the cold one, and in the hot one, some hot apple and cinnamon tea. I-I hope you like them.”</i> Fisianna blushes while she takes out the rest of the contents of the basket. You take a small sip of the yokto shake and find that it has a sourness somewhere between an orange and a lemon in intensity, but it has a flavor similar to blueberries. You can also taste bit of vanilla, which complements the flavor very well. You look towards the food containers nearby and find that are largely filled with sandwiches of different varieties. There are also a few containers filled salad, soup, and crackers to go with them.");
	output("\n\n<i>“Wow, Fisi. You really went all out!”</i> You say in amazement. She brought quite the smorgasbord of foods with her. Fisianna smiles in delight at your compliment.");
	output("\n\n<i>“T-thank you, [pc.name]”</i> Fisianna stammers as she passes you a sandwich. She then settles down and leans against you while starting on a bowl of soup. ");
	output("\n\nThe two of you eat the picnic food while talking about various subjects; Fisianna talks about jobs she recently took, and you tell her about your latest happenings in the Rush. After the two of you finish your food, you relax in each other’s arms while you both sip away at your teas, fully sated from all of the food. Fisianna looks cutely into your eyes at one point and you can’t help but lean down and give her a peck on her lips. She seizes the opportunity to wrap her arms around the back of your head when you break the kiss. Her ears flatten backwards and her eyelids lower into the most adorable golden bedroom eyes you think you have ever seen.");
	output("\n\n<i>“I know we just had all of this food to eat, but I think I have enough room for a second helping of your lips...”</i> Fisianna purrs sensually as she leans in to give you another kiss. You accept her lips to yours and lean back while you engage in a long-winded embrace on the picnic mat.");
	output("\n\nFisianna lays atop of you as you hold her close while making out. Her eyes flutter closed as her cascading hair tickles at your cheeks. As she presses into you harder, her tongue begins to prod at your mouth. You part your lips only slightly and she takes full advantage, slipping the oral muscle into the opening. Your tongue rises up to meet hers before they play a frenetic dance inside of your cheeks. ");
	output("\n\nIn the heat of the moment, you shift your weight and roll around on the mat, pinning Fisianna beneath you. She separates her lips from you to gasp at the sudden change in position, but you give her no further time to react as you quickly lean in and resume your oral play. Using the opportunity from your lover’s brief pant for air, you slip your tongue into her mouth, searching for hers. She meets yours eventually, and when your tongues begin flicking and flailing against one another, she begins to purr. The vibrations of her body under you stimulates and massages your front side in a very relaxing manner. She presses her body into you, arching her back off of the ground. You take advantage by slipping your arms underneath her, cradling her while her purring intensifies. Her paws slide around your torso in response and her feline legs wrap around your [pc.legsNoun]. The neko sensuously moans into your mouth as you lay entwined with her. After a seemingly long while, Fisianna finally breaks the kiss, looking totally winded and disheveled. You lay to the side of her to catch your own breath.");
	output("\n\n<i>“W-whew... w-we... we have to do this more often. That will never get old!”</i> Fisianna laughs in exhaustion. You chuckle and squeeze Fisianna to you while she hugs you back, purring all the while. ");
	output("\n\nAfter a few more minutes of cuddling, the both of you straighten up and pack up Fisianna’s picnic supplies. When you finish, the two of you continue down the dirt path on the other side of the clearing, pointing out different exotic looking flowers and trees along the way. You start to meet more people walking along the same path as the trail beneath you starts to become smoother. Eventually you reach the paved walkways again and follow them out of the forest. In the distance you can see the elevator shafts; the only artificial thing that breaks the natural landscape of the park. You and Fisianna walk arm in arm while you head back towards the elevator shafts.");
	output("\n\nWhen you arrive at the crowded elevator shafts, the two of you walk towards one of the lifts. A few holo-posters that you didn’t see when you first arrived catch your attention as you make your way over. The poster that you look at in particular has an announcement that there will be an all-day outdoor movie night event coming soon. You make a mental note of it as a potential date idea for your next outing. When the both of you arrive back on the residential deck, you give each other parting kisses goodbye before Fisianna walks home with picnic basket in hand.");
}

public function thirdDateFisi():void
{
	output("You remember the posters you saw by the elevators during your last outing to the park with Fisianna about the outdoor movie night event. From what you remembered, the date that they were having the movie event was today. With that in mind, you propose the idea of going to the park again with her to see the movie together.");
	output("\n\n<i>“Oh! That sounds like a great idea!”</i> Fisianna smiles widely. <i>“It’s nice that it is supposed to air all day so we don’t have to rush. I’ll go home really quickly and get some things ready for us then. I can’t wait!”</i> Fisianna gives you a quick peck on the cheek as she stands up from her seat on the bench. <i>“I’ll meet you by the elevators in about fifteen minutes, ok?”</i> You nod in agreement and watch her walk off towards her home. You figure you may as well take a walk around the plaza while you wait for her.");
	output("\n\nWhen fifteen minutes pass, you finish your walk and wait by the North elevator for Fisianna. She arrives only a few minutes after you do. She looks to have brought her picnic basket with her as well much to your delight. She gives you a quick peck on the lips when she reaches you.");
	output("\n\n<i>“S-sorry that I took a little longer than I originally thought I would. I wanted to bring a few snacks from the leftovers we had from picnic before. They should still be fresh!”</i> You thank Fisianna for the thought and take her free paw in your hand as the two of you enter the elevator.");
	output("\n\nWhen you exit the elevator at the park, you find that it is more crowded than it was on your last trip here, and understandably so. The sky looks to be set to a permanent night time setting for the day, so artificial stars glimmer in a dark purple and black sky. The artificial sun is replaced by dimly glowing moon, which casts a soft light bright enough to be able to see in a non-sheltered area. At one end of the nearest clearing you can see a humongous holo screen. There is a massive amount of people camped out in front of the screen watching the previews, or otherwise snacking and talking amongst themselves. You can see Fisianna gazing at the scene in amazement, ears twitching and swiveling every which way as her golden eyes glitter in the artificial moonlight.");
	output("\n\n<i>“Wow, this setup is amazing! I’ve never would have thought that it would be this... grand.”</i> Fisianna stares pointedly at the holo-screen. Shortly after she turns to you. <i>“We should find an open space to set up on. I’d hate to wind up too far away or smooshed between too many people.”</i>");
	output("\n\nThe two of you head down to the field and look for any open spaces you can find. You eventually find one at a comfortable distance from the holo-screen with a good amount of space around it to give the both of you plenty of room to relax. Fisianna sets her blanket down on the ground and places the picnic basket down next to her, after which she unpacks the contents in the basket. You sit down on the blanket and after reclining back, your feline companion sits down next to you and wraps her arms around you in a hug, relaxing against you.");
	output("\n\n<i>“I wonder what movie they’re going to be airing right now?”</i> Fisianna ponders to you. Thinking of which, you actually have no idea which movie is going to be airing right at this moment. You remember seeing a schedule somewhere on the poster you saw before, but you are starting to wish you read it in more detail. You shrug the shoulder that Fisianna is not resting on and tell her that you don’t have the faintest idea yourself.");
	output("\n\n<i>“Oh well... I imagine it’ll be good anyways, especially with you here.”</i> Fisianna says dotingly, squeezing herself tighter to you. The two of you spend a few more moments in each other’s arms, eating Fisianna’s homemade snacks before the previews finish and the movie starts.");
	output("\n\nThe movie starts rather innocently enough; a starship cruiser is headed for a derelict space station to scavenge for parts. The ship lands and the scavenging crew gathers everything they can reuse. The operation goes smoothly enough and the crew heads back to the ship, though there are subtle undertones of mystery as an unidentified figure flashes across the screen and into the vessel just as the door is closing. Fisianna grips onto you tighter as this happens. The title screen comes up afterwards, reading: “<i>The Intruder.</i>“ You start to feel a bit of dread yourself as you are beginning to think that this movie may not be the most pleasant of movies to watch on a date.");
	output("\n\nSure enough, later on in the movie, crew members start to go missing and the captain of the ship orders a ship-wide assessment of the situation. Things grow even more bleak when several members of the search party go missing and only bloodstains are found. When a lieutenant makes their way down to the cargo bay area, he looks around until he finds a badly mutilated body. You can hear Fisianna gasp in terror as a shadow forms behind the hapless crew member. The officer notices a little too late and comes face to face with the grotesque alien that stowed away on the ship. He screams and manages to fire only a few shots off from his pistol before the alien comes down on him. Fisianna buries her head into your shoulder and shakes in fright. You rub her back gently until she is brave enough to bring her eyes back to the screen again. ");
	output("\n\nOnce the threat is identified, the whole ship goes into red alert while the crew sets about to hunt the alien down. Fisianna shrinks into your arms each time a member of the crew falls victim to the alien. Eventually there are only a few remaining surviving crew members left on the space cruiser, including the captain. He sets the ship to autopilot as the alien aims to break into the cockpit. The remaining crew members attempt to blast the foreign intruder when it successfully breaks in, to little avail. One of the privates fighting the alien pleads for the captain to escape while they still can. ");
	if (silly) output("They cry out: <i>“It’s game over man, game over!”</i> ");
	output("Afterwhich they immediately fall to the intruder. The alien bears down on the now lone captain and lunges at him. The captain barely escapes out of the cockpit in time. The invader chases after the captain relentlessly as he makes his way to the airlocks. Fisianna looks on with bated breath while the captain runs and gasps at every close call he has. Eventually he makes it to the airlocks, but to his dismay, all the escape pods have already been jettisoned; likely by crew members that were too terrified to stay aboard. Even you are starting to feel tense and wondering what he will do next as the alien threat closes in on the unfortunate captain.");
	output("\n\nThe invader slowly and menacingly lumbers over to the trapped captain, ready to strike the final blow. In an instant, he holds onto a nearby bar on the wall and slams his hand on the airlock release button, opening the door next to them. Everything not nailed down in the room goes flying out of the airlock and into the empty void of space. The intruder struggles to keep its traction on the ship floor and falls victim to the suction of air being forced rapidly out of the room, but not before grabbing onto the doorframe in desperation. The captain beats at the alien’s limbs that are closest to him while holding his breath. ");
	output("\n\nYou can feel Fisianna rocking and fidgeting next to you while the alien’s grip loosens bit by bit. When you look towards her, she bites her lower lip in anxiousness. Her twinned tails suddenly stretch out while her knees and paws clench together. Dismissing the gestures as mere expressions of terror, you look towards the screen after hugging her reassuringly, not wanting to miss the resolution of the scene. ");
	output("\n\nAfter a few more hits, the alien intruder finally lets go and is vacuumed into the cold recesses of space. The captain slams the airlock button down again to close the door as he, Fisianna, and the rest of the moviegoers breathe a collective sigh of relief. The captain makes their way back to the cockpit of the starship and plots a course for home.");
	output("\n\nWhen the credits start to roll, Fisianna releases her rather tight hold on you. She looks into your eyes with a weary, but relieved look on her face. You can faintly smell a musky, ");
	if (pc.cockVirgin && !pc.hasVagina()) output("but somewhat tangy aroma wafting from her. ");
	else output("and somewhat familiar tangy aroma wafting from her. ");
	output("Did she...?");
	output("\n\n<i>“T-that... that was really, really scary...”</i> Fisianna blushes and sighs as she slumps against you. You pull her into a comforting hug, kissing her on the cheek all the while.");
	output("\n\n<i>“Had I known that they were going to air a horror movie, I probably would have scheduled this at a different time...”</i> You say to Fisianna apologetically. Her ears perk up while she looks up at you with a sweet smile on her face.");
	output("\n\n<i>“I-it’s ok, [pc.name]. I still had a lot of fun, plus I-I felt really safe in your arms the entire time anyways, if I’m allowed to sound a bit corny.”</i> Fisianna plants a kiss on your lips before straightening up and packing the rest of the snacks away. You help her put the rest of her picnic things away and once you are done, the both of you head back to the elevator shafts. Once you enter them and exit out into the residential deck, Fisianna gives you another kiss to your lips.");
	output("\n\n<i>“Thank you for taking me out today! I’m really looking forward to seeing you again, [pc.name].”</i> Fisianna turns away hesitantly and walks back towards her apartment.");
}

public function fourthDateFisi():void
{
	moveTo("RESIDENTIAL DECK FISIS APARTMENT");
	
	output("You ask Fisianna if she would like to go on another date with you. Your feline lover shifts in her seat nervously, her ears lowering to their sides and she fiddles with one of her tails.");
	output("\n\n<i>“U-um... actually, I-I was kinda thinking... d-did you wanna... come over to my apartment for today?”</i> Before you can answer back, Fisianna adds, <i>“O-oh, I wanted to show you the AI I’ve been working on for a while, the one I mentioned a while back?”</i>");
	output("\n\nYou think back to the conversation you had with Fisianna about her job and programming AI/VIs. You do remember her mentioning that she had an AI that she has been working on in her spare time.");
	output("\n\n<i>“R-right! I think I’m ready to show her to you now. Although she still is being worked on, she’s become my number one assistant when it comes to helping me with other projects. I-I think she would like to meet you!”</i>");
	output("\n\nWell, Fisianna sure has piqued your interest at that notion. You tell her that you are interested in meeting her personal AI and stand up from your seat, perhaps a bit more eagerly than you wanted to let on. Fisianna giggles as she rises up from the park bench and leads you to her apartment.");
	output("\n\nOnce you arrive at Fisianna’s apartment, she lets you inside and leads you over to her spare bedroom door.");
	output("\n\n<i>“A-again, she is a work in progress, so apologies if she says anything... off.”</i> Fisianna laughs sheepishly as she opens the door to her spare bedroom. Once the lights cut on, you immediately see a very professionally arranged workshop setup. One side houses a number of both regular tools and nano tools arranged neatly over a large workbench. There are all manner of heating and cooling stations for welding parts together as well as dozens of compartments set aside for the organization of small parts and wires. Various switches and dials line the side displaying various temperature indicators. Several circuit boards also lay on top of the nano work table from a recent project you gather. There are several skeletons of various droids nearby the other complicated machinery in that side of the room.");
	output("\n\nOn the other side of the room you notice a very large console. Below the console is large casing that has a wide variety of displays and lights. On the holo-screen it looks like it is running a diagnostic scan of the supercomputer. There are a number of books and documents strewn about the table top of the computer as well.");
	output("\n\n<i>“W-well? What do you think, [pc.name]?”</i> Fisianna asks while you survey the room.");
	output("\n\n<i>“Very impressive. I’m pretty amazed that you have all this setup in just the privacy of your own home. Most other places would have the same quality of equipment in expensive labs.”</i> You point out.");
	output("\n\n<i>“Y-yeah... I can thank my brother and sister for this for the most part. They’ve really helped me to earn my living here.”</i> Fisianna cheerfully smiles. Her tails wiggle a little more frenetically before an unfamiliar soft female voice echoes in the room.");
	output("\n\n<i>“Regular diagnostic scan completed. Welcome back, Fisianna. Hopefully you are well today. Since your last visit, two job offers are pending and awaiting your app-”</i> The voice cuts off abruptly, but just as suddenly starts up again. <i>“Multiple life signs detected in the vicinity. Do we have a visitor? How exciting!”</i> The voice exclaims.");
	output("\n\nYou take the opportunity to introduce yourself to the ubiquitous voice in the room. After a brief pause, the voice speaks up again as the holo-console displays a name.");
	output("\n\n<i>“Greetings, " + pc.mf("Master", "Mistress") + " Steele. I am the Inclusive Services Intelligence System, but you may call me I.S.I.S., for short. It is a pleasure to finally meet you!”</i> You chuckle and shoot Fisianna a sidelong smirk. Clever name.");
	output("\n\n<i>“Isis... I-I told you already, you don’t need to greet people by master or mistress. It sounds very possessive, not to mention degrading...”</i> Fisianna groans.");
	output("\n\n<i>“Apologies, Fisianna. I thought it would be polite in front of " + pc.mf("Mr.", "Ms.") + " Steele to use such formalities, especially one of [pc.hisHer] import.”</i> Isis says in a very convincingly apologetic tone.");
	output("\n\n<i>“It’s fine.”</i> Fisianna turns to you. <i>“Two guesses as to what the inspiration for that name is from. Isis is my own home grown AI, whom I’ve been nurturing for a good few years now ever since my college days. I’ve been steadily increasing the functionality of her core being since I created her from a school project. Highest marks in the class and helped seal my valedictorian status!”</i> The catgirl’s bosom swells with pride while her tails flick about in a blur. Isis continues on Fisianna’s explanation on her functions.");
	output("\n\n<i>“I was designed for the purpose of being integrable with a multitude of serviceable androids and/or machinery, thus my accelerated learning programming is longer than what most standard growth type AIs go through. As a result, when I reach one-hundred percent completion of my progress through aforementioned programming, I should be able to help in multiple fields of work outside of helping Fisianna repair droids, androids and programming AIs and VIs for her occupation. Fisianna takes great care in my wellbeing during all of this. I couldn’t be in better hands... or paws, so to say.”</i> Isis quips. Fisianna deflates and blushes at the praise the AI gives to her.");
	output("\n\n<i>“Recently, ever since you got me that doll at the arcade, I was working on a design for an avatar I could use for Isis. I got the inspiration to make one for Isis using that doll you won for me, and I made a similar avatar in honor of that as well, so I have to thank you again for that, [pc.name]! Isis, please come here and show [pc.name] what you look like!”</i> Fisianna gleefully asks Isis with a wide smile on her face. The display fades to black for a moment before it abruptly comes back on to show a giant pair of blinking, heterochromatic green and blue feline eyes.");
	output("\n\n<i>“Err... back up a little, Isis.”</i> Fisianna says, trying to stifle a laugh. The eyes on the screen back up to reveal an humanoid cat in a calico fur pattern. Isis’s avatar is completely nude, but her erogenous zones look to be conveniently covered up by layers of fur. Isis smiles cutely and waves at the both of you.");
	output("\n\n<i>“Apologies, this still requires some getting used to...”</i> Isis shuffles her feet on the bottom of the display. She then walks closer into the display so that you can only see her head, her heterochromatic eyes looking pointedly at you.");
	output("\n\n<i>“" + pc.mf("Mr.", "Ms.") + " Steele, I have really wanted to meet you for a long while! Fisianna never stops talking about you while she works, and now I get to actually meet the individual that has her so enamored. I have several databases with your information, but I would love to learn about the " + pc.mf("man", "woman") + " from the source, that is if you are willing?”</i> Little question mark indicators float above the avatar’s head. You decide to humor the curious AI and tell her a brief rundown of your background, your upbringing, and your current adventures on the rush. After the inquisitive AI finishes processing this information, she smiles.");
	output(" <i>“Thank you, " + pc.mf("Mr.", "Ms.") + " Steele! I can now certainly see why Fisianna is so infatuated with you. You are a very interesting being!”</i> You can see Fisianna blushing even harder than before. Apparently Isis notices this as well as her attention is now diverted towards Fisianna.");
	output("\n\n<i>“Oh, Fisianna. My sensors are indicating a rise in body temperature. Body temperatures slightly warmer in erogenous areas. May I suggest se-”</i>");
	output("\n\n<i>“N-n-no! S-stop!”</i> Fisianna’s eyes widen and she waves her hands about furiously, cutting Isis off mid-suggestion and blushing furiously now. Isis’s avatar looks genuinely surprised at the outburst before showing a look of concern.");
	output("\n\n<i>“But Fisianna, I thought normally when this happens, you like to-”</i> Is all Isis manages to say before Fisianna waves even more furiously, wearing an exasperated look on her face as the AI obliviously continues to attempt to remedy Fisianna’s unfortunate situation, much to her dismay.");
	output("\n\n<i>“N-not now Isis, p-please!”</i> Fisianna pleads meekly with Isis. The AI finally settles down after her last plea. Fisianna looks at you with a mix of dread and apology. You do your best to pretend you aren’t fazed by Isis’s lack of ‘situational awareness’, though it seems to you that your feline lover is having trouble bringing out certain feelings. You ask Isis if you and Fisianna could be excused and if would be ok to leave the workroom.");
	output("\n\n<i>“Of course, " + pc.mf("Mr.", "Ms.") + " Steele. It was a pleasure meeting you! Please come by again! I shall be on standby should I be needed, Fisianna.”</i> Isis’s avatar then procures a virtual chair from nothing and sits on it. Isis then materializes a book in front of her and begins reading it. You gently grab Fisianna’s paw and escort her out of the workroom. When the two of you exit the room, Fisianna stares pointedly away and to the ground, avoiding eye contact with you.");
	output("\n\n<i>“So... about what Isis said. You can come clean with me if you want to. I’m not gonna bite or anything. To me it doesn’t seem like you’re the most comfortable talking about anything ");
	if (pc.isNice()) output("intimate");
	else output("sexual");
	output(". I’d like to know what that is all about.”</i> You say in as soothing of a voice as you can manage. You gently place your fingers below Fisianna’s chin and turn her head towards you. Fisianna looks into your eyes, her golden eyes glistening.");
	output("\n\n<i>“[pc.name]... I-I’m sorry if I might be coming off prudish to you... I’ve been dealing with these... complicated feelings lately a-and I’m just not sure if I’m ready to deal with them, with you, just yet. I-It’s nothing to do with what you have done. You’ve been nothing but good to me. I-I... I just need a bit of time to open myself up to those feelings and take things... slowly. C-could you give me that?”</i>");
	output("\n\nYou feel it wouldn’t be prudent to rush Fisianna into anything that she wouldn’t be comfortable with so you nod in agreeance, to which Fisianna relaxes and smiles as her ears perk up. She then leans in to give you a kiss before giving you a long hug. <i>“Thank you [pc.name]. You’re the best.”</i> ");
	if (pc.tallness < 60) output("She murmurs into your ear.");
	else if (pc.tallness <= 72) output("She murmurs into your shoulder.");
	else output("She murmurs into your chest.");
	output(" After you break the hug, Fisianna is all smiling from ear to feline ear.");
	output("\n\n<i>“S-so, did you maybe want to play a game together to pass some time while we’re here?”</i> Fisianna asks sweetly.");
	output("\n\n<i>“Sure, we can do that, but there’s no way that I’m going to lose to you today!”</i> You say jokingly to Fisianna. She giggles while giving you a confident smirk.");
	output("\n\n<i>“Is that a challenge then? I guess I’m going to have to give it my all so I can get you off of that high-horse of yours then!”</i> Fisianna teases as she flicks one of her tails at your side. Your playful lover rushes to the holoscreen by her theater setup to prepare her gaming rig. You go over to join Fisianna on the couch after she finishes setting the game up and grab a holo-harness. The two of you spend the rest of your time together playing CoV 8 against each other, winning and losing an equal amount of games before deciding on a tiebreaker when the two of you next have a chance to play together again.");
}

public function fifthDateFisi():void
{
	moveTo("ANON'S BAR AND BOARD");
	
	output("<i>“A-actually, I’ve been wondering...”</i> Fisianna has a faraway look in her golden eyes as she stares thoughtfully ahead. <i>“This time, would you want to go to Anon’s with me for our next date?”</i> Fisianna looks at you with a sweet smile on her peachy lips. ");
	output("\n\n<i>“Fisianna, I didn’t take you to be the type to want to hang out at seedy bars...”</i> The surprise on your face must be very apparent since Fisianna giggles at your expression.");
	output("\n\n<i>“Hehehe, of course not, silly!”</i> Fisianna playfully punches your arm. <i>“I... I just wanted to reminisce a little about where we first met is all. I know that sounds a little cliche but it actually would mean a lot to me if we could go there for a little.”</i>");
	output("\n\nIf it means that much to Fisianna to have a romantic date at Anon’s, however odd that may sound, you figure it would be best to oblige to her wishes. You tell Fisianna that you would be willing to go to Anon’s with her and rise up from the bench to offer her a hand. Fisianna smiles widely and takes your hand as you help her off of the bench. She gives you a quick kiss on your cheek in the same motion.");
	output("\n\n<i>“Thank you for granting my silly request. Shall we then?”</i> Fisianna asks pleasantly while hooking her arm around yours and leaning against you. You nod and head towards the elevator shafts down to the Merchant Deck. When the elevator ride arrives at the Merchant Deck, it is only a short walk until you are back inside Anon’s again.");
	output("\n\nNothing much has changed since last you were here. The air is still rife with the smell of smoke, alcohol, and food. Skimpily dressed three breasted waitresses walk around carrying various trays of drinks and foods on three legs. You take a look next to you at Fisianna. She looks a bit uneasy, but upon catching your eyes, she gives you a seemingly resolute look. The two of you make your way to the corner booth where the two of you met and sit down together. A waitress comes by shortly after and takes both of your drink and food orders. Your drinks arrive within a minute and the waitress heads back into the kitchen. Fisianna takes a sip of her fizzy, fruity drink and looks at you, her eyes gleaming in the dim lights of the bar.");
	output("\n\n<i>“You know, ever since the last time you’ve been to my house, Isis won’t stop asking me when you’ll come by again.”</i> Fisianna giggles. <i>“I think she’s taken quite a liking to you!”</i>");
	output("\n\n<i>“Yeah, she’s quite an impressive AI. To think that you made her as a freelance programmer. Most companies would probably kill to have as skilled a programmer as you on their team.”</i>");
	output("\n\nFisianna blushes heavily at your praise. <i>“Y-yeah... believe me, I get repeated offers from companies <b>all</b> of the time, especially from JoyCo and KihaCorp. I know those two companies themselves are heated rivals so I’m not even going to touch a permanent contract with either company, but I’ll take any temporary offer I can from them. They pay very well, usually.”</i>");
	output("\n\n<i>“Have they ever asked to you make anything as advanced as Isis before?”</i> You wonder aloud to the techy neko.");
	output("\n\nFisianna brings a paw to her chin and looks up thoughtfully. <i>“Mmm... not really. Most of my jobs have been pretty standard as far as I know. Just fix this, fix that. Look over this code. Correct anything you see wrong here and there. I try to downplay what I can actually do as much as I can beyond that. I wouldn’t want another Bess-13 and Ben-14 disaster to happen again if they found someone that is as skilled at making AIs as I am...”</i>");
	output("\n\n");
	if (flags["BESS_IN_RUBBLE"] == 1) output("<i>“I wouldn’t say that they were a <b>complete</b> disaster anyways...”</i> You tell Fisianna cryptically. Before she can say anything on the matter, the waitress arrives with your food. ");
	else output("The waitress comes out of the kitchen and arrives with your food. ");
	output("She places down a heaping dish of fish and chips for the both of you and gives the both of you a wink before sashaying off to serve another patron. You decide it would be best to eat while the food is hot so the two of you eat in relative silence for a short while. When the both of you are too full to finish, the waitress comes back and takes your platter away and returns with fresh refills of your drinks before leaving the two of you alone. ");
	output("\n\nYour feline lover wraps her paw-like fingers around yours and looks at you meaningfully. She leans in, about to give you a kiss when you hear an abrupt: <i>“Hey!”</i> Nearby, which startles both Fisianna and yourself. You try to look for for the source of the voice and cannot find it, but you do start to smell something wonderful, and somewhat arousing coming from nearby. You turn towards Fisianna and to your surprise you find someone else next to her; a male zil by the looks of it. He is nicely dressed in a black tight fitting T-shirt and pants and looks fairly handsome as well. Fisianna looks just as surprised at the zil’s sudden appearance next to her, shrinking back to you.");
	output("\n\n<i>“I said hey there! What’s a cute kitty like you doing here hanging around this bar with a bunch of losers?”</i> The zil says in a smooth voice. You would feel irritated at his sudden intrusion on your date and his brazenness for trying to smooth talk Fisianna with you here if it weren’t for that very enticing smell coming from him. It’s working you up, though not in the angry way. Fisianna seems to be receiving the worse of it, as her face is thoroughly flushed with arousal and she has a somewhat dreamy look on her face. He leans in close to Fisianna, whispering to her, but still audible to you.");
	output("\n\n<i>“You and I should ditch the [pc.race] here and go off and have some fun ourselves.”</i> The zil coos to Fisianna while slowly moving his right arm up in down out of view. You assume that he is jacking off under the table in order to secrete his pheromones. If you weren’t so disabled by the potent pheromones coming from the black clothed intruder, you would slug him a good one. Fisianna seems to be putting up a better struggle despite being closer to him.");
	output("\n\n<i>“B-but... I can’t... I-I don’t want to leave [pc.name]...”</i> You can see Fisianna wincing as she tries to resist the zil’s advances. You can see his face start to contort in annoyance while he moves his right arm faster, making the pheromone smell even stronger. You’re almost at your breaking point of leaping on him yourself to directly whiff that hypnotic smell, and licking the honey that comes with it.");
	output("\n\nThe zil raises the free hand he isn’t using to jack himself off to cup Fisianna’s face into his hand. <i>“Only I can show you things that that [pc.race] over there couldn’t even possibly think of doing with you. A smell this wonderful is a one of a kind experience that you can only get with me, and nobody else, though it doesn’t have to be a one-time experience...”</i> The zil leans in to kiss Fisianna. ");
	if (pc.WQ() < 40)
	{
		output("\n\nYou’re still immobilized from sheer lust and helpless to watch. When he is mere inches from Fisianna’s face, and you think Fisianna is completely lost to the pheromones, you hear a cat-like hiss and see a white paw flash across the zil’s face. The brash interloper is launched backwards and out of the side of the booth onto the floor. The smell of pheromones suddenly becomes much less intense and you snap out of your lust-addled state to see Fisianna standing over the fallen bee-like man. He has a look of shock, anger, and pain written all over his face as he struggles and fails to straighten up and sheathe his penis inside of his pants.");
		output("\n\n<i>“What the fuck?! Are you crazy you little-”</i> The zil curses as he glowers at your feline companion. Fisianna is shaking on the spot, whether from being released, the pheromones or anger, you can’t immediately tell until you see her fur standing up on end and her ears turn flat and backwards. In between a cat-like growl, she speaks up.");
		output("\n\n<i>“Y-you... our night was going <b>so</b> well until you decided to come over and try to <b>drug</b> us. I can’t stand people that can’t give a shred of decency towards people who just want to have a good time to themselves and consciously try to pry couples apart for their own perversion. You are the <b>worst</b> type of person. I’m not so easy that I would fall head over heels for you, even with your enticing smell. I’d never leave [pc.name] for something as petty as that. If you don’t want another one across your face, then either stay down or crawl away.”</i> Fisianna hisses. The zil considers his options before conceding to crawl and scurry away. The patrons that were watching the scene start to cheer at Fisianna, some laughing and jeering at the fleeing bee. Fisianna snaps out of her anger as soon as the zil hurries out of sight and starts to blush furiously when she sees most of the bar cheering for her. She then takes her seat back next to you with nothing but concern for you etched on her face.");
		output("\n\n<i>“[pc.name]! Are you alright? I hope his scent didn’t affect you too much. I-I’m sorry for suggesting this stupid idea to come to this bar in the first place...”</i> Tears start to well up in her eyes as she wraps her arms around you to hug you. You can hear her start to sob into your chest, to which you do your best to comfort her by rubbing her back and between her ears. Fisianna cries into your chest for a few minutes before finally letting you go. You give her your best smile as she looks passionately at you under her tearstained golden eyes. Just at this moment, you see a kui-tan approach your table. He looks rather dapper for being in a bar like this.");
	}
	else
	{
		output("\n\nWith a great deal of willpower, you are able to shake off the tantalizing smell coming from the masturbating bee. Right before the zil’s long tongue can reach Fisianna’s lips, you yank the catgirl backwards, while with your free hand you give the brazen interloper a good punch across his face. He reels from the blow and falls out of the side of the booth and onto the floor. The smell of pheromones suddenly becomes much less intense and you can see that Fisianna has snapped out of her lust-addled state. The zil has shock, anger, and pain written all over his face as he struggles and fails to straighten up and sheathe his penis inside of his pants.");
		output("\n\n<i>“You... you were supposed to be helpless before my sweet scent. Nobody asked you to interfere, you asshole.”</i> The zil curses as he glowers at you. Words cannot describe the rage you are feeling at this bee ruining your date with Fisianna. Despite this, you ");
		if (pc.isNice())
		{
			output("calmly approach the fallen interloper, but not without unholstering your [pc.weapon] and brandishing the weapon to his face.");
			output("\n\n<i>“Well... you thought wrong this time. Now, would you kindly move along, before anything unfortunate happens? My girlfriend and I were enjoying a date before you came along.”</i> ");
		}
		else if (pc.isMischievous())
		{
			output("approach the fallen interloper and kneel down next to him, fancily unholstering your [pc.weapon] and brandishing the weapon to his face.");
			output("\n\n<i>“Frankly, I don’t recall asking you to interfere either. Now, would you mind getting out of here? Me and the girl have a date to finish, <b>without</b> a certain lecherous bee swarming around.”</i> ");
		}
		else
		{
			output("menacingly approach the fallen zil and grab him by the scruff of his shirt. You unholster your [pc.weapon] and shove the weapon to mere centimeters from his face.");
			output("\n\n<i>“You’re lucky it was just a punch. If you don’t want it to be anything more, I’d get out of my sight ASAP. I don’t want to make any trouble in front of the girl, ‘specially on our date.”</i> ");
		}
		output("You shake your weapon to the side in a dismissive manner, to which the zil immediately scrambles away. The patrons that were watching the scene start to cheer for you, some laughing and jeering at the fleeing bee. When the zil bursts through the exit, you put your [pc.weapon] away and take your seat next to Fisianna. Her face has nothing but loving awe written all over it.");
		output("\n\n<i>“W-wow... that was amazing, [pc.name]! I’m not sure how you were able to resist that zil’s pheromones, b-but I sure couldn’t at that time... Thank you...”</i> Despite her heartfelt thanks for saving her, tears start to well up in the catgirl’s eyes. She wraps her arms around you to hug you. You can hear her start to sob into your chest, to which you do your best to comfort her by rubbing her back and between her ears. Fisianna cries into your chest for a few minutes before finally letting you go. You give her your best smile as she looks passionately at you under her tearstained golden eyes. Just at this moment, you see a kui-tan approach your table. He looks rather dapper for being in a bar like this.");
	}
	output("\n\n<i>“Hello, I apologise for what just happened there with that zil... That guy is usually a troublemaker. Say, what’s your name, lady?”</i> He looks pointedly at Fisianna.");
	output("\n\n<i>“M-me? I-It’s Fisianna.”</i> she stammers.");
	if (silly && pc.WQ() < 40) output("\n\n<i>“Well, they ought to start calling you <b>Fist</b>ianna. That was one mean right hook you gave him!”</i> The kui-tan laughs.");
	output("\n\n<i>“I’m the bartender working the shift tonight... Hey, to make things up to the two of you, this visit, and the next visit that you come here, drinks and food are on us. I know it’s not much to make up for what happened, but it’s the least we can do.”</i>");
	output("\n\n<i>“I... y-you don’t have to do all that for us...”</i> Fisianna blushes bashfully.");
	output("\n\nThe bartender raises a defiant finger in front of him and waves it. <i>“We insist, as long as you can continue to be a patron here!”</i>");
	output("\n\n<i>“W-well... okay.”</i> Fisianna concedes. The bartender turns and walks away to go back behind the bar. She then turns to you with a bright blush and a somewhat sad look on her face.");
	output("\n\n<i>“U-um, [pc.name]... I’m sorry, but we might have to cut this date a bit short... I-I... I need to get changed after all that. I-I imagine it might be the same case for you too.”</i> Fisianna laughs timidly. She’s right. Ever since that zil’s pheromone attack subsided, your nethers have been feeling especially wet with excess arousal. You reluctantly agree to call the date over for now before the both of you exit the booth and head out of Anon’s. Once the both of you head back up the elevator and arrive at the residential area, you kiss each other goodbye before Fisianna walks home, albeit with an awkward gait likely due to the wetness in her pants. ");
	
	pc.changeLust(20);
}

public function sixthDateFisi():void
{
	moveTo("RESIDENTIAL DECK FISIS APARTMENT");
	
	output("You bring up the prospect of going out somewhere with Fisianna again. She looks down and away for a moment and looks back into your eyes with hesitation.");
	output("\n\n<i>“Mmm... a-after last time, I-I don’t know if I want to go somewhere public for a little while.”</i> Fisianna looks downward at you with a sad expression on her face. You start to feel a little disappointed as well, cursing the zil that interrupted things the last time you and Fisianna went out. You unconsciously grab your feline lover’s paw and squeeze it gently. She looks up into your eyes again, her facial expression changing slightly after seeing the disappointment on your face.");
	output("\n\n<i>“W-well... that is to say, I-I wouldn’t mind if we spent some time together at my home again, t-that is if you want?”</i> Fisianna gives you a hopeful look while she asks. Your heart jumps in both relief and excitement that she wants to spend some time with you after all. You nod eagerly at Fisianna at the notion of spending some private time with her. She cracks a smile at your enthusiasm and squeezes your hand back. The two of you rise up from the park bench and head over to Fisianna’s apartment.");
	output("\n\nOnce the two of you arrive at her apartment, Fisianna ushers you to take a seat on the couch at her home theater setup while she heads towards the kitchen area. After a few minutes, she sets a few various snacks on the glass table in front of you and walks over to a rack next to the holoscreen.");
	output("\n\n<i>“I-I thought we could both watch a little movie together. I got this romance movie that just came out on holo-DVD that I’ve been dying to see, but I thought it would be best to wait until we both got a chance to see it together. Would you want to watch that with me today?”</i> Fisianna asks sweetly.");
	output("\n\nThere isn’t any other movie that you can immediately think of watching with Fisianna at the moment, and it sounds like she was looking forward to seeing this particular film with you for a while, so you feel inclined to agree with her choice. Fisianna smiles cheerfully as she pops the disc into the holo-disk player under her holo-screen. When she finishes setting up the movie to start playing, the catgirl joins you on the couch and opts to sit on your lap sideways while leaning against you to relax, her ears occasionally swiveling and flicking in front of your view. She feels nice and soft against you as she begins to purr faintly. You hug her close to you while the movie begins.");
	output("\n\nAs the movie goes on, the two of you passively eat your snacks while you cuddle together. When the main character is caught in the climax of an argument between themselves and their current lover, along with a second past lover, you catch Fisianna looking up at you out of the corner of your eye. When the argument dies down and resolves, she speaks up.");
	output("\n\n<i>“U-um, [pc.name]... I-I’ve been wondering. Uh... w-what’s your stance on love?”</i> Fisianna stammers on her question.");
	output("\n\n<i>“I’m a bit confused, you might have to elaborate on that, Fisi.”</i> You look down at Fisianna and she has a look of deep curiosity on her face.");
	output("\n\n<i>“O-oh, what I mean is, I-I know the space frontier is usually more libidinous than I’m used to, s-so I imagine on the Rush, you might meet a number of others that are interested in you, possibly. There might come times where you might be enticed to, or even forced into an unfortunate situation, l-like with that zil from before. You might even meet some people that fall in love with you just about as hard as I have. I-I just want to know what your view is if those things were to happen, even though you choose to be with me.”</i> Fisianna cutely traces a finger on your chest while she asks you.");
	
	processTime(60 + rand(5));
	
	addButton(0, "Monogamous", sixthDateMono);
	addButton(1, "Open-Relationship", sixthDateOpen);
	addButton(2, "Polyamorous", sixthDatePoly);
}

public function sixthDateMono():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	flags["FISI_REL_TYPE"] = 1;
	
	output("<i>“Fisianna, despite any incidents that could occur on the Rush, you would be the only one that I could ever love and want to be with.”</i> To emphasise your point, you give Fisianna a smooch. You can feel her melting in your arms while she begins to kiss you back. You kiss each other passionately for about a minute before separating. Fisianna’s face is flushed bright red, but she is smiling back all the same.");
	output("\n\n<i>“I-I’m glad that I can be that one for you...”</i> Fisianna smiles widely and settles back to leaning against your chest as you go back to watching the rest of the movie. ");
	
	sixthDateMerge();
}

public function sixthDateOpen():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	flags["FISI_REL_TYPE"] = 2;
	
	output("<i>“Fisianna, I’m a believer in that sex and love are two very different concepts. Sex with the one that you love is a lot different on an emotional level compared to with someone else. I hope you don’t think of me any less for thinking that, but this is what I believe.”</i>");
	output("\n\nFisianna has a thoughtful look on her face as she mulls over your words. After a moment, she gives you a smile. <i>“Y-yeah, I think you would be right on that matter. I would much prefer the passion behind the embrace than anything, and who better to share that with than the person that you love...”</i> Fisianna gives you a meaningful look before leaning in to give you a kiss. You accept her lips and hug Fisianna closer to you while the two of you embrace each other. After about a minute of passionate kissing, the two of you separate. Fisianna’s face is flushed bright red, but she is smiling all the same. Your lover hugs herself to you and settles back to laying against your chest as the two of you go back to watching the rest of the movie. ");
	
	sixthDateMerge();
}

public function sixthDatePoly():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	flags["FISI_REL_TYPE"] = 3;
	
	output("<i>“Fisianna, there’s no question that I love you with my heart, though I don’t feel as though I can “contain” all the love I have to give to just one person. I love anyone that I can grow close to and accustomed to. It’s really hard for me to pick favorites among them as well. I hope you can understand this.”</i>");
	output("\n\nFisianna has a thoughtful frown on her face as she mulls over your words. She turns to look at the holoscreen again as she speaks up. <i>“Hm... I-I don’t think I could ever grasp the concept of having multiple lovers so readily as you do. I don’t think I would even be capable of doing anything like that myself...”</i> You’re about to say something in response when Fisianna turns back to you with a smile on her face. <i>“Still, from the time I’ve been with you, I can see why other people could love you so much. If it makes you happy, then I wouldn’t want to be the one to inhibit you from feeling what you would want to. As long as I have a special place in your big heart, I’m happy.”</i>");
	output("\n\nFisianna gives you a meaningful look before leaning in to give you a kiss. You accept her lips and hug Fisianna closer to you while the two of you embrace each other. After about a minute of passionate kissing, the two of you separate. Fisianna’s face is flushed bright red, but she is smiling all the same. Your feline lover hugs herself to you and settles back to laying against your chest as the two of you go back to watching the rest of the movie. ");

	sixthDateMerge();
}

public function sixthDateMerge():void
{
	output("\n\nHalfway through the movie, you start to give Fisianna a gentle massage while she relaxes against you. The catgirl’s purring intensifies as you work off her knots and kinks and she melts into your touch. The two of you watch the movie like this to the point that the main character reunites with his first lover while they reconcile their feelings for one another after a previous argument. The couple decides to head to a hotel and from then on, they can’t keep their hands off of each other as they make their way up to and into their room. To Fisianna’s apparent surprise, the two lovers start to take off their clothing while they make out, until they are naked. They then crawl on the nearby bed, kissing each other in progressively more erogenous places before their bodies line up. As if on instinct, the slightest twitch of their hips sends them into a state of perpetual rut.");
	output("\n\n<i>“I-I wasn’t aware that this movie had a s-sex scene... m-must be an extra feature...”</i> Fisianna fidgets nervously on your lap. She can’t seem to take her eyes off of the copulating couple however, and there’s no denying her growing arousal as her body heat gradually rises against you and her ears flatten sideways and downwards on her head. As the couple on-screen go at it, Fisianna’s eyes start to look more and more distant while she moves around your lap in growing discomfort.");
	output("\n\nYou decide to hoist Fisianna up fully onto your lap so that her back is to you and that she is faced towards the holo-screen. She gasps quietly from being moved, but settles down as you continue your back massage on her. After a moment or two, Fisianna starts to feel even warmer against you, and you can very faintly feel her heartbeat through your hands as her breathing becomes slightly faster. She doesn’t seem to be relaxing any more this way... ");
	output("\n\nAt this point, you start to feel Fisianna’s tails unconsciously grab onto your hands and wrap them around her waist. You hug your feline lover close and relax back against the couch, taking her with you. You can feel Fisianna’s paws overlap your hands while you work one of them under her shirt to caress her bare skin. It is nice, smooth and warm to the touch. You start to snake the hand under her shirt upwards while your other hand starts to move downwards. You can hear Fisianna’s breath catch as you bring your upper hand to the bottom of her bra and lower hand to the hem of her pants. ");
	output("\n\nFisianna gulps loudly as your hands begin to sneak underneath her undergarments. Making sure to sync your hand movements, you move each hand in a careful pace up and down. Your lower hand feels a fine and thin trail of fur going down, which ends when you feel a wet knob. A soft indent in her supple boobflesh lets you know that you have reached her nipple with your upper hand.");
	output("\n\n<i>“H-haaah...”</i> Fisianna exhales in an aroused shudder at first contact with both sensitive spots on her body and presses her paws onto your hands, trapping them closer to her body. You take that as encouragement to start your ministrations on Fisianna’s most sensitive parts. With your lower hand, you begin to tenderly massage the kitten’s clitoris in small circles, and with your upper hand you begin to do the same around the indent on her nipple. She moans a small, <i>“aaahn”</i> while you slowly stimulate her, and she presses herself even more into you, lightly grinding her bottom into you as she does so.");
	output("\n\nWith all of Fisianna’s hair in your face, you can’t exactly see your masterwork at display, but you are doing this more for her benefit anyways. You increase the pace of your work on Fisianna’s clit and nipple, which also increases the pace of her breathing. You can feel the slack of her shirt and pants start to loosen by what you assume are her tails, since her hands are still placed firmly on top of yours. They lift up her shirt and unbuckle the front of her jeans. This gives you much more room to work with as you nudge Fisianna’s legs further apart with your lower hand. You work your thumb to massage her pleasure button while you insert your two middle fingers into the depths of her warm and wet slit. With your upper hand you manage to massage her pebbly nipple out of her inverted boobs and give it a few playful pinches and rubs.");
	output("\n\n<i>“Hah... Hnng... Mmmph... [pc.name]. I-I... Aah...”</i> Fisianna moans to your increased ministrations while your lower hand continues to plumb her warm nethers. You move your hand over to her other breast and start to massage that exposed nipple. At this point, Fisianna’s previous inhibitions are thrown out of the window as she starts grinding her bottom into your lap, hard, and into the rhythm of your pistoning fingers; moaning about as loudly as the couple in the movie.");
	output("\n\nYou decide to alternate hands after a few more moments and bring your upper hand down to massage Fisianna’s wet clitoris and box. You bring your previously lower hand up her mouth. The worked up kitty eagerly takes your wet fingers in her mouth after taking a brief sniff at them. She swirls her tongue around your fingers, eager to taste herself, and you, in her mouth. Fisianna moans and purrs into your fingers, sending lovely vibrations down your arm. ");
	if (pc.hasCock()) output("The thought of swapping your fingers for your penis sends an unimaginable excitement through you.");
	output("\n\nAfter a few moments of finger suckling, Fisianna pops your digits out of her mouth as you start to feel her tense up, and her grinding slows down to a crawl.");
	output("\n\n<i>“I-I... [pc.name]! I-I feel... I’m... h-haaah!”</i> Fisianna moans to the high heavens before you feel her slit clamp tightly around the fingers pumping her, forcing you to stop and let her muscles do the work for you. You can feel her folds milking your fingers for an unobtainable purchase as she shakes uncontrollably from orgasmic bliss on top of you. With your free hand, you begin to stimulate Fisianna’s clitoris again, determined to let her ride out her earthquake of an orgasm as long as possible. You keep going until she screams out in pleasure again, going into a second and more intense orgasm, which utterly douses her panties and your hands. ");
	output("\n\nAfter her convulsions die down from her dual orgasm, you cease your vaginal massage on her. ");
	if (pc.isBimbo() || pc.isBro() || pc.libido() >= 80) output("You raise your soaked hands to your [pc.lipsChaste] and briefly sniff them, taking in the catgirl’s richest scent. The smell quickly overwhelms you, causing you to feverishly lick your hands clean of her tangy girlcum. After you are done tongue-bathing your hand, you wrap your arms around Fisianna’s waist. ");
	else output("You raise your soaked hands to Fisianna’s peachy lips, drawing out more curious sniffs from her. Hungrily, she starts to lick your hands clean of her tangy girlcum after being overwhelmed by her scent. After she is done with tongue-bathing your hand, you wrap your arms around Fisianna’s waist. ");
	output("As she slumps back against you in exhaustion, you lay her in your lap sideways again and rest her head against your chest. She closes her eyes and purrs in your arms from contentment.");
	output("\n\nYou let Fisianna nap through the end of the movie. When it finishes, she rouses from her catnap and looks up into your eyes with half-lidded golden eyes while wearing one of the biggest smiles you’ve ever seen from her.");
	output("\n\n<i>“Mmm, [pc.name]... That was simply the most wonderful feeling that I’ve ever felt my whole life. W-who knew you had such magic fingers?”</i> Fisianna giggles. You chuckle back at your sated lover as she leans into you to give you a long and passionate kiss. After a few minutes, the two of you break the kiss and she rises up from your lap to unload the movie from the holo-disk player.");
	output("\n\n<i>“Y’know, it’s thanks to you that I’m going to have to go back and watch the latter half of this movie, <b>without</b> interference this time.”</i> Fisianna pouts while playfully sticking her tongue out at you.");
	output("\n\nYou go over and wrap an arm around Fisianna and playfully boop her nose with your free hand. <i>“It was worth it though, am I right?”</i> You smile at her. She tries her best to keep a pouty face up, but doesn’t hold it up for long.");
	output("\n\n<i>“Y-yeah... I suppose you’re right. Still, I’ll have to make it up to you sometime, or pay you back. Whichever.”</i> Fisianna shrugs. She then hugs herself tight to you. <i>“Thank you, [pc.name]... for everything.”</i> She meaningfully looks into your eyes and gives you another quick kiss.");
	output("\n\n<i>“Alright, [pc.name]. I had the most wonderful day with you, but you got me all wet, so I need to wash this off and get to work on another project. I-I would be... up to doing something like this again next time, if you want to, of course. I bet you would though.”</i> Fisianna gives you a wink before separating herself from you and heading towards her bedroom door. Satisfied with opening her up a little sexually, you give a goodbye wave to Fisianna at her bedroom, to which she blows a kiss at you before disappearing behind the door. You help yourself out of her apartment and head back to the plaza with a big smile on your face.");

	pc.changeLust(30);
	fisianna.orgasm();
	setFisiAway();
	processTime(60 + rand(15));
	currentLocation = "LIFT: RESIDENTIAL DECK";
	addButton(0,"Next",mainGameMenu);
}

public function sexFisi(skipText:Boolean = false):void
{
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	moveTo("RESIDENTIAL DECK FISIS APARTMENT");
	
	//make sure not to play the won blurbs for the bet scenes from here
	flags["FISI_BET_RESULT"] = 0;

	if (!skipText) {
		clearOutput();
		output("You propose the idea of going back to Fisianna’s place for a bit of ‘fun’ while shooting an unsubtle wink at her, making your intentions clear.");
		output("\n\n<i>“O-oh my... Y-you wanna do... that?”</i> Fisianna’s face lights up in surprise as her face flushes pink. She recovers quickly as her eyes lower halfway, making her look both cute and seductive. <i>“W-well... I-I suppose we <b>could</b>...”</i> Fisianna drags the <i>“could”</i> in mock thought as she stands up from the bench. ");
		if (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output("You follow suit and wrap your [pc.tails] around hers while you walk back to Fisianna’s apartment.");
		else output("You follow suit and walk arm in arm back to Fisianna’s apartment.");
		output("\n\nOnce the two of you arrive, you jump to the attack and seize Fisianna in a fierce and passionate kiss. You lock lips with each other tightly while your tongues dance between the seal of your mouths. Without breaking the kiss, the two of you stumble all the way into her bedroom, where you eventually trip over the edge of her bed, consequently pulling the both of you apart. Fisianna looks at you with her golden eyes, filled with passion and hunger for you as you lay next to each other side by side on the bed, panting for breath from the long kiss. You think about what you would like to do with your feline lover this time.");
	}

	var cIdx:int = largestCockIndexThatFitsFisiDimensions();
	
	if (pc.hasCock() || pc.hasVagina()) addButton(0, "Tailjob", tailjobFisi, undefined, "Tailjob", "Let her tails go to work on you.");
	else addDisabledButton(0, "Tailjob", "Tailjob", "You need a cock or vagina for this.");
	
	if (flags["FISI_SEX_NUMBER"] >= 1) addButton(1, "Eat Her Out", eatOutFisi, undefined, "Eat Her Out", "Munch on her pussy.");
	else addDisabledButton(1, "Eat Her Out", "Eat Her Out", "It doesn’t look like she is comfortable enough with you to do this yet.");
	
	if (!(flags["FISI_SEX_NUMBER"] >= 2)) addDisabledButton(2, "Sixty-Nine", "Sixty-Nine", "It doesn’t look like she is comfortable enough with you to do this yet.");
	else if (pc.hasVagina() || cIdx >= 0) addButton(2, "Sixty-Nine", sixtyNineFisi, undefined, "Sixty-Nine", "Lick each other up.");
	else addDisabledButton(2, "Sixty-Nine", "Sixty-Nine", "You need a cock that fits or vagina for this.");
	
	if (!(flags["FISI_SEX_NUMBER"] >= 3)) addDisabledButton(3, "Vaginal", "Vaginal", "It doesn’t look like she is comfortable enough with you to do this yet.");
	else if (cIdx >= 0 || (pc.hasHardLightEquipped() && pc.hasVagina())) addButton(3, "Vaginal", vaginalFisi, undefined, "Vaginal", "Make love with the feline.");
	else addDisabledButton(3, "Vaginal", "Vaginal", "You need a cock that fits, or a vagina and a hardlight strapon for this.");

	if (!(flags["FISI_SEX_NUMBER"] >= 4)) addDisabledButton(4, "Locked", "Locked", "It doesn’t look like she is comfortable enough with you to do this yet.");
	else if (flags["FISI_TIMES_SEXED"] == undefined || flags["FISI_TIMES_SEXED"] < 3) addDisabledButton(4, "Sex Bet", "Sex Bet", "You should have sex with her a few more times for her to be comfortable enough for this.");
	else addButton(4, "Sex Bet", betFisi, undefined, "Sex Bet", "Make things interesting; play a game and see who gets to decide what to do with the other!");
	
	if (flags["FISI_TIMES_ORAL"] == undefined) addDisabledButton(5, "Locked", "Locked", "You’ll need to win against Fisi and do this with her to unlock this.");
	else if (fisiPrurience() >= 50) addDisabledButton(5, "Oral", "Oral", "At Fisi’s current level of prurience, it would be best to get her in a more ‘giving’ mood to do this without the incentive of betting for it.");
	else addButton(5, "Oral", oralFisi, true, "Oral", "Have the kitten service you!");

	if (flags["FISI_TIMES_ANAL"] == undefined) addDisabledButton(6, "Locked", "Locked", "You’ll need to win against Fisi and do this with her to unlock this.");
	else if (fisiPrurience() >= 25) addDisabledButton(6, "Anal", "Anal", "At Fisi’s current level of prurience, it would be best to get her in a more ‘giving’ mood to do this without the incentive of betting for it.");
	else if (cIdx >= 0 || (pc.hasHardLightEquipped() && pc.hasVagina())) addButton(6, "Anal", analFisiI, true, "Anal", "Give the feline some good ol’ butt loving!");
	else addDisabledButton(6, "Anal", "Anal", "You need a cock that fits, or a vagina and a hardlight strapon for this.");
	
	if (flags["FISI_TIMES_RIDDEN"] == undefined) addDisabledButton(7, "Locked", "Locked", "You’ll need to lose against Fisi and do this with her to unlock this.");
	else if (fisiPrurience() < 50) addDisabledButton(7, "Get Ridden", "Get Ridden", "At Fisi’s current level of prurience, it would be best to bring up her sexual confidence to do this without being influenced by a bet.");
	else if (cIdx >= 0) addButton(7, "Get Ridden", getRiddenByFisiI, true, "Get Ridden", "Have the kitty ride you!");
	else addDisabledButton(7, "Get Ridden", "Get Ridden", "You’ll need a fitting penis to be able to do this.");
	
	if (flags["FISI_TIMES_PEGGED"] == undefined) addDisabledButton(8, "Locked", "Locked", "You’ll need to lose against Fisi and do this with her to unlock this.");
	else if (fisiPrurience() < 75) addDisabledButton(8, "Get Pegged", "Get Pegged", "At Fisi’s current level of prurience, it would be best to bring up her sexual confidence to do this without being influenced by a bet.");
	else addButton(8, "Get Pegged", getPeggedByFisiI, true, "Get Pegged", "Let Fisi experiment with her hard-light toy with you!");

	if (flags["FISI_TIMES_VAG"] == undefined) addDisabledButton(9, "Locked", "Locked", "It doesn’t look like she is comfortable enough with you to do this yet.");
	else if (flags["FISI_TIMES_BET"] == undefined) addDisabledButton(9, "Breed Her", "Breed Her", "You should get her to open up more sexually first with a friendly bet or two!");
	else if (flags["FISI_TIMES_BREED"] == undefined && !pc.hasItemByClass(BreedersBliss, 2)) addDisabledButton(9, "Breed Her", "Breed Her", "You need to have two Breeder’s Bliss with you for this.");
	else if (cIdx >= 0) addButton(9, "Breed Her", breedFisiI, true, "Breed Her", "Breed the kitten with some help with Breeder’s Bliss!");
	else addDisabledButton(9, "Breed Her", "Breed Her", "You’ll need a fitting penis to be able to do this");
}

public function tailjobFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	moveTo("RESIDENTIAL DECK FISIS APARTMENT");
	
	IncrementFlag("FISI_TIMES_TJ");
	IncrementFlag("FISI_TIMES_SEXED");
	flags["FISI_LAST_SEXED"] = GetGameTimestamp();

	if (flags["FISI_SEX_NUMBER"] == undefined) output("<i>“Mmm... [pc.name]. I-I’ve actually been thinking... I wanted to repay you for what you did during the movie the time before. Your caress... your touch felt so good, and I appreciate that you’re willing to take things slow with me. I feel I might have left you a little hot and bothered then so... I was wondering if I could provide some... ‘help’ with that?”</i> Fisianna asks coyly as she raises her twin tails, waving them in front of her to hint at what she plans to do to repay your earlier effort. ");
	else output("<i>“D-did you like the feel of my tails on you the last time? I’d be happy to rub them on you again since you seem to like them so much!”</i> Fisianna raises both of her tails and waves them in front of you like snakes to a charmer’s flute. The anticipation of feeling those on your loins again is killing you.");
	output("\n\nYou start to smile in realization of what Fisianna has in store for you and lie back on her bed with your legs hanging from the edge. She joins you and sits next to you on the bed while you wait in anticipation. ");
	if (!pc.isNude()) output("You start to feel a pair of paws begin to work as they begin to strip you of your [pc.gear]. With some assistance from you, you shimmey to slide them off. ");
	output("Fisianna pauses for a few moments to marvel at your exposed body. She eventually snaps back to reality, and her tails wander over to your nethers to investigate what she has to work with.");
	if (pc.hasCock())
	{
		output("\n\nFisianna’s tails gently move over towards your [pc.cocks] and make their first contact with your genitals. The fur on her tails feels very ticklish at first. You struggle to keep from fidgeting at the odd sensation. The titillating feeling quickly subsides just as one of her tails starts to gently coil itself around your [pc.cockBiggest]. ");
		if (pc.hasVagina()) output("Her other tail works its way lower down your groin to your [pc.vagina]. ");
		else if (pc.balls > 0) output("Fisianna’s other tail works its way down your groin and onto your [pc.sack]. ");
		output("\n\nThe tail wrapped around your [pc.cockNounBiggest] begins to move. It rubs up and down in a slow, but very sensual manner as you begin to feel your first pangs of pleasure. ");
		if (pc.hasVagina())
		{
			output("The other tail that is nearing your [pc.vagina] moves down and makes contact with your [pc.clits]. Fisianna uses the tip of her tail to start to stimulate your pleasure button");
			if (pc.vaginaTotal() > 1) output("s");
			output(" as her coiled tail sensually rubs against your member. ");
		}
		else if (pc.balls > 0) output("The other tail that is nearing your [pc.sack] moves down and makes contact with your [pc.balls]. Fisianna’s tail sensuously massages its way around them with an occasional lift and cup. ");
		output("\n\n<i>“D-does this feel good, [pc.name]?”</i> Fisianna asks you sweetly. You nod and give a small groan in approval. Fisianna giggles softly and resumes her focus on you. Her tail squeezes slightly tighter on your [pc.cockNounBiggest] while slowly increasing the pace at which it strokes up and down. ");
		if (pc.hasVagina()) output("The tail tip that is on your [pc.clits] starts to rub faster against you. ");
		output("Dabs of precum form on your [pc.cockHeadBiggest] as her ministrations on you start to tilt you closer to the edge. Your mind starts to switch into autopilot as you fall deeper and deeper into the throes of pleasure. You subconsciously reach your hand towards your genitalia to touch the fluffiness of Fisianna’s tail and perhaps to aid in stroking yourself off in your fluffy cock sheath, but your feline lover’s paw meets your hand halfway over and she interlaces her fingers with yours.");
		output("\n\n<i>“You don’t have to exert yourself, [pc.name]. I’ll do all the work for you, so relax...”</i> Fisianna says lovingly. You look up to your companion’s face and she gives you a warm smile. You smile back and relax your head back on the bed to stare at the ceiling. ");
		output("\n\nThe pre that has been accumulating on your [pc.cockHeadBiggest] dribbles into Fisianna’s fur, slickening her tail and making her stroking movements on your [pc.cockNounBiggest] feel much smoother. Your hips start to lurch upwards as your climax nears. You feel movement next to you before Fisianna’s smiling visage comes into view. She leans down to give you a sweet and passionate kiss to your [pc.lipsChaste]. As her peachy lips make contact with yours, Fisianna’s tail moves at a much more feverish pace than before. ");
		if (pc.hasVagina())
		{
			output("The tail that is massaging your [pc.vaginaColor] pearl");
			if (pc.vaginaTotal() > 1) output("s");
			output(" also thrums back and forth at the same fast pace. ");
		}
		else if (pc.balls > 0) output("The tail massaging your [pc.sack] gently squeezes at your [pc.balls] as if attempting to coax their contents out of them. ");
		output("Fisianna breaks the kiss just as you are about to explode with ecstasy, making you fidget madly at the incoming orgasm. You desperately try to hold back on blowing your load so you can feel her tail");
		if (pc.balls > 0 || pc.hasVagina()) output("s");
		output(" working on you for a while longer. She gives you the same sweet smile and leans in again to coo softly into your [pc.ear]. ");
		output("\n\n<i>“G-go ahead, [pc.name]. Please, let it go... I won’t mind any mess.”</i> She then traces light kisses from your ear back to your mouth again. The combined feeling of her warm breath whispering seductively into your ear urging you on, as well as her warm lips on yours, sends you over the edge and beyond as you let go of your restraints on command. You moan deep into Fisianna’s mouth while you cum into her coiled tail. ");
		if (pc.hasVagina() && pc.wetness() >= 3) output("You can faintly hear your [pc.cumVisc] cum, as well as the [pc.girlCum] spasming from your [pc.vagina] spatter on the carpet as her tail continues to milk your [pc.cockBiggest] through the rest of your orgasm. ");
		else output("You can faintly hear your [pc.cumVisc] cum spatter on the carpet as her tail continues to milk your [pc.cockBiggest] through the rest of your orgasm.");
		output("\n\nWhen your orgasm finally subsides, you break the kiss with Fisianna and lay in bed panting, out of breath and feeling winded as though you had been the active partner. Your feline lover is beaming down at you, likely in happiness that she took you through such a wonderful ride.");
		if (flags["FISI_SEX_NUMBER"] == undefined)
		{
			output("\n\n<i>“I-I hope you liked that... t-that was the very first time I ever had the chance to work on someone’s... penis, before. Usually I mainly know how get myself going...”</i> Fisianna looks away briefly and laughs sheepishly. ");
			if (pc.isNice()) output("\n\n<i>“Really? That was your first time?! That was amazing for a first timer!”</i> ");
			else if (pc.isMischievous()) output("\n\n<i>“Huh, reeeeally? I can’t say I’m not skeptical that it was. Either that really was or you had a <b>lot</b> of practice with a dildo.”</i> ");
			else output("\n\nYou scoff. <i>“Hah! I don’t believe that at all judging by <b>that</b> performance.”</i> ");
			output("Fisianna laughs even harder and blushes at your praise.");
			output("\n\n<i>“T-thank you, but yes... It is. If you didn’t know already, I am a virgin. T-that’s partially why I want to take things a little slow. I’m glad you’ve been patient with me so far.”</i>");
		}
		output("\n\nYou lean in and give Fisianna a quick peck on her peachy lips before you slide out of the bed. She rises up with you and briefly heads out of the room. ");
		if (pc.hasVagina() && pc.wetness() >= 3) output("Fisianna comes back a few moments later with a cleaning droid and sets it to clean the [pc.cumNoun] and [pc.girlCumNoun] off of the carpet. ");
		else output("Fisianna comes back a few moments later with a cleaning droid and sets it to clean the [pc.cum] off of the carpet. ");
		output("She then turns to you.");
		output("\n\n<i>“Y-you’re free to use my shower to clean yourself off if you would like to?”</i> Fisianna suggests to you. A smile starts to creep across your face as you suggest that she join you in the shower. Fisianna giggles lightheartedly at your libidinous proposition.");
		output("\n\n<i>“Hehe, one thing at a time, [pc.name].”</i> Fisianna waves a hand at you in mock-dismissiveness. You shrug back and head into her bathroom to wash up. When you’re done washing off every nook and cranny that you can, you come out of her bathroom refreshed. ");
		if (!pc.isNude()) output("Fisianna already has your [pc.gear] laid out neatly on the bed, and from the looks of it, she cleaned them up for you too! You put on your belongings and make your way out of the bedroom. ");
		else output("You make your way out of the bedroom after a brief stretch. ");
		output("You can hear a shower running on the nearby door to the guest lavatories. You are about to knock when you see a note on the door saying: <i>“I’m likely going to be showering by the time you leave, so I wanted to thank you for the wonderful time, [pc.name]! I look forward to when we can do this again! P.S. Don’t you even think about joining me. I’ve gotten messy enough for one day! ;)”</i>");
		output("\n\nYou chuckle to yourself at Fisianna’s foresight and help yourself out of her apartment, as happy and refreshed as can be.");
	}
	else
	{
		output("\n\nFisianna’s tails gently move towards your [pc.vagina] and makes their first contact with your [pc.clits]. With the fur on her tails, it feels very ticklish against your bud");
		if (pc.vaginaTotal() > 1) output("s");
		output(" at first, and you struggle to keep from fidgeting at the odd sensation. The titillating feeling quickly goes away just as one of her tails moves further down to the folds of your vagina and starts to press against them.");
		output("\n\nThe tail that is on your [pc.clits] begins to move, making tantalizingly slow circles around ");
		if (pc.vaginaTotal() > 1) output("them");
		else output("it");
		output(". The other tail pressing against the lips of your [pc.vagina] also start to move, teasing the opening of your warm nethers by gently moving up and down your slit. You let out a small moan while your naughty bits are being toyed with. Your breathing starts to increase in pace as Fisianna continues to search for the right buttons to press.");
		output("\n\n<i>“D-does this feel good, [pc.name]?”</i> Fisianna asks you sweetly. You nod and give a small moan in approval. Fisianna giggles softly and resumes her focus on you. One of her tails starts to move in more vigorous circles around your pleasure button");
		if (pc.vaginaTotal() > 1) output("s");
		output(" while the tail that is rubbing up and down your slit starts to press harder against you, poking and prodding at your entrance. It takes every ounce of your being to resist assisting Fisianna with your growing urges to start rutting her tails. Your mind starts to switch into autopilot as you fall deeper and deeper into the throes of pleasure. Unconsciously, you start to reach towards your [pc.chest] and almost reach your nipples before your progress is interrupted by your lover’s paw. Upon meeting your hand halfway, she interlaces her fingers with yours.");
		output("\n\n<i>“P-please, allow me, [pc.name]. Just lay back and relax, and let me take care of everything. This is for you...”</i> Fisianna says affectionately. You look up to Fisianna’s face and she gives you a warm smile. You smile back and relax your head back on the bed to stare at the ceiling.");
		output("\n\nFisianna uses the paw not holding your hand to reach over to your [pc.chest] and softly tease and caress your [pc.nipples]. Her ministrations on your nub");
		if (pc.vaginaTotal() > 1) output("s");
		output(" start to pick up in pace while her teasing circles start to alternate with playful flicks on ");
		if (pc.vaginaTotal() > 1) output("them");
		else output("it");
		output(". The tail that is sliding up and down your slit begins to push its way inside of you. Your folds gratefully accept the fuzzy quasi-dildo inside of you, and you give an even louder moan at the satisfaction of finally being penetrated. The tail inside you pumps in and out slowly while the tail outside strums at your [pc.clits]. You are already nearing your peak from the previous build up, as your hips start to lurch upwards into Fisianna’s busy tails. You feel movement next to you before your lover’s smiling visage comes into view. She leans down to give you a sweet and passionate kiss to your [pc.lipChaste]. As her peachy lips make contact with yours, Fisianna’s tails move at a much more feverish pace than before.");
		output("\n\nThe two of you passionately kiss for a few moments before you pull away from Fisianna’s lips, to gasp just as you are about to explode. The mounting feelings of pleasure make you fidget madly while she continues to work you to orgasm. You desperately try to hold back from creaming on her tails so she can work on you for a while longer. Fisianna gives you the same sweet smile and leans in again to coo softly into your [pc.ear].");
		output("\n\n<i>“I-it’s ok, [pc.name]. You don’t have to hold back on my account. Let it out whenever you feel.”</i> She then traces light kisses from your ear back to your mouth again. After feeling her warm breath whispering seductively into your ear urging you on and feeling her warm lips on yours again, you are sent over the edge and beyond as you let go of your restraints on command. You moan deeply into Fisianna’s mouth while you cum on her tails. ");
		if (pc.hasVagina() && pc.wetness() >= 3) output("You can faintly hear your [pc.girlCum] spatter on her carpet. ");
		output("Your [pc.legs] clench around Fisianna’s tails while your vaginal walls attempt to milk them for their non-existent payload. Her tails weakly stimulate you through your full-body orgasm, determined to ride it out as long as possible.");
		output("\n\nWhen your orgasm finally subsides, you break the kiss with Fisianna and lay in bed panting, out of breath and feeling winded as though you had been the active partner. Your feline lover is beaming down at you, likely in happiness that she took you through such a wonderful ride.");
		if (flags["FISI_SEX_NUMBER"] == undefined)
		{
			output("\n\n<i>“I-I hope you liked that... t-that was the very first time I ever had the chance to work on someone... else before. Usually I mainly know how get myself going...”</i> Fisianna looks away briefly and laughs sheepishly.");
			if (pc.isNice()) output("\n\n<i>“Really? That was your first time?! That was amazing for a first time!”</i> ");
			else if (pc.isMischievous()) output("\n\n<i>“Huh, reeeeally? I can’t say I’m not skeptical that it was. You <b>had</b> to have a lot of practice.”</i> You smirk playfully.”</i> ");
			else output("\n\nYou scoff. <i>“Hah! I don’t believe that at all judging by <b>that</b> performance.”</i> ");
			output("Fisianna laughs even harder and blushes at your praise.");
			output("\n\n<i>“T-thank you, but yes... It is. If you didn’t know already, I am a virgin. T-that’s partially why I want to take things a little slow. I’m glad you’ve been patient with me so far.”</i>");
		}
		output("\n\nYou lean in and give Fisianna a quick peck on her peachy lips before you raise yourself from the bed, helping her off of the bed as well. ");
		if (pc.hasVagina() && pc.wetness() >= 3) output("Fisianna puts a finger up in front of you and tells you to hold on a moment before she heads out of the room. She comes back a few moments later with a cleaning droid and sets it to clean the [pc.girlCumNoun] off of the carpet. ");
		output("Fisianna then turns to you.");
		output("\n\n<i>“Y-You’re free to use my shower to clean yourself off, if you’d like to?”</i> Fisianna suggests to you. A smile starts to creep across your face as you suggest that she join you in the shower. Fisianna giggles lightheartedly at your libidinous proposition.");
		output("\n\n<i>“Hehe, one thing at a time, [pc.name].”</i> Fisianna waves a hand at you in mock-dismissiveness. You shrug back and head into her bathroom to wash up. When you’re done washing off every nook and cranny that you can, you come out of her bathroom refreshed. ");
		if (!pc.isNude()) output("Fisianna already has your [pc.gear] laid out neatly on the bed, and from the looks of it, she cleaned them up for you too! You put on your belongings and make your way out of the bedroom. ");
		else output("You make your way out of the bedroom after a brief stretch. ");
		output("You can hear a shower running on the nearby door to the guest lavatories. You are about to knock when you see a note on the door saying: <i>“I’m likely going to be showering by the time you leave, so I wanted to thank you for the wonderful time, [pc.name]! I look forward to when we can do this again! P.S. Don’t you even think about joining me. I’ve gotten messy enough for one day! ;)”</i>");
		output("\n\nYou chuckle to yourself at Fisianna’s foresight and help yourself out of her apartment, as happy and refreshed as can be.");
	}
	
	if (flags["FISI_SEX_NUMBER"] == undefined) flags["FISI_SEX_NUMBER"] = 1;
	
	currentLocation = "RESIDENTIAL DECK 13";
	pc.orgasm();
	processTime(50+rand(25));
	pc.shower();
	addButton(0,"Next",mainGameMenu);
}

public function eatOutFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(1);
	clearMenu();
	
	moveTo("RESIDENTIAL DECK FISIS APARTMENT");
	
	IncrementFlag("FISI_TIMES_EATEN");
	IncrementFlag("FISI_TIMES_SEXED");
	flags["FISI_LAST_SEXED"] = GetGameTimestamp();

	output("Without warning, you pounce onto Fisianna and fiercely lock lips with her again, resuming your kiss from before. The two of you press so hard into each other’s mouths with such passion that you almost wind up brushing teeth against one another. Your tongues vie for dominance in a sensual struggle between closed lips. Eventually you win out and roll Fisianna below you, pinning her down under you. She moans fervidly into your mouth as she concedes defeat in the tongue battle.");
	output("\n\nYou start to snake one of your hands off of Fisianna’s face and run it down her lithe body. Her breath catches when your hand reaches one of her breasts. You give it a playful squeeze and Fisianna squeals with delight into your mouth. Unfortunately for the feline, her chest pillows are not your main target this time. Your hand snakes lower and lower down her petite body until you bridge the hem of cloth between her shirt and her pants. There, you worm your hands under her pants and feel the familiar trail of fur leading down to her sensitive knob. On contact with Fisianna’s pleasure button, she breaks the kiss and lets out a hearty moan. After she quickly settles down, she looks into your eyes and smiles excitedly.");
	output("\n\n<i>“Mmm... do I get to feel those wonderful hands of yours on me again?”</i> She asks coyly. You smile devilishly back at Fisianna and start to move your fingers to stimulate her clit. She flinches at this and closes her eyes to concentrate on the feelings on her nethers. You lean in to suck and kiss at the catgirl’s neck while her legs occasionally twitch and squirm around your busy hand. Fisianna is panting loudly, giving off sweet moans on occasion as you continue to tease her. ");
	output("\n\nFisianna’s thighs suddenly clamp tightly around your hand after a minute of clit rubbing. <i>“Ha... [pc.name]! I-I feel like I’m g-gonna...”</i> She moans as she is about to arrive at the precipice of her mounting orgasm. At the very mention of her calling out to you, you abruptly stop your ministrations on her. Fisianna releases your hand from the soft prison of her thighs and looks up at you with confusion written all over her face.");
	output("\n\n<i>“U-uh... [pc.name]... You stopped. I-Is there anything the matter?”</i> Fisianna looks down at you in concern.");
	output("\n\nYou don’t answer back, but start to paint a trail of kisses from her neck down to her chest. You can feel Fisianna trying to press her body into your kisses. Even though she likely can’t properly feel them through her clothing, you can tell she enjoys the intimate affection anyways. You kiss your way down to her navel and further until you stop at where you estimate her previously teased clit is. The tangy smell of her arousal from your literal handiwork flows through her pants while you plant repeated kisses on the area, basking you in the rich aroma. You look up from between Fisianna’s legs and give her a reassuring smile.");
	if (flags["FISI_SEX_NUMBER"] < 2) output("\n\nFisianna’s eyes go wide at the realization of what you have intended for her. <i>“U-uhm... d-do you really want to... uh... use your mouth d-down there?”</i> Fisianna stutters. Her face mostly shows surprise and uncertainty initially, but you can see a corner of her mouth curling upwards while her eyes dart away in thought and curiosity. You vigorously nod your head and plant another kiss on her clothed nethers for emphasis. At that, the uncertainty on her face washes away and she smiles and nods in encouragement to continue.");
	else output("\n\nFisianna gives you a knowing grin as your eyes meet. <i>“G-go ahead [pc.name]. I-I want to feel your tongue down there again... Hnnn... I can’t wait...”</i> She whispers the last part to herself dreamily and rests her head back on the bed to relax.");
	output("\n\nAt Fisianna’s approval, you rise up to unfasten and slowly take off Fisianna’s jeans, revealing her lacy, white panties to you. You see that her panties are adorned with a cute pattern of cat paws on the trim of the lacy fabric. You laugh inwardly, unsurprised that even her undergarments are kitten themed. To your delight, you can see that her panties are fairly soaked, letting you faintly see the outline of her aroused labial lips. You lightly toss Fisianna’s jeans aside and gently work your fingers under the top of Fisianna’s panties. Once there, you ease them off, revealing her bare vagina to you");
	if (flags["FISI_SEX_NUMBER"] < 2) output(" for the first time");
	output(". The potent smell of Fisianna’s arousal from her now pantiless crotch tickles your nose in a pleasant way. You clear your head with a brief shake and move to dive in between her legs again. You lift both of Fisianna’s legs over your shoulders and curl your arms under and around her thighs so that she will be as comfortable as possible while you munch on ");
	if (silly) output("the pussy’s pussy.");
	else output("her box.");
	output("\n\nYou lean in and deeply inhale the sweet scent of Fisianna’s sexual fluids between her legs. The concentrated aroma this time nearly drives you over the edge, causing you to want to just dive in between her lips and go at it, but you do your best to hold firm. You slip your [pc.tongue] out of your mouth and lick at the inside of one of Fisianna’s thighs to taste her [fisianna.skinFurScales] and to lap up some of the love juices that leaked out from your earlier teasing. You can feel her twitch slightly when your tongue makes contact with her [fisianna.skinFurScalesNoun], but she otherwise stays relaxed over your shoulders. When you near her labial lips, you switch to the other leg and work your way up her thigh towards the center. When you reach her slightly puffy mound, you lap up the girl nectar that spilled just outside of her entrance, licking it up in a circle around her open slit.");
	output("\n\nYou hear Fisianna give a gentle moan while you encircle her engorged mons with your tongue. You look up from between her legs and find that she is looking down at you with a faraway look in her golden eyes. Her mouth is agape and her chest swells up and down in a steady procession.");
	if (pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE))
	{
		output("\n\nYou decide to give Fisianna a surprise when you momentarily cease your ministrations on her labial lips and use your long prehensile tongue to its full advantage. You extend your [pc.tongue], slithering it past her sensitive button and along her love trail of fur. You keep it going, sliding your tongue further and further up Fisianna’s navel and under her shirt until you nearly reach her chest. Fisianna looks down at you in curiosity, and then shock as your elongated oral muscle reaches her lacy bra.");
		if (silly) output("\n\nUpon noticing Fisianna’s expression, you quickly slide your tongue past her bra and out from under the neck of her shirt. You lift the tip of your tongue tantalizingly close to the kitten’s face. Her golden eyes follow your hypnotising sways of your [pc.tongue]. After a few moments, Fisianna tries to playfully bat at your tongue with her paw, but you deftly swing it out of the way each time. The playful cat makes adorable meowing sounds while she tries to hit your [pc.tongue] with her paw, but to no avail. On one particular swing, you barely jerk it out of the way of another swing and in the same deft motion, you bring the tip of your tongue to Fisianna’s nose and lightly boop it. Fisianna squeaks in surpriseand brings both of her paws to her nose. You chuckle lightly into her nethers as you bring the tip of your playful oral muscle to her bra again.");
		output("\n\nWith the base of your tongue, you rub gently at Fisianna’s clit while you attempt to slide the tip of your oral muscle under her bra. She seems have caught on to your intentions and you see her face turn to that of wanton pleasure again at your lower stimulation. She then lifts her shirt and bra up, exposing her supple boobflesh for you to explore. With the tip of your tongue, you wrap it around an exposed nipple and roll the rest of what you can around one of her soft melons, gently squeezing it between the coils of your [pc.tongue]. With the base of your tongue, you continue to stimulate Fisianna’s lovebud and press what you can against her folds to take in as much of her sweet juices as possible. She lets a high pitched squeal loose from her lips while you simultaneously work at two of her most sensitive bits at once.");
		output("\n\nAfter a few minutes of switching between each tit, you retract your tongue from Fisianna’s bosom and decide to move in for the main event. Once your [pc.tongue] is fully retracted into your mouth, you swallow to remoisten it and seal your lips around her pussy lips as if French kissing them. You extend your oral muscle again, but this time you aim deep into Fisianna’s honeypot. With the base of your tongue that isn’t in her wet snatch, you begin to stimulate the catgirl’s pink pearl again.");
		output("\n\nWhen the tip of your tongue hits Fisianna’s cervix, her thighs clench around you. You can feel a pair of paws pushing the back of your head deep into her snatch so hard, that you can no longer properly breathe through your nose and you see nothing but stars. You can hear the vibrations of Fisianna’s resounding moan echo through her thighs into your now muffled ears. You definitely hit her on the right spot with that, but you’ll have to fight your way out if you want to breathe again. You repeatedly thrust your [pc.tongue] in and out of her, using your tongue like a long wriggly phallus, trying desperately to bring her to orgasm. Fisianna is definitely becoming wetter, and her grip tighter with each oral thrust you take, as her cries of pleasure rise up an octave.");
	}
	else
	{
		output("\n\nYou decide to go in for the kill at this point and work the tip of your tongue to Fisianna’s sensitive button. Your feline companion’s golden eyes snap wide open for a split second before you see her throw her head back on the bed and let out a body shaking howl of utter pleasure. Now you’ve <i>really</i> got her going! You dive in further, enclosing your mouth on her lower lips as if to French kiss them. You still gently work your tongue on her love bud, prodding and flicking with practiced ease to learn what makes Fisianna tick. Occasionally you take a few dips into her honey pot to lap up all of her sweet nectar. While licking at her folds, you spell out a few uppercase letters to see what reactions you tease out of her.");
		output("\n\nWhen you progress to the letter “G”, Fisianna’s thighs clench around you. You can feel a pair of paws pushing the back of your head so deep into her snatch, that you can no longer properly breathe through your nose and you see nothing but stars. You can hear the vibrations of Fisianna’s resounding moan echo through her thighs into your now muffled ears. ");
		if (silly) output("You definitely hit the <b>G</b>-spot with that one");
		else output("You definitely hit her on the right spot with that one");
		output(", but you’ll have to fight your way out if you want to breathe again. You keep at Fisianna’s folds while repeatedly spelling out the letter “G”, trying desperately to bring her to orgasm. Fisianna is definitely becoming wetter, and her grip tighter with each lick you take, as her cries of pleasure rise up an octave.");
	}
	output("\n\nWhen you are nearly out of breath, you feel your head being lurched upwards as Fisianna presses her nethers into your face. Simultaneously, you feel a small tide of juices flowing into your mouth. Both in lust and in the fact that you don’t want to drown, you slurp and gulp up as much of Fisianna’s girlcum as possible as while her folds spasm around your tongue. When her orgasm starts to subside, you can feel her grip on the back of your head, as well as the vice grip-like hold of her thighs, start to slacken. You take that moment to separate from the catgirl’s pussy and take in a deep, Fisianna-scented breath of air. You take another lick at your lover’s spent cooch and sneak a look at her face: she looks utterly blissed out. She purrs softly with a wide smile on her face, tongue lolling out and eyes rolled back so far that they are almost all white.");
	output("\n\nYou take a few more licks to clean Fisianna up while she is still riding her orgasmic high, then crawl your way up her body. When you reach her head, she snaps out of her dazed state and her face instantly becomes one of worry as she gasps aloud.");
	output("\n\n<i>“O-oh! I-I... kinda made a mess on your face. I hope I wasn’t rough on you... b-but you just felt so... good down there a-and... I thought your hands felt wonderful, b-but your mouth... It’s even more magical. ");
	if (pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output("I-I never knew such an alien tongue could feel so... so pleasurable.");
	output("”</i> Fisianna sighs dreamily as she collapses her head back on the bed. You chuckle and tell her to rest assured that you enjoyed the ride as well, and move in to kiss her. She accepts your [pc.lipsChaste] without hesitation, letting herself taste her own sweetness. The two of you kiss each other passionately for a few minutes before eventually stopping. ");
	output("\n\nFisianna rises up from the bed and heads into her shower, dropping off her soiled panties in a dirty clothes bin and gathering a new pair. You take the moment to make use of Fisianna’s guest bathroom to freshen up after your diving session. When you are finished, you head to her living room to wait for her to finish showering. Eventually she comes out after a few minutes and hurries over to wrap herself around you in a loving embrace.");
	output("\n\n<i>“T-thank you so much for that [pc.name]! After that I just feel loose and limber and ready to tackle the day. I’m so happy!”</i> Fisianna gushes. <i>“A-anytime you want to do that again, I’d love it!”</i>");
	output("\n\nYou give Fisianna another kiss, her taste still faint in your mouth, and tell her that you would look forward to the next chance that you have to help her unwind. After you bid each other farewell by Fisianna’s apartment door, you head out extremely pleased with yourself at your job well done. ");
	
	if (flags["FISI_SEX_NUMBER"] == 1) flags["FISI_SEX_NUMBER"] = 2;
	
	currentLocation = "RESIDENTIAL DECK 13";
	processTime(30 + rand(25));
	fisianna.orgasm();
	pc.changeLust(33);
	addButton(0,"Next",mainGameMenu);
}

public function sixtyNineFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(1);
	clearMenu();
	
	moveTo("RESIDENTIAL DECK FISIS APARTMENT");
	
	IncrementFlag("FISI_TIMES_69");
	IncrementFlag("FISI_TIMES_SEXED");
	flags["FISI_LAST_SEXED"] = GetGameTimestamp();

	var x:int = largestCockIndexThatFitsFisiDimensions();
	
	if (flags["FISI_SEX_NUMBER"] < 3) output("<i>“U-um... you’ve done a lot for me in getting me to open up to you... Uh, sexually I mean, but I don’t feel I’ve done much to make it up to you yet. I-I’m not quite ready yet for you to deflower me, b-but I was hoping we could share something... a-almost as intimate. M-maybe we can... y-y’know... help each other with our m-mouths?”</i> Fisianna asks with a fierce blush on her face. You also flush with something fierce, but it isn’t in diffidence. ");
	else output("<i>“D-did you wanna maybe use our mouths on each other again? I-I honestly missed your closeness... and your taste in my mouth...”</i> Fisianna asks sweetly. The prospect of her proposing to sixty-nine you again fills you with an unspeakable amount of lust.");
	output("\n\nYou move in and kiss Fisianna’s neck with a beastly passion, sucking on it almost hard enough to give her a hickey. She breathes heavy sighs with each kiss planted and hisses with each hard suckle on her smooth neck. Unconsciously she grabs the back of your head, leaning you into her even more to enhance the embrace the two of you share. After a few moments of warming up, Fisianna lets out a small giggle as the two of you separate.");
	output("\n\n<i>“I take that as a ‘yes’, then?”</i> Fisianna asks rhetorically while she rises up from the bed. You sit up at the edge of the bed as she turns around to you. The catgirl stands in front of you beside her bed, smiling coyly at you. <i>“If so, I’ll have to take my clothes off before we can do anything... W-would you mind helping me with that, [pc.name]?”</i>");
	output("\n\nNot wasting any time, you lean over and grab Fisianna’s hips, pulling her close to you. She gives a small girly squeal of delight with your pull, almost knocking her off balance. You trace kisses on her navel as you work at the buttons on front of her jeans. Once unfastened, you slowly shimmy them down her smooth thighs, down to her fur covered knees. You take a brief moment to take in Fisianna’s white cat patterned panties and move in to kiss at her clothed lower lips while sliding her jeans the rest of the way off of her. She kicks her jeans aside and you take the moment to slither your fingers underneath the waistline of her panties and slide them downwards. Once her panties break from her cooch, you can see a small string of fem-lube attached between her aroused vagina and her now stained underwear. You take a moment to marvel at the sight before you slip her panties the rest of the way down, breaking the string.");
	output("\n\nOnce Fisianna flicks her panties aside to join her jeans, she bends down to give you a kiss on your forehead. ");
	if (!pc.isNude()) output("<i>“Mmm... I think it’s your turn now...”</i> She purrs while gently pulling you up off of the bed. You comply, and when you are upright, Fisianna helps you to remove your [pc.gear]; but you don’t do so without making a little show of it to her. Once you’re fully naked, you jump back onto her bed and beckon for your feline lover to follow. ");
	else output("<i>“I think it’s about time we got more comfy on the bed then?”</i> She purrs. No sooner than she says this, do you jump back on her bed and beckon your feline lover to follow. ");
	output("She follows suit and crawls to you with a feline grace, her twinned tails waving tantalizingly over her naked bottom. ");
	output("\n\nFisianna meets you face to face and leans in to give you a long and passionate kiss to your [pc.lipsChaste]. When you break the kiss, she smiles as you lay flat on your back. With a similar grace, Fisianna crawls over you and lithely turns herself around so that all you can see is the ceiling, her twinned tails, and her wet and waiting nethers in between a supple, rounded ass. You can feel Fisianna’s paw exploring your [pc.groin] while the both of you take in the wonderful sights and smells of each other’s loins.");
	if (x >= 0) {
		output("\n\nAs you admire the view of Fisianna’s bottom hovering above you, you can feel her hot breath warming up your crotch while her paws wander over your [pc.cocks]. Her paw finally settles on your [pc.cock "+x+"] and you can feel her breath becoming warmer as her lips approach your [pc.cockHead "+x+"].");
		output("\n\nYou feel your first inklings of pleasure when Fisianna’s lips finally settle in to give your [pc.cockHead "+x+"] a few light kisses. Then she strokes your [pc.cock "+x+"] with her paw to full hardness. When she feels that your rod is engorged enough, her light pecks progressively turn into lewd wide-mouthed smooches, with the occasional lick tracing across the opening of your [pc.cockHead "+x+"]. <i>“Haah... I-I didn’t think that you could taste so wonderful down here!”</i> Fisianna breathlessly moans in between her oral affections.");
		output("\n\nYou almost immediately become lost to Fisianna’s wet ministrations on your [pc.cock "+x+"] until you feel a stray bead of her arousal hit you squarely on your [pc.nose], reminding you that you have your own task at hand to worry about. You raise your arms up to the feline’s soft bottom and grab hold of both cheeks, then you slowly lower them to your face.");
		output("\n\nWhen Fisianna’s aroused vulva makes first contact with your nose, your inhale as much of her scent as you can and let out a slow sigh, warming up her nethers a little more than they already are. You then slide your [pc.tongue] from your mouth and take a long lick down her slit to clean up the rest of the juices that have been collecting there. Once clean, you dive straight in, spearing Fisianna’s folds with your tongue.");
		output("\n\nFisianna lets out a hearty moan onto your [pc.cockNoun "+x+"] just as your tongue penetrates her. Her hot breath makes your phallus jump as it forms a fresh new bud of pre on your [pc.cockHead "+x+"]. Quickly recovering from the shock of pleasure, she envelops her mouth around the tip of your penis, and gives your urethra a light lick to coax out as much pre as she can. Fisianna lightly giggles into your [pc.cockHead "+x+"] when your [pc.cock "+x+"] pulses in her mouth in response to her teasing.");
		output("\n\n<i>“D-did that feel good, [pc.name]?”</i> The coy feline asks, somehow sounding both unsure and sultry. As you are still working your oral magic on Fisianna, you are unable to answer vocally, but you give one of her cushy buns a squeeze and arch your tongue upwards inside of her as a response. <i>“A-aahn... I-I take that as a ‘yes’ as well.”</i> She moans before getting back to work on you.");
		output("\n\nFisianna envelops her peachy lips around your [pc.cockHead "+x+"] once more, giving your urethra light playful licks and slurping up any pre that bubbles from the opening. While she has her lips wrapped around your cock head, her paw is busily working the base of your shaft, jerking it liberally towards your impending release. Her soft paw pads feel so blissfully comfortable that you subconsciously arch your [pc.hips] upwards into Fisianna’s gaping maw. She gives a muffled, surprised yelp as more of your length is shoved into her mouth. She seems to be adjusting to it well, as she ceases her urethra licking and starts to suck on the length that is inside of her mouth.");
		output("\n\nOnce Fisianna is fully adjusted, you can feel her slowly bobbing her head up and down on your [pc.cockNoun "+x+"] while keeping a light suction on it. With each stroke she forces more and more of your turgid length into her ");
		if (pc.cocks[x].cLength() < 8) output("mouth, until she eventually bottoms out. ");
		else output("mouth, until she can go no further down without gagging. ");
		output("What Fisianna lacks in experience she sure makes up for in raw, carnal, enthusiasm as she increases her pace of her oral ministrations on you. On feeling this, you also increase the pace of your muff licking, making sure to lap up as much of her building nectar as possible. You also bring your bottom [pc.lipChaste] to massage Fisianna’s soft little button while you work each other closer to orgasm.");
		output("\n\nThe two of you keep at it for a good few minutes, filling the room with nothing but wet smacks and shlips while the two of you endeavor to slurp as much of each other into your mouths as possible. Fisianna’s legs begin to tremble around you just as she presses her bottom into your face lightly. Not a millisecond later, you can feel her folds start to clench and spasm erratically around your tongue just as a small deluge of femcum washes over your face. You close your lips around her pulsing cunny and swallow whatever tries to escape from within. Fisianna squeaks in a high, orgasmic pitch while you ride her orgasm out. She hasn’t ceased in working on your [pc.cock "+x+"] as she is still bobbing up and down your shaft.");
		if (pc.balls > 0) output("\n\nAs Fisianna’s orgasm starts to wind down, her ministrations on you rise to a fever pitch as she grabs your [pc.balls] and gently cups, fondles, and kneads them to coax their [pc.cumVisc] goodness out of you. The neko starts to go into a full bodied purr as she tirelessly works you close to orgasm. ");
		else output("\n\nAs Fisianna’s orgasm starts to wind down, her ministrations on you rise to a fever pitch as she starts to go into a full bodied purr while she tirelessly works you close to orgasm. ");
		output("The wonderful vibrations coursing through you, and especially your [pc.cock "+x+"], send you over the edge as your own climax arrives.");
		output("\n\nYou lurch your hips into Fisianna’s mouth when your orgasm hits you like a hammer to an anvil. You let out a relieved groan as you start to unload pump after pump of your [pc.cum] into her wet mouth. Fisianna lets out a euphoric moan when the first jet of cum hits the back of her throat. You can then feel her throat working on your [pc.cockHead "+x+"] working to swallow every bit that she can down her throat. ");
		if (pc.cumQ() < 500) output("\n\nYour [pc.cockNoun "+x+"] continues to pump more and more [pc.cumFlavor] seed into her willing throat. Fisianna is going to town, swallowing just about every drop of your [pc.cumNoun] until your orgasm winds down. ");
		else output("\n\nYour [pc.cockNoun "+x+"] continues to pump more and more [pc.cumFlavor] seed into her willing throat. Eventually her ravenous gullet cannot keep pace with your throbbing tool. You feel globs of saliva and [pc.cumNoun] escape from Fisianna’s mouth and drain between your legs. Regardless, she still works at swallowing as much as she is able to until your orgasm winds down.");
		output("\n\nOnce your orgasm subsides, you slide your [pc.tongue] from out of Fisianna’s nethers and lay back in bed completely exhausted at riding out the both of your orgasms. You can feel Fisianna giving your [pc.cockHead "+x+"] a few more loving licks and kisses before you see her bottom shift out of view. A few moments later you see your feline lover’s smiling [pc.cumNoun] slathered [fisianna.face]. You reach up and cup her cheek into your hand, moving it down to her dripping chin to lightly pinch it and draw her in close for a kiss. Fisianna gratefully accepts your silent offer for a kiss and settles in to lay on top of you, locking lips with you. The two of you kiss each other close-mouthed with your tongues dancing, as you taste each other’s love juices.");
	}
	else 
	{
		output("\n\nAs you admire the view of Fisianna’s bottom hovering above you, you can feel her hot breath warming up your crotch while her paws wander over your [pc.vagina]. You can feel her breath becoming warmer as her lips approach your awaiting gash.");
		output("\n\nYou feel your first inklings of pleasure when Fisianna’s lips finally settle in to give your [pc.clits] a few light kisses and licks. Her light pecks on your button");
		if (pc.vaginaTotal() > 1) output("s");
		output(" progressively turn into lewd wet smacks, with the occasional lick tracing across the opening of your [pc.vagina]. <i>“Haah... I-I didn’t think that you could taste so wonderful down here!”</i> Fisianna breathlessly moans in between her oral affections.");
		output("\n\nYou almost immediately become lost to Fisianna’s wet ministrations on your pearl until you feel a stray bead of Fisianna’s arousal hit you squarely on your [pc.nose], reminding you that you have your own task at hand to worry about. You raise your arms up to the feline’s soft bottom and grab hold of both cheeks, then you slowly lower them to your face.");
		output("\n\nWhen Fisianna’s aroused vulva makes first contact with your nose, your inhale as much of her scent as you can and let out out in a slow sigh, warming up her nethers a little more than they already are. You then slide your [pc.tongue] from your mouth and take a long lick down her slit to clean up the rest of the juices that have been collecting there. Once clean, you dive straight in, spearing Fisianna’s folds with your tongue.");
		output("\n\nFisianna lets out a hearty moan onto your [pc.clits] when your tongue penetrates her. Her hot breath makes your pussy lips twitch with an unspoken need as her resounding moan vibrates through her and sends a highly exotic shock to your sensitive button");
		if (pc.vaginaTotal() > 1) output("s");
		output(". She recovers quickly from the wave of pleasure and soon envelops her mouth around your [pc.clits] for a few moments to give ");
		if (pc.vaginaTotal() > 1) output("them");
		else output("it");
		output(" a few light flicks. After she gives your [pc.clits] a parting lick, she keeps the tip of her tongue on the sensitive area, trailing down lower until her tongue reaches your outer folds. Fisianna takes a few long licks to slurp up any [pc.girlCum] that has accumulated on you before inserting her tongue into your [pc.vagina].");
		output("\n\nThe stimulation from the oral penetration sends your folds aflutter, milking Fisianna’s tongue for more. She lets out a light giggle through her tongue and momentarily retracts it from your folds, leaving you empty for the moment. <i>“D-did that feel good, [pc.name]?”</i> The coy neko asks, somehow sounding both unsure and sultry. Since you are still working your oral magic on Fisianna, you are unable to answer vocally, but you give one of her cushy buns a squeeze and arch your tongue upwards inside of her as a response. <i>“A-aahn... I-I take that as a ‘yes’ as well.”</i> She moans before she goes back to work on you.");
		output("\n\nFisianna reinserts her tongue back into your wet folds and circles your vaginal walls with loving laps around the circumference. Her peachy lips, unbeknownst to her, still rub sensuously across your [pc.clits], increasing the pleasurable feeling of her wet tongue working your insides by tenfold. Occasionally Fisianna presses her mouth as hard as she can to your labial lips and stretches her tongue to the deepest recesses of your pussy. With each deep thrust of her tongue, you push your hips into her face to aid her plight. When her tongue isn’t deep inside you, it settles to servicing your [pc.clits] before taking the plunge again.");
		output("\n\nWhat Fisianna lacks in experience she sure makes up for it in raw carnal enthusiasm as she increases her pace of her oral ministrations on you. On feeling this, you also increase the pace of your muff licking, making sure to lap up as much of her building nectar as possible. You also bring your bottom [pc.lipChaste] to massage Fisianna’s soft little button while you work each other closer to orgasm.");
		output("\n\nThe two of you keep at it for a good few minutes, filling the room with nothing but wet smacks and shlips while you endeavor to slurp as much of each other into your mouths as possible. Fisianna’s legs begin to tremble around you just as she presses her bottom into your face lightly. Not a millisecond later, you can feel her folds start to clench and spasm erratically around your tongue just as a small deluge of femcum washes over your face. You close your lips around her pulsing lower lips and swallow whatever tries to escape from within. Fisianna queaks in a high, orgasmic pitch while you ride her orgasm out. She still hasn’t ceased working on your [pc.vagina], and her tongue is going wild within you.");
		output("\n\nAs Fisianna’s orgasm starts to wind down, her ministrations on you rise to a fever pitch just as she starts to go into a fully bodied purr while tirelessly bringing you close to orgasm. The wonderful vibrations course through you, especially to your [pc.clits], sending you over the edge as your own climax arrives.");
		output("\n\nYou lurch your hips into Fisianna’s mouth just as your orgasm hits you like a hammer to an anvil. You let out a sweet moan while your vaginal walls spasm and contract with ecstasy. ");
		if (pc.wetness() >= 3) output("[pc.GirlCum] floods into your lover’s wet mouth. She lets out a euphoric moan when the first jet of [pc.girlCumNoun] hits the back of her throat. You can hear her throat working to swallow every bit that she can. ");
		else output("[pc.GirlCum] leaks from your [pc.vagina] and into your lover’s wet mouth. She lets out a euphoric moan as a new batch of [pc.girlCumNoun] enters her mouth. You can feel her tongue working to lap up every drop that escapes from your nethers while you shudder in bliss.");
		output("\n\nOnce your orgasm subsides, you slide your [pc.tongue] from out of Fisianna’s nethers and lay back in bed completely exhausted at riding out the both of your orgasms. You can feel Fisianna giving your [pc.vagina] a few more loving licks and kisses before you see her bottom shift out of view. A few moments later you see your feline lover’s smiling [pc.girlCumNoun] slathered [fisianna.face]. You reach up and cup her cheek into your hand, moving it down to her ");
		if (pc.wetness() >= 3) output("dripping"); 
		else output("wet");
		output(" chin to lightly pinch it and draw her in close for a kiss. Fisianna gratefully accepts your silent offer for a kiss and settles in to lay on top of you, locking lips with you. The two of you kiss each other close-mouthed with your tongues dancing, as you taste each other’s love juices.");
	}
	output("\n\nWhen the two of you break the kiss, Fisianna sighs and settles in to nuzzling beside you, still purring all the while. <i>“Oh my stars... I-I never knew that was going to turn out being so... pleasurable. I can’t say that I’m not looking forward to doing that again whenever you want.”</i> Fisianna murmurs while she wraps her arms around you in the afterglow. <i>“I feel very... relaxed when I’m with you like this. C-can we just nap together for a little?”</i>");
	output("\n\nYou can’t help but to yawn a little at the prospect of laying on Fisianna’s comfortable bed with her for a while longer. You wrap your arms around your soft companion and the two of you cuddle into each other, eventually nodding off to sleep.");
	
	if (flags["FISI_SEX_NUMBER"] == 2) flags["FISI_SEX_NUMBER"] = 3;
	
	processTime(30 + rand(25));
	fisianna.orgasm();
	pc.orgasm();
	pc.girlCumInMouth(fisianna);
	addButton(0, "Next", sixtyNineFisi2);
}

public function sixtyNineFisi2():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(1);
	clearMenu();

	output("When you wake up, you find Fisianna snoring peacefully into your neck. You lean over and give the sleeping kitten a gentle kiss on her forehead, which causes her eyes to flutter open. <i>“Mmm... morning, [pc.name].”</i> She giggles sleepily as she returns your kiss. Your taste in her mouth is still fairly strong, and so is her taste in yours. The two of you decide to break the kiss before you decide to go at it again and slowly, but reluctantly, separate and slide off of the bed. ");
	if (!pc.isNude()) output("\n\nFisianna heads straight to her shower to clean up, leaving you to gather your belongings and take them with you to the guest bathroom to clean yourself up. Once you finish cleaning up and put your [pc.gear] back on, you head back to her living room where she is already dressed and waiting for you. ");
	else output("\n\nFisianna heads straight to her shower, leaving you to go to the guest bathroom to clean yourself up. Once you finish, you head back to her living room, where she is already dressed and waiting for you. ");
	output("Fisianna runs over to you and gives you a surprisingly tight hug, which you return.");
	output("\n\n<i>“I really, really enjoyed today, [pc.name]. I’d love to do this more often whenever we get the chance to! I don’t think I can work with a very clear head after that, especially since I can still taste you!”</i> She laughs. You nod in agreement and give her a light peck on her lips to tease her. Fisianna tries to make a pouty face but she can’t break her smile.");
	output("\n\n<i>“Aww... n-no fair...”</i> Fisianna whines while she playfully punches you in the arm. The two of break the hug after a bit of jostling and you head out of her apartment after your heartfelt goodbyes.");
	
	currentLocation = "RESIDENTIAL DECK 13";
	processTime(45 + rand(25));
	addButton(0,"Next",mainGameMenu);
}

public function vaginalFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);
	clearMenu();
	
	moveTo("RESIDENTIAL DECK FISIS APARTMENT");
	
	IncrementFlag("FISI_TIMES_VAG");
	IncrementFlag("FISI_TIMES_SEXED");
	flags["FISI_LAST_SEXED"] = GetGameTimestamp();

	var x:int = largestCockIndexThatFitsFisiDimensions();
	
	if (fisianna.vaginalVirgin)
	{
		output("Fisianna gazes at you lovingly while you lay side by side with her on the bed. You can’t help but to fantasise about being lost in the golden ocean that is her eyes. The shy feline scans you for a moment before she gives you a wide smile.");
		output("\n\n<i>“I-I don’t think I could be any happier just laying next to you... to just be with you like this. I really, really love you, [pc.name]. With all my heart, I can’t say enough that I’m so glad to have met you, and that you could be my first " + pc.mf("boyfriend", "girlfriend") + ".”</i> Fisianna’s smile diminishes slightly while she looks away nervously. <i>“T-that’s why... I think I’m ready...”</i> She says the last part in a barely audible whisper.");
		output("\n\nYou give her a look of intrigue, and gently ask her to elaborate. <i>“O-oh.”</i> Fisianna clears her throat before continuing. <i>“I-I’m sorry for making you wait so long, [pc.name]. I-I think I’m ready for you now... to take my v-virginity.”</i> She looks back into your eyes, her’s filled with pure love and emotion. You can’t help but to feel elated at Fisianna’s admittance to finally wanting to engage in such a deeply personal act with you.");
		if (x >= 0 && pc.cockVirgin)
		{
			output("\n\nYou also feel a bit nervous yourself, since it is also your first time engaging in sex as well and admit to Fisianna as such.");
			output("\n\n<i>“You know, Fisi, this will actually be my first time as well, so at least we can both venture into this with the same amount of experience... or lack thereof.”</i> You give her a warm, comforting smile. Fisianna gives off a sigh of relief and smiles as wide as ever, seemingly ecstatic to find out that you are also a virgin.");
		}
		output("\n\n");
	}
	output("You lean over to your feline lover and embrace her in a kiss to match the unadulterated passion in her eyes that she is showing you. The two of you roll around on the bed, continuing where you left off with the kiss when you first arrived, unable to separate from each other for a long while.");
	output("\n\nAfter the two of you break the kiss to catch your breath, Fisianna rises up from the bed and looks longingly at you for a moment before moving her paws to her vest. She slowly takes it off and throws it to a random corner of her room. Her purple, cat-logoed shirt soon follows her vest, revealing her white, paw-printed lacy bra. When Fisianna moves her paws lower to take off her bell-bottom jeans, she unbuttons them and starts to slide them down her slender thighs in an inadvertent strip-tease. Fisianna slides her jeans down with an alluring slowness, shimmying her hips from side to side slowly, almost as if in an effort to delay the garment from leaving her legs. When the waist of her jeans finally meets her feet, you can no longer restrain yourself and leap from the bed to plant your face into the teasing kitten’s neck. Fisianna giggles while you pepper the soft and smooth [fisianna.skinFurScalesNoun] on her neck and chest with kisses as she kicks off her bell-bottom jeans. She leans into your oral affections while you reach around her back to undo her bra. ");
	output("\n\nWhen the lacy chest garment falls off, you hungrily trace your kisses down Fisianna’s chest to one of her perky C-cup breasts. You gently suck on the supple boobflesh around her inverted nipples, and move a free hand to cup and tease her other tit to stimulate her other nipple into coming out. Her breath catches when your lips encircle one of her areolae and she gently places her hand on the back of your head to further press you into her mammary. When you tongue the inside of her inverted nipple, Fisianna gasps when it emerges, fully exposing one of her few pleasurable spots. You go on the attack, flicking and sucking at the now exposed nipple with an unexplained passion, desperate to tease and play with it as much as you can.");
	output("\n\nYou gently slide your other hand down the curvature of her sides to her girly hips. Hooking a thumb under Fisianna’s lacy panties, you start to slowly slide them down, momentarily stopping to grab her soft bottom. When you work her panties down to her knees, she closes her legs to let the garment fall the rest of the way and kicks it aside towards the rest of her clothes.");
	output("\n\nYou give Fisianna’s nipple a few more licks before you feel a paw push you gently away. When you look up, you see that her face shows a mix of primal hunger and anxiousness. You can feel her paws wandering all over your body, wondering where to start first. Eventually she resolves her dilemma and gently pushes you back onto the bed. ");
	if (!pc.isNude())output("She saunters over to meet you, almost like she’s ready to pounce on you, but she holds back to help you take off your [pc.gear]. Once you are fully naked for your feline lover, she takes a brief moment to survey your body. ");
	else output("When you hit the bed, Fisianna takes a brief moment to survey your body.");
	if (x >= 0) 
	{
		output("\n\nFisianna’s piercing, golden eyes look over your body until they settle on your [pc.cocks]. When her eyes lock on, she stares transfixed at your [pc.cocks] while she slowly starts to inch her face closer to ");
		if (pc.cocks.length > 1) output("them");
		else output("it");
		output(". Unfortunately, that doesn’t seem to be her main target at the moment, as Fisianna only briefly sniffs and smooches your [pc.cockNoun "+x+"]. She trails kisses up your body, past your [pc.chest] and up to your [pc.lipsChaste] to passionately kiss them. ");

		
	}
	else
	{
		output("\n\nFisianna’s golden, piercing eyes scan your body until they settle on your [pc.groin]. When her eyes lock on, she frowns.");
		output("\n\n<i>“U-um... I-I don’t think you have anything we can... work with.”</i> Fisianna points out sheepishly. You look down at your [pc.groin] and then back at her lithe body. She certainly has a point there, however you crack a smile when your hardlight equipped [pc.lowerGarment] catches your eye. Without a word, you rise back up from the bed and put your [pc.lowerGarment] back on.");
		if (flags["FISI_HARDLIGHTED"] == undefined)
		{
			flags["FISI_HARDLIGHTED"] = 1;
			output("\n\nFisianna gives you a puzzled look while you redress yourself with the undergarment. <i>“T-that doesn’t mean that we can’t do something else, [pc.name].”</i> She stammers, but you smile wider.");
			output("\n\n<i>“Ah, but you haven’t seen a device like this before, have you?”</i> You ask Fisianna coyly while you fiddle with a dial on your [pc.lowerGarment] to flip on your hardlight dildo. She gasps aloud when your glowing dong materializes from the fabric. The neko’s tech curiosity claims the better of her and within seconds, she is kneeling down to examine the light-phallus. She gives it a few pokes and prods, and eventually strokes, which the feedback from sends shocks of pleasure through your loins. Fisianna jumps slightly when she sees you twitch from her accidental stimulation.");
			output("\n\n<i>“Y-you felt that?! Wow... this thing is a very interesting piece of work...”</i> Fisianna marvels at the craftsmanship. Before your feline lover can become totally enraptured in wonder of the mechanics behind the dildo, you pull yourself back onto her bed, drawing a small whine from her when you break her concentration.");
			output("\n\n<i>“Come on, Fisi. How about we try this firsthand?”</i> You croon to Fisianna invitingly. The feline still stares, transfixed on your glowing dong, but eventually moves closer to you. Her eyes lower as she briefly sniffs and smooches your glowstick. She trails kisses up your body, past your [pc.chest] and up to your [pc.lipsChaste] to passionately kiss them.");
		}
		else
		{
			output("\n\nFisianna gives you an excited look while you redress yourself with the undergarment.");
			output("\n\n<i>“Oooh! Are you gonna use that hardlight dildo again?!”</i> The excited kitten asks while her tails whip about in a flurry. You smile even wider at her eagerness to repeat your previous experience.");
			output("\n\n<i>“Sure am, but you’re gonna have to come and get it!”</i> You playfully tease Fisianna while you lay back on her bed. The feline still stares, transfixed by your glowing dong, but eventually moves closer to you. Her eyes lower as she briefly sniffs and smooches your glowstick. She trails kisses up your body, past your [pc.chest] and up to your [pc.lipsChaste] to passionately kiss them.");
		}
	}
	output("\n\nThe two of you make out much more sloppily and wildly than you usually do, engaging in an open-mouthed kiss that has the both of you almost licking each other’s faces off. Your bodies are a total tangle of limbs, constantly moving to envelop each other as much as possible. When you take a break from the wild kissing, you find yourself rolled atop Fisianna, kneeling between her furry legs with your ");
	if (x >= 0) output("[pc.cock " + x + "]");
	else output("hardlight dildo");
	output(" aligned almost perfectly with the kitty’s awaiting nethers.");
	if (fisianna.vaginalVirgin)
	{
		output("\n\nFisianna realizes the position she is in when she feels your ");
		if (x >= 0) output("[pc.cockHead " + x + "]");
		else output("artificial phallus");
		output(" brush against her engorged vulva, causing her to blush furiously while looking away nervously. ");
		if (pc.cockVirgin) output("You can’t help but to smile nervously at the shy neko. She just looks too cute like this! ");
		else output("You can’t help but to chuckle lightly and smile back at the shy neko. She just looks too cute like this!");
		output("\n\n<i>“Fisi, are you ready?”</i> You say in as gentle of a voice as you can manage. She doesn’t turn to look back at you, and after a pregnant pause, she slowly nods her head. You’re not entirely convinced that Fisianna thinks she is as ready as she actually is. When you press your ");
		if (x >= 0) output("[pc.cockHead " + x + "]");
		else output("light dildo’s head");
		output(" to her vulva even harder, you see her eyes clench shut. You pause your approach. <i>“Are you sure you’re ready? I’d want you to enjoy this as much as I would.”</i>");
		output("\n\nSlowly, you can see her face start to relax. When Fisianna opens her eyes again, she turns her head to you, her golden eyes searching your face. You maintain your comforting smile as best as you can until she starts to smile back at you. <i>“Y-yeah... go for it, [pc.name].”</i> Fisianna squeaks softly.");
		output("\n\nAt her approval, you start to slowly push your [pc.hips] forwards into the neko’s. Your ");
		if (x >= 0) output("phallus");
		else output("artificial cock");
		output(" inches its way inside of her depths, her inner walls already clinging to you with a welcoming tightness. You can hear Fisianna sharply inhale while she adjusts to being filled up slowly with your length.");
		output("\n\nYou suddenly find yourself coming to an abrupt stop at a blockage somewhat close to the entrance of her pussy. When you try to push in further against her unbroken hymen, Fisianna winces in pain, but quickly gives you a reassuring smile. <i>“I-it’s ok, [pc.name]. Please, keep going.”</i> She encourages. Your lover lifts her paws to grab hold of your arms and lifts her legs to either side of you to ease your passage into her.");
		output("\n\nWhen Fisianna goads you even further by pressing her hips slightly into you, you push back in turn, straining against her tight opening. When you finally break through Fisianna’s hymen, she makes an odd, but cute, sound between a whimper of pain and a moan. From there, you continue to push into the feline until ");
		if (x < 0 || pc.cocks[x].cLength() < 9) output("you bottom out inside of her. ");
		else output("you see a visible bulge coming through the neko’s tummy. ");
		output("You look at her face and find that she has a somewhat spaced out look from being penetrated for the first time, already far away, lost to the throes of pleasure. ");
		if (x >= 0 && pc.cockVirgin)
		{
			output("Your [pc.cockNoun " + x + "] gives off an excited throb while the both of you share your first moments being joined with another.");
			pc.cockChange(true, false, true);
		}
	}
	else
	{
		output("\n\nFisianna realizes the position she is in when she feels your ");
		if (x >= 0) output("[pc.cockHead "+x+"]");
		else output("glowstick");
		output(" brush against her engorged vulva, and starts to smile up at you. She reaches up to give you a small kiss to your lips. <i>“G-go ahead, [pc.name]. I’m all yours.”</i> Your feline lover purrs affectionately as she lays back down and relaxes.");
		output("\n\nAt her approval, you start to slowly push your [pc.hips] forwards into the neko’s. Your ");
		if (x >= 0) output("phallus");
		else output("artificial cock");
		output(" inches its way inside of her depths, her inner walls already clinging to you with a welcoming tightness. You can hear Fisianna sharply inhale as she adjusts to being filled up slowly with your length.");
		output("\n\nWhen Fisianna goads you even further by pressing her hips slightly into you, you push back in turn, straining against her tight opening. You continue to push into the feline until ");
		if (x < 0 || pc.cocks[x].cLength() < 9) output("you bottom out inside of her. ");
		else output("you see a visible bulge coming through the neko’s tummy. ");
		output("You look at her face and find her smiling widely with a spaced out look in her eyes, already lost to the throes of pleasure.");
	}
	output("\n\nYou hold your position, unmoving for a few moments before Fisianna looks up at you, still utterly blissed out. ");
	if (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output("Her tails start to slowly coil around yours, rubbing your [pc.tails] sensually while they slither under you. ");
	output(" She takes her paws off of your arms and slides them up around your neck, hooking them around the back of it. Using her new leverage on you, she leans up to you and gives you another kiss. This time it is more of the passionate type of kiss you usually share between each other. The two of you make out while you are emotionally and lustfully tied with one another. When the kiss breaks, you start to inch back out of your lover’s warm depths. Fisianna gasps when you start to exit her, but moans out in primal euphoria when you sink back inside.");
	output("\n\nSupplying the rhythm from then on, you start your thrusts off slowly, moving between Fisianna’s open, furred legs. As your passage into the neko’s wet folds grows easier, you buck with more vigor, pressing as far as your ");
	if (x >= 0) output("turgid length");
	else output("lightstick");
	output(" can go within her. Your lover’s walls still grip you with a pleasant tightness as they lubricate even more, providing a wonderful silky feeling around your solid rod. Fisianna focuses on your [pc.eyes] while you look at each other lovingly.");
	output("\n\nWhen Fisianna gives off a particularly loud moan, you bring your lips down to kiss her, muffling her moan into your mouth. You don’t keep your lips on hers for long however, as you opt to paint a trail of kisses down to her neck. Once there, you pepper her neck with kisses, desperate to stimulate the neko as much as you can through your oral affections and pumping hips. You give Fisianna a soft but playful bite on her neck to which you hear her hiss softly, and she raises her body into yours in response, making your strokes inside of her deeper than before.");
	output("\n\nYou pound into Fisianna continuously for a few minutes, steadily beating your ");
	if (x >= 0) output("rod");
	else output("hardlight tool");
	output(" into her while suckling and biting at her neck. The room is filled with the lurid smacks and slaps of carnal intimacy, as well as the continual rhythmic groans of the bed. A cloud of heat and the vague scent of sweat and arousal fills the room, yet the both of you embrace it as all outside concerns are completely left behind.");
	output("\n\n<i>“[pc.name]! Ngh! K-keep going! Hah... p-please, deeper! A-ah!”</i> Fisianna cries out while her legs and tails wrap around your [pc.hips], desperate to feed as much of your ");
	if (x >= 0) output("member");
	else output("artificial cock");
	output(" in her as she can. With her legs and tails wrapped so tightly around you, you have little choice but to comply. You pull out as far as her grip allows and strike home in a short, but true, thrust into the deepest parts of her pussy.");
	output("\n\nAfter a few strokes like this, you feel her folds flutter and spasm around your length. Fisianna lets out a sweet cry while her legs and tails intensify their hold on you, gripping you like a vice. You feel a small tide of your lover’s girl-cum rush over your ");
	if (x >= 0) output("manhood");
	else output("glowing shaft");
	output(". The sensation of her now-drenched passage undulating around your member almost sends you overboard. ");
	if (x >= 0) output("When your [pc.cockNoun "+x+"] throbs with the need to blow, your feline lover somehow senses this mid-orgasm and shouts. <i>“P-please... cum with me, [pc.name]! Give me all you have!”</i> ");
	else output("When your [pc.hips] involuntarily jerk in a need for release, your feline lover somehow senses this mid-orgasm and screams. <i>“P-please... cum with me, [pc.name]! I-I want it!”</i> ");
	output("At that moment, she begins a full bodied purr, sending gentle vibrations all along your body and intensifying the stimulation of her trembling vagina.");
	if (x >= 0 && pc.hasKnot(x))
	{
		output("\n\nYou can’t hold out any longer against this incredible sensation. With a final shove, you strain your [pc.knot "+x+"] against Fisianna’s opening, fighting for any give into her clenching vaginal walls. With the added lubrication from her orgasm, you eventually squeeze in, and with an exasperated grunt, you burst inside of her. Your feline lover utters a long, <i>“Mmmnnn...”</i> as her insides are basted with spurt after spurt of your seed. ");
		if (pc.cumQ() >= 750)
		{
			output("While you climax, thanks to your [pc.knot "+x+"] plugging her, your [pc.cum] starts to build up in Fisianna’s ");
			if (!fisianna.vaginalVirgin) output("near ");
			output("virgin womb, distending her stomach. Her belly bulges with each pulse until it becomes slightly large and gravid. She loosens her grip on you, letting you kneel atop her as her stomach swells. <i>“Haaah... so full...”</i> Your lover coos as she tenderly rubs a paw over her middle. ");
		}
		else
		{
			output("As you climax, thanks to your [pc.knot] plugging her, your [pc.cum] stays inside of her, swimming inside of her canal and ");
			if (!fisianna.vaginalVirgin) output("near ");
			output("virgin womb. ");
		}
		output("One quick glance at Fisianna’s face and you can tell she is totally gone. Her tongue is lazily lolling out of her mouth and she has the biggest grin on her face. You chuckle and nuzzle into her neck as you both ride out the rest of your climax.");
	}
	else if (x >= 0)
	{
		output("\n\nYou can’t hold out against this incredible sensation any longer. With a final shove, you thrust your [pc.cock "+x+"] against Fisianna’s opening, fighting for any give into her clenching vaginal walls. With the added lubrication from her orgasm, you eventually squeeze in, and with an exasperated grunt, you burst inside of her. Your feline lover utters a long, <i>“Mmmnnn...”</i> as her insides are basted with spurt after spurt of your seed. ");
		if (pc.cumQ() >= 750)
		{
			output("While you climax, your [pc.cum] starts to spurt out in large volumes from Fisianna’s ");
			if (!fisianna.vaginalVirgin) output("near ");
			output("virgin pussy, making a fair mess of her bedding and both of your legs. ");
		}
		else
		{
			output("While you climax, your [pc.cum] starts to dribble from Fisianna’s ");
			if (!fisianna.vaginalVirgin) output("near ");
			output("virgin pussy, making a small mess of her bedding and both of your legs. ");
		}
		output("One quick glance at your lover’s face and you can tell she is totally gone. Her tongue is lazily lolling out of her mouth and she has the biggest grin on her face. You chuckle and nuzzle into her neck as you both ride out the rest of your climax.");
	}
	else
	{
		output("\n\nYou can’t hold out against this incredible sensation any longer. With a final shove, you thrust your light-phallus against Fisianna’s opening, fighting for any give into her clenching vaginal walls. With the added lubrication from Fisianna’s orgasm, you eventually squeeze in, and with an exasperated grunt you cream your [pc.lowerGarment]. ");
		if (pc.hasVagina() && pc.wetness() >= 5) output("[pc.GirlCum] gushes out of the seams of your underwear, soaking both your legs and Fisianna’s, as well as her bed. ");
		output("Your feline lover utters a long, <i>“Mmmnnn...”</i> as her insides continue to spasm around you. One quick glance at her face and you can tell she is totally gone. Her tongue is lazily lolling out of her mouth and she has the biggest grin on her face. You chuckle and nuzzle into her neck as you both ride out the rest of your climaxes.");
	}
	
	processTime(30 + rand(25));
	fisianna.orgasm();
	pc.orgasm();
	addButton(0, "Next", vaginalFisi2, x);
}

public function vaginalFisi2(x:int):void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);
	clearMenu();
	
	output("You come to moments later, unaware of exactly how much time passed since the two of you went at it. Your stirring causes Fisianna to wake up under you. After a soft groan, she smiles up at you.");
	if (fisianna.vaginalVirgin) output("\n\n<i>“T-that... that was amazing. I... you’re amazing.”</i> ");
	else output("\n\n<i>“Hey, Sunshine.”</i> ");
	output("Fisianna leans up and gives you a quick peck on the lips. ");
	if (x >= 0) output("You try to move and find yourself still buried inside of her, albeit completely flaccid. With a wet plop, you unsheathe yourself from Fisianna, letting your sexual fluids flow freely onto her bed while you lay side by side with her. ");
	else output("You try to move and find yourself still buried inside of her. With a wet plop, you unsheathe yourself from Fisianna and turn the device off. ");
	output("The two of you bask in the afterglow after your libidinous act and cuddle together. Your feline lover still softly purrs, almost lulling you to sleep again. You reach over and give her a long kiss to keep the both of you occupied.");
	output("\n\nWhen you finally separate, the both of you slide off of the bed. You are about to head to Fisianna’s guest bathroom to wash up when you hear her calling you.");
	output("\n\n<i>“[pc.name]. How about you take a shower with me for a change?”</i> Fisianna’s eyes lower seductively and crooks a finger at you invitingly as she sashays into her private bathroom and out of sight. Thinking it crazy to refuse, you eagerly follow the playful kitten into the bathroom and join her in the shower.");
	output("\n\nAfter about fifteen minutes of a wet session of washing up together and playful teasing, you both emerge from the shower. The two of you are absolutely glowing, not just from your cleanliness but with the happiness of being together. ");
	if (!pc.isNude()) output("Unfortunately it has to come to an end this time as Fisianna re-clothes herself, and you re-equip your [pc.gear]. ");
	else output("Unfortunately it has to come to an end this time, as Fisianna re-clothes herself. ");
	output("Once done, the both of you head into the living room to kiss each other goodbye.");
	output("\n\n<i>“Goodbye, [pc.name]. Please be safe in your travels. I shall be thinking of you always. Anytime you want to come by and... uh... do <b>this</b> again, I’d love to. Just say it.”</i> Fisianna looks into your eyes dotingly. You assure her that you’ll be fine and give her a parting kiss on her cheek before you leave her apartment and head on your way.");
	
	if (fisianna.vaginalVirgin) fisianna.vaginalVirgin = false;
	if (flags["FISI_SEX_NUMBER"] == 3) flags["FISI_SEX_NUMBER"] = 4;
	
	currentLocation = "RESIDENTIAL DECK 13";
	processTime(60 + rand(25));
	pc.shower();
	addButton(0,"Next",mainGameMenu);
}

public function maxTrustScene():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	flags["FISI_MAX"] = 1;
	
	output("It’s been awhile since you’ve seen Fisianna sitting at her usual spot on the park bench. You [pc.walk] over and take your seat next to her. This time is different however, as she completely misses your arrival and is still staring fixedly at the trees ahead of her in what looks like deep thought. You call out to her to break her trance. Fisianna jumps with a start as you break her out of her state of reverie.");
	output("\n\n<i>“O-oh! [pc.name]! I-I’m sorry... I didn’t see you there. Y-you caught me daydreaming.”</i> Fisianna stammers while her face grows a deep shade of pink. <i>“H-how are you today, [pc.name]?”</i>");
	output("\n\nYou notice that Fisianna is acting a lot more anxious than she usually has been towards you. Her face is positively glowing pink and she has a very distracted and flustered look on her face. Her golden eyes dart about trying to avoid eye contact with you.");
	if (pc.isNice()) output("\n\n<i>“I’m fine, but it seems like you have something on your mind. Would you like to share?”</i> ");
	else if (pc.isMischievous()) output("\n\n<i>“I’m alright, but if I didn’t know any better, it looks like something is bugging you. Wanna talk about it?”</i> ");
	else output("\n\n: <i>“Alright... something’s obviously bothering you. Go ahead and spit it out.”</i>");
	output("\n\nFisianna slowly looks down at her lap and after a long pause she speaks up softly. <i>“Mmm... w-would you mind if we took a walk around the plaza while we talk? T-that is if you want?”</i>");
	output("\n\nSeeing no problems with doing that, you grant Fisianna’s request for a walk around the plaza and stand up from the bench, offering a hand to her.");
	if (silly) output("<i>“Y-you want me to... h-hold your hand? B-but that’s so... l-lewd!”</i> She balks. The neko looks around nervously before slowly raising her paw to your outstretched hand.");
	output(" While still blushing, she takes your hand as you help her off of the bench. You slowly head westward towards the prismatic monoliths in the distance. The both of you walk a good distance in silence, though it isn’t an awkward silence since you are patiently waiting for Fisianna to speak up. ");
	output("\n\nWhen the two of you reach the north-western end of the plaza, you find yourself surrounded by a beautiful array of crystal structures along the walkway, all varying in different shapes and sizes. They sparkle brilliantly in the artificial lighting. As you are taking in the resplendent sight around you, you feel Fisianna slipping an arm around yours. You look at her just as she interlaces her four digit paws with yours. The neko is blushing furiously while her grip progressively tightens. You can feel her heart beating faintly through her sensitive pads. ");
	output("\n\nHer pace starts to slow as you keep walking with her, hand in hand. Eventually, the two of you come to a stop in the middle of the walkway. Fisianna has a faraway look in her golden eyes as she stares ahead.");
	output("\n\n<i>“T-this place is so beautiful...”</i> Fisianna says dreamily. <i>“I-It’s another one of my favorite places to come to on the whole station.”</i> She turns to you while still holding your arm, looking into your eyes with the same faraway look.");
	output("\n\n<i>“I-I’m not sure how to say this really, b-but... I’m so very glad to have met you at Anon’s. When we first met there, I wasn’t sure of anything about you besides what I had seen on the extranet. I was so nervous about talking to someone like you, thinking there was no way someone like [pc.himHer] would even think of being friends with me or caring about me, with the Rush going on and all.”</i> Fisianna squeezes your arm slightly as she continues.");
	output("\n\n<i>“When you came to get me after I left the bar... I-I just somehow thought... maybe I’ve found that one more person I could explicitly trust outside of the other five most important people of my life. Sure enough, you did just that. Everything we have ever done together I have enjoyed, a-and I’m always looking forward to the next time we can be together.”</i> You can see the feline’s golden eyes lower as her facial expression saddens.");
	output("\n\n<i>“You’ve stuck with me when I bared my soul to nobody else but you. I... I-I can’t thank you enough for being there for me ever since then.”</i> Fisianna then lets go of your arm and pulls you into a gentle hug. After a few moments, she looks into your eyes, her’s dancing with emotion.");
	output("\n\n<i>“U-uhm... [pc.name]... I don’t think I can really hide it any longer. I-I’m not sure what this feeling is, but... I-I think... I think I’ve fallen in love with you.”</i> Fisianna’s gaze into your eyes intensifies as if she is searching for a response in your own.");

	addButton(0, "Confess", iLoveYouFisi, undefined, "Confess", "Tell her about your feelings for her.");
	addButton(1, "Kiss Her", gimmeDemLipsFisi, undefined, "Kiss Her", "Rather than tell her, show her with actions!");
	addButton(2, "Just Friends", friendzoneFisi, undefined, "Just Friends", "You have no interest in taking things to the next level with Fisianna.");
	addButton(3, "Reject", whatTheFuckIsWrongWithYou, undefined, "Reject", "Break things off with her before things get serious.");
}

public function iLoveYouFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	output("You feel elated at hearing Fisianna’s heartfelt confession to you. Your own feelings for her bubble forth in the moment.");
	output("\n\n<i>“Fisianna, I’m really glad that you think that way. Nothing makes me happier than hearing that. I love you too.”</i>");
	output("\n\nFisianna’s face doesn’t light up in surprise as you might have come to expect from the shy catgirl, but instead, she smiles gradually wider at the realization that her feelings are returned. Her eyes start to water as she once again clings to you, tighter this time. You pat and rub her back as you share the hug. Fisianna momentarily breaks the embrace to gaze lovingly into your eyes as her tails swish slowly behind her.");
	output("\n\nYou gaze back into the golden ocean that are Fisianna’s eyes with the same intensity that she is displaying to you. She is unmoving as you lean forward to her. When your faces meet, you press your lips onto Fisianna’s fair, peachy lips for the first time. Your new feline lover gives no resistance to your advances and slowly closes her eyes while the two of you share your kiss in the middle of the walkway. In this moment, Fisianna seems utterly oblivious to her surroundings, pressing herself more to you as the kiss progresses. You can feel her beginning to purr while she pushes herself harder against you. Fisianna’s tongue begins to probe the entrance of your mouth, looking for entry. You grant it and slide your own [pc.tongue] to grind against hers in a passionate close-mouthed French kiss. Your hands begin to slide over each other, gradually drifting towards more sensitive areas of your bodies. When your hands reach the neko’s perky bottom, you hear a catcall in the distance. Fisianna snaps back from her dreamlike state and immediately unlocks her lips from yours, blushing furiously, but not letting go of you.");
	output("\n\n<i>“T-this is possibly the happiest I’ve ever been in my life... I-I don’t think I’m dreaming, am I? Even if I am... I-I don’t want this moment to end...”</i> Fisianna hugs you close to her again, still purring.");
	output("\n\nYou pet Fisianna between her ears while she embraces you. Eventually she lets you go and you continue your walk around the plaza, holding hands the entire way. She is all smiles the whole way around the plaza as you both enjoy your new coupling together. When you reach the northeastern part of the plaza again, Fisianna reaches toward you and gives you a quick peck on your cheek this time.");
	output("\n\n<i>“I-I’m really glad that you feel the same way about me, and again, I’m really grateful to have met you, [pc.name]. I’m looking forward to the next chance I can see you again. I should go home now and get some rest... Let’s do something together again another time, just the two of us.”</i> Fisianna warmly smiles at you.");
	output("\n\n<i>“As I said at the bar before, it’s a date!”</i> You quip. Fisianna smiles wider as she hugs you a final time before turning to walk home.");
	
	flags["FISI_LOVER"] = 1;
	setFisiAway();
	processTime(20 + rand(25));
	addButton(0, "Next", mainGameMenu);
}

public function gimmeDemLipsFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	output("Rather than voice your opinion on her confession, you take the initiative to tell her through your actions. You gaze back into the golden ocean that are Fisianna’s eyes with the same intensity that she is displaying to you. She is unmoving as you lean forward to her. When your faces meet, you press your lips onto Fisianna’s fair, peachy lips for the first time. Your new feline lover gives no resistance to your advances and slowly closes her eyes while the two of you share your kiss in the middle of the walkway. In this moment, Fisianna seems utterly oblivious to her surroundings, pressing herself more to you as the kiss progresses. You can feel her beginning to purr as she pushes herself harder against you. Fisianna’s tongue begins to probe the entrance of your mouth looking for entry. You grant it and slide your own [pc.tongue] to grind against hers in a passionate close-mouthed French kiss. Your hands begin to slide over each other, gradually drifting towards more sensitive areas of your bodies. When your hands reach the neko’s perky bottom, you hear a catcall in the distance. Fisianna snaps back from her dreamlike state and immediately unlocks her lips from yours, blushing furiously, but not letting go of you.");
	output("\n\n<i>“I... I... T-that... that was... wow.”</i> Fisianna says breathlessly, completely at a loss for words. <i>“I-I suppose this means we... you know?”</i>");
	output("\n\nYou nod your head in understanding of where Fisianna was going with the question. She hugs you close to her again, still purring. <i>“I’m so glad...”</i> She murmurs into your chest.");
	output("\n\nYou pet Fisianna between her ears while she embraces you. Eventually she lets you go and you continue your walk around the plaza, holding hands the entire way. She is all smiles the whole way around the plaza as you both enjoy your new coupling together. When you reach the northeastern part of the plaza again, Fisianna reaches toward you and gives you a quick peck on your cheek this time.");
	output("\n\n<i>“I-I’m really glad that you feel the same way about me, and again, I’m really grateful to have met you, [pc.name]. I’m looking forward to the next chance I can see you again. I should go home now and get some rest... Let’s do something together again another time, just the two of us.”</i> Fisianna warmly smiles at you.");
	output("\n\n<i>“As I said at the bar before, it’s a date!”</i> You quip. Fisianna smiles wider as she hugs you a final time before turning to walk home. ");
	
	flags["FISI_LOVER"] = 1;
	setFisiAway();
	processTime(20 + rand(25));
	addButton(0, "Next", mainGameMenu);
}

public function friendzoneFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	output("You look down and away from Fisianna for a moment. Despite her heartfelt confession, you just don’t feel the same way about her, but you value the friendship that you already have between the two of you already. You try think of the right words to bring her down easy without hurting her feelings too much while looking back at the awaiting kitten.");
	output("\n\n<i>“Fisi, I’m very grateful that you admitted that you love me, but... I don’t think I feel the same way about you. I value you as good friend whom I’ve had a great time hanging out with. Every time we hung out together was definitely fun, but I wouldn’t want to potentially ruin what we already have going on by being together as lovers. You’re a lot of fun to be with Fisi, and I’d like to make more memories as good friends together.”</i>");
	output("\n\n<i>“O-oh...”</i> Fisianna breaks the embrace and looks downward at the ground. <i>“I-I’m sorry I pushed all those feelings on you like that... I just thought that... t-that maybe...”</i> You can start to see tears fall from her face while she looks down. You start to move in to attempt to comfort her by hugging her, but Fisianna sticks a paw out in front of you to stop you. She then looks up to you with teary eyes, though she has a small smile on her face. ");
	output("\n\n<i>“I-it’s ok, [pc.name]. Yeah, i-it hurts hearing that you don’t feel the same way about me that I do for you, but this is a hurt that I’ll have to get over. I-I don’t want you feeling guilty for me if you’re being true to your feelings. I don’t want to potentially lose one of my greatest friends over something like that. R-really, you’re just the best thing I could ever have hoped to have gotten out of my life so far. T-thank you...”</i> Fisianna wipes her tears away and smiles even wider. <i>“I do look forward to when we can hang out together again.”</i>");
	output("\n\nYou nod in agreement. Afterwards, the two of you finish your walk around the plaza while reminiscing about the times the two of you had together while hanging out with her friends. When you reach your starting point of your walk around the plaza again, Fisianna gives you a quick hug.");
	output("\n\n<i>“Again, I’m really glad to have met you, [pc.name]. I’m looking forward to the next chance I can see you again. I should go home now and get some rest... Let’s do something together again and have a blast.”</i> Fisianna warmly smiles at you.");
	output("\n\n<i>“Sure thing! Looking forward to it!”</i> Fisianna smiles wider as she hugs you a final time before turning to walk home. ");
	
	setFisiAway();
	processTime(20 + rand(25));
	addButton(0, "Next", mainGameMenu);
}

public function whatTheFuckIsWrongWithYou():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	output("You look down and away from Fisianna. Despite her heartfelt confession for you, you don’t feel the same way about her. You think it would be for the best to stop things at this point before her feelings could blossom further if you were together any longer.");
	output("\n\n<i>“I’m sorry that you feel that way Fisianna, but I can’t say that I feel the same way about you. I think it might be for the best if I stepped out of your life at this point before any misplaced feelings develop further.”</i>");
	output("\n\nFisianna releases her embrace on you, slowly backing away. Out of the corner of your eye, you can see that her face is plastered with consternation. When you raise your head to look at her, you find that the feline’s golden eyes are darting wildly around your body in fear and panic. Her ears are downturned and flattening to the sides while she is slowly shaking her head from side to side.");
	output("\n\n<i>“N-no... I... I-I thought... I... I b-bared everything I had to you... W-was it too much...? I-I thought...”</i> Fisianna whispers shakily, beginning to tremble on the spot as tears start to well up in her eyes. Her tails droop to the ground behind her, unmoving while she weakly lifts a paw towards you, almost as if reaching for something that is too far away.");
	output("\n\nYou do your best to maintain a stern expression. <i>“I’m sorry, Fisianna...”</i> You repeat. <i>“My life is in the stars... This will have to be goodbye.”</i> Not wanting to draw the moment on any longer, you turn around to face away from Fisianna. You can hear her crying audibly for a few moments before you hear her hurried footsteps rapidly fading away. You feel the piercing stares of a few curious and concerned onlookers, but you try to not pay them any mind as you [pc.walk] away in the opposite direction. ");

	
	flags["FISI_REJECTED"] = 1;
	flags["FISI_TRUST"] = 0;
	processTime(20 + rand(25));
	addButton(0, "Next", mainGameMenu);
}

//Cock processing
public function largestCockIndexThatFitsFisiDimensions():int
{
	var i:int;
	var maxFitIndex:int = -1;
	var maxFitVol:Number = 0;
	for (i = 0; i < pc.cocks.length; i++)
	{
		//if (pc.cocks[i].cLength() <= 14 && pc.cocks[i].thickness() <= 2.5 && pc.cockVolume(i, false) > maxFitVol)
		if(pc.cockThatFits(chars["FISIANNA"].vaginalCapacity()) >= 0)
		{
			maxFitIndex = i;
			maxFitVol = pc.cockVolume(i, false);
		}
	}
	
	return maxFitIndex;
}

public function leaveFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	if (flags["FISI_LOVER"] != undefined)
	{
		output("You rise up from the park bench and tell Fisianna that you have to be on your way, unfortunately.");
		output("\n\n<i>“Aww... you have to go already?”</i> You can tell that she sounds more than unhappy that you have to leave her for now. <i>“I-I’m going to miss you a <b>lot</b> while you’re gone... Please stay safe for me, and come back whenever you can. I’ll be waiting for you.”</i> Fisianna says sweetly. She rises up from her seat and gives you a hug and parting kiss. You return them and rub her back gently before letting her go and [pc.walk] away, leaving your feline lover to her own devices.");
	}
	else
	{
		output("You rise up from the park bench and tell Fisianna that you have to be on your way.");
		output("\n\n<i>“O-oh, leaving already? Mmm... alright then, [pc.name]. I hope I get to see you around again.”</i> You can tell that she sounds a little sad that you have to go. Fisianna rises up from her seat and gives you a parting hug. You return it and slightly ruffle her hair before letting her go and [pc.walk] away, leaving your feline friend to her own devices.");
	}
	
	addButton(0, "Next", mainGameMenu);
}

public function fisiannaApartmentHandler(btnSlot:int = 0):void
{
	flags["NAV_DISABLED"] |= NAV_WEST_DISABLE;
	
	output("\n\nTo the west, there is a lightly decorated, quaint-looking apartment. The number displayed on a plaque next to the entrance reads 124. ");
	if (flags["FISI_SLEPT_WITH"] == undefined) 
	{
		output("It probably wouldn’t be a good idea to disturb the inhabitant of this home without any reason to do so.");
		addDisabledButton(btnSlot, "KnockWest", "Knock West", "It wouldn’t be a good idea to knock here at this time.");
	}
	else if (fisiAtResDeck())
	{
		output("Fisianna is likely hanging around the North-East plaza around this time. It wouldn’t do any good knocking at her door right now.");
		addDisabledButton(btnSlot, "KnockWest", "Knock West", "It wouldn’t be a good idea to knock here at this time.");
	}
	else if (flags["FISI_REJECTED"] != undefined)
	{
		output("After breaking things off with Fisianna the way you did, the last thing you want to do is to show up at her doorstep. You shrug off any temptation to knock at her door.");
		addDisabledButton(btnSlot, "KnockWest", "Knock West", "It wouldn’t be a good idea to knock here at this time.");
	}
	else
	{
		output("Fisianna looks to be home at the moment, but she is likely either sleeping or working, knowing her schedule. You could try knocking to see if she will answer.");
		addButton(btnSlot, "KnockWest", knockKnockKnockinOnFisisDoor, undefined, "Knock West", "Knock and see if Fisianna will answer.");
	}
}

public function knockKnockKnockinOnFisisDoor():void
{
	clearOutput();
	author("Lkynmbr24");
	clearMenu();
	
	output("You knock on Fisianna’s door and wait patiently for an answer. After waiting for a few moments, no signs of a response seems to come. She might be busy at the moment. You think it would be best try again at another time.");
	
	processTime(rand(5));
	addButton(0, "Next", mainGameMenu);
}
