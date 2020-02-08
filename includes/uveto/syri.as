
public function syriAtFreeezer():Boolean
{
	if (flags["SYRI_CREWMEMBER"] == 2) return true;
	if ((syriQuestRunning() && flags["SYRIQUEST_STATE"] == 1) || syriQuestComplete()) return true;
	return false;
}

public function syriAtFreezerFirePitBonus(btnSlot:int = 0):void
{
	output("\n\nYou can see Syri hanging out at one of the trestle tables down here in the common room, enjoying a drink and messing around on a handheld holo-tablet. She’s gotten buttoned up under her blue navy coat, with a pair of fluffy mitts covering her inner ears.");
	if (syriQuestComplete()) addButton(btnSlot,"Syri",syriFreezerMenu);
	else addButton(btnSlot,"Syri",syriQuestFreezer);
}

public function syriFreezerMenu(outputs:Boolean = true):void
{
	if(outputs)
	{
		if(syriPuppyslutmasEntryUveto()) return;
		
		clearOutput();
		showSyri();
		author("Savin");
		output("<i>“Hey, Steele,”</i> Syri says, looking up from her datapad with a toothy smile. <i>“Sit with me a bit?”</i>");
		output("\n\nThat’s why you came over, isn’t it? You slide into the booth across from Syri and hijack her drink, taking a long draught while she finishes up whatever she was working on. After a few moments, she tucks the datapad into her coat’s inner pocket and rests her chin in her hands. <i>“So, what’s up?”</i>");
	}
	//Syri's Menu: [Talk] [Appearance] [Sex] [Kiss Her] [Leave]
	clearMenu();
	addButton(0,"Talk",syriFreezerTalkMenu);
	if(syriIsAFuckbuddy()) {
		if(pc.lust() >= 33) addButton(1,"Sex",syriSexMenu,undefined,"Sex","Take Syri back to your place for some intimate PvP experience.");
		else addDisabledButton(1,"Sex");
		if (flags["SYRI_MILOFUCK"] == undefined) addButton(5, "Milodans?", syriFreezerMilodanFuckings, undefined, "Milodans?", "Ask Syri if she’s had any run-ins with the furred denizens of Uveto.");
	}
	addButton(2,"Appearance",syriAppearance);
	if(flags["UNLOCK_SYRI_ANNO_TALK"] != undefined) addButton(3,"Anno",syriTalksAboutAnno);
	addButton(4,"Kiss Her",syriFreezerKissHer,undefined,"Kiss Her",silly ? "Give your favorite pooch a smooch." : "Give Syri a smooch.");
	addButton(14,"Leave",mainGameMenu);
}

public function syriFreezerKissHer():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("You lean across the table between you and Syri, playing your hands up those strong arms of hers until you’re cupping her cheeks. The ausar girl grips your wrists, refusing to let go until you close the distance and lock lips with her. Her tail shoots out behind her like an arrow before starting to wag, beating rapidly against the booth seat. She sighs dreamily into your mouth, letting you have your way with her dusky lips until your tongues are entwining, wrapped together in a momentary dance of mutual adoration.");
	output("\n\n<i>“Yeah, okay,”</i> Syri chuckles once you break the kiss. Her tail flicks onto your [pc.leg], teasing at your crotch. <i>“I guess you took that whole ‘I love you’ thing seriously. Good, cuz I </i>meant<i> it...”</i>");
	output("\n\nYour lover gives you a playful wink and leans back, running her tongue over her lips. <i>“I love the taste of you, too. Wouldn’t mind getting a little more back at your place...”</i>");
	processTime(3);
	pc.changeLust(2);
	while(pc.lust() < 33)
	{
		pc.lust(1);
	}
	clearMenu();
	syriFreezerMenu(false);
	addDisabledButton(4,"Kiss Her","Kiss Her","You just did that.");
}

public function syriFreezerTalkMenu(outputs:Boolean = true):void
{
	if(outputs) {
		clearOutput();
		showSyri();
		author("Savin");
		output("<i>“Got a minute to talk?”</i> you ask.");
		output("\n\n<i>“For you... I can make time,”</i> Syri grins. <i>“What’s on your mind?”</i>");
	}
	clearMenu();
	//Only if PC saved Valden, naturally.
	if (flags["SYRIQUEST_STATE"] >= 23)
	{
		if(flags["SYRIQUEST_VALDEN_BODY_CHOICE"] != undefined) addButton(0,"Valden",syriFreezerTalkValden,undefined,"Valden","How’s Valden doing? Is Syri keeping up with him at all?");
		else addDisabledButton(0,"Locked");
	}
	addButton(1,"What’s Next?",syriFreezerTalkWhatsNext,undefined,"What’s Next?","What’s next for Syri Dorna?");
	//dont activate this if the quest got refused
	if (flags["SYRIQUEST_STATE"] >= 23)
	{
		if(flags["SYRIQUEST_POST_GAME_TALK_LOVE"] == undefined) addButton(2,"Love?",syriFreezerTalkLove,undefined,"Love?","Syri dropped a very particular word at the end of your mission to save Valden. Press her on it.");
		else addDisabledButton(2,"Love?");
	}
	if (flags["SYRIQUEST_STATE"] >= 23)
	{
		if (flags["SYRIQUEST_POST_GAME_TALK_PENIS"] >= 1) addButton(3,"Penis",syriFreezerTalkPenis,undefined,"Penis","So now that Valden’s the living dead, what’s Syri gonna do about her dick?");
		else addDisabledButton(3,"Locked");
	}
	if (flags["SYRIQUEST_POST_GAME_TALK_PENIS"] >= 2 || flags["SYRIQUEST_SYRI_ONAHOLE"] >= 1)
	{
		if(flags["SYRIQUEST_SYRI_ONAHOLE"] == 1) addButton(4, "Cunt Sleeve", syriFreezerTalkCuntSleeve, undefined, "Cunt Sleeve", (flags["SYRIQUEST_POST_GAME_TALK_PENIS"] >= 2 ? "Since Syri’s not interested in a new pussy, maybe she’d be interested in seeing what happened to the old model..." : "Return Syri’s pussy."));
		else addDisabledButton(4, "Cunt Sleeve", "Cunt Sleeve", "Since Syri’s not interested in a new pussy, maybe she’d be interested in seeing what happened to the old model...");
	}
	else if(flags["SYRIQUEST_POST_GAME_TALK_PENIS"] >= 2) addDisabledButton(4,"Locked");
	addButton(5,"Books",syriTalkThree,undefined,"Books","What is she reading these days?");
	addButton(14,"Back",syriFreezerMenu,false);
}

//Only if PC saved Valden, naturally.
public function syriFreezerTalkValden():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Heard from Valden recently?”</i>");
	output("\n\nSyri sighs. <i>“Yeah, but... I dunno, he’s being real vague on where he is, what he’s doing. I guess he’s worried about Akkadi or some government spooks intercepting our emails. Understandable, considering what he’s been through, though I can’t help but feeling he’s being an ingrate after we saved his butt. At least he’s okay. That’s what really matters, right?”</i>");
	output("\n\n<i>“Right.”</i>");
	output("\n\nSyri nods and leans back, shoving her hands into her coat pockets. <i>“It’s weird... being so worried for so long. Having all that hope and fear and then it’s all... over. I guess I’m still worried about him, considering he’s technically dead <b>and</b> A.W.O.L. now, so I can only imagine the kind of legal trouble he’s in. Assuming some naval intelligence spook doesn’t shoot him in the back in some dark alley. They really don’t like their little secrets getting out.”</i>");
	output("\n\nIf that’s the case, shouldn’t you and Syri be worried about that? After all, she spilled the beans to you without much concern.");
	output("\n\n<i>“Yeah but we’re awesome,”</i> Syri laughs. <i>“If they were keeping an eye on me, Akkadi and the navy would never have let us anywhere near Uveto. I musta slipped through the cracks a while ago. Kinda liberating, actually.”</i>");
	if(flags["SYRIQUEST_POST_GAME_TALK_PENIS"] == undefined || flags["SYRIQUEST_POST_GAME_TALK_PENIS"] < 1) flags["SYRIQUEST_POST_GAME_TALK_PENIS"] = 1;
	syriFreezerTalkMenu(false);
	addDisabledButton(0,"Valden");
}

public function syriFreezerTalkWhatsNext():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“So what’re you gonna be up to now?”</i> you ask.");
	output("\n\n<i>“I mentioned that holo-shooter tourney they’re holding here on Uveto, right? I mean, that’s basically why I’m still here since I’ve recently become unemployed with extreme prejudice. I’m basically unemployable now. Shoulda seen that coming, but hey, totally worth it. Besides, as soon as I win that competition, I’m going to be set up for a good long time.”</i>");
	output("\n\n<i>“So you’re going to be going through with the tournament after all?”</i>");
	output("\n\nSyri nods eagerly, tail wagging. <i>“You bet your ass I am! I’m gonna compete, and I’m gonna win. These punks got no idea what’s about to hit ‘em!”</i>");
	output("\n\n<i>“Alright, and after you win?”</i>");
	output("\n\n<i>“Then I’m gonna live like a queen until the next tourney, and I’ll win that one too! And the next, and the next. I’m going in with the big leagues, [pc.name]. Don’t you doubt it. Gimme a year or so and you’re gonna see me in the news. I’m gonna be thrashing noobs on Terra and Ausaril, and </i>rolling<i> in the credits!”</i>");
	output("\n\nGood to know.");
	syriFreezerTalkMenu(false);
	addDisabledButton(1,"What’s Next?");
}

public function syriFreezerTalkLove():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“So, about what you said earlier...”</i> you prompt.");
	output("\n\n<i>“About being awesome? I </i>am<i> awesome,”</i> Syri laughs. <i>“That’s what you wanted to talk about, right? Or were you just lusting after some ausar dick?”</i>");
	output("\n\nWell, you were more interested in another ‘L’ word just used on you. <i>“How about ‘love,’ Syri?”</i>");
	output("\n\nAll the self-confidence she’d been blustering on with falters in an instant, replaced by a nervous grin and a tucked tail. <i>“Y-yeah, I guess there’s that too.”</i>");
	output("\n\nSilence falls over the pair of you for a moment before Syri shrugs and leans forward in her seat. <i>“What? That’s, uh... that’s it. Y’know, ‘I love you’ and all that. People say it to each other all the time. So, y’know...”</i>");
	output("\n\nWhat you want to know is if she <i>meant</i> it. That she <i>loves</i> you.");
	output("\n\nSyri half-laughs her answer. <i>“You seriously gotta ask? C’mon, Steele, do I really gotta say it?”</i>");
	output("\n\n<i>“Yes.”</i>");
	output("\n\nYour lover rolls her eyes and stands up. Before you can question her intents, Syri grabs you by the shoulders and hauls you up out of the booth, yanking you into a tight hug with her hands on your [pc.butt] and your [pc.lips] brushing against her own. She locks eyes with you and growls out, loud enough for half the bar to hear her: ");
	output("\n\n<i>“[pc.name] Steele: I-”</i> she kisses you, hard. <i>“Love.”</i> Another kiss, a firm squeeze of your [pc.butt]. <i>“You.”</i>");
	output("\n\nSyri cups your cheeks and holds you, staring into your eyes. <i>“Clear enough?”</i>");
	if (pc.isMischievous()) output("\n\n<i>“Crystal,”</i> you grin.");
	else output("\n\n<i>“Perfectly.”</i>");
	output("\n\nSyri releases you and turns to the rest of the bar, and a lot of eyes watching the display. <i>“What’re you all staring at?”</i> she snarls. <i>“Haven’t you ever seen a girl in love before?”</i>");
	output("\n\nThere’s a smattering of laughter and a few raised glasses from the patrons before they return to their drinks. Syri gives you a toothy grin and shoves you down on the table, planting her ass in your lap and her arms around your shoulder. <i>“Now then, if you’re done questioning me... this is the part where you say ‘oh, Syri, I love you too. You’re the best thing that ever happened to me. You’re so great and beautiful and sexy...’”</i>");
	clearMenu();
	addButton(0,"Love Her Too",syriFreezerTalkLoveLoveHerToo,undefined,"Tell your lover exactly what she needs to hear.");
	addButton(1,"Hold On There",syriFreezerTalkLoveHoldOnThere,undefined,"Syri’s presuming a little much there...");
}

public function syriFreezerTalkLoveLoveHerToo():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("You tell Syri she’s all of that and more -- and yeah, you love her too.");
	output("\n\nShe grins and squeezes you tight. <i>“Of course you do. You and me make a great team, Steele. I knew it from the moment you walked through that door back on Mhen’ga the very first time.”</i>");
	output("\n\nOf course she did. Syri grins and gives you a peck on the cheek. <i>“Now then, this is the part where you invite me to adjourn to your ship so we can consummate our love.”</i>");
	output("\n\n");
	flags["SYRIQUEST_POST_GAME_TALK_LOVE"] = 1;
	clearMenu();
	addButton(0,"Next",syriSexMenu);
}

public function syriFreezerTalkLoveHoldOnThere():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("You lean a little away from Syri, saying you don’t know about all this.");
	output("\n\n<i>“Of course you don’t,”</i> your lover says, not skipping a beat. <i>“High-society space dilettante like you, lovin’ a random bar pickup like me? Didn’t expect that, still don’t. Doesn’t change how I feel about you, though. But damned if I’m not gonna work to change your mind. You know I’m too stubborn for that shit. So you just hold onto your ass until I’m the best and most famous gamer in the galaxy, and we’ll see where you stand then! This tourney coming up is just the first step on my road to be somebody you can be proud of... and in love with.”</i>");
	output("\n\nShe grins and squeezes your butt. <i>“So fine, I can settle for being friends with benefits for now. But we’ll see how you feel when this quest of yours is done... and if I haven’t changed your mind, at least I’ll be rich and successful while I cry myself all the way to the bank. Now let’s buy some drinks so I can pretend the whole bar’s not starin’ at us now.”</i>");
	flags["SYRIQUEST_POST_GAME_TALK_LOVE"] = 2;
	clearMenu();
	addButton(0,"Next",syriFreezerMenu,false);
}

public function syriFreezerTalkPenis():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“So, considering there’s no point holding onto Valden’s dick for him anymore...”</i>");
	output("\n\n<i>“Or half his organs,”</i> Syri grunts. <i>“Well, maybe not half, but there’s buncha his stuff riding around inside. I kept the dick for sentimental reasons; the rest cuz the navy wouldn’t pay for me to get vat-grown replacements. At least they gave me the meds I need to stay alive like this, the bastards. Anyway, considering you’re pantsing me with your eyes, I can guess what you’re thinking: ‘Well, Syri, Valden’s gone soooo when are you getting rid of the dick, huh?" + (pc.hasCock() ? " When do I get to fuck a litter of pups into you and we can live happily ever after now that I fixed you?":"") + "’”</i>");
	output("\n\nSyri snickers. <i>“Sorry, I’m being a bitch again. But look, after the last few years of not having a puss... I kinda don’t miss it. Don’t have to worry about getting knocked up, or feelin’ all weepy and hormonal in heat. Getting railed in the ass feels just as good as normal fucking ever did since I’ve gotten a dick, plus I never have to worry about bringing a strapon. It’s just a good fit for me. I’m keeping it.”</i>");
	output("\n\n<i>“You sure?”</i>");
	output("\n\nYour lover nods, patting herself on the crotch. <i>“Yep. Might as well, considering that I’ve gotta take meds to keep my internal organs working, so an </i>external<i> one isn’t a big deal. Maybe I’ll get some mod work done on it, who knows. Regardless, considering Valden... well, it’s my dick now!”</i>");
	output("\n\n<i>“And no plans to get a pussy to go with it?”</i>");
	output("\n\n<i>“Nope!”</i> Syri smirks. <i>“What you see is what you get! Hope you’re not too heartbroken, but I’ve made up my mind.”</i>");
	if(flags["SYRIQUEST_POST_GAME_TALK_PENIS"] == undefined || flags["SYRIQUEST_POST_GAME_TALK_PENIS"] < 2) flags["SYRIQUEST_POST_GAME_TALK_PENIS"] = 2;
	syriFreezerTalkMenu(false);
	addDisabledButton(3,"Penis");
}

public function syriFreezerTalkCuntSleeve():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Hey, I found something in the Akkadi base you might be interested in,”</i> you tell her, reaching into your pack and pulling out the black plastic tube. It makes a soft beep as you transfer it over to Syri -- didn’t do that for you, did it? ");
	output("\n\nThe ausar girl flips the sleeve around in her hands, looking it over. <i>“Nice, a... flashlight? Can always use one of those I guess.”</i>");
	output("\n\nYou roll your eyes and tell her to look inside.");
	output("\n\nSyri furrows her brow but does as you say, unscrewing the top cover and staring inside. Her lips scrunch together as she stares into her own quivering pussylips. After a long moment of staring, Syri snickers and looks up at you. <i>“No way. I recognize that little birthmark next to the lips. The way the left one folds a little... holy shit [pc.name] is this actually...?”</i>");
	output("\n\n<i>“Yeah it is.”</i> You have no idea why Akkadi kept it, much less kept it alive in a sleeve like this... and it’s probably best not to think too hard about it. Point is, you found Syri’s puss in its own little living onahole.");
	output("\n\n<i>“Like one of those bi-onahole-thingies,”</i> Syri says. <i>“I thought they were a TamaniCorp thing. Not that I’m complaining. As much as I totally said I don’t want this back between my legs... it’s fucking cool to have it back and living! I wonder if...”</i>");
	output("\n\nFlashing you a grin, Syri plants the bottom of the onahole on the table and presses two fingers into the top, straight down into her ex-twat. You hear a wet <i>schlick</i> sound, and Syri’s tail shoots out straight behind her. <i>“Whew! Phantom pleasure right there... aaaand that’s it. Damn, I was hoping I’d actually be able to fuck myself. I mean, I guess technically I can but I don’t think I’m gonna really feel it. Oh well. Thanks, [pc.name]. Now I’ve got a proper cocksleeve when you’re not around.”</i>");
	output("\n\nShe leans in and gives you a quick kiss before shoving the bio-onahole into her coat pocket. Somehow, you doubt that’s the last you’re going to be seeing of that...");
	flags["SYRIQUEST_SYRI_ONAHOLE"] = 2;
	syriFreezerTalkMenu(false);
	addDisabledButton(4,"Cunt Sleeve");
}

// Ziresh busts and stuff go here
public function syriZireshBusts(nude:Boolean = false):void
{
	showBust(syriBustDisplay(nude),"ZIRESH");
	showName("SYRI &\nMILODANS");
	author("Wsan");
}

public function syriFreezerMilodanFuckings():void
{
	clearMenu();
	clearOutput();
	showSyri();
	author("Wsan");

	output("<i>“Ever run across any milodans out here, Syri?”</i> you ask.");
	output("\n\n<i>“Actually... funny you ask,”</i> Syri replies, smirking as she leans in. <i>“I’ve been thinking about bagging one for myself - they’re just so fluffy looking, y’know? I just wanna...”</i> She pauses, holding her hands out and vigorously pantomiming ruffling a thick coat of fur. <i>“Like that.”</i>");
	output("\n\n<i>“And then have sex with them?”</i> you say.");
	output("\n\n<i>“Weeeeeell, maybe if somebody were to give me that little push, I could see myself nuzzling into that thick coat all night,”</i> she agrees. <i>“Rough, wild cavekitty sex. Man or woman, I’ll take either. Though I guess the former means I’ll have to fight for it.”</i>");
	output("\n\n<i>“Sounds like you might need an armed escort,”</i> you hint, raising your eyebrows. <i>“Especially if you’ve been drinking.”</i>");
	output("\n\n<i>“Aha,”</i> Syri says, smiling fondly at you. <i>“I didn’t think my Steele would pass up the chance for more sex. You wanna come, then?”</i>");

	if (pc.hasGenitals()) addButton(0, "Yes", function():void
	{
		clearMenu();
		clearOutput();
		showSyri();
		author("Wsan");
		processTime(30+rand(91));

		output("<i>“Sure,”</i> you say, nodding. <i>“I’m all for novel experiences. Did you wanna leave now?”</i>");
		output("\n\n<i>“Yeah, let me just get a couple extra layers,”</i> Syri says, looking down at her clothes. <i>“Won’t need ‘em when we get there, but on the way...”</i>");
		if (pc.hasFur() && (pc.hasSkinFlag(GLOBAL.FLAG_FLUFFY) || pc.perkv1("Regal Mane") == GLOBAL.FLAG_FURRED || pc.perkv1("Wooly") >= 1)) output("\n\nShe glances at you, gears turning in her head. <i>“Or maybe I’ll just cling to you the whole way? You’re pretty fluffy yourself...”</i>\n\n<i>“You’re welcome to,”</i> you reply with a smile and open arms.");
		output("\n\n<b>--</b>");
		output("\n\nThe wilds of Uveto are, as ever, an uncompromising hell of whirling frost and ice. Staying close to Syri, you’re beginning to have second thoughts when you suddenly spot movement far ahead through the sheet of hail and snow. Pointing it out, you take Syri’s arm and draw closer to the dark objects moving through the storm. You’re not overwhelmingly keen on a fight right now but you’re sure you can handle it.");

		generateMapForLocation("UVGR Q40");

		addButton(0, "Fight!", syriFreezerMilodanFuckingsGo, undefined, "Fight?", "Fight! ...Maybe.");
	}, undefined, "Yes", "Sure, you’ll go milodan ‘hunting’ with Syri. Why not?");
	else addDisabledButton(0, "Yes", "Yes", "You need some ‘equipment’ to hunt milodan.");
	addButton(1, "No", function():void
	{
		clearOutput();
		showSyri();
		author("Wsan");
		processTime(1);

		output("<i>“Nah, not feeling it today,”</i> you say, shaking your head.");
		output("\n\n<i>“Awww,”</i> Syri moans, sagging momentarily before brightening up. <i>“Oh well. One of ‘em’s gotta roll into town sooner or later.”</i>");
		output("\n\nDoesn’t seem like she’s given up just yet.");

		syriFreezerMenu(false);
	}, undefined, "No", "Maybe some other time.");
}

public function syriFreezerMilodanFuckingsGo():void
{
	clearMenu();
	clearOutput();
	syriZireshBusts(true);
	processTime(45+rand(31));

	var len:Number = pc.cLength(0);

	output("As it happens, no fighting ends up being necessary. Approaching the indistinct shadows, their forms eventually coalesce into two extremely well put together milodan women. Upon spotting the two of you, the older of the pair starts and immediately draws closer with eyes wide with concern. Grabbing Syri, she tugs the ausar woman along behind her and you follow close, watching the younger woman shake her head and fall in line. Verbal communication all but impossible in the storm, you exchange no words until you finally reach the cave you’re being taken to.");
	output("\n\nYou lean in to murmur in one of Syri’s giant wolf ears. <i>“I’m guessing you’re going to want the fluffy one...”</i>");
	output("\n\n<i>“Oh, my god, yes,”</i> she whispers back, biting her lip. <i>“Look at that fucking body.”</i>");
	output("\n\nContinuing down a short winding corridor, you arrive at an internal clearing large enough that your dad’s ship would probably comfortably fit inside. The air here is calm and even warm, allowing you to relax enough to finally check out the young woman alongside you. The most obvious thing about her is that she’s clearly only half-milodan; you note some distinctly alien features, namely the thick puff of chest fur and fluffy limbs of a huskar.");
	output("\n\nThe <i>second</i> most obvious thing is how incredibly attractive she is. Clearly unused to the concept of clothing she lets her thick shawl fall to the ground, revealing her fecund body to all who would look. From head to toe she looks like nothing less than a fertility idol, well-suited to living in the bitter cold of Uveto and no doubt to breeding. Her lack of body fur only seems to enhance her all-natural beauty, drawing your attentions to her fair and pale skin. It’s hard to tear your eyes away.");
	output("\n\n<i>“Oh my, you really shouldn’t be out during the storms,”</i> the older of the pair huffs, looking at the two of you disapprovingly. <i>“What could possibly be so valuable that you decided to brave the wilderness?”</i>");
	output("\n\nYou and Syri exchange a glance before she continues.");
	output("\n\n<i>“Well, never mind,”</i> she chuckles, shaking her head. <i>“Aliens are nothing if not inscrutable. More importantly, you look like you must be quite cold!”</i> she says to Syri, taking the ausar’s hand in both of her own.");
	output("\n\nSeeing her chance, Syri follows through. <i>“Oh, I’m just </i>so<i> chilly... can you think of any way to warm me up?”</i>");
	output("\n\n<i>“Oh, you poor thing,”</i> the milodan woman coos, drawing closer and pressing her full, ample bosom against Syri’s. <i>“Let’s take this lower to the ground... shall we?”</i>");
	output("\n\nYou catch the younger one rolling her eyes and snicker. Her eyes dart to you while the older woman and Syri work on getting the ausar girl out of her clothes, then away again.");
	output("\n\n<i>“Ziresh? What’s the matter, darling?”</i> the older woman says over Syri’s shoulder, smiling. <i>“I’ve heard from Madam Lorre you’re getting on </i>quite<i> well with aliens recently...”</i>");
	output("\n\n<i>“Mother!”</i> the younger woman hisses, whipping her head around and scowling at her chuckling mom. Turning to face you once more, she looks at you sheepishly. <i>“Sorry. She doesn’t know when to quit.”</i>");
	output("\n\n<i>“It’s okay,”</i> you say, smiling. <i>“Ziresh, is it? Ordinarily I’d at least buy you a drink but...”</i> You give the cavern a once-over before shrugging. <i>“Anyway, I’m [pc.name].”</i>");
	output("\n\n<i>“[pc.name]... okay,”</i> Ziresh says quietly, nodding to herself.");
	output("\n\nLeaning forward you catch the young milodan girl by surprise with a kiss, her bright blue feline eyes widening before you gently push her to the ground. Ziresh grabs your [pc.hips] tightly before her grip relaxes, her eyes slowly fluttering closed as she turns to putty in your skillful hands. She doesn’t seem particularly practiced but she knows enough to let you take the lead with your tongue and your fingers, spreading her plump legs underneath you.");
	output("\n\nIf that woman Syri is feeling up really is Ziresh’s mother, the apple doesn’t fall too far from the tree. Ziresh is soft and thick, the black areolae on her lush breasts hiding two inverted nipples that slowly begin to make their appearance as you heat her up. Soon enough they’re hard and jutting outwards, enough for you to gently take one of the firm protrusions between your fingers and squeeze her. Ziresh moans into your open mouth - she <i>likes</i> that.");
	output("\n\nYou’re about to blow her mind, then. Reaching up with your other hand you softly scratch her behind the ear, her back arching instinctively as she sighs in pleasure, utterly relaxed in your arms. While you’ve got her distracted your hand roams from her breasts down to the thick tuft of white fur on her pubic mound, sliding over her onyx-black pussylips. Already slick with her arousal, you slip your fingers between them and gently run them up her sensitive folds.");
	output("\n\n<i>“Oohh,”</i> she gasps in your ear, clutching you tight. <i>“Oh!”</i>");
	output("\n\nZiresh <i>dances</i> against you, her hips rolling upwards and her back arching into the air as you slowly circle her stiff little clitty with your fingertip, her furred legs alternating between straightening and wrapping around your own. She can’t seem to decide whether to pull you closer or lay back and revel in the pleasure, stuck halfway between her body and her mind. That’s okay, you’ll decide for her.");
	output("\n\nGlancing over, you see Syri is already balls-deep in Ziresh’s mother, the dull thud of her groin smacking against the milodan woman’s big, curvy ass while she moans lustily. Ziresh is going to require a bit more of a... delicate touch, you think. Even now, with just your hands in play, she’s pretty out of it. Lithe legs splayed and her thick gray hair a disorganized mess, she’s already sweating and panting.");
	output("\n\nDeciding she should at least get a taste of what’s to come, you push two fingers between her lust-glossed netherlips and begin rubbing her from the inside, curling them up as if beckoning her towards you while your thumb brushes her clit. Gasping, Ziresh immediately draws her thighs together only to have them held apart by your [pc.legs], moaning as she squeezes her eyes shut and begins to clench fiercely around your fingers. You’re soon rewarded by a breathless, shuddering cry of release and a warm spurt of her scented juices all over your hand, the girl slumping back to the ground with a moan as you withdraw your soaked fingers.");
	output("\n\n<i>“Good girl, Ziresh,”</i> you murmur, rubbing her shaking thigh.");
	output("\n\nIt takes a few seconds for you to realize what the unfamiliar noise is - she’s <i>purring</i>, looking up at you dazed and confused, knowing only that you’re the one responsible for the state she’s in. The sound emerges from deep in her throat and it doesn’t look like she even knows she’s doing it, her deep blue eyes half-closed in lusty approval. She wants <i>more</i>.");

	if (pc.hasCock())
	{
		output("\n\nYou’ve got exactly what she needs.");
		if (!pc.isCrotchExposed()) output(" You pull your [pc.cocks] free of your [pc.lowerGarments], laying " + (pc.hasCocks() ? "them" : "it") + " across her mons pubis. The new source of warmth causes Ziresh to stir, glancing downwards to see what’s going on, her soft lips parting in surprise when she sees your " + (pc.hasCocks() ? "cocks." : "cock."));
		if (pc.hasCocks())
		{
			output("\n\n<i>“You have more than one!”</i> she gasps, her shock palpable. <i>“Wow...”</i>");
			output("\n\n<i>“Want to see what I can do with them?”</i> you ask, smiling down at her.");
			output("\n\n<i>“Yes... <b>please</b>,”</i> she murmurs, biting her lip.");
			output("\n\nGiving her some room you allow Ziresh to turn over on her front, her curvy breasts so big they splay to the sides of her chest. Her ass is every bit as plump as the rest of her; this would stay jiggling for days if you gave her a hard spank. Right now, though, all you want to do is pamper this pretty girl a bit - and introduce her to the concept of one-[pc.manWoman] double penetration.");
			output("\n\nTo her credit, she handles your initial penetration very well. You sink into Ziresh’s warm, tight folds with a grunt of pleasure as she moans out loud, her claws popping free and digging into the ground as you get deeper inside her. Contrary to your earlier expectations, Ziresh is less delicate than you might have thought. The way she growls lustily as you thrust, arches her back and brushes her tail beneath your chin let you know she’s ready for more.");
			if (pc.cocks.length > 2) output(" Probably not everything you’ve got to offer but if she can take one, she can take two.");
			pc.cockChange();
			output("\n\nWith a hand on her back gently pushing her down, you use the other to spread her soft buttcheeks and reveal her tight little asshole, likely never penetrated if tribe life is anything like you imagine it. Slipping your pointer finger inside, you slowly edge deeper as she moans, weakly squeezing her pussy walls around your erect cock. The further you push the more she loses control, groaning like a whore as you spread her wide.");
			output("\n\nOne finger becomes two, then three, then you’re out and she’s winking in your absence. Placing your hands to either side of her, you carefully align yourself with both holes and push forward with patience, allowing her to catch on and draw you inside. This time <i>both</i> of you moan at the feeling, dual pleasure enrapturing your senses as you immediately push deeper, driven on by a feral need. Ziresh responds in kind, moaning and growling as she pushes back up into you with surprising strength, rising until she’s up on all fours.");
			output("\n\nYou’re not sure she even consciously realizes it herself but she clearly wants to be fucked <i>hard</i>, and you’re more than happy to oblige. Drawing back, you slam your hips forward into the soft cushion of her ass and she cries out in pure pleasure, throwing her head back in relief. Then you’re all over her, grabbing her heaving, bouncing tits while you pound her ass and pussy, her mother crying out in orgasm from the other side of the cave.");
			output("\n\nAll four of you are possessed by nothing less than animalistic need, giving as good as you’re getting in your frenzied fuckfest, needy moans and desirous cries the only sounds breaking up the staccato rhythm of [pc.skinFurScales] slapping fur. Ziresh has cum so many times already you haven’t even bothered keeping track, her scorching hot cunny and flexing asshole clamping down on you almost nonstop as she fights through the pleasure to relax, to let you deeper, to keep you inside her. Roughly gripping her sweaty body you plow into her from behind, panting in her laid-back ear");
			if (pc.tallness > 60) output(", dominating the smaller woman");
			output(" while she squeezes you back.");
			output("\n\nYou can feel yourself getting closer to cumming and don’t - <i>can’t</i> hold back from fucking her, from ravaging her with both of your thrumming cocks at once, stretching her holes around them while she wordlessly cries out in utter bliss. When your orgasm hits it hits <i>hard</i>, a slowly unwinding knot forming in your stomach as you tense and moan her name, [pc.cum] spurting from the ends of your dicks.");
			output("\n\n<i>“Oh,”</i> Ziresh groans, feeling the warmth of your bubbling seed begin to pour inside her. <i>“Oh, oohh! [pc.name]! [pc.name]!”</i>");
			output("\n\nSeized by impulse, you grab her tight and pull her up into your lap in a sitting position, kissing her neck and shoulders while she writhes and moans in orgasm, dancing atop you. You’re so turned on that even when you’re done you’re still fucking her, thrusting into her from below as you cling to hardness for dear life. She’s just so hot and responsive to it all you can’t resist, cum " + (pc.cumQ() < 5000 ? "dripping" : "streaming") + " from her holes while you pound her.");
		}
		else
		{
			output("\n\n<i>“Oh...!”</i> she whispers, eyes wide.");

			if (len <= 12) output((pc.cocks[0].cType == GLOBAL.TYPE_FELINE ? " <i>“You’re like us!”</i>\n\n<i>“The familiarity’ll help,”</i> you say, smiling. <i>“But I bet I can show you a couple things you don’t know.”</i>" : " <i>“You’re so- so exotic...”</i>\n\n<i>“Never seen one like this before?”</i> you ask, smiling. <i>“I’ll show you how you use it.”</i>"));
			else if (len <= 18) output(" <i>“You’re so much bigger than our males!”</i>");
			else if (len <= 25) output(" <i>“I don’t know if you’ll even fit!”</i>");
			else output(" <i>“You might not even fit inside me...”</i>\n\n<i>“We’ll make it work,”</i> you promise her, smiling.");

			output("\n\nGiving her some room you allow Ziresh to turn over on her front, her curvy breasts so big they splay to the sides of her chest. Her ass is every bit as plump as the rest of her; this would stay jiggling for days if you gave her a hard spank. Right now, though, all you want to do is pamper this pretty girl a bit - and give her some much-needed alien experience.");
			output("\n\nTo her credit, she handles your initial penetration very well. You sink into Ziresh’s warm, tight folds with a grunt of pleasure as she moans out loud, her claws popping free and digging into the ground as you get deeper inside her.");

			if (len <= 12) output(" Contrary to your earlier expectations, Ziresh is less delicate than you might have thought. The way she growls lustily as you thrust, arches her back and brushes her bushy tail beneath your chin let you know she’s ready for more.");
			else if (len <= 18) output(" Getting it all inside her is a challenge given her inexperience with handling anyone of your size but Ziresh is clearly eager to take the challenge, growling lustily and arching her back as you slip deeper. Her bushy tail brushes beneath your chin when you finally get " + (pc.balls > 0 ? "balls-deep inside her, your [pc.balls] nestling between her juicy buttcheeks." : "all the way inside her, your hands pulling her juicy buttcheeks apart to ensure you’re as deep as you can be."));
			else if (len <= 25) output(" Her voice emanates from her throat in a loud, lusty growl as you spread Ziresh’s inexperienced little cunt wide around your immense shaft, slipping deeper into her. The way her back begins to arch when you get halfway inside is all the impetus you need; she wants more, and she wants it now.");
			else output(" As enormous as you are Ziresh rises to the challenge with a loud, lusty growl from deep in her throat as your bitch-breaking shaft spreads her inexperienced little cunt to the extreme. She’s all but wrapped around you, her back arching to an absurd degree as you push deeper, her face almost coming up to meet yours.");
			
			pc.cockChange();

			output("\n\nWith a hand on her back gently pushing her down, you use the other to spread her soft buttcheeks and reveal her tight little asshole, likely never penetrated if tribe life is anything like you imagine it. Slipping your pointer finger inside, you slowly edge deeper as she moans, weakly squeezing her pussy walls around your erect cock. The further you push the more she loses control, groaning like a whore as you spread her wide.");
			output("\n\nShe’s wholly unused to what you’re doing to her, the sensation of having both holes full of you working her into a moaning, growling mess. You’ve hardly begun thrusting before she’s pushing back up into you with surprising strength, rising until she’s up on all fours with a fierce groan. Withdrawing your finger, you discard the idea of teasing her some more.");
			output("\n\nYou’re not sure she even consciously realizes it herself but she clearly wants to be fucked <i>hard</i>, and you’re more than happy to oblige. Drawing back, you slam your hips forward into the soft cushion of her ass and she cries out in pure pleasure, throwing her head back in relief. Then you’re all over her, grabbing her heaving, bouncing tits while you pound her tight little pussy, her mother crying out in orgasm from the other side of the cave.");
			output("\n\nAll four of you are possessed by nothing less than animalistic need, giving as good as you’re getting in your frenzied fuckfest, needy moans and desirous cries the only sounds breaking up the staccato rhythm of [pc.skinFurScales] slapping fur. Ziresh has cum so many times already you haven’t even bothered keeping track, her scorching hot cunny and clamping down on you almost nonstop as she fights through the pleasure to relax, to let you deeper, to keep you inside her. Roughly gripping her sweaty body you plow into her from behind, panting in her laid-back ear");
			if (pc.tallness > 60) output(", dominating the smaller woman");
			output(" while she squeezes you back.");
			output("\n\nYou can feel yourself getting closer to cumming and don’t - <i>can’t</i> hold back from fucking her, from ravaging her with your thrumming cock, stretching her fuckhole around it while she wordlessly cries out in utter bliss. When your orgasm hits it hits <i>hard</i>, a slowly unwinding knot forming in your stomach as you tense and moan her name, [pc.cum] spurting from the ends of your dick.");
			output("\n\n<i>“Oh,”</i> Ziresh groans, feeling the warmth of your bubbling seed begin to pour inside her. <i>“Oh, oohh! [pc.name]! [pc.name]!”</i>");
			output("\n\nSeized by impulse, you grab her tight and pull her up into your lap in a sitting position, kissing her neck and shoulders while she writhes and moans in orgasm, dancing atop you. You’re so turned on that even when you’re done you’re still fucking her, thrusting into her from below as you cling to hardness for dear life. She’s just so hot and responsive to it all you can’t resist, cum " + (pc.cumQ() < 5000 ? "dripping" : "streaming") + " from her spasming slit while you pound her.");
		}
		output("\n\nWhen you’re finally done you lay her back on the ground, panting hard as you stare into each others eyes. Moving as one the two of you meet halfway and kiss, tongues entwining in heated passion as she hugs you closer.");
		output("\n\n<i>“That was </i>amazing<i>,”</i> Ziresh whispers to you, her voice a low, husky growl. <i>“Can you... do it again?”</i>");
		output("\n\n<i>“Well... the storm’s not going anywhere soon,”</i> you murmur.");
	}
	else
	{
		output("\n\nYou know exactly what to do for a needy girl like this. Grip tightening on her juicy thighs, you sink down to eye-level with them and take a second to appreciate the sight before you. Her dark, dusky pussy lips are inflamed with desire and just slightly parted, arousal drooling downwards from a small pool at her entrance. There’s an easy way to coax more out of her.");
		output("\n\n<i>“Oh. <b>Oh</b>,”</i> Ziresh groans, grabbing your head hard. <i>“Oh, goddess!”</i>");
		output("\n\nThe taste of her all across your [pc.tongue] is overwhelmingly pleasant, like warm honeyed milk. Lapping calmly at her folds seems to have the most extreme of results; soon she’s writhing, bucking and trying to desperately hump your face while you hold her in place and smoothly bring her closer to orgasm. The strength with which she pumps her hips when she finally cums is unlike anything you’ve ever seen in your life.");
		output("\n\n<i>“Oh,”</i> she gasps, eyes wide in disbelief, uncontrollably smacking her ass against the ground. <i>“Oh- fuck- [pc.name]!”</i>");
		output("\n\nWith a knowing smile you move north, flicking her clit upwards and seizing upon it with your lips just enough to make her scream - a long, throaty howl of bliss as you let go, allowing her to drink in the experience undistracted. Massaging her violently shaking thighs, you plant kisses on her fluttering tummy while she slowly returns to her senses, gasping and panting.");
		output("\n\n<i>“Was that good?”</i> you purr.");
		output("\n\n<i>“I... I’ve never felt a tongue used like </i>that<i>,”</i> Ziresh says breathlessly, looking at you with newfound ardor.");
		output("\n\n<i>“Would you like to try the same thing on me?”</i> you offer, winking down at her.");
		output("\n\n<i>“Yes,”</i> she says hotly, seizing your arm. <i>“Yes.”</i>");
		output("\n\nZiresh takes her first taste of your [pc.pussy] while you’re seated above her, your [pc.ass] held an inch away from her face. Groaning indulgently, you let her plant her hands on your cheeks and pull you further apart. Her long, warm tongue digs into you hungrily; evidently she’s decided she loves your taste as much as you hers, and she has no intention of letting go without more.");
		output("\n\nNot one to let her work on her lonesome you slowly bend over, allowing her to keep you steady, and tend to her sex-slickened quim once more. With every intention of starting slow, you try to relax and breathe as Ziresh laps and slurps attentively at your dripping cunt, but it’s not doing much good. Any good, really.");
		output("\n\nShe’s just too- too <i>skillful</i>, noting your every tiny quiver and moan and honing in on every last action that induces a positive reaction until you’re groaning out loud, almost grinding yourself against her face. The only thing you can think to do is busy yourself with plunging your tongue between her thick onyx lips, sucking at her cunt every bit as hungrily as she is yours. Streams of her juices spurt down your chin and yet she still doesn’t stop, moaning as she laps at you with desperate fervor.");
		output("\n\nIt all comes to a crux when Ziresh’s tongue brushes against your [pc.clit] and you grunt, your back arching momentarily, and that’s all the info she needs. It’s all you can do to keep from screaming in pleasure as she switches between your pussy and your clit, somehow instinctively knowing how best to work you into a frenzy, as if she were every bit as experienced as you. Unfettered by restraint, the two of you savagely hump and grind at each other’s faces, your grips tightening until you’re so tightly squeezed against her sweaty body you can feel her pounding heartbeat through your [pc.skinFurScales].");
		output("\n\n<i>“Oh, stars, <b>fuck</b>!”</i> you gasp, shaking in her hands. <i>“Ziresh!”</i>");
		output("\n\n<i>“[pc.name]!”</i> she cries out, pushing her wide hips up into you. <i>“H-harder!”</i>");
		output("\n\nYou suffer an earth-shattering, back-breaking orgasm while Ziresh holds you with surprising strength, your bodies rolling in perfect unison as the two of you cry out in ecstasy, muscles ablaze with the sensation of release. The feeling is so intense you almost pass out, your vision momentarily turning white before you come back down to earth, slumped in your half-milodan lover’s arms.");
		output("\n\nWords are unnecessary in the wake of it all, your tongues tracing each other’s bodies as you slowly crawl back off her face, planting kisses on her soft white skin as you go. It’s only when you reach her flushed face that you stop, closing your [pc.eyes] and pressing your lips to hers, tasting of each other and the intimacy you shared. Sinking your hands into the pliant flesh of her breasts, you gently knead and squeeze her while she sighs in happiness against you.");
		output("\n\nZiresh’s mouth stays half-open when you eventually pull back wearing a genuine smile, shifting your hands.");
		output("\n\n<i>“I could get used to that,”</i> you murmur, stroking her cheek.");
		output("\n\nShe just breathes slowly, looking up at you until a noise from the other end of the cave makes you glance upwards. It’s Syri, noisily emptying her balls for what must be the fifth or sixth time into Ziresh’s mother. You can see how incredibly pleased the recipient is from here, her plump legs wrapping around your ausar buddy’s lower back and pulling her in.");
		output("\n\nBefore you can even comment Ziresh has her hands at your shoulders and roughly pulls you down on top of her, kissing you hard before rolling over on top of you, keeping you held against the ground. She only pulls back after several seconds, breathing heavily and staring you in the face.");
		output("\n\n<i>“I don’t want it to end there,”</i> she says, her tail swishing in the air behind her. <i>“I don’t want you to go yet, [pc.name].”</i>");
		output("\n\n<i>“Well... the storm’s not going anywhere soon,”</i> you murmur, pulling her back down on top of you.");
	}

	pc.orgasm();

	addButton(0, "Next", syriFreezerMilodanFuckingsAreOver);
}

public function syriFreezerMilodanFuckingsAreOver():void
{
	clearMenu();
	clearOutput();
	syriZireshBusts();
	processTime(90+rand(61));

	output("By the time the storm passes and you roll off Ziresh gasping for breath, the entire cave has warmed up several degrees thanks to your exertions. She lies alongside you panting, " + (pc.hasCock() ? "cum pooling between her shuddering legs and dripping from her lips." : "her thighs and face thoroughly coated in femcum.") + " You couldn’t have asked for a better or more willing partner, and it seems Syri could say the same.");
	output("\n\nShe’s relaxing in the milodan woman’s lap with her head between the voluptuous lady’s breasts, her eyes closed and her hands deep in sweaty fur. Looks like she got her original desire after all. Reaching over to Ziresh, you give her thick chest fur a gentle scratch and she begins purring, nestling against your side.");
	output("\n\nYou’re eventually roused from your rest by the padding of paws across the cave, Ziresh’s mother fetching Syri’s clothes for her. Getting up with Ziresh, you cross over to the duo to find the milodan woman fussing over her newfound lover.");
	output("\n\n<i>“These clothes aren’t enough for you furless aliens, even if you do have some fluff on you,”</i> she sighs, shaking her head, casting her head at her daughter. <i>“I’m always telling her the same thing and she never listens.”</i>");
	output("\n\n<i>“Thank you,”</i> Syri says, leaning in to whisper in her ear. <i>“---”</i>");
	output("\n\nYou don’t hear what she calls her but the fertile priestess stops for a second before a salacious smile spreads across her face.");
	output("\n\n<i>“I would take you back to the tribe as my lover in a heartbeat, little pup,”</i> she says, eyeing Syri up and down. <i>“You wouldn’t rest for <b>days</b>.”</i>");
	output("\n\n<i>“That doesn’t sound so bad,”</i> you muse, looking " + (pc.tallness > 60 ? "up" : "down") + " at Ziresh to find you’re holding her hand. She blushes slightly, but doesn’t avoid your gaze, looking back at you with a smile.");
	output("\n\n<i>“Maybe we’ll have to come check that village out at some point, [pc.name],”</i> Syri says, grinning at you.");
	output("\n\n<b>---</b>");
	output("\n\nYou say your goodbyes to the two of them, giving Ziresh a long, warm hug and a gentle kiss as she wraps her arms around your neck. She turns away when you leave, heading deeper into the cave as her mother waves you a fond farewell. Trudging back through the snow with Syri, you turn to her and raise your eyebrows.");
	output("\n\n<i>“So... that went pretty well,”</i> you venture.");
	output("\n\n<i>“No shit!”</i> Syri laughs cheerily, a dopey grin on her face. <i>“Got a whole new appreciation for older women out of that one. Like, wow. Her daughter was super cute too.”</i>");
	output("\n\n<i>“Yeah,”</i> you say, smiling. <i>“She said we might see them around in town sometime, so... you never know. Might run into them again.”</i>");
	output("\n\n<i>“Yeah,”</i> Syri nods, putting her arm around your shoulders and pulling you closer. <i>“Don’t forget, you’ve always got me! Just uh, not </i>right<i> now. My waist is still sore.”</i>");
	output("\n\n<i>“She did look like the kind of woman that could turn your hips into dust,”</i> you laugh, hugging Syri.");
	output("\n\n<i>“Oh, you do </i>not<i> even know,”</i> Syri says vehemently, clenching a fist. <i>“The things she did...”</i>");
	output("\n\nYou wind up back at Syri’s little hangout, the Freezer, chatting over drinks until you part ways. That was one hunt you won’t soon forget.");

	flags["SYRI_MILOFUCK"] = 1;
	generateMapForLocation(currentLocation);

	addButton(0, "Next", mainGameMenu);
}