/* 
 * Jesse Lyon-Bowner
 * By SoAndSo
 * https://docs.google.com/document/d/1lb9_5TKXai3emUyDMx18rIcNnbSMOe9NHRbB9uFSs1s/edit#
 * 
 * MET_JESSE			undefined = hasnt meet her, 0 = pc left when she got angry, 1 = give access to her menu
 * JESSE_PC_TITLE		0 = pc.name, 1 = Mister/Miss Steele
 * JESSE_PC_TITLE_SEX	0 = pc.name, 1 = Mister/Miss Steele, 2 = Sir/Madam
 * JESSE_TEASE_STATE	0 = hasnt accesses the tease scenes, 1 = first scene played, 2 = second scene played
 * JESSE_TALK_HER		1 = Talked about Jesse
 * JESSE_TALK_INTERESTS	1 = Talked about her interests
 * JESSE_TALK_WORK		1 = Talked about her work
 * JESSE_TALK_PRUDE		1 = Talked about her prudeness
 * JESSE_TALK_BODY		1 = Talked about her body
 * JESSE_TIMES_SEXED	times the PC accessed the sex menu/had sex
 * JESSE_TIMES_RP		times the PC had the roleplay sex scene with jesse
 * JESSE_TIMES_COWGIRL	times the PC had the reverse cowgirl sex scene with jesse
 * JESSE_TIMES_FACE		times the PC had the face sex scene with jesse
 * JESSE_TIMES_TRICKS	times the PC had the bag o tricks sex scene with jesse
 * JESSE_TIMES_TRAP		times the PC had the trap fun sex scene with jesse
 * JESSE_TIMES_REVERSAL	times the PC had the role reversal sex scene with jesse
 * 
 * 
*/

/* TO DO:
 * Add a check for cock or hardlight to her sex scene
 * Add size limits to her
 * current max length: 18"
*/

public function showJesse(nude:Boolean = false):void
{
	if(nude) showBust("JESSE_NUDE");
	else showBust("JESSE");
	showName("\nJESSE");
}

public function jessePCTitle(lowercase:Boolean = false):String
{
	if (flags["JESSE_PC_TITLE"] == 1) return pc.mf("Mister","Miss") +" Steele";
	else return "[pc.name]";
}

public function jessePCTitleSex(lowercase:Boolean = false):String
{
	if (flags["JESSE_PC_TITLE_SEX"] == 1) return pc.mf("Mister","Miss") +" Steele";
	else if (flags["JESSE_PC_TITLE_SEX"] == 2) return pc.mf("Sir","Madam");
	else return "[pc.name]";
}

public function getJessePregContainer():PregnancyPlaceholder
{
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.createPerk("Fixed CumQ",700,0,0,0);
	return pp;
}

// shameless copied from fisianna
public function largestCockIndexThatFitsJessesAss():int
{
	var i:int;
	var maxFitIndex:int = -1;
	var maxFitVol:Number = 0;
	for (i = 0; i < pc.cocks.length; i++)
	{
		if (pc.cocks[i].cLength() <= 18 && pc.cocks[i].thickness() <= 6 && pc.cockVolume(i, false) > maxFitVol)
		{
			maxFitIndex = i;
			maxFitVol = pc.cockVolume(i, false);
		}
	}
	
	return maxFitIndex;
}

public function jesseBarBonus(button:int):void
{
	if (flags["MET_JESSE"] == undefined) 
	{
		output("\n\nThere’s a petite humanoid surrounded by empty glasses and gadgets. She seems rather bored, perhaps you wanna speak to her...?");
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
	output("\n\nSauntering over to her little den, you get a quick look at her. She’s pretty short, at most 5\' 3\" and the tips of her shoes just about touch the floor. Her hair is a very rich shade of wine red and admirably well-kept. She has peculiar eye-shaped markings above her eyebrows. Her clothing style is smart-casual: classy but all purpose. A straw leading to a thin glass full of soda sits idly between her lips and small earphones play unfamiliar music that drifts around her. You can’t quite tell if she’s looking at you because her eyes... seem to be made of stardust.");
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
	output("\n\n<i>“Steele. [pc.name] Steele, general galactic gallivanter and heir to Steele Tech,”</i> you say with a certain smugness, looking to impress.");
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
		flags["JESSE_PC_TITLE"] = 0;
	}
	output("\n\nNow that introductions are out of the way, she shuffles a little in her seat and takes an attentive posture. <i>“S-sooo, um... hm. What exactly do you... do?”</i> The curious young woman asks you. The thing is, you sense that she already knows something, considering her foreknowledge of you.");
	output("\n\nYou explain your earlier work as a [pc.startingCareer], relaying your exploits in the field, as well as the knowledge and experience you’ve earned from it. She’s quite quickly enthralled, showing a certain inexperience herself. <i>“Wait, you use weapons? As in, actual boom-kapow-vwom-vwom weapons?”</i> she says enthusiastically, shooting a fake gun with her clasped hands.");
	output("\n\nYou hold up your [pc.weapon] at a meter’s distance from her, explaining its design and demonstrating how easy it is for you to use. Her mouth forms an awe-driven ‘O’ shape, although her eyes make it difficult to discern if she’s looking at your piece or you yourself.");
	output("\n\nWhen it gets to your ace space race against your cousin, Jesse interjects.");
	output("\n\n<i>“Ah, oh, I’ve um, been following this pretty closely! Hang on, hang on,”</i> she says in a fluster, tapping with a hand on the dataslate below her.");
	output("\n\n<i>“S-so is it true that you slew a ");
	if (silly) output("violating tentacle monster");
	else output("Kornakanori dragon");
	output(" with just that [pc.weapon] and a broken umbrella?!”</i>");
	output("\n\nYou let her down gently.");
	output("\n\n<i>“Aw... that damned fool really was making it up,”</i> she says busily, tapping away on her device again. Her lips purse and pull in a cutesy manner as she argues on the extranet. The little lady asks you several similar questions, most of which are completely fabricated rumours.");
	output("\n\nYou ask her what she’s here for, she’s said what she does but not what she’s doing.");
	output("\n\nSnapping back to reality, Jesse looks up from the glowing device on the table. <i>“Ah, let me explain. Ordinarily, I would visit the premises of a client or clients and then our trade talks would take place. Buuut... space is, um,”</i> she pauses, trying to choose her phrasing. <i>“It’s much bigger than Earth, </i>soooooooo<i> I use stations as resting places. Currently, there’s a long running deal with varying levels of importance that’s being carried out on Vesperia. It’s years in the making and it might even take years to finish. However, the added neutrality of Canadia station helps <i>smooth</i> things over very gently.”</i>");
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
	pc.createStatusEffect("Jesse Bar Cooldown",0,0,0,0,true,"","",false,60*24);
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

	clearMenu();
	addButton(0, "Appearance", jesseAppearance, undefined, "Appearance", "She’s pretty cute, right? That’s just, like, my opinion, man.");
	addButton(1, "Talk", jesseTalkMenu, undefined, "Talk", "Get to know Jesse.");
	if (flags["JESSE_TEASE_STATE"] == 2) addDisabledButton(2, "Tease", "Tease", "You already got her right where you want her.");
	else if (flags["JESSE_TEASE_STATE"] == 1) addButton(2, "Tease", jesseSecondTeaseI, undefined, "Tease", "Break her out of her shell, you filthy opportunist.");
	else if (flags["JESSE_TALK_PRUDE"] == 1) addButton(2, "Tease", jesseFirstTeaseI, undefined, "Tease", "Break her out of her shell, you filthy opportunist.");
	else addDisabledButton(2, "Locked", "Locked", "You don’t know her well enough to talk about this yet.");
	if (flags["JESSE_TALK_BODY"] == undefined) addDisabledButton(3, "Locked", "Locked", "You don’t know her well enough to talk about this yet.");
	// check if the bagotricks scene needs genitals, otherwise kill this line
	//else if (!pc.hasGenitals() && !pc.hasHardLightEquipped()) addDisabledButton(3, "Sex", "Sex", "You need genitals or a hardlight dildo for this.");
	else if (pc.lust() < 33) addDisabledButton(3, "Sex", "Sex", "You are not aroused enough for this.");
	else addButton(3, "Sex", jesseSexMenu, undefined, "Sex", "Get at that eager booty!");
	addButton(14, "Leave", mainGameMenu);
}

public function jesseAppearance():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("Jesse is a 20-something year old human. She just about scrapes 5\' 3\" in height, generally shorter than the other inhabitants of Canadia station.");
	output("\n\nCurrently, she’s sitting comfortably with her laptop and datapads in front of her. A few tall glasses of soda dot her table, all at varying degrees of fullness. She’s fairly immersed in what she’s doing: Earphones and the bluish glare of the screens her hold her attention.");
	output("\n\nJesse is almost certainly female... you think. She acts and looks the part, but her voice is somewhat huskier than you’d expect from someone so short. Her shoulders are a little broad for a female human, and her hips and legs appear to be spaced slightly further apart than the average as well. Looking closer, you can see that certain parts of her bone structure are a little unusual too.");
	output("\n\nHer visibly smooth, Terran skin is a pure, snow white. There doesn’t appear to be a single blemish or mark on it, not even a bluish vein. Her face is adorably feminine if slightly angular, much like a lithe elf or another fantastical higher being of Olde Earth legends. A pointed, fleshy tongue very occasionally slips out of her bare lips to lap up some soda. You’d say it was about 7\" long. Her hair is a deep, rich wine-red and impeccably well kept: shoulder length, wavy and with a straight fringe that rests an inch above her thin eyebrows. Her hands and nails are similarly well-kept. Expertly applied, black eyeshadow emphasises her eyes. Speaking of...");
	output("\n\nJesse’s eyes are curious things. They seem to lack pupils until you really focus on their centers. They’re two orbs of a black and red blend, dotted with what seem to be miniscule, pale-red lights. They almost look like miniature star systems! You can never quite tell what she’s looking at.");
	output("\n\nRight above her eyebrows are two flesh-red, tattoo-like markings that vaguely mimic the shape of her eyes. They animate accordingly when she makes a movement with the respective eyelid.");
	output("\n\nJesse’s wearing a fashionable ensemble of an outfit. She has a white, long sleeved blouse that fits smartly and loosely round her arms. It covers her petite chest in translucent, silken material. A mini cravatte rests loosely round the collar. Below her midriff is a short black skirt that is also a little loose, thus allowing her lithe legs to move and swing freely. She has a set of grey, knee-length socks and black pumps with 2\" heels on her dainty feet.");
	if (flags["JESSE_TEASE_STATE"] >= 1) output("\n\nUnderneath her shirt is a no-nonsense white bra that accentuates her small B-cup bust. Her skirt hides a white pair of short, skintight boxers, making her hidden fem-bulge very apparent if anyone should get a peak. Her slender member is just as oddly proportioned because, at 10\", she is quite long in that regard. It’s a dick meant for grippin’, not dippin’! Her proportionate bubble butt fits very snugly in her underwear.");
	if (flags["JESSE_TIMES_SEXED"] != undefined) {
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
	if (doOut) {
		clearOutput();
		output("You tell her you’d like to talk with her, get to know her some more.");
		output("\n\n<i>“O-oh, yes yes, sure,”</i> she flusters, removing her earphones. <i>“Sooo, what would you like to know, " + jessePCTitle() + "?”</i>");
	}
	author("SoAndSo");
	showJesse();
	clearMenu();
	addButton(0, "Her", jesseTalkHer, undefined, "Her", "Good starting point.");
	addButton(1, "Interests", jesseTalkInterests, undefined, "Interests", "Maybe she likes cat videos too?");
	if (silly) addButton(2, "Work", jesseTalkWork, undefined, "Work", "Work work, yes milord, okidoki, SMorc.");
	else addButton(2, "Work", jesseTalkWork, undefined, "Work", "What does she do with this hardware?");
	
	if (flags["JESSE_TALK_PRUDE"] != undefined) addDisabledButton(3, "Prude", "Prude", "You don’t think it would be a good idea to bring this up again.");
	else if (CodexManager.entryUnlocked("Assistant") && !CodexManager.entryViewed("Assistant")) addDisabledButton(3, "Prude", "Prude", "You should really check out the film she mentioned.");
	else if (flags["JESSE_TALK_HER"] != undefined && flags["JESSE_TALK_INTERESTS"] != undefined && flags["JESSE_TALK_WORK"] != undefined && CodexManager.entryViewed("Assistant")) addButton(3, "Prude", jesseTalkPrude, undefined, "Prude", "She’s up for it but also not up for it.");
	else addDisabledButton(3, "Locked", "Locked", "You don’t know her well enough to talk about this yet.");
	
	if (flags["JESSE_TALK_BODY"] != undefined) addDisabledButton(4, "Body?", "Body?", "You don’t think it would be a good idea to bring this up again.");
	else if (flags["JESSE_TEASE_STATE"] != 2) addDisabledButton(4, "Locked", "Locked", "You don’t know her well enough to talk about this yet.");
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
	output("\n\nShe nervously laughs off her story, regaining that prim and proper posture of hers. <i>“I guess I should start at after I left university. A bit of a breeze, all things considered. Father paid for it all, I did very well and naturally he was happy as bees,”</i> she casually explains, taking a quick slurp through a straw on her soda. <i>“Mm, that’s the stuff. So anyway, landed a very comfortable position early on, essentially this, but as an assistant. I-I might not seem it but I’m capable at what I do.”</i>");
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
	output("\n\nShe slumps even further down, apparently having worked herself up by merely <i>thinking</i> about the music. Intrigued, you ask if she has any you can listen to. With a wide-eyed grin, Jesse hurriedly pulls out her earphones once more and hands them to you. Putting one to each [pc.ear], it takes a few seconds to adjust to their ‘one size fits all barely’ shapes. Nothing plays at first but a creeping, drawn out series of notes fades into your ears.");
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
	processTime(15);
	jesseTalkMenu(false);
	addDisabledButton(1, "Interests","Interests","You just talked about that.");
}

public function jesseTalkWork():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("You ask her what work is actually like.");
	output("\n\n<i>“Ohh, nothing as exciting as your thing. Starts with a briefing by my boss and the other people on the team, then we meet with reps or act as reps for the companies in question. I take the minutes and talk about the relevant data while someone else negotiates alongside. Each deal is different but we’re usually successful,”</i> states the prideful Jesse, resting her elbows on the table.");
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
	if (pc.isNice()) output("\n\n<i>“Well I’m Captain [pc.name] Steele and I’m into </i>you<i>,”</i> you say back, cool and deliberate.");
	else if (pc.isMischievous()) output("\n\nWith a chuckle, you say: <i>“I’m Captain [pc.name] Steele and I want to be </i>inside<i> you.”</i> Possibly the most ridiculous thing you’ve said so far.");
	else output("\n\n<i>“Well I’m Captain [pc.name] Steele, heir to Steele Tech, saviour of wenches and I’m imagining you bent over a desk,”</i> you assert, trying to put her in a spot.");
	output("\n\nHer eyes widen, orbs of stars and stardust blazing in your direction. Seemingly out of reflex, Jesse pushes her hands down her front so they rest in between her legs.");
	output("\n\n<i>“I-I gotta go!”</i> she blurts out, quickly gathering her things up. In no time at all, she’s hurrying off towards the guest rooms.");
	output("\n\nHuh. Hm. Right. Guess you’ll have to check on her later!");

	pc.createStatusEffect("Jesse Bar Cooldown",0,0,0,0,true,"","",false,60*24);
	flags["JESSE_TALK_PRUDE"] = 1;
	processTime(15);
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
	else output("\n\n<i>“What an amazing way of saying you’d enjoy [pc.aRace] shaft in that cute butt of yours,”</i> you say, raising an eyebrow at her.");
	output("\n\nImmediately, her eyelids clench and her face flushes once again. She’s still smiling, however.");
	output("\n\n<i>“Y-yes... yes! I really shouldn’t beat myself up about it,”</i> she exclaims, having a mini-moment of epiphany.");
	output("\n\n<i>“I-I love. Mmm.... big... veiny... throbby... dicks. There, I said it!”</i>");
	output("\n\nIt takes a fair bit of effort for the eager strumpet to get those words out, but Jesse sighs in relief as she finishes. ");
	output("\n\nWell, if she’s up for proving that claim...");

	flags["JESSE_TALK_BODY"] = 1;
	processTime(10);
	clearMenu();
	addButton(0,"Next",approachJesse,true);
}

public function jesseFirstTeaseI():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("Seeing that she’s calmed down, you decide to have some fun with the prudish girl. You try to grab her attention, waving a hand over her device so that it catches her eye. Jesse looks up and removes her earphones.");
	output("\n\n<i>“N-need something, " + jessePCTitle() + "?”</i>");
	output("\n\nYou give her a ‘come hither’ look, patting the seat beside you. You say you want to know if she’s doing okay after abruptly leaving last time, to which she nods. Cautiously, she slides out her seat and sits herself next to you, her lower lip pulled under her teeth. You’re not close enough to be touching but it’s past the point of just ‘friendly’.");
	output("\n\n<i>“So, Jesse. I read up on Assistant,”</i> you begin, being interrupted by a stammered squeak from the diminutive girl. You ask her if there’s a certain dynamic she sees between you and her. That cute face of hers points to the floor.");
	output("\n\n<i>“I-it’s so cliche but it’s true. Really, dumbly true,”</i> she sighs. <i>“I... want you.”</i>");
	output("\n\nThinking about how to proceed, you wrap your arm behind her back and pull her gently to you, her girlish hip meeting your own [pc.hip]. She doesn’t resist but you see her chest rising high with shallow breaths. You turn your head so that your mouth is right above her pointed ear.");
	output("\n\n<i>“If you really want this, then here are the rules: You do as I say, follow my lead. When we’re having fun, you’ll </i><b>always</b><i> refer to me as...”</i>");

	processTime(3);
	clearMenu();
	addButton(0, pc.mf("Sir","Madam"), jesseFirstTeaseII, 2);
	addButton(1, pc.mf("Mister", "Miss") +" Steele", jesseFirstTeaseII, 1);
	addButton(2, "[pc.name]", jesseFirstTeaseII, 0);
}

public function jesseFirstTeaseII(title:int):void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	if (title == 1) flags["JESSE_PC_TITLE_SEX"] = 1;
	else if (title == 2) flags["JESSE_PC_TITLE_SEX"] = 2;
	else flags["JESSE_PC_TITLE_SEX"] = 0;

	output("<i>“..." + jessePCTitleSex() + " from now on.”</i>");
	output("\n\nShe nods, saying: <i>“yes " + jessePCTitleSex() + "”</i> without hesitation.");
	output("\n\n<i>“And you’ll be referred to as... whatever I feel like,”</i> you add, squeezing her a little closer.");
	output("\n\nYou hear her giggle, although she’s still looking at the ground. <i>“Yes " + jessePCTitleSex() + ",”</i> she half-whispers.");
	output("\n\n<i>“With that being said...”</i> you begin. You tell Jesse to recall a meeting she had between clients, perhaps the one that earned her the most money. You tell her to repeat it out loud.");
	output("\n\nShe inhales through her nose, closes her nebul-eyes and then begins.");
	output("\n\n<i>“There are three parties making a deal. Fifteen people in suits. Mostly human. Each party has security staff. It’s a long, spacious room with several side doors. One side is just a massive window that looks over a city. There’s a lot of money on the table. Literally. Briefcases, suitcases, note stacks...”</i>");
	output("\n\nJesse straightens her posture as she immerses herself in the memory.");
	output("\n\n<i>“There are three CEO’s. A human, a... kaithrit man and a goat-looking woman. They use me as a mediator... laying out promises, parity, fairness of the deal. It’s normal stuff but the room is <i>tense</i>. All eyes are... on me as I speak. Goat-girl is winking at me...”</i>");
	output("\n\nShe squeezes her knees together, pulling the hem of her skirt further down.");
	output("\n\n<i>“I’ve laid it all out. Then, the human CEO says: ‘I think these points need more deliberation’. That’s a cue. I get up, with a smile, show them the door to a side room. Only the three CEO’s follow me in, rest of the room talks about... cigars and things. S-should I go on?”</i>");
	output("\n\n<i>“Of course”</i> you whisper into her ear, stroking her hip with your hand. With a gulp, Jesse continues.");
	output("\n\n<i>“It’s a small, furnished room. The north wall is also a big window, and the city is below. It’s soundproof... I know this because I’ve u-used it before. No one will be the wiser. I close the door behind us, then sit on the empty table,”</i> she inhales sharply as she says ‘table.’");
	output("\n\n<i>“I want it, I want it so bad... the kaithrit turns me on my front and pulls up my s-skirt. They all tell me how cute I look from b-behind... I give them a shake, I w-want it so bad,”</i> she stutters, her voice rising in pitch. You can feel her grinding that cute behind against the leather seat.");
	output("\n\n<i>“They pull down my panties... gently, I-I’m running the deal of course. The kaithrit man g-goes first. His ...d-dick feels so hot and spiny. It’s uncomfortable at first and he’s so slow. I can feel it now!”</i> She whimpers, pushing her palms into her lap again.");
	output("\n\nYou urge her to continue, stroking her hair.");
	output("\n\n<i>“He keeps bottoming out and I-I’m so </i>full<i>! C-can’t feel my legs, only ha... ha...!”</i>");
	output("\n\nShe can barely finish her words before a singular, muted note of orgastic enjoyment escapes from her open mouth. Her small body jerks twice, freeing herself of your hands. Then, she collapses like a ragdoll against your [pc.chest]. Did she just climax...?!");
	output("\n\n<i>“I coul-... I couldn’t finish...”</i> she whispers breathlessly. Surprise aside, you hug her round the waist, kissing the top of her head. She can really work herself up!");
	output("\n\nSuddenly, she scrambles about and hurriedly gathers her things. Without a word she more-or-less jumps from the seat and rushes off towards the guest rooms, a strange sort of waddle to her movements.");
	output("\n\nLooking down to where she was sitting, you see... <i>oh</i>. There’s a sheen of shiny, tell-tale fluid that’s formed a neat, ovular shape on the seat next to you. Dirty girl...");
	output("\n\nLooks like you’ll have to come back later! Again!");

	pc.createStatusEffect("Jesse Bar Cooldown",0,0,0,0,true,"","",false,60*12);
	flags["JESSE_TEASE_STATE"] = 1;
	pc.changeLust(20);
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function jesseSecondTeaseI():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("You figure that the dirty minx in front of you needs a lesson in self-control.");
	output("\n\nEyeing her up, you do the same trick of patting the seat next to you. Without a word, Jesse eagerly slides out of her side of the booth and slides in again on your side. She presses herself against you, your [pc.hip] touching hers. You put your arm behind her back so your hand rests on her other hip.");
	output("\n\nJust as before.");
	output("\n\nHer clothes feel very soft - comfortable, even - against the [pc.skinFurScales] of your hand. Jesse looks up at you expectantly, her wondrous eyes fixated on you.");
	output("\n\n<i>“What do you need of me " + jessePCTitleSex() + "?”</i> she asks sweetly. Her bottom lip brushes against her upper teeth as she finishes.");
	output("\n\nYou hold your thoughts for a few seconds, narrowing your eyes. She returns a small grin, although it falters back into a look of anticipation.");
	output("\n\n<i>“Sit here,”</i> you assert, patting your [pc.legs]. Jesse immediately raises herself to sit on your lap, shuffling her skirt-covered bubble-butt against your pelvis and [pc.belly].");
	output("\n\nNow that her head is nearer to your [pc.face], you whisper what’s going to happen next.");
	output("\n\n<i>“We’re going to play a game, Jesse. You start where you left off with that meeting from before and I’ll help you along,”</i> you begin, your other hand walking its fingers from her waistline to her breast. <i>“You’ll learn to control your... </i>urges<i>. You don’t get to </i>cum<i> without my say. If you fail, then we begin again. Fail again, and again? We’ll keep going until you’re so drained and sore, you’ll beg for me to stop.”</i>");
	output("\n\nYou kiss her behind the ear. Jesse’s pulse and breathing elevates just from hearing your challenge. <i>“I-I promise to do my best, " + jessePCTitleSex() + ",”</i> she whispers back, aware of the public place she’s in. That being said, no one appears to be watching you two.");
	output("\n\n<i>“Back to the kaithrit...”</i> You start, your hands pulling up her loose skirt hem.");
	output("\n\n<i>“S-so, the kaithrit guy is </i>s-stuffing<i> his amazing cock in me... the o-other two watch, they’ve got big </i>eeefu<i>... big bulges. I h-hear them talking about me, calling me an ‘advantageous asset.’”</i>");
	output("\n\nYou goad her with whispered words, one hand reaching for her undergarments and the other playing with her left tit. When your fingers reach her underwear, you expected to find a wetted, welcoming pussy... but instead, there’s a tightly packed bulge of her own, hardening against its white boxer short prison. She’s full of surprises!");
	output("\n\nShe gasps as you put your palm on her package. It must be at least 10 inches... what would she be doing with such a big tool?! As you pull it out, you give it a quick examination: It’s soft and smooth and curved in odd places. It seems almost ill-suited for penetration...");
	output("\n\n<i>“What do we have here?”</i> you murmur to her, feeling her body tense up in response.");
	output("\n\n<i>“I-I can explain,”</i> she squeaks breathlessly, her knees rubbing together.");
	output("\n\nYou <i>shhh</i> into her ear then put your hand right down her boxers to refocus her attention. Getting a quick grip on her femcock, you pull it out - balls and all - and angle it at the underside of the table. <i>“Continue, Jesse,”</i> you command, slowly jerking her meat at its base.");
	output("\n\n<i>“Y-Yes, " + jessePCTitleSex() + ",”</i> she whimpers.");
	output("\n\n<i>“G-goat lady goes to the other s-side of the table and u-undoes her suit. Her c-cock... gods, it’s even bigger tha... tha-”</i> there’s a pause, then she grunts like a powerlifter as she tries to hold back her need to cum.");
	output("\n\n<i>“Fu-fuck... s-sorry, " + jessePCTitleSex() + ",”</i> Jesse murmurs. You whisper for her to continue regardless.");
	output("\n\n<i>“A-ah... goat girl holds her meat to my m-mouth and I suck it up so quickly! I-I can’t help it!”</i> She squeals, tensing herself again to hold back her orgasm. <i>“P-please may I c-cum, " + jessePCTitleSex() + "?? Pleeease...”</i>");
	output("\n\n<i>“You may not,”</i> you say firmly. Your grip tightens in increments around the base of her femcock.");
	output("\n\n<i>“Ungg...! G-goat girl grabs my h-hair and f-fucks my throat like I’m her toy. I g-gag and she slows, calling me a ‘g-good girl’, <b>gaah</b> I ca.. I ca-!”</i>");
	output("\n\nWith a heavily stifled whine, a thin spurt of pre-cum shoots from her tightly gripped dick. It’s not enough to be a full orgasm but she still broke the rules...");
	if (pc.isNice()) output("\n\n<i>“You’re slipping, Jesse. Let’s keep going,”</i> you whisper, kissing her neck. You slow your pumps on her member but tighten your grip all the more, making sure that she won’t be cumming any time soon.");
	else if (pc.isMischievous()) output("\n\n<i>“Uh ohhh, naughty Jesse. Still have to keep going,”</i> you chuckle into her pointed ear, squeezing hard on her member all the more. Certainly enough that it’d hurt...");
	else output("\n\n<i>“You’re not getting away with that,”</i> you whisper menacingly, squeezing hard on her member all the more. Certainly enough that it’d hurt...");
	output("\n\nShe almost lets out a yelp and you quickly look around to see if anyone in the room is watching. The coast is clear!");
	output("\n\n<i>“The l-last guy t-takes turns with goat girl using my s-slut mouth and stuffs it full! I can remember the taste,”</i> she gasps, her tongue sliding in and out of her mouth. She’s grinding her ass something crazy against your [pc.legs]. Her grippable femcock twitches with her pulse in your hand. In response you start pumping from base to tip. You leave her white cockhead untouched like the mean dominant that you are.");
	output("\n\n<i>“The k-kaithrit guy hammers into me and I f-feel it all, hot f-fucking cuuhh...”</i> gasps Jesse, her speech slurring as she’s immersed more and more into her own memories. <i>“S-so hot, I feel so used...”</i>");
	output("\n\nShe spreads her legs wide open, a complete turn from her protective position from before. Her femdick is the hardest it can be, quivering in your hard-gripping palm. Her face twists around in a perverse mix of pleasure and discomfort, something that you get a kick out of...");
	output("\n\n<i>“G-goat girl and... the last guy finish on my whore f-face! They don’t let me c-cum... I cah... can’t cum...! P-please may I cum, " + jessePCTitleSex() + "!”</i>");
	output("\n\n<i>“You may not,”</i> you whisper, squeezing again on the base of her pulsing member.");
	output("\n\nJesse grips onto your [pc.thigh] in response, whining like a spoiled brat. She should feel lucky that she’s even getting such attention!");
	output("\n\n<i>“Keep going, Jesse,”</i> you goad.");
	output("\n\n<i>“Agh... t-they all swap places and goat girl grips my waist! I c-can feel her, so aggressive...!”</i>");
	output("\n\nHer breath catches on every other word, the sheer need to cum muddling her words. <i>“I-I cah... can’t feel...”</i>");
	output("\n\nHer eyes roll back and her small frame goes a little limp in your arms. Ohh, she’s not getting out of this so easily! Letting go of her boob, you play-slap her cheekbone several times to get bring her back to the real world. Jesse twitches awake, her face reforming into the complex wash of sensations she was being subjected to.");
	output("\n\n<i>“P-plea... " + jessePCTitleSex() + "... p-please may I c-cu-!”</i>");
	output("\n\nShe can’t even finish her story in this state, so you do the merciful thing.");
	output("\n\n<i>“You may,”</i> you whisper, pumping her twitching femdick and then releasing your tight grip.");

	processTime(20);
	clearMenu();
	addButton(0,"Splat!",jesseSecondTeaseII);
}

public function jesseSecondTeaseII():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("Splat!");
	output("\n\nAs she starts to squeal, you quickly clasp your free palm over her open mouth. With her orgasm orally stunted, her girlish moans almost become shrieks as her slender cock shoots its fresh load under the table! The pent-up seed splatters audibly against the table and floor, although not loud enough to draw attention. Jesse can’t help but thrust and jerk her pelvis out, her base nature overriding her self-control...");
	output("\n\nShe collapses, her head falling neatly onto your [pc.chest]. Completely spent, you feel her body slump all over, her skinny legs dangling on either side of your lap. Her tongue hangs out like an exhausted dog, with a little bit of drool to add to the picture of spent lust.");
	output("\n\nLetting go of her softening femcock, you notice a teeny bit of her jism caught on your thumb. Well, it’s obvious where to put this! You wipe it on the very tip of her tongue and it reflexively curls over your [pc.skinFurScales], licking up its owner’s expenditure. There’s a weak, contented sigh from the other end of it, the enervated Jesse trying to smile as you tend to her.");
	output("\n\nYou whisper <i>“good girl”</i> into her ear, to which she half giggles, half sighs. ");
	output("\n\n<i>“Thank you... </i>huah...<i> thank you, " + jessePCTitleSex() + ",”</i> she murmurs with a hoarse tone.");
	output("\n\nJesse’s so out for the count that you adjust to having the featherlight strumpet rest on you. You make sure her clothes - which remain surprisingly clean - are all arranged and adjusted properly: Wouldn’t want the prim and proper little careerist to show herself up, eh? You hear her murmur another ‘thank you’, her gaze fixed on you.");
	output("\n\nAn indistinct period of time passes, the two of you resting in comfort together. Still drained of energy, Jesse slumps herself forward onto the table, her face buried into her folded arms.");
	output("\n\n<i>“I’m so embarrassed,”</i> she groans. <i>“I-I need to lay down before I fall all over the place...”</i>");
	output("\n\nYou empathise with her, telling her she did well. She did as you commanded, more or less. Before she removes herself, you manage to get in a quick peck on her cheek, causing it to flush pink and puff up. She doesn’t say much but you can tell by the way she looks at you, the way she ambles away with a small swing in her hips, and the slovenly kiss she blows you that she wouldn’t mind seeing you again.");
	output("\n\nAs she heads off to the guest rooms, you reorganize yourself, dust your body down and get back to the ship.");

	pc.changeLust(30);
	moveTo("SHIP INTERIOR");
	flags["JESSE_TEASE_STATE"] = 2;
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function jesseSexMenu():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();
	
	if (flags["JESSE_TIMES_SEXED"] == undefined)
	{
		jesseSexIntroI();
		return;
	}

	output("You know what you want: Her.");
	output("\n\n<i>“How about my place?”</i> you suggest. Every hard worker needs a break from the boredom and you’re sure to work her <i>hard</i>.");
	output("\n\nJesse’s face is still centered towards her devices but she smiles all the same. <i>“One moment, just some thingimajigs here to finish </i>aaand<i> done! I’ll grab the bag...”</i>");
	output("\n\nShe neatly packs it all away, as meticulous and organized as ever. She’s sprightly in her movements, a little spring in her composure. Jesse almost seems to skip to the guest rooms, winking to you on the way there.");
	output("\n\nYou have a few minutes but it’s time filled with thoughts of that fantastic sluthole of hers...");
	output("\n\nAs she returns, you leave the confines of the seats. With the giggling Jesse in tow, you both rush to the ship.");
	output("\n\nOnce you’re inside, you’re both all over each other. Tiny hands ");
	if (pc.isNude()) output("grip and grope at your naked body");
	else output("tug and pull at your [pc.armor]");
	output(" and yours reach around the eager wench from behind, undoing her blouse, bra and skirt with brash desire.");
	if (!pc.isNude()) output(" You help her along with undoing your own [pc.gear], her arms wrapping around your waist as you take over.");
	output("\n\nWith a mishmash pile of clothes to either side of you, you complete your embrace with the clinging Jesse.");
	output("\n\n<i>“So, what do we do now...?”</i> she whispers.");

	moveTo("SHIP INTERIOR");
	processTime(10);
	jesseSexMenuOptions();
}

public function jesseSexMenuOptions():void
{
	pc.maxOutLust();
	clearMenu();
	if (largestCockIndexThatFitsJessesAss() >= 0 || pc.hasHardLightEquipped()) addButton(0, "Office RP", jesseSexOfficeRPI, undefined, "Office RP", "Just another day in the office! Give her the hostile takeover she needs.");
	else addDisabledButton(0, "Office RP", "Office RP", "You need a fitting penis or a hardlight dildo for this.");
	if (largestCockIndexThatFitsJessesAss() >= 0 || pc.hasHardLightEquipped()) addButton(1, "Reverse Cowgirl", jesseSexReverseCowgirlI, undefined, "Reverse Cowgirl", "Make her work for that dick! Collar her and have her ride you.");
	else addDisabledButton(1, "Reverse Cowgirl", "Reverse Cowgirl", "You need a fitting penis or a hardlight dildo for this.");
	if (pc.hasVagina()) addButton(2, "Her Face", jesseSexHerFaceI, undefined, "Her Face", "And what a cute one it is! Use her mouth and tongue as your playthings.");
	else addDisabledButton(2,"Her Face","Her Face","You need a vagina for this.");
	addButton(3, "Bag O’ Tricks", jesseSexBagOTricksI, undefined, "Bag O’ Tricks", "Kinky! Bend her, bind her, fill her with toys. Push her till she cums her brains out.");
	if (largestCockIndexThatFitsJessesAss() >= 0) addButton(4, "Trap Fun", jesseSexTrapFunI, undefined, "Trap Fun", "Face it, you’re as subby as she is! Use a special toy in her bag and get some mutual love.");
	else addDisabledButton(4,"Trap Fun","Trap Fun","You need a fitting penis for this.");
	if (largestCockIndexThatFitsJessesAss() >= 0) addButton(5, "Role Reversal", jesseSexRoleReversal, undefined, "Role Reversal", "Face it, you’re as subby as she is! Get her to do the buttfun, although it’ll be awkward...");
	else addDisabledButton(5,"Role Reversal","Role Reversal","You need a fitting penis for this.");
}
public function jesseSexEnd():void
{
	IncrementFlag("JESSE_TIMES_SEXED");
	mainGameMenu();
}

public function jesseSexIntroI():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("Now that she’s far more open and willing toward you, you’ve some entertaining ideas for the subby wench.");
	output("\n\nWaving your hand in front of Jesse’s face, she immediately perks up and neatly packs away her things. Once finished, she straightens her posture and face, awaiting your instruction. Then, as per usual, you pat the seat next to you, to which the blushing Jesse slides into. She believes she knows what to expect. Pulling her closer so that your arm wraps over her bony shoulders, you tell her your plan.");
	if (pc.isNice()) output("\n\n<i>“Let’s say we go somewhere that’s a little more private, for some friendly fun,”</i> you whisper to her, [pc.lipsChaste] very close to her wiggling ear.");
	else if (pc.isMischievous()) output("\n\n<i>“Miss Lyon-Bowner, I have the offer of a lifetime awaiting. If you’d like to follow me for some friendly fun,”</i> you whisper to her with a squeeze of her thigh, [pc.lipsChaste] very close to her wiggling ear.");
	else output("\n\n<i>“I’m gonna give you a new tale to remember, if you want some friendly fun,”</i> you whisper to her with a firm squeeze of her right breast, [pc.lipsChaste] very close to her wiggling ear.");
	output("\n\nJesse bites her lower lip, pulling down the hem of her skirt. She nods to you then rises, letting you out of the seat. Putting her hand in yours, you sidestep behind her then put your hands round her waist. She’s a little taken aback but doesn’t resist.");
	if (pc.tallness > 76) output(" She’s so petite next to you that it’s like you’re holding something precious, someone to protect.");
	output("\n\nYou direct her to follow you to the ship.");
	output("\n\n<i>“Y-yes, " + jessePCTitleSex() + " but I-I also want to grab something from my room, if I may?”</i>");
	output("\n\nOf course, you say. She hurries off in her short heels, holding onto the edge of her skirt still. You suspect that she’s trying to not to alert the rest of the people on the station, the horny slut. Only a few minutes passes and she’s back with a nondescript duffle bag in her arms. It almost seems oversized but she manages well enough.");
	output("\n\n<i>“All ready, " + jessePCTitleSex() + ".”</i>");
	output("\n\nYou’ve an inkling of what could be in that bag. You smirk to her and beckon her to follow you to the ship.");

	moveTo("SHIP INTERIOR");
	processTime(10);
	clearMenu();
	addButton(0,"Next",jesseSexIntroII);
}

public function jesseSexIntroII():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	output("When both of you board the ship, you make care not to alert anyone else around. ");
	if(crew(true) == 0) output("It’s a little redundant considering you’re the only one who runs the thing but hey, it’s whatever. ");
	output("Jesse can barely keep her gaze away from you, something you notice as you turn the corner to your room.");
	output("\n\nAs soon as you both get in your room, she dumps her duffle bag on the floor with a huff of air. Couldn’t have been <i>that</i> heavy, right? It makes a multi-timbral series of <i>clunks</i> and crumples, enough so that what’s inside seems not just heavy but robust. Jesse pats herself down afterwards, fidgeting with her sleeves. Then, she stands to attention with her hands behind her back.");
	output("\n\n<i>“How may I serve, " + jessePCTitleSex() + "?”</i>");
	output("\n\nYou’re standing a few feet away from her, leaning to your left. Eyeing her up, you analyze your work-and-play strategy. Every so often, your [pc.eyes] meets hers and she flinches away. Jesse’s hopeful face still beams back at you all the same, her cheeks hugging closer to her batting eyelids.");
	output("\n\nYou tell her to strip.");
	output("\n\nYou had only need to get partway through the phrase and her skirt is already sliding to the floor. She spins on her heel, turning herself to the wall directly behind her. Then, she bends over to remove her skirt properly, giving you a good show of her bubble butt and lissom legs. The shoes and knee-length socks come off next, and Jesse then places the articles of clothing neatly on the floor at her side. Straightening herself up, the eager wench pauses before removing her blouse.");
	output("\n\n<i>“You know, I’ve wondered about how this would happen... and I guess it’s true that nothing is like it seems,”</i> she says in relief, removing her cravatte and undoing the buttons on the front. <i>“I hope it’s ok that we just keep this as friends, huh? I’d never survive if I were... emotionally pinned down.”</i>");
	output("\n\nYou tell her to continue to strip.");
	output("\n\nShe nods, undoing her no-nonsense bra so that her full B-cups bounce freely. <i>“So you don’t mind?”</i> she tries to confirm, her hands drifting to her tight boxers. You shake your head, gesturing for her to continue. Jesse giggles again, happy that you approve. Her little boxer shorts slide down to her ankles, freeing her flaccid femstick.");
	output("\n\nShe stands ready, waiting for your instruction.");
	output("\n\nWhat do you decide to do with her?");

	processTime(15);
	jesseSexMenuOptions();
}

public function jesseSexOfficeRPI():void
{
	clearOutput();
	author("SoAndSo");
	showJesse();

	var x:int = largestCockIndexThatFitsJessesAss();

	output("<i>“I know,”</i> you say out loud.");
	output("\n\nThe attentive Jesse inhales deeply in anticipation.");
	output("\n\n<i>“Miss Lyon-Bowner, would you redress? Skirt, socks, and blouse only,”</i> you direct, formal and confident in your tone. Without hesitation, the eager strumpet gathers her top, socks, and skirt, putting them on just as quickly as she pulled them off. She pats and brushes herself down, looking as presentable as ever. She finishes by standing in front of your bed.");
	output("\n\nExcellent. You place your right hand on her left shoulder, firmly turning her around so that her back is to you.");
	output("\n\n<i>“What would you say to a merger, Miss Lyon-Bowner?”</i>");
	output("\n\nJesse openly giggles. <i>“I would have to review our combined assets, " + pc.mf("Mister","Miss") + " Steele. That would require... permission to peruse. A formal review, of course. A </i>personal<i> review. I’m known for my delicate supervision, after all.”</i>");
	output("\n\n<i>“Naturally,”</i> you whisper into her ear. <i>“But if I may be bold, you’re not in the position to bargain.”</i>");

	IncrementFlag("JESSE_TIMES_RP");

	clearMenu();
	addButton(0,"Next",jesseSexOfficeRPII,x);	
}

public function jesseSexOfficeRPII(x:int = -1):void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("As soon as you finish, you push her with force onto the bed. Now you’re her boss! The unaware strumpet yelps as she is shoved into the soft bedding. Her head half buried into some pillows, she dares to look back at you. Her chewed lip and her needy, glassy galaxy eyes say it all: <i>Fuck. Me.</i>");
	output("\n\n<i>“Now that you’re under duress, I’ll have to check for company stability...”</i> you say, ");
	if (silly) output("giving yourself entirely to the euphemisms");
	else output("careful to keep in character");
	output(". Using a [pc.foot], you flip the lip of her black skirt to expose her most prized assets. She arches her back reflexively, her bubble butt pointing upwards upon splayed legs. Her dainty sack and long fempecker dangle freely underneath, the latter already projecting in anticipation.");
	output("\n\nIn preparation, you ");
	if (largestCockIndexThatFitsJessesAss() >= 0) output("tug your " + pc.cockNounComplex(x) + " to stiffness");
	else output("quickly redress in your panties and turn on your hardlight rod");
	output(". Climbing onto the bed, you position your [pc.face] a foot away from her peach of an ass. It’s just so cute ! With a firm but slow grip, you pull apart her snow white cheeks for the real prize beneath: her tight starfish that clenches and tenses as if begging to be forced open and filled up. Deciding that this eager buttslut needs a little bit of liquid capital to get this investment rolling, you suck up a big gob of saliva and spit straight at her sluthole. A coo of encouragement comes from beyond the pillows, so you know what needs to be done next.");
	output("\n\nWith her front buried firmly into the bed, you straddle Jesse’s exposed behind and line your " + pc.cockOrStrapon(x) + " with her crevice. Using your " + pc.cockOrStraponHead(x) + ", the spit you applied is pressed onto her inviting hole. Her shoulders visibly tighten as she prepares herself for some scrambled merchandising. After a few seconds of teasing the awaiting strumpet, you lift your hips up then dive your " + pc.cockOrStrapon(x) + " straight in!");
	output("\n\nA squeal of delight comes from the pillows as you force yourself inside her. It’s something else: a loose hole but a tight chamber, gripping around your " + pc.cockOrStrapon(x) + " with the strength of a vice. Be blessed that you decided to lube her first!");
	output("\n\nBut her sphincter has its own surprise and another tightening sensation clamps down on the shaft. So, she want’s to make it difficult, huh?");
	output("\n\nIn response, you harshly smack the sides of her compromised tush, much to her surprise. Using that moment, you bury your ");
	if (largestCockIndexThatFitsJessesAss() >= 0 && pc.cocks[x].cLength() < 8 || pc.hasHardLightEquipped()) output(pc.cockOrStrapon(x) + " up to the " + pc.knotDescript(x) + ", bashing down her resistance!");
	else output(pc.cockDescript(x) + " to as deep as her shallow body will allow!");
	output("\n\n<i>“S-shi...! I cannn... feel it everywhere!”</i>");
	output("\n\nYour little entrepreneur in heat is already screaming in girly tones as you invade her stock and you haven’t even gotten into it yet. You begin with slow, long humps: humps that force her to move in sync with you or else be battered by your [pc.hips].");
	output("\n\nIt’s tough going at first. Her muscle-control takes some time to overcome as she tries fighting you all the way with her tightness. How much cock has she had to learn how to do this?! After a few more smacks on her now rose-red tush, you feel her tightness relent. Now you have free reign.");
	output("\n\nSpurred on to really punish this cowgirl investor for impeding your progress, you spear and bury into her slicked and slack hole like a jackhammer! Each pounding makes the diminutive Jesse squeek with joy as you grind and squeeze her prostate while stretching her hole with brute force.");
	output("\n\n<i>“Nngyes! I-I’ve wanted it so bad! nnngFUCK! Getting fffucked by a Steele...”</i>");
	output("\n\nJesse pushes back against your hammering of her heavenly ass, the state of being reamed by her idol driving her to please you all the more. You lay on some more booty smacks for her breaking character with that last outburst, making her whine in admittance. There’s a deep feeling of satisfaction from revealing this once-prudish strumpet to be a malleable asswhore...");
	output("\n\nYou can feel it building within, that feeling of climax and the ideas of where to put it!");
	output("\n\n<i>“Ngg, I hope you’re ready for a ");
	if (largestCockIndexThatFitsJessesAss() >= 0) output("liquid cash injection");
	else output("end to proceedings");
	output(", Miss Lyon-Bowner!”</i>");
	if (largestCockIndexThatFitsJessesAss() >= 0) {
		output("\n\nHeat and euphoria burn through your " + pc.cockDescript(x) + " as ");
		if (pc.cumQ() >= 1000) output("torrents of [pc.cumNoun] try to fill the defeated Jesse’s innards. She isn’t that deep however: instead of filling up, [pc.cum] splurts and squeezes out at an alarming rate from her already full hole! It seeps into the fabric around her and makes her behind look practically bukake’d.");
		else output("Jesse’s reward is shot into her innards. Some of it splatters around the edges of her phallus-filled behind, [pc.cumVisc] on supple white flesh.");
	}
	else output("\n\nThe hardlights reactive energies grow as shockwaves of ecstasy force you to orgasm on the spot! Although Jesse won’t be getting a creamy reward, you figure that letting her know you got off to her tight, tight hole is reward enough...");
	output("\n\nUnderneath, the exhausted Jesse huffs and whimpers as the effects of your brutish assault on her body gives way to numbness, warmness, and endorphins. Her stiff fempecker has gone all this time without attention: do you give her release?");

	pc.orgasm();

	clearMenu();
	addButton(0, "Yes", jesseSexOfficeRPYes, x, "Yes", "She’s earned it after being such a good cock receptacle.");
	addButton(1, "No", jesseSexOfficeRPNo, x, "No", "Deny her release: a stuffed butt is all the reward she deserves.");
}

public function jesseSexOfficeRPYes(x:int = -1):void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("With your " + pc.cockOrStrapon(x) + " still lodged within her, you help turn Jesse over so that she gets a full view of her dominator. That skirt of hers is in the way so you pull it up to reveal her hardened femcock. It’s clearly on the edge, twitchy and rock solid: you only need command her to cum.");
	output("\n\nWrapping both hands around her ten inches of meat, you jerk her shaft just as she likes it. You stare her down: her face is scrunched up and flushed a hot pink, glassy nebul-eyes emphasised by running eye shadow. How adorable...");
	output("\n\nYou lean forward just a little and give the command: <i>“cum.”</i>");
	output("\n\nWith a pained whine, the pinned buttslut bucks her hips into the air. Her cocktip spurts and splutters with strings of milky jism, landing all over her hips and midriff!");
	output("\n\nHer few final spurts come together with a meek <i>“t-thank...yu...”</i> from the exhausted wench. ");
	if (largestCockIndexThatFitsJessesAss() >= 0) output("You remove your softening " + pc.cockDescript(x) + " from her hole, making sure to wipe it down against her thigh.");
	else output("You turn off your hardlight device and the energized object flickers and disperses, leaving Jesse uncoupled from you.");
	output("\n\nYou clamber over to her side, playing with her ruffled wine-red hair. She is quite the mess. The both of you gaze with contentment at each other for some time, the afterglow giving way to a shared sexual warmth that brings smiles to your faces.");
	output("\n\n<i>“I have to go, work is slow but it’s... still there,”</i> murmurs Jesse, gingerly lifting herself up from the bed. You watch her as she redresses");
	if (largestCockIndexThatFitsJessesAss() >= 0) output(" despite her baby batter slathered behind soaking into her boxers");
	output(", her movements slow and relaxed. She giggles when she notices you ogling her. <i>“I’ll still be around at the bar, if you wanna...”</i> she says, rubbing her knees together. Oh you’ll be sure to make use of her services again, you reply with a blown kiss.");
	output("\n\nWith a pink-cheeked smile and a wave, Jesse grabs her bag and leaves the ship.");

	processTime(60 + rand(15));

	clearMenu();
	addButton(0,"Next",jesseSexEnd);
}
	
public function jesseSexOfficeRPNo(x:int = -1):void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("No, not today. Your exhausted buttslut has had the honor of being plowed into the figurative mud. ");
	if (largestCockIndexThatFitsJessesAss() >= 0) output("You remove your softening " + pc.cockDescript(x) + " from her hole, making sure to wipe it down against her thigh.");
	else output("You turn off your hardlight device and the energized object flickers and disperses, leaving Jesse uncoupled from you.");
	output("\n\nYou clamber over to her side, playing with her ruffled wine-red hair. She is quite the mess. The both of you gaze with content into each other for some time, the afterglow giving way to a shared sexual warmth that brings smiles to your faces. Her untouched fempecker lies half hard against her midriff and every so often, she idly strokes the shaft in an attempt to keep it hard. She’s going to remember you tonight, that’s for sure...");
	output("\n\n<i>“I have to go, work is slow but it’s... still there,”</i> murmurs Jesse, gingerly lifting herself up from the bed. You watch her as she redresses");
	if (largestCockIndexThatFitsJessesAss() >= 0) output(" even with her baby batter slathered behind soaking into her boxers");
	output(", her movements slow and relaxed. She giggles when she notices you ogling her. <i>“I’ll still be around at the bar, if you wanna...”</i> she says, rubbing her knees together.Oh you’ll be sure to make sure of her services again, you reply with a blown kiss.");
	output("\n\nWith a pink-cheeked smile and a wave, Jesse grabs her bag and leaves the ship.");

	processTime(60 + rand(15));

	clearMenu();
	addButton(0,"Next",jesseSexEnd);
}

public function jesseSexReverseCowgirlI():void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	var x:int = largestCockIndexThatFitsJessesAss();

	output("Hmm, let’s see what’s in that bag...");
	output("\n\nGesturing to Jesse’s duffle, you say: <i>“bring that over here.”</i>");
	output("\n\nWith a quick nod, she practically jumps onto the thing, lifts it in her arms and holds it up for your inspection. Good, you say, much to her delight. You only need to pull the zipper apart a few inches and you spot something <i>very</i> intriguing: a wide, black leather collar and chain. A simple thing but in the right hands...");
	output("\n\nYou pull it out of the bag, chain and all, in one smooth motion then fiddle with the binding. <i>“Put the bag where you found it,”</i> you direct, keeping your [pc.eyes] on the naked girl as she follows your order. While she’s bending down with the heavy load, you see your chance!");
	output("\n\nYou hook the leather ring around her thin neck like a spycatcher detaining a quarry. She yelps and instinctively tries to grab at her neck. It’s no use for her, of course, being the skinny thing that she is. You pull her back gently, making sure that her vision meets your face. Once her teary eyes meet yours, she relents completely with a dumbstruck look taking over.");
	output("\n\nYou fasten the clip on the collar, making sure it’s firm but just on the edge of skintight. Jesse, with her gaze still locked to your face in awe, strokes and paws at the restraint round her neck. You tug on the silver chain to make sure there’s no slippage, Jesse’s posture jerking slightly as you do. ");
	if (largestCockIndexThatFitsJessesAss() < 0) output("Before continuing, you requip your [pc.underGarments] and turn on the hardlight device, the surge of resultant energy jolting your nerves. ");
	output("All ready.");
	output("\n\nWith Jesse more-or-less entranced in place, you clamber across the captains bed up to the headstop. Laying on your back, you spread your [pc.thighs] apart to giver her full view of your " + pc.cockOrStrapon(x) + ". Jesse’s lower lip grates against her teeth as she watches, her hands covering her growing erection. You won’t deny her that but instead, jerk on chain just hard enough for her to lose focus and fall face first onto the bed! Clumsy girl...");
	output("\n\n<i>“Service me,”</i> you command, pointing to your " + pc.cockOrStrapon(x) + ". Her perfect hair now ruffled and her eye makeup running down her cheeks, she can only say <i>“y-yes " + jessePCTitleSex() + "...”</i> She slinks on all fours towards you with ginger movements, wary of getting the chain pulled. Without hesitation, she envelopes your " + pc.cockOrStraponHead(x) + " with her little mouth. The hot, wet hole of her mouth is a dream for your senses: your ");
	if (largestCockIndexThatFitsJessesAss() >= 0) output("" + pc.cockDescript(x) + " being bathed by her dexterous tongue twitches and tenses in delight!");
	else output("hardlight cock sends pulses of nerve teasing warmth through your lower body!");
	output("\n\nLifting your right leg, you rest your heel on her spine. Let’s see how fast she can go! In tandem with your chain, you pull with heel and hand so that you force Jesse’s head to bob up and down on your " + pc.cockOrStrapon(x) + ". She audibly whimpers although having a mouth stuffed full makes sure it’s muffled. She struggles to keep up the pace, her lips slurping and slipping on your " + pc.cockOrStrapon(x) + " like some back alley whore. You make sure to keep the pace just enough to avoid her gag reflex: For someone who prides herself on professionalism, it would be uncouth for her to slip up now...");
	output("\n\nBut that’s enough. With the slack chain, you push Jesse up by the shoulders so that she falls onto her back! She gasps for air as her poor mouth finds itself freed from your usage. No time for breaks, Jesse...");

	IncrementFlag("JESSE_TIMES_COWGIRL");

	clearMenu();
	addButton(0,"Next",jesseSexReverseCowgirlII,x);	
}

public function jesseSexReverseCowgirlII(x:int = -1):void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("Pulling her up by the chain, the force of which makes her wince, she now rests on her knees: a gasping, tongue-lolling and face-flushed mess of a slut; and you haven’t even started yet.");
	output("\n\nYou twirl your finger around in the air to signify her to turn around, which she <i>does</i> do, if a little more gingerly. What a trooper.");
	output("\n\nLeaning back against the pillows, with Jesse’s bare butt a short distance from your " + pc.cockOrStrapon(x) + ", it’s only logical what should happen next. You pull the chain gently, encouraging her to sit on her spit-lathered prize like a good buttslut. Her tensed hole gives way to your " + pc.cockOrStrapon(x) + " with ease and her impish moans form a chorus of cathartic joy. As her hot, soft, and tight asshole absorbs your " + pc.cockOrStrapon(x) + " almost to the " + pc.knotDescript(x) + " with just enough room for her to bounce.");
	output("\n\n<i>“Does that feel good, slut?”</i> you chide, guiding her palms to your knees for purchase.");
	output("\n\n<i>“I-I luh... love it!”</i> she stammers, her quivering voice undertoned with need. Without further ado, you slowly thrust your [pc.hips] upwards, her tight hole losing its strength of resistance as you aim deeper. Jesse holds herself in place, a squeal echoing through the room as her tender prostate gets probed. Easy does it, at least at first. You relax your hip muscles so that the agonizingly slow cycle of prostate stimulation begins again.");
	output("\n\n<i>“Your turn, Jesse,”</i> you direct, smacking her stuffed butt with your free hand. She squeals melodiously as you do, pushing herself up and down on your and her knees to get this cock-milking going. That’s more like it!");
	output("\n\nShe’s so eager that she begins at peak pace. Every pull up brings your " + pc.cockOrStrapon(x) + " to the edge of her entrance and every push down lets her take it up to your " + pc.knotDescript(x) + "! You help her along by pulling on the chain with each downward motion. With your free hand, you place it on her gyrating hip for guidance and encouragement, making sure she bends your shaft into all the right spots of her beautifuly tight sluthole. You grunt as the pleasurable feedback through your " + pc.cockOrStrapon(x) + " brings you closer and closer to climax!");
	output("\n\nAs she lifts and pushes herself up again, you pull on the chain and her hip in turn so that she is practically impaled! She whines as the hard sensation of your " + pc.cockOrStrapon(x) + " catches her off guard! You unleash a feral snarl as it does the same to you, her tight passage squeezing you in response. In sync with that moment, you feel that familiar rise of euphoric heat in your loins!");
	if (largestCockIndexThatFitsJessesAss() >= 0) {
		if (pc.cumQ() >= 1000) output("\n\nA veritable flood of [pc.cum] gushes through your " + pc.cockDescript(x) + " to the depths of Jesse’s roughly fucked sluthole. It has very little space to fill so in seconds, it already leaks and splurts out from the tight seal made from her hole and your " + pc.cockDescript(x) + "!");
		else output("\n\nA surge of [pc.cum] gushes through your " + pc.cockDescript(x) + " and into the needy insides of Jesse’s roughly fucked sluthole. It coats the inside fully, giving her a properly packed creampie that she’ll be taking home with her!");
	}
	output("\n\nYou both collapse backwards into the bed in a breathless pile, the diminutive wench on your lap going limp in your arms. ");
	if (largestCockIndexThatFitsJessesAss() >= 0) output("You feel your " + pc.cockDescript(x) + " shrink and recede from her loosened, gaping hole... and a comforting drizzle of [pc.cum] run down your lap");
	else output("You turn off your hardlight device with a few lazy fidgets and it instantly dissipates from existence");
	output(". Her tiny form quivers and heaves from the experience, her slender fempecker still upright and untouched.");
	output("\n\nDo you help her out?");

	pc.orgasm();

	clearMenu();
	addButton(0, "Yeah", jesseSexReverseCowgirlYeah, x, "Yeah", "She’s been a good little asswhore, why not?");
	addButton(1, "No", jesseSexReverseCowgirlNo, x, "No", "Her ass got the time of its life, no further reward required.");
}

public function jesseSexReverseCowgirlYeah(x:int = -1):void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("<i>“Aww, still upright, hmm?”</i> you tease into her pointy ear. Letting go of the chain, you clasp her slender shaft with both hands. <i>“Maybe you’ve earned this...”</i>");
	output("\n\nJesse giggles as she finally gets to cum.");
	output("\n\nWith loose wrists, you vigorously pump her slender member to its full state. You can feel it twitch and tense in your palms, her hips trying to keep up with your furious motions.");
	output("\n\n<i>“Ah-ahhh! P-please! Lemmc-cum! Pleeease " + jessePCTitleSex() + "!”</i> shrieks the insensate wench.");
	output("\n\n<i>“You may,”</i> you whisper.");
	output("\n\n In that instant, her rapturous cries are joined with four thick shots of her milky spunk! It spurts on and around your hands as well as her crimson belly, dots and splotches of her pleasure juice dripping and drying all over you both. She really must’ve been pent up! You squeeze and tug to force the last few drops out and then feed the gasping slut your cum-covered fingers. She licks and sucks up her own seed, mumbling <i>“t-thankyu”</i> with your middle finger in her mouth.");
	output("\n\nOnce she’s cleaned you up, you unbind the black collar and toss it to the side of the bed. You wrap your arms round her middle and hug her tight, both basking in the mutual afterglow with her head nestled on your [pc.chest].");
	output("\n\nPerhaps an hour passes as you both just wordlessly enjoy each others bodies. The enervated Jesse pushes herself up from the bed and lazily slides off of the edge of the bed. You laugh as she falls onto her back.");
	output("\n\n<i>“H-hey... it’s not funny,”</i> she croaks, trying to grab at her clothes from the floor. <i>“Now I’m all soiled </i>and<i> bruised...”</i>");
	output("\n\nYou toss her a nearby towel: at least you can solve one problem. After rubbing herself down in a rather careless fashion, she gets up and redresses. With her hair all ruffled and makeup ruined");
	if (silly) output(" and the pants were dead");
	output(", she doesn’t bother to bring her usual composure to bear. You get up yourself and help her with the bag, putting the collar and chain inside. Might have to use that again...");
	output("\n\nOnce she’s all ready, you give Jesse one last peck on the cheek and she departs from the ship, a lucid smile on her face all the way.");

	processTime(60 + rand(15));

	clearMenu();
	addButton(0,"Next",jesseSexEnd);
}
	
public function jesseSexReverseCowgirlNo(x:int = -1):void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("She’s had her reward: A good, <i>hard</i> plow. Besides, seeing her semi-hard femdick silently beg for release is just so satisfying!");
	output("\n\nJesse lies enervated on top of you, her arms loosely dangling to the side. You pull her up slightly and kiss the top of her head, proceeding to undo the bindings of her leather collar. She coos happily as the restraint leaves her neck, a dopey smile on her face. <i>“Mmmm, " + jessePCTitleSex() + "...”</i> she murmurs, as if talking while sleeping.");
	output("\n\nPerhaps an hour passes as you both just wordlessly enjoy each others bodies. The enervated Jesse pushes herself up from the bed and lazily slides off of the edge of the bed. You laugh as she falls onto her back.");
	output("\n\n<i>“H-hey... it’s not funny,”</i> she croaks, trying to grab at her clothes from the floor. <i>“Now I’m all soiled </i>and<i> bruised...”</i>");
	output("\n\nYou toss her a nearby towel: at least you can solve one problem. After rubbing herself down in a rather careless fashion, she gets up and redresses. With her hair all ruffled and makeup ruined");
	if (silly) output(" and the pants were dead");
	output(", she doesn’t bother to bring her usual composure to bear. You get up yourself and help her with the bag, putting the collar and chain inside. Might have to use that again...");
	output("\n\nOnce she’s all ready, you give Jesse one last peck on the cheek and she departs from the ship, a lucid smile on her face all the way.");

	processTime(60 + rand(15));

	clearMenu();
	addButton(0,"Next",jesseSexEnd);
}

public function jesseSexHerFaceI():void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("You squint your eyes to her as you think of what to do with your eager subby friend.");
	output("\n\nJesse blinks in response, trying not to be phased by your subtle display.");
	output("\n\n<i>“I know what to do with you,”</i> you say, locking in eye contact. <i>“Jesse? Kneel.”</i>");
	output("\n\nWith a little hesitation, she sets herself on her knees and holds her wrists up together in the air. Oh she knows too. You open up her bag of tricks while Jesse holds her position in silence. You take extra care to not let her see what you’re looking for: a tactic to make her guess at what you’re going to use. She doesn’t need to know <i>that</i>, at least...");
	output("\n\nYou find what you’re looking for: Some synthetic rope. It’s binding time!");
	output("\n\nLowering yourself to her level, you begin to wrap her wrists and forearms into a complex binding knot. Perhaps not a professional knot but it’ll do. You leave a hint of laxity in the knot itself so that her skinny arms don’t lose sensation. Jesse barely reacts during this time but once she’s finished, she visibly grins at your handiwork. <i>“Oo, that guy in the forum was right...”</i>");
	output("\n\nHuh. Anyway, you stand yourself up and pat yourself down. <i>“Stick out your tongue,”</i> you command. She obeys almost automatically, sticking out her 7 inch organ-pleaser to its full length for an inspection. Such a well trained girl, why she ever acted so prudish before is beyond thinking.");
	output("\n\nWith your right index and middle fingers, you pincer her tongue like a clothes peg. She makes a small ‘hngg’ sound but stays in position. You manipulate the flesh ribbon this way and that way, pulling it from side to side with a firmness that makes Jesse wince. A sliver of drool drops from her lower lip to her chin, something you notice as you push her tongue up to her nose tip. Tsk, tsk, she just can’t contain herself.");
	output("\n\nYou push her tongue back into her mouth with an index and middle finger, gesturing for Jesse to close her mouth. She keeps her face fixed on yours the entire time with just the cutest, most adoring expression you’ve seen her wear. Let’s change that. Without telegraphing it, you pull your hand back in a sharp motion and slap her firmly on the cheek bone!");
	output("\n\nThe bound strumpet yelps in shock, her body visibly tensing up. In as quick a motion as the slap, you grab her chin between your fingers and jerk it to your direction. Her eyes are welling as intended but it’s at odds with the dopey, adoring expression she has... more is needed.");
	output("\n\nYou raise your hand again then <i>slap</i> her on the left then right cheek. Always palms and fingers: wouldn’t want to actually damage the poor girl. Each slap adds more fresh red to her now-puffed cheeks and her makeup begins to run as the frequency of slaps increases.");
	output("\n\nWith one final slap, she veritably squeals in a pleasure-twisted pained tone.");
	output("\n\n<i>“How was that, hm?”</i> you tease, trying to hide the arousal in your voice. You place your palm on her left cheek, the twitchy sub wincing as you stroke it. She still smiles back. Then she puts her own palm on the back of your hand out of affection.");
	output("\n\nLets not get her too attached. You abruptly pull your hand away then push her head against the soft edge of the bed with your [pc.foot].");
	output("\n\n<i>“Hold that position, Jesse. Otherwise...”</i>");
	output("\n\nHolding your stance for a few seconds more to hammer the point home, you pull your [pc.foot] away. Her head is still tilted against the edge of the bed, just as you left it. Good.");

	IncrementFlag("JESSE_TIMES_FACE");

	clearMenu();
	addButton(0,"Next",jesseSexHerFaceII);	
}

public function jesseSexHerFaceII():void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("You clamber onto the bed and line yourself up so that you’re in line with the bound up Jesse. Shuffling backwards on your knees, you push down your lower body so that your [pc.pussy] is only a few inches from her face.");
	if (pc.isNaga()) output(" It’s a little awkward with your naga half but you’ve got plenty of body strength to hold yourself up.");
	output("\n\n<i>“Tongue out,”</i> you command. Small puffs of heat brushing against your labia tell you her 7\" tongue is fully extended.");
	output("\n\n<i>“Lick.”</i>");
	output("\n\nTo help her, you lower yourself a little. Her hot, fleshy tongue drags slowly across your [pc.cunt] and doesn’t stop till it collaterally flicks at your [pc.asshole]. Mmm, feels <i>nice</i> to have a personal pleasure pet so obediently playing along to your tune. And has such a well trained tongue, of course...");
	output("\n\nYou press your mound down so that your [pc.eachClit] can brush against her nose.");
	output("\n\n<i>“You know what to do, Jesse,”</i> you tell her, the anticipation in your voice wearing down your commanding tone somewhat. You smush your [pc.vagina] against her open mouth and instinctively, the little slut pulls her tongue across. <i>Mmm</i>, right there... her seven inches of tongue muscle end up comfortably implanted in your [pc.pussy], and the <i>heat</i> from her mouth is just divine. Jesse’s tones of content form music for your ears: she obviously loves having her face used this way!");
	output("\n\nAs you grind your lower body against her face, using her button nose as a stimulator for your [pc.eachClit], you use her tongue and mouth just from the pure motion of it all: so well-trained is her tongue that she matches and goes against your movements in just the right points and places. You barely even need to direct her, such is the glorious tongue bath that she’s giving your [pc.pussy].");
	output("\n\nEvery so often, you catch a glimpse of Jesse underneath you: her ruffled visage is a puffy, flushed mess of makeup and [pc.girlCumColor] fluid. You can already feel a deep rooted euphoria building and building as you grind against her face. Her picture-perfect presentation must be absolutely ruined from the pussy-grinding she’s getting: just that thought alone spurs you on to abuse her face even longer.");
	output("\n\nBut it’s too much ! With a wail, you slap your mound against Jesses face, rub it in and <i>really</i> make sure that she gets the full brunt of your orgasm! As the climax blooms within you with a full-body sensation, your [pc.cunt] ");
	if (pc.isSquirter()) output("squirts and spurts");
	else output("dribbles and oozes");
	output(" out fresh [pc.girlCum] right into the subby wenches mouth! She manages to keep her composure long enough to wriggle her mouth-meat in and around your clenching [pc.pussy]. She’s just the <i>best</i> thing in the world right now...");
	output("\n\nOnce your pleasure-bomb has subsided, you slump forwards onto the bed with your arms outstretched. Mm, that plush bedding feels good against your tender nerves. You spend a breathless minute enjoying the slow burn, snugly (and smugly) content against the bed.");
	output("\n\nOh wait, Jesse...");
	output("\n\nThe femcum-drizzled Jesse is still in her head-pushed pose, her tongue lolling out the side of her mouth like a panting dog. You gingerly slink over to her, resting your head right next to hers on the edge of the bed.");
	output("\n\n<i>“Excellent work... slut,”</i> you whisper into her pointed ear. She sighs in content at your approval, her glistening tongue rolling back into her mouth. Before it goes in completely however, you catch her by the hair with a free hand and lock your mouth to hers for a messy kiss. She whimpers at your grip but plays along all the same, letting your [pc.tongue] have its way with hers. Hmm, that’s an odd, [pc.girlCumFlavor] flavour... oh, of course: it’s your [pc.girlCum]!");
	output("\n\nYou get a quick glimpse at Jesse’s bound arms. You should really undo those... and below that, her untouched femcock stands fully erect between her slim thighs. Do you help her get off?");

	pc.orgasm();

	clearMenu();
	addButton(0, "Yes", jesseSexHerFaceYes, undefined, "Yeah", "Play-for-play, as it were. She’s earned it.");
	addButton(1, "No", jesseSexHerFaceNo, undefined, "No", "Her reward was the privilege of tasting your pussy, after all.");
}

public function jesseSexHerFaceYes():void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("Taking pity on the sodden girl, you help her up onto the bed and untie the rope from her wrists. Placing it aside, you then gently pull her into your lap so that her back is against your naked [pc.chest]. With her limp little legs splayed aside, you grip her fem-member from behind with both hands and slowly pump it up and down.");
	output("\n\nJesse’s contented sighs play into your [pc.ear] as she kisses up the side of your neck. They become sloppier and looser as you jerk her slender dick: must be all that arousal from being used like a toy. ");
	output("\n\nYou can feel it twitch and tense in your palms, signalling that she’s close. With a few final tugs, you aim her femcock away from the bed. Her shrill cry coincides with her femtool shooting its creamy load all over the bed covers! One string, two strings, three... four strings of pearly cream lay in front of her, a dribble of jizz hanging from her rapidly softening pleasure stick. You palm it around and <i>squeeeeze</i> out the last few drops left over, making sure to catch some in an open hand.");
	output("\n\nYou bring that hand to her mouth and press it to her lips. She accepts it without hesitation, sucking and licking at the refuse with greed. Such a dirty girl, getting off to eating her own cream...");
	output("\n\nThe both of you sit locked in mutual, blissful comfort, your hands round her middle and hers on your [pc.knees]. Jesse’s eyelids flutter and hang like she’s on the verge of sleep but you give her a little squeeze every now and then. Just enough to keep her awake, at least. She nuzzles against your neck and you see she’s sporting a playful grin.");
	output("\n\nAfter what seems to be an hour, Jesse pushes herself forwards.");
	output("\n\n<i>“Wish I could stay... but I probably have a meeting to attend,”</i> she sighs, her ruffled hair covering her face. You squeeze her one more time then help her off the bed. Once she has redressed and her bag of goodies has been packed away, you blow each other a kiss and she departs the ship.");

	processTime(60 + rand(15));

	clearMenu();
	addButton(0,"Next",jesseSexEnd);
}
	
public function jesseSexHerFaceNo():void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("Deciding that she’s had her reward in the form of a gush of [pc.femCum], you help the strumpet up from the floor and onto your lap. Jesse giggles a little as manage to brush your hands against her buds and then relaxes when she’s firmly placed into your lap. Her half-hard fempecker slowly softens as you hold her tightly, although you imagine she’ll try to relive it later...");
	output("\n\nThe both of you sit locked in mutual, blissful comfort, your hands round her middle and hers on your [pc.knees]. Jesse’s eyelids flutter and hang like she’s on the verge of sleep but you give her a little squeeze every now and then. Just enough to keep her awake, at least. She nuzzles against your neck and you see she’s sporting a playful grin.");
	output("\n\nAfter what seems to be an hour, Jesse pushes herself forwards.");
	output("\n\n<i>“Wish I could stay... but I probably have a meeting to attend,”</i> she sighs, her ruffled hair covering her face. You squeeze her one more time then help her off the bed. Once she has redressed and her bag of goodies has been packed away, you blow each other a kiss and she departs the ship.");

	processTime(60 + rand(15));

	clearMenu();
	addButton(0,"Next",jesseSexEnd);
}

public function jesseSexBagOTricksI():void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	var x:int = largestCockIndexThatFitsJessesAss();
	output("You’re more than a little intrigued by that duffle bag.");
	output("\n\nWhile she’s standing to attention, you unzip the bulky green thing and have a root around for something <i>tasty</i>.");
	output("\n\nWhile there’s some ‘expected’ things to be found inside, several of the strap-bound and oddly mechanical devices seem a little esoteric even for your knowledge. ");
	if (flags["JESSE_TIMES_TRAP"] != undefined) output("The mutualizer takes up a good bit of space and <i>maybe</i> you’d be tempted to use it again... but not now.");
	else output("There’s even something that looks like a landmine in there, complete with protruding dildoes.");
	output("\n\nThe diversity of pure stuff gives you an interesting thought: hell, why not just use as much of this as is possible?");
	output("\n\nYou pull out and set aside some very neat bits of kit: a cock-vibe, a complex looking cock-ring arrangement, synth-rope, lube, a mouth gag, a fancy dog bowl with ‘Jesse’ written on it, a strange plastic string of miniscule pink beads, and two different dildoes.");
	output("\n\nYou lay it all out on the bed in an impressive, organized display and goad Jesse to have a look. She sniffs a bit, wrinkling her nose like an inspector looking over workmans tools.");
	output("\n\n<i>“I think I can see where this is going, " + jessePCTitleSex() + ",”</i> she giggles, swaying from side to side in a playful manner. <i>“As in, this is </i>all<i> being used on me, right...?”</i>");
	output("\n\nYou nod, stroking the side of her jaw with the back of your fingers. Jesse grins the cheekiest grin you’ve seen her pull and she immediately hops up onto the bed. She’s already on all fours, her bubbly booty accented by the arching of her back. So eager.");
	output("\n\nYou begin with the binds. Two bits of rope, two sets of limbs, simple. As she keeps in position, you weave and loop the rope around her wrists and forearms then tighten them into an authentic arm-bind. You make sure there’s a little looseness, as is good practice: wouldn’t want her losing sensation in her hands, after all...");
	output("\n\nShe continues to wiggle her tush as you go, closing her knees together so that her calves and ankles meet. She sticks her feet up in the air so that you have proper clearance to work with. <i>Definitely</i> a professional. You wonder if there’s some business potential in that... but that’s more something to think about later.");
	output("\n\nIn a similar pattern to her bound arms, you make sure her ankles and calves are locked together with just a little wiggle room.");
	output("\n\nThe grinning Jesse shuffles in place to adjust to her binds, continuing her idle butt wiggling. You ponder if that’s merely for show or she just can’t control her excitement... probably both, knowing her.");
	output("\n\nNext, you take the bar-shaped gag and align it with her mouth. <i>“Tongue out,”</i> you say assertively, to which she does instantaneously. While putting it on, the bar presses lightly on her tongue and makes sure it can’t roll back into her mouth. She licks at the air to show that it’s still comfortable, fluttering her eyes at you as you move on to the next part: the cock-semble.");
	output("\n\nThe cock-ring <i>thing</i> appears to have several adjustable loops, suggesting it can also grip her balls and hold something parallel to her dink. How convenient.");
	output("\n\nThrough her wide thigh gap, you hook the binding around the base of her semi-hard femcock and do the same with the other ring around her tight little sack. You make sure that both constricting binds are secure: with a shake of her junk. Jesse half-whimpers, half-giggles as you do.");
	output("\n\nTo finish off this composition of perversity, you slot in the small pink cock-vibe into the velcro grip that’s at the tip of her member. It lines up very tightly to her urethra and slowly pulsing cocktip. No powering on yet, though...");
	output("\n\nLastly, and perhaps as the cherry to this Jesse cake, you get the bottle of lube and squirt a thick string of the stuff onto her exposed asshole. She sighs in relief as you then rub the cool liquid around, on and inside the rim of her accepting fuckhole. You lean over her to her pointy ear and whisper.");
	output("\n\n<i>“Almost there, buttslut.”</i>");
	output("\n\nShe can barely contain herself at this point, fake-moaning to encourage you to hurry up. You give her wiggling tush a firm spank, although that only makes her do it more.");
	output("\n\nTaking the first dildo, a smooth, blandly shaped 9\" cylinder, and the plastic string of tiny beads, you wrap said beads around the fake dick in an ad hoc, somewhat shabby spiral shape. It looks more like a baseball bat covered in barbed wire after you’re finished with it.");
	output("\n\nEhhh, it’ll do.");
	output("\n\nThe other dildo is spiny and thinner but certainly longer: a kaithrit shape. That CEO from her story really must have rubbed off on her, hm? Also seems to have an on/off switch...");
	output("\n\nPutting the two together gives them a full 3\" width: just enough to make her scream.");
	output("\n\nOo, can’t forget that bowl either. You align Jesse’s personal bowl underneath her, making sure her semi-hard rod is angled right over it. Perfect.");
	output("\n\nOn with the show!");

	IncrementFlag("JESSE_TIMES_TRICKS");

	clearMenu();
	addButton(0,"Next",jesseSexBagOTricksII,x);	
}

public function jesseSexBagOTricksII(x:int = -1):void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("You place your open palm on one of Jesse’s soft asscheeks, bidding her to stop her wiggle show. She does so, making her posture rigid all along her body. Her fleshy tongue undulates and licks at the air almost on its own accord while you have a few squeezes and plays with her buttflesh. ");
	output("\n\nYou saunter to over to her side, then bend over to meet her face. [pc.eyes] and nebul-eyes lock in place.");
	output("\n\n<i>“Ready, buttslut?”</i>");
	output("\n\nJesse nods and murmurs with approval, her face becoming rosey from arousal.");
	output("\n\nTaking the two dildoes and holding them together in one hand, you press the combined heads against her lube-glistened sluthole and <i>slowly</i> insert. A deep groan comes from the bound strumpet, one that rises in pitch the deeper your abominable creation goes. Those little spines and the millimetre wide beads snag and pull on her inviting rim, you can only imagine what they’re doing to tease her insides.");
	output("\n\nInstead of recoiling from the brutally slow insertion, Jesse actually pushes back against it: shit, she <i>really</i> wants this, the dirty bitch...");
	output("\n\nYou stop once you reach the on/off switch for the cylindrical rod, giving her another slap on her rump. She yelps in response and you’re certain she’d be leaping up from her spot if not for her bindings.");
	output("\n\nYou reach for her underside so you can let the cock-vibe do its work. Grabbing hold of her slender member isn’t that difficult and you dexterously flick the switch that turns the little pink tube on. A bent over Jesse shivers with visible goosebumps as steady stimulation takes hold of her femcock. She keeps schtum however, her previous bluster of fake moans and hip wiggles giving way to a hidden stamina: you’re really going to have to milk this girl!");
	output("\n\nNo worries, the main event hasn’t even started and all it takes is the flick of a switch. Giving her bound up dick a firm goodbye squeeze, you purposefully fiddle around with the back end of the vibrator in her butt. Jesse’s shoulders wobble a little as you do but she’s still not letting up her resolute posture much. Oh well, time to break her... no sooner than you’ve turned on the vibe, the asswhore tries to hold in her girlish whines.");
	output("\n\n<i>“Hng...shre...”</i>");
	output("\n\nOf course, being gagged up makes it sound like devolved nonsense. You spank her on both cheeks a couple of times, each one a light <i>snap</i> that reddens her white skin with each hit. She whines all the more as you continue, her hips gyrating to your hand movements. With the prime real estate view you have of her stuffed butt, you use the back of your finger to trace an outline around her rim. Just the touch alone makes her slip on her bound hands and she struggles to hold herself back up again. You even manage to draw out a stifled whine at the same time.");
	output("\n\nThe undertone <i>bzzzz</i> of the two vibrating toys jumps up in intensity as you adjust their strength. Jesse’s tongue practically slobbers as you do so, her grip tightening on the bed covers. Again, her posture falters temporarily as new waves of torturous pleasure fill her tiny, bound body. How about adding some spice? You get a grip on her hair and pull her head up slowly so that her ear is only a few inches from your [pc.lipsChaste].");
	output("\n\n<i>“Mm, feels nice, buttslut?”</i> you whisper, making sure to really make your lips smack together.");
	output("\n\nJesse nods, her eyelids fluttering and struggling to keep in place. You tug just a little bit more on her hair then let go, giving another particularly harsh spank on her rose-red derriere.");
	output("\n\nThen a thought hits you...");
	output("\n\nYou bend lower to get a view of her bound up femcock and then ");
	if (pc.isNice()) output("using your palm, gently rub the pulsing head of her rod.");
	else if (pc.isMischievous()) output("you tease the very outside of her cumslit with a fingertip in small, quick circles.");
	else output("you flick at her exposed cockhead with a finger, making sure to hit all parts of the pulsing pleasure bell.");
	output("\n\nYou can hear her audibly whine and whimper at the treatment, the small buttslut burying her face into the bed. Now you’ve got her.");
	output("\n\n<i>“Prrssshh... presh muh ah...”</i>");
	output("\n\nEven with her tongue held down and her head buried into the covers, you’re still able to discern what she means. <i>“You may not,”</i> you say offhandedly, giving her another spank. She squeals, her hips and butt shaking erratically in frustration. Just a little longer...");
	output("\n\nYou spend a few minutes caressing and slapping her thoroughly reddened behind. In between that, you tease her tensing and twitching sluthole with a knuckle and finger, just to make her squirm her all the more. Her face is still buried into the bedding but the rest of her still manages to keep itself upright.");
	output("\n\nHowever, you can see that the cock ring is giving way a little: a few slivers of pearly white hang off of the tip of her tortured femcock. It must’ve hurt a lot to force that tiny amount of cum out. She’s on the edge of bursting! Perhaps you should do the merciful thing? Or should she get <i>really</i> backed up?");

	clearMenu();
	addButton(0, "Release", jesseSexBagOTricksRelease, x, "Release", "She’s earned it, a nice light session for now.");
	addButton(1, "Continue", jesseSexBagOTricksContinue, x, "Continue", "Nah, make her scream for it and see how much she can <i>really</i> cum.");
}

public function jesseSexBagOTricksRelease(x:int = -1):void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("You figure she could do with a reward for enduring so well.");
	output("\n\nYou reach underneath her and gently palm at her rock hard femdick, brushing over her seeping cockhead every so often. Jesse audibly whimpers and shivers as you do, her back arching and bending as you tease her most sensitive of nerve clusters.");
	output("\n\nUsing your both hands, you fiddle with the binding arrangements on the cock and ball pincers so that they loosen, but still hold the pink vibe in place. As you do, Jesse groans and whimpers as her hard femdick fills with backed up blood. It bounces and twitches underneath, threatening to blow at any moment!");
	output("\n\nYou lean in close to her ear one more time.");
	output("\n\n<i>“Cum.”</i>");
	output("\n\nWith a pained, hoarse moan, the little buttslut’s femcock unleashes its stored jizz! The pearly white fluid comes out in thick, goopy strings right into the awaiting food bowl beneath her. Her delirious cries and mumbles continue as the last of those precious droplets leak into the bowl from her softening femdick. Such a trooper.");
	output("\n\nThe spent little strumpet collapses on her left side, her panting becoming wheezing as exhaustion takes over. From the side of the bed, you take the nearly full feeding bowl and place it next to her open mouth. You remove the spit-slicked gag from her head first, wouldn’t want her to choke after all that...");
	output("\n\nJesse picks up the smell through her nose and shuffles her position towards the bowl. Turning her head towards her ‘meal’, her tongue slowly extends into the middle of the gooey, opaline mess. A murmur of a moan breaks from her mouth but soon the sounds of a tongue lapping at liquid take over. As she slurps up her own salty refuse, you lovingly stroke her hair and hip in smooth, gentle patterns.");
	output("\n\nIt doesn’t take long for her to finish, what with her long tongue gulping down seed like it was sugar candy. The little cumslut even cleans out the bowl till there’s nothing left, leaving a light sheen of saliva on the surface.");
	output("\n\n<i>“F-finished...”</i> she half whispers, a small grin forming on her face. You undo her complex array of bindings one by one, giving her smooth white skin a rub here and a pat there as she lays on her side. She coos at your tender administration, curling up into a ball once you’ve finished. Extracting the lodged combi-dildo gives her a bit of discomfort, but you remove it gently all the same.");
	output("\n\nAfter packing her thoroughly used equipment away into her bag, you sit beside her and pull her up for a hug. Her limp little body feels slightly cold: hug time!");
	output("\n\nYou hold an intimate embrace with her, whispering your approval into her ear. <i>“Good girl, very good...”</i>");
	output("\n\nHalf an hour passes and Jesse seems to regain her stamina. <i>“Duty calls,”</i> she sighs, lazily sliding off the bed to redress. <i>“I-I’d love to see you again, " + jessePCTitleSex() + ".”</i>");
	output("\n\nYou note that slipping her boxers on makes her wince, probably cuz she’s a little sensitive down there.");
	output("\n\nOnce she’s finished, she gathers her bag, blows you a kiss, and leaves for the station.");

	processTime(60 + rand(15));
	pc.changeLust(100);

	clearMenu();
	addButton(0,"Next",jesseSexEnd);
}
	
public function jesseSexBagOTricksContinue(x:int = -1):void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("Being the devious sort, you figure you can really make her work for it.");
	output("\n\nWith her toy-stuffed tush angled up in the air, Jesse is practically begging for a good reaming. Well, you can at least give her an equivalent.");
	output("\n\nPutting your hand on the spiny kaithrit dildo, you very slowly pull it out of her stretched sluthole, much to her discomfort. Jesse whines and shivers as the little nubs grind against her prostate, innards, and stretched rim: a good sign.");
	output("\n\nOnce the lubed toy is free you pull out the vibrating dildo about half way. The pink string of tiny balls becomes even worse for your subjugated buttslut’s insides, the erratic patterns of your ad hoc dildo craft making her tense up her hole out of mild pain.");
	output("\n\nTuning it to its highest vibration setting and with the most devilish grin your face could pull, it’s time to begin the nefarious deed.");
	output("\n\nWith a little effort, you begin pushing and pulling on the vibrator. Immediately, Jesse starts whining loudly as every kind of sensation she’s been feeling builds into a deep, compounding assfuck. You have to go slowly at first: even with her apparent level of sphincter control, her body is fighting the agonizingly slow and nubbly plowing every step of the way. A <i>tinkkk</i> comes from underneath when her bound hands hit her bowl as she faceplants into the bed.");
	output("\n\nRegardless, you carry out your dirty minded deed. Keeping the rhythm irregular brings out the loudest moans: sometimes a shallow thrust, sometimes a deep, hilted penetration. You add a spank to her asscheeks every now and then, although they seem to do little more than make more red marks.");
	output("\n\nYou can see her bound up, angled femcock twitch and spasm erratically underneath her: she really <i>is</i> on the edge! The pain she must be feeling in her poor rod... at this rate, the cock binding might just rip itself off!");
	output("\n\nFiguring that her backup must be significant, you hastily undo the bindings on her dick and sack, leaving just enough tension around the pink cock vibe to keep it close to her urethra.");
	output("\n\nWith a few final pumps from the vibe in her ass and with hoarse, delirious cries of pain-fused pleasure, Jesse finally gets to cum.");
	output("\n\nWithout much ceremony, her 10\" femdick unleashes its backed up load. You quickly grab the spasming rod and direct it to her feeding bowl. Thick, pearly strings of spunk spurt and splatter in the bowl, quickly forming a layer of opaline goo. Five shots, six shots... her eighth shot ends in a dribble of watery fluid and the exhausted buttslut immediately slumps onto her side. She doesn’t pant so much as wheeze, every exhale punctuated with a faint, high pitched note.");
	output("\n\nYou’re not done with her yet, however...");
	output("\n\nSetting the full bowl of her cum in front of her drooling, tongue-leashed mouth, you remove the mouth-gag. Her long tongue is dipping into the warm fluid immediately! You push it a little closer for her ease, just to guarantee she gets it all.");
	output("\n\n<i>“Eat up, Jesse. All of it, every last drop.”</i> you encourage her, undoing her various restraints and bindings as she meekly laps and licks at her ‘meal’. There’s a defeated whine from the cum-hungry wench as you gently pull out the combi-dildo. Her abused hole even leaves a puckering gape as testament to your power over her.");
	output("\n\nJesse is so out for the count that she barely moves. To help her along, you pat and pet her on the hips and hair. A timid note of approval is her only response, but one that tickles your chest with a little flutter. Aww...");
	if (silly) output(" <i>you goddamn fucking psychopath omg wtf is wrong wif u.</i>");
	output("\n\nIt takes her a good few minutes for Jesse to finish her bowl. A noticeable trail of white goop hangs off of her tongue, it seems that she hasn’t quite finished all of it. Still, she did well enough.");
	output("\n\nPutting the bowl aside, you gently pull her up to your lap. Her exceedingly smooth, goosebumped skin feels heavenly against your [pc.skinFurScales] and you make sure to nestle her head on your [pc.chest]. You embrace her like a precious china doll, with kisses on the top of her head and a tight arm wrap round her soft middle. She almost seems to drift off in your arms, the occasional wince and whimper signifying her soreness. <i>“Good girl, very good...”</i> you whisper into her ear.");
	output("\n\nAfter a peaceful half hour, Jesse slumps forward from the bed to the floor of your cabin.");
	output("\n\n<i>“Owwwww, ow ow,”</i> she complains, rubbing her elbows. You can’t help but chuckle at it. While she very gingerly redresses, taking extra time with her tight boxers, and tries to take her distracted gaze away from you, there’s a window to repack her bag with the used toys. Once it’s packed she lifts it by the shoulder and blows you a kiss. With a mutual wave, she leaves the ship.");

	processTime(60 + rand(15));
	pc.changeLust(100);

	clearMenu();
	addButton(0,"Next",jesseSexEnd);
}

public function jesseSexTrapFunI():void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);
	var x:int = largestCockIndexThatFitsJessesAss();
	output("Before you come to answer, Jesse raises her hand.");
	output("\n\n<i>“Uhh, oh, um... feel free to shoot this idea down b-but I’ve a fun little toy I haven’t been able to use yet,”</i> she begins, fidgeting with her wrists. <i>“And well, I-I just wanted to do something less... rigid and more mutual, I s’pose.”</i>");
	output("\n\nYou’re definitely listening: it’d be a fun turnaround at least. But first, you ask what her <i>real</i> reasoning is considering that she has a history of... obfuscating, to put it tactfully.");
	output("\n\nWith her face turning away from yours and her fidgeting moving to her neck, she bites her lower lip. <i>“W-well, I think we’re not that different in some ways a-and you’re really cute. Those [pc.eyes]... and those [pc.hips]. Just want to... not stop touching you all over. I really like the sissy thing...”</i>");
	output("\n\nYou scratch the back of your head, then giggle at her. Guess it’s a cool idea? You say sure, you’re up for it. Jesse pretty much bounces on the spot, both enthused and at loss for words. Without pause, she undoes her bag and dives right into it. There’s a lot of clinking and clunking and it takes her a good minute to get <i>whatever</i> it is she wants from it. ");
	if (flags["JESSE_TIMES_TRICKS"] != undefined) output("Oh hey, it’s that weird lookin’ dildo landmine... oh. <i>Ohhh</i>. That’s going in you...");
	else output("It looks like she’s holding some kind of... dildo landmine?!?");
	output("\n\nKeeping the apprehension to yourself, you ask her what it is.");
	output("\n\n<i>“It’s just a f-fun thing. Let’s get on the bed,”</i> she tries to explain, already clambering onto the bed with the dildo-mine set up in no time at all.");
	output("\n\n<i>“It’s called a mutualizer... cuz it brings us both down to the same level,”</i> she grins, grabbing something else from her bag: some lube and an onahole? It’s a wide one...");
	output("\n\nYou get onto the bed and sit at one end while Jesse sits at the other. What’s in front of you is a matte-grey ‘box’ of sorts with two bright pink dildoes sticking out at opposite ends. Those fake dicks are pretty decently sized: 10\", curved up slightly, smooth, a bit skinny... <i>wait</i>. ");
	output("\n\nAs if guessing the source of your question-mark face, Jesse’s face is a flushed pink grin.");
	output("\n\n<i>“S-so now I kinda get to be inside you, huh? Tiny, small me, inside... mmm, inside [pc.name] Steele.”</i>");
	output("\n\n<i>Devious</i> buuut oddly cute all the same. You get yourself lined up, making sure your [pc.legs] can hold you up freely and comfortably. Jesse does the same and squirts some lube on both the fake cocks, making sure to work it into the bells. When both are slightly sheened in fluid, Jesse suddenly lifts her lower body up and practically impales herself on the pink dildo!");
	output("\n\n<i>“Ffffuuuck! Oh gods it’s been s-so long since I could do that... Mmm...!”</i> she wails. Her dangling femcock is already reaching semi-hardness as she forces herself all the way down to the base. Once she’s bottomed out, her femcock is already fully erect. Such a buttslut...");
	output("\n\n<i>“W-whats wrong, [pc.name]? N-nervous?”</i> she teases, panting with her tongue out as she idly tugs at her twitching wang.");
	output("\n\n<i>“Nooo...”</i> you say, your [pc.face] flushing a shade of pink. She was just really fast, is all! You can take that stupid thing up your butt, easy!");
	output("\n\nCopying her pattern, you lift your lower body up and align it with the dildo tip. As it parts the fleshy cheeks of your [pc.ass] and presses on your [pc.asshole], you visibly bite your lower lip. The cold material is giving you a tingly adrenaline rush. Jesse giggles at your hesitation.");
	output("\n\n<i>“Come oooon! Don’t be such a wimp, silly [pc.boy]...”</i> she teases, openly jerking her femcock towards you. <i>“It’s going to be great.”</i>");
	output("\n\nFine, fuck it! You push down from your [pc.hips] and your eager [pc.asshole] is speared by the smooth, cold dildo. A pleasured, rising whine is muffled by you biting your lower [pc.lip] as a reaction to adjusting to the length and width. ");
	if (pc.ass.looseness() > 2) output("It’s pretty easy going for your well trained [pc.asshole], letting you slide easily down to the base just like Jesse.");
	else output("It’s a tough insertion, your [pc.asshole] clenching tightly around the fake cock like it was your first. You make it to the base with some pained effort.");
	output(" Your prostate thanks you all the way: tingly, sharp, and pleasurable sensations fill your lower body in spite of your hole bearing the stretch.");
	output("\n\nWhen you make it to the base, there’s a few moments to take in what’s before you: Jesse happily sitting on a bright pink fake cock with the most red - faced grin you’ve seen from her. Then there’s you, perversely impaled in the same way...");
	if (pc.biggestCockLength() > 13) {
		output("\n\nYour half hard, [pc.cockNounComplex] meets Jesse's 10\" fempecker in the middle, dwarfing it in size. Her femdink gets bent by the sheer amount of your dick mass! ");
		if (silly) output("HO HO HO, MERRY DICKMAS. ");
		output("Jesse giggles as she watches the meat rod mess. <i>“Mmm, Steele’s monster cock...”</i> she coos.");
	}
	else if (pc.biggestCockLength() > 8) {
		output("\n\nYour half hard, [pc.cockNounComplex] meets Jesse's 10\" fempecker in the middle, two twin sizes rubbing their heads together. How cute! <i>“Mmm, I love twin touching tips,”</i> giggles Jesse, her femcock twitching and pushing against yours.");
	}
	else {
		output("\n\nYour half hard, [pc.cockNounComplex] meets Jesse's 10\" fempecker in the middle but is immediately dwarfed by her size. Her slender pecker lilts against your " + pc.cockDescript(x) + ". <i>“Mmmmhaha, look at it! So </i>cute<i>!”</i> she giggles, trying very hard not to belly laugh. <i>M-mean...</i>");
	}
	output("\n\nStill giggling, Jesse grabs and lubes the insides of the onahole. It’s a pretty robust one, made of some ultra-flexible plastic...? Hard to say. Once she’s done liberally lubing the entrance, she holds it over your tip-touching meat spears. It’s an interesting feat on her part for her skinny fingers hold her femcock and your [pc.cockNounSimple] in one hand lock.");
	output("\n\n<i>“Ready?”</i> she asks, pursing her mouth so that her ruby-flushed cheeks bulge <i>just</i> so.");

	IncrementFlag("JESSE_TIMES_TRAP");

	clearMenu();
	addButton(0,"Next",jesseSexTrapFunII);	
}

public function jesseSexTrapFunII():void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("You give her a quick nod, your eyes focused on the dual meat-sticks in the strumpet’s hand. The grinding urethra send little pulses of discomfort through your [pc.cockNounSimple] and into your tender loins.");
	//if (silly) output(" So much at steak, Liara, I fckn <i>lurv</i> steak.");
	output("\n\nThat’s all the window she needs. Jesse hammers down the long, thick fake-hole and it envelopes both of your rods! Immediately, the slippery smooth tightness binds both cocks together with very little effort. <i>Fuck</i>, it’s not just tight but hot too: almost like the real thing!");
	output("\n\nYou both moan loudly as it sinks further and further down. The onahole stretches out to accommodate both of your lengths: the very furthest depths feels so natural for your [pc.cockHead]!");
	output("\n\nJesse is already bordering on insensate babbling, her pretty pink tongue lolling around her mouth like an over-excited ausar.");
	output("\n\n<i>“B-both hands!”</i> she yelps while patting on the onahole. You take that as a cue, wrapping your palms round the soft plastic. She places her slender digits on top of yours, squeezing them against the material with some effort.");
	output("\n\nAlmost as an afterthought, she hits some sort of side switch with the bottom of her heel and the whole contraption starts sending weak, constant vibrations through the dildoes lodged in your asses!");
	output("\n\n<i>“A-and now... just gotta work it toge...together. L-like this!”</i>");
	output("\n\nSlowly, and with your additional grip, the eager buttslut pumps the onahole up and down. The tight squeeze around your " + pc.cockDescript(x) + " is rough at first but as [pc.cumVisc] pre-fluid seeps into and spreads around the insides, the tightness becomes sublime. Splodges of [pc.cumColor] mix with pearly cream to make a natural lube, certainly making it easier for Jesse to lead the pumping action.");
	output("\n\nAs she continues, making bolder and longer pumps that pushes your [pc.cockNounComplex] in <i>deep</i>, the toys snugly lodged in your assholes seem to vibrate and whirr with increasing intensity. The constant, debilitating throb sends your sensitive prostate into pleasure overdrive!");
	if (pc.balls > 0) output(" Your [pc.balls] can’t hold out forever! Churning, hot [pc.cumNoun] swirls and builds inside, ready for a gooey release...");
	output("\n\nYou can feel your limbs turn to jelly as your entire nervous system gives over to the joy brought by this complex arrangement of fucking. Catching a glance of Jesse, you can see that she isn’t letting up at all. In fact, she just keeps pumping harder and her squeaks and moans of euphoria rise out just as hard!");
	output("\n\nIf she keeps going, you’re gonna... gonna-");
	output("\n\n<i>“<b>Fffffuuuckk!</b>”</i>");
	output("\n\nYou both scream in unison as your onahole bound cocks erupt in cummy goodness. The backup from being prostate-teased so fiercely burns through your urethra, and the transparent plastic of the onahole quickly becomes a mixed, pale shade of [pc.cumColor]. Jesse frantically, wildly pumps with her small hands but quickly loses her grip as her small body gives in to its vices. ");
	if (pc.cumQ() >= 1000) output("The hot deluge of baby batter spurts and squirts from around the tight edges of the cum-dumped onahole, more than enough to cover both your [pc.belly] and Jesse’s midsection. It oozes and dribbles into the bed, soaking it with love juices.");
	else {
		output("The hot mixture of baby batter dribbles and spurts from the edges of the cum-dumped onahole, slowly sliding down your " + pc.cockDescript(x));
		if (pc.balls > 0) output(" and [pc.balls]");
		output(" with a warm tickle.");
	}
	output("\n\nJesse can barely hold herself up and she lurches forward, completely exhausted. On instinct you just about catch her chin on your shoulder, and you can feel her limp tongue against your [pc.skinFurScales]. You hold her for a few seconds, enjoying the thoughtless, wordless comfort of each other’s sexual heat. Then, the panting strumpet yanks you by the shoulders into a deep, tongue-heavy kiss. You reciprocate, [pc.tongue] meeting her fleshy mouth muscle and [pc.lips] locking to her slut-mouth. She loosely lays her arms round your neck, trying to get as much out of your mouth as possible. In turn, you play harder with her tongue so that she mumbles and squeaks through the muffled mouth-lock.");
	output("\n\nYou both spend several minutes bound to each others mouths, eventually giving way to a mutually satisfied embrace. All the while, the mutualizer provides a gentle, gut-warming throb through the dildoes still lodged in the both of you.");
	output("\n\n<i>“S-see? That was <b>awesome</b>,”</i> whispers a tired Jesse into your [pc.ear]. <i>“Feels good letting me choose things for once, hmmmm?”</i>");
	output("\n\nYou have to agree: the leftover spooge pool is an undeniable confirmation. You whisper back.");
	output("\n\n<i>“M-maybe...”</i>");
	output("\n\nYou give her a quick peck on the cheek then flop back against the bed. She does the same, using a lazy hand to fiddle with the switches on the side of the mutualizer. The pink fake dicks retract slowly and smoothly from within you, leaving a strangely comforting emptiness.");
	output("\n\nJesse takes her time getting herself up and running. The [pc.cumColor]-covered toy is buried very deep into her bag and the used up onahole looks positively pregnant after you’ve both been through it!");
	output("\n\nBeing so spent, you lay akimbo on your comfy, comfy bed and watch the wobbly strumpet delicately redress. You can see her face screw up as the tightness of her boxers squishes her slightly shrunken sack. Aw, poor girl.");
	output("\n\nYou give each other a silent wave and a blown kiss, then Jesse heads back to her place.");

	processTime(60 + rand(15));
	pc.orgasm();
	pc.applyCumSoaked();

	clearMenu();
	addButton(0,"Next",jesseSexEnd);
}

public function jesseSexRoleReversal():void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("Jesse pipes up before you come to an answer.");
	output("\n\n<i>“A-actuallyyy... I’ve got an idea,”</i> she says with a cheeky tone, swiveling from side to side on her heel.");
	if (flags["JESSE_TIMES_TRAP"] != undefined) output("\n\nHey, the last one turned out to be pretty nice... why not hear her out?");
	else output("\n\nHmm, you’d be open to hearing her out at least. You wonder how this could pan out.");
	output("\n\n<i>“I’m listening,”</i> you say with interest, tapping the side of your cheek.");
	output("\n\nThe dawdling strumpet clears her throat. <i>“I’ve had trouble keeping this thought out of my head. When you’ve got your hands all over me, I’m... I’m yours, one hundred percent. But just the once, I wonder: could I be the... one to lead?”</i>");
	output("\n\nShe flutters her eyelids in your direction and squeezes her small bust between her arms. <i>“Maybe just the once?”</i>");
	output("\n\nOh how could you say no to that");
	if (silly) output(" you goddamn monster");
	output("! Well, it’s probably very easy to but you’re still not really against the idea. You ask her for some details. She grins, points to her slowly hardening fempecker then points to your [pc.ass]. As clear as intent as any.");
	output("\n\nAlright, if we’re playing this game... you hastily make way to the bed and lay front first with your [pc.butt] protruding just <i>so</i> to encourage her. What can you say: 10\" of free dick!");
	output("\n\nJesse claps her hands together in glee. <i>“O-oh my, we’re actually doing it! This is so <b>cool</b>,”</i> she exclaims, bouncing on the spot. With haste, she rushes over to her bag, starts unpacking things, and flings them left and right. She quickly finds what she’s looking for, mulling over each item before organizing it at her side: a pink collar, a retractable lead, a fairly thick butt plug, and some lube.");
	output("\n\nWith everything in hand, she bounces onto the bed and straddles your back. She’s so light that it feels more like a large cushion against your spine. <i>“Just say if anything’s uncomfortable, I’m never quite sure how lax this thing should be...”</i> she says, putting her hands around your neck with the pink collar in hand. Its plastic material feels oddly warm on your [pc.skinFurScales]. There’s a sudden constriction on your throat as the collar tightens and then exacerbates that same warmth. You yelp in response but relax when you find breathing to be an unimpeded task.");
	output("\n\nAs she attaches then tugs on the taut leash, you find it yourself having to bend your upper body towards the ceiling. Truly, despite her small stature and lack of strength, Jesse knows a thing about submission holds and positioning.");
	if (silly) output(" I also heard she’s a Dota 2 pro who plays a great Crystal Maiden. <i>TheMoreYouKnow</i>.");
	output("\n\n<i>“F-feeling comfy, [pc.name]?”</i> she asks tentatively, sliding down your back towards your bare [pc.butt].");
	output("\n\n<i>“Mmmhm,”</i> you murmur, turning your head to her to give her a grin for confirmation. You wiggle your [pc.ass] as an invitation.");
	if (pc.hasTail()) output(" You bend your [pc.tails] against your back to freely expose your [pc.asshole]: there’s something very satisfying about doing so, like unveiling a dirty secret.");
	output("\n\nWhistling at what she sees, you then feel small, gel-covered digits spread your bare cheeks, then prod and play with your [pc.asshole]. As the cool gel meets your sensitive hole, you groan in contentment as the anticipation rises and [pc.eachCock] strains and hardens against the bed.");
	output("\n\nYour body is ready");
	if (silly) output(" fils-aime face");
	output(".");
	output("\n\nJesse shuffles further back again and you can feel her resting on your [pc.legs]. The leash is lax but you can tell that any amount of pull would make you bend yourself back on command.");
	output("\n\nYour temp-domme makes a grunting sound and turning your head briefly shows her hand pushing something into her bubble butt. <i>Ohh</i>. The plug, of course. Even in a top position, she can’t escape her need for anal...");
	output("\n\n<i>“R-ready?”</i> she calls out from behind, imitating an authoritative tone. You nod and wiggle your tush again. <i>“I said,”</i> she barks with an awkward <i>spank</i> across your [pc.ass], <i>“are you READY?!”</i>");
	output("\n\n<i>“Y-yes, Jesse...”</i> you reply back, a feigned timidness masking your confusion at her less-than-forceful approach to things.");
	output("\n\n<i>“Well then... I’m gonna... gonna fuck you stupid,”</i> she bites back, lining her now-hard 10 inch fempecker across your [pc.asshole]. <i>“Gonna fuck Steele right in the b-behind.”</i>");
	output("\n\n<i>“Do it, then,”</i> you half whisper, wishing she’d just pound you already.");
	output("\n\nAs soon as you finish complaining, you feel the sudden plunge of her rod spearing your barely prepped [pc.asshole]! You yell out in pain as she quickly bottoms out her full length deep inside of you! Now that’s more like it...");
	output("\n\n<i>“There, now no complaining,”</i> she chides with an unusual confidence, swatting your behind rather tamely again.");
	output("\n\nYou can feel her tugging on the leash a little as she starts rolling her hips back and forth. The slow, deep fuck is smooth and comfortable with all that lube she used, despite the surprise insertion.");
	output("\n\nShe pulls firmly on the leash as her hips hit your [pc.butt], so that each bottoming out is blended with you having to push yourself up or get choked. Her slender member feels gradual and constant against your prostate, milking and churning it with pleasant motions. You sigh in contentment at this mellow, soft buttsexing. Jesse vocalizes her own contentment with your hole, making sure to bottom out as much as possible so that you can feel her meatstick fill you up.");
	output("\n\nBut... she’s not quite following through.");
	output("\n\nAlready, you can feel that she’s losing her momentum somewhat. Her thrusts and humps, although deep, come slower and slower. Her tongue hangs out of her mouth as if she’s already on the edge of climax, but you’re not even close!");
	output("\n\n<i>“F-fuh... damn it, Steele, I c-cah..”</i> she moans out, stopping mid thrust. She puts her hands on the bed on both sides of you, the leash going slack against your back. <i>“I’m not... I-I never get to be on top much, I cah...”</i>");
	output("\n\nHer breath is quite heavy but you’re not sure that she’s actually tired out. Rather, it seems she isn’t willing to be the proper Domme she needs to be at the moment. You could encourage her to fuck you harder... or turn the tables.");
	if (silly) output(" I AM THE TABLE, IHDFHUUHFUGDHGIH");

	IncrementFlag("JESSE_TIMES_REVERSAL");

	clearMenu();
	addButton(0, "Encourage", jesseSexRoleReversalEncourage, undefined, "Encourage", "Pep her up, she’ll find away to make it work!");
	addButton(1, "Take Over", jesseSexRoleReversalTakeOver, undefined, "Take Over", "It’s no good, she’s just not Domme material. Power bottom the over-ambitious buttslut.");
}

public function jesseSexRoleReversalEncourage():void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("<i>“You can do it,”</i> you say in a needy tone, wishing for her to want it too. You give her firmly lodged femcock a few squeezes with your [pc.asshole] to remind her of just how <i>awesome</i> it feels to fuck a Steele’s ass.");
	output("\n\n<i>“Mm, I do love the feeling of this [pc.boyGirl]-butt,”</i> she says in a breathy tone, inhaling sharply through her nose afterwards. <i>“Been so long since I could... enter someone,”</i> she admits, gently rocking her hips against your [pc.ass] to tease at your hole. You coo in approval, giving your tush another enticing wiggle.");
	output("\n\n<i>“And you want to pleasure your idol, right?”</i> you verbally prod, pushing back against her shallow, slow humps. <i>“Cuz you’re filling me up <b>so good</b>...”</i>");
	output("\n\n<i>“Y-yeah! I want to fuck this... this </i>butt<i> pussy!”</i> she exclaims, pushing her envelope for dirty talk. <i>“Make " + jessePCTitleSex() + " feel amazing with my useless body...”</i>");
	output("\n\n<i>That’s it</i>.");
	if (silly) output(" Let the hate flow through you.");
	output("\n\nYou feel her shuffle around behind you, as if grabbing for something from her bag. Turning your upper body to get a proper look, she holds out a medipen device. <i>“I-it’s Priapin, I bought a few and I forgot I had some... I wanted to make this awesome so...”</i> she states, angling it to her wrist. <i>“Here goes.”</i>");
	output("\n\nWith closed eyes, she injects the thing into her. In seconds, you can see her face gaining a deeper, red shade as blood starts pumping all around her. Her eyes and eye-tatts screw up as a reaction, and her breathing gets huskier and throatier.");
	output("\n\n<i>“Fuck, t-that’s really <b>hot</b>,”</i> she moans, palming her tight sack from underneath you. That stuff works very quickly, it seems! She inhales through her teeth: <i>“gods, I wanna fuck you, Steele.”</i>");
	output("\n\nNow that’s what you wanted to hear!");
	output("\n\nWithout another word, the eager strumpet grips and pulls harshly on the leash, jerking you up! This sudden burst of energy from Jesse reignites the arousal within. She very quickly gets back into her rhythm from before, but it’s faster, <i>harder</i>. Every pound is followed with a hefty smack from her hips slamming against your blood-flushed [pc.skinFurScales] and she angles the leash up so that you’re always having to hold yourself up on your elbows.");
	output("\n\nAs you both get more and more into it, her fucking becoming a steady and rough pound into your [pc.asshole], your [pc.cocks] force a dribble of [pc.cumVisc] fluid into the bed. You can feel it forming a small damp patch that increases the more Jesse’s smooth femcock glides over your prostate with perverse ease. Not too long now...!");
	output("\n\n<i>“F-fuuh! Nggg, now I know why, nnngg, everyone wants to fuck <b>my</b> ass,”</i> she yells out, slamming her hips against your [pc.butt] hard enough to hurt you both. <i>“Just want to hhuu... FUCK it forever, bury it a-an-”</i>");
	output("\n\nHer words and voice devolve into slurred syllables and expletives most unbecoming, her frantic penetration of your well-fucked butthole reaching its peak. From [pc.eachCockHead] to the base of your loins, a surge of tense and overwhelming feedback fills you up!");
	output("\n\nYou cum ");
	if (pc.cumQ() >= 1000) output("a veritable torrent of [pc.cum] spouts straight into the bed fabrics like a debased fountain, coupling with your orgiastic, effeminate moans!");
	else output("thick strings of [pc.cum] shoot into the awaiting bed fabrics, a debased pool of refuse seed and a lurid, effeminate moan leave your body!");
	output("\n\nSpurred on by this, Jesse forces one final <i>slam</i> into your well fucked [pc.asshole] and unleashes her built up seed with a pained series of squeals and moans! You can feel her jerk in place as her body forces out the unnatural, burning hot lifejuice created by the Priapin in her system. It floods your innards in long bursts, each one making her member’s muscles tense and pull against your [pc.asshole]. The hot seed builds up and fills you until you can feel it overflowing around the tight seal formed by Jesses femcock!");
	output("\n\nThe near-screaming wench falls flat on your back as her impressive orgasm ends. Her breathing is more like an agonized wheeze, her small body ventilating at a post-marathon speed. Her fleshy tongue drags and slobbers over your [pc.skinFurScales] and her hands come to rest on your shoulders. <i>“Room...room’s spinning...”</i> she pants, a near-whisper forced through sore lungs.");
	output("\n\nThe mutual comedown is quite something. There’s a warm, shared glow that radiates from you to Jesse and back again. It’s so intimate ");
	if (flags["JESSE_TIMES_SEXED"] != undefined) output("and <i>different</i> ");
	output("from what you’d expect, the ‘flavor’ turning the experience into a memory of pure feeling.");
 	output("\n\nYou lay together for some time, occasionally giving each other a gentle, laze-laden kiss on the lips. Her right hand finds itself in yours and you give it a comforting squeeze. Soon though, the enervation takes over and you drift off...");
	output("\n\n...awaking a few hours later, your Domme-for-a-day lover having left with her gear. There’s a small note on the pillow next to your with: <i>‘&lt;3 so sore but so worth it’</i> written on it in impeccable hand-writing. Aw...");

	processTime(60 + rand(15));
	pc.orgasm();
	pc.applyCumSoaked();
	pc.loadInAss(getJessePregContainer());

	clearMenu();
	addButton(0,"Next",jesseSexEnd);
}

public function jesseSexRoleReversalTakeOver():void
{
	clearOutput();
	author("SoAndSo");
	showJesse(true);

	output("Damnit, you wanted cock and you’ll get some cock!");
	output("\n\nYou twist around and guide her face to be a few inches from yours.");
	output("\n\n<i>“Let me help you, Jesse. Just undo this silly little collar and I’ll... I’ll let you <b>cum</b> in me,”</i> you say in a cheeky voice, biting your lower lip to entice her.");
	output("\n\n<i>“Y-yes [pc.sir]...”</i> she says breathlessly, her rose tinted cheeks flushing red. You can feel her fiddle with and unhook the collar round your neck with relative ease. To spur her on, you give her member an encouraging squeeze with your [pc.asshole]. Once she has pulled away, you shuffle and turn yourself onto your back into a missionary position, then pull Jesse in closer by holding on to the back of her head.");
	output("\n\n<i>“Steady, Jesse,”</i> you half-whisper, keeping eye contact while you meticulously slip the collar round her neck. You can see her starry eyes glaze over with adoration as you do so, a few twitches through your [pc.asshole] telling you that you’re on the right track. When it’s all locked in place, you jerk the leash! Your unawares lover almost crumples onto your front, just stopping herself by putting her hands to either side of you.");
	output("\n\n<i>“Now,”</i> you say sternly, guiding one of her hands around the " + pc.knotDescript(x) + " of your [pc.cockBiggest]. <i>“Fuck me, you slut.”</i>");
	output("\n\nYou pull on the leash again so that her open lips are now pressed against your [pc.lips] and well, she can’t help herself. Her tongue and your [pc.tongue] enter a sloppy spiral of play, transferring coos of approval between you both.");
	output("\n\nThe power bottomed Jesse begins rocking her hips back and forth again, picking up her steady and <i>deep</i> pace from before. She’s already much more into it, her pelvis gyrating as she pumps in and out of you. Every thrust tries to eek out more and more space inside but she always manages to hilt into your [pc.asshole]!");
	output("\n\nOn the other side of things, her grip on your [pc.cockBiggest] is welcome but paltry so you put your free hand on top of hers to help you along. The strengthened combination of grips feels <i>amazingly</i> tight on your tender [pc.cockNoun], and the constant, smooth grinding of your prostate forces flecks of pre-cum to the very tip of the [pc.cockHeadBiggest].");
	output("\n\nJesse speeds up a little, making shorter, shallow thrusts that tenderize your strained hole all the more. She lets go of the mouth lock to breathe more easily and you ease back on the leash tension just enough for her to do so. Her face is only half a few inches from your [pc.face] and the poor girl just can’t take her eyes off of you: swirling, starry orbs detailed with glistening, black streams of ruined eye liner. You wrap your [pc.legs] right around her middle and use ");
	if (pc.legCount > 1) output("them");
	else output("it");
	output(" to pull her just that bit closer, wishing for her to exceed.");
	output("\n\nBut she’s close, you can feel it as her femcock continuously tenses and throbs within you. Hoping for a magical moment of unison, you furiously jerk at your [pc.cockBiggest] and feel your eyes roll back into your head as the pleasurable sensations take a toll on your body. Jesse helps you along, sensing your intent. In a few short, overwhelming seconds, the inevitable surge of hot, liquid love burns through your [pc.balls], your " + pc.cockDescript(x) + " and then ");
	if (pc.cumQ() >= 1000) output("erupts all over your body");
	else output("shoots in strings all over your body");
	output(" to a chorus of your enraptured voices! Jesse’s whines climb higher and higher in pitch, squeals turning into moans, then cries, and then one final string of throat-breaking squeaks as she unloads her baby juice into your thoroughly fucked innards!");
	output("\n\nShe slams her hips one final time against your [pc.ass] and the expectant, beautifully hot sensation rushes through you. It squeezes itself out from your blocked [pc.asshole] from sheer pressure alone! Trickles of her fluid roll down your [pc.skinFurScales], leaving a lurid patch on the bed fabric.");
	output("\n\nThe spent strumpet collapses on top of you, uncaring about the [pc.cumColor] dampness on your front. Her head falls neatly onto your [pc.chest] with a small thud, your wheezing lungs pushing it up and down gently as she also gasps for air. You feel her spent femcock retract from within you, leaving only the warmth of her spent seed.");
	output("\n\nYou pull her a little closer to you and lazily undo the collar. There’s a light red ring in its place, a loving mark for her to remember you by later. You fingers play with her once-perfect hair, strands of wine red twirled between index and pinky.");
	output("\n\nYou lay together for some time, occasionally giving each other a gentle, laze-laden kiss on the lips. Her right hand finds itself in yours and you give it a comforting squeeze. Soon though, the enervation takes over and you drift off...");
	output("\n\n...awaking a few hours later, your Domme-for-a-day lover having left with her gear. There’s a small note on the pillow next to your with: <i>‘&lt;3 so sore but so worth it’</i> written on it in impeccable hand-writing. Aw...");

	processTime(60 + rand(15));
	pc.orgasm();
	pc.applyCumSoaked();
	pc.loadInAss(getJessePregContainer());

	clearMenu();
	addButton(0,"Next",jesseSexEnd);
}
