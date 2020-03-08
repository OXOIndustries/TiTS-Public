import classes.Items.Miscellaneous.Priapin;
/* Sera Impregnation */
// All for you, Damien

/*

Notes

•	Put [Breed?] option in her talk menu. Choose it and she’ll say she obviously takes contraceptive, doesn’t want paternity suits/brat running around her shop etc. Can’t change her mind about it unless you successfully complete Sex Party.

•	If successful Sex Party, she’s on a reasonably secure financial footing (and the relationship’s advanced a bit) so she’s willing to knock you up.

•	She actually has only one vaginal fuck in her pool, on review. Will cook up another to support this.

•	Normal human gestation. Kid can be either sex and probably gains one or two hereditary traits, e.g. has horns, purple skin, is a complete brat.

•	Once you’ve popped the sprog Sera can occasionally be found in the nursery (in her casual attire, thank you) during the evening, watching her progeny play. N-not that she cares, of course.

*/

public function pcSeraPregTime(percentage:Boolean = false):int
{
	// Time in minutes
	if(pc.hasVagina() && pc.hasPregnancyOfType("SeraSpawnPregnancy"))
	{
		var pregTimes:Array = [];
		for (var x:int = 0; x < pc.pregnancyData.length; x++)
		{
			var pData:PregnancyData = pc.pregnancyData[x];
			if(pData.pregnancyType == "SeraSpawnPregnancy" && pData.pregnancyIncubationMulti > 0 && pData.pregnancyIncubation > -1)
			{
				pregTimes.push(pData.pregnancyIncubation);
			}
		}
		if(pregTimes.length > 0)
		{
			var fullTime:Number = (272 * 24 * 60);
			var pregTime:Number = Math.max.apply(null, pregTimes);
			
			if(percentage) return (Math.round(((fullTime - pregTime) / fullTime) * 100) / 100);
			return Math.floor(fullTime - pregTime);
		}
	}
	return -1;
}
public function pcSeraPregDays():int
{
	var pregTime:int = pcSeraPregTime();
	
	if(pregTime < 0) return -1;
	
	// Time in days
	return minutesToDays(pregTime);
}

// Party Check
public function seraPartySuccess():Boolean
{
	// If PC has completed party event successfully
	return (flags["SERA_PARTY_INVITE"] >= 3 && flags["SERA_INFULENCE"] > 90);
}

// Intro
public function seraBreedingIntro():void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	// First
	if(flags["SERA_TALKS_BREED"] == undefined)
	{
		output("<i>“Do you use contraceptives, mistress?”</i> you ask hesitantly. Sera laughs.");
		output("\n\n<i>“No silly, I don’t,”</i> she snickers. <i>“I just screw the absolute fuck out of everything that walks through that door, and hey, if that means half a dozen brats running around this kid-friendly environment of mine and half a dozen paternity suits landing on my counter every month, that’s a price well worth paying.”</i> She sobers a little, reptilian eyes going a bit glassy; her hands ball reflexively. <i>“Ugh! Children.”</i>");
		output("\n\n<i>“Well, you know...”</i> you say, choosing your path of approach carefully, <i>“the cost of raising kids isn’t much of an issue for me. It’s already paid for.”</i> The succubus’s brow crinkles.");
		output("\n\n<i>“What are you talking about, bitch?”</i>");
		output("\n\nYou describe the nursery your dad left for you - how it is supported to accommodate almost any number of offspring you could feasibly have, and the drone you can summon to whisk them away to it. Sera is shaking her head in wonderment, squawking with laughter at every fresh detail, before you’re even halfway through.");
		output("\n\n<i>“Unbelievable,”</i> she says finally, grinning toothily. <i>“You really are the complete trust fund kiddie, aren’t you [pc.name]? I can’t believe you’d tell me all that, after what I told you about my own dad. A whole fucking deck... I’m going to punish you harder in future.”</i> Yellow eyes gleam, and a clawed hand runs up the curve of a hip. <i>“Really dig my nails in. If there’s anybody on this station that deserves it, it’s you.”</i>");
		output("\n\nTrying to ignore the explosion of butterflies in your gut, you open your mouth. Sera puts her hand up.");
		output("\n\n<i>“I’m not stupid dear, I can see what you’re angling at. You’ve got a breeding fetish, and it stands to reason that on the list of people you want to stuff you full of kids, your big dick pimp mama is at the top. It’s sweet, in its own creepy kind of way.”</i> Still smirking, she reaches out with a single painted claw and presses it into the flesh of your [pc.chest]; you breathe slowly as she scrapes it slowly downwards, tracing a loop around your belly button.");
		
		flags["SERA_TALKS_BREED"] = 1;
		
		// If PC has completed party event successfully
		if(seraPartySuccess())
		{
			seraBreedBegMenu(true);
		}
		// If PC has not completed party event successfully
		else
		{
			output("\n\n<i>“But it’s not going to happen,”</i> she continues. She raises the talon to cut you off again. <i>“I think you’re cute and all [pc.name], but how long have we really known each other for? And I know you’re saying you’d take care of it, but things change real fucking fast out here on the frontier. I’m just barely getting by here - what happens if you get ripped off by some throbb-head pirates and have to liquidate what daddy left you? Up shit nebula without an FTL drive, that’s what. So no, I’m not going to knock you up.");
			if(pc.hasCock()) output(" And don’t even dare asking if you can knock ME up.");
			output("”</i> She lounges back on her chair, lifting up her leg so she can place her high heel on the synth surface, her sobriety melting back into her usual playful maliciousness. <i>“Feel free to pointlessly beg for it, though. That will please me.”</i>");
			
			clearMenu();
			addButton(0, "Next", seraTalkMenu);
		}
		
		processTime(2);
	}
	// Repeats
	else
	{
		output("<i>“You, um...”</i> You wiggle your [pc.hips] as subtly as you can. <i>“You change your mind about anything recently?”</i>");
		output("\n\n<i>“And why,”</i> replies Sera coolly, lounging back on her counter to cross her legs, <i>“might I have done that?”</i>");
		
		// If PC has completed party event successfully
		if(seraPartySuccess())
		{
			output("\n\n<i>“Seeing as how you’re no longer in debt,”</i> you say. <i>“Thanks to your most devoted slave. Perhaps with that no longer weighing on you, you might be thinking about... getting fruitful?”</i> Sera leers, shaking her head slightly as she allows her reptilians gaze to move up and down you.");
			
			// merge with first "If PC has completed party event successfully"
			seraBreedBegMenu(true);
		}
		// If PC hasn’t
		else
		{
			output("\n\n<i>“I dunno,”</i> you say. <i>“I was thinking maybe I could persuade you?”</i>");
			output("\n\n<i>“Persuade away,”</i> Sera returns, raising her eyebrows. <i>“You have a very talented mouth. I’ll be interested to see how you use it this time.”</i>");
			
			seraBreedBegMenu();
		}
		
		processTime(1);
	}
}
public function seraBreedBegMenu(withText:Boolean = false):void
{
	if(withText)
	{
		output("\n\n<i>“Was this your master plan all along, " + pc.mf("boy cunt", "honey buns") + "?”</i> she murmurs. <i>“Put up with my bullshit long enough that I feel I owe you something, then drop the b-word?”</i>");
		if(pc.isNice()) output("\n\n<i>“You know that’s not fair,”</i> you answer, gazing at her with level plaintiveness. <i>“And you know now that I can look after it. I want to have your babies, mistress. That is all.”</i>");
		else if(pc.isMischievous()) output("\n\n<i>“I have eaten a mile of your bullshit, and will be back tomorrow to start on the next stretch,”</i> you say. <i>“You know that. C’mon mistress, breed me silly! I’ve already told you - I’ll look after it.”</i>");
		else if(pc.isAss()) output("\n\n<i>“I’ve already said, I will look after it. It’s beginning to sound to me like you’re scared, mistress,”</i> you say, smirking provocatively. <i>“You aren’t scared of doing your duty by one of your [pc.boyGirl]s, are you mistress?”</i>");
		output("\n\n<i>“Hmm,”</i> says the demon, teasing grin still in place. She sits herself down on her counter, crossing her legs. For all her air of self-possession, you can tell she’s wavering a bit. <i>“Have to admit, thinking about bending over my prize slut and swelling their belly with my spawn, no fucks given - that makes bits of my brain light up. And all of my dick.”</i> No question about that - above the round hills of her thighs, the twelve inch purple monster is pointing up towards her breasts, tall and proud. <i>“On the other hand - if you’re preggers, I can’t throw you around and beat you up anywhere near as much.”</i> She dabs her tongue along the talon she used to scratch you. <i>“I just wonder how much you really want this.”</i>");
		output("\n\nAt last.");
	}
	
	// [Beg] [Lick Heels] [Suck Balls] [Lick Pussy]
	clearMenu();
	addButton(0, "Beg", seraBreedBegAction, "beg", "Beg", "It’s all in the widening of the eyes and the splaying of the hips.");
	addButton(1, "Lick Heels", seraBreedBegAction, "heels", "Lick Heels", "She couldn’t possibly say no after you’ve done this. Could she?");
	addButton(2, "Suck Balls", seraBreedBegAction, "balls", "Suck Balls", "If there’s a pair of organs you want to be doing the thinking here...");
	addButton(3, "Lick Pussy", seraBreedBegAction, "pussy", "Lick Pussy", "Seek out female solidarity in the most subservient of fashions.");
}
public function seraBreedBegAction(response:String = ""):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	var success:Boolean = seraPartySuccess();
	
	switch(response)
	{
		case "beg":
			output("<i>“Please, mistress,”</i> you whine, prostrating yourself in front of her. Fantastic purple curves and protrusions rise up before you.");
			output("\n\n<i>“Say it,”</i> she orders, heel tapping on the floor. <i>“Back straight, hands on floor - good. Now: ‘Please mistress, give me your babies. Stuff my womb full of your hot demon seed’.”</i>");
			output("\n\n<i>“Please mistress,”</i> you say, [pc.eyes] wide. <i>“Give me your babies. Stuff my womb...”</i>");
			output("\n\n<i>“Full of your hot demon seed,”</i> Sera supplies. She’s trying hard not to grin.");
			output("\n\n<i>“Full of your hot demon seed!”</i> you repeat, with as much lusty vim as you can.");
			if(success) output("\n\n<i>“Well...”</i> she says, gazing down at you and not trying anymore, <i>“...come back tomorrow. Things might have changed by then, who knows?”</i>");
			else output("\n\n<i>“Hmm...”</i> she says, gazing down at you and not trying anymore, <i>“...no. I did tell you, slut - as pretty as you look on your knees, I’ve got bigger things to think about. But do keep trying pointlessly. It’s very pleasing.”</i>");
			break;
		case "heels":
			output("<i>“Your shoes look a little dusty,”</i> you murmur, fixing your gaze on the tall, black heels.");
			output("\n\n<i>“You know, you’re right,”</i> she replies, grin sliding from one end of her " + (success ? "cerulean" : "turquoise") + " lips to the other. <i>“Been at least a week since I had them shone. I think maybe if I could see my face in them, I might be more open towards certain sluts’ " + (success ? "wishes" : "desires") + "...”</i>");
			output("\n\nYou " + (pc.hasKnees() ? "kneel" : "prostrate yourself") + " in front of her, and take one of her black thigh highs into your hands.");
			output("\n\n<i>“Ahp! Hands on the floor,”</i> your hellion mistress orders, and waits until you comply before daintily presenting the tip of her left boot to your face. <i>“Tongue only.");
			if(pc.hasLongTongue()) output(" No point in you getting a lovely mod like that and not letting your owner make the most of it.");
			output("”</i> You slide it along the smooth lacquer surface, up the vamp to the bottom of her shin and then, with the underside, back down to the tip, lavishing the latex-like material with your saliva.");
			output("\n\nSera turns her foot this way and that, directing the operation entirely, not allowing you to move on until every inch of her shoe gleams wetly in the dim light of the store. The bitter taste doesn’t really matter to you; in the warm fuzz of subspace you descend into, worshipping your mistress in such a humiliating fashion, is its own reward. You almost hope a customer <i>does</i> come in, so somebody else can see the type of obedience she commands. After you’ve finished polishing the right boot, Sera finishes off by having you fellate her stiletto, the long hard point sliding in and out of your [pc.lips].");
			if(success) output("\n\n<i>“Hmm,”</i> she says, withdrawing to examine her gleaming boots critically. <i>“Could do with setting up a water bowl out here for you - but alright job, overall.”</i> You gaze up at her expectantly, licking your dry lips; she gazes back down, talons stroking her smirk. <i>“Come back tomorrow. Things might have changed by then, who knows?”</i>");
			else output("\n\n<i>“Hmm,”</i> she says, withdrawing to examine her gleaming boots critically. <i>“Could do with setting up a water bowl for you - but alright job, overall.”</i> You gaze up at her expectantly, licking your dry lips; she gazes back down, talons stroking her smirk. <i>“And no, my mind hasn’t changed. I got bigger things to worry about, and being my bootlick is enough of a responsibility for you. But do keep trying. It’s very pleasing.”</i>");
			break;
		case "balls":
			output("<i>“I think I know something that might persuade you, Mistress,”</i> you say brightly. Sera shifts her crossed legs slightly, warm, supple flesh creasing and trembling. Her balls are big and bulged enough to present themselves above the thick hills of her thighs, framing the tower of her dick perfectly.");
			output("\n\n<i>“Oh yeah?”</i> she says, smirk sliding from one end of her green lips to the other. <i>“Show me.”</i>");
			output("\n\nYou " + (pc.hasKnees() ? "kneel" : "crouch") + " in front of her, bend her hot cock back, open your mouth and lay your [pc.tongue] on her bulging, purple sack, gazing up at her coyly as you begin to lick. Beyond her thick dick and the rise of her breasts she’s " + (success ? "leant back and not looking at you" : "tapping her chin absently and not looking back") + ", but she does hum in enjoyment when you slip one of her dense orbs past your [pc.lips] and gently compress your mouth.");
			output("\n\n<i>“You know, so many smart and sweet things come out of that mouth of yours,”</i> Sera sighs, " + (success ? "turning her eyes" : "looking") + " down at last. <i>“And yet you never look so right than when it’s crammed full of my salty futa balls. That’s right dear, keep sucking them... mmm, I can just feel the paternal instinct </i>flowering<i>...”</i> You send your tongue and [pc.lips] sliding over and around her scrotum, thrills fluttering through your stomach at doing something so degrading right where anyone can see you - and the tight weight you can feel building beneath the touch of your mouth, the hot, heavy load being prepared that will undoubtedly be stuffed deep into you at the earliest, rudest opportunity.");
			output("\n\nYou pull back once you’ve polished them to a dull shine, smiling up at her sweetly and expectantly.");
			if(success) output("\n\n<i>“That was a pretty convincing argument, I have to admit,”</i> the succubus says, talons stroking her smirk as she looks down. <i>“Come back tomorrow. Things might have changed by then, who knows?”</i>");
			else output("\n\n<i>“That was a pretty convincing argument, slut, I have to admit,”</i> the succubus says, talons stroking her smirk as she looks down. <i>“But the answer is still no. I got bigger things to worry about, and polishing my balls is enough of a responsibility for you. But do keep trying. It’s very pleasing.”</i>");
			break;
		case "pussy":
			output("<i>“I think I know something that might persuade you, Mistress,”</i> you say brightly. Sera shifts her crossed legs slightly, warm, supple flesh creasing and trembling. Generally her neat, bare pussy is hidden away behind the blunt, rude display of her male genitalia - except when she turns around and it can be seen, tantalizingly, tauntingly framed by her straps.");
			output("\n\n<i>“Oh yeah?”</i> she says, smirk sliding from one end of her green lips to the other. <i>“Show me.”</i>");
			output("\n\nYou " + (pc.hasKnees() ? "kneel" : "crouch") + " in front of her, bend her hot cock back, open your mouth and lay your [pc.tongue] on her long, thin slit. You proceed with long, worshipful drags of your [pc.lips] across her labia, dipping your [pc.tongue] into her channel and slowly moving it up and down, her slightly spicy tang oiling your taste buds.");
			output("\n\n<i>“We don’t do this nearly enough,”</i> Sera sighs, resting her balls on your [pc.hair] and crossing her legs behind your head. You feel a stiletto drag down along the bumps of your spine to the crack of your [pc.ass]. <i>“I think I see your point about pussies needing attention... I don’t think you’re articulating it eloquently enough though...”</i>");
			output("\n\nThe " + (success ? "button" : "nub") + " of hard flesh at the top of her entrance is easy to find, and you attack it with flicks of the tongue until it is bulging well out of its hood. Then you thrust deeply into her wet silk, lips mushing into her mound. You are rewarded with a hard tightening of her thighs around your [pc.ears], a high grunt, and a liberal slathering of musky " + (success ? "succubus" : "demon") + " juices around your mouth and nose. You pull back, smiling up at her sweetly and expectantly.");
			if(success) output("\n\n<i>“That was a pretty convincing argument, I have to admit,”</i> the succubus says, talons stroking her smirk as she looks down. <i>“Come back tomorrow. Things might have changed by then, who knows?”</i>");
			else output("\n\n<i>“That was a pretty convincing argument, I have to admit,”</i> the succubus says, talons stroking her smirk as she looks down. <i>“But the answer is still no. I got bigger things to worry about, and being my twat-polish is enough of a responsibility for you. But do keep trying. It’s very pleasing.”</i>");
			break;
		default:
			output("AN ERROR HAPPENED HERE.");
			break;
	}
	
	processTime(5 + rand(2));
	
	// Ghost out [Breed] for 24 hours; Reduce by six hours maybe.
	pc.createStatusEffect("Sera Talk Breed", 0, 0, 0, 0, true, "", "", false, (6 * 60));
	if(success) flags["SERA_BREED_TIMER"] = GetGameTimestamp();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function seraPriapinAction(response:String = ""):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	clearMenu();
	
	switch(response)
	{
		case "intro":
			processTime(1);
			
			var pregDays:Number = pcSeraPregDays();
			
			output("<i>“Look at what I have, mistress.”</i> You flourish the blue medipen with a foxy grin. <i>“What do you think?”</i>");
			// PC is not pregnant OR Sera pregnant 0-50 days:
			if(pc.totalWombPregnancies() < pc.vaginas.length || (pregDays >= 0 && pregDays <= 50))
			{
				output("\n\nSera’s eyes narrow into bright yellow slits.");
				output("\n\n<i>“I think if you’re not planning on going anywhere for the next couple of hours, you should give it to me,”</i> she growls. <i>“If you’ve got the ovaries.”</i>");
				
				// [Give] [Don’t]
				addButton(0, "Give", seraPriapinAction, "give", "Give Priapin", "You’re ready.");
				addButton(1, "Don’t", seraPriapinAction, "don't", "Don’t Give Priapin", "Maybe later...");
			}
			// PC is Sera pregnant 51-190 days:
			else if(pregDays > 50 && pregDays <= 190)
			{
				output("\n\n<i>“Really, [pc.boyGirl]?”</i> smirks Sera, gazing at your belly. <i>“Because from here it looks like I did my duty already.”</i> Her eyes narrow a bit as they gaze at the stimpack in your hand. <i>“But sure. If you’re offering, I’m game.”</i>");
				output("\n\n");
				
				// [Give] [Don’t]
				addButton(0, "Give", seraPriapinAction, "give", "Give Priapin", "You’re ready.");
				addButton(1, "Don’t", seraPriapinAction, "don't", "Don’t Give Priapin", "Maybe later...");
			}
			// PC is Sera pregnant > 190 days:
			else if(pregDays > 190)
			{
				output("\n\nSera bites her lip as she looks you up and down, her luminescent gaze at last settling on your belly.");
				output("\n\n<i>“Naw,”</i> she says at last. <i>“I know you’re swimming in hormones right now, but I can’t get really rough with you when you’re that size. Sorry, [pc.boyGirl]. Bring it back once you’ve popped - I’ll make your eyes roll all the way back and make you bark like the bitch you are. I promise.”</i>");
				
				// Return to talk menu
				addButton(0, "Next", seraTalkMenu);
			}
			// Other pregnancies, failsafe.
			else
			{
				output("\n\nSera bites her lip as she looks you up and down...");
				output("\n\n<i>“Hm, maybe next time, okay?”</i> she says at a glance.");
				if(pc.totalWombPregnancies() > 1) output(" It looks like all your wombs are already occupied in one form or another.");
				output(" Perhaps you should finish your current pregnancy before trying to tempt her!");
				
				addButton(0, "Next", seraTalkMenu);
			}
			break;
		case "don't":
			output("<i>“Shame,”</i> Sera sighs. <i>“Been a while since I really went to town on someone.”</i> She lounge back on her counter. <i>“So you gonna beg for it or what?”</i>");
			
			// Return to talk menu
			addButton(0, "Next", seraTalkMenu);
			break;
		case "give":
			pc.createStatusEffect("Give Sera Priapin");
			pc.destroyItemByClass(Priapin);
			seraBreedResponse(["ready"]);
			break;
		default:
			output("AN ERROR HAPPENED HERE.");
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

public function seraBreedingApproach():Boolean
{
	author("Nonesuch");
	clearMenu();
	
	output("\n\n");
	// When PC next enters store after 24 hours have passed after successful breed chat
	if(flags["SERA_MEET_BREED"] == undefined)
	{
		showSera();
		
		output("<i>“Hello slut,”</i> Sera coos when you enter the Dark Chrysalis, rising off her stool to walk out around her counter, shop facade remote swinging off a finger.");
		output("\n\n<i>“Are you off... are things different, Mistress?”</i> you ask.");
		output("\n\n<i>“Have I binned my current dose of Sterilex? Yes,”</i> she replies, taking you into her arms and squeezing your [pc.ass] intently, soft breasts pressing into your " + (pc.tallness <= 71 ? "[pc.face]" : "[pc.chest]") + ". <i>“But you should know by now that your owner doesn’t do things by half measures. I went by TamaniCorp yesterday evening, and in-between turning their kitty whore inside out I picked up... something.”</i> The hot bludgeon of her dick is digging into your [pc.belly], and her face looks red, as if she had spent the last hour doing circuits around Tavros. <i>“And now I’m ready to breed,”</i> she growls. <i>“Not fuck, breed, do you understand? My balls feel like charged batteries right now, and they’re telling me there’s a difference - and how important that difference is now you’ve walked that ass in here.”</i> Still clinching you with one hand, she raises the shop remote with the other. <i>“So you aren’t doing anything for the next few hours, are you?”</i>");
		
		processTime(1);
		
		flags["SERA_MEET_BREED"] = 1;
		
		// [Nope] [NRN]
		if(!pc.hasVagina()) addDisabledButton(0, "Nope", "Nothing Planned", "You will need a vagina for this!");
		else if(pc.isFullyWombPregnant() && pcSeraPregDays() >= 190) addDisabledButton(0, "Nope", "Nothing Planned", "You might be a little too pregnant for this!");
		else addButton(0, "Nope", seraBreedResponse, ["ready"], "Nothing Planned", "You’re ready.");
		addButton(1, "Not Now", seraBreedResponse, ["not now"], "Not Right Now", "Maybe get fucked a little later.");
	}
	else
	{
		// Repeat
		showBust("SERA");
		
		output("Sera rises off her stool and walks out around her counter as you enter. She leans on the surface and silently smolders the question at you, shop remote swinging around one finger.");
		
		// [Ready] [NRN]
		if(!pc.hasVagina()) addDisabledButton(0, "Ready", "Ready", "You will need a vagina for this!");
		else if(pc.isFullyWombPregnant() && pcSeraPregDays() >= 190) addDisabledButton(0, "Ready", "Ready", "You might be a little too pregnant for this!");
		else addButton(0, "Ready", seraBreedResponse, ["ready"], "I’m Ready", "You’re ready.");
		addButton(1, "Not Now", seraBreedResponse, ["not now"], "Not Right Now", "Maybe get fucked a little later.");
	}
	
	return true;
}

public function seraBreedResponse(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	var response:String = (arg.length >= 1 ? arg[0] : "none");
	var vag:int = (arg.length >= 2 ? arg[1] : -1);
	var vagList:Array = [];
	var i:int = 0;
	
	switch(response)
	{
		// [NRN]
		case "not now":
			showSera();
			output("<i>“Let me clear my schedule first,”</i> you say.");
			output("\n\n<i>“Do,”</i> grits Sera, releasing you only after a reluctant pause and stalking back behind the counter.");
			output("\n\n<b>You suspect asking for sex before you’ve resolved this current situation probably isn’t a good idea.</b>");
			
			processTime(1);
			
			//Grey out [Sex]
			pc.createStatusEffect("Sera Breed No Sex");
			// Set flag for mandatory breeding.
			pc.setStatusValue("Sera Breed No Sex", 1, 1);
			
			addButton(0, "Next", seraMenu, true);
			break;
		// [Ready/Nope/Give]
		case "ready":
			showSera(true);
			// Lust up 70%
			pc.lust(70);
			
			for(i = 0; i < pc.vaginas.length; i++)
			{
				if(!pc.isPregnant(i)) vagList.push(i);
			}
			if(vagList.length > 0) vag = vagList[rand(vagList.length)];
			else vag = 0;
			
			if(!pc.hasStatusEffect("Give Sera Priapin"))
			{
				output("You answer by holding her gaze, plucking the remote out of her hand and clicking it. The door locks, the window darkens and the neon sign blares on - although a glance over your shoulder tells you SNIM 03 NI has been replaced by NEHW SWONK OHW.");
				output("\n\nYour head is turned back by a clawed hand, and cerulean lips clamp themselves around your own, Sera’s hot tongue shoving itself into your mouth.");
			}
			else
			{
				output("With a grin you silently proffer the medipen, and the next moment it is plucked out of your hands.");
				output("\n\n<i>“Oof,”</i> groans Sera as she stabs it into her arm. <i>“Oh yeah! That’s the stuff.”</i> From here you can see her twelve inch dick darken and thicken; her balls tense and drop restlessly in her hairless sack, heavy lust visibly inflating her oversized loins. She reaches behind the counter, retrieves the shop facade remote, points it at the front. The lock clicks and the lights turn off.");
				output("\n\n<i>“Right, you,”</i> she growls, evil luminescent eyes gleaming in the dark. <i>“Get the fuck over here.”</i>");
				output("\n\nThe second you enter range she pulls you into her arms greedily, squeezing your [pc.ass] as she clamps her turquoise lips around yours.");
			}
			
			// Give Sera pregnancy powers!
			serasBodyIsReady();
			chars["SERA"].impregnationType = "SeraSpawnPregnancy";
			chars["SERA"].removeStatusEffect("Infertile");
			chars["SERA"].createStatusEffect("Priapin", 1, 1, 1.75, 30, false, "Icon_DrugVial", "Masculine virility has been piqued temporarily.", false, 1440);
			
			// merge
			output("\n\nIt’s less of a kiss and more of a ravaging; she bends her wet muscle into you as far as she can, almost brushing your tonsils before thrusting it into a cheek wall, apparently intent on touching as much of you as possible.");
			if(!pc.isNude())
			{
				output(" Her hands are meanwhile busy,");
				if(pc.hasArmor() || pc.hasUpperGarment())
				{
					output(" tearing off your [pc.upperGarments] impatiently");
					if(pc.hasLowerGarment()) output(" and then");
				}
				if(pc.hasLowerGarment()) output(" shoving down your [pc.lowerUndergarment] as fast as she can");
				output(". You’d worry about the damage she might be doing if that wasn’t the furthest thing from your mind right now.");
			}
			output(" You clinch your [pc.hip] around her flank, twining your [pc.tongue] around hers, and hump your [pc.belly]");
			if(pc.hasCock()) output(" and [pc.eachCock]");
			output(" against the hot, twelve inch dick trapped between you. This draws a feral snarl out of her, humid, smoky vibrations sent down your throat; one hand deeply imprinted in your [pc.ass], she practically throws you into the back of the store, heels clacking, pausing only to grab some rattling metal out from underneath the counter.");
			output("\n\nHer fingers find the lips of your [pc.vagina " + vag + "] in the corridor, and curling her fingers over your inner lips and around your [pc.clit " + vag + "] so that your [pc.femcum] is dripping freely and your breath is coming high and hard seems to make her raging lust unbearable. The succubus pushes you against the wall,");
			if(pc.hasLowerGarment()) output(" rips down your [pc.lowerUndergarment],");
			output(" hooks you up by your [pc.thighs] and takes you there and then, spearing her thick, urgently erect cock into your wet, unfurled pussy. Your [pc.ass] flattened against the cool, bland ceramisynth surface, Sera’s flat stomach batting against " + (!pc.hasCock() ? "your own" : "[pc.eachCock]") + " as she spreads your lips wide and drives her unyielding girth as deep into you as she can, hard thrusts of her curvy thighs that drives ecstasy mercilessly up your spine, making you grit your teeth and thrash back against her, clutching her tightly around the shoulders. She attacks you with her mouth wherever she can, pulling at your lip");
			if(pc.hasErectNipples(0)) output(", then at your [pc.nipples] until they are pointed and tender");
			else if(pc.hasFuckableNipples(0)) output(", slurping hungrily at your softened [pc.nipples], flicking at the tender insides with darts of her tongue");
			else output(", then across your [pc.nipples] until they tingle with arousal");
			output(" and leaving her teeth marks deeply ingrained around your neck.");
			output("\n\nIt’s savage, animalistic fucking, not made to last. You ride your mistress’s thick cock with desperate thrusts of your [pc.hips], molding your lips into hers as she cums like a rocket, spurred on by the pulses and clenches of your [pc.vagina " + vag + "] to empty at least some of her pent-up load deep inside you, hot, heavy goodness that bulks out your womb and oozes filthily out of you, dripping onto the floor. You pause for a long moment afterwards, still conjoined, sweat-dampened forehead against her horns, catching your breath.");
			
			pc.cuntChange(vag, chars["SERA"].cockVolume(0));
			
			processTime(15 + rand(6));
			
			// [pb]
			addButton(0, "Next", seraBreedResponse, ["first", vag]);
			break;
		case "first":
			showSera(true);
			// Lust down 30%, load in pussy
			pc.lust(-30);
			pc.loadInCunt(chars["SERA"], vag);
			
			output("<i>“Put these on,”</i> she mumbles finally, pushing cool metal into your hands. It is, naturally, a pair of handcuffs. <i>“Just... just one will do for now.”</i> You comply, clicking one of the rings around your wrist with a wriggling thrill. <i>“Cuffs - zero grav.”</i> A warm buzz shivers all the way through you; Sera takes one last deep gulp of breath and then picks your weightless form up with a single heave of one arm, throwing you over one shoulder, forcing a " + pc.mf("gasp", "squeal") + " past your lips. [pc.Ass] in the air, you are carried into her bedroom, leaving a trail of cum from your gaped pussy behind you.");
			output("\n\nShe secures both of your hands behind your back and leaves you hanging in mid-air like an oddly shaped balloon whilst she clambers onto her heart-shaped bed, sifting through the paraphernalia she’s got arranged on her bedside cabinet. One glance is enough to tell you she’s done more to prepare for this than pump her loins up with fertile sperm; it looks like every sex toy she owns is out on display. Over-enthusiasm produced by an out-of-control libido, surely?");
			output("\n\nOnce she has what she’s looking for, the succubus pulls you down with her warm, sharp grip, rests back on the headboard, and places you on her lap before reasserting your gravity with a soft thump. You watch, mouth open, as she");
			if(pc.hasErectNipples(0)) output(" catches " + (pc.totalNipples() == 2 ? "each" : "two") + " of your erect nipples in the chained silver clamps, slivers of intense sensation needling into you.");
			else if(pc.hasFuckableNipples(0)) output(" pushes the chained plugs into your moistened nipple " + (pc.hasLipples() ? "mouths" : "cunts") + ", the sensation growing more intense as she stretches the entrances wide with their broad, round bases.");
			else output(" attaches pleasure pads onto your featureless nipples, pushing slivers of intense sensation throughout your chest.");
			output(" The fact your hands are trapped behind your back, practically presenting your [pc.chest] to the hermaphroditic sadist, makes it all the easier for her to do.");
			output("\n\n<i>“There,”</i> she grins, gloatingly drinking in your naked, chained form piled on top of her. She slides the shaft of her still-very-much-erect between the lips of your [pc.vagina " + vag + "], oiling it with her own oozing cream until her head is once again pressed against your wet, opened entrance. She catches the chain she’s arrayed between your [pc.nipples], making you gasp and tense up as she pulls at it. <i>“Now - ride me, horsey.”</i>");
			output("\n\nYou slide yourself down the arc of her broad bitch-breaker, the passage made incredibly easy by the copious amount of cum slathered across both tab and slot. Perhaps once you would have found taking an energetically merciless demon’s fervent twelve inch erection tough, painful - now, it swelling your");
			if(pc.hasCock()) output(" female");
			output(" sex outwards and upwards feels like the most right thing in the world. You quiver around her when the thought that this thing is going to whelp you, consigning you to nine months of soft, hormone-soaked rotundity, flashes across your brain.");
			output("\n\nSera exhales throatily as you rock on top of her steadily as best you can with your hands tied, her own " + (chars["SERA"].skinTone != "bright pink" ? "navy" : "magenta") + " nipples protuberant on top of her gently trembling boobs. This is evidently a little downtime for her; her immediate animal lust bitten, she now watches you bend and milk her pole until [pc.femcum] " + (pc.isSquirter(vag) ? "dribbles" : "courses") + " freely down it with obvious enjoyment. She snags your nipple chain with a claw or her teeth as she pleases, the");
			if(pc.hasErectNipples(0)) output(" sharp pinches");
			else if(pc.hasFuckableNipples(0)) output("n digs into the soft insides of your breasts,");
			else output("n presses firmly on the patches, sending shocks of lust into your chest and");
			output(" making you twitch and gasp. As her ardor invigorates, she reaches for the landscape of toys on her dresser.");
			
			processTime(12 + rand(6));
			
			// [pb]
			addButton(0, "Next", seraBreedResponse, ["second", vag]);
			break;
		case "second":
			showSera(true);
			
			output("A big, pink plug is insistently pressed into your [pc.anus], until at last, with an acute frisson of sensation, the bulb makes it past your ring, stretching you wide.");
			
			var dildoCap:Number = (pc.analCapacity() / 2);
			if(dildoCap < 500) dildoCap = 500;
			pc.buttChange(dildoCap);
			
			if(pc.vaginas.length >= 2)
			{
				var selVag:int = -1;
				for(i = 0; i < pc.vaginas.length; i++)
				{
					if(i != vag) vagList.push(i);
				}
				if(vagList.length > 0) selVag = vagList[rand(vagList.length)];
				else selVag = (vag == 0 ? 1 : 0);
				
				output(" She makes you rise up from her well-lubed cock momentarily, and then makes you sit down on " + (vagList.length == 1 ? ("the similarly-sized dildo she positions under your [pc.vagina " + selVag + "]") : (num2Text(vagList.length) + " similarly-sized dildoes she positions under your other vaginas")) + ", all of the thick insertions kneading into each other through your tender walls, almost unbearable ecstasy that makes you cry out with each rock of your [pc.hips].");
				
				if(vagList.length > 0)
				{
					for(i = 0; i < vagList.length; i++)
					{
						dildoCap = (pc.vaginalCapacity(vagList[i]) / 2);
						if(dildoCap < 500) dildoCap = 500;
						pc.cuntChange(vagList[i], dildoCap);
					}
				}
			}
			if(pc.hasCock()) output(" A bead is fastened to your [pc.cockBiggest], and fixing you with her reptilian eyes, Sera turns the attached remote on. The delicious vibrations make your already semi-erect cock mast eagerly, batting against your [pc.belly] and beading pre. The urge to pulse [pc.cum] freely to the shudders running through your groin become harder to handle the more your pussy clenches up around Sera - but you know by now not to, to keep hold of your masculine urges until your mistress deems you deserving of release.");
			// If dedicked:
			if(!pc.hasCock() && flags["SERA_CREATE_VAG"] != undefined) output("\n\n<i>“Doesn’t it feel good your mistress got rid of that useless dick of yours?”</i> the yellow eyes and white teeth below you whisper. She jerks upwards suddenly, making you spasm with pleasure. <i>“Got to say, when I did that and broke you in, I never thought that one day I’d also be making you bear my spawn. That’s what I love about you - you keep coming up with adorable ways to tighten your collar all on your own.”</i>");
			
			// merge
			output("\n\nShe clutches your [pc.thighs] and bucks into you ferociously as a new high approaches. You orgasm as she’s still ramming herself into you, the pump and shift of her dick inside of you impossible to resist; you cry out at the pleasure whiplashes through you, your [pc.vagina " + vag + "] clenching up again and again around your multiple obdurate insertions. Then you wail as Sera grabs your nipple chain in her mouth and yanks at it,");
			if(pc.hasErectNipples(0)) output(" seizing at your trapped nipples");
			else if(pc.hasFuckableNipples(0)) output(" forcing you to boob-gasm around the trembling plugs");
			else output(" forcing you to boob-gasm to the lust-laden pads");
			output(", grunting around it as she swells your womb with heavy, fecund demon cum. Incensed, she surges upward, pushing you onto your side, levers your [pc.thigh] up and goes at you like that, her erect nipples rubbing against your shoulder blades, balls flapping against your [pc.clits]. Her beautiful hot cock digs into your abused hole from a different direction, making you squeal, a fresh set of filthy fireworks going off in your centre. She’s got enough backed up to visibly plump out your stomach with hot thickness, spurting out around your soaked entrance until the sheets beneath you are puddled with it.");
			
			processTime(15 + rand(6));
			
			// [pb]
			addButton(0, "Next", seraBreedResponse, ["third", vag]);
			break;
		case "third":
			showSera(true);
			
			output("<i>“Aaahhhhhh...”</i> Sera sighs at long last, shifting you over to the side of the bed not soaked in sexual fluids. She molds her plush breasts into your back, climbing a thigh over your flank, coiling her arms and tail around your front and [pc.legOrLegs]. <i>“I think that’s it. I think we’re done.”</i>");
			output("\n\nOh no you aren’t. As the demon’s dedicated cumdump it’s your duty to make sure she is drained absolutely dry, and in the utterly fucked haze of submissiveness you’re currently adrift in, you’re going to make damn sure she is. You allow yourself a couple of minutes of pleasant spooning, baking in the post-coital bliss together, before slithering out of her grip. Toys still attached, sending low levels of sensual delight tickling through you, you put your [pc.lips] and [pc.tongue] to the use they’re meant for - sliding them over every inch of your Mistress’s unblemished purple skin. She mumbles something, but doesn’t stop you, as you lick the softness of her inner thigh, trace the line of her vagina with lavish back-and-forth, trail kisses down the arch of her back and lick the sweat from between the crack of her round ass.");
			output("\n\n<i>“Goddamn,”</i> she husks, shifting against you as you gently knead her breasts and trail your grip up her lithe tail, <i>“You want more? You actually want more... oh yeah. Keep doing that. Keep doing that like you know how, you juicy little cocksleeve...”</i> Grinning winningly, you assiduously jerk your wrist, fondling the end of her tail until its dick-end is bulging well out of the spade. <i>“Alright then!”</i> she half-laughs, half-snarls, tearing out of your grip and rearing up in front of you, tits heaving. She shoves your head down into the stained satin sheets, forcing your [pc.ass] up into the air, and with the barest of preparation, spears her hot, over-stimulated dick back into your stuffed twat, making you coo with pleasure as it slides back along your tingling walls. The sound that makes is the most obscene, glorious sound you think you’ve ever heard.");
			
			pc.cuntChange(vag, chars["SERA"].cockVolume(0));
			
			output("\n\n<i>“Normally at this point I’d be making use of your ass or your throat");
			if(pc.biggestTitSize() >= 3) output(" or your tits");
			else if(pc.hasCock()) output(" or your twig");
			output(",”</i> she groans, pliant thighs clapping intently on your butt, painting a dripping butterfly of spent seed across both. From the suffocating warmth of the bed-sheets, you hear her reach across with her other hand and fumble through the lewd assemblage on the dresser. <i>“Fucking my own sloppy seconds here. I hope you appreciate the sacrifices your mistress makes for you...”</i> You bite into the sheets, the ebb and thrust of her implacable cock into your semen-pasted tunnel dominating your attention, doing your best to tighten your muscles around it to wring every last bit of sensation out of it. You jerk and cry out when, with a sharp crack, something stings you hard on the shoulder.");
			output("\n\n<i>“Do you?”</i> husks Sera, trailing the end of the whip down the line of your quivering back. <i>“Appreciate all the things I do?”</i> The weal she’s left feels like it’s burning - the [pc.skinFurScales] there becoming incredibly tender, tendrils of arousal squirming into your flesh. Of course it would be one of <i>those</i> whips... you hear a whirr, and you are stung again on the other side, the aphrodisiac coating seeping swiftly into your [pc.skinNoun]. All the while that thick, juicy dick draws back and thrusts into your tenderized, dripping twat again, and again, and again...");
			
			pc.cuntChange(vag, chars["SERA"].cockVolume(0));
			
			output("\n\n<i>“Yes mistress!”</i> you wail, utterly surrendering yourself to the intoxicating submissiveness crowding your senses. <i>“Mark me! Fuck me! " + (!pc.isPregnant(vag) ? "Breed me" : "Make me yours") + "!”</i> This is answered with a furious snap of the bio-whip off your right butt-cheek.");
			output("\n\nSera ruts you like she’s been in prison for the past six months, and with the contact aphro flaring up your nervous system you are swiftly forced to an orgasm like an electric shock, your [pc.tongue] hanging out of your mouth as your [pc.vagina] kneads at her relentless dick with full body pulses, " + (pc.isSquirter(vag) ? "dripping" : "spurting") + " [pc.femcum] around her base. Sera rasps and groans her approval, riding it for as long as she can before releasing, the sensation of the last of her hot, fertile cum engorging your womb and caking your thighs extending your own augmented orgasm. The succubus drops the whip and grips you by " + (pc.hasHair() ? "the [pc.hairs]" : "the throat") + ", forcing your head back and making you arch your back for her, the sharp pain inextricable from the brilliant pleasure.");
			
			pc.changeHP(-3);
			processTime(20 + rand(6));
			
			// [pb]
			addButton(0, "Next", seraBreedResponse, ["end", vag]);
			break;
		case "end":
			showSera(true);
			// Lust 0%
			for(i = 0; i < 20; i++) { pc.orgasm(); }
			chars["SERA"].orgasm();
			serasBodyIsReady();
			
			output("Sera presses you between her breasts when the last gratuitous crack, moan and squelch has been had, engulfing you in the smell of her musk, spicy perfume and smokiness. You embrace her back, ear up against the thump of her black heart, your whole body throbbing and aching. You groan woozily as she slowly withdraws from you, bringing a small gush of slimy warmth with her. She hums her approval as she slides her hand down to your thoroughly bulged stomach.");
			var pregBellyRating:Number = 0;
			for(i = 0; i < pc.vaginas.length; i++)
			{
				if(pc.pregnancyData[i].pregnancyType == "SeraSpawnPregnancy") pregBellyRating += pc.pregnancyData[i].pregnancyBellyRatingContribution;
			}
			if(pregBellyRating >= 10) output("\n\n<i>“We should make videos, you know,”</i> she giggles in your ear. <i>“I’m sure junior will want to know how mommy met daddy eventually.”</i>");
			else output("\n\n<i>“Now that’s what I call an impregnation,”</i> she giggles throatily. <i>“Gotta admit - you’re going to look pretty cute, carrying around a belly like that.”</i>");
			
			// merge
			output("\n\nAfter she’s stripped you of her toys, she lets you use her shower with her in a show of magnanimity. Pressing against her soaped, curvy form in the cramped, humid cubicle is the perfect opportunity to screw around a little more, but you’re far too exhausted for it - and perhaps even Sera has found her limits, because she makes no humiliating demands of you here. Despite a long wash you’re still feeling distinctly bloated around the midriff when you hobble back to the store front, a fact that makes the heeled hellion laugh with delight when you turn around. Is there a slight amount of reluctance in the way she lets go of your hand?");
			if(pc.hasStatusEffect("Give Sera Priapin"))
			{
				output("\n\n<i>“Hope your circulation is up,”</i> she says. <i>“Or whatever it is that red-hot no-holds-barred fucking is supposed to do for pregnant people.”</i> She pauses, considering you with a bitten lip for a moment. <i>“Bring more party-starter whenever you like. We should get as much in before you become too much of a balloon for us to do it anymore.”</i>");
				
				pc.removeStatusEffect("Give Sera Priapin");
			}
			else
			{
				output("\n\n<i>“Do you think it will take, mistress?”</i> you ask.");
				output("\n\n<i>“My seed is the best in the galaxy, as you well know,”</i> she replies firmly, <i>“and I have ordained you my breeding bitch, so don’t have any fucking doubt.”</i> She pauses, considering you with a bitten lip for a moment. <i>“But if you’re asking whether we can do this again... if you like. But next time, you bring the Priapin.”</i>");
			}
			
			// Time forward 2 hours
			processTime(110 + rand(11));
			// Unless sterile, if PC not preg set Serapreg to 1
			pc.loadInCunt(chars["SERA"], vag);
			pc.shower();
			
			// Sera is done using Priapin and no longer a breeding machine
			chars["SERA"].removeStatusEffect("Priapin");
			chars["SERA"].createStatusEffect("Infertile");
			chars["SERA"].impregnationType = "";
			
			pc.removeStatusEffect("Sera Breed No Sex");
			
			flags["SERA_BREED_TIMER"] = undefined;
			IncrementFlag("SERA_TIMES_BRED");
			
			addButton(0, "Next", mainGameMenu);
			break;
		default:
			output("AN ERROR HAPPENED HERE.");
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

public function seraSpawnPregnancyEnds():void
{
	clearOutput();
	author("Nonesuch");
	showBust("");
	showName("\nBIRTHING!");
	
	var se:StorageClass = pc.getStatusEffect("Sera Spawn Pregnancy Ends");
	
	// Failsafe
	if(se == null)
	{
		output("ERROR: 'Sera Spawn Pregnancy Ends' Status Effect does not exist.");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	var numChildren:int = se.value1;
	var bRatingContrib:int = se.value2;
	var pregSlot:int = se.value3;
	var babym:Boolean = (se.value4 == 1);
	var inShip:Boolean = InShipInterior();
	var inPublic:Boolean = (InPublicSpace() || rooms[currentLocation].planet.toLowerCase().indexOf("station") != -1 || rooms[currentLocation].hasFlag(GLOBAL.INDOOR));
	
	output("Pain in your gut bends you over and fluid spills");
	if(!pc.isCrotchExposed()) output(" into your [pc.lowerGarment]");
	else if(inShip) output(" onto the deck");
	else output(" onto the ground");
	output(". Oh god, the baby is coming...");
	
	//on ship with auto-medbay (commented until one is available)
	if(inShip && 9999 == 0)
	{
		output("\n\nYou head for the automatic medbay, clutching your trembling stomach. Contractions intensify quickly -- by the time the system finishes its evaluation and moves into action, you’re");
		if(!pc.isNude()) output(" disrobed but");
		output(" no longer able to speak between breaths.");
	}
	//on ship without automatic medbay
	else if(inShip)
	{
		output("\n\nYou grab the nearest medkit and head for your bed, determined to deliver the baby safely. After setting aside your gear, you lie down and begin to breathe in preparation for your labor.");
	}
	//in public place
	else if(inPublic)
	{
		output("\n\nA passer-by comes over to check on you, and begins to panic when you explain the situation. You default to giving short, simple orders, and your new deputy calms down. Together, you make it to a place where you can get medical aid.");
	}
	// in the jungle like a Tarzan bride
	else if(InRoomWithFlag(GLOBAL.OUTDOOR))
	{
		output("\n\nGroaning at the timing, you shed your [pc.gear] and position yourself the best you can in the inhospitable and non-hospital-able terrain. The wish that you’d stayed somewhere indoors and safe hums through your thoughts like a mosquito, but there’s no help for it -- you’ll have to deliver the baby on your own.");
		// minor HP damage?
		pc.changeHP(-5);
	}
	
	// merge
	output("\n\nSpasms wrack your pregnant body for the next hour as it works the baby free. During the painful frenzy you operate mostly on biological autopilot, but glimpse a few details of your new little miracle. The baby drops " + (rand(10) == 0 ? "head" : "feet") + "-first, noodling its way out " + (pc.vaginas[pregSlot].looseness() >= 5 ? "easily" : "in a protracted battle with your tight vagina") + ", and the placenta follows.");
	
	// vag hymen/stretch check here
	//pc.cuntChange(pregSlot, 3000);
	
	output("\n\nYour new bundle launches into a throaty cry when the air hits its skin. As the pain fades and the endorphin haze clears from your eyes, the noise brings you home to yourself; you gather the squirming baby into your arms and dab the gore away. It’s a " + (babym ? "boy" : "girl") + "! A fuzz of hazel hair coats " + (babym ? "his" : "her") + " pate and chubby pink hands grasp for yours. Your new baby is a picture-perfect human child.");
	
	if(numChildren > 1)
	{
		output("\n\nThe birthing doesn’t stop there. After a brief moment, you take a few huffs as another movement applies pressure to your womb and your vision hazes again. Your [pc.vagina " + pregSlot + "] spreads and a new head crowns. With some effort, you gently push with your lower muscles, aiding the child out to finally join its " + (babym ? "brother" : "sister") + ".");
		if(numChildren > 2) output(" The process continues until you have a total of " + num2Text(numChildren) + " children born.");
		output(" You take a good look at your beautiful babies while the fuzzy fog fades from your senses.");
	}
	
	if(numChildren == 1) output("\n\nA soft touch on your hand brings you out of your reverie -- your baby seems to know there’s more work to do. Sighing, you clean up and cut the cord, then prepare to send " + (babym ? "him" : "her") + " off. While the shuttle is in transit, you" + (pc.isLactating() ? (" give " + (babym ? "him" : "her") + " a small feed of [pc.milk] and then") : "") + " spend the time playing, letting your little one squeeze your fingers and giggle while you meditate on a name that suits " + (babym ? "him" : "her") + ". You even hold up the shuttle, ignoring the drone’s automated requests until you can’t wait any longer. With a pang in your heart, you bundle your child into the climate-controlled device and watch it return to the shuttle.");
	else output("\n\nSoft touches on your hand bring you out of your reverie -- your babies seem to know there’s more work to do. Sighing, you clean up and cut the cords, then prepare to send the newborns off. While the shuttle is in transit, you" + (pc.isLactating() ? (" give them a small feed of [pc.milk] and then") : "") + " spend some time playing, letting your little ones squeeze your fingers and giggle while you meditate on names that suit them. You even hold up the shuttle, ignoring the drone’s automated requests until you can’t wait any longer. With a pang in your heart, you bundle your children into the climate-controlled device and watch it return to the shuttle.");

	// Remove reflex modifier
	pc.removeStatusEffect("Sera Spawn Reflex Mod");
	
	if(pcSeraPregDays() <= 220) pc.removeStatusEffect("Sera Breed No Sex");
	
	processTime(49 + (13 * numChildren));
	
	pc.removeStatusEffect("Sera Spawn Pregnancy Ends");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Pregnant PC Sera texts
// Shows instead of usual enter Dark Chrysalis blurbs. Show normal options thereafter
public function seraSpawnPregnancyBlurbs(pregDays:Number = 0):Boolean
{
	// First [Sera] after PC Serapreg for >80 days
	if(pregDays > 80 && pregDays <= 120 && flags["SERA_TALKS_BREED"] < 2)
	{
		author("Nonesuch");
		
		output("\n\n<i>“You’re looking a bit swollen.”</i> Sera gazes at your gut. <i>“You get down with some dzaan gangers or something before coming in here?”</i> She frowns and her lips move slightly as she does some mental arithmetic; the vindictive smirk drops right off her face. <i>“Oh.”</i>");
		
		flags["SERA_TALKS_BREED"] = 2;
		
		clearMenu();
		addButton(0, "Next", seraMenu);
		return true;
	}
	// Plays after >120 days
	else if(pregDays > 120 && flags["SERA_TALKS_BREED"] < 3)
	{
		author("Nonesuch");
		
		output("\n\n<i>“I guess there’s no more pretending this isn’t something that’s happening,”</i> Sera says, yellow eyes fixed on your [pc.belly].");
		if(pc.isNice()) output("\n\n<i>“It is a little difficult for me to pretend that, yes,”</i> you reply patiently. <i>“But you knew, Mistress. And you agreed.”</i>");
		else if(pc.isMischievous()) output("\n\n<i>“Who would think this would be the outcome of pumping yourself full of fertility drugs and then creampie-ing me repeatedly?”</i> you reply witheringly.");
		else if(pc.isAss()) output("\n\n<i>“If you want I can explain the bees and the birds to you, Mistress,”</i> you deadpan. <i>“Kinda hoped you knew about them, back when you agreed to bareback me silly.”</i>");
		// merge
		output("\n\n<i>“Yeah, but that was just... playing,”</i> snorts the demon-morph. <i>“Fucking like horny teenagers, who wouldn’t turn that down? This is real, though.”</i> She pauses for a while longer. <i>“Can I touch?”</i>");
		output("\n\nIt’s slightly strange to hear her ask your permission for anything. You watch her gently scrape her claws over your bulging belly, her expression slowly shifting from wariness to a kind of pride.");
		output("\n\n<i>“It’s a kind of sexy punishment, isn’t it?”</i> she breathes. <i>“Swelling out your body with horny hormones, slowing you down and making you waddle for enjoying yourself so much on the end of my dick for, what, almost a year?”</i> She shakes her head, transfixed. <i>“I really am sadistic, aren’t I?”</i>");
		
		flags["SERA_TALKS_BREED"] = 3;
		
		clearMenu();
		addButton(0, "Next", seraMenu);
		return true;
	}
	
	return false;
}
// New greets after 100 days until PC gives birth. Randomly selected
public function seraSpawnPregnancyApproach(pregDays:Number = 0):Boolean
{
	if(flags["SERA_TALKS_BREED"] < 3) return false;
	
	var msg:String = "";
	var msgList:Array = [];
	
	// Plays after >220 days
	if(pregDays > 220)
	{
		msg = "<i>“C’mere,”</i> Sera demands as soon as you walk in. <i>“I want feels.”</i> She sits you down on her stool before stroking your swollen belly. On cue, her offspring gives a kick, making you coo.";
		msg += "\n\n<i>“Whoa,”</i> breathes the demon-morph, her expression soft and unguarded for a moment. She reasserts her authoritativeness with a stern pat on your taunt, rounded skin.";
		msg += "\n\n<i>“No more sex now until you drop it, okay slut? As fun as it is screwing an overripe piece of fruit, we can’t do it like we do when you’re like this.”</i> She grins at you toothily. <i>“So you keep all that hormonal-ness locked up until then. If you’re REALLY good, I might just knock you up the spout again. Won’t that be nice?”</i>";
		msgList.push(msg);
	}
	// Plays after >180 days
	else if(pregDays > 180)
	{
		msg = "<i>“Fucking One, [pc.name].”</i> Sera stares as you sway carefully into the Dark Chrysalis. <i>“I’m going to have to get a double door installed if you keep growing. How much longer before you pop?”</i>";
		msg += "\n\n<i>“Three more months or so,”</i> you reply, stroking your [pc.belly]. The demon-morph shakes her head in disbelief.";
		msg += "\n\n<i>“There are aliens who can pump out kids in less than a week. How did humans get to where we are with such a ridiculous reproductive system?”</i>";
		msgList.push(msg);
	}
	// Plays after >100 days
	else if(pregDays >= 100)
	{
		msgList.push("<i>“How’s it going, " + RandomInCollection(["breeding bitch", "babycakes", "up-stick", "broodmare", "barefoot", "slut oven", "Captain Hormones", "baby factory", "pramface", "bulge", "leaky tits"]) + "?”</i> leers Sera lasciviously, leaning on the counter and taking her handiwork in.");
	}
	
	if(msgList.length > 0)
	{
		clearOutput();
		author("Nonesuch");
		showSera();
		
		output(msgList[rand(msgList.length)]);
		
		// [Sex?] grayed out until birth
		if(pregDays > 220) pc.createStatusEffect("Sera Breed No Sex");
		
		return true;
	}
	
	return false;
}

// Sera Baby counting functions
public function listSeraBabies(unnamed:Boolean = false):Array
{
	// Only check for unique Sera babies.
	// Only babies that are 5 years and younger count.
	var babies:Array = listBabiesOfParent("SERA", unnamed, 0, (5 * 365));
	
	return babies;
}
public function listSeraNoNameBabies():Array
{
	return listSeraBabies(true);
}
/*
public function displaySeraBabies():void
{
	var babies:Array = listSeraBabies();
	
	output("<u><b>Sera’s Offspring</b></u>");
	if(StatTracking.getStat("pregnancy/sera kids") > 0) output("\n<b>* Sera’s Children, Total:</b> " + StatTracking.getStat("pregnancy/sera kids"));
	if(babies.length > 0)
	{
		for(var i:int = 0; i < babies.length; i++)
		{
			output("\n\n<b>Child No. " + (i + 1) + ":</b>");
			output("\n<b>* Name:</b> " + (babies[i].Name == "" ? "<i>Unnamed</i>" : babies[i].Name));
			output("\n<b>* Race:</b> " + (babies[i].originalRace == "NOT SET" ? "<i>Unknown</i>" : StringUtil.toDisplayCase(babies[i].originalRace)));
			output("\n<b>* Age:</b> ");
			if(babies[i].Days >= 365) output(babies[i].Years + " year" + (babies[i].Years == 1 ? "" : "s"));
			else if(babies[i].Days >= 30) output(babies[i].Months + " month" + (babies[i].Months == 1 ? "" : "s"));
			else output("Newborn");
			output("\n<b>* Birthdate:</b> " + minutesToDate(babies[i].BornTimestamp));
			output("\n<b>* Maturation Rate:</b> " + formatFloat(babies[i].MaturationRate * 100) + " %");
			if(babies[i].NumNeuter > 0 || babies[i].NumFemale > 0 || babies[i].NumMale > 0 || babies[i].NumIntersex > 0)
			{
				output("\n<b>* Sex:</b>");
				if(babies[i].NumNeuter > 0) output(" Sexless");
				if(babies[i].NumFemale > 0) output(" Female");
				if(babies[i].NumMale > 0) output(" Male");
				if(babies[i].NumIntersex > 0) output(" Hermaphrodite");
			}
			if(babies[i].skinTone != "NOT SET")
				output("\n<b>* Skin Tone:</b> " + StringUtil.toDisplayCase(babies[i].skinTone));
			//if(babies[i].lipColor != "NOT SET")
			//	output("\n<b>* Lip Color:</b> " + StringUtil.toDisplayCase(babies[i].lipColor));
			//if(babies[i].nippleColor != "NOT SET")
			//	output("\n<b>* Nipple Color:</b> " + StringUtil.toDisplayCase(babies[i].nippleColor));
			if(babies[i].eyeColor != "NOT SET")
				output("\n<b>* Eye Color:</b> " + StringUtil.toDisplayCase(babies[i].eyeColor));
			if(babies[i].hairColor != "NOT SET")
				output("\n<b>* Hair Color:</b> " + StringUtil.toDisplayCase(babies[i].hairColor));
			if(babies[i].scaleColor != "NOT SET")
				output("\n<b>* Scale Color:</b> " + StringUtil.toDisplayCase(babies[i].scaleColor));
			if(babies[i].furColor != "NOT SET")
				output("\n<b>* Fur Color:</b> " + StringUtil.toDisplayCase(babies[i].furColor));
		}
	}
	else
	{
		output("\n<i>* There are no babies currently in the nursery for Sera.</i>");
	}
}
*/

// Sera Nursery Visits
// Per day Sera has a 50% chance of appearing in the Cafeteria between 18:00 - 21:30 if Seraspawn has arrived. Dark Chrysalis should be closed at this time if it’s triggered.
public function seraHasKidInNursery(unnamed:Boolean = false):Boolean
{
	var babies:Array = listSeraBabies(unnamed);
	if(babies.length > 0) return true;
	return false;
}
public function seraNurseryVisitCheck(totalAttempts:int = 1):void
{
	if(totalAttempts < 1 || (!seraRecruited() && currentLocation == "DARK CHRYSALIS") || (seraIsCrew() && shipLocation != "TAVROS HANGAR")) return;
	
	var probMax:int = (seraRecruited() ? 1 : 1000);
	var prob:int = Math.round((1 - Math.pow((1 / 2), totalAttempts)) * probMax);
	
	if(seraHasKidInNursery(true) || (seraHasKidInNursery() && rand(probMax) <= prob))
	{
		pc.createStatusEffect("Sera at Nursery");
	}
}
public function seraAtNursery():Boolean
{
	if(pc.hasStatusEffect("Sera Mommy Time")) return false;
	if(pc.hasStatusEffect("Sera at Nursery") && (hours == 18 || (hours > 18 && hours < 21) || (hours == 21 && minutes <= 30))) return true;
	
	return false;
}
// Common room blurb
public function seraNurseryCafeteriaBonus(btnSlot:int = 0):void
{
	if(!seraHasKidInNursery())
	{
		pc.removeStatusEffect("Sera at Nursery");
		addDisabledButton(btnSlot, "Sera");
		return;
	}
	
	output("\n\nSera is parked behind a table on the older kid’s side, in the process of demolishing an evening meal.");
	if(flags["MET_SERA_IN_NURSERY"] == undefined) output(" It takes you a moment to recognize her - she’s dressed in a shockingly mild jeans and blouse combo. Even her heels look fairly conservative today.");
	else output(" It never stops being a bit weird to see the demon-morph in a fully lit environment with her business not all the way out there.");
	
	// [Sera]
	addButton(btnSlot, "Sera", seraNurseryCafeteriaApproach);
}
public function seraNurseryCafeteriaApproach():void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	clearMenu();
	
	var seraBabies:Array = listSeraBabies();
	var seraNoNameBabies:Array = listSeraNoNameBabies();
	
	var babyIdx:int = 0;
	var babym:Boolean = (rand(2) == 0 ? false : true);
	var babyName:String = "???";
	var i:int = 0;
	
	// Count children...
	var numBabs:int = 0;
	var numKids:int = 0;
	for(i = 0; i < seraBabies.length; i++)
	{
		// Show this if there is a Seraspawn that is under 365 days old
		if(seraBabies[i].Years <= 1) numBabs++;
		// Show this if there is a Seraspawn that is over a year old. No they are never going to be over the age of five shut up
		else if(seraBabies[i].Years <= 5) numKids++;
	}
	
	// First
	if(flags["MET_SERA_IN_NURSERY"] == undefined)
	{
		babyIdx = 0;
		if(seraNoNameBabies.length > 0)
		{
			babym = (seraNoNameBabies[babyIdx].NumMale > 0);
			babyName = seraNoNameBabies[babyIdx].Name;
		}
		else if(seraBabies.length > 0)
		{
			babym = (seraBabies[babyIdx].NumMale > 0);
			babyName = seraBabies[babyIdx].Name;
		}
		
		output("<i>“So this place is real then,”</i> Sera says without preamble, when you sit down opposite her. She jams another load of pasta into her cheek. <i>“S’good. I’d be killing you right about now ‘f it weren’t.”</i>");
		output("\n\n<i>“No problems getting in?”</i> The fork clatters on the plate; Sera glowers reptilian hate in the direction of the front desk.");
		output("\n\n<i>“That cyber-cow you have running this shit refused to let me in until I went back and changed!”</i> she snarls. <i>“Of fucking course some high and mighty bolt-bag from the 29th Century would get themselves put in charge here. If you ask me, kids should get used to seeing twelve-inch dick at face height attached to someone who doesn’t like them. Best education they’ll ever get.”</i>");
		output("\n\n<i>“Have you been to see " + (babym ? "him" : "her") + "?”</i> you ask gently.");
		output("\n\n<i>“Yeah,”</i> she says, not looking at you.");
		
		processTime(2);
		
		flags["MET_SERA_IN_NURSERY"] = 1;
		
		if(seraNoNameBabies.length > 0)
		{
			output(" <i>“I mean, " + (babym ? "he" : "she") + " was sleeping, so... I mean, I’m TOLD that " + (babym ? "he" : "she") + "’s mine. Could be anyone’s, knowing you.”</i> She fidgets with her cutlery. <i>“The staff say they’re still waiting for you to name it. What am I supposed to call it?”</i>");
			// [Enter Name]
			addButton(0, "Next", nameSeraSpawn, [babyIdx, babym, babyName, 0]);
		}
		else
		{
			output(" <i>“You here to check in on the brat" + ((numBabs + numKids) == 1 ? "" : "s") + ", too?”</i> Sera gives you a glance in-between shoveling food into her mouth. <i>“Don’t let me stand in your way.”</i>");
			
			// [Visit / Play] [Leave]
			if(numBabs > 0) addButton(0, "Visit", seraNurseryActions, ["visit"], "Visit", "Chivvy Sera into paying your child a visit together.");
			if(numKids > 0) addButton(1, "Play", seraNurseryActions, ["play"], "Play", "Chivvy Sera into playing with your child together.");
			addButton(14, "Leave", mainGameMenu);
		}
	}
	// Repeat naming if PC has other kids by Sera, because one wasn’t fucking enough
	else if(seraNoNameBabies.length > 0)
	{
		processTime(1);
		
		babyIdx = 0;
		babym = (seraNoNameBabies[babyIdx].NumMale > 0);
		babyName = seraNoNameBabies[babyIdx].Name;
		
		if(!seraRecruited())
		{
			output("<i>“I still can’t believe you put yourself through");
			if(flags["SERA_NAMED_KID"] != undefined) output(" another");
			output(" nine months of morning sickness and looking like a tank,”</i> Sera says when you sit yourself down opposite her. <i>“Did your dad mod you so that you’d have the breeding bug bad? Would make sense of this place.”</i>");
		}
		else
		{
			output("<i>“So, we have a");
			if(flags["SERA_NAMED_KID"] != undefined) output("nother");
			output(" kid to add to our family now... Guess you get to name it,”</i> Sera says when you sit yourself down opposite her. <i>“I remember the contract saying slaves get jack in this situation.”</i>");
		}
		output(" She concentrates on swallowing her current mouthful of cauli-nubbs before going on in an overly casual tone. <i>“What are we calling this little " + (babym ? "bastard" : "moppet") + ", then?”</i>");
		
		// [Enter Name]
		addButton(0, "Next", nameSeraSpawn, [babyIdx, babym, babyName, 0]);
	}
	// Repeat
	else
	{
		if(pc.isPregnant() && pc.bellyRating() >= 10) output("<i>“Here to order some chocolate-coated celery or something?”</i> Sera sniggers as she glances at your [pc.belly]. <i>“Is that one mine? I kinda lose track.”</i>");
		else output("<i>“You here to check in on the brat" + ((numBabs + numKids) == 1 ? "" : "s") + "?”</i> Sera gives you a glance in-between shoveling food into her mouth. <i>“Don’t let me stand in your way.”</i>");
		
		// [Visit / Play] [Leave]
		if(numBabs > 0) addButton(0, "Visit", seraNurseryActions, ["visit"], "Visit", "Chivvy Sera into paying your child a visit together.");
		if(numKids > 0) addButton(1, "Play", seraNurseryActions, ["play"], "Play", "Chivvy Sera into playing with your child together.");
		//addButton(4, "Stats", seraNurseryActions, ["stats"], "Offspring Stats", "Check the stats of Sera’s kids.");
		addButton(14, "Leave", mainGameMenu);
	}
}
public function nameSeraSpawn(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	clearBust();
	showName("\nNAME?");
	
	var babyIdx:int = arg[0];
	var babym:Boolean = arg[1];
	var babyName:String = arg[2];
	var namedBabies:int = (arg.length > 3 ? arg[3] : 0);
	var fromSera:Boolean = (arg.length > 4 ? arg[4] : false);
	
	output("Sera is asking you to name your " + (babym ? "handsome baby boy" : "beautiful baby girl") + ". What do you decide to name " + (babym ? "him" : "her") + "?");
	displayInput();
	this.userInterface.textInput.text = babyName;
	output("\n\n\n");
	
	clearMenu();
	addButton(0, "Next", nameSeraSpawnCheck, [babyIdx, babym, babyName, namedBabies, fromSera]);
}
public function nameSeraSpawnCheck(arg:Array):void
{
	var babyIdx:int = arg[0];
	var babym:Boolean = arg[1];
	var babyName:String = arg[2];
	var namedBabies:int = arg[3];
	var fromSera:Boolean = arg[4];
	
	if(this.userInterface.textInput.text == "")
	{
		nameSeraSpawn(arg);
		output("<b>You must input a name.</b>");
		return;
	}
	// Illegal characters check. Just in case...
	if(hasIllegalInput(this.userInterface.textInput.text))
	{
		nameSeraSpawn(arg);
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	if(this.userInterface.textInput.text.length > 14)
	{
		nameSeraSpawn(arg);
		output("<b>You must enter a name no more than fourteen characters long.</b>");
		return;
	}
	babyName = this.userInterface.textInput.text;
	if(stage.contains(this.userInterface.textInput)) this.removeInput();
	nameSeraSpawnResult([babyIdx, babym, babyName, namedBabies, fromSera]);
}
public function nameSeraSpawnResult(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	var seraNoNameBabies:Array = listSeraNoNameBabies();
	
	var babyIdx:int = arg[0];
	var babym:Boolean = arg[1];
	var babyName:String = arg[2];
	var namedBabies:int = (arg[3] + 1);
	var fromSera:Boolean = arg[4];
	
	// Special Names:
	var setName:String = (babyName.toLowerCase());
	
	// PC inputs any of the following text-strings: Fuck, Tit, Bitch, Ass, Slut, Whore, Butt, Dick, Piss, Shit, Cock, Cunt, Cum, Pussy, Wank
	if(InCollection(setName, ["fuck", "tit", "bitch", "ass", "slut", "whore", "butt", "dick", "piss", "shit", "cock", "cunt", "cum", "pussy", "wank", "faggot", "asshole", "dickhead", "buttslut"]))
	{
		if(!fromSera) output("Sera laughs uproariously, drawing curious glances from the kitchen staff.");
		else output("Sera manages a single crow croak of a laugh.");
		output("\n\n<i>“We can’t call it that,”</i> she cries. <i>“" + (babym ? "He" : "She") + " will grow up thinking daddy keeps mixing " + (babym ? "him" : "her") + " up with mommy! C’mon, seriously now.”</i>");
		
		// Show textbox again
		addButton(0, "Next", nameSeraSpawn, [babyIdx, babym, babyName, arg[3], fromSera]);
		return;
	}
	// PC calls male child Damien
	else if(babym && setName == "damien")
	{
		output("Sera nods thoughtfully.");
		output("\n\n<i>“That sounds right, somehow. " + babyName + ",”</i> she repeats. She grins. <i>“Yeah. I think this kid is going to make people jump through windows for it, some day!”</i>");
	}
	// PC calls female child Regan
	else if(!babym && setName == "regan")
	{
		output("Sera nods thoughtfully.");
		output("\n\n<i>“That sounds right, somehow. " + babyName + ",”</i> she repeats. She grins. <i>“Yeah. I think this kid is going to make people’s heads turn, some day!”</i>");
	}
	// Otherwise
	else
	{
		output("<i>“" + babyName + ",”</i> Sera tries, rolling it around her mouth. <i>“Alright, I’m on board. Worse things " + (babym ? "he" : "she") + " could be called, I guess.”</i>");
	}
	// merge
	if(!fromSera)
	{
		output("\n\nThe purple-skinned succubus goes back to toying with her meal.");
		output("\n\n<i>“I guess I can come up here every once in a while,”</i> she says. <i>“Make sure they don’t sell little " + babyName + " to a corporation or whatever, whilst you’re slutting it up on the frontier. The food’s pretty good for a kiddie joint, so I’m perfectly happy to keep freeloading here until they start refusing to let me in.”</i>");
		output("\n\n<i>“And also because you think your " + (babym ? "son" : "daughter") + "’s really cute,”</i> you say, gazing at her shrewdly. <i>“Don’t you?”</i>");
		output("\n\nSera brushes the smirk off her face and goes on eating without deigning to answer. She can do nothing about the suggestion of " + (chars["SERA"].skinTone != "bright pink" ? "navy" : "magenta") + " across her cheeks, though.");
	}
	else
	{
		output("\n\n<i>“I don’t mind staying here, if you don’t want me back as your ship slut straight away,”</i> she says, eyes returning to the bundle in her arms. <i>“The food here is pretty good. And somebody’s got to make sure they don’t sell " + babyName + " to a corporation or whatever, right?”</i>");
		output("\n\n<i>“And also because you think your " + (babym ? "son" : "daughter") + "’s really cute,”</i> you say, gazing at her shrewdly. <i>“Don’t you?”</i>");
		output("\n\nSera brushes the smirk off her face and doesn’t deign to answer. She can’t do anything about the suggestion of " + (chars["SERA"].skinTone != "bright pink" ? "navy" : "magenta") + " across her cheeks, though. You give her a kiss on the hot, salty forehead, and exit left.");
	}
	
	processTime(3);
	
	// Actually set baby name
	ChildManager.CHILDREN[ChildManager.CHILDREN.indexOf(seraNoNameBabies[babyIdx])].Name = babyName;
	
	IncrementFlag("SERA_NAMED_KID");
	
	clearMenu();
	// More babies...
	if((seraNoNameBabies.length - 1) > 0) addButton(0, "Next", nameSeraSpawnResultPlus, [babyIdx, babym, babyName, namedBabies, fromSera]);
	// Bounce back to Cafeteria main menu
	else addButton(0, "Next", (!fromSera ? seraNurseryCafeteriaApproach : brigetSeraPregCheckFinish));
}
public function nameSeraSpawnResultPlus(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	clearMenu();
	
	var seraNoNameBabies:Array = listSeraNoNameBabies();
	var babyIdx:int = 0;
	var babym:Boolean = (seraNoNameBabies[babyIdx].NumMale > 0);
	var babyName:String = seraNoNameBabies[babyIdx].Name;
	var namedBabies:int = arg[3];
	var fromSera:Boolean = arg[4];
	
	if(namedBabies == 1) output("<i>“We overdid it on the whole fertility kick, didn’t we?”</i> Sera goes on with a smirk. <i>“Nearly ran when I looked through the incubator glass. What do you want to call the other one?”</i>");
	else output("<i>“And the other one?”</i> continues Sera, with an air of tribulation.");
	
	// [Enter Name]
	addButton(0, "Next", nameSeraSpawn, [babyIdx, babym, babyName, namedBabies, fromSera]);
}

public function seraNurseryActions(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	clearMenu();
	
	var seraBabies:Array = listSeraBabies();
	
	var response:String = (arg.length >= 1 ? arg[0] : "none");
	var babyIdx:int = (arg.length >= 2 ? arg[1] : 0);
	var babym:Boolean = (arg.length >= 3 ? arg[2] : (rand(2) == 0 ? false : true));
	var babyName:String = (arg.length >= 4 ? arg[3] : "???");
	var numKids:int = 0;
	var i:int = 0;
	
	switch(response)
	{
		/*
		case "stats":
			displaySeraBabies()
			
			addButton(14, "Back", seraNurseryCafeteriaApproach);
			break;
		*/
		case "visit":
			for(i = 0; i < seraBabies.length; i++)
			{
				if(seraBabies[i].Years > 1) seraBabies.splice(i, 1);
			}
			babyIdx = (seraBabies.length > 1 ? rand(seraBabies.length) : 0);
			babym = (seraBabies[babyIdx].NumMale > 0);
			babyName = seraBabies[babyIdx].Name;
			
			output("<i>“I was thinking we could both go and check in on them,”</i> you say. Sera fidgets.");
			output("\n\n<i>“Already seen them today,”</i> she mutters. <i>“I mean, you stare at one half-baked potato, you’ve stared at them all...”</i>");
			output("\n\nYou reach over and slide your hand into hers, and when you find it completely unresisting you lead her by it out of the cafeteria and down the hallway to the nursery. She trails half-hearted complaints about her dinner all the way.");
			
			processTime(2);
			
			addButton(0, "Next", seraNurseryActions, ["visit next", babyIdx, babym, babyName]);
			break;
		case "visit next":
			// Move to Dormitory square
			moveTo("NURSERYI16");
			showLocationName();
			
			// Randomly selected
			var visitList:Array = [];
			var visitOption:int = -1;
			
			visitList.push([
				(	babyName + " laboriously clambers to " + (babym ? "his" : "her") + " feet and leans on " + (babym ? "his" : "her") + " crib railing as " + (babym ? "his" : "her") + " parents enter " + (babym ? "his" : "her") + " room, before doing what babies do best: stare. Sera goes across and puts a clawed hand up; with the same expression of furrowed concentration, " + babyName + " carefully draws " + (babym ? "his" : "her") + " own tiny paw back and then pats it into her palm."
				+	"\n\n<i>“" + (babym ? "He" : "She") + " has... um." + (!seraRecruited() ? " You know I was only joking about it not being mine, right?" : "") + "”</i> The demon-morph says. There’s a soft, unfocused look on her face that you don’t see anywhere else. She gently runs her fingers over the hazel down on top of the baby’s head. <i>“" + (babym ? "He" : "She") + "’s got my natural color. That’s the first thing I noticed.”</i>"
				), "SERA_NURSERY_VISIT_1"
			]);
			visitList.push([
				(	babyName + " is currently letting everyone know in a half-mile radius that " + (babym ? "he" : "she") + " is not happy. A nurse is jogging " + (babym ? "him" : "her") + " on her shoulder, desperately trying to calm " + (babym ? "him" : "her") + " down. Catching sight of a horned demon in the doorway does not quiet " + (babym ? "his" : "her") + " screams."
				+	"\n\n<i>“See, this?”</i> says Sera in your ear. <i>“This is exactly what I had to avoid dealing with at all costs.”</i> She watches the nurse’s futile attempts to work out what exactly is wrong in " + babyName + "’s world. <i>“Still, it’s pretty funny watching somebody else having to deal with it. Ha ha, yeah!”</i> She cheers as " + babyName + " takes the dummy that’s being offered and hurls it across the room. <i>“Fuck dummies! You show them, you little asshole!”</i>"
				+	"\n\nThe nurse gives her a look of tired loathing."
				), "SERA_NURSERY_VISIT_2"
			]);
			visitList.push([
				(	babyName + " is playing with a few toys in " + (babym ? "his" : "her") + " crib when you walk in. " + (babym ? "He" : "She") + " stops chewing on a building block to stare at you."
				+	"\n\n<i>“Yeah, it’s me again,”</i> snaps Sera, staring back. <i>“What have you got to say for yourself, brat?”</i>"
				+	"\n\nWithout breaking the stare, " + babyName + " takes the building block and thumps it into the mattress."
				+	"\n\n<i>“Blah.”</i> Sera snorts approval. " + babyName + " breaks out into a big gummy grin, and thumps the block hard enough into the mattress that it bounces out of the crib."
				+	"\n\n<i>“Blah!”</i>"
				+	"\n\n<i>“Blah!”</i> Sera claps enthusiastically, and the child gurgles gleefully. <i>“You smashed that fucker good, didn’t you? That’s my " + (babym ? "boy" : "girl") + "!”</i>"
				), "SERA_NURSERY_VISIT_3"
			]);
			visitList.push([
				(	babyName + " is being gotten ready for bed. The nurse dutifully hands " + (babym ? "him" : "her") + " over so you can weigh " + (babym ? "his" : "her") + " growing self in your arms, and you can playfully bounce " + (babym ? "him" : "her") + " up and down. " + (babym ? "His" : "Her") + " attention is elsewhere, though. " + (babym ? "He" : "She") + " silently puts " + (babym ? "his" : "her") + " tiny hands out until, with an exasperated sigh, Sera comes across and points her thumb."
				+	"\n\n<i>“Yeah, thumb,”</i> she mutters, as it’s grasped and examined carefully, the pointed talon delicately touched. <i>“Amazing, isn’t it. Two of your own and all you want is somebody else’s.”</i>"
				), "SERA_NURSERY_VISIT_4"
			]);
			
			visitOption = rand(visitList.length);
			output(visitList[visitOption][0]);
			IncrementFlag(visitList[visitOption][1]);
			
			// +1 Hour
			processTime(45 + rand(11));
			
			// merge
			addButton(0, "Next", seraNurseryActions, ["visit done", babyIdx, babym, babyName]);
			break;
		case "visit done":
			moveTo("NURSERYG12");
			showLocationName();
			
			// If PC has seen all four:
			if(flags["SERA_NURSERY_VISIT_1"] != undefined && flags["SERA_NURSERY_VISIT_2"] != undefined && flags["SERA_NURSERY_VISIT_3"] != undefined && flags["SERA_NURSERY_VISIT_4"] != undefined)
			{
				output("You spend a few more minutes interacting with " + babyName + " and then head back out to the corridor. You’re always wary of... you are startled out of your thoughts by something that sounds like a pig that’s been made to run too fast.");
				output("\n\n<i>“One dammit son of a bitch,”</i> sniffs Sera, furiously wiping away her tears and then blowing her nose. <i>“That stupid bundle of fucking joy... I " + (!seraRecruited() ? "was always warned this would happen. Eventually, the sub breaks YOU" : "NEVER wanted you to make me cry. I just didn’t know how far you’d go..") + ".”</i>");
				output("\n\nYou give her a hug, and after a moment, she squeezes you back tightly. You go back to the cafeteria arm in arm.");
				output("\n\n<i>“None of " + (!seraRecruited() ? "my" : "your") + " other sluts find out about this, okay?”</i> she says, settling herself down again. <i>“This place is a...”</i>");
				output("\n\n<i>“Safe spot,”</i> you suggest.");
				output("\n\n<i>“Yeah. Where I can let all my emotions go and shit, so I can be a " + (!seraRecruited() ? "callous bitch" : "nasty slut") + " the rest of the time. Understood?”</i>");
				output("\n\nYou lean over and plant a kiss on her forehead. You receive a glower and two " + (chars["SERA"].skinTone != "bright pink" ? "navy" : "magenta") + " cheeks in response.");
				
				processTime(5);
			}
			// Regular:
			else
			{
				output("You spend a few more minutes interacting with " + babyName + " and then head back to the cafeteria. You’re always wary of straining Sera’s paternal instincts too far.");
				output("\n\n<i>“Do you think " + (babym ? "he" : "she") + " will turn out to be sub or dom?”</i> she asks, sitting back down to her meal. <i>“Sometimes " + (babym ? "he" : "she") + " seems really eager to please, but other times " + (babym ? "he" : "she") + " looks like all " + (babym ? "he" : "she") + " needs is a whip in one hand.”</i> She catches your expression. <i>“What?”</i>");
				
				processTime(4);
			}
			IncrementFlag("SERA_NURSERY_VISIT");
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "play":
			for(i = 0; i < seraBabies.length; i++)
			{
				if(seraBabies[i].Years <= 1) seraBabies.splice(i, 1);
			}
			babyIdx = (seraBabies.length > 1 ? rand(seraBabies.length) : 0);
			babym = (seraBabies[babyIdx].NumMale > 0);
			babyName = seraBabies[babyIdx].Name;
			
			numKids = ChildManager.numOfMobileGendersInRange(1, 5).total;
			
			output("<i>“I think " + babyName + " would love to have a horse around with us before bedtime,”</i> you say. <i>“Don’t you?”</i>");
			output("\n\n<i>“Nothing fun ever happens before bedtime,”</i> Sera sniffs. <i>“But if you insist.”</i>");
			output("\n\nYou head through into the common room, where " + babyName + " is being brought in");
			if(numKids == 2) output(" with your other kid");
			else if(numKids <= 4) output(" with your other kids");
			else if(numKids > 4) output(" with some of your other kids");
			output(" for evening playtime. " + babyName + "’s face lights up when " + (babym ? "he" : "she") + " catches sight of " + (babym ? "his" : "her") + " parents.");
			output("\n\n<i>“" + (chars["SERA"].skinTone == "bright pink" ? "Pick" : "Popo") + " mommy!”</i> " + (babym ? "he" : "she") + " cries, toddling towards you. <i>“" + (!seraRecruited() ? "Biisht" : pc.mf("Mash Toe", "Mishtiss")) + " " + pc.mf("daddy", "mommy") + "!”</i>");
			if(flags["SERA_NURSERY_PLAY"] == undefined) output("\n\n" + (!seraRecruited() ? "You cover your eyes despairingly, Sera’s delighted laughter ringing" : "Oh no. Sera’s delighted laughter rings") + " in your ears.");
			else output("\n\nYou really hope you can get " + (babym ? "him" : "her") + " to grow out of that soon.");
			
			processTime(1);
			
			addButton(0, "Next", seraNurseryActions, ["play next", babyIdx, babym, babyName]);
			break;
		case "play next":
			// Move to common room square
			moveTo("NURSERYE12");
			showLocationName();
			
			// Randomly selected
			var playList:Array = [];
			var playOption:int = -1;
			
			numKids = ChildManager.numOfMobileGendersInRange(1, 5).total;
			
			playList.push([
				(	"The three of you spend some time constructing a makeshift castle out of magnetic building blocks. " + babyName + " and Sera tire of it at roughly the same time, and you have to take cover as they gleefully destroy it. The rest of the allotted playtime is spent seeing how hard they can dent the wall, Sera at great pains to demonstrate proper throwing technique to the little so-and-so."
				), "SERA_NURSERY_PLAY_1"
			]);
			playList.push([
				(	"You settle down with a book heavy on the rockets and space heroes theme, and tell the story to a rapt " + (numKids == 1 ? babyName : "small audience of your children") + ". Sera keeps on ruining it by inserting obscenities wherever she can, until at last you throw the book at her in disgust. She takes it and continues to tell a heavily Sera-lized version of it to " + (numKids == 1 ? ("a delighted, giggling " + babyName) : "the delighted, giggling gaggle of children") + " until Briget rips it out of her hands."
				), "SERA_NURSERY_PLAY_2"
			]);
			playList.push([
				(	"<i>“All of the toys in here are such horseshit,”</i> snorts Sera."
				+	"\n\n<i>“Hoshutt?”</i> repeats " + babyName + " doubtfully. The demon-morph rummages around in her bag."
				+	"\n\n<i>“Here, let me show you a toy that’s really fun. Put your arm out, kid.”</i> She snaps the steel ring on up near " + (babym ? "his" : "her") + " shoulder. <i>“Cuffs - zero grav.”</i>"
				+	"\n\n" + babyName + " squeals with delight, clapping " + (babym ? "his" : "her") + " hands whilst Sera bats " + (babym ? "him" : "her") + " slowly through the air with pats on the behind, rebounding " + (babym ? "him" : "her") + " off the ceiling. You’re torn between " + babyName + "’s obvious joy and pretty much every other facet of what’s going on. Once she catches sight, however, Briget is not. She grabs " + babyName + " out of the air and enters into another furious argument with Sera, punctuated by " + babyName + "’s wails."
				), "SERA_NURSERY_PLAY_3"
			]);
			// Only if kids > 2, at least one not Sera’s
			if(numKids >= 2 && seraBabies.length <= numKids)
			{
				// Choose a (non-Sera type) unique baby
				var totsName:String = "";
				var totsList:Array = [];
				for(i = 0; i < ChildManager.CHILDREN.length; i++)
				{
					var tots:* = ChildManager.CHILDREN[i];
					if(tots is UniqueChild && tots.UniqueParent != "SERA" && tots.Years <= 5)
					{
						totsList.push(tots);
					}
				}
				if(totsList.length > 0) totsName = totsList[rand(totsList.length)].Name;
				
				playList.push([
					(	"<i>“You really are some slut, huh,”</i> Sera says to you, taking in the room of children. <i>“Did your folks never teach you about the magic of contraceptive?”</i>"
					+	"\n\n" + babyName + " has in " + (babym ? "his" : "her") + " hands a stuffed varmint, but " + (babym ? "he" : "she") + "’s playing with it half-heartedly. " + (babym ? "His" : "Her") + " eyes are on " + (totsName != "" ? totsName : "another toddler") + "’s handheld game console, a little way over."
					+	"\n\n<i>“Nuh,”</i> " + babyName + " says, looking at you two and pointing at it."
					+	"\n\n<i>“If you want it, go and take it!”</i> snaps Sera, pointing in the same direction. <i>“It’s a Darwinian fun house in here, kid - you go and show that brat who the alpha " + (babym ? "bastard" : "bitch") + " in here is.”</i>"
					+	"\n\n" + (pc.isNice() ? "<i>“I really don’t think that’s...”</i> you interject, but it’s already too late. " : "") + babyName + " picks " + (babym ? "him" : "her") + "self up, toddles over and snatches the game out of " + (totsName != "" ? totsName : "the toddler") + "’s hands. " + babyName + " grins in delight to the cheer this draws out of Sera, the actual prize of the encounter almost forgotten."
					+	"\n\n<i>“That’s how you do it, " + (babym ? "boy" : "girl") + "!”</i> she crows. <i>“You grab whatever life is stupid enough to show you even for a moment, and then you... oh great. Here comes Nurse Ratchet.”</i>"
					+	"\n\nYou comfort the wailing " + totsName + " as best you can as Briget and Sera enter into another shouting match."
					), "SERA_NURSERY_PLAY_4"
				]);
			}
			
			playOption = rand(playList.length);
			output(playList[playOption][0]);
			IncrementFlag(playList[playOption][1]);
			
			// +1 Hour
			processTime(45 + rand(11));
			
			// merge
			addButton(0, "Next", seraNurseryActions, ["play done", babyIdx, babym, babyName]);
			break;
		case "play done":
			moveTo("NURSERYG12");
			showLocationName();
			
			output("<i>“You know, I’m definitely warming to the whole parenting thing,”</i> says Sera a little while later, happily reseating herself at her cafeteria table. <i>“Dunno why I was so hostile to the idea to begin with.”</i>");
			output("\n\nYou wonder if it might not be too late to bar her from entry.");
			
			processTime(4);
			
			IncrementFlag("SERA_NURSERY_PLAY");
			
			addButton(0, "Next", mainGameMenu);
			break;
		default:
			output("AN ERROR HAPPENED HERE.");
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

