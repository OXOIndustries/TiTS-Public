/*Author: Savin
Notes

The Bath House is a public building built over a natural hot spring under Kressia. The house is run by a semi-religious order of female monks, who treat cleansing as a right everyone deserves -- they wear veils to stop themselves from discriminating against offworlders and Federation troops in town. 

PC can talk to the Mistress to get different services (at a very small fee), the least of which is access to the public bath. More expensive options include private baths, getting bathed by lusty myr girls, and getting a honey-scrub from their tits.
*/

public function bathHouseBonus():Boolean
{
	//Small chance to add if PC's fucked Lieve before:
	if(hasFuckedLieve()) output("\n\nLieve is relaxing on a couch with a few other Federation troops, laughing and grinning with the other soldiers. She sees you hanging around and gives you a friendly wave.");
	addButton(0,"Matron",approachBathMatron,undefined,"Matron","Talk to the matronly ant-woman about what services the bath house offers.");
	return false;
}

public function showMatron():void
{
	showName("GOLD\nMATRON");
	showBust("MATRON_OSERRE");
}

//[Matron] / Bath House Menu
public function approachBathMatron():void
{
	clearOutput();
	showMatron();
	output("You walk over to the desk, and with preternatural awareness, the veiled woman behind it turns her perpetual smile your way. <i>“Welcome, my child,”</i> she says, spreading her four arms out invitingly. The way she moves, her silken white robe strains against the belt around her waist, trying desperately to come undone and reveal the clearly curvaceous figure underneath. <i>“How may we serve you?”</i>");
	processTime(2);
	clearMenu();
	addButton(1,"Talk",talkToMatronAbootBathHooose,undefined,"Talk","Ask about her and the bath house itself.");
	if(pc.credits >= 50) addButton(0,"Public Bath",publicBathSlutBitchComeOnYouDipshitBastardInsertCurseWordsHere,undefined,"Public Bath","Give the matron a few credits to use the public bath.");
	else addDisabledButton(0,"Public Bath","Public Bath","You can't afford the 50 credits it would cost to use the public bath.");
	addButton(14,"Leave",mainGameMenu);
}

//Talk: Bath House
//Tooltip: Ask about her and the bath house itself. 
public function talkToMatronAbootBathHooose():void
{
	clearOutput();
	showMatron();
	if(flags["TALKED_ABOOT_BATH_HOUSE"] == undefined)
	{
		output("<i>“I’m new around these parts,”</i> you admit. <i>“Would you mind telling a little bit about this place?”</i>");
	}
	else if(pc.isNice()) output("<i>“Sorry to ask again, but would you mind telling me about this place again?”</i>");
	else output("“Mind running me through this place again?”");

	output("\n\nThe woman smiles warmly at you, clasping her four arms in front of herself. <i>“Of course. I am Matron Oserre, headmistress of the girls here. The pleasure of our guests is my responsibility.”</i>");
	output("\n\nShe sweeps an arm around the lobby in a grand gesture, as if to indicate the whole of the building and every soul within it. <i>“This bath house is a sacred place to our order. Nowhere on Myrellion will you find a place like it, so close to the scalding source of the hot springs beneath us, and so overseen by an order of maidens dedicated to the pleasure and service of those who wish to cleanse themselves in body and spirit.”</i>");
	output("\n\nSpiritual cleansing? <i>“This order of yours is religious?”</i>");
	output("\n\n<i>“Spiritual,”</i> the matron gently corrects. <i>“We have been custodians of this spring for several centuries. Our order teaches us that in the same way that the body accumulates dirt and grime in the harshness of life, so too does the spirit accumulate a growing darkness over time. We must wash away the grime that gathers on the soul, don’t you think? My sisters and I exist to provide you and any who come through our doors with that cleansing: of the body, of course, but each of us is trained in many, many ways to impart spiritual quiescence upon those who call upon us.”</i>");
	output("\n\nMatron Oserre ends that thought with a decidedly sultry note, and the slight movements of her insectile arms draw your gaze to the tremendous swells of her honey-swollen bosom. Something tells you these <i>“spiritual cleansings”</i> on offer are going to involve you getting a very happy ending.");
	output("\n\nAfter giving you a moment to mull that over, Oserre continues, <i>“We offer many services here, of course, and ask nothing more for them than a small donation to help us ensure the house remains in pristine condition for many centuries to come. The most common is the use of the public bath: there’s nothing truly special about that service beyond access to the hot springs, and the company of several dozen young women also enjoying our service. You can also ask for a private bath, of which we have several, if you prefer your privacy... or the company of one of my sisters in the order, who can perform her cleansing arts upon you. If your spirit is particularly heavy, several members of the house may tend to you at once...”</i>");
	output("\n\nYou’re starting to wonder of <i>“libido”</i> and <i>“spirit”</i> mean the same thing in the myr tongue.");
	output("\n\n<i>“So, my child,”</i> Matron Oserre says with an expectant smile, <i>“how may we best bring you pleasure today?”</i>");
	processTime(5);
	flags["TALKED_ABOOT_BATH_HOUSE"] = 1;
	clearMenu();
	addDisabledButton(1,"Talk","Talk","You just finished that.");
	if(pc.credits >= 50) addButton(0,"Public Bath",publicBathSlutBitchComeOnYouDipshitBastardInsertCurseWordsHere,undefined,"Public Bath","Give the matron a few credits to use the public bath.");
	else addDisabledButton(0,"Public Bath","Public Bath","You can't afford the 50 credits it would cost to use the public bath.");
	addButton(14,"Leave",mainGameMenu);
}

//Public Bath
//Tooltip: Give the matron a few credits to use the public bath.
//Cost: 50 Credits
public function publicBathSlutBitchComeOnYouDipshitBastardInsertCurseWordsHere():void
{
	clearOutput();
	showName("PUBLIC\nBATHS");
	author("Savin");
	pc.credits -= 50;
	output("<i>“I’d like to use the public bath,”</i> you tell the veiled matron, reaching for your Codex. She nods, and the digital kiosk next to her seems to respond to your voice, flickering over to a purchase screen. You swipe your Codex across it, letting the automated payment system drain your account. When it chimes an affirmative, the matron sweeps one of her arms towards a long, open hallway across from the counter. Another of her arms hands you a soft white towel, and a third directs you towards a changing room for your sex. You thank the matronly ant and head on over to the locker room.");
	if(pc.mf("guy","") == "guy") output("\n\nYou have the men’s room pretty much all to yourself. You select a locker from along a long row and stow your [pc.gear] in it. A sign directs you to a small shower, insisting you scrub with soap and water before entering the hot spring pool. You do so, taking your time since you’re the only person around, and make sure to scrub as thoroughly as possible before exposing yourself to a crowd of aliens. Once finished, you wrap yourself up in your towel, enjoying the wooly warmth of it against the muggy heat radiating through the bath house, and head on towards the wide open room at the end of the hall.");
	else 
	{
		output("\n\nThe women’s room is a bustling cavalcade of insectile women: mostly curvaceous gold myr, laughing and chatting and utterly unashamed of their nakedness. Dozens of sets of honey-laden breasts and abdomens are on display for you, jiggling and bouncing as the golden women either dress or divest themselves.");
		output("\n\nYou find an open locker and start to stow your gear.");
		if(pc.hasCock()) output(" You’re acutely aware of several sets of insectile eyes wandering between your [pc.legs] as you get ready for your bath. Given the gender disparity among the myr, you wonder how many of these girls have never seen a cock before.");
		output("\n\nA sign directs you to a small shower, insisting you scrub with soap and water before entering the hot spring pool. You do so, quickly running through the shower when the small line allows, before wrapping yourself up in a towel and heading off towards the wide open room at the end of the hall.");
	}
	//Combine:
	output("\n\nYou follow a train of giggling gold myr down the hall and through an archway that leads out into the open chamber at the rear of the bath house. You find a tremendous rectangular pool stretching from side to the side of the chamber, surrounded by a slender marble walkway allowing you to enter from any side you want. A second <i>“floor”</i> of the pool sits above the first, smaller and absolutely steaming with heat, pouring its bounty down in a waterfall into the first. Several dozen young women are bathing away, either reclining on the seats ringing the pool or splitting off into small groups that are bathing each other. Even a few red myr are in here, usually alone and awkwardly watching the giddy golds, though some are trying to adapt to the alien environs they find themselves in.");
	output("\n\nSteam rises in a heady mist through the room, wafting up off the hot spring water in a way that leaves a haze through the room. You breathe deep, and find your nose overwhelmed with the unmistakable smells of hot salts and honey. You eagerly circle the bath, slipping out of your towel and looking for a perfect place to hop in...");
	processTime(13);
	pc.shower();
	//CHOOSE A TARGET!
	clearMenu();
	addButton(0,"Red Officer",chooseRedOfficerForBathShenanigansIllPistolWhipTheNextPersonWhoSaysRedOfficerWhatDidYouThinkIdSayShenanigans,undefined,"Red Officer","You catch sight of a very uncomfortable red myr woman sitting at the back of the upper pool. She's naked, revealing a body of albino-pale flesh and crimson plates, though one of her arms is guardedly wrapped around her chest to preserve some measure of her modesty. She looks like she could use some friendly company... or a little loosening up.");
	addButton(1,"Honeypot",honeyPotFunTimes,undefined,"Honeypot","There's a gold myr woman on the second tier with a rack you can hardly believe: she's rocking a pair of breasts too large to be constrained by any bra you've ever seen. Her tits float like a pair of balloons, strained to the absolute physical limit with an overabundance of myr nectar. She'd probably appreciate someone attending to those awesome curves of hers...");
	//Alone
	//Tooltip: You don’t want to bathe with anybody else in particular. Just go in, get clean, and get out.
	addButton(2,"Alone",batheAloneYouSloot,undefined,"Alone","You don’t want to bathe with anybody else in particular. Just go in, get clean, and get out.");
	addDisabledButton(14,"Back","Back","No backing out now. You might as well get a bath!");
}

public function showRedMyrOfficer():void
{
	showName("RED MYR\nOFFICER");
	showBust("MYR_RED_GUARD");
}

//Red Officer
//Tooltip: You catch sight of a very uncomfortable red myr woman sitting at the back of the upper pool. She's naked, revealing a body of albino-pale flesh and crimson plates, though one of her arms is guardedly wrapped around her chest to preserve some measure of her modesty. She looks like she could use some friendly company... or a little loosening up. 
public function chooseRedOfficerForBathShenanigansIllPistolWhipTheNextPersonWhoSaysRedOfficerWhatDidYouThinkIdSayShenanigans():void
{
	clearOutput();
	showRedMyrOfficer();
	author("Savin");
	output("You wander on up the stairs and make your way towards the obviously out-of-place red myr at the pool’s back end. She’s attractive enough: short black hair that falls in straight ridges around her elfin ears, and full red lips that match the color of her chitinous plates. A pair of insectile feelers spring up from her brow, tucked low to her head like a nervous puppy’s ears. Seeing you drawing near, the red-plated myr girl perks up a bit, shooting glances your way.");
	output("\n\n<i>“Mind if I join you?”</i> you ask, nodding towards the crowded bath as if to say there’s nowhere else to sit. Not entirely true, but it’s a good enough in.");
	output("\n\nDespite the fact that you were looking her way the whole way up, she still acts like it’s a total surprise you’re talking to her. <i>“Uh, s-sure,”</i> she mumbles, scooting over along the stone seat at the edge of the pool to make room for you. Giving her an appreciative nod, you toss your towel aside - and give the svelte red ant a front-row view of your buck naked body before you slide yourself down into the pool beside her.");
	output("\n\nThe water’s hot enough that you end up sucking in a sharp breath as you try and enter. It’s hotter than you expected, burning at your [pc.skinFurScales]. Clearly this fiery ant-babe picked the hottest part of the bath to recline in. You put on a brave face, at least until the water gets near your crotch; after that, all you can do is sink down until ");
	if(pc.isTaur()) output("your bestial body is resting on the floor of the pool");
	else output("you’re sat on the stone shelf beside her");
	output(". The red woman regards you with cold, black, insectile eyes, apparently not quite sure what to make of you");
	if(pc.hasCock()) output("... though you’re keenly aware of her furtive glances towards your [pc.cock], which you make little effort to hide from view");
	output(".");

	//PC has a Cock Version:
	if(pc.hasCock())
	{
		output("\n\n<i>“I-Is that a...”</i> your bathing companion ventures to ask after several silent seconds, her eyes now firmly affixed on your exposed loins. You’re almost sure she’s flushed a darker shade of red all of a sudden, despite the obvious public nudity she’s been exposed to since she arrived. Then again, as far as you can see, you’re the only person in the bath packing a [pc.cock].");
		output("\n\nYou imagine most myr must not get to see a lot of dick in their lives - you’ve barely seen any men at all on the planet, after all.");
		output("\n\nActivating the old Steele charm, such as it is when you’re already this close, you give the red myr a nod and slightly shift your [pc.legs] to emphasize your package. Her eyes rapturously follow your movements, a pair of black orbs stark against her rosy skin that betray nothing. The rest of her body, though, is not quite so subtle: you appreciatively note that the arm that was covering up her breasts droops down into the water, revealing a pair of succulent D-cups, each peaked by a stiff red nipple just poking out over the lip of the water. She chews on her lips, clearly trying to hold back... and rapidly faltering.");
		output("\n\n<i>“I’ve never been this close to a male myr before,”</i> she confesses, sliding ever so much closer to you along the marble bench. Blushing even darker, she mumbles out a nervous <i>“C-can I, uh... oh, what am I doing! Never mind, I’m sorry, I-”</i>");
		output("\n\nYou smile at the flustered red and urge her to speak her mind. After all, there’s not a lot of point in holding back in room full of naked women. She flicks her eyes between your face and your cock, her mouth moving silently as if she’s churning through words to find just the right ones.");
		output("\n\nThe anticipation she manages to build up climaxes in an almost hilariously simple statement: <i>“Can I... touch it?”</i>");
		output("\n\nLeave it to a red myr to be direct. Still, that’s the response you were hoping for - if a little sooner than you were expecting. Poor thing’s never had the chance to get her hands on another dick before, you imagine. Smiling at the cock-hungry ant-girl, you lean back against the stone side of the bath and pat your thigh invitingly. Your bathing partner’s eyes go a bit wider, as if she expected you to refuse her lewd request.");
		output("\n\nWith the steam boiling off the bath water acting as a shroud, and being as isolated from the cavorting golds as you are, there’s not <i>too</i> much risk of detection - but just enough to give your heart a little flutter as the red beauty starts to snake one of her hands up your [pc.leg]. She’s feeling much the same way, you reckon, if the furtive glances she’s constantly shooting through the steam are any indication. For what comfort it’s worth, you slip an arm around your partner’s shoulders, pulling her nice and close.");
		output("\n\nShe rewards you with a bashful smile, and her pale fingers brush tantalizingly along the length of your [pc.cock]. Her fingers caress your shaft, exploring every inch of hardening cockflesh: a pair of digits gently circles your [pc.cockHead], brushing across your slit and glans with eager intensity. The hesitation your red myr compatriot showed before evaporates over the span of time it takes to move from your crown to base, replaced by a hungry relish. With the hot spring’s water acting as lube, her hand glides across your [pc.cock] in smooth, strong motions. You’re reminded just how much stronger the average myr is than a human with every stroke: her powerful grip pumps your schlong with a mix of firmness and reverence that has you struggling to suppress moans of pleasure before she’s even found her rhythm.");
		output("\n\nYou recline against the bath’s side and close your eyes. You did come to the bath house to relax, after all.");
		output("\n\n<i>“It’s... softer than I imagined,”</i> the red woman whispers, so quiet that you can barely hear her. <i>“It’s almost delicate.”</i>");
		output("\n\nNot exactly a word you’d have used to describe a [pc.cock], but she seems deeply infatuated with your prick regardless. You let her have her fun, and enjoy the pleasure her experimental motions give you. She lacks skill, as you’d expect, but the red ant makes up for it in sheer intensity. Her hands pump your shaft faster as she gains confidence, bringing you steadily closer to a quick climax shrouded by the rising veil of steam.");
		output("\n\n<i>“Getting... getting close, there,”</i> you warn her, reaffirming your grasp on her shoulders.");
		output("\n\n<i>“Close to - oh. Oh!”</i> she answers with a gasp, black eyes going wide. <i>“Should I stop? I don’t want to stop, but...”</i>");
		output("\n\nYou vigorously shake your head - no way you’re walking out of this with blue balls. Besides, this cock-craving red needs to see the full breadth of what your [pc.cock] can do. You’d hate for her first time with one to end on a low note, after all.");
		output("\n\nSeeing your response, the red woman murmurs, <i>“You can’t just cum in the water, right? That’s absolutely not okay!”</i> After a second, she adds a little less sure of herself: <i>“Right?”</i>");
		output("\n\nYou roll your eyes and tell the first-timer what to do:");
		pc.lust(500);
		processTime(22);
		clearMenu();
		//Ride Dick
		if(pc.cockThatFits(100) >= 0) addButton(0,"Ride Dick",rideDickWithRedMyrSloot,undefined,"Ride Dick","Pull your anonymous lover up and onto your cock before you blow. Give her the full experience!");
		else addDisabledButton(0,"Ride Dick","Ride Dick","You're too big to fit inside her.");
		addButton(1,"Water Nut",waterNutBustAttack,undefined,"Water Nut","Be naughty and bust your nut in the water. The locals might not like it... or maybe they will, cock-starved and horny as they seem to be.");
		addButton(2,"Swallow",swallowThisLoadYonderOcifer,undefined,"Swallow It","Get her under the water to swallow your load.");
	}
	//PC No-Cock Version
	else
	{
		output("\n\n<i>“Hi,”</i> you say, as disarmingly as you can. <i>“");
		if(pc.isNice()) output("I’m a little out of place here, too.");
		else if(pc.isMischievous()) output("New in town, too?");
		else output("You look like a better time than the bimbos piled up here.");
		output("”</i>");

		output("\n\nThat seems to make her relax a little, enough to admit, <i>“I kind of stick out here like a sore thumb, right?”</i>");
		output("\n\nYou have to admit, that’s what drew you over here in the first place. Outsiders have to stick together, right?");
		output("\n\nThat earns you a slight smile and a nod. <i>“I guess I’m glad to have company, then. This place is strangely lonely, for how full of people it is.”</i>");
		output("\n\n<i>“I can imagine,”</i> you say, figuring she means more than just the bath house.");
		output("\n\nIt takes a while to get the red myr woman to open up much more than that: like most of her kind, you get the feeling she’s a woman of few words, and those she speaks seem carefully chosen. Still, the longer you talk, the more she relaxes, slowly growing accustomed to your presence. Eventually, you conversation distracts her enough that her plated arm falls away from her bust, revealing a pair of succulent D-cups, each tipped with a rose-red teat. Your eyes hang on them as if the two perfect mounds had a hypnotic power; if your stacked companion notices, she makes no move to hide them again.");
		output("\n\nStill, you can see the obvious tension under the red ant’s skin. The bath waters may be relaxing you, but whatever stress she came here to burn off doesn’t seem to be quick to leave. Maybe you could help her out with that... Flashing the red soldier a disarming smile, you mention that she seems pretty stressed out, and that you know just the thing to help her relax.");
		output("\n\n<i>“Oh?”</i> she asks, perking up a touch. <i>“I only came here because my trench wives said this place would be relaxing... so far, I just feel even more off than when I came in.”</i>");
		output("\n\nWell, you have the solution. Still smiling, you ask her if she’s ever had a massage - a staple of any good spa where you’re from.");
		output("\n\n<i>“Uh, no, I guess I haven’t,”</i> she answers after a moment of thought. <i>“Are massages what you star-walkers use to... unwind?”</i>");
		output("\n\n<i>“Exactly. Want me to show you?”</i>");
		output("\n\nShe nods with surprising eagerness - you’re not sure if she’s desperate, or if she’s been as into you as you were to her the whole time, and just didn’t know how to show it.");
		output("\n\nYou tell your red myr companion to turn around on her knees and brace the edge of the pool. The bath house isn’t exactly a massage parlor, but it’ll serve your purposes. Especially with a thick veil of steam that’ll keep anybody from getting too good a look at what the two of you are getting up to.");
		output("\n\nYour partner does as you’ve asked, turning around and getting on her knees, bracing so that most of her torso is above the water line. You wade out behind her, making sure to coat your hands in scalding springwater before reaching out to massage her shoulders. Her whole body tenses the second you touch her, and you’re sure you hear a startled gasp over the burble of the spring. She doesn’t pull away, though, and as your fingers start to dig into her, she slowly relaxes into your grasp.");
		output("\n\nYou’re not exactly trained in the art, but you know just enough to be pleasurable for your companion. With firm, easy motions, you work your hands along the extent of her shoulder blades and upper arms, slowly massaging out all the tension. The gasp you heard earlier is followed up by a muted little moan as the red myr start to enjoy your ministrations. Now you’re making some headway! Grinning to yourself, you start to move ever so slowly downwards, caressing her muscular back inch by inch. She really is built like a fighter - that much is obvious from the powerful curves of feminine strength you’re working with. It’s almost a little intimidating as you draw lower and lower, nearing the tight, firm butt almost pressing against you and not knowing how she’ll react if you take it just a little farther.");
		output("\n\n");
		if(silly) output("#YOLO");
		else output("Who dares, wins.");
		output(" You weave your way down beneath the water’s surface, letting your hands play across her tight behind. You’re treated to another gasp, a sharp suck of breath the moment your fingers caress the myr’s ass, but to your delight she presses back against your hand a moment later. She likes it!");
		output("\n\nYou slip a little closer behind her, groping and squeezing that firm behind of hers until her back is flush with your [pc.chest]. Something tells you the poor red myr’s never had anything like this happen to her before: she just doesn’t know what to do! The myr alternates between moaning, gasping, and grinding against your hand. It’s hard to resist the urge to slip your hand down between her legs and see what she thinks about a little fingering.");
		output("\n\nYou resist the temptation of her rose-red honeypot, and instead begin the long journey up around around her slender frame. Your hands glide along her flat belly, up to the tantalizing mounds of her heaving breasts. This time she doesn’t even gasp when you start to grope her, but just leans back against you, wrapping an arm around your [pc.hip] and letting you have your way with her body - utterly and completely at your mercy. And here you thought all red myr were the dominant types...");
		output("\n\n");
		if(pc.isTreated() && pc.isBro()) output("After that, it’s just like milking a cow-girl! ");
		output("Your hands cup and caress her heavy teats, squeezing every so gently to massage the pent-up nectar inside to bubble up from her stiff nipples. The myr woman gives a lurid moan as a squirt of amber liquid ejaculates from her breasts, splattering across the poolside and soaking your fingers.");
		output("\n\n<i>“Oh... oh fuck,”</i> the red ant moans, eyes fluttering as unexpected and overwhelming pleasure floods her mind. The more she moans, the more vigorously you molest her chest, squeezing harder to milk all the sweet nectar from her tits. It doesn’t take a genius to sense her reaching towards climax, spurred on by your unceasing attentions. Just a little more, and...");
		output("\n\n<i>“Too much!”</i> the ant pants, trying to whisper but ending up giving you a whorish moan. <i>“Toomuchtoomuch!”</i>");
		output("\n\nShe seizes up, breath catching in her throat as the pleasure that’s been building up inside her comes to a cataclysmic head. Her breasts spray nectar like a geyser, discharging their lactic load across the stoney poolside. You just squeeze her breasts harder, milking out all that sweet nectar - and keeping the insensate ant-girl writhing with pleasure all through her boobgasm.");
		output("\n\nWhen she finally calms down, the myr woman is left panting and gasping, leaning heavily back against you. <i>“These... massages... incredible...”</i> she breathes, eyes rolling closed in the afterglow. You grin down at her and start to lick the sweet, thick honey off of your fingers. While you do so, the exhausted ant-girl slips out of your arms and flops down against the pool side, leaving you to clamber out of the pool and go get cleaned up.");
		pc.lust(20+rand(10));
		processTime(21);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Swallow
//Tooltip: Get her under the water to swallow your load
public function swallowThisLoadYonderOcifer():void
{
	clearOutput();
	showRedMyrOfficer();
	author("Savin");
	output("<i>“Hope you can hold your breath,”</i> you say, pointing down at your tumescent member. After a brief moment of consideration, the red myr gives you a firm nod and takes a deep breath before disappearing under the steaming water. Brave girl!");
	output("\n\nYou lean back and spread your arms around the lip of the pool, shifting ever so slightly on your butt to give the myr woman a better angle on your [pc.cock]. Her lips find your crown just as you’re about to pop, and she earns herself a blast of [pc.cumNoun] right down the throat in the same second. You feel her thrash around, clearly not expecting the sheer force of your pent-up load. Still, she carries on like a trooper, ramming herself down on your shaft with remarkable eagerness - you’re soon pumping your seed straight down her straining throat.");
	output("\n\nThe red soldier’s able to hold her breath for what seems like an eternity, staying down beneath the water’s surface to suck and stroke your shaft until you’re half-sure she’s about to pass out. Only after she’s sucked down every drop of spunk does your lover surface, breaching the water with a hair-flip that sends a cascade of water splashing over the stone rim of the pool.");
	output("\n\n<i>“That was... the taste... I’ve never experienced anything like that,”</i> she babbles, trying to regain some measure of composure - a valiant effort when you’re wiping a little stain of [pc.cumNoun] off the corner of one of her lips. You can’t keep yourself from smiling after that.");
	output("\n\n<i>“I should go,”</i> she says, running a hand through her hair. <i>“Dry off, I mean. I’ve got to get cleaned up.”</i>");
	output("\n\nAmazing how dirty you can get in a bath! You give her a friendly nod, and reach up to grab a handful of fleshy, rounded butt as she climbs out of the pool. Your newfound lover gives you a wink over her shoulder and vanishes off down the hall towards the dressing room. You lean back and relax, enjoying the afterglow...");
	processTime(6);
	pc.orgasm();
	//[Next]
	clearMenu();
	addButton(0,"Next",antMouthNutBustEpilogue);
}

//Pass ~30 minutes
public function antMouthNutBustEpilogue():void
{
	clearOutput();
	showName("PUBLIC\nBATH");
	author("Savin");
	output("Eventually, you get tired of just sitting around. You’re as relaxed as you can be by the time you haul yourself up out of the hot spring and grab your towel. It’s a quick process to dry yourself off on the way back to the locker room, passing several gold myr on the way to the baths as you go. You toss your towel into a hamper next to your row of lockers and grab your [pc.gear], kitting back up before returning to the lobby.");
	//[Next]
	//Back to Bath House main room
	processTime(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Water Nut
//Tooltip: Be naughty and bust your nut in the water. The locals might not like it... or maybe they will, cock-starved and horny as they seem to be.
public function waterNutBustAttack():void
{
	clearOutput();
	showRedMyrOfficer();
	author("Savin");
	output("<i>“It’ll be fine,”</i> you urge, caressing your red lover’s cheek. <i>“Just keep stroking it... just like that.”</i>");
	output("\n\nYour partner looks worried, casting nervous glances between you, your [pc.cock], and the nearest clump of gold myr currently occupied in washing each others’ hair. She chews her lip, trying to think... but her indecision just carries you over into orgasm. You throw your head back and grunt as the first spurt of [pc.cumNoun] spurts into the spring water. ");
	if(pc.cumType != GLOBAL.FLUID_TYPE_CUM) output("A wispy cloud of [pc.cumColor] spreads out from your crotch, blighting the water around you with inhuman spunk. ");
	output("Thankfully, it dissipates quickly, spreading out through the pool before anybody notices. You can’t help a dirty smile that spreads across your face, knowing that more than a dozen beautiful girls are quite literally swimming in your spunk now.");
	output("\n\nYour partner looks horrified, mouth agape as your sperm vanishes into the pool. <i>“You... you...”</i> she gasps, staring. <i>“So that’s what that looks like.”</i>");
	output("\n\nYou can’t help but laugh - and moan, as her hands continue to pump your shaft. You have to pull her off, explaining that you’re way too sensitive for that right after orgasm. Her hand lets go instantly, letting you catch your breath in the wake of your climax.");
	output("\n\n<i>“I, um, I should go,”</i> your red lover murmurs, glancing at the nearby golds. <i>“Gotta get ready for duty.”</i>");
	output("\n\n<i>“Of course,”</i> you say, watching her clamber out of the pool and slip away into the locker rooms. Poor thing’s so flustered!");
	output("\n\nChuckling to yourself, you hop out of the pool a minute later and grab your towel, heading back to your own locker to collect your gear. You catch sight of your red companion just as she’s heading out the front door, stopping just long enough to give you a wave before she departs.");
	processTime(9);
	pc.orgasm();
	//[Next]
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ride Dick
//Tooltip: Pull your anonymous lover up and onto your cock before you blow. Give her the full experience!
//Note: Pretty small capacity, I’d imagine. Nothing bigger than a 10”</i> dick.
//Capacity: 100
public function rideDickWithRedMyrSloot():void
{
	clearOutput();
	showRedMyrOfficer();
	author("Savin");
	var x:int = pc.cockThatFits(100);
	output("<i>“If you don’t want it in the water, how about in you?”</i> you grin, reaching over and grabbing your virginal lover under the arms. She has just enough time to gasp and squeal before you’ve spun her around and into your lap, her slit grinding tantalizingly against your cockhead. Not much time left...");
	output("\n\nShe blinks at you, black eyes looking so awe-filled that they might just pop out at any moment. <i>“You want to cum inside me?”</i> she murmurs, still pumping your prick hard enough that she’s got to be battering her fist against her own crotch. <i>“I’ve never had...”</i>");
	output("\n\n<i>“Just slide it in!”</i> you groan, using your grasp on her underarms to try and guide her down onto your rod. She gives you a nervous look, but slowly allows you to move her down. You just about lose what’s left of your willpower when your [pc.cockHead " + x + "] brushes the quivering lips of her sex, pushing firmly against her tight little box. You can tell she was serious about never having handled a cock before: it’s a struggle to get her to loosen up enough for you to actually enter her.");
	pc.cockChange();
	output("\n\nThe surge of vice-like pleasure is enough to push you over the edge, barely giving you enough time to thrust in ");
	if(pc.cockVolume(x) <= 65) output("to the hilt");
	else output("until you’re battering the back of the myr’s cunt");
	output(" before you blow your load. You lover gasps and clenches down with crushing power, wrapping her arms around your neck and mashing her breasts into your face. You’re sure there’s more than a few eyes on the two of you now, watching with mirth as the buxom red rides her very first dick.");

	output("\n\nNot that her ride lasts very long. You flood her pussy with a thick creampie, and find yourself sighing with relief as your load finds a nice, hot home for itself. Your lover puts a hand on her belly, trying to appraise the alien sensation - and completely oblivious to the jealous looks she’s getting from the assembled gold myr around her. She spends a few more minutes in your lap, just enjoying the feeling of fullness, before she suddenly blinks and comes back to her senses.");
	output("\n\n<i>“What did... did we just...”</i> she starts, looking frantically around the bath house and suddenly keenly aware of the stares coming your way. Blushing with embarrassment, the red beauty leaps to her feet and scampers out of the pool and towards the locker room... drooling your seed down her thighs all the way.");
	output("\n\nYou just smile and sit back in the pool, enjoying the afterglow and the nice, hot water...");
	processTime(18);
	pc.orgasm();
	//[Next]
	clearMenu();
	addButton(0,"Next",bustANutMidMyrEpilogue);
}

public function bustANutMidMyrEpilogue():void
{
	clearOutput();
	showName("BATH\nHOUSE");
	author("Savin");
	output("Eventually, you get tired of just sitting around. You’re as relaxed as you can be by the time you haul yourself up out of the hot spring and grab your towel. It’s a quick process to dry yourself off on the way back to the locker room, passing several gold myr on the way to the baths as you go. You toss your towel into a hamper next to your row of lockers and grab your [pc.gear], kitting back up before returning to the lobby.");
	processTime(20);
	//[Next]
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Gold Myr Girls
//Tooltip: A group of giggling gold myr girls are hanging around one corner of the lower pool, about a half dozen naked, curvaceous girls scrubbing each other's backs, washing their hair, and generally having a good time. The girls are definitely the highlight of the bath house, drawing looks from all around the pool. They look like a sure way to have a good time...

//Honeypot
//Tooltip: There's a gold myr woman on the second tier with a rack you can hardly believe: she's rocking a {Jacques00-sized bust // pair of breasts too large to be constrained by any bra you've ever seen}. Her tits float like a pair of balloons, strained to the absolute physical limit with an overabundance of myr nectar. She'd probably appreciate someone attending to those awesome curves of hers... 

public function showHoneypot():void
{
	showName("\nHONEYPOT");
	showBust("HONEYPOT");
}

public function honeyPotFunTimes():void
{
	clearOutput();
	showHoneypot();
	author("Savin");
	output("Sighting in on the golden honeypot with the gravity-defying bosom, you make your way over to the overly curvaceous ant. She sees you coming, regarding you with black insectile eyes that are impossible to read. She does, however, move a pair of her arms up to rest on the tops of her swollen mammaries, caressing the pale flesh that seems to glow with golden nectar just below the surface. Her nipples are as vibrant yellow as their bounty promises, both saucer-sized and begging to be suckled from.");
	output("\n\nYou’re hardly the only one eyeing the buxom babe, but as the only offworlder in the place, you think you might just be the one to catch her attention.");
	output("\n\nYou flash her a grin and disrobe, slipping into the scalding springwater just beside her. She returns your smile, lower arms cupping her hefty bosom provocatively. <i>“Hello, star-walker,”</i> the honeypot purrs, <i>“Did you come to get a snack while you bathe?”</i>");
	output("\n\nLeave it to a gold myr to be so forward.");
	output("\n\nThen again, she looks like she’s as much in need of a little drainage as you are for a taste of that sweet nectar of hers. The honeypot giggles at your reaction and leans back against the edge of the pool, squeezing her bosom between her four plated arms. A bead of crystal-flecked honey swells at the peak of each of her nipples, practically begging to be licked off. <i>“Don’t be bashful,”</i> she coos, <i>“It’s a well-laden myr’s duty to feed the people...”</i>");
	output("\n\nYou can’t argue with that! The gold woman pats her breasts invitingly, urging you closer through the misty springwater. You close the distance eagerly, sliding along the stone seat at the pool’s edge until you’re next to the stacked honeypot, able to reach over and cup one of her overladen breasts. Your fingers immediately are slathered in nectar, painted gold by the bounty of her breasts. She moans quietly, closing her eyes and inviting you to do with her body what you please.");
	output("\n\nStill cupping and caressing the pendulous mounds of golden flesh, you wade out into the water in front of her, swimming out just enough that your face is level with her rack. Your [pc.lips] close in one one of her saucer-sized teats, [pc.tongue] reaching out to clean the nectar from the tips of her stiffening nipples. She moans as you latch on, voice high and sultry; for your part, you suckle greedily from the reserve of nectar on tap.");
	output("\n\nYour snack is absolutely delicious, a stream of creamy candy-sweetness that floods your mouth just as quickly as you can drink it down. A pair of plated arms slip around your waist, pulling you deeper into the honeypot ant’s bosom. You’d never truly realized how perfect a pillow a pair of full tits could be until now, with your face completely submerged in boobflesh and your body wrapped in the hotspring’s warm embrace. The more you drink, the more relaxed and lethargic you feel, almost ready to fall asleep in the honey-ant’s embrace if it weren’t for the burning arousal flushing your [pc.skin].");
	output("\n\nInstead, you switch from one teat to the other, starting to drain the myr’s left bosom to help it match the right. Your belly’s quickly getting full of honey, sating the hunger that drove you to latch onto the busty ant, but the fuller you get, the more your lusts seem to drive you to molest the full mounds in front of you for your own pleasure. Your tongue flicks away from the very tip of her teat, caressing the broad surface of her dark nipple and running your hands along the swollen curvature of her breasts.");
	output("\n\nIt takes you a moment to realize your living snack-bar is moaning. She’s trying to stifle it, but the more you lick and kiss and caress her chest, the less restraint she seems able to show. With a wicked grin, you wonder if you can bring the honeypot to orgasm just by playing with those huge tits of hers...");
	output("\n\nThe answer, you quickly find out, is yes.");
	output("\n\nWish a splash, the honeypot’s hands leap up to her mouth, covering her mouth to catch a scream of pleasure. You dig your teeth into one of her nipples, rolling the stiff tip between your teeth and groping at the other with your hand. Nectar squirts out, splattering into the water in a glistening golden arc. All there is for you to do is keep doing what you’re doing, lavishing rough affection onto the swollen breasts as they steadily discharge their pent-up bounty into the pool, your mouth, and onto the honeypot herself. The two of you must look like a pair of honey-slathered messes by the time you think she’s finally calming down, gasping and panting and drooling honey from her dark mountaintops.");
	output("\n\n<i>“You </i>were<i> hungry, weren’t you?”</i> she giggles, giving a smile to the collected gold ant-girls who’re eying you both with a mix of hunger and arousal. <i>“Now look what you’ve done... I think there’s a line forming.”</i>");
	output("\n\nSo there is. You give the bunch of golds wading your way a sheepish smile, thank the honeypot for the snack, and haul yourself up out of the pool. You’ve had enough relaxation for one trip...");
	//[Next]
	//Pass 20 minutes
	pc.energy(pc.energyMax());
	pc.HP(pc.HPMax());
	pc.lust(10+rand(10));
	processTime(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Alone
//Tooltip: You don’t want to bathe with anybody else in particular. Just go in, get clean, and get out.
public function batheAloneYouSloot():void
{
	clearOutput();
	showName("PUBLIC\nBATHS");
	author("Savin");
	output("You decide to keep to yourself here, and find somewhere not crowded by bathing myr - not an easy prospect, considering how packed the place is. You manage to find somewhere to dip in though, and set your towel down out of splash radius before you slip into the water.");
	output("\n\nThe springwater is hotter than you expected, almost making you flinch. You have to bite your lip as your [pc.skinFurScales] slip into the steaming water, slowly but surely lowering yourself into the pool. A few gold myr girls look your way, clearly drinking in your naked body with interest, but you avoid their gazes for now. You slip into the water, shifting ");
	if(pc.isTaur()) output("your bestial body down into the bottom of the pool and resting your humanoid weight against the side of the pool");
	else output("down onto the stone seat on the edge of the pool");
	output(". You spread your arms out around the stone lip of the poolside, letting your body adjust to the heat.");

	output("\n\nSlowly, you find yourself starting to relax. You let out a long, heavy breath and sink into the pool almost up to your chin. The heat doesn’t bother you much longer, subsiding into a pleasant tingling that keeps you from drifting off.");
	output("\n\nYou spend several minutes lounging and watching the other bathers. Dipping down into the water, you soak your [pc.hair] and spend some time rubbing it into your [pc.skinFurScales]. Still, there’s not much to do in a bathhouse all by yourself other than just relax and enjoy the pleasant sensations of the hot spring bubbling under your ");
	if(!pc.hasFeet()) output("metaphorical ");
	output("feet. All you can do after that is enjoy yourself, and let the stress and tension of your adventures flood out of you...");

	//[Next]
	//Pass ~30 minutes
	pc.energy(pc.energyMax());
	processTime(15);
	clearMenu();
	addButton(0,"Next",batheAloneEpilogue);
}

public function batheAloneEpilogue():void
{
	clearOutput();
	author("Savin");
	showName("PUBLIC\nBATHS");
	output("Eventually, you get tired of just sitting around. You’re as relaxed as you can be by the time you haul yourself up out of the hot spring and grab your towel. It’s a quick process to dry yourself off on the way back to the locker room, passing several gold myr on the way to the baths as you go. You toss your towel into a hamper next to your row of lockers and grab your [pc.gear], kitting back up before returning to the lobby.");
	//[Next]
	//Back to Bath House main room
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}