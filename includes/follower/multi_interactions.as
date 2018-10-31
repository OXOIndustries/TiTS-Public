// Class for code/scenes that involve multiple followers

/*
Flags Key:

PIPPA_YAMMI_KITCHEN - Checks if Pippa and Yammi are in the kitchen chatting (random chance)
	undefined/0 - They aren’t
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

// Pippa/Yammi threesome first time scene
public function pippaYammiThreesomeIntro():void
{
	clearOutput();
	clearMenu();
	showBust(pippaBustDisplay(), yammiBustDisplay());
	showName("PIPPA &\nYAMMI");
	author("Ascent");
	
	output("You stroll into the kitchen where Pippa and Yammi chat while the latter cooks. As they notice you, they greet you simultaneously.");
	
	output("\n\n<i>“Hey, Boss!”</i>");
	output("\n<i>“Hey, " + pippaCallsSteele() + ".”</i>"); //Purposefully one new line to keep the two simultaenous greetings closer together
	
	output("\n\nThey give each other sideways glances, and then approach you from both sides, each of them planting a kiss on one of your cheeks. They both step slightly away and Yammi speaks first. <i>“Did you need something, Boss?”</i> She smiles and, before you can answer, steps in again, pressing her body close to yours and placing a hand on your [pc.thigh].");
	
	output("\n\nPippa steps in as well, placing her hand on the side of your face. <i>“If you do, you can come back to my quarters with me. Yammi’s busy with cooking and I was just about to leave.”</i>");
	
	output("\n\n<i>“You know I can always take a quick break for you, Boss.”</i> They both look at you expectantly, but you notice Pippa briefly glance over at Yammi, looking her up and down.");
	
	addButton(0, "Pippa", pippaYammiNoThreesomePippa);
	addButton(1, "Yammi", pippaYammiNoThreesomeYammi);
	addButton(2, "Both", pippaYammiThreesome);
}

// Turn down threesome and have sex with Pippa
public function pippaYammiNoThreesomePippa():void
{
	clearOutput();
	clearMenu();
	showPippa();
	
	output("<i>“");
	
	if (pc.isNice()) output("Sorry, Yammi, but ");
	output("I think I’m going to head back to Pippa’s quarters.”</i>");
	
	output("\n\nYammi sighs with disappointment as her hands drop to her sides. <i>“Alright, fine. I guess I should finish up with this cooking anyway. Just make sure you stop by later, Boss!”</i>");
	
	output("\n\nPippa looks content, but you sense a hint of disappointment as well. The two of you bid farewell to Yammi and head back to Pippa’s quarters.");
	
	pippaSexMenu(pippaMainMenu);
}

// Turn down threesome and have sex with Yammi
public function pippaYammiNoThreesomeYammi():void
{
	clearOutput();
	clearMenu();
	yammiFollowerDisplay();
	author("Ascent");
	
	output("<i>“");
	
	if (pc.isNice()) output("Sorry, Pippa, but ");
	output("I’m going to stay in the kitchen with Yammi.”</i>");
	
	output("\n\nPippa sighs in annoyance and places a hand on her hips. <i>“If that’s what you want right now.”</i> She perks up slightly, glances toward Yammi, and quips, <i>“Looking at her, I guess I can’t blame you too much.”</i> She looks fully toward Yammi and states, <i>“I’ll be back later; I hope you’ll cook me up something good to make up for this.”</i> She winks at Yammi and leaves the two of you alone in the kitchen.");
	
	yammiFollowerSexMenu();
}
 // Pippa/Yammi threesome part 1
public function pippaYammiThreesome():void
{
	clearOutput();
	clearMenu();
	showBust(pippaBustDisplay(true), yammiBustDisplay(true));
	showName("PIPPA &\nYAMMI");
	author("Ascent");
	
	if (pippaYammiThreesomeCount(0) == 0)
	{
		output("You reach a hand around each of the ladies, grabbing two handfuls of plump ass. <i>“How about Pippa and I both stay here in the kitchen?”</i>");
		
		output("\n\nPippa giggles. <i>“I see you’re thinking what I’m thinking, " + pippaCallsSteele() + ".”</i> She reachs around and grabs Yammi’s other ass cheek, eliciting a sharp intake of air from the sparadat.");
		
		output("\n\nYammi smirks, but doesn’t draw back. <i>“You two are just teasing me, aren’t you?”</i>");
		
		output("\n\nYou tell her, <i>“You should know by now I’m not just teasing you.”</i>");
		
		output("\n\nYammi bites her lip and looks at Pippa, before looking back to you. <i>“I’m not completely sure about this, Boss, but... I guess you should also know by now, I trust you.”</i>");
		
		output("\n\nPippa grabs Yammi by the chin, turning her so they’re face-to-face, and plants a kiss on her green lips. <i>“You two done talking?”</i>");
		
		output("\n\nYammi blushes before answering, <i>“I guess we are.”</i>");
	}
	else
	{
		output("You gather Pippa and Yammi in the kitchen. They look at each other, and then at you, each flashing you a smile.");
		
		output("\n\n<i>“Need something from us, Boss?”</i> Pippa giggles softly at Yammi’s question.");
		
		output("\n\n<i>“");
		
		if (pc.isNice())
		{
			output("We had such a good time last time that I thought you two might be up for some more fun.”</i>");
			
			output("\n\nThey both step closer to you and Pippa speaks, <i>“Well at least as far as I’m concerned, you thought right.”</i>");
		}
		else if (pc.isMischievous())
		{
			output("I thought it’d be nice to do some team building exercies with some of my crew.”</i>");
			
			output("\n\nThey both step closer to you and Pippa speaks, <i>“I’m always up for a little team building, " + pippaCallsSteele() + ".”</i>");
		}
		
		else 
		{
			output("I think you both know what I need you to do.”</i>");
			
			output("\n\nThey both step closer to you and Pippa speaks, <i>“Yeah, you’ve a big job for the two of us?”</i>");
		}
		
		output(" They step in again, closing the gap between the three of you, and you wrap an arm around each, grabbing their plumps asses.");
	}
	
	var cockIndex:int = -1;
	
	if(pc.hasCock())
	{
		cockIndex = pc.cockThatFits(yammiPlaceholderCapacity());
		if(cockIndex < 0) cockIndex = pc.smallestCockIndex();
	}
	
	output(" They lean in and kiss you on your neck and cheeks. Pippa stops her kissing first, turning your head toward Yammi as she does, bringing your [pc.lips] to your chef’s. You kiss, tongues dancing, and as you do, she reaches down and");
	
	if (pc.isCrotchGarbed()) output(", first pulling your clothes out of the way,");
	
	if (cockIndex == -1) output(" gropes at your underwear until she finds the button that activates your hardlight cock, pressing it when she does. She grabs your [pc.hardlightCock] rubs it as she kisses you, feeling it come to full hardness.");
	else output(" gropes at your [pc.cock " + cockIndex + "], stroking its full length and bringing it to full hardness.");
	
	output("\n\nPippa, meanwhile, has kneeled behind Yammi. She lifts the other woman’s red dress and takes in her orange, round ass, beautifully framed by lacy, black panties. She gently rubs, and squeezes Yammi’s plump ass, admiring it, and then moves onto kissing. She peels Yammi’s panties down and, wrapping her arms around the sparadat’s shapely hips, buries her face in her pussy. Yammi gasps softly, breaking her kiss, but you quickly pull her back into your [pc.lips]. She lightly grinds her hips into Pippa’s face, and lightly moans into your mouth.");
	
	output("\n\nPippa stops short of bringing Yammi to orgasm. Standing up, she jokes, <i>“I just wanted a taste.”</i> She steals your [pc.lips] away from Yammi, pressing them into her own, still slick with Yammi’s juices. She probes your mouth with her tongue, and on it and her [pippa.lips], you can taste Yammi’s sweet pussy. As the two of you kiss, Yammi drops to the floor and takes your [pc.cockOrStrapon " + cockIndex + "] into her mouth, her long tongue running along its length. Your own tongue explores Pippa’s mouth. While Yammi tends to your [pc.cockOrStrapon " + cockIndex + "], Pippa, continuing to kiss you, alternates between rubbing your [pc.chest] and the top of Yammi’s head, running her fingers through the sparadat’s hair, seemingly unable to make up her mind. You run your own fingers through her green hair, sometimes brushing them over Pippa’s fingers, and use the other hand to grope Pippa’s [pippa.ass].");
	
	pc.lust(30);
	
	if (pippa.hasHardLightStrapOn() && randInRange(-10, 110) < pippaDominance()) pippaYammiThreesomeDom(cockIndex);
	else pippaYammiThreesomeSub(cockIndex);
	
	pc.orgasm();
	pippaYammiThreesomeCount();
	
	addButton(0, "Next", mainGameMenu);
}

// Pippa/Yammi threesome part 2a, PC and Pippa DP Yammi
public function pippaYammiThreesomeDom(cockIndex:int):void
{
	output("\n\nPippa moves her [pippa.lips] away from your mouth, kissing her way down to your neck, and then up toward your [pc.ear]. She pulls back slightly and whispers to you, <i>“I’ll be right back.”</i> Before you can even acknowledge her statement, she runs out of the kitchen. Yammi, who barely seems to notice, continues lavishing attention on your [pc.cockOrStrapon " + cockIndex + "]. ");
	
	if (pc.hasVagina()) output("She gives your [pc.pussy] some love as well, rubbing and fingering it with one hand as she runs her lovely, green lips and long, wet tongue along your shaft.");
	else output("She uses a hand as well as her mouth to service you, firmly grasping the base of your shaft while running her lovely, green lips and long, wet tongue along the rest.");
	
	output(" Her other hand is planted between her legs, fingers in her pussy, gently thrusting to the same rhythm as her bobbing head.");
	
	output("\n\nBefore long, Pippa comes back into the kitchen. She’s removed her tank top and yoga pants, and is wearing the [pippa.lowerUndergarment] you bought her. Her [pippa.hardlightCock] is already activated and erect. <i>“I liked the look of Yammi down on her knees, and thought I’d have what you’re having.”</i> She comes to stand next to you as before, but now faces Yammi. ");
	
	if (flags["PIPPA_YAMMI_THREESOME_DOM"] == 1) output("The sparadat stops rubbing her pussy and gently wraps a hand around the pig-morph’s fake cock.");
	else output(" The sparadat looks surprised, but stops rubbing her pussy and tenatively wraps a hand around the pig-morph’s fake cock.");
	
	output(" She continues running her mouth and hand along your [pc.cockOrStrapon " + cockIndex + "], and begins to stroke Pippa’s [pippa.hardlightCockNoun], the pussy juices already on her hand acting as lube.");
	
	output("\n\nWith Yammi taking care of your " + (cockIndex == -1 ? "holo-" : "") + "cocks, Pippa again plants her [pippa.lips] on yours. She now keeps her hands firmly on your [pc.chest], ");
	
	if (pc.biggestTitSize() >= 1) output("rubbing and squeezing your [pc.breasts]");
	else if (pc.tone >= 70) output("rubbing her hands all around your impresively muscled pecs");
	else output("rubbing her hands all around it");
	
	if (pc.hasNipples()) output(", and occasionally rubbing and squeezing your [pc.nipples]");
	
	output(". As you kiss Pippa, you feel Yammi remove her mouth from your [pc.cockOrStrapon " + cockIndex + "], and you look down to see her taking Pippa’s [pippa.hardlightCock] in her mouth. She keeps a hand on your [pc.cockOrStrapon " + cockIndex + "], continuing to rub and stroke you while she tends to Pippa with her talented tongue. You keep one hand on Pippa’s [pippa.ass], squeezing and kneading it, and you place the other over Yammi’s hand, guiding it up and down your shaft.");
	
	output("\n\nYammi eventually goes to switch back to taking your [pc.cockOrStrapon " + cockIndex + "] into her mouth, but before she can, you bend over and grab her, lifting her up into a kiss. She pulls out of your kiss, a playful smile on her face. <i>“Ready for the main event, Boss?”</i> To answer her question, you pull her with you until your back’s to a table, and you lay down on it. With a small boost from Pippa, she climbs up onto the table, stradling your [pc.cockOrStrapon " + cockIndex + "]. She leans in to kiss you and then you feel her slowly lower herself onto you, parting her cool, wet folds, and enveloping your [pc.cockOrStrapon " + cockIndex + "] in her tight, sparadat pussy.");
	
	output("Yammi continues kissing you, riding your [pc.cockOrStrapon " + cockIndex + "] as she does. She suddenly breaks off the kiss");
	
	if (flags["PIPPA_YAMMI_THREESOME_DOM"] == 1) output(", craning her head back toward Pippa. <i>“You know the drill, Pippa; get me ready first. And be gentle!”</i>");
	else
	{
		output(" and gasps in surprise. She quickly whips her head around to look at Pippa. <i>“Oh, you’re as bad as [pc.name]! I really don’t know about taking the both of you at once");
		
		if (pc.cockVolume(x) > yammiPlaceholderCapacity()) output(", especially when I’m already filled up this much");
		
		output("....”</i> Despite what she’s saying, you feel her tight pussy on your [pc.cockOrStrapon " + cockIndex + "] twitching with anticipation.. Too turned on to pass up the advance, she sighs. <i>“Get me ready first... and be gentle!”</i>");
	}
	
	output("\n\nPippa giggles and apologizes, <i>“Sorry, Yammi. I guess I got a little overeager.”</i> You pull Yammi into you, her perky breasts pressed into your [pc.chest], so that you can see over her shoulder and down to her round behind. She again begins to gently ride you, face buried in your neck. Pippa places one hand on Yammi’s bouncing bottom, gently spreading her ass, and, with her other hand, she grasps the base of your [pc.cockOrStrapon " + cockIndex + "] below Yammi, briefly moving it along with the sparadat, wetting her hand with girl-cum. She takes a lubricated finger, gently runs it around Yammi’s asshole, and slowly slips it inside, coating the inside and outside with the sparadat’s own cum. Yammi’s moans are already picking up when Pippa slips another finger in, spreading your chef’s rim. She finger fucks Yammi's tight asshole gently and, as she does, you see a hunger fill her eyes. She licks her lips and removes her fingers from Yammi's ass before leaning down and quickly replacing her fingers with her tongue. Or so you imagine. You can’t see with her face buried in Yammi’s plump behind, but options are limited and it’s easy to imagine her devouring the cute sparadat’s sexy ass. Yammi’s moaning into your neck and the convulsing of her pussy around your [pc.cockOrStrapon " + cockIndex + "] seem to support your theory. After a bit she stands back up, tongue still hanging out and looking pleased with herself.");
	
	output("\n\nPippa again presses the head of her [pippa.hardlightCock] to Yammi’s now-slightly-spread asshole and slowly pushes in. Yammi feels even tighter and more full as you feel the intruding [pippa.hardlightCockNoun] through her inner walls. The two of them moan in chorus as Pippa bottoms out in Yammi. The three of you come to a standstill, taking in the feeling of double-stuffed sparadat. Pippa, now leaning into Yammi, [pippa.breasts] pressed into her back, is in the best position to move, and so moves first, gently drawing her [pippa.hardlightCock] out of Yammi’s tight ass before thrusting back in. Between the feeling of Pippa’s [pippa.hardlightCockNoun] thrusting in and out and Yammi’s quivering along your shaft, you don’t even need to move to feel intense pleasure and, judging from her musical moaning, neither does Yammi. Pippa, despite not having been inside Yammi for long, is also moaning, wild and animalistic in constrast with Yammi’s, and frequently interspersed with grunts and squeals.");
	
	output("\n\nYammi, pussy spasming wildly at this point, seems to be barely hanging on. You’re right behind her, and, judging from her accelerating thrusting and the sounds she’s making, so is Pippa. The cacophony of noises the three of you are making crescendos and finally hits a climax as Pippa’s goes over the edge first; she thrusts hard into Yammi, completely bottoming out and grasping the sparadat’s shapely hips from behind. You see and feel shudders run through her body. She’s the first domino, sending Yammi into climax when she bottoms out. Yammi’s tight, shivering pussy, in turn, finishes you off");
	
	if (cockIndex >= 0) output(" and you flood your chef’s cool womb with hot [pc.cumNoun]");
	else output(", the shuders and spasms spreading to your own body");
	
	output(". The three of you collapse into a quivering heap of hot flesh. One form blurred into the next, you rest, movement and breaths slowing as peaceful silence descends upon the room.");
	
	output("\n\nEven as all becomes still, you, for a bit, continue to rest in a blissful, post-orgasm pile, Yammi on top of you, and Pippa on top of Yammi. Finally, Pippa withdraws from Yammi, and then helps her climb off of you, allowing you to stand up. Yammi looks sheepishly at the table behind you. It’s covered in sweat and pussy juice");
	
	if (cockIndex >= 0) output(" and it looks like a bit of your [pc.cum] as well");
	
	output(". It’s a good thing your ship isn’t subject to health inspections. <i>“I... really ought to clean up my kitchen.”</i> You and Pippa decide to help her");
	
	if (crewRecruited().length > 2) output(" clean up quickly, before anybody shows up to eat");
	
	output(".");
	
	pippaDominance(1);
	flags["PIPPA_YAMMI_THREESOME_DOM"] = 1;
}

// Pippa/Yammi threesome part 2b, PC fucks both Pippa and Yammi
public function pippaYammiThreesomeSub(cockIndex:int):void
{
	output("\n\nPippa moves her [pippa.lips] away from your mouth, kissing her way down to your neck, and then up toward your [pc.ear]. She pulls away from you briefly and quickly strips off her tight clothes, freeing her [pippa.breasts], [pippa.belly], and [pippa.ass]. She then continues kissing down your body, until she’s down on her knees next to Yammi. <i>“I couldn’t help but want to join Yammi down here.”</i> She winks at you. While Yammi continues sucking your [pc.cockOrStrapon " + cockIndex + "], Pippa kisses her cheek and neck, using one hand to grope her pert breasts and the other to finger her pussy from behind. Yammi moans into your [pc.cockOrStrapon " + cockIndex + "], her tongue vibrating along its length. ");
	
	if (pc.balls > 0) output("Pippa stops kissing Yammi, relocating her [pippa.lips] to your [pc.balls]. She licks and sucks on " + (pc.balls > 1 ? "them" : "it") + " gently, her warm, wet tongue massaging your [pc.sack] all over.");
	else output("Pippa continues to finger Yammi, but removes the other hand and places it at the base of your shaft, stroking your [pc.cockOrStrapon " + cockIndex + "] along with Yammi’s own stroking and sucking.");
	
	output("\n\nYammi’s engrossed with your [pc.cockOrStrapon " + cockIndex + "], wet tongue and plump lips slathering your length in her cool saliva, with semingly no plan to stop, but it seems Pippa wants her turn at it. In one smooth motion, the pig-morph pulls your chef off of you and presses her [pippa.lips] into Yammi’s. Rather than taking Yammi’s place entirely, Pippa kisses and licks the side of your [pc.cockOrStrapon " + cockIndex + "], inviting Yammi to do the same on the other side. The two lusty ladies sandwich you in between their sexy lips and slick tongues, kissing its entire length" + (cockIndex == -1 || pc.cocks[cockIndex].thickness() <= 2 ? " and completely enveloping it to kiss each other over its width" : "") + ". You hold their heads firmly to your shaft and, as their mouths stroke it up and down, their hands are free to grope at each other’s breasts and pussies.");
	
	output("\n\nYou feel as though you could easily cum from those plush lips and writhing tongues on your [pc.cockOrStrapon " + cockIndex + "], but better than their upper lips, you’re sure, are their wet and waiting lower lips. You pull away from Pippa and Yammi and bend down to grab the latter, the lighter of the two, lifting her up and swinging her around, and laying her back on a table. She spreads her legs, inviting you in. <i>“Come and get it, [pc.name].”</i> You waste no time moving in, grabbing her shapely hips, and slowly pushing in past her folds and into her wet, cool pussy. You begin to thrust, drawing your [pc.cockOrStrapon " + cockIndex + "] in and out of her clamping inner walls, so tight that were she not so soaking wet, you’d barely be able to move. Pippa comes up next to Yammi and begins kissing her, first on her mouth. Soon she moves her [pippa.lips] to one of Yammi’s plump breasts, kissing it all over and brushing her [pippa.lips] and tongue over Yammi’s erect nipple. All the while she gropes at Yammi’s other tit, massasing the soft breast flesh. While her hands and mouth are all over Yammi, Pippa's [pippa.eyes] land squarely on your [pc.cockOrStrapon " + cockIndex + "] pounding away at sparadat pussy. She reaches one hand down, fingers framing your intruding [pc.cockOrStrapon " + cockIndex + "] and rubbing Yammi’s erect clit. In response, Yammi’s pussy quivers around your length, squeezing tighter and tighter. This only spurs you on; you fuck her harder and faster and, between your pounding and Pippa’s hands and [pippa.lips], Yammi can’t resist. Orgasm washes over her. Her pussy squeezes and massages your [pc.cockOrStrapon " + cockIndex + "] and you barely keep from climaxing yourself. After all, you still have one pussy to attend to.");
	
	output("\n\nYou slowly withdraw from Yammi, and turn your attention to Pippa. The pig-morph has stopped kissing and groping Yammi and is bent over, waiting for you, [pippa.ass] swaying enticingly. You stroll up behind her, and grab her [pippa.hips]. With her [pippa.pussy] soaking wet, and your [pc.cockOrStrapon " + cockIndex + "] slick with Yammi’s juices, you easily slide in past her aroused, puffy lips. The corkscrewed ridges of her [pippa.pussyNoun] slide over the length of your [pc.cockOrStrapon " + cockIndex + "], and, already lifted to the heights of pleasure by Yammi, you barely manage to not climax on entry. You bottom out and stop, allowing yourself to come down a bit before fucking Pippa. While you rest, enjoying the feeling of being inside Pippa, Yammi recovers enough to get up. The sparadat kneels beneath Pippa and begins licking and sucking on her [pippa.clit]. Pippa begins moaning and, not to be outdone by Yammi’s talented tongue, you begin thrusting. Pippa’s [pippa.pussy] is much warmer than Yammi’s, not quite as tight, but with a more unique texture; you can’t help but feel you’re lucky to have such variety. You can’t dwell on that thought for long. Between your [pc.cockOrStrapon " + cockIndex + "] probing her depths, and Yammi’s attention to her [pippa.clit], Pippa is fast approaching orgasm. Her [pippa.pussy] spasms over your shaft, ridged walls massaging the entire length. You power through Pippa’s orgasm, again barely preventing your own.");
	
	output("\n\n<i>“Isn’t it about time you finish, Boss?”</i> Yammi smiles.");
	
	output("\n\n<i>“Go ahead and fill me up, " + pippaCallsSteele() + ",”</i> Pippa gasps through her moaning.");
	
	output("\n\nThe thought’s tempting, but you pull out of Pippa and flip her over onto her back, and then lift Yammi up, letting her straddle the pig-morph. Both of their pussies are right next to each other before you, flush, slick, and inviting. However, you don’t enter either for a second time. Instead, you instruct Yammi to really press herself to Pippa, bringing their bodies flush together, their tits pressed into each other. So close together, they begin to make out. You slide your [pc.cockOrStrapon " + cockIndex + "] in between their pussies, letting their slick folds envelope both sides of your length. ");
	
	if (cockIndex >= 0)
	{
		if (pc.cocks[cockIndex].cLength() >= 20) output("Your [pc.cockOrStrapon " + cockIndex + "] is so long that you can push all the way up through their bodies, sandwiching yourself in their soft breasts, and leaving a trail of mixed girl-cum down their torsos. ");
		else if (pc.cocks[cockIndex].cLength() >= 10) output("Your [pc.cockOrStrapon " + cockIndex + "] is so long that you can push part way up through their bodies, sandwiching yourself in and leaving girl-cum on their stomachs. ");
	}
	
	output(" At this point, you’re so on edge that a light breeze blowing the right way could tip you over; your [pc.cockOrStrapon " + cockIndex + "] enveloped between the two lovely ladies, you only manage a few thrusts before you go over the edge.");
	
	if (cockIndex >= 0) output(" You spray [pc.cum] through the length of their bodies, painting their pussies, torsos, and tits [pc.cumColor] with your [pc.cumNoun].");
	else output(" You quake with delayed orgasm, sending shivers through the pile of fem-flesh before you.");
	
	output(" They giggle through their kissing, grinding their hips and rubbing their wet pussies along your length, " + (cockIndex >= 0 ? "milking out every last drop of [pc.cum] they can get and rubbing it into each other’s bodies" : "drawing out every shake and shiver they can get from you and prolonging your climax") + ". You pass over the peak of climax and slow your thrusts, your shudders slowing down as well until finally you come to a stop.");
	
	output("\n\nOnce you’ve come down from your climax, you pull yourself from between them, and Yammi rolls off of Pippa. The two of them are quite filthy, sweaty, flushed, and covered in pussy juice" + (cockIndex >= 0 ? " and cum" : "") + ". You tell the two of them to go take a shower, and you’ll clean up the kitchen");
	
	if (crewRecruited().length > 2) output(" before anybody can see the state it’s in");
	
	output(".");
	
	output("\n\n<i>“You got it, Boss.”</i>");
	
	output("\n\n<i>“Thanks, " + pippaCallsSteele() + ".”</i>");
	
	pippaDominance(-1);
}