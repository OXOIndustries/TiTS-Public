// Class for code/scenes that involve multiple followers

/*
Flags Key:

PIPPA_YAMMI_KITCHEN - Checks if Pippa and Yammi are in the kitchen chatting (random chance)
	undefined/0 - They aren't
	1 - They are
PIPPA_YAMMI_THREESOME - Tracks how many times Steele has had a threesome with Pippa and Yammi
	undefined/0 - Steele has not had a threesome with Pippa and Yammi
PIPPA_YAMMI_THREESOME_DOM - Tracks whether or not Steele has had a threesome with Pippa and Yammi where the former is more dominant
	undefined/0 - No
	1 - Yes
*/
	
public function pippaYammiThreesomeCount(addCount:int = 1):int
{
	if (flags["PIPPA_YAMMI_THREESOME"] == undefined) flags["PIPPA_YAMMI_THREESOME"] = 0;
	
	flags["PIPPA_YAMMI_THREESOME"] += addCount;
	pippaSexed(addCount);
	if (addCount > 0) IncrementFlag("SEXED_YAMMI");
	
	return flags["PIPPA_YAMMI_THREESOME"];
}

public function pippaYammiThreesomeIntro():void
{
	clearOutput();
	clearMenu();
	showBust("PIPPA", "YAMMI");
	showName("PIPPA &\nYAMMI");
	author("Ascent");
	
	output("You stroll into the kitchen where Pippa and Yammi chat while the latter cooks.  As they notice you, they greet you simultaneously.");
	
	output("\n\n<i>“Hey, Boss!”</i>");
	output("\n<i>“Hey, " + pippaCallsSteele() + ".”</i>"); //Purposefully one new line to keep the two simultaenous greetings closer together
	
	output("\n\nThey give each other sideways glances, and then approach you from both sides, each of them planting a kiss on one of your cheeks.  They both step slightly away and Yammi speaks first.  <i>“Did you need something, Boss?”</i>  She smiles and, before you can answer, steps in again, pressing her body close to yours and placing a hand on your thigh.");
	
	output("\n\nPippa steps in as well, placing her hand on the side of your face. <i>“If you do, you can come back to my quarters with me.  Yammi's busy with cooking and I was just about to leave.”</i>");
	
	output("\n\n<i>“You know I can always take a quick break for you, Boss.”</i>  They both look at you expectantly, but you notice Pippa briefly glance over at Yammi, looking her up and down.");
	
	addButton(0, "Pippa", pippaYammiNoThreesomePippa);
	addButton(1, "Yammi", pippaYammiNoThreesomeYammi);
	addButton(2, "Both", pippaYammiThreesome);
}

public function pippaYammiNoThreesomePippa():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("<i>“");
	
	if (pc.isNice()) output("Sorry, Yammi, but ");
	output("I think I'm going to head back to Pippa's quarters.”</i>");
	
	output("\n\nYammi sighs with disappointment as her hands drop to her sides.  <i>“Alright, fine.  I guess I should finish up with this cooking anyway.  Just make sure you stop by later, Boss!”</i>");
	
	output("\n\nPippa looks content, but you sense a hint of disappointment as well.  The two of you bid farewell to Yammi and head back to Pippa's quarters.");
	
	pippaSexMenu(pippaMainMenu);
}

public function pippaYammiNoThreesomeYammi():void
{
	clearOutput();
	clearMenu();
	yammiFollowerDisplay();
	author("Ascent");
	
	output("<i>“");
	
	if (pc.isNice()) output("Sorry, Pippa, but ");
	output("I'm going to stay in the kitchen with Yammi.”</i>");
	
	output("\n\nPippa sighs in annoyance and places a hand on her hips.  <i>“If that's what you want right now.”</i>  She perks up slightly, glances toward Yammi, and quips, <i>“Looking at her, I guess I can't blame you too much.”</i>  She looks fully toward Yammi and states, <i>“I'll be back later; I hope you'll cook me up something good to make up for this.”</i>  She winks at Yammi and leaves the two of you alone in the kitchen.");
	
	yammiFollowerSexMenu();
}

public function pippaYammiThreesome():void
{
	clearOutput();
	clearMenu();
	showBust("PIPPA_NUDE", "YAMMI_NUDE");
	showName("PIPPA &\nYAMMI");
	author("Ascent");
	
	if (pippaYammiThreesomeCount(0) == 0)
	{
		output("You reach a hand around each of the ladies, grabbing two handfuls of plump ass.  <i>“How about both Pippa and I stay here in the kitchen?”</i>");
		
		output("\n\nPippa giggles.  <i>“I see you're thinking what I'm thinking, " + pippaCallsSteele() + ".”</i>  She reachs around and grabs Yammi's other ass cheek, eliciting a sharp intake of air from the sparadat.");
		
		output("\n\nYammi smirks, but doesn't draw back.  <i>“You two are just teasing me, aren't you?”</i>");
		
		output("\n\nYou tell her, <i>“You should know by now I'm not just teasing you.”</i>");
		
		output("\n\nYammi bites her lip and looks at Pippa, before looking back to you.  <i>“I'm not completely sure about this, Boss, but...I guess you should also know by now, I trust you.”</i>");
		
		output("\n\nPippa grabs Yammi by the chin, turning her face so they're face-to-face, and plants a kiss on her green lips.  <i>“You two done talking?”</i>");
		
		output("\n\nYammi blushes before answering, <i>“I guess we are.”</i>");
	}
	else
	{
		output("You gather Pippa and Yammi in the kitchen.  They look at each other, and then at you, each flashing you a smile.");
		
		output("\n\n<i>“Need something from us, Boss?”</i>  Pippa giggles softly at Yammi's question.");
		
		output("\n\n<i>“");
		
		if (pc.isNice())
		{
			output("We had such a good time last time that I thought you two might be up for some more fun.”</i>");
			
			output("\n\nThey both step closer to you and Pippa speaks, <i>“Well at least as far as I'm concerned, you thought right.”</i>");
		}
		else if (pc.isMischievous())
		{
			output("I thought it'd be nice to do some team building exercies with some of my crew.”</i>");
			
			output("\n\nThey both step closer to you and Pippa speaks, <i>“I'm always up for a little team building, " + pippaCallsSteele() + ".”</i>");
		}
		
		else 
		{
			output("I think you both know what I need you to do.”</i>");
			
			output("\n\nThey both step closer to you and Pippa speaks, <i>“Yeah, you've a big job for the two of us?”</i>");
		}
		
		output("  They step in again, closing the gap between the three of you, and you wrap an arm around each, grabbing their asses.");
	}
	
	var cockIndex:int = -1;
	
	if(pc.hasCock())
	{
		cockIndex = pc.cockThatFits(yammiPlaceholderCapacity());
		if(cockIndex < 0) cockIndex = pc.smallestCockIndex();
	}
	
	output("  They lean in and kiss you on your neck and cheeks.  Pippa stops her kissing first, turning your head toward Yammi as she does, bringing your mouth to your chef's.  You kiss, tongues dancing, and as you do, she reaches down and");
	
	if (pc.isCrotchGarbed()) output(", first pulling your clothes out of the way,");
	
	if (cockIndex == -1) output(" gropes at your underwear till she finds the button that activates your hardlight cock.  She grabs and rubs it as she kisses you, feeling it come to full hardness.");
	else output(" gropes at your [pc.cock " + cockIndex + "], feeling it come to full hardness.");
	
	output("\n\nPippa, meanwhile, has kneeled behind Yammi.  She lifts the other woman's red dress and takes in her orange, round ass, beautifully framed by lacy, black panties.  She gently rubs, and squeezes Yammi's ass, admiring it, and then moves onto kissing.  She peels Yammi's panties down and, wrapping her arms around the sparadat's shapely hips, buries her face in her pussy.  Yammi gasps softly, breaking her kiss, but you quickly pull her back into it.  She lightly grinds her hips into Pippa's face, and lightly moans into your mouth.");
	
	output("\n\nPippa stops short of bringing Yammi to orgasm.  Standing up, she jokes, <i>“I just wanted a taste.”</i>  She steals your [pc.lips] away from Yammi, pressing them into her own.  Yammi drops to the floor and takes your [pc.cockOrStrapon " + cockIndex + "] into her mouth, her longue tongue running along its length.  Your own tongue explores Pippa's mouth.  As she kisses you, she alternates between rubbing your [pc.chest] and the top of Yammi's head, seemingly unable to make up her mind.  You keep one hand on Yammi's head, running your fingers through her green hair, and use the other hand to grope Pippa's [pippa.ass].");
	
	if (pippa.hasHardLightStrapOn() && rand(120) - 10 < pippaDominance()) pippaYammiThreesomeDom(cockIndex);
	else pippaYammiThreesomeSub(cockIndex);
	
	pc.orgasm();
	pippaYammiThreesomeCount();
	
	addButton(0, "Next", mainGameMenu);
}

public function pippaYammiThreesomeDom(cockIndex:int):void
{
	output("\n\nPippa moves her lips away from your mouth, kissing her way down to your neck, and then up toward your ear.  She pulls back slightly and whispers to you, <i>“I'll be right back.”</i>  Before you can even acknowledge her statement, she runs out of the kitchen.  Yammi, who barely seems to notice, continues lavishing attention on your [pc.cockOrStrapon " + cockIndex + "].  ");
	
	if (pc.hasVagina()) output("She gives your [pc.pussy] some love as well, rubbing and fingering it with one hand as she runs her lovely, green lips along your shaft.");
	else output("She uses a hand and her mouth to service you, grasping the base of your shaft while running her lovely, green lips along the rest.");
	
	output("  Her other hand is planted between her legs, fingers in her pussy, gently thrusting to the same rhythm as her bobbing head.");
	
	output("\n\nBefore long, Pippa comes back into the kitchen.  She's removed her tank top and yoga pants, and is wearing her [pippa.lowerUndergarment].  Her [pippa.hardlightCock] is already erect.  <i>“I liked the look of Yammi down on her knees, and thought I'd like what you're having, " + pippaCallsSteele() + ".”</i>  She comes to stand next to you as before, but now faces Yammi.  ");
	
	if (flags["PIPPA_YAMMI_THREESOME_DOM"] == 1) output("The sparadat stops rubbing her pussy and gently wraps a hand around the pig-morph's fake cock.");
	else output("  The sparadat looks surprised, but stops rubbing her pussy and tenatively wraps a hand around the pig-morph's fake cock.");
	
	output("  She continues running her mouth and hand along your [pc.cockNoun " + cockIndex + "], and begins to stroke Pippa's [pippa.hardlightCockNoun], the pussy juices already on her hand acting as lube.");
	
	output("\n\nWith Yammi taking care of your " + (cockIndex == -1 ? "holo-" : "") + "cocks, Pippa begins kissing you again.  She now keeps her hands firmly on your chest, ");
	
	if (pc.biggestTitSize() >= 1) output("rubbing and squeezing your [pc.breasts]");
	else if (pc.tone >= 70) output("rubbing her hands all around your impresively muscled pecs");
	else output("rubbing her hands all around it");
	
	if (pc.hasNipples()) output(", and occasionally rubbing and squeezing your [pc.nipples]");
	
	output(".  As you kiss Pippa, you feel Yammi remove her mouth from your [pc.cock " + cockIndex + "], and you look down to see her taking Pippa's [pippa.hardlightCock] in her mouth.  She keeps a hand on your [pc.cockNoun " + cockIndex + "], continuing to rub and stroke you while she tends to Pippa with her talented tongue.  You keep one hand on Pippa's [pippa.ass], squeezing and kneading it, and you place the other on Yammi's hand, guiding it up and down your shaft.");
	
	output("\n\nYammi eventually goes to switch back to taking your [pc.cockNoun " + cockIndex + "] into her mouth, but before she can, you bend over and grab her, lifting her up into a kiss.  She pulls out of your kiss, a playful smile on her face.  <i>“Ready for the main event, Boss?”</i>  To answer her question, you pull her with you till your back's to a table, and you lay down on it.  With a small boost from Pippa, she climbs up onto the table, stradling your [pc.cock " + cockIndex + "].  She leans in to kiss you and then you feel her slowly lower herself onto you, parting her cool, wet folds, and enveloping your [pc.cockNoun " + cockIndex + "] in her tight, sparadat pussy.");
	
	output("Yammi continues kissing you, riding your [pc.cockNoun " + cockIndex + "] as she does.  She suddenly breaks off the kiss");
	
	if (flags["PIPPA_YAMMI_THREESOME_DOM"] == 1) output(", craning her head back toward Pippa.  <i>“You know the drill, Pippa; get me ready first and be gentle.”</i>");
	else
	{
		output(" and gasps in surprise.  She quickly whips her head around to look at Pippa.  <i>“Oh, you're as bad as [pc.name]!  I really don't know about taking the both of you at once");
		
		if (pc.cockVolume(x) > yammiPlaceholderCapacity()) output(", especially when I'm already filled up this much");
		
		output(".”</i>  Despite what she's saying, her pussy's clenching you tighter.  Too turned on to pass up the advance, she sighs.  <i>“Get me ready first...and be gentle.”</i>");
	}
	
	output("\n\nPippa giggles and apologizes, <i>“Sorry, Yammi.  I guess I got a little overeager.”</i>  You pull Yammi into you, hugging her close so that you can see over her shoulder, and down to her round behind.  She again begins to gently ride you, face buried in your neck.  Pippa places one hand on Yammi's bouncing bottom, gently spreading her ass, and, with her other hand, she grasps the base of your [pc.cockNoun " + cockIndex + "] below Yammi, briefly moving it along with the sparadat, wetting her hand with girl-cum.  She takes a lubricated finger, gently runs it around Yammi's asshole, and slowly slips it inside, coating the inside and outside with the sparadat's own cum.  Yammi's moans are already picking up when Pippa slips another finger in, spreading your chef's asshole.  The pig-morph looks at Yammi's soft butt ravenously, and finally removes her fingers, preparation complete.");
	
	output("\n\nPippa again presses the head of her [pippa.hardlightCock] to Yammi's now-slightly-spread asshole and slowly pushes in.  Yammi feels even tighter and more full as you feel the intruding [pippa.hardlightCockNoun] through her inner walls.  The two of them moan in chorus as Pippa bottoms out in Yammi.  The three of you come to a standstill, taking in the feeling of double-stuffed sparadat.  Pippa, now leaning into Yammi, [pippa.breasts] pressed into her back, is in the best position to move, and so moves first, gently drawing her [pippa.hardlightCock] out of Yammi's tight ass before thrusting back in.  Between the feeling of Pippa's [pippa.hardlightCockNoun] thrusting in and out and Yammi's quivering along your shaft, you don't even need to move to feel intense pleasure and, judging from her musical moaning, neither does Yammi.  Pippa, despite not having been inside Yammi for long, is also moaning, a more wild moaning in constrast to Yammi's, frequently interspersed with grunts and squeals.");
	
	output("\n\nYammi, pussy practically spasming at this point, seems to be barely hanging on.  You're right behind her, and, judging from her accelerating thrusting and the sounds she's making, so is Pippa.  As it turns out, Pippa's right out front, the first to go over the edge; she thrusts hard into Yammi, completely bottoming out and grasping the sparadat from behind.  You see and feel shuddering run through her body.  She's the first domino, sending Yammi into climax when she bottoms out.  Yammi's tight, orgasming pussy, in turn, finishes you off");
	
	if (cockIndex >= 0) output(" and you flood your chef's cool womb with hot [pc.cumNoun].");
	else output(", the shuders and spasms spreading to your own body.");
	
	output("\n\nYou, for a bit, sit still in a blissful, post-orgasm pile, Yammi on top of you, and Pippa on top of Yammi.  Finally, Pippa withdraws from Yammi, and then helps her climb off of you, allowing you to stand up.  Yammi looks sheepishly at the table behind you.  It's covered in sweat and pussy juice");
	
	if (cockIndex >= 0) output(" and it looks like a bit of your [pc.cum] as well");
	
	output(".  It's a good thing your ship isn't subject to health inspections.  <i>“I...really ought to clean up my kitchen.”</i>  You and Pippa decide to help her");
	
	if (crewRecruited().length > 2) output(" clean up quickly, before anybody shows up to eat");
	
	output(".");
	
	pippaDominance(1);
	flags["PIPPA_YAMMI_THREESOME_DOM"] = 1;
}

public function pippaYammiThreesomeSub(cockIndex:int):void
{
	output("\n\nsub");
	
	pippaDominance(-1);
}