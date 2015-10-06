public function bethsBonusFunction():Boolean
{
	//time 0600-0959
	if(hours >= 6 && hours < 10)
	{
		output("You're inside Beth's Busty Broads, and you seem to have arrived during their off-hours. A few customers are still nursing drinks, but none of the stages are occupied, and a custodial worker in a frumpy jumpsuit is tidying up. An empty desk near the door has a lit holo-board with a message printed on it.");
	}
	//hour 1000, 1300, 1600
	else if (hours == 10 || hours == 13 || hours == 16)
	{
		output("You're inside Beth's Busty Broads, which seems to be doing very good business for itself. Many patrons are sitting tranquilly by the stage in the center of the floor, patiently watching the fluid, undulating dance of a purple doh’rahn in almost perfect silence. Even the air in the room seems to have an enchanted quality. A desk has been set up near the door, where a bored-looking human woman is flipping through a data-slate, barely acknowledging your presence.");
	}
	//hour 1100, 1400, 1700
	else if (hours == 11 || hours == 14 || hours == 17)
	{
		output("You're inside Beth's Busty Broads, which seems to be doing good business for itself. Customers ring the center stage, watching a modestly-endowed but <i>very</i> flexible human girl work the pole like a gymnast with an Electra complex. A desk has been set up near the door, where a bored-looking human woman is flipping through a data-slate, barely acknowledging your presence.");
	}
	//hour 1200, 1500
	else if(hours == 12 || hours == 15)
	{
		output("You're inside Beth's Busty Broads, which seems to be doing a modest business for itself. A few die-hard fans are seated around the center stage, watching a ");
		if (!CodexManager.entryUnlocked("Vanae")) output("limber, big-breasted, blind alien with a skirt made of tentacles that fly elegantly as she dances.");
		//(has met)
		else output("vanae circle the pole, tentacles tracing elegant helical patterns as she spins.");
		output(" A desk has been set up near the door, where a bored-looking human woman is flipping through a data-slate, barely acknowledging your presence.");
	}
	//hour 1800, 1900, 2100, 2200, 2400, 0100, 0300, 0400
	else if(hours == 18 || hours == 19 || hours == 21 || hours == 22 || hours == 24 || hours == 1 || hours == 3 || hours == 4)
	{
		output("You're inside Beth's Busty Broads, which seems to be doing very good business for itself. Patrons stand two-deep around the stage in the center of the floor, jostling for better glimpses of an orange-and-yellow-scaled ovir with generous curves and stylish lingerie. A desk has been set up near the door, where a bored-looking human woman is flipping through a data-slate, barely acknowledging your presence.");
	}
	//hour 2000, 2300, 0200, 0500
	else
	{
		output("You're inside Beth's Busty Broads, which seems to be doing good business for itself. Several patrons are gathered around the stage in the center of the show floor, watching a particularly well-endowed ausar girl strut her stuff on the pole. A desk has been set up near the door, where a bored-looking human woman is flipping through a data-slate, barely acknowledging your presence.");
	}
	addButton(0,"Desk",talkToBrothelLadyNewOmni);
	return reahaBonusFunction();
}

//Ovir Girl/Ovir ‘Girl’
//’Ovir ‘Girl’ button name and smarty choice buttons below require governing stat to be >= 80% of cap (high because Tavros is early-game) OR 40 raw value, whichever is least; else button displays as ‘Ovir Girl’ (without any quotes)
//governing stat is LIB if PC has ‘Fuck Sense’ perk, else INT
//hidden until PC selects ‘The Girls’ from bored miss menu
//selectable only when ovir is on center stage (which is often @ 8 hours a day)
//usable by any sex or leg config
//bitch loves to dance and get men's attentions (total homo)
//reminder to me: ovir have horsecocks because Third is a lazy slut
//tooltip, stat < threshold: Watch the pretty ovir dance.
//tooltip, stat >= threshold: Though advertised as a ‘broad’, this busty ovir is probably a male, judging by her colors. You could test the theory, if you wanted....
//tooltip disabled, hour 0500-1759 or 2000 or 2300 or 0200: The ovir’s not on stage right now. She works in the evenings, alternating dances with the ausar.
public function ovirGirlInBeths():void
{
	clearOutput();
	flags["BETHS_OVIR_SEEN"] = 1;
	showName("OVIR\nGIRL");
	author("Zeikfried");
	output("You make your way over to the center stage and join the customers watching the ovir. A trifornifilia waitress offers you a drink from a tray, but you wave her off and she lopes away looking peevish. Without the distraction, you’re free to focus on the dancer.");
	output("\n\nThe ");
	if(!knowBethsOvir()) output("girl");
	else output("‘girl’");
	output(" is of average height, with carrot-yellow hair tied in a long ponytail that flips around eye-catchingly as she circles the pole, and dressed in a lacy red-and-black stocking-and-garter ensemble with a matching, front-clasped bra to contain her D-cup breasts. Her scales are pale yellow in most places, but densely freckled orange ones decorate her scalp, around her hairline, and partway down the back of her neck. An orange, reptilian tail sticks from a hole in the back of her red panties, just below the band, and close-set orange freckle-scales rise ever-so-slightly into a peak above it. Bright yellow eyes, outlined with dark make-up, drink in the attention of the onlookers.");
	output("\n\nAnd quite a lot of attention there is. The ovir seems to be a darling of the crowd; the patrons are two-and-three deep in places");
	if(pc.tallness < 60) output(", and you have to kick a number of shins to clear enough people from your path that you can see her and she you, without obstruction");
	output(". Frequent hoots erupt whenever she does a particularly impressive maneuver, along with the odd request for her to <i>“show us your boobs”</i> or <i>“get naked”</i>.");
	//if relevant stat >= threshold, present options ‘Watch’, ‘Tease’; else if < threshold shunt directly to ‘Watch’ text without buttons or output clear
	clearMenu();
	if(knowBethsOvir())
	{
		if(flags["OVIR_TEASED"] >= 1 || flags["TIMES_SEXED_ALISS"] >= 1) output("\n\nYou know from experience that she's actually a male ovir.");
		else  output("\n\nOvir females aren't usually so stacked. She must actually be a male...");
		clearMenu();
		addButton(0,"Watch",watchOvirDancer,undefined,"Watch","Ogle the ovir.");
		addButton(1,"Tease",teaseTheOvir,undefined,"Tease","Tease the ovir until she gets a boner.");
	}
	else addButton(0,"Next",watchOvirDancer);
}

//‘Watch’ - mandatory for dumbass PCs
//watch without fucking with her
//should be spacebar default if smart
//tooltip: Ogle the ovir.
public function watchOvirDancer():void
{
	clearOutput();
	showName("OVIR\nDANCER");
	author("Zeikfried");
	
	//(PC masculine enough to be past androgynous)
	if(pc.femininity < 40) 
	{
		output("The ovir’s eye falls on you during one of her languid, audience-watching struts, and she smiles. Puckering her lips, she blows you a kiss. There’s no way you could mistake her intention: she fancies you.");
		if(pc.isNice()) output(" You grin awkwardly in return, not sure how to follow up.");
		else if(pc.isMischievous()) 
		{
			output(" You mime grabbing the kiss from the air and stuffing it into your ");
			if(pc.isCrotchGarbed()) output("[pc.lowerGarment]");
			else output("crotch");
			output(", which causes her to grin wider.");
		}
		else output(" You mime grabbing the kiss from the air, shoving it in your mouth, and chewing it up. The dancer blows a raspberry at your gauche display and keeps dancing.");
	}
	output("\n\nYou observe the dancer for a while. Her routine is athletic and provocative, but perhaps the most noticeable thing is just how much she seems to be <i>loving</i> it. The ovir smiles and makes eye contact with the mostly-male crowd joyously, feeding on their arousal. Even the vulgar requests please her. Whenever one of the drunks demands to see her boobs or pussy, she turns toward the sound of the voice and jiggles her body obediently, moves her hand to the clasp of her bra or her waistband, pretending that she might consider it just this once, and then pulls it back with an index finger waving as if to say: <i>“Naughty, naughty...”</i>");
	output("\n\nYou remember what the bored desk-jockey said about her: that she isn’t actually indentured to the club. She must be the only woman in here who’s actually working an ordinary job, apart from the sexless mistress and possibly some of the waitresses. It starts to make sense - the ovir likely applied to dance here because she loves being wanted by men.");
	//(for dumb only until end)
	if(!knowBethsOvir()) output(" But you still get the feeling that you’re not quite clever enough to see the whole picture, somehow.\n\nThe girl is quite pretty, possibly even beautiful, and it’s very much a pleasure to watch her dance. All the same, there’s something off about her that you can’t put your finger on. You study her for a bit longer before you decide to leave, but between her proud, happy smiles and the enticing shake of her hips, you never figure out why you have such a strange hunch.");
	//it’s your gaydar, bro
	//end, add lust, pass time
	pc.lust(27);
	processTime(12);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//‘Tease’ - smart PCs only; buttons don’t even appear for dumbs
//gawk out with her cock out
//tooltip: Tease the ovir until she gets a boner.
public function teaseTheOvir():void
{
	clearOutput();
	showName("OVIR\nDANCER");
	author("Zeikfried");
	output("The more you watch the ‘girl’ move and study her colors, the more you’re sure that she’s actually a male. Guessing by the way she thrives on the attention of the men in the room, the aftermarket nipples poking up under her lacy bra, and the ultra-feminine curves of her body, it’s fairly safe to assume she doesn’t advertise it openly for fear of driving her adoring public’s attention elsewhere. Even so, there’s only one way to demonstrate to the crowd that your hunch is correct.");
	if(pc.isPsionic())
	{
		//psionic-capable PC fork
		output("\n\nIt’s a simple matter to imagine the ovir with a hard, bulging cock between her legs, and all you have to do is wait for her to make eye contact. The moment she does, you focus on sending the image. She stumbles slightly as your perverted pin-up of her pops into her mind, but recovers and continues dancing. Too professional to stare openly and distract the crowd, she nevertheless sneaks a glance at you often, and each time her eyes meet yours you send another image of her, adding details and advancing the scene, from cock out to full nudity, to masturbation, to fucking, to cumming.");
	}
	//66+% exhib fork, male/herm non-taur
	else if(pc.exhibitionism() >= 66 && pc.hasCock() && !pc.isTaur())
	{
		output("\n\nFirst confirming that the ovir is aware of you, you position yourself in the back, unable to be seen by the crowd or the bored mistress. ");
		if(pc.isCrotchGarbed()) output("You pull down your [pc.lowerGarments] enough to expose [pc.oneCock], and the ovir’s eyes go wide at the sight of your dangling [pc.cockNounSimple].");
		//(nude bottom)
		else output("You wrap a hand around [pc.oneCock] and masturbate it to erectness, and the ovir’s eyebrows shoot up at the sight of your public indecency.");
		output(" Managing to keep her stage sense, she doesn’t stare long enough to distract the audience, but she can’t help but sneak a glance at you every turn around the pole as you surreptitiously stroke off your prick, looking right into her eyes and smiling a come-hither smile.");
	}
	//66+% exhib score fork, female/unsex/taur
	else if(pc.exhibitionism() >= 66)
	{
		output("\n\nMaking sure the ovir is aware of your presence in the back of the crowd, you ");
		if(pc.isChestGarbed()) 
		{
			output("discretely open your [pc.upperGarments] and slide ");
			if(pc.biggestTitSize() >= 1) output("your [pc.breast] free, bringing ");
		}
		else output("caress your [pc.chest] and slide ");
		output("a hand to your [pc.nipple]. You finger and pinch the sensitive flesh on your chest, mouthing a throaty moan, putting on your own private show and causing the ovir’s own jaw to hang slightly slack. A professional, she doesn’t maintain her gaze long enough to distract the audience from her dance, but all the same she sneaks glances at you at every turn on the stage, enviously watching you play with yourself.");
	} 
	//basic-ass tease, masculine PCs
	//male gnome dance
	else if(pc.hasCock()) output("\n\nIt’s no trouble to catch the ovir’s attention - she watches the crowd closely for approval. You just have to offer eye contact and an adoring smile, and her gaze locks onto your [pc.face], returning there every time she completes a twirl. At first urbane in your behavior, you slowly intensify your sexual signals to the truly vulgar, puffing out your chest, then blowing kisses, then clutching your hands in front of your crotch as if holding her hips. Though she’s too smart to stare and clue everyone in to your private game, the ovir can’t not glance at your mimed transgressions, and by the time you’re thrusting your pelvis in simulated sex and raising a hand to slap at her ass and pull her tail, her embarrassed grin is miles wide.");
	//basic-ass tease fork, feminine PCs
	else
	{
		output("\n\nThe ovir’s eyes continually pan the crowd as she twirls and struts, so it’s easy enough to catch her attention. You caress your body, showing off your [pc.hips] and [pc.butt] to the dancer the same way she does on stage, making sure she gets an eyeful of your suggestive poses and counterfeit orgasm faces whenever her gaze falls on you. Increasingly uncomfortable, she’s too skilled to show it openly and clue the audience in, but you can see it in the way her eyes meet yours and then flick away. You continue to tease, challenging her to meet your smoldering stare as you model your flesh.");
	}
	//merge all
	output("\n\nAs you reach the height of your little demonstration, the ovir is rubbing her thighs together and whining softly");
	if(pc.exhibitionism() >= 66) output(" along with you");
	output(". A bulge forms in her lacy red panties as she fidgets, swelling larger and more oblong by the second, until it peeks from the low-cut fringe. The orange-and-yellow crescent moon grows and strains against the yielding waistband, silencing the crowd. As the patrons watch, the flared tip slips free, allowing her half-erect cock to swing out. Like the poor ovir, it’s yellow at the base and shifts in color close to the end.");
	output("\n\nThe girl, rather, the boy, freezes as her thick tool bobs. One hand still clings to the pole while the other covers her face in shame. None of the stifled patrons seems to know how to react, staring dumbly at the revealed penis.");
	output("\n\n<i>“Dance!”</i> you cheer, shattering the stillness. <i>“Dance, dance!”</i>");

	output("\n\nHer eyes dart back to you and a shy smile spreads between her fingers as the mob takes up the chant: <i>“Dance! Dance!”</i>");
	output("\n\nThe ovir lowers her hand from her face and looks around the room at the excited patrons, surprised, embarrassed, and excited in equal measure. Haltingly at first, like a lamb taking its first steps, the feminine boy places both hands on the pole again and begins to spin. As the crowd’s enthusiasm for her lewd, indecent show continues to surge, she gains confidence, picking up her former routine until she’s whipping ‘round the stage like a dervish. Her thick, blunted cock swings blithely and frots the pole whenever she stretches a leg, causing a shiver in the dancer and a swell of hoots and hollers from her watchers.");
	output("\n\nThe more she spins, the faster her erect dick strokes the pole, until beads and then steady streams of pre begin to form at the slit. No sooner does she secrete them than they’re flung from her flare by her momentum, falling in overlapping rings on the stage. Veins come to the surface of her shaft and her hips start to buck on their own, but the ovir, brilliant in showmanship, works her pelvic twitches right into her act. She draws back and saws into the pole, fucking it with exaggerated motions that throw her knees toward the ceiling in ballet-like poses and lean her so far back that her D-cup tits bounce wildly on her chest. At one point, she even turns completely upside-down, suspending herself by her arms and splaying her crotch wide against the pole so that her throbbing cock drools precum on the underside of her breasts. The mob roars as she leans in and kisses the tip of her own slimy dick before righting herself again. She stares right at you as her pink tongue dabs her cumslit, making sure you see everything you’ve inspired, and a blush of hard arousal runs up your spine.");
	output("\n\nHer panties and bra are soaked with sexual fluids and sweat, turning from red to crimson, and she can’t possibly be far from blowing her huge wad of jizz onstage. The thought seems to excite her as much as it does you, and her acrobatic twirls devolve into simple circles around the stripper pole, caressing the sensitive underside and crown of her cock with the increasingly pre-smeared and hot metal. The ovir grunts and thrusts, turning again, grinding the pole with her whole body. Her chest heaves so wildly against it that her front-clasp bra unhooks, abruptly spilling her breasts from their cups and provoking another wild cheer. Little orange-red nipples stand erect on her jiggling mounds, but the ovir is so sexually aroused that she continues frotting and dancing, either not caring or actually enjoying flashing the room full of horny patrons. Several of the crowd have slipped their own hands into their clothing, and most of those that haven’t are sporting noticeable tents in their coverings all the same.");
	output("\n\nHalfway into another cock-stroking ring around the pole the ovir comes to a slow stop, as do the voices of the watchers soon after. Everyone in the room seems to have guessed why, and is staring with anticipation. Shaking slightly with built-up tension, the dancer’s face scrunches cutely and her hips twitch. A moment later, she loses the fight to hold back, and a stroke of white cum erupts from her cock, flying into the air and arcing to splat on the stage. The crowd cheers wildly, and two more shots shortly follow, both stretching higher than the first. The ovir’s buckled knees wobble in climax and she lowers herself to the floor, still gripping the pole with both hands and softly pumping her hips.  Aftershocks drool from her slit as she leans forward, resting her forehead against the pole and breathing heavily.\n\nWhile the assembled patrons continue to hoot and stamp and more than a few let out orgasmic grunts of their own, the ovir makes eye contact with you from behind the pole. Lowering her lids seductively, she blows a kiss, then hauls herself upright and begins to dance again, satisfied and confident in her body as she was before you exposed her. Feeling more than a little horny and exhilarated enough to do a dance of your own, you separate from the crowd and leave.");
	//end, add lust, add 1% exhib if below 66% threshold or 2% if above, pass time
	pc.exhibitionism(2);
	pc.lust(27);
	processTime(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	//flags["OVIR_TEASED"] = 1;
	IncrementFlag("OVIR_TEASED");
}

public function knowBethsOvir():Boolean
{
	if(flags["OVIR_TEASED"] >= 1) return true;
	var knowOvir:Boolean = false;
	if(pc.hasPerk("Fuck Sense") && pc.libido() >= 40) knowOvir = true;
	else if(pc.IQ() >= 80 || pc.intelligence() >= 40) knowOvir = true;
	else if(flags["TIMES_SEXED_ALISS"] >= 1) knowOvir = true;
	return knowOvir;
}

//Doh’rahn/Vaande
//name on button changes after first time
//avail whenever doh’rahn is not on center stage (21 hours a day)
//employs pheromones to charm and loves to be sniffed, very PC subby
//usable by any sex and leg config
//tooltip: Visit the doh’rahn in her room and contract out some wet-work for 100 credits.
//tooltip disabled, hour 1000, 1300, 1600: The doh’rahn is on stage right now. She only dances for an hour at a time, so you could just come back in a bit if you’d like to buy her services. Have 100 credits handy.
//tooltip disabled, no money: You need 100 credits for conjugals, and you don’t have the money!

public function vaandeGo():void
{
	clearOutput();
	showName("\nVAANDE");
	author("Zeikfried");
	//(if time 1000-0559)
	if(hours >= 10 || hours < 6) output("The mistress doesn’t look up when you ask to see the doh’rahn. <i>“Past the curtain and down the stairs, second door on the left. Swipe at the credit scanner and mind the warning on the door.”</i>\n\n");
	output("Following the instructions");
	if(hours >= 6 && hours < 10) output(" on the holo-sign");
	output(", you part the curtain and step into a long hallway. There’s no way to proceed except down a short, winding stair, which opens into an even narrower, dimmer corridor with sealed doors lining the wall. Each one sports a viewing slit to let you peer inside and a holder for a cheap nameplate. Some are empty, as are the rooms, but a few are lit. Near the foot of the stairs, you locate the rahn’s room, whose door bears an additional notice: <i>Doh’rahn inside. Beware of pheromones! Persons remaining in the room for more than an hour after check-in will be called by the desk, and if found unresponsive, emergency services will be notified!</i>");
	//first time
	if(flags["MET_VAANDE"] == undefined)
	{
		output("\n\nHow ominous. If the plate above her view port is current, ‘Vaande’ is the resident’s name. A credit scanner next to the door accepts your swipe with a beep, and you wait patiently for the resident to grant you entry. After half a minute, the portal slides open and you get an unobstructed look at the sparsely-furnished room and the voluptuous, lavender-skinned doh’rahn, decked out in lacy lingerie.");
		output("\n\nThe first thing that hits you is the stink. The breath of air that spills from the doorway smells like a lawn and garden center catastrophe declared war on a federation of wet dogs, and the foul miasma almost bowls you over. Bafflingly, these few seconds are also the last you ever smell the fetor; it’s suddenly and inexplicably withdrawn, replaced with something like parsley, then water, and then nearly nothing at all - but a very compelling nothing.\n\n<i>“[pc.name],”</i> the doh’rahn greets you warmly, alarming you until you notice the lit display by her bed, glimmering with your ID and waiting for transaction approval. <i>“So sorry about the first smell. I was practicing all of my various scents and was so excited to have a new " + pc.mf("gentleman","lady") + " caller that I forgot to clear the air. You will forgive me, won’t you? Oh, please do!”</i>");
		output("\n\nShe holds out a shiny purple hand, palm-down, and you automatically take it without meaning to, lost in staring at her full lips. The feminine alien pulls you into the room, jiggling and spilling from her tiny bra and panties. Vaande’s stripper’s body is literally made to order; with her species’s gradual shapeshifting ability, she’s granted herself full, E-cup breasts and wide, pole-hugging hips that frame an athletic, hourglass waist. Her long, gooey ‘hair’ cascades over her shoulder in left-swept bangs that partially conceal the side of her face, including one red-irised, cat-like eye. A sylvan ear sticks out on the right side, giving her a cutely asymmetrical, fae look.");
		if(!pc.isAss()) output(" Try as you might to be discourteous, you only manage to smile grimly.");
		else output("\n\n<i>“It was quite bad...”</i> you grunt meekly, trying desperately to hold onto your urge to blast her.");
		output(" For some reason, you find yourself irritatingly and instantly enamored of the whore... and then you remember the sign. <i>“Beware of pheromones!”</i> indeed.");
		output("\n\nIt’s no longer shocking to you that one could lose hours in this spartan room without a murmur - you find a growing satisfaction in the idea the longer you remain. Vaande stands impatiently, tugging at her bra like she can’t wait for you to remove it, but you might want to think carefully before you unwrap that package, since you’ll probably do whatever she says gladly....");
		flags["MET_VAANDE"] = 1;
	}
	//repeat
	else
	{
		output("\n\nYou swipe at the scanner, and Vaande opens the door ten seconds later. None of the stink from the first encounter is present to mar her pin-up pose greeting... only the pervasive thin-water smell that makes you want to shove your face into her breasts and inhale.");
		output("\n\n<i>“You came back,”</i> the lavender doh’rahn says, smiling serenely beneath her gooey, lopsided ‘bangs’. <i>“I knew you would.”</i>");
		output("\n\nShe pulls you into the room and kisses you deeply, arms around your neck. <i>“How would you like to have me?”</i> The rahn’s servile word choice is far at odds with what you know will happen once you yield to her pheromone storm....");
	}
	pc.credits -= 100;
	clearMenu();
	//mark Vaande as met if first time, either intro branch present buttons ‘Fuck Pussy’,‘Ride Ovi’, ‘Back’
	addButton(4,"Back",talkToBrothelLadyNewOmni);
	if((pc.hasCock() && pc.cockThatFits(500) >= 0) || pc.hasTailCock() || pc.hasDickNipples()) addButton(0,"Fuck Pussy",fuckVaandesPuss,undefined,"Fuck Pussy","Use your cock on her.");
	else addDisabledButton(0,"Fuck Pussy","Fuck Pussy","Here’s where you’d put your cock in her, if you had one.");
	//Ride Ovi
	//for vagOrAss
	//tooltip: Use her cock on you.
	addButton(1,"Ride Ovi",rideDatRahnBitchsOvi,undefined,"Ride Ovi","Use her cock on you.");
}

//Fuck Pussy
//same cock/tailcock/nipcock restricts as Flahne, maybe slightly stricter
//tooltip: Use your cock on her.
//tooltip disabled, no cocks or too big: Here’s where you’d put your cock in her, if you had one{ that fit}.

//Used to cheat for descripts
public function vaandeCockChoice():String
{
	if(pc.hasCock() && pc.cockThatFits(500) >= 0) return "[pc.cock " + pc.cockThatFits(500) + "]";
	else if(pc.hasTailCock()) return "[pc.tailCock]";
	else if(pc.hasNippleCocks()) return "[pc.nippleCock]";
	return "<b>--ERROR - NO APPROPRIATE COCK TO DESCRIBE--</b>";
}

public function fuckVaandesPuss():void
{
	clearOutput();
	showName("\nVAANDE");
	author("Zeikfried");
	output("Vaande looks delighted when you tell her that you want to use your " + vaandeCockChoice() + ". <i>“Oh, that sounds simply lovely,”</i> she sighs. <i>“Won’t you ");
	if(!pc.isNude()) output("undress yourself and then ");
	output("help me out of these rags?”</i>");

	output("\n\nShe turns around, presenting the clasp of her bra expectantly, and casts a glance over her shoulder. The scent of running water intensifies, and you experience a strange sense of unreality - uncontrolled motion and blanks in time, as if you were dreaming; ");
	if(!pc.isNude()) output("clothed one minute and nude the next like your garments had never been worn at all, then ");
	output("standing behind Vaande, fully erect and pressing your penis into her, with every intention of crossing the floor but no recollection of doing so.");
	output("\n\nYou unfasten the rahn’s bra easily, and she lowers her shoulders to allow it to slip down her body, but stops and catches it with her hands.");
	output("\n\n<i>“Do you like looking at my back?”</i> asks the rahn");
	if(pc.tallness < 60) output(", lowering herself to her knees");
	output(". Her lavender skin is delightfully silvery under the light, and shaped like sculpted marble. An ersatz ridge even defines the center. counterfeiting a spine. It demands, and you answer, an affirmation, leaning forward to press your lips to her skin and inhale deep draughts of water-scent. Your hands reach under her arms unbidden, sliding beneath her loose bra and grasping her huge breasts with crushing, animal force, as if to press more of her essence into your mouth. Far from being hurt, the doh’rahn shudders under your touches, her hands clutching yours through the thin lace.");
	output("\n\n<i>“Panties, next,”</i> insists Vaande, guiding your wrists to her hips and leaning forward to give you the best navigation of her rounded ass. Your " + vaandeCockChoice() + " aches to be inside her, smearing pre onto the lace as if it could dissolve it. Hastily, you roll the vexing triangle of fabric away from her pussy, staring as it peels from her sopping cunt. and then past her thighs, knees, feet, until it’s on the floor next to her bra. The smell of the doh’rahn intensifies in the air with the exposure of her sex, until you can almost swallow it in gulps.");
	output("\n\n<i>“Not yet,”</i> she says, pulling away from your cock. You feel like you <i>ought</i> to be angry, but what you do is simply rise and follow her to the bed. <i>“Show me how much you love my legs,”</i> the woman commands, pressing them together to mask her dripping slit in her thighs.");
	output("\n\nGrasping her knees forcefully, you begin to kiss them, smashing your mouth into her soft skin and breathing deeply in an undisciplined siege that barely resembles romantic foreplay. Her thighs are your next target in your impatient sojourn to her pussy, quivering under the rape of your lips. Vaande’s breath becomes shallower and her posture less rigid as you travel higher, allowing you to force her knees farther and farther from one another with bestial strength. Your kisses get deeper and sloppier and then abruptly you’re holding her legs apart like a wishbone while shoving your face in her vagina, swimming unprotected in her pheromone sea.");
	output("\n\n<i>“Put it inside,”</i> Vaande demands, simultaneously tremulous and assertive. Your muscles react, ");
	if(pc.isTaur() && vaandeCockChoice() != "[pc.nippleCock]") output("and you mount her with such haste that your fore[pc.legsNoun] almost punch through her flimsy mattress.");
	else output("and you throw yourself on her with such haste that batter your chest into hers, still deformed with finger-marks where you clutched her breasts.");
	output(" The rahn squeals lightly when you adjust and spear her on your " + vaandeCockChoice() + ", raising her arms over her head and arching her back to push her slick, silky breasts into your [pc.skinFurScales]. Desperate desire swells in you, but your will doesn’t reach your ");
	if(pc.hasCock() && pc.cockThatFits(500) >= 0) output("[pc.hips]");
	else if(pc.hasTailCock()) output("[pc.tail]");
	else output("chest");
	output(". You’re a passenger in your own body, doomed to experience the sensations of the road but unable to alter the route or speed up - and then you realize why you can’t thrust. Vaande hasn’t given the command yet. The doh’rahn is looking at you intently, savoring the temperature and fullness of your cock, waiting for you to understand. When she sees dire panic in your expression, she smiles cruelly and her eyes glint with exhilaration.");
	pc.cockChange();
	output("\n\n“Ravage me!” the alien cries, releasing you from your chemical restraints. You thrust powerfully, repeatedly, plunging into the woman with power that sends ripples through her form. Pummelling her frothy pussy only intensifies the mugginess in the room. It becomes so pervasive that everything in your vision takes on a blurry heat haze, waving back and forth - the fluid rahn is even more unstable, sloshing violently with each plunge of your " + vaandeCockChoice() + ".");
	output("\n\nYour ejaculation, building and roiling close to the surface since you first unfastened Vaande’s bra and intensifying with every stroke in her hot, conforming pussy, erupts from you unchecked. ");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 5) output("[pc.Cum] dribbles from you in fits, depositing several tiny gems of jizz in the rahn’s translucent purple abdomen.");
	else if(cumQ < 50) output("Strings of {[pc.cum]/[pc.milk] fly from you to hang suspended in the rahn’s plasma, like layers in aspic.");
	else output("Waves of [pc.cum] pour from you, filling and bulging the rahn’s membrane, washing out her natural purple color with your own and bringing a delirious, slack-jawed smile to her face.");
	output(" You climax for far longer than normal, buoyed by the authority of her scent, but eventually finish, as you must.");

	output("\n\nThe natural color returns to the world with the passing of orgasm, replacing the hazy blush of distortion, and suddenly you’re back in the now, in full control, in a scentless cell, mounted awkwardly on a smiling, lavender");
	if(cumQ > 50 && pc.fluidColorSimple(pc.cumType) != "purple") output("-and-[pc.cumColor]");
	output(" alien. She pats your cheek affectionately, and you climb off of her, looking furtively around for your things. The woman picks them up and hands them to you, then politely impels you out of the door and into the hall");
	if(!pc.isNude()) output(", still naked");
	output(".");

	output("\n\n<i>“Do come again, [pc.name],”</i> Vaande says sweetly, and for just a moment you smell running water. Then the door closes.");
	//end, lust, time, money
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ride Ovi
//for vagOrAss
//tooltip: Use her cock on you.
public function rideDatRahnBitchsOvi():void
{
	clearOutput();
	showName("\nVAANDE");
	var x:int = rand(pc.totalVaginas());
	if(!pc.hasVagina()) x = -1;
	output("Vaande receives your request with equanimity. <i>“Oh, is that so?”</i> the doh’rahn asks, seating herself on the bed and crossing her legs. <i>“Why don’t you show me just how much you want my egg-cock?”</i>");
	output("\n\nShe breathes out a heavy breath, and the air in the room thickens palpably with the smell of rain. Your [pc.vagOrAss " + x + "]");
	if(x < 0) output(", compelling you to do whatever it takes to get her inside you.");
	else 
	{
		output(" and begins to drool [pc.girlCumColor] lubrication ");
		if(pc.isCrotchGarbed()) output("into your [pc.lowerGarment]");
		else output("onto your [pc.thighs]");
		output(".");
	}
	//if clothed
	if(!pc.isNude())
	{
		output("\n\nIt’s as if all control of your actions has been stolen; though you already wanted to get naked with the slutty rahn, it starts happening before you even send the signal. You strip, ");
		if(!(pc.armor is EmptySlot)) output("first shucking your [pc.armor] and then ");
		if(!(pc.upperUndergarment is EmptySlot)) 
		{
			output("peeling off your [pc.upperUndergarment] slowly and exposing your [pc.fullChest]");
			if(pc.bRows() > 1) output(", one rack at a time,");
		}
		output(" for the alien woman’s lewd appraisal.");
		output("Once she’s had her fill of your ");
		if(pc.biggestTitSize() < 1) output("flat chest");
		else output("[pc.breastCupSize] tits");
		output(", you begin ");
		if(!(pc.lowerUndergarment is EmptySlot)) output("lowering your [pc.lowerUndergarment], slowly rolling it down to expose your [pc.crotch]. ");
		output("When the last bit of your covering is on the floor, you twirl slowly and sensually, sticking out your chest and ass in turns, making sure she sees the [pc.vagOrAss " + x + "] you want filled.");
	}
	//if nude
	else
	{
		output("\n\nYou approach the rahn as if dreaming, without real control over your choices and feeling floaty, unreal. Her cat-like eyes follow you when you start to caress your [pc.skinFurScales], feeling but not truly feeling the sensation of your fingertips. Light on your [pc.feet], you gyrate slowly, thrusting out your [pc.butt] to make sure the alien woman notices the [pc.vagOrAss " + x + "] she’ll be filling.");
	}
	//merge nude/clothed
	output("\n\nVaande watches your flirtatious display enthusiastically, crossing and uncrossing her legs and fidgeting as the amorous temperature in the room rises. Her hand slides into her panties, rubbing gently underneath the lacy fabric, jilling her cunt as you enjoy putting on your autonomous little show. The palm slowly pulls away from her mound, still rubbing, guiding her large purple stalk free of the concealing fabric until it stands proudly from her crotch with a bead of moisture on the slit.");
	output("\n\n<i>“Doesn’t my ovipositor look nice?”</i> the rahn inquires, innocently. <i>“Why don’t you come over and give it a smell?”</i>");
	output("\n\nYour body moves over to her bedside like an obedient dog’s, ");
	if(pc.isTaur()) output("hunching down");
	else output("lowering yourself");
	output(" to bring your eye level right to her glistening, purple ovipositor, dark with vital fluids and throbbing. The rainy smell fades as you close in, and a scent faintly like new leather entrances you, radiating from the powerful offspring-bearing tool.");
	output("\n\n<i>“I smell a bit differently when I’m aroused enough to lay,”</i> the alien hints, waving the tip under your nose. <i>“Show me how much you like it.”</i>");
	output("\n\nWithout a thought, your [pc.lips] part and Vaande slides in, stirring your tongue with the slippery, salty tip. She shivers against your palate as you draw in deep breaths of her scent through your nose, so aroused that she floods you with precum-like lube.");
	output("\n\n<i>“Mount me,”</i> she grunts, pulling her tool from your mouth so quickly that saliva and pre spill onto ");
	if(pc.biggestTitSize() >= 5) output("your [pc.biggestBreastDescript]");
	else output("the floor");
	output(". ");
	if(pc.isTaur()) output("You turn around eagerly, and the rahn hurries to stand and bring her tool in line with your [pc.vagOrAss " + x + "]. Reversing so hard that the alien’s soft rump hits the wall with a ‘slap’, you take her lubricated shaft into you with one stroke.");
	else 
	{
		output("You climb atop the doh’rahn eagerly, ");
		if(pc.legCount > 1) output("straddling her hips, ");
		output("and she lies back to aim her tool straight up. Sinking down at such speed that the cheap bedframe creaks in distress, you hilt her egg-layer in your [pc.vagOrAss " + x + "] with one stroke.");
	}
	if(x >= 0) pc.cuntChange(x,250);
	else pc.buttChange(250);

	output("\n\nYou need no instructions to know what to do next: the masculine scent of the alien’s tool intensifies as you ");
	if(pc.isTaur()) output("batter Vaande against the wall like a bad horse, pulling and pushing your [pc.butt] into her with such vigor that her own semi-liquid body ripples like a pond in a rainstorm.");
	else output("ride Vaande’s egg-cock like a naughty jockey, shifting up and down so violently that the whore’s shape starts to spread over the bed from the smashing your [pc.butt] is dealing her.");
	output(" Your insides burn with arousal, smeared in her sticky lube and tormented by friction, and the scent that fills your mind has such a hold that you can’t think of anything but cumming.");

	output("\n\nWith a grunt from her, the rahn’s hot ejaculation spills into you, wet and slimy and strong-smelling enough to cloud your vision and erase your restraint. Shrieking, you climax. ");
	if(x >= 0)
	{
		output("Your [pc.vagina " + x + "] creams around the odd rod, ");
		if(!pc.isSquirter()) output("sucking and rippling to pulverize her flexible tool with such passion that her fingers dig into your hips just to hold onto something.");
		else 
		{
			output("producing so much [pc.girlCum] that it splatters on Vaande");
			if(!pc.isTaur()) output(", the bed,");
			output(" and the floor.");
		}
	}
	else output("Your [pc.asshole] ripples with anal orgasm, pulling and grasping Vaande’s tool as it dumps its load in your gut.");
	if(pc.isTaur()) output(" Vaande collapses onto you, pressing her big, lacy breasts into your butt, ");
	else output(" You collapse onto Vaande, squashing her big, lacy breasts under your chest, ");
	output("and your eyes meet. Her lips are pinned in a beatific smile and her cat-like pupils are so wide with gratification that she looks high.");

	//“I could put fertilized eggs in you next time; would you like that? Carrying the child of a strange male and a rahn?” teases Vaande, watching your face as the possibility forces its own consideration. “It costs extra.” Though she winks, it’s almost certain to be a service that she actually provides to her most depraved clients. 
	output("\n\nThe dream-like, painted-on colors of the encounter fade from your vision, leaving you in the stark cell. The doh’rahn on top of you breaks eye contact to kiss your [pc.skinFurScales], and her ovipositor, quickly deflating, slides from you with a ‘sssuck’ when you pull apart. Vaande hands you your gear and politely holds the door.\n\nAs you re-equip, you note with pleasure that the rahn’s intoxicating, faintly leathery odor lingers on you....");
	//end, subtract money, lust, time, whatever
	processTime(40);
	IncrementFlag("SEXED_VAANDE");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
