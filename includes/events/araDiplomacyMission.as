// Ara’s Diplomacy Mission
// by Nonesuch
// https://docs.google.com/document/d/1j2B6lvKgcIJxowyyMxmInlNYLfQXeD9bjxYG3-rGiHc

/*

Notes

•	Ara needs two things: Some kind of chemical suppressant which will enable the quadommes to suffer each other’s company for extended periods, and for you to go to the Deep Caves, find four other quadommes, and persuade them to come to the table.
•	The chemical suppressant can be gotten off either Haswell or Lessau. Lash and McAllister will fob you off. Lessau won’t charge anything, but will give you a big, dorky speech about whether uplifting the bothrioc is such a great idea. He’ll give you two different drugs: one will act as advertised, the other will make the bothrioc act even more aggressively towards each other.
•	The other quadommes can be persuaded w/ high Intelligence, or by you taking a good hard breeding. As a failsafe they will also accept you leading a beta Nyrea into their webs. They will *not* be persuaded by PCs simply beating the shit out of them. They’re far too proud!
•	One of the quadommes (who definitively identifies as female in deference to noobsaleh) will demand the PC join her harem as payment for her support. 
•	Ara’s reward: The bothrioc genotype, which she has successfully kept out of Xenogen’s hands so far. You can give this to Haswell for a huge price, or to Lessau for less + headpats + Steele Tech advancement.
•	If you use the correct suppressant, meet goes as planned. Ara further rewards you with some symbolic weapon (but was it the right thing to do???) If you use the decoy, the meet breaks down and the bothrioc don’t unite. Ara gives Myrellion up and heads with her harem to the stars. Good going loser.
•	Regardless, if you agreed to join the femme bothrioc harem that’s exactly what happens.

*/

public function bothriocEmbassyClosedOffFunc():void
{
	showBust("CHARLES");
	
	output("You step into the Bothrioc Embassy, which is still heaving with activity. From [ara.his] position in the middle of it all, Ara Kei Anya’s eyes turn to you... and then right past, as if you weren’t there, over to the latest submissive who’s hurried over to [ara.his] side with a form in hand.");
	output("\n\nCharles offers you a rueful little smile from the far end of the room, though. You can probably still go and talk to him.");
	
	addButton(1, "Charles", approachCharles, undefined, "Charles", "The russet-haired human seems to be the only one here who isn’t under Ara Kei’s spell.");
}

public var BOTHRIOC_QUEST_START:int = 0; // Begin mission, Get suppressant.
public var BOTHRIOC_QUEST_RESEARCH:int = 1; // Wait for suppressant.
public var BOTHRIOC_QUEST_DIPLOMACY:int = 2; // Fine quadommes for the summit.
public var BOTHRIOC_QUEST_QUADOMME:int = 3; // Found all quadommes, Return to Ara.
public var BOTHRIOC_QUEST_SUCCESS:int = 4; // Ara awards and Bothrioc unite.
public var BOTHRIOC_QUEST_FAILURE:int = -1; // Bothrioc do not unite.

public function bothriocQuestAvailable():Boolean
{
	if(pc.level < 7) return false;
	
	return (flags["MET_CHARLES"] != undefined && flags["ARAKEI_TALKED"] != undefined && flags["ARAKEI_TALKED_BOTHRIOC"] != undefined && flags["ARAKEI_TALKED_AMBASSADOR"] != undefined && flags["ARAKEI_TALKED_HISTORY"] != undefined && flags["ARAKEI_TALKED_OTHERBOTHRIOC"] != undefined && flags["DEEP_CAVES_STEP"] != undefined);
}
public function bothriocQuestActive():Boolean
{
	return (flags["BOTHRIOC_QUEST"] != undefined && !bothriocQuestComplete());
}
public function bothriocQuestComplete():Boolean
{
	return (flags["BOTHRIOC_QUEST_COMPLETE"] != undefined || flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_SUCCESS || flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_FAILURE);
}

// Greet if BothQuest currently active
public function bothriocQuestGreeting():void
{
	clearOutput();
	showAraKei();
	
	IncrementFlag("MET_ARAKEI");
	
	output("<i>“The intrepid hero of the bothrioc returns!”</i> Ara favors you with a wide smile and is stalking over to you the moment you enter the Embassy. <i>“How go your efforts? What news do you have?”</i>");
	
	processTime(1);
	// Standard talks/sex from there
	araKeiMenu();
}

// Intro
// Activates if PC chooses [Talk] if PC has already used all talk options AND has visited Deep Caves
public function bothriocQuestTalk():void
{
	clearOutput();
	showAraKei();
	clearMenu();
	
	var addiction:Number = bothriocAddiction();
	
	output("<i>“You like asking questions about my kind, don’t you Steele?”</i> Ara Kei considers you with a small smile on [ara.his] lips. <i>“");
	if(addiction < 40) output(" Even though you refuse to fully submit to our love, and thereby gain the greater understanding you seem to crave. Very austere. Very monk-like of you.");
	else output(" Even though you are far along the path now, and so have gained a greater understanding than most aliens will ever even guess at. What more can you possibly wish to know?");
	output("”</i>");
	output("\n\nOne pair of hands smooth down the pale grey shift; another points to a spot [ara.his] boot-polisher isn’t paying enough attention to. You’ve been in this being’s presence long enough to know [ara.he] " + ara.mfn("is", "is", "are") + " ruminating, and so you wait.");
	output("\n\n<i>“I need help,”</i> Ara says at last. <i>“I need a personage of derring do. Someone who is separate from us.”</i> One pair of arms spreads out, indicating the vast bustle of activity around [ara.him]. <i>“I need someone who has experience of traversing the Deep Caves, someone who is willing to approach the nests of the other quadommes. I need someone who wants to help us. From the bottom of their hearts.”</i>");
	output("\n\n<i>“What exactly do you want?”</i> you ask.");
	if(addiction >= 85)
	{
		output("\n\nAra Kei says nothing, simply looks at you with those depthless black eyes of [ara.his] until there is nothing but the soft heat within, the tar-pit love without. You fall to your [pc.knees]");
		if(pc.hasVagina()) output(", [pc.femcum] drooling down your [pc.thighs]");
		if(pc.hasCock()) output(", your [pc.cocks] helplessly erect");
		if(pc.hasGenitals()) output(",");
		output(" and moan breathlessly as the dominant slowly clacks [ara.himself] forward until [ara.he] " + ara.mfn("is", "is", "are") + " standing above you.");
		output("\n\n<i>“You know what I want,”</i> Ara breathes at last. Every syllable vibrates through you like the sweetest note in the world. <i>“Because it’s what you want too, little one. I want to elevate our kind to the stars above. I want our race to escape the annihilation the Myr wish to inflict upon this world. I want to set ourselves above all that will accept us, so untold multitudes can know the bliss and certitude you do. For this, I need many of our people’s voices. All raised at once, all singing the same song. For this, I need you.”</i>");
		output("\n\n<i>“I obey, " + ara.mfn("master", "mistress", "master-mistress") + ",”</i> you say automatically, sheerest bliss filling your mind as you sound the syllables.");
		output("\n\n<i>“I know you do.”</i> Two chitinous fingertips touch the nape of your neck, and you cannot help but keen with pleasure.");
		
		pc.lust(30);
		
		// Goto [Yes] path, + Lust
		addButton(0, "Next", bothriocQuestTalkNext, ["yes", addiction]);
	}
	else
	{
		output("\n\n<i>“Forgive my negotiating instincts, Steele,”</i> Ara returns, again with that small smile of [ara.his], <i>“but I’d like to hear you say you’re willing to help me, before I take you into my confidence. Perhaps you still think we are a dangerous race, and don’t approve of my mission to uplift us. Perhaps the delightful Colonel Nehzara across the way there has warned you about me, and asked you to report anything I tell you to her. If so, do me the politeness of refusing. I will understand.”</i>");
		
		addButton(0, "Yes", bothriocQuestTalkNext, ["yes", addiction]);
		addButton(1, "No", bothriocQuestTalkNext, ["no", addiction]);
	}
	processTime(2);
}
public function bothriocQuestTalkMenu(response:String = "", addiction:Number = 0):void
{
	
	clearMenu();
	if(response == "quadommes") addDisabledButton(0, "Quadommes");
	else addButton(0, "Quadommes", bothriocQuestTalkNext, ["quadommes", addiction], "Quadommes", "");
	if(response == "counteragent") addDisabledButton(1, "Counteragent");
	else addButton(1, "Counteragent", bothriocQuestTalkNext, ["counteragent", addiction], "Counteragent", "");
	if(response == "reward") addDisabledButton(2, "Reward");
	else addButton(2, "Reward", bothriocQuestTalkNext, ["reward", addiction], "Reward", "");
	
	addButton(4, "Next", bothriocQuestTalkNext, ["next", addiction], "Next", "");
}
public function bothriocQuestTalkNext(arg:Array):void
{
	clearOutput();
	showAraKei();
	
	var response:String = arg[0];
	var addiction:Number = arg[1];
	
	switch(response)
	{
		case "no":
			output("<i>“I see.”</i>");
			output("\n\nAra folds [ara.his] fingers and lowers [ara.his] head, a graveness falling across [ara.his] long face, moonlight on snow and black rock. You’ve clearly disappointed [ara.him] quite badly.");
			output("\n\n<i>“Thank you for being truthful,”</i> [ara.he] say" + ara.mfn("s", "s", "") + " at last. <i>“If you will excuse me, Steele - there is much to be done. I wish you good luck on the rest of your adventures.”</i>");
			output("\n\n[ara.He] swing" + ara.mfn("s", "s", "") + " away, back to the hubbub of activity in the embassy. You get the distinct impression that this is the last interview you’re going to get with the quadomme.");
			
			// Set Araflag to ClosedOff
			processTime(1);
			flags["ARAKEI_CLOSED_OFF"] = 1;
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "yes":
			if(addiction < 85)
			{
				if(pc.isBimbo()) output("<i>“Of course!”</i> you reply cheerily. You’re always happy to help one of your many smart, sexy friends. And aren’t all quests basically about meeting lots of hunky guys and girls and then sucking their dicks? You’re good at that.");
				else if(addiction >= 50) output("<i>“Of course I’ll help you, Ara,”</i> you reply, slightly hurt that [ara.he] has questioned your devotion. <i>“Please - tell me what I must do.”</i>");
				else if(pc.isAss() || pc.isBro()) output("<i>“I’ll help you,”</i> you reply impatiently. <i>“If the reward’s worthwhile, at least.”</i>");
				else if(pc.isMischievous()) output("<i>“Giving this the big build up, aren’t you?”</i> you say, with a quirk of the lip. <i>“C’mon then - let’s hear what I’m getting into.”</i>");
				else output("<i>“Of course I’ll help you,”</i> you reply, straightening your back. <i>“I’m Captain Steele! Just lay it out.”</i>");
				output("\n\n");
			}
			output("<i>“I need two things, Steele.”</i> The quadomme brings two gleaming black palms together, angles them towards you. <i>“Firstly: I need you to voyage down to the Deep Caves, approach as many quadommes as you can, and convince them to meet me. I shall give you the place, date, time. It will be the first summit of our people for a very, very long time.”</i>");
			output("\n\n<i>“It won’t be easy. They will know you’re coming. They will see you as a pawn of mine,");
			if(addiction >= 85) output(" particularly as you are so far along the path now");
			else output(" even though you are not one of us");
			output(", and suppose I seek to steal their harems. You will have to convince them of how vital it is we join together as a race - explain to them what I have to you, about the threat of armageddon and the rights we could secure if only we presented a united front. Convince them - one way or another. We are creatures of appetites. You know this.”</i>");
			output("\n\n<i>“The second thing is... a bit more esoteric.”</i> [ara.His] hand disappears into [ara.his] elegant shift, withdraws a vial of clear fluid, and presses it into your hand. <i>“There is a reason why these meetings of quadommes happen very infrequently, Steele. The truth is - we cannot </i>stand<i> to be in each other’s presence. It sets us on edge, and it takes a huge force of will not to simply attack each other. I cannot see us coming to any kind of agreement if the words MY TERRITORY! MY TERRITORY! MY TERRITORY! are flashing in the forefront of our minds.”</i>");
			output("\n\n<i>“I am led to believe this happens because of chymical release in our brains. If so, I further believe it possible that one of your farlander chymerists could produce a counter-agent, given a sample of our oil. So that we could talk, level-headed, as equals.”</i> [ara.He] hand" + ara.mfn("s", "s", "") + " you a vial of clear fluid, smiling at you softly as [ara.he] do" + ara.mfn("es", "es", "") + ". <i>“I have to believe that, do you understand, Steele? Your kind are as magicians to us, and without that counter-agent, any attempt to unite the bothrioc is doomed to failure. Please find a chymerist that can allow us to know ourselves, so that we may better ourselves.”</i>");
			output("\n\nAra pauses, slightly out of puff, and waves at the air. A submissive appears within seconds at [ara.his] elbow, handing [ara.him] a glass of water.");
			output("\n\n<i>“Do you have questions?”</i> the tall quadomme says, once she’s taken a deep draft.");
			
			processTime(2);
			
			bothriocQuestTalkMenu(response, addiction);
			break;
		case "quadommes":
			output("<i>“Tell me about the quadommes again,”</i> you say.");
			output("\n\n<i>“I need you to voyage down to the Deep Caves,”</i> Ara says. <i>“Approach as many quadommes as you can, and convince them to meet me. I shall give you the place, date, time. It will be the first summit of our people for a very, very long time.”</i>");
			output("\n\n<i>“It won’t be easy. They will know you’re coming. They will view you as a pawn of mine,");
			if(addiction >= 85) output(" particularly as you are so far along the path now");
			else output(" even though you are not one of us");
			output(", and suppose I seek to steal their harems. You will have to convince them of how vital it is we join together as a race - explain to them what I have to you, about the threat of armageddon and the rights we could secure if only we presented a united front. Convince them - one way or another. We are creatures of appetites. You know this.”</i>");
			output("\n\n<i>“How many of them do you need?”</i> you ask.");
			output("\n\n<i>“Four should be enough,”</i> Ara replies. <i>“I know - a small number. But that will form a critical mass. Five quadommes agreeing to meet is unprecedented in modern times, and news will quickly spread. Many others will come of their own accord, including the dominant pidemmes.”</i>");
			
			processTime(1);
			
			bothriocQuestTalkMenu(response, addiction);
			break;
		case "counteragent":
			output("<i>“Tell me about this pheromone problem again,”</i> you say.");
			output("\n\n<i>“There is a reason why these meetings of quadommes happen very infrequently, Steele,”</i> Ara says. <i>“The truth is - we cannot </i>stand<i> to be in each other’s presence. It sets us on edge, and it takes a huge force of will not to simply attack each other. I cannot see us coming to any kind of agreement if the words MY TERRITORY! MY TERRITORY! MY TERRITORY! are flashing in the forefront of our minds.”</i>");
			output("\n\n<i>“I am led to believe this happens because of chymical release in our brains. If so, I further believe it possible that one of your farlander chymerists could produce a counter-agent, given a sample of our oil. So that we could talk, level-headed, as equals.”</i> [ara.He] smile" + ara.mfn("s", "s", "") + " at you softly. <i>“I have to believe that, do you understand, Steele? Your kind are as magicians to us, and without that counter-agent, any attempt to unite the bothrioc is doomed to failure. Please find a chymerist that can create it.”</i>");
			output("\n\n<i>“Have you tried Xenogen?”</i> you ask. Ara’s elegant face twists.");
			output("\n\n<i>“The gold lovers, oh yes. Their demands were... excessive. And demeaning. I will turn to them if I have absolutely no other options, Steele. I am led to believe the farlands are wide and vast, where better solutions are always waiting to be found. I trust in your experience and imagination.”</i>");
			
			processTime(1);
			
			bothriocQuestTalkMenu(response, addiction);
			break;
		case "reward":
			output("<i>“What do I get out of this?”</i> you ask.");
			if(addiction >= 75)
			{
				output("\n\nYou know it’s a silly question before you’re halfway through asking it. Indeed, Ara simply looks at you with a fond, patronizing smile until you’re forced to look down at [ara.his] feet.");
				output("\n\n<i>“You get the shining ecstasy of any egg-bearer who outdoes themself in service to their Masters,”</i> [ara.he] repl" + ara.mfn("y", "y", "ies") + " at length. <i>“You get the knowledge that your actions have saved the love and peace you feel within you, and have spread it to many others besides. You get your name emblazoned in the history of the bothrioc, as one of our greatest heroes. You get to kiss my boot-tips once it is over. Aren’t those things enough?”</i>");
				output("\n\n<i>“Yes,”</i> you whisper, barely able to believe your own selfishness. A soothing hand is once again placed on the nape of your neck.");
				output("\n\n<i>“But I am a generous quadomme, little one. So yes, there will be material reward.”</i>");
			}
			else
			{
				output("\n\nAra doesn’t answer at once, simply considers you in silence for a few moments. It’s not obvious whether you’ve offended or amused [ara.him] with this question.");
				output("\n\n<i>“I do wonder what you are expecting,”</i> [ara.he] say" + ara.mfn("s", "s", "") + " at length. <i>“What could I, a diplomat on this primitive, war-torn world, offer you, the alien heir to a galaxy-spanning company? Anything I could offer would be of symbolic value at best. That is why I asked if you genuinely wanted to help us - because our gratitude is really all there is to be earned.”</i>");
				output("\n\n<i>“However - yes. I did think about this. And I believe I do have something that I can offer you.”</i>");
			}
			output("\n\n[ara.He] snap" + ara.mfn("s", "s", "") + " [ara.his] fingers, and after a few seconds two pidemme subs come running over - one carrying another vial, this one filled with thick, purple liquid, and the other an old, well-thumbed tone, stuffed with reference notes.");
			output("\n\n<i>“A blood sample of every person in this room - except Charles, obviously,”</i> Ara says. <i>“And my genealogy of the bothrioc. Where we came from. Where the graves of our ancestors lie. Together, you will have the genotype of my race, and my permission to use it however you wish. I have resisted all attempts by Xenogen to sell them this information, and if they have attempted to capture bothrioc of their own accord, those attempts have failed. That, Steele, shall be your reward.”</i>");
			
			processTime(1);
			
			bothriocQuestTalkMenu(response, addiction);
			break;
		case "next":
			output("Ara nods, a smile splitting [ara.his] long, white face, when you indicate you’ve heard enough.");
			output("\n\n<i>“I thank you from the bottom of my hearts for doing this,”</i> [ara.he] say" + ara.mfn("s", "s", "") + ". <i>“I am glad that you decided to come into my office that time, Captain Steele. I am glad that I met you.”</i>");
			
			processTime(1);
			
			flags["BOTHRIOC_QUEST"] = BOTHRIOC_QUEST_START;
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

// Part 1: The Suppressant
// Add [Bothrioc?] choice to following NPCs whilst quest is active: McAllister, Haswell, Lash and Lessau. No I’m not using Badger fuck off
public function bothriocQuestDoctorButton(btnSlot:int = 0, doctor:String = ""):void
{
	if(bothriocQuestComplete()) return;
	
	if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_RESEARCH && flags["BOTHRIOC_QUEST_DOCTOR"] == doctor && flags["BOTHRIOC_QUEST_RESEARCH"] != undefined)
	{
		addButton(btnSlot, "Bothrioc?", bothriocQuestResearch, doctor, "Bothrioc?", "Ask if the pheromonal counter-agent is ready.");
		
		output("\n\nYou can check to see if the bothrioc pheromonal counter-agent is ready.");
		
		return;
	}
	
	if(flags["BOTHRIOC_QUEST_DOCTOR"] != undefined) return;
	if(flags[("BOTHRIOC_QUEST_TALK_" + (doctor).toUpperCase())] != undefined) return;
	
	addButton(btnSlot, "Bothrioc?", bothriocQuestDoctor, doctor, "Bothrioc?", "Ask if it’s possible they could create the pheromonal counter-agent Ara Kei asked for.");
	
	output("\n\nYou can try to ask him about the bothrioc pheromonal counter-agent Ara Kei requested.");
}
public function bothriocQuestDoctor(response:String):void
{
	clearOutput();
	
	switch(response)
	{
		case "McAllister":
			mcallisterHeader();
			
			output("<i>“Eh? Oh, no. No no no no,”</i> Byron firmly shakes his head the moment the word ‘bothrioc’ leaves your mouth. <i>“My lab can’t examine the non-Myr species of Myrellion at this time, as intriguing as they are. We have limited resources, and must concentrate on those that are proven to be profitable - and peaceful.”</i> He smiles at you with a well-meaning, patronizing air. <i>“To be honest with you Steele, I think you’re being a bit naive. Every planet in every rush has some fringe race desperate for this, that or the other, and they’ll offer the moon for it to any alien that will listen... literally, in some cases. It’s important to do things carefully, without throwing gene-mods at races before they’re really ready to use them.”</i>");
			output("\n\nHe catches your expression and looks awkward, hands shuffling in his lab coat pockets.");
			output("\n\n<i>“But... you know, other branches of Xenogen might have the time and resources. And are not so carefully watched. Ask around.”</i>");
			
			processTime(1);
			// Option removed
			flags["BOTHRIOC_QUEST_TALK_MCALLISTER"] = 1;
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "Lash":
			showDrLash();
			
			output("<i>“Who are these spider people of yours?”</i> booms Lash, as you make your overtures. <i>“Tell me. Spare not a single detail. THEN I’ll decide if they are worthy of my attention.”</i>");
			output("\n\nOne pair of arms crossed, others rested on his wiry hips, he listens hatchet-faced as you describe the bothrioc, and what Ara needs in order to unite them. Aware of your audience, you lay specific emphasis on the bothrioc’s lack of genitals.");
			output("\n\n<i>“Such a chemical suppressant would be child’s play for me to create!”</i> Lash snorts, once you’re done. <i>“The question is: what greater good would be advanced by uplifting this specific band of arthropodic indigents? Their natural lack of genitalia has potential, certainly. But their obvious predilection for sexual violence and domination? Their lustful egging rituals and mind-warping? Ugh!”</i>");
			output("\n\nHe actually shudders, and dismisses you with a haughty wave.");
			output("\n\n<i>“I will procure samples of these ‘both ree oaks’ in due course, see if their savage instincts cannot be tamed, their natural nullitude turned to better, calmer purpose. But I shall do that on my own time. Trouble me not with their savage, petty desires!”</i>");
			output("\n\nIt always was a long shot asking this dickhead, you suppose.");
			
			processTime(1);
			// Option removed
			flags["BOTHRIOC_QUEST_TALK_LASH"] = 1;
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "Haswell":
			showDrHaswell();
			
			output("<i>“A pheromonal counter-agent, you say? Tell me about these creatures. Try and not leave anything out.”</i>");
			output("\n\nHaswell listens, unmoving and unsmiling, as you describe the bothrioc, and Ara’s need for some sort of chemical suppressant in order to unite them.");
			output("\n\n<i>“And you have a DNA sample?”</i> He holds the vial of clear fluid up to the sterile white light before going on in his atonal, matter-of-fact manner. <i>“Such counter-agents are common. I could produce one for these beings for you. It will cost you a lot of money. You would be taking me and my staff away from our work upon the creatures of Mhen’ga, after all.”</i>");
			output("\n\nHe sets the vial down, exactly perpendicular with the edge of his table.");
			output("\n\n<i>“It would take about three days to analyze and manufacture. I would charge 50,000 credits for the use of my equipment and expertise, for that length of time. However, I realize that you must have already approached the Xenogen personnel on Myrellion, and have been turned down. So a premium for secrecy and breach of contract is in order. 70,000 credits.”</i>");
			
			processTime(1);
			
			clearMenu();
			if(pc.credits < 70000) addDisabledButton(0, "Agree", "Agree", "You don’t have enough money to agree to this!");
			else addButton(0, "Agree", bothriocQuestDoctor, "Haswell agree");
			addButton(1, "Decline", bothriocQuestDoctor, "Haswell decline");
			break;
		case "Haswell decline":
			showDrHaswell();
			
			output("<i>“As you wish.”</i> The eerily-eyed human hands the oil sample back. <i>“I doubt you’ll find anyone else with the relevant expertise who is willing to do it. By the way, if you happen to get a wide-ranging DNA sample of this race, bring it to me. It doesn’t surprise me a reactionary like Byron McAllister has no interest in studying them, but if they are anything like how you describe they are clearly of scientific and commercial interest. I shall pay well for it.”</i>");
			
			processTime(1);
			// PC may ask him again about it
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "Haswell agree":
			showDrHaswell();
			
			output("Ouch. Still, there’s a lot more riding on this than mere money. Reluctantly, you spend a minute preparing your bank for a large scale " + (isAprilFools() ? "dogecoin" : "credit") + " transfer, and then tap your chit against Haswell’s screen.");
			output("\n\n<i>“Good.”</i> Haswell taps at his screen, not looking at you. <i>“I shall begin work immediately. Come back in three days. It should be complete by then.”</i>");
			
			processTime(1);
			flags["BOTHRIOC_QUEST_TALK_HASWELL"] = 1;
			flags["BOTHRIOC_QUEST_DOCTOR"] = "Haswell";
			flags["BOTHRIOC_QUEST"] = BOTHRIOC_QUEST_RESEARCH;
			flags["BOTHRIOC_QUEST_RESEARCH"] = GetGameTimestamp();
			
			pc.credits -= 70000;
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "Lessau":
			showLessau();
			
			output("<i>“A pheromonal counter-agent to help a recently discovered race unite, eh? That sounds very intriguing.”</i> Lessau coils himself up comfortably behind his desk, grinning. <i>“Go ahead, [pc.name] - tell me all about them.”</i>");
			output("\n\nYou explain the mission that Ara Kei gave you, and the specific problem the quadommes have. As you describe the bothrioc though, the smile slips off Lessau’s face, and his expression becomes graver and graver.");
			output("\n\n<i>“[pc.name],”</i> he says at last, fiddling with a pen on his desk, <i>“have you... at all considered that these bothrioc friends of yours are actually extremely dangerous, and perhaps it might not be such a great idea to rush into uplifting them?”</i>");
			if(bothriocAddiction() >= 50)
			{
				output("\n\nYou feel like the friendly chimerical doctor just slapped you in the face. The bothrioc, dangerous? Clearly he’s not been listening to you at all! In a rush, you explain how wonderful, and peaceful, and beautiful Ara and [ara.his] kind are, how fragile and tragic their existence is, and how very important it is that you save them.");
				output("\n\n<i>“Yes,”</i> he says once you’re done, looking if possible even more serious. <i>“I can see exactly how much of an impact they’ve had on you. Body and mind. I worry very much about them having the same impact on innumerable other people.”</i>");
			}
			else
			{
				output("\n\nYou frown. You suppose the bothrioc <i>could</i> be classed as dangerous... but there are worse threats in the world than a bunch of bimbofying spider nulls, surely?");
				if(CodexManager.entryViewed("Dzaan"))
				{
					output("\n\nWith a slight amount of irritation, you point out the existence of the dzaan. With them swaggering around with their addictive cum, how could anyone possibly deny the bothrioc basic rights?");
					output("\n\n<i>“Do two wrongs really make a right?”</i> snaps Lessau. <i>“The dzaan were uplifted in exactly the same well-meaning hurry, by people who never thought that they might become the menace to the rest of the galaxy they so often are. You may very well be asking me to bring into being the self-same thing!”</i>");
				}
			}
			output("\n\nLessau sighs, looking down at the pen he’s turning this way and that in his four hands, and is silent for long enough that you feel that you should say something.");
			output("\n\n<i>“I don’t want to stand idly by whilst an obviously intelligent group of indigenous people are denied sapient rights. I’ll do it. Against my better judgment. No, no,”</i> he says, waving away your credit chits. <i>“You’re more or less my boss, and despite my reservations I’ve no doubt this will prove to be valuable research. It will take some time, though. Come back in five days. I will have a progress report by then.”</i>");
			
			processTime(1);
			flags["BOTHRIOC_QUEST_TALK_LESSAU"] = 1;
			flags["BOTHRIOC_QUEST_DOCTOR"] = "Lessau";
			flags["BOTHRIOC_QUEST"] = BOTHRIOC_QUEST_RESEARCH;
			flags["BOTHRIOC_QUEST_RESEARCH"] = GetGameTimestamp();
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
	author("Nonesuch");
}
public function bothriocQuestResearch(response:String):void
{
	if(flags["BOTHRIOC_QUEST_RESEARCH"] == undefined) return;
	
	clearOutput();
	
	var nDuration:int = (GetGameTimestamp() - flags["BOTHRIOC_QUEST_RESEARCH"]);
	var nDays:int = Math.floor(nDuration / 24 / 60);
	
	switch(response)
	{
		case "Haswell":
			showDrHaswell();
			
			if(nDuration < 4320)
			{
				nDays = (3 - nDays);
				
				output("<i>“Work is in progress,”</i> Haswell replies stiffly, when you ask about the bothrioc suppressant. <i>“It would progress faster if I wasn’t constantly being disturbed. As I said.");
				if(nDays == 1) output(" One more day");
				else output(" " + StringUtil.capitalize(num2Text(nDays)) + " days");
				output(".”</i>");
			}
			else
			{
				output("<i>“It is done.”</i> Haswell hands you large, clear aerosol-like device, filled with a blue fluid. <i>“Tell your diplomat friend to spray that liberally in the area in which they wish to hold their meeting. So long as each bothrioc comes into skin contact with it, they will not react adversely to one another. If they save some of it, presenting it to any U.G.C. standard chemist or synthesizer will allow them to produce more. It should be modifiable into a more long term, injection format, given time.”</i>");
				output("\n\nHe is silent for a moment, watching as you carefully stow the counter-agent away.");
				output("\n\n<i>“It was a fascinating DNA sample,”</i> he continues, still sounding as unfascinated as it’s possible to be. <i>“These creatures’ oil, in particular, could have many scientific and commercial purposes. If you happen to collect a more wide-ranging DNA sample, bring it to me. I will pay well for it.”</i>");
				
				// Add Bothrioc Pheromone Counteragent to Key Inventory
				output("\n\n<b>Quest item gained: Bothrioc Pheromone Counteragent!</b>");
				pc.createKeyItem("Bothrioc Pheromone Counteragent", 0, 0, 0, 0, "");
				flags["BOTHRIOC_QUEST"] = BOTHRIOC_QUEST_DIPLOMACY;
				flags["BOTHRIOC_QUEST_RESEARCH"] = undefined;
			}
			
			processTime(1);
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "Lessau":
			showLessau();
			
			if(nDuration < 7200)
			{
				nDays = (5 - nDays);
				
				output("<i>“The research is coming along,”</i> Lessau says stiffly, when you ask about the bothrioc counter-agent. <i>“Please give me a bit more time, Steele. As I said --");
				if(nDays == 1) output(" one more day");
				else output(" " + num2Text(nDays) + " days");
				output(".”</i>");
			}
			else
			{
				output("<i>“I’ve done as you have asked,”</i> Lessau replies, a sober expression descending on his lionish face when you ask about the bothrioc counter-agent. <i>“Actually, I’ve done more than that.”</i>");
				output("\n\nOut of a refrigerated dispensary, he withdraws two vials with aerosol-type stoppers. One is filled with a blue liquid, the other yellow.");
				output("\n\n<i>“This one,”</i> he says, tapping the blue vial, <i>“will work exactly as you requested. If bothrioc come into skin contact with it, it will suppress the pheromone release which causes the quadomme variant to act aggressively towards one another. Simply tell this Ara Kei of yours to spray it around the area in which they wish to hold this summit of theirs.”</i> He puts it down in front of you.");
				output("\n\n<i>“This one,”</i> he continues, looking you dead in the eye as he shakes the yellow vial, <i>“works exactly the same... with one key difference. After ten minutes, it stops working. The bothrioc quadommes will revert to their natural instincts, and feel uncomfortable and aggressive towards one another.”</i>");
				output("\n\nHe pushes them both towards you.");
				output("\n\n<i>“I am doing this so that my conscience is at rest, and you have a choice,”</i> the chimera says. <i>“If you genuinely think the bothrioc deserve sapient rights, and should be uplifted - give your friend the blue vial. If you have second thoughts, any at all - give them the yellow one. If things seem to go wrong of their own accord, this diplomat hopefully won’t hold you accountable.”</i>");
				output("\n\n<i>“Whichever the case, if you manage to collect a large scale DNA sample off them, please bring it to me.”</i> A smile breaks out at last on the heavy, feline face. <i>“They </i>are<i> very interesting, when all’s said and done.”</i>");
				
				// Add Bothrioc Pheromone Counteragent and Fake Counteragent to Key Inventory
				output("\n\n<b>Quest items gained: Bothrioc Pheromone Counteragent and Fake Counteragent!</b>");
				pc.createKeyItem("Bothrioc Pheromone Counteragent", 0, 0, 0, 0, "");
				pc.createKeyItem("Bothrioc Fake Counteragent", 0, 0, 0, 0, "");
				flags["BOTHRIOC_QUEST"] = BOTHRIOC_QUEST_DIPLOMACY;
				flags["BOTHRIOC_QUEST_RESEARCH"] = undefined;
			}
			
			processTime(1);
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
	author("Nonesuch");
}

// Part 2: [Diplomacy]
// Appears in [Yes] [No] [Fight It] options if PC succeeds strength roll, doesn’t auto-submit, AND quest still active
// Appears in [Struggle] [Submit] options if PC doesn’t succeed strength roll, doesn’t auto-submit, AND quest still active
// 80+ Addiction folks get new texts below when encounter rolled IF quest active
// Ara’s pronouns selected at random for each quadomme
public function bothriocQuestQuadommeButton(btnSlot:int = 0, isStuck:Boolean = false):void
{
	if(bothriocQuestActive()) addButton(btnSlot, "Diplomacy", bothriocQuestQuadomme, ["encounter", isStuck], "Diplomacy", "Try and persuade this quadomme to work with Ara Kei.");
}
private var bothriocQuestQuadommeAraGender:int = 0; // 0: f, 1: m, -1: n
private function araQmfn(m:String = "", f:String = "", n:String = ""):String
{
	if(bothriocQuestQuadommeAraGender == 1) return m;
	if(bothriocQuestQuadommeAraGender == 0) return f;
	return n;
}
public function bothriocQuestQuadomme(arg:Array):void
{
	clearOutput();
	
	var response:String = arg[0];
	var isStuck:Boolean = arg[1];
	
	switch(response)
	{
		case "encounter":
			bothriocQuestQuadommeAraGender = (rand(3) - 1);
			
			// If Not Stuck
			if(!isStuck)
			{
				output("<i>“I have a message,”</i> you say, keeping a careful distance from both the quadomme and its hanging webs. <i>“From Ara Kei Anya.”</i>");
				output("\n\n<i>“Ahhhh,”</i> it says, drawing the sound out in amused, dry whisper. <i>“So you’re dear Ara’s catspaw, are you? " + araQmfn("He", "She", "They") + " of the endless plans and schemes.");
				if(!pc.hasPregnancyOfType("BothriocPregnancy")) output(" Strange - you do not seem shaped by " + araQmfn("his", "her", "their") + " egging. What cunning is being employed here, I wonder?");
				else output(" I should have guessed. A sweet egg-bearer, wandering around these parts all on their own? Certainly, " + araQmfn("he is", "she is", "they are") + " a cruel " + araQmfn("Master", "Mistress", "Owner") + ".");
				output(" Anyway.”</i>");
				output("\n\nStill hanging in mid-air, the quadomme folds one set of arms, cusps their long, elegant face with their other hands.");
				output("\n\n<i>“Go ahead, farlander. Let’s hear it.”</i>");
				
				// Intelligence check: 95% or more = pass, 82-94 = 50% chance pass, 81 or less = fail
				if(pc.IQ() >= 95 || (pc.IQ() >= 82 && rand(2) == 0))
				{
					output("\n\nYou lay out Ara’s plan - to bring as many quadommes together so that they may unite, and lobby the U.G.C. for the rights the race needs to avoid being annihilated by the myr and being casually exploited by Xenogen. Well aware that these apex bothrioc are proud, smug creatures, you keep your tone humble and reserved, whilst laying subtle emphasis on what there is to be gained by being one of the first quadomme to the table - as well as what nuclear holocaust would spell for beings even as deep as this.");
					output("\n\nThe spidery alien retains a poker face throughout, but by the end you can tell by their intent stare and fixed quality of their smirk that you’ve sidled past their preconceptions.");
					output("\n\n<i>“I must say, farlander, your case was put far more eloquently than I was expecting,”</i> it says at last. <i>“A function of your translation machine, perhaps? You can tell Ara I will come to " + araQmfn("his", "her", "their") + " summit. I shall arrive expecting terrible treachery. But I would bitterly regret missing this, whatever the case.”</i>");
					output("\n\nThey disappear back into their hole with a wriggle of four hips. You slowly breathe a sigh of relief.");
					output("\n\n");
					
					IncrementFlag("BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT");
					
					bothriocQuadommeToMainMenu(true);
				}
				else
				{
					output("\n\nYou lay out Ara’s plan - to bring as many quadommes together so that they may unite, and lobby the U.G.C. for the rights the race needs to avoid being annihilated by the myr or being casually exploited by Xenogen. You do your utmost to stress how important this is for the future of their race, but you can tell the quadomme is barely even listening - just nodding along with a smile, waiting for you to finish. You trail off towards the end. You can already see exactly where this is going to go.");
					output("\n\n<i>“My!”</i> it says at last with a big, toothy beam. <i>“What a fascinating, moving yarn! The future of the bothrioc itself at stake, you say? Ara’s certainly raised " + araQmfn("his", "her", "their") + " game recently. I, however, know that one altogether too well.”</i> It shifts downwards slightly, so that its huge, gleaming black abdomen moves further into the light.");
					output("\n\n<i>“But you know what? I’m willing to play along. I’d love to see how " + araQmfn("he thinks he is", "she thinks she is", "they think they are") + " going to get the better of me, and all of our peers. But I do demand payment for my appearance at this summit of " + araQmfn("his", "hers", "theirs") + ". And for your sheer audacity.”</i> The smile drops off of its face, and it looks down at you with naked hunger. <i>“I’m gonna stuff you so full of eggs you aren’t going to be able to remember your own name, catspaw. Then, and only then, will I consider coming.”</i>");
					
					clearMenu();
					if(pc.isFullyPregnant()) addDisabledButton(0, "Yes", "Yes", "You can’t, you’re already stuffed full!");
					else addButton(0, "Yes", bothriocQuestQuadomme, ["unstuck yes", isStuck], "Yes", "The things you do for diplomacy.");
					addButton(1, "No", bothriocQuestQuadomme, ["unstuck no", isStuck], "No", "Think fast, think fast... what if you found a different incubator?");
				}
			}
			else
			{
				output("<i>“I have a message,”</i> you say, trying to keep your voice calm and level as the quadomme hovers above your thoroughly stuck form. <i>“From Ara Kei Anya.”</i>");
				output("\n\n<i>“Do you indeed?”</i> the creature leers, twitching strands above so that sensation tickles through you. <i>“" + araQmfn("Does he", "Does she", "Do they") + " say don’t put eggs up my catspaw’s bum, please thank you very much?”</i> They laugh to themself, before patronizingly folding their arms and leaning over you. <i>“Go ahead, farlander. I very much enjoy listening to how the morsels that fall into my web squeak.”</i>");
				
				// Intelligence check: 100% = pass, 90-99 = ⅔ chance pass, 89 or less = fail
				if(pc.IQ() >= 100 || (pc.IQ() >= 90 && rand(3) != 0))
				{
					output("\n\nYou lay out Ara’s plan - to bring as many quadommes together so that they may unite, and lobby the U.G.C. for the rights the race needs to avoid being annihilated by the myr and being casually exploited by Xenogen. Well aware that these apex bothrioc are proud, smug creatures, you keep your tone humble and reserved, whilst laying subtle emphasis on what there is to be gained by being one of the first quadomme to the table - as well as what nuclear holocaust would spell for beings even as deep as this.");
					output("\n\nThe spidery alien retains a poker face throughout, but by the end you can tell by their intent stare and fixed quality of their smirk that you’ve managed to get past their preconceptions.");
					output("\n\n<i>“I must say, farlander, your case was put far more eloquently than I was expecting,”</i> it says at last. <i>“A function of your translation machine, perhaps? You can tell Ara I will come to " + araQmfn("her", "his", "their") + " summit. I shall arrive expecting terrible treachery. But I would bitterly regret missing this, whatever the case.”</i>");
					output("\n\n<i>“With that out of the way...”</i> A hungry expression descends upon the quadomme’s eerie, androgynous features. <i>“Are you going to make a big fuss before I breed you, or are you going to take it like a good [pc.boyGirl]?”</i>");
					if(bothriocAddiction() < 30) output("\n\nYour heart sinks. You’d almost convinced yourself it was going to let you off the hook.");
					if(bothriocAddiction() >= 60) output("\n\nYou have to bite back saying you’re a good [pc.boyGirl] immediately. Your body yearns to be filled with " + (pc.hasPregnancyOfType("BothriocPregnancy") ? "more" : "") + " eggs.");
					
					IncrementFlag("BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT");
					
					clearMenu();
					addButton(0, "Submit", encounterBothriocQuadommeNext, "yes", "Yes", "Submit to this strange alien dominatrix.");
					addButton(1, "Struggle", encounterBothriocQuadommeNext, "struggle", "Struggle", "");
				}
				else
				{
					output("\n\nYou lay out Ara’s plan - to bring as many quadommes together so that they may unite, and lobby the U.G.C. for the rights the race needs to avoid being annihilated by the myr or being casually exploited by Xenogen. You do your utmost to stress how important this is for the future of their race, but you can tell the quadomme is barely even listening - just nodding along with a smile, waiting for you to finish. You trail off towards the end. You can already see exactly where this is going to go.");
					output("\n\n<i>“My!”</i> it says at last with a big, toothy beam. <i>“What a fascinating and moving yarn! The future of the bothrioc itself at stake, you say? Ara’s certainly raised " + araQmfn("his", "her", "their") + " game recently. I, however, know that one altogether too well.”</i> It shifts downwards slightly, so that its huge, gleaming black abdomen moves further into the light.");
					output("\n\n<i>“But you know what? I’m willing to play along. I’d love to see how " + araQmfn("he thinks he is", "she thinks she is", "they think they are") + " going to get the better of me, and all of our peers. But I do demand payment for my appearance at this summit of " + araQmfn("his", "hers", "theirs") + ". And for your sheer audacity.”</i> The smile drops off of its face, and it looks down at you with naked hunger. <i>“I’m gonna stuff you so full of eggs you aren’t going to be able to remember your own name, catspaw. Then, and only then, will I consider coming.”</i>");
					
					pc.createStatusEffect("Fail Quadomme Diplomacy", 0, 0, 0, 0, true, "", "", false, 0);
					
					clearMenu();
					if(pc.isFullyPregnant()) addDisabledButton(0, "Yes", "Yes", "You can’t, you’re already stuffed full!");
					else addButton(0, "Yes", bothriocQuestQuadomme, ["stuck yes", isStuck], "Yes", "The things you do for diplomacy.");
					addButton(1, "No", bothriocQuestQuadomme, ["stuck no", isStuck], "No", "Think fast, think fast... what if you found a replacement for yourself?");
				}
			}
			processTime(2);
			break;
		case "unstuck no":
			output("<i>“Ok, look,”</i> you say quickly. <i>“You’ve got needs, I respect that. What if I brought you another, uh, morsel, for you to enjoy?”</i>");
			output("\n\nThe quadomme pauses.");
			output("\n\n<i>“One ass is as good as another, if I don’t own it,”</i> it says icilly. <i>“Very well, catspaw. Bring me some other toothsome wanderer of these caves, and I shall consider that tribute.”</i>");
			output("\n\nIt disappears back into its hole without another word. You breathe out slowly. So... now you’ve got to find someone else, and try and lure them into the quadomme’s web. Great.");
			output("\n\n");
			
			processTime(1);
			
			// Go to mini- Beta Nyrea quest
			bothriocQuestBetaNyreaMiniquestStart();
			
			bothriocQuadommeToMainMenu(true);
			break;
		case "unstuck yes":
			if(bothriocAddiction() >= 50)
			{
				output("Ara wouldn’t have sent you, a dedicated egg slut, if it were to be any different. You sigh, eyes closing at the very thought of pleasuring this awesome, beautiful creature, and step forward, opening your arms.");
				output("\n\n<i>“Ara knows " + araQmfn("his", "her", "their") + " audience, at least,”</i> the quadomme murmurs, as it descends.");
			}
			else
			{
				output("Well... this was always likely to happen when you agreed to take this mission on. With a sigh, you agree.");
				output("\n\n<i>“Nice of Ara to send such a fresh, uncut morsel,”</i> the quadomme murmurs, as it descends.");
			}
			
			processTime(1);
			
			clearMenu();
			addButton(0, "Next", bothriocQuadommeMaidTraining);
			break;
		case "stuck no":
			output("<i>“Ok, look,”</i> you say quickly. <i>“You’ve got needs, I respect that. What if I brought you another, uh, morsel, for you to enjoy?”</i>");
			output("\n\n<i>“I’m not an idiot, catspaw,”</i> the quadomme replies sharply. <i>“You have two options: Accept my word and my eggs, or don’t and get stuffed with eggs after I stop you struggling anyway. Which is it going to be?”</i>");
			
			processTime(1);
			
			clearMenu();
			addButton(0, "Submit", encounterBothriocQuadommeNext, "yes", "Yes", "Submit to this strange alien dominatrix.");
			addButton(1, "Struggle", encounterBothriocQuadommeNext, "struggle", "Struggle", "");
			break;
		case "stuck yes":
			if(bothriocAddiction() >= 50)
			{
				output("Ara wouldn’t have sent you, a dedicated egg slut, if it were to be any different. You sigh, eyes closing at the very thought of pleasuring this awesome, beautiful creature, and step forward, opening your arms.");
				output("\n\n<i>“Ara knows " + araQmfn("his", "her", "their") + " audience, at least,”</i> the quadomme murmurs, as it descends.");
			}
			else
			{
				output("Well... this was always likely to happen when you agreed to take this mission on. With a sigh, you agree.");
				output("\n\n<i>“Nice of Ara to send such a fresh, uncut morsel,”</i> the quadomme murmurs, as it descends.");
			}
			
			processTime(1);
			
			clearMenu();
			addButton(0, "Next", bothriocQuadommeMaidTraining);
			break;
	}
}

// If PC auto-submits
public function bothriocQuestQuadommeAutoSubmit():void
{
	output("\n\nHot, blissful understanding blossoms within you as you feel the stuff clinging to you in half a dozen places. Strings, weaves and thatches of gossamer glisten across the floor and walls, emerging from a large hole in the ceiling, only discernible to you now that you’re well and truly coated in it. You’ve blundered into a bothrioc’s trap! You wait tremulously for the wonderful, elegant being to emerge from the space above.");
	
	bothriocQuestQuadommeAutoSubmitBlurb();
	
	clearMenu();
	addButton(0, "Next", bothriocQuestQuadommeAutoSubmitNext);
}
public function bothriocQuestQuadommeAutoSubmitBlurb():void
{
	output("\n\nThe tall, flat-chested androgyne lolls elegantly downwards, propping its jaw up with one pair of hands as it gazes at you with laidback interest. A blush descends on you, prickling your [pc.skin] as you run your eyes over the big, elegant and confident alpha that has you transfixed: Concentrated power. You want to simply stare at it, bathe in its presence, await it to take hold of you in its strong hands and put you in your rightful place... but the words Ara Kei imparted to you ring, strident above the soft lilt of your natural thoughts, and there’s no ignoring them. [ara.He] gave you a duty, and you cannot fail it.");
	output("\n\n<i>“Please egg-giver,”</i> you say, remaining very still and fixing the creature’s elegant, white face with a plaintive gaze. <i>“I must ask of you something.”</i>");
	output("\n\n<i>“To fill you so full of warm, bumpy life that you can’t remember your own name?”</i> the quadomme replies with a smile. <i>“That’s going to happen anyway little one, don’t worry. Only beg if you’re into that kind of thing.”</i>");
	output("\n\n<i>“No...”</i> You pause a moment to firmly push down on the wave of heat that rose to your [pc.skin] just now. <i>“...It’s something else. Something important.”</i>");
	output("\n\n<i>“Something </i>more<i> important to you than being my incubator?”</i> Both of the quadomme’s armored eyebrows rise. <i>“My! You’ve certainly got my attention. Go ahead, little one. I’m listening.”</i>");
}
public function bothriocQuestQuadommeAutoSubmitNext():void
{
	clearOutput();
	
	bothriocQuestQuadommeAraGender = (rand(3) - 1);
	
	// Intelligence check: 100% = pass, 80-99 = ⅔ chance pass, 79 or less = fail
	// Pass
	if(pc.IQ() >= 100 || (pc.IQ() >= 80 && rand(2) != 0))
	{
		output("You lay out Ara’s plan - to bring as many quadommes together so that they may unite, and lobby the U.G.C. for the rights the race needs to avoid being annihilated by the myr and being casually exploited by Xenogen. Your love and sincerity for the cause pushes you from a mere extension of an invitation to a rousing oration, a call to action to all spidery harem-keepers that would rouse the most cynical of hearts. There are tears coursing down your face by the time you’re done.");
		output("\n\nThe spidery alien retains a poker face throughout, but by the end you can tell by their intent stare and fixed quality of their smirk that you’ve managed to get past their preconceptions.");
		output("\n\n<i>“My word. Ara certainly knew what " + araQmfn("he was", "she was", "they were") + " doing when " + araQmfn("he", "she", "they") + " sent you, didn’t " + araQmfn("he", "she", "they") + "?”</i> it says at last. <i>“Very well. You can tell Ara I will come to " + araQmfn("his", "her", "their") + " summit. I shall arrive expecting terrible treachery. But I would bitterly regret missing this, whatever the case.”</i>");
		output("\n\n<i>“Now we’ve decided what we’re doing tomorrow...”</i> A hungry expression descends upon the quadomme’s eerie, androgynous features. <i>“Let’s get on with what we’re doing today. You, embedded on my ovipositor, more specifically.”</i>");
		
		IncrementFlag("BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT");
		
		if(pc.isFullyPregnant())
		{
			output("\n\n<i>“I’m sorry, egg-giver,”</i> you say sincerely. You jerk one of your stuck hands in the direction of your [pc.belly]. <i>“I’m... um...”</i>");
			output("\n\nThe quadomme’s snort of exasperation can probably be heard for miles.");
			output("\n\n<i>“Ara sent an eloquent, </i>full<i> egg-bearer?! The nerve! The cunning!”</i> It cries. It snaps your bonds irritably. <i>“Go on, get out of here, you monstrous... siren! I’ll be along to this summit of Ara’s just to give [ara.him] a piece of my mind!”</i>");
			output("\n\nIt disappears back into its hole without another word. You smile dizzily. That was kind of fun.");
			output("\n\n");
			
			bothriocQuadommeToMainMenu(true);
		}
		else
		{
			output("\n\nYou smile back happily, allowing that heat you’ve been denying for so long to finally overwhelm you. You wouldn’t have it any other way.");
			output("\n\n");
			
			// {standard loss scene from here}
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCLoss);
		}
	}
	// Fail
	else
	{
		output("You lay out Ara’s plan - to bring as many quadommes together so that they may unite, and lobby the U.G.C. for the rights the race needs to avoid being annihilated by the myr or being casually exploited by Xenogen. You do your utmost to stress how important this is for the future of their race, but you can tell the quadomme is barely even listening - just nodding along with a smile, waiting for you to finish. You trail off towards the end, feeling miserable. You didn’t give it justice.");
		output("\n\n<i>“My!”</i> the quadomme says with a big, toothy beam. <i>“What a fascinating and moving yarn! The future of the bothrioc itself at stake, you say? Ara’s certainly raised " + araQmfn("his", "her", "their") + " game recently. I, however, know that one altogether too well.”</i> It shifts downwards slightly, so that its huge, gleaming black abdomen moves further into the light.");
		output("\n\n<i>“But you know what? I’m willing to play along. I’d love to see how " + araQmfn("he thinks he is", "she thinks she is", "they think they are") + " going to get the better of me, and all of our peers. But I do demand payment for my appearance at this summit of " + araQmfn("his", "hers", "theirs") + ". And for your sheer audacity.”</i> The smile drops off of its face, and it looks down at you with naked hunger. <i>“I’m gonna stuff you so full of eggs you aren’t going to be able to remember your own name, catspaw. Then, and only then, will I consider coming.”</i>");
		if(pc.isFullyPregnant())
		{
			output("\n\n<i>“I’m sorry, egg-giver,”</i> you say sincerely. You jerk one of your stuck hands in the direction of your [pc.belly]. <i>“I’m... um...”</i>");
			output("\n\nThe quadomme’s snort of exasperation can probably be heard for miles.");
			output("\n\n<i>“Ara sends a clumsy, </i>full<i> egg-bearer?!”</i> it cries. <i>“Who " + araQmfn("does he", "does she", "do they") + " think they are? No, it’s not good enough. I demand payment of some kind.”</i> It looms above you, jaw set. <i>“You shall be my servant for the day. Follow my demands, and obey my desires, for that time. Only then will I deign to come to this blasted conference.”</i>");
			output("\n\nIt doesn’t frame it as a request, because it isn’t one. You nod soulfully. It was your fault for being so stuffed with life, after all.");
			output("\n\nIt takes a firm grip of you with its four gleaming black stilettos, and climbs with its prize back up into its tunnel...");
			output("\n\n");
			
			// follows on from standard maid training from here
			clearMenu();
			addButton(0, "Next", bothriocQuadommeMaidTraining);
		}
		else
		{
			output("\n\nThat’s fine. That’s more than fair. That’s absolutely wonderful. You smile back happily, allowing that heat you’ve been denying to finally overwhelm you. You love doing your bit for the cause.");
			output("\n\n");
			
			IncrementFlag("BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT");
			
			// {standard loss scene from here}
			clearMenu();
			addButton(0, "Next", bothriocQuadommePCLoss);
		}
	}
	
	processTime(2);
}

// If PC defeats a Quadomme having unsuccessfully tried Diplomacy with them
public function bothriocQuestQuadommePCVictory():void
{
	output("\n\n<i>“Alright,”</i> you say. <i>“You willing to listen to reason now?”</i>");
	output("\n\nThe quadomme raises its head to glower at you.");
	output("\n\n<i>“Yes, now that " + araQmfn("his", "her", "their") + " thug has brutalized me, I definitely want to come and make nice with Ara Kei fucking Enya,”</i> it spits. <i>“Do what you want with me, and then fuck off, catspaw. I’m tired of playing games with you.”</i>");
	output("\n\nOh well. Hopefully there are other quadommes around.");
	
	// Standard win options here
	bothriocQuadommeSexMenu();
}

// Mini Quest: Poor Little Beta Nyrea
// If PC leaves Deep Caves, they fail this quest and Quadomme gets reset
// If PC sets out to find a ‘replacement’ for the Quadomme, within 3-5 tiles of that encounter they will be ambushed by a Beta Nyrea. The encounter goes exactly as it normally does, with following changes
public function bothriocQuestBetaNyreaMiniquestStart():void
{
	flags["BOTHRIOC_QUEST_NYREA_CATCH_COORD"] = currentLocation;
	flags["BOTHRIOC_QUEST_NYREA_CATCH_STEPS"] = (3 + rand(3));
	flags["DEEP_CAVES_STEP"] = 0;
	
	rooms[flags["BOTHRIOC_QUEST_NYREA_CATCH_COORD"]].addFlag(GLOBAL.OBJECTIVE);
}
public function bothriocQuestBetaNyreaMiniquestReset():void
{
	flags["BOTHRIOC_QUEST_NYREA_CATCH_STEPS"] = (3 + rand(3));
	flags["DEEP_CAVES_STEP"] = 0;
}
public function bothriocQuestBetaNyreaMiniquestClear(bAlert:Boolean = false):void
{
	rooms[flags["BOTHRIOC_QUEST_NYREA_CATCH_COORD"]].removeFlag(GLOBAL.OBJECTIVE);
	
	flags["BOTHRIOC_QUEST_NYREA_CATCH_COORD"] = undefined;
	flags["BOTHRIOC_QUEST_NYREA_CATCH_STEPS"] = undefined;
	
	if(bAlert) AddLogEvent("Venturing outside of the deep caverns have made you lose sight of the quadomme you were trying obtain a tribute for...", "bad");
}
public function bothriocQuestBetaNyreaMiniquestActive():Boolean
{
	return (flags["BOTHRIOC_QUEST_NYREA_CATCH_COORD"] != undefined);
}
public function bothriocQuestBetaNyreaFound():Boolean
{
	return (flags["DEEP_CAVES_STEP"] >= flags["BOTHRIOC_QUEST_NYREA_CATCH_STEPS"]);
}
// Intro
public function bothriocQuestEncounterNyreaBeta():void
{
	var nyreaEggs:Boolean = (rand(10) < 4);
	
	nyreaHeader(NYREA_BETA);
	
	output("\n\n<i>“Yaaaahhhhh!”</i>");
	// PC PASSES a Reflex check:
	var missedNet:Boolean = ((pc.RQ() / 2 + rand(pc.RQ() / 2)) > 50);
	if(missedNet) output("\n\nYou tumble out of the way just in time as a net soars by you, its weights clattering against the stone as it flies back in the darkness.");
	else output("\n\nYou give out a startled yelp as a heavy net slams into you, throwing you to the ground under its entangling weight.");
	output(" From the darkness, a feminine figures steps out,");
	if(missedNet) output(" tsking her tongue as she follows her wide-flying net with her eyes, clearly disappointed");
	else output(" aking advantage of your vulnerable state to loom over you threateningly, spear leveled at you.");
	if(nyreaEggs) output(" <i>“I’m not too picky where I put my eggs,”</i> she growls, circling you, <i>“Even an offworlder will do in a pinch. So why don’t you just make this easy on yourself and submit. You might even like it.”</i>");
	else output(" <i>“You look like a healthy breeder,”</i> she growls, circling you, <i>“so why don’t you just make this easy on yourself and submit. You might even like it.”</i>");
	output("\n\nIt’s a Beta Nyrea Huntress, face lit up with the joy of tackling some prey. Only this time, perhaps, it’s you that’s the predator here. She would make a perfect ‘replacement’ for the Quadomme Bothrioc! If only you could lead her to it...");
	
	if (!CodexManager.entryUnlocked("Nyrea"))
	{
		CodexManager.unlockEntry("Nyrea");
		output("\n\nYou stare at the insectile woman as your codex beeps, <i>“Warning: Nyrea encountered. This species’ females are known to be extremely hostile, and may attempt to use unsuspecting travelers as breeding stock or as incubation space for her eggs. Caution is recommended, especially around the species’ pseudo-penis.”</i>");
	}
	
	processTime(7);
	IncrementFlag("MET_NYREA_BETA");
	
	clearMenu();
	addButton(0, "Fight!", nyreaFight, [NYREA_BETA, nyreaEggs]);
}
// Add [Retreat] to combat options. Cannot be used if PC is netted
// Retreat
// Has same practical effect as [Wait]
public function bothriocQuestBetaNyreaRetreat():void
{
	clearOutput();
	
	pc.createStatusEffect("Bait Beta Nyrea");
	
	if(pc.statusEffectv1("Bait Beta Nyrea") < flags["BOTHRIOC_QUEST_NYREA_CATCH_STEPS"])
	{
		output("Feigning fear - and tantalizing slowness - you keep your guard up and [pc.move] backwards. Towards where you know a certain corridor of near-invisible sticky gossamer lies.");
		output("\n\n<i>“Where do you think you’re going?”</i> The Huntress follows, twirling her spear and net expertly. <i>“You aren’t getting away from me that easily!”</i>");
		
		// PC needs to use it x times where x is however many squares away the BQ is without either fainting or making the BH faint
		pc.addStatusValue("Bait Beta Nyrea", 1, 1);
		
		CombatManager.processCombat();
	}
	// Retreat Final
	else
	{
		userInterface.hideNPCStats();
		userInterface.leftBarDefaults();
		
		currentLocation = flags["BOTHRIOC_QUEST_NYREA_CATCH_COORD"];
		generateMap();
		
		nyreaHeaderFromCreature(enemy, "VICTORY:");
		
		output("You move backwards - and finally feel the telltale brush of glutinous gossamer on your back. Heart thumping, you feign tripping over and collapse backwards onto the ground, angling yourself sharply downwards to avoid coming into proper contact with it.");
		output("\n\n<i>“At last!”</i> The nyrea huntress surges triumphantly forward, knocking your [pc.weapon] away. <i>“What an elusive prey you were! You’ve got me soooo riled up, I’m gonna...”</i> She seems to pause, poised over you, jerking her arms back and forth. The dim light catches a silvery gleam above her. <i>“... what is... ? Oh. Oh no.”</i>");
		output("\n\nFuriously the nyrea begins to try wrenching her arms away, digging her heels into the ground, but her thrashing only brings her into more contact with the incredibly strong and sticky fiber. All of her limbs caught on it, she wails and air-pedals as a massive, monstrous shape bursts into view overhead.");
		output("\n\n<i>“Well now,”</i> hums the quadomme, dangling down to grasp at its web, pulling the struggling female upwards to examine her. <i>“What do we have here? Ah! One of the proud worker-hunters. Yes, this will do very nicely.”</i>");
		output("\n\n<i>“Get your hands off of me, foul male-snatcher!”</i> snarls the nyrea. <i>“How dare you interrupt my hunt! I shall burn your wretched nest to th- mmph!”</i> She continues to writhe furiously after the quadomme calmly weaves a glistening gag over her mouth.");
		output("\n\n<i>“You risked your skin to do as you said you would, catspaw,”</i> the quadomme says, favoring you with a wide smile. <i>“I’m impressed! Tell Ara I will come to this summit of " + araQmfn("his", "hers", "theirs") + ". Now, if you’ll excuse me...”</i> Having bound the nyrea huntress ankle and wrist, it manipulates its thread to slowly bend her legs upwards, her boobs dangling downwards. She whimpers as the quadomme’s abdomen descends, its purple entrance dilated and drooling oil. <i>“...I’m going to impart a dozen or so reminders to this one as to who the apex egg-giver in these parts is.”</i>");
		output("\n\nBug eat bug world, Myrellion. The slimy sounds, woozy moans and whispery sighs of a heavy oviposition session echo along to you well after you’ve left the pair behind you.");
		output("\n\n");
		
		IncrementFlag("BOTHRIOC_QUEST_BETA_NYREA_BAITED");
		IncrementFlag("BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT");
		bothriocQuestBetaNyreaMiniquestClear();
		
		processTime(15);
		CombatManager.genericVictory();
	}
}
// Makes the BN faint
public function bothriocQuestBetaNyreaPCVictoryBlurb():void
{
	if (enemy.lust() >= enemy.lustMax()) output("The nyrea stumbles back, breathing hard as you relentlessly tease her, forcing her further and further back until she’s pressed against a cave wall, helpless.");
	else output("Battered down, the nyrea starts trying to withdraw, warding you back with increasingly desperate thrusts of her spear.");
	output("\n\nYou sigh impatiently. Looks like you defended yourself too rigorously - you’re not going to be able to tempt the nyrea onwards in this state. <b>You’ll have to try and find another.</b>");
	
	// Tile counter resets
	bothriocQuestBetaNyreaMiniquestReset();
}
public function bothriocQuestBetaNyreaMiniquestRun():void
{
	output("You turn tail and successfully run from the nyrea... Well, looks like you missed out on the tribute. <b>You’ll have to try and find another.</b>");
	
	bothriocQuestBetaNyreaMiniquestReset();
}

// Fei An Strozo
// Once the PC successfully persuades 3 standard quadommes, this is the one they will meet next. They can appear on any random square in the Deep Caves, but once she’s met she’s set in that square - put a Venus Pitcher-type marker down. Once she’s met set Quadomme encounter rate to zero until she is persuaded, i.e. the PC has to persuade her in order to finish the quest.
public function showFeiAnStrozo(nude:Boolean = false):void
{
	if(!nude) showBust(feiAnStrozoBustDisplay(nude));
	if(flags["MET_FEIAN"] == undefined) showName("BOTHRIOC\nQUADOMME");
	else showName("FEI AN\nSTROZO");
	author("Nonesuch");
}
public function feiAnStrozoBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "FEIAN";
	
	if(flags["FEIAN_SEX"] != undefined && nude)
	{
		switch(flags["FEIAN_SEX"])
		{
			case FEIAN_SEX_HERM:
			case FEIAN_SEX_MALE:
				sBust += "_MALE"; 
				break;
			case FEIAN_SEX_FEMALE: 
				sBust += "_FEMALE"; 
				break;
		}
	}
	
	if(nude) sBust += "_NUDE";
	return sBust;
}
public var FEIAN_SEX_FEMALE:int = 0;
public var FEIAN_SEX_MALE:int = 1;
public var FEIAN_SEX_HERM:int = 2;
public function feiAnHasCock():Boolean
{
	return (flags["FEIAN_SEX"] == FEIAN_SEX_MALE || flags["FEIAN_SEX"] == FEIAN_SEX_HERM);
}
public function feiAnHasVagina():Boolean
{
	return (flags["FEIAN_SEX"] == FEIAN_SEX_FEMALE || flags["FEIAN_SEX"] == FEIAN_SEX_HERM);
}
public function feiAnAppear():void
{
	if(flags["FEIAN_LOCATION"] == undefined) return;
	
	rooms[flags["FEIAN_LOCATION"]].addFlag(GLOBAL.SPIDER_WEB);
	rooms[flags["FEIAN_LOCATION"]].removeFlag(GLOBAL.HAZARD);
}
public function feiAnRemove():void
{
	if(flags["FEIAN_LOCATION"] == undefined) return;
	
	rooms[flags["FEIAN_LOCATION"]].removeFlag(GLOBAL.SPIDER_WEB);
	rooms[flags["FEIAN_LOCATION"]].addFlag(GLOBAL.HAZARD);
}

// Intro
// Adjoin to standard square blurb
public function bothriocQuestFeiAnStrozoIntro():void
{
	showBothriocQuadomme();
	showName("ENCOUNTER:\nQUADOMME");
	
	if(!CodexManager.hasUnlockedEntry("Bothrioc")) CodexManager.unlockEntry("Bothrioc");
	
	CombatAttacks.applyWeb(pc);
	
	bothriocQuestQuadommeAraGender = (rand(3) - 1);
	
	showBust(feiAnStrozoBustDisplay());
	
	var addiction:Number = bothriocAddiction();
	
	output("\n\nThere is a wide gap in the cave floor a little way over, a crevice in the rock which leads even further down into the uncompromising blackness. You wouldn’t ordinarily give it a second glance - but you have spent enough time roaming the depths of Myrellion, keeping your eyes peeled, for certain telltale signs to stand out to you immediately. The ephemeral glitter of gossamer strands latticed over the rock surrounding the crevice. The faint glow of ghostly light emanating from deep within the tunnel.");
	output("\n\nYou hear a familiar scrabbling of many chitinous legs on stone, distant at first but quickly coming closer.");
	if(addiction < 85) output(" It’s a sound you know all too well by now, and it’s pure instinct that causes you to rear back from the hole and ready yourself.");
	else output(" It’s a wonderful, familiar sound, the opening bars to your favorite song in the universe, and you can’t help but smile blissfully.");
	output("\n\nLike a particularly startling jack-in-the-box, out of the wide gash in the earth a bothrioc quadomme emerges. It looks quite different from the ones you’ve seen already, and not just because this one is sedately considering you the right way up, rather than dangling from the ceiling. Her skin and hair is brown and her carapace a deep russet, and she’s more thickset, her hips round and wide, her plump abdomen heavier and closer to the ground. And, yes, it’s difficult to look at this one and think of anything but the feminine: her full hair cascades from a bundle down her shoulder, her proud-set lips are full and red, and even without breasts, and a featureless mound between her legs, she seems to breathe voluptuousness.");
	output("\n\n<i>“Hello, morsel,”</i> she grins at you. She’s got very sharp teeth. <i>“You are standing in the presence of Fei An Strozo. I’ve heard about you.”</i>");
	
	flags["MET_FEIAN"] = 1;
	flags["FEIAN_LOCATION"] = currentLocation;
	flags["FEIAN_AT_LOCATION"] = 1;
	
	feiAnAppear();
	
	processTime(7 + rand(3));
	IncrementFlag("BOTHRIOC_QUADOMME_ENCOUNTERED");
	
	clearMenu();
	addButton(0, "You Have?", bothriocQuestFeiAnStrozoResponse, ["you have?", addiction]);
}
public function bothriocQuestFeiAnStrozoResponse(arg:Array):void
{
	clearOutput();
	showFeiAnStrozo();
	
	var response:String = arg[0];
	var addiction:Number = arg[1];
	
	switch(response)
	{
		case "you have?":
			output("<i>“Yes,”</i> Fei says. Your translation equipment conveys her voice with a faint, indefinable accent, setting her apart vocally as well as visually from the other bothrioc you’ve parlayed with. <i>“I make it my business to keep track of everything that occurs in these caves. That is how I survived, and thrived, when I came to this country years ago: staying ahead of my competitors. Now I am the most successful dominatrix around! None can deny it. My harem numbers 39. Every species on the planet represented. All of them delicious. All of them trained into absolute obedience.”</i> The quadomme pauses, hands sliding down her front thighs, gazing at you silently for a while. <i>“You have something you wish to ask, " + pc.mf("handsome", "pretty") + " morsel. Say it.”</i>");
			output("\n\nShe leans down in the quadomme’s trademark resting squat, hands cradling her face, listening as you lay out Ara’s plan - to bring as many quadommes together so that they may unite, and lobby the U.G.C. for the rights the race needs to avoid being annihilated by the myr and being casually exploited by Xenogen.");
			output("\n\n<i>“So the great Ara Kei wishes for the cursed interloper Fei An Strozo to come along to " + araQmfn("his", "her" , "their") + " much vaunted tea party, " + araQmfn("does he", "does she" , "do they") + "?”</i> Fei laughs, a more fruity but no less mocking sound than the other quadommes you’ve met so often tail off into. <i>“Of course " + araQmfn("he does", "she does" , "they do") + ". The whole project rests upon it, morsel. If I do not deign to show, what a pale mockery this so-called summit of " + araQmfn("his", "hers" , "theirs") + " shall be! And yet... I also hear truth and urgency in your tone. It moves me. I shall come - if the price is paid.”</i>");
			output("\n\n<i>“And what’s that?”</i> you ask.");
			output("\n\n<i>“You.”</i> Fei smiles, showing all of her teeth. <i>“You, Ara’s chosen, will join my harem, and demonstrate your love for the bothrioc with eternal, blissful servitude to me. Yes... the most fitting of tributes.”</i>");
			output("\n\nWill you give up all of your future plans and become a lasting part of Fei’s harem?");
			output("\n\n");
			
			processTime(2);
			
			// If Add <100 show [Yes] [No]
			clearMenu();
			if(addiction < 100)
			{
				addButton(0, "Yes", bothriocQuestFeiAnStrozoResponse, ["yes", addiction], "Yes", "Yes... eternal submission.");
				addButton(1, "No", bothriocQuestFeiAnStrozoResponse, ["no", addiction], "No", "Ok, alright, walk this back. Surely you can talk her into accepting something else.");
			}
			// If Add 100 show [Yes] [Yes]
			else
			{
				addButton(0, "Yes", bothriocQuestFeiAnStrozoResponse, ["yes", addiction], "Yes", "Yes... eternal submission.");
				addButton(1, "Yes", bothriocQuestFeiAnStrozoResponse, ["yes", addiction], "Yes", "<i>Why would you respond otherwise?</i>");
			}
			break;
		case "yes":
			if(addiction < 50) output("You’ve involved yourself in the bothrioc’s affairs for long enough, observed how these eerily beautiful beings treat their supplicants with loving dominance, that when this quadomme makes her blunt demand you treat it with consternation only for a moment. When you fully turn your thoughts and feelings to it, a tension drops away from you, replaced by a wonderful serenity. Yes... it makes a lovely, wonderful sense. You’ll help elevate them to the stars, and join them at the same time.");
			else output("The quadomme’s forceful demand cuts through any resistance you might still have left to the bothrioc’s influence over you. Yes... to own nothing but your dom’s love for you. How wonderful that will be. And suddenly it all makes sense - why Ara chose you for this quest. " + araQmfn("He", "She" , "They") + " wanted you to find a proper owner, one as powerful and beautiful as this one. A tension drops away from you as you accept it; it feels like you’re shedding your [pc.skinFurScales], becoming the person you were always meant to be.");
			output("\n\n<i>“Ok,”</i> you sigh. <i>“I’ll do it. If you’ll come.”</i>");
			output("\n\nFei An Strozo’s triumphant smile widens. She strides forward and places her gleaming, russet palm on your head, slowly applying firm pressure until you get the picture and kneel before her.");
			output("\n\n<i>“It wasn’t a request, little one,”</i> she says, towering over you. <i>“You have much to learn. I will relish molding a clever, resourceful and alluring being such as you into a thing of total, peaceful submission, a receptacle for my desires. But, for now... you run along. Tell Ara I will be present at this summit of " + araQmfn("his", "hers" , "theirs") + ". I look forward to seeing how " + araQmfn("he intends", "she intends" , "they intend") + " to convince a cave full of quadommes to work for " + araQmfn("him", "her" , "them") + ". Whatever the case - remember who you belong to now.”</i>");
			output("\n\nA great shudder passes through you, cold and hot running together, as she withdraws her hand and descends with a stately, deadly grace back into her trapdoor. You’re certainly in for the long haul now. <b>You should report to Ara that you’ve invited enough quadommes now.</b>");
			output("\n\n");
			
			processTime(2);
			
			flags["JOIN_FEIAN_HAREM"] = 1;
			flags["BOTHRIOC_QUEST"] = BOTHRIOC_QUEST_QUADOMME;
			IncrementFlag("BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT");
			
			bothriocQuadommeToMainMenu(true);
			break;
		case "no":
			output("<i>“You know I can’t agree to that,”</i> you say carefully.");
			if(addiction >= 50) output(" It freezes your [pc.skin] to refuse this powerful, forceful creature, and the words taste bitter in your mouth, but you manage it. You aren’t willing to completely surrender yourself, not just yet.");
			output(" <i>“Surely there is some other tribute I could pay? I could... fetch a nyrea for you...”</i>");
			output("\n\n<i>“You wish to buy me with some scabby-kneed beta worker crawling around nearby?”</i> Fei sneers elegantly, hungry eyes never leaving you. <i>“I accept only the most unique and delectable morsels into my harem. If you lack the integrity and courage to accept my terms, then clearly you do not deserve my ownership of you in the first place! So yes, we shall have to consider an alternative tribute. More’s the pity.”</i>");
			output("\n\nShe is silent for a time, still in her resting squat, finger tapping her cheek.");
			output("\n\n<i>“I am told,”</i> she says at last, <i>“that farlanders have magic that allows for fantastical transformations. Perhaps you yourself did not always look the way you do now, yes? I have heard even, that you can grow wondrous, intoxicating sexual organs that you never could have garnered otherwise.”</i> One set of arms sweep down, indicating the blank, brown mound between her front legs. <i>“We bothrioc are blessed, and cursed, with owning nothing but our ovipositors. Bring me magic that will cause me to grow something between my legs. Something that spells <b>dominance</b> to you. So I may truly set myself apart from all other bothrioc!”</i>");
			output("\n\nFei swings herself around, her vast, russet abdomen looming into view.");
			output("\n\n<i>“That is your task, refusenik. I shall not come unless you can provide me with such a gift.”</i>");
			output("\n\nYou watch the singular quadomme descend back into her burrow. So... a TF that will cause her to grow some genitals. A bit aggravating, but hopefully not such a tall order.");
			
			processTime(2);
			
			bothriocQuadommeToMainMenu(true);
			break;
	}
}

public function feiAnStrozoHaremBonus():Boolean
{
	// PC returns to Fei’s square before Quadomme Meet, agreed to join harem
	if(flags["JOIN_FEIAN_HAREM"] != undefined || flags["FEIAN_AT_LOCATION"] == undefined)
	{
		output("\n\nThere is a great gash in the earth here. It’s Fei An Strozo’s burrow");
		if(flags["JOIN_FEIAN_HAREM"] != undefined) output(" - your owner-to-be. You shiver slightly at the thought");
		output(". It seems to be all quiet right now, though.");
		
		addDisabledButton(0, "Fei An", "Fei An Strozo", "She seems to be away at the moment...");
	}
	// PC returns to Fei’s square before Quadomme Meet, agreed to find TF
	else
	{
		output("\n\nThere is a great gash in the earth here, Fei An Strozo’s burrow. It seems your steps alerted her, because the seven foot being rises out of the ground with sedate, eerie grace as you approach.");
		
		addButton(0, "Fei An", approachFeiAnStrozo, undefined, "Fei An Strozo", "Meet the lavish quadomme.");
	}
	
	return false;
}
public function approachFeiAnStrozo():void
{
	clearOutput();
	showFeiAnStrozo();
	
	if(flags["FEIAN_SEX"] == undefined) output("<i>“Have you done as I have asked, farlander?”</i> she asks, with an arch flick of her red hair. <i>“Time’s a-wasting, you know.”</i>");
	else output("<i>“Ah, back again, farlander?”</i> she asks, with an arch flick of her red hair. <i>“I hope you have something special for me...”</i>");
	
	approachFeiAnStrozoMenu();
}

public function approachFeiAnStrozoMenu():void
{
	clearMenu();
	if(flags["FEIAN_SEX"] == FEIAN_SEX_HERM) addDisabledButton(0, "Give", "Give", "She already has both sets of genitals -- no point in giving her more!");
	else if(hasItemsForFeiAnStrozo()) addButton(0, "Give", giveFeiAnStrozoItemMenu, undefined, "Give", "Give her an item to grow genitals.");
	else addDisabledButton(0, "Give", "Give", "You do not have any valid genital-growing items to give her!");
	addButton(14, "Leave", mainGameMenu, undefined);
}
// Usable Items
public function hasItemsForFeiAnStrozo():Boolean
{
	if(pc.hasItemByClass(ManUp)) return true;
	if(pc.hasItemByClass(Throbb)) return true;
	if(pc.hasItemByClass(Pussybloom)) return true;
	if(pc.hasItemByClass(Pussyblossom)) return true;
	
	return false;
}
public function giveFeiAnStrozoItemMenu():void
{
	var btnSlot:int = 0;
	
	clearMenu();
	
	if(pc.hasItemByClass(ManUp))
	{
		if(flags["FEIAN_SEX"] == FEIAN_SEX_MALE) addDisabledButton(btnSlot++, "ManUp", "ManUp", "She already has a penis!");
		else addButton(btnSlot++, "ManUp", giveFeiAnStrozoItem, new ManUp(), "ManUp", "Give her this item to grow a penis.");
	}
	if(pc.hasItemByClass(Throbb))
	{
		if(flags["FEIAN_SEX"] == FEIAN_SEX_MALE) addDisabledButton(btnSlot++, "Throbb", "Throbb", "She already has a penis!");
		else addButton(btnSlot++, "Throbb", giveFeiAnStrozoItem, new Throbb(), "Throbb", "Give her this item to grow a penis.");
	}
	if(pc.hasItemByClass(Pussybloom))
	{
		if(flags["FEIAN_SEX"] == FEIAN_SEX_FEMALE) addDisabledButton(btnSlot++, "Pussybloom", "Pussybloom", "She already has a vagina!");
		else addButton(btnSlot++, "Pussybloom", giveFeiAnStrozoItem, new Pussybloom(), "Pussybloom", "Give her this item to grow a vagina.");
	}
	if(pc.hasItemByClass(Pussyblossom))
	{
		if(flags["FEIAN_SEX"] == FEIAN_SEX_FEMALE) addDisabledButton(btnSlot++, "Pussyblossom", "Pussyblossom", "She already has a vagina!");
		else addButton(btnSlot++, "Pussyblossom", giveFeiAnStrozoItem, new Pussyblossom(), "Pussyblossom", "Give her this item to grow a vagina.");
	}
	
	addButton(14, "Back", approachFeiAnStrozoMenu);
}
public function giveFeiAnStrozoItem(item:ItemSlotClass):void
{
	clearOutput();
	showFeiAnStrozo();
	
	var hasGenitals:Boolean = (flags["FEIAN_SEX"] != undefined);
	var growPenis:Boolean = false;
	var growVagina:Boolean = false;
	
	if(item is ManUp) { pc.destroyItemByClass(ManUp); growPenis = true; }
	if(item is Throbb) { pc.destroyItemByClass(Throbb); growPenis = true; }
	if(item is Pussybloom) { pc.destroyItemByClass(Pussybloom); growVagina = true; }
	if(item is Pussyblossom) { pc.destroyItemByClass(Pussyblossom); growVagina = true; }
	
	// Dick variants
	if(growPenis)
	{
		output("With a flourish, you hand over the medipen. Fei consider it for a moment, turning it around in her four hands and looking uncharacteristically hesitant.");
		output("\n\n<i>“So I hold the pointed end to my skin... and then it shall grant me genitals?”</i> she asks. You answer in the affirmative as confidently as you can. You sure <i>hope</i> it does. You doubt anybody’s actually tested the drug on a bothrioc.");
		output("\n\nYou watch as, with a hypodermic hiss, the quadomme applies the " + ((item is ManUp) ? "ManUp" : "Throbb") + " to her arm. About twenty seconds crawl by agonizingly with nothing happening.");
		output("\n\n<i>“I do hope you haven’t thought to try and trick me, farlander,”</i> Fei says, almost conversationally. <i>“I will be holding you here until something happens, for good or ill. Bound, if necessary. Wait. Waitwaitwaitwait...”</i>");
		output("\n\nShe groans almost orgasmically, head craned back and clutching at her groin. The featureless flesh there twitches, seems to become fluid and clay-like... and then a thick, fully formed, seven inch human penis bursts into existence, flopping down heavily between her thick thighs.");
		output("\n\n<i>“Awooowwww!”</i> Fei stares down in amazement, timidly touching the hefty member that she’s now sporting, immediately withdrawing it as if it were red hot. <i>“Astounding! I thought perhaps I had given you an impossible task, farlander - that all the talk of your magic was simply tall tales. This, is something else! And it... shoots fertilizing oil? Out of the head here? And what are these wrinkly spheres that are attached to it? Aren’t they silly-looking!”</i> As she gets over the immediate shock, clacking backward and forward and admiring her new todger and balls waggling back and forth, her slyness creeps back in.");
		output("\n\n<i>“So, your kind associate dominance with drones, do you?”</i> she muses. <i>“Like the Wetraxxal, perhaps? How very intriguing. I see we stand to gain much by parlaying with the farlands. You can assure Ara I will be at " + araQmfn("his", "her" , "their") + " little meeting. The future... throbs with possibility.”</i> She bites her lip; her dick darkens and thickens noticeably. <i>“If you’ll excuse me, farlander... mmm... I very much need to go and tend to my harem now.”</i>");
		output("\n\nYou watch her hurriedly swing her chitinous bulk back down into her burrow. <b>You should report to Ara that you’ve invited enough quadommes now.</b>");
		
		if(flags["FEIAN_SEX"] == FEIAN_SEX_FEMALE) flags["FEIAN_SEX"] = FEIAN_SEX_HERM;
		else flags["FEIAN_SEX"] = FEIAN_SEX_MALE;
		
		flags["GAVE_FEIAN_ITEMS"] = 1;
	}
	// Pussy variants
	else if(growVagina)
	{
		output("With a flourish, you hand over the pill. Fei consider it for a moment, turning it around in her four hands looking uncharacteristically hesitant.");
		output("\n\n<i>“So I simply swallow this... and then it shall grant me genitals?”</i> she asks. You answer affirmatively as confidently as you can. You sure <i>hope</i> it does. You doubt anybody’s actually tested the drug on a bothrioc.");
		output("\n\nYou watch the quadomme stick the " + ((item is Pussybloom) ? "Pussybloom" : "Pussyblossom") + " into her mouth. About twenty seconds crawl by agonizingly with nothing happening.");
		output("\n\n<i>“I do hope you haven’t thought to try and trick me, farlander,”</i> Fei says, almost conversationally. <i>“I will be holding you here until something happens. Bound, if necessary. Wait. Waitwaitwaitwait...”</i>");
		output("\n\nShe gasps almost orgasmically, head bent forward and clutching at her groin. The featureless flesh there twitches, seems to become fluid and clay-like... and then a vertical gash appears, gaining form until there is a hairless, plump-lipped vagina between her thick thighs.");
		output("\n\n<i>“Awooowwww!”</i> Fei stares down in amazement, timidly touching the neat, healthily-sized twat she’s now sporting, immediately withdrawing her fingers as if it were red hot. <i>“Astounding! I thought perhaps I had given you an impossible task, farlander - that all the talk of your magic was simply tall tales. This, is something else! And it... acts like a breeding bay? In the same manner as my myr slaves?”</i> As she gets over the immediate shock, clacking backward and forward and admiring her slit (you can’t help but notice it’s scarlet red inside), her slyness creeps back in.");
		output("\n\n<i>“So, your kind associate dominance with queens and workers, do you?”</i> she muses. <i>“Like the myr, then. How very intriguing. I see we stand to gain much by parlaying with the farlands. You can assure Ara I will be at " + araQmfn("his", "her" , "their") + " little meeting. The future... drips with possibility.”</i> She bites her lip, hands instinctively reaching down towards her new sex. <i>“If you’ll excuse me, farlander... mmm... I’d very much like to go and tend to my harem now.”</i>");
		output("\n\nYou watch her hurriedly swing her chitinous bulk back down into her burrow. <b>You should report to Ara that you’ve invited enough quadommes now.</b>");
		
		if(flags["FEIAN_SEX"] == FEIAN_SEX_MALE) flags["FEIAN_SEX"] = FEIAN_SEX_HERM;
		else flags["FEIAN_SEX"] = FEIAN_SEX_FEMALE;
		
		flags["GAVE_FEIAN_ITEMS"] = 1;
	}
	else
	{
		output("ERROR: Item not found!");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	if(!hasGenitals && flags["FEIAN_SEX"] != undefined)
	{
		IncrementFlag("BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT");
		flags["BOTHRIOC_QUEST"] = BOTHRIOC_QUEST_QUADOMME;
	}
	//feiAnRemove();
	flags["FEIAN_AT_LOCATION"] = undefined;
	
	processTime(5);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Part 3: The Summit
public function bothriocQuestSummit(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	var response:String = arg[0];
	var addiction:Number = arg[1];
	
	switch(response)
	{
		case "intro":
			showBust("ARAKEI");
			showName("\nTURN IN...");
			
			var blue:Boolean = pc.hasKeyItem("Bothrioc Pheromone Counteragent");
			var yellow:Boolean = pc.hasKeyItem("Bothrioc Fake Counteragent");
			if(addiction < 50)
			{
				output("You tell Ara you’ve accomplished both tasks that [ara.he] gave you: You have a spray that will suppress bothrioc pheromones, and you’ve succeeded in convincing a number of quadommes to meet with [ara.him].");
				output("\n\n<i>“Truly?”</i> The tall quadomme’s pupiless attention is entirely upon you. <i>“May I see this chymerist’s solution?”</i>");
				
				// If PC has Bothrioc Pheromone Counteragent and Fake, show choice
				if(blue && yellow)
				{
					addButton(0, "Give Genuine", bothriocQuestSummit, ["give geniune", addiction], "Give Genuine", "Give [ara.him] the counteragent that will work.");
					addButton(1, "Give Fake", bothriocQuestSummit, ["give fake", addiction], "Give Fake", "Give [ara.him] the counteragent that will only work for ten minutes.");
				}
				// If PC only has Bothrioc Pheromone Counteragent go here
				else if(blue) addButton(0, "Next", bothriocQuestSummit, ["give geniune", addiction]);
				else
				{
					output("\n\nERROR: Not counteragents found!");
					addButton(0, "Next", mainGameMenu);
				}
			}
			else
			{
				output("<i>“I have done as you commanded, egg-giver.”</i>");
				output("\n\n<i>“Truly?”</i> All of Ara’s attention turns to you, swallowing you up in that warm, black tar-pit of dominance, and you inhale sharply, feeling your blood rush to your [pc.skin]. <i>“Give me the chymerist’s solution, little one.”</i>");
				
				// If Add > 80 AND Fake Counteragent in Inventory
				if(addiction >= 80 && blue && yellow)
				{
					addButton(0, "Next", bothriocQuestSummit, ["give geniune", addiction]);
				}
				// If below 80 Add display choice if Fake Counteragent in Inventory
				else if(addiction < 80 && blue && yellow)
				{
					addButton(0, "Give Genuine", bothriocQuestSummit, ["give geniune", addiction], "Give Genuine", "Give [ara.him] the counteragent that will work.");
					addButton(1, "Give Fake", bothriocQuestSummit, ["give fake", addiction], "Give Fake", "Give [ara.him] the counteragent that will only work for ten minutes.");
				}
				// If Add < 80 and no Fake Counteragent in Inventory
				else if(blue)
				{
					addButton(0, "Next", bothriocQuestSummit, ["give geniune", addiction]);
				}
				else
				{
					output("\n\nERROR: Not counteragents found!");
					addButton(0, "Next", mainGameMenu);
				}
			}
			processTime(1);
			break;
		case "give geniune":
		case "give fake":
			showBust("ARAKEI");
			showName("GIVE\nCOUNTERAGENT");
			
			if(addiction < 50)
			{
				output("You hand over the " + (response == "give geniune" ? "blue" : "yellow") + " tincture.");
				output("\n\n<i>“Incredible.”</i> Ara takes the spray bottle of " + (response == "give geniune" ? "blue" : "yellow") + " tincture from you, gingerly examining it from every angle, as if it were a mythical object from bothrioc antiquity. <i>“I merely need to cast this around the hall in which we shall meet to stop our instincts from overwhelming us?”</i>");
				output("\n\n");
				if(response == "give geniune") output("You answer in the affirmative, and repeat " + flags["BOTHRIOC_QUEST_DOCTOR"] + "’s suggestion that [ara.he] leave some over so that more of it can replicated and produced.");
				else output("You answer in the affirmative. You feel slightly bad about lying, but you already made your mind up about what was the safest option a while ago.");
				output("\n\n<i>“Incredible!”</i> Ara turns to you, smiling hugely. They really are quite frightening when they do that. <i>“You have done more, far more, than any one of our kind could possibly have achieved, Steele. I shall reward you immediately - because from here on in, it is entirely down to me. I must seize this moment, and use these great, selfless gifts of yours to unite my kind!”</i>");
				output("\n\nShe gestures, and the gloopy bottle of purple blood and the heavy, well-thumbed journal is hurried over to you by a pidemme.");
				output("\n\n<i>“Shall we depart, Steele?”</i> The arch-bothrioc has had the suppressant whisked away and is considering her embassy at large with all four hands rested on [ara.his] hips. <i>“You, of course, shall have a place of honor at the summit. Tell me when you’re ready.”</i>");
			}
			else if(addiction < 80)
			{
				output("You hand over the " + (response == "give geniune" ? "blue" : "yellow") + " tincture.");
				if(response == "give fake") output(" It requires a reserve of strength you weren’t sure you had to do it - your hand trembles a bit as you hand over the phoney, the softness inside of you crying against the deception you’re perpetrating against the great, kind egg-giver - but you manage it. You exhale slowly in relief as the quadomme turns away from you, oblivious.");
				output("\n\n<i>“Incredible.”</i> Ara gingerly examines the " + (response == "give geniune" ? "blue" : "yellow") + " bottle of tincture from every angle, as if it were a mythical object from bothrioc antiquity. <i>“I merely need to cast this around the hall in which we shall meet to stop our instincts from overwhelming us?”</i>");
				output("\n\n");
				if(response == "give geniune") output("You answer in the affirmative, and repeat Lessau’s suggestion that [ara.he] leave some over so that more of it can replicated and produced.");
				else output("You answer in the affirmative. You feel terrible about lying, as if you’ve soiled yourself - but you know Lessau is right. Better that the rest of the galaxy not become as beholden to the bothrioc’s desires as you have.");
				output("\n\n<i>“Incredible!”</i> Ara turns to you, smiling hugely. They really are quite frightening when they do that. <i>“You have done more, far more, than any one of our kind could possibly have achieved, Steele. I shall reward you immediately - because from here on in, it is entirely down to me. I must seize this moment, and use these great, selfless gifts of yours to unite my kind!”</i>");
				output("\n\nShe gestures, and the gloopy bottle of purple blood and the heavy, well-thumbed journal is hurried over to you by a pidemme.");
				output("\n\n<i>“Shall we depart, Steele?”</i> The arch-bothrioc has had the suppressant whisked away and is considering her embassy at large with all four hands rested on [ara.his] hips. <i>“You, of course, shall have a place of honor at the summit. Tell me when you’re ready.”</i>");
			}
			else if(pc.hasKeyItem("Bothrioc Fake Counteragent"))
			{
				output("Instinctively, you hand over the blue spray bottle. The quadomme gave you an order: you couldn’t have reached for the dummy one even if you’d tried. Whilst Ara is examining the bottle of counteragent from every angle, like some mythical object from bothrioc legend, you tell [ara.him] about the dummy counteragent, and your friend Dr. Lessau’s reservations about helping [ara.his] kind. The words just spill out of you; in Ara’s presence you wish only to love and share.");
				output("\n\n<i>“Give me the fake elixir.”</i> Ara strides over to a nearby kitchen unit and pours the yellow fluid down the drain. When [ara.he] turn" + ara.mfn("s", "s", "") + " back to you [ara.he] smile" + ara.mfn("s", "s", "") + " hugely at you, and you smile back, puppyish joy overwhelming you.");
				if(pc.hasTail()) output(" Flap-flap-flap, goes your [pc.tails].");
				output("\n\n<i>“You have outdone yourself, Steele, as I knew you would. It does not surprise me that others treat us with distrust. Perhaps, in time, their opinions will be changed. As yours were.”</i>");
				output("\n\nA gleaming boot-tip is presented to your face; you lay one kiss after another upon first it, then another. You feel nothing but gratefulness for this most special of rewards; red hot arousal seems to course from your [pc.lips] down to your [pc.groin].");
				output("\n\n<i>“But such heroism cannot merely be rewarded with such traditional rewards, can they?”</i> Ara says at last, withdrawing her feet. You blink dimly. Can’t they? <i>“You have done more than any one of my kind could have achieved, little one. For that reason, you will have this. Take it to your doubting friend - show him that my kind are no crude slavers. Show him how we reciprocate, and reward.”</i>");
				output("\n\nShe gestures, and the gloopy bottle of purple blood and the heavy, well-thumbed journal is hurried over to you by a pidemme.");
				output("\n\n<i>“Shall we depart?”</i> The arch bothrioc has had the suppressant whisked away and is considering the room at large with all four hands rested on [ara.his] hips. <i>“I shall have need of you, once more, at the summit. Tell me when you’re ready.”</i>");
			}
			else
			{
				output("You hand over the blue spray bottle. Whilst Ara is examining the bottle of counteragent from every angle, like some mythical object from bothrioc legend, you tell [ara.him] about how you sought out Xenogen on another world, and paid immensely in order to have it made. The words just spill out of you; in Ara’s presence you wish only to love and give. Ara favors you with a huge smile when you’re done, and you smile back, puppyish joy overwhelming you.");
				if(pc.hasTail()) output(" Flap-flap-flap, goes your [pc.tail].");
				output("\n\n<i>“You have outdone yourself, Steele, as I knew you would. It does not surprise me that others would seek to exploit your loving, purified nature. Perhaps, in time, their own instincts will be changed. As yours were.”</i>");
				output("\n\nA gleaming boot-tip is presented to your face; you lay one kiss after another upon first it, then another. You feel nothing but gratefulness for this most special of rewards; red hot arousal seems to course from your [pc.lips] down to your [pc.groin].");
				output("\n\n<i>“But such heroism cannot merely be rewarded with such traditional rewards, can they?”</i> Ara says at last, withdrawing her feet. You blink dimly. Can’t they? <i>“You have done more than any one of my kind could have achieved, little one. For that reason, you will have this. Take it to your cynical friend - but this time, do not waver until he offers you a reasonable sum for it. That is an order.”</i>");
				output("\n\nShe gestures, and the gloopy bottle of purple blood and the heavy, well-thumbed journal is hurried over to you by a pidemme.");
				output("\n\n<i>“Shall we depart?”</i> The arch bothrioc has had the suppressant whisked away and is considering the room at large with all four hands rested on [ara.his] hips. <i>“I shall have need of you, once more, at the summit. Tell me when you’re ready.”</i>");
			}
			if(flags["JOIN_FEIAN_HAREM"] != undefined) output("\n\n<b>You clearly remember the deal you made with the quadomme Fei An Strozo; a promise made of bottomless, smothering silk. If you follow Ara now, you instinctively know it will be the end of your quest - and the beginning of eternal happiness.</b>");
			output("\n\n");
			
			// Remove both Counteragents from inventory, add Bothrioc Genealogy
			pc.removeKeyItem("Bothrioc Pheromone Counteragent");
			pc.removeKeyItem("Bothrioc Fake Counteragent");
			flags["BOTHRIOC_QUEST_COUNTERAGENT"] = (response == "give geniune" ? 1 : -1);
			output("\n\n<b>Quest item gained: Bothrioc Genealogy!</b>");
			pc.createKeyItem("Bothrioc Genealogy", 0, 0, 0, 0, "");
			
			processTime(2);
			
			addButton(0, "Ready", bothriocQuestSummit, ["ready", addiction], "Ready", "Join Ara Kei at the summit.");
			addButton(1, "Later", bothriocQuestSummit, ["later", addiction], "Later", "Come back and do this a bit later.");
			break;
		case "later":
			showBust("ARAKEI");
			showName("AMBASSADOR\nARA KEI");
			
			output("<i>“Approach me when you are.”</i> The quadomme strides back into the hive of activity purposefully. <i>“Don’t dally, " + (addiction < 50 ? "Steele" : "little one") + " - the summit shall be soon.”</i>");
			
			if(flags["FEIAN_LOCATION"] != undefined)
			{
				feiAnAppear();
				flags["FEIAN_AT_LOCATION"] = 1;
			}
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "ready":
			showBust("ARAKEI", "BOTHRIOC_PIDEMME", "BOTHRIOC_PIDEMME", "CHARLES");
			showName("\nREADY!");
			
			output("Ara Kei strides through the crowded embassy, rapping out instructions as she gathers up crumbling tomes and parchments, handing them out to her harem. Others hurry to open up cupboards filled with weapons and silken fabric. It’s a flurry of activity that would be impossible in most cultures - every one of these pidemmes seems to know exactly what they’re supposed to be doing, and they go about it in earnest, blissful compliance. In seemingly no time at all, 30 of them are wearing black, silk sashes, armed with spears and have arranged themselves into a crocodile; the other 10 are weighed down with Ara’s texts and equipment. Charles tags on at the end with you. The human is bluff and nonchalant as ever, but he has unearthed a kipper tie from somewhere.");
			output("\n\n<i>“Now, my loves,”</i> Ara says at last, positioned in the very middle. <i>“March!”</i>");
			
			processTime(5);
			
			// Clear Fei An Strozo's position on the map.
			if(flags["FEIAN_LOCATION"] != undefined)
			{
				feiAnRemove();
				flags["FEIAN_LOCATION"] = undefined;
				flags["FEIAN_AT_LOCATION"] = undefined;
			}
			
			addButton(0, "Next", bothriocQuestSummit, ["ready 1", addiction]);
			break;
		case "ready 1":
			showBust("ARAKEI", "BOTHRIOC_PIDEMME", "BOTHRIOC_PIDEMME", "CHARLES");
			// Move PC to Grand Elevator
			currentLocation = "611";
			generateMap();
			showLocationName();
			
			output("The lock-step the pidemmes manage, out of the airport and across to the Grand Elevator, would put the sternest of red myr drill sergeants to shame. The entourage gets plenty of stares, and the gold guards thin their lips as it funnels into the Elevator, but nobody stops you. The Republican military is presumably familiar with Ara’s people coming and going, although not exactly comfortable with it.");
			output("\n\nThrough the airy vaults and fungal parks of Gildenmere the column marches, through to its northern gates and beyond into the sooty, broken crags of the DMZ. The gold children who exclaim and point and run alongside you are pulled back by tense-faced minders. You practically hear a sigh of relief as you and Charles tail past the city gates.");
			
			processTime(5);
			
			addButton(0, "Next", bothriocQuestSummit, ["ready 2", addiction]);
			break;
		case "ready 2":
			showBust("ARAKEI", "BOTHRIOC_PIDEMME", "BOTHRIOC_PIDEMME", "CHARLES");
			// Move PC to first hostile square north of Gildenmere, + 4 hours
			currentLocation = "1H34";
			generateMap();
			showLocationName();
			
			output("On and on the column of black-and-white files, far into the DMZ, past the wreckage of the recent fighting, the vanguard toeing forward to poke around like fishing storks for landmines. You remain unmolested though, no scavenger brave enough to take on an armed harem this size, and soon enough you’re dropping down the great hole one by one into the Deep Caves.");
			
			processTime(56 * 4);
			
			addButton(0, "Next", bothriocQuestSummit, ["ready 3", addiction]);
			break;
		case "ready 3":
			showBust("ARAKEI", "BOTHRIOC_PIDEMME", "BOTHRIOC_PIDEMME", "CHARLES");
			// Move PC to 1st square west of Deep Caves cliff, + 2 hours
			currentLocation = "2W19";
			generateMap();
			showLocationName();
			
			output("The mood loosens a little once you’re back in what the bothrioc consider their natural territory, and the pidemmes chatter as you continue on, mostly about their former, savage lives down here, which Ara allows. You’re pretty weary at this point, but these guys don’t seem to feel it at all - they have their order, and they’re at their happiest obeying it.");
			
			processTime(58 * 2);
			
			addButton(0, "Next", bothriocQuestSummit, ["ready 4", addiction]);
			break;
		case "ready 4":
			showBust("ARAKEI", "BOTHRIOC_PIDEMME", "BOTHRIOC_PIDEMME", "CHARLES");
			// Move PC to standalone square Ancient Coliseum, + 6 hours
			rooms["ANCIENT COLISEUM"] = new RoomClass(this);
			rooms["ANCIENT COLISEUM"].roomName = "ANCIENT\nCOLISEUM";
			rooms["ANCIENT COLISEUM"].description = "";
			rooms["ANCIENT COLISEUM"].planet = "PLANET: MYRELLION";
			rooms["ANCIENT COLISEUM"].system = "SYSTEM: SINDATHU";
			rooms["ANCIENT COLISEUM"].moveMinutes = 1;
			rooms["ANCIENT COLISEUM"].runOnEnter = undefined;
			rooms["ANCIENT COLISEUM"].addFlag(GLOBAL.INDOOR);
			rooms["ANCIENT COLISEUM"].addFlag(GLOBAL.PUBLIC);
			rooms["ANCIENT COLISEUM"].addFlag(GLOBAL.CAVE);
			currentLocation = "ANCIENT COLISEUM";
			generateMap();
			showLocationName();
			
			output("Hard chitinous boots clack onwards into the eternal night of Myrellion’s ghostly, primordial caverns, from whence all of its sapient life emerged, and for the most part still calls home. You travel further than you ever have before - slipping through disregarded cave entrances and on down wandering tunnels that seem deadened, forgotten by time itself. The talk quietens; Charles switches on a torch for you two, children of the blinding outdoors. Occasionally Ara stops to consider a map, tapping [ara.his] pale chin before proceeding.");
			output("\n\nAt last, the rough rock beneath your [pc.feet] is replaced by cobbles. The walls open out into a large cavern, dimly lit by colonies of luminescent fungus and dominated by ruins that are slowly sinking into dust and rubble. It’s obvious nobody has visited this distant, abandoned place for a long, long time.");
			output("\n\n<i>“Looks sort of like Gildenmere architecture,”</i> murmurs Charles.");
			output("\n\n<i>“Sort of,”</i> says Ara. [ara.He] lead" + ara.mfn("s", "s", "") + " the procession into a stone bowl, surrounded on all sides by steep stone steps. <i>“Now we rest. And wait.”</i>");
			
			processTime(55 * 6);
			
			addButton(0, "Next", bothriocQuestSummit, ["ready 5", addiction]);
			break;
		case "ready 5":
			showBust("ARAKEI", feiAnStrozoBustDisplay(), "BOTHRIOC_QUADOMME", "BOTHRIOC_QUADOMME");
			
			output("Ara’s harem takes over one narrow tier of steps of the amphitheatre, and distribute equipment and food. The dominant [ara.himself] takes up the " + (flags["BOTHRIOC_QUEST_COUNTERAGENT"] > 0 ? "blue" : "yellow") + " spray bottle and squirts it liberally across the whole area. In the still, dry atmosphere, you can see the moisture droplets hanging in the air.");
			output("\n\nIt seems like a strange place to call any kind of meeting - how would any of the other bothrioc know where to come? - but, as the hours pass, invitees do emerge. And, it quickly turns out, Ara was right about only needing to invite a few quadommes. Three, four, six, ten, sixteen, twenty quadommes clack their stately way into the amphitheatre, each with their own gaggle of devoted attendees, and settle themselves into the galleries. And after them come any number of dominant pidemmes - immediately recognizable by the sharpness of their expressions and defiant, raised chins, keeping themselves a firm distance away from their bigger, eight-limbed cousins. Eventually there’s hundreds of the black-and-white beings serried around you, all waiting as silent and patient as any spider sat on its web.");
			output("\n\nThe last to arrive is Fei An Strozo. Unlike all the others - who quite clearly continue to not see the point in clothes - she’s dressed herself in a silken, red-and-cream tabard, the fronds of which reach down to her knees. Her retinue consists of a single member of every race on Myrellion - even a meek, faintly luminescent ganrael. And unlike every other dominant, who have been content to pick somewhere in the amphitheatre and keep a silent, suspicious eye on Ara, the crimson quadomme strides across and addresses [ara.him] directly, loud enough for everyone to hear.");
			output("\n\n<i>“Karachnarum? Dear me. I thought you were supposed to be subtle, Ara.”</i>");
			output("\n\n<i>“I shall take being called extravagant by you as a compliment, Fei,”</i> Ara replies coolly. <i>“I thought the setting fitting, for we are on the cusp of similar ruin - or, perhaps, greatness. How do you think it possible that you can converse with me here now without bearing your teeth?”</i>");
			output("\n\n<i>“Perhaps I am biding my time.”</i> Fei flicks her streamer of red hair at you with grand nonchalance. <i>“I enjoyed your message " + pc.mf("drone", "worker") + ", by the way.");
			if(flags["JOIN_FEIAN_HAREM"] != undefined) output(" They shall make a fine addition to my harem.");
			else output(" They provided me with... sumptuous entertainment.");
			output("”</i> Whispery laughter gusts around the stone galleries.");
			output("\n\n<i>“I thought that you two might find things in common,”</i> Ara says, poker-faced. Fei gives you a lingering, smoldering look before striding off, haremlings in tow, to take her place amongst the throng.");
			
			// + 3 hours
			processTime(56 * 3);
			
			addButton(0, "Next", bothriocQuestSummit, ["ready 6", addiction]);
			break;
		case "ready 6":
			showBust("ARAKEI", "BOTHRIOC_PIDEMME", "BOTHRIOC_QUADOMME", "BOTHRIOC_QUADOMME");
			
			output("There is a kind of raised lectern set a little way into the bowl nearby, carved stone shaped like half a wine glass, and it’s this that Ara approaches, laying her twenty thin fingers on the top.");
			output("\n\n<i>“Thank you for coming,”</i> [ara.he] say" + ara.mfn("s", "s", "") + ". The amphitheatre is shaped to capture sound, and [ara.his] measured voice rolls around it. <i>“For putting aside your natural suspicions and coming here, to parlay in Ancient Karachnarum, where the greatest of our monarchs once ruled over a nation of gold myr. They have forgotten. We have not. But we shall be forgotten, and everything we know shall be less than these sad, crumbling walls, if we do not find a way to unite. To raise our hands to the farlanders and say: we are a nation, once again. Recognize us as such.”</i>");
			output("\n\n<i>“Why?”</i> calls a slightly older looking quadomme opposite. <i>“So there are new morsels scuttling around our territories, and the myr are slaughtering each other. True egg-givers benefit from such kerfuffle, as we always have. There was once ONE bothrioc who ruled over the gold myr, not a committee. We are solitary hunters. You are demanding perversity of us.”</i>");
			output("\n\n<i>“We can use the farlanders’ tools to overcome,”</i> says Ara, raising [ara.his] voice over the murmuring. <i>“Already I am using them to speak to you. Or have you not noticed how your senses have remained clear, anger not clouding your judgment, despite how many egg-givers are here?”</i>");
			output("\n\nThere are a lot of sideways glances.");
			output("\n\n<i>“As for the myr: They used to fear us, respect us,”</i> The tall quadomme goes on. <i>“Now they have built weapons which mean they have reason to fear no-one, except themselves. Surely you cannot have been watching what has been happening in the shallows and believe things shall continue as they always have? We pride ourselves on being intelligent opportunists. Seizing this moment, making accord with the farlanders and elevating ourselves above this terrible war to untold horizons: That would be the most bothrioc course of action imaginable.”</i>");
			output("\n\n<i>“Fah!”</i> A pidemme stands up, pointing accusingly. The set of his jaw and the broadness of his chest sets him out as undeniably masculine. <i>“And you would be at the head of this utopia, right? You, the greediest, you, who wasted no time crawling to the farlanders, conniving with them and doing who only knows what in order to gain access to their toys? You simply dream of bigger and bigger harems, expanding out forever, and anyone who listens to your fine words is vulnerable to becoming part of it. I was foolish to come here and have you pour oil in my ears. We all were!”</i>");
			output("\n\nWith that he strides out of the amphitheatre, two pidemme and a red myr hurrying after him. A number of voices rise in agreement above a general hubbub of fevered muttering, and Ara looks momentarily taken aback. The clamor grows, and you feel as if things are coming to a head...");
			
			processTime(8);
			
			addButton(0, "Next", bothriocQuestSummit, [(flags["BOTHRIOC_QUEST_COUNTERAGENT"] > 0 ? "summit real" : "summit fake"), addiction]);
			break;
		case "summit fake":
			showBust("ARAKEI", feiAnStrozoBustDisplay(), "CHARLES", "BOTHRIOC_QUADOMME");
			
			output("Disharmony ripples around the galleries, muttering turning to sussurating shouts of agreement with the pidemme that just walked out. You can practically feel the counteragent wearing off: sharp teeth glitter in the gloom as they are bared at each other, elegant faces tightening with anger, groups of submissives huddling together in fright.");
			output("\n\n<i>“Yours is a grand vision, Ara Kei,”</i> says Fei, rising and raising her voice so that it rings over the tumult. <i>“A little too grand. Look around you; do you expect us to meet like this, regularly? Impossible. Nauseating. The magic you have scratched together from these farlanders cannot speak against our very natures.”</i> She smiles pityingly as she indicates to all of her harem to stand. <i>“Shelve those dreams of empire and grandeur Ara, and be grateful for what you have. You will destroy yourself otherwise.”</i>");
			output("\n\nShe strides out, on the back of a breathy roar of approval. You think, maybe, that there might have been a few dominants who would have lingered to talk with Ara, cobble something together after the bulk of them had left, but not after two such grand denunciations. Within ten minutes, they have all gathered their parties together and left, leaving you alone with Ara’s party.");
			output("\n\nThe quadomme spends some time with [ara.his] head down, fiddling diffidently with [ara.his] parchments, uttering apologies and jerky non-sequiturs in a deeply un-Ara way whenever any one of you approach [ara.him]. Finally [ara.he] says that [ara.he] would like some time alone, a statement that sends a shockwave through the ranks of [ara.his] submissives. They watch their owner leave, disappearing into the shadows of Karachnarum, shivering and murmuring fearfully between themselves. Nothing you or Charles can say can calm them down.");
			output("\n\nThankfully Ara does return before things get out of hand, somber but placid, and it only takes a few ruffles of scalps and soothing words in black-shelled ears for things to settle.");
			output("\n\n<i>“Thank you for all that you have done for me, Steele,”</i> [ara.he] say" + ara.mfn("s", "s", "") + " at last, turning [ara.his] pupil-less eyes to you. <i>“You did everything you could. This is my failure. The failure of my people, to overcome our baser instincts. I must accept the conclusions of this day, as grim as they are.”</i>");
			output("\n\n<i>“And what’re those?”</i> asks Charles tentatively.");
			output("\n\n<i>“This world is doomed,”</i> says Ara, with moon-like calm. <i>“And, by refusing to unite, so is my race. I have no wish for me and mine to die or be subjugated alongside them. I shall pour all of my resources into buying passage away from here. Perhaps, somewhere amongst the myriad farlands, I shall find a place remote and peaceful enough to call home.”</i>");
			output("\n\nWith that, [ara.he] draws [ara.himself] up, and begins directing [ara.his] harem to begin packing up.");
			if(flags["JOIN_FEIAN_HAREM"] != undefined)
			{
				output("\n\n<i>“There is someone waiting for you, Steele,”</i> [ara.he] say" + ara.mfn("s", "s", "") + " over [ara.his] shoulder. The very slightest of smiles tugs at a mouth you thought set in stone forever. <i>“In the tunnel opposite to the one we came in. I wouldn’t keep her waiting.”</i>");
				output("\n\nYour heart flutters. Well, you did agree... regardless of how the summit turned out. Slowly, you [pc.move] out of the amphitheatre, leaving Ara Kei behind you for the last time. You trundle through the crumbling city ruins, following the many stiletto tracks in the dust until you find a gaping tunnel entrance.");
				output("\n\n<i>“Shame how that all worked out, isn’t it?”</i> Fei An Strozo slowly stalks out from the shadows, one deliberate tap of a chitinous boot at a time, smiling at you hungrily. <i>“Kneel.”</i>");
				output("\n\nShivering slightly you do, watching the great red-and-brown bulk of the thick quadomme looming over you.");
				output("\n\n<i>“Still - you know now that you are owned by unquestionably the greatest bothrioc in existence. I think that’s an excellent outcome, myself. Don’t you?”</i>");
				output("\n\n<i>“Yes... egg-giver,”</i> you whisper.");
				output("\n\n<i>“Good.”</i> A gleaming russet boot is presented to your face. <i>“This has been a dusty day. Give them the shine they deserve. I have lightened my load amongst my other servants already, but if you turn out to be a quick learner and beg sweetly enough, who knows...?”</i>");
				
				processTime(11);
				
				// Go to Bad End
				addButton(0, "Next", bothriocQuestBadEnd);
			}
			else
			{
				output("\n\nThere’s not much left to do except leave this strange old city behind, and travel back up to the surface.");
				
				processTime(8);
				
				addButton(0, "Next", bothriocQuestSummitEnd);
			}
			processTime(15);
			flags["BOTHRIOC_QUEST"] = BOTHRIOC_QUEST_FAILURE;
			flags["BOTHRIOC_QUEST_SUMMIT_DATE"] = GetGameTimestamp();
			break;
		case "summit real":
			// Gib 50/50 chance as to which she gave herself
			if(flags["FEIAN_SEX"] == undefined) flags["FEIAN_SEX"] = rand(2);
			var feiAnNude:Boolean = false;
			
			if(flags["JOIN_FEIAN_HAREM"] == undefined)
			{
				output("<i>“Enough!”</i>");
				output("\n\nFei dismounts from her position low on the gallery opposite, and once again strides into the middle of the amphitheatre with a magnificent flounce.");
				output("\n\n<i>“You fools are shying away from reason,”</i> she cries, <i>“because you fear <b>[ara.him]</b>. You think that if Ara Kei chose to subvert us and turn us all into [ara.his] slaves, you would lack the wit, the resolve to resist [ara.him]? Pfah! I stand with [ara.him], because I am a quadomme worthy of the name! I’ve got " + (feiAnHasCock() ? "balls" : "ovaries") + " of steel!”</i>");
				output("\n\n<i>“...what are those?”</i> asks a hesitant voice.");
				output("\n\n<i>“I’ll show you!”</i> the russet bothrioc roars, flipping up the front lapel of her tabard. There’s a collective intake of breath, followed by a stunned silence, as the hundreds of spectators take in");
				if(feiAnHasCock()) output(" the big, rude human penis and testicles dangling between her thick thighs");
				else output(" the bare, plump-lipped slit between her thick thighs");
				output(".");
				output("\n\n<i>“Such as my " + (flags["BOTHRIOC_QUEST_BETA_NYREA_BAITED"] != undefined ? "nyrea" : "myr") + " have,”</i> murmurs one. <i>“How is that possible?”</i>");
				output("\n\n<i>“I partook of the farlander’s gifts,”</i> Fei replies proudly. <i>“And already I know more, can do more, than the most glorious of my ancestors. As soon as I got </i>this<i>, I saw the need to have clothes made. Yes, that strange practice of the other races we have all mocked! But now I have something to hide. Something to hint at, something to allure with.”</i>");
				if(addiction < 50)
				{
					output("\n\n<i>“So if you aren’t willing to listen to grand reasons for unity - listen to selfish ones!”</i> She drops her tabard back down and strides back to her place amongst her retinue.");
					output("\n\nConversation buzzes around the galleries, but this time, you sense, there’s eagerness and excitement afoot, rather than tension and anger.");
					output("\n\n<i>“Say we agree,”</i> says a pidemme. <i>“What would we have to do?”</i>");
					output("\n\n<i>“We don’t have to stipulate how our government will work, here and now,”</i> Ara replies, over the hubbub. <i>“All I need are your marks, your agreement that we will meet here, and later in the farlanders’ chambers, to discuss what we want, and how we will achieve it. I have enough proof, I believe, that we are a culture, and so long as we organize collectively, the farlanders’ own rules demand they listen to us, and give us equal rights.”</i>");
					output("\n\n<i>“I am not going to let the myr women walk all over us,”</i> says the pidemme after a pause, rising up, glancing over at Fei as they do. <i>“And, yes... the farlanders’ magic is, uh... interesting.”</i>");
					output("\n\nEventually, almost the entire theater of dominants comes down and signs the parchment that Ara has set down. They stand in groups, talking with another as the process goes on, hesitantly at first but growing in ease, delighting in the newfound freedom the pheromonal counteragent is affording them here. Some leaf through the tomes of history Ara brought along with [ara.him]; others gather up mingled groups of laughing, blushing haremlings and usher them into secluded parts of the ruin. A lusty carnival kind of atmosphere is starting to develop, light flickering within this dead, dusty city.");
				}
				else
				{
					output("\n\n<i>“You!”</i> She points imperiously across the bowl at you. <i>“Here. Now.”</i>");
					output("\n\nYou have to obey. The <i>power</i> in her voice, it’s like the whole universe is frozen and she is the only source of heat. As you move closer, she seems to grow larger and larger, warmer and warmer, melting away your thoughts and insinuating herself into every cell in your body. You know exactly what she wants you to do, and when you get on your [pc.knees] in front of her gleaming, russet legs, a soft groan tumbles out of your mouth at bathing in total submission.");
					
					feiAnNude = true;
					
					if(feiAnHasCock())
					{
						output("\n\nFei murmurs with pleasure as you enclose the base of her cock with your hand, shifting your grip along it lovingly until it’s unyielding and thrumming with lust, pointing demandingly at your face, before bending forward and lapping at its underside, tasting its salt and delicious heat.");
						output("\n\n<i>“Yes, and now... yeesssss,”</i> Fei groans huskily as you spread your [pc.lips] over the bulb, welcoming it into your wet mouth. <i>“A shame you refused to join my harem - you are much more skilled at this than any of my pets. They are having to learn from scratch...”</i>");
						output("\n\nYou feel hundreds of pupiless eyes boring into you from all around as you blow her with increasing gusto, breathless whispers and giggles rising into the dead, dusty air. The rich humiliation of it stokes your submissive arousal, your [pc.skin] feeling like it’s being lit on fire by the stares you’re getting.");
						output("\n\n<i>“You are all watching, yes?”</i> Fei says, her accented voice trembling through you as you take her thick meat further and further into your suck. <i>“A supposedly sophisticated farlander, on [pc.his] knees and servicing the sexual organ [pc.he] [pc.him]self gifted me! There’s worlds beyond number with these flavorful, generous beings on them. And you would turn away from that?!”</i>");
						output("\n\nHer last syllable rises in declamatory ecstasy as she grabs the back of your head with two chitinous hands and pumps her cock into your mouth vigorously. You hollow your cheeks around her, tightening your lips so she doesn’t pop out, and are rewarded a few moments later when she orgasms hard, spurting one gooey dose of cum into your mouth after another with hefty flexes.");
						output("\n\n<i>“Not as good as giving eggs...”</i> she groans, head rolled back, hair waving, <i>“but... hurf!... I need this more often, and when you have as many toys as I do... huurrrff... that is an excellent thing.”</i>");
						output("\n\nAt last she is done, and withdraws her spent cock from your face, releasing her grip on your [pc.hair].");
					}
					else
					{
						output("\n\nFei murmurs with pleasure as you spread your hands over the soft, brown flesh at the top of her thighs and bend inwards, trailing the tip of your [pc.tongue] along the pudgy lips of her cunt, varnishing them with saliva before dipping further inside, touching the silky innards and savoring the light, faintly sweet fluid that is already dripping down them.");
						output("\n\n<i>“Don’t forget the little, whatever it is. That bit is... yeeeessss,”</i> Fei groans huskily as you move obediently upwards to flick at her tiny clit, swaddled in softness but soon bulging outwards as you lavish it with attention. <i>“A shame you refused to join my harem - you are much more skilled at this than any of my pets. They are having to learn from scratch...”</i>");
						output("\n\nYou feel hundreds of pupiless eyes boring into you from all around as you eat her with increasing gusto, breathless whispers and giggles rising into the dead, dusty air. The rich humiliation of it stokes your submissive arousal, your [pc.skin] feeling like it’s being lit on fire by the stares you’re getting.");
						output("\n\n<i>“You are all watching, yes?”</i> Fei says, her accented voice trembling through you as you reach your [pc.tongue] further and further up her wet valley. <i>“A supposedly sophisticated farlander, on [pc.his] knees and servicing the sexual organ [pc.he] [pc.him]self gifted me! There’s worlds beyond number with these flavorful, generous beings on them. And you would turn away from that?!”</i>");
						output("\n\nHer last syllable rises in declamatory ecstasy as she grabs the back of your head with two chitinous hands and thrusts her cunt into your mouth vigorously. You let her ride you, wriggling your tongue for her, and are rewarded a few moments later when she orgasms hard, smearing your face with juices.");
						output("\n\n<i>“Not as good as giving eggs...”</i> she groans, head rolled back, hair waving, <i>“but... hurf!... it is an inward sensation, a different feast to savor... huurrrff... that is an excellent thing.”</i>");
						output("\n\nAt last she is done, and lifts her softened pussy from your face, releasing her grip on your [pc.hair].");
					}
					output("\n\nConversation buzzes around the galleries, but this time, you sense, there’s eagerness and excitement afoot, rather than tension and anger.");
					output("\n\n<i>“Say we agree,”</i> says a pidemme. <i>“What would we have to do?”</i>");
					output("\n\n<i>“We don’t have to stipulate how our government will work, here and now,”</i> Ara replies, over the hubbub. <i>“All I need are your marks, your agreement that we will meet here, and later in the farlanders’ chambers, to discuss what we want, and how we will achieve it. I have enough proof, I believe, that we are a culture, and so long as we organize collectively, the farlanders’ own rules demand they listen to us, and give us equal rights.”</i>");
					output("\n\n<i>“I am not going to let the myr women walk all over us,”</i> says the pidemme after a pause, rising up, glancing over at Fei as they do. <i>“And, yes... the farlanders’ magic is, um... interesting.”</i>");
					output("\n\nEventually, almost the entire theater of dominants comes down and signs the parchment that Ara has set down. They stand in groups, talking with another as the process goes on, hesitantly at first but growing in ease, delighting in the newfound freedom the pheromonal counteragent is affording them here. Some leaf through the tomes of history Ara brought along with [ara.him]; others gather up mingled groups of laughing, blushing haremlings and usher them into secluded parts of the ruin. A lusty carnival kind of atmosphere is starting to develop, light flickering within this dead, dusty city.");
				}
			}
			else
			{
				output("<i>“Enough!”</i>");
				output("\n\nFei dismounts from her position low on the gallery opposite, and once again strides into the middle of the amphitheatre with a magnificent flounce.");
				output("\n\n<i>“You fools are shying away from reason,”</i> she cries, <i>“because you fear <b>[ara.him]</b>. You think that if Ara Kei chose to subvert us and turn us all into [ara.his] slaves, you would lack the wit, the resolve to resist [ara.him]? Pfah! I stand with [ara.him], because I am a quadomme worthy of the name! I’ve got " + (feiAnHasCock() ? "balls" : "ovaries") + " of steel!”</i>");
				output("\n\n<i>“...What are those?”</i> asks a hesitant voice.");
				output("\n\n<i>“I’ll show you!”</i> the russet bothrioc roars, flipping up the front lapel of her tabard. There’s a collective intake of breath, followed by a stunned silence, as the hundreds of spectators take in");
				if(feiAnHasCock()) output(" the big, rude human penis and testicles dangling between her thick thighs");
				else output(" the bare, plump-lipped slit between her thick thighs");
				output(".");
				output("\n\n<i>“Such as my " + (flags["BOTHRIOC_QUEST_BETA_NYREA_BAITED"] != undefined ? "nyrea" : "myr") + " have,”</i> murmurs one. <i>“How is that possible?”</i>");
				output("\n\n<i>“After the farlander visited me, I resolved to walk amongst them as Ara has, see what exactly it is they have to offer us,”</i> Fei replies proudly. <i>“I availed myself of one of their gifts, magic that gave me </i>this<i>.”</i> Two hands form a triangle, framing her new set of genitals. <i>“And already I know more, can do more, than the most glorious of my ancestors. As soon as I got </i>this<i>, I saw the need to have clothes made. Yes, that strange practice of the other races we all have mocked! But now I have something to hide. Something to hint at, something to allure with. Knowledge must be guarded.”</i>");
				output("\n\n<i>“You!”</i> She points imperiously across the bowl at you. <i>“Here. Now.”</i>");
				output("\n\n");
				if(addiction >= 50)
				{
					output("You have to obey. The <i>power</i> in her voice, it’s like the whole universe is frozen and she is the only source of heat. As you move closer, she seems to grow larger and larger, warmer and warmer, melting away your thoughts and insinuating herself into every cell in your body. You know exactly what she wants you to do, and when you get on your [pc.knees] in front of her gleaming, russet legs, a soft groan tumbles out of your mouth at bathing in total submission.");
				}
				else
				{
					output("You start slightly, a blush coming to your cheeks as you realize what’s coming. But you did bargain yourself away to her... you can hardly make a fuss about being ordered around now.");
					output("\n\nAs [pc.move] closer to her, she seems to grow larger and larger, warmer and warmer, and the lingering shades of hesitancy and embarrassment fade away. Yes... it feels so much better to fully submit to a powerful, utterly assured being such as this. When you get on your [pc.knees] in front of her gleaming, russet legs, a soft groan tumbles out of your mouth at bathing in total submission.");
				}
				
				feiAnNude = true;
				
				if(feiAnHasCock())
				{
					output("\n\nFei murmurs with pleasure as you enclose the base of her cock with your hand, shifting your grip along it lovingly until it’s unyielding and thrumming with lust, pointing demandingly at your face, before bending forward and lapping at its underside, tasting its salt and delicious heat.");
					output("\n\n<i>“Yes, and now... yeesssss,”</i> Fei groans huskily as you spread your [pc.lips] over the bulb, welcoming it into your wet mouth. <i>“You shall make an excellent addition to my harem - you are much more skilled at this than any of my other servants. They are having to learn from scratch...”</i>");
					output("\n\nYou feel hundreds of pupiless eyes boring into you from all around as you blow her with increasing gusto, breathless whispers and giggles rising into the dead, dusty air. The rich humiliation of it stokes your submissive arousal, your [pc.skin] feeling like it’s being lit on fire by the stares you’re getting.");
					output("\n\n<i>“You are all watching, yes?”</i> Fei says, her accented voice trembling through you as you take her thick meat further and further into your suck. <i>“A supposedly sophisticated farlander, now a possession of mine, on [pc.his] knees and servicing a sexual organ [pc.his] people gifted me! There’s worlds beyond number with these flavorful, generous beings on them. And you would turn away from that?!”</i>");
					output("\n\nHer last syllable rises in declamatory ecstasy as she grabs the back of your head with two chitinous hands and pumps her cock into your mouth vigorously. You hollow your cheeks around her, tightening your lips so she doesn’t pop out, and are rewarded a few moments later when she orgasms hard, spurting one gooey dose of cum into your mouth after another with hefty flexes.");
					output("\n\n<i>“Not as good as giving eggs...”</i> she groans, head rolled back, hair waving, <i>“but... hurf!... I need this more often, and when you have as many toys as I do... huurrrff... that is an excellent thing.”</i>");
					output("\n\nAt last she is done, and withdraws her spent cock from your face, releasing her grip on your [pc.hair].");
				}
				else
				{
					output("\n\nFei murmurs with pleasure as you spread your hands over the soft, brown flesh at the top of her thighs and bend inwards, trailing the tip of your [pc.tongue] along the pudgy lips of her cunt, varnishing them with saliva before dipping further inside, touching the silky innards and savoring the light, faintly sweet fluid that is already dripping down them.");
					output("\n\n<i>“Don’t forget the little, whatever it is. That bit is... yeeeessss,”</i> Fei groans huskily as you move obediently upwards to flick at her tiny clit, swaddled in softness but soon bulging outwards as you lavish it with attention. <i>“You shall make an excellent addition to my harem - you are much more skilled at this than any of my other servants. They are having to learn from scratch...”</i>");
					output("\n\nYou feel hundreds of pupiless eyes boring into you from all around as you eat her with increasing gusto, breathless whispers and giggles rising into the dead, dusty air. The rich humiliation of it stokes your submissive arousal, your [pc.skin] feeling like it’s being lit on fire by the stares you’re getting.");
					output("\n\n<i>“You are all watching, yes?”</i> Fei says, her accented voice trembling through you as you take her thick meat further and further into your suck. <i>“A supposedly sophisticated farlander, now a possession of mine, on [pc.his] knees and servicing a sexual organ [pc.his] people gifted me! There’s worlds beyond number with these flavorful, generous beings on them. And you would turn away from that?!”</i>");
					output("\n\nHer last syllable rises in declamatory ecstasy as she grabs the back of your head with two chitinous hands and thrusts her cunt into your mouth vigorously. You let her ride you, wriggling your tongue for her, and are rewarded a few moments later when she orgasms hard, smearing your face with juices.");
					output("\n\n<i>“Not as good as giving eggs...”</i> she groans, head rolled back, hair waving, <i>“but... hurf!... it is an inward sensation, a different feast to savor... huurrrff... that is an excellent thing.”</i>");
					output("\n\nAt last she is done, and lifts her softened pussy from your face, releasing her grip on your [pc.hair].");
				}
				output("\n\nConversation buzzes around the galleries, but this time, you sense, there’s eagerness and excitement afoot, rather than tension and anger.");
				output("\n\n<i>“Say we agree,”</i> says a pidemme. <i>“What would we have to do?”</i>");
				output("\n\n<i>“We don’t have to stipulate how our government will work, here and now,”</i> Ara replies, over the hubbub. <i>“All I need are your marks, your agreement that we will meet here, and later in the farlanders’ chambers, to discuss what we want, and how we will achieve it. I have enough proof, I believe, that we are a culture, and so long as we organize collectively, the farlanders’ own rules demand they listen to us, and give us equal rights.”</i>");
				output("\n\n<i>“I am not going to let the myr women walk all over us,”</i> says the pidemme after a pause, rising up, glancing over at Fei as they do. <i>“And, yes... the farlanders’ magic is, um... interesting.”</i>");
				output("\n\nEventually, almost the entire theater of dominants comes down and signs the parchment that Ara has set down. They stand in groups, talking with another as the process goes on, hesitantly at first but growing in ease, delighting in the newfound freedom the pheromonal counteragent is affording them here. Some leaf through the tomes of history Ara brought along with [ara.him]; others gather up mingled groups of laughing, blushing haremlings and usher them into secluded parts of the ruin. A lusty carnival kind of atmosphere is starting to develop, light flickering within this dead, dusty city.");
			}
			
			showBust(feiAnStrozoBustDisplay(feiAnNude), "ARAKEI", "BOTHRIOC_QUADOMME", "BOTHRIOC_QUADOMME");
			processTime(21);
			
			addButton(0, "Next", bothriocQuestSummit, ["summit 1", addiction]);
			break;
		case "summit 1":
			if(flags["JOIN_FEIAN_HAREM"] == undefined)
			{
				output("<i>“I never thought it would be this straightforward,”</i> says Ara to you a little while later. [ara.He] " + ara.mfn("is", "is", "are") + " sat back on a camp chair, admiring the long list of bothrioc names, all the while two of [ara.his] harem purposefully tongue-polish [ara.his] long, black boots. <i>“There is so much still left to be done - I shall truly believe in the farlanders’ laws when they are fairly applied to us - but this day, I have no shame in telling you, I dreaded. I thought the greater probability lay in them rejecting me.”</i> [ara.He] smile" + ara.mfn("s", "s", "") + " at you hugely, genuine joy illuminating the diplomat’s pale face. <i>“I could not have done it without you and, ah, the ‘magic’ you cast on our mutual friend, Steele. Thank you, from the bottom of my hearts.”</i>");
				output("\n\n[ara.He] rise" + ara.mfn("s", "s", "") + ", and with a few murmurs and strokes directs [ara.his] haremlings to start packing up.");
				output("\n\n<i>“Come to the Embassy in a couple of days, won’t you, " + (addiction < 50 ? "Steele" : "little one") + "?”</i> Ara carefully rolls the parchment of signatures up, ties it with a black, silk ribbon, and tucks it away into one of [ara.his] cases. <i>“I have another reward for you. Less valuable, perhaps, than the one I already gave you, but of a more personal nature. Until then...”</i>");
				output("\n\n[ara.He] grasps your hand tightly in all four of [ara.his] and then turns away, to be quickly surrounded by [ara.his] submissives and other quadommes eager to get a word in with [ara.him].");
				output("\n\nThere’s not much left to do except leave this strange old city behind, and travel back up to the surface.");
				
				addButton(0, "Next", bothriocQuestSummitEnd);
			}
			else
			{
				output("<i>“I never thought it would be this straightforward,”</i> says Ara to you a little while later. [ara.He] " + ara.mfn("is", "is", "are") + " sat back on a camp chair, admiring the long list of bothrioc names, all the while two of [ara.his] harem purposefully tongue-polish [ara.his] long, black boots. <i>“There is so much still left to be done - I shall truly believe in the farlanders’ laws when they are fairly applied to us - but this day, I have no shame in telling you, I dreaded. I thought the greater probability lay in them rejecting me.”</i> [ara.He] smile" + ara.mfn("s", "s", "") + " at you hugely, genuine joy illuminating the diplomat’s pale face. <i>“I could not have done it without you and, ah, the ‘magic’ you cast on our mutual friend. Thank you, from the bottom of my hearts.”</i>");
				output("\n\n[ara.He] rise" + ara.mfn("s", "s", "") + ", and with a few murmurs and strokes directs [ara.his] haremlings to start packing up.");
				output("\n\n<i>“The path has ended in a clearing both triumphant and beautiful for you, Steele,”</i> the quadomme diplomat says, a small, teasing smile playing on [ara.his] lips. <i>“You played your part brilliantly. When it comes time for me to document how all this came to be, your name shall be the first written. You shall be held up as an example of how a submissive may achieve feats that outstrip the proudest of dominants.”</i> [ara.He] clap" + ara.mfn("s", "s", "") + " [ara.his] hands, and those pidemme laden with boxes of books heft them up; those with spears come sharply to attention. <i>“There’s someone waiting for you, on the other side of the city I believe. I wouldn’t keep her waiting. Farewell, little one.”</i>");
				
				addButton(0, "Next", bothriocQuestSummit, ["summit 2", addiction]);
			}
			processTime(9);
			flags["BOTHRIOC_QUEST"] = BOTHRIOC_QUEST_SUCCESS;
			flags["BOTHRIOC_QUEST_SUMMIT_DATE"] = GetGameTimestamp();
			break;
		case "summit 2":
			output("Your heart flutters. Well, you did agree... regardless of how the summit turned out. Slowly, you [pc.move] out of the amphitheatre, going in the opposite direction to Ara Kei. You trundle through the crumbling ruins of Karachnarum, following the many stiletto tracks in the dust until you find a gaping tunnel entrance.");
			output("\n\n<i>“Nice how that all worked out, isn’t it?”</i> Fei An Strozo stalks out from the shadows, one deliberate tap of a chitinous boot at a time, smiling at you hungrily. <i>“Kneel.”</i>");
			output("\n\nShivering slightly you do, watching the great red-and-brown bulk of the thick quadomme looming over you.");
			output("\n\n<i>“Ara Kei believes that today is [ara.his] day, and I will let [ara.him] believe that - for now.”</i> She places a single finger on your scalp, and traces a circle there, back and forth, a mesmeric motion on the top of your head. <i>“But really, I came away with the greatest prize. The farlander catspaw that shall be talked about for generations to come became mine, completing my beautiful, delicious collection. Truly, I am the greatest bothrioc in existence! Isn’t that so?”</i>");
			output("\n\n<i>“Yes... egg-giver,”</i> you whisper.");
			output("\n\n<i>“Good.”</i> A gleaming russet boot is presented to your face. <i>“This has been a dusty day. Give them the shine they deserve. I have lightened my load amongst my other servants already, but if you turn out to be a quick learner and beg sweetly enough, who knows...?”</i>");
			
			processTime(3);
			
			// Go to Bad End
			addButton(0, "Next", bothriocQuestBadEnd);
			break;
	}
}
// If PC did not join Fei’s harem, regardless of outcome place them in The Embassy square after summit is finished + 6 hours
public function bothriocQuestSummitEnd():void
{
	processTime(6 * 59);
	currentLocation = "603";
	mainGameMenu();
}

// Part 4: Resolutions and Bad Ends

public function bothriocQuestEmbassyBlurbs():void
{
	// Genuine Used, Did Not Join Harem
	if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_SUCCESS)
	{
		// > 60 hours since summit, has been inside
		if(flags["BOTHRIOC_EMBASSY_ENTERED"] >= 2)
		{
			output(" To the south are the offices of the Bothrioc Embassy.");
		}
		// Revised “The Embassy” blurb, < 60 hours since summit
		else if(flags["BOTHRIOC_QUEST_SUMMIT_DATE"] != undefined && (GetGameTimestamp() - flags["BOTHRIOC_QUEST_SUMMIT_DATE"]) < 3600)
		{
			output("\n\nThe lights are on in the Bothrioc Embassy, but the door is locked shut. There’s still muffled sounds of activity in there, though. Perhaps you could come back later.");
			setNavDisabled(NAV_SOUTH_DISABLE);
		}
		// > 60 hours since summit, not been inside
		else
		{
			output("\n\nTo the south is the Bothrioc Embassy, which once again has its doors thrown open.");
		}
	}
	// Phoney Used, Did Not Join Harem
	if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_FAILURE)
	{
		// > 60 hours since summit, has been inside
		if(flags["BOTHRIOC_EMBASSY_ENTERED"] >= 2)
		{
			output("\n\nThere’s plenty going on in the new Federation nyrea subdivision bureau to the south, but the two burly nyrea-myr hybrid guards posted by the doors are making it pretty clear that alien visitors are not welcome.");
			setNavDisabled(NAV_SOUTH_DISABLE);
		}
		// Revised “The Embassy” blurb, < 60 hours since summit
		else if(flags["BOTHRIOC_QUEST_SUMMIT_DATE"] != undefined && (GetGameTimestamp() - flags["BOTHRIOC_QUEST_SUMMIT_DATE"]) < 3600)
		{
			output("\n\nThe lights are on in the Bothrioc Embassy, but the door is locked shut. There’s still muffled sounds of activity in there, but evidently visitors are no longer welcome.");
			setNavDisabled(NAV_SOUTH_DISABLE);
		}
		// > 60 hours since summit, not been inside
		else
		{
			output("\n\nThe doors to the Bothrioc Embassy are open. Nyrea and nyrea-myr hybrids dressed in Federation uniforms are striding in and out of it. One of them is engaged in carefully scraping ‘Bothrioc Embassy’ off the glass.");
		}
	}
}
public function bothriocEmbassyPostSummitFunc():Boolean
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	if(flags["BOTHRIOC_EMBASSY_ENTERED"] < 2) flags["BOTHRIOC_EMBASSY_ENTERED"] = 2;
	
	// Genuine Used, Did Not Join Harem
	if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_SUCCESS)
	{
		output("The Bothrioc Embassy is still the hive of tar-black and snow-white activity it always was, but it’s changed substantially since you first set foot in it. It has sprawled outwards, claiming other disused offices, within which you can see other quadommes ordering their subordinates around tables heaving with paper and tablet devices.");
		output("\n\nIn the main office, two vast holo-screens have been erected on the far wall, upon which news from U.G.C. outlets and scout reports from the Deep Caves and Federation territory scroll. Clutching holo-screens, several pidemme subs are deep in discussion with grim-faced kui-tan and gold myr officials near the door. In the centre is the eight-limbed pivot around which all this revolves, Ara Kei Enya. Directing, inspecting, elucidating apparently to four different people at once, [ara.he] " + ara.mfn("hasn’t", "hasn’t", "haven’t") + " noticed your arrival yet.");
		
		addButton(0, "Ara Kei", approachAraKei);
		addButton(1, "Charles", approachCharles, undefined, "Charles", "The russet-haired human seems to be the only one here who isn’t under Ara Kei’s spell.");
		
		return false;
	}
	// Phoney Used, Did Not Join Harem
	if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_FAILURE)
	{
		showBust("NYREA_OFFICER");
		showName("NYREA\nOFFICER");
		
		output("<i>“What do you want?”</i> snaps the nyrea commanding officer inside. <i>“These are the offices of the Federation military attaché, nyrea subdivision. We’re just getting set up here, and we don’t need civvies wandering around and getting in the way. Bothrioc? They cleared out a while ago. Creepy fuckers chartered a freighter to the stars, I hear. Anything else? Good. Kindly fuck off.”</i>");
		
		// Remove square
		currentLocation = "603";
		flags["BOTHRIOC_QUEST_SUMMIT_DATE"] = undefined;
		flags["BOTHRIOC_QUEST_COMPLETE"] = 1;
		
		processTime(1);
		
		addButton(0, "Next", mainGameMenu);
		
		return true;
	}
	return false;
}

// Ara Kei
public function bothriocQuestApproachAraKei():void
{
	clearOutput();
	showAraKei();
	
	IncrementFlag("MET_ARAKEI");
	
	// Ara Kei First
	output("<i>“Steele!”</i>");
	output("\n\nAra Kei instantly switches [ara.his] attention to you and clacks across, leaving [ara.his] four submissives looking softly confused, the moment [ara.he] notice" + ara.mfn("s", "s", "") + " you.");
	if(bothriocAddiction() < 50)
	{
		output("\n\n<i>“The returning hero. Do you like what you see?”</i> [ara.he] spread" + ara.mfn("s", "s", "") + " [ara.his] arms out to indicate the sprawling bustle around [ara.him], smiling grandly as [ara.he] do" + ara.mfn("es", "es", "") + ". <i>“Such are the resources warranted for a fully recognized sapient species within the U.G.C.’s jurisdiction. Such are the resources necessary to run a fledgling government.”</i> You don’t think you’ve ever heard that last word uttered with such relish.");
		output("\n\n<i>“You’ve managed to get sapient status, then?”</i> you ask.");
		output("\n\n<i>“Provisional.”</i> Ara places every syllable with a point of a finger. <i>“Provisional status. The gold myr aren’t happy about it, and are refusing to allow us to enter into any negotiations with the U.G.C. diplomat corps. But, ah, this is diplomacy! This is the endless back-and-forth of negotiations, from which compromise, that word which we all spit upon but from which all good things must flow, can be fashioned from.”</i> [ara.He] clasp" + ara.mfn("s", "s", "") + " all of [ara.his] hands together. <i>“We have our toe in the door. I shall ensure that it will become a foot, a leg, a shoulder, until we are fully sat at the table of Myrellion’s government, and it will be as if we were always there.”</i>");
		output("\n\nAs the quadomme has orated, a pidemme has trotted up, carrying a long, lacquer case. Blushing and barely able to meet your eye, they hand it to you and quickly hurry off.");
		output("\n\n<i>“I did tell you that any material reward I gave you would be symbolic,”</i> Ara says, as you open it. The blade lying on the felt inside is obsidian black, long and thin as a rapier, with a small organic jag near the hilt which curls around the handle to form a nest-like guard.");
		output("\n\n<i>“I discovered it when I first explored Karachnarum, eight years ago.”</i> The squatting quadomme watches as you draw the rapier and carefully brandish it. It’s marvelously light, yet viciously pointed - and you can’t help but feel an incredibly dashing, ravishing air enveloping you as you swing it this way and that. <i>“After much testing and researching, I am all but certain it is Widow’s Kiss, the blade of Prince-Queen Shar Lot Ebb, Karachnarum’s forgotten ruler. May you wield it with the honor they once did - and remember always that history is written by the victor.”</i>");
		output("\n\nAra watches as you put the blade back in its case, smiling faintly.");
		output("\n\n<i>“There is much for me to do, Steele, but I always have time for you. Is there anything else you’d like to talk about?”</i>");
	}
	else
	{
		output("\n\nThe strength departs your [pc.legs] as [ara.he] approach" + ara.mfn("es", "es", "") + ", larger and larger in your eyes, and you sink downwards into subservient bliss.");
		output("\n\n<i>“The returning hero. You like what you see, don’t you, little one?”</i> [ara.He] spread" + ara.mfn("s", "s", "") + " [ara.his] arms out to indicate the sprawling bustle around [ara.him], smiling grandly as [ara.he] do" + ara.mfn("es", "es", "") + ". <i>“Such are the resources warranted for a fully recognized sapient species within the U.G.C.’s jurisdiction. Such are the resources necessary to run a fledgling government.”</i> You don’t think you’ve ever seen that last word uttered with such relish. You feel a giddy elation about it too, coursing into you from the dominant’s own belief. Government! Hurray! Egg stuffings for everyone!");
		output("\n\n<i>“You’ve managed to get sapient status then, " + ara.mfn("sir", "mistress", "egg-giver") + "?”</i> you ask.");
		output("\n\n<i>“Provisional.”</i> Ara places a finger on your crown, pushing downwards so you’re staring at her boots. <i>“Provisional status. The gold myr aren’t happy about it, and are refusing to allow us to enter into any negotiations with the U.G.C. diplomat corps. But, ah, this is diplomacy! This is the endless back-and-forth of negotiations, from which compromise, that word which we all spit upon but from which all good things must flow, can be fashioned from.”</i> [ara.He] clasp" + ara.mfn("s", "s", "") + " all of [ara.his] hands together. <i>“We have our toe in the door. I shall ensure that it will become a foot, a leg, a shoulder, until we are fully sat at the table of Myrellion’s government, and it will be as if we were always there.”</i>");
		output("\n\nAs the quadomme has orated, a pidemme has trotted up, carrying a long, lacquer case. Blushing and barely able to meet your eye, they hand it to you and quickly hurry off.");
		output("\n\n<i>“Of course, you already have all the reward you will ever need. But a symbolic reward is necessary, yes,”</i> Ara goes on, as you open it. The blade lying on the felt inside is obsidian black, long and thin as a rapier, with a small organic jag near the hilt which curls around the handle to form a nest-like guard.");
		output("\n\n<i>“I discovered it when I first explored Karachnarum, eight years ago.”</i> The squatting quadomme watches as you draw the rapier and carefully brandish it. It’s marvelously light, yet viciously pointed - and you can’t help but feel an incredibly dashing, ravishing air enveloping you as you swing it this way and that. <i>“After much testing and exploring, I am all but certain it is Widow’s Kiss, the blade of Prince Queen Shar Lot Ebb, Karachnarum’s forgotten ruler. May you wield it with the honor they once did - and remember always that history is written by the victor.”</i>");
		output("\n\nAra watches as you put the blade back in its case, smiling faintly.");
		output("\n\n<i>“There is much for me to do, little one, but I always have time for you. Is there anything else you’d like to talk about?”</i>");
	}
	output("\n\n");
	
	processTime(3);
	
	flags["BOTHRIOC_QUEST_SUMMIT_DATE"] = undefined;
	flags["BOTHRIOC_QUEST_COMPLETE"] = 1;
	
	quickLoot(new WidowsKiss());
}
// Revised Talk Scenes
public function bothriocQuestTalkBlurbs(topic:String):void
{
	switch(topic)
	{
		case "bothrioc":
			output("<i>“I’m afraid I simply haven’t the time to explain every intricacy of our species, but I can certainly outline some very important things to bear in mind. Now...”</i> one of Ara Kei’s fingers taps a chin in thought. <i>“Where to start...”</i>");
			output("\n\n<i>“We used to be the boogiemen of this planet. Before the myr really got going; before they became boogiemen unto themselves. To this day though, when a myr mother wants her rebellious spawn to behave, she threatens that the bothrioc will take her away and keep her in a harem, stuffed full of children that aren’t hers.”</i>");
			output("\n\n[ara.He] laugh" + ara.mfn("s", "s", "") + " when [ara.he] catch" + ara.mfn("es", "es", "") + " your expression. [ara.He] display" + ara.mfn("s", "s", "") + " a lot of teeth when [ara.he] " + ara.mfn("does", "does", "do") + " that.");
			output("\n\n<i>“Effective, isn’t it? Don’t worry, I’m not going to fill your head with lies, nor stuff your belly with spawn. Our reproductive system is unique though, and I readily admit is an easy source of fascination and revulsion.”</i> The four-legged bothrioc makes a sweeping gesture that takes in everyone in the embassy. <i>“As you can see, we all have an abdomen at the base of our torso. That is the ovipositor. It creates eggs and a fertilizing oil. We exchange the oil to fertilize eggs, and then plant the eggs in another’s orifices using the tube. Usually this is an intra-bothrioc matter, but we’re quite capable of both implanting in and being fertilized by others. That is where the fear and fascination a boogieman needs is sourced.”</i>");
			output("\n\nAra Kei coos down at the dutiful harem member still polishing [ara.his] leg chitin to a gleaming shine, pointing out a few spots that need special attention. <i>“We can put life in barren soil, but to the other species, that life is alien. We can be a mother where mothers are slim, and a father where the inverse is true. However, because it doesn’t have their genes and their eggs it is somehow not theirs when they bear it. There would probably be a strong tendency to abandon our young if not for the other little peculiarity of our breeding.”</i>");
			output("\n\nThe ginger human busily eroding a mountain of paperwork into a hill gives a long drooping whistle from across the room, of the <i>“here comes the big one”</i> variety. The look Ara Kei gives him is nothing short of venomous, and all the more backed up by the incredible chitinous physiology on display.");
			output("\n\n<i>“Thank you, Charles, your commentary is appreciated.”</i>");
			break;
		case "bothrioc ii":
			output("<i>“Yes,”</i> sighs Ara Kei theatrically, <i>“this is what has us classed by your thinking machines as not merely dangerous, but to be avoided at all costs. Our fertilizing slime has a variety of hormones in it. They serve to signal a bothrioc in submission that their time as a dominant is through. Their abdomens begin to swell more with fertile oil than eggs, that we may bathe larger batches of eggs in it, before depositing them. In species with biological sexes, it is feminizing, as the trigger to change to fertilization production is the same hormone mixture that turns girls into women. The real prize, however, is that it brings them to love their role as an incubator and to be naturally led by the dominant partners. It also tends to make them a bit absent-minded. If you watch closely, it takes my lovely harem here a good deal of concentration to handle all of this paperwork.”</i>");
			output("\n\nAt [ara.his] invitation, you take in the harem a bit more closely. Charles is sharp and on tack, but the bothrioc around the place are, while certainly seemingly competent, also working very hard to be. One bothrioc is filling out forms with a tongue stuck out and their face inches from the paper, contorted in concentration. Another, seeming lost in thought, is gently pulled toward a back room while another is brought in to take their place. Ara Kei regards [ara.his] harem warmly.");
			output("\n\n<i>“You see, the impression is that our oil makes you stupid. No, that is not the case. Rather, your priorities are reoriented, and between our love and our oil, you come to love your new place in life, to the point of excluding most other cares or concerns. My darlings are working so hard because this is important to me, and they wouldn’t be motivated by anything less.”</i> This last statement is accompanied by an encompassing gesture of [ara.his] arms.");
			output("\n\nTurning [ara.his] gaze once more to you, Ara Kei adds, <i>“And that is what you are told to fear. You see me before you, and I don’t attack you, or try to deceive you. However, the rules in the caverns we call home are not the ones I have embraced here, in order to state our case. Down there, the pidemmes and quadommes still consider any wanderer fair game. Consider that the real warning.”</i>");
			break;
		case "ambassador":
			output("<i>“What exactly are you aiming to achieve up here?”</i> you ask. Ara Kei gazes at you silently for a few moments.");
			output("\n\n<i>“Perhaps you do not know?”</i> [ara.he] say" + ara.mfn("s", "s", "") + ", seemingly mostly to [ara.himself]. <i>“Yes, likely. Something always taken for granted... well, who are we to judge such an attitude, after all.”</i>");
			output("\n\n<i>“It is both straightforward and very complicated, Steele,”</i> [ara.he] " + ara.mfn("goes", "goes", "go") + " on in louder tones. <i>“When your U.G.C. first stepped down from the stars to greet us, I was at first elated, and not just because they postponed the myr destroying the world. Here, at last, was an opportunity to get my race equal representation on Myrellion - to speak for our needs and wishes, instead of living forever in helpless fear of what the myr might do next. For surely if I presented our plight to these enlightened beings, they would help us?”</i>");
			output("\n\nAra Kei’s long, elegant face twists wryly.");
			output("\n\n<i>“Alas. It turns out aliens are turned just as cruel by bureaucracy and ulterior motive as the myr are. Did you know that your U.G.C’s legal protections for planetary sovereignty doesn’t merely require sapience? Merely existing and thinking do not satisfy the requirements for citizenship in this galaxy; it also requires a demonstration that the species has contributed meaningfully to the planet, through cultural or technological innovation. They tell me this clause exists to prevent warlike and savage species from being uplifted before they are capable of integration. From my brief exposure to this Xenogen organization and their fur-thing friends, however, I suspect the </i>real<i> reason is that it allows for the casual exploitation of races who are helpless to resist. Is that an unfair assumption to make, starwalker?”</i>");
			output("\n\nYou shrug uncomfortably. Ara Kei sighs, absently ruffling the hair of the haremling dutifully polishing [ara.his] chitin.");
			output("\n\n<i>“Unfortunately, the bothrioc’s very nature means we have extremely little to show for our long history, and the myr leadership will not hesitate to see us bereft of those protections. Therefore, I am the ambassador for my people out of a necessity of which most aren’t even aware. Many of them are now aware, which helps... but we are still a tiny minority. The great work still exists.”</i>");
			output("\n\n[ara.He] smile" + ara.mfn("s", "s", "") + " down lovingly.");
			output("\n\n<i>“At least my little ones support my endeavours, even if most of the rest of the species is too ill-informed.”</i>");
			break;
		case "history":
			output("<i>“History? You ask for history from a species with no written records, no architecture, only the technology required to trap, eat and breed?”</i> Ara Kei sneers in apparent disbelief - however, the way [ara.his] eight limbs tremble slightly with restless energy telegraph " + ara.mfn("he’s", "she’s", "they’re") + " pleased you’ve brought this topic up.");
			output("\n\n<i>“We have history, Steele, but not as you understand it. Imagine that the only unspoken descriptions that existed of you were written by someone else - someone who was at best ambivalent to you, at worst an enemy.”</i> [ara.He] watch" + ara.mfn("es", "es", "") + " your expression closely with those big, black eyes of " + ara.mfn("his", "hers", "theirs") + ". <i>“Yes, there is someone, isn’t there? Not such a pleasant thought, is it. That is why I am here - to fight against my race being a scribbled footnote in somebody else’s tragedy. In order to apply for legal protection within the U.G.C.”</i>");
			output("\n\nA gleaming black arm is swept at the rows of bothrioc busying themselves over the books and reams of paper that are piled on the tables all around.");
			output("\n\n<i>“Even before the farlanders arrived, I - that is to say, me and my harem - collected and scoured the records of both sets of myr, tracking down every single mention of our race that we could find. It has been fascinating - and incredibly frustrating.”</i> A single index finger is pointed downwards. With a sigh of pleasure, the tongue polisher envelopes it in their mouth. Ara Kei’s attention and fervency are entirely directed at you. <i>“It is like a single bright thread woven into a vast garment, constantly disappearing from sight, reappearing where you wouldn’t expect - but definitively there. We had empires, you know. Bothrioc sometimes stood at the head of red myr armies. Some legends even had them as kings to gold myr queens. But it’s all so vague, so often contradictory, because of course the myr do not often waste print talking about us. WE are not THEY. Ah!”</i>");
			output("\n\nThere is a distinct, wet “pop”, and the submissive looks vaguely confused as all four of Ara Kei’s hands go up into the air, giving voice to pure exasperation.");
			output("\n\n<i>“My people! So assured that they would forever be the top pods on Myrellion that they never even noticed the myr building, and developing, and growing, until their factories and palaces were being built right on top of them. Now the myr are bent on destroying the world, a world that we happen to be on, but have no say in the running of. I will not have it, Steele.”</i> [ara.He] wag" + ara.mfn("s", "s", "") + " a stern, spit-polished finger at you, as if you had disagreed. <i>“The work I am doing here will prove the bothrioc are a distinct culture - one that deserves to be recognized and given a say in how this planet is developed. We shall not wallow in ignorance and shy away from the light, as the wetraxxal and the ganrael do; nor shall we bend our knees to the Federation, as some of the nyrea have chosen. We shall come to the galactic table on our own terms, as a result of our own hard work, with our heads held high!”</i>");
			output("\n\n<i>“Or at least some of us will,”</i> [ara.he] amend" + ara.mfn("s", "s", "") + ", gazing at the hive of activity around [ara.him] serenely. <i>“Some of us will come kissing the ground upon which the others walk. But you get the idea.”</i>");
			break;
		case "other bothrioc":
			output("<i>“How is working with the other dominants going?”</i> you ask.");
			output("\n\n<i>“I have had more of your magic potion produced,”</i> Ara says. [ara.He] point" + ara.mfn("s", "s", "") + " to a table near the back cluttered with blue spray bottles. <i>“At great expense it must be said, but it is absolutely necessary for our conferences to take place. It is a boon to our race that would have been unimaginable a few years ago. We attract more and more quadommes to those meetings just so they can see it in action. My chymerist friend tells me that it should, one day, be synthesized as a single inoculation, so that one day me and mine will not have to treat each other as allergies. I long for that day, frankly.”</i>");
			output("\n\n[ara.He] pauses, lost in thought, tapping [ara.his] long chin.");
			output("\n\n<i>“It’s like learning a new language. Talking to each other, I mean, deciding how we will govern this ridiculous, fledgling nation of ours,”</i> [ara.he] carr" + ara.mfn("ies", "ies", "y") + " on at last. <i>“It still all feels like a game, as if we’re just pretending to be calm and rational so that we are better positioned to off each other and have all the submissives to ourselves. I’m sure some of them <i>do</i> think like that. But... they also know that they stand to lose so much more by not behaving and playing the game. It’s odd, a duality of thought.”</i>");
			output("\n\n<i>“Are you having any problems with Fei?”</i>");
			output("\n\n<i>“Problems?”</i> Ara laughs, a single, falling note of loving ridicule. <i>“No, she’s very enjoyable. She was born for this - the power-plays, the drama, the flouncing around in all those costumes she’s having her harem make. What a terrible shame it would have been if she had been born in a different era! No, for all of her innuendo, interruptions and intrigue, she knows she stands to lose the most out of all of us if our government fails - an audience to act out in front of. Just wait until she starts getting farlander attention! I regard her as this operation’s greatest asset.”</i>");
			break;
	}
}

// Charles
// First only, reverts to standard greets/talks after
public function bothriocQuestApproachCharles():void
{
	clearOutput();
	showCharles();
	
	output("<i>“The state of this,”</i> Charles says, indicating the heaving offices around him with an exaggeratedly exasperated sweep of his arm. <i>“I cannae barely get desk room anymore! Seriously though, mate...”</i> He seems lost for words for a moment, and then stands up and offers you a rough handshake. <i>“Bloody impressive work doon there. Yeh’ve given this mob more’n a chance of standing up for themselves, and not windin’ up with no rights and gettin’ farmed by some rat-arse corporation like Xenogen. Once ah’m done here, the stuff I learned here will help me help lots more races around the Frontier just like the bothrioc.”</i>");
	if(bothriocAddiction() < 50)
	{
		output("\n\n<i>“Do you think it’s safe to uplift races like the bothrioc?”</i> you ask. <i>“You’re not exactly keen on their addictive fluids, are you?”</i>");
		output("\n\n<i>“We helped ‘em without becomin’ enthralled to ‘em, didn’t we?”</i> the human replies with a shrug. <i>“And Ara treated you as an equal, never forced you to do anythin’. She’ll remember that - they all will. They’re gonny have tae do a lot of adaptin’ to make their way in the galaxy, but they’re already doin’ that. Call me a bleedin’ optimist, Steele. As long as this planet doesn’t get nooked in the near future, I think they’ll be fine.”</i>");
	}
	else
	{
		output("\n\nHe fiddles with his pencil for a few moments.");
		output("\n\n<i>“I owe you an apology to be honest, Steele,”</i> he says at last. <i>“I read you the riot act about the bothrioc when we first met, aboot how you’d lose your will and ability to do anythin’ if you got addicted to ‘em... and then you went ahead and got in deep with ‘em, and did far more for ‘em than I ever have. I was wrong to think you’d be a mindless slave for fallin’ in love with ‘em.”</i>");
		output("\n\n<i>“Have you thought about doing it yourself?”</i> you ask, smiling softly. <i>“It’s really nice, you know.”</i>");
		output("\n\n<i>“Eeemmmmm, no,”</i> Charles says with a nervous laugh. <i>“As said, I’d like to head on after this and help other newly discovered races, so gettin’ too involved with this lot is a bad idea. I’ll remember you whenever someone says we shouldn’t be upliftin’ races like the bothrioc, though. You’re proof they aren’t crull slave-takers, or that their submissives are incapable and mindless.”</i>");
	}
	output("\n\n");
	
	flags["MET_CHARLES"] = 2;
	
	processTime(2 + rand(3));
	
	clearMenu();
	addButton(0, "Next", talkCharlesMenu);
}

// Genealogy
// Add [Bothrioc] option to talk menu after mission is complete AND PC came to him rather than (other doctor). Add [Genealogy] to main menu after mission is complete if else
public function bothriocQuestGenealogyButton(btnSlot:int = 0, doctor:String = ""):void
{
	if(flags["BOTHRIOC_QUEST_GENEALOGY"] != undefined) return;
	if(!pc.hasKeyItem("Bothrioc Genealogy")) return;
	if(flags["BOTHRIOC_QUEST_DOCTOR"] == undefined) return;
	
	switch(doctor)
	{
		case "Lessau":
			if(pc.keyItemv1("Bothrioc Genealogy") == 0 && flags["BOTHRIOC_QUEST_DOCTOR"] == doctor) addButton(btnSlot, "Bothrioc", bothriocQuestGenealogy, "Lessau bothrioc", "Bothrioc", "Talk to him about how your dealings with the Myrellion androgynes worked out.");
			else if(pc.keyItemv1("Bothrioc Genealogy") > 0) addButton(btnSlot, "Genealogy", bothriocQuestGenealogy, "Lessau genealogy", "Genealogy", "Give him the bothrioc genealogy that Ara rewarded you with.");
			break;
		case "Haswell":
			if(pc.keyItemv1("Bothrioc Genealogy") == 0 && flags["BOTHRIOC_QUEST_DOCTOR"] == doctor) addButton(btnSlot, "Bothrioc", bothriocQuestGenealogy, "Haswell bothrioc", "Bothrioc", "Talk to him about the outcome of your mission on Myrellion.");
			else if(pc.keyItemv1("Bothrioc Genealogy") > 0) addButton(btnSlot, "Genealogy", bothriocQuestGenealogy, "Haswell genealogy", "Genealogy", "Give him the bothrioc genealogy that Ara rewarded you with.");
			break;
	}
	
	if(pc.keyItemv1("Bothrioc Genealogy") > 0) output("\n\nDo you give him the bothrioc geneology?");
}
public function bothriocQuestGenealogy(response:String):void
{
	clearOutput();
	clearMenu();
	
	switch(response)
	{
		case "Lessau bothrioc":
			showLessau();
			
			output("<i>“Oh yes?”</i> The chimeral doctor stiffens, knits all of his hands on the desk. <i>“And what did you decide to do? Tell me everything.”</i>");
			// If Genuine Used
			if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_SUCCESS)
			{
				output("\n\nYou tell him that ultimately you decided tricking the bothrioc was cruel, as was denying them sapient rights. You used the genuine counteragent, and the summit was a huge success.");
				output("\n\n<i>“I always knew you’d do that,”</i> Lessau sighs. <i>“You Steeles have always been ruled by your heart");
				if(bothriocAddiction() >= 50) output(" - and that was before you became chemically addicted to these creatures");
				output(". But - I gave the choice to you, so that my conscience is clear. And I am glad that a race of aliens you’ve obviously gained an affection for have achieved the beginnings of manifest destiny. And, well, the galaxy is a big and durable place. I’m sure it can take them - just like it took the dzaan. Speaking of which: did you happen to get a larger sample of their genetic material?”</i>");
			}
			// If Phoney Used
			if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_FAILURE)
			{
				output("\n\nYou tell him that ultimately you decided that he was right, the bothrioc are too dangerous to be allowed into the wider galaxy, for now at least. You used the temporary counteragent and it worked as advertised - the dominant bothrioc were incapable of reaching an agreement and it all fell apart.");
				output("\n\n<i>“Ok. Thank you for trusting my judgment, Steele,”</i> says a palpably relieved Lessau. <i>“You know we weren’t doing them any harm by not enabling them in this way, right? Just keeping things the way they are until things on Myrellion have calmed down, and perhaps the galaxy is better prepared to welcome such addictive, mind-warping creatures. Speaking of which: did you happen to get a larger sample of their genetic material?”</i>");
			}
			
			processTime(3);
			
			addButton(0, "Give", bothriocQuestGenealogy, "Lessau give", "Give Genealogy", "Give the doctor the sample.");
			addButton(1, "Don’t", bothriocQuestGenealogy, "Lessau don't", "Don’t", "Don’t give the doctor the sample.");
			break;
		case "Lessau give":
			showLessau();
			
			output("You hand over the big, gloopy jar of purple blood, as well as Ara’s studywork.");
			output("\n\n<i>“Oh, this is more than I could have hoped for!”</i> Lessau flicks through the heavy tome, feline eyes alive with interest. <i>“This’ll put our paleontology and biology team miles ahead of the competition, if we sent them to Myrellion. I’ll get onto HQ about it right away. And 40 individuals, you say? Yes, that’ll absolutely be enough. With this we should be able to create many interesting gene-mod prototypes, as well as sorting out a proper counteragent to bothrioc pheromones.”</i>");
			output("\n\nHe reaches across and grasps your hand, shaking it enthusiastically.");
			// If Genuine Used
			if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_SUCCESS)
			{
				output("\n\n<i>“You’ve done Steele Tech a huge service this day, [pc.name]. You are more empathetic than I, but haven’t acted at all carelessly. Please forgive the grumpiness of a fretting, office-bound chimera.”</i>");
			}
			// If Phoney Used
			if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_FAILURE)
			{
				output("\n\n<i>“You’ve done Steele Tech a huge service this day, [pc.name] - and done it through clear-headed, rational thinking. It’s a privilege to work for someone like you.”</i>");
			}
			output("\n\nHe slithers off to store the blood sample in a refrigerated unit, returning a few moments later.");
			output("\n\n<i>“Now - was there anything else you came to Uveto for?”</i>");
			
			processTime(2);
			
			// Return to main menu, remove Genealogy. Add flag for some sort of boost to ST for the future I guess
			output("\n\n<b>Lessau has been given the Bothrioc Genealogy.</b>");
			pc.removeKeyItem("Bothrioc Genealogy");
			flags["BOTHRIOC_QUEST_GENEALOGY"] = "Lessau";
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "Lessau don't":
			showLessau();
			
			output("You decide to hold onto the sample for now. You doubt Lessau will pay for it, since he did the work on the counteragent for free, after all.");
			// If Genuine Used
			if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_SUCCESS)
			{
				output("\n\n<i>“So we don’t even have an opportunity to create a proper counteragent to these beings’ pheromones?,”</i> he sighs, shaking his head. <i>“Honestly Steele, there are consequences for your rampages across the stars, even if we won’t see them for many years yet. Try and think a bit more before you get involved in these sorts of things, won’t you? Anyway. Was there any other reason you came to Uveto?”</i>");
			}
			// If Phoney Used
			if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_FAILURE)
			{
				output("\n\n<i>“Oh well,”</i> he says, when you tell him you weren’t able to get it. <i>“I suppose it’s not as important as it was, since they aren’t going to be affecting people outside their own planet any time soon. Never mind, Steele - the important thing is you thought rationally about this, and did the right thing. Kudos. Was there any other reason you came to Uveto?”</i>");
			}
			
			processTime(1);
			
			// Return to main menu, add [Genealogy] to main menu
			pc.setKeyItemValue("Bothrioc Genealogy", 1, 1);
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "Lessau genealogy":
			showLessau();
			
			// If Haswell created the counteragent
			if(flags["BOTHRIOC_QUEST_DOCTOR"] == "Haswell")
			{
				output("<i>“And these creatures are native to Myrellion, you say? Naturally asexual? Fascinating. Fascinating!”</i> Lessau’s eyes are alive as he flicks through Ara’s studywork. <i>“This’ll put our paleontology and biology team miles ahead of the competition, if we sent them to Myrellion. I’ll get onto HQ about it right away. And 40 individuals are represented in this sample? Yes, that’ll absolutely be enough. With this we should be able to create many interesting gene-mod prototypes, as well as sorting out a counteragent to these bothrioc’s, hmm, unique pheromones.”</i>");
				output("\n\nHe reaches across and grasps your hand, shaking it enthusiastically.");
				output("\n\n<i>“You’ve done Steele Tech a huge service this day, [pc.name]. We should be able to do many interesting things with this. Kudos!”</i>");
				output("\n\nHe slithers off to store the blood sample in a refrigerated unit, returning a few moments later.");
				output("\n\n<i>“Now - was there anything else you came to Uveto for?”</i>");
			}
			// If Lessau created the counteragent
			if(flags["BOTHRIOC_QUEST_DOCTOR"] == "Lessau")
			{
				output("<i>“Ah, so you managed to put together a sample after all?”</i>");
				output("\n\nLessau flicks through Ara’s studywork, feline eyes alive with interest.");
				output("\n\n<i>“Oh, this is even more than I hoped for. It’ll put our paleontology and biology team miles ahead of the competition, if we sent them to Myrellion. I’ll get onto HQ about it right away. And 40 individuals are represented in this sample? Yes, that’ll absolutely be enough. With this we should be able to create many interesting gene-mod prototypes, as well as sorting out a counteragent to the bothrioc’s, hmm, unique pheromones.”</i>");
				output("\n\nHe reaches across and grasps your hand, shaking it enthusiastically.");
				output("\n\n<i>“You’ve done Steele Tech a huge service this day, [pc.name]. We should be able to do many interesting things with this. Kudos!”</i>");
				output("\n\nHe slithers off to store the blood sample in a refrigerated unit, returning a few moments later.");
				output("\n\n<i>“Now - was there anything else you came to Uveto for?”</i>");
			}
			processTime(4);
			
			// Return to main menu, remove Genealogy. Add flag for some sort of boost to ST for the future I guess
			output("\n\n<b>Lessau has been given the Bothrioc Genealogy.</b>");
			pc.removeKeyItem("Bothrioc Genealogy");
			flags["BOTHRIOC_QUEST_GENEALOGY"] = "Lessau";
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "Haswell bothrioc":
			showDrHaswell();
			
			output("<i>“Of course it worked,”</i> Haswell interrupts, frowning as if you just questioned the existence of gravity, as you’re telling him about the success of his counteragent. <i>“I designed it. The important thing is this: did you get a large-scale sample of genetic material off these creatures? I will pay well for it, as I told you.”</i>");
			
			processTime(3);
			
			addButton(0, "Give", bothriocQuestGenealogy, "Haswell give", "Give Genealogy", "Give the doctor the sample.");
			addButton(1, "Don’t", bothriocQuestGenealogy, "Haswell don't", "Don’t", "Don’t give the doctor the sample.");
			break;
		case "Haswell give":
			showDrHaswell();
			
			output("You hand over the big, gloopy jar of purple blood, as well as Ara’s studywork.");
			output("\n\n<i>“Huh! Crude paleontology as well. How droll,”</i> the human remarks, flicking through the well-thumbed journal. <i>“It will be quite the coup for me to study and hand in what my colleagues on Myrellion could not. Thank you, Steele. Allow me to reimburse you.”</i>");
			output("\n\nHe stores the blood sample in a fridge unit and then flicks at his screen once or twice. Your codex purrs in response.");
			output("\n\n<i>“Was there anything else?”</i> Haswell asks coolly.");
			
			processTime(2);
			
			// + 50,000 credits, return to Main Menu
			output("\n\n<b>Haswell has been given the Bothrioc Genealogy and you have been paid 50,000 credits for the exchange.</b>");
			pc.removeKeyItem("Bothrioc Genealogy");
			flags["BOTHRIOC_QUEST_GENEALOGY"] = "Haswell";
			pc.credits += 50000;
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "Haswell don't":
			showDrHaswell();
			
			output("<i>“Then why are you here?”</i> The human flicks a hand at you, annoyed. <i>“I didn’t need verbal confirmation of my scientific prowess from a layperson, thanks all the same. Only bother me about this again if you happen to get that sample.”</i>");
			
			processTime(1);
			
			// Return to main menu, add [Genealogy] to main menu
			pc.setKeyItemValue("Bothrioc Genealogy", 1, 1);
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "Haswell genealogy":
			showDrHaswell();
			
			// If Haswell created the counteragent
			if(flags["BOTHRIOC_QUEST_DOCTOR"] == "Haswell")
			{
				output("You hand over the big, gloopy jar of purple blood, as well as Ara’s studywork.");
				output("\n\n<i>“Huh! Crude paleontology as well. How droll,”</i> the human remarks, flicking through the well-thumbed journal. <i>“It will be quite the coup for me to study and hand in what my colleagues on Myrellion could not. Thank you, Steele. Allow me to reimburse you.”</i>");
				output("\n\nHe stores the blood sample in a fridge unit and then flicks at his screen once or twice. Your codex purrs in response.");
				output("\n\n<i>“Was there anything else?”</i> Haswell asks coolly.");
				
			}
			// If Lessau created the counteragent
			if(flags["BOTHRIOC_QUEST_DOCTOR"] == "Lessau")
			{
				output("<i>“Natives to Myrellion? Naturally asexual, with addictive breeding capabilities? Most intriguing. Yes, this is very much something worth studying - particularly as it seems my colleagues on Myrellion have been very slow off the bat researching these things.”</i>");
				output("\n\nHaswell flicks through Ara’s study-work for a little while, before examining the blood sample under a microscope.");
				output("\n\n<i>“This will be quite the scientific coup. Thank you, Steele. Allow me to reimburse you.”</i>");
				output("\n\nHe flicks at his screen once or twice. Your codex purrs in response.");
				output("\n\n<i>“Was there anything else?”</i> The human asks coolly.");
			}
			processTime(4);
			
			// + 50,000 credits, return to Main Menu
			output("\n\n<b>Haswell has been given the Bothrioc Genealogy and you have been paid 50,000 credits for the exchange.</b>");
			pc.removeKeyItem("Bothrioc Genealogy");
			flags["BOTHRIOC_QUEST_GENEALOGY"] = "Haswell";
			pc.credits += 50000;
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
	author("Nonesuch");
}

// Fei Bad End
public function bothriocQuestBadEnd(page:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	
	switch(page)
	{
		case 0:
			currentLocation = (flags["FEIAN_LOCATION"] != undefined ? flags["FEIAN_LOCATION"] : "GAME OVER");
			generateMap();
			
			showBust(feiAnStrozoBustDisplay());
			showName("JOINING\nTHE HAREM");
			
			var butt:Boolean = (!pc.isPregnant(-1));
			var vList:Array = [];
			var vIdx:int = -1;
			var vIdx2:int = -1;
			var cIdx:int = -1;
			var cIdx2:int = -1;
			
			if(pc.hasVagina())
			{
				if(pc.vaginas.length >= 1 && !pc.isPregnant(0)) vList.push(0);
				if(pc.vaginas.length >= 2 && !pc.isPregnant(1)) vList.push(1);
				if(pc.vaginas.length >= 3 && !pc.isPregnant(2)) vList.push(2);
			}
			if(vList.length > 0) vIdx = vList[0];
			if(vList.length > 1) vIdx2 = vList[(1 + rand(vList.length))];
			if(pc.hasCock())
			{
				cIdx = pc.biggestCockIndex();
				if(pc.cocks.length > 1) cIdx2 = (1 + rand(pc.cocks.length));
			}
			
			output("You join Fei An Strozo’s train as she leads you back all the way her domain.");
			if(bothriocAddiction() < 50) output(" You feel awkward and slightly unreal to begin with - why are you doing this? Why did you agree to this? - but the rest of the harem are so uniformly welcoming and kind, despite their myriad races, that it’s hard to hold onto those tensions and misgivings. You already feel like you’re a friend amongst friends, all dedicated to one all-knowing, all-powerful Mistress, by the time you’re filing slowly down into the green-hued gloom beyond her trapdoor.");
			else output(" They all share with you that wonderful warm, peaceful, erotic glow, a psychic empathy that is difficult to express to anyone else, and it’s as easy as slipping between clean sheets to fall in with them and get along, despite their many different races. You already feel like you’re a lover amongst lovers, all dedicated to one all-knowing, all-powerful Mistress, by the time you’re filing slowly down into the green-hued gloom beyond her trapdoor.");
			output("\n\nFei may be a grandstander, but she does have the prowess to back it up; she’s a masterful dominant, skilled with the four hands she uses to brush along the nape of your neck at the same time as she");
			if(vIdx >= 0) output(" ever-so-slowly dips her long digits into [pc.eachVagina]");
			if(vIdx >= 0 && cIdx >= 0) output(" and");
			if(cIdx >= 0) output(" teases your [pc.cock " + cIdx + "] with come-hither gestures along the underside");
			output(", a tireless, warm empath with a lemony zest for sadism. The thick quadomme breaks you in slowly to life in her harem, giving you easy chores that keep you close to her side that enable you to see how she runs her rambling underground mansion, how her other servants work together - and so she can get " + (feiAnHasCock() ? "her cock sucked" : "her pussy licked") + " by you whenever she likes, something she very quickly develops a taste for.");
			output("\n\n");
			if(bothriocAddiction() < 50)
			{
				output("She breeds you, of course, drawing the oil out of the needy, overflowing abdomens of her pidemmes so she can fertilize batches of eggs to");
				if(butt || vIdx >= 0)
				{
					output(" open up your");
					if(butt) output(" [pc.anus]");
					if(butt && vIdx >= 0) output(" and");
					if(vIdx >= 0) output(" [pc.eachVagina]");
					output(" and");
				}
				output(" swell your belly with. It’s intense to the point of painful at first, but the wonderful, warm, clinging oil you imbibe through your [pc.skin], your mouth and your ass changes things, soothing you, making you feel incredibly mellow, sensuous and eager to please. You begin to crave it, as well as the sensation of carrying and bearing bothrioc young, and soon just the sight of Fei sliding her giant, drooling, purple ovipositor into the open makes you automatically get on your [pc.knees], presenting your ");
				if(vIdx >= 0) output("[pc.vagina " + vIdx + "], ");
				output("[pc.ass] and mouth, whichever she wishes to claim - hopefully");
				if(vIdx < 0) output(" both");
				else output(" all three");
				output(".");
			}
			else
			{
				output("She breeds you, of course, drawing the oil out of the needy, overflowing abdomens of her pidemmes so she can fertilize batches of eggs to");
				if(butt || vIdx >= 0)
				{
					output(" open up your");
					if(butt) output(" [pc.anus]");
					if(butt && vIdx >= 0) output(" and");
					if(vIdx >= 0) output(" [pc.eachVagina]");
					output(" and");
				}
				output(" swell your belly with. If you thought you enjoyed this before, you had no idea what it would be like when the creature doing it to you owned you, utterly, inside and out, and could demand of you anything. Flowers of the most intense ecstasy open when Fei is inside you, standing over you and groaning softly as she squeezes one oval after another into your insides, and soon enough just the sight of her sliding her giant, drooling, purple ovipositor into the open makes you automatically get on your [pc.knees], present your ");
				if(vIdx >= 0) output("[pc.vagina " + vIdx + "], ");
				output("[pc.ass] and mouth, begging sweetly for her to fuck you, fuck you hard.");
			}
			
			var pp:BothriocQuadomme = new BothriocQuadomme();
			pp.createPerk("Fixed CumQ", 5000, 0, 0, 0);
			
			if(pc.hasVagina())
			{
				for(vIdx = 0; vIdx < pc.vaginas.length; vIdx++)
				{
					pc.cuntChange(vIdx, pp.cockVolume(0));
					pc.loadInCunt(pp, vIdx);
				}
			}
			else
			{
				pc.buttChange(pp.cockVolume(0));
				pc.loadInAss(pp);
			}
			
			pc.removeAll();
			processTime(52 * 4);
			
			addButton(0, "Next", bothriocQuestBadEnd, 1);
			break;
		case 1:
			showBust(feiAnStrozoBustDisplay());
			showName("EXTRAVAGANT\nTASTES");
			
			output("Slowly but surely the quadomme introduces you to the more exotic play she saves for her more experienced slaves - binding you up in web and hanging you from the ceiling for days on end with your");
			if(pc.hasVagina()) output(" [pc.vaginas]");
			else if(pc.hasCock()) output(" [pc.cocks]");
			else output(" privates");
			output(" exposed, so she can casually tease it as she passes underneath. Binding your arms and setting you to eat out the boi-pussy of one of her nyrea males, whipping your [pc.ass] if you don’t get him off fast enough, until you’ve learned to do quite incredible things with your [pc.lips] and [pc.tongue]. The " + (feiAnHasCock() ? "penis" : "vagina") + " she’s grown for herself via " + (flags["GAVE_FEIAN_ITEMS"] != undefined ? "your" : "some") + " farlander ‘magic’ has kindled a very un-bothrioc-like taste for clothes, and soon the whole harem is involved in cleaning silk and weaving it into garments - first for her, because of course Fei demands a wardrobe fit for a queen, then for her harem, so you’re soon wearing silky kimonos, maid costumes and all sorts besides, and then for whoever on Myrellion wants and can afford them. The redheaded quadomme winds up making quite a lot of money out of her strange but unarguably fine garments, which she hungrily reinvests in refurbishing her mini-palace, and buying the sort of equipment she can’t make herself: vibrators, plugs, nipple clamps, piercings, body paint, bitch suits, endless amounts of ripe fruit...");
			
			pc.armor = new ComfortableClothes();
			pc.armor.longName = "silk kimono";
			
			pc.createStatusEffect("Milk Paused");
			pc.createStatusEffect("Cum Paused");
			processTime((5 * 24 * 60) + rand(1440));
			
			addButton(0, "Next", bothriocQuestBadEnd, 2);
			break;
		case 2:
			showBust(feiAnStrozoBustDisplay());
			
			// If PC scotched the summit and also agreed to this, for some fucking reason
			if(flags["KQ2_MYRELLION_STATE"] == 1 || flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_FAILURE)
			{
				showName("BOTHRIOC\nBOTTOM BITCH");
				
				output("Unfortunately, the ever-developing bliss you’ve discovered of being a bothrioc bottom bitch coincides with increasing tensions between the myr, who have little to no interest in anyone who happens to be caught between them. Eventually the specter of nuclear war forces Fei to abandon both her fledgling seamstress career and her home to evacuate her harem back to the distant continent she originated from - a much emptier land, but a respectable distance away from the ant people’s population centers and missile silos.");
				output("\n\nThe quadomme, who was only just discovering how much she enjoys being a socialite, is broodingly upset about it for months afterwards. Still - she still has all of her exciting purchases, and more importantly she has you and her other 39 lovers to use them on. Things settle down in your new quarters into a familiar, peaceful rhythm, interspersed with dizzying, mind-blowing highs. A cozier happily ever after than you were expecting, perhaps, but a happily ever after nonetheless.");
			}
			else
			{
				showName("FEI’S DREAM\nCOME TRUE");
				
				output("Whilst this is all going on, your Mistress is attending regular meetings with Ara and the other dominants, slowly thrashing a governing consensus out. Where they get the energy from you have no idea, but you suppose the unquestioning support of multitudes of submissives, and quick relief available whenever tensions run high, helps a lot. You lose track of the number of times Fei takes you along to some conference or other and winds up face-fucking you in a bathroom stall, brown thighs jiggling as she");
				if(feiAnHasCock()) output(" thrusts her bulging cock into your wet and willing suck");
				else output(" thrusts her pussy into your desperately lapping tongue");
				output(" because of some arch remark dropped by another quadomme.");
				output("\n\nStill, things evidently progress well, to the point where the bothrioc have a small but vociferous voice the U.G.C. have to listen to. One that grows all the time, as the spidery race begin to add farlanders to their harems, thereby gaining a better understanding of aliens and their governance. The ceasefire is enforced more stringently as a result, enabling the bothrioc to spread. More and more coreward races discover the same thing you do - how wonderful it is to belong to this enthralling, beautiful race, how life-affirming it is to feel their love growing inside of you and changing you, how unspeakably wonderful it is to be tied up and bred by one for hours on end...");
				output("\n\nEventually Fei makes enough money through her silk trade for her to purchase some apartments on Tavros, where she opens up a business and fulfills her desire to rub shoulders with as many farlanders as possible, luring the most interesting back to her home, where you and 39 other lovers are waiting. The orgies you have are awesome, mind-blowing, changing from week to week, and during the day you look after your ever-growing family of spider babies.");
				output("\n\nYou changed the galaxy in a small but significant way, and you live very happily ever after.");
			}
			
			bothriocAddiction(100);
			processTime((3 * 30 * 24 * 60) + rand(1440));
			pc.removeStatusEffect("Milk Paused");
			pc.removeStatusEffect("Cum Paused");
			
			badEnd("THE END.");
			break;
	}
}


