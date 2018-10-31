public function annoPuppyslutmasEntry():Boolean
{
	if (flags["PUPPYSLUTMAS_2014"] == undefined && flags["PUPPYSLUTMAS_2014_ANNO_OFFER"] == undefined && isChristmas())
	{
		clearOutput();
		showAnno();
		author("Savin");
		flags["PUPPYSLUTMAS_2014_ANNO_OFFER"] = 1;

		output("As you’re hanging around your quarters, you hear a knock on your door. You bid whoever it was enter, and find Anno stepping in, smiling from ear to ear.");

		output("\n\n<i>“Hey, babe,”</i> she purrs, slipping into your lap and hooking her arms around your neck. Anno squeezes herself in close to you, her white tail swishing against your [pc.leg]. You’re starting to think that your affectionate ausar lover just needed a cuddle before she finally gets to why she came by:");
		
		output("\n\n<i>“So, it’s getting to be that time of year. Christmas, I mean. And-”</i>");
		
		output("\n\nYou cock an eyebrow at her, cutting her off with, <i>“You care about Christmas? Wouldn’t think an ausar would pay any attention to it.”</i>");
		
		output("\n\nAnno gives you a look and says, <i>“Hey, I’ve got a ");
		if (!pc.isHuman()) output("half-");
		output("human " + pc.mf("boy","girl") + "friend, for one thing. Plus it’s the biggest shopping season in the galaxy. Hard not to notice all the advertisements literally everywhere. And all the softcore of girls in Santa hats and fuzzy red undies. That’s the </i>real<i> Christmas cheer if you ask me.”</i>");
		
		output("\n\nAnno sticks her tongue out at you before finishing, <i>“Anyway! What I was trying to say was, it’s our first holiday season together, and I was hoping maybe you’d like to come do something special with me to celebrate.”</i>");
		
		output("\n\n<i>“Oh?”</i> you ask, slipping a hand around Anno’s waist. <i>“What’d you have in mind?”</i>");
		
		output("\n\n<i>“Well... I’ve mentioned my parents before, right? They’re pretty - I don’t wanna say rich, but, uh, they’re pretty rich. They host this big charity event on the homeworld every year around this time. Gonna be plenty of drinks and rich old corporate hounds wandering around. Really, though, this would be a really good time to... you know... meet my parents. I know you’ve got the big quest and all that still going on, but it’d mean a lot to me if we could go. Just for a little while.”</i>");

		clearMenu();
		addButton(0, "Sure", annoPuppyslutmasYe, undefined, "Sure", "That sounds like fun. Take Anno to Ausaril and meet the Dorna family.");
		addButton(1, "Nope", annoPuppyslutmasNope, undefined, "Nope", "You’ve got better things to do.");
		
		processTime(10);
		return true;
	}
	return false;
}

public function annoPuppyslutmasNope():void
{
	clearOutput();
	showAnno();
	author("Savin");

	output("<i>“Sorry, Anno. We don’t have time to go to a party right now.”</i>");
	
	output("\n\nThe happy wagging of Anno’s tail dies instantly, and her smile fades. <i>“Right. Uh, yeah, you’re right. Sorry, I don’t know what I was thinking.”</i>");
	
	output("\n\nAnno slips out of your lap and heads for the door. <i>“Talk to you later I guess. I’ll give");
	if(flags["ANNOxKAEDE_INTRODUCED"] != undefined) output(" Kaede");
	else output(" my friend");
	output(" a call, see if I can swing a pickup next time we’re on-world.”</i>");
	
	processTime(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoPuppyslutmasYe():void
{
	flags["PUPPYSLUTMAS_2014"] = "Anno";

	clearOutput();
	showAnno();
	author("Savin");

	output("<i>“Sounds like fun!”</i> you say, grinning at your lover. You can see the excitement bubbling in Anno’s face before she lets out a delighted squeal and hugs you tight.");
	
	output("\n\n<i>“You’re the best, [pc.name]!”</i> she beams, hopping out of your lap. <i>“I’ll go plug the address into the navicomp!”</i>");
	
	output("\n\nAnno scoots out of your cabin, her booty and tail wiggling happily as she goes. You give her a few moments to get her family’s address plugged in before heading to the bridge and dropping into the captain’s chair. You angle your vessel towards the local Warp Gate and hit the throttle, starting your journey towards Ausaril...");

	processTime(10);
	
	clearMenu();
	addButton(0, "Next", annoPuppyslutmasArrive);
}

public function annoPuppyslutmasArrive():void
{
	clearOutput();
	
	currentLocation = "SPACE";
	showLocationName();
	hideMinimap();
	
	// Anno all dressed up!
	showBust(annoBustDisplay());
	showName("\nANNO");
	author("Savin");

	processTime(360);

	output("<b>A few hours pass</b>...");
	
	output("\n\n<i>“Does this dress look alright, babe?”</i>");
	
	output("\n\nYou look up from reading on your Codex as Anno steps out of her closet, high heels clicking on the deck. It’s a force of will to keep your jaw from dropping as your ausar lover parades in front of you, clad in a stunning purple ball gown. A strapless, low-cut top adorned with silver embroidery plunging down between her breasts and interweaving across her waist. The sides and, you see as she twirls around for you, back are cut away, leaving plenty of bare, pale skin. Her skirts are wide, blooming out around her long legs and well past her shoulders. Her tail is totally concealed, though you can see little shifts in her skirts as it swishes excitedly under your studious gaze.");
	
	output("\n\n<i>“You look gorgeous,”</i> you answer, stepping over and putting your hands on your lover’s waist, just above her wide skirts. She giggles and blushes, chewing her lip as you pull her close.");
	
	output("\n\n<i>“Really think so?”</i> she asks, beaming when you nod your affirmation.");
	
	if (pc.isNice()) output("\n\n<i>“I’ll have the prettiest girl at the ball,”</i> you tell her.");
	else if (pc.isMischievous()) output("\n\n<i>“Who’s a pretty princess?”</i> you tease, squeezing her butt through her dress.");
	
	output("\n\n<i>“Am... am I?”</i> Anno mewls.");

	if (pc.isAss()) output("\n\n<i>“Every girl there’s gonna be jealous of you,”</i> you say with surety.");
	
	output("\n\nYour lover smiles up at you and presses her cheek to your [pc.chest], giving you a great big hug in return for the compliments. <i>“Shouldn’t be far from Ausaril by now. Let me just do my hair, and I’ll be all ready!”</i>");
	
	output("\n\nYou give her a nod and head back to the cockpit, making the final preparations for landing.");

	processTime(10);
	
	clearMenu();
	addButton(0, "Next", puppyslutmasArrive);
}

public function syriPuppyslutmasEntry():Boolean
{
	if (flags["PUPPYSLUTMAS_2014"] == undefined && flags["PUPPYSLUTMAS_2014_SYRI_OFFER"] == undefined && isChristmas())
	{
		clearOutput();
		showSyri();
		author("Savin");
		flags["PUPPYSLUTMAS_2014_SYRI_OFFER"] = 1;
		
		output("<i>“Hey, Steele!”</i> Syri says, winking at you as you come over. She leans back in her seat and pats the chair next to her, inviting you over. As you take your accustomed seat, you see your ausar friend’s raven tail swishing faster than usual - and something <i>else</i> seems pretty happy to see you, too. You flop down beside Syri and grab a drink she slides over to you.");
		if (hours <= 12) output(" It’s five o’clock somewhere, right?");
		output("\n\n<i>“So. I was hoping you’d stop by,”</i> Syri says, planting an affectionate arm around your shoulders. <i>“It’s the season to be jolly, right? Gettin’ on towards Christmas. Not that you could tell in this awful jungle or anything. Winter? Nah, hot and sweaty all day every day. Welcome to Mhen’ga!”</i>");
		output("\n\nSyri kicks back a long drink, sucks in a sharp breath, and says, <i>“Anyway! Not what I wanted to talk about. Don’t mind me, I’m a little drunk already becaaaaause... I got a message from my parents yesterday. I guess they finally realized I changed email addresses after school. So they invited me to this big shindig they throw every almost-Christmas back home. Big charity party for all their rich friends, I guess.”</i>");
		output("\n\n<i>“You don’t sound too excited about it,”</i> you venture, glancing between Syri’s flushed cheeks and the almost empty bottle of beer beside it.");
		output("\n\nShe huffs. <i>“I’m not! I haven’t seen my parents since, uh, whaddaya humans call it... high school! Told ‘em to get fucked and enlisted right out of school.");
		if (flags["ANNOxSYRI_EVENT"] == undefined) output(" Haven’t seen my sister in ages, either, and she’ll probably be there.");
		output(" Not really on good terms with my family, so... hell, I don’t even know why they invited me. Figured they wouldn’t want anything to do with me anymore.”</i>");
		output("\n\nSyri sighs and rubs the back of her neck. After a moment’s thought, she adds, <i>“But fuck it. Maybe I should go. Worse that can happen is I get smashed and tell ‘em to fuck off again, right? Oh, yeah, and I’ve got an invitation plus one. And I’m sure as hell not going alone...”</i>");
		output("\n\nIt doesn’t take a genius to pick up on Syri’s akwardly-voiced request: she wants you to come as her date.");

		clearMenu();
		addButton(0, "Sure", syriPuppyslutmasYe, undefined, "Sure", "Accompany Syri to her parent’s Christmas gala. You might even be able to heal old wounds. Or at least keep Syri from getting too drunk.");
		addButton(1, "Nope", syriPuppyslutmasNope, undefined, "Nope", "Syri should stay away. No need to re-open old wounds.");

		processTime(10);
		
		return true;
	}
	return false;
}
public function syriPuppyslutmasNope():void
{
	clearOutput();
	showSyri();
	author("Savin");

	output("<i>“I don’t think that’s a good idea anyway,”</i> you say flatly. <i>“If you don’t wanna go, don’t.”</i>");
	output("\n\n<i>“Heh. Yeah,”</i> Syri says, finishing her drink. <i>“Fuck, I wish they’d just leave me alone. Guh. Well, thanks for helping me make up my mind, Steele. I hate waffling like that.”</i>");
	output("\n\nYou nod and finish your own drink. <i>“So, what’s the problem with your parents, anyway?”</i>");
	output("\n\nSyri scowls and leans back against the bar, shaking her head. <i>“It’s stupid, really. I actually did pretty good in school, you know. Not as good as my rocket scientist of a sister, but still. Could have gone to some good universities, followed the family tradition and gone into science, or business, or whatever. But fuck it, that’s not what I want to do with my life. I wanted to get out there and </i>do<i> things - fight and explore, maybe even captain a ship out in the Black and make my own damn fortune. Sure, I fucked all that up, but I’d rather have tried than not, you know? My folks didn’t understand that - they’d had everything handed to ‘em on a silver platter, grew up idle and rich. They pitched a fit when I said I wanted a ship instead of a full ride to Ausaril Tech.");
	output("\n\n<i>“That’s why I respect you, Steele, you know. Sure, you’ve got Daddy Steele back there dangling riches in front of you, but you’re </i>out here<i>, going on adventures and living your life anyway. Heh, I wish I could be where you are.... Instead of stuck here doing construction work to keep from starving.”</i>");
	output("\n\nYou put a comforting hand on Syri’s shoulder, and she gives you a weak smile. <i>“I’m rambling. Pretend you didn’t hear any of that... it could be a lot worse. Like having a desk job.”</i>");
	output("\n\nShe laughs and slaps you on the back. <i>“Anyway. C’mon, let’s talk about something else...");
	if (pc.lust() >= 33) output(" Or at least let me drown my sorrows in that sweet ass of yours, Steele!");
	output("”</i>");
	
	processTime(10);

	// [Syri's Morning Menu here]
	syriMorningMenu();
}
public function syriPuppyslutmasYe():void
{
	flags["PUPPYSLUTMAS_2014"] = "Syri";

	clearOutput();
	showSyri();
	author("Savin");

	output("<i>“I guess I could tag along,”</i> you say, putting your arm around Syri’s shoulders. Her ears perk up at the affirmation, and she flashes you a wolfish grin.");
	output("\n\n<i>“Seriously? I honestly didn’t think you’d say yes... but I appreciate it, Steele,”</i> she says, scooting over to put her head on your shoulder. <i>“So the party starts in less than a day, and I don’t have a ship. Or, uh, any cash for a space taxi. Think I could hitch a ride with you?”</i>");
	output("\n\nYou nod and, after finishing your drinks, you pull Syri to her feet. She excuses herself to her apartment, and returns a few minutes later with a small suitcase. <i>“Just a change of clothes,”</i> she says. " + pc.mf("You take her suitcase", "You nod") + " and head for the spaceport. On the way, you find your companion’s fingers lacing through yours, holding your hand tight. When you look her way, Syri gives you a little wink and walks a little closer, just enough to let the tip of her tail brush your [pc.legOrLegs] and [pc.butt] as you walk. It isn’t far to the spaceport, and then a quick elevator jaunt up to your ship.");
	output("\n\n");
	if (flags["SYRI_SEEN_PCS_SHIP_CABIN"] == undefined) output("<i>“Nice digs,”</i> Syri says, following you aboard and");
	else output("<i>“Home away from home,”</i> Syri says with a smile,");
	output(" tossing her long coat over the back of your couch. <i>“I’ll go plug the address into the navicomputer, I guess. Get this trainwreck moving.”</i>");
	output("\n\nYou follow Syri up to the bridge and watch her tap some coordinates into the nav console. Once she does, you engage the autopilot and let your ship guide you up off the surface of Mhen’ga and towards the local Warp Gate.");

	processTime(10);
	
	clearMenu();
	addButton(0, "Next", syriPuppyslutmasUnderway);
}

// Proc with Syri at the Freezer. Must have completed Syri’s quest.
public function syriPuppyslutmasEntryUveto():Boolean
{
	if (flags["PUPPYSLUTMAS_2014"] == undefined && flags["PUPPYSLUTMAS_2014_SYRI_OFFER"] == undefined && isChristmas())
	{
		clearOutput();
		showSyri();
		author("Savin");
		flags["PUPPYSLUTMAS_2014_SYRI_OFFER"] = 1;
		
		output("<i>“Hey, Steele!”</i> Syri says, winking at you as you come over. She leans back in her seat and pats the chair next to her, inviting you over. As you take your accustomed seat, you see your ausar friend’s raven tail swishing faster than usual - and something <i>else</i> seems pretty happy to see you, too. You flop down beside Syri and grab a drink she slides over to you.");
		if (hours <= 12) output(" It’s five o’clock somewhere, right?");
		output("\n\n<i>“So. I was hoping you’d stop by,”</i> Syri says, planting an affectionate arm around your shoulders. <i>“It’s the season to be jolly, right? Gettin’ on towards Christmas. I mean, it’s Christmas every day here on Uveto what with the constant numbing snow and endless blizzards, but hey.”</i>");
		output("\n\nSyri kicks back a long drink, sucks in a sharp breath, and says, <i>“Anyway! Didn’t mean to get off on a tangent about the weather. I’m just a little drunk already becaaaaause... I got a message from my parents yesterday. I guess they finally realized I changed email addresses after school. So they invited me to this big shindig they throw every almost-Christmas back home. Big charity party for all their rich friends, I guess.”</i>");
		output("\n\n<i>“You don’t sound too excited about it,”</i> you venture, glancing between Syri’s flushed cheeks and the almost empty bottle of beer beside it.");
		output("\n\nShe huffs. <i>“I’m not! I haven’t seen my parents since, uh, whaddaya humans call it... high school! Told ‘em to get fucked and enlisted right out of school. Not really on good terms with my family except Anno, so... hell, I don’t even know why they invited me. Figured they wouldn’t want anything to do with me anymore.”</i>");
		output("\n\nSyri sighs and rubs the back of her neck. After a moment’s thought, she adds, <i>“But fuck it. Maybe I should go. Worse that can happen is I get smashed and tell ‘em to fuck off again, right? But the reason I’m bringing it up is... I’ve got an invitation plus one, and I couldn’t think of anybody I’d rather go with, y’know.”</i>");
		output("\n\n");

		processTime(10);

		clearMenu();
		addButton(0, "Sure", syriPuppyslutmasYeUveto, undefined, "Sure", "Accompany Syri to her parent’s Christmas gala. You might even be able to heal old wounds. Or at least keep Syri from getting too drunk.");
		addButton(1, "Nope", syriPuppyslutmasNopeUveto, undefined, "Nope", "Syri should stay away. No need to re-open old wounds.");
		
		return true;
	}
	return false;
}
public function syriPuppyslutmasNopeUveto():void
{
	clearOutput();
	showSyri();
	author("Savin");

	output("<i>“I don’t think that’s a good idea anyway,”</i> you say flatly. <i>“If you don’t wanna go, don’t.”</i>");
	output("\n\n<i>“Heh. Yeah,”</i> Syri says, finishing her drink. <i>“Fuck, I wish they’d just leave me alone. Guh. Well, thanks for helping me make up my mind, Steele. I hate waffling like that.”</i>");
	output("\n\nYou nod and finish your own drink. <i>“So, what’s the problem with your parents, anyway?”</i>");
	output("\n\nSyri scowls and leans back against the bar, shaking her head. <i>“It’s stupid, really. I actually did pretty good in school, you know. Not as good as my rocket scientist of a sister, but still. Could have gone to some good universities, followed the family tradition and gone into science, or business, or whatever. But fuck it, that’s not what I want to do with my life. I wanted to get out there and </i>do<i> things -- fight and explore, maybe even captain a ship out in the Black and make my own damn fortune. Sure, I fucked all that up, but I’d rather have tried than not, you know? My folks didn’t understand that -- they’d had everything handed to ‘em on a silver platter, grew up idle and rich. They pitched a fit when I said I wanted a ship instead of a full ride to Ausaril Tech.”</i>");
	output("\n\n<i>“That’s why I respect you, Steele, you know. Sure, you’ve got Daddy Steele back there dangling riches in front of you, but you’re </i>out here<i>, going on adventures and living your life anyway. Heh, maybe someday I’ll be out there with you. Who knows?”</i>");
	output("\n\nYou put a comforting hand on Syri’s shoulder, and she gives you a weak smile. <i>“I’m rambling. Pretend you didn’t hear any of that... it could be a lot worse. Like having a desk job.”</i>");
	output("\n\nShe laughs and slaps you on the back. <i>“Anyway. C’mon, let’s talk about something else...");
	if (pc.lust() >= 33) output(" Or at least let me drown my sorrows in that sweet ass of yours, Steele!");
	output("”</i>");
	
	processTime(10);

	syriFreezerMenu();
}
public function syriPuppyslutmasYeUveto():void
{
	flags["PUPPYSLUTMAS_2014"] = "Syri";

	clearOutput();
	showSyri();
	author("Savin");

	output("<i>“I guess I could tag along,”</i> you say, putting your arm around Syri’s shoulders. Her ears perk up at the affirmation, and she flashes you a wolfish grin.");
	output("\n\n<i>“Seriously? I honestly didn’t think you’d say yes... but I appreciate it, Steele,”</i> she says, scooting over to put her head on your shoulder. <i>“So the party starts in less than a day, and I don’t have a ship. Or, uh, any cash for a space taxi. Think I could hitch a ride with you?”</i>");
	output("\n\nYou nod and, after finished your drinks, pull Syri to her feet. She excuses herself to her apartment, and returns a few minutes later with a small suitcase. <i>“Just a change of clothes,”</i> she says. " + pc.mf("You take her suitcase", "You nod") + " and head for the spaceport. On the way, you find your companion’s fingers lacing through yours, holding your hand tight. When you look her way, Syri gives you a little wink and walks a little closer, just enough to let the tip of her tail brush your [pc.legOrLegs] and [pc.butt] as you walk. It isn’t far to the government building, and then a quick elevator jaunt up to your ship.");
	output("\n\n");
	if (flags["SYRI_SEEN_PCS_SHIP_CABIN"] == undefined) output("<i>“Nice digs,”</i> Syri says, following you aboard and");
	else output("<i>“Home away from home,”</i> Syri says with a smile,");
	output(" tossing her long coat over the back of your couch. <i>“I’ll go plug the address into the navicomputer, I guess. Get this trainwreck moving.”</i>");
	output("\n\nYou follow Syri up to the bridge and watch her tap some coordinates into the nav console. Once she does, you engage the autopilot and let your ship guide you up off the dock of Uveto Station and towards the local Warp Gate.");

	processTime(10);
	
	clearMenu();
	addButton(0, "Next", syriPuppyslutmasUnderway);
}

public function syriPuppyslutmasUnderway():void
{
	clearOutput();
	
	currentLocation = "SPACE";
	showLocationName();
	hideMinimap();

	showSyri();
	author("Savin");

	output("<b>A few hours pass</b>...");
	
	output("\n\nYou finally hear the shower turn off. Blinking lazily, you roll over on your bed to face the bathroom door and, a few minutes later, give Syri a slight smile as she steps out. A towel’s draped over her shoulder, hiding her bare breasts from view, and sporting a pair of tighty whities that loosely hang from her hips, bulging with her hefty package.");
	
	output("\n\n<i>“What’re you staring at?”</i> Syri teases, sticking her tongue out at you and walking over to her suitcase. You scrunch your nose as the smell of wet ausar wafts by you.");
	
	
	if (pc.isMischievous())
	{
		output("\n\n<i>“Nice undies,”</i> you answer, reaching over and swatting Syri on the ass as she passes.");
	
		output("\n\n<i>“Hey, don’t hate on the underwear,”</i> she laughs, making her tail tickle your nose in return. <i>“I had to buy all new underwear after I got this...”</i> she waves a hand at her crotch. <i>“Was spilling out of my panties like you wouldn’t believe. Even the ones I had that still fit felt really fuckin’ awkward every time I popped a boner. And boxers just felt like I was flopping all over the place. Ugh. You’d think they’d make more girly underwear for chicks with dicks in this day and age.”</i>");
	}
	
	output("\n\nSyri pops her suitcase open and bends over it, grumbling as she rustles through it. After a few moments, she produces a hanger with an attached outfit and turns around to show it to you, holding it up in front of herself.");
	
	output("\n\n<i>“A tux?”</i> you ask, cocking an eyebrow at the distinctly masculine choice of apparel.");
	
	output("\n\n<i>“Sure,”</i> she grins. <i>“I’m not gonna give my mother the satisfaction of seeing me in some pretty princess dress. Besides, anything without pants makes me feel all weird. So, uh, whadda ya think?”</i>");

	//[Go For Dress] [Go For Suit] [Blow Her]
	clearMenu();
	addButton(0, "Dress", syriWearTheDamnDress, undefined, "Go for the Dress", "Urge Syri to wear something more feminine.");
	addButton(1, "Suit", syriWearTheTux, undefined, "Go for the Tux", "Tell Syri you like her style.");
	addButton(2, "Blow Her", syriFuckClothesSuckDicks, undefined, "Blow Her", "Syri looks better without any clothes at all... help her take her mind off the party for a while.");
}

public function syriWearTheDamnDress():void
{
	clearOutput();
	// Syri in a dress
	showBust(syriBustDisplay());
	showName("\nSYRI");
	author("Savin");

	flags["PUPPYSLUTMAS_2014_SYRI_CLOTHES"] = "Dress";

	output("<i>“I don’t know,”</i> you say after a moment’s thought. <i>“The suit’s not bad, but I’d kill to see you in a nice dress.”</i>");
	
	output("\n\n<i>“Oh, fuck off,”</i> Syri grunts, putting her hands on her hips. Her towel slips off, but if she notices, it doesn’t phase her. <i>“Don’t turn into my mother on me here. I can wear a suit if I wanna.”</i>");
	
	output("\n\nYou wince at the unexpected vitriol Syri flings you, and seeing your reaction, her expression softens. <i>“Ugh. Sorry, Steele. I, uh, I didn’t mean to snap,”</i> she says, coming over and sitting on the bed beside you. You let her put a hand on your shoulder as she adds, <i>“Just hit a nerve, is all. My mother always tried to make me dress up... girly, I guess? All pink and bows and skirts, you know. I hated that shit. Don’t want to give her the satisfaction of seeing me all dolled up. And I </i>still<i> hate that shit, anyway.”</i>");
	
	output("\n\nSyri shrugs. <i>“Ah, I dunno. I do own a dress, I guess...”</i>");
	
	output("\n\nYou perk up at that, and tell Syri you’d like to see it. She groans and rolls her eyes, but with a little encouragement - and a little guilt for her snapping at you - you rouse her and send her back towards the suitcase.");
	
	output("\n\n<i>“At least tell me if this looks stupid, okay? Seriously...”</i> she grumbles, pulling a little black dress out of her luggage. It’s wrinkled and dusty, but you can definitely see where it was once quite attractive: slim, curve-hugging, leaving one shoulder and a lot of leg bare.");
	
	output("\n\n<i>“It looks great,”</i> you say when Syri presses it against herself, previewing her possible look. Your companion actually blushes at that, her cheeks darkening sharply at the compliment.");
	
	output("\n\nSyri gives a long-suffering sigh and, with a little coaxing, puts the dress on. <i>“The things I do for you,”</i> she teases, awkwardly stuffing herself into the outfit. After a few moments, her tail tucks and Syri turns to you, cheeks fully red. <i>“Could you, uh... help. With the zipper. I can’t, uh, reach it, I guess.”</i>");
	
	output("\n\nYou slip up behind your friend and zip her up. Syri winces as the dress’s top contracts around her, squeezing her breasts a little too tightly, until she looks almost ready to pop out of it. Syri makes an effort of pushing herself down into the bodice, her tail flicking unhappily about behind her.");
	
	output("\n\n<i>“Happy now?”</i> she pouts, turning around to let you gaze at her in her slender dress. Her chest and hips strain the fabric, as if it were made for a much younger Syri, but it’s still quite attractive.");
	
	output("\n\n<i>“You look good,”</i> you tell her reassuringly, though that doesn’t seem to soften her reaction to the whole thing.");
	
	output("\n\nAfter a moment of silence, Syri scowls and says, <i>“Can I take this off now?”</i> You give her a look, and she sighs, <i>“You’re really gonna push this, aren’t you? Ugghh... fine! I’ll wear it... if it’ll make you happy.”</i>");
	
	output("\n\nYou smile at Syri, putting your hands on her shoulders. To your surprise, she returns the gesture, if less warmly. Even... nervously, perhaps.");
	
	output("\n\n<i>“Just remember, I wouldn’t do this for anybody else,”</i> she says gravely, adjusting the shoulder of her dress. <i>“Now, let’s get on with this. I’m gonna need a stiff drink to keep this on for long.”</i>");
	
	output("\n\nYou nod, and lead Syri up to the cockpit to lay in your approach to Ausaril.");

	clearMenu();
	addButton(0, "Next", puppyslutmasArrive);
}

public function syriWearTheTux():void
{
	clearOutput();
	// Syri in da tux
	showBust(syriBustDisplay());
	showName("\nSYRI");
	author("Savin");

	flags["PUPPYSLUTMAS_2014_SYRI_CLOTHES"] = "Tux";

	output("<i>“I like your style,”</i> you say, giving the ausar a thumbs up.");
	
	output("\n\nShe grins and starts to get dressed. <i>“Glad we’re on the same page, Steele. Feel better about this whole thing already with you around.”</i>");
	
	output("\n\nYou watch appreciatively as Syri gets dressed, buttoning her shirt up over bare breasts before tucking it in, making her chest strain the front of her shirt and letting her stiff nipples poke visibly through. The tux’s jacket hides them, but you’re left with the tantalizing memory of the view. Syri fidgets a bit as she threads her tail through the small tear in her slack’s back. When she’s finished, you manage to convince your well-dressed friend to pivot for you, showing off her outfit front and back. You have to admit: it looks </i>good<i> on her.");
	
	output("\n\n<i>“Looks good,”</i> you say after a while, hopping out of bed and slipping up next to Syri.");
	
	output("\n\nShe chuckles and leans");
	if (pc.tallness > syri.tallness + 6) output(" up");
	else if (pc.tallness < syri.tallness - 6) output(" down");
	else output(" in");
	output(", planting a quick kiss on your cheek. <i>“You’re sweet. Now, c’mon, we’re almost there.”</i>");
	
	output("\n\nShe gives you a wink and, turning, lets your raven tail brush across your crotch as she heads up to the cockpit.");

	clearMenu();
	addButton(0, "Next", puppyslutmasArrive);
}

public function syriFuckClothesSuckDicks():void
{
	clearOutput();
	// Naked Syri!
	showSyri(true);
	author("Savin");

	output("<i>“I think... you look best just like that,”</i> you say, looking lustfully over your ausar companion’s bare body.");
	
	output("\n\nSyri grins, letting the tux fall back into her suitcase. <i>“That right? Maybe I oughta go buck naked, let Mom and Dad see me in all my dickgirl majesty!”</i> Syri laughs, reaching down and grabbing her cock through the slit in her underwear, thrusting her hips emphatically.");
	
	output("\n\nYou laugh and curl a finger meaningfully towards yourself. Rather than the gentle approach you were expecting, Syri slips out of her undies and lunges at you, tackling you onto the bed and sending the both of you rolling almost to the edge. She ends up straddling you, arms pinning your shoulders to the mattress.");

	blowSyriYouFukkinSlut(syriPuppyslutmasPostBeejay);
}

public function syriPuppyslutmasPostBeejay():void
{
	clearOutput();
	showSyri(true);
	author("Savin");

	flags["PUPPYSLUTMAS_2014_SYRI_CLOTHES"] = "Tux";

	output("You must have drifted off after that. When you wake up again, though, Syri’s dressed in her black tux and reclining on the bed beside you, one hand supporting a holo-tablet she’s reading, and the other gently stroking your [pc.hair]. At some point, she must have shift you to resting your head in her lap.");
	
	output("\n\n<i>“Oh, hey,”</i> Syri says with a smile, seeing your eyes flutter open. <i>“Here I thought </i>I<i> was supposed to be the one who got all sleepy after busting a nut.”</i>");
	
	output("\n\nShe laughs and gives you a very pet-like scratch");
	if (pc.earType == GLOBAL.TYPE_CANINE) output(" between your [pc.ears]");
	else output(" on the head");
	output(". <i>“Good thing you’re up, though. I think we’ve been in orbit for about half an hour now. C’mon, cap, get dressed. We’ve got a shindig to attend.”</i>");
	
	output("\n\nYou answer by grabbing Syri’s crotch, making her squirm and harden as you slip out of bed and gather your gear. She gives you a revenge swat on the ass before you head up to the cockpit together.");

	clearMenu();
	addButton(0, "Next", puppyslutmasArrive);
}

public function pPartner():String
{
	return flags["PUPPYSLUTMAS_2014"];
}

public function pSyriClothes():String
{
	if (flags["PUPPYSLUTMAS_2014_SYRI_CLOTHES"] == undefined)
	{
		flags["PUPPYSLUTMAS_2014_SYRI_CLOTHES"] = "Tux";
	}
	return flags["PUPPYSLUTMAS_2014_SYRI_CLOTHES"];
}

public function pPartyLocation():void
{
	rooms["PUPPYSLUTMAS"] = new RoomClass(this);
	rooms["PUPPYSLUTMAS"].roomName = "OFFICE\nCOMPLEX";
	rooms["PUPPYSLUTMAS"].description = "";
	rooms["PUPPYSLUTMAS"].planet = "PLANET: AUSARIL";
	rooms["PUPPYSLUTMAS"].system = "SYSTEM: " + (silly ? "SNOUP DU’OGG" : "EKYRA");
	rooms["PUPPYSLUTMAS"].moveMinutes = 1;
	rooms["PUPPYSLUTMAS"].runOnEnter = puntToShip;
	rooms["PUPPYSLUTMAS"].addFlag(GLOBAL.OUTDOOR);
}

public function puppyslutmasArrive():void
{
	clearOutput();

	if(pPartner() == "Anno") showBust(annoBustDisplay());
	else if(pPartner() == "Syri") showBust(syriBustDisplay());
	else showBust(pPartner().toUpperCase());
	pPartyLocation();
	currentLocation = "PUPPYSLUTMAS";
	showLocationName();
	author("Savin");

	output("Settling back into the captain’s seat, you plug in the address your companion gave you, which sets the autopilot towards a large office complex in one of the metropolitan northern cities. The descent to Ausaril is easy, gliding through thick and bustling lines of stellar traffic down through the atmosphere. Rolling blue clouds give way to a vast desert vista, golden sand stretching out as far as the eye can see, dotted by outcroppings of mountains and cityscapes interconnected by coiling hover-tracks.");
	
	output("\n\nThe autopilot guides your vessel across one of the tracks, following it for a few miles and into one of the larger cities. It’s a short jaunt from there to the office complex and into an open docking bay on one of the upper floors. The building’s extremely wide, giving plenty of room for you to park alongside a handful of other small space ships: mostly pleasure yachts and designer sports racers, all decadently expensive.");
	
	output("\n\nYou land, and taking your partner’s hand, step out of your ship into the garage. A small flight of stairs leads from the front of the dock up to a terrace entrance, where you can make your grand entrance.");

	clearMenu();
	addButton(0, "Stairs", puppyslutmasStairs)
}

public function puppyslutmasStairs():void
{
	clearOutput();
	
	if(pPartner() == "Anno") showBust(annoBustDisplay());
	else if(pPartner() == "Syri") showBust(syriBustDisplay());
	else showBust(pPartner().toUpperCase());
	showName("OFFICE\nCOMPLEX");
	author("Savin");

	output("You take " + pPartner() + "’s hand and make your ascent.");
	if (pPartner() == "Anno") output(" Anno pulls up her long skirt with practiced grace, easily following you up despite her trail of silky garments and high heels.");
	else if (pSyriClothes() == "Dress") output(" Syri curses under her breath and clutches the hem of her skirt, teetering on every step thanks to her high heels. <i>“Fuck this and fuck you and fuck everything,”</i> she mumbles, squeezing your hand painfully hard to steady herself on her ascent.");
	else output(" Syri gives your hand an affectionate squeeze and follows you up, trying to hide her nervousness behind a smile.");
	
	output("\n\nThe terrace above looks like a glistening oasis compared to the sandy deserts surrounding the city. All green and verdant, with carefully grown grass and trees lining the single concrete path from the stairs to the sweeping glass doors leading inside. Several ausar, and a few humans and other races, are gathered outside, mingling quietly. Music wafts out from the doors over the terrace, a familiar Christmas jingle played by what sounds like a string quartet. There might not be any snow on Ausaril this time of year (or ever, probably), but there’s plenty of winter cheer at least. A huge stuffed Santa figure is standing beside the door with his mitten-covered hands clasped around a large electronic device to allow the wealthy guests to anonymously give their donations.");
	
	output("\n\n");
	if (pPartner() == "Syri")
	{
		output("<i>“Oh, good,”</i> Syri grumbles, pointing across the terrace. You follow her gesture towards where");
		if (!annoIsCrew()) output(" a familiar snowy-haired ausar");
		else output(" Anno");
		output(" is standing, wrapped up in a gorgeous purple gown, talking to");
		if (flags["ANNOxKAEDE_INTRODUCED"] != undefined) output(" Kaede");
		else output(" a red-haired half-ausar girl");
		output(", herself wearing a very snug, form-fitting red dress that wonderfully accentuates her small breasts. <i>“There’s my sister. Might as well go get that out of the way first...");

		clearMenu();
		addButton(0, "Anno", puppyslutmasMeetAnno);
	}
	else
	{
		output("<i>“Holy crap,”</i> Anno whispers, pointing across the terrace, <i>“Syri actually showed up!”</i>");
	
		output("\n\nYou follow her gesture to where");
		if (flags["MET_SYRI"] == undefined) output(" a raven-haired ausar woman");
		else output(" Syri");
		output(" is standing, leaning against the railing. She’s dressed in a slick black tux that both accentuates her figure and off-plays her femininity at the same time. <i>“I didn’t think she’d actually show up! Come on, let’s go say hi!”</i>");

		clearMenu();
		addButton(0, "Syri", puppyslutmasMeetSyri);
	}
}

public function puppyslutmasMeetAnno():void
{
	clearOutput();

	showBust(syriBustDisplay(), annoBustDisplay());
	author("Savin");

	output("You put an arm around Syri’s shoulders and guide the reluctant ausar over to her sister and her date.");
	
	output("\n\n<i>“Hey, Anno,”</i> Syri says, approaching her sister with a wan smile.");
	
	output("\n\nAnno turns, her ears perking up with surprise. <i>“Syri!? What’re you... I didn’t think you were gonna be here!”</i> she beams, grabbing her sister and pulling her into a big hug.");
	
	output("\n\nSyri laughs and takes it, putting her arms around Anno’s waist. <i>“I didn’t think I was gonna be here either, but my date here convinced me. It’s been too long since I’ve seen you guys, I think.”</i>");
	
	output("\n\n<i>“I’m glad,”</i> Anno says, stepping back from Syri, her hands locked with her sister’s. <i>“We’ve missed you the last few years, Syri. We really have.”</i>");
	
	if (annoIsCrew())
	{
		output("\n\n<i>“So,”</i> Anno says, turning to you with a less than amused look. <i>“That’s what we went to Mhen’ga for.”</i>");
	
		output("\n\n<i>“Oh. Yeah. I was wondering where you’d gone off to,”</i> you chuckle, realizing that you haven’t seen Anno since you left the jungle world.");
	
		output("\n\nShe huffs. <i>“Lucky for me, my </i>other<i> " + (haveFuckedAnno() ? "lover" : "girlfriend") + " was in the neighborhood, and offered me a ride to the family reunion. You know, the one you decided not to take me to.”</i>");
	}
	else
	{
		if (haveFuckedAnno())
		{
			output("\n\nSuddenly, Anno seems to notice your presence, and her eyes light up. <i>“Hey, babe! What’re you... wait, you’re with Syri!? That’s unexpected.”</i>");
		
			output("\n\nSyri blinks. <i>“You two, uh... you two know each other, huh? That’s cool,”</i> she says, sounding more intrigued than enthused.");
		
			output("\n\n<i>“Yeah!”</i> Anno says, hooking her arm through yours, pinning you between two fluffy ausar girls.");
		}
		else
		{
			output("\n\n<i>“Yeah, yeah,”</i> your date blushes.");
			if (flags["MET_ANNO"] == undefined)
			{
				output(" <i>“Anyway, this is my date for the night: [pc.name] Steele,”</i> she says, urging you forward to meet her sister. <i>“Don’t you work for " + pc.mf("his", "her") + " company?”</i>");
			
				output("\n\n<i>“Yeah, that’s right,”</i> Anno says with a smile. <i>“Good to meet you, [pc.name].”</i>");
			}
			else
			{
				output("\n\n<i>“Hey again, boss,”</i> Anno says, turning to you. <i>“So... I see you’ve met my sister here. That’s... that’s a coincidence, right there.”</i>");
			
				output("\n\n<i>“Yeah, so, you two know each other,”</i> Syri says awkwardly. <i>“That’s cool. Saves time on introductions, I guess.”</i>");
			}
		}
	}
	
	output("\n\nAfter a moment, Anno steps back and grabs her red-headed date, pulling the other girl over to you and Syri. <i>“Sis, you remember Kaede, right? You met her-”</i>");
	
	output("\n\n<i>“I remember,”</i> Syri says, stepping up to the half-auser girl and giving her a friendly hug. Kaede smiles and hugs the bigger ausar back, her auburn tail flicking happily.");
	
	output("\n\nWhen she’s released from the hug, Kaede turns to you and offers her hand. <i>“");
	if (flags["ANNOxKAEDE_INTRODUCED"] != undefined) output("Hey again, [pc.name]. Good to see you.”</i>");
	else
	{
		output("Hi, [pc.name]. I’m Kaede. Anno’s-”</i>");
	
		output("\n\n<i>“Girlfriend!”</i> Anno finishes, hugging her date from behind.");
	
		output("\n\nKaede blushes. <i>“Right. That.”</i>");
	}
	
	output("\n\nYou take a moment to admire the attractive, svelte young halfbreed in her form-hugging red dress. She’s wearing arm-length gloves that hide her lack of limb fur, letting her blend more easily in among the largely ausar attendees. She’s got a small little handbag on her shoulder, giving the outfit an overall more classy air.");
	
	output("\n\n<i>“So,”</i> Anno says, <i>“Mind if Red and I tag along with the two of you? At least until the dancing starts.”</i>");
	
	output("\n\n<i>“I guess, if Steele doesn’t mind,”</i> Syri answers. You nod, and Anno and Kaede both beam.");
	
	output("\n\n<i>“Great! Now, let’s see what trouble we can get into!”</i>");

	clearMenu();
	addButton(0, "Next", puppyslutmasPostGreets);
}

public function puppyslutmasMeetSyri():void
{
	clearOutput();

	showBust(syriBustDisplay(), annoBustDisplay());
	author("Savin");

	output("Giving Anno an affirmative hand-squeeze, you start heading over towards her sister.");
	
	output("\n\nThe ravenette ausar looks up as you approach, her ears and tail perking up as the familiar scent of her sister washes over her. She turns and forces a slight smile as Anno walks up to her, arms outstretched.");
	
	output("\n\n<i>“Syri! It’s been ages!”</i> Anno says, pulling her sister into a big hug. <i>“I didn’t think you’d show... again.”</i>");
	
	output("\n\n<i>“Yeah, me neither,”</i> Syri says after a long pause, and you can’t help but smile as her arms finally lock around Anno’s back. <i>“Wasn’t going to, until Dad tracked me down in person and dragged me here himself, kicking and screaming all the way.”</i>");
	
	output("\n\nAnno giggles, releasing her sister. <i>“I bet he did! Oh, Syri, this is...”</i>");
	
	if (flags["MET_SYRI"] != undefined && flags["FUCKED_SYRI_COUNT"] == undefined)
	{
		output("\n\n<i>“Steele,”</i> Syri finishes, extending a hand to you. <i>“Yeah, I remember you. Played some games with me on Mhen’ga, didn’t you?”</i>");
	
		output("\n\n<i>“That’s right,”</i> you answer, shaking the offered hand. <i>“Pleasure to meet you again.”</i>");
	}
	else if (flags["FUCKED_SYRI_COUNT"] != undefined && flags["ANNOxSYRI_EVENT"] == undefined)
	{
		//if Syri fucked, not met with Anno: 
		output("\n\n<i>“Steele! What the hell are </i>you<i> doing here?”</i> Syri beams, cutting her sister off and pulling you into a tight embrace.");
		
		output("\n\nYou chuckle and explain that her sister invited you along to be her date. Syri rolls her eyes and turns to Anno, saying, <i>“Picked Steele here over Kaede, did you? Well, well...”</i>");
		
		output("\n\nAnno blushes. <i>“Hey, [pc.name] was right there! We’re, uh, you know... living together now.”</i>");
		
		output("\n\nSyri’s eyes go wide at that, but she quickly recovers and says, <i>“Well, that’s... that’s good! Good for you two!”</i>");
		flags["ANNOxSYRI_EVENT"] = 1;
	}
	else if (flags["FUCKED_SYRI_COUNT"] != undefined && flags["ANNOxSYRI_EVENT"] != undefined)
	{
		output("\n\n<i>“My date!”</i> Anno finishes after a moment, slipping her arm through yours. You pull her close in turn, smiling at your other lover.");
	
		output("\n\nSyri gives you an approving look and claps her sister on the shoulder. <i>“Good for you two.”</i>");
	}
	
	output("\n\nAfter a moment, Syri adds, <i>“Hey, look, I’m flying solo tonight. Would you mind if I tag around with you guys for a while? At least till we go meet Mom and Dad? I don’t want to run into them solo.”</i>");
	
	output("\n\n<i>“Sure!”</i> Anno beams. <i>“Ah, it’s gonna be like a real family reunion now!”</i>");
	
	output("\n\n<i>“Speaking of which,”</i> Syri says with a returned grin, <i>“It just happened to be that all the invitations were plus ones, so I did a little thinking on the way and...”</i>");
	
	output("\n\nA voice behind you, filled with delight, says, <i>“Hey, Anno!”</i>");
	
	output("\n\nYour date spins around and erupts in an excited squeal, scooping up another girl in a form-hugging red dress.");
	if (flags["ANNOxKAEDE_INTRODUCED"] != undefined) output(" You instantly recognize Kaede, Anno’s other paramour.");
	else output(" After the two share a tight embrace, Anno turns to you and says, <i>“[pc.name], this is Kaede. Kaede, [pc.name].”</i>");
	
	output("\n\n<i>“Hi, [pc.name],”</i> Kaede laughs, daintily shaking your hand. <i>“");
	if (flags["ANNOxKAEDE_INTRODUCED"] == undefined) output("Nice to meet you. Anno’s told me a lot about you.");
	else output("Good to see you again.");
	output("”</i>");
	
	output("\n\nWith introductions out of the way, Anno pulls her red-maned friend into a quick but affectionate kiss, making Kaede’s tail jump up behind her dress. Turning back to you, Anno asks, <i>“You don’t mind if Kaede comes with us too, right? Pretty please?”</i>");
	
	output("\n\nYou give your assent, making your date wiggle excitedly and squeeze herself into your arms, pulling Kaede and Syri with her. <i>“Now, let’s see what kind of trouble we can get into!”</i>");

	//[Next]
	clearMenu();
	addButton(0, "Next", puppyslutmasPostGreets);
}

public function puppyslutmasPostGreets():void
{
	clearOutput();

	showBust(annoBustDisplay(), syriBustDisplay(), "KAEDE");
	author("Savin");

	output("The Dorna family christmas party is about what you’d expect from a wealthy black-tie event. A few dozen older ausar are mingling around the terrace, voices muffled by the cheery music wafting out from the main floor inside. A large fountain dominates the center of the terrace, tipped with a strange winged creature you can’t identify. A big, stuffed Santa sits next to the door with an electronic device in its hand, allowing the guests to anonymously donate to the charities the Dorna family is supporting. A big punch bowl is set out near the railing, which has attracted the attention of many other guests.");

	output("\n\nAnno, Kaede, and Syri are happily following you about");
	if (pPartner() == "Syri" && pSyriClothes() == "Dress") output(", their handsome dresses and curvaceous figures drawing admiring gazes from the other ausar milling about");
	else output(", with Anno and Kaede both drawing appreciative looks from the crowd, admiring the two beautiful girls in their gorgeous dresses. Syri hangs back from them, letting the well-dressed girls take the limelight. Though, you notice, more than a few men and women let their eyes linger on your raven-haired companion, too");
	output(".");

	puppyslutmasPartyMenu();
}

public function puppyslutmasPartyMenu():void
{
	clearMenu();
	addButton(0, "Drinks", puppyslutmasDrinks, undefined, "Drinks", "Get your booze on.");
	addButton(1, "Charity", puppyslutmasCharity, undefined, "Charity", "Get into the Christmas spirit and spread the cheer.");

	if (pPartner() == "Syri") addButton(2, "Talk: Syri", puppyslutmasChatSyri, undefined, "Talk with Syri", "Chat with Syri for a bit.");
	else addButton(2, "Talk: Anno", puppyslutmasChatAnno, undefined, "Talk with Anno", "Chat with Anno for a bit.");

	addButton(3, "Talk: Kaede", puppyslutmasChatKaede, undefined, "Talk with Kaede", "Chat with Kaede for a bit.");

	addButton(4, "Dance", puppyslutmasDance, undefined, "Dance", "Take the girls onto the dance floor. Won’t be much reason to come back out to the Terrace once you’re there.");
}

public function puppyslutmasDrinks():void
{
	clearOutput();

	showBust(annoBustDisplay(), syriBustDisplay(), "KAEDE");
	author("Savin");

	output("You motion your train of ausar babes over towards the punch bowl. They follow you eagerly, and you quickly find yourself pouring glasses of a dark red punch that smells much more boozy than what you’re used to from your father’s functions. Even if that’s not your scene, there’s champagne and wine in easy access from a few tux-wearing attendants manning a portable bar. ");

	if (pSmashed())
	{
		output("\n\n<i>“SHOTS!”</i> you cheer, ordering one of the waiters to bring out the good stuff. It takes some encouragement, but he eventually delivers a platter of shot glasses full of a clear, amber liquor.");

		output("\n\n<i>“SHOTS SHOT SHOTS!”</i> the girls cheer back as you pass the drinks out. You’re drawing more than a few gazes by now, but fuck it: it’s party time! You and your friends all knock back your drinks, grinning and laughing as the burning booze goes down. <i>“WHOO!”</i>");
	}
	else if (pDrunk()) output("\n\n<i>“Bottoms up, girls!”</i> you cheer, knocking your glass back. Your gaggle of inebriated ausar giggle and drink up. Almost in unison, you and the girls finish your glasses and find your cheeks all flushing red.");
	else output("\n\n<i>“Cheers,”</i> you say, raising your glass to the girls. They answer the toast in turn, all smiles and wagging tails. You drink deep, knocking back your glass with relish, and ending with a sharp intake of breath. Whew, that was stronger than you were expecting!");

	// Might wanna fuck this off and just go to a flat like number of drinks, considering how the rest of this plays out.
	//pc.imbibeAlcohol(30);
	if (flags["PUPPYSLUTMAS_2014_DRINKS"] == undefined) flags["PUPPYSLUTMAS_2014_DRINKS"] = 0;
	flags["PUPPYSLUTMAS_2014_DRINKS"]++;
	
	processTime(5);

	puppyslutmasPartyMenu();
}

public function pBuzzed():Boolean
{
	return flags["PUPPYSLUTMAS_2014_DRINKS"] >= 1;
}

public function pDrunk():Boolean
{
	return flags["PUPPYSLUTMAS_2014_DRINKS"] >= 2;
}

public function pSmashed():Boolean
{
	return flags["PUPPYSLUTMAS_2014_DRINKS"] >= 4;
}

public function puppyslutmasCharity():void
{
	clearOutput();

	showBust(annoBustDisplay(), syriBustDisplay(), "KAEDE");
	author("Savin");

	output("You wander up to the over-sized Santa mock-up next to the ballroom door, eyes drawn to the holo-terminal in the jolly man’s hands. Sensing your approach, the computer flashes with a welcome message before giving you a small spiel:");
	
	output("\n\n<i>Thank you for attending our annual Winter Ball and Charity. This year, the Dorna Family is proud to be supporting the following charities, and we hope you’ll find it in your heart to give with us!</i>");
	
	output("\n\n<i>The Genetic Mutation Relief Fund is an organization dedicated to helping the unfortunate victims of accidental genetic damage, usually as a result of using unregulated or </i>bargain<i> gene mods and mutations following unintentional contact with alien life forms in the new Planet Rush. The GMRF helps these poor souls return their bodies to their original condition through proper and safe gene therapy and nanomachine injections.</i>");
	
	output("\n\n<i>The Foundation for Primitive Rights is a legal action committee made up of some of the galaxy’s most experienced and qualified lawyers who, at no cost to their clients, provide legal counsel and assistance to primitive peoples encountered during the Planet Rush. The FPR help native populations resist attempts by mega-corporations to infringe upon or claim ownership of their worlds and helps them navigate the legal quagmire that is interacting with, and eventually joining, the peaceful galactic conglomerate we are all a part of.</i>");
	
	if (flags["DECK13_GRAY_PRIME_DECISION"] == 1) output("\n\n<i>In addition to the above established charities, we would also like to bring to your attention the plight of a small but deeply misfortuned group: the crew of the colony ship </i>Nova<i>, lost many centuries ago. The crew of the vessel have been revived, and are in the process of being rehabilitated using top of the line cyber-prosthetics. We will be taking donations to help the </i>Nova<i>’s crew with medical expenses, housing, and education to help them adapt to modern society.</i>");
	else if (flags["DECK13_GRAY_PRIME_DECISION"] == 2) output("\n\n<i>In addition to the above established charities, we would also like to bring to your attention the plight of a small but deeply misfortuned group: the crew of the colony ship </i>Nova<i>, lost many centuries ago. The crew were found inhabiting the bodies of small nanomachines, and are facing discrimination and all around poor prospects for rejoining society. We will be taking donations for legal defense as well as education for the surviving crew. With your help, we hope that the </i>Nova<i>’s crew can swiftly and painlessly adapt to modern society.</i>");
	
	output("\n\n<i>All donations will be split evenly between the worthy causes above. Thank you so much for your generosity!</i>");
	output("\n\n<i>-The Dorna Family</i>");

	processTime(10);

	clearMenu();
	addButton(0, "Donate", puppyslutmasDonate, undefined, "Donate", "Donate to the charities.");
	addButton(1, "Skip", puppyslutmasPostGreets, undefined, "Skip Donating", "Casually avoid donating anything.");
}

public function puppyslutmasDonate():void
{
	clearOutput();

	showBust(annoBustDisplay(), syriBustDisplay(), "KAEDE");
	author("Savin");

	output("You pull your Codex out and swipe it across the holo-terminal, bringing up a transaction window. How much would you like to donate?");

	this.displayInput();
	this.userInterface.textInput.text = "";
	this.userInterface.textInput.maxChars = 12;

	clearMenu();
	addButton(0, "Donate", puppyslutmasDoDonate);
	//PC gets Kindness for every 1,000C given. 
}

public function puppyslutmasDoDonate():void
{
	var dVal:Number = Number(this.userInterface.textInput.text);

	if (isNaN(dVal) || dVal <= 0)
	{
		clearOutput();
		output("Please enter a valid value.");

		this.removeInput();
		this.displayInput();
		this.userInterface.textInput.text = "";
		this.userInterface.textInput.maxChars = 12;
		return;
	}
	else if (dVal > pc.credits)
	{
		clearOutput();
		output("Your codex warns you that the value you’ve indicated to donate is actually <i>more</i> than your account contains.");

		this.removeInput();
		this.displayInput();
		this.userInterface.textInput.text = "";
		this.userInterface.textInput.maxChars = 12;
		return;
	}

	pc.credits -= dVal;

	var pKind:Number = Math.floor(dVal / 1000);

	pc.addNice(pKind);

	clearOutput();
	output("A non-descript thank you note flashes across your codex, confirming your donation of " + dVal + " credits.");
	
	this.removeInput();

	processTime(5);

	clearMenu();
	addButton(0, "Next", puppyslutmasPostGreets);
}

public function puppyslutmasChatSyri():void
{
	clearOutput();

	showBust(syriBustDisplay());
	author("Savin");

	output("<i>“Enjoying the party so far?”</i> you ask your raven-haired companion.");
	
	if (pSyriClothes() == "Tux") output("\n\n<i>“It’s not as bad as I expected,”</i> she admits, leaning against the nearby railing. <i>“It used to be nothing but old farts and my sister prancing around between their legs. Heh, I guess with some friends around, it’s more bearable.”</i>");
	else if (!pDrunk() && !pSmashed())
	{
		output("\n\n<i>“Ugh,”</i> Syri grumbles. <i>“I feel like I’m fuckin’ cross-dressing here. And people are </i>staring<i> at me...”</i>");
	
		output("\n\n<i>“They’re staring because you’re pretty,”</i> you tell your date, putting a hand on her bare shoulder. Syri just grumbles and avoids your gaze.");
	}
	else if (pDrunk() && !pSmashed())
	{
		output("\n\n<i>“Eh, it’s getting better. Ply me with more liquor and I might even smile some,”</i> she chuckles, giving you a rueful little grin.");
	}
	else if (pSmashed())
	{
		output("\n\n<i>“Ish great,”</i> Syri slurrs, leaning heavily against you. <i>“I haven’ ‘ad thish mush free boosh in forever!”</i>");
	
		output("\n\nWell. You never took Syri for a lightweight before.");
	}
	
	output("\n\nAfter a moment’s hesitation, you ask her if she’s ready to face her parents inside. Your answer is a");
	if (!pBuzzed()) 
	{
		output(" very definite <i>“No. I need a fuckin’ drink before I deal with them...");
		if (pPartner() == "Syri") output(" Fuck, I’m terrified, Steele. I shouldn’t be, but damn. I don’t even know what the hell to say anymore.");
		output("”</i>");
	}
	else if (pSmashed())
	{
		output(" thunderous <i>“Fuck yeah! I’m ready for this shit. C’mon, let’s go!”</i>");
	}
	else
	{
		output(" resigned <i>“I guess... Not sure what I’m gonna tell them, but I think I’ve got enough liquid courage in me for it now.”</i>");
	}

	processTime(10);

	clearMenu();
	addButton(0, "Next", puppyslutmasPostGreets);
}

public function puppyslutmasChatAnno():void
{
	clearOutput();

	showBust(annoBustDisplay());
	author("Savin");

	output("<i>“Everything alright, Anno?”</i> you ask, putting an arm around the snowy ausar girl’s shoulders.");
	
	output("\n\nShe answers with a playful giggle, squeezing tight against you. <i>“Grand!”</i> she answers, tail swishing. <i>“I might be a scientist, but sometimes it’s nice to get out in high society for a change! Especially with friends,”</i> she adds, slipping an arm through yours and Kaede’s.");
	
	if (!pDrunk())
	{
		output("\n\n<i>“That said, I wouldn’t mind a drink or two before we go on to the dance floor. I’m not a bad dancer, but with all these people around... well, I’m only a </i>little<i> nervous.”</i>");
	}
	else
	{
		output("\n\n<i>“That said, let’s get on to the dance floor before I get too hammered to... uh, dance, yeah. I don’t want to get out there and fall flat on my face!”</i>");
	}

	processTime(10);

	clearMenu();
	addButton(0, "Next", puppyslutmasPostGreets);
}

public function puppyslutmasChatKaede():void
{
	clearOutput();

	showBust("KAEDE");
	author("Savin");

	output("<i>“You doing alright, Kaede?”</i> you ask, turning your attention to the slender half-ausar at your side.");
	
	output("\n\n<i>“Oh, yeah, I’m fine,”</i> she says, flashing you a smile. As she does, Kaede adjusts her long gloves around her slender arm. <i>“Thanks for letting me");
	if (pPartner() != "Anno") output(" and Anno");
	output(" tag along with you guys, by the way. I’m glad to get an invitation to a fancy ball and all, but I don’t know what I’d do with myself without some friends to talk to.”</i>");
	
	output("\n\nAfter a moment, Kaede laughs at herself and adds, <i>“I guess I’m just shy.”</i>");
	
	output("\n\n<i>“That’s what I’m here for, ya goose,”</i> Anno says, grabbing Kaede’s waist and pulling her girlfriend close. Flashing you a smile, Anno adds, <i>“She’s such a wallflower! C’mon, we need to get this girl onto the dance floor.”</i>");

	processTime(10);

	clearMenu();
	addButton(0, "Next", puppyslutmasPostGreets);
}

public function puppyslutmasDance():void
{
	clearOutput();

	showBust(annoBustDisplay(), syriBustDisplay(), "KAEDE");
	author("Savin");

	output("<i>“What do you say we go inside, girls?”</i> you ask, slipping your arm around " + pPartner() + "’s waist.");
	
	output("\n\n<i>“Sounds like a plan,”</i> your date answers, pulling tight against you. As you’re walking, Anno reaches out and snatches Kaede’s wrist, pulling the svelte red-head along behind you.");
	if (pPartner() == "Anno") output(" Syri follows along at the trail of your little group, tail swishing a little faster than before as you near the dancefloor.");
	
	output("\n\nThe interior of the high rise has been made wide open, with a solid wooden platform in the center of a circular room. A huge, fake tree sits in the middle, surrounded by stereotypical present boxes wrapped in all manner of festive colors. Green banners and wreaths dot all the doors and windows. A great many more people are gathered here, mingling around a few tables full of snacks and drinks. A quartet of musicians are sat at the head of the room on a raised stage, wrapped around a podium and playing a soft medley of old-earth christmas tunes, and a few more modern, ausar holiday songs as well.");
	
	output("\n\nPeople are just starting to gather on the dance floor, pairing off into each other’s arms, gently swaying to the music. You take a long look around the floor before turning to Anno and asking where her parents are.");
	
	output("\n\nShe gives you a strange look, like you’ve just asked the most obvious question in the world. <i>“It’s tradition. For a party like this, anyway. The hosts don’t show themselves until the end. I think it’s kind of silly, but-”</i>");
	
	output("\n\n<i>“But what’re our folks if not traditional?”</i> Syri finishes, slapping Anno on the back hard enough to make her sister stumble forward.");
	
	output("\n\n<i>“They never seemed that way to me,”</i> Kaede says, having fallen to the back of the group again. <i>“At least, they always seemed alright with me...”</i>");
	
	output("\n\nSyri rolls her eyes and ruffles the half-breed’s hair. <i>“Who wouldn’t be?”</i>");
	
	output("\n\nKaede smiles brightly at that.");
	
	output("\n\n<i>“Anyway!”</i> Anno laughs. <i>“If you didn’t know that about ausar parties, [pc.name], then what’re we going to do about you on the dance floor?”</i>");
	
	output("\n\n<i>“What, are ausar dances different?”</i> you ask, looking out at the growing crowd who’re moving not terribly unlike you’d expect anyone else to.");
	
	output("\n\nThe twins snicker, leaving it to Kaede to answer: <i>“It confused me, too. Apparently you’re supposed to find a </i>different<i> girl to dance with than the one you came with. That’s tradition, anyway - you don’t </i>have<i> to or anything.”</i>");
	
	output("\n\nAnno grins and flicks her tail at her lover. <i>“That’s right! Guess you have three cute little puppies to choose from, [pc.name]!”</i>");
	
	output("\n\n<i>“Puppy?”</i> Syri huffs, crossing her arms");
	if (pSyriClothes() == "Dress") output(" in a way that hefts up her ample bust in under dress");
	else output(" makes her ample bust strain under her too-tight shirt");
	output(". <i>“That’s... I don’t even know </i>what<i> that is, but if you weren’t my sister, I’d punch you for it.”</i>");
	
	output("\n\nHer sister blows her a raspberry in answer - and has to lean back in a hurry to avoid Syri grabbing her tongue. <i>“Weirdo,”</i> Syri growls, rolling her eyes.");
	
	output("\n\n<i>“Aww, come on, get a sense of humor, Syri,”</i> Anno pouts. <i>“It’s just a joke.”</i>");
	
	output("\n\nSyri just scowls and says, <i>“You’re the reason humans still think it’s okay to walk up and pet us, you know.”</i>");
	
	output("\n\n<i>“What, do you not like pets? Does somebody need their walksies-”</i>");
	
	output("\n\n<i>“Anyway!”</i> Kaede says, stepping between the sisters. <i>“Will one of you just ask me to dance already? Come on...”</i>");

	processTime(10);

	clearMenu();
	addButton(0, "Anno", puppyslutmasDanceWithAnno, undefined, "Dance with Anno", "Ask Anno to dance.");
	addButton(1, "Kaede", puppyslutmasDanceWithKaede, undefined, "Dance with Kaede", "Ask Kaede to dance. The twins will just have to make do with each other...");
	addButton(2, "Syri", puppyslutmasDanceWithSyri, undefined, "Dance with Syri", "Ask Syri to dance.");
}

public function puppyslutmasDanceWithAnno():void
{
	clearOutput();

	showBust(annoBustDisplay());
	author("Savin");

	output("<i>“Shall we?”</i> you ask, extending an arm to");
	if (pPartner() == "Anno") output(" your date");
	else output(" your date’s snowy-haired sister");
	output(".");
	
	output("\n\nAnno’s ears perk up at the offer, and her tail goes from stone still to wagging ninety miles an hour before she can blink. <i>“");
	if (pPartner() == "Anno") output("Well, it’s not traditional, but... but for you, anything");
	else output("I was hoping you’d ask");
	output(",”</i> she says, hooking her arm through yours. <i>“After you, [pc.name].”</i>");
	
	output("\n\nYou smile at her and start towards the dance floor.");
	
	output("\n\n<i>“So,”</i> Syri says behind you, putting one of her bushy arms around Kaede’s slender shoulders. <i>“");
	if (pPartner() == "Syri") output("I guess we’re dateswapping now. Shall we?");
	else output("Looks like we’re bucking convention tonight! Think Anno would mind you staying my date for the night?");
	output("”</i>");
	
	output("\n\n<i>“Sure. I’d... I’d like that,”</i> Kaede says, trying to hide her bashfulness as the towering ravenette leads her out behind you and your partner.");
	
	output("\n\nSeeing the growing crowd of people moving towards the floor, the small band on the stage changes gear. Their leader taps the small holoscreen set up in front of them, and in unison, the band starts into a slow, lilting string rendition of a new-ish christmas pop song, setting you and your partner up to move. Around you, the other few dozen ausar attending start to dance, holding each other tight and gently swaying to the music. It’s nothing flashy, certainly no sweeping ballroom dance like you might have expected from the immaculate dresses and suits surrounding you, but the simple motions are more intimate, less formal, than you’re used to at the big functions Dad used to drag you to.");
	
	output("\n\nYou find a bit of clear floor and turn to your");
	if (haveFuckedAnno() && annoIsCrew()) output(" lover");
	else output(" dance partner");
	output(", putting a hand on her waist, the other on her");
	if (pSyriClothes() == "Dress") output(" bare");
	output(" shoulder. Anno mirrors your movements, stepping close enough to you that you can feel the gentle heat radiating off her body, the tips of her breasts so close to your [pc.chest] that it’s a force of will not to step that little bit closer, pressing them between you.");
	
	output("\n\nAnno smiles radiantly at you, murmuring <i>“I’ll let you take the lead, boss.”</i>");
	
	output("\n\nYou start to move, following the band’s lilting tune, turning around and around in synchronization with the many wealthy ausar around you. Anno follows you with a royal grace, moving fluidly to follow you even with her high heels and flowing skirts. Slowly but surely, the music builds up, swelling louder and ever so slightly faster, letting you and your partner dance a little quicker, going from idle swaying to proper ballroom maneuvering. Given your partner’s agility on her feet, you’re confident enough to set her spinning, twirling her under your arm and sending her spiraling away, only to pull her back into your arms.");
	
	output("\n\nAnno giggles like a little girl, laughing all the way until she’s pulled tight against you as the first song comes to an end. She comes to rest with her hands pressed against your chest, her body close enough that her breasts squeeze in against your [pc.chest]. It takes her a moment to realize where she’s ended up, and then she laughs and quickly withdraws her errant hands. They settle back on your [pc.hips] just as the next song starts, ushering the pair of you into the next dance.");
	
	output("\n\nBeside you, you’re treated to a show of Kaede and Syri dancing together, a little more slowly and much less gracefully than you and Anno; you’re not sure either of them know how to dance, but they make do as best they can.");
	if (pSyriClothes() == "Tux")
	{
		output(" You have to admit, the two of them look like they could even make a cute couple in their own right, with the tuxedo-clad Syri standing tall and strong over the shorter Kaede in her svelte red dress.");
		if (flags["FUCKED_SYRI_COUNT"] != undefined && flags["KAEDE_FUCKED"] != undefined)
		{
			output(" Indeed, the idea of the two cute shemales getting together has a certain appeal that sends a flush of arousal that reddens your [pc.skin].");
		}
	}
	else
	{
		output(" You have to admit, the two cute ausar");
		// Confirm dis- p. sure the only way you're gonna know for sure they're packin heat is if the PC has fucked them.
		if (flags["FUCKED_SYRI_COUNT"] != undefined && flags["KAEDE_FUCKED"] != undefined)
		{
			output(" dick-");
		}
		else
		{
			output(" ");
		}
		output("girls"); 
		if (pSyriClothes() == "Dress") output(" in their beautiful dresses");
		output(" might make a lovely couple, the way they hold onto each other and nervously try to avoid stepping on each others’ toes.");
	}
	output(" They’re quite cute together, and seeing where your gaze has gone, Anno flashes you a little smile.");
	
	output("\n\nThings move a bit faster for the next dance, letting you and Anno strut your stuff, spinning and twirling about in ways that make your");
	if (haveFuckedAnno() && annoIsCrew()) output(" lover");
	else output(" partner");
	output("’s hair and skirts twirl around her in a wild storm of snowy hair and purple silks. By the time the song ends, you’re both breathing hard, arms tight around each other. You can feel plenty of eyes on you - or more accurately, your stunning partner. You have to admit, Anno’s stealing the show: her movements are graceful and flowing, and her dress is immaculate. She’s carrying herself more like a princess than a scientist tonight. She smiles at some of the onlookers, her tail swishing excitedly beneath her skirts.");
	
	output("\n\n");
	if (pPartner() == "Anno") output("<i>“Told you you’d be the queen of the ball,”</i> you say, reaching in to kiss her.");
	else output("<i>“Looks like you’re the queen of the ball,”</i> you muse, taking a bit of initiative and brushing a stray lock of snowy hair from Anno’s cheeks.");
	output(" Anno accepts your show of affection with a blush, stepping in close to you. <i>“I’m glad to have you as my " + pc.mf("king", "co-queen") + ",”</i> she answers with a wink. <i>“You’re quite the dancer, [pc.name]. Maybe I’ll have to take you to a little club I know on Tavros sometime...”</i>");
	
	output("\n\nYou have to admit, you’d like to see what Anno can do in a more... casual setting.");

	processTime(45);

	clearMenu();
	addButton(0, "Next", puppyslutmasDornasArrive);

	//[Next]
}

public function puppyslutmasDanceWithKaede():void
{
	clearOutput();
	
	kaedeIncreaseExhibitionism(5);
	
	showBust("KAEDE");
	author("Savin");

	output("<i>“Alright then. Shall we?”</i> you say, extending an arm to the slender red-head, straight between the bickering sisters.");
	
	output("\n\n<i>“W-wha-”</i> Kaede stammers, her big blue eyes staring so intently at your hand you think they might cross.");
	
	if (pc.isMischievous()) output("\n\n<i>“This is the part where you say yes,”</i> you say with a wink.");
	
	output("\n\nAfter a moment, Kaede blinks away her surprise and gives you a nervous little smile. <i>“Uh... s-sure.”</i>");
	
	output("\n\nHer dainty little hand comes to rest in yours, and you squeeze it reassuringly before turning towards the dance floor. Syri and Anno both fall silent as you lead your partner away, white and black ears tucking down shamefully.");
	
	output("\n\n<i>“So, uh... wanna dance, I guess?”</i> Syri asks her sister. <i>“Looks like our dates just walked off.”</i>");
	
	output("\n\n<i>“I was gonna suggest dateswapping anyway,”</i> Anno laughs, taking her sister’s arm. <i>“So... friends?”</i>");
	
	output("\n\nSyri smiles and plants a kiss on her sister’s cheek. <i>“Always.”</i>");
	
	output("\n\nSeeing the growing crowd of people moving towards the floor, the small band on the stage changes gear. Their leader taps the small holoscreen set up in front of them, and in unison, the band starts into a slow, lilting string rendition of a new-ish christmas pop song, setting you and your partner up to move. Around you, the other few dozen ausar attending start to dance, holding each other tight and gently swaying to the music. It’s nothing flashy, certainly no sweeping ballroom dance like you might have expected from the immaculate dresses and suits surrounding you, but the simple motions are more intimate, less formal, than you’re used to at the big functions Dad used to drag you to.");
	
	output("\n\nYou find a bit of clear floor and turn to your");
	if (flags["KAEDE_FUCKED"] != undefined) output(" lover");
	output(" dance partner");
	output(", putting a hand on her waist, the other on her bare shoulder. Kaede mirrors your movements, stepping close enough to you that you can feel the gentle heat radiating off her body, the tips of her breasts so close to your [pc.chest] that it’s a force of will not to step that little bit closer, pressing them between you.");
	
	output("\n\n<i>“I should warn you,”</i> Kaede says as the music starts to pick up, <i>“I don’t really know how to dance....”</i>");
	
	// I have no idea how tall Kaede is- she's described as shorter than Anno. I'm gunning for 6" shorter.
	output("\n\nYou smile");
	if (pc.tallness < 58) output(" up");
	else if (pc.tallness > 70) output(" down");
	output(" at her and tell her to just follow your lead. Kaede nods, nervously digging her fingers into you and starting to move her feet - shuffle them, really - trying to follow your motions. She’s adorably awkward in her high heels, clearly not used to wearing them, and leans heavily on you to steady herself as the music’s tempo increases. You hold her tightly, leading her feet with");
	if (pc.isBiped()) output(" your own");
	else output(" your animalistic lower body as best you can");
	output(", guiding her through the simplest motions of the dance.");
	
	output("\n\nAs the first songs pass, Kaede becomes more confident, able to follow your lead a little better. You start to make your movements a little more complex as she learns, working up from the gentle turn-and-sway of the first tune until you’re able to spin your partner under your arm and pull her back, tight against you. She laughs and blushes, letting her hands settle on your [pc.hips] as the song comes to an end.");
	
	output("\n\nYou cast a glance over Kaede’s shoulder as the next tune starts up, and catch sight of Anno and Syri through the pressing crowd of other ausar.");
	if (pSyriClothes() == "Tux") output(" Though the twins look an awful lot alike any other day, they’re a stunning pair tonight. Anno, in her silky purple gown with her snowy hair cascading around her shoulders, and Syri in her trim tux holding back her feminine curves, could easily pass for a real couple if you didn’t know better.");
	else
	{
		output(" With your date in her slim black dress, the twins really are a stunning pair tonight. They look like they belong together, Anno’s glamorous gown a perfectly contrast to the form-fitting black of Syri’s, taking full advantage of both girls’ figures.");
	}
	output(" More than a few envious eyes are on the twins tonight.");
	
	output("\n\n<i>“They’re cute, huh?”</i> Kaede whispers, just loud enough for you to hear. You chuckle and nod.");
	
	output("\n\nThe music swells louder, faster, urging you and Kaede to move with it. You don’t drive your partner to any truly complex footwork, but she’s more than willing to let your lead her through her paces, moving a bit faster as the tempo increases. Kaede’s little red dress swishes around her long legs, swaying with the movements of her hips and fluffy tail. She’s growing more and more confident with every passing minute, more agile on her feet; she may not know how to dance, but she knows how to <i>move</i>. Anno and Syri might be drawing more than their share of gazes from the accumulated ausar, but you and your partner get a fair number of lustful gazes as well, eyes drawn to the tight fit of the dress over Kaede’s firm butt and your own [pc.chest] and [pc.butt].");
	
	output("\n\nWhen the music ends, you find Kaede breathing quickly, her chest straining the tight top of her dress as the dance comes to an end. The crowd starts to disperse a bit around you, signaling the end of the evening’s dance. You pull your partner in close, pressing the svelte halfbreed’s chest against your own. She blushes at the tight embrace, her tail moving quickly behind her.");
	
	output("\n\n<i>“I guess that’s it then,”</i> Kaede says, watching the band start to pack up. <i>“Mister and Misses Dorna are probably going to show up in a minute.”</i>");
	
	output("\n\nAbout time your hosts show themselves, you think to yourself.");
	
	output("\n\nAs the dance floor starts to clear, Kaede turns to you and gives you a huge smile. <i>“Thanks for the dance,");
	if (flags["KAEDE_FUCKED"] != undefined) output(" lover");
	else output(" [pc.name]");
	output(",”</i> she says, leaning in and planting a kiss");
	if (flags["KAEDE_FUCKED"] != undefined) output(" full on your lips");
	else output(" on your cheek");
	output(" before slipping out of your grasp.");

	processTime(45);

	clearMenu();
	addButton(0, "Next", puppyslutmasDornasArrive);
}

public function puppyslutmasDanceWithSyri():void
{
	clearOutput();

	showBust(syriBustDisplay());
	author("Savin");

	output("<i>“How about it, Syri?”</i> you ask, extending your arm to the raven-haired ausar.");
	
	output("\n\n");
	if (pPartner() == "Syri") output("<i>“Bucking traditions, are we? I’m all for that,”</i> your lover answers, taking your arm. <i>“Let’s show these old geezers what we’ve got!”</i>");
	else
	{
		output("<i>“Who, me? I dunno, I had my eye on that piece of ginger ass...”</i>");
	
		output("\n\n<i>“Syri!”</i> Anno snaps, hands on her hips. <i>“Mine. Get your own.”</i>");
	
		output("\n\nSyri returns her sister’s earlier raspberry before taking your arm. <i>“Guess I’m stuck with you,”</i> she says playfully, her dark tail flicking across your [pc.leg] as you start to lead her towards the dance floor.");
	}
	
	output("\n\nBehind you, Anno slips her arm around her lover’s waist, pulling the svelte halfbreed along after you. <i>“It feels like old times, doesn’t it?”</i>");
	
	output("\n\n<i>“Just like back in school,”</i> Kaede answers happily, and you’re fairly sure you see her gloved hand slip down below Anno’s waist, making the snowy-haired ausar suck in a startled breath.");
	
	output("\n\nSeeing the growing crowd of people moving towards the floor, the small band on the stage changes gear. Their leader taps the small holoscreen set up in front of them, and in unison, the band starts into a slow, lilting string rendition of a new-ish christmas pop song, setting you and your partner up to move. Around you, the other few dozen ausar attending start to dance, holding each other tight and gently swaying to the music. It’s nothing flashy, certainly no sweeping ballroom dance like you might have expected from the immaculate dresses and suits surrounding you, but the simple motions are more intimate, less formal, than you’re used to at the big functions Dad used to drag you to.");
	
	output("\n\nYou find a bit of clear floor and turn to your");
	if (flags["FUCKED_SYRI_COUNT"] != undefined) output(" lover");
	else output(" dance partner");
	output(", putting a hand on her waist, the other on her bare shoulder. Syri mirrors your movements, stepping close enough to you that you can feel the gentle heat radiating off her body, the tips of her breasts so close to your [pc.chest] that it’s a force of will not to step that little bit closer, pressing them between you.");
	
	output("\n\n");
	if (pSyriClothes() == "Tux") output("<i>“I don’t really do this kind of dancing much,”</i> Syri laughs, putting a hand on your shoulder, the other on your hip." + pc.mf(" It takes a moment to settle in that Syri’s just usurped the masculine role in the pairing.", "") + " <i>“Slow isn’t really my style... but for you, I guess I’ll make do.”</i>");
	else output("<i>“Just so you know, I’m not much of a dancer,”</i> Syri laughs, starting to sway with the music. <i>“I’ll try to keep up, but no promises.”</i>");
	
	output("\n\nYou chuckle and match Syri’s burgeoning movements. For someone who said she wasn’t much of a dancer, the ravenette ausar’s feet move with a surprising confidence, deftly avoiding yours as the two of you slowly turn around and around to the leisurely tune. The music gets steadily louder and faster, but your");
	if (flags["FUCKED_SYRI_COUNT"] != undefined) output(" ausar lover");
	else output(" dance partner");
	output(" keeps up with surprising talent. The faster the music goes, the more her hips sway to the beat, tail wagging hard enough to reach across and brush Anno and Kaede when the girls get too close.");
	
	output("\n\n<i>“You sure you’re not a dancer?”</i> you ask. Every step you make is perfectly answered by the");
	if (pSyriClothes() == "Tux") output(" handsome");
	else output(" beautiful");
	output(" ausar");
	if (pSyriClothes() == "Dress") output(", even in her high heels");
	output(".");
	
	output("\n\nSyri rolls her eyes. <i>“Well, my parents made me take lessons,”</i> she admits, deftly dodging your [pc.foot] and");
	if (pSyriClothes() == "Dress")
	{
		output(" spinning in your arms, pressing her back to you. Instinctively, your arms lock around her waist, holding her tight as she undulates against you.");
		if (flags["FUCKED_SYRI_COUNT"] != undefined)
		{
			output(" Her ass grinds against your [pc.crotch]");
			if (pc.isCrotchGarbed()) output(" through your armor");
			output(", driving you wild with sensation");
		}
	}
	else
	{
		output(" spinning you in her arms, catching you and pulling you in with your back to her. You shimmy in her grip, grinding back against your partner’s tight embrace until you can feel a lump forming in her pants, flush against your [pc.butt].");
	} 
	
	output("\n\n<i>“I skipped most of ‘em, though,”</i> she continues, whispering in your ear. Her gaze drifts over to where her sister and Kaede are dancing, nice and slow in each other’s arms. <i>“My sister was always the princess of the family. These balls are all for her, you know. </i>I<i> never needed to know more than the basics...”</i>");
	
	output("\n\nIf you didn’t know better, you might just think your partner was jealous of her sister. Still, you have to admit that Syri’s a fine dancer when she wants to be, and you tell her as much.");
	
	output("\n\nShe smiles at that, twirling");
	if (pSyriClothes() == "Tux") output(" you");
	output(" around again so that you’re facing each other once more. Her tail lashes out as she moves, brushing across her sister’s backside. Anno gasps and looks over her shoulder, giving Syri a wink as the two of you dance away. Syri turns you about as the music ramps up into a new, faster song, leaving you looking Kaede and Anno’s way. The girls are dancing close together, moving slowly despite the pace of the music: you can see Kaede’s quite unsteady on her feet, barely able to keep up with her partner. Her lover is more than happy to take it slow for her sake, bucking the rhythm of the dance to slowly guide Kaede through the motions. The svelte little halfbreed blushes and hugs Anno tightly, trying her best just not to get in the way.");
	
	output("\n\nFor her part, Anno smiles radiantly, her arms locked around Kaede’s waist. Even out of tempo with the band, the snowy-haired ausar moves with an immutable grace, carrying herself with impeccable poise and posture. Indeed, partly because she and Kaede are so far out of sync with the rest of the dance floor, the pair garner quite a few looks from the other ausar gathered around. The extra attention makes Kaede blush all the harder, all but hiding her face against Anno’s shoulder, but her lover keeps her steady - and keeps her moving, slow but sure.");
	
	output("\n\n<i>“They make such a good couple,”</i> Syri muses, her tail wagging a little more slowly now.");
	if (pPartner() == "Anno") output(" <i>“Then again, so do the two of you...”</i> she laughs, squeezing your shoulder");
	else output(" <i>“Then again, so do we...”</i> she laughs, holding you a little tighter.");
	output(" You barely noticed until now how quickly the two of you were moving, but compared to the lovers beside you, you and Syri are practically flying across the dance floor.");
	
	output("\n\nWhen the music finally ends, you find Syri breathing quickly, her chest straining the tight");
	if (pSyriClothes() == "Dress") output(" top of her dress");
	else output(" shirt she’s wearing");
	output(" as the dance comes to an end. The crowd starts to disperse a bit around you, signaling the end of the evening’s dance. You pull your partner in close, pressing the curvy ausar’s chest against your own. She blushes at the tight embrace, her tail moving quickly behind her.");
	
	output("\n\n<i>“That wasn’t so bad,”</i> Syri says, releasing you. <i>“Still don’t know if dancing’s my thing, but... well, it all depends on what partner you have, I guess.”</i>");
	
	output("\n\nShe gives you a flirtatious wink and slips away, back towards her sister and Kaede.");

	processTime(45);

	clearMenu();
	addButton(0, "Next", puppyslutmasDornasArrive);
}

public function puppyslutmasDornasArrive():void
{
	clearOutput();

	showBust(annoBustDisplay(), syriBustDisplay(), "KAEDE");
	author("Savin");

	output("As the band packs up and the throngs on the dance floor start to disperse, the girls rejoin you in a laughing, smiling pack of fluffy tails and perky ears. The lights dim a bit, bathing the hall in a sultry darkness - light streams in from the doors, but not much else.");
	
	output("\n\n<i>“That was fun,”</i> Kaede says with a smile as Anno puts an arm around her waist.");
	
	output("\n\n<i>“Could have been worse,”</i> Syri agrees.");
	
	output("\n\nThe girls gather up around you, chattering about the dance until an older-looking ausar male takes to the stage, bringing with him a small disk-like device. He sets it down in the middle front of the stage, and a moment later, a hardlight projection of a podium springs up. He taps a microphone atop it, sending a shuddering wave of feedback through the hall.");
	
	output("\n\n<i>“Um, your attention please,”</i> he says, tapping the mic again. His voice fills through the room with surprising evenness, from speakers that must completely encircle the dance floor. The chatter of the collected ausar dies down, replaced with respectful silence. <i>“Ah, thank you. Our hosts will be arriving any moment now. Please, give a round of applause for the people who put this evening’s festivities together. The heads of the Dorna Foundation, ladies and gentlemen, Rylon and Aserra Dorna!”</i>");
	
	output("\n\nThe chorus of quiet golf claps echo through the room and a stage light flickers on, beaming down on the podium as the old man slips off, and the curtains behind him open up. A pair of well dressed, middle aged ausar step out onto the stage, waving and smiling to the crowd. The lights focus in on them, giving you your first clear glimpse of the Dorna twins’ parents. Rylon, their father, is a tall and fairly fit man with short, snow-white hair and dark blue eyes just like Anno’s, dressed to the nines in a tailored black suit and a christmas tie. Aserra, his wife, has a head of long, blue-gray hair pulled back into a tight ponytail. She’s wearing a tight, red cocktail dress fringed with white fluff, like a provocative fem-Santa. With all that pale, supple flesh on display, she’s easily the most evocatively-dressed " + (pc.mf("m", "f") == "m" ? "person" : "woman") + " in the room");
	if (pc.isNude() || pc.sexiness() > 4) output("... aside from you, of course");
	output(".");
	
	output("\n\n<i>“Thank you all for coming tonight,”</i> Mr. Dorna says with a smile, taking the time to meet eyes with several onlookers. <i>“We’re honored to see so many of you joining us. More importantly, though, Aserra and I are deeply honored to be even a small part in mustering so much generosity as we have tonight.”</i>");
	
	output("\n\nAserra steps up beside her husband and nods enthusiastically. <i>“That’s right. Thanks to your overwhelming kindness tonight, I’m very, very pleased to say that we’ve raised over two million credits!”</i>");
	
	output("\n\nAnother, more impassioned round of applause erupts from the crowd of socialites, celebrating their own holiday generosity.");
	
	output("\n\n<i>“Thank you. All of you,”</i> Mr. Dorna says with a slight bow. <i>“I can’t say how gratified we are to have you all here tonight. I know that Christmas isn’t necessarily an ausar tradition, but it </i>is<i>, as we understand it, a season of giving. We’re glad it’s become a tradition in our family, and with many of you, to give generously during this holiday. So please, give yourselves another round of applause, and enjoy the party!”</i>");
	
	output("\n\nThe audience does as it’s bid, clapping as the lights come back on and the Dornas depart the stage, back behind the curtains. As they leave, though, Mrs. Dorna spies her daughters in the crowd and gives them a smile and a crook of her finger before vanishing in the darkness.");
	
	output("\n\n<i>“I think that’s our cue!”</i> Anno says, hooking her arms through Syri and Kaede’s. <i>“You too, [pc.name]. I think it’s about time you met");
	if (pPartner() == "Anno") output(" my");
	else output(" our");
	output(" parents.”</i>");
	
	output("\n\n");
	if (pDrunk()) output("<i>“Fine, fine,”</i> Syri groans. <i>“Ugh. Let’s get this over with before I pussy out.”</i>");
	else output("<i>“Ugh, I don’t think I’m drunk enough for this,”</i> Syri complains - though she nevertheless follows her twin’s lead.");
	
	output("\n\nYou fall in step behind the ausar girls, following them through the dispersing crowd towards a door marked “Staff” in English, Ausari, and Kaithrin. An ausar in a penguin suit nods politely to Anno and pulls the door open for her, admitting your little group to the backstage area. You’ve barely walked a dozen paces before you see Mr. and Mrs. Dorna again, walking towards your group from a side hall. Anno grabs her dress and takes off running towards her parents, who welcome her with open arms and smiles from ear to canid ear.");
	
	output("\n\n<i>“Anno, darling!”</i> Aserra laughs, pulling her radiant daughter into her arms. <i>“I’m so glad to see you!”</i> Neither ausar can hide their jubilance, of course: their tails are going full bore, wagging faster than you can see.");
	
	output("\n\n<i>“You too, mom! And look who showed up, too,”</i> she says, stepping out of the way as Syri walks up");
	if (pSyriClothes() == "Tux") output(", hands stuffed down into her pockets");
	else output(" with her tail tucked down under the hem of her dress");
	output(".");
	
	output("\n\nMr. Dorna steps forward and puts a firm hand on Syri’s shoulder. <i>“I’m glad you decided to come, Syri. We’ve all missed you terribly.”</i>");
	
	output("\n\n<i>“We have!”</i> his wife concurs, grabbing Syri and pulling her into a tight hug.");
	if (pSyriClothes() == "Tux") output(" <i>“Fashion sense and all.”</i>");
	else output(" <i>“And that dress! Oh, be still my heart, you look absolutely breath-taking, dear.”</i>");
	
	output("\n\nSyri blushes and accepts the hug, struggling for words other than a mumbled, <i>“Th-thanks...”</i>");
	
	output("\n\nAnno grabs Syri and pulls her from one hug into another. <i>“I know, right? It feels like ages since we’ve seen you, sis. You’ve gotta stop being a space hermit and spend more time with us.”</i>");
	
	output("\n\n<i>“Space hermit?”</i> Syri growls, scowling. <i>“Why I-”</i>");
	
	output("\n\n<i>“And who’s this ravishing she-devil?”</i> Mr. Dorna interrupts, brushing in between the twins and grabbing Kaede’s hand to kiss it.");
	
	output("\n\nThe cute red-head giggles, <i>“It’s just me, Mr. Dorna.");
	if (pPartner() == "Anno") output(" Syri");
	else output(" Anno");
	output(" invited me.”</i>");
	
	output("\n\n<i>“Kaede?”</i> he answers in mock surprise. <i>“You must grow more beautiful every year, don’t you?”</i>");
	
	output("\n\n<i>“Careful, Rylon,”</i> Mrs. Dorna laughs. <i>“If you make her blush any more I’m afraid the poor thing will faint. Now, who’s this " + pc.mf("dashing young fellow", "lovely young lady") + "?”</i> she adds, sweeping towards you and taking your hand.");
	
	output("\n\n<i>“Oh. Mom, dad, this is [pc.name],”</i> " + pPartner() + " says, urging you forward towards her parents.");
	
	output("\n\n<i>“Steele,”</i> you add, shaking her hand, then Mr. Dorna’s. <i>“[pc.name] Steele.”</i>");
	
	output("\n\nMrs. Dorna cocks an eye at that. <i>“Steele, is it?”</i> she muses, looking between you and Anno. <i>“How interesting.");
	if (flags["ANNO_MISSION_OFFER"] != undefined && flags["ANNO_MISSION_OFFER"] != 3) output(" Didn’t you work for Steele Tech until just recently, darling?");
	else output(" Don’t you work for Steele Tech, darling?");
	output("”</i>");
	
	output("\n\nAnno nods and claps you on your shoulder. <i>“That’s right. Meet the future C.E.O. of Steele Tech.”</i>");
	
	output("\n\n");
	if (pPartner() == "Syri")
	{
		output("<i>“My, what a catch, Syri”</i> Mrs. Dorna laughs, giving her daughter a look. <i>“Who ever would have thought you would have landed yourself a billionaire?”</i>");
	
		output("\n\n<i>“We’re not... I mean... uh,”</i> Syri stutters, blushing furiously. <i>“It’s... it’s not like that! I just-”</i>");
	
		output("\n\nMr. Dorna rolls his eyes and ruffles the hair between Syri’s ears. <i>“We know, sweetheart.”</i>");
	}
	else
	{
		output("<i>“Is that so?”</i> Mrs. Dorna says, looking between you and Anno with concern. <i>“Anno, darling, weren’t you only recently...”</i>");
	
		output("\n\n<i>“Uh. Yeah. But, uh, look, it’s... I mean, listen, it’s not like that,”</i> she stumbles, cheeks reddening. <i>“Look, I moved on, and [pc.name] isn’t-”</i>");
	
		output("\n\nMr. Dorna rolls his eyes and ruffles the hair between Anno’s ears. <i>“We know, sweetheart.”</i>");
	}
	
	output("\n\nWith your date thoroughly embarrassed, the elder Dornas turn to you and Kaede, both smiling. <i>“Listen,”</i> Rylon starts, putting a hand on your shoulder. <i>“The missus and I were intending to take the girls out to dinner now that the festivities are winding down, but...”</i>");
	
	output("\n\n<i>“Why don’t the two of you come with us?”</i> his wife finishes, smiling brilliantly at you. <i>“Our treat! We’d love to get to know you.”</i>");
	
	output("\n\nThe look your date gives you over her parents’ shoulders tells you that refusing isn’t an option, and so you smile and nod. Beside you, Kaede also nods, her tail wagging happily behind her.");
	
	output("\n\n<i>“Excellent! Come along, girls, our car’s parked just outside.”</i>");

	processTime(20);

	clearMenu();
	addButton(0, "Next", puppyslutmasMeetTheDornasHue);
}

public function puppyslutmasMeetTheDornasHue():void
{
	clearOutput();

	showBust(annoBustDisplay(), syriBustDisplay(), "KAEDE");
	author("Savin");

	output("You follow the Dornas out to their car. As promised, it’s parked on a small ledge on the far side of the floor, down a flight of stairs to put it on level with the common garage. Of course, by car they clearly meant <i>“hover limo,”</i> a long dark stretch with a driver - the older ausar from before - standing at its side. He opens the door with a bow, allowing you and your ever-increasing ausar following to pile in.");
	
	output("\n\n<i>“To Mallaver’s, if you please,”</i> Mr. Dorna directs as you settle into the plush back of the limo. It’s roomy back here, brightly lit by what looks like a hovering disco ball situated between a circle of supple leather seats. Coolers full of champagne sit between each seat, and Syri’s quick to grab a bottle and fill up a glass.");
	
	output("\n\n<i>“Drink, [pc.name]?”</i> she offers, handing you another glass before you have time to answer. By the time the hover car’s taken off, the lot of you have glasses in hand, clinking them together with exchanges of <i>“cheers”</i> and ausar equivalents as you drink.");
	
	output("\n\nThe drive’s short and uneventful, the Dornas too busy laughing, drinking, and catching up to pay you much mind. Kaede tries to alternately involve herself in the conversation whenever Anno talks, or try to stay unnoticed when her lover’s parents ask a question or just look her way. Syri, for her part, finishes two glasses of champagne and is reaching for a third when the car slopes down towards the planet’s surface, and a very posh looking restaurant complete with red-uniformed valets outside.");
	
	output("\n\nThe driver pulls up, and one of the men outside the restaurant opens the limo’s door. <i>“Mr. and Mrs. Dorna. A pleasure to see you again,”</i> the valet says with a bow, stepping out of the way as the elder Dornas step out into the hot, dry air of the surface.");
	
	output("\n\nMr. Dorna stops to say something into the valet’s ear as his wife leads the rest of you into the dark and smoky restaurant. The restaurant’s pretty big, and pretty empty. A single long, circular table surrounds the restaurant, facing in towards a central kitchen open to the customers’ eyes. A couple of waiters welcome you and lead your group to a large, candle-lit section of the table already set with wine glasses and bread.");
	
	output("\n\nAs you’re sitting down, Syri whispers to you, <i>“Don’t be too impressed. They own the place. Cleared it out for us, I bet.”</i>");
	
	output("\n\nYou’d gathered the Dornas were well to-do before, but that seems a little excessive.");
	
	output("\n\nThe clan patriarch rejoins you a few moments later, just as the girls are getting seated and menus are being passed around. The waiters take your drink orders, pour wine, and scurry off out of sight, leaving your group alone again.");
	
	output("\n\n<i>“So, " + pc.mf("Mr.", "Ms.") + " Steele,”</i> Rylon Dorna says, looking at you from the opposite side of the group, <i>“What is it you do, exactly? You don’t strike me as the corporate office type.”</i>");
	
	output("\n\nYou chuckle at that, and spend a few minutes explaining that you’re more accurately an <i>“adventurer”</i> type at the moment, though you’re really just starting out with the new Planet Rush.");
	
	if (annoIsCrew())
	{
		output("\n\n<i>“I see,”</i> he says dryly as you explain your quest in as little detail as you can manage. <i>“And I understand my Anno has joined your merry little crew, has she?”</i>");
	
		if (flags["ANNOxSYRI_EVENT"] == undefined)
		{
			output("\n\n<i>“She </i>what<i>!?”</i> Syri yelps, practically spit-taking her wine.");
		}
	
		output("\n\n<i>“I have,”</i> Anno says with a smile directed more to you than her father.");
	
		output("\n\nMrs. Dorna’s eyes light up at that, and her husband gives you an appraising look. <i>“You won’t be taking my daughter into any undue danger, I hope, " + pc.mf("Mr.", "Ms.") + " Steele.”</i>");
	
		output("\n\nYou promise that you won’t - you’ll keep Anno safe.");
	}
	else
	{
		output("\n\n<i>“A rusher?”</i> Mrs. Dorna says with a smile and a wag of her tail. <i>“How delightfully dangerous!”</i>");
	
		output("\n\n<i>“Hmm,”</i> her husband agrees, taking a pipe out of his jacket and leaning back in his chair. <i>“So all four of you are out there on the frontier, eh? Ah, to be young in this day and age. Why-”</i>");
	
		output("\n\nMrs. Dorna gives her husband a look. <i>“Rylon, put that away!”</i>");
	
		output("\n\nHe huffs, but does as he’s told. <i>“I was only holding it... Ehem, anyway, it’s good to see you all taking to the frontier - even if it’s perhaps a touch more dangerous than I’d like. You’re all paving the way for the progress of civilization.”</i>");
	}
	
	output("\n\nMr. Dorna nods sagely, the follow-up cut short as drinks and appetizers start coming in. A couple of proper chefs march out from a side room, each with a belt of cutlery slung on his or her waist, and make their way to the central kitchen. The waiters still clustered around your section of the table take your orders and deliver them to the pair of chefs before scooting off again into the shadows.");
	
	output("\n\nThe conversation picks up again after that, leading towards Kaede and how long it’s been since the Dornas saw her last and how’s her father and the like. While the rest of the group is talking, you feel a hand slip onto your [pc.leg] beneath the table. You look over just in time to see "+ pPartner() +" slump against you, resting her cheek on your shoulder. Her tail flicks across your [pc.butt] through the gap in the back of your chair, playfully teasing you.");
	
	if (pPartner() == "Syri")
	{
		output("\n\n<i>“Thanks for bringing me out here, [pc.name],”</i> Syri whispers.");
		if (pSyriClothes() == "Dress") output(" Even if you did make me wear a stupid dress.");
		output(" I appreciate the... the support.”</i>");

		output("\n\n<i>“Anytime,”</i> you answer, putting your arm around her strong shoulder. She relaxes utterly in your grasp, snuggling tight against you.");
	}
	else
	{
		output("\n\n<i>“I’m having a wonderful time tonight,”</i> Anno whispers, leaning up to plant a kiss on your cheek. <i>“Thank you for being my date, [pc.name]... and for meeting my folks. I think they like you.”</i>");

		output("\n\nYou smile and wrap your arm around Anno’s slim frame, pulling your lover tight. She accepts your embrace eagerly, snuggling tight into your arms.");
	}
	
	output("\n\nYour food comes in short order, accompanied by more wine and some cheeses that, Mrs. Dorna informs you, come from a gene-modded reptile - for whatever sense <i>that</i> makes - and is a local delicacy. They all have a laugh when you try it, and your face scrunches up in disgust. Nobody else fares much better, but they assure you it’s <i>all the rage</i> this year. The rest of the food, however, is exceptional: succulent meats and creamy vegetables, paired with a variety of breads all straight out of the oven. The cooking’s easily worthy of a five-star restaurant, and the cooks bow with tails wagging at your compliments.");
	
	output("\n\nDinner passes quietly after that, interrupted on occasion by Mrs. Dorna laughing like a lark or the twins starting to squabble over some meaningless remark before somebody breaks them up. All told, though, everyone seems to be having fun, laughing and teasing more like old friends than family. You find yourself drawn into their stories and jokes, made to feel just like part of the family in no time at all. If you had any doubts about impressing yourself upon your date’s parents, they’re erased by the time dessert’s come and gone, and a fairly drunk Mrs. Dorna is trying to marry her daughter off to you, and Mr. Dorna has a holoprojector out, showing Kaede his impressive collection of scatter lasers and hunting trophies.");
	
	output("\n\nAfter an hour or so of sitting and talk and picking teeth clean, the collective Dorna family arrives at the conclusion that it’s time to leave, and you all stumble drunkenly out of the restaurant. Night’s fallen, bathing the desert world in black, lit by two moons and the glowing radiance of the towering skyscrapers. The Dorna hover-limo is brought around, but your date insists that the two of you can just get a cab back to the ship.");
	
	output("\n\n<i>“If you’re sure,”</i> Mrs. Dorna slurs, reaching out and grabbing her daughter in a fierce hug.");
	
	output("\n\n<i>“Indeed. It’s been a pleasure, [pc.name],”</i> Mr. Dorna adds while giving you a vigorous handshake.");
	
	if (pPartner() == "Syri")
	{
		output("\n\nSyri hugs her parents tight, then her sister, and even Kaede. <i>“Bye, guys. It’s... been fun. I’m glad I got to see you.”</i>");
	
		output("\n\n<i>“You too, sis,”</i> Anno answers, giving her sister a peck on the cheek. <i>“We’ve got to talk more often!”</i>");
		
		output("\n\nMr. Dorna plants an hand on Syri’s shoulder, adding, <i>“And write us. Send a holo-message. No more going a year or more without a word from you!”</i>");
		
		output("\n\n<i>“Alright, alright,”</i> Syri blushes, tail flicking around happily, <i>“I’ll write more, geez.”</i>");
		
		output("\n\nThe family hugs again before piling into their limo and flying off, leaving you and your ausar companion alone on the curb. Syri takes your hand in hers, flashing you an inebriated smile, and waves down a passing cab. You get in and take off towards the Dorna building, and your parked ship....");

		clearMenu();
		addButton(0, "Next", puppyslutmasMeetTheDornasHueSyri);
	}
	else
	{
		output("\n\nAnno stops to hug Kaede, her sister, and her parents. <i>“Merry Christmas, everyone. See you all soon - especially you, Syri. Write more often!”</i>");
	
		output("\n\nMr. Dorna plants an hand on Syri’s shoulder, adding, <i>“And write us. Send a holo-message. No more going a year or more without a word from you!”</i>");
		
		output("\n\n<i>“Alright, alright,”</i> Syri blushes, tail flicking around happily, <i>“I’ll write more, geez.”</i>");
		
		output("\n\nThe family hugs again before piling into their limo and flying off, leaving you and your ausar companion alone on the curb. Anno takes your hand in hers, resting her head on your shoulder as you flag down a cab.");
		
		output("\n\nAs you’re getting in, you could swear you heard Anno mumble, <i>“Maybe mom had a point...”</i>");
		
		output("\n\nNah, couldn’t be. You tell the driver where to go, and soon the cab’s zooming back towards the Dorna building, and your parked ship.");

		clearMenu();
		addButton(0, "Next", puppyslutmasMeetTheDornasHueAnno);
	}

	processTime(60);
}

public function puppyslutmasMeetTheDornasHueSyri():void
{
	moveTo("SHIP INTERIOR");
	showLocationName();
	
	clearOutput();
	showBust(syriBustDisplay());
	author("Savin");
	
	var syriOnUveto:Boolean = syriAtFreeezer();
	
	output("<b>Hours pass...</b>");
	output("\n\nYour auto-pilot beeps that you’ve");
	if(getPlanetName() == "Uveto Station") output(" docked with the station over Uveto");
	else if(getPlanetName() == "Mhen'ga") output(" landed at Esbeth");
	else output(" landed on " + getPlanetName());
	output(". Syri sits up and yawns, rubbing the sleep from her eyes. You roll over in your bed, nestling your head in your lover’s lap.");
	output("\n\n<i>“That wasn’t so bad,”</i> you say as she slips out of bed, hiking her jeans up. Syri flashes you a little smile over her shoulder, flicking her tail your way before stuffing it through the loop in her pants.");
	output("\n\n<i>“Could have gone worse,”</i> she agrees, pulling her shirt on. <i>“I was expecting to get yelled at all night. Not...”</i>");
	output("\n\nYou laugh, and grab her ass. <i>“Have fun?”</i>");
	output("\n\n<i>“Yeah,”</i> she smiles, leaning down onto the bed and planted a kiss on your cheek. <i>“I blame the company. Anyway, I should get going.");
	if(!syriOnUveto) output(" My shift’s gonna start... eh, soonish. I’ll see you around, Steele.");
	else output(" Gotta keep practicing if I wanna be the best gamer in the galaxy.");
	output("”</i>");
	output("\n\nBefore she can stand, you grab the back of Syri’s head and pull her back in for a proper kiss, full on the lips. Her tail and ears leap up in alarm, but she melts in your hands, eyes fluttering closed as you show her how to properly end a date.");
	output("\n\nWhen you’re done, you send Syri off to her");
	if(!syriOnUveto) output(" job");
	else output(" practice session");
	output(" and roll out of bed. Time to decide what’s next on your adventure!");

	processTime(360);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function puppyslutmasMeetTheDornasHueAnno():void
{
	moveTo("SHIP INTERIOR");
	showLocationName();

	clearOutput();

	showBust(annoBustDisplay());
	author("Savin");
	
	output("<b>Hours pass...</b>");
	
	output("\n\nYour auto-pilot beeps that you’ve returned to " + getPlanetName() + ". Anno lazily reaches out of bed and smacks the alert button, shutting the damn thing up.");
	
	output("\n\n<i>“So, what’s next?”</i> your lover asks, rolling over on top of you, pressing her big, soft chest against your own.");
	
	output("\n\n<i>“Next...”</i> you say, grabbing the ausar girl’s spankable behind in both hands, hard enough to make her squeal. <i>“We’ve got more probes to find.”</i>");
	
	output("\n\nShe giggles, and puts a kiss on your lips. <i>“Sounds like a plan. Thanks again for a fun night, babe... I had a blast.”</i>");
	
	output("\n\nYou give her a wink, and a spank on the behind to get her moving. The pair of you scramble out of bed and get your gear together. Time to decide what’s next on your adventure!");
	
	processTime(360);
	sleepHeal();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Anno Christmas sex by HugsAlright
//https://docs.google.com/document/d/1sWJchkCNPbSqfEAXZn0QKmcvwaz0j1xAHUdMkYVtirE/edit
public function annoChristmasSpecial():void
{
	flags["ANNO_GIFT_WRAPPED"] = 1;
	
	clearOutput();
	showAnno(true);
	author("HugsAlright");
	
	processTime(30+rand(20));
	
	output("Waking up, you’re stricken with a sensation of loneliness, and looking around it seems Anno’s already out of bed, like the early riser she claims to be: her side of the bed is ruffled and messy, the warmth of her presence still lingering on the mattress. You yawn and stretch before throwing yourself out of bed" + (!pc.isNude() ? " and getting dressed" : "") + ".");
	output("\n\nAs you’re " + (!pc.isNude() ? "pulling your clothes on" : "standing up") + ", you’re suddenly reminded that it’s Christmas! Although, it’s almost difficult to care about such an Earth-bound holiday this far away from home. ");
	if(ChildManager.numChildrenAtNursery() > 0) output("Come to think, maybe you could visit your " + (pc.isAss() ? "little bastard" + (ChildManager.numChildrenAtNursery() > 1 ? "s" : "") : "kid" + (ChildManager.numChildrenAtNursery() > 1 ? "s" : "")) + " in the nursery and give them a bit of parental holiday cheer. ");
	output("Wiping the sleep from your eyes, you move out of your quarters with thoughts of breakfast on your mind; hopefully no one’s expecting any festivities from you <i>this</i> early.");
	output("\n\n[pc.Walking] into your ship’s common area though, a bubbly, familiar voice rings in your ears, <i>“Merry Christmas, boss!”</i>");
	output("\n\nTurning towards the source of the cheer, you’re greeted with a jaw dropping view of your missing lover, Anno, clad in nothing but a big, red ribbon with a mistletoe held above her head. She’s also got a small santa hat between her furry ears. Though, the festive headwear does little for her decency. The rest of her “outfit” barely covers her breasts and sex, an abundance of girlcum visibly wetting the ribbon.");
	output("\n\nShe’s been a busy little elf, hasn’t she?");
	output("\n\nYou’re at a loss for words, nearly immobilized by your scantily-clad crewmate; it all just seems so bizarre, yet so expected from the horny ausar.");
	output("\n\nYour trance is quickly broken by Anno’s voice. <i>“C’mon, [pc.name], don’t you wanna unwrap your present?”</i> She teases, gently shifting her hips back and forth in an impatient little wiggle that only ends up slathering her thighs with more natural lubricants.");
	output("\n\nOh, you most certainly do want to get into this little gift, " + (!pc.isNude() ? "but first, you have to do some unwrapping of your own" : "and you're already prepared to get down and dirty with it") + ".");
	if(!pc.isNude()) output("\n\nYou quickly pull yourself together and stop gawking before tossing a little wink Anno's way. That little gesture makes the pup smile even wider. Well, it's either that or the fact that you're stripping yourself of your gear in front of her, pulling away your clothes until you're good, bare, and ready to help Anno undress too.");
	else output("\n\nGiving her a little wink, you saunter forward, showing off your already-naked form to Anno, but even though you're good and bare... you think your lover is going to need a little help getting her outfit off.");
	output("\n\nBefore you do any unwrapping, though, you take advantage of that mistletoe she’s holding: you wrap your arms around her, ");
	if(!annoIsHuskar()) output("grabbing a handful of ausar ass");
	else output("sinking your fingers into some plus huskar booty");
	output(" and pressing your [pc.lips] to Anno’s, kissing her passionately as you bring her down onto the nearby sofa, mistletoe dropping to the ground. " + (pc.isTaur() ? "With your tauric lower half unable to fit on the couch" : "Straddling your canid gift") + ", you push her onto her back, steadily pulling away from your kiss. You reach your hands down to Anno’s big red ribbon and slowly begin to undo it. ");
	if(!annoIsHuskar()) output("The ausar girl beneath you starts biting her lip with anticipation until the crimson cord is loose enough to let her double-D’s pop free.");
	else output("The ausar girl beneath you bites her lip with anticipation, but you barely start to undo the crimson cord before the sheer weight of her tits tear it free, letting her puppies spread out.");
	if(!annoIsHuskar()) output("\n\nThose full orbs come jiggling to a halt as Anno is freed from her “clothing”");
	else output("\n\nThose jiggling mounds orbs just keep quivering after Anno's been freed from her “clothing”");

	output(", making you lick your lips. Not needing any sort of invitation, you grab at your present’s big, squishy tits, gently cupping and massaging her breasts until she starts to whimper. You lean forward, kissing Anno once more, letting your tongue slip into her mouth as you toy with her chest. ");
	if(!annoIsHuskar()) output("It’s not long before your diligent, devious hands make their way to Anno’s perky pink nipples, tugging and pinching them until she’s moaning into your mouth, making you pull back from your tongue-tying kiss with a smile.");
	else output("It’s not long before your diligent, devious hands make their way to Anno’s big pink nipples, tugging and pinching them until she’s moaning into your mouth, making you pull back from your tongue-tying kiss with a smile. A few more squeezes and tugs, and her inverted nipples start to peak out, so tiny and tender compared to the rest of her huge boobs that you can't help but lean down and take one in your mouth, suckling gently on the sensitive pink point.");
	output("\n\nThe ausar beams up at you and reaches a furry hand up to caress your cheek, <i>“There’s more to your present than that, you know.”</i>");
	output("\n\nYou return her smile and move back until you’re between her shapely legs, pulling the last of her ribbon off to reveal her lube-leaking snatch, " + (pc.hasCock() ? "ready for a big cock to fill it" : "her legs already slathered with feminine fluids") + ".");
	if(pc.hasCock() && !pc.isTaur())
	{
		output("\n\nYou’re already hard as diamonds, Anno’s little Christmas surprise clearly doing what she intended it to do. Still smiling, your lover wraps her legs around your [pc.thighs] as you straddle her on all fours again, ready to guide your pre-leaking tool into her. You don’t waste time and give the eager ausar what she wants, sliding your hips forward until your [pc.cockHead] starts to spread her wet, velvety folds. Anno whimpers and moans as you sheath your turgid shaft inside of her, her breath shuddering while her cunt clamps down on your cock, making sure it’s made warm and snug inside her. Your ausar lover is already panting by the time you bottom out, fuzzy hands clutching at your shoulders, ready for the holiday humping you intend to give her.");
		output("\n\nYou grin at Anno and start to roll your hips, bringing your [pc.cock] in and out of her tight ausar pussy at a steadily-increasing pace. She moans and groans under you with each movement of your [pc.hips], quivering with pleasure as the speed of your fucking picks up. Anno’s pleasured noises are like the sweetest Christmas melody to you, although you think the eager-to-please ausar deserves something a bit more; you bring your head down to Anno’s expansive breasts, mouth quickly opening to accept a stiff pink teat before closing again as your tongue flicks across her nipple. The Christmas-clad puppy cries out with delight as you suckle her tits, already popping off one nipple to greedily suck on the other.");
		output("\n\nIt all becomes too much for Anno, your suckling and fucking pushing her closer and closer to climax until a particularly loud moan escapes her mouth, soaking ausar pussy beginning to spasm around your [pc.cock].");
		if(pc.hasKnot())
		{
			output("\n\nWithout a second thought you slam your hips forward, forcing your [pc.knot] into Anno’s pussy as her girlcum leaks out onto the couch. You jackhammer her convulsing cunt, making the ausar moan louder as you hurry to bring yourself to orgasm. Your scramble to climax pays off as the ecstasy of release fills your body, [pc.cock] beginning to spasm as you cum and cum inside of Anno, ");
			if(pc.cumQ() >= 5000)
			{
				if(!annoIsHuskar()) output("her flat tummy swelling as you fill her with [pc.cum]");
				else output("her plush belly swelling as you fill her with [pc.cum]");
				output(", making her groan until her belly is round with your seed.");
			}
			else output("her ladyjizz spilling out around your [pc.knot].");
			output("\n\nAs your orgasm finally passes, you raise your head to look at Anno, who’s currently recovering from her own peak.");
			output("\n\n<i>“Merry Christmas, boss,”</i> she says, smiling up at you.");
			output("\n\nWell, the two of you are going to be stuck here for a while; you let yourself fall forward, nuzzling your head into Anno’s chest as her arms close around your shoulders, ready to sleep off your knot.");
		}
		else
		{
			output("\n\nYou pick up the pace, [pc.hips] moving at a blinding speed as you hurry to join your lover in orgasm. Your scramble to climax pays off as the ecstasy of release fills your body, [pc.cock] beginning to spasm as you cum and cum inside of Anno, ");
			if(pc.cumQ() >= 5000)
			{
				if(!annoIsHuskar()) output("her flat tummy swelling as you fill her with [pc.cum]");
				else output("her plush belly swelling as you fill her with [pc.cum]");
				output(", making her groan until her belly is round with your seed.");
			}
			else output("her ladyjizz spilling out around your [pc.cock].");
			output("\n\nAs your orgasm finally passes, you pull out and raise your head to look at Anno, who’s currently recovering from her own peak.");
			output("\n\n<i>“Merry Christmas, boss,”</i> she says, smiling up at you.");
			output("\n\nYou thank her for her gift before you let yourself fall forward, nuzzling your head into Anno’s chest as her arms close around your shoulders, the two of you ready to sleep your afterglow away.");
		}
		pc.orgasm();
	}
	else if(pc.hasCock() && pc.isTaur())
	{
		if(silly)
		{
			output("\n\nAs you're planning on how you'll be plunging inside Anno's cunt, a sudden bright flash of light encapsulates you and all you can see. Tangible confusion and panic overtakes your previously unstoppable lust as the white light envelopes your body. You feel powerless against it, and scream as the brilliant radiance grows and grows.");
			output("\n\nBut then, just as soon as it came, the blinding flash fades and your vision clears... only to reveal you're no longer aboard your ship. You frantically look around, taking in your surroundings as a chilling wind blows over your body. Well, that answers one question: you're outside, and it's snowing. What's more, there are stones jutting from the ground all around you, and drawing closer to one, you see it's a tombstone, cold and grey!");
			output("\n\nYou're thrown into a panic, not knowing where you are, or what the hell just happened. Taking a deep breath, you calm yourself, only to be startled once more by a gruff, annoyed voice from behind you.");
			output("\n\n<i>“Hey, you!”</i> it says, sounding like it just smoked a whole pack of cigarettes.");
			output("\n\nYou turn around to face the source of the rough voice, only to see a small, rotund man dressed like and angel, a slight, radiant glow surrounding his body.");
			output("\n\n<i>“Yeah, you!”</i> he yells when he sees your face, <i>“Finally, I was wondering when you'd show up.”</i>");
			output("\n\nYou cock an eyebrow and ask the tiny man who he is and where " + (pc.isAss() ? "the fuck " : "") + "you are.");
			output("\n\n<i>“Me? C'mon, I thought I had a reputation by now,”</i> he says, rolling his eyes, <i>“I'm the Ghost of Christmas Future, and well... You're in the future, kid!”</i>");
			output("\n\nYour eyes go wide at that. There's no way this is real, you must've hit your head trying to fuck Anno or something!");
			output("\n\n<i>“Now, now, I know what you're thinking,”</i> the supposed spirit consoles, <i>“‘There's no way this is real, I must've hit my head trying to fuck my dogslut!’ But I assure you, friend, this is real, and that means you messed up... and I'm supposed to show you... uuuuuh.”</i> The ghost fumbles for a moment, looking around until he finds a particular line of headstones before yelling <i>“This!”</i> and urging you toward them.");
			output("\n\nYou're almost too bewildered by this whole thing to even consider doing anything the stout man says, but you indulge him, and make your way towards the tombstones. Reading them, you expect to see your own name, but only see ones you're quite unfamiliar with: <i>NightTrap, Savin, Nonesuch, Tacit, Lucky, Aul,</i> and many others.");
			output("\n\n<i>“These are all the authors you killed by playing a taur, kid,”</i> the time-travelling ghost explains, <i>“They all died writing variants for you and, like, five other people that play taurs!”</i>");
			output("\n\nWhat?! <i>You</i> killed these people?! A frown crosses your face as guilt and grief fill your heart, but your new, spiritual friend is there with a comforting hand on your haunch, causing you to look down at him. <i>“Listen, pal, we </i>both<i> know you deserve a lump of coal for playing a taur,”</i> he says somberly, <i>“but since it's Christmas this nice author, 'Bugs All Night' I think his name was, is cutting you some slack. So you better appreciate it, bub!”</i>");
			output("\n\nAnd with that, the ghostly figure snaps his fingers, and once again you're enveloped by that bright light, soon fading to reveal the interior of your ship, a needy ausar body still under you.");
			output("\n\nYou look around and feel your own body to make sure <i>you're actually there</i> before breathing a side of relief. Then, you shake that whole ordeal from your head and return to focusing on just what you're going to do with this porcelain-skinned present you have here.");
		}
		output("\n\nYou’re already hard as diamonds, Anno’s little Christmas surprise clearly doing what she intended it to do. Grinning, you pull yourself back, tauric figure towering over Anno's as she lies prone on the couch.");
		output("\n\nThe ausar takes a single look at the [pc.cockBiggest] hanging under you and licks her lips, going to prop herself up against the couch. She grabs hold of her plush thighs and spreads her legs wide and high, inviting you onward with unrestricted access to her dripping pink pussy. Anno smiles deviously, <i>“C'mon boss, I'm ready for my presents...”</i>");
		output("\n\nHer sultry tone hangs in your ears for a moment as you plan to give the puppy-slut what she wants. You return the snowy slut's smile and give her a wink as you [pc.walk] closer to the couch, raising your front legs onto the sofa's back, practically mounting the piece of furniture to line up your hot tauric rod with your giddy gift's slit. The pretty little package assists you buy taking hold of your [pc.cockBiggest] and angling it towards her nether lips until your tip is practically soaking in her natural lubricants. She whimpers slightly as your [pc.cockHeadBiggest] rubs up against her pussy.");
		output("\n\nYou can feel the ausar shift under you as she prepares herself for your big, long present, and you decide to help Anno along her way by giving your [pc.hips] a little thrust forward. That's enough to spread Anno's sopping labia and draw a little gasp from her lips. You smirk at that quiet, pleasured noise and continue to push your hips forward, shoving more of your thick shaft into your lover, leading her to cry out with bliss. She moans louder and louder with each inch you work into her, stretching her as wide as she'll go, to the point where there's a visual bulge in her tummy and her feminine fluids are pouring out around your cock like an Ausaril river delta. ");
		output("\n\nEven though you can't see her beneath your tauric half, you can feel Anno's body squirm and her pussy convulse around your tool as she adjusts to your length. The poor puppy whimpers and moans quietly as she does, finding a comfortable position on your haunches to rest her fluffy legs.");
		output("\n\nEventually, the ausar speaks up again with a quivering, needy voice. <i>“Wh-why'd you stop m-moving, [pc.name]?”</i> she asks, whimpering and stuttering, <i>“C'mon... I want </i>all<i> of my p-present!”</i>");
		output("\n\nWell, if she insists.");
		output("\n\nWith a grin on your face, you start to roll your hips back, dragging your [pc.cockBiggest] in and out of your lover. She moans and groans under you with each movement of your [pc.hips], quivering with pleasure as the speed of your fucking picks up. Anno’s pleasured noises are like the sweetest Christmas melody to you, and that holiday carol only becomes louder when the ausar starts toying with her own tits.");
		output("\n\nIt all becomes too much for Anno, your lovemaking (and sizeable cock) pushing her closer and closer to climax until a particularly loud moan escapes her mouth, soaking ausar pussy beginning to spasm around your [pc.cockBiggest].");
		if(pc.hasKnot(pc.biggestCockIndex()))
		{
			output("\n\nWithout a second thought you slam your hips forward, forcing your [pc.knotBiggest] into Anno’s pussy as her girlcum leaks out onto the couch. You jackhammer her convulsing cunt, making the ausar moan louder as you hurry to bring yourself to orgasm. Your scramble to climax pays off as the ecstasy of release fills your body, [pc.cockBiggest] beginning to spasm as you cum and cum inside of Anno, ");
			if(pc.cumQ() >= 5000)
			{
				if(!annoIsHuskar()) output("her flat tummy swelling as you fill her with [pc.cum]");
				else output("her plush belly swelling as you fill her with [pc.cum]");
				output(", making her groan until her belly is round with your seed.");
			}
			else output("her ladyjizz spilling out around your [pc.knotBiggest].");
			output("\n\nAs your orgasm finally passes, you do your best to get a good look at Anno, who’s currently recovering from her own peak.");
			output("\n\nShe's doing the same, moving as far as she can with your bitch-breaker inside her to look up at her lover. <i>“Merry Christmas, boss,”</i> she says, smiling up at you.");
			output("\n\nWell, the two of you are going to be stuck here for a while; you let yourself recline forward against the couch, while Anno just hugs and nuzzles your lower-half, the two of you ready to sleep off your knot.");
		}
		else
		{
			output("\n\nYou pick up the pace, [pc.hips] moving at a blinding speed as you hurry to join your lover in orgasm. Your scramble to climax pays off as the ecstasy of release fills your body, [pc.cockBiggest] beginning to spasm as you cum and cum inside of Anno, ");
			if(pc.cumQ() >= 5000)
			{
				if(!annoIsHuskar()) output("her flat tummy swelling as you fill her with [pc.cum]");
				else output("her plush belly swelling as you fill her with [pc.cum]");
				output(", making her groan until her belly is round with your seed.");
			}
			else output("her ladyjizz spilling out around your [pc.cockBiggest].");
			output("\n\nAs your orgasm finally passes, you do your best to get a good look at Anno, who’s currently recovering from her own peak.");
			output("\n\nShe's doing the same, moving as far as she can with your softening taur-cock holding her in place to look up at her lover. <i>“Merry Christmas, boss,”</i> she says, smiling up at you.");
			output("\n\nWell, the two of you are going to be stuck here for a while; you let yourself recline forward against the couch, while Anno just hugs and nuzzles your lower-half, the two of your ready to sleep your afterglow away.");
		}
		pc.orgasm();
	}
	else
	{
		output("\n\nGrinning, you work your way down Anno's bare body, ");
		if(!annoIsHuskar()) output("planting little kisses along her tight tummy as you go, all the way to her pretty pink pussy");
		else output("planting little kisses along her soft stomach as you go, all the way to her pretty pink pussy");
		output(". You pause before digging in and look up at your lover, only to see her tail wagging as fast as it can and her face completely full of need.");
		output("\n\n<i>“C'mon, boss,”</i> she coos lustfully with a big smile on her face, <i>“Don't you want this nice Christmas breakfast I made you?”</i>");
		output("\n\nYou give her a lascivious smirk in response and sink back down to her body, throwing her lube-glossed thighs over your shoulders quick enough to make the ausar yelp. Then, with her legs nice and spread with your head between them, you let your [pc.tongue] loll from your mouth and trail it along the inside of Anno's thigh, gathering her fem-lube as you go and drawing a shuddering breath from the snowy pup. After that it's just a short trip of your tongue to reach her velvety folds, dragging your oral organ up and down her wet, pink slit until she starts to whimper. You move your way up to her clit and start to kiss at her engorged pleasure-buzzer, flicking your [pc.tongue] across it and turning a once steady flow of Anno's feminine fluids into an Ausaril river!");
		output("\n\n<i>“Booooooss,”</i> the sopping-wet doggirl pleads and whines, <i>“Quit teasing meeeeeee... give me my present already!”</i>");
		output("\n\nWell, if she insists.");
		output("\n\nAnno's quiet little moans make it hard to stop toying with " + (silly ? "clit-chan" : "her clitty") + ", but you pull yourself from her bitch-button and make your way back down between her legs, getting a nice, deep breath of her bitter-sweet arousal when you do. Her earthy scent compels you to dig right in, spreading her nether lips with your [pc.tongue], lapping up her natural-lubricants as you do. You can feel the ausar's fluffy legs clench around your shoulders as you push deeper inside her pussy, her moans becoming louder and louder.");
		output("\n\nEventually, Anno wraps her legs around your shoulders, keeping you in place against her trimmed muff. That's not really an issue, though, because you're not planning on leaving anytime soon. You delve deep inside her wet, needy slit, sliding your oral organ along her inner-walls as her fragrant, delicious fem-lube pours out around your face and between your lips. ");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output("Your lengthy, dexterous mouth-muscle is easily able to make its way to your lover's deepest, most-sensitive spots, making her cry out with pleasure, legs tightening around your shoulders until you can barely move. Void, you've even got enough tongue to work back out of her pussy and flick around her clit again! You thought she was having a good time before, but that has her arching her back and curling her fuzzy toes with pleasure. ");
		else output("\n\nYour ausar lover starts to cry out with pleasure as you seek out her g-stop, playing with her own tits and tugging at her erect nipples as you eat her out. You keep yourself buried between her legs the whole time, but occasionally pull yourself from her needy lower lips to kiss and tease at her clit.");
		output("\n\nIt's all too much for your pretty little present. Her whole body tenses with the force of her impending orgasm, spurred on by your oral pleasures. You can feel her pussy clamp down around your [pc.tongue], her inner muscles spasming around your oral organ as her climax continues. Anno's back arches and her legs hold you still against her convulsing cunt, spilling a waterfall's worth of ausar girlcum into your mouth and dribbling down your chin. The snowy pup's orgasm continues for some time, with her whole body writhing in bliss while you're treated to as much girly fluid as you can handle until you're practically drowning in grool.");
		output("\n\nWhen she does finally come down, though, she does so with a beet-red face and a heaving chest. Anno's legs finally let up after that, allowing you pull your face from her sopping, puffy nether lips. She looks down at your girlcum-covered [pc.face] and reaches a fluffy white hand down to cup your cheek, and with a big grin on her face she urges you upward. You follow the ausar's lead and make your way up her body, " + (pc.hasBreasts() ? "mashing your [pc.breasts] against hers" : "pressing your [pc.chest] to hers") + " until you're pulled into a sloppy, tongue filled kiss. Her tongue plays across yours for a while before she starts to lick at your girlcum-slick cheeks, cleaning you of her own arousal.");
		output("\n\nWhen she's done, she pulls back and licks her lips, reveling in her own flavor for a moment before smiling, <i>“Merry Christmas, boss.”</i>");
		output("\n\nAnd, with that, Anno promptly collapses back onto the couch and takes you with her, holding you close so she has something to cuddle while she sleeps off her afterglow...");
		pc.lust(50);
	}
	output("\n\nMerry Christmas indeed");
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}