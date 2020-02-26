/**
 * Nykke, xpac for oldest frostwym daughter
 * 
 * @author DrunkZombie
 *
 */
//[NYKKE_VERSION] 1 = original (nykke.as), 2 or anything else = new 2.0 version (nykke2.as)
//["NYKKE_BORN"] undefined = no kips reach mature young stage yet, timestamp = date of first kips to mature
//["NYKKE_MET"] undefined or 0 = intro not done, 1 = intro complete
//["FROSTWYRM_PSIONICS_TALK"] undefined or 0 = not talked to frostwyrm about psionics, 1 = talked, set in frostwyrmPsionicsTalk() frostwyrm.as
//["NYKKE_FUCK_HER_CUNT"] times you fucked her cunt
//["NYKKE_FUCK_HER_ASS"] times you fucked her ass
//["NYKKE_FUCK_YOUR_CUNT"] times she fucked your cunt
//["NYKKE_FUCK_YOUR_ASS"] times she fucked her ass

//check if one year has passed since first kips reached mature young age
public function nykkeIsMature():Boolean
{
	var days:int = 365; //number of days until nykke is mature enough for this xpac to trigger
	var matTime:int = days * 1440; //days * min in a day
	
	//this will set the nykke born timer for those that already have kids with the frostwym before this xpac (normally set in frostwyrmMatureYoung in frostwyrm.as)
	if (flags["NYKKE_BORN"] == undefined && flags["FROSTWYRM_KIP_COUNT"] != undefined && flags["FROSTWYRM_KIP_COUNT"] >= 1)
	{
		//those with 4 kips or more must have had a year since the first birth so we will set the flag a year back
		if (flags["FROSTWYRM_KIP_COUNT"] >= 4) flags["NYKKE_BORN"] = GetGameTimestamp() - matTime;
		else flags["NYKKE_BORN"] = GetGameTimestamp();
	}
	if (flags["NYKKE_BORN"] == undefined) return false;
	
	if (GetGameTimestamp() - flags["NYKKE_BORN"] >= matTime) return true;
	else return false;	
}

public function nykkeHeader(nude:Boolean = false):void
{
	author("B");
	showNykke(nude);
}
public function showNykke(nude:Boolean = false):void
{
	showName(flags["NYKKE_MET"] == undefined ? (flags["FROSTWYRM_KIP_COUNT"] == 1 ? "FROST-\nWYRMLING" : "\nELDEST KIP") : "\nNYKKE");
	showBust(nykkeBustDisplay(nude));
	author("B");
}
public function nykkeBustDisplay(nude:Boolean = false):String
{
	return ("NYKKE" + (nude ? "_NUDE":""));
}
//first meeting part 1
public function nykkeIntro01():void
{
	moveTo("FROSTWYRM LAIR", true);
	removeUvetoCold();
	processTime(60);
	
	clearOutput();
	showFrostWyrm();
	author("B");
	clearMenu();
	
	output("You go through your typical ritual of removing your effects and setting them safely in the corner of the lair as [frostwyrm.name] makes her way towards her familiar, elevated ice platform. When your vision focuses on the lair and its whole, dome-shaped entirety, you can’t help but feel that... something is different. You can’t quite put your finger on it.");
	output("\n\n<i>“Our first kip has proven rather... industrious, my Qal, in the time since you had last left us,”</i> [frostwyrm.name] says to you, sensing your unease and knowing what has your curiosity. <i>“Perhaps a trait inherited from its Qal. My kind are not typically so assiduous with their lairs.”</i>");
	output("\n\nIn the far corner of the lair, you see a large opening that you hadn’t noticed before – if it was there to begin with. You eyeball the opening to be maybe fourteen feet in diameter: too small for [frostwyrm.name] to fit through, but just large enough for a Frostwyrmling.");
	output("\n\n<i>“Our first toils within,”</i> [frostwyrm.name] says, motioning towards the cave. <i>“Our first is much too young yet to survey for its own nest, and yet, our first yearns for a dwelling all their own. It is unusual that any offspring would show such desires so early, though I would not aim to stifle their instincts. I have acquiesced to a personal dwelling within my own.”</i>");
	output("\n\nYou hear the occasional chipping sound reverberate from within the cave; it sounds like a rock against another rock, followed by a loud clanging of ice breaking apart and falling to the floor of the lair. You ask [frostwyrm.name] if you’re allowed to go inside. <i>“It is not my nest, my Qal. That is not for me to decide,”</i> [frostwyrm.name] responds, with a particular lilt to her tone, as if she were daring you to go and invite yourself into your eldest kip’s abode without permission.");
	output("\n\nWell, you decide, she might have a bedroom, but she’s still living in [frostwyrm.name]’s lair. You approach the mouth of the cave.");
	output("\n\n<i>“What is a ‘bedroom?’”</i> [frostwyrm.name] asks you curiously.");
	output("\n\nYou tell her that you’ll explain later.");
		
	addButton(0,"Next",nykkeIntro02);
}
//first meeting part 2
public function nykkeIntro02():void
{
	clearOutput();
	nykkeHeader();
	clearMenu();
	
	output("The floor of the small cave curves downward and to the left slightly before opening into a much wider, though still miniscule, living space. The light of [frostwyrm.name]’s lair doesn’t reach very well into the room, making it a bit darker than the lair proper. The icy walls are jagged and unrefined, gnashed apart almost aimlessly by tough nails and claws, although it still appears to be a work-in-progress: while it’s tall enough for your ten-foot-tall daughter to stand upright, there isn’t much in the way of wiggle room, and it’s only about ten feet deep.");
	output("\n\nStanding at the far end of the little cave is, unmistakably, your first and oldest kip, diligently clawing at the ice with her razor-sharp Frostwyrm talons. The ice is hard and unyielding, but with every three or four grating swipes against it, her claws manage to catch, and with a flex of her powerful biceps, she rips the ice straight from the walls in huge swaths. Then she starts again.");
	output("\n\nThe cave is littered and messy with shavings of ice coating the floor; you watch your step as you come inside, ");
	
	if (silly) output("and you loudly knock on the nearest wall, respecting her privacy, but nonetheless asserting your authority as her parent by entering without her permission.");
	else output("and you clear your throat to get her attention.");
	
	output("\n\nIt startles her, and she yips on the spot as she whips around. Her strong, blunt tail swishes just a few feet from you, then crashes into the right-hand wall, knocking off another loose chunk of ice.");
	output("\n\n<i>“My Qal!”</i> she says, surprised at your presence. <i>“I’m sorry, I didn’t realize you were with me.”</i>");
	output("\n\nYou forgive her, and ask her what she’s doing.");
	output("\n\n<i>“Well,”</i> she says, looking at the walls of her makeshift nest. <i>“It’s not done yet, but, I’m in the middle of making myself a nest, like my Qim’s.”</i>");
	output("\n\nYou admire her handiwork, running your hand along the nearest wall. It’s rough and uneven all over, as though she had constantly started at one part of the cave and then changed her aim to focus on another part. But, that aside, you admire her diligence and initiative: there aren’t a lot of kips out there that can say that they fashioned their own nest straight out of the ice.");
	output("\n\n<i>“Thank you”</i>, your daughter says lowly. Through your psionic link with her, you feel a tinge of pride: it’s clear to you that your opinion means a lot to her.");
	output("\n\nYou ask her what gave her the idea to make her own nest so soon. At the question, your daughter glances out of the cave, towards [frostwyrm.name]’s proper lair, and when she sees that [frostwyrm.name] is not listening in, she approaches you and lowers her voice to a whisper. <i>“Our Qim would never express it like this, but... she wants to repopulate our species with you, my Qal.”</i>");
	
	if (pc.isNice()) output("\n\nYou reply that it’s going to be an arduous undertaking, for sure, but [frostwyrm.name] has chosen you as her mate, and you’ll do whatever you need to satisfy your mate.");
	else output("\n\nYou aren’t sure if this is an appropriate topic to be discussing with your daughter, but... hell, when [frostwyrm.name] asked you to mate with her, you knew what you were getting into.");
	
	if (pc.isAss()) output(" And, you think to yourself (careful to not broadcast it over your psionic links), a lifetime of abstinence has made your dragon a bit of a banshee in the sack. Repopulating a species has never been so much fun.");
	
	output("\n\n<i>“And, well, I’m looking forward to it, of course, but... our Qim is hoping to have hundreds of kips. If I’m going to be the eldest kip out of hundreds, I’d like to set myself apart. Having a nest of my own would be a good start, I thought.”</i>");
	output("\n\nYou respond that " + (flags["NYKKE_MET"] == undefined ? "she" : "Nykke") + " is well and away the most unique of her sisters, and she doesn’t need her own dwelling to stand apart from the crowd. You’re referring, of course, to the increased melanin in her scales, turning them black.");
	output("\n\nShe, however, isn’t as ecstatic about her physical difference from her family as you apparently are; you feel an emotion similar to regret and frustration leak over your psionic link with your kip.");
	output("\n\nIn an effort to rectify your mistake, you agree that it’s a good way to get a headstart on establishing her position within the lair and the clutch as the first and eldest kip. [frostwyrm.name] tells you that it’s peculiar that any kip would be so forward-thinking, but you’re proud to see that your first daughter is already taking such initiative. You can’t say you built your first room from scratch.");
	output("\n\n<i>“Uh, yeah! What you said!”</i> your daughter chirps happily, satisfied that you’re agreeing with her in your own, non-Frostwyrm way.");
	output("\n\nBut there’s another, better way to set herself apart from the rest of the clutch. <i>“Is there?”</i> she asks, sitting herself on her knees and looking ");
	//figure she is about 6 ft 6 in or so on her knees
	if (pc.tallness > 84) output(" up");
	else if (pc.tallness > 66) output(" straight");
	else output(" down");
	output(" into your [pc.eyes]. <i>“Teach me, my Qal.”</i>");
	
	addButton(0,"Next",nykkeIntro03);
}
//first meeting part 3
public function nykkeIntro03():void
{
	clearOutput();
	nykkeHeader();
	clearMenu();
	
	output("You ask your daughter if she knows why you refer to [frostwyrm.name] as [frostwyrm.name], and not as your Qim, or by any other designation.");
	output("\n\n<i>“Our Qim told me it’s because you had difficulty pronouncing what others refer to her by,”</i> your daughter answers. You laugh and say that, yes, that’s true, but that’s not quite the question you had asked. <i>“Then I’m afraid I don’t know.”</i>");
	
	if (pc.intelligence() >= 20)
	{
		output("\n\nWell, first of all, you tell her that she should never be ‘afraid’ to admit that she doesn’t know something. One of life’s greatest adventures is asking questions, and from the answers you get, asking newer, smarter questions. It’s better to not know something and learn it than to know everything.");
		output("\n\nYou worry that what you just said came out as platitudinous, but your words seem to have their effect on your daughter, and, through your psionic connection with her, you can tell that she’s trying to commit them to memory. You hope, as a parent, that your wisdom comes off as such.");
	}
	
	output("\n\nYou tell her that there’s a lot that goes into a name. You giving your Qim and your mate the name [frostwyrm.name] is, simultaneously, a way to give her a true, quantifiable sense of identity and familiarity with you; it’s a sign of endearment, because the name you had picked out for her, and the name she continues to respond to, means something to you both; and it’s a way to set her apart. Your own parents gave you the name [pc.name], and while there might be other [pc.name]s in the world, there is only one of you, and you wouldn’t be you if you weren’t [pc.name].");
	output("\n\nIt takes a moment for your daughter to process your line of thinking. Perhaps you had worded it inadequately, but all the same, after the sentences sink into her, you can see the inspiration alight in her eyes. <i>“A name would set me apart,”</i> she says determinedly, standing back onto her feet. <i>“Would you name me, my Qal?”</i>");
	output("\n\nYou could, if she wanted you to, but this is also her opportunity to name herself if she wanted. She’s already shown initiative in creating her own nest; what better way to truly make herself special as a Frostwyrm than to create her own identity?");
	
	if (silly) output(" You didn’t get a say in making your own name – some asshole named you and that was that – and you don’t want her to be stuck with the same fate.");
	else output(" You sometimes wish you could have made your own name to go by.");
	
	output("\n\nShe stands idly as she thinks, her eyes narrowed and focused, her four arms crossed. You can feel her psionic grip on your mind occasionally prod at you, and you let her; she’s likely looking for inspiration on what to name herself.");
	output("\n\n<i>“I think,”</i> she says lowly, her head hanging on her neck as she considers it. <i>“I think... I like the name Nykke.”</i>");
	
	
	output("\n\n<i>“Nykke?”</i> you repeat.");
	
	if (frostwyrm.short.toLowerCase() == "nykke")
	{
		output(" It’s, uh... you hesitate to call your daughter unimaginative, but clearly she didn’t put as much effort into it as you were expecting.");
		output("\n\n<i>“I like the name Nykke because it’s a beautiful name,”</i> she says simply. <i>“Giving it to our Qim was a good decision. If I took the name Nykke for myself, it would mean that my Qim and my Qal are never too far away from me.”</i>");
		output("\n\nThis may get confusing for you later, but if your daughter really is set on the name Nykke, then who are you to stop her?");
		output("\n\n<i>“Well, that, and,”</i> she says sheepishly, laughing a bit to herself, <i>“I don’t exactly... know any other names.”</i>");
	}
	else
	{
		output(" <i>“It sounds... unique. Special. I feel like, with a name like that, I can accomplish anything. It... feels like, if I were to ever leave my Qim’s lair, that the world would know that I belong to [frostwyrm.name] and to [pc.name].”</i>");
		output("\n\nIt’s a good name, you agree. And, once you and [frostwyrm.name] have those hundreds of kips, she can be confident that none of them will ever have the name Nykke. Your oldest daughter would be the only one with that name.");
	}
	
	output("\n\nNykke’s expression breaks into a wide, giddy smile, and she leans into you, nuzzling her smooth face against yours, showing her affection the same way [frostwyrm.name] does. <i>“Thank you, my Qal,”</i> she says, giving your cheek a long, exaggerated, loving lick with her flat, draconic tongue. <i>“For... everything. For being my Qal. I was worried what you might think when you saw my dwelling. Knowing that you’re so supportive gives me strength.”</i>");
	output("\n\nYou hug her and say that it’s just what any Qal would do for their kip.");
	output("\n\nBut, naming your daughter was just the first step. She still has a nest to chisel out of the ice.");
	output("\n\n<i>“Right,”</i> Nykke laughs, pulling away to resume her work. <i>“Thank you again, my Qal.”</i>");
	output("\n\nYou show yourself out and leave her to her work.");	
	
	flags["NYKKE_MET"] = 1;
	addButton(0,"Next",frostwyrmMainMenu, true,"Next","Head back into the main cave");
}
//[Main]
public function nykkeMainMenu(noskip:Boolean = true ):void
{
	clearOutput();
	nykkeHeader();
	clearMenu();	
		
	if (noskip)
	{
		output("You excuse yourself from [frostwyrm.name]’s warm embrace and say to Nykke that you’d like to join her privately in the personal dwelling she’s made for herself.");
		output("\n\n<i>“Of course, my Qal!”</i> Nykke says happily, eager to show you into her abode. [frostwyrm.name] sees you both off");
	
		if (flags["FROSTWYRM_KIP_COUNT"] > 1) output(", and allows the vacancy between her front legs to be filled with your younger progeny");
	
		output(".");	
		output("\n\nYou settle into the corner of Nykke’s little lair, resting on your rump; Nykke, your doting daughter, joins you, wrapping her large body around yours once again.\n\n");
	}
	output("You’re alone with Nykke in her smaller lair; you two won’t be disturbed by [frostwyrm.name]");
	
	if (flags["FROSTWYRM_KIP_COUNT"] > 1) output(" or the rest of the clutch");
	
	output(" while you’re here. Now that you two have some privacy, what would you like to do?");
	
	addButton(0,"Talk",nykkeTalkMenu, undefined,"Talk","Nykke’s proven to be a rather forward-thinking and driven kip. If you were to ask for her opinions on some topics, surely she’d provide some unique insight.");
	if (flags["FROSTWYRM_INCEST_OPTION"] == 1) addButton(1, "Sex", nykkeSexMenu, undefined, "Sex", "Fulfill your role as Qal and spend some personal, quality time with your Frostwyrmling daughter during a celebratory ‘inner circle coupling’ session.");
	else addDisabledButton(1,"Sex","Sex","You’ve currently elected to not celebrate the Frostwyrm tradition of ‘inner circle coupling.’ You should Talk with Nykke if you want to change that.");
	addButton(14, "Leave", frostwyrmMainMenu, true);
}
//[Talk]
public function nykkeTalkMenu():void
{
	clearOutput();
	nykkeHeader();
	clearMenu();
	output("You ask your Frostwyrmling daughter if she’s up for a bit of a chat. You’d love to hear her opinion on some topics.");
	output("\n\n<i>“Of course, my Qal,”</i> she says happily, nuzzling herself against you, her six limbs squeezing you affectionately. <i>“What’s on your mind?”</i>");

	addButton(0, "Mates", nykkeMatesTalk, undefined, "Mates", "Ask Nykke what qualities her ideal mate should have. Should they be strong, or smart, or just cute?");
	
	if (flags["FROSTWYRM_PSIONICS_TALK"] == 1)	addButton(1,"Psionics",nykkePsionicsTalk, undefined,"Psionics","Ask Nykke about her budding control over her psionic powers. You can’t say you’ve experienced what it’s like to have them first-hand, after all!");
	else addDisabledButton(1,"Psionics","Psionics","You’re far less educated about psionics than Nykke would be, and you probably shouldn’t go into this discussion without at least a little bit of forethought from [frostwyrm.name] first.");
	
	addButton(2,"Adventuring",nykkeAdventuringTalk, undefined,"Adventuring","You have a life outside of [frostwyrm.name]’s lair – one that’s rather adventurous, especially compared to the domestic life that Nykke has. Maybe she’d like to hear a few stories about your travels.");
	addButton(3,"Incest", nykkeIncestTalk, undefined, "Incest", "Maybe it’s time you reconsider your stance on ‘inner circle coupling.’");
	addButton(4,"Black Scales",nykkeBlackScalesTalk, undefined,"Black Scales","Ask Nykke about her unique melanin condition. She clearly doesn’t like talking about it, but maybe, if you help her work through her frustrations with it, she’ll have an easier time accepting herself.");
	
	addButton(14, "Back", nykkeMainMenu, false);
}
//[Mates]
public function nykkeMatesTalk():void
{
	clearOutput();
	nykkeHeader();
	output("You ask Nykke if she’s put any thought into what sort of person she’d want in a mate. There are all sorts of people in the world; if she gets a little lucky, she might find a mate that fulfills her every need and desire.");
	output("\n\n<i>“Uh... I can’t say I have, I guess,”</i> she says, her two left index fingers tapping on her chin in thought. <i>“The only experience I have with mates are you and our Qim. So, I guess I’d want a mate that just gives me lots and lots of kips.”</i>");
	output("\n\nThat’s kind of a blasé way of describing your relationship with [frostwyrm.name]. At the word, you feel Nykke’s psionics probe your mind – she isn’t quite as quick or refined on her skills, and it takes her a moment to understand the definition of the word ‘blasé.’ You tell her that you and [frostwyrm.name] having lots of offspring is just one of the many qualities you fulfill as her mate.");
	output("\n\n<i>“How did our Qim decide for you to be her mate? Or... was it the other way around?”</i> she asks, inviting you to explain how [frostwyrm.name] decided that you would be her ideal mate.");
	output("\n\nYou explain that you two met in combat. Nykke gasps, only slightly, through her nose; it never occurred to her that her parents were once enemies. You regale that you had unknowingly wandered into her territory once, and she mistook that you were trying to invade her space. You never actually asked [frostwyrm.name] why she attacked you; it seems so unimportant now.");
	output("\n\nAnyway, you had bested [frostwyrm.name] in combat. <i>“You, really?”</i> Nykke asks in bewilderment. You answer that you had done it <i>several</i> times, not just once. <i>“But she’s so much larger than you! And her teeth – she could have eaten you with one bite!”</i> You tell Nykke to ask her herself if she doesn’t believe you. There’s more to combat than whether one kind is smaller than another, or whether one kind has larger, sharper teeth and claws. You can go into deeper detail later, if she wants.");
	output("\n\nIn any case, [frostwyrm.name] had established her territory along a route that you regularly travelled, meaning you and she were at odds a number of times. And every single time you won, you let her go, because you didn’t want the blood of something as beautiful as herself on your hands.");
	output("\n\nBut, one day, [frostwyrm.name] managed to get the better of you. And when she had the upper-hand and was in a position to kill you – she didn’t. She recognized you and the fact that you kept sparing her, and she extended the same mercy to you.");
	output("\n\nNykke is hanging on your every word, her bright [pc.eyeColor] eyes lighting up every time you pause for effect. To finish your story, you tell her that [frostwyrm.name] recognized your strength, and pined that she hadn’t found another pureblood Frostwyrm like herself, so she decided that you were worthy to breed with her. You turn to Nykke and nudge her as you say that the rest is living, breathing history.");
	output("\n\n<i>“My goodness,”</i> Nykke says breathlessly, hinging herself tightly to you throughout your story. You can feel her large, Frostwyrmling heart beat through her chest in excitement at your story. You ask her if she has any ideas on what her mate should be.");
	output("\n\n<i>“I,”</i> she starts, and stops, several times as she tries to word her thoughts. Blood rushes to her cheeks, tingeing them a deep-sea-blue in embarrassment. <i>“I want to mate – I want a mate like you, my Qal.”</i> She hiccups in surprise at her own word-slip,");
	
	if (flags["FROSTWYRM_INCEST_OPTION"] == 1) output(" and it’s not lost on you. You shift your [pc.hips] slightly towards her, but make no other obvious movement, other than");
	else output(" and she knows what your stance on the subject is. You don’t press it any further, though, and motion for her");
	
	output(" to continue – what qualities do you have that she finds desirable in a mate?");
	output("\n\n<i>“The strength, for sure,”</i> she says, hugging your form a bit tighter, testing how taut your body is. <i>“A proper mate must be able to defend their dwelling and protect their clutch, and if you had the strength to fell someone like our Qim so many times over, I wouldn’t settle for anyone lesser.”</i>");
	
	if (pc.physique() <= 10) output("\n\nYou thank her for the compliment, but tell her that you’re not nearly the strongest of your own kind. Like you had said earlier, there’s more to combat than just bulk. <i>“Did you outsmart her, then?”</i> Nykke asks, and you say that, in a manner of speaking, you certainly used the right tools for the job. <i>“Then a proper mate must be intelligent and witty enough to outperform any opponent.”</i>");
	
	output("\n\nYou implore her to continue. <i>“And... a good, proper mate would show compassion, like you had shown to our Qim. You didn’t kill her, even when you could, and when she asked you to help her repopulate her species, you didn’t hesitate. A good mate would know when to protect a kind that needs help, and when a battle is over.”</i>");
	output("\n\n<i>“And a good mate,”</i> Nykke continues, her six limbs constricting you tighter as her fantasies start to get away from her, <i>“would be close with their kips, and spend lots of time with them. They’d ensure that their kips grew up strong, and wise, and with a strong sense of the world around them. And... a good mate would be able to listen, and share their ideas and stories with their mate and their kips. And a good mate–”</i>");
	output("\n\nNykke’s eyes lock onto yours, staring deeply into you, as she struggles with the last little bit she wants to say.");
	
	if (flags["FROSTWYRM_INCEST_OPTION"] == 1)
	{
		output(" You implore her to continue: she has your undivided attention. What else should a good mate be?");
		output("\n\n<i>“You,”</i> she whimpers, and you feel a number of emotions flood into you through her untrained psionic link with you. Happiness that you’re everything she could want in a partner; lust for you and the offspring she wishes you could give her; but, curiously, there’s also regret and frustration that [frostwyrm.name] has already claimed you, and that she couldn’t have you all to herself.");
		output("\n\nYour hands trail down your daughter’s scaly, muscled, powerful back, tickling at the crease between her wings. You lean into her and kiss her on the lips, and you linger there far longer than what most would consider ‘parental.’ When you pull away, you tell her that, if she has any <i>other</i> fantasies as to what the perfect mate should be like, you’ll be here to listen.");
		output("\n\nYou feel something hot, thick, and a little wet prod against your [pc.thigh] at your words, your message clear as could be to her. <i>“Okay, my Qal,”</i> she says breathlessly, barely able to contain her excitement.");
		pc.changeLust(10);		
	}
	else
	{
		output(" You tell her that it’s quite alright: you’ve heard all that you’ve needed to hear, and she’s made her wants for a proper mate clear to you.");
		output("\n\n<i>“Okay, my Qal,”</i> she says, exhaling a long, burning breath, thankful that you had interrupted her before she blurted out something she might regret saying to you.");
		output("\n\nAlthough, given your psionic link with her, and how she had trouble keeping it in check as her imagination got the better of her... you have a couple ideas as to what she wanted to say to you.");
	}
	
	processTime(5);
	addDisabledButton(0,"Mates","Mates","You already have a <i>pretty</i> good idea on what Nykke considers to be the perfect mate...");
}
//[Psionics]
public function nykkePsionicsTalk():void
{
	clearOutput();
	nykkeHeader();
	output("You ask Nykke how her handle on her psionic strengths are coming along. She hasn’t had nearly the time or the training to handle it the way her Qim does, but with enough practice, she’ll get there.");
	output("\n\nThe question is met with a quizzical pause. <i>“I’m... not sure what you’re asking me,”</i> she admits.");
	output("\n\nYou recall that [frostwyrm.name] didn’t have the same approach to psionics as you did, either. In her own words, what you call ‘psionics’ is the skill that Frostwyrms have that allow them to communicate without using words, like you are now.");
	output("\n\n<i>“Oh, like this?”</i> Nykke asks, her voice projecting into your mind directly. You concur: exactly like that. [frostwyrm.name] also said that Frostwyrms don’t necessarily communicate in words: they communicate in ideas and emotions, and are able to project feelings directly into whoever they’re connected with.");
	output("\n\nTaking that as a sort of challenge, Nykke focuses on you intently, attempting to channel her psionic skills into you. <i>“Are you feeling anything yet?”</i> she asks, and you laugh – you <i>can,</i> but all you’re getting is a bit of a headache, and if that’s what <i>you</i> are feeling, then she must be feeling it, too. You tell her to stop before she hurts herself.");
	output("\n\n<i>“I guess that answers that question, then,”</i> Nykke says somberly. You tell her to not get her hopes down: when she was still inside her egg, she was communicating rather ‘verbosely,’ for lack of a better term, and she was already capable of projecting her emotions on a tremendous spectrum to you and [frostwyrm.name]. So, she has the skills and the strength; it’s just a matter of learning to use it correctly.");
	output("\n\n<i>“Could you teach me, my Qal?”</i> she asks. Unfortunately, races like yours aren’t psionically adept like Frostwyrms are. You can’t communicate like [frostwyrm.name] does. <i>“Why is that? I thought that all creatures could do it, and it was a matter of attuning yourself to each other in order to establish connections.”</i>");
	output("\n\nPerhaps you <i>are</i> capable of it; you just never learned how to do it. You consider Nykke and [frostwyrm.name] to be gifted and privileged; being able to communicate to each other so purely is a real gift that should be shared with the world, if they could. There are an untold number of languages out there: if everyone could skip the words and jump straight to the ideas, a lot of barriers would be taken down in a hurry.");
	output("\n\nNykke ponders what you’re saying for a moment, and you occasionally feel her probe at your connection, searching your mind for inspiration. <i>“Do you think you could learn? To communicate like my kind could?”</i>");
	output("\n\n[frostwyrm.name] had put it best, when you asked her. In her own words, you are as equally equipped as any Frostwyrm; [frostwyrm.name] doesn’t seem to think you can’t be taught.");
	output("\n\n<i>“I could try to teach you, my Qal,”</i> she says, and you feel a tinge of anxiety across the spectrum of your connection – you can’t tell if she’s secretly hoping that you’d say yes, or that she immediately regrets offering.");
	output("\n\nYou reply that you’re supposed to be the Qal, and from what you’ve learned, that means you’re supposed to be the teacher. You’d suppose that, if Nykke went through the effort to teach you to communicate like a Frostwyrm, that would make her the Qal between you two.");
	output("\n\nA myriad of ideas and emotions leak across the connection simultaneously, and you can tell that Nykke is trying her best to restrict them from flowing to you. They’re all positive emotions, ranging from happiness that she’d be given the opportunity to be put in your position and help you the way you’ve helped her; to ideas as to how she might be able to impart what limited skill she has with her own psionics to you; to some... other, more personal fantasies about the sudden change in the relationship dynamic between you two, where she is the Qal and you are the kip.");
	output("\n\n<i>“Uh,”</i> Nykke stutters verbally, once she realizes that her emotions are getting carried away over the psionic link with you. <i>“We can get started right now, if you wanted, my Qal. I can try teaching you what I know.”</i>");
	output("\n\nWhy not; it’d be a fun bonding experience with your daughter, and [frostwyrm.name] can fill in the blanks for you both later.");
	output("\n\nThe next hour or so between you two is spent with Nykke trying to put to words what she does when she uses her psionic focus. What she concentrates on, and how she can filter one thought from another – it’s a far more involved process than you initially thought. The mind takes in so much information so quickly, all while coming up with its own thoughts, ideas, and expressions, that if Nykke weren’t careful and selective and simply let the whole gamut of thoughts across the link, you’d easily confuse yourself for her.");
	output("\n\nHowever, despite your best effort to learn, and Nykke’s best effort to teach, you ultimately don’t come any closer to understanding how psionics work, much less mastering them.");
	output("\n\nYou have a link to [frostwyrm.name], and to Nykke");
	
	if (flags["FROSTWYRM_KIP_COUNT"] > 1) output(", and to the entire clutch");
	
	output(", but while you are able to receive any thought, idea, expression, or inspiration, it’s a one-way connection for you, and you aren’t able to communicate your own thoughts back across it. Whenever you have a thought, Nykke is able to pick up on it and understand it, but that’s not the same as you projecting it to her.");
	output("\n\n<i>“Are there other kinds in the world that can communicate the way my kind can?”</i> Nykke asks, exasperated from an hour’s worth of diligence with nothing to show for it. You respond that, as far as you know, Frostwyrms are the only kind. Maybe it’s simply a uniquely-Frostwyrm trait.");
	output("\n\n<i>“No, I don’t agree with that,”</i> Nykke says with some finality, leaning into you, her eyes narrowing determinedly on yours. <i>“I understand what our Qim meant: we’re equally equipped. You<i> should </i>be able to communicate like I can. It’s just....”</i>");
	output("\n\n<i>“It’s just that you can’t?”</i>");
	output("\n\n<i>“I don’t know how to explain it. This is all very frustrating!”</i> she exclaims into her nest. <i>“It’s not like it’s some secret among my kind. I understand what I’m doing; any of my kind would understand if I asked them. But being unable to explain it in a way another kind, like yourself, my Qal, could understand... I feel so powerless and conflicted!”</i>");
	output("\n\nYou lean into your daughter, snuggling yourself against her enormous form. You thank her for going through the effort for you, and you understand that it’s not easy to do. You liken it to explaining what the color blue is to anyone that hasn’t seen it before.");
	output("\n\nNykke probes your mind, in an effort to understand what you mean, but she isn’t in there for long. <i>“Yes! Exactly like that!”</i> she says, clapping herself on the leg, excited that she can at least vocalize her frustrations. <i>“How in the Grand Qim’s shadow do you explain something so fundamental to someone that cannot grasp it?”</i> She leans into you, reciprocating the snuggle as she tries to calm herself down. <i>“At least your kind knows how to communicate such frustrations, my Qal.”</i>");
	output("\n\nYou stroke at her scalp, and the motion has a rather immediate effect: the tension you had felt over the link with your daughter dissipates immediately, and she leans into your scratching fingers affectionately. You two can try again later, if she’d like.");
	output("\n\n<i>“I think I’d like that, my Qal,”</i> she says drearily, the frustration taking a lot out of her energy. <i>“It’ll give me some time to think about it.”</i>");
	
	processTime(60);
	addDisabledButton(1,"Psionics","Psionics","You had just had a whole ordeal about this! Nykke is still a little upset over her inability to teach you to use psionics, so it’d be best to not press your luck for more right now.");
}
//[Adventuring]
public function nykkeAdventuringTalk():void
{
	var str1:String;
	clearOutput();
	nykkeHeader();
	output("Out of turn, you ask Nykke what she knows about the world outside of [frostwyrm.name]’s lair.");
	output("\n\nShe has to think about her answer for a moment: she taps at her chin and roams her eyes across the ceiling of her little room, considering how to formulate her response. <i>“I’m told that it’s very large,”</i> she says, after a moment. <i>“There is no shortage of potential mates out there, although our Qim says that she was searching for another of her own kind before she met you.”</i>");
	output("\n\nYou tell Nykke that you aren’t a Frostwyrm");
	
	//Placeholder: tf and race check for frostwym does not currently exist
	if (nykkeFrostwyrmTF()) output(", or, at least, you weren’t always, you were born as a " + pc.originalRace + ".");
	else output(", you’re [pc.aRace].");
		
	output(" You ask her to guess how many of your kind exist. <i>“Hundreds?”</i> she asks, and you tell her there are more. <i>“Thousands?”</i> More than that. Her eyes squint in concentration. <i>“Um....”</i>");	
	output("\n\nThere are more of your own kind than she might be able to properly envision: a number so large that she might not be able to understand the magnitude of how many exist.");
	output("\n\nAnd, on top of there being so many of your own kind, there are other worlds out there. Your kind have named the world as Nykke and [frostwyrm.name] know it as ‘Uveto;’ you’ve been to so many other planets and interacted with so many other kinds by now, that you’d have a hard time categorizing all of it.");
	output("\n\nYou start simple: you ask Nykke if she knows what it means to be warm. <i>“Yes!”</i> she says excitedly, happy that she’s catching up to your discussion. <i>“‘Warm’ is what we feel when we curl up with each other, my Qal. Although, and forgive me for saying, but... our Qim is much better at making us warm than you are.”</i>");
	output("\n\nWith a laugh, you forgive her, and agree: [frostwyrm.name] is very good at keeping her clutch warm. But, to continue, you ask Nykke if she knows what it means to be ‘hot.’");
	output("\n\nYou feel the same tugging at your mind, but ask her to answer in her own words. <i>“Um...,”</i> she stutters. <i>“No.”</i> You teach her that, basically, ‘hot’ is what happens when you’re too warm. <i>“Too warm? Is there truly such a thing?”</i> There is, yes: when you’re too warm, it feels like you’re suffocating, and that you’re trapped in your own body. If the air around you is too warm, it hurts to breathe; if the ground beneath you is too warm, it hurts to walk. When the warmth is all-pervasive, you can feel like there’s just... nothing you can do to escape it.");
	output("\n\n<i>“But, my Qal, it can feel that way if we are too cold, as well,”</i> she notes. You’re proud that she’s thinking like that! And she’s right: if it’s too cold, then it can feel just as limiting and painful. Just as there are places like Uveto that are always very cold, there can be places that are always very hot.");
	output("\n\n<i>“Is there any place that is neither?”</i> Nykke asks disdainfully; she’s finding it hard to believe that the world – or worlds – can be such difficult, unforgiving places to be. You answer that some places may be too warm, and some places may be too cold, but being able to overcome those obstacles and survive, and even thrive, in such environments is what makes kinds like your own so hardy. And, if your daughter is anything like you, she’ll have the strength and the knowledge to survive any environment, too.");
	output("\n\nNow that you’ve properly gotten Nykke hooked on your stories, you continue enthusiastically; you start with your parentage and that you’re an heir to... well, it’d be a difficult to explain in a way she understands, but, in the very barest, lamest terms you can, you explain that your own parent had passed away some time ago, and you’re on a journey to reclaim his own lair for yourself.");
	output("\n\n<i>“You did not stay with your Qim and your Qal until they were summoned?”</i> Nykke asks, and you confirm; your kind typically only stay with their parents until they’re fully matured, and then they set out on their own, to find their own lairs and their own mates. And, for reasons you’re not about to go into too much detail about, you never celebrated ‘inner circle coupling’ with your parents, either.");
	output("\n\nBut anyway, you’re getting a bit sidetracked. When your own father was, as Nykke would understand it, ‘summoned,’ you had set out on a mission to claim what was his for your own. That’s taken you to planets full of lush, dense, green jungle; planets of trashy, difficult, desert terrain and wasteland; deep into dark, rocky caves; and even to very small, man-made planets called ‘stations.’ Uveto is just one of the more recent stops in your mission to claim your inheritance.");
	output("\n\nYou feel something pulling at your mind; a curious, probing sensation, rummaging through your memories, almost the same way that [frostwyrm.name] plucks at your head when you use a word she doesn’t understand. As interested as Nykke is on your stories, she doesn’t understand half the things you’re saying. She probably doesn’t even know what a ‘green’ is, never mind a ‘jungle.’");
	output("\n\n<i>“Could any of us travel to any of these places as well?”</i> Nykke asks. You can feel her imagination running wild in your own head: she doesn’t like the idea of being somewhere that’s too hot, or someplace that’s somehow even colder than Uveto, but she nonetheless wants to explore them for her own. You tell her that she could – there’s nothing saying she couldn’t travel the stars with you, and visit all these new locations with you – but... well, one thing at a time.");
	output("\n\nNykke relaxes her body against you, her cheek against your collarbone, as she idly fantasizes about leaving the lair with you and traveling with you on your adventures. The two of you would travel to these ‘hot’ places; she could fly over the tops of the ‘jungles’ and she would help you navigate the dark ‘caves,’ and then");
	
	if (flags["FROSTWYRM_INCEST_OPTION"] == 1)
	{		
		output(", when you two find a spot that isn’t too warm, or too cold, or too jungle or too cave, she finds the perfect lair, one as big as [frostwyrm.name]’s, where she and her mate can raise their own clutch.");
		output("\n\nOf course, this imaginary mate of hers is unmistakably you: in Nykke’s personal, unbridled fantasies, it’s you that she settles down with and makes a clutch with. A <i>huge</i> one. One that fills the jungles and the caves until they’re full of nothing but your clutch; you two would find a world that has no Frostwyrms in it, and you’d spread your kind until you are the dominant species.");
		output("\n\nYou let Nykke entertain herself and her fantasies, up until you feel something hard, hot, and squishy poke against your [pc.thigh]; her own legs grind wantonly against you, until she’s unquestionably humping you. At that, you clear your throat, and she stops everything immediately.");
		output("\n\n<i>Sorry,</i> she says to you over your psionic connection.");
		output("\n\nYou don’t chide her, but you remind her: one thing at a time.");
		pc.changeLust(10);
		str1 = " <b>that’s</b> for sure.";
	}
	else
	{
		output("...");	
		output("\n\nShe fidgets slightly, as she realizes that her fantasies are pouring through her and into you. Just as you begin to feel a tinge of what is unmistakably lustful longing, she catches herself, and ceases her rampant, unbridled psionic fantasies.");
		output("\n\n<i>“I’d like to do that with you someday, my Qal. If I can.”</i>");
		output("\n\nOne thing at a time, Nykke.");
		str1 = ".";
	}
	
	processTime(5);	
	addDisabledButton(2,"Adventuring","Adventuring","You’ve just talked about this! The idea of traveling the stars and seeing new cultures and peoples is an exciting idea for Nykke" + str1);

}
//[Incest]
public function nykkeIncestTalk():void
{
	clearOutput();
	nykkeHeader();
	clearMenu();
	output("You nudge at Nykke, getting her attention. <i>“Yes, my Qal?”</i> she says attentively, her eyes locking onto yours. You get the feeling that she already knows what you’re going to talk about.");
	
	if (flags["FROSTWYRM_INCEST_OPTION"] == 1)
	{		
		output("\n\nYou’re currently choosing to participate in the Frostwyrm tradition of ‘inner circle coupling.’ In other words, you’re consciously choosing to have sex with your daughters. Are you going to change your stance on this and opt out?");
	}
	else
	{
		output("\n\nYou’re currently choosing not to participate in the Frostwyrn tradition of ‘inner circle coupling.’ In other words, you’re consciously choosing to not have sex with your daughters. Are you going to change your stance on this and opt in?");
	}
	
	addButton(0, "Yes", nykkeIncestChange, undefined, "Yes", "Change your stance on ‘inner circle coupling’.");
	addButton(1, "No", nykkeIncestNoChange, undefined, "No", "Do not change your stance on ‘inner circle coupling’.");
}
//[Yes]
public function nykkeIncestChange():void
{
	clearOutput();
	nykkeHeader();
	clearMenu();
	
	if (flags["FROSTWYRM_INCEST_OPTION"] == 1)
	{			
		output("You tell Nykke that, as much as you enjoyed participating in the Frostwyrm tradition of ‘inner circle coupling’ up until this point, you think you need a bit of a break from it, and to not engage in the act with you for the time being.");
		output("\n\n<i>“Aw,”</i> she pouts, her hand snaking its way up your [pc.chest]. <i>“Can I not convince you to stay, my Qal?”</i> You tell her that you’ve made up your mind, and, with some authority, you tell her to respect the decision of her Qal.");
		output("\n\n<i>“Alright, then, if you say so.”</i> Her hand stops its questing up your body, and she resumes her platonic snuggling up against you. <i>“Be sure to let me know if you change your mind, of course.”</i>");
		flags["FROSTWYRM_INCEST_OPTION"] = 0;
	}
	else
	{	
		output("You tell Nykke that you’ve changed your mind: it feels inappropriate to be surrounded by Frostwyrms, in a Frostwyrm lair, and not be a part of their traditions. You’d like begin participating in these ‘inner circle couplings.’");
		output("\n\nNykke’s eyes gleam with joy, and her mouth splits into a wide, excited grin - but, then, the corners crook upward slightly, making her look almost devilish and predatory. <i>“I was hoping you’d change your mind, my Qal,”</i> she says lasciviously, her long, flat tongue snaking out to lick at her chops. <i>“I’ll make sure you won’t regret it.”</i>");
		output("\n\nFrom the way she eyes you like a piece of meat, you’re not sure if you should be worried or aroused.");
		flags["FROSTWYRM_INCEST_OPTION"] = 1;
	}
	
	addButton(0, "Next", nykkeTalkMenu, undefined);	
}
//[No]
public function nykkeIncestNoChange():void
{
	clearOutput();
	nykkeHeader();
	clearMenu();
	
	output("You tell Nykke that it’s nothing, and for her to never mind herself.");
	output("\n\n<i>“Okay, my Qal, if you say so,”</i> she says, lowering her head and resuming her platonic snuggling against you.");
	
	addButton(0, "Next", nykkeTalkMenu, undefined);	
}
//[BlackScales]
public function nykkeBlackScalesTalk():void
{
	clearOutput();
	nykkeHeader();
	
	output("Lying as you are next to Nykke, you snake your hand down one of her large, muscular arms, until your hand meets hers. You intermingle your fingers with her claws, and give her hand an affectionate squeeze. You feel Nykke probe your mind for a moment, likely trying to find the significance of the action – and when she finds it, she squeezes back. A little too hard, at first, but then she eases up.");
	output("\n\nYou tell Nykke that you’d like to talk to her about something, but she doesn’t need to answer if she isn’t ready. You recognize that it’s a bit of a sensitive topic for her.");
	output("\n\n<i>“It’s about my scales, isn’t it?”</i> she asks dejectedly. You respond affirmatively.");
	output("\n\nNykke says nothing further, and instead lets out a long, heavy sigh. With the three arms you’re not holding, she lifts her hands to her eyes, so she can get a closer look at her own body. Her onyx-black scales reflect the light of her lair with a brilliant dark sheen, making it easy to focus on her compared to the whites and off-blues of the rest of the lair.");
	output("\n\n<i>“Sometimes, I think about how awkward our Qim must feel in her own lair,”</i> Nykke says suddenly, her tone still sombre. You wait patiently for her to continue. <i>“She has you, the most wonderful Qal in the world, and she has me");
	
	if (flags["FROSTWYRM_KIP_COUNT"] > 1) output(", and she has the rest of her clutch");
	
	output("– but she’s the only pure-blooded of her kind in the lair. I’d do anything for her, and I couldn’t imagine having anyone else as my Qim, but....”</i>");
	output("\n\nInstead of finishing the thought, Nykke turns to you, to look into your eyes. <i>“Do you think our Qim ever gets... I don’t know... lonely? That there aren’t others of her pure-blooded kind here?”</i>");
	output("\n\nYou respond, with all sincerity, that [frostwyrm.name] has never once wanted for company since she took you on as her mate, and she had you as her kip. <i>“Even though we’re not");
	
	if (nykkeFrostwyrmTF()) output(" pure-blooded,");
	
	output(" like her?”</i>");
	output("\n\n[frostwyrm.name] sometimes likes to remind you that you weren’t her first choice in mate. She had spent much of her life searching for another Frostwyrm like herself, but in all her searching, she couldn’t find one, and she had to ‘settle’ for you.");
	output("\n\nBut, you continue, she <i>also</i> likes to remind you that she doesn’t regret her choice in the very least. If she could go back in time, and she knew everything she knows now, and she found a pure-blooded Frostwyrm to mate with, she’d choose to mate with you, every single time.");
	output("\n\nYou tell Nykke that it doesn’t matter to [frostwyrm.name] that you’re different than her; you may not be a");
	
	if (nykkeFrostwyrmTF()) output(" pure-blooded");
	
	output(" Frostwyrm, but you’ve given her a beautiful, healthy, strong");	
	
	if (flags["FROSTWYRM_KIP_COUNT"] > 1) output(" clutch");
	else output(" kip");	
	
	output(", and you’ve filled the gap in her heart with your affection and attention as a doting mate.");
	output("\n\nAnd, you say as you squeeze Nykke’s hand, it doesn’t matter what <i>she</i> looks like, either. [frostwyrm.name] wanted a clutch, and she knew she was taking a risk committing herself to you – neither of you were sure you’d be able to make it work. As far as you and [frostwyrm.name] are concerned, Nykke has given you two a miracle, and you wouldn’t dream of having your firstborn kip any other way.");
	output("\n\nYou feel a light sensation seep through the connection between you – one that makes you relax in relief. But, it’s slight: your words are having an effect on Nykke, but she’s not totally convinced.");
	output("\n\n<i>“Still,”</i> she says forlornly, turning her hands over once in front of her. <i>“I just... I can’t help but feel like I don’t really belong–”</i>");
	output("\n\nYou cut her off from that destructive way of thinking. You tell Nykke that she is <i>your kip.</i> It doesn’t matter if her scales were white, or black, or green or purple or whatever; you’re not going to let something as small as the tone of her scales get in the way of letting you love your firstborn kip. Her scales may not be white, and you may not be a");
	
	if (nykkeFrostwyrmTF()) output(" pure-blooded");
	
	output(" Frostwyrm, but none of that matters to you or to [frostwyrm.name] – [frostwyrm.name] threw ‘standards’ and ‘traditions’ to the wind when she opted to choose you as her mate, and, as far as you’re concerned, you’d much rather have [frostwyrm.name] as your mate and Nykke as your kip as they both are than to have all three of you be ‘normal’ just for the sake of being ‘normal.’");
	output("\n\nWhat’s important to you and to [frostwyrm.name] is that Nykke is here, and that she is your kip, and that you are her Qal and that [frostwyrm.name] is her Qim. You three are a clutch. If you not being a");
	
	if (nykkeFrostwyrmTF()) output(" pure-blooded");
	
	output(" Frostwyrm doesn’t change that, then <i>nothing</i> will.");
	output("\n\nThe sensation of relief comes through much more clearly, now that you’ve made your love for Nykke and for [frostwyrm.name] as clear as could be to her. You can still sense just a tinge of apprehension, like a tick that refuses to let go, and you’re not certain if you’ll ever be able to get that out of her, but, apart from that, you can tell that Nykke is satisfied with your answer.");
	output("\n\n<i>“Thank you, my Qal,”</i> she says weakly, her hand squeezing yours once more.");

	processTime(10);

	addDisabledButton(4,"Black Scales","Black Scales","You aren’t sure if Nykke will ever <i>truly</i> be satisfied with the color of her scales... but now she knows that, to you and to [frostwyrm.name], it doesn’t matter what she looks like. You’ll always be her kip.");	
}
//[Sex]
public function nykkeSexMenu():void
{
	clearOutput();
	nykkeHeader();
	clearMenu();
	
	//find the cock to use 
	var kok:int = 0;	
	if (pc.hasCock()) kok = pc.biggestCockIndex();	
	var ppFrostwyrmling:PregnancyPlaceholder = getFrostwyrmlingPregContainer();
	
	output("You regard Nykke, her body curled and cuddled up against you; your naked [pc.skinFurScales] rocks and breathes against her own, nude, powerful form. You admire her Amazonian muscles and the tightness of her body; your hand idly, platonically strokes at the muscles at her back, slowly making its way down to the base of her tail. When your fingers tickle at the wide base of her tail, it fidgets and curls, just slightly.");
	output("\n\nYou feel something hot, wet, and squishy prod against your [pc.legNoun], and getting only hotter, harder, and wetter as time goes on. You’re thinking some decidedly un-parental thoughts about Nykke, and the fantasies openly flow through the psionic link between you two. You wonder if you even need to ask.");
	output("\n\n<i>“You don’t, my Qal,”</i> she says psionically; her body shifts against you, her massive, F-cup breasts drawing against you as she realigns herself atop your body. You’re face-to-face, her chest resting on your own, her pebbly blue nipples digging and pressing into yours.");
	output("\n\nYour hands explore each other sensually: hers on your body reverently, and she’s shaking, almost imperceptibly – she’s so excited at getting some personal time with her Qal that she’s acting like a nervous, blushing virgin.");
	output("\n\nHer Frostwyrm cock protrudes from her penile vent, weighing down heavily on your body as she gets harder and harder, her cock quickly snaking its way up your [pc.belly] with each of her draconic heart’s beat. Her tail droops down, pressed between her legs, and subtly masturbates her feminine genitals with its broad side.");
	output("\n\nShe, your doting and obedient kip, is waiting for your command. She fantasizes about you saying any number of things to her and get you two started: anything from");
	
	if (pc.hasCock()) output(" fishing your [pc.cock " + kok + "] out from between you two to properly claim her body, to");
	if (pc.hasVagina()) output(" rearing her hips back a bit so she can drive her own meaty mammoth of a cock into you and take you like a proper mate would, to");
	
	output(" something a little more... non-Frostwyrm, involving breeding holes not-meant-for-breeding.");
	output("\n\nHow would you have Nykke?");
		
	if (pc.hasCock())	addButton(0,"Fuck Her",nykkeSexFuckHer, undefined,"Fuck Her","Let Nykke’s instincts take over, and mate with her the traditional way.");
	else addDisabledButton(0, "Fuck Her", "Fuck Her", "You can’t very well do that if you don’t have anything to fuck her with!");
	
	if (pc.hasCock())	addButton(1,"In Her Ass",nykkeSexInHerAss, undefined,"In Her Ass","Introduce Nykke to some <i>alternative</i> methods of pleasuring your mate....");
	else addDisabledButton(1, "In Her Ass", "In Her Ass", "You need a penis to show Nykke this particular method of pleasure!");
	
	if (pc.hasVagina())	addButton(2,"Take Her",vaginaRouter,[nykkeSexTakeHer,ppFrostwyrmling.cockVolume(0),1,0],"Take Her","Nykke certainly looks ready and willing to learn the pleasures of your kind. A guiding, helpful hand will certainly put her on the right track....");
	else addButton(2,"Take Her",vaginaRouter,[nykkeSexTakeHer,ppFrostwyrmling.cockVolume(0),-1,0],"Take Her","Roll onto your front and present yourself to Nykke. You may not be able to breed this way, but, if she’s anything like you, she won’t turn down the invitation.");
		
	addButton(14, "Back", nykkeMainMenu, false);
}
//[Fuck Her]
public function nykkeSexFuckHer():void
{
	clearOutput();
	nykkeHeader(true);
	clearMenu();	
	//find the cock to use 
	var kok:int = pc.biggestCockIndex();
	var kokLen:int = pc.biggestCockLength();
	
	output("It’s a rather blasé, uninvolved way of mating, but you opt to lay there and do nothing. You tell Nykke, over your psionic connection, that you want her instincts to take control; you want to see what her body says is the most natural thing for her to do.");
	output("\n\nShe’s hesitant, but needy: her four hands roam over your body, feeling you sensually along your ribs, your back, and your [pc.chest]. And her hips roll forward, driving her shaft, still bloating with herself, up across your [pc.belly]");
	
	if (kokLen >= 13) output(", fighting your own incredible tool for your attention, but no matter how erect she is or how erect she’ll get, she can’t compare to her Qal.");
	else if (kokLen > 9) output(", combating your own dick for attention between you two; you’re equal in immensity, and she seems to enjoy frotting herself against you.");
	else if (kokLen > 5) output(", she clearly takes after her Qim a little more than you do, overshadowing your own length by a couple inches.");
	else output(", easily dwarfing your tool and sinking it into your [pc.skinFurScales] with its weight.");
	
	output(" You feel her massive testicles come to rest on your body, hefting themselves down on you, pent up and ready to seed a potential mate or two.");
	
	output("\n\nShe tries her best to remain gentle as she explores you, although her giddiness is apparent, with how quickly she moves from one new spot on you to the next without lingering to enjoy what you have to offer. Despite you being her Qal, or perhaps because of it, she treats you gingerly, like you’re a priceless artefact and she’s the archaeologist that found you");
	
	if (pc.tallness < 108) output("– owing, in part, to the difference in size between you two");
	
	output(".");
	output("\n\nYou hum as she has her gentle, attentive way with you: you thrust your [pc.chest] into her hands when she palms at your [pc.nipples], and you lift your [pc.hips] when her curious fingers search towards the small of your back, cupping your [pc.ass]. She’s very thorough, yet impatient; eager, yet inexperienced. She huffs through her nose, somewhat animalistic, knowing what she wants, but her combined Frostwyrm and");
	
	if (nykkeFrostwyrmTF()) output(" " + pc.originalRace);
	else output(" [pc.race]");
	
	output(" genes confuse her.");
	output("\n\nYou can read her every confused, addled thought and fantasy as she slowly works to understand your form. She wants to flip you over and to thrust herself into you");
	
	if (!pc.hasVagina()) output(", biology be damned");
	
	output(", taking a similar doggystyle position that Frostwyrms would; she wants for you to overpower her and do the same to her, proving to her once and for all why you are the Qal and why [frostwyrm.name] chose you; she wants to masturbate her length against your stomach, not that it accomplishes anything, as long as it keeps feeling good; she wants... she wants....");
	output("\n\nYou’re her Qal, and the Qal’s job is to pass on the knowledge of the previous generations to your kips. Nykke’s excited emotions are getting the better of her, so you gently grab her by two of her wrists and tell her to shush. At your instruction, she stops immediately, but she’s still tense and horny; she needs you to guide her. Her nature is still unruly and unlearned, and that’s why she was having such a hard time deciding how to have you. You’ll have to teach her the pleasures of mating yourself.");
	output("\n\nTo that end, you don’t leave her teasing, and you get straight to the point. Your left hand snakes between you two – you give her still-hardening Frostwyrm shaft a few, excited tugs, and she winces in pleasure as her precum jets forward, coating your palm up to your wrist – and you reach deeper, towards your own [pc.cock " + kok + "]. After shuffling it out from between your bodies, you slide yourself against the underside of her leathery testicles, your [pc.cockHead " + kok + "] prodding against her dripping draconic sex.");
	output("\n\nFrom your position, though, you don’t have any leverage, and Nykke is awfully heavy on you. So");
	
	if (pc.physique() <= 15) output(", with a determined grunt");	
	
	output(", you fulfill her fantasy: you grab her by the shoulders and roughly spin, flipping her over onto her back, with you laying atop her spread form. Her wings spread in surprise behind her, reaching far enough to slap onto both walls, and her tail thrashes a bit, but you know what she’s <i>really</i> feeling.");
	output("\n\nHer heart is hammering hard enough in her chest to make her scaly F-cups bounce in time with it, and if she could blush, you’d imagine her body would be beet-red. She reflexively tries to close her legs around you, but you hold her in place, at least long enough for you to properly position yourself. Once more, your [pc.cockHead " + kok + "] prods at her entrance, even hotter and wetter than it was before after that display of Qal-dom, and you thrust forward.");
	
	pc.cockChange();
	
	output("\n\nNykke has to keep her hands against her mouth to keep from yelling out, but the sensations you’re getting over your connection with her are all the words you need. Images flood your mind’s eye, of you cumming inside her already, and of her immediately swelling with dozens upon dozens of further kips. She imagines what they’d look like; how strong they’d be; if they’d take after you or after her more; and whether she’d have to share you with them in your inner circle couplings.");
	output("\n\nYou let her fantasize all she likes; you hook your arms underneath her heavy knees, lifting them and keeping them separate as you pound into her. Nykke squeals in pleasure between her clasped hands, and she, with some initiative, uses her massive tail to coil around you and keep you in place, right where you belong: coupling with her, <i>mating</i> with her, where she wants you to be.");
	output("\n\n<i>“Is it,”</i> she begs you, sentences forming and collapsing in her head over and over, unable to keep a straight thought in between all the pleasure you’re giving her as her Qal, <i>“is it wrong of me... to want you like this, my Qal?”</i>");
	output("\n\nRather than answer directly, you opt to tease her a bit, and ask if it’s wrong to be on her back, her legs spread, so she can get <i>fucked</i> – you say, punctuating a thrust hard enough to ripple her tight muscles and her soft breasts – by her <i>Qal,</i> like she’s <i>clearly</i> wanted so <i>badly?</i> Is it <i>wrong</i> to <i>keep</i> you for her <i>self?</i>");
	output("\n\nNykke’s head rolls to one side, and her massive (for her form) tongue lolls from her mouth, her eyes unfocused on the far wall of her room. Her cock flops about, fully erect and unhindered, spewing her precum all over herself and letting it splatter against the wall behind her. Her psionic imagery has all but vanished, leaving a fuzzy nothingness, although you can tell that, despite her blanking on you, she’s more susceptible to suggestion than ever.");
	output("\n\nSo, you answer her, as her Qal, and not as her lover. No, it’s not wrong of her to want you – and, if she truly wants you so badly, she should consider herself blessed to be born a Frostwyrm – but, you still have duties to the rest of the clutch, and to your mate, [frostwyrm.name]. The <i>last</i> thing she wants is to be a greedy, selfish kip that only wants you for <i>herself.</i> There’s a word for kips like that, in the Frostwyrm language.");
	output("\n\nHer eyes shift, locking onto yours. Her four arms lay limply at her sides; she’s resigned herself to the pleasures, the <i>masterful</i> pleasures of her Qal, and anything you decide to do to her.");
	output("\n\nYou end the thought by saying that she has you here, right now, and alone; so it’s not so selfish to want to keep feeling this pleasure. It’s <i>okay</i> to <i>want</i> to be <i>bred</i> by the most <i>perfect mate</i> she <i>knows</i>.");	
	output("\n\n<i>“My Qal,”</i> she says to you psionically, her thoughts interrupted with every thrust. Her legs close behind your back, wrapping and locking just above your [pc.ass], keeping you close to her as you ream and pound her cunt. Now that you’ve established that it’s okay to want what she wants, she orgasms: her pussy clamps onto you, her Frostwyrm biology rippling around your [pc.cock " + kok + "], ushering forth whatever sperm you give her to seed her eggs. And, to cap that off, her cannon of a penis erupts in front of you, with enough ferocity to launch and splatter onto the ceiling above you both; her cum drips and rains back down onto you, soaking into her cleavage and across her tight stomach.");
	output("\n\nAnd neither of her orgasms stop, even as you continue: every time you push into her body, she ripples around you once more, and another splash of her feminine cum washes against your [pc.legs] while another wave of masculine cum erupts from her geyser of a cock. Even through the pounding you’re giving her, and the constant state of orgasm, her body is begging you to seed it, and it’s doing that the only way it knows how.");
	output("\n\nYou don’t bother trying to hold off, and you satisfy yet another of Nykke’s fantasies by cumming inside her and giving her the seed she so desperately wants.");
	
	if (pc.cumQ() >= 900) output(" Your load is more than she was, or could possibly have been, prepared for: with just one load, she’s already so full that your [pc.cum] washes back against you, and you’re not even close to finished. Your emissions would leave any purebred Frostwyrm simultaneously envious of your production, and impatient for their turn. Her normally taut, muscled stomach evens out, then rounds with your seed, her body gluttonous for your every precious drop, regardless of whether any of it can take. Fantasies about having a clutch many times the size of [frostwyrm.name]’s pervade your mind over your connection, and with every fresh, hot load you put into Nykke, the already-fantastic size of your hypothetical clutch doubles on the spot.");
	else if (pc.cumQ() >= 400) output(" Your load would satisfy even a purebred Frostwyrm (you should hope!), and Nykke is no exception: her lips curl into a lust-drunk smile when she feels you fill her body; her normally-taut stomach evens out underneath the pressure of your load, and your [pc.cum] washes back against you when her womb can take no more. Even though nothing will come of it, more fantasies of your hypothetical clutch come crashing into you over your psionic connection, and she orgasms yet once more.");
	else output(" You can’t give her as much as a Frostwyrm could, but that doesn’t matter to her, in her state of mind: all she knows is that her Qal is coming inside her, and her Qal’s sperm will be with her eggs soon. It doesn’t matter that nothing will come of it; just knowing that she has it is more than enough.");
	
	output("\n\nEven when you’re done with your orgasm");
	
	if (pc.cumQ() >= 900) output(" (and that took you some time)");
		
	output(", Nykke continues to thrash and cum beneath you, well after her leathery balls have emptied and her cunt is as packed full as it’s going to get. The pleasure you’ve given her is nothing like the pleasure she gets from mating with anyone else in the clutch during an inner circle coupling, and her mind is equal parts alight with explanations and reasoning as to why as it is completely shut down and blank after such a tremendous orgasm.");
	output("\n\nDisregarding the mess she’s made – and she’s made quite a bit one – you shuffle up beside her, and take your regular position next to her, relaxing against the icy wall of her small lair. When you settle, Nykke’s body moves on instinct, resuming her cuddle against you, as if you hadn’t just fucked her brains through her ears and you hadn’t defined your position as the Qal of the clutch to her several times over.");
	output("\n\nThat said, it takes her a moment before she’s cognizant enough to form words. And even when she does, she lets her psionics do the talking for her instead. You don’t need to be told that you’ve just performed <i>immaculately</i> as her Qal: her limbs wrap around your body, holding you tightly against her, and she even begins to purr in satisfaction.");
	output("\n\nYou tell Nykke that, if she ever needs you to fulfill another of her fantasies, it wouldn’t be very Qal-like if you to not rise to the occasion.");
	output("\n\nDespite your goading, no fantasies come from her freshly-fucked imagination. Not yet.");
	
	processTime(10 + rand(10));
	pc.orgasm();
	pc.applyCumSoaked();
	
	IncrementFlag("NYKKE_FUCK_HER_CUNT");	
	
	addButton(0, "Next", nykkeMainMenu, false);	
}
//[In Her Ass]
public function nykkeSexInHerAss():void
{
	clearOutput();
	nykkeHeader(true);
	clearMenu();
	//find the cock to use 
	var kok:int = pc.biggestCockIndex();
	var kokLen:int = pc.biggestCockLength();
	
	
	output("Your hands trail their way down from the spot between her wings, feeling at her powerful muscles, until they come to rest on her glutes. Nykke sighs and pushes herself back into your grip, filling your hands with her booty; her tail swishes behind her lazily, and she enjoys the simple moment of grinding herself against her Qal, and that her Qal is touching her in ways she’s not totally familiar with, but finding pleasurable all the same.");
	output("\n\nDoing your best to protect your thoughts from Nykke, you think of the ways you could teach her the pleasures of mating like your kind can. She takes after you more than she does [frostwyrm.name], after all. As your hands pull and massage into her muscled butt, filling your palms and stretching her scaly skin, you think that there’s certainly <i>one</i> way to show her how to pleasure a mate that [frostwyrm.name] would never have thought of.");
	output("\n\nYou move your hands, putting them on two of Nykke’s wrists. Looking into her eyes, you instruct her – not as her Qal, but as her mate – to lay on her front. You tell her that the distinction is important, because you know she would unquestioningly follow any order you give her as her Qal. But if you’re her mate, she can dissent to any of your suggestions at any time.");
	output("\n\n<i>“Why would I do such a thing?”</i> she asks you psionically, not immediately moving to perform your suggestion. <i>“A proper mate would do as their mate would ask, wouldn’t they?”</i>");
	output("\n\nTo a point, yes. But, you clarify, if her mate were to ever put her in a position that she’s uncomfortable with, then a ‘proper’ mate would stop. Communication and trust is important between mates: a healthy relationship ensures that both mates are satisfied with each other, and that requires being honest and open at all times.");
	output("\n\nNykke considers your wisdom for a moment, and then leans forward and extends her huge, draconic tongue, giving you a platonic lick across your cheek. <i>“Thank you for the lesson, my Qal,”</i> she says, and then moves to perform your instruction:");
	output("\n\nShe disengages from you and stretches her ten-foot-tall Amazonian body alongside yours, lying flat on her belly on the icy floor of her lair. Her hips are a bit misaligned with the floor, accounting for her throbbing erection; her draconic testicles sag between her muscled thighs, spreading and pooling on the floor behind her. Her tail lifts up and nestles itself in the valley between her wings, providing unabated access to the rest of her.");
	output("\n\n<i>“Like this?”</i> she asks aloud. You tell her to raise her hips a bit; there’s no need to be uncomfortable. She follows your instruction, and with a loud ‘plap,’ her thick Frostwyrm cock slaps and bobs against the floor, freed from the pressures of her body. Every part of her is exposed to the air of her lair; you can tell, via your connection, that she finds the position somewhat natural, owing to the breeding instincts of her Frostwyrm heritage.");
	output("\n\nYou pull yourself to your [pc.knees] and shuffle behind her, investigating her exposed rear-end. Her Frostwyrm dick is long enough that its head presses evenly against the icy floor, and is thick enough to be confused for a third leg; her heavy balls jostle and flinch in impatience, her sack flexing and relaxing, knowing that you’re inspecting them; her bluish-pink vagina winks at you, beads of her lust pooling along her taint and dripping down her curvaceous balls; and her puckered blue anus pulsates, unsure if it likes the way you’re looking at it....");
	output("\n\nYou remind Nykke once again that, right now, you are her mate before her Qal. If she ever feels uncomfortable at any point, then she needs to tell you. You’re not going to rely on your psionic connection with her to know.");
	output("\n\nNykke, though, is more focused on you calling yourself her mate. Her breath catches in her throat, and her heart skips a beat or two; it’s every fantasy involving you fulfilled, all at once. If you could mean it in a more ‘permanent’ sense, she could die a satisfied Frostwyrmling right then and there.");
	output("\n\n<i>“I trust you, my Qal,”</i> she says dreamily, her hips swaying for you, enticing you to pick something to pleasure her. With that set, you lean forward, your own [pc.cock " + kok + "] hard as can be, and you poke it at her asshole.");
	output("\n\nShe flinches and freezes in place, instinctually understanding that this isn’t proper. You gentle shush her and stroke at her thighs as your [pc.cockHead " + kok + "] continues to prod at her, easing against her. This may not be how to properly mate, but having sex this way can be just as pleasurable as it can be ‘properly’ – maybe even moreso, if she’s one of the freakier types. She just needs to relax, and you’ll make sure she loves it.");
	output("\n\n<i>“O-okay,”</i> she says, and does her best to relax her body and allow you into her. True to your word, you’re gentle, treating her body like it was made of brittle wax instead of the raw, unbridled Frostwyrm muscle she is; your [pc.cockHead " + kok + "] spears into her, and you stop, with just the tip inside her. When she acclimates to you, you push in, just another couple inches, and you repeat the stop-and-go process.");
	
	pc.cockChange();
	
	output("\n\n<i>“T-this feels...”</i> she says, her four arms crossed and folded beneath her. She repeats the words every time you push a little further into her. She’s not telling you to stop, and her body isn’t fidgeting or tensing like she doesn’t like it, so, you don’t.");
	output("\n\nYou’re around halfway down to your [pc.base " + kok + "] after the third push into her.");
	
	if (kokLen >= 10) output(" Frankly, you’re surprised she’s managed to take you this far without trying to back out: you’d think she’d have at least <i>some</i> experience with anal play, considering how little noise she’s making, but, just in case, you don’t say how much is left. You don’t want to intimidate her.");
	else if (kokLen >= 6) output(" She’s taking you like a champ, her body shuddering with every push and relaxing with every stop. You doubt she’d believe you if you told her that you still have a ways to go, considering her experience with anal play.");
	else output(" It’s not very far, especially compared to how huge Nykke’s body is, but she’s tight as a vice, and, you’re sure, she’s thinking you’re as big as [frostwyrm.name] right now.");
		
	output("\n\nYou settle at that distance for now, and begin to pump against her, sawing your [pc.cock " + kok + "] halfway down, then back out. Her body remains still, and her breathing grows shallow and sharp; you hear an unpleasant screeching of her claws drawing against the hard ice as her hands clench in pleasure beneath you.");
	output("\n\nRunning your hands over her expansive, tight ass as you slowly sink into it, you ask Nykke how she’s feeling, and the sensations she’s experiencing. You could just as easily feel it over your psionic connection, but you want her to enunciate it. You tell her to feel how it is to be bent over for her Qal; to be in such a vulnerable position, knowing that she can trust you; and, especially, how it feels to enjoy sex without mating, like you’re doing right now.");
	output("\n\n<i>“This feels...”</i> she tries to say again, but the words just won’t come. You’re patient with her; to help her relax, you lean over her and plant several kisses along the underside of her tail, hoping that the closeness will get her to open up a bit. <i>“It’s... so different.”</i>");
	output("\n\nYou ask her if ‘different’ is bad, in this case.");
	output("\n\n<i>“No! No, it’s... I’m not uncomfortable, my Qal. And I’m not saying that because you’re my Qal.”</i> She shifts a bit, unconsciously, causing your [pc.cock " + kok + "] to shuffle inside her, which hits different, more sensitive muscles in her ass. She takes a deep, sharp breath through her nose, then sighs in pleasure. <i>“I never considered mating like this before.”</i>");
	output("\n\nYou tell her that most kinds don’t; it’s a bit of an... acquired taste, for sure. You haven’t even done this with [frostwyrm.name]");
	
	if (pc.cockTotal() == 1) output("– at least, not without a little bit of extra stimulation");
	
	output(", although that’s not because you haven’t asked. You’re sure she’d let you if you did.");
	output("\n\nAt her Qim’s name, Nykke looks over her shoulder towards you, her [pc.eyeColor] eyes focusing on yours. Her eyes are half-lidded in lust, but her gaze is nonetheless steely and resolute, determined on you. <i>“Take me, my Qal,”</i> she begs you. <i>“Let me feel all of you inside me.”</i>");
	output("\n\nShe wants you, in part because she wants you; in part because it’s genuinely pleasurable; and, in part, to prove something, either to you, or to [frostwyrm.name] (when she isn’t here to defend herself), or to herself. Whatever the case, you don’t hesitate to acquiesce to your kip, and you thrust into her, sinking the remaining distance into her tight, eager asshole.");
	output("\n\nNykke hisses through clenched teeth, her head resting on her two right forearms, her wings flapping lopsidedly, as you pound into her. Your two hands grip onto her muscular thighs like handles so you can fuck her down to your [pc.base " + kok + "]; you batter yourself against her upturned rump, pulling out far enough to leave just the tip, and then sinking down hard enough so that");
	
	if (pc.balls > 0) output(" your [pc.balls] audibly clap against hers.");
	else output(" your [pc.hips] slap against her, sending rippling shockwaves across her body.");
	
	output("\n\n<i>“Yes!”</i> she shouts. <i>“More, my Qal! Teach me the pleasures of your kind!”</i> At that, you lean over her already-prone body and hook an arm around her tail, your palm pressing into her spine to keep her in place and to give you more leverage. With your new positional power over her, you brutalize her asshole as best you can");
	
	if (kokLen >= 10) output(" and, if you were to guess, she’ll definitely need some time to recuperate, at the very least.");
	else output(".");
	
	output("\n\nThe pretences of this being a learning lesson on the pleasures between two mates has long since passed: Nykke gets the picture, and she wants her Qal to fuck her ass as badly as you do. The sound of your clapping bodies beating together echo off the walls of her small lair, punctuated every now and again by a high-pitched ‘ah!’ whenever you hit her from a slightly different angle.");
	output("\n\n<i>“My... Qal!”</i> Nykke chokes out, her tongue lolling from her open mouth, licking the ice beneath her. You feel a hot, wet burst of fluids against your [pc.legs], along with a clenching in her body; she’s cumming, her pussy spasming and milking nothing, her internal muscles pushing against your [pc.cock " + kok + "] rhythmically. Beneath her, her iron-hard cock, its head still flatly pressed against the ice, shoots thick bubbles of cum down its length; they burst from her cock head and wet ‘splorch’s, painting the ice with a quickly-growing puddle of her Frostwyrm jizz.");
	output("\n\n<i>“Seed me,”</i> she whimpers, her voice weak from the pleasure. <i>“I need your seed, my Qal. Please! I don’t–”</i> She pauses, her voice no longer able to keep up with her body. Despite that, she continues psionically, knowing that you probably want to hear her say it as badly as she wants to say it. <i>“It doesn’t matter that it won’t be for my eggs. I need your seed, my Qal! I need to feel you, inside me, on me, with me! No matter when or where or how; I need to be your mate!”</i>");
	output("\n\nYour body responds to her plight, and you join her, your world drowning in the pleasures and ecstasies that is Nykke’s huge, draconic ass.");
	
	if (pc.cumQ() >= 900) output(" In a stunning display of why you are the Qal and why [frostwyrm.name] has chosen you to foster her lineage, you absolutely <i>soak</i> her insides with your [pc.cum]. The first-of-many hefty loads bursts into her, and you can feel even her taut, powerful form bloat and flex just a bit in time with your seed; it pours down into her, rounding and even inflating her normally-taut stomach, and you still have yet more to give her. She gasps in pleasure, her eyes rolling into her skull, as she tries to remain conscious of her surroundings and the pleasures you’re giving her; she tries to clench her body, to keep any of your [pc.cum] from backwashing out of her asshole, but it’s no use, and your seed jets back against you when her body can simply hold no more.");
	else if (pc.cumQ() >= 400) output(" You satisfy her thirst, and then some: your [pc.cock " + kok + "] bloats again and again, unloading thick gouts of your [pc.cum] directly into her body. She sighs deliriously, sinking into herself, as she feels your jizz pour down into her, cascading along her inner workings until she can’t feel it anymore. Greedily, she has the sense to keep herself clenched on your length, to prevent anything from slipping out between you.");
	else output(" You might not be able to cum as much as a Frostwyrm, but as soon as your [pc.cum] soaks her insides, Nykke’s mind melts in satisfaction, knowing that her Qal has marked her. She can feel your jizz trickle down into her body, and that’s all she needs to know that her needs have been fully and totally met.");
	
	
	output("\n\nWhen it’s over, and you’re all jizzed out, you withdraw from her greedy, gripping asshole with an elongated slurp, leaving Nykke face-down ass-up in her lair. She’s panting in exertion, a lazy smile on her face and her eyes unfocused on anything");
	
	if (pc.cumQ() >= 900) output(", and she rubs at her tummy every now and again as your cum settles inside her");
	
	output(".");
	output("\n\nYou rub your flagging erection in between her asscheeks, hotdogging her a bit and wiping the excess juices off in the cleavage of her butt. You almost rhetorically ask if she understands the pleasures your kind are capable of; as expected, you get some bumbling, jumbled, indecipherable mess of a response.");
	output("\n\nWith your work done and your position as Qal <i>thoroughly</i> asserted, you take your familiar position next to Nykke, allowing her to cuddle up against you as she normally does. It takes her a moment to register where you are at all, and when she does, her movements are automatic and instinctual, as her six limbs slowly coil and wrap around your body to keep her close. A throaty resonance reverberates from her constantly: she’s purring, satisfied with you and your exemplary performance. You doubt she’s going to be forgetting <i>that</i> particular lesson anytime soon.");
	output("\n\nIn fact, you’re sure, if you were to ask her for another round right now, she’d probably be all for it....");
	
	processTime(10 + rand(10));
	pc.orgasm();
	
	IncrementFlag("NYKKE_FUCK_HER_ASS");	
	
	addButton(0, "Next", nykkeMainMenu, false);	
}
//[Take Her]
public function nykkeSexTakeHer(hole:int):void
{
	clearOutput();
	nykkeHeader(true);
	clearMenu();
	var poeLooseness:int;
	var ppFrostwyrmling:PregnancyPlaceholder = getFrostwyrmlingPregContainer();	
	
	output("You eye the one-eyed monster that is Nykke’s immense, draconic cock as it slowly humps and inflates its way up your [pc.belly]. It spills from her penile vent, already as thick around as your fist, and with her every excited heartbeat, it’s only getting longer and fatter. A single, clear dollop of her pre beads from its tip; after a particularly antsy, lustful shudder, it squirts from her, marking your torso.");
	output("\n\nNykke grunts awkwardly, noticing that she’s squirting on you and frustrated with her inability to control her urges. <i>“S-sorry, my Qal,”</i> she stutters, but you put a finger on her lips, shushing her.");
	output("\n\nYour other hand glides its way down your body, your fingers surfing over the line of pre Nykke’s put on your body; you bring it back to your mouth, while your other hand dips between you two, grasping at her cock, just beneath her wide, flat head. You look Nykke in her [pc.eyeColor] eyes as you lick your fingers clean and you give her dick a squeeze and a pull.");
	output("\n\nNykke whimpers, and her body shudders again; the cock in your hand bloats, and another, less hesitant squirt of pre rockets up her and onto your [pc.skinFurScales] again. You can practically hear her dick getting hard: the slight peeling sound of her penile vent flexing and opening, and the blood rushing into her appendage to inflate it and ready her for a hot, willing hole to breed.");
	
	if (hole < 0 && pc.hasPerk("Buttslut")) output(" You can hardly contain yourself at the thought of having such a magnificent tool scratching that ever-persistent itch; it takes no small amount of focus to put your duties as Qal before your inner identity anal-hungry slut.");
	
	output("\n\nStill, Nykke does little, even when she’s in such a ‘powerful’ position above you: her entire body straddling yours, two arms on either side of your body and her hips just a scant few inches from your own. She bites into her lower lip and hisses in lust, her eyes laser-focused on you and what you’ll do next. You could probably give her a handjob right now, and she’d blow her load in a matter of minutes (if that!), but you’re in the mood for something... meatier.");
	output("\n\nYou instruct Nykke to get off you, and she does. With your new freedom of movement, you, somewhat laboriously (for her benefit, knowing that her eyes are on your every curve and motion), flip onto your front. Then, you bring your knees to your [pc.chest] and you raise your [pc.hips] in the air, displaying every last part of you to Nykke. In your position, you ask her what her instincts are telling her to do – and you punctuate it with an enticing wiggle of your ass.");
	output("\n\nShe hesitates. You can feel the lust absolutely <i>pouring</i> from her, via your link with her, but her hands pace from her sides, to your [pc.ass], to her dick, back to her sides. Despite your position, she apparently needs some further cajoling from her Qal, so, you instruct her that when a prospective mate, least of all her Qal, presents their hindquarters, you either fuck them senseless, or you don’t. And you don’t think Nykke is going to pass up this opportunity.");
	
	if (!pc.hasVagina())
	{
		output("\n\n<i>“But,”</i> she stutters, noting your distinct... incapability to breed the way you’re suggesting. <i>“How am I to mate with...?”</i>");
		output("\n\nYou still have an empty hole for her to fuck, don’t you? It might not result in any offspring, but you want her thick Frostwyrmlick cock inside you. She’s free to turn you down if the option is unappealing, of course–");
	}
	
	output("\n\nTrue to your earlier assumption, Nykke, with your further instruction, allows her instincts to overcome her senses, and she lunges at your body, draping her muscled, Amazonian body over yours. Her hefty F-cup breasts press into your shoulders, and her thick, flat-headed cock rams itself into your [pc.thighs] repeatedly, as she tries to hands-free guide herself into you and wear you like a condom.");
	output("\n\nFirst, you tell Nykke to calm down; she’s not accomplishing anything other than getting herself worked up. So, she does; she stops her thrusting hips and rests her bloated, beating cock against your [pc.thigh]. Now, you instruct, she has to reach between you two and put herself inside you. She isn’t some dumb animal, and you refuse to do it for her.");
	output("\n\nYou can tell that she’s confused and frustrated: she’s unconsciously projecting a number of images and emotions over your psionic link, up to and including fantasies about how good you’ll feel, and distress that she didn’t get it right the first time. You tell her to calm down – it’s not a race. Mating is about the pleasure and the togetherness as much as it is about breeding, and getting so frustrated and tense is going to make it less enjoyable.");
	output("\n\nNykke takes a deep breath, in through her nose, and out through her mouth. It has a very apparent effect on the emotions she’s projecting. With a clearer mind, she reaches between you two, careful of her sharp claws against your [pc.skinFurScales], and she grips her cock by the shaft. You lay patiently still: it’s just a matter of working her way into you.");
	
	if (hole < 0) poeLooseness = pc.ass.looseness();
	else poeLooseness = pc.vaginas[hole].looseness();

	if (poeLooseness > 4)
	{
		if (hole < 0) output(" She finds your [pc.ass] easily enough and, despite the less-than-forgiving shape of her dick, your experience [pc.asshole] gapes and welcomes her warmly; with a quick, imperious thrust, Nykke slips into your body with little effort, and she’s already set and ready to give you the reaming you both want.");
		else output(" She finds your [pc.vagina " + hole + "] easily enough and, with a thrust of her eager hips, she’s already sunk a handful of inches into you, just like that: your spacious and experienced [pc.vagina " + hole + "] has no problem splitting apart for a cock even as wide and unforgiving-in-shape as Nykke’s. The initial penetration is little more than a formality to either of you, and once she’s in, she’s set to breed you properly.");
	}
	else
	{
		if (hole < 0) output(" She finds your [pc.ass] easily enough but, despite following her instincts and thrusting as soon as she finds a viable hole, your body doesn’t yield immediately. You hiss in displeasure, and she stops immediately, but you assure her that it’s fine; she just needs to take it a bit slower, and to work her way into you.");	
		else output(" She finds your [pc.vagina " + hole + "] easily enough, although she’s a little overeager when she does, and she batters her flat cockhead against your vulva, demanding entry into your body. You flinch in pain, and she stops immediately, but you tell her it’s fine; she just needs to work her way in slowly. She’s got a whole lot of cock, and you’re only one, small [pc.race].");
		
		output("\n\nLike the excellent student she’s proving herself to be, she does as you say, and tries again, but slower and more deliberate. The bluntness of her head makes it a challenge to split you open and introduce herself into you appropriately, but you’re relaxed, and she’s determined; after a bit of pressure and some wriggling for good measure, her dick slips into your");
		
		if (hole < 0) output(" [pc.ass]");
		else output(" [pc.vagina " + hole + "]");
		
		output(", and she’s all set to fuck you.");		
	}
	
	if (hole < 0) pc.buttChange(ppFrostwyrmling.cockVolume(0));
	else pc.cuntChange(hole, ppFrostwyrmling.cockVolume(0));
	
	if (hole < 0 && pc.hasPerk("Buttslut")) output("\n\nYou make no attempt to hide the sudden elation suddenly lighting up your mind from Nykke: the moment her thick, powerful cock speared itself into your ass, you couldn’t help but melt beneath her, submitting yourself to the pleasures of having something so <i>definitive</i> inside your [pc.ass]. Desperate for more of that wonderful dick, you buck back against her; Nykke is taken aback by your insistence, but, figuring that it must be a thing among your kind, she’s spurred to push into you again.");
		
	output("\n\nConflicting emotions and directives flood over the psionic link between you two: she wants to start fucking the life out of you right now, but she also wants to adjust and right herself inside you. Ultimately, her Frostwyrm instincts win out, and once she’s gotten a grip and some proper penetration into you, she pushes forward, quickly sinking inch after inch of her fist-thick, footlong cock into you.");
	output("\n\nYou grunt in pleasure, admiring how Nykke is letting herself go and the initiative she’s displaying; although she’s <i>aware</i> of your pleasure, it’s second to her own. Your hands clench into balls, and your cheek rests against the icy floor of her lair, as she sinks more and more and <i>more</i> Frostwyrmling dick into you; your body greedily slurps in every wonderful inch of your kip’s incredible tool, and despite the growing pressure inside you from the way she’s filling you out, you can’t see yourself hoping she’ll bottom out.");
	output("\n\nOf course, and unfortunately, she does: with an insistent thrust, her bloated, draconic knot hits you in the");
	
	if (hole < 0) output(" [pc.ass]");
	else output(" [pc.vagina " + hole + "]");	
	
	output(", and you feel her bloated testicles rest against your [pc.thighs]. Yet, despite having hit as deeply into you as she can for now");
	
	if (hole < 0 && pc.hasPerk("Buttslut")) output(", to your own dismay");
	
	output(", she continues to push, eager to knot you immediately: she leans into you, shoving you along the ice.");
	output("\n\nLike you said, though, she isn’t a dumb animal: rather than continue to thrust when she’s bottomed out, she first pulls back, and thrusts in again.");
	output("\n\nYou hiccup in delight at the sensation of Nykke fucking your");
	
	if (hole < 0) output(" [pc.ass]");
	else output(" [pc.vagina " + hole + "]");
	
	output(": the feel of her smooth shaft sliding out from you, just to glide back in and stuff you full of dragon dick, reminds you of why you agreed to be [frostwyrm.name]’s mate in the first place. And, on top of your own pleasure, Nykke’s own is feeding into you through her psionics – it’s enough to make your eyes roll into your skull.");
	output("\n\nNykke, meanwhile, has gotten a feel for her position, above you and pounding into you: she huffs in effort and in pleasure as two of her four arms hook underneath your body, her hands on your [pc.hips], simultaneously lifting you up and keeping you steady so she can fuck you harder. Her other two lay planted on the ice in front of you, for her own stability; the further she leans over you, the more her expansive, F-cup breasts continue to encircle and obscure your vision, but you can see her own claws flexing in the sheer pleasure of fucking her Qal raw.");
	output("\n\n<i>“My Qal,”</i> she says psionically; one of her hands presses onto your back, between your shoulderblades, dominantly ensuring that you don’t move so she can fuck you. <i>“I... I don’t think I’m entirely... in control. My body is... it’s mating you on its own.”</i>");
	output("\n\nNot only do you not scold her, you <i>encourage</i> her. You ask her how it feels to have her Qal beneath her; how it feels to know that she’s about to bust a huge fucking nut into you; and that you <i>want</i> it. That you <i>want</i> to feel her seed you and mark you.");
	
	if (hole < 0 && pc.hasPerk("Buttslut")) output(" By the Gods, do you ever – she’s some of the best dick you’ve ever had.");
	
	output("\n\nThe claps of her body pounding into yours echo off the narrow walls of her lair. The far corner crawls its way ever closer, with every forceful push of her dick into your body, sliding you along the icy floor. Nykke’s panting has turned into rough, nasally snarling as her orgasm approaches.");
	output("\n\n<i>“Our clutch... will be <b>magnificent!</b>”</i> she bellows into your mind. And, with one final push, her knot batters into your");
	
	if (hole < 0) output(" [pc.ass]");
	else output(" [pc.vagina " + hole + "]");
	
	output(" for the last time: your body yields, and she forces her last bit to enter into you, tying you to her.");
	
	if (hole < 0 && pc.hasPerk("Buttslut")) output("\n\nYour world explodes in bliss at being so <i>full</i>, so deliciously, wondrously, <i>magnificently</i> full with so much <i>glorious</i> cock. It’s all you can do to keep from blacking out from the pleasure: you wish to whoever’s listening (knowing full well that Nykke is) that you could experience this <i>forever.</i> To surrender <i>everything,</i> just to stay here, impaled on Nykke’s cock, until the day you’re summoned by the Grand Qim.");
	else output("\n\nYou grunt in your own pleasure, feeling so <i>full</i> and <i>packed</i> with Nykke’s dick; you can scarcely focus on anything, including Nykke’s own thoughts and emotions, so overridden with pleasure as you are. You twitch your [pc.hips] against her involuntarily, and every time you do, she thrusts a little more – not that there’s any more for her to give, but she’s single-mindedly determined to get as deeply as she can.");
		
	output("\n\nTo top it all off, Nykke cums, with a grunt and another push: her already-thick dick bloats even more to accommodate her flooding seed, and you feel every last drop as it splatters your insides.");
	
	if (hole < 0)
	{
		output(" Your guts are already stuffed by her invading member, but her cum is what truly makes you feel full and inflated: by the third gush inside you, your [pc.belly] has rounded out with her seed, and, with balls like hers, she only has more to give.");
		output(" You");
		
		if (pc.hasPerk("Buttslut")) output(" rapturously");
		else output(" greedily");
		
		output(" take everything she has, egging her with your own pleasure to give you <i>more.</i>");
		output("\n\nYou were close before she erupted inside you, and as soon as her hot Frostwyrm cum slides into you, you can’t help but explode right alongside her: your body convulses onto her, tightening your already-tight passage around her length and squeezing her in no particular pattern or thought. Your full-body orgasm clenches on her battering-ram of a cock, and your [pc.ass] gulps down load after fresh, hot load, soaking it all into your body and fattening you on her seed, until your stomach is positively round with her offering – but it’s not enough");
		
		if (pc.hasPerk("Buttslut")) output(", and it’ll never be enough");
		
		output(".");
		
	}
	else
	{
		output(" Your womb is packed to the brim by her second spurt, but Nykke’s balls, huge as they are, have oh-so-much more to give. You’re already split in half, and with her knot in place, her overabundant cum seeps from the seal in drips; your lower body fills out, somewhat uncomfortably, with her offering, and, if you two were compatible, you’d have no doubt in your mind that it would be taking several times over.");
		output("\n\nYou were close before she erupted inside you, and as soon as her hot Frostwyrm cum slides into you, you can’t help but explode right alongside her: you clench down on her, your [pc.vagina " + hole + "] milking her cock and urging her for more cum, despite how stuffed you already are and how you could get pregnant four times over with the load you have already. But you don’t care: all your pussy wants is for more of this wonderful dick to give you more of what Nykke wants to give you.");
	
	}
	
	if (pc.hasCock())
	{
		output("\n\nAnd, to top it all off, your [pc.cock " + rand(pc.cockTotal()) + "], erect and neglected this whole time, spurts your own [pc.cum] onto the ice beneath you, painting it [pc.cumColor].");
		
		if (pc.cumQ() >= 900)
		{
			output(" Perhaps spurned and inspired by Nykke’s performance, and her offering, you match her load for load and drop for drop, your [pc.cum] splashing another thick load and adding to the growing puddle beneath you both.");
		}
		else
		{
			output(" No matter how many times Nykke makes you cum by abusing your");
			
			if (hole < 0) output(" [pc.ass]");
			else output(" [pc.vagina " + hole + "]");
			
			output(", you feel like you couldn’t come close to matching her output.");
		}		
	}
	
	output("\n\nIt takes her several more loads, but, finally, after all of it, she’s done. Her Frostwyrm cock continues to twitch and leak inside you, but the spurting and the cumming has passed; she collapses on top of you, reeling from the pleasure and the exhaustion. All you two need to wait for now is for her knot to deflate.");
	output("\n\nYou’re both too blissed out to make for conversation – even your psionic link is unusually fuzzy and blank as Nykke rests on top of you. When her body calms, and her dick recedes enough to dislodge itself, a cascade of her pearly cum drips from you, splashing onto the ice in bubbly gouts and easing the pressure on your poor");
	
	if (hole < 0) output(" stomach.");
	else output(" womb.");
	
	output("\n\nYou hear what might be purrs – or snores – coming from Nykke above you. She offers no resistance when you shuffle beneath her, righting yourself until you’re lying on your back. Instinctually, Nykke’s six limbs wrap themselves around you once again, locking you to her.");
	output("\n\nNykke is capable of one <i>hell</i> of a round. You can’t help it – you’re already fantasizing about a round two.");
	output("\n\nShe’d probably be all for it, if you really wanted.");
	
	processTime(10 + rand(10));
	pc.orgasm();	
	
	if (hole < 0)
	{
		pc.loadInAss(ppFrostwyrmling);
		IncrementFlag("NYKKE_FUCK_YOUR_ASS");	
	}
	else
	{
		pc.loadInCunt(ppFrostwyrmling, hole);
		IncrementFlag("NYKKE_FUCK_YOUR_CUNT");
	}
	
	addButton(0, "Next", nykkeMainMenu, false);	
}
public function nykkeFrostwyrmTF():Boolean
{
	if (pc.race() == "frostwyrm") return true;
	return false;	
}