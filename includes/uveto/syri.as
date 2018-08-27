
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
	pc.lust(2);
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
	if (flags["SYRIQUEST_STATE"] >= 21)
	{
		if(flags["SYRIQUEST_POST_GAME_TALK_LOVE"] == undefined) addButton(2,"Love?",syriFreezerTalkLove,undefined,"Love?","Syri dropped a very particular word at the end of your mission to save Valden. Press her on it.");
		else addDisabledButton(2,"Love?");
	}
	if (flags["SYRIQUEST_STATE"] >= 23)
	{
		if (flags["SYRIQUEST_POST_GAME_TALK_PENIS"] >= 1) addButton(3,"Penis",syriFreezerTalkPenis,undefined,"Penis","So now that Valden’s the living dead, what’s Syri gonna do about her dick?");
		else addDisabledButton(3,"Locked");
		if (flags["SYRIQUEST_POST_GAME_TALK_PENIS"] >= 2)
		{
			if(flags["SYRIQUEST_SYRI_ONAHOLE"] == 1) addButton(4, "Cunt Sleeve", syriFreezerTalkCuntSleeve, undefined, "Cunt Sleeve", "Since Syri’s not interested in a new pussy, maybe she’d be interested in seeing what happened to the old model...");
			else addDisabledButton(4, "Cunt Sleeve", "Cunt Sleeve", "Since Syri’s not interested in a new pussy, maybe she’d be interested in seeing what happened to the old model...");
		}
		else addDisabledButton(4,"Locked");
	}
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
	output("\n\nSyri furrows her brow but does as you say, unscrewing the top cover and staring inside. Her lips scrunch together as she stares into her own quivering pussylips. After a long moment of staring, Syri snickers and looks up at you. <i>“No way. I recognize that little little birthmark next to the lips. The way the left one folds a little... holy shit [pc.name] is this actually...?”</i>");
	output("\n\n<i>“Yeah it is.”</i> You have no idea why Akkadi kept it, much less kept it alive in a sleeve like this... and it’s probably best not to think too hard about it. Point is, you found Syri’s puss in its own little living onahole.");
	output("\n\n<i>“Like one of those bi-onahole-thingies,”</i> Syri says. <i>“I thought they were a TamaniCorp thing. Not that I’m complaining. As much as I totally said I don’t want this back between my legs... it’s fucking cool to have it back and living! I wonder if...”</i>");
	output("\n\nFlashing you a grin, Syri plants the bottom of the onahole on the table and presses two fingers into the top, straight down into her ex-twat. You hear a wet <i>schlick</i> sound, and Syri’s tail shoots out straight behind her. <i>“Whew! Phantom pleasure right there... aaaand that’s it. Damn, I was hoping I’d actually be able to fuck myself. I mean, I guess technically I can but I don’t think I’m gonna really feel it. Oh well. Thanks, [pc.name]. Now I’ve got a proper cocksleeve when you’re not around.”</i>");
	output("\n\nShe leans in and gives you a quick kiss before shoving the bio-onahole into her coat pocket. Somehow, you doubt that’s the last you’re going to be seeing of that...");
	flags["SYRIQUEST_SYRI_ONAHOLE"] = 2;
	syriFreezerTalkMenu(false);
	addDisabledButton(4,"Cunt Sleeve");
}