/* 
 * Jesse Lyon-Bowner
 * By SoAndSo
 * https://docs.google.com/document/d/1lb9_5TKXai3emUyDMx18rIcNnbSMOe9NHRbB9uFSs1s/edit#
 * 
 * JESSE_MET			undefined = hasnt meet her, 0 = pc left when she got angry, 1 = give access to her menu
 * JESSE_PC_TITLE		0 = pc.name, 1 = Mister/Miss Steele, 2 = Sir/Madam
 * JESSE_HAD_SEX
 * JESSE_TEASE_STATE
 * JESSE_TALK_HER		1 = Talked about Jesse
 * JESSE_TALK_INTERESTS	1 = Talked about her interests
 * JESSE_TALK_WORK		1 = Talked about her work
 * JESSE_TALK_PRUDE		1 = Talked about her prudeness
 * JESSE_TALK_BODY		1 = Talked about her body
*/

/* TO DO:
 * Replace all ... with ...
 * Enable her cooldown status
 * 
 * 
*/

public function showJesse(nude:Boolean = false):void
{
	if(nude) showBust("none");
	else showBust("none");
	showName("\nJESSE");
}

// " + jessePCTitle() + "
public function jessePCTitle(lowercase:Boolean = false):String
{
	if (flags["JESSE_PC_TITLE"] == 1) return pc.mf("Mister","Miss") +" Steele";
	else if (flags["JESSE_PC_TITLE"] == 2) return pc.mf("Sir","Madam");
	else return "[pc.name]";
}

public function jesseBarBonus(button:int):void
{
	if (flags["MET_JESSE"] == undefined) 
	{
		output("\n\nThere’s a petite humanoid surrounding by empty glasses and gadgets. She seems rather bored, perhaps you wanna speak to her...?");
		addButton(button,"SolitaryWomn",firstTimeApproachJesseI,undefined,"Solitary Woman","She seems a bit lonely in that corner.");
	}
	else if (!pc.hasStatusEffect("Jesse Bar Cooldown"))
	{
		output("\n\nJesse’s found a comfy cubicle to idle away in, gadgets and soda glasses still gathering at her table. Despite being focused on what she’s watching, she does look quite bored...");
		addButton(button,"Jesse",approachJesse,undefined,"Jesse","See what the corporate careerist is up to.");
	}
}

public function firstTimeApproachJesseI():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("You can’t imagine someone keeping their head down in a place like this, not with that enthusiastic kui-tan at the helm anyway.");
	output("\n\nYou gather the pluck to speak with her, cuz hey, she looks cute enough.");
	output("\n\nSauntering over to her little den, you get a quick look at her. She’s pretty short, at most 5’3’’ and the tips of her shoes just about touch the floor. Her hair is a very rich shade of wine red and admirably well-kept. She has peculiar eye-shaped markings above her eyebrows. Her clothing style is smart-casual: classy but all purpose. A straw leading to a thin glass full of soda sits idly between her lips and small earphones play unfamiliar music that drifts around her. You can’t quite tell if she’s looking at you because her eyes... seem to be made of stardust.");
	output("\n\nTaking a chance, you say <i>“hey there”</i> in a clear voice. She slowly turns her head to see who’s breaking her immersion. She gestures a short wave and then holds up her index finger, implying <i>“wait a second.”</i>");
	output("\n\nThe straw in her mouth plops neatly into the glass and she carefully removes her earphones before meticulously wrapping them up. <i>“May I help you with something, " + pc.mf("sir","madam") + "?”</i> She asks in a husky, polite tone of voice. Her accent is certainly Terran - at a rough guess, you’d say from England - and somewhat sophisticated. You could sum it up as ‘proper’.");
	output("\n\n" + pc.mf("Sir","Madam") + ", eh?");
	if (pc.isNice())
	{
		output("\n\n<i>“Mind if I sit with you?”</i> You ask her back, keeping to a similar tone.");
		output("\n\n<i>“Uhhm, a-alright. Watch out for all the glasses,”</i> she points, momentarily distracted by something on one of the small screens in front of her.");
	}
	else if (pc.isMischievous())
	{
		output("\n\n<i>“Looking a little lonely there, want some company?”</i> You say back, a smirk on your face.");
		output("\n\n<i>“Ohh, uh, yes. I mean, absolutely. Careful with the glasses,”</i> she points, momentarily distracted by something on one of the small screens in front of her.");
	}
	else
	{
		output("\n\n<i>“Seat’s looking empty, I should fill it,”</i> you assert.");
		output("\n\n<i>“Uhhh... a-alright, it is empty after all,”</i> she timidly replies, her snow white cheeks blushing a little.");
	}
	output("\n\nYou sit yourself down opposite the petite woman. She’s got her face directed at a datapad right below her, although her eyes seem to be darting all over the place. You can’t tell if she’s looking at you directly.");
	output("\n\nYou ask her what her name is.");
	output("\n\n<i>“O-oh, I thought you needed a... oh, blimey, um. My name’s Jesse, " + pc.mf("sir","madam") + ". Jesse Lyon-Bowner. O-officially, Miss Lyon-Bowner of Traders Universalis LTD,”</i> she rehearses, her attention focusing on you. <i>“Put simply, I work as a go-between for company A and company B, sometimes to company C and very sometimes to company Z.”</i>");
	output("\n\nQuite the title. Fair’s fair so you introduce yourself back.");
	output("\n\n<i>“Steele. [pc.name] Steele, general galactic gallivanter and heir to SteeleTech,”</i> you say with a certain smugness, looking to impress.");
	output("\n\nJesse’s thin eyebrows rise in surprise and strangely, the marks on her forehead match her eye movements by widening across her skin.");
	output("\n\n<i>“</i>The<i> Steele?! Oh. Oh wow,”</i> she says out loud, putting her hands to her open jaw. <i>“" + pc.mf("Mister","Miss") + " Steele, it is an absolute honor.”</i>");
	output("\n\nShe elegantly outstretches her hand for a shake.");
	if (pc.isNice()) output("\n\n<i>“The honor’s mine,”</i> you say cordially, shaking her hand in a friendly way. She beams back at you.");
	else if (pc.isMischievous()) output("\n\n<i>“That’s far too sweet of you,”</i> you say with a grin, giving her hand an enthusiastic couple of shakes. She visibly blushes back.");
	else output("\n\n<i>“Naturally,”</i> you say with a grin, giving her hand a firm shake. She quickly regains her composure, business-like to a T.");
	output("\n\nTaking her hand back, she puts a finger to the side of her mouth. <i>“Ohh, how should I refer to you?”</i>");
	output("\n\nGood point, formal or friendly?");

	processTime(10);
	clearMenu();
	addButton(0, "Formal", firstTimeApproachJesseII, true);
	addButton(1, "First name", firstTimeApproachJesseII);
}

public function firstTimeApproachJesseII(formal:Boolean = false):void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	if (formal) {
		output("<i>“" + pc.mf("Mister","Miss") + " Steele is perfectly fine, Jesse,”</i> you say to her in a matter of fact way.");
		output("\n\n<i>“Of course, " + pc.mf("Mister", "Miss") + " Steele,”</i> she says with a nod, a delighted smile on her face.");
		flags["JESSE_PC_TITLE"] = 1;
	}
	else {
		output("<i>“[pc.name] works for me, Jesse,”</i> is your reply.");
		output("\n\n<i>“[pc.name], [pc.name]... just making sure I don’t slip into habits,”</i> she says with a smile, tapping the side of her head.");
	}
	output("\n\nNow that introductions are out of the way, she shuffles a little in her seat and takes an attentive posture. <i>“S-sooo, um... hm. What exactly do you... do?”</i> The curious young woman asks you. The thing is, you sense that she already knows something, considering her foreknowledge of you.");
	output("\n\nYou explain your earlier work as a [pc.startingCareer], relaying your exploits in the field, as well as the knowledge and experience you’ve earned from it. She’s quite quickly enthralled, showing a certain inexperience herself. <i>“Wait, you use weapons? As in, actual boom-kapow-vwom-vwom weapons?”</i> she says enthusiastically, shooting a fake gun with her clasped hands.");
	output("\n\nYou hold up your [pc.weapon] at a meter's distance from her, explaining its design and demonstrating how easy it is for you to use. Her mouth forms an awe-driven ‘O’ shape, although her eyes make it difficult to discern if she’s looking at your piece or you yourself.");
	output("\n\nWhen it gets to your ace space race against your cousin, Jesse interjects.");
	output("\n\n<i>“Ah, oh, I’ve um, been following this pretty closely! Hang on, hang on,”</i> she says in a fluster, tapping with a hand on the dataslate below her.");
	output("\n\n<i>“S-so is it true that you slew a ");
	if (silly) output("violating tentacle monster");
	else output("Kornakanori dragon");
	output(" with just that [pc.weapon] and a broken umbrella?!”</i>");
	output("\n\nYou let her down gently.");
	output("\n\n<i>“Aw... that damned fool really was making it up,”</i> she says busily, tapping away on her device again. Her lips purse and pull in a cutesy manner as she argues on the extranet. The little lady asks you several similar questions, most of which are completely fabricated rumours.");
	output("\n\nYou ask her what she’s here for, she’s said what she does but not what she’s doing.");
	output("\n\nSnapping back to reality, Jesse looks up from the glowing device on the table. <i>“Ah, let me explain. Ordinarily, I would visit the premises of a client or clients and then our trade talks would take place. Buuut... space is, um,”</i> she pauses, trying to choose her phrasing. <i>“It’s much bigger than Earth, <i>soooooooo</i> I use stations as resting places. Currently, there’s a long running deal with varying levels of importance that’s being carried out on Vesperia. It’s years in the making and it might even take years to finish. However, the added neutrality of Canadia station helps <i>smooth</i> things over very gently.”</i>");
	output("\n\nHer confidence shines through when she talks about her work, her face becomes prideful and relaxed.");
	output("\n\n<i>“I mean, really when all is said and done, it’s just moving one stash of silly money from one place to another. Then again, it’s silly money that I get to partake in,”</i> she winks, sipping on a soda straw. <i>“Things have been slow, to put it mildly. Most of the time I don’t have much to do except... hang around and watch videos of pet dogs ");
	if (silly) output("boopin’ snoots");
	else output("on the extranet");
	output(" all day. Gets a little lonely...”</i>");
	if (pc.isNice()) output("\n\n<i>“Maybe I could help, life’s exciting around me,”</i> you say in a sincere tone, a closed smile across your face.");
	else if (pc.isMischievous()) output("\n\n<i>“Oh Jesse, I could show you an entire galaxy if you wanted,”</i> you quip, trying to dig up that Steele Charm.");
	else output("\n\n<i>“I’m excellent company if I do say so myself,”</i> you assert, keeping eye contact as best you can.");
	output("\n\nHer eyes narrow, then widen in alarm. <i>“E-excuse me? If you would pardon my incredulity, " + jessePCTitle() + ". You don’t just ask that sort of thing! H-how do you know I’m not already in perfectly functional and completely satisfactory company already?! The height of rudeness!”</i>");
	output("\n\nAh. Well. Hmm.");
	output("\n\n<i>“Nope, nope, unacceptable,”</i> she continues. <i>“" + pc.mf("Mister","Miss") + " Steele, I request that you take your leave and return once your... </i>urge<i> has subsided.”</i> With that, she folds her arms, snootily huffs and turns her head away from you.");
	output("\n\nThat was quite the hair-trigger reaction. After trying and failing to find some words to console her, you say your goodbyes. Jesse lazily points a finger off the side and just says <i>“gooooo”</i> like a spoilt child ordering a maid.");
	output("\n\nGuess you’ll have to come back later!");

	flags["MET_JESSE"] = 0;
//	pc.createStatusEffect("Jesse Bar Cooldown",0,0,0,0,true,"","",false,60*24);
	processTime(10);
	clearMenu();
	addButton(0,"Leave",mainGameMenu);
}

public function approachJesse(back:Boolean = false):void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	if (back) output("<i>“Yeeeah, so what did you want from me next? I’m reeeeally listening, I promise.”</i> she mumbles through her straw. Her fingers lightly tap away on the table as some complex rhythm pops into her head.");
	else if (flags["MET_JESSE"] == 1) {
		output("The lonesome Jesse is idly tapping away at her various devices, sipping bright green soda through a straw. Her nebul-eyes visibly move around when you come into view and it’s still hard to tell what part of you she’s looking at. She waves a small hand as you approach and take a seat, the straw still sitting in between her lips.");
		if (flags["JESSE_TEASE_STATE"] >= 1) output("\n\n<i>“Heeey " + jessePCTitle() + ", I guess you want to... see m-me?”</i> she says with a hard blush.");
		else output("\n\n<i>“Hellooo,”</i> she says with a straw-filled mouth. <i>“I’m just doing boring rubbish. I-I’m listening, honest.”</i>");
		processTime(2);
	}
	else {
		output("You figure that the reactionary little madam has surely calmed down by now. Things were going so well!");
		if (silly) output(" Maybe it was your bad breath and palpable aura of insanity...");
		output("\n\nYou approach her a little more cautiously, a confident smile on your face. She’s still engrossed in her various tablets and datapads, humming a melody you don’t recognise. <i>“Mmm, mm mm mm mm mm mmmm, I am so happy now, mm mmm a little boooooneeeer.”</i>");
		output("\n\nHuh.");
		output("\n\nJesse apparently spots you out of the corner of her eye, although you still can’t quite tell if she was actually eying you the entire time. With a meticulous procedure, she packs away her earphones. Putting on airs, she straightens herself and rests her folded arms neatly on the table.");
		output("\n\nTaking the somewhat frosty hint to sit down, you slide into the chair opposite, getting your [pc.legs] comfortable. You mimic her pose, hoping to wordlessly tease her about her haughty mood.");
		output("\n\n<i>“Soooo... I’m going to apologize for both being... v-very rude and also accusing you of rudeness, " + jessePCTitle() + ". Genuinely, I am usually of a m-much better temperament and um... was in the wrong to suggest what I suggested about your noble self,”</i> she says uneasily, her gaze conspicuously looking this way and that while she anxiously pulls on her sleeves.");
		if (pc.isNice()) output("\n\n<i>“It’s perfectly fine, Jesse. Maybe I was a little too forward myself,”</i> you try to assure her, lightly smiling.");
		else if (pc.isMischievous()) output("\n\n<i>“Well, no harm done,”</i> you smile at her, a cheeky wink added at the end.");
		else output("\n\n<i>“I’ll let it slide,”</i> you shrug, leaning back in the chair.");
		output("\n\n<i>“Oh thank goodness, thank bloody goodness,”</i> she sighs in relief, clasping her hands to her sternum. <i>“I could not bear being such a, well, you know.”</i>");
		output("\n\nShe leans in closer.");
		output("\n\n<i>“Such a total b-bitch to my idol,”</i> she forces out, covering her mouth afterwards.");
		output("\n\nIdol? You raise an eyebrow.");
		output("\n\n<i>“O-oh, oh I didn’t mean that to come out, I’ll uh, hmm,”</i> she stammers, pressing her chin to her chest and covering her mouth again with both hands.");
		output("\n\nYou tell her not to worry, that all is forgiven. She visibly relaxes her shoulders as you say so.");
		output("\n\n<i>“Phew. My boss would have had a right old time of it, telling me how I ruined all our future deals with Steele Tech and blah blah. Losing my cool as soon as the trade deals slow down, just typical... speaking of which, you don’t mind if I do some work in the background? I-I’m all ears, honest,”</i> she replies, her face aimed at yours.");
		flags["MET_JESSE"] = 1;
		processTime(10);
	}
/*
[Appearance] [Talk] [Tease]* [Sex]** [Leave]

*Available after PC has done [Talk] > [Prude]. Greyed out/unavailable after second scene.
**Available after PC has done all talk scenes and the two [Tease] scenes.
*/
	clearMenu();
	addButton(0, "Appearance", jesseAppearance, undefined, "Appearance", "She’s pretty cute, right? That’s just, like, my opinion, man.");
	addButton(1, "Talk", jesseTalkMenu, undefined, "Talk", "Get to know Jesse.");
	addButton(2, "Tease", mainGameMenu, undefined, "Tease", "Break her out of her shell, you filthy opportunist.");
	addButton(3, "Sex", mainGameMenu, undefined, "Sex", "Get at that eager booty!");
	addButton(14, "Leave", mainGameMenu);
}

public function jesseAppearance():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("Jesse is a 20-something year old human. She just about scrapes 5’3’’ in height, generally shorter than the other inhabitants of Canadia station.");
	output("\n\nCurrently, she’s sitting comfortably with her laptop and datapads in front of her. A few tall glasses of soda dot her table, all at varying degrees of fullness. She’s fairly immersed in what she’s doing: Earphones and the bluish glare of the screens her hold her attention.");
	output("\n\nJesse is almost certainly female... you think. She acts and looks the part, but her voice is somewhat huskier than you’d expect from someone so short. Her shoulders are a little broad for a female human, and her hips and legs appear to be spaced slightly further apart than the average as well. Looking closer, you can see that certain parts of her bone structure are a little unusual too.");
	output("\n\nHer visibly smooth, Terran skin is a pure, snow white. There doesn’t appear to be a single blemish or mark on it, not even a bluish vein. Her face is adorably feminine if slightly angular, much like a lithe elf or another fantastical higher being of Olde Earth legends. A pointed, fleshy tongue very occasionally slips out of her bare lips to lap up some soda. You’d say it was about 7’’ long. Her hair is a deep, rich wine-red and impeccably well kept: shoulder length, wavy and with a straight fringe that rests an inch above her thin eyebrows. Her hands and nails are similarly well-kept. Expertly applied, black eyeshadow emphasises her eyes. Speaking of...");
	output("\n\nJesse’s eyes are curious things. They seem to lack pupils until you really focus on their centers. They’re two orbs of a black and red blend, dotted with what seem to be miniscule, pale-red lights. They almost look like miniature star systems! You can never quite tell what she’s looking at.");
	output("\n\nRight above her eyebrows are two flesh-red, tattoo-like markings that vaguely mimic the shape of her eyes. They animate accordingly when she makes a movement with the respective eyelid.");
	output("\n\nJesse’s wearing a fashionable ensemble of an outfit. She has a white, long sleeved blouse that fits smartly and loosely round her arms. It covers her petite chest in translucent, silken material. A mini cravatte rests loosely round the collar. Below her midriff is a short black skirt that is also a little loose, thus allowing her lithe legs to move and swing freely. She has a set of grey, knee-length socks and black pumps with 2’’ heels on her dainty feet.");
	if (flags["JESSE_TEASE_STATE"] >= 1) output("\n\nUnderneath her shirt is a no-nonsense white bra that accentuates her small B-cup bust. Her skirt hides a white pair of short, skintight boxers, making her hidden fem-bulge very apparent if anyone should get a peak. Her slender member is just as oddly proportioned because, at 10’’, she is quite long in that regard. It’s a dick meant for grippin’, not dippin’! Her proportionate bubble butt fits very snugly in her underwear.");
	if (flags["JESSE_HAD_SEX"] != undefined) {
		output("\n\nWhat she hides further under her clothes is another story.");
		output("\n\nHer body is quite skinny overall, arms and legs in particular lacking in muscle tone and body fat. Aside a good few proportionate and cute curves in the right places, she certainly gives the impression of someone under a rather barebones diet. All soda diet...?");
		output("\n\nHer skin follows in the pure white trend aside from some tattoo designs down the back of her lithe legs. Said designs are long, thin red stripes that mimic the seams of pantyhose.");
		output("\n\nHer natural bust complements her cushiony bubble butt and cute hips to the point where, overall, she has a bit of an Olde Earth pinup look.");
	}

	clearMenu();
	addButton(0,"Next",approachJesse,true);
}

public function jesseTalkMenu(doOut:Boolean = true):void
{
	author("SoAndSo");
	showJesse();

	if (doOut) {
		clearOutput();
		output("You tell her you’d like to talk with her, get to know her some more.");
		output("\n\n<i>“O-oh, yes yes, sure,”</i> she flusters, removing her earphones. <i>“Sooo, what would you like to know, " + jessePCTitle() + "?”</i>");
	}
/*
[Her] [Interests] [Work] [Prude]* [Body?]**

*Available after going through [Her], [Interests], [Work] and read Codex Entry: Assistant under Fiction.

**Available after the two [Tease] scenes.

((All scenes repeatable except [Prude] and [Body?]))
*/
	clearMenu();
	addButton(0, "Her", jesseTalkHer, undefined, "Her", "Good starting point.");
	addButton(1, "Interests", jesseTalkInterests, undefined, "Interests", "Maybe she likes cat videos too?");
	if (silly) addButton(2, "Work", jesseTalkWork, undefined, "Work", "Work work, yes milord, okidoki, SMorc.");
	else addButton(2, "Work", jesseTalkWork, undefined, "Work", "What does she do with this hardware?");
	
	if (flags["JESSE_TALK_PRUDE"] != undefined) addDisabledButton(3, "Prude", "Prude", "You don’t think it would be a good idea to bring this up again.");
	else if (CodexManager.entryUnlocked("Assistant") && !CodexManager.entryViewed("Assistant")) addDisabledButton(3, "Prude", "Prude", "You should really check out the film she mentioned.");
	else if (flags["JESSE_TALK_HER"] != undefined && flags["JESSE_TALK_INTERESTS"] != undefined && flags["JESSE_TALK_WORK"] != undefined && CodexManager.entryViewed("Assistant")) addButton(3, "Prude", jesseTalkPrude, undefined, "Prude", "She’s up for it but also not up for it.");
	else addDisabledButton(3, "Prude", "Prude", "You don’t know her well enough to talk about this yet.");
	
	if (flags["JESSE_TALK_BODY"] != undefined) addDisabledButton(4, "Body?", "Body?", "You don’t think it would be a good idea to bring this up again.");
//	else if (Available after the two [Tease] scenes) addDisabledButton(4, "Body?", "Body?", "You don’t know her well enough to talk about this yet.");
	else addButton(4, "Body?", jesseTalkBody, undefined, "Body?", "She’s hiding something about it.");
	
	addButton(14, "Back", approachJesse, true);
}

public function jesseTalkHer():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("You’re curious to know more about the unusual little lady: family, history, anything.");
	output("\n\nJesse straightens herself up, putting her hands on her knees under the table.");
	output("\n\n<i>“Ah, soooo... back on Earth, Lyon-Bowner is a name I don’t think many would be familiar with but in certain circles, it means things. In all honesty, I’m not quite in the position to tell anyone. Many, many, many skeletons in many closets, that sort of thing,”</i> she starts with a bit of apprehension.");
	output("\n\n<i>“Fortunately, I am not them and they are not me. I-I’d actually prefer not to talk of family, or our history”</i> she sighs, a palpable sense of shame coming through her voice. You don’t press her for more info on that subject.");
	output("\n\n<i>“I can talk about me though, of course.”</i>");
	output("\n\nShe nervously laughs off her story, regaining that prim and proper posture of hers. <i>“I guess I should start at after I left university. A bit of a breeze, all things considered. Father payed for it all, I did very well and naturally he was happy as bees,”</i> she casually explains, taking a quick slurp through a straw on her soda. <i>“Mm, that’s the stuff. So anyway, landed a very comfortable position early on, essentially this, but as an assistant. I-I might not seem it but I’m capable at what I do.”</i>");
	output("\n\nYou internally wonder if that’s believable considering how reactionary she seemed not so long ago. You let her continue regardless.");
	output("\n\n<i>“Really, this career is entirely greed on my part. I don’t mind the travelling but between meetings and ennui, I really only have myself at the end of it,”</i> she sighs, looking as if a weight was thrown off of her chest.");
	if (pc.isNice()) output("\n\n<i>“You seemed tense, everything ok?”</i> you ask, sincerity carrying your voice.");
	else if (pc.isMischievous()) output("\n\n<i>“Huh, I mean I would ask <i>buuuuut</i>....”</i> you begin, wary of how she reacted about the topic last time.");
	else output("\n\n<i>“I tried to step in before, and...”</i> You shrug, eyes wandering off into a corner somewhere.");
	output("\n\n<i>“Yeeeah, yeah... don’t worry about that, I’ve just had to be on my guard as it were,”</i> Jesse says, bending forward so that she’s talking out of earshot. She beckons you to do the same with a finger.");
	output("\n\n<i>“A-alot of the people in space seem a bit... rapey,”</i> she whispers, her stardust eyes darting all over the place.");
	output("\n\nCertainly forward and definitely eager in your experience but ‘rapey’? That seems an extreme reaction.");
	output("\n\n<i>“I-I just don’t run into as many people in the corporate world. I think I’ve been felt up twelve times on Tavros when I was there, it’s creepy! And that touchy police officer... gives me the shivers,”</i> she whispers again, anxious to get it out in the open.");
	if (flags["MET_RIYA"] != undefined) output(" You’re confident you know which touchy police officer she’s talking about...");
	output("\n\nYou assure her that most people tend to be normal and not secret rapists specifically out for her womanhood.");
	output("\n\n<i>“I knooow, I knooow, I just want to avoid all the attention. Even work can be a hazard sometimes, I’m just...”</i>");
	output("\n\nShe trails off, closing her eyes. The markings on her forehead mimic her eyelids.");
	output("\n\n<i>“Mind if we talk about something else?”</i>");
	output("\n\nYou nod, sensing that it’s a closed-off subject.");

	flags["JESSE_TALK_HER"] = 1;
	processTime(10);
	jesseTalkMenu(false);
	addDisabledButton(0, "Her","Her","You just talked about that.");
}

public function jesseTalkInterests():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("You ask her about what she likes, noting that it can’t all be work and dogs on the extranet.");
	output("\n\n<i>“Ahh, I guess I haven’t really painted a very good image of myself. A while back, I really heavily delved into the history of Earth on the extranet. Somehoooow, probably on a red-wine night, I found loads of old media from the 20th and 21st centuries. The earliest known stuff! It’s so different from what we have today, I can’t even express it...”</i>");
	output("\n\nJesse trails off somewhat, a look of awe creeping over her face as she describes all the interesting pieces of history she found.");
	output("\n\n<i>“I think the music is the most fascinating. It’s all so simplistic yet really authentic! I could talk about it for hours, really,”</i> she continues, her expressions becoming more and more animated. It’s all kind of cute.");
	output("\n\n<i>“Oh and films, the films! Imagine only having to view them in 2D, the flattest image you can think of! I had to really try hard not to get dizzy from watching them,”</i> she giggles, sinking into her seat a little.");
	output("\n\nStaying on point, you ask her what her favourite pieces of music and film are.");
	output("\n\n<i>“Ah, music’s easy. They had something all the way back then called ‘classical score’: big, huge sounding stuff. Loads of hands and brains working together to make a big wall of just... </i>sounds<i> and color! I... I need a second.”</i>");
	output("\n\nShe slumps even further down, apparently has worked herself up by merely <i>thinking</i> about the music. Intrigued, you ask if she has any you can listen to. With a wide-eyed grin, Jesse hurriedly pulls out her earphones once more and hands them to you. Putting one to each [pc.ear], it takes a few seconds to adjust to their ‘one size fits all barely’ shapes. Nothing plays at first but a creeping, drawn out series of notes fades into your ears.");
	output("\n\nWhat happens next is a bit of a blur.");
	output("\n\nIt seems to push and pull into so many different states of being, from crushing dissonance to bittersweet melodies. Some sort of stringed instrument plays a passionate solo piece, one that flows into a quiet, solemn plea to some ancient deity... and then, an angelic rapture opens up, closing the ensemble of chaos. It’s difficult to say what exactly just happened!");
	if (pc.isNice()) {
		output("\n\n<i>“It’s definitely... </i>new<i> to me. Or would that be old?”</i> You say, half joking.");
		output("\n\nJesse beams back at you, pleased that it made you feel something.");
	}
	else if (pc.isMischievous()) {
		output("\n\n<i>“Did I just die and reincarnate again?!”</i> You joke, laughing at the whole affair.");
		output("\n\nJesse giggles, apparently happy that you’re happy.");
	}
	else {
		output("\n\n<i>“What in the universe was that?!”</i> You say, bewildered.");
		if (silly) output("\n\n<i>“Such effrontery to decency and good taste...”</i>");
		output("\n\nJesse smiles, covering her mouth with her hand to stifle a giggle.");
	}
	output("\n\n<i>“It’s madness, isn’t it? I love it, it completely takes me over,”</i> she sighs adoringly, palms on her sternum again.");
	output("\n\nWhat about those old Earth films? You ask her favourite.");
	output("\n\n<i>“O-oh, well there’s a ‘classic’, as they say. I-I think it is anyway,”</i> she stammers, blushing somewhat. Is it something embarrassing? You prepare yourself to be indignantly dismissed again.");
	output("\n\n<i>“I-it’s called Assistant and it’s about a... personal assistant. I-it’s a kind of funny drama and there’s... a nice ending and... yeah,”</i> she says slowly, definitely implying that it’s something embarrassing.");
	output("\n\nNarrowing your eyes, you probe her again: What does she like about the film?");
	output("\n\n<i>“J-just the characters and what they do,”</i> she half whispers, looking this way and that way while fidgeting with her hair. She’s really trying to dodge the subject. <i>“I-I can send you a synopsis if you’d like it...”</i>");
	output("\n\nHow about the whole thing? You suggest, seeing how far she’ll go.");
	output("\n\nShe timidly taps on the device but an alert beeps out from it.");
	output("\n\n<i>“Ohh... apparently there’s a security lock on the data signature. I-I don’t think I can...”</i>");
	output("\n\nNot to worry, you say. Accessing your Codex, you do a quick extranet search for the title in question. A notification pops up telling you that all available information on it has been stored to your Codex.");
	output("\n\nYou tell her you’ll give it a thorough looking over.");
	output("\n\n<i>“H-how did yo- what is... huh?”</i> she tries to say, perplexed by your Codex.");
	output("\n\nYou tell her it’s ");
	if (silly) output("the wonders of based technomagic");
	else output("a Steele secret");
	output(". Jesse seems visibly enchanted by it all.");
	output("\n\n<i>“I can only imagine if I had one of those for work...”</i>");
	output("\n\n<b>(‘Assistant’ Codex entry unlocked!)</b>");

	CodexManager.unlockEntry("Assistant");
	flags["JESSE_TALK_INTERESTS"] = 1;
	processTime(10);
	jesseTalkMenu(false);
	addDisabledButton(1, "Interests","Interests","You just talked about that.");
}

public function jesseTalkWork():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("You ask her what work is actually like.");
	output("\n\n<i>“Ohh, nothing as exciting as your thing. Starts with a briefing by my boss and the other people on the team, then we meet with reps or act as reps for the companies in question. I take the  minutes and talk about the relevant data while someone else negotiates alongside. Each deal is different but we’re usually successful,”</i> states the prideful Jesse, resting her elbows on the table.");
	output("\n\n<i>“Deals need neutrality on my part. I generally have to just be pleasant and accommodating. Sometimes, there’s a few hiccups and the deals need to be worked out privately. O-often I step in for one-on-ones or group deals that require uh... delicate persuasion.”</i>");
	output("\n\nShe visibly bites her lower lip, eyes wandering off into some corner of the room. Hmm...");
	output("\n\n<i>“A-and often these deals can be quite grueling to figure out, with so many different needs to be met. I-It’s somewhat tough being in a more male-oriented environment but I’m always congratulated on my um, ability a-and attentiveness,”</i> Jesse quickly blurts out, apparently struggling to word it right. She shuffles around on her seat and her eyes appear to widen.");
	if (pc.isNice()) output("\n\n<i>“Something the matter, Jesse?”</i> you ask cooly, resting your head on your hands. She’s definitely hiding something.");
	else if (pc.isMischievous()) output("\n\n<i>“My my, someone seems frisky,”</i> you verbally prod, a smirk on your face.");
	else output("\n\n<i>“Tell me what’s wrong,”</i> you say sternly, your gaze focused on her eyes. Even though you can’t quite see the pupils, you sense she’s looking straight back at you.");
	output("\n\n<i>“Nothing’s wrong, honest,”</i> she blurts out, her body visibly tensing up. She’s clearly lying about it, certainly the most dishonest thing she could do.");
	if (pc.isNice()) output("\n\n<i>“Are you sure? I’d be fine if something were,”</i> you say with a smile, playing it calmly. She seems less agitated and more ‘excited’ by your questioning.");
	else if (pc.isMischievous()) output("\n\n<i>“So what, you enjoy lying to me?”</i> you prod further, half joking but still keeping your eyes focused on her.");
	else output("\n\n<i>“I get the impression that something is,”</i> you say with firmness, tilting your head to the side with a furrowed brow.");
	output("\n\n<i>“Not, n-no, I-I’d never lie to [pc.name] Steele, my idol and a-all round nice person,”</i> she says with an almost quivering voice. Something akin to a smile forms on her face but her lips waver around as you continue to look at her, her knees and thighs rubbing together under the table. She seems to be enjoying your accusatory tones...");
	output("\n\n<i>“C-c-can we talk about something else? Please?”</i>");
	output("\n\nYou drop the probing... for now.");

	flags["JESSE_TALK_WORK"] = 1;
	processTime(10);
	jesseTalkMenu(false);
	addDisabledButton(2, "Work","Work","You just talked about that.");
}

public function jesseTalkPrude():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("Having spent time with her and facing the somewhat confusing reactions she has to almost anything you talk to her about, now’s the time to actually get some answers from her. Plus, her signals to you have been just as confused...");
	if (pc.isNice()) output("\n\n<i>“I think I need to ask something,”</i> you begin, leaning forward on the table a little.");
	else if (pc.isMischievous()) output("\n\n<i>“You know, you’re a very confusing person,”</i> you start, a cheeky grin on your face.");
	else output("\n\n<i>“Jesse, I need to be blunt with you,”</i> you begin, acting like a tired board director.");
	output("\n\nShe timidly raises a hand. <i>“I-if it’s okay, may I get a drink?”</i>");
	output("\n\nYou nod and she swiftly gets up and walks to the bar. Her movements are a little stiff but perhaps that’s to be expected. You see that her skirt is slightly shorter at the back than it is the front. Her skinny legs also have strange, red lines right up their middles, a similar shade to the markings on her forehead.");
	output("\n\nYou muse over your Codex for a few seconds, reminding yourself of what that Olde Earth film was about.");
	output("\n\nShe’s back in no time however, a blue liquid in a thin glass in her dainty fingers. In a slightly awkward manner, she slides onto the soft leather chair. Without much hesitation, she takes a big glug of the blue drink, downing a third of it.");
	output("\n\n<i>“</i>Ach<i> this thing always burns. I must apologize, " + jessePCTitle() + ". I have to calm myself, I’ve got all these jitters going through me,”</i> she says, holding out her hands. They seem to be slightly twitchy, as if she was frightened of this whole prospect.");
	output("\n\nYou empathise, although still curious as to how quickly she emotionally ramps up. You ask once again if there’s something she’s not telling you.");
	output("\n\nShe shuffles a little in her seat, looking down to the floor.");
	output("\n\n<i>“S-so... uh, I’m fairly certain the only reason I still have a job is because I do favours. For favours. Y-You know what I mean,”</i> she says, a heavy note of shame coming through.");
	output("\n\nOh you <i>know</i> alright but you want her to admit it. You tell her that she should be open with what she means.");
	output("\n\n<i>“FINE, fine. What I do is,”</i> she says, leaning in closer to you. <i>“I </i>bend<i> over and let faceless corporate suits have their way with me, alright?! And I </i>love<i> it! I bloody... love it...”</i>");
	output("\n\nShe’s really trying to keep her voice down but the boiling frustration still comes through.");
	output("\n\nJesse then sinks back into her chair, defeated by her own admission. There’s a bit of a silence after, punctuated with Jesse meekly sipping her drink.");
	if (pc.isNice()) output("\n\n<i>“But why hide it? I’d have understood,”</i> you ask, trying to comfort her.");
	else if (pc.isMischievous()) output("\n\n<i>“Aw, Jesse. It’s nothing to be that ashamed of,”</i> you say lightheartedly.");
	else output("\n\n<i>“There’s honestly worse things to have admitted, Jesse,”</i> you say with a shake of your head.");
	output("\n\n<i>“I knooow, I’ve heard it, I’ve heard it. But it’s you! [pc.name] Steele! I’ve been following you for so long! H-How could I say something like that, just show myself up as some degenerate...”</i>");
	output("\n\nYou say it wouldn’t have mattered, that you’d still talk to her anyway. Especially given your reputation for ");
	if (silly) output("galactic genital jousting");
	else output("wild sexual speculation");
	output(", it’s surprising she felt that way about it all.");
	output("\n\n<i>“Really? Damnit... working myself up for nothing. I-I even thought to leave the station if you ever found out, now I...”</i> she stammers, staring at the floor.");
	output("\n\nLet’s start this over, you suggest. Jesse nods in turn.");
	output("\n\n<i>“Alright,”</i> she says to herself, inhaling deeply to prepare herself.");
	output("\n\n<i>“My name is Jesse Lyon-Bowner and I am into you...?”</i> she says, her white cheeks flushing red.");
	if (pc.isNice()) output("\n\n<i>“Well I’m Captain [pc.name] Steele and I’m into <i>you</i>,”</i> you say back, cool and deliberate.");
	else if (pc.isMischievous()) output("\n\nWith a chuckle, you say: <i>“I’m Captain [pc.name] Steele and I want to be <i>inside</i> you.”</i> Possibly the most ridiculous thing you’ve said so far.");
	else output("\n\n<i>“Well I’m Captain [pc.name] Steele, heir to Steele Tech, saviour of wenches and I’m imagining you bent over a desk,”</i> you assert, trying to put her in a spot.");
	output("\n\nHer eyes widen, orbs of stars and stardust blazing in your direction. Seemingly out of reflex, Jesse pushes her hands down her front so they rest in between her legs.");
	output("\n\n<i>“I-I gotta go!”</i> she blurts out, quickly gathering her things up. In no time at all, she’s hurrying off towards the guest rooms.");
	output("\n\nHuh. Hm. Right. Guess you’ll have to check on her later!");

	pc.createStatusEffect("Jesse Bar Cooldown",0,0,0,0,true,"","",false,60*24);
	flags["JESSE_TALK_PRUDE"] = 1;
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function jesseTalkBody():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("You tell her that, having rooted around in her nethers, she should tell you about the rest of her body is like.");
	output("\n\n<i>“Ahh. Well, hmm,”</i> she begins, stumbling over what to start with.");
	output("\n\n<i>“I guess the easiest thing to start with is this stuff,”</i> she explains, pointing to the eye shaped marks on her forehead. <i>“Still can’t tell you about my family but even so, they acquired something </i>very<i> interesting: It’s a sort of tattoo ink that umm, mimics certain pre-programmed patterns. I got these for free but... they needed to ‘test it more.’”</i>");
	output("\n\nShe purses her mouth, inhaling a deep breath through her nose.");
	output("\n\n<i>“Thus, other parts of my skin were tested on. It’s not painful or anything but it is a part of me now.”</i>");
	output("\n\nYou ask her if she’s willing to go into detail. Jesse nervously scratches the side of her face. <i>“M-Maybe if we’re somewhere more private,”</i> she half-whispers, leaning a little closer over the table. You agree, although you think that you both did a fine job keeping on the down low when you forced her to cream herself twice.");
	output("\n\nWhat about her eyes?");
	output("\n\n<i>“Oh, so that was actually something I could track. Not sure how it happened, only what happened. One of the mods blasted apart and remolded my sclera and it all spread around like tiny, flashy stars,”</i> she explains, fluttering her orbs in your direction.");

	processTime(5);
	clearMenu();
	addButton(0,"Male Parts",jesseTalkMaleParts);
}

public function jesseTalkMaleParts():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("Here’s the bigger question: Why does she have a sizable femcock instead of the usual?");
	output("\n\nTaking another breath through her nose, she fidgets with the cuff of her blouse. <i>“I-It’s something that sort of... happened, I suppose. I was young, had money, had connections. Most of those connections had other connections to mod suppliers and mod synthesizers. N-nothing insane, mind you,”</i> says the slightly distracted wench.");
	output("\n\n<i>“I don’t know. I just tried a bunch of them in the space of a few weeks. All that morphing and mutating had an effect. Or several, rather. So, I lost a </i>lot<i> of hair follicles. Except on my head, for whatever reason. My skin became this lovely shade of white as well, although I have fashion troubles with coordinating bright colors,”</i> she explains, pulling at the hem of her black skirt.");
	output("\n\nShe pulls back her left sleeve, showing a skinny wrist and forearm. <i>“I kind of wanted a bit of body tone. Just a little bit. I must’ve misread what the mod did, whichever mod it was, because it kind of had sort of the opposite effect...”</i> she sighs, rolling her sleeve back up. <i>“At least I’m not bones and splinters. Did make my derriere a little more delectable, however,”</i> she grins, winking in your direction.");
	output("\n\n<i>“And then, at the end of that delirious week of bodily pain, I wake up and I feel different. Just, completely different. I can’t quite say what it felt like but instead of my normal, usually present uhm,”</i> she leans in again.");
	output("\n\n<i>“</i>Lady parts<i>,”</i> she whispers, putting a finger over her mouth. She pauses for a moment. <i>“I-I shouldn’t be so embarrassed about it all, I’m </i>meant<i> to be a grown woman.”</i> Then she continues on her original topic. <i>“Then I wake up with this stupid snake </i>thing<i>, hard as a... calculus problem.”</i>");
	output("\n\nCertainly must have been a shock. You ask her what it’s like having the surprise of a genital swap.");
	output("\n\n<i>“A-actually kind of... interesting,”</i> she stutters, her star-dotted eyes flitting this way and that.<i>“I really missed v-vaginal sex”</i> *<b>ahem</b>* <i>“so I had to compensate. And now my </i>behind<i> is comfortably adapted.”</i>");
	output("\n\nHer face forms a contented grin, apparently happy that she kept her language up to a formal standard.");
	if (pc.isNice()) {
		output("\n\n<i>“So </i>anal<i> must be that much more enjoyable, hm?”</i> you ask her, matching her smile. Gotta prod her once in awhile at least.");
		if (silly) output(" Maybe even literally, AHOHO.");
	}
	else if (pc.isMischievous()) output("\n\n<i>“Is that your way of saying you’ve got a special butthole?”</i> You smirk, trying not to laugh.");
	else output("\n\n<i>“What an amazing way of saying you’d enjoy a [pc.race] shaft in that cute butt of yours,”</i> you say, raising an eyebrow at her.");
	output("\n\nImmediately, her eyelids clench and her face flushes once again. She’s still smiling, however.");
	output("\n\n<i>“Y-yes... yes! I really shouldn’t beat myself up about it,”</i> she exclaims, having a mini-moment of epiphany.");
	output("\n\n<i>“I-I love. Mmm.... big... veiny... throbby... dicks. There, I said it!”</i>");
	output("\n\nIt takes a fair bit of effort for the eager strumpet to get those words out, but Jesse sighs in relief as she finishes. ");
	output("\n\nWell, if she’s up for proving that claim...");

	flags["JESSE_TALK_BODY"] = 1;
	processTime(15);
	clearMenu();
	addButton(0,"Next",approachJesse,true);
}