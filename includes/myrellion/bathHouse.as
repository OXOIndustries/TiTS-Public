/*Author: Savin
Notes

The Bath House is a public building built over a natural hot spring under Kressia. The house is run by a semi-religious order of female monks, who treat cleansing as a right everyone deserves -- they wear veils to stop themselves from discriminating against offworlders and Federation troops in town. 

PC can talk to the Mistress to get different services (at a very small fee), the least of which is access to the public bath. More expensive options include private baths, getting bathed by lusty myr girls, and getting a honey-scrub from their tits.
*/

public function bathHouseBonus():Boolean
{
	//Small chance to add if PC's fucked Lieve before:
	if(hasFuckedLieve() && rand (5) == 0) output("\n\nLieve is relaxing on a couch with a few other Federation troops, laughing and grinning with the other soldiers. She sees you hanging around and gives you a friendly wave.");
	addButton(0,"Matron",approachBathMatron,undefined,"Matron","Talk to the matronly ant-woman about what services the bath house offers.");
	return false;
}
public function showOserre():void
{
	showMatron();
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
	if(pc.credits >= 50)
	{
		addButton(0,"Public Bath",publicBathSlutBitchComeOnYouDipshitBastardInsertCurseWordsHere,undefined,"Public Bath","Give the matron a few credits to use the public bath.\n\nCost: 50 credits");
		addButton(1,"PrivateBath",privateBathSelection,undefined,"Private Bath","Give the matron a few credits for a private bath.\n\nCost: 50 credits");
	}
	else
	{
		addDisabledButton(0,"Public Bath","Public Bath","You can’t afford the 50 credits it would cost to use the public bath.");
		addDisabledButton(1,"PrivateBath","Private Bath","You don’t have the money!\n\nCost: 50 credits");
	}
	addButton(2,"Talk",talkToMatronAbootBathHooose,undefined,"Talk","Ask about her and the bath house itself.");
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
	output("\n\nYou’re starting to wonder if “libido” and “spirit” mean the same thing in the myr tongue.");
	output("\n\n<i>“So, my child,”</i> Matron Oserre says with an expectant smile, <i>“how may we best bring you pleasure today?”</i>");
	processTime(5);
	flags["TALKED_ABOOT_BATH_HOUSE"] = 1;
	clearMenu();
	if(pc.credits >= 50)
	{
		addButton(0,"Public Bath",publicBathSlutBitchComeOnYouDipshitBastardInsertCurseWordsHere,undefined,"Public Bath","Give the matron a few credits to use the public bath.\n\nCost: 50 credits");
		addButton(1,"PrivateBath",privateBathSelection,undefined,"Private Bath","Give the matron a few credits for a private bath.\n\nCost: 50 credits");
	}
	else
	{
		addDisabledButton(0,"Public Bath","Public Bath","You can’t afford the 50 credits it would cost to use the public bath.");
		addDisabledButton(1,"PrivateBath","Private Bath","You don’t have the money!\n\nCost: 50 credits");
	}
	addDisabledButton(2,"Talk","Talk","You just finished that.");
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
	output("\n\nYou follow a train of giggling gold myr down the hall and through an archway that leads out into the open chamber at the rear of the bath house. You find a tremendous rectangular pool stretching from one side of the chamber to the other, surrounded by a slender marble walkway allowing you to enter from any side you want. A second <i>“floor”</i> of the pool sits above the first, smaller and absolutely steaming with heat, pouring its bounty down in a waterfall into the first. Several dozen young women are bathing away, either reclining on the seats ringing the pool or splitting off into small groups that are bathing each other. Even a few red myr are in here, usually alone and awkwardly watching the giddy golds, though some are trying to adapt to the alien environs they find themselves in.");
	output("\n\nSteam rises in a heady mist through the room, wafting up off the hot spring water in a way that leaves a haze through the room. You breathe deep, and find your nose overwhelmed with the unmistakable smells of hot salts and honey. You eagerly circle the bath, slipping out of your towel and looking for a perfect place to hop in...");
	processTime(13);
	pc.shower();
	//CHOOSE A TARGET!
	publicBathMenu();
}

public function publicBathBackMenu():void
{
	clearOutput();
	showName("BATH\nHOUSE");
	output("No, that won’t do. You back away and consider your options.");
	publicBathMenu();
}
public function publicBathMenu():void
{
	clearMenu();
	addButton(0,"Red Officer",chooseRedOfficerForBathShenanigansIllPistolWhipTheNextPersonWhoSaysRedOfficerWhatDidYouThinkIdSayShenanigans,undefined,"Red Officer","You catch sight of a very uncomfortable red myr woman sitting at the back of the upper pool. She’s naked, revealing a body of albino-pale flesh and crimson plates, though one of her arms is guardedly wrapped around her chest to preserve some measure of her modesty. She looks like she could use some friendly company... or a little loosening up.");
	addButton(1,"Honeypot",honeyPotFunTimes,undefined,"Honeypot","There’s a gold myr woman on the second tier with a rack you can hardly believe: she’s rocking a pair of breasts too large to be constrained by any bra you’ve ever seen. Her tits float like a pair of balloons, strained to the absolute physical limit with an overabundance of myr nectar. She’d probably appreciate someone attending to those awesome curves of hers...");
	//Alone
	//Tooltip: You don’t want to bathe with anybody else in particular. Just go in, get clean, and get out.
	addButton(2,"Alone",batheAloneYouSloot,undefined,"Alone","You don’t want to bathe with anybody else in particular. Just go in, get clean, and get out.");
	addButton(3,"GoldGroup",bathHouseGoldMyrGroup,undefined,"Gold Group","Several gorgeous gold myr mill about in a shallow corner of the lower pool, some engaged in washing their glistening bodies and some lying idle or playing in the water. Occasionally they call out to a patron that has worked up the courage to approach, inviting him or her to partake in their “amateur bathing service”. From the lascivious looks these sex bombs wear, there’s no doubt that their ministrations would be more intimate than an ‘official’ bathing attendant’s.");
	addDisabledButton(14,"Back","Back","No backing out now. You might as well get a bath!");
}


public function showRedMyrOfficer():void
{
	showName("RED MYR\nOFFICER");
	showBust("MYR_RED_GUARD");
}

//Red Officer
//Tooltip: You catch sight of a very uncomfortable red myr woman sitting at the back of the upper pool. She’s naked, revealing a body of albino-pale flesh and crimson plates, though one of her arms is guardedly wrapped around her chest to preserve some measure of her modesty. She looks like she could use some friendly company... or a little loosening up. 
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
	else output("you’re sitting on the stone shelf beside her");
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
		output("\n\nYou smile at the flustered red and urge her to speak her mind. After all, there’s not a lot of point in holding back in a room full of naked women. She flicks her eyes between your face and your cock, her mouth moving silently as if she’s churning through words to find just the right ones.");
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
		pc.changeLust(500);
		processTime(22);
		clearMenu();
		//Ride Dick
		if(pc.cockThatFits(100) >= 0) addButton(0,"Ride Dick",rideDickWithRedMyrSloot,undefined,"Ride Dick","Pull your anonymous lover up and onto your cock before you blow. Give her the full experience!");
		else addDisabledButton(0,"Ride Dick","Ride Dick","You’re too big to fit inside her.");
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
		output("\n\nYou resist the temptation of her rose-red honeypot, and instead begin the long journey up around her slender frame. Your hands glide along her flat belly, up to the tantalizing mounds of her heaving breasts. This time she doesn’t even gasp when you start to grope her, but just leans back against you, wrapping an arm around your [pc.hip] and letting you have your way with her body - utterly and completely at your mercy. And here you thought all red myr were the dominant types...");
		output("\n\n");
		if(pc.isTreated() && pc.isBro()) output("After that, it’s just like milking a cow-girl! ");
		output("Your hands cup and caress her heavy teats, squeezing every so gently to massage the pent-up nectar inside to bubble up from her stiff nipples. The myr woman gives a lurid moan as a squirt of amber liquid ejaculates from her breasts, splattering across the poolside and soaking your fingers.");
		output("\n\n<i>“Oh... oh fuck,”</i> the red ant moans, eyes fluttering as unexpected and overwhelming pleasure floods her mind. The more she moans, the more vigorously you molest her chest, squeezing harder to milk all the sweet nectar from her tits. It doesn’t take a genius to sense her reaching towards climax, spurred on by your unceasing attentions. Just a little more, and...");
		output("\n\n<i>“Too much!”</i> the ant pants, trying to whisper but ending up giving you a whorish moan. <i>“Toomuchtoomuch!”</i>");
		output("\n\nShe seizes up, breath catching in her throat as the pleasure that’s been building up inside her comes to a cataclysmic head. Her breasts spray nectar like a geyser, discharging their lactic load across the stoney poolside. You just squeeze her breasts harder, milking out all that sweet nectar - and keeping the insensate ant-girl writhing with pleasure all through her boobgasm.");
		output("\n\nWhen she finally calms down, the myr woman is left panting and gasping, leaning heavily back against you. <i>“These... massages... incredible...”</i> she breathes, eyes rolling closed in the afterglow. You grin down at her and start to lick the sweet, thick honey off of your fingers. While you do so, the exhausted ant-girl slips out of your arms and flops down against the pool side, leaving you to clamber out of the pool and go get cleaned up.");
		pc.changeLust(20+rand(10));
		pc.shower();
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
	pc.shower();
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
	pc.shower();
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
	if(x < 0) x = pc.smallestCockIndex();
	output("<i>“If you don’t want it in the water, how about in you?”</i> you grin, reaching over and grabbing your virginal lover under the arms. She has just enough time to gasp and squeal before you’ve spun her around and into your lap, her slit grinding tantalizingly against your cockhead. Not much time left...");
	output("\n\nShe blinks at you, black eyes looking so awe-filled that they might just pop out at any moment. <i>“You want to cum inside me?”</i> she murmurs, still pumping your prick hard enough that she’s got to be battering her fist against her own crotch. <i>“I’ve never had...”</i>");
	output("\n\n<i>“Just slide it in!”</i> you groan, using your grasp on her underarms to try and guide her down onto your rod. She gives you a nervous look, but slowly allows you to move her down. You just about lose what’s left of your willpower when your [pc.cockHead " + x + "] brushes the quivering lips of her sex, pushing firmly against her tight little box. You can tell she was serious about never having handled a cock before: it’s a struggle to get her to loosen up enough for you to actually enter her.");
	pc.cockChange();
	output("\n\nThe surge of vice-like pleasure is enough to push you over the edge, barely giving you enough time to thrust in ");
	if(pc.cockVolume(x) <= 65) output("to the hilt");
	else output("until you’re battering the back of the myr’s cunt");
	output(" before you blow your load. Your lover gasps and clenches down with crushing power, wrapping her arms around your neck and mashing her breasts into your face. You’re sure there’s more than a few eyes on the two of you now, watching with mirth as the buxom red rides her very first dick.");

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
	pc.shower();
	//[Next]
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Gold Myr Girls
//Tooltip: A group of giggling gold myr girls are hanging around one corner of the lower pool, about a half dozen naked, curvaceous girls scrubbing each other’s backs, washing their hair, and generally having a good time. The girls are definitely the highlight of the bath house, drawing looks from all around the pool. They look like a sure way to have a good time...

//Honeypot
//Tooltip: There’s a gold myr woman on the second tier with a rack you can hardly believe: she’s rocking a {Jacques00-sized bust // pair of breasts too large to be constrained by any bra you’ve ever seen}. Her tits float like a pair of balloons, strained to the absolute physical limit with an overabundance of myr nectar. She’d probably appreciate someone attending to those awesome curves of hers... 

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
	output("\n\nWith a splash, the honeypot’s hands leap up to her mouth, covering her mouth to catch a scream of pleasure. You dig your teeth into one of her nipples, rolling the stiff tip between your teeth and groping at the other with your hand. Nectar squirts out, splattering into the water in a glistening golden arc. All there is for you to do is keep doing what you’re doing, lavishing rough affection onto the swollen breasts as they steadily discharge their pent-up bounty into the pool, your mouth, and onto the honeypot herself. The two of you must look like a pair of honey-slathered messes by the time you think she’s finally calming down, gasping and panting and drooling honey from her dark mountaintops.");
	output("\n\n<i>“You </i>were<i> hungry, weren’t you?”</i> she giggles, giving a smile to the collected gold ant-girls who’re eying you both with a mix of hunger and arousal. <i>“Now look what you’ve done... I think there’s a line forming.”</i>");
	output("\n\nSo there is. You give the bunch of golds wading your way a sheepish smile, thank the honeypot for the snack, and haul yourself up out of the pool. You’ve had enough relaxation for one trip...");
	//[Next]
	//Pass 20 minutes
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	pp.breastRows[0].breastRatingRaw = 7;
	pp.breastRows[0].breasts = 2;
	pp.milkType = GLOBAL.FLUID_TYPE_NECTAR;
	pp.milkMultiplier = 100;
	pp.milkFullness = 100;
	pc.milkInMouth(pp);
	pc.changeHP(pc.HPMax());
	pc.changeEnergy(pc.energyMax());
	pc.changeLust(10+rand(10));
	pc.shower();
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
	output("\n\nThe springwater is hotter than you expected, almost making you flinch. You have to bite your lip as your [pc.skinFurScalesNoun] slip" + (InCollection(pc.skinType, [GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_FEATHERS]) ? "" : "s") + " into the steaming water, slowly but surely lowering yourself into the pool. A few gold myr girls look your way, clearly drinking in your naked body with interest, but you avoid their gazes for now. You slip into the water, shifting ");
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
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//scene intro
public function bathHouseGoldMyrGroup():void
{
	clearOutput();
	showBust("MYR_GOLD_BATHERS");
	showName("GOLD\nMYR GROUP");
	author("Zeikfried");
	output("<i>“Pardon.”</i>");
	output("\n\nThe ring of stunning gold myr turn toward you, presenting profiles of perky breasts and creamy stomachs. <i>“");
	if(pc.race() == "gold myr" || pc.race() == "red myr" || pc.race() == "myr") output("What a " + pc.mf("handsome","beautiful") + " myr we have here,");
	else output("The fetching offworlder is upon us,");
	output("”</i> remarks an especially curvy woman lounging in the center. <i>“We saw you come in. Are you... interested in our amateur bathing service?”</i> At the word ‘interested’, she stretches a hand out to you.");
	output("\n\nYou accept her hand and the myr pulls you into the small ring, which forms up around you. As you look over the faces, a tall bather to your left lays your towel aside, then steps closer and takes your free arm in hers, pressing her breast to your elbow surreptitiously. You glance at her and she returns a seductive stare that’s smoky enough to cook a ham.");
	output("\n\n<i>“We’re not officially affiliated with the bath house, but we’re just as ready to be of service,”</i> continues the apparent ringleader. <i>“We’d love to assist you with bathing, releasing tension, or even matters of spirit.”</i>");
	output("\n\n<i>“Just think of us as eager volunteers,”</i> the leggy beauty on your arm adds, <i>“and ask for whatever you’d like.”</i>");
	if(pc.hasCock())
	{
		output(" Your [pc.cocks] swell");
		if(pc.cockTotal() == 1) output("s");
		output(", half-erect from the implications. None of the girls bat an eye; one even smiles slightly at the outline.");
	}
	output("\n\n<i>“Now, will we have the pleasure of attending you?”</i> prompts the myr who spoke first.");
	output("\n\nWhat will you ask for ‘help’ with?");

	//choices - include ‘Nothing’ that returns to previous menu
	processTime(4);
	pc.changeLust(10);
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(200) >= 0) addButton(0,"Clean Penis",cleanMuhPenisYo,undefined,"Clean Penis","You have a hunch that they’d be quite adept at cleaning your penis.");
		else addDisabledButton(0,"Clean Penis","Clean Penis","You’re too big for the type of cleaning they’re liable to give...");
	}
	else addDisabledButton(0,"Clean Penis","Clean Penis","You don’t have a tallywacker to clean!");
	if(pc.hasVagina()) addButton(1,"Clean Vagina",cleanMuhVaginaYo,undefined,"Clean Vagina","Have them tend to your vagina.");
	else addDisabledButton(1,"Clean Vagina","Clean Vagina","You don’t have a vagina to clean!");
	addButton(14,"Back",publicBathBackMenu);
}

//Clean Penis - avail. when PC has at least one cock that’s within gold myr capacity
public function cleanMuhPenisYo():void
{
	clearOutput();
	showName("GOLD\nMYR GROUP");
	showBust("MYR_GOLD_BATHERS");
	var x:int = pc.cockThatFits(200);
	if(x < 0) x = pc.smallestCockIndex();
	author("Zeikfried");
	output("<i>“A nice, warm dip wouldn’t go amiss,”</i> you announce, waggling your half-stiff dick in the water.");
	output("\n\n<i>“Yes, of course,”</i> answers the long-legged temptress on your arm. One of her hands slides down your thigh and over to your groin, feeling the heft and thickness of your [pc.cock " + x + "]. Quietly, she begins to work the shaft. <i>“Let’s just see what we have, here.”</i>");

	processTime(1);
	clearMenu();
	addButton(0,"Next",cleanPenisPartDues,x);
}

public function cleanPenisPartDues(x:int):void
{
	clearOutput();
	showName("GOLD\nMYR GROUP");
	showBust("MYR_GOLD_BATHERS");
	author("Zeikfried");

	//norml cocks fuck the leggy myr (plus shy myr if tailcocked)
	if(pc.cockVolume(x) <= 100)
	{
		output("The slippery seductress smiles as her strokes bring your modest prick to erectness. <i>“I will be glad to personally oversee this,”</i> the tall myr says. The matronly woman opposite you folds her arms and smiles wanly as your self-declared overseer seats you in the waist-deep water. A gorgeous leg passes over you as she straddles your crotch, and the rest of the myr begin to wet your skin, expertly concealing your lower body from view.");
		output("\n\n<i>“I serve at your pleasure,”</i> your myr says, dribbling water down your ");
		if(pc.biggestTitSize() >= 5) output("busty ");
		else if(pc.tone >= 70) output("chiseled ");
		else if(pc.thickness <= 33) output("thin");
		output(" chest with cupped hands. <i>“Between you and I, I’m the best of us at seeing to a visitor’s needs.”</i> She leans close and wraps her arms around your neck, raising her lithe abdomen. You feel a hand on your [pc.cock " + x + "] for just a moment before it sinks down again, and your mouth opens involuntarily as your shaft’s bathed in heat - you’re already inside her.");
		pc.cockChange();
		output("\n\n<i>“Mmm... feeling good?”</i> she sighs, releasing your neck. She brushes her close-cut bob out of her face and smiles sweetly at you, then begins to shift her hips, and with them, her abdomen. The other women close in; the curvaceous myr seeks out your [pc.legOrLegs], rubbing tension away with her thumbs, and two other myr present themselves, massaging their soft, alabaster breasts. A pleasant perfume fills your nose as one presses up to your back and you feel her erect nipples poking at your [pc.skinFurScales]; the other brushes up against your arm, sliding it into her cleavage. A slippery sensation spreads wherever they touch, and you realize they must have been massaging perfumed bath oils into their skin while you were focused on your slim-waisted seductress.");
		output("\n\n<i>“How’s this?”</i> inquires the myr behind you, sweetly. Her oiled hands dance gently over you, searching for knots of tension in your shoulders. She locates one, and leans into you to work it out; you can feel her petite breasts through your back, rising and falling with her breath as she rubs, and your [pc.cock " + x + "] responds by swelling up a little bit more. The woman on your prick moans lightly as her tight sex is filled with more hard shaft, and the other myr all slow a bit, imagining the pleasure she must be experiencing.");
		output("\n\nThe woman at your arm squeezes her breasts against you, depositing dollops of myr nectar which she begins to work into your [pc.skin]. <i>“Do you like my special honey massage?”</i> she asks, popping two sweet fingers into your mouth. Your [pc.tongue] conforms automatically, lapping up the nectar and teasing the fingers apart to snake down to the bases. She slowly pulls them back out, savoring the feel of your lips, then rubs your saliva into her honeyed nipple with a smoldering look, completely distracted with her fantasies. The raunchy eye-fuck from your masseuse only brings your [pc.cock " + x + "] closer to bursting inside your slender lover.");

		//(tailcock)
		if(pc.hasTailCock())
		{
			output("\n\nA shock travels up your spine as fingers suddenly probe the opening at the end of your perverted, cock-concealing tail, touching the crown of the penis inside. <i>“What’s this?”</i> asks a very quiet voice. Both you and the girl astride your shaft look back to see a youthful myr of average height examining the end of your tail. She leans over for a closer look, and that’s when you notice her staggering bust - a pair of full, round DD-cup beauties dangling from her chest, begging for attention. Your tailcock slides out almost before you think of it, presenting its proud, veiny shaft and blood-engorged, puffy head to the mousey myr girl.\n\nHer eyes widen at the writhing, precum-slicked hot rod in her hand that seconds ago was an innocuous tail tip, and when she looks up and meets the gazes of you and your lover, still busily humping away, her whole skin blushes with embarrassment. Despite that, her thighs rub together and her nipples drool nectar... clearly, her body is far sluttier than she likes to admit. Your tail slips free of her hand, slick with [pc.cumVisc] pre-cum, and begins to press between her thighs. Looking away, the shy myr leans back and slides her abdomen forward to rest between her legs, presenting a target for your alien");
			if(pc.hasParasiteTail()) output(", parasitic ");
			else output(" tail-");
			output("cock to penetrate. She moans lightly and grasps one of her superb breasts as the thick tool enters her and begins to thrust, already near climax.");
		}

		output("\n\n<i>“Fuck me... I’m coming!”</i> the beauty in your lap moans, pulling your head into her breasts. Her tight ant cunt takes on a new dimension of pressure as her orgasm squeezes your [pc.cock " + x + "], and with all the creamy flesh, innuendo, and rubbing going on around you, you can no longer hold out. Your jizz boils from your cum slit, basting the inside of your enthusiastic partner.");
		if(pc.hasTailCock()) 
		{
			output(" The alien tail-cock in the shy myr erupts as well; she half-heartedly squeezes the base");
			if(pc.balls > 0) output(" when she sees your [pc.sack] tighten up ");
			output("as if to stop it, but her inner slut wins out and she allows you to blow your fertile load inside her.");
		}
		//(much cum)
		if(pc.cumQ() >= 2500) output(" Your cum quickly fills your leggy lover and continues to gush out; her belly bumps into yours as the stream of seed stiffens her insectile backside like an over-inflated condom, and eventually, streamers of [pc.cumColor] spurt back out of her pussy, decorating the water.");
		output("\n\nShe heaves a long-drawn-out sigh of satisfaction as your session ends, and the other myr look on with envy as she slowly rises up from your dick with a stream of [pc.cum] drooling from her abused opening. Grudgingly, they finish cleaning you, even wiping the cum and pussy juice from your twitching manhood. The tall myr tries to curl her abdomen to hold in your ");
		if(pc.cumQ() >= 2500) output("massive ");
		output("dose of sperm as she addresses you.");
		output("\n\n<i>“I hope you’re completely satisfied with our work.”</i> Her eyes soften as she looks down at your flagging dick, and her knees wobble. <i>“Please come back soon... we’d love to service you again.”</i>");
		
	}
	//med-huge cocks fuck the curvy ringleader (plus shy myr if tailcock)
	else
	{
		output("The myr’s smooth strokes bring you to full erectness, and her eyes widen as your [pc.cock " + x + "] swells past " + num2Text(Math.round(pc.cocks[x].cLength()-4)) + " inches. The voluptuous myr opposite you raises an eyebrow.");
		output("\n\n<i>“Another for me?”</i> she inquires innocently. The tall woman relinquishes your arm with a slight air of defeat and gently pushes you over toward the wide-hipped sexpot, who bids you be seated. The other myr busily begin wetting and rubbing your [pc.skinFurScales] in ways that conveniently conceal your crotch from outside scrutiny.");
		output("\n\n<i>“We have a contest going,”</i> the curvy myr whispers. Her medium-length blonde hair cascades from her neck as she leans in. <i>“She’s quite certain that she’s the best... but I’m winning.”</i> She seats herself in your lap and looks pointedly at the taller woman. <i>“Would you be so kind as to wash our visitor’s chest while I see to " + pc.mf("his","her") + " lower half?”</i>");
		output("\n\nThe disappointed myr anoints your [pc.chest] with warm water; meanwhile, the myr in your lap has turned around and begun gently washing your [pc.legOrLegs]. Her fantastic, heart-shaped ass and wide, egg-laying abdomen are on full display as she bends forward, and she makes sure to rub against the base of your [pc.cock " + x + "] before throwing a knowing glance over her shoulder. She raises her perfectly-rounded booty above the water, and you very briefly feel fingertips guiding your penis into place before she lowers the opening of her sex onto the lengthy shaft. Several of the smaller women wince as your pole slides home.");
		pc.cockChange();
		output("\n\n<i>“Ah... get to work, myr,”</i> grunts your lover, starting to ride your fat cock. Two women move in closer, massaging their soft, alabaster bodies, and a pleasant smell permeates the air at their approach. One grasps your shoulders and gently pulls your head into her chest, massaging your scalp while your head rests against her petite breasts; the other joins the tall myr in massaging your chest, leaning over far enough that her nipples sometimes brush your arm. An oily sensation spreads");
		if(pc.hasFur()) output(" through your fur");
		else if(pc.hasScales()) output(" between your scales");
		output(", and you realize that they must have been preparing their bodies with scented oils while you were fixated on your lover’s gropable backside.");

		output("\n\n<i>“You’re very tense,”</i> remarks the myr behind you, working the stress from your forehead. You look up at her and from this angle, even her modest breasts seem huge. The sight of her cute face looking at you through her oiled, glistening cleavage turns you on even more; the bombshell in your lap rolls her head as your erection stiffens and stretches her hole");
		if(pc.biggestTitSize() >= 5) output(", and her hair drags over your [pc.chest]");
		output(". The leggy myr says nothing at her competitor’s obvious pleasure, but her chest massage slows down as she bites her lip enviously.");

		output("\n\nThe myr at your arm squeezes her own teats, producing dollops of nectar which she smears into your oily [pc.skin]. <i>“Special service,”</i> she whispers, kneading the tense muscle of your pectoral. The extra ministrations playing out over your body only enhance the pleasure from the honeypot in your lap, who is now slamming down on your cock with such joy that waves are forming in the pool.");


		if(pc.hasTailCock()) output("\n\n<i>“Hello, what’s here?”</i> marvels a quiet voice. A shiver travels up your spine as fingers invade the loose skin at the end of your mutant tail and touch the cock-head within. You peer around the big, alabaster ass riding your dick to see a youthful-looking myr of average height but with an amazing bust - at least a DD-cup. She leans over [pc.oneTail] to look closer, giving you an eyeful; her unrestrained breasts beg to be cradled and caressed. Eager to get her involved, you curl your tail up to her stomach and slide your secret penis from its hidden recess. Her eyes widen in shock as the pre-cum-drooling shaft glides between her well-developed tits; when she looks up in surprise, you make sure to catch her eye and nod appreciatively.\n\nShe blushes, shyly covering her nipples and averting her gaze, but a trickle of nectar leaks from behind her hands. Her body is clearly more determined to be slutty than she’s ready to admit; you help her make the right choice by sliding your perverted tail-prick up and down through her cleavage, mixing your [pc.cumVisc] pre-cum with her own nectar. A smile breaks through her loose bangs, and though still refusing to meet your eyes, she pushes her huge breasts together and begins to pump her chest, stimulating you with soft, honey-coated strokes.");

		output("\n\n<i>“Yes... yess!”</i> the curvy myr cries, climaxing. Her insectile cunny tightens and roils around your shaft, as if trying to massage the cum from it. The women attending you switch from bathing you to holding you down as your hips continue to buck violently into the slutty myr, cock hard as iron and seconds from blowing. With a soft whine, you release the first shot into your lover, who immediately trembles with aftershock as the hot semen splashes into her vagina.");
		if(pc.hasTailCock()) output("\n\nThe honey-covered cock trapped between the shy myr’s glorious tits likewise ejaculates, and the girl squeezes her eyes shut awkwardly as your load lands on her face and in her wavy hair. Your tailcock quickly spurts out, depositing the last two strings of jizz atop her tits.");
		if(pc.cumQ() >= 2500) output(" Your overproductive sex easily overflows the myr woman in your lap, spilling so much seed that her abdomen rounds slightly and the cum begins to squirt back out, spreading a [pc.cumColor] fog through the pool.");
		output(" The myr continues to shake her ass weakly as your final strokes drool into her womb, and when the orgasm finally stops, two of the other women have to support her by holding her under the arms before she can rise up off your [pc.cock " + x + "]. The remaining myr quietly wash the oils from your skin and scrub your twitching shaft, washing away the traces of your ejaculation as your lover is laid down opposite you.");
		output("\n\n<i>“It has been our utmost pleasure to service you,”</i> she gasps, face colored with exertion. <i>“I dearly hope to see you again.”</i>");
		//end and pass time
	}
	//end and pass time
	processTime(22);
	pc.orgasm();
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Clean Vagina
public function cleanMuhVaginaYo():void
{
	clearOutput();
	author("Zeikfried");
	showName("GOLD\nMYR GROUP");
	showBust("MYR_GOLD_BATHERS");
	var x:int = rand(pc.totalVaginas());

	output("<i>“I could use some help with those hard-to-reach places,”</i> you say, pointing clandestinely at [pc.oneVagina]. The tall myr releases your arm petulantly and the matronly leader laughs. She gestures toward a short-but-well-proportioned woman with a pixie haircut.");
	output("\n\n<i>“My turn?”</i> the new myr asks sweetly. She licks her lips and steps forward, taking your hand and seating you in the shallows. <i>“We have a contest going to see who can service the most people,”</i> she whispers, rubbing water into your [pc.chest] with relish, <i>“and none of these girls can hold her breath like I can. It will be my delight to see to your... beautiful... body.”</i> She punctuates her statement by kissing your neck.");
	if(pc.hasKnees()) output(" Your knees pinch together reflexively");
	else output("You tense and relax reflexively");
	output(" as her hot breath hits your [pc.skinFurScales], and the other bathers take up positions concealing your lower body, hinting at what’s to come.");

	output("\n\nSeveral of the women are already rubbing their breasts and stomachs, spreading a glistening oil that they must have retrieved while you were making foreplay with the short-haired myr - a pleasant, florid perfume fills the air. <i>“Just relax,”</i> your lesbian lover reassures. <i>“Not even an inch of you will feel neglected.”</i> She slides a hand up your [pc.chest], catching one of your [pc.nipples] between her fingers and brushing past it with her palm. The little dyke flashes a mischievous smirk as she disappears behind another myr who straddles your stomach and begins massaging your chest; a third moves behind you, supporting your back on her lap, and works on your shoulders. The others busy themselves gently washing your arms and [pc.legOrLegs]. You briefly turn your attention to the myr in front of you, who winks at you and gladly presents her small, oiled breasts and smooth skin for your inspection, but your study is interrupted by the sudden touch of lips on your hot pussy.");

	output("\n\n<i>“Looks like she’s started,”</i> giggles the girl on your stomach, transferring some perfumed oil from her chest to yours by rubbing her breasts on you. <i>“She’s very... practiced.”</i> You have no doubt, as the hidden myr teases and nibbles at your labia.");
	if(pc.hasClit()) output(" [pc.OneClit] is alternately rubbed between two fingers and cradled in her warm tongue, and more");
	else output(" Her warm tongue and");
	output(" fingers slide inside your vagina, flicking back and forth through the opening and rubbing your nerves with just the right amount of pressure.");

	output("\n\nYour mouth works as the arousal mounts in your womanhood - with the almost-sadistic teasing of your [pc.vagina " + x + "] by the lesbian myr, you’re horny and desperate for something to happen. The girl behind you notices, and remarks, <i>“You poor thing. You look like you might enjoy my special honey massage.”</i> She scoots backward, allowing you to see as she squeezes her breasts with her hands, producing dollops of nectar from her nipples. She scoops up the nectar and some pool water and begins to work it into your skin, adding a sugary smell to the aroma already present. <i>“Does this feel good?”</i>");
	output("\n\nYour [pc.vagina " + x + "] continues to burn under the heat of myr tongue, now joined by a whole hand’s worth of fingers as your opening becomes slicker and wetter with your juices. The myr behind you offers her own fingers to you, dangling the honey-coated digits in front of your mouth. You snap them up, caressing them with your [pc.tongue] and slurping between them right down to the ticklish bases. The sound of a sharp breath comes from behind you as your rapacious mouth takes the myr by surprise. She looks into your eyes for a moment, flushing with her own arousal, and then makes a decision: leaning over, she lowers her honey-dribbling breast until it dangles just above your face. Spurred by the crashing orchestra of nerves in your nethers, you don’t even hesitate, reaching up and wrapping the teat in your lips. The taste of sweet sugar fills your mouth as the myr moans, stimulated to give up her precious nectar. Her hand darts between her thighs, and the other myr look positively envious as you tease and circle her nipple with your teeth and tongue, slowing down their bathing efforts as new fantasies fill their heads.");
	//(tailcunt)
	if(pc.hasTailCunt())
	{
		output("\n\nThe lack of control over the pace begins to get to you; you’re eager to cum but every time you get close, the myr at your pussy backs off with expert timing. Try as you might to rub your crotch on her, she seems dedicated to taking the fuck nice and slow, giving all the other myr their chance to tease you. Your tail even begins to ache as your maddened mind becomes painfully aware of your [pc.tailgina]’s emptiness. A desperate idea occurs: though you can’t use your mouth to punish your lesbian lover in kind, the throbbing, wet opening of your tail-pussy begs for stimulation, and it’s flexible enough to curl around to the little myr’s own hot hole.\n\nYou waste no time, snaking your tail around the end of her abdomen; at first, you can only feel her smile as it brushes up against her cunt clumsily, but once you zero in on it, you spread the strange, alien opening as wide as you can and press it right up to hers. A hot breath blows past your labia as the shocked myr gets a taste of her own foreplay - your");
		if(pc.hasParasiteTail()) output(" parasitic ");
		else output(" tail-");
		output("pussy drools and smears sex juices on her own, and you can feel her squirm. Knowing that you have the capacity to tease her just as much as she’s teasing you, you sigh and resume sucking on the gorgeous breast in your mouth, confident that she’ll bring you to orgasm soon.");
	}
	output("\n\nIt doesn’t take much longer, in fact, before your pussy is teased over the breaking point. As your [pc.vagina " + x + "] convulses");
	if(pc.isSquirter()) output(" and squirts");
	output(", the little myr raises her head above water and inhales deeply, still holding several fingers inside you that touch and tease your entrance. Your mouth pops free of the other myr’s nectar-dripping breast, and she leans back, satisfied.");
	if(pc.hasTailCunt()) output(" Your [pc.tailgina] is filled as well, as the myr’s own vagina unloads its sticky, alien femcum - she must have been aroused almost to the point of orgasm just from playing with your pussy.");
	output(" As your back spasms and your juice blends with the pool water, the little myr drags herself up to lay beside you. The other women conscientiously finish bathing you, even wiping the saliva from your [pc.vagina " + x + "] and the love juices from your myr’s mouth. Slowly recovering her breath, she sits up and looks over.");
	output("\n\n<i>“I hope you found our services both satisfying and in-depth,”</i> she quips. <i>“I’d love to have your company again if you return to the bath house.”</i>");
	//end and pass time
	processTime(22);
	pc.orgasm();
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//from main bath house menu
//Oserrre
//tooltip: Ask Matron Oserre to attend you in your private bath. A stress-relieving session with such an experienced, voluptuous employee would definitely come to a very satisfactory conclusion. Cost: {about tree fiddy}.
//disabled tooltip, too poor: Cost: {about tree fiddy}. You don’t have the money!

public function privateBathSelection():void
{
	clearOutput();
	showOserre();
	author("Zeikfried");
	output("<i>“A private bath sounds lovely, actually.”</i>");
	output("\n\n<i>“That will be");
	if(silly) output(" about tree fiddy");
	else output(" fifty of your so-called galactic credits");
	output(".”</i> The matron gestures to the credit scanner, where you place your Codex. A pending transaction appears on the screen and the matron smiles when she hears the scanner beep out a credit approval. <i>“Do you have a particular member of the order you wish to request be your attendant, or would you like to enjoy your bath alone? As I said, all of my sisters are proficient in relieving spirits made heavy with worldly trials and temptations.”</i>");
	pc.credits -= 50;
	clearMenu();
	addButton(0,"Oserre",oserrePrivateBath,undefined,"Oserre","Ask Matron Oserre to attend you in your private bath. A stress-relieving session with such an experienced, voluptuous employee would definitely come to a very satisfactory conclusion.");
	addButton(1,"Solo",privateBathBathBathBathBathNotBessNoJustBath,undefined,"Solo","Get a bath by yourself, though you can always call for an attendant if the mood strikes.");
	addButton(14,"Back",backFromPrivateBath);
}

public function backFromPrivateBath():void
{
	clearOutput();
	showOserre();
	output("<i>“Uh... never mind. I’ve changed my mind.”</i>\n\nThe matron shrugs and refunds your credits.");
	processTime(1);
	pc.credits += 50;
	clearMenu();
	addButton(0,"Next",approachBathMatron);
}

//Oserre
public function oserrePrivateBath():void
{
	clearOutput();
	showOserre();
	output("She leans forward, presenting a private view of her smooth, jiggling cleavage; the heat of the baths filling the halls has caused them to perspire little beads of moisture, giving them a glittering, golden sheen. Given her propensity for showing off her curvy form, you’re not sure that her display is unintentional. Either way, it only hardens your instinct.");
	output("\n\n");
	if(pc.isNice()) output("<i>“If it won’t take you away from important work... do you think you could show me </i>your<i> ‘cleansing arts’?”</i> you inquire,");
	else output("<i>“I know just the woman I’d like,”</i> you say devilishly,");
	output(" placing your hand over hers. You think she might have flinched a bit from the unexpected physical contact - the veil allows her only the slightest hint of your movement. It might be fun to downplay the sex and see her reactions to your alien form instead, during your session.");

	output("\n\n");
	if(flags["OSERRE_BATHED"] == undefined)
	{
		output("<i>“Well...”</i> she temporizes, possibly running down schedules in her head, before coming to a decision. <i>“That’s certainly a service I’m happy to provide.”</i>");
	}
	else output("She laughs, remembering your last session, and then blushes. <i>“Of course. I’m never so happy as when assisting someone I know intimately.”</i>");
	output(" The stacked myr matron rallies and grasps your hand firmly, leading you toward a private room. Another attendant steps right into her place at the counter.");
	if(flags["OSERRE_BATHED"] == undefined)
	{
		output(" She walks confidently and without colliding with anything, which tells you she’s been down this route many, many times - you wonder if she’s just that popular with other bathers, or if she is, in fact, taking you to her own personal bath for some fun. Your question is answered a moment later when you enter a cozy, intimate room with a dresser against the wall and several more Oserre-sized robes hanging. A steaming pool lies in the center, just where you’d expect it.");
		flags["OSERRE_BATHED"] = 1;
	}
	output("\n\n<i>“Does your spirit feel particularly weighed-down, my child? Are there any specific places I should focus on making anew?”</i> In her own way, Oserre is offering you a chance to choose which part of you receives the most attention - happy ending almost certainly implied.");
	processTime(4);
	//choices follow - include a ‘Leave’ option or not, at your discretion
	addButton(0,"TreasureHunt",treasureHunt,undefined,"Treasure Hunt","Have Matron Oserre explore your body with her hands and comment on what she finds. The happy ending may not be as intense, but you’ll still climax - probably.");
	if(pc.hasCock()) addButton(1,"Male Parts",maleParts,undefined,"Male Parts","Ask the blind, busty matron to help you unburden your ‘spirit’ through your cock. Touch touch rub rub rub surprise!");
	else addDisabledButton(1,"Male Parts","Male Parts","You don’t have a dick to clean!");
	if(pc.hasVagina()) addButton(2,"FemaleParts",oserreFemaleParts,undefined,"FemaleParts","Ask the myr matron to please your vagina. It wouldn’t be surprising if she used something long and stiff to ‘clean’ deep inside...");
	else addDisabledButton(2,"FemaleParts","FemaleParts","You don’t have a vagina, dirty or otherwise!");
	if(pc.hasHardLightEquipped() && flags["OSERRE_DILDOS_SEEN"] != undefined && pc.hasHardLightUpgraded()) addButton(3,"HL Dildo",oserreDildoDisplayScene,undefined,"HL Dildo","Oserre’s a dildo collector - what’ll she say when you show off your hardlight?");
	else if(!pc.hasHardLightEquipped()) addDisabledButton(3,"HL Dildo","HL Dildo","You need hardlight-enabled underwear with a toy of adjustable size for this.");
	else if(!pc.hasHardLightUpgraded()) addDisabledButton(3,"HL Dildo","HL Dildo","You need an upgrade for your hardlight dildo that will let you adjust its size for this.");
	else addDisabledButton(3,"HL Dildo","HL Dildo","You need to see something else to unlock this.");
}
//Treasure Hunt - suits all body types and sexes
//tooltip: Have Matron Oserre explore your body with her hands and comment on what she finds. The happy ending may not be as intense, but you’ll still climax - probably.
public function treasureHunt():void
{
	clearOutput();
	showOserre();
	author("Zeikfried");
	//(high emp/nice)
	if(pc.isNice()) 
	{
		output("<i>“Could you just give me a looking over, please?”</i>");
		output("\n\nThe matron stops abruptly. <i>“I beg your pardon?”</i>");
		output("\n\nYou color a bit");
		if(pc.hasFur() || pc.hasScales())
		{
			output(" under your [pc.skinFurScalesNoun]");
		}
		output(", thankful that she can’t see as you rephrase your request. <i>“I mean, ah, I just thought... if I didn’t say a place, it might be... well, enjoyable. For you to explore me with your hands,”</i> you finally blurt.");
	}
	else
	{
		output("<i>“Find out for yourself.”</i>");
		output("\n\nOserre pauses, hand still on the door. <i>“I beg your pardon?”</i>");
		output("\n\n<i>“Denied,”</i> you retort, playfully. <i>“I want you to work out which parts need relieving... with your own hands.”</i> You close in on her until you’re right in her face, hoping she can sense the nearness of your body.");
	}
	output("\n\nThe motherly myr smiles. <i>“What a novel idea. Yes, I think I shall do as you suggest. It may even improve my awareness of the... quirks of an off-worlder’s spirit. Then, would you please undress yourself?”</i>");
	output("\n\nShe unties her belt and begins to strip as she waits for you to complete her instruction. The gorgeous, wide hips and overfull breasts emerging from her silken robe");
	if(pc.isNude()) 
	{
		output(" taunt you with glistening flesh");
		if(pc.hasCock()) output(", stirring your [pc.cocks] to half-mast");
		output(" - you almost regret not asking for a more conventional release, but figure there’ll be plenty of opportunities to get a handful of her regardless.");
		if(pc.isNice()) output(" You politely signal that you’re ready.");
		else output("”</i>I’m already naked, slowpoke,”</i> you jeer.");
	}
	//(clothed)
	else
	{
		output(" don’t make the process easier - ");
		if(pc.hasCock()) output("[pc.eachCock] stands halfway to attention, getting snagged in your gear as you try to pull free.");
		else output("you spend as much time glued to her every jiggling inch as you do undressing, wishing slightly that you’d just propositioned her for sex instead.");
	}
	output("\n\nOserre finds your hand and creeps over to the edge of the pool. The myr woman hands you down, into the water, but instead of joining you immediately, turns to her dresser and opens it. Her lengthy rummage eventually turns up two containers.");
	output("\n\n<i>“I find that these particular scents bolster the spirit and prepare it to release its accumulated burdens,”</i> Oserre explains. <i>“May I apply some?”</i>");
	output("\n\nYou nod, and then remembering that she’s blinded, voice your assent. She opens the containers and scoops out the oils within, holding them up for you to sample. The musky and slightly salty aromas give you the distinct impression you’ve experienced something similar before. With her other two hands, she begins to squeeze one of her breasts, and at this point you notice her peculiar nipples. They’re puffy and inverted, looking more like little, fat lips than teats. She pinches and kneads the flesh of her areola until her concealed nub oozes nectar through the opening, and scoops some of the goopy, sweet fluid into her final hand. As she mixes the three scents together, you finally realize exactly what it is you’re supposed to be smelling - this somewhat-sweet, somewhat-pungent odor must have been chosen to remind her clients of the smell of gold myr having sex. The scent and the implication begin to get to you, overcharging your lusts");
	if(pc.hasGenitals()) output(" and forcing bloodflow to your sex");
	output(".");

	output("\n\nShe smears her sticky hands between and around her huge breasts, depositing the excess oil for later and deliberately setting the pendulous orbs aquiver. Then she slowly lowers herself into the water alongside you, knowingly bending over to give you an eyeful. <i>“I will begin now. Please relax and allow me to cleanse and make light your spirit.”</i> She measures your position and orientation with a few hands on your body, then begins to probe your skin with her fingers, touching and studying you with ticklish care.");

	if(pc.hasFur()) output("\n\n<i>“Strange and exotic,”</i> she murmurs, running her oily fingers through your [pc.skinFurScales]. <i>“And so fine... how like a beast you are, strong and untamed.”</i>");
	else if(pc.hasScales()) output("<i>“Very interesting,”</i> she muses, tracing the contours of your [pc.skinFurScales]. <i>“Somewhat like a myr’s armor, but then again not. Resilient, yet flexible... quite elegant.”</i>");
	else if(pc.hasChitin()) output("<i>“How familiar,”</i> she says, tapping your chitinous shell. <i>“And comforting. It reminds one of a reassuring, staunch protector.”</i>");
	else if(pc.hasGooSkin()) output("<i>“Soft,”</i> she ejaculates, surprised, as her fingers nearly penetrate your membranous skin. <i>“Far too soft.”</i> Oserre frowns, embarrassed. <i>“I’m sorry, I hope I did not offend. Will... are you going to be alright, sitting in this water and having me massage you?”</i>");
	else output("<i>“Fine, healthy skin,”</i> she remarks, drawing made-up shapes with her fingers. <i>“Pleasant to the touch and slightly elastic... a beautiful, classical surface.”</i>");
	output(" You place a hand over hers both to reassure her and to show her the level of pressure you like.");

	output("\n\nShe cups water in two palms and pours it over your skin as she explores with two more. Her investigation moves naturally to your torso next, canvassing ");
	if(pc.biggestTitSize() < 1)
	{
		if(pc.tone >= 70) 
		{
			output("the chiseled");
			if(pc.thickness >= 70) output(", wide");
			output(" expanse of your chest before moving to your washboard abs. <i>“Oh, my,”</i> she exclaims. <i>“So very masculine.”</i>");
		}
		else if(pc.tone <= 30 && pc.thickness >= 70)
		{
			output("the soft ripples of your doughy body and stomach. <i>“A well-fed physique,”</i> she smiles. <i>“Many servants and laborers jump to do your bidding, yes?”</i>");
		}
		//(flat-boyish)
		else if(pc.thickness <= 30) 
		{
			output("your thin, fey frame. <i>“Why, you’re barely more than a child,”</i> she blurts. <i>“Of course, I do not discriminate.... Still, what a fragile, delicate frame. Many lovers must be drawn to your waifish looks.”</i>");
		}
		else output("every detail of your chest. <i>“No breasts,”</i> she smiles. <i>“Such a rarity in these parts”</i>");
	}
	else if(pc.biggestTitSize() <= 3)
	{
		//(small boobs)
		output("your petite, pert breasts. Her hands slide up, covering them");
		if(!pc.hasFuckableNipples() && !pc.hasInvertedNipples() && !pc.hasNippleCocks()) output(" and pinching your [pc.nipples] between fingers");
		output(". <i>“Small... but shapely. Quintessentially feminine. Beautiful breasts.”</i>");
	}
	else if(pc.biggestTitSize() <= 7)
	{
		output("your heavy, shapely breasts. She hefts one in each hand, measuring the weight and bounce. <i>“Such an impressive bust,”</i> she praises. <i>“The weight of a ripe womanhood.”</i>");
	}
	else
	{
		output("your enormous, back-bending rack. Her eyebrows almost lift the veil from her face as she gropes and gropes without reaching the apogee of your tit-flesh. <i>“Heavens, madam. It’s as though you’re more breast than...”</i> She arrests her tongue suddenly, biting her lip as her hands take in the worlds of flesh attached to your chest. From the adoring way she caresses them, disapproval is the furthest thing from her mind.");
		if(pc.hasLipples() || pc.hasDickNipples() || pc.hasCuntNipples()) output(" Her fingertips slide into your slippery nipple-holes unexpectedly, and she sobers as she contacts the genitals within. You gasp from the sudden intimacy and almost miss her remarks. <i>“What an... unusual feature. One can only imagine the variations possible with these.”</i>");
		//(multi-rack)
		if(pc.bRows() > 1) output(" Finally, her hands slip lingeringly from your breasts, only to find more as they move around your chest. <i>“O-oh...”</i> she gasps, searching out each one, <i>“...so alien. And yet, exciting at the same time.”</i> You can guess that she’s imagining her own honey-laden breasts multiplied to match, by the way her chest heaves.");
	}
	output("\n\n<i>“I think I have a good outline of you in my mind’s eye, now,”</i> Oserre says, emptying water from her hands over your chest and washing gently, <i>“but of course, I’ll need to fill in the particulars of your vessel.”</i> Her oily palms slide down");
	if(pc.isTaur() && pc.isNaga()) 
	{
		output("... and down. She laughs wanly as she discovers your elongated shape. <i>“There is certainly much to clean,”</i> she teases, spooning water over your ");
		if(pc.isNaga()) output("coils.");
		else output("backside.");
	}
	else output(", searching out the contours of your crotch.");

	output("\n\nIt doesn’t take long before she ");
	if(!pc.hasGenitals()) output("discovers that your groin is totally featureless");
	else
	{
		output("zeroes in on your ");
		if(pc.hasCock()) output("[pc.cocks]");
		else output("[pc.vaginas]");
		output(".");
		if(pc.hasCock())
		{
			if(pc.cockTotal() >= 4) output(" Your terrible tangle of pricks stuns her. <i>“How... how do you even get anything done with so many of these?”</i> she asks, fruitlessly trying to separate them.");
			else if(pc.cockTotal() >= 2) output(" She passes lightly over one turgid shaft, then stops when she finds a second, adding more hands to make sure she didn’t miscount. “<i>My goodness. Are you routinely expected to mate multiple females on your world?”</i>");
			else if(pc.biggestCockVolume() >= 400) output(" Her hands slide up your [pc.cockBiggest], moving as if they expect to caress a crown which never comes. <i>“This is... so big. I shudder to imagine the females of your homeworld,”</i> she remarks, innocently.");
			else output(" She strokes your cock once, then brushes your tip with her palm. <i>“Ah, so you are a male.”</i>");
		}
		if(pc.hasVagina())
		{
			output(" A");
			if(pc.hasCock()) output("nother");
			output(" hand makes its way between your thighs and discovers your [pc.vaginas]. <i>“A female?");
			if(pc.hasCock()) output(" No... both. Is this common where you come from?");
			output("”</i>");
		}
	}
	if(!pc.hasGenitals()) output("<i>“I-I’m unsure what to do here, truly. How do your people deal with an overabundance of spiritual stresses?”</i> You move her fingers to your [pc.asshole], and her confused expression changes to a knowing smile. <i>“Ah.”</i>");

	output("\n\n<i>“Your body is a beautiful creation,”</i> Oserre remarks, withdrawing her hands to re-coat them in the smutty oil smeared between her breasts. <i>“Exploring it is a delight and a privilege for me.”</i> She begins to work your [pc.skinFurScales] more firmly, producing a slight lather as the oils trap air and then washing it away with the hot water of the spring.");
	if(pc.hasCock()) 
	{
		output(" She lingers a long time on [pc.eachCock], perhaps remembering her unfulfilled womanhood, and you grasp her wrist to encourage her to play with ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" a bit more. She licks her lips and obliges, but also slides a hand down to your [pc.vagOrAss], intent on neglecting nothing");
		output(".");
	}
	if(pc.hasVagina()) output(" Your labia quiver as fingers slide them apart, allowing hot water to lick at your most intimate places.");
	output(" With sex heavy in the air and hands all over you, you’re desperate to escalate and achieve release - Oserre’s breasts dangle fetchingly as she attends your nethers, and you reach out and caress them. She doesn’t pull away, but hums with pleasure.");

	output("\n\n");
	if(!pc.hasScales() && !pc.hasChitin()) output("<i>“Your spirit pleads for relief in the hammering of your blood,”</i>");
	else output("<i>“Your eagerness for spiritual relief is refreshing,”</i>");
	output(" she says. The myr’s chest heaves in your hands as she shifts the rest of hers to your [pc.crotch]. Her oil mixes with ");
	if(pc.hasCock()) output("your precum, forming a frothy ooze that makes her pressed-together palms feel like a hot pussy in the midst of an intense fuck.");
	else output("your natural lubrication, frothing and squirting as she fingers your hot hole.");
	output(" You hold on as long as you can, but climax blows inexorably through you and you ");
	if(pc.hasCock()) 
	{
		output("ejaculate in her hands, ");
		if(pc.cumQ() < 8) output("dribbling what little [pc.cum] you can muster.");
		else output("flinging lines of [pc.cum] across the surface of the water.");
	}
	else if(pc.hasVagina()) output("orgasm, [pc.eachVagina] trying to milk Oserre’s hands for semen that will not come.");
	else output("squeeze down so hard with your [pc.asshole] that Oserre winces.");

	if(pc.cumQ() >= 500)
	{
		output("\n\nYour ");
		if(pc.balls > 1) output("balls empty");
		else output("seed spills");
		output(" continuously, changing the steamy pool into a slurry of boy butter. <i>“Oh my word,”</i> the matron remarks, as the consistency of the water around her turns to gravy. <i>“No wonder your spirit was under such strain. You may be the most... overwrought individual I’ve yet met.”</i> She raises her hands, feeling your sludge drip from her fingers, then wipes the jizz on her breasts with such obvious relish that your slightly-limp meatus squeezes out an appreciative aftershock. <i>“You must return soon - I fear the consequences if you go too long without allowing one of us to lift your encumbrance.”</i> She pauses, awkwardly. <i>“I wonder if we should use another room to finish this cleansing...”</i> You smile perversely, anticipating sullying another pool with a return visit.");
	}
	else
	{
		output("\n\nAs your orgasm winds down, Oserre ");
		if(!pc.hasGenitals()) output("withdraws her fingers carefully from your [pc.ass].");
		else
		{
			output("waves your ");
			if(pc.hasCock()) output("cum");
			else output("femcum");
			output(" away, dispersing it in the water.");
		}
		output(" She conscientiously finishes washing you, and you notice that her demeanor is completely changed - she now moves reservedly, guarding her breasts and skin, as if trying not to stir your libido back up. <i>“I hope it has been a pleasure to receive our services,”</i> she says, smiling primly. <i>“Because it was certainly my pleasure to give them.”</i> The smell of sex is thick enough to cut with your hand after your orgasm, and you flush, wondering how soon would be too soon to return.");
	}
	//end, raise libido, adjust time and lust
	processTime(23);
	pc.orgasm();
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Male Parts
//tooltip: Ask the blind, busty matron to help you unburden your ‘spirit’ through your cock. Touch touch rub rub rub surprise!
//disabled tooltip: You don’t have a dick to clean!
public function maleParts():void
{
	clearOutput();
	showOserre();
	author("Zeikfried");
	var x:int = pc.biggestCockIndex();
	if(pc.isNice()) output("<i>“D’you think you could maybe have a go at this?”</i> you mumble, rubbing your [pc.cocks]. When Oserre holds out her hands, you’re briefly at a loss... before you realize she means for you to place them where you want her to focus. Nervously, you put them on your [pc.cocksLight].");
	else 
	{
		output("<i>“Right here, baby,”</i> you assert, stroking your [pc.cocks]. Oserre holds out her palms, and you don’t even wait for instructions - you f");
		if(pc.isCrotchGarbed()) output("ree and flop your meat");
		else output("lop your meat");
		output(" into her hands without so much as a ‘how-do-you-do’.");
	}

	output("\n\n<i>“Oh, yes. The need for spiritual soothing is evident in you already,”</i> Oserre laughs. <i>“Go ahead and disrobe for me as I prepare.”</i> She strips her own garments quickly");
	if(!pc.isNude()) output(" as you comply");
	output(", unfastening the belt and stepping right out of the wispy, silken drape. Your attention focuses on her nipples; they’re puffy and inverted, like little swollen mouths sitting atop gorgeous jugs. She slips two fingers inside one as you watch, and draws them back out coated with glistening fluid. You so badly want to play with them; [pc.eachCock] even seems to strain toward the lip-like areolae as it stiffens.");

	output("\n\n<i>“Those are nice,”</i> you muse. Oserre stops what she’s doing and thinks for a moment. Her face breaks into a wider smile as she catches the thread and she covers her nipples flirtatiously with two hands.");
	output("\n\n<i>“Indeed, they are an essential part of your spiritual release.”</i> She slips her free hands behind the others and begins to squeeze her breasts, moaning softly. Defying reason, blood fills your [pc.cocksLight] to even greater, painfully-throbbing fullness. You’re desperate for some contact as Oserre withdraws her hands, palms brimming with sloppy globs of myr nectar. <i>“Step into the pool.”</i>");
	output("\n\nYou do so, lowering yourself into the water. The myr matron retrieves a bottle from the dresser and joins you, but not before dropping her handfuls of honey into the steaming spring. As the sugary secretion spreads and mingles with the water, a muted scent of nectar fills the air, exhilarating your sinuses. <i>“Breathe deeply of my aroma,”</i> your attendant instructs, stepping down into the pool beside you. <i>“It will elevate your mood and prepare your spirit for relief.”</i> You doubt your ‘spirit’ could be any more ready for relief if you had spent the last ten years in a mining asteroid.");
	output("\n\nShe begins to touch and wet your [pc.skinFurScales] with spring water, starting at your back before moving to the stiff muscles of your shoulders");
	if(pc.hasWings()) output(" and wings");
	output(". The hot water and deep strokes feel great, but not as good as the anticipation does when she moves to straddle your lap. Her four elegant hands scrub your [pc.fullChest], pausing to brush against each ");
	if(pc.hasLipples()) output("drooling lipple");
	else if(pc.hasCuntNipples()) output("needy, drooling nipplecunt");
	else if(pc.hasNippleCocks()) output("puffy, cock-concealing ring");
	else output("swollen nipple");
	output(".");
	if(pc.hasNippleCocks()) output(" She flinches as your breasts extrude their [pc.nippleCocks] right into her hot palms, but massages the perverted alien shafts with water and caresses the crowns nonetheless. <i>“Every pilgrim is hobbled with his own burdensome secrets,”</i> she says sagely, feeling a line of precum connected to her hand stretch.");

	output("\n\nYour hips begin to buck uncontrollably as she presses her breasts against your collar to bathe the");
	//(plain skin)
	if(!pc.hasFur() && !pc.hasChitin() && !pc.hasScales()) output(" ticklish");
	output(" [pc.skinFurScales] of your stomach. [pc.EachCock] tingles with pleasure as you rub up against Oserre’s big, chitinous abdomen. She blushes as one stroke gets dangerously close to penetrating her slit, missing by inches, but the warning is in the air now: she slides off your lap and opens the container she left at poolside.");
	output("\n\n<i>“I have some scented oils that will help with your release");
	if(pc.cumQ() >= 1000) output("...”</i> she begins, dipping and withdrawing her fingers, but trails off as she contacts the river of pre-cum flowing from you. Her other, clean hands converge to verify your surprising potency, just as a twitch in your [pc.cocks] produces another fat glob of male lube. Quietly, she wipes the bit of oil between her breasts, having deemed it unnecessary.");
	else output(",”</i> she says, dipping her fingers. She grasps [pc.oneCock] in her oily hands, smearing it with a slippery goo that makes her palms feel like a lubed sex toy.");

	//normal dicks ending
	if(pc.biggestCockVolume() < 1000)
	{
		output("\n\nOserre abandons the use of water now, focusing completely on bringing you to orgasm.");
		if(pc.cockTotal() == 1) 
		{
			output(" Multiple hands cover your [pc.cock]; the myr strokes with one while tickling the sensitive slit with another. The fingers of a third form a tight ring around your ");
			if(pc.balls > 0) output("[pc.scrotum]");
			else output("[pc.sheath]");
			output(", intent on restraining you for as long as possible to make your orgasm truly an opus of cock and cum.");
		}
		//(2+ cock)
		else
		{
			output(" Each cock is clenched in a slippery fist.");
			if (pc.cocks.length >= 5) output(" Oserre continues to pick tools from your bouquet until she runs out of hands.");
		}
		output(" The sensation of having so many hot palms jerking your cocks makes you glad you came to Kressia - you wonder if you could get a four-armed myr maidservant to take with you when you leave. The fantasy of despoiling your own private jerk-off girl fills your thoughts as Oserre teases and tickles your cockheads.");
		
		//(nipcocks)
		if(pc.hasDickNipples()) output(" Still aware of the smutty shafts protruding from your [pc.breastCupSize] breasts, the myr reaches one hand up and begins to tug at a [pc.nippleCock].");
		output(" You reach over, intent on fulfilling a desire you’ve had since the session began, and run a hand over her breast. The flesh is hot under your hands and her pulse hammers beneath the skin, suggesting just how into your ‘cleansing ritual’ she is. The myr matron shivers as you slip a finger inside her puffy, inverted nipple, but doesn’t pull away.");

		output("\n\nOrgasm, boiling just under the surface since Oserre first disrobed, rushes up now, overtaking your restraint and hers alike. She tries to squeeze the base of your [pc.cocksLight] to extend the session a bit longer, ");
		if(pc.cumQ() < 5) output("but when your hip jerks and shakes tell her that your climax is irrevocably underway, she releases, letting the dribble of [pc.cum] spill from you.");
		else if(pc.cumQ() < 1000) output("but the erupting semen is built-up enough that it squeezes past her blockade and drools from your [pc.cockHeads]. As the hot [pc.cumNoun] runs down over her hands, she gives up and releases, letting your next stroke fly almost across the pool.");
		else output("but the otherworldly productivity of your [pc.balls] blows right through her clenched fist. She releases you in surprise as a huge glob of [pc.cum] parts your slit and erupts into the air, followed by several more that land in the hot water like bombs.");
		//(nipcock)
		if(pc.hasNippleCocks()) output(" Your [pc.nippleCocks] ejaculate as well, showing their gratitude for Oserre’s stimulation by spurting [pc.milk] all over her breasts.");

		output("\n\nYou sigh as your climax ends and your muscles unlock, and Oserre politely cleans your spooge-dribbling pricks in the hot spring. Her motions have gone from disarmingly sensual to positively prudish: she covers her ");
		//(nipcock)
		if (pc.hasNippleCocks()) output("cum-splattered");
		output(" breasts with her hands and moves without jiggle or sway, unwilling to arouse your libido by displaying her sex-bomb body after suppressing it so thoroughly. Her words belie her true feelings when she finally speaks again, however: <i>“Traveler, it would be my pleasure to oversee your spiritual matters if you should return to Kressia once more.”</i>");
		output("\n\nYour memory returns to the picture of her groping her breasts and moaning as she says ‘pleasure’, and this stays with you as you towel off and collect your gear...");
		//end, small reduce libido, adjust time and lust
	}
	//hyper dick ending
	else
	{
		output("\n\nYour [pc.cockBiggest] stands up proudly as she strokes it, too poorly stimulated even by her four slippery hands to bend to her touches. <i>“Carrying such a physical weight must impose a crushing heaviness to your spirit,”</i> Oserre comments. <i>“I shall do my utmost to assist you.”</i> The ant-woman slips into your lap again, this time allowing your cock to jut, erect, between your bodies. She supports her heavy, honey-packed rack with two hands, lifting and pulling them apart, and you have an inkling of what she’s planning. You lean your monster dick into her, and she confirms your suspicion by pulling it between her smooth, oily boobs.");
		output("\n\nYou grunt with pleasure as the myr wraps her hot body around your unfuckable cock like a living wank mitten and begins to push up and down the surface, pressing her tit-flesh together to ensure that your [pc.cockBiggest]’s entire underside is stroked with creamy skin. Her arms wrap around the back side as she gets more and more into it - ");
		//(low-med sens)
		output("you can distinctly feel her lips press against your precum-smeared [pc.cockHeadBiggest] in a passionate kiss, though she tries to hide it in the background noise of the oily fuck.");

		output("\n\nDangerously close to orgasm since the myr woman first squeezed her tits and moaned in an impression of a whore’s workout, your [pc.cockBiggest] finally jerks and spasms its way over the edge, dredging up sperm into a wave of pleasure that travels up your towering shaft in a numbing ring.");
		if(pc.cumQ() < 5) output(" Oserre giggles at the incongruity as your huge dick spurts out the tiniest bit of [pc.cum] to land on her shoulder, then masters herself.");
		else if(pc.cumQ() < 2000) output(" Oserre sighs as the feeling of your first stroke swelling your urethra travels through her breasts, and leans back to let the falling [pc.cumNoun] land right on her tits. Your prick sends out an encore request in the form of another spurt, and she catches this one, too. Incredible.");
		else output(" Oserre’s mouth widens in awe and terror as your pipeline of cock distends from the liters of [pc.cum] transiting its wide urethra with each stroke. She quickly curls up against the shaft with her head down as seed rains onto her, soaking her every inch of hair and skin, and doesn’t release until the pitter-patter of semen falling into water stops.");

		output("\n\n<i>“The greatest of us are often afflicted with the most spirit,”</i> Oserre ");
		if(pc.cumQ() >= 2000) output("sputters, wiping your jizz from her mouth.");
		else output("says, reaching up to wipe an aftershock from your cock.");
		output(" The myr exits your lap and carefully cleans your [pc.cockBiggest] in the hot water, restraining and covering her breasts to stop herself from giving you another unintentional show after reducing your lusts so effectively. <i>“If you should find yourself unable to shed your burdens, please return here.”</i>");
		output("\n\nThe matronly woman smiles at you");
		if (pc.cumQ() >= 5) output(", unable or unwilling to put on another robe with your [pc.cumColor] semen still smeared all over her goldenrod skin");
		output(". You smile back knowingly, then bid her farewell, towel off, and collect your gear.");
		//end, reduce libido, adjust lust and time
	}
	processTime(24);
	pc.orgasm();
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Female Parts
//Oserre’s a secret dildo freak
//tooltip: Ask the myr matron to please your vagina. It wouldn’t be surprising if she used something long and stiff to ‘clean’ deep inside...
//disabled tooltip: You don’t have a vagina, dirty or otherwise!
public function oserreFemaleParts():void
{
	clearOutput();
	showOserre();
	if(pc.isNice()) 
	{
		output("<i>“I sometimes have some trouble, ah, ‘cleansing’ my vagina");
		if(pc.totalVaginas() > 1) output("s");
		output(",”</i> you mumble.");

		output("\n\nOserre perks up. <i>“I see. And just how important is a... clean vagina to your spiritual well-being?”</i>");

		output("\n\nSlightly leery of her tone, you ask, <i>“I don’t... what do you have in mind?”</i>");
	}
	else 
	{
		output("<i>“Yeah, sometimes my ");
		if(pc.totalVaginas() == 1) output("pussy gets");
		else output("pussies get");
		output(" hot and super full of girl-lube and I just need to get something in there and clean them out,”</i> you snark.");
		output("\n\nOserre perks up and lowers her voice to a confidential whisper. <i>“I have the exact thing for that.”</i>");
	}
	output("\n\nThe myr matron opens the top drawer of her dresser, but instead of looking in normally, she reaches underneath, searching for something secreted away on the bottom. Her face scrunches as she stretches all the way to the back and comes up with a key. Next, she opens the bottom drawer, moves several garments to the side, and produces what looks like an instrument case. She casts a sidelong glance at you, as if to say <i>“come closer”</i>, and you do so. Slotting the key, Oserre pops the lid of the case, revealing an absolute treasure trove... of dildoes. Many models resemble alien penises, suggesting off-world origins.");

	output("\n\n");
	if(pc.isNice() && pc.libido() < 50) output("You noncommittally acknowledge the surprising stash, not sure what reaction she was hoping for, but she seems to take it as an invitation to proceed.");
	//(hi-emp, hi-lib)
	else if(pc.isNice()) output("You break out in a cold sweat as your eyes dart from prick to prick, unable to stop imagining what each one feels like but too ashamed to vocalize your wanton lust.");
	else if(pc.libido() < 50) output("<i>“Lady, you have a lot of toy dicks,”</i> you say.");
	else output("<i>“Oh, yeah! That’s what I’m talking about!”</i> you exclaim, loudly enough to turn heads outside.");
	output("\n\n<i>“Let me show you some of my favorites,”</i> Oserre says, enthused.");

	//display 2 at random before moving to the double-ender
	IncrementFlag("OSERRE_DILDOS_SEEN");
	dildoPicker(oserreFemaleParts,0);
	//Continues from doubleEndedOserre()
}

public function dildoPicker(cumFrom:Function, shown:int):void
{
	var choices:Array = new Array();
	if(cumFrom != marbleDickOserre) choices.push(marbleDickOserre);
	if(cumFrom != horseCockOserre) choices.push(horseCockOserre);
	if(cumFrom != humanShaft) choices.push(humanShaft);
	if(cumFrom != deluxeDildo) choices.push(deluxeDildo);
	if(cumFrom != dogCockDildoForOserre) choices.push(dogCockDildoForOserre);
	if(cumFrom != oserrePCCock && pc.hasCock()) choices.push(oserrePCCock);
	if(cumFrom != ovipositorOserre) choices.push(ovipositorOserre);

	if(shown >= 2) doubleEndedOserre();
	else 
	{
		shown++;
		choices[rand(choices.length)](shown);
	}	
}
//Marble dick
public function marbleDickOserre(shown:int):void
{
	output("\n\nShe withdraws a slim, elegant marble phallus and holds it proudly in her hands. <i>“This one is an antique. It was found in a buried structure dating back some five-hundred years.”</i> She turns it over with care, displaying an uneven-edged base that clearly marks it as having been broken off of some statue. <i>“Obviously its advanced age makes it unsuitable for use,”</i> she says, jealously.");
	dildoPicker(marbleDickOserre,shown);
}

//horsecock
public function horseCockOserre(shown:int):void
{
	output("\n\nShe takes out a big, veiny latex tool with a blotchy pattern, flat crown, thick medial ring, and molded balls attached below - instantly identifiable throughout the galaxy as a horsecock. <i>“Don’t you just love the shape of this one?”</i> Oserre asks, turning the flare toward you and tapping the hole molded into the end. <i>“I obtained it in a private exchange with a guest who shared my enthusiasm for cleansing aids. Apparently, they’re extremely common, but I had never seen such a thing before a little while ago. I just think it’s superb.”</i>");
	dildoPicker(horseCockOserre,shown);
}

//human shaft
public function humanShaft(shown:int):void
{
	output("\n\nShe roots around and pulls up a small, flesh-toned cock with a spongy, spade-shaped head tucked partway into a flexible foreskin, which you privately mark down as a bog-standard human prick. <i>“This one’s pretty small, but it’s so unusual. Have you ever seen anything quite like it?”</i> She puts it away before you can disabuse her of her notions.");
	dildoPicker(humanShaft,shown);
}

//Deluxe Dildo
public function deluxeDildo(shown:int):void
{
	output("\n\n<i>“Here’s one to be careful with,”</i> she says, picking up a pink, wiggling member. <i>“Not only does this unique item swell and stretch any hole it’s put in, but the fluid it squirts makes one feel as if she had achieved release while in reality making her spiritual burdens all the worse! Of course, I keep it here only to preserve it from any unfortunate soul who might find it - never to use it.”</i>");
	dildoPicker(deluxeDildo,shown);
}

//dog cock
public function dogCockDildoForOserre(shown:int):void
{
	output("\n\nA pointed canine shaft with a beefy knot emerges from the chest in her hot hand. <i>“Now this one is interesting. I had never known anything like this when I was given it, but recently, off-world guests have been turning up for cleansings with very similar shapes. Isn’t that just so exciting? It makes you wonder what the next thing to walk through the door could be.”</i>");
	dildoPicker(dogCockDildoForOserre,shown);
}

//PC’s cock (only avail. if PC has a dick)
public function oserrePCCock(shown:int):void
{
	output("\n\nThe toy she pulls from the chest stuns you for a moment. There, in her hand, is a perfect replica of your [pc.cock]. Your hand claps to your crotch, making sure you’re still intact. Oserre doesn’t notice the sound, still squee-ing over her collection. <i>“Isn’t this just the cutest thing? Just look at the shape of the tip, and ooh, over here...”</i> You definitely don’t remember sitting for any modeling... this had better be a coincidence.");
	dildoPicker(oserrePCCock,shown);
}

//Rahn ovipositor
public function ovipositorOserre(shown:int):void
{
	output("\n\n<i>“I’m not sure how I feel about this one,”</i> Oserre admits, withdrawing a flexible, tapered tube that looks a lot like a rahn ovipositor. She sticks her fingers in the end, demonstrating how stretchy the passageway is. <i>“It’s like it’s designed to pass something huge... it’s also very squishy.”</i> She squeezes it and it flops around realistically. You find yourself hoping there are no rahn subspecies with detachable genitalia, or they’re likely to be one short of a full set.");
	dildoPicker(ovipositorOserre,shown);
}

//the double-ender - scene continues from here
public function doubleEndedOserre():void
{
	var x:int = rand(pc.totalVaginas());
	output("\n\n<i>“Here’s the one I had in mind,”</i> Oserre says, turning some other marital aids out of the way to remove a big, double-ended prick. <i>“This one should allow me to release your spiritual weights while still having my hands free to cleanse your body.”</i>");
	output("\n\nYou bet it will, at that. The blood-red latex sex toy is at least 18 inches in total, with a shaft that swells to the same girth as the crown, ensuring that its users always feel filled with stiff dick. Several raised veins run down its length to provide a sense of realism and a stimulating texture, and the crown itself seems to be covered with tiny cillia or nodules to stimulate what they touch - your [pc.vaginas] feel wetter from just thinking about having it inside you. Oserre takes out a small container of lube and begins to cover the fat tool.");
	output("\n\nYou decide to set your [pc.gear] aside and get into the pool while her practiced fingers oil up the cock-alike. She finishes even before you can, unfastens her belt, and whips off her robe with uncharacteristic enthusiasm. Her gorgeous breasts sway as she strides over to the water, confidently wrangling the dick with two hands. <i>“Yes, good,”</i> she says excitedly as your [pc.butt] slips into the spring with a ‘plunk’. <i>“Do have a seat.”</i>");
	output("\n\nThe matronly myr doesn’t join you yet. Instead, she opens her knees wide and half-hunches down, pushing her insectile backside through the gap. Oserre bites her lip with pleasure as she lowers one end of the dildo to her own opening, and even with the alien-ness of it all, watching her slowly plunge the cock into herself sets the blood racing through [pc.eachVagina]. She moans as inch after inch slides in, and you’re not sure if she’s just really tight or if she’s savoring it so much that she’s forgotten you’re there. Soon it’s in as far as it will go and Oserre stands back up straight, then turns her hip to display her chitinous abdomen. Nine inches of thick latex phallus dangle perversely from her, bobbing when her backside does.");
	if(pc.cockTotal() > 1) 
	{
		output(" Even your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("get");
		else output("gets");
		output(" a bit stiff at the sight of a big dick to compete with, never mind that it’s fake.");
	}

	output("\n\nShe lowers herself into the spring and into your lap, but contrary to your hopes, doesn’t offer you the other end of the cock right away. Instead, she begins to work hot water into your [pc.skinFurScales] with strong, sure strokes of her hands.");
	output("\n\n<i>“Patience, child,”</i> she says, feeling your tension. Her backside bobs, lapping at your [pc.thigh] with the bumpy head of the toy, and you twitch with a spasm. Oserre smiles and continues to wash you, moving on to your [pc.chest]. She caresses you affectionately, brushing your [pc.nipples] with a thumb before pouring out palmfuls of water that trickle down your ");
	if(pc.biggestTitSize() < 1) output("flat chest");
	else if(pc.biggestTitSize() < 4) output("petite hemispheres");
	else output("hefty globes");
	output(" and tickle the nerves as they drip off. After the myr finishes cleaning");
	if(pc.biggestTitSize() >= 1) output(" over and under your breasts, circling her fingers delicately around each one");
	output(", she grasps your shoulders and pulls you forward, pressing you to her honey-laden, jiggling bosom. Holding you there against her hot skin, she scoops up spring water and pours it over your back, scrubbing with broad strokes until she finds knots of tension, which she works out diligently.");
	output("\n\nThe hot bath feels really good, as does the feeling of being pressed up against such a soft, warm woman - so much so that you almost forget that you’re due for an impending penetration. Almost, but not quite. It’s impossible to miss her insectile abdomen raising up from your position of peering over her back, which makes you think she chose it for exactly that reason. <i>“Relax yourself,”</i> she warns.");
	output("\n\n");
	if(pc.looseness(x) <= 1) output("The warning is appropriate; you feel fingers spreading your labia and creating a guided pathway just before her abdomen bobs down again and a sharp sensation of pressure washes over you. The nubby toy presses against your opening and slowly slips into you, though not before your tight snatch feels every ridge and fake vein on it.");
	else output("The warning is unnecessary, as are the fingers sent down to spread your labia; the nubby cock plunges right into you without so much as a coat-check, hilting itself so deeply that your [pc.vagina " + x + "] kisses Oserre’s.");
	// hymen/stretch check
	pc.cuntChange(x,30,true,true,false);
	output("\n\nThe myr sighs as her grip on your shoulders tightens. Her backside begins to bob regularly, thrusting the lubed dick inside both of you with regular, even strokes. A feeling of stickiness spreads over your chest; the rhythmic compressions caused by her pumping must be squeezing myr nectar from her golden boobs. You enjoy the warm, wet smears her nipples make, but more acutely feel the veiny, thick surface of the false cock as Oserre slides it into your [pc.vagina " + x + "], clamping down on it instinctually in a way that your lover is likely to appreciate, since it draws the shaft part way from her own hole for the next thrust.");
	output("\n\n<i>“Yes... yess,”</i> she moans, quivering as if close to orgasm.");
	output("\n\n<i>“Not yet,”</i> you warn. <i>“Keep going!”</i>");
	output("\n\nOserre obliges, intensifying her strokes");
	if(pc.hasClit()) output(" while reaching down to tease your [pc.clit]");
	output(". Her breasts heave with labored breaths as she pounds your sodden slit, but despite her vigor, she still reaches climax before you. The myr woman locks up, slamming the pole home one last time, and her pussy creams around the rod, depositing hot girlcum on your sensitive entrance. The collapse of creamy, oily, hot flesh against yours and the final, deep penetration touch off your long-desired orgasm, and your [pc.vagina " + x + "] ");
	if(!pc.isSquirter()) output("fills itself with [pc.girlCum], not productive enough to breach the seal of the dildo.");
	else 
	{
		if(pc.wettestVaginalWetness() <= 4) output("squirts [pc.girlCum] into the space between you.");
		else output("pollutes the pool with so much [pc.girlCum] that the texture of the water changes slightly.");
	}
	output("\n\nThe two of you remain like that for a few minutes, Oserre staring into your eyes as her weak hands make token efforts to wash any parts of you she missed. Slowly, gingerly, she pulls the toy from your aching cunt and then her own, and a gush of myr juice spills out after it. <i>“So,”</i> she says breathlessly, <i>“as you can see, we are well-equipped to deal with hard-to-clean places.”</i> You smile at that, and once you’ve recovered a bit more, towel off and collect your things.");
	//end, adjust time and lust, lower libido or sens
	processTime(44);
	pc.orgasm();
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function privateBathBathBathBathBathNotBessNoJustBath():void
{
	clearOutput();
	showName("\nBATH");
	author("Gardeford");
	output("One of the order’s many sisters direct you to an unused hot spring, letting you in before closing the durable curtain. You find yourself in a miniature changing room, with a sizeable chest to store your belongings. A mirror stands in the other corner to help with the removal of necklaces, along with a rag to wipe the condensation off of said mirror.");
	output("\n\nYou stash your [pc.gear] in the containers, preparing yourself before entering the bath. The hot spring pool is surprisingly large, reaching what must be 20 feet in diameter. They must use these rooms for private parties as well. The bath appears to be hewn directly from the surrounding cave, with ornate designs chiseled into the smooth stone. A small stream trickles into the water from one end of the room, only to continue out the other end and down another small tunnel.");
	output("\n\nA large brass bell hangs on the wall just beside the door, with a small instruction plaque beneath labeled ‘Ring For Assistance.’ ");
	if(flags["BEEN_PRIVATE_BATHED"] == undefined) output("You aren’t sure what kind of assistance is available, but you imagine it comes in a pretty white robe.");
	else output("The label brings back memories of your last encounter, and your fingers itch to ring it again.");
	output(" You could ring the shining bell to summon the order’s assistant, or you could have this gigantic bath to yourself.");
	processTime(2);
	clearMenu();
	//[alone][assistance]
	addButton(0,"Alone",aloneBathAloneOneIsTheLoneliestNumberThatYouEverSaw);
	addButton(1,"Assistance",assistanceWithPrivateBath,undefined,"Assistance","Ring the small bell for assistance. Having a devoted member of the order to help you bathe sounds wonderful right now. Maybe you’ll even get a happy ending out of it.");
}

//Alone
public function aloneBathAloneOneIsTheLoneliestNumberThatYouEverSaw():void
{
	clearOutput();
	showName("\nBATH");
	author("Gardeford");
	output("You figure bathing alone should be enough right now, and step up to the edge of the bath. The water is just shy of being too hot, but you manage to find a section shallow enough to acclimate yourself to the heat. Once you build up a resistance, you wade around to various parts of the tub, finding them to have a large variety of depths to accommodate all body sizes. Maybe some of the queens made use of these baths when the golds still controlled kressia.");
	output("\n\nThe troughs running into and out of the pool seem to filter the water to make sure it remains clean, but where the water goes afterwards you have no idea. You rub yourself clean with the water, thinking about your travels as you bathe. Where will you go next? What will you find there? You contemplate for a few more minutes before exiting the bath.");
	output("\n\nYou dry off, gathering your gear from the locker room before heading out. The orderlies at the door show you back to the main lobby, where you can decide what to do next.");
	processTime(15);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Assistance
//tooltip: Ring the small bell for assistance. Having a devoted member of the order to help you bathe sounds wonderful right now. Maybe you’ll even get a happy ending out of it.
public function assistanceWithPrivateBath():void
{
	clearOutput();
	showName("BATH\nSERVICE");
	author("Gardeford");
	output("You ring the tiny brass bell to summon assistance. After all, why should you bath alone when a bevy of beautiful women are waiting to help at a moment’s notice? The chimes echo softly in the large room, and a small green light flashes on the plaque. A speaker positioned just under the instruction plaque activates to confirm your action.");
	output("\n\n<i>“Request received. Please, situate yourself in the bath and an assistant will be with you shortly,”</i> comes a motherly voice from the radio. You nod at the prompt response, placing your towel on a stone bench nearby and moving to the edge of the large pool. You test the water with ");
	if(pc.hasFeet()) output("a [pc.foot]");
	else output("the tip of your tail");
	output(" before easing yourself in.");

	output("\n\nThe water is just shy of being too hot, allowing you to relax after a minute or two of getting used to it. You even try dipping your head under while you wait, but are forced up by the heat after a few seconds. A melodic giggle reaches your ears as you surface, pulling in air and shaking off the water. You rub the water out of your eyes as best you can, finding the voice to come from a scantily clad sister of the order.");

	output("\n\n<i>“");
	if(flags["BEEN_PRIVATE_BATHED"] == undefined) output("Are you trying to dive? You needn’t go to such lengths. I’ll be sure to wash your face");
	else output("I’m glad you called again. Repeat customers are much easier than new ones");
	output(",”</i> she says with a smile. The red myr is dressed only in a loose fitting ivory-white robe, thin enough that you can see the impressions of her nipples, and open far enough to reveal her bare pussy and smooth stomach. A silky cream veil covers her from the top of her brow to the tip of her nose.");
	output("\n\nShe carefully sets a tray of bathing materials on the edge of the tub before letting her thin clothing slide off her shoulders. The myr girl takes some of the bathwater in a small pitcher, wetting her body with small streams of water that cascade over her curves and splash onto her toes. She gasps at the heat of the water, accentuating the fullness of her D-cup chest.");
	output("\n\n<i>“");
	if(flags["BEEN_PRIVATE_BATHED"] == undefined) output("Even after all the training the heat still gets me at first");
	else output("So embarrassing, it happens every time");
	output(",”</i> she confesses, stepping up to the edge of the pool before climbing carefully in. Her steps take her into the deeper portion at the middle of the bath, leaving everything below her collarbone submerged. Luckily the clarity of the water leaves nothing to the imagination, and you can see every curve and chitinous point beneath the ripples.");

	output("\n\n<i>“Please, Join me in standing. I’ll clean up all the dirt and impurities you’ve acquired on your travels,”</i> she assures you, wading back to the assortment of bath supplies she brought. You oblige her gentle command, moving slowly to a portion of the bath that matches your height. Now that you’ve had time to adjust, the hot water feels warm and cozy on your [pc.skinFurScales].");

	output("\n\n<i>“There, Isn’t that better? Today I’ll be scrubbing you down with a ");
	if(hours <= 12) output("natural blend of hand-crafted soaps and mineral oils");
	else output("mixture of gold myr honey and natural soaps");
	//ifsilly: mashed mushroom body soap with just a sprinkle of cave goo, worm spit, and cave bat guano}
	output(",”</i> she informs as she grabs a butterscotch bottle, squeezing out a ");
	if(hours <= 12) output("white soapy liquid");
	else output("thick, gold tinted liquid");
	//putrid, foul smelling green gunk
	output(" that coats her hand and drips into the pool. The soapy fluid is carried to the exit side of the softly flowing water, carried away to who knows where.");
	output("\n\nOnce her hands are completely coated, she strides over to you through the water, leaving a small wake of ripples behind. You can feel the gentle pressure of her movement in a small wave that bumps into your body. She stops short of running into you herself, reaching out to caress your ");
	if(pc.tone < 40) output("soft");
	else if(pc.tone < 70) output("fit");
	else output("toned");
	output(" body with lotion-covered hands.");
	if(pc.hasFur()) output(" The soap lathers easily into your [pc.furColor] fur, and she works it in thoroughly with her three fingered hands");
	else if(pc.hasGooSkin() || pc.isGoo()) output(" The soap tickles as it mixes with your gooey body, and the ant-girl tries her best to keep a straight face as her fingers accidentally find themselves wrapped in your exterior");
	else if(pc.hasScales()) output(" The soap is cool on your heated scales, bubbling up as she scrubs you with a soft brush");
	else output(" The soap feels cool on your heated skin, quickly turning to bubbles as she scrubs it in with a silky washcloth");
	output(".");
	
	output("\n\nThe orderly assistant’s hands explore your body as she rubs in the cleaning concoction. Her touches run briskly over your sex, but the movements are wholly professional for the time being. Beneath the water, she scrubs until the soap dissipates, distributing it evenly on your ");
	if(!pc.isTaur()) output("[pc.legOrLegs]");
	else output("tauric hindquarters");
	output(". Once her hands are free of foam, she takes the pitcher from before, using it to clean away the suds from your body.");

	output("\n\n<i>“Please close your eyes while I wash your face. I have been told the soaps can irritate the eyes of some offworlders,”</i> she asks politely. You close your eyes as she scrubs another foamy goop ");
	if(pc.hasHair()) output("into your [pc.hair]");
	else output("onto your scalp");
	output(", fighting the urge to gasp when she washes it away with piping hot water. She places the pitcher back on its tray before turning to face you again.");

	output("\n\n<i>“My services are fulfilled. Unless, of course, you require a <b>deeper</b> spiritual cleansing,”</i> she offers, her tone filling your mind with images of less than chaste scenarios. You could always just relax in the bath for a while longer, but why make her waste all this time without taking the full treatment.");
	flags["BEEN_PRIVATE_BATHED"] = 1;
	processTime(22);
	//[decline](normal bath is enough for now)[accept](you could go for some deep cleansing)
	clearMenu();
	addButton(0,"Decline",declineBathHJs);
	if(pc.hasCock()) addButton(1,"MaleService",acceptPrivateBathHJs,true,"Male Service", "Get some cleansing for your male parts.");
	else addDisabledButton(1,"MaleService","Male Service","You don’t have any male parts to service");
	if(pc.hasVagina()) addButton(2,"FemaleService",acceptPrivateBathHJs,false,"Female Service","Get some DEEP cleansing.");
	else addDisabledButton(2,"FemaleService","Female Service","You don’t have any female parts to cleanse.");
}

//Decline
public function declineBathHJs():void
{
	clearOutput();
	showName("\nBATH");
	author("Gardeford");
	output("You politely decline the crimson ant-girl’s offer, stating that you’d prefer to bathe alone this time.");
	output("\n\n<i>“Of course, " + pc.mf("sir","madam") + ", should you need further assistance just ring the bell and I’ll be available. The order tries to make sure bathers are matched with the same assistants if possible,”</i> she says, climbing out of the pool with careful movements. The sight of the water dripping off her naked body brings a few regrets to your mind, but you know what you wanted. She dries off with the towel she brought, retrieving her robe and saying her goodbyes with a bow and wave.");
	output("\n\nYou stay and soak in the tub for a little while longer. Now that you’re totally clean, you don’t have much to do in the private bath. You wonder if anyone other than you actually pays to bathe alone, as the bath was truly meant to fit a party. After mulling for a little while longer, you decide to leave the bath. The air chills your naked body as you step out of the waters warm embrace, and you scramble for the cloth towel you were given.");
	output("\n\nOnce you’ve dried off, you return to gather your [pc.gear] from the lockers before leaving the private bathing area. The orderlies show you back to the main lobby before continuing their duties.");
	processTime(10);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	// return to savins main room menu
}

//Accept
public function acceptPrivateBathHJs(dick:Boolean = false):void
{
	clearOutput();
	showName("BATH\nSERVICE");
	output("<i>“Sure, why not? I’ve got time,”</i> you reply, netting yourself a knowing smile from the cloth-blinded ant-girl. She takes another smaller bottle from the tray, popping off the cap and pouring a viscous, clear liquid that trickles like honey over her breasts and belly. The bottle empties quickly, and she rubs the sweet smelling syrup into her body, giving it a slick sheen.");
	output("\n\n<i>“This is a special oil made with honey and a hint of red myr venom, it will make it easier to expel the spiritual impurities that plague you,”</i> she says, her skin shining like copper in the dim light. After discarding the used bottle, she wades back to you, wrapping herself around you from the side and caressing your [pc.chest].");
	imbibeVenomEffects();
	//dickwielder
	if(dick)
	{
		output("\n\nYour body tingles as the oil touches it, and you feel a sensual warmth as her slippery limbs intertwine with your own. The lotion appears waterproof, as the water does nothing to clear it from her touch. You can feel the hint of red venom bringing [pc.eachCock] to full mast, but it doesn’t seem enough to impair you mentally. It appears to similarly affect your partner, whose breath catches in her throat each time her stiffening nipples brush against your [pc.skinFurScales].");
		output("\n\n<i>“Mmm, ");
		if(pc.cockTotal() > 1) output("such a fine selection for me to choose from");
		else output("such a fine instrument you have");
		output(". I’m not like the gawking girls you’ll see in the public bath. We in the order know exactly how to work with these,”</i> she whispers, her breath almost hotter than the water in your ear. Nimble fingers ");
		if(pc.cockTotal() > 2) output("weave through your myriad of cocks in search of one to hold");
		else output("wrap around your [pc.cockBiggest] with practiced ease");
		output(". Under the water her hands seem to move in slow motion, pumping your cock like the tide on a beach.");

		output("\n\n<i>“It takes a lot of <b>practice</b> to be a sister of the order, and we are required to <b>know</b> what to do in case one of the rare unattached males should need <b>release</b>,”</i> she continues, timing her emphasis with rhythmic constrictions around your [pc.cockHeadBiggest]. The strength of her squeezing adapts to your reactions. The part of you that still has reason marvels at her ability to maintain her grip with such slippery oil coating her hands.");
		output("\n\n<i>“Let me show you how long I can hold my breath,”</i> she finishes, ducking away and planting a wet kiss on your [pc.hip] before ducking into the clear pool. Even with the ripples distorting the image, you can see her glide through the water to match her lips up to your [pc.cockBiggest]. Her mouth envelopes your [pc.cockHeadBiggest] in a different kind of wetness, and you feel the ");
		if(flags["VENOM_ADDICTION"] == undefined) output("electric surge");
		//addicted
		else output("familiar pulse");
		output(" of red myr venom. It’s the real thing this time, no mere diluted body oil.");

		output("\n\nHer lips form a near perfect seal, and she ");
		if(pc.biggestCockLength() <= 14) output("takes your entire length, rubbing her nose against your pelvis");
		else output("takes as much of your length as she can handle, grazing your cockflesh with her teeth as gently as she can manage");
		output(". The venom in her saliva gushes through your bloodstream, leaking between failsafes already weakened by the heat of the bath. The aphrodisiac moves like a living thing, starting in your loins before fanning out to your limbs. Finally it settles in your chest like the warmth of a midsummer fire before creeping into your mind with bubbly promises of release.");
		output("\n\nYou find yourself unable to judge the ant-girl’s efforts, as her venom renders you unable to remember if she dove minutes or seconds ago. Time slips out of your comprehension, and all you can think of is the heat and the feeling of her lips on your [pc.cockBiggest]. Jets of pre-cum serve to further wetten her throat, preparing it for your load.");
		output("\n\nAll at once, the heat in your body collects into your crotch, and you feel your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("prostate");
		if(pc.balls <= 1) output(" tightens");
		else output(" tighten");
		output(" as ");
		if(pc.cumQ() < 15) output("a load");
		else if(pc.cumQ() <= 1000) output("ropes");
		else output("a torrent");
		output(" of your [pc.cum] fills the red myr’s eager mouth. ");
		if(pc.cockTotal() > 1)
		{
			output("Your other ");
			if(pc.cockTotal() > 2) output("cocks shoot");
			else output("cock shoots");
			output(" uselessly into the water, some spurts hitting her shoulders. ");
		}
		output("Fiery lights dance in your eyes as she continues to milk you until the spasms of orgasm let out. The fog on your mind begins to clear as the venomous coating of saliva is washed away, and you find the red ant kissing your belly as she rises from under the water. She takes a deep breath when she breaks the water, letting your [pc.cumColor] jizz pour out and into the pool.");
		output("\n\n<i>“It’s okay, it’ll be filtered by the cave heat. If not, I guess we’ll be finding out which of the bathers in the public baths are fertile,”</i> she says with a sly grin as your seed is carried to the pool’s exit trough. After catching her breath, your assistant retreats from the bath and begins drying herself off with the towel she brought. She redresses in the same satiny robe she came in, taking her tray of bathing goods and departing with a goodbye wave.");
		output("\n\nYou stay in the water until the high from her fluids has run its course, toweling off and retrieving your [pc.gear] from the locker room. The orderlies at the door show you back to the main lobby, where you can decide what to do next.");
		processTime(14);
		pc.orgasm();
		flags["BEEN_PRIVATE_MYRBATH_SERVICED"] = 1;
		clearMenu();
		addButton(0,"Next",privateBathServiceEpilogue);
	}
	//female
	else
	{
		output("\n\nThe lotion she’s using must be waterproof, because her hands remain just as slippery as they inch deeper into the bath to caress your [pc.legs]. You ");
		if(flags["BEEN_PRIVATE_MYRBATH_SERVICED"] != undefined) output("know");
		else output("doubt");
		output(" that the concoction ");
		if(flags["BEEN_PRIVATE_MYRBATH_SERVICED"] != undefined) output("isn’t");
		else output("is");
		output(" as powerful as real myr venom, but that doesn’t stop it from making your skin tingle at her touch. [pc.eachCunt] tingles in needful anticipation, growing stronger with the proximity of her fingers.");
		output("\n\n<i>“To be honest I’m glad you choose this service. As fun as dicks are, I’m much more used to the normal stuff,”</i> she admits with a smile, hugging closely to your body as she talks. Graceful fingers dance over your mons and rub [pc.eachVagina]");
		if(pc.hasClit()) output(" before focusing on your [pc.clit]");
		output(". Her hands move with surprising speed under the water, showing just how skillful she is.");
		output("\n\n<i>“Many of the lower ranking members of red myr command come here to cleanse themselves and relieve stress. I hear gold queens visited the baths on occasion, but if that’s true it was before my time,”</i> she continues, and you nod as you half-listen to her words, the rest of your attention snared by her touch.");
		output("\n\nThe bathhouse adherent’s free hand slides smoothly over your body, stopping to squeeze one of your buttcheeks. You can see the flush in your partner’s face even through the silky veil over her nose, and her stiff nipples press into your [pc.chest]. She leans in close, licking your chin and prodding your lips until they part for her tongue. Any attempts to resist her are quickly calmed by a sensual warmth.");
		output("\n\nThis is the real stuff, multitudes better than a facsimile. The diluted lotion is nothing compared to the aching lust created by the full strength venom in her saliva. You melt into her kiss, ");
		//unaddicted/addicted:
		if(flags["VENOM_ADDICTION"] == undefined) output("wanting");
		else output("<b>needing</b>");
		output(" nothing more than to let it continue for the rest of your life. Her tongue lingers outside her open mouth as she pulls back, and you try your hardest to suck it back into your mouth.");
		output("\n\nUnfortunately your hardest is weakened considerably by the venom, and she pulls gently out of your reach. The fingers massaging you");
		if(pc.hasClit()) output("r [pc.clit]");
		output(" are now an afterthought, pushed out of your mind by the thought of another round of drunken kissing. On second thought, you don’t even need to be involved. If she’d just lick you with that wonderful tongue, all your troubles would go away.");
		output("\n\nYou stare without focus into her veil, unable to make out distinct shapes with your heat and lust-addled mind. The pale goddess seems to read your needs, giving you a long lick up the ");
		if(!pc.hasMuzzle()) output("bridge of your nose");
		else output("length of your muzzle");
		output(". Her trailing tongue ends its journey between your eyes, followed immediately by a wet smooch. By now your vision has been reduced to simple colors, and you giggle at the indistinct moving shapes.");
		output("\n\nYour pearlescent bathing assistant says something, but her words sound like a dull hum in your ears. She kisses your collarbone, hovering for a moment before moving lower and licking the center of your stomach. The feeling of her fingers finally begins to take control of your senses, and the throbbing of your");
		if(pc.hasClit()) output(" [pc.clit]");
		else output(" groin");
		output(" pulses through every nerve.");
		output("\n\nA slow, volcanic heat swims through your body as her expert ministrations bring you to orgasm. If your muscles tighten you feel none of it, just complete relaxation accompanied by a sense of release. You slump against the order’s sister, ");
		if(pc.isTaur() || pc.tallness >= 84) output("forcing her to hold your larger frame for a moment before she can push you into a better position.");
		else output("forcing her to hold you for a moment while she finds a better position.");
		processTime(14);
		pc.orgasm();
		flags["BEEN_PRIVATE_MYRBATH_SERVICED"] = 1;
		clearMenu();
		addButton(0,"Next",femSceneWaterSploosh);
		return;
	}
	//Don't do stat stuff here - female scene breaks off higher up.
}

public function femSceneWaterSploosh():void
{
	clearOutput();
	showName("BATH\nSERVICE");
	author("Gardeford");
	output("The next thing you feel is a splash of cold liquid that swiftly clears your senses.");
	output("\n\n<i>“Sorry about that, but you looked like your spirit was about to be cleansed a little too much. I’d like very much to keep you safe to come again,”</i> comes the red myr’s voice from behind you. You turn to see her re-dressing, slipping the ivory robe over her lotion-coated body. Muscle memory reminds you of the last hour, and you feel a hot flush run through your body.");
	output("\n\n<i>“Please don’t hesitate to call on me again sometime,”</i> she calls as she leaves, waving a goodbye.");
	processTime(4);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",privateBathServiceEpilogue);
}

public function privateBathServiceEpilogue():void
{
	clearOutput();
	showName("\nBATH");
	author("Gardeford");
	output("You stay in the pool for a little while longer, waiting for the venom to work its way out of your system. When you don’t feel like fucking the next living thing you see, you hop out of the giant tub and dry off. Your [pc.gear] is exactly where you left it in the locker room, and you grab it as you head out the doors. The orderlies at the door show you back to the main lobby, where you can decide what to do next.");
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Oserre dildo display
//requires having seen Oserre's 'female cleansing' scene where she shows off her dildo collection
//also requires adjustable hardlight pak
//PC presents hardlight dildo to the blind lady, teases her by playing with the size in her hands, then fucks her
//tooltip: Oserre's a dildo collector - what'll she say when you show off your hardlight?
//disabled tooltip, no hardlight: You need hardlight-enabled underwear with a toy of adjustable size for this.
//disabled tooltip, has not seen Oserre's female cleansing dildo scene: You need to see something else to unlock this.

public function oserreDildoDisplayScene():void
{
	clearOutput();
	showOserre();
	//first time seeing this scene
	if(flags["OSERRE_HARDLIGHTED"] == undefined)
	{
		output("Pondering the matron’s question, your eyes wander to the drawer where Oserre stores her secret dildo stash. ");
		if(pc.isTaur() || pc.hasAirtightSuit()) output("You don’t really get much chance to toy with your technotronic underwear, situated as you are... what would Oserre say if you introduced her to it?");
		else 
		{
			output("Without really meaning to, you reach for your [pc.lowerGarment] to begin undressing");
			if(!pc.isCrotchExposedByArmor()) output(", and your thumb hooks the waistband of your [pc.lowerUndergarment]. You pause");
			else output(", but pause");
			output(" as two links come together. How wild would Oserre go if you showed off your fancy hardlight toy?");
		}

		output("\n\nThe matron is still waiting patiently for you to speak, all smiles and indulgence. You clear your throat. ");
		if(pc.isBimbo()) output("<i>“You still love big, hard, toy dicks, don’tcha?”</i> you ask.");
		else if(pc.isBro()) output("<i>“You still got your dildos?”</i> you ask.");
		else if(pc.isNice()) output("<i>“So... that box of ‘female cleansing aids’ you brought out the other time... are you still into those?”</i> you ask.");
		else 
		{
			output("<i>“Hey, do you still have that collection of freaky alien rubber-dongers?”</i> you ask, loudly enough to be heard");
			output("all the way to the public baths");
			output(". Oserre winces.");
		}

		output("\n\n<i>“Yes, indeed,”</i> she returns.");

		if(pc.isBimbo() || pc.isBro() || pc.isAss())
		{
			output("\n\n<i>“Wanna see mine?”</i>");
		}
		else if(pc.isNice()) output("\n\n<i>“I have one with me... would you like to play with it?”</i>");
		else output("\n\n<i>“I brought one... wanna </i>touch<i> it?”</i>");

		output("\n\nOserre smiles - a smile so eager that you would bet her eyes are twinkling. <i>“Oh, yes. I would relish the chance.”</i>");

		output("\n\nYou ");
		if(!pc.isCrotchExposedByArmor()) output("quickly strip down to just your [pc.lowerUndergarment] and ");
		output("invite her to inspect your hardlight projector. The myr’s four hands reach out to you; after a moment to understand her meaning, you ");
		if(pc.isTaur()) output("lower her to the level of your legs and then move astride them, bringing your crotch to Oserre’s palms.");
		else output("take them into yours and move them to your crotch.");
		output(" A shiver passes through you as the myrrish fingers begin to explore your underpants, from outside to inside. But when she fails to locate any ‘cleansing aid’ as she understands it, the matron is at a loss.");
		output("\n\n<i>“There seems to be nothing here... aside from your charming self,”</i> she flirts");
		if(pc.hasCock()) output(", tracing the [pc.cockNounSimple]-shaped outline of your bulge");
		output(". <i>“Is there some action or mechanism that you must demonstrate?”</i>");

		output("\n\nYou bite your tongue to stifle a laugh and reach for the controls. Oserre will be surprised with your ‘demonstration’... you’re going to ‘demonstrate’ a big fat dick right into her hands. <i>“Yes,”</i> you answer patiently. You tap the power and the garment goes to work: a thick prick blooms from the projector, parting the myr’s fingers like a bull through tall grass. Oserre practically jumps.");
		output("\n\n<i>“Why... that’s astounding! I felt no machinery move at all!”</i> The myr matron leans in, astonished, and her hands caress their way up the prick to take its measure. The touches translate to your waiting nerves, sending shivers of pleasure up your back, and you decide not to squander her excitement.");
		output("\n\n<i>“Keep, er, watching,”</i> you encourage. You slide your fingers along both the length and girth controls, up-sizing the hardlight hard-on, nearly boring a hole in Oserre’s cage of hands. The fat tip plows them apart... and grows right down Oserre’s top. The myr gasps as the prick keels through her cleavage.");
		output("\n\n<i>“Oh, my gracious!”</i> she exclaims.");

		output("\n\nThe holo-cock pushes her breasts apart as it did her hands, forcing them against the sides of her robe. You can feel her smooth, tielding skin through the feedback, and the big, jiggling beauties draw your stare like an indecent sculpture, trickling drops of nectar into the fabric as the prick squeezes. You cut the growth when you hear an abrupt ‘<i>rrrip</i>’ - the myr’s neckline has begun to tear from the strain of resisting her hefty breasts.");

		output("\n\nYou’re not the only one to hear it; Oserre flinches as well. But far from being upset, she seems ridiculously aroused. Her mouth hangs open in dumbfounded hunger and her hands trace every exposed inch of the projection’s surface, from the base to her chest, and then caress the indent in her bosom where the prick has made a cozy new home.");

		output("\n\n<i>“Adjustable in size,”</i> she marvels, <i>“and produced from a space no thicker than a cloth! This is truly an amazing cleansing aid!”</i>");
		output("\n\nEven if you didn’t already suspect there were something more than professional admiration for your toy, the puffy diamonds hiding under Oserre’s top would give it away. With one eye figuratively and one eye literally on her stiff nipples, you make a suggestion.");
		if(pc.isBimbo()) output(" <i>“Then, honey, you wanna try it out?”</i>");
		else if(pc.isBro() || pc.isAss()) output(" <i>“Then, wanna fuck?”</i>");
		else output(" <i>“Would you like to see how it feels for yourself?”</i>");

		output("\n\nOserre’s face lights up, but then is just as quickly pained with consternation. <i>“I don’t know if that’s appropriate. I mean, I certainly would... but </i>my<i> cleansing and release is not the purpose of this bathhouse... and not what you paid for.”</i>");

		output("\n\nYour ");
		if(pc.isTaur()) output("mind’s eye drifts");
		else output("eyes drift");
		output(" to her huge, straining breasts again, contorting around the unforgivingly hard cock and bulging against her robe. ");
		if(pc.isBimbo()) output("<i>“Ooh, but watching you enjoy yourself will make my ‘spiritual release’ all the more amazing.”</i>");
		else if(pc.isBro() || pc.isMischievous() || pc.isAss()) output("<i>“Whatever. Isn’t the customer always right? You can ‘cleanse’ me afterward.”</i>");
		else output("<i>“That’s okay; I want to do it. You can return the favor afterward.”</i>");

		output("\n\nThe ant matron doesn’t argue again. She retrieves the fat prick from her cleavage with a grin and a nod, and stands up. <i>“Then, I accept. Please position me however you think best for my... refreshment.”</i>");
	}
	//repeats
	else
	{
		if(pc.isBimbo() || pc.isNice() || pc.isMischievous())
		{
			output("<i>“");
			if(pc.isBimbo()) output("Ooh, I came so much");
			else output("I quite enjoyed myself");
			output(" last time you rode my ‘cleansing aid’... could we do that again?”</i> you ask.");
		}
		else
		{
			output("<i>“I wanna fuck you with my dildo");
			if(pc.isAss()) output(" and see those big titties flapping in my face again");
			output("... how about you get down on this?”</i> you ask, crudely thrusting your crotch.");
		}
		output("\n\nOserre’s smile twinkles. <i>“Absolutely,”</i> she answers, templing her fingers together. <i>“But... would you please produce it now, so I can make sure it’s sized for perfect spiritual relief?”</i> Her hands drift toward your crotch as she speaks, coming to rest near the projector. The bawdiness and shamelessness of this woman, now that you two have become more intimate and not so formal, is absolutely astonishing. She presses her heavy breasts into you, trying to arouse an affirmative response.");

		output("\n\nBut, of course, there’s only one thing to say as you stare into the heaving cleavage: <i>“All right,”</i> you answer, tingling from the caresses of four alien hands. Oserre plants a soft kiss on your ");
		if(pc.isTaur()) output("flank");
		else output("chest");
		output(", and then waits patiently for you to engage the toy.");

		output("\n\nTapping the power control brings your [pc.lowerUndergarment] to life, and a modest holo-cock emerges from the projector, sliding between the matron’s palms. Oserre looks pleased - but only because she knows you can make it much, much thicker. You move to the size controls, ramping up both the length and girth sliders, doing your best to match the size that charmed the horny myr last time and shuddering as the toy transmits the feeling of sliding through her fingers.");
		output("\n\nOserre seems to have a different idea. Instead of trying to eyeball the photo-cock’s dimensions, she brazenly shoves it between her tits, right through her cleavage, the same way it surprised her the first time. The lusty woman leans forward into the cock, jiggling her breasts inside her tightening top for as long as she still can to allow the tip easy passage. Just as they begin to strain at the stitches, before the robe rips again, she motions for you to stop.");
		output("\n\n<i>“I had my robe made slightly looser, on the chance that you might come back,”</i> she flirts. The golden flesh pressed up to the window of her plunging neckline quivers as she withdraws from the cock, and fills in like deep water, re-forming the matron’s perfect cleavage.");
		output("\n\nOserre stands and holds her hands out to you. <i>“Once more I invite you to position me however you deem fit... and please, don’t be afraid to be forceful.”</i>");
	}
	//merge intros
	output("\n\nYou take the myr’s hands eagerly, posing her in your mind like a love doll, trying to decide on the best way to have her. A simple cowgirl position seems the best way to enjoy her enthusiasm - and those gorgeous, heavy tits.");
	output("\n\nOserre follows obediently as you lead her to her personal bath. You take a seat at poolside, ");
	if(pc.isTaur()) output("awkwardly resting your " + num2Text(pc.legCount) + "-legged bulk against the adjoining wall,");
	else output("dangling your [pc.feet] in the water,");
	output(" and pull the unwary matron onto your lap - the sudden descent elicits a gasp from her, and the sharp intake of air presses her breasts against you, with their hard, wet nipples. Speaking of... you tug at Oserre’s neckline, trying to free her gorgeous bust. The myr helps, impatiently grabbing the fabric in four hands and tearing a deep rip. She reaches in and lifts her breasts free of her robe, allowing them to jiggle as she moves, bumping into your");
	if(pc.biggestTitSize() < 1) output(" chest");
	else output(" [pc.chest]");
	output(" and dribbling honey. So far, so good!");

	output("\n\nThe photon piston bobs in the air behind her, fencing with her trembling abdomen which is already beginning to leak myrrish fem-lube onto your [pc.legs]. <i>“How intimate,”</i> the matron remarks, and another breath pushes her breasts into skinship with your naked [pc.chestNoun].");
	output("\n\nSaying nothing, you reach both hands around her waist and raise her abdomen as high as you can, trying to line it up with the tip of the cock. Oserre wraps her arms around your neck and clings close to you, doing her best to angle herself and help you get the elevation you need to impale her; her breasts ");
	if(pc.biggestTitSize() < 1) output("press sticky, sweet nectar into your chest.");
	else output("marry with your own [pc.breasts], smearing sticky, sweet nectar through your cleavage.");

	output("\n\nThe myr’s grasping, drooling pussy finds the shaft, just inches below the tip. With one final push, she surmounts the monster mirage and captures its tip. Oserre’s mouth opens in a cute ‘oh’ as she achieves penetration, as does yours, and she breaks her embrace around your neck. Instead, she presses her palms flat against your chest and practically shoves herself onto the enormous holo-dick.");

	output("\n\nThe myr matron releases a lingering hiss of breath through her teeth as her abdomen settles onto your crotch, nearly taking the whole length of the dildo in her impressive cunt; the warm, wet walls of her pulsing pussy are transmitted to you through the toy. She smiles at you from beneath her hood, and her tense arms relax. In their place, her splayed legs straddle your pelvis and brace, folded, against the floor. She begins to raise her abdomen and push with her calves, lifting her weighty ant-booty up the dildo with a lewd, wet ‘schlick’ and sinking down again.");
	output("\n\nThe busty myr shudders as the dildo enters her a second time, and stops at the bottom. You’re not sure, but you suspect that you see a hint of devilry in her smile. It would be easy to tell if you could see her eyes....");
	output("\n\n<i>“A bit more... spiritual unguent would seem to be in order,”</i> the wily woman murmurs. <i>“Could you hand me the pink bottle by your elbow?”</i>");
	output("\n\nYou look left and identify the bottle, then pass it to the woman. She opens the stopper and takes a deep smell, then pours some onto her hands. It’s oily and thin, and she raises up on the dildo to rub the oil along the shaft. Surely she can’t be serious that she needs more lube... there’s so much myrrish pussy-juice that it’s beginning to form a puddle in your lap.");
	output("\n\n<i>“This will be much more suitable,”</i> Oserre asserts confidently. As she works the oil into the holo-rod, the smell makes its way to you... and the scent of it sends blood rushing to your head and your ");
	if(pc.hasGenitals()) output("genitals");
	else output("asshole");
	output(".");
	if(pc.hasCock())
	{
		output(" Your ");
		if(pc.cockTotal() == 1) output("cock swells");
		else output("cocks swell");
		output(" painfully and begin");
		if(pc.cockTotal() == 1) output("s");
		output(" to drool precum, trapped under the fabric of your [pc.lowerUndergarment] and the myr’s booty.");
	}
	else output(" Your [pc.vagOrAss] inflames with lust, twitching and protesting its emptiness to your spinal nerves.");
	output(" Understanding comes quickly: the oil must be an aphrodisiac.");

	output("\n\nOserre slides down the slut-slicked strap-on stanchion again, and the change wrought by the aphrodisiac oil is immediate and intense. Her whole chest colors a brilliant orange as heated blood rushes to her golden skin and she pumps her pussy on you, grinding the oil into a froth and releasing even more fragrance into the air. Your whole body aches for release as you watch and feel the randy myr ride your toy; she begins to pump her hips so violently that her gorgeous, unrestrained breasts fly freely in the air as she sinks down, bobbing and swinging like globose pendulums. They slap against her ribs so loudly when they fall that they begin to gush and drool honey all over the both of you, turning your lovemaking into a soupy, syrupy mess of slick flesh.");
	output("\n\nThe oils and enthusiasm bring Oserre to her ‘spiritual relief’ within minutes. The myr woman groans and shudders, pressing her sopping bust to your chest and going limp in your arms as her abdomen ripples around its huge invader. You can literally see the bands of chitin on it rise and fall as contractions pass through the muscle, desperately milking the photo-prick for cum but collecting only more aphrodisiacs. Close as you are to your own climax, the pressure of her orgasm on your toy is maddening. Sweet-scented fem-cum pours from her, running down your lap and into the pool, adulterating the clean water with oily, sticky love. The myr’s skin glows with burning blood, and her pelvis jerks back and forth, cutely flexing her stomach as she works out her enormous orgasm onto you. After a minute of twitching, she seems to regain some muscle control.");
	output("\n\nThe myr rests in your lap, with her arms draped loosely around and her honeyed breasts pressed to you for a pillow. Her antennae droop from the exertion, but the smile on her face would be almost beatific if it weren’t so open-mouthed and panting. She remains with you for another minute, then with one last push separates herself from the monster dildo. Wobbly-legged, Oserre dismounts you and kneels beside.");
	output("\n\n<i>“Truly exceptional,”</i> she praises. You’re not sure if she’s referring to your technological tool or to you - her eyes are, as always, invisible and impervious.");
	if(pc.isBimbo()) output("\n\n<i>“Like, you know it,”</i> you chirp, pulling the tip toward you with a finger and letting it spring back to position.");
	else if(pc.isBro()) output("\n\n<i>“Yuh,”</i> you answer, tersely.");
	else output("\n\n<i>“I thought you’d like it,”</i> you reply.");

	output("\n\n<i>“This garment... do you wash it in water?”</i> Oserre asks, folding her hands into her sleeves.");
	output("\n\nHazy, you almost nod at her but check yourself and respond aloud.");

	output("\n\n<i>“Very good,”</i> Oserre replies. As quick as a blink, she pulls your underwear from your limp body, active dildo and all; the sensory feed disconnects with a sudden absence that feels almost like a pinch. The matron takes it to the doorway, where she rings a small chime. An attendant comes to meet her, but takes one look at Oserre’s ripped robe and your ");
	if(pc.hasCock()) output("pre-cum and ");
	output("honey-soaked underwear, still erect with a hardlight hard-on, and begins to giggle nervously. The matron hands your [pc.lowerUndergarment] over and orders the embarrassed girl to clean and return it.");

	output("\n\nRejoining you at poolside, Oserre places a hand over yours. <i>“Thank you. I feel truly refreshed. Now... I must attend to my duty and see to your spiritual needs,”</i> she says. Her fingers begin to walk along your thigh, heading for your ");
	if(pc.hasCock()) output("[pc.cocksLight]");
	else if(pc.hasVagina()) output("[pc.vaginas]");
	else output("[pc.ass]");
	output(". <i>“Why don’t you slip into the bath?”</i>");

	output("\n\nYou eye the water, fragrant and glossy with Oserre’s spilled fem-cum, breast honey");
	if(pc.hasCock() && pc.cumQ() >= 500) output(", your copious rivers of pre");
	output(", and frothy aphrodisiac oils. The matron presses gently but insistently on your back, urging you into the water - you’re unsure if she knows that it’s been adulterated by her sexual ‘cleansing’. A glance into her face tells you the answer: she’s grinning pervertedly and quivering with excitement, a flush-faced picture of clear intent. <i>She knows.</i>");
	output("\n\nYielding to her insistence, you slide into the pool. The matron kneels beside you and begins to douse your body with the smutty, aphrodisiac-laden water. New blood flows into your ");
	if(pc.hasGenitals())
	{
		output("sex");
		if(pc.cockTotal() + pc.totalVaginas() > 1) output("es");
	}
	else output("asshole");
	output(" as the oil-and-nectar froth touches your [pc.skinFurScales], pounding at your nerves and throbbing in your temples.");

	output("\n\nOserre manages to read your mood in her inscrutable way. Her oily hand slides down your [pc.belly] and comes to rest on your ");
	if(pc.hasCock()) output("[pc.cockNounSimple], which she begins to stroke.");
	else if(pc.hasVagina()) output("[pc.clitoris], which she begins to rub.");
	else output("[pc.asshole], which she begins to finger.");
	//(if cock+balls)
	if(pc.hasCock() && pc.balls > 1) output(" Another hand joins it, caressing your swollen sack and fingering the sweet spot of nerves at the base.");
	output(" Within minutes, the slick, soft touches bring you the rest of the way to climax.");

	//if cock
	if(pc.hasCock())
	{
		output("\n\n[pc.Cum] ");
		if(pc.cumQ() < 20) output("dribbles from you, blending flawlessly with the rainbows of colored oil continuously forming and breaking on the water’s surface with nary a [pc.cumColor] speck to reveal your release.");
		else output("spurts from your cock in thick, pent-up ropes that lance out with enough force to break the water’s surface.");
		//big only
		if(pc.cumQ() >= 500) output(" Your wanton body produces so much, spurt after shot after stroke, that the color and consistency of the pool begin to change, becoming tangibly [pc.cumVisc] and streaked with [pc.cumColor]. The spunk clings to Oserre’s hand as it glides up your prick, in and out of the water, churning your mess of cum in with her own like a surreal external fertilization.");
	}
	//if vagOrAss
	else
	{
		output("\n\nThe myr’s finger inside you is pinned in place by your nearly-painful contractions; the aphrodisiac oils inside your ");
		if(pc.hasVagina()) output("pussy");
		else output("hole");
		output(" tease and torment the nerves even now, causing mini-orgasms as your folds rub against one another and your muscles spasm.");
		if(pc.isSquirter() && pc.hasVagina()) output(" [pc.GirlCum] gushes from you, turning the water immediately surrounding into a pastel melange of pink oils, golden honey, and [pc.girlCumColor] jizz.");
	}

	output("\n\nOserre retracts her hand after you’ve spent your orgasm, careful to avoid inducing any further excitement - after all, the lingering oils will take care of that. She dutifully washes your body of the sexual smut you two have created, as best she can with the corrupted bath, and then aids your spent body in climbing out with surprising strength. The myr towels you off and retrieves your underwear, which are sitting on a shelf by the door, still projecting their monster cock. The attendant must have come and gone while you were distracted by Oserre’s hands; you wonder idly if she lingered, and for how long");
	if(pc.exhibitionism() >= 33) output(" - the thought of her watching you get off brings a restless tingle to your sex");
	output(".");

	output("\n\nOserre regards you warmly as you dress. <i>“I have no words to express my gratitude for your assistance and selflessness in refreshing my own spirit. I am ashamed to admit that I had neglected it for too long... your help was most welcome. Perhaps the soul of our order flows through you... I hope you return to visit us again.”</i>");
	output("\n\nYou stop to read between the lines and determine just how Oserre feels, but you needn’t have done. The myr matron leans over one last time, kissing you on the cheek in farewell... and pressing her naked breasts to you again.");

	IncrementFlag("OSERRE_HARDLIGHTED");
	//end
	//do pc orgasm; pass time; place PC wherever he goes after Oserre session
	processTime(35);
	pc.orgasm();
	//feel free to give herm PCs a tiny chance to become pregnant with own (human) kid from bathing in their own spunk
	//Fen note: nope
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}