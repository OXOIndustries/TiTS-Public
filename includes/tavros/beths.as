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
		if(rand(2) == 0)
		{
			output("You’re inside Beth’s Busty Broads, which seems to be doing a modest business for itself. A few die-hard fans are seated around the center stage, watching a ");
			if (!CodexManager.entryUnlocked("Vanae")) output("limber, big-breasted, blind alien with a skirt made of tentacles that fly elegantly as she dances.");
			//(has met)
			else output("vanae circle the pole, tentacles tracing elegant helical patterns as she spins.");
			output(" A desk has been set up near the door, where a bored-looking human woman is flipping through a data-slate, barely acknowledging your presence.");
		}
		else
		{
			output("You’re inside Beth’s Busty Broads, which seems to be doing very well for itself. There’s a hubbub of conversation and laughter underpinning the moody bass music, and the booths, bar and seats around each stage are thronged with punters. On the center stage, there’s a ");
			if (!CodexManager.entryUnlocked("Vanae")) output("limber, big-breasted, blind alien with a skirt made of tentacles that fly elegantly as she dances");
			else output("vanae circling the pole, tentacles tracing elegant helical patterns as she spins");
			output(". The brothel mistress is still sat at her desk by the door, and she still looks utterly disenchanted with the world in general.");
		}
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
	terenshaAdditionalBonus();
	addButton(0,"Desk",talkToBrothelLadyNewOmni);
	reahaBonusFunction();
	return false;
}

public function metBeth():Boolean
{
	if(flags["MET_DEL"] != undefined) return true;
	return false;
}

public function showBrothelLady(nude:Boolean = false):void
{
	if(flags["KAT_MET"] != undefined) showName("\nKAT");
	else showName("BROTHEL\nMISTRESS");
	if(!nude) showBust("BORING_MISTRESS");
	else showBust("BORING_MISTRESS_NUDE");
}
public function getKatPregContainer():PregnancyPlaceholder
{
	var ppKat:PregnancyPlaceholder = new PregnancyPlaceholder();
	if (!ppKat.hasVagina()) ppKat.createVagina();
	return ppKat;
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
	showBust("OVIR_DANCER");
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
		else output("\n\nOvir females aren't usually so stacked. She must actually be a male...");
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
	showBust("OVIR_DANCER");
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
		output("\n\n");
	}
	output("You observe the dancer for a while. Her routine is athletic and provocative, but perhaps the most noticeable thing is just how much she seems to be <i>loving</i> it. The ovir smiles and makes eye contact with the mostly-male crowd joyously, feeding on their arousal. Even the vulgar requests please her. Whenever one of the drunks demands to see her boobs or pussy, she turns toward the sound of the voice and jiggles her body obediently, moves her hand to the clasp of her bra or her waistband, pretending that she might consider it just this once, and then pulls it back with an index finger waving as if to say: <i>“Naughty, naughty...”</i>");
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
	showBust("OVIR_DANCER_NUDE");
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
	if(pc.exhibitionism() >= 66 && !pc.isPsionic()) output(" along with you");
	output(". A bulge forms in her lacy red panties as she fidgets, swelling larger and more oblong by the second, until it peeks from the low-cut fringe. The orange-and-yellow crescent moon grows and strains against the yielding waistband, silencing the crowd. As the patrons watch, the flared tip slips free, allowing her half-erect cock to swing out. Like the poor ovir, it’s yellow at the base and shifts in color close to the end.");
	output("\n\nThe girl, rather, the boy, freezes as her thick tool bobs. One hand still clings to the pole while the other covers her face in shame. None of the stifled patrons seems to know how to react, staring dumbly at the revealed penis.");
	output("\n\n<i>“Dance!”</i> you cheer, shattering the stillness. <i>“Dance, dance!”</i>");

	output("\n\nHer eyes dart back to you and a shy smile spreads between her fingers as the mob takes up the chant: <i>“Dance! Dance!”</i>");
	output("\n\nThe ovir lowers her hand from her face and looks around the room at the excited patrons, surprised, embarrassed, and excited in equal measure. Haltingly at first, like a lamb taking its first steps, the feminine boy places both hands on the pole again and begins to spin. As the crowd’s enthusiasm for her lewd, indecent show continues to surge, she gains confidence, picking up her former routine until she’s whipping ‘round the stage like a dervish. Her thick, blunted cock swings blithely and frots the pole whenever she stretches a leg, causing a shiver in the dancer and a swell of hoots and hollers from her watchers.");
	output("\n\nThe more she spins, the faster her erect dick strokes the pole, until beads and then steady streams of pre begin to form at the slit. No sooner does she secrete them than they’re flung from her flare by her momentum, falling in overlapping rings on the stage. Veins come to the surface of her shaft and her hips start to buck on their own, but the ovir, brilliant in showmanship, works her pelvic twitches right into her act. She draws back and saws into the pole, fucking it with exaggerated motions that throw her knees toward the ceiling in ballet-like poses and lean her so far back that her D-cup tits bounce wildly on her chest. At one point, she even turns completely upside-down, suspending herself by her arms and splaying her crotch wide against the pole so that her throbbing cock drools precum on the underside of her breasts. The mob roars as she leans in and kisses the tip of her own slimy dick before righting herself again. She stares right at you as her pink tongue dabs her cumslit, making sure you see everything you’ve inspired, and a blush of hard arousal runs up your spine.");
	output("\n\nHer panties and bra are soaked with sexual fluids and sweat, turning from red to crimson, and she can’t possibly be far from blowing her huge wad of jizz onstage. The thought seems to excite her as much as it does you, and her acrobatic twirls devolve into simple circles around the stripper pole, caressing the sensitive underside and crown of her cock with the increasingly pre-smeared and hot metal. The ovir grunts and thrusts, turning again, grinding the pole with her whole body. Her chest heaves so wildly against it that her front-clasp bra unhooks, abruptly spilling her breasts from their cups and provoking another wild cheer. Little orange-red nipples stand erect on her jiggling mounds, but the ovir is so sexually aroused that she continues frotting and dancing, either not caring or actually enjoying flashing the room full of horny patrons. Several of the crowd have slipped their own hands into their clothing, and most of those that haven’t are sporting noticeable tents in their coverings all the same.");
	output("\n\nHalfway into another cock-stroking ring around the pole the ovir comes to a slow stop, as do the voices of the watchers soon after. Everyone in the room seems to have guessed why, and is staring with anticipation. Shaking slightly with built-up tension, the dancer’s face scrunches cutely and her hips twitch. A moment later, she loses the fight to hold back, and a stroke of white cum erupts from her cock, flying into the air and arcing to splat on the stage. The crowd cheers wildly, and two more shots shortly follow, both stretching higher than the first. The ovir’s buckled knees wobble in climax and she lowers herself to the floor, still gripping the pole with both hands and softly pumping her hips. Aftershocks drool from her slit as she leans forward, resting her forehead against the pole and breathing heavily.\n\nWhile the assembled patrons continue to hoot and stamp and more than a few let out orgasmic grunts of their own, the ovir makes eye contact with you from behind the pole. Lowering her lids seductively, she blows a kiss, then hauls herself upright and begins to dance again, satisfied and confident in her body as she was before you exposed her. Feeling more than a little horny and exhilarated enough to do a dance of your own, you separate from the crowd and leave.");
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

public function showVaande(nude:Boolean = false):void
{
	if(!nude) showBust("VAANDE");
	else showBust("VAANDE_NUDE");
	showName("\nVAANDE");
}
public function vaandeGo():void
{
	clearOutput();
	showVaande();
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
	addButton(14,"Back",talkToBrothelLadyNewOmni);
	if((pc.hasCock() && pc.cockThatFits(500) >= 0) || pc.hasTailCock() || pc.hasDickNipples()) addButton(0,"Fuck Pussy",fuckVaandesPuss,undefined,"Fuck Pussy","Use your cock on her.");
	else if(pc.hasCock() && pc.cockThatFits(500) < 0) addDisabledButton(0,"Fuck Pussy","Fuck Pussy","Here’s where you’d put your cock in her, if you had any that fit.");
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
	showVaande(true);
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
	else if(cumQ < 50) output("Strings of [pc.cum] fly from you to hang suspended in the rahn’s plasma, like layers in aspic.");
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
	showVaande(true);
	var x:int = rand(pc.totalVaginas());
	if(!pc.hasVagina()) x = -1;
	output("Vaande receives your request with equanimity. <i>“Oh, is that so?”</i> the doh’rahn asks, seating herself on the bed and crossing her legs. <i>“Why don’t you show me just how much you want my egg-cock?”</i>");
	output("\n\nShe breathes out a heavy breath, and the air in the room thickens palpably with the smell of rain. Your [pc.vagOrAss " + x + "]");
	if(x < 0) output(", compelling you to do whatever it takes to get her inside you.");
	else 
	{
		output(" begins to drool [pc.girlCumColor] lubrication ");
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

// Turn Tricks
public function brothelTurnTrixLady():void
{
	// Permanent Contract
	// Requirements: PC is licensed, has used rooms at least twice, has gotten > 74% yield from [Rooms] or [Everything] at least once
	// Scene repeats every four times PC uses [Turn Tricks]
	if
	(	flags["BETHS_CONTRACT_WHORE"] != undefined
	&&	flags["BETHS_TIMES_WHORED_ROOMS"] >= 2
	&&	flags["BETHS_TIMES_GOOD_YIELD"] >= 1
	&&	(flags["BETHS_TIMES_WHORED"] != undefined && flags["BETHS_TIMES_WHORED"] % 4 == 0)
	)
	{
		bethsPermaContractBadEnd();
		return;
	}
	
	clearOutput();
	showBrothelLady();
	author("Nonesuch");
	
	processTime(1);
	clearMenu();
	// If PC is licensed
	if(flags["BETHS_CONTRACT_WHORE"] != undefined)
	{
		output("<i>“Hey [pc.name],”</i> Kat smiles thinly when you sashay up. <i>“You going on shift?”</i>");
		//[Yep] [No]
		addButton(0, "Yep", brothelTurnTrixLicensedMenu);
		addButton(1, "No", brothelTurnTrixAnswer, 3);
		return;
	}
	// If PC hasn't whored
	else if(flags["BETHS_TIMES_WHORED"] == undefined)
	{
		// First
		if(flags["BETHS_ASKED_TO_WHORE"] == undefined)
		{
			flags["BETHS_ASKED_TO_WHORE"] = 1;
			output("Plenty of guys of every shape and size in here, plenty of them looking for some company and tension release away from the frenetic business of the Rush. And you’re already earning a number of lingering stares...");
			output("\n\n<i>“Hey,”</i> you say, approaching the sternly dressed mistress behind the front desk. <i>“Is it alright if I, y’know, earn some money?”</i>");
			output("\n\nShe gives you an appraising look.");
			output("\n\n<i>“Can’t offer you the same rate as the girls who work here,”</i> she replies. <i>“Sure you can appreciate why. 50/50 split with the house, unless you license up.”</i>");
		}
		else
		{
			output("<i>“Hey,”</i> you say, approaching the brothel mistress behind the front desk. <i>“Is it alright if I, y’know, earn some money?”</i>");
			output("\n\nShe gives you an appraising look.");
			output("\n\n<i>“You know the rules,”</i> she replies. <i>“50/50 split with the house, unless you license up.”</i>");
		}
		
		// [Agree] [License?] [Nah]
		addButton(0, "Agree", brothelTurnTrixAnswer, 1, "Agree", "Whore as a freelancer.");
		addButton(1, "License?", brothelTurnTrixAnswer, 2, "License?", "Ask about the license.");
		addButton(2, "Nah", brothelTurnTrixAnswer, 0, "Nah", "Maybe next time.");
		return;
	}
	// If PC has freelanced
	else
	{
		output("<i>“Hey,”</i> you say to the mistress. <i>“Gonna earn, if that’s alright.”</i>");
		output("\n\n<i>“Fine by me,”</i> she replies, considering you sidelong. <i>“License offer’s always on the table, if you ever start getting tired of losing half.”</i>");
		// [Freelance] [License?]
		addButton(0, "Freelance", brothelTurnTrixFreelanceMenu);
		addButton(1, "License?", brothelTurnTrixAnswer, 2, "License?", "Ask about the license.");
		return;
	}
}

public function brothelTurnTrixAnswer(choice:int = 0):void
{
	clearOutput();
	showBrothelLady();
	author("Nonesuch");
	
	clearMenu();
	// Agree
	if(choice == 1)
	{
		output("<i>“I prefer freelancing,”</i> you say.");
		output("\n\n<i>“Freelance away, babycakes,”</i> she says, examining her");
		if(rand(2) == 0) output(" fingers");
		else output(" nails");
		output(". <i>“But remember: 50% of whatever you earn here, and if there’s trouble it’s you out the door, not them.”</i>");
		processTime(1);
		// Go to freelancing menu
		brothelTurnTrixFreelanceMenu();
	}
	// License?
	else if(choice == 2)
	{
		output("<i>“What’s this about a license?”</i> you ask.");
		output("\n\n<i>“If you license yourself with us, you can keep 80% of what you earn,”</i> she replies, rummaging around behind the desk. <i>“But you gotta agree to the terms.”</i> She brings out an electronic form and tap-pencil, pointing out each clause as he goes along.");
		output("\n\n<i>“You’ve got to hit a certain number of johns on a shift. Not worth our while otherwise. You gotta look presentable, obviously. You got to agree to at least suck. Don’t have to do anything more if you don’t want. And, most importantly...”</i> she looks up and catches your eye with a dry smirk. <i>“You’ve got to see to the staff from time to time, pro bono. Pretty frustrating, watching the dancers do their thing when you’re stuck behind the bar.”</i> She taps the signature box at the bottom. <i>“Agree to all that and you get an 80/20 cut, the use of the rooms, and a promise that if there’s trouble, someone will be along to break the guy’s face in two.”</i>");
		processTime(2);
		// [Sign] [No]
		if(flags["BETHS_TIMES_WHORED_MOUTH"] != undefined || (flags["TIMES_BUTT_TEASED"] >= 1 && flags["TIMES_CHEST_TEASED"] >= 1 && flags["TIMES_CROTCH_TEASED"] >= 1 && flags["TIMES_HIPS_TEASED"] >= 1)) addButton(0, "Sign", brothelTurnTrixContract, 1);
		else addButton(0, "Sign", brothelTurnTrixContract, 4);
		addButton(1, "No", brothelTurnTrixContract, 0);
	}
	// No
	else if(choice == 3)
	{
		output("<i>“Later, maybe,”</i> you say.");
		output("\n\n<i>“You’re killing me, babycakes,”</i> she replies with deep exasperation, some of which may be genuine. <i>“Lot of erections just walking straight back out that door, untapped. You’ll put those sweet lips to work soon, right?”</i>");
		if(!pc.isAss()) output("\n\nYou wiggle your fingers at her teasingly");
		else output("\n\nYou give her a look of pure, smirking evil");
		output(" and return to the floor.");
		processTime(1);
		addButton(0, "Next", mainGameMenu);
	}
	// Nah
	else
	{
		output("<i>“Suit yourself,”</i> she shrugs. <i>“Doubt you’ll find fairer rates for freelancers anywhere else on this station.”</i>");
		processTime(1);
		addButton(0, "Next", brothelMainMenu);
	}
}

public function brothelTurnTrixContract(choice:int = 0):void
{
	clearOutput();
	showBrothelLady();
	author("Nonesuch");
	
	clearMenu();
	// Sign
	if(choice == 1)
	{
		if(metBeth()) output("Knowing Beth as well as you do, y");
		else output("Y");
		output("ou read it carefully. There doesn’t seem to any nasty surprises. You provide your John Hancock at the bottom.");
		if(silly) output(" Jenny Handcock? Maybe that can be your alias here.");
		output(" <b>You are now a licensed whore at Beth’s Busty Broad.</b>");
		output("\n\n<i>“Great!”</i> says the mistress, taking back the contract. <i>“I’m Kat, by the way. Try not to piss me off and you’ll do fine here. You going on shift straight away?”</i>");
		
		flags["KAT_MET"] = 1;
		flags["BETHS_CONTRACT_WHORE"] = 1;
		if(flags["BETHS_TIMES_WHORED"] == undefined) flags["BETHS_TIMES_WHORED"] = 0;
		processTime(10);
		// [Yes] [Later]
		// Go to licensed menu
		addButton(0, "Yes", brothelTurnTrixLicensedMenu);
		addButton(1, "Later", brothelTurnTrixContract, 3);
	}
	// Later
	else if(choice == 3)
	{
		output("<i>“Later, maybe,”</i> you grin, stepping back.");
		processTime(1);
		// Go to Beth’s main menu
		addButton(0, "Next", brothelMainMenu);
	}
	// Wait
	else if(choice == 4)
	{
		output("Before you are able to read the contract, the mistress covers it with one hand.");
		output("\n\n<i>“Wait a minute... As much as I like the eager ones, you don’t look quite experienced for this.”</i> she says as she withdraws the stylus. <i>“I’ve been in this business long enough to read a girl who knows how to shake her money maker. Either you get experienced in twerking all your body parts; or you do some supervised freelance until you can see a dick");
		if(flags["BETHS_TIMES_WHORED_HANDS"] == undefined || silly) output(", work it, dust it off and jerk it,");
		output(" and polish it with those lips of yours.”</i>");
		output("\n\nYou look at her bored, almost expressionless, face and you can tell that she is pretty serious.");
		output("\n\n<i>“This is a business after all and whichever you choose to do, I can’t have you dropping this establishment’s reputation before you are able to drop your panties.”</i>");
		processTime(5);
		// [Freelance] [Nah]
		addButton(0, "Freelance", brothelTurnTrixAnswer, 1, "Freelance", "Choose to be a freelance whore instead.");
		addButton(1, "Later", brothelTurnTrixContract, 3);
	}
	// No
	else
	{
		output("<i>“Offer’s always open,”</i> she shrugs, taking the form back. <i>“Least if you remain looking as slutty as you do now. You fixing to go solo, then?”</i>");
		processTime(1);
		// [Freelance] [Nah]
		addButton(0, "Freelance", brothelTurnTrixAnswer, 1, "Freelance", "Choose to be a freelance whore instead.");
		addButton(1, "Nah", brothelMainMenu);
	}
}

// Payment calculation
public function brothelWhorePayment(baseAmount:Number = 0, service:String = "none"):Number
{
	// Whoring Formulas
	// All numbers are suggestions. Basic premise: the more the PC offers, and the more enticing their body is, the more they earn.
	
	var returnAmount:Number = 0;
	// PC is D-F Cup: + 25% of base
	if(pc.biggestTitSize() >= 4 && pc.biggestTitSize() <= 12)
		returnAmount += baseAmount * 0.25;
	// PC is ass 5-8: + 25% of base
	if(pc.buttRating() >= 5 && pc.buttRating() <= 8)
		returnAmount += baseAmount * 0.25;
	// PC is lips 6 or above: + 25% of base
	if(pc.lipRating() >= 6)
		returnAmount += baseAmount * 0.25;
	// PC is female treated: + 25% of base
	if(pc.isTreated() && pc.isBimbo())
		returnAmount += baseAmount * 0.25;
	// PC's holes are not all gaped: + 25% of base
	if(pc.gapestVaginaLooseness() <= 4)
		returnAmount += baseAmount * 0.25;
	// PC’s clothing is sexiness 5+: + 25% of base
	if((pc.armor.sexiness + pc.upperUndergarment.sexiness + pc.lowerUndergarment.sexiness) >= 5)
		returnAmount += baseAmount * 0.25;
	// PC has 30 or more tease points across the board: + 25% of base
	if(flags["TIMES_BUTT_TEASED"] >= 30 && flags["TIMES_CHEST_TEASED"] >= 30 && flags["TIMES_CROTCH_TEASED"] >= 30 && flags["TIMES_HIPS_TEASED"] >= 30)
		returnAmount += baseAmount * 0.25;
	// PC has maxed tease points across the board: + 25% of base
	if(flags["TIMES_BUTT_TEASED"] >= 100 && flags["TIMES_CHEST_TEASED"] >= 100 && flags["TIMES_CROTCH_TEASED"] >= 100 && flags["TIMES_HIPS_TEASED"] >= 100)
		returnAmount += baseAmount * 0.25;
	// Proficiency Bonus
	if(flags["BETHS_TIMES_WHORED"] != undefined)
		returnAmount += (flags["BETHS_TIMES_WHORED"] * 2);
	
	returnAmount = (returnAmount + baseAmount);
	
	// If Licensed, - 0.2 of total off total
	if(flags["BETHS_CONTRACT_WHORE"] != undefined) returnAmount = Math.floor(returnAmount * 0.8);
	// If Freelance, /2 total
	else returnAmount = Math.floor(returnAmount * 0.5);
	
	if(InCollection(service, ["all", "rooms"]))
	{
		if(returnAmount / baseAmount >= 0.75) IncrementFlag("BETHS_TIMES_GOOD_YIELD");
	}
	
	return returnAmount;
}

// Status effect, stat tracking, and unlock message
public function brothelWhored(setMinutes:int = 360, service:String = "none"):void
{
	// Time adjustments for experienced whores.
	if(flags["BETHS_TIMES_WHORED"] >= 10) setMinutes -= 60;
	if(flags["BETHS_TIMES_WHORED"] >= 20) setMinutes -= 60;
	if(flags["BETHS_TIMES_WHORED"] >= 30) setMinutes -= 60;
	if(flags["BETHS_TIMES_WHORED"] >= 40) setMinutes -= 60;
	if(flags["BETHS_TIMES_WHORED"] >= 50) setMinutes -= 60;
	if(setMinutes < 15) setMinutes = 15;
	
	// 9999: Implementation for stats?
	// Status Effect: Jaded
	// v1: speed (reflexes?)
	// v2: strength (physique?)
	// v3: lust resist (not sure if applicable)
	pc.createStatusEffect("Jaded", -10, -10, 20, 0, false, "Blocked", "You feel worn out and a bit sore from whoring.", false, setMinutes);
	
	if(service == "hands") IncrementFlag("BETHS_TIMES_WHORED_HANDS");
	if(service == "mouth") IncrementFlag("BETHS_TIMES_WHORED_MOUTH");
	if(service == "vagina") IncrementFlag("BETHS_TIMES_WHORED_VAGINA");
	if(service == "all") IncrementFlag("BETHS_TIMES_WHORED_ALL");
	if(service == "rooms") IncrementFlag("BETHS_TIMES_WHORED_ROOMS");
	IncrementFlag("BETHS_TIMES_WHORED");
	
	// Unlock message:
	if(
		(flags["BETHS_TIMES_WHORED_HANDS"] >= 2 && flags["BETHS_TIMES_WHORED_MOUTH"] == undefined) || 
		(flags["BETHS_TIMES_WHORED_MOUTH"] >= 2 && flags["BETHS_TIMES_WHORED_VAGINA"] == undefined) || 
		(flags["BETHS_TIMES_WHORED_VAGINA"] >= 2 && flags["BETHS_TIMES_WHORED_ALL"] == undefined) || 
		(flags["BETHS_TIMES_WHORED_ALL"] >= 2 && flags["BETHS_TIMES_WHORED_ROOMS"] == undefined)
		)
	{
		output("\n\n<b>There’s potential to earn more this way - but you’re going to have to offer a little more");
		if(flags["BETHS_TIMES_WHORED_ALL"] >= 2 && flags["BETHS_CONTRACT_WHORE"] == undefined) output(". Maybe you should think about signing up for a license");
		output("...</b>");
	}
}

// Freelance
public function brothelTurnTrixFreelanceMenu():void
{
	clearOutput();
	showBrothelLady();
	author("Nonesuch");
	
	output("You consider the smoky, dimly lit room full of assorted engineers, smugglers, mercenaries, businessmen, travelers, mafiosi and gamblers. Mostly male, mostly human or ausar, mostly looking for the good time you could provide.");
	output("\n\nHow much are you putting on offer?");
	
	clearMenu();
	// [Hands] [Mouth] [Vag] [Everything]
	addButton(0, "Hands", brothelTurnTrixFreelanceWhore, "hands", "Hands", "Just your warm company and grip.");
	if(flags["BETHS_TIMES_WHORED_HANDS"] >= 2) addButton(1, "Mouth", brothelTurnTrixFreelanceWhore, "mouth", "Mouth", "Handjobs and blowjobs.");
	if(flags["BETHS_TIMES_WHORED_MOUTH"] >= 2) addButton(2, "Vag", brothelTurnTrixFreelanceWhore, "vagina", "Vagina", "Almost the whole package.");
	if(flags["BETHS_TIMES_WHORED_VAGINA"] >= 2) addButton(3, "Everything", brothelTurnTrixFreelanceWhore, "all", "Everything", "Why be fussy? Whatever the client wants, within reason.");
}

public function brothelTurnTrixFreelanceWhore(service:String = "none"):void
{
	clearOutput();
	showBrothelLady();
	author("Nonesuch");
	var totalEarnings:Number = 0;
	var baseEarnings:Number = 0;
	
	baseEarnings = brothelTurnTrixWhoring(service);
	
	// Hands
	if(service == "hands")
	{
		output("\n\nAfter about two hours of work your wrists and smile begin to ache and you call it a day. You take your earnings up to the counter and reluctantly split it with the mistress.");
	}
	// Mouth
	else if(service == "mouth")
	{
		output("\n\nEventually your wrists begin to ache and your ");
		if(pc.hasLegs() && pc.hasKnees()) output("knees begin to hurt");
		else output("[pc.lowerBody] begins to feel sore");
		output(". Wiping your mouth, you take your earnings up to the counter and reluctantly split it with the mistress.");
	}
	// Vag
	else if(service == "vagina")
	{
		output("\n\nAfter a few hours, reproductive fluid of every description, flavor and color is dripping thickly down your [pc.hip], and you are feeling sore and thoroughly used. You take your earnings up to the front desk and reluctantly split it with the mistress.");
	}
	// Everything
	else if(service == "all")
	{
		output("\n\nAfter a few hours, reproductive fluid of every description, flavor and color is dripping thickly out of every single one of your holes, and you are feeling sore and thoroughly used. You take your earnings up to the counter and reluctantly split it with the mistress.");
	}
	
	totalEarnings = brothelWhorePayment(baseEarnings, service);
	// Low yield:
	if(totalEarnings <= 0)
	{
		output("\n\nAfter the couple hours of work, you turn up empty handed.");
		output("\n\nSighing heavily, the mistress scolds you. <i>“Why did I hire you again?”</i>");
		output("\n\nBefore you can utter a response she cuts you off, slamming her hand on the table. Her once bored, emotionless face changes into a slight scowl as she stares at you dead in the eyes.");
		output("\n\n<i>“This place is a whorehouse, do you understand? Whore. House. Only two kinds of people come in here to do business and they are: the clients... and the <b>WHORES</b>. Which one of those are you?”</i> Turning her head down towards the desk, she takes a moment for a mental breather until her expression relaxes. She then continues, <i>“Listen, if you’re not going to whore yourself properly on the floor, then don’t bother wasting my time. Please see yourself out.”</i>");
	}
	else if(totalEarnings / baseEarnings < 0.75)
	{
		if(service != "all")
		{
			output("\n\nIt seems a pretty pathetic amount you’ve earned for what feels like a pretty hard couple of hours of honest work.");
			output("\n\n<i>“You want my advice?”</i> the mistress says, pocketing the handful of credit chits. <i>“");
			// PC chest = C cup or less:
			if(pc.biggestTitSize() < 4) output("Bigger tits. Nothing sadder than a flat-chested whore. ");
			// PC lips = small:
			else if(pc.lipRating() < 6) output("Collagen. Even if you don’t use them, folks with dicks will always fall for pouty lips. ");
			// PC butt = 4 or less:
			else if(pc.buttRating() < 5) output("Look into putting some junk into that trunk. Skinny hoes never earn as much as big booty pros. ");
			// PC boobs and/or butt too big:
			else if(pc.biggestTitSize() > 12 || pc.buttRating() > 8) output("Slim your assets down a little. You’re kinda big, for the average punter’s tastes anyway. ");
			if(service == "vagina") output("More money to be had if you’re willing to get that prissy can of yours stuffed, once in a while.");
			else output("Don’t be so picky about what you do.");
			output(" And get yourself licensed. You know it makes sense.”</i> She strides off towards the back office.");
		}
		else
		{
			output("\n\nIt seems a pretty pathetic amount for what feels like a considerable amount of hard, honest work.");
			output("\n\n<i>“Get yourself licensed is my advice,”</i> the mistress says, pocketing the handful of credit chits. <i>“Seems a real shame to lose half, seeing some of the things you did for it.”</i>");
		}
	}
	
	if(totalEarnings > 0) output("\n\nYou have been paid " + totalEarnings + " credits for your efforts.");
	pc.credits += totalEarnings;
	
	// PC = Jaded for next 6 hours
	brothelWhored((6 * 60), service);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Licensed
public function brothelTurnTrixLicensedMenu(showFull:Boolean = true):void
{
	clearOutput();
	
	if(showFull)
	{
		showBrothelLady();
		author("Nonesuch");
		output("<i>“Atta girl,”</i> Kat says. <i>“Pretty busy in here today - we need all the hands we can get. And mouths.”</i>");
		output("\n\nYou consider the smoky, dimly lit room full of assorted engineers, smugglers, mercenaries, travelers, mafiosi and gamblers. Mostly male, mostly human or ausar, mostly looking for the good time you could provide.");
		output("\n\n");
	}
	else showName("TURN\nTRICKS");
	
	output("How much are you putting on offer?");
	
	clearMenu();
	// [Mouth] [Vag] [Everything] [Rooms]
	addButton(0, "Mouth", brothelTurnTrixLicensedWhore, "mouth", "Mouth", "Handjobs and blowjobs.");
	if(flags["BETHS_TIMES_WHORED_MOUTH"] >= 2) addButton(1, "Vag", brothelTurnTrixLicensedWhore, "vagina", "Vagina", "Almost the whole package.");
	if(flags["BETHS_TIMES_WHORED_VAGINA"] >= 2) addButton(2, "Everything", brothelTurnTrixLicensedWhore, "all", "Everything", "Why be fussy? Whatever the client wants, within reason.");
	if(flags["BETHS_TIMES_WHORED_ALL"] >= 2) addButton(3, "Rooms", brothelTurnTrixLicensedWhore, "rooms", "Rooms", "See if you can’t get in on the action of the downstairs rooms.");
}

public function brothelTurnTrixLicensedWhore(service:String = "none"):void
{
	clearOutput();
	showBrothelLady();
	author("Nonesuch");
	var ppKat:PregnancyPlaceholder = getKatPregContainer();
	var totalEarnings:Number = 0;
	var baseEarnings:Number = 0;
	
	baseEarnings = brothelTurnTrixWhoring(service);
	
	// Mouth
	if(service == "mouth")
	{
		showBrothelLady(true);
		output("\n\nYou also meet your obligations to the staff as you go about your business. Seems like working here results in people getting very het up; there really is quite the demand for you to come into a deserted storeroom and ");
		if(pc.hasLegs() && pc.hasKnees()) output("get on your knees");
		else output("squat down");
		output(" for the bartenders and dancers, both male and female. You finish off your shift behind the front desk.");
		output("\n\n<i>“Ungh! Nice,”</i> Kat grunts, clutching the wood hard and grinding her landing-stripped pussy into your face. A small trickle of femcum makes its way down your chin. <i>“Nothing like a well-trained tongue at the end of a long ");
		if(hours < 15) output("morning");
		else output("evening");
		output(".”</i> You get up wiping your mouth, and wait for her to zip herself back up before splitting the earnings with her.");
		pc.girlCumInMouth(ppKat);
		pc.lust(10);
	}
	// Vag
	if(service == "vagina")
	{
		showBrothelLady(true);
		output("\n\nYou also meet your obligations to the staff as you go about your business. Seems like working here results in people getting very het up; there really is quite the demand for you to come into a deserted storeroom and ");
		if(pc.hasLegs() && pc.hasKnees()) output("get on your knees");
		else output("squat down");
		output(" for the bartenders and dancers, both male and female. You finish off your shift behind the front desk.");
		output("\n\n<i>“Ungh! Nice,”</i> Kat grunts, clutching the wood hard and grinding her landing-stripped pussy into your face. A small trickle of femcum makes its way down your chin. <i>“Nothing like a well-trained tongue at the end of a long ");
		if(hours < 15) output("morning");
		else output("evening");
		output(".”</i> You get up wiping your mouth, and wait for her to zip herself back up before splitting the earnings with her.");
		pc.girlCumInMouth(ppKat);
		pc.lust(10);
	}
	// Everything
	else if(service == "all")
	{
		output("\n\nAfter a few hours, reproductive fluid of every description, flavor and color is dripping thickly out of every single one of your holes, and you are feeling sore and thoroughly used. You take your earnings to the front desk.");
		output("\n\n<i>“I’ll, uh, pass on putting you anywhere near my genitals, if it’s all the same to you,”</i> Kat says, picking out her 20% cut.");
	}
	// Rooms Specials
	else if(service == "rooms")
	{
		showBrothelLady(true);
		output("After a frazzling few hours, you finish your shift under the front desk.");
		output("\n\n<i>“Ungh! Nice,”</i> Kat grunts, clutching the wood hard and grinding her landing-stripped pussy into your face. A small trickle of femcum makes its way down your chin. <i>“Nothing like a well-trained tongue at the end of a long ");
		if(hours < 15) output("morning");
		else output("evening");
		output(".”</i> You get up wiping your mouth, and wait for her to zip herself back up before splitting the earnings with her.");
		pc.girlCumInMouth(ppKat);
		pc.lust(10);
	}
	
	totalEarnings = brothelWhorePayment(baseEarnings, service);
	// Low yield:
	if(totalEarnings <= 0)
	{
		output("\n\nAfter the couple hours of work, you turn up empty handed.");
		output("\n\nSighing heavily, the mistress interrogates you. <i>“What. Are you serious?”</i>");
		output("\n\nBefore you can utter a response she cuts you off, slamming her hand on the table. Her once bored, emotionless face changes into a slight scowl as she stares at you dead in the eyes.");
		output("\n\n<i>“This place is a whorehouse, do you understand? Whore. House. Only two kinds of people come in here to do business and they are: the clients... and the <b>WHORES</b>. Which one of those did you sign up for again?”</i> Turning her head down towards the desk, she takes a moment for a mental breather until her expression relaxes. She then continues, <i>“Listen, if you’re not going to whore yourself properly on the floor, then don’t bother wasting my time. Please see yourself out.”</i>");
	}
	else if(totalEarnings / baseEarnings < 0.75)
	{
		if(service != "all")
		{
			output("\n\nIt seems a pretty pathetic amount you’ve earned for what feels like a pretty hard couple of hours of honest work.");
			output("\n\n<i>“You want my advice?”</i> the mistress says, pocketing the handful of credit chits. <i>“");
			// PC chest = C cup or less:
			if(pc.biggestTitSize() < 4) output("Bigger tits. Nothing sadder than a flat-chested whore. ");
			// PC lips = small:
			else if(pc.lipRating() < 6) output("Collagen. Even if you don’t use them, folks with dicks will always fall for pouty lips. ");
			// PC butt = 4 or less:
			else if(pc.buttRating() < 5) output("Look into putting some junk into that trunk. Skinny hoes never earn as much as big booty pros. ");
			// PC boobs and/or butt too big:
			else if(pc.biggestTitSize() > 12 || pc.buttRating() > 8) output("Slim your assets down a little. You’re kinda big, for the average punter’s tastes anyway. ");
			if(service == "rooms") output("Work your ass off and make that license count for something.");
			else output("Don’t be so picky about what you do.");
			output("”</i> She strides off towards the back office.");
		}
	}
	else
	{
		if(service != "all") output("<i>“You’re a good little earner,”</i> she smirks, a small amount of color in her pale cheeks, raising an eyebrow at what you’ve brought in. <i>“Going to have to look into setting you up with a more permanent type of contract, one of these days.”</i>");
		else output("<i>“You’re a good little earner,”</i> she goes on, raising an eyebrow at what you’ve brought in. <i>“Admirable lack of standards, too. Going to have to look into setting you up with a more permanent type of contract, one of these days.”</i>");
	}
	
	if(totalEarnings > 0) output("\n\nYou have been paid " + totalEarnings + " credits for your efforts.");
	pc.credits += totalEarnings;
	
	// PC = Jaded for next 6 hours
	brothelWhored((6 * 60), service);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Whoring main text
public function brothelTurnTrixWhoring(service:String = "none"):Number
{
	var x:int = rand(pc.totalVaginas());
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	var baseEarnings:Number = 0;
	
	//Declare once! Fuck warnings.
	var scenesIndex:Array = [];
	var scenesLimit:int = 3;
	var scenesTotal:int = 5;
	if (!pp.hasCock()) pp.createCock();
	
	// Hands
	if(service == "hands")
	{
		output("You sashay through the room, letting your hand trail along muscular arms, bending the warm weight of your [pc.chest] into seated gamblers, offering your friendliest smile to anyone who looks at you, coming across at the faintest sign of interest.");
		output("\n\nYou soon find takers. Many of the men here are actually just pleased to hear a friendly female voice in their ear; deep space miners or mercenaries coming back from one ugly incident or another. They tip you healthily just to sit with them and laugh at their stupid jokes. Others want a little more.");
		output("\n\nYour warm hand slides its way past belts and buckles, it undoes zips, it clicks buttons which release armored compartments; you become pretty adept at the art of one-handed undressing. You grip hot dick after dick - mostly big and girthy; penis enhancers are widely available, after all - and gently, rhythmically bring them to full mast, kneading and coiling hot meat until the guy’s eyes are closed and leant back");
		if(pc.biggestTitSize() > 0) output(", letting the plush softness of your [pc.chest] press into their chests as you work");
		output(". The hubbub casually goes on around you, or the coo and slurp of the other whores working the rest of the john’s party provides a fitting soundtrack, as you rub and jerk, coil and squeeze until his body tenses up, he groans and releases spumes of cum, riding his orgasm out with the loving help of your hand, and finally gazes at you in gratified bliss. Such a simple thing which brings such pleasure. Napkins are free, and you quickly learn to take a supply with you everywhere.");
		
		// + 2 hours
		processTime(120);
		// + Lust
		pc.lust(5);
		pc.exhibitionism(1);
		// Base hands pay-out: 50 credits + 30
		baseEarnings += 80;
	}
	// Mouth
	else if(service == "mouth")
	{
		output("You sashay through the room, letting your hand trail along muscular arms, bending the warm weight of your [pc.chest] into seated gamblers, offering your friendliest smile and most lascivious lick of the [pc.lips] to anyone who looks at you, coming across at the faintest sign of interest.");
		output("\n\nYou soon find takers. Many of the men here are actually just pleased to hear a friendly female voice in their ear; deep space miners or mercenaries coming back from one ugly incident or another. They tip you healthily just to sit with them and laugh at their stupid jokes. Others want a little more.");
		output("\n\nYour warm hand slides its way past belts and buckles, it undoes zips, it clicks buttons which release armored compartments; you become pretty adept at the art of one-handed undressing. You grip hot dick after dick - mostly big and girthy; penis enhancers are widely available, after all - and gently, rhythmically bring them to full mast, kneading and coiling hot meat until the guy’s eyes are closed and leant back");
		if(pc.biggestTitSize() > 0) output(", letting the plush softness of your [pc.chest] press into their chests as you work");
		output(". You keep the movement of your hand slow and murmur in their ear that you will do more, if they’re willing to pay a little extra... the dick does all the thinking in these situations and more often than not, it’s exactly what they do. You give them a big, lusty smile, sink beneath the table and finish them off with a nice, deep suck.");
		output("\n\nSome of the clients are more to the point; they pay you and point at their crotch, often without even breaking conversation with whoever they’re with. Their thighs tensing up around your gently bobbing head and their balls doing likewise against your chin, a groaning exhalation as they fountain hot cum down your throat and maybe a <i>“thanks doll”</i> after you’ve licked their bulging, oozing cock clean is the most you get from such guys.");
		output("\n\nA popular combo is to get a blowjob whilst watching a dance. You find yourself ");
		if(pc.hasLegs() && pc.hasKnees()) output("on your knees");
		else output("knelt down");
		output(", a hand pressed against the back of your head, hard meat filling your mouth, the sound of feet thumping and sliding around and around above you, more often than not.");
		
		pc.loadInMouth(pp);
		pc.loadInMouth(pp);
		pc.loadInMouth(pp);
		// Female treated:
		if(pc.isTreated() && pc.isBimbo())
		{
			output(" You almost forget to take payments, sometimes. The deep, pussy-moistening ecstasy of cock touching the back of your throat, the wonderful tingle of fresh cum on your taste buds, and the sheer joy of getting down in front of so many males and making the world a more pleasurable place to be seems like payment enough. Ironically you get showered with credit chits thanks to the obvious enthusiasm with which you blow. You accept it almost embarrassedly. What are you even going to do with all this money?");
			pc.loadInMouth(pp);
			pc.loadInMouth(pp);
			pc.loadInMouth(pp);
		}
		
		// + 2 hours
		processTime(120);
		// + Lust
		pc.lust(10);
		pc.exhibitionism(1);
		// Base mouth pay-out: 70 credits + 30
		baseEarnings += 100;
	}
	// Vag
	else if(service == "vagina")
	{
		output("You sashay through the room, letting your hand trail along muscular arms, bending the warm weight of your [pc.chest] into seated gamblers, offering your friendliest smile and most lascivious lick of the [pc.lips] to anyone who looks at you, coming across at the faintest sign of interest. You swing your [pc.ass] as you move, giving coy come-hither glances to everyone you pass, showing them with each jounce what they could have - if they");
		if(rand(2) == 0) output("’ve got the money.");
		else output(" buy it.");
		output("\n\nMost clients just want your company, grip, or mouth. Those don’t require they stop talking, drinking or watching the mesmeric dancers. You smile and laugh at their raucous behaviour and comments, whilst beneath the table your hand jerks away at hot, thick meat, sometimes two at a time. You’re pretty good at moving your fingers slowly and murmuring in their ear that you will do more, for a little extra... and because you’re good at it, you spend a lot of your time ");
		if(pc.hasLegs() && pc.hasKnees()) output("on your knees");
		else output("knelt");
		output(" beneath a table, [pc.lips] traveling up and down big, juicy dick, hollowing your cheeks up and sucking down one thick load of cum after another, credit chits");
		if(pc.hasUpperGarment() && !pc.hasArmor()) output(" rammed into your [pc.upperUndergarment]");
		else if(pc.hasLowerGarment() && !pc.hasArmor()) output(" rammed into your [pc.lowerUndergarment]");
		else output(" clutched in one hand");
		output(".");
		
		pc.loadInMouth(pp);
		pc.loadInMouth(pp);
		pc.loadInMouth(pp);
		
		output("\n\nA few punters are more than happy for you to clamber onto their laps, though. You grip their collars or their armor and sink your [pc.vagina " + x + "]");
		if(rand(2) == 0) output(" slowly");
		else output(" gradually");
		output(" down onto their firmly erect dicks before grinding away, writhing your [pc.hips] on top of theirs, ");
		if(pc.biggestTitSize() > 0) output("[pc.chest] bouncing, ");
		output("letting them see on your [pc.face] how much whorish joy it brings you.");
		
		// gape on vag up
		pc.cuntChange(x, 100);
		
		// Female treated:
		if(pc.isTreated() && pc.isBimbo()) output(" You don’t have to exaggerate that - your pussy clutches up hungrily around every cock, and the world radiates pure, honest contentment when you’ve got one up you. You orgasm with a breathless moo after barely ten seconds with anyone. John after john line up to have their way with you.");
		// 1 < clits:
		else if(pc.vaginas[x].clits > 1) output(" You don’t have to exaggerate that - your [pc.clits] send one buzz of ecstasy after the other up your spine, making you drizzle [pc.girlcum] freely. You just fucking love vaginal, and it shows. John after john line up to have their way with you.");
		// Normal:
		else output(" Exaggerated naturally, but where’s the harm in that?");
		output(" They grunt, arch their backs and release their thick, sticky loads inside you with a sigh of delighted relief, and then off you ");
		if(pc.isNaga() || pc.isGoo()) output("slither");
		else output("trot");
		output(", cum leaking out of your [pc.vagina " + x + "], to see if you can’t be put to similar use at the next booth along.");
		
		pc.loadInCunt(pp, x);
		pc.loadInCunt(pp, x);
		pc.loadInCunt(pp, x);
		
		// + 2 hours
		processTime(120);
		// lust reset
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		pc.exhibitionism(1);
		// Base vag pay-out: 90 credits + 30
		baseEarnings += 120;
	}
	// Everything
	else if(service == "all")
	{
		var cuntChanged:Boolean = false;
		var anusChanged:Boolean = false;
		
		output("<i>“Whatever you want, baby,”</i> you find yourself saying a lot over during your time on the floor. It never stops giving you a slight thrill. <i>“If you pay, I will do whatever you want.”</i>");
		output("\n\nThe order of the day is mostly blowjobs, however. Most johns simply aren’t that imaginative, or aren’t in the mood to stretch themselves, at least not here. And because you’re operating solo, you can’t get in on the multiple offers with other prostitutes, which is mostly what the big spenders want. So you find yourself ");
		if(pc.hasLegs() && pc.hasKnees()) output("on your knees");
		else output("knelt");
		output(" beneath a table, [pc.lips] traveling up and down big, juicy dick for the majority of your shift, hollowing your cheeks up and sucking down one thick load of cum after another, credit chits");
		if(pc.hasUpperGarment() && !pc.hasArmor()) output(" rammed into your [pc.upperUndergarment]");
		else if(pc.hasLowerGarment() && !pc.hasArmor()) output(" rammed into your [pc.lowerUndergarment]");
		else output(" clutched in one hand");
		output(".");
		
		pc.loadInMouth(pp);
		pc.loadInMouth(pp);
		pc.loadInMouth(pp);
		
		output("\n\nStill, there’s a few special requests.");
		
		//Scene takes form of 3 of these that the PC meets the requirements for, randomized and joined together.
		scenesIndex = [];
		scenesLimit = 3;
		scenesTotal = 5;
		if(pc.hasTailCunt() && pc.tailType == GLOBAL.TYPE_CUNTSNAKE) scenesTotal++;
		if(pc.canTitFuck()) scenesTotal++;
		if(pc.hasBreasts() && pc.hasFuckableNipples()) scenesTotal++;
		if(pc.isNaga()) scenesTotal++;
		if(pc.isTaur()) scenesTotal++;
		
		while(scenesLimit > 0)
		{
			if (!pp.hasCock()) pp.createCock();
			// Cunt-tail:
			if(!InCollection(1, scenesIndex) && pc.hasTailCunt() && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				output("\n\nYour");
				if(pc.hasParasiteTail()) output(" parasitic tail");
				else output(" [pc.tail]");
				output(", spreading itself eagerly in the presence of so much male musk, attracts some attention, and a few clients happily pay a bit extra for you to fasten it wetly on their cocks and pump them absolutely silly with it, pleasure and the sensation of cum being siphoned hungrily away tingling up to you.");
				processTime(10);
				pc.loadInCuntTail(pp);
				pc.loadInCuntTail(pp);
				pc.loadInCuntTail(pp);
				pc.exhibitionism(1);
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 1;
			}
			// Massive capacity:
			pp.cocks[0].cLengthRaw = 36;
			pp.cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
			if(!InCollection(2, scenesIndex) && pc.vaginalCapacity(x) >= pp.cockVolume(0) && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				output("\n\nA particularly huge alien is delighted to discover your voluminous twat is capable of taking his 3-foot long blunt breeding prong, and you spend an eye-crossing ten minutes riding him to a womb-swelling high.");
				pc.cuntChange(x, pp.cockVolume(0));
				output(" You have to waddle to the bathroom and release a full gallon of purple cum from your [pc.vagina " + x + "] afterwards.");
				processTime(10);
				pc.loadInCunt(pp, x);
				pc.loadInCunt(pp, x);
				pc.loadInCunt(pp, x);
				pc.loadInCunt(pp, x);
				pc.loadInCunt(pp, x);
				pc.orgasm();
				cuntChanged = true;
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 2;
			}
			pp.removeCocks();
			pp.createCock();
			// Any: Ausar Male
			if(!InCollection(3, scenesIndex) && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				pp.shiftCock(0, GLOBAL.TYPE_CANINE);
				output("\n\nIn one corner booth a burly ausar turns you around and gives you a hard ass-fucking, pounding your [pc.asshole] with his hot knotted cock with relentless pumps of his thick hips whilst you grit your teeth, being used like the whore you are.");
				pc.buttChange(pp.cockVolume(0));
				output(" He dismisses you with a grunt and a slap on the [pc.ass], leaving you to hobble away with doggie semen leaking down your [pc.hip].");
				processTime(10);
				pc.loadInAss(pp);
				pc.orgasm();
				anusChanged = true;
				pp.removeCocks();
				pp.createCock();
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 3;
			}
			// Any: Kaitrit Male Pirate
			if(!InCollection(4, scenesIndex) && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				output("\n\nA flinty-looking kaithrit pirate pulls you to one side and fumblingly tells you that he’s homesick. Away from his macho human friends, you briskly jerk his small pink cock off from behind, murmuring all the while in his pointy ear what a good boy he’s being for mommy, spearing into his tight ass with two fingers for emphasis.");
				processTime(10);
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 4;
			}
			// Any: Dzaan Druggies
			if(!InCollection(5, scenesIndex) && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				output("\n\nA group of dzaan call you over and imperiously demand you get on top of their table and present your [pc.ass]. Mentally steeling yourself for a hard session of anal, you do as they ask - and then feel lines of powder being formed on the bare [pc.skin] of your buttocks, followed by hefty snorts and husky hermaphroditic crows of enjoyment. Any form of drug tastes better if it’s taken off the backside of a hooker, it turns out.");
				processTime(10);
				pc.exhibitionism(1);
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 5;
			}
			// D cups or larger:
			if(!InCollection(6, scenesIndex) && pc.canTitFuck() && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				output("\n\nA human businessman watches you rub lube into your [pc.chest] down in front of him, swirling your hands over your big boobs, brushing over your [pc.nipples] until they ");
				if(pc.hasNipples() && !pc.hasFlatNipples() && !pc.hasCuntNipples() && !pc.hasLipples() && !pc.hasInvertedNipples()) output("are as hard and protuberant as cherries");
				else output("seep wet excitement");
				output(". You keep your eyes and smile on him, giving him a lightly exaggerated soundtrack of gasps and sighs as you pleasure your breasts. You follow it up by fitting his hard cock into your well-oiled cleavage and giving him a long, luscious titjob, giving his beading head the occasional lap with your [pc.tongue]. You leave him with a very happy expression on his face, wiping the cum off your own and picking your payment out from between your [pc.chest].");
				processTime(10);
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 6;
			}
			// Cunt/mouth nipples:
			if(!InCollection(7, scenesIndex) && pc.hasBreasts() && pc.hasFuckableNipples() && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				var boobs:int = pc.totalBreasts();
				
				output("\n\nYour [pc.nipples] generate interest, particularly when you start to finger them and wink at those watching. You kneel in front of a drunken fuu’rahn and let her grip your shoulders and excitedly thrust her well-extended blue ovipositor into the sensitive, [pc.milkNoun]-leaking innards of your boob, her cheering friends having paid for the treatment. She enjoys sliding herself between your slick, puffy ");
				if(pc.hasLipples()) output("lipples");
				else if(pc.hasCuntNipples()) output("cunt nipples");
				else output("nipples");
				output(" so much that, after resting for a few seconds, she stuffs your other breast");
				if(boobs > 2) output("s");
				output(" full of rahn eggs too.");
				processTime(10);
				for(var b:int = 0; b < boobs; b++)
				{
					pc.loadInNipples(pp);
				}
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 7;
			}
			// Any: Daynar Male
			if(!InCollection(8, scenesIndex) && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				pp.shiftCock(0, GLOBAL.TYPE_DAYNAR);
				pp.cocks[0].cLengthRaw = 8;
				output("\n\nThe big spenders - gangsters and businessmen out celebrating particularly lucrative scores, for the most part - pay very well to have multiple girls tending to them. A suited, broad-shouldered daynar sits back, watching the ovir on stage slowly twist and gyrate around her pole, his neck stretched so the kaithrit girl sat behind can massage his tender neck-membranes, whilst you bounce on his lap, squeezing and bending his eight inch lizard cock in your [pc.vagina " + x + "], stroking and teasing your [pc.chest] at his throaty request.");
				pc.cuntChange(x, pp.cockVolume(0));
				output(" Beneath the jounce of your bare [pc.ass] you can feel the hair of the human girl sucking his balls. The expression on the daynar’s long face tells you that this is just Tuesday to him - but a pretty good Tuesday, nonetheless.");
				processTime(10);
				cuntChanged = true;
				pp.removeCocks();
				pp.createCock();
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 8;
			}
			// Naga
			if(!InCollection(9, scenesIndex) && pc.isNaga() && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				output("\n\nA credit chit is trailed up your scales. A genetically modified something-or-other asks, in a high, breathy voice, if you will dance with the vanae on-stage. You curl yourself around and around the pink-tentacled blind girl, tightening and loosening around her flat abdomen and plush boobs, giving her the odd teasing lick and fondle. She plays along but her primal fear of you is palpable. The customer enjoys it immensely, clapping four hands excitedly and ordering a supplementary blowjob from a waitress. You finish it off by holding her tight and frenching the vanae, feeling her mouth quiver around you. Everyone gets tipped well - but you rather suspect your partner would trade hers for not having to go anywhere near you again.");
				processTime(10);
				pc.exhibitionism(1);
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 9;
			}
			// Centaur:
			if(!InCollection(10, scenesIndex) && pc.isTaur() && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				pp.shiftCock(0, GLOBAL.TYPE_NAGA);
				pp.cocks[0].cLengthRaw = 36;
				pp.createCock();
				pp.shiftCock(1, GLOBAL.TYPE_NAGA);
				pp.cocks[1].cLengthRaw = pp.cocks[0].cLengthRaw;
				pp.ballSizeRaw = 5;
				output("\n\nA leithan has resigned himself to a night of blowjobs - before he spots you. He clutches your [pc.chest] as tightly as you clutch the pole, his undercarriage rubbing frenetically over your [pc.lowerBody], one cock deep in your [pc.vagina " + x + "], the other in your [pc.ass].");
				pc.cuntChange(x, pp.cockVolume(0));
				pc.buttChange(pp.cockVolume(1));
				output(" The sex is hot and rough, the tip is generous - although you have to get somebody else to hand it to you, since he leaves it wedged in your cum-filled [pc.asshole].");
				processTime(10);
				pc.loadInCunt(pp, x);
				pc.loadInAss(pp);
				pc.orgasm();
				pc.orgasm();
				cuntChanged = true;
				anusChanged = true;
				pp.removeCocks();
				pp.createCock();
				pp.ballSizeRaw = 0;
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 10;
			}
		}
		
		// gape on vag up
		if(!cuntChanged) pc.cuntChange(x, 100);
		// gape on anus up
		if(!anusChanged) pc.buttChange(100);
		
		pc.loadInCunt(pp, x);
		pc.loadInCunt(pp, x);
		pc.loadInCunt(pp, x);
		pc.loadInAss(pp);
		pc.loadInAss(pp);
		pc.loadInAss(pp);
		// lust reset
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		pc.exhibitionism(1);
		
		// + 2 hours
		processTime(90);
		// Base everything pay-out: 130 credits + 30
		baseEarnings += 160;
	}
	// Rooms Specials
	else if(service == "rooms")
	{
		output("You head across and chat with some of the other floozies hanging around near the curtained-off section of the brothel. There’s quite a few requests for room specials, it turns out, and the other whores are happy for fresh meat to help out and take a cut.");
		
		//Scene takes form of 2 of these that the PC meets the requirements for, randomized.
		scenesIndex = [];
		scenesLimit = 2;
		scenesTotal = 4;
		if(pc.isTreated() && pc.isBimbo()) scenesTotal++;
		if(pc.isBiped()) scenesTotal++;
		if(pc.isGoo()) scenesTotal++;
		
		while(scenesLimit > 0)
		{
			if (!pp.hasCock()) pp.createCock();
			// Any: Human Male Masochist
			if(!InCollection(1, scenesIndex) && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				output("\n\nA big, gruff human tough, tattoos festooned down both arms, wants some one-on-one... and very discrete... treatment. He barks and groans, blindfolded and hands tied to the ceiling by magnetic hard-points, as you apply the lash to his muscular back and ass, casually telling him what a bad boy he’s been. Honestly, given the amount of unsolicited fondles and pinches to the [pc.ass] you’ve received whilst you’ve been here from guys who look exactly like this, it’s a pretty satisfying hour.");
				pc.lust(10);
				processTime(60);
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 1;
			}
			// Any: Female Scientist's Sexperiment
			if(!InCollection(2, scenesIndex) && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				output("\n\nA bookish woman dressed in a lab-coat asks, with fluttering nervousness, if she can borrow you and another girl for a time. You and the female ausar lounge on the bed together and accept the tablets she gives you.");
				output("\n\n<i>“Nothing to worry about, nothing to worry about,”</i> she insists, sitting down on the far side of the room with her clipboard. <i>“Definitely not toxic. It just, um, it just needs to be tested in a non-lab environment. Tell me how you feel.”</i>");
				output("\n\nNothing happens for twenty minutes. Then you feel slightly ill. Then you are seized by such an overwhelming Sapphic lust that it is impossible to do anything but violently fuck the ausar, who makes it quite clear she feels the same way. You desperately clinch your [pc.hip] around hers, your [pc.chest] mashed into hers, scissoring frenetically to orgasms which only seem to make the need to reach another more urgent. The only time when you aren’t fastened to her small, hard nipples is when you are passionately twining your [pc.tongue] with hers. There is only her heaving breasts, and her wonderful wet slit, and her reddened, beautiful face, and oh there is nothing but the joy of being joined with her heaving female curves, which makes you want to love her more and more and...");
				output("\n\n<i>“Alright, that’s enough,”</i> snaps Kat, striding through the door. <i>“You’ve been in here for three hours. Tie up your “research”, sicko.”</i>");
				output("\n\n<i>“Yes! Yes, of course,”</i> says the woman, hurrying across and applying a white pad to each of your brows. Slowly, the burning urge fades. You look at each other, dazed and embarrassed.");
				output("\n\n<i>“Just. Um. I think it needs more testing. Definitely more testing.”</i> the researcher says, heading to the door, almost as red-faced as the ausar is.");
				output("\n\n<i>“See you next week,”</i> snarks Kat.");
				processTime(30);
				pc.lust(9000);
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 2;
			}
			// Female treated: Human Male, Dragon Dick
			if(!InCollection(3, scenesIndex) && pc.isTreated() && pc.isBimbo() && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				pp.shiftCock(0, GLOBAL.TYPE_DRACONIC);
				pp.cocks[0].cLengthRaw = 12;
				output("\n\n<i>“You!”</i> says a well-heeled olive-skinned human, delighted eyes fastening upon your face. <i>“You’re Treated, aren’t you? Yes, yes, I can tell. How much for her, a room, and a supply of Insta-rect for two hours?”</i>");
				output("\n\nHe hurries you into a room and proceeds to fuck you absolutely stupid, using your [pc.vagina " + x + "] and your [pc.lips] in quick succession, mainlining Insta-rect the moment he orgasms to instantly regain his knotted, dragon-like erection so he can keep thrusting its hardness into your eager, sensitive holes. You finish it off with a");
				if(pc.canTitFuck()) output(" long tit-job, rubbing his cock lovingly between your lubed-up [pc.chest].");
				else output(" long jerk, polishing his cock lovingly between your [pc.fingers].");
				pc.cuntChange(x, pp.cockVolume(0));
				output(" When he tenses up and begins to groan and flex into you again, nothing emerges from his dilated cum-slit, despite your encouraging squeezes; every last drop he has to offer has disappeared into your slick, clinging pussy and your hungry throat.");
				output("\n\n<i>“Whole galaxy full of beautiful alien women,”</i> he sighs, lying back on the bed at long last, your fingers trailing down his chest. <i>“And not a single one of them is as good a lay as a New Texan.”</i>");
				processTime(120);
				pc.loadInCunt(pp, x);
				pc.loadInCunt(pp, x);
				pc.loadInMouth(pp);
				pc.loadInMouth(pp);
				pc.orgasm();
				pp.removeCocks();
				pp.createCock();
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 3;
			}
			// Any: Anat Male Navel Officer
			if(!InCollection(4, scenesIndex) && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				pp.cocks[0].cLengthRaw = 9;
				pp.cocks[0].addFlag(GLOBAL.FLAG_FLARED);
				pp.cocks[0].addFlag(GLOBAL.FLAG_NUBBY);
				output("\n\nAn anat naval officer - pretty high-ranking, going off his feathers and the cut of his uniform - gruffly asks for you and Room 21. When you open Room 21, you’re momentarily baffled: it looks like a simple, tidy flat, complete with a kitchenette. It’s only when you see the house dress and apron laid out on the bed, note attached, that you understand.");
				output("\n\nYou take the anat’s coat at the door, give him a kiss on the mask, and ask him how his day was. He sits down at the table wearily and talks about how the admiralty are breaking his balls over this and that, whilst you make him a simple supper. After you’ve finished that you have a mild tiff over whose turn it is to take out the garbage. You make it up with some gentle missionary. Anat cocks are quite thin but have a bulbous, bluntly spiked tip which give you tingles deep inside your [pc.vagina " + x + "].");
				pc.cuntChange(x, pp.cockVolume(0));
				output("\n\nOnce that’s over, he takes his coat, thanks you gruffly but sincerely, and leaves hurriedly.");
				CodexManager.unlockEntry("Anatae");
				processTime(60);
				pc.loadInCunt(pp, x);
				pc.orgasm();
				pp.removeCocks();
				pp.createCock();
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 4;
			}
			// Any: Kui-Tan Herm
			if(!InCollection(5, scenesIndex) && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				pp.shiftCock(0, GLOBAL.TYPE_KUITAN);
				pp.cocks[0].cLengthRaw = 12;
				pp.ballSizeRaw = 18;
				output("\n\nA female kui-tan, a colony raider going off her brands and cybernetic eye, orders the premium deluxe.");
				output("\n\nShe sits back on the king-sized bed, bottle of prosecco in hand, watching you grope, lick and kiss the doh’rahn at the other end, two other whores worshipping her giant erection whilst a final one buries beneath it all, attacking her pussy with her genetically enhanced long tongue. Behind you, a whole wall of vid screens silently blares out several terabytes of porn. Whenever the urge takes her, she grabs one of you and fucks you hard doggie style, leaving the rest of you to form a lesbian orgy for her delectation.");
				pc.cuntChange(x, pp.cockVolume(0));
				output("\n\nShe’s got enough cum backed up to keep this up for a good two hours. When finally every pussy in the room except hers is stuffed and leaking kui-tan cream, she gets up and tosses a single credit chit onto the bed without a word. She only looks mildly disappointed that you don’t all fight over it.");
				processTime(120);
				pc.loadInCunt(pp, x);
				pc.loadInCunt(pp, x);
				pc.loadInCunt(pp, x);
				pc.orgasm();
				pc.orgasm();
				pc.orgasm();
				pp.removeCocks();
				pp.createCock();
				pp.ballSizeRaw = 0;
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 5;
			}
			// Biped:
			if(!InCollection(6, scenesIndex) && pc.isBiped() && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				pp.shiftCock(0, GLOBAL.TYPE_EQUINE);
				pp.cocks[0].cLengthRaw = 10;
				output("\n\nA tall naga whore every bit as pinch-lipped as Kat leads you and a human girl into an immaculately decorated room, done up entirely in black and white. Without saying a word she applies wet black lipstick and white nail varnish to you, the opposite to the other girl. She then has you kneel down, ass to ass, inserts a double-ended dildo into your [pc.vagina " + x + "], and firmly straps your hips together. She follows this up with a buttplug in your [pc.asshole]. You can’t see it, but you’re willing to bet anything yours is black, the other girl’s white.");
				pc.cuntChange(x, 50);
				pc.buttChange(50);
				output("\n\nFinally, she brings out a large, flat, glass surface top, and carefully lays it on top of your shoulder blades and [pc.ass]. You shiver around the insertions stretching your holes, making the glass shift slightly; the naga raises a single warning finger to you and then opens the door.");
				output("\n\n<i>“Ah, excellent!”</i> says one of the two Asian men who enter, handing their menus to the naga. <i>“We’ll have the scallops, the gnocchi and the ass-fuck for afters.”</i> He strides towards the chair in front of you, unzipping his fly and letting his ten inch horse prick flop out as he comes.");
				pc.buttChange(pp.cockVolume(0));
				processTime(60);
				pc.loadInAss(pp);
				pc.orgasm();
				pp.removeCocks();
				pp.createCock();
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 6;
			}
			// Goo:
			if(!InCollection(7, scenesIndex) && pc.isGoo() && scenesLimit > 0 && rand(scenesTotal) == 0)
			{
				pp.shiftCock(0, GLOBAL.TYPE_CANINE);
				output("\n\n<i>“Hmm,”</i> says an ovir pro, eyeing your slimy, ectoplasmic bottom half thoughtfully. <i>“That looks... useful.”</i>");
				output("\n\nYou and a galotian puddle into a large jacuzzi together. You both coo as the bubble-streams are turned on, sending vibrations juddering through you, making you lose some of your surface tension. The ovir leads a laughing ausar couple in, a lean guy and his chubby girlfriend.");
				output("\n\nThe two of them have fun on the bed first, taking turns with the ovir’s thick, brightly-colored cock, leaving you and the galotian to gasp and giggle together over the copious amount of sex toys that have been laid out on the side. Finally, the other three splash into you, drunk with lust. The guy bends your [pc.ass] over and firmly knots himself into your [pc.vagina " + x + "], the heavy thrust of his hips sending waves of your goo slapping against the sides.");
				pc.cuntChange(x, pp.cockVolume(0));
				output(" The hard girth of his dick combine with the vibrations drives you to clenching orgasm after orgasm; it requires no acting on your part to squeal with simple-minded joy until you are hoarse. You and the galotian’s gooey flesh travel up and down the three writhing bodies, worshipping them, your reward the salt on their skins and the copious amount of slut-feed they spurt into you.");
				output("\n\n<i>“He always persuades me to come to this sleaze-hole for our anniversaries,”</i> sighs the girl later, leaning over the side as you massage her shoulders, layered on top of her generous hams, tracing the lips of her pussy with gooey tendrils. <i>“I always regret caving in at the time. Never while I’m here.”</i>");
				processTime(60);
				pc.loadInCunt(pp, x);
				pc.loadInCunt(pp, x);
				pc.loadInAss(pp);
				pc.loadInAss(pp);
				pc.loadInMouth(pp);
				pc.loadInMouth(pp);
				pc.girlCumInMouth(pp);
				pc.girlCumInMouth(pp);
				pc.orgasm();
				pc.orgasm();
				pc.orgasm();
				pp.removeCocks();
				pp.createCock();
				scenesLimit--;
				scenesIndex[scenesIndex.length] = 7;
			}
		}
		
		// + hours
		processTime(60);
		// Base room specials pay-out: 140 credits + 30
		baseEarnings += 170;
	}
	// Nothing
	else
	{
		output("You sashay through the room, letting your hand trail along muscular arms, bending the warm weight of your [pc.chest] into seated gamblers, offering your friendliest smile to anyone who looks at you, coming across at the faintest sign of interest.");
		output("\n\nNo matter how seductive you try to be, no takers accept your presence. You try to vary your approach, from a passive lily to a more aggressive pussy pusher, but your potential targets are either too entralled by other performances or flat-out uninterested as they dismissively brush you away.");
		output("\n\nEventually you head back up to the counter to meet the mistress....");
		// + Lust
		pc.lust(10);
	}
	
	// Randomized bonus pay buffs
	for(var i:int = 0; i < 5; i++)
	{
		if(rand(2) == 0) baseEarnings += rand(41);
	}
	
	return baseEarnings;
}

// Permanent Contract
// Requirements: PC is licensed, has used rooms at least twice, has gotten > 74% yield from [Rooms] or [Everything] at least once
// Scene procs when PC approaches desk next when not Jaded
public function bethsPermaContractBadEnd(response:String = "ask"):void
{
	clearOutput();
	author("Nonesuch");
	
	if(response == "ask")
	{
		showBrothelLady();
		showName("CONTRACT\nOFFER");
		
		output("<i>“Hey [pc.name]. Got a minute before you go on shift?”</i> Kat shuffles around under her desk. <i>“I keep saying I want to offer you a better contract, don’t I? I managed to have a word with Beth, and I’ve got you exactly that.”</i> She pushes the electronic form over to you. <i>“Same basic terms - 80/20 - but we want to give you some mod work, free up front, and your own room. It’ll push what you bring in way up, make you one of our star attractions.”</i>");
		output("\n\nYou look at the form, with the signature box at the bottom blinking. <b>It seems to have significantly more small print than the first one...</b>");
		
		processTime(2);
		// [Sign] [Don’t Sign]
		clearMenu();
		addButton(0, "Sign", bethsPermaContractBadEnd, "sign");
		addButton(1, "Don’t Sign", bethsPermaContractBadEnd, "don't sign");
		return;
	}
	else if(response == "don't sign")
	{
		showBrothelLady();
		showName("REFUSED\nCONTRACT");
		
		output("<i>“You must think I was born yesterday,”</i> you say, pushing the form back. Kat shrugs and smirks, completely unabashed.");
		output("\n\n<i>“Just want to make the career you’re made for happen, babycakes. As long as you keep pleasing the punters and being a good rug-munch afterwards, I don’t really care.”</i>");
		
		processTime(1);
		clearMenu();
		addButton(0, "Whore", brothelTurnTrixLicensedMenu, false);
		addButton(14, "Leave", mainGameMenu);
		return;
	}
	else if(response == "sign")
	{
		showBrothelLady();
		showName("PROPERTY\nOF BETH’S");
		
		output("<i>“You won’t regret this, [pc.name],”</i> the brothel mistress smiles, as she watches you sign the dotted line. <i>“Come on into the back - I can’t wait to see how these mods Beth has got lined up turn out.”</i>");
		output("\n\n.....");
		output("\n\nA few hours later you lie on a bed and admire yourself in a full length mirror, exhilarated and slightly overwhelmed at what the three med-pens have done to you.");
		if(pc.skinType == GLOBAL.SKIN_TYPE_SKIN && !InCollection(pc.skinTone, ["green", "lime green", "emerald", "viridescent"])) output(" Your skin is now a hairless, faintly luminescent lime-green, and your sweat - which is oilier and seems to form more readily - has a wonderful citrus scent");
		else output(" As well as being hairless and faintly luminescent, the oily sweat which now readily forms on your skin has a wonderful citrus scent");
		output(". Your new tentacle pussy waves at you with its chubby pink tentacles, each of the ganglions on the inside almost as sensitive as a clit. Experimentally, you stick two fingers in your mouth, past your [pc.lips], beyond your");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" long tongue");
		else output(" new, extendable twelve inch tongue");
		output(" and find that what Kat has told you is true - any gag reflex you had is long gone, and the inside of your throat feels... ribbed.");
		output("\n\nYou shiver with the erotic implications of these transformations, and sigh as you shift over and consider the other novelty of your new form.");
		output("\n\n<i>“Aww, don’t worry,”</i> leers Kat, looking with you in the mirror at the <i>“Property of Beth’s”</i> tattoo on your [pc.ass]. <i>“We’ll get that off you eventually.”</i>");
		
		pc.createStatusEffect("Temporary Nudity Cheat");
		pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
		pc.clearSkinFlags();
		pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
		pc.addSkinFlag(GLOBAL.FLAG_LUBRICATED);
		pc.skinTone = "luminescent lime green";
		if (!pc.hasVagina()) pc.createVagina();
		for(var i:int = 0; i < pc.vaginas.length; i++)
		{
			pc.shiftVagina(i, GLOBAL.TYPE_SIREN);
			pc.vaginas[i].vaginaColor = "pink";
		}
		if (!pc.hasTongueFlag(GLOBAL.FLAG_LONG))
		{
			pc.tongueType = GLOBAL.TYPE_LEITHAN;
			pc.clearTongueFlags();
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
		}
		
		processTime((3 * 60) + rand(11));
		clearMenu();
		addButton(0, "Next", bethsPermaContractBadEnd, "end");
		return;
	}
	else if(response == "end")
	{
		currentLocation = "GAME OVER";
		generateMap();
		showLocationName();
		
		showName("FOREVER\n24");
		
		output("She’s right, although not in the way you imagine. The terms of your new contract stipulate that you have to pay for the mods - and they are some of the most expensive on the market - at a catastrophic interest rate. Factor in the rent on your room and you really don’t get to see much of your 80%, no matter how many hot, creamy loads you suck down, or how lascivious the displays you put on with the other whores, or how many times you take it in your dripping holes.");
		output("\n\nFortunately Kat eradicates any lingering misgivings you have by introducing you to the wonder of pleasure patches. Just one makes the prospect of fucking four kui-tan at the same time live on cam in your room not daunting, but a burning necessity. Of course the patches are highly addictive, and come out of your salary too.");
		output("\n\nEventually your contract is bought out (at a fantastic profit to Beth) by a human pirate warlord. You’re serving on his pleasure barge about a year later.");
		output("\n\n<i>“Unf! Doesn’t matter how I modify you, 24,”</i> he sighs, sitting back on his couch, leaking horse cock bobbing. <i>“That asshole of yours is always going to be your best quality.”</i>");
		output("\n\n<i>“Thank you, sir,”</i> you smile, feeling the hot cum slowly inch down your [pc.thigh], giving him a lascivious lick of the [pc.lips]. You are able to respond because your larynx bio-chip is set to <i>“normal”</i> today, as opposed to <i>“kitty cat”</i> or <i>“good puppy”</i>. He unfastens your chain and slaps the number on your [pc.ass], sending a thrill down your spine from the maso-chip implanted in your neck. All of these mods came out of your salary, of course - at a heavy interest rate. The maso-chip ensures you <i>like</i> that fact.");
		output("\n\n<i>“You jiggle along, 24. See to the other guests.”</i>");
		output("\n\n<i>“Yes, sir.”</i>");
		output("\n\nYou get up, tweak your [pc.nipples] so that the lime liqueur in your full boobs is beading naturally, and then sashay through the dusky, drug-smoked and music-throbbing room. One of the many rutting, drinking or dancing revellers here will quickly find a use for you... which you’ll be orgasmically good at. You have found your true calling, and it has nothing to do with being a boring old CEO.");
		
		days += 392;
		processTime(rand(36));
		pc.credits = 0;
				
		// NOOOO
		// Looping this much when the player has basically zero chance to actually see most of this fall out is insane-
		// it comes close to hitting the script execution limit in debug builds at least.
		// It'd be 2000% better to just directly modify the properties that the player can actually /see/ the fall out
		// of- basically, just the appearance screen once the gameover hits.
		
		/*
		var i:int = 0;
		var x:int = 0;
		var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
		if (!pp.hasCock()) pp.createCock();
		for(i = 0; i < 300; i++)
		{
			pc.loadInMouth(pp);
			pc.buttChange(pp.cockVolume(0), false);
			pc.loadInAss(pp);
			if(rand(2) == 0)
			{
				x = rand(pc.totalVaginas());
				pc.cuntChange(x, pp.cockVolume(0), false);
				pc.loadInCunt(pp, x);
			}
		}
		for(i = 0; i < 9001; i++)
		{
			pc.orgasm();
		}
		*/
		
	}
	
	badEnd("GAME OVER.");
}
