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
		output("\n\nThe first woman that catches your attention is an avian reminiscent of a harpy with bright yellow and green-patterned feathers and eye-catching clothing. She is dressed rather skimpily with a white tank top supporting F-cups and micro jeans. Her feather pattern trails her arms to her elbows and her hair is also more feather-like, with her legs looking very avian down past her mid-thigh area. She also looks to be supporting just as equally colorful <i>“wings”</i> folded into her forearms; the wings look big enough to be flight-capable.");
		output("\n\nThe second lady that catches your eye looks like an anthropomorphic dragon-girl, similar to a gryvain except a lot more animalistic. She is also dressed fairly skimpily with low-cut pants that let her powerful-looking tail wiggle free. The dragoness has on what looks like a red bikini top supporting G-cup breasts that despite her rugged appearance, jiggle with the slightest movement. She looks to be fully-scaled with the exception of her front area, which gives a lighter shade of tan skin in contrast to her ebony-black scales and her similarly colored long hair atop of her draconic head.");
		output("\n\nThe third girl you see looks vulpine in appearance with her tall triangular ears peeking through her fiery red hair, and equally red fur along her arms and legs. However, you notice a lot of movement behind her. You squint your eyes and make out two, no... three, four, five... nine tails!? It looks like someone went with a kitsune look. Her tails all look soft to the touch, practically inviting to you to take a nice rest on them. Her sizeable double D’s look just as comfortable to lay on, with her equally scanty clothing showing off all of her assets.");
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
	if (flags["FISI_NAH"] == undefined)output("\n\nNow that Fisianna isn’t crowded between the table and the girls, you can more clearly see the mod jobs she has done on her body. She has a cute pair of cat-like paws on her hands and feet, which are both left bare, and her two tails are quite long and luxurious. She’s also fairly petite in physique, but still has a distinctly feminine shape to her. Hugging her form is a black, fur-hooded sleeveless vest over a printed purple t-shirt, with blue bellbottom jeans. She certainly isn’t dressed as racy as her companions are.");
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
	output("\n\nYou assure Fisianna that everything is fine, though you point out that her friends might be worried about her sudden leave. Upon mention of her friends she straightens up with sudden realization while her ears perk high and her tails waggle at a fever pitch. <i>“O-oh! Hng... I should go back and let them know that I’m okay.”</i>");
	output("\n\nYou give Fisianna an approving nod before you rise up from the wall and offer a hand to her, which she accepts graciously as you help her to her feet. The feline’s paw in your hand feels luxuriously fluffy and soft to the touch, and you can’t help but to give a gentle squeeze on her pink ");
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
			case GLOBAL.UPBRINGING_PAMPERED: output("\n\nYou regale the ladies with stories of your childhood, telling them about things you did with your father while growing up and reflecting on things you wish you did with him now that he is gone."); break;
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
			output("You [pc.walk] over and take a seat next to Fisianna. When you sit down, Fisianna breaks her gaze from the scenery around you, leaning over to give you a short and soft kiss on your [pc.lipsChaste]. When you break the kiss, she looks shyly at you and and avoids direct eye contact.");
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
	
	addButton(14, "Leave", leaveFisi);
}

public function appearanceFisi():void
{
	
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	
	output("In the bright lights of the plaza, you are able to discern more of Fisianna’s features than you could back in Anon’s Bar. Upon noticing you starting to stare her down in an analytical manner, Fisianna’s ears twitch in surprise before gradually drooping lower on each side of her head in embarrassment, her cheeks flushing a subtle pink as she averts her gaze towards the ground. <i>“Um... [pc.name]? Y-you’re kinda... staring at me ah... really hard.”</i> she squeaks, barely audible to you.");
	output("\n\nFisianna stands at roughly 5\' 0\" in height. At first glance she looks similar to a full kaithrit; however, she has white fuzzy paws on the ends of her hands and feet which are kept bare, exposing the exquisitely plush pink pads on the underside of them. The fur at her bracelet adorned wrists gradually fade into an orange and white striped hue as her fur trails close to her elbows, making her look very similar to a terran tabby cat. Her legs also follow a similar pattern; the fur on them tracks up to her knees and stops there, though her legs have a more animalistic bend at the ankles, making them digitigrade in appearance. Fisianna seems to have done quite a job matching her hair color to her fur, further accentuating the tabby cat look with ass length hair of orange with white highlights. She also has the same two cat tails that kaithrit sport which are covered with the same orange and white striped fur. Fisianna’s tails seem a bit longer than usual kaithrit tails, not to mention hers seem to be able to move in a more precise manner, making them almost as dextrous as third and fourth arms. She sports the natural litheness and flexibility of a cat, with a trim body to match. Fisianna’s skin is smooth and lightly tanned where she does not have fur.");
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
	if (flags["FISI_TRUST"] < 75) output("Something tells you that there’s a deeper meaning behind what she just said, but you don’t think she would be comfortable enough to divulge that information yet, if the way her face is slowly sinking in sadness isn’t a clue.");
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
	output("\n\nFisianna lights up immediately when you mention programming, her ears pitched up high and twitching with delight. <i>“Ooh, it’s exciting! I love it! I mean, well... it does get a bit frustrating when it comes down to the specialty in programming that I deal with. I usually deal more with the ‘personality’ of the programs when it comes to AIs. Grown AIs, as most people call them. It’s delicate work, especially when it comes to the AIs that are designed to grow as they experience things. These types of AI’s especially have a high rate of failure for inexperienced programmers. One little mistake in the program code or core, or one little extra letter or space in the wrong place and the whole thing could go haywire. It might be a bit tedious to double check, triple check... well... check as many times as you have to to get it right! I don’t mind it at all though. I love programming AIs and VIs!”</i>");
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
	output("\n\nWell that certainly sheds a new light on why she is with such an exotic group of girls. <i>“We talked a lot during my time in college. Funnily enough, besides my brother and sister, they were the only other people I’ve really interacted with much in my life.”</i> Fisianna shakes her head violently from side to side as if to shake something off before she continues. <i>“A-anyways, when I was almost done with college, I decided by then that I would get those transformative mods that could make me reminiscent of a nekomata. Of course it was as expensive as ever, but I saved up every credit from any job that I could get while working on all of my exams.”</i>");
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
				output("\n\nYou tell Fisianna that you are game if everyone else is and look towards Aya to recieve her opinion. She looks very nervous about taking such a challenge right off the bat, but concedes to try it with the two of you anyways.");
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
				output("\n\nThe three of you make your way back through the crowded aisle to the checkout counters. It takes a while for it to be your turn to check out, but when the three of you arrive at the register, Aya shows the rip to the cashier and offers to pay for the pants. The cashier disinterestedly throws the garment into a bag and accepts Aya’s credit chit, bidding you a farewell after the transaction.");
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
				output("\n\n<i>“Agreed.”</i> After Fisianna swipes her credit chit on the bill for her salmon, the two of you head out of the diner, thanking each other for the company and saying your goodbyes before going your separate ways.");
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
				output("\n\nSeeing as it would be two versus one on any adverse decision you would make anyways, you are inclined to agree with the two girls. You grab the popcorn out of Aya’s arms so she won’t spill anymore, leaving her with the soft drinks. The three of you walk over to the ticket vendor to pay for your movie tickets. Aya steps in front with her bundle of soft drinks and offers to pay for your tickets, which you and Fisianna gratefully thank her. Afterwards, you head towards one of the screening rooms. Once inside, you observe that the room is already very crowded. It must be a very popular movie! The three of you manage find seats in the middle of the room despite this, and Aya passes her extra drinks to you and Fisianna once everyone settles down in their chairs. Your group sits through about ten minutes of previews for other movies before the main attraction starts.");
				output("\n\nThroughout the entirety of the movie, the room is bursting with laughter at the scientist’s shenanigans. At one particular point in the film, the scientist mods a graviball with part of the galotian’s “blubber-like” like cellular structure. They send it careening across a room, knocking an innocent passerby out cold. Aya laughs so hard at this that she accidentally squeezes the soft drink bottle in her hand and sends its contents flying backwards onto an unfortunate laquine behind her. She gasps and apologises profusely with the lagomorph. You turn a sideways glance towards Fisianna, who meets your gaze halfway with a knowing smile, afterwhich the two of you muffle your laughter the best that you are able to. The rest of the movie runs on uneventfully from then on. When the ending credits roll, the three of you make your way out of the screening room and into the theater lobby.");
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
				output("\n\n<i>“Great!”</i> The kitsune-morph pumps her fist in the air. <i>“Alright then, now that that’s settled, how about you two wait in line and buy us three tickets for the movie while I go get us some snacks? Figure I’d give you two some aloooone time!”</i> Tarariel winks as she passes a credit chit to you and saunters off towards the snack bars. Fisianna sighs while she avoids your gaze to suppress her blush again.");
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
				output("\n\n<i>“Mmm, I thought so. Tell you what? Would the two of you like to see a movie with me perhaps? I was feeling in the mood for a romance movie this time around. I’ll even pay for the tickets for you as gratitude for the company. Snacks included.”</i> Britannia smiles warmly as she waves a credit chit to emphasise her point. Who are you to pass that up?");
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
	output("\n\nWhen the door opens, you are greeted by the smiling feline. <i>“[pc.name]! I’m glad you’re here! Please come in!”</i> Fisianna steps aside to let you into her apartment. When inside you notice that all of Fisianna’s friends are already here and setting up her home gaming rig. You notice that everyone are wearing different variations of tank tops with knee length pajama bottoms. It really shows off their figures quite well. They all give you a short hello and wave before concentrating their attention back on the gaming rig.");
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
	if (pc.reflexes() >= 20) output("You just barely dodge the incoming projectile in time, while in the same dodging motion you pick up another pillow from the ground and throw it back at Tarariel in retaliation.");
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
	output("\n\nYou lay in bed until the other girls stir. They take their turns using the guest bathroom to freshen up, greeting each other with groggily as they pass each other. After the other girls are finished sprucing up in the bathroom, you climb out of bed and take your turn to prepare for the day. By the time you are done, everyone is in the living room, including Fisianna. She still seems affected by the earlier accidental snuggle, as she has a faraway look in her eyes. She snaps out of her thoughts when you arrive and blushes brightly before turning to Britannia.");
	output("\n\n<i>“T-thank you all for coming to the sleepover, and thank you Bri for helping me organize this. It was a great night, as I thought it would be.”</i>");
	output("\n\n<i>“No, Kitten. Thank you for graciously hosting this for us. It couldn’t have happened without you.”</i> Britannia reflects.");
	output("\n\n<i>“Yeah, I’d definitely love to do this again whenever we can, and once I get my CoV 8 lessons from Bri, I’m gonna whoop everyone’s ass next time!”</i> Tarariel sneers gleefully. Everyone laughs, to Tarariel’s dismay. <i>“What? I will!”</i>");
	output("\n\nYou each say your goodbyes as you head out of the apartment one by one and go your own separate ways. Out of the corner of your eye, you can see Fisianna giving you a longing look from her doorway while you amble down the walkway. You head back towards the elevators and take one down to your ship, where you change out of your pajamas. ");
	if (pc.isNude()) output("You silently reflect on your night with Fisianna and her friends.");
	else output("You strap on your [pc.gear] and silently reflect on your night with Fisianna and her friends.");
	output(" That night will definitely be one to remember.");
	
	pc.lust(10)
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
	output("\n\n<i>“U-um... I was thinking... would you like to arcade again? Just the two of us?”</i>");
	output("\n\nYou wonder why Fisianna would want to go to the arcade of all places first, since you both can go there together at any time to have fun.");
	output("\n\n<i>“W-well... it’s the place I feel most comfortable in at the moment, besides next to you of course. I-I thought we could start dating with something in more familiar territory. You don’t have to spoil me with fancy dinners or anything, though that wouldn’t be a bad idea either...”</i> Fisianna adds the last part with a playful undertone to her voice. You pretend not to acknowledge the idea of a candlelit dinner, but keep it in mind just in case. You take up Fisianna’s offer for a date to the arcade and grab her paw in your hand as you both rise from the bench and head to the elevator shafts.");
	output("\n\nThe two of you eventually arrive at the arcade without running into anyone familiar. Fisianna is already looking towards every gaming station in sight. Wrought with indecision, your playful date turns towards you with a thoughtful look on her face. <i>“Mmm, what should we play first? We could play some CoV 8 if you wanted to, or Castle Mania, or anything else you have in mind. I’m up for anything!”</i> Fisianna smiles gleefully at you.");
	output("\n\nSince it is just the two of you at the arcade this time, you think it might be a good idea to do something different this time. In a corner of the arcade, you spot a number of games that look remarkably similar to games you would find at a terran carnival, complete with prizes. You point at the section with the carnival-like activities to Fisianna and ask if she would like to try her hand at playing those for now.");
	output("\n\n<i>“Oh sure! That looks like it could be some fun!”</i> Fisianna places her paw into your hand as you make your over to the carnival-like games together.");
	output("\n\nThe first activity that catches Fisianna’s eye is a <i>“Shoot the Target”</i> game. It looks pretty standard from what you can see. There are several red targets moving along a track, which can be shot down with what looks like a light gun about the size of a small rifle. A side display shows the prizes that can be won for hitting a certain amount of targets. One of the prizes catches Fisianna’s eye and she smooshes her face on the glass panel to try to find a better view of the item she is fawning over. It looks like an oversized stuffed cat that is mostly white in color with splotches of brown and black all over it. Once she is done examining the stuffed toy, she runs over to you and grabs your hands, giving you a pleading look. <i>“Please, please, please! Can you try to win me that cute stuffed cat? I’m not the best of shots and I’d <b>love</b> to have it back at my apartment!”</i>");
	output("\n\nSeeing no reason to refuse, you grant Fisianna’s request. You offer to pay for your tries at the targets, and once you swipe your credit chit past the receiver, the game springs to life. Three red targets move in a uniform line at a steady pace. You pick up a light gun, and a display shows that you have three chances to down the targets. You look towards the prize display to check how many shots you would need to win the cat. To your dismay, you find that will need to hit all three shots to be able to obtain that prize. Well... the pressure is on now!");
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
	output("\n\n<i>“Ah. I imagine it’s because since the park is so new, they just haven’t been able to gather the necessary wildlife together yet. They would have to be careful picking what wildlife to place here so that they don’t wind up wreaking havoc on the ecosystem, or make it hard for whoever maintains all of this.”</i> Fisianna shrugs. <i>“Anyways, I figure we have a good amount of time to kill. Let’s check out what’s beyond and walk around for a bit!”</i> Fisianna wraps your arm around hers with her free arm.");
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
	output("\n\n<i>“W-whew.... w-we... we have to do this more often. That will never get old!”</i> Fisianna laughs in exhaustion. You chuckle and squeeze Fisianna to you while she hugs you back, purring all the while. ");
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
	output("\n\n<i>“Oh well...  I imagine it’ll be good anyways, especially with you here.”</i> Fisianna says dotingly, squeezing herself tighter to you. The two of you spend a few more moments in each other’s arms, eating Fisianna’s homemade snacks before the previews finish and the movie starts.");
	output("\n\nThe movie starts rather innocently enough; a starship cruiser is headed for a derelict space station to scavenge for parts. The ship lands and the scavenging crew gathers everything they can reuse. The operation goes smoothly enough and the crew heads back to the ship, though there are subtle undertones of mystery as an unidentified figure flashes across the screen and into the vessel just as the door is closing. Fisianna grips onto you tighter as this happens. The title screen comes up afterwards, reading: “<i>The Intruder.</i>“ You start to feel a bit of dread yourself as you are beginning to think that this movie may not be the most pleasant of movies to watch on a date.");
	output("\n\nSure enough, later on in the movie, crew members start to go missing and the captain of the ship orders a ship-wide assessment of the situation. Things grow even more bleak when several members of the search party go missing and only bloodstains are found. When a lieutenant makes their way down to the cargo bay area, he looks around until he finds a badly mutilated body. You can hear Fisianna gasp in terror as a shadow forms behind the hapless crew member. The officer notices a little too late and comes face to face with the grotesque alien that stowed away on the ship. He screams and manages to fire only a few shots off from his pistol before the alien comes down on him. Fisianna buries her head into your shoulder and shakes in fright. You rub her back gently until she is brave enough to bring her eyes back to the screen again. ");
	output("\n\nOnce the threat is identified, the whole ship goes into red alert while the crew sets about to hunt the alien down. Fisianna shrinks into your arms each time a member of the crew falls victim to the alien. Eventually there are only a few remaining surviving crew members left on the space cruiser, including the captain. He sets the ship to autopilot as the alien aims to break into the cockpit. The remaining crew members attempt to blast the foreign intruder when it successfully breaks in, to little avail. One of the privates fighting the alien pleads for the captain to escape while they still can. ");
	if (silly) output("They cry out: <i>“It’s game over man, game over!”</i> ");
	output("Afterwhich they immediately fall to the intruder. The alien bears down on the now lone captain and lunges at him. The captain barely escapes out of the cockpit in time. The invader chases after the captain relentlessly as he makes his way to the airlocks. Fisianna looks on with bated breath while the captain runs and gasps at every close call he has. Eventually he makes it to the airlocks, but to his dismay, all the escape pods have already been jettisoned; likely by crew members that were too terrified to stay aboard. Even you are starting to feel tense and wondering what he will do next as the alien threat closes in on the unfortunate captain.");
	output("\n\nThe invader slowly and menacingly lumbers over to the trapped captain, ready to strike the final blow. In an instant, he holds onto a nearby bar on the wall and slams his hand on the airlock release button, opening the door next to them. Everything not nailed down in the room goes flying out of the airlock and into the empty void of space. The intruder struggles to keep its traction on the ship floor and falls victim to the suction of air being forced rapidly out of the room, but not before grabbing onto the doorframe in desperation. The captain beats at the alien’s limbs that are closest to him while holding his breath. ");
	output("\n\nYou can feel Fisianna rocking and fidgeting next to you while the alien’s grip loosens bit by bit. When you look towards her, she bites her lower lip in anxiousness. Her twinned tails suddenly stretch out while her knees and paws clench together. Dismissing the gestures as mere expressions of terror, you look towards the screen after hugging her reassuringly, not wanting to miss the resolution of the scene. ");
	output("\n\nAfter a few more hits, the alien intruder finally lets go and is vacuumed into the the cold recesses of space. The captain slams the airlock button down again to close the door as he, Fisianna, and the rest of the moviegoers breathe a collective sigh of relief. The captain makes their way back to the cockpit of the starship and plots a course for home.");
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
	output("\n\n<i>“I was designed for the purpose of being integrable with a multitude of serviceable androids and/or machinery, thus my accelerated learning programming is longer than what most standard growth type AIs go through. As a result, when I reach one-hundred percent completion of my progress through aforementioned programming, I should be able to help in multiple fields of work outside of helping Fisianna repair droids, androids and programming AIs and VIs for her occupation. Fisianna takes great care in my well being during all of this. I couldn’t be in better hands... or paws, so to say.”</i> Isis quips. Fisianna deflates and blushes at the praise the AI gives to her.");
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
	output("\n\n<i>“B-but... I can’t... I-I don’t want to leave [pc.name]...”</i> You can see Fisianna wincing as she tries to resist the zil’s advances. You can see the his face start to contort in annoyance while he moves his right arm faster, making the pheromone smell even stronger. You’re almost at your breaking point of leaping on him yourself to directly whiff that hypnotic smell, and licking the honey that comes with it.");
	output("\n\nThe zil raises the free hand he isn’t using to jack himself off to cup Fisianna’s face into his hand. <i>“Only I can show you things that that [pc.race] over there couldn’t even possibly think of doing with you. A smell this wonderful is a one of a kind experience that you can only get with me, and nobody else, though it doesn’t have to be a one-time experience...”</i> The zil leans in to kiss Fisianna. ");
	if (pc.willpower() < 15)
	{
		output("\n\nYou’re still immobilized from sheer lust and helpless to watch. When he is mere inches from Fisianna’s face, and you think Fisianna is completely lost to the pheromones, you hear a cat-like hiss and see a white paw flash across the zil’s face. The brash interloper is launched backwards and out of the side of the booth onto the floor. The smell of pheromones suddenly becomes much less intense and you snap out of your lust-addled state to see Fisianna standing over the fallen bee-like man. He has a look of shock, anger, and pain written all over his face as he struggles and fails to straighten up and sheathe his penis inside of his pants.");
		output("\n\n<i>“What the fuck?! Are you crazy you little-”</i> The zil curses as he glowers at your feline companion. Fisianna herself is shaking on the spot, whether from being released from the pheromones or from anger, you can’t immediately tell until you see her fur standing up on end and her ears turn flat and backwards. In between a cat-like growl, she speaks up.");
		output("\n\n<i>“Y-you... our night was going <b>so</b> well until you decided to come over and try to <b>drug</b> us. I can’t stand people that can’t give a shred of decency towards people who just want to have a good time to themselves and consciously try to pry couples apart for their own perversion. You are the <b>worst</b> type of person. I’m not so easy that I would fall head over heels for you, even with your enticing smell. I’d never leave [pc.name] for something as petty as that. If you don’t want another one across your face, then either stay down or crawl away.”</i> Fisianna hisses. The zil considers his options before conceding to crawl and scurry away. The patrons that were watching the scene start to cheer at Fisianna, some laughing and jeering at the fleeing bee. Fisianna snaps out of her anger as soon as the zil hurries out of sight and starts to blush furiously when she sees most of the bar cheering for her. She then takes her seat back next to you with nothing but concern for you etched on her face.");
		output("\n\n<i>“[pc.name]! Are you alright? I hope his scent didn’t affect you too much. I-I’m sorry for suggesting this stupid idea to come to this bar in the first place...”</i> Tears start to well up in her eyes as she wraps her arms around you to hug you. You can hear her start to sob into your chest, to which you do your best to comfort her by rubbing her back and between her ears. Fisianna cries into your chest for a few minutes before finally letting you go. You give her your best smile as she looks passionately at you under her tearstained golden eyes. Just at this moment, you see a kui-tan approach your table. He looks rather dapper for being in a bar like this.");
	}
	else
	{
		output("\n\nWith a great deal of willpower, you are able to shake off the tantalizing smell coming from the masterbating bee. Right before the zil’s long tongue can reach Fisianna’s lips, you yank the catgirl backwards, while with your free hand you give the brazen interloper a good punch across his face. He reels from the blow and falls out of the side of the booth and onto the floor. The smell of pheromones suddenly becomes much less intense and you can see that Fisianna has snapped out of her lust-addled state. The zil has shock, anger, and pain written all over his face as he struggles and fails to straighten up and sheathe his penis inside of his pants.");
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
	if (silly && pc.willpower() < 15) output("\n\n<i>“Well, they ought to start calling you <b>Fist</b>ianna. That was one mean right hook you gave him!”</i> The kui-tan laughs.");
	output("\n\n<i>“I’m the bartender working the shift tonight... Hey, to make things up to the two of you, this visit, and the next visit that you come here, drinks and food are on us. I know it’s not much to make up for what happened, but it’s the least we can do.”</i>");
	output("\n\n<i>“I... y-you don’t have to do all that for us...”</i> Fisianna blushes bashfully.");
	output("\n\nThe bartender raises a defiant finger in front of him and waves it. <i>“We insist, as long as you can continue to be a patron here!”</i>");
	output("\n\n<i>“W-well... okay.”</i> Fisianna concedes. The bartender turns and walks away to go back behind the bar. She then turns to you with a bright blush and a somewhat sad look on her face.");
	output("\n\n<i>“U-um, [pc.name]... I’m sorry, but we might have to cut this date a bit short... I-I... I need to get changed after all that. I-I imagine it might be the same case for you too.”</i> Fisianna laughs timidly. She’s right. Ever since that zil’s pheromone attack subsided, your nethers have been feeling especially wet with excess arousal. You reluctantly agree to call the date over for now before the both of you exit the booth and head out of Anon’s. Once the both of you head back up the elevator and arrive at the residential area, you kiss each other goodbye before Fisianna walks home, albeit with an awkward gait likely due to the wetness in her pants. ");
	
	pc.lust(20);
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

	pc.lust(30);
	setFisiAway();
	processTime(60 + rand(15));
	currentLocation = "LIFT: RESIDENTIAL DECK";
	addButton(0,"Next",mainGameMenu);
}

public function sexFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	moveTo("RESIDENTIAL DECK FISIS APARTMENT");
	
	IncrementFlag("FISI_TIMES_SEXED");
	
	output("You propose the idea of going back to Fisianna’s place for a bit of ‘fun’ while shooting an unsubtle wink at her, making your intentions clear.");
	output("\n\n<i>“O-oh my... Y-you wanna do... that?”</i> Fisianna’s face lights up in surprise as her face flushes pink. She recovers quickly as her eyes lower halfway, making her look both cute and seductive. <i>“W-well... I-I suppose we <b>could</b>...”</i> Fisianna drags the <i>“could”</i> in mock thought as she stands up from the bench. ");
	if (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output("You follow suit and wrap your [pc.tails] around hers while you walk back to Fisianna’s apartment.");
	else output("You follow suit and walk arm in arm back to Fisianna’s apartment.");
	output("\n\nOnce the two of you arrive, you jump to the attack and seize Fisianna in a fierce and passionate kiss. You lock lips with each other tightly while your tongues dance between the seal of your mouths. Without breaking the kiss, the two of you stumble all the way into her bedroom, where you eventually trip over the edge of her bed, consequently pulling the both of you apart. Fisianna looks at you with her golden eyes, filled with passion and hunger for you as you lay next to each other side by side on the bed, panting for breath from the long kiss. You think about what you would like to do with your feline lover this time.");

	if (pc.hasCock() || pc.hasVagina()) addButton(0, "Tailjob", tailjobFisi, undefined, "Tailjob", "Let her tails go to work on you.");
	else addDisabledButton(0, "Tailjob", "Tailjob", "You need a cock or vagina for this.");
	
	if (flags["FISI_SEX_NUMBER"] >= 1) addButton(1, "Eat Her Out", eatOutFisi, undefined, "Eat Her Out", "Munch on her pussy.");
	else addDisabledButton(1, "Eat Her Out", "Eat Her Out", "It doesn’t look like she is comfortable enough with you to do this yet.");
	
	if (!(flags["FISI_SEX_NUMBER"] >= 2)) addDisabledButton(2, "Sixty-Nine", "Sixty-Nine", "It doesn’t look like she is comfortable enough with you to do this yet.");
	else if (pc.hasVagina() || largestCockIndexThatFitsFisiDimensions() >= 0) addButton(2, "Sixty-Nine", sixtyNineFisi, undefined, "Sixty-Nine", "Lick each other up.");
	else addDisabledButton(2, "Sixty-Nine", "Sixty-Nine", "You need a cock that fits or vagina for this.");
	
	if (!(flags["FISI_SEX_NUMBER"] >= 3)) addDisabledButton(3, "Vaginal", "Vaginal", "It doesn’t look like she is comfortable enough with you to do this yet.");
	else if (largestCockIndexThatFitsFisiDimensions() >= 0 || (pc.hasHardLightEquipped() && pc.hasVagina())) addButton(3, "Vaginal", vaginalFisi, undefined, "Vaginal", "Make love with the feline.");
	else addDisabledButton(3, "Vaginal", "Vaginal", "You need a cock that fits, or a vagina and a hardlight strapon for this.");
}

public function tailjobFisi():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi();
	clearMenu();
	
	moveTo("RESIDENTIAL DECK FISIS APARTMENT");
	
	IncrementFlag("FISI_TIMES_TJ");
	
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
			output("The other tail that is nearing your [pc.vagina] moves down and makes contact with your [pc.clits]. Fisianna uses the the tip of her tail to start to stimulate your pleasure button");
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
		output("\n\nWhen the tip of your tongue hits Fisianna’s ");
		if (fisianna.vaginalVirgin) output("unbroken hymen");
		else output("cervix");
		output(", her thighs clench around you. You can feel a pair of paws pushing the back of your head deep into her snatch so hard, that you can no longer properly breathe through your nose and you see nothing but stars. You can hear the vibrations of Fisianna’s resounding moan echo through her thighs into your now muffled ears. You definitely hit her on the right spot with that, but you’ll have to fight your way out if you want to breathe again. You repeatedly thrust your [pc.tongue] in and out of her, using your tongue like a long wriggly phallus, trying desperately to bring her to orgasm. Fisianna is definitely becoming wetter, and her grip tighter with each oral thrust you take, as her cries of pleasure rise up an octave.");
	}
	else
	{
		output("\n\nYou decide to go in for the kill at this point and work the tip of your tongue to Fisianna’s sensitive button. Your feline companion’s golden eyes snap wide open for a split second before you see her throw her head back on the bed and let out a body shaking howl of utter pleasure. Now you’ve <i>really</i> got her going! You dive in further, enclosing your mouth on her lower lips as if to French kiss them. You still gently work your tongue on her love bud, prodding and flicking with practiced ease to learn what makes Fisianna tick. Occasionally you take a few dips into her honey pot to lap up all of her sweet nectar. While licking at her folds, you spell out a few uppercase letters to see what reactions you tease out of her.");
		output("\n\nWhen you progress to the letter “G”, Fisianna’s thighs clench around you. You can feel a pair of paws pushing the back of your head so deep into her snatch, that you can no longer properly breathe through your nose and you see nothing but stars. You can hear the vibrations of Fisianna’s resounding moan echo through her thighs into your now muffled ears. ");
		if (silly) output("You definitely hit the <b>G</b>-spot with that one");
		else output("You definitely hit her on the right spot with that one");
		output(", but you’ll have to fight your way out if you want to breathe again. You keep at Fisianna’s folds while repeatedly spelling out the letter <i>“G”</i> , trying desperately to bring her to orgasm. Fisianna is definitely becoming wetter, and her grip tighter with each lick you take, as her cries of pleasure rise up an octave.");
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
	pc.lust(33);
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
		output(" progressively turn into lewd wet smacks, with the occasional lick tracing across the opening of your [pc.vagina]. <i> “Haah... I-I didn’t think that you could taste so wonderful down here!”</i> Fisianna breathlessly moans in between her oral affections.");
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
	
	pc.orgasm();
	processTime(30 + rand(25));
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
	
	pc.orgasm();
	processTime(30 + rand(25));
	addButton(0, "Next", vaginalFisi2);
}

public function vaginalFisi2():void
{
	clearOutput();
	author("Lkynmbr24");
	showFisi(2);
	clearMenu();
	
	var x:int = largestCockIndexThatFitsFisiDimensions();
	
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
		if (pc.cocks[i].cLength() <= 14 && pc.cocks[i].thickness() <= 2.5 && pc.cockVolume(i, false) > maxFitVol)
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
	flags["NAV_DISABLED"] = NAV_WEST_DISABLE;
	
	output("\n\nTo the west, there is a lightly decorated, quaint-looking apartment. The number displayed on a plaque next to the entrance reads 124. ");
	if (flags["FISI_SLEPT_WITH"] == undefined) 
	{
		output("It probably wouldn’t be a good idea to disturb the inhabitant of this home without any reason to do so.");
		addDisabledButton(btnSlot, "Knock", "Knock", "It wouldn’t be a good idea to knock here at this time.");
	}
	else if (fisiAtResDeck())
	{
		output("Fisianna is likely hanging around the North-East plaza around this time. It wouldn’t do any good knocking at her door right now.");
		addDisabledButton(btnSlot, "Knock", "Knock", "It wouldn’t be a good idea to knock here at this time.");
	}
	else if (flags["FISI_REJECTED"] != undefined)
	{
		output("After breaking things off with Fisianna the way you did, the last thing you want to do is to show up at her doorstep. You shrug off any temptation to knock at her door.");
		addDisabledButton(btnSlot, "Knock", "Knock", "It wouldn’t be a good idea to knock here at this time.");
	}
	else
	{
		output("Fisianna looks to be home at the moment, but she is likely either sleeping or working, knowing her schedule. You could try knocking to see if she will answer.");
		addButton(btnSlot, "Knock", knockKnockKnockinOnFisisDoor, undefined, "Knock", "Knock and see if Fisianna will answer.");
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