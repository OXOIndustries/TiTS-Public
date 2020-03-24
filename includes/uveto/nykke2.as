/**
 * Nykke remake to make jackasses at Patreon happy, written by B
 * 
 * @author DrunkZombie
 *
 */
//[NYKKE_VERSION] 1 = original (nykke.as), 2 or anything else = new 2.0 version (nykke2.as)
//["NYKKE_MET2"] undefined or 0 = intro not done, 1 = intro complete
//["FROSTWYRM_PSIONICS_TALK"] undefined or 0 = not talked to frostwyrm about psionics, 1 = talked, set in frostwyrmPsionicsTalk() frostwyrm.as
//["NYKKE_SEX2"] times you fucked
//["NYKKE_FUCK_HER_CUNT2"] times you fucked her cunt
//["NYKKE_FUCK_HER_ASS2"] times you fucked her ass
//["NYKKE_FUCK_YOUR_CUNT2"] times she fucked your cunt
//["NYKKE_FUCK_YOUR_ASS2"] times she fucked her ass
	
public function nykke2Header(nude:Boolean = false):void
{
	author("B");
	showNykke2(nude);
}
public function showNykke2(nude:Boolean = false):void
{
	showName(flags["NYKKE_MET2"] == undefined ? "FROST-\nWYRMLING" : "\nNYKKE");
	showBust(nykkeBustDisplay(nude));
}	
public function nykke2SendEmail():Boolean
{
	//unless the version toggle is set to 1 set the version to 2 which turns off nykke 1.0 and turns on nykke 2.0.
	if (flags["NYKKE_VERSION_TOGGLE"] == 1) flags["NYKKE_VERSION"] = 1;
	else flags["NYKKE_VERSION"] = 2;
	
	if (flags["NYKKE_VERSION"] == 1) return false;
	if (!nykke2SteeleCanSatisfy()) return false;
	if (flags["FROSTWYRM_KIP_COUNT"] >= 1) return true;
	
	return false;
}
public function nykke2SightingEmail():String
{
	var eText:String = "";
	eText+="A large, bipedal creature of unknown origin has been spotted to the east of Irestead."
	eText+="\n\nThe area is known to have previously been a brooding ground for a Frostwyrm, Uveto’s apex predator. Sightings of the Frostwyrm have diminished substantially in recent times, but a newer, unknown and undocumented creature has been spotted in the same territory as of late.";
	eText+="\n\nThe creature walks on two legs; stands approximately between eight and ten feet tall, from foot to head; has expansive wings on its back; and is covered in pitch black scales. The creature has been described by multiple reports as bearing some countenance to a traditional Frostwyrm in outward appearance.";
	eText+="\n\nThere have been no sightings of the creature venturing beyond the east Irestead coast. Travellers, Rushers, and scientists are advised to maintain their distance for the time being.";
	eText+="\n\nUveto Wildlife/Weather Advisory Board";
	eText+="\n\n<i>A bipedal creature that stands ten feet tall and looks like a Frostwyrm? That sounds like your kip! But... with black scales?</i>";
	
	return doParse(eText);
}
public function nykke2IntroOK():Boolean
{
	if (flags["NYKKE_VERSION"] == 1) return false;
	if (flags["NYKKE_MET2"] == 1) return false;
	if (!nykke2SteeleCanSatisfy()) return false;
	if (MailManager.isEntryViewed("nykke2_sighting")) return true;
	
	return false;
}
//0 = either, 1 = cock, 2 = vag
public function nykke2SteeleCanSatisfy(idx:int=0):Boolean
{
	if (idx != 2 && pc.hasCock() && pc.virility() > 0) return true;
	if (idx != 1 && pc.hasVagina() && pc.fertility() > 0) return true;
	
	return false;
}
public function nykke2Intro():void
{	
	clearOutput();
	nykke2Header(false);
	output("You keep your eyes peeled all around you as you wander the coast. This is where [frostwyrm.name] had claimed as her territory, and no other creature was brave enough to try and wander the area – but the email you had gotten from that advisory board is still fresh on your mind. A creature, described as being ten feet tall, bipedal, and looking like a Frostwyrm, has been spotted in the area. It sounded like " + (flags["FROSTWYRM_KIP_COUNT"] == 1 ? "your kip" : "one of your kips") + ", but... that can’t be true, can it?");
	output("\n\nWhen you crest a nearby dune, you stop. It wasn’t difficult to find: like the email had reported, the creature was covered head-to-toe in pitch-black scales, a far-cry from [frostwyrm.name] and her snowy-white scales. Whatever this creature is, it sticks out from among the snow like a sore thumb. And it’s standing right there.");
	output("\n\nLike the report had described, it’s very tall, about ten feet, from foot to scalp. Its highly muscled all over, like a draconic Amazon; every step from its thick legs has its thighs and calves flex and its thick tail sway, keeping itself upright and balanced. It has a pair of massive wings sprouting from its shoulder-blades, and, solidifying your hunch, it has four arms total – the unique hallmark of a Frostwyrm kip.");
	output("\n\nYou aren’t sure what you should do, now that you’ve come this far. Do you approach it? Call out to it? Do you leave and come back later, when it’s somewhere else among the coast? Do you call [frostwyrm.name] for help?");
	output("\n\nUnfortunately for you, you’re not much stealthier than it is: you’re standing on the crest of a snow dune, an easy sight for anyone else to see. As soon as the Frostwyrmling sees you, it launches into the air with a thick, powerful flap of its wings, and it’s rushing straight toward you!");
	output("\n\nYou assume the creature is approaching aggressively " + (pc.hasEquippedWeapon() ? "and reach for your weapons" : "and assume a defensive stance") + ". Your combat prowess is what attracted [frostwyrm.name] to you in the first place – you could probably fight a biped half her size just fine.");
	
	processTime(2);
	clearMenu();
	addButton(0,"Next",nykke2Intro2);
}

public function nykke2Intro2():void
{	
	clearOutput();
	nykke2Header(false);
	
	output("The Frostwyrmling makes a pass above you, close enough that you can feel the backdraft rush against you when it flies by. A blast of steam washes against your face, followed by a tightness in your head. The sensations are all too familiar with the first time you communicated with [frostwyrm.name], and if you’re right, this Frostwyrmling must be trying to reach out to you.");
	output("\n\nYou keep your eyes on it, ready to make the first strike if you need, but its movements don’t <i>seem</i> overly aggressive, not immediately. It makes a shallow circle as it turns back toward you, and, dipping down, it skids into the snow, billowing a cloud of white snow over you as it comes to a stop.");
	output("\n\nNow that it’s closer to you, you get a better look at the creature: it looks quite similar to your own kip" + (flags["FROSTWYRM_KIP_COUNT"] == 1 ? "" : "s") + ", including a head of dishevelled hair reaching to its neck. There isn’t a single white scale on its whole body – very atypical for a Frostwyrm or even a half-breed – and instead, its tougher outer scales are pitch black, and its softer front-end scales are a dull grey. It has a humanoid face, including wide, bright-red eyes; a button nose; and a pair of thick black lips, framed by silky-smooth skin and a pair of raised cheekbones.");
	output("\n\nThere are a number of pockmarks and scars across its body, particularly along its stomach, chest, and arms. And, totally shameless, it has rather <i>exaggerated</i> endowments: a pair of fat, firm F-cup breasts sit atop its chest, each topped by an icy-blue nipple, and between its thick, bubbly thighs are a pendulous pair of testicles resting beneath a thick, plump penile vent, bulging to contain what is probably a real competitor of a cock.");
	output("\n\nIt steps toward you, bent forward and sniffing at the air, letting its nose lead the way forward. The way it carries itself, it’s either confident that you won’t attack it, or its confident that it’ll win the encounter if you try; you’ve probably intruded on its territory, and it’s ready to defend it, but it’s not quite ready to start a fight, either.");
	output("\n\n<i>You smell like a Frostwyrm,</i> it says to you psionically. It presses its nose up against your [pc.upperGarments], taking in a huff to try and get a bead on who you are – or, more likely, who you smell like. <i>But you’re clearly not one." + (nykkeFrostwyrmTF() ? " You aren’t fooling anyone." : "") + " And you’re not like me.</i> Its two left arms surge forward, grabbing onto your right, and holding it steady so it can sniff you from wrist to shoulder. <i>But you smell a bit like....</i>");
	output("\n\nYou respond to it, verbally, by saying that you are a Qal to a clutch. You had met a Frostwyrm, and it mated with you until you started a family.");
	output("\n\n<i>“You are virile?”</i> it asks, responding verbally in kind, a sense of urgency in its voice.");
	if (nykke2SteeleCanSatisfy(1) && nykke2SteeleCanSatisfy(2)) output(" You answer that you’re, uh, even better equipped than that.");
	else if (nykke2SteeleCanSatisfy(1)) output(" You answer that, uh, yes?");
	else if (nykke2SteeleCanSatisfy(2)) output(" You answer that you’re, uh, <i>fertile,</i> sure?");
	else (" Well, you used to be.")	
	output(" Although that’s an awfully personal question–");
	
	output("\n\nThe creature lunges forward");
	if (pc.tallness >= 96) output(" two of its massive hands grabbing you by the wrists and the other two wrapping around your back, keeping you immobilized in its strong grip. With a yank, you’re pulled face-to-face against its button nose, against its eager body.");
	else
	{
		output(", two of its massive hands grabbing you by the arms and the other two");
		if (pc.isTaur() || pc.isNaga()) output(" wrapping around the small of your back, keeping you in place.");
		else output(" grabbing you by the [pc.legs], immobilizing you in its strong grip and keeping your limbs splayed apart. It wraps your legs around its waist like a belt, keeping your lower body pressed up against her chiselled stomach.");
		output(" With a yank, you’re pulled face-first into its massive chest, against its eager body.");
	}
	output("\n\n<i>“Finally!”</i> it exclaims, shifting its powerful form against yours to get you nice and snug against its thick frame. <i>“We must mate, you and I! If you are truly a Qal to a clutch, then your Qim must be a Frostwyrm, and if you’re a viable mate for a Frostwyrm, you are a worthy mate for me!”</i>");
	output("\n\nYou struggle against it, but given how excited it is at having found a ‘viable mate,’ its strength is difficult to contest. You feel what can only be its cock – as formidable as you had imagined – rise and wetly poke against your [pc.belly], as sure a sign as ever that it’s ready to start breeding.");
	output("\n\nWell, uh–");
	
	processTime(5);
	clearMenu();
	addButton(0,"Fuck",nykke2IntroFuck, 0,"Fuck","This Frostwyrmling has huge tits; more than likely a massive cock; and is ready to start fucking you right here and now. Hell, why bother turning down an invitation like that?");
	addButton(1,"Talk",nykke2IntroTalk, undefined, "Talk", "You only just met! You don’t even know its name! Push the Frostwyrmling off you and try and get to introductions.");
}
public function nykke2IntroFuck(startVer:int=0, kok:int=-1, hole:int=-1):void
{	
	var analSex:Boolean = false;
	var firstTime:Boolean = true;
	if (flags["NYKKE_MET2"] == 1) firstTime = false;	
	flags["NYKKE_MET2"] = 1;
	
	if (startVer <= 1)
	{
		clearOutput();
		nykke2Header(true);
		if (pc.hasCock()) kok = rand(pc.cockTotal());
	
		if (pc.hasVagina())
		{
			hole = pc.findEmptyPregnancySlot(1);
			if (hole < 0) hole = rand(pc.vaginaTotal());
		}
	}

	if (kok < 0 && hole < 0) analSex = true;
	
	if (startVer == 0)
	{
		output("You don’t resist, but you insist (psionically – your face is preoccupied) that this Frostwyrmling at least tell you its name first, if it has one.");
		output("\n\n<i>“Oh, right. My Qal taught me something about ‘introductions’ with non-Frostwyrms. My Qal has named me Nykke. And... Frostwyrms don’t use things called ‘pronouns,’ but I’ve been taught to tell you that I’m a ‘she.’ Whatever that is.”</i> You feel Nykke probe your mind, not unlike whenever [frostwyrm.name] scoured your memories for information. <i>“And your name is... [pc.name] Steele. There; introductions over. Let’s mate!”</i>");
	}
	else if (startVer == 1)
	{
		output("As beholden as you are to [frostwyrm.name], it’s not like you’ve stopped having sex outside of the lair. She understands that you have different needs compared to a Frostwyrm. And besides, it’d be wrong to leave Nykke as she is: she’s horny enough to fuck a hole straight through a rock, and she’s literally on her knees, asking for a piece of you.");
		output("\n\nYou acquiesce – and as soon as the words leave your mouth, Nykke is on you, her arms wrapped around you just as they had before, but with a sort of nervous, excited energy that a blushing, overeager, degenerate virgin has when they have their shot at their crush.");
	}
	
	if (startVer <= 1 || (startVer == 2 && kok < 0))
	{
		output("\n\nYou feel Nykke’s thick, blunt cockhead poke against your inner thighs");
		if (!pc.isCrotchExposed())
		{
			if (pc.isNaga()) output(", ineffectually scraping against your [pc.crotchCovers]. She frowns, then scours your mind again for more information – when she finds it, she’s deft and masterful in removing them without destroying them, until your [pc.legOrLegs] is exposed to the chill of the Uvetan air.");
			else output(", ineffectually scraping against your [pc.crotchCovers]. She frowns, then scours your mind again for more information – when she finds it, she’s deft and masterful in removing them without destroying them, until your [pc.legOrLegs] are exposed to the chill of the Uvetan air.");
		}
		if (hole >= 0) output(" Like a heat-seeking missile, Nykke’s blunt dick head homes in on your [pc.vagina " + hole + "], pushing and plying at your entrance, ready to thrust in and wear you like a cocksock. You shiver, not from the cold, but from the sensation of having something so <i>meaty</i> teasing your vulva.");
		else if (kok >= 0 ) output(" Her flat, rounded cockhead pokes and prods at your taint, where your vagina would be if you had one. The ridge of her cock prods at the underside of your [pc.crotch] gently, making your [pc.cock " + kok + "] grow rigidly against the cold, exposed air of Uveto.");
	}
	if (hole >= 0 || analSex)
	{
		output("\n\nYou eye the one-eyed monster that is Nykke’s immense, draconic cock as it slowly humps and inflates its way up your [pc.belly]. It spills from her penile vent, already a couple inches around, and with her every excited heartbeat, it’s only getting longer and fatter. A single, clear dollop of her pre beads from its tip; after a particularly antsy, lustful shudder, it squirts from her, marking your torso.");
		output("\n\nNykke clenches her teeth at the sight of you, marked by her pre, going up your stomach and up to your [pc.chest]. She apparently enjoys the sight: the idea of having you bathed and marked in her seed has her hump more eagerly against you, until her massive, scaled balls slap you in the [pc.ass].");
		output("\n\nYou can feel the lust coming through Nykke and into you when she sees the sight, so you play up the part for her: you trace your finger along the stream of pre and bring it back to your mouth, while your other hand dips between you two, grasping at her cock, just beneath her wide, flat head. You look Nykke in her ruby-red eyes as you lick your fingers clean and you give her dick a squeeze and a pull.");
		output("\n\nNykke grunts, and her body shudders again; the cock in your hand bloats, and another, more impressive squirt of pre rockets up her and onto your [pc.skinFurScales] again. You can practically hear her dick getting hard: the slight peeling sound of her penile vent flexing and opening, and the blood rushing into her appendage to inflate it and ready her for a hot, willing hole to breed.");
		output("\n\nStill, Nykke does little, even when she’s in such a ‘powerful’ position above you: your entire body pinned to hers, each of your limbs kept in place by her strong hands, and her hips just a scant few inches from your own. She hisses in lust, her eyes laser-focused on you and what you’ll do next – almost like she needs you to continue for her, but she won’t admit it. You could probably give her a handjob right now, but you know that you’re both focused on something a little... meatier.");
		output("\n\nNykke pulls your limbs tighter against her, your body pressed into her torso. She wraps your [pc.legOrLegs] around her like a belt, and then she falls to her knees, then onto her front, pressing your back into the cold snow. You’re pressed against her, about to get mated by a horny Frostwyrmling, and she has all the control between you two.");
		output("\n\nShe hisses through a clenched jaw and frots her enormous cock against your body some more. It must be a foot long, maybe a bit longer; it’s as thick as your arm and it’s got a flat head, perfect for battering into a poor hole and leaving a serious imprint on anyone it fucks; and, most deliciously dangerous of all, it has a bloated knot at its base,hinting at who or what her Qal must have been. Her body clenches and ripples around you, her protruding Frostwyrm muscles bulging around her four arms and down her washboard abs. She’s gone years and years without a mate; your eyes widen and cross at the thought of how <i>hard</i> she’s going to fuck you....");
		output("\n\nNykke’s thick tail swishes behind her as she rears her hips back, scraping her cock down your [pc.belly] " + (pc.hasCock() ? "and brushing your [pc.cock " + rand(pc.cockTotal()) + "] aside " : "") + "to reposition herself at the entrance of your " + (analSex ? "[pc.asshole]" : "[pc.vagina " + hole + "]") + ". As soon as her cock feels the wet heat of your " + (analSex ? "exit" : "entrance") + ", her instincts kick in, and she doesn’t hesitate – and, she’s forceful and impatient. It’s a bit uncomfortable, truth be told.");
		output("\n\nFirst, you tell Nykke to calm down; she’s not accomplishing anything other than getting herself worked up. She snorts, her breath against your face, a wild woman eager to breed, but she complies; she stops her thrusting hips and rests her bloated, beating cock against your [pc.thigh]. Now, you instruct, she has to reach between you two and put herself inside you. She may be running on instinct, but she isn’t a dumb animal, and all the aimless thrusting isn’t going to help either of you.");
		output("\n\nYou can tell that she’s confused and frustrated: she’s unconsciously projecting a number of images and emotions over your psionic link, up to and including fantasies about how good you’ll feel, and distress that she didn’t get it right the first time. You tell her to calm down – it’s not a race. Mating is about the pleasure and the togetherness as much as it is about breeding, and getting so frustrated and tense is going to make it less enjoyable.");
		output("\n\nNykke takes a deep breath, in through her nose, and out through her mouth, shuddering on top of you. You can tell it works, through the emotions she’s projecting. With a clearer mind, she reaches between you two, careful of her sharp claws against your [pc.skinFurScales], and she grips her cock by the shaft. You lay patiently still: it’s just a matter of working her way into you.");
	
		if (analSex)
		{
			if (pc.ass.looseness() >= 5) output("\n\nShe finds your asshole easily enough, and, with a thrust of her eager hips, she’s already sunk a handful of inches into you, just like that: your spacious and experienced [pc.asshole] has no problem splitting apart for a cock even as wide and unforgiving-in-shape as Nykke’s. The initial penetration is little more than a formality to either of you, and once she’s in, she’s set to breed you – to <i>fuck</i> you properly. She pushes forward, quickly sinking inch after inch of her fist-thick, footlong cock into you.");
			else
			{
				output("\n\nShe rims the entrance of your asshole with her cock’s head, although she’s a little overeager when she does, and she batters her flat cockhead against your star, demanding entry into your body. You flinch in pain, but you tell her to continue; she just needs to work her way in slowly. She’s got a whole lot of cock, and you’re only one, small [pc.race].");
				output("\n\nLike the excellent student she’s proving herself to be, she does as you say, and tries again, but slower and more deliberate. The bluntness of her head makes it a challenge to split you open and introduce herself into you appropriately. You’re relaxed, and she’s determined and <i>horny</i>; after a bit of pressure and some wriggling for good measure, her dick slips into your [pc.asshole], and she’s all set to fuck you.");
			}
			pc.buttChange(chars["NYKKE"].cockVolume(0));
		}
		else
		{
			if (pc.vaginas[hole].looseness() >= 5) output("\n\nShe finds your pussy easily enough, and, with a thrust of her eager hips, she’s already sunk a handful of inches into you, just like that: your spacious and experienced [pc.vagina " + hole + "] has no problem splitting apart for a cock even as wide and unforgiving-in-shape as Nykke’s. The initial penetration is little more than a formality to either of you, and once she’s in, she’s set to breed you – to <i>fuck</i> you properly. She pushes forward, quickly sinking inch after inch of her fist-thick, footlong cock into you.");
			else
			{
				output("\n\nShe rims the entrance of your pussy with her cock’s head, although she’s a little overeager when she does, and she batters her flat cockhead against your vulva, demanding entry into your body. You flinch in pain, but you tell her to continue; she just needs to work her way in slowly. She’s got a whole lot of cock, and you’re only one, small [pc.race].");
				output("\n\nLike the excellent student she’s proving herself to be, she does as you say, and tries again, but slower and more deliberate. The bluntness of her head makes it a challenge to split you open and introduce herself into you appropriately. You’re relaxed, and she’s determined and <i>horny</i>; after a bit of pressure and some wriggling for good measure, her dick slips into your [pc.vagina " + hole + "], and she’s all set to fuck you.");
			}
			pc.cuntChange(hole, chars["NYKKE"].cockVolume(0));
		}
		
		output("\n\nYou grunt in pleasure, admiring the initiative Nykke is displaying, and the way her body works and swells against itself when she fucks you; although she’s <i>aware</i> of your pleasure, it’s second to her own. Your hands clench into balls, and your [pc.ass] rests against the chilly snow, as she sinks more and more and <i>more</i> Frostwyrmling dick into you; your body greedily slurps in every wonderful inch of Nykke’s incredible tool, and despite the growing pressure inside you from the way she’s filling you out, you can’t see yourself hoping she’ll bottom out.");
		output("\n\nOf course, and unfortunately, she does: with an insistent thrust, her bloated, draconic knot hits you in the " + (analSex ? "[pc.asshole]" : "[pc.vagina " + hole+ "]") + ", and you feel her bloated testicles rest against your [pc.thighs]. Yet, despite having hit as deeply into you as she can for now, she continues to push, eager to knot you immediately: she leans into you, her face right up against yours.");
		output("\n\n<i>“I can tell you’re the Qal to a clutch,”</i> she whispers hoarsely to you. Your eyes are on her tight, muscly stomach and her enormous cock lodged inside you. <i>“You’re taking me like a proper mate to a Frostwyrm. This isn’t the first time a Frostwyrm’s cock has molded this body.”</i> Like before, she isn’t a dumb animal: rather than continue in a singular thrust to knot you, she first pulls back, and thrusts in again. " + (analSex ? "<i>“This may not make you the Qal to my clutch, but I don’t mind doing it as often as you’d like.”</i>" : "<i>“Let me make you the Qal to another clutch....”</i>"));
		output("\n\nYou hiccup in delight at the sensation of Nykke fucking your " + (analSex ? "[pc.asshole]" : "[pc.vagina " + hole+ "]") + ": the feel of her smooth shaft sliding out from you, just to glide back in and stuff you full of dragon dick, reminds you of why you agreed to be [frostwyrm.name]’s mate in the first place. And, on top of your own pleasure, Nykke’s own is feeding into you through her psionics – it’s enough to make your eyes roll into your skull.");
		output("\n\nNykke, meanwhile, has gotten a feel for her position, above you and pounding into you: she huffs in effort and in pleasure as two of her four arms hook underneath your body, her hands on your [pc.hips], simultaneously lifting you up and keeping you steady so she can fuck you and press into you harder. Her other two are still on your wrists, keeping you helpless against her; the further she leans over you, the more her expansive, F-cup breasts continue to encircle and obscure your vision, until your world is nothing but firm Frostwyrmling titty and thick Frostwyrmling cock.");
		output("\n\n<i>You’ll be</i> my <i>Qal,</i> she says psionically; one of her hands presses onto the fat of your ass, lifting you into her, dominantly ensuring that you don’t move so she can fuck you.");
		if (analSex) output("<i>“I hope you appreciate the lengths I’m going through to provide you with pleasure.”</i> She hisses through clenched teeth, and you can feel her haphazardly search your memories for something. <i>“I’m sure your Qim has done the same for you. Consider yourself lucky; there are few people in this world that can say they’ve taken a Frostwyrm up the ass.”</i>");
		else output("<i>“There aren’t many Frostwyrms left in the world. We’ll need to mate from Light’s Rise to Light’s Fall to repopulate.”</i> She hisses through clenched teeth, and you can feel her haphazardly search your memories for something. <i>“Introduce me to your Qim. There can never be too many Frostwyrms.”</i>");
		
		output("\n\nYour mind’s eye flashes with images of Nykke and [frostwyrm.name], not just together, but with you: you, pinned beneath [frostwyrm.name]’s enormous body, filled to the brim with her cock in your tight " + (analSex ? "[pc.asshole]" : "[pc.vagina " + hole+ "]") + ", while Nykke fucks your mouth. Another fantasy, of Nykke laying on top of you, pumping you and filling you until her Frostwyrmling seed jets out from you, and [frostwyrm.name] on top of her, her own gargantuan cock beneath Nykke’s upturned tail, and returning the favor. Another fantasy–");
		output("\n\nThe claps of her body pounding into yours bounce off the snowy dunes for all to hear. You’re pushed up the sheet with every forceful push of her dick into your body, sliding you along the cold snow. Nykke’s panting has turned into rough, nasally snarling as her orgasm approaches.");
		output("\n\n<i>Our clutch... will be <b>magnificent!</b></i> she bellows into your mind. And, with one final push, her knot batters into your " + (analSex ? "[pc.asshole]" : "[pc.vagina " + hole+ "]") + " for the last time: your body yields, and she forces her last bit to enter into you, tying you to her.");
		output("\n\nYou grunt in your own pleasure, feeling so <i>full</i> and <i>packed</i> with Nykke’s dick; you can scarcely focus on anything, including Nykke’s own thoughts and emotions, so overridden with pleasure as you are. You twitch your [pc.hips] against her involuntarily, and every time you do, she thrusts a little more – not that there’s any more for her to give, but she’s single-mindedly determined to get as deep as she can.");
		output("\n\nTo top it all off, Nykke cums, with a grunt and another push: her already-thick-dick bloats even more to accommodate her flooding seed, and you feel every last drop as it splatters your insides. Your " + (analSex ? "stomach" : "womb") + " is packed to the brim by her second spurt, but Nykke’s balls, huge as they are, have oh-so-much more to give. You’re already split in half, and with her knot in place, her overabundant cum seeps from the seal in drips; your lower body fills out, somewhat uncomfortably, with her offering.");
		if (analSex)
		{
			output(" You can’t help but fantasize what it would feel like to have a vagina and get so thoroughly plugged and stuffed with dragon-cock – it’s tempting to go out and get a mod for that, just to see if you’re compatible.");
			pc.loadInAss(chars["NYKKE"]);		
			pc.loadInAss(chars["NYKKE"]);
			pc.loadInAss(chars["NYKKE"]);
			pc.loadInAss(chars["NYKKE"]);
			IncrementFlag("NYKKE_FUCK_YOUR_ASS2");
		}
		else
		{
			output(" You’re not sure if you’re compatible, but if you are, you’d have no doubt in your mind that it would be taking several times over.");
			pc.loadInCunt(chars["NYKKE"],hole);
			pc.loadInCunt(chars["NYKKE"],hole);
			pc.loadInCunt(chars["NYKKE"],hole);
			pc.loadInCunt(chars["NYKKE"], hole);	
			IncrementFlag("NYKKE_FUCK_YOUR_CUNT2");
		}
			
		output("\n\nYou were close before she erupted inside you, and as soon as her hot Frostwyrmling cum slides into you, you can’t help but explode right alongside her: you clench down on her, your " + (analSex ? "[pc.asshole]" : "[pc.vagina " + hole+ "]") + " milking her cock and urging her for more cum, despite how stuffed you already are and how you " + (analSex ? "look" : "could get") + " pregnant four times over with the load you have already. But you don’t care: all your body wants is for more of this wonderful dick to give you more of what Nykke wants to give you.");
		if (pc.hasCock())
		{
			output("\n\nAnd, to top it all off, your [pc.cocks], erect and neglected this whole time, spurts your own [pc.cum] between you two, painting Nykke’s belly-scales [pc.cumColor].");
			if (pc.cumQ() >= 10000) output(" Perhaps spurned and inspired by Nykke’s performance, and her offering, you match her load for load and drop for drop, your [pc.cum] splashing another thick load and adding to the growing mess between you both");
			else output(" No matter how many times Nykke makes you cum by abusing your " + (analSex ? "[pc.asshole]" : "[pc.vagina " + hole + "]") + ", you feel like you couldn’t come close to matching her output.");

		}

		output("\n\nIt takes her several more loads, but, finally, after all of it, she’s done. Her Frostwyrmling cock continues to twitch and leak inside you, but the spurting and the cumming has passed; she collapses on top of you, smothering you beneath her boob-fat and her muscles, reeling from the pleasure and the exhaustion. All you two need to wait for now is for her knot to deflate.");
		output("\n\nYou’re both too blissed out to make for conversation – even your psionic link is fuzzy and blank as Nykke rests on top of you.");
		if (firstTime) output(" You know you’ll have a handful of questions to ask her when you’re both sensate again, but for now, you’re too boggled by the mindblowing animalistic rut she had just done to you.");
		output(" When her body calms, and her dick recedes enough to dislodge itself, a cascade of her pearly cum drips from you, splashing onto the snow in bubbly gouts and easing the pressure on your poor " + (analSex ? "stomach." : "womb."));
		output("\n\nYou hear what might be purrs – or snores – coming from Nykke above you. She offers no resistance when you shuffle beneath her, trying to get comfy between her hot and heavy body and the soft and freezing snow beneath you. Instinctually, Nykke’s six limbs wrap themselves around you once again, locking you to her.");
		output("\n\nNykke is capable of one <i>hell</i> of a round. You can’t help it – you’re already fantasizing about a round two.");
		
		processTime(30 + rand(30));
	}
	else
	{
		if (startVer <= 1)
		{
			output("\n\nNykke grunts in frustration at the total lack of penetration. She thrusts her hips forward, and her blunt cock’s head bumps against your taint painfully; she’s trying to fuck you, but there’s nothing to fuck. You understand that all Frostwyrms are hermaphrodites; you tell her that " + (nykkeFrostwyrmTF() ? "you are an exception." : "you are not a Frostwyrm."));
			output("\n\n<i>“That much is clear,”</i> she responds. She releases her grip on each of your limbs, and you fall backward onto the snow with a hard ‘flump.’ <i>“My own Qal did not have one either.”</i> She wraps three of her hands around her bloated cock, giving it a few pumps; a clear bead of her pre bubbles from her tip and splashes forward, landing on you and staining your body. <i>“My Qim told me that our clutch was... smaller than we had hoped because of it. Your clutch must not be impressive, either.”</i>");
			if (flags["FROSTWYRM_KIP_COUNT"] >= 50)
			{
				output("\n\nKnowing that Nykke is psionically connected to you, you conjure an image in your head of how packed [frostwyrm.name]’s lair is, thanks to your ‘efforts’ with her. Frostwyrmlings, from corner to corner, in the lair; you couldn’t take one step without tripping over a dragon. It might have taken time, but there’s no substitute for... you say, <i>perseverance.</i>");
				output("\n\nNykke’s expression twists as she understands the image you’re projecting to her: her lips curl into a coy half-grin, and her cock lurches at her waist, standing hard and straight, flinging another string of pre in your direction. You feel her prod at your head for more information, but you can’t tell for what.");
				output("\n\n<i>“Well, then, [pc.name],”</i> she says, turning to face uphill against the snow dune behind her. She sinks to her knees, then flops forward, her four arms bracing against the snow – and she hikes her tail straight up, revealing her sopping wet gash, pearling with liquid atop a pair of thick, scaled testicles. <i>“If I’m not mistaken, this is the</i> proper <i>position to be taken. Share some of that virility with me.”</i>");
			}
			else
			{
				output("\n\nYour clutch may not be as large as the Grand Qim’s, but all the same, you’re the one between you two with a clutch at all.");
				output("\n\nNykke ‘tch’s’ at the statement, but can’t deny the truth of it. She’s the one who propositioned <i>you,</i> after all.");
				output("\n\nYou feel Nykke prod at your memories uninvited for something, but you can’t tell for what. When she’s done, she turns around, facing uphill against the snow dune behind her, and drops to all-sixes before hiking her tail up and behind her back, her bulbous tip resting between her wings. On full display in the Uveto cold is her pearly pussy, beading and dripping with lust at the prospect of having finally found a mate, nestled atop a pair of bulging, scaled testicles.");
				output("\n\n<i>“That’ll change soon, [pc.name],”</i> she says, her tail swishing invitingly to you. <i>“Give me a kip of my own, and we can get started on making your clutch all the larger. A proper Qal never stops mating their Qim.”</i>");
				output("\n\nYou don’t recall [frostwyrm.name] saying that’s one of your duties as Qal, but you’re not about to argue semantics when a Frostwyrmling is waving her pussy in your face.");
			}
		}
		output("\n\nYou step forward, your [pc.cock " + kok + "] " + (pc.isCrotchExposed() ? "guiding you towards the bullseye that is Nykke’s exposed genitals." : "tenting your [pc.lowerGarments]; against your better judgment, in the subarctic temperatures of Uveto, you work to remove them, at least enough to expose your junk. The air may be cold, but you’re sure Nykke’s body is warm.") + " Your hands run over her scaled, pitch-black rump as your dick kisses the entrance to her tunnel, mapping out their huge, smooth, muscled curves; Nykke jumps in surprise at your touch, and her glutes tense until she’s as solid as hardened clay. You aren’t sure if it’s some defense mechanism, or if she’s trying to make herself enticing for you; based on the lust pouring into you through your psionic connection, it’s probably the latter.");
		output("\n\nHer heart is hammering hard enough in her chest to make her scaly F-cups bounce in time with it, and you can see the vulva of her pussy pulse in time with the rest of her body. You command her, with your thoughts, to spread her legs slightly, and she complies, giving you wider access to her crotch. Once more, your [pc.cockHead " + kok + "] prods at her entrance, even hotter and wetter now that you have your hands on her, and you thrust forward.");
		
		pc.cockChange();
		
		output("\n\nNykke hisses in delight and arches her back. She says nothing, but the sensations you’re getting over your connection with her are all the words you need. Images flood your mind’s eye, of you cumming inside her already, and of her immediately swelling with dozens upon dozens of further kips. She imagines what they’d look like; how strong they’d be; if they’d take after you or after her more; and a few licentious thoughts wonder if she can get a piece of [frostwyrm.name] and propagate with her, too.");
		output("\n\nYou let her fantasize all she likes; your left arms wraps and squeezes at her massive, thick tail, and your right hand hooks around her thigh, grasping at where her leg meets her pelvis. Nykke groans in pleasure, her claws raking lines through the snow, and she, with some initiative, uses her massive tail to coil around you and keep you in place, right where you belong: behind her, pounding her, <i>mating</i> with her, where she wants you to be.");
		output("\n\n<i>Your Qim was right to choose you,</i> Nykke says to you psionically. You can see her peering at you from over her shoulder; a toothy grin has spread on her face. She’s snorting through her nose with every other thrust into her. <i>“If I had met you first, there would be no letting you go. I don’t know how I’ll be able to last without you inside me like this every waking moment.”</i>");
		output("\n\nYou muse that [frostwyrm.name] thinks the same way when you’re mating with her. Clearly, you’re such a stud that dragons everywhere are willing to fall over themselves just for a piece of you. She and Nykke have a lot in common; maybe you could introduce each other later? You ask Nykke if she’d like that. To be between you and a pure-blooded Frostwyrm, fucked however which way she wanted, bloated and laden with all the kips she can handle.");
		output("\n\nThe thought of getting bred so thoroughly has an effect on her, and Nykke’s head rolls to one side, her massive (for her form) tongue lolling from her mouth, her eyes unfocused. Her cock flops about, fully erect and unhindered, spewing her precum all over herself and letting it splatter into the snow. Her psionic imagery has weakened, leaving a fuzzy nothingness, although she has the cognizance to ask one more question.");
		output("\n\n<i>And if I want you all to myself?</i>");		
		output("\n\nIt’s not wrong of her to want you, especially given how lonely she must have been all her life, but, you still have duties to the rest of your clutch, and to your mate, [frostwyrm.name]. You understand that Frostwyrms are normally a monogamous species, and you’re very lucky that [frostwyrm.name] is as progressive and understanding as she is. The <i>last</i> thing you want is to betray that sort of trust, and the <i>last</i> Nykke should want is to be a greedy, selfish Qim that only wants you for <i>herself.</i> There’s a word for individuals like that, in the Frostwyrm language.");
		output("\n\nHer eyes shift, disengaging from yours. Her hands clench into fists, digging into the snow beneath her, and she resigns herself to the pleasure she’s been denied all her life: the pleasure of having a <i>real</i> cock – the cock of a worthy Qal – in her tight cunt. There are no more thoughts or images – only pleasure.");
		output("\n\nThat said, you’re here, now, together, fucking like animals in the snow. It’s not so selfish to want to keep feeling this pleasure. It’s <i>okay</i> to <i>want</i> to be <i>bred</i> by the most <i>perfect mate</i> she <i>knows</i>.");
		output("\n\nHer only sounds are the occasional grunt. Her legs shake and nearly give out beneath herself, but her tail wraps tighter around your back, keeping you close to her as you ream and pound her cunt. At the thought of being your Qim and sharing you with another, she orgasms: her pussy clamps onto you, her Frostwyrm biology rippling around your [pc.cock " + kok + "], ushering forth whatever sperm you give her to seed her eggs. And, to cap that off, her cannon of a penis erupts beneath her with enough ferocity to cut through the snow like a pressure hose.");
		output("\n\nAnd neither of her orgasms stop, even as you continue: every time you push into her body, she ripples around you once more, and another splash of her feminine cum washes against your [pc.legs] while another wave of masculine cum erupts from her geyser of a cock. Even through the pounding you’re giving her, and the constant state of orgasm, her body is begging you to seed it, and it’s doing that the only way it knows how.");
		output("\n\nYou don’t bother trying to hold off, and you satisfy Nykke’s number-one fantasy by cumming inside her and giving her the seed she so desperately wants.");
		if (pc.cumQ() >= 10000) output(" Your load is more than she was, or could possibly have been, prepared for : with just one load, she’s already so full that your [pc.cum] washes back against you, and you’re not even close to finished. Your emissions would leave any purebred Frostwyrm simultaneously envious of your production, and impatient for their turn. Her normally taut, muscled stomach evens out, then rounds with your seed, her body gluttonous for your every precious drop, regardless of whether any of it can take. Fantasies about having a clutch many times the size of [frostwyrm.name]’s pervade your mind over your connection, and with every fresh, hot load you put into Nykke, the already - fantastic size of your hypothetical clutch doubles on the spot.");
		else if (pc.cumQ() >= 4000) output(" Your load would satisfy even a purebred Frostwyrm (you should hope!), and Nykke is no exception: her lips curl into a lust - drunk smile when she feels you fill her body; her normally - taut stomach evens out underneath the pressure of your load, and your [pc.cum] washes back against you when her womb can take no more. More fantasies of your hypothetical clutch come crashing into you over your psionic connection, and she orgasms yet once more.");
		else output(" You can’t give her as much as a Frostwyrm could, but that doesn’t matter to her, in her state of mind: all she knows is that her mate is coming inside her, and her mate’s sperm will be with her eggs soon. Whether it’ll take or not, you’re going to find out soon.");
		
		output("\n\nEven when you’re done with your orgasm" + (pc.cumQ() >= 10000 ? " and that took you some time" : "") + ", Nykke continues to thrash and cum beneath you, well after her leathery balls have emptied and her cunt is as packed full as it’s going to get. The pleasure you’ve given her is nothing like anything she’s ever contemplated before, and her mind is shut down and blank after such a tremendous orgasm.");
		output("\n\nDisregarding the mess she’s made – and she’s made quite a bit one – you collapse on top of her, trying to get yourself comfortable with her flaccid, thick tail between you and her. Nykke doesn’t move through it all, exhausted and insensate from you having fucked her brains through her ears. You hear what sound like purrs – or maybe snores – coming from her throat beneath you.");
		if (startVer <= 1) output("\n\nYou and Nykke are going to have to have a talk later. You two just met, after all, and she’s already trying to muscle in on you and make you her Qal. But, for now, still high from the sex, you tell Nykke that, if she ever needs you to fulfill another of her fantasies, it wouldn’t be very Qal-like if you do not rise to the occasion.");
		output("\n\nDespite your goading, no fantasies come from her freshly-fucked imagination. Not yet.");
		processTime(10 + rand(10));
		chars["NYKKE"].loadInCunt(pc, 0);
		IncrementFlag("NYKKE_FUCK_HER_CUNT2");
	}
	IncrementFlag("NYKKE_SEX2");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",nykke2CallHer, false);
}
public function nykke2IntroTalk():void
{	
	clearOutput();
	nykke2Header(false);
	var firstTime:Boolean = true;
	if (flags["NYKKE_MET2"] == 1) firstTime = false;	
	flags["NYKKE_MET2"] = 1;
	
	output("You struggle in the Frostwyrmling’s grip with a surge of urgent strength. It yields, although, from the look on its face and the sensation you’re feeling over your psionic link with it, it wasn’t because you overpowered its grip.");
	output("\n\nYou don’t know who raised it, but where you come from, there are things called ‘consent’ and ‘personal space,’ which this creature had just violated. You back away from it, keeping a safe, sensible distance, your fingers twitching, ready to reach for your gear at a moment’s notice if it decides to try and force the issue.");
	output("\n\nYou tell the Frostwyrmling that you’re a loving and devoted Qal to your Qim, and that you’re not exactly willing to break into a polyamorous relationship with a creature you had just met. You don’t even know its name.");
	output("\n\n<i>“Oh, right. My Qal taught me something about ‘introductions’ with non-Frostwyrms. My Qal has named me Nykke. And... Frostwyrms don’t use things called ‘pronouns,’ but I’ve been taught to tell you that I’m a ‘she.’ Whatever that is.”</i> You feel Nykke probe your mind, not unlike whenever [frostwyrm.name] scoured your memories for information. <i>“And your name is... [pc.name] Steele. There; introductions over. Can we mate now?”</i>");
	output("\n\nThe answer is still no.");
	output("\n\n<i>“But I asked politely and everything!”</i> Nykke scours your memories for another moment; you demand that she stops that. You never gave her permission to rummage through your head! <i>“And your Qim. She didn’t ask you politely at all – she beat you in combat, and then gave you an ultimatum. Is that what I need to do, too?”</i> She lowers her stance, her arms wide, and her claws out – her every muscle ripples and flexes, ready to pounce toward you. <i>“If I beat you in combat, would you mate with me then?”</i>");
	output("\n\nOkay, things are going a little too fast, here. You raise your left hand defensively, keeping your right at your hip, close to your gear in case Nykke makes a rash decision. You tell Nykke to calm down – you’re not interested in fighting. And besides: if Nykke saw that [frostwyrm.name] had defeated you in combat, then she must have <i>also</i> noticed that <i>you</i> had defeated <i>her</i> several times first. If a pure-blooded Frostwyrm couldn’t beat you, then a half-breed wouldn’t stand much of a chance.");
	output("\n\nThe accusation of calling her a ‘half-breed’ causes Nykke to visibly disarm: her expression softens dramatically, and her four arms droop to her sides. Knocking her on her race seems to be a sensitive topic for her.");
	output("\n\nNow that she’s calmed down, you invite her to start from the beginning. You <i>properly</i> introduce yourself as [pc.name] Steele, and ask her about herself: where she came from, and why she’s here, in [frostwyrm.name]’s territory.");
	output("\n\n<i>“Right, okay,”</i> Nykke sighs, standing upright in front of you – but keeping a respectable distance from you. <i>“My name is Nykke. I was born around two-hundred Sky Cycles ago. My Qim was a Frostwyrm, like your [frostwyrm.name], while my Qal was... not. He said he was a ‘male Ausar.’ I know what a Frostwyrm and an Ausar are,");
	if (nykkeFrostwyrmTF() || pc.race() == "ausar") output(" so it doesn’t surprise me that your Qim chose you.”</i>");
	else output(" so your Qim choosing you when you are neither is a bit surprising to me.”</i>");
	
	output("\n\nIf Nykke is two-hundred years old, then that means that–");
	output("\n\n<i>“Yes,”</i> she sighs dejectedly, turning her eyes to the oceanic horizon, <i>“both my Qim and my Qal have since joined the Grand Qim. My Qal first, when I was very young, and my Qim about... fifty Sky Cycles ago. I have been wandering the world, singing my mating songs, ever since.”</i> She kicks at the snow beneath her, pointing to it with both her right hands. <i>“I had smelt the presence of another in this territory, and I stalked it until they returned.”</i>");
	output("\n\nNykke steps forward, slowly, looking to you to make sure she has your permission. When you don’t object, she takes another step, now within arm’s reach, and gets to her knees. She gingerly reaches forward, gently taking your wrists in her hands.");
	output("\n\n<i>“And here you are.”</i> Her eyes form pleading crescents, hiding the reds of her irises from view. <i>“I had nearly given up hope on finding a suitable mate. It wasn’t supposed to be this hard to find one. Look, I know that Frostwyrms normally mate for life, but....”</i>");
	output("\n\nShe looks down, across her stomach, to her still-erect Frostwyrm cock, bobbing in the cold air beneath her. She’s pent up, <i>badly.</i> You can’t say you’re surprised – she hasn’t mated in two-hundred years. In fact, if she’s like [frostwyrm.name], she’s probably a virgin, and you remember how frantically [frostwyrm.name] fucked you when she first brought you back to her lair.");
	output("\n\n<i>“Please?”</i>");
	
	pc.changeLust(10);	
	processTime(5);
	clearMenu();
	addButton(0,"Fuck",nykke2IntroFuck, 1,"Fuck","Nykke seems honest enough, and you can hardly imagine what it’s like to be a two-hundred-year-old-virgin. The poor girl desperately needs someone to rock her world, and who better than you, Certified Frostwyrm Fucker?");
	addButton(1,"Talk",nykke2IntroRejection, undefined, "Talk", "You’re still not so sure you’d like to jump straight into the sack with Nykke – it’s going to take more than a sob story and a stiff cock to get into your pants." + (silly ? " Never mind that that’s exactly how [frostwyrm.name] got you, of course." : ""));
}
public function nykke2IntroRejection():void
{	
	clearOutput();
	nykke2Header(false);
	
	output("You grab onto Nykke’s hands and hoist her up, wordlessly imploring her to stand. She does, but as she rises, her expression sinks – she can probably guess that you’re about to reject her.");
	output("\n\nIf Nykke’s Qal really was an Ausar, than she probably has <i>some</i> idea as to how cultures like your own proposition their potential mates. It’s not as easy as just coming up to one with a hard-on and asking them for a few rounds – at least, it <i>usually</i> isn’t – and, although you’re receptive to Nykke and you sympathize with her plight, you’d still like to get to know her a bit better before you jump straight to the nasty business.");
	output("\n\nWith a heavy sigh, Nykke turns towards the nearby snow bank, turns around, and flops her butt into it, the snow billowing up around her as she falls. She makes herself nice and comfortable in her snowy seat and pats an open, empty patch of snow next to her, inviting you to take a seat.");
	output("\n\n<i>“If this is what your Qim had to go through before you mated, then I will do the same,”</i> she says. That’s such a harsh way of looking at it! Talking with and getting to know your mate aren’t supposed to be <i>chores,</i> they’re supposed to provide insight into the person you’re being with.");
	output("\n\nYou sit next to Nykke and, before anything else, ask her what drew her Qim to her Qal. You had to prove yourself to [frostwyrm.name] that you would be a worthy mate, and you wonder if her Qal had to do the same.");
	output("\n\n<i>“No,”</i> she answers. <i>“My Qim was in the hottest depths of their rutting cycle, and my Qal was in the area.”</i>");
	output("\n\nWait – her Qim was in the middle of their <i>rutting</i> cycle? And her Qal was a male?");
	output("\n\n<i>“Correct. They only became mates after my Qal returned to where he first met my Qim after the next Light’s Rise. Apparently, he didn’t mind.”</i>");
	output("\n\nNykke crosses her legs and folds her hands together, resting them on her lap, hiding her flagging genitals from your view. <i>“Any further questions?”</i>");
		
	processTime(5);
	clearMenu();
	addButton(0,"Mates",nykke2TalkMates,undefined,"Mates","Ask Nykke what qualities her ideal mate should have. Should they be strong, or smart, or just virile enough to give her a legendary clutch?");
	if (flags["FROSTWYRM_PSIONICS_TALK"] == 1) addButton(1, "Psionics", nykke2TalkPsionics, undefined, "Psionics", "Ask Nykke about her control over her psionic powers. You can’t say you’ve experienced what it’s like to have them first-hand, after all!");
	else addDisabledButton(1, "Psionics","Psionics","You’re far less educated about psionics than Nykke would be, and you probably shouldn’t go into this discussion without at least a little bit of forethought from [frostwyrm.name] first.");
	addButton(2,"Adventuring",nykke2TalkAdventuring,undefined,"Adventuring","You’ve been to all manner of planets and places by now, while Nykke’s been trapped on Uveto all her life. Maybe she’d like to hear a few stories about your travels.");
	addButton(3,"Black Scales",nykke2TalkBlackScales,undefined,"Black Scales","Ask Nykke about her unique melanin condition. You get the sense she isn’t comfortable with her own body, but maybe, if you help her work through her frustrations with it, she’ll have an easier time accepting herself.");
	addButton(14,"Back",nykke2CallHer,false);
}
public function nykke2CallHer(playIntro:Boolean=true):void
{	
	clearOutput();
	nykke2Header(false);
	
	if (playIntro)
	{
		output("You stand on the eastern Irestead coast, where you had met both [frostwyrm.name] and Nykke shortly after. A very popular meeting spot for dragons, apparently!");
		output("\n\nNykke probably isn’t too far off, knowing that you’ll have to be here if you want to contact [frostwyrm.name] and visit her in her lair. You decide to give the lonely Frostwyrmling a visit – you may have two very special dragons in your life, but until you introduce them to each other, you unfortunately only have one of you to give them your time.");
		output("\n\nPsionically, you reach out to Nykke, asking her to visit you on the coast. <i>Coming!</i> she messages back – and, in mere moments, you hear the flapping of her heavy wings, carrying her towards you. You look up, and you see her muscular form, her wings splitting the light of the nearby planet blotting the sky of Uveto; she sees you, in turn, and dives.");
		output("\n\nWhen she’s nearer to the ground, she flips, tail-over-head, and crashes into the nearby snow bank. The move was intentional, however: her momentum carries her the rest of the way towards you, kicking up snow the whole distance, and when she comes to a rest, she’s lounging in a relaxed, head-on-her-hand, legs-crossed posture, as if she had been sitting there for hours, waiting for you to return.");
		output("\n\n<i>“Hey there,”</i> she says, patting the snow next to her, inviting you to take a seat. <i>“Room for one more right here, [pc.name].”</i>");
		output("\n\nYou laugh and take your seat next to her.");
		processTime(1 + rand(5));
	}
	else
	{
		output("You lounge with Nykke at the base of a snow dune. Normally, laying in the snow wouldn’t be your idea of a relaxing time, but Nykke gives off so much ambient heat that you’re actually fine, no matter the conditions - provided you stay with her. You’d have thought that Frostwyrms were cold-blooded, but if they were, they probably wouldn’t be on Uveto.");
		output("\n\nAs long as you’re with her, is there anything you’d like to say or do?");
	}
		
	clearMenu();
	addButton(0,"Appearance",nykke2Appearance,undefined,"Appearance","Get a better look at Nykke, and see how she differs from your own kip.");
	addButton(1,"Talk",nykke2TalkMenu,undefined,"Talk","Nykke, despite her appearance, is rather old and experienced. Surely she has a unique perspective on life and the world around her, being a Frostwyrmling, and with such a distinct scale condition.");
	addButton(2,"Sex",nykke2SexMenu,undefined,"Sex","Nykke’s been alone for two centuries. She’s probably got one hell of a backlog to work through – why not give her a hand, or maybe some other appendages, to help her out?");
	addButton(3, "Leave", nykke2Leave);
}
public function nykke2Appearance():void
{	
	clearOutput();
	nykke2Header(false);
	
	output("You get a better look at Nykke, currently half-cuddled against you and lounging in the snow, overlooking the ocean.");
	output("\n\nNykke is <i>extremely</i> tall, standing at ten feet tall from sole to scalp, not counting her wings. Similar to any pureblood Frostwyrm, she has six limbs, although they’re shaped quite differently: she walks on two plantigrade feet, and she has four arms: two each sprouting from her left and right shoulders. She has five toes on each foot and five fingers on each hand, although each digit is capped with a razor sharp talon, no less lethal than a Frostwyrm’s, although they’re considerably shorter.");
	output("\n\nHer body is covered in pitch-black scales that glisten darkly in the reflective light of the snow; each scale is about the size of a fingernail, and each scale is as hard as metal. Along her front, going from her lower jaw to the inside of her thighs, she has softer, yielding, malleable dark-gray scales. Although you doubt many conventional weapons would be able to wound her, she has a number of battle scars dotting her frame, from her arms to her legs – she’s lived a wild life on Uveto for over two hundred years, so it only makes sense.");
	output("\n\nShe has a long, thick tail at her coccyx; it’s as thick as her waist at its trunk and it only tapers slightly at the tip, where it’s adorned with blunter spikes, better for bludgeoning than piercing. She has only one set of teeth in her mouth, but like a Frostwyrm, they are each sharp enough to rip apart any armor. Nykke is the perfect hybrid combination of the svelte, flexible, stealthy humanoid form and the power and ferocity of a Frostwyrm; there are few creatures in the universe that would be able to best her in combat, with some appropriate training.");
	output("\n\nFocusing on her gentler features, Nykke’s eyes have pink sclera, ruby-red irises and jet-black pupils. She has a humanoid face, with gentle, smooth cheeks, more similar to skin rather than scales, and an upturned, button nose and two nostrils. She has two thin, jet-black lips that can curl into the most precious – or mischievous – of smiles. Growing from her forehead are a pair of horns that curve sharply over her skull, but don’t reach very far and are blunt at the tip, useless for attacks. And beneath those, she has thin, shoulder-length, dull-blue hair.");
	output("\n\nGrowing from her shoulderblades are two massive wings, with a combined wingspan of twenty feet. When they’re folded behind her, they still reach behind her by about three additional feet, and they have a vertical reach of about eight, extending well past her head. Though they’re large and intimidating, she moves with them comfortably enough, and their thick, leathery musculature easily provides more than enough lift to give her flight.");
	output("\n\nBetween her two powerful legs are a pair of testicles, wrapped snuggly in a taut, leathery scrotum. Each nut is about the size of your clenched fist. Above them is a penile vent; unlike with [frostwyrm.name], it bulges rather obviously with the girth of the penis inside it, even when completely unaroused, acting more like a sheath than a vent. When fully aroused, her penis extends by about a foot from her body, with a girth as thick as your forearm. It’s covered from root to crown with pulsing blue veins, and it has several nubs and pricks all along its underside. The tip is flat and mostly featureless, save for a rim of muscle around its glans, reminding you of a tree trunk. At the base of her penis is a thick knot, bloating her already-impressive size all the larger, to properly tie and breed with whoever her partner is.");
	output("\n\nConcealed behind her testicles is her vagina: the exposed labia are bluish-pink, but it otherwise looks very similar to a vagina of your own kind. It’s appropriately sized for her form, although her body is far more elastic than it appears: it can easily take almost any insertion, including from a pure-blooded Frostwyrm, despite them being twice her size. Unlike [frostwyrm.name], she has a clitoris, extending about an inch or two when fully aroused.");
	output("\n\nThough it’s usually concealed by her tail, she has a large, blue-ringed anus where her tail meets her spine, right where it belongs.");
		
	processTime(1);
	addDisabledButton(0, "Appearance");
}
public function nykke2TalkMenu():void
{	
	clearOutput();
	nykke2Header(false);
	
	output("You ask Nykke if she’s willing to have a chat with you. Surely she has a distinct perspective on some topics that she, as a Uvetan native, would have compared to yours.");
	output("\n\n<i>“Yeah, I don’t mind having a chat,”</i> she says. <i>“Maybe it’ll help get my mind off some... other topics.”</i>");
	output("\n\nAs subtle as a brick, she uncrosses her legs, giving you an eyeful of her exposed genitals – her Frostwyrm cock poking into the cold breeze of the air, accentuated by a pair of thick, low-hanging, full balls – and crosses them again, the other leg on top of the other.");
	output("\n\nGreat, now <i>you</i> hope the conversation will take your mind off other things, too.");
		
	pc.changeLust(10);	
	processTime(1);
	clearMenu();
	addButton(0,"Mates",nykke2TalkMates,undefined,"Mates","Ask Nykke what qualities her ideal mate should have. Should they be strong, or smart, or just virile enough to give her a legendary clutch?");
	if (flags["FROSTWYRM_PSIONICS_TALK"] == 1) addButton(1, "Psionics", nykke2TalkPsionics, undefined, "Psionics", "Ask Nykke about her control over her psionic powers. You can’t say you’ve experienced what it’s like to have them first-hand, after all!");
	else addDisabledButton(1, "Psionics","Psionics","You’re far less educated about psionics than Nykke would be, and you probably shouldn’t go into this discussion without at least a little bit of forethought from [frostwyrm.name] first.");
	addButton(2,"Adventuring",nykke2TalkAdventuring,undefined,"Adventuring","You’ve been to all manner of planets and places by now, while Nykke’s been trapped on Uveto all her life. Maybe she’d like to hear a few stories about your travels.");
	addButton(3,"Black Scales",nykke2TalkBlackScales,undefined,"Black Scales","Ask Nykke about her unique melanin condition. You get the sense she isn’t comfortable with her own body, but maybe, if you help her work through her frustrations with it, she’ll have an easier time accepting herself.");
	addButton(14,"Back",nykke2CallHer,false);
}
public function nykke2TalkMates():void
{	
	clearOutput();
	nykke2Header(false);
	output("You ask Nykke if she’s put any thought into what sort of person she’d want in a mate. If [frostwyrm.name] and her example is anything to go by, Frostwyrms aren’t a disparaging species; being a Frostwyrm is more of a bonus than a necessity, and each Frostwyrm has a different idea of what makes an ideal mate.");
	output("\n\n<i>“Uh... I can’t say I have, I guess,”</i> she says, her two left index fingers tapping on her chin in thought. <i>“I’ve had so many ideas over the Sky Cycles that they’ve all kind of meshed together over time. I guess my first priority would be a mate that can give me an ideally endless number of kips. I’m sure your own Qim wouldn’t disagree.”</i>");
	output("\n\nYou like to think that that’s kind of a blasé way of describing your relationship with [frostwyrm.name]. At the word, you feel Nykke’s psionics probe your mind – she isn’t quite as quick or refined on her skills, and it takes her a moment to understand the definition of the word ‘blasé.’ You tell her that you and [frostwyrm.name] having lots of offspring is just one of the many qualities you fulfill as her mate.");
	output("\n\n<i>“How did your Qim decide for you to be her mate?”</i> she asks. <i>“I could look in your memories and see for myself, but I understand that non-Frostwyrms don’t like that so much.”</i>");
	output("\n\nYou explain that you two met in combat. Nykke hums – she gathered that much at first. It must not surprise her that there can be a bit of a ‘ritual’ when Frostwyrms find a potential mate. You regale that you unknowingly wandered into her territory once, and she mistook that you were trying to invade her space. You never actually asked [frostwyrm.name] why she attacked you; it seems to unimportant, now.");
	output("\n\nAnyway, you bested [frostwyrm.name] in combat. <i>“You, really?”</i> Nykke asks in bewilderment. You answer that you had done it <i>several</i> times, not just once. <i>“But you’re so much smaller than her! And her teeth – how did you avoid getting eaten in one big–”</i>");
	output("\n\nShe finishes the sentence by leaning at you and loudly chomping at the air between you, showing off her own pointed teeth. You insist that it’s true; maybe one day she can ask [frostwyrm.name] herself. There’s more to combat than whether one kind is smaller than another, or whether one kind has larger, sharper teeth and claws. You can go into deeper detail later, if she wants.");
	output("\n\nIn any case, [frostwyrm.name] had established her territory along a route that you regularly travelled, meaning you and she were at odds a number of times. And every single time you won, you let her go, because you didn’t want the blood of something as beautiful as herself on your hands.");
	output("\n\nBut, one day, [frostwyrm.name] managed to get the better of you. And when she had the upper-hand and was in a position to kill you – she didn’t. She recognized you and the fact that you kept sparing her, and she extended the same mercy to you.");
	output("\n\nNykke, despite her halfway-bored expression telling you she’s only modestly interested in your story, is hanging on your every word, her bright red eyes impatiently watching yours every time you pause for effect. To finish your story, you tell her that [frostwyrm.name] recognized your strength, and pined that she hadn’t found another pureblood Frostwyrm like herself, so she decided that you were worthy to breed with her.");
	output("\n\n<i>“Hmm,”</i> Nykke hums, processing your story. You can feel her large heart beat through her chest in excitement – she must like the idea that, if a pureblood Frostwyrm like [frostwyrm.name] would accept you, then she isn’t in the wrong for looking for non-Frostwyrms as well. You ask her if she has any ideas on what her mate should be.");
	output("\n\n<i>“Well, the strength to stand next to a Frostwyrm, for sure,”</i> she says, hugging your form, unsubtly testing how taut your body is. <i>“A proper mate must be able to defend their dwelling and protect their clutch, and if you had the strength to fell someone like your Qim so many times over, I wouldn’t settle for anyone lesser.”</i>");
	if (pc.physique() <= 20) output("\n\nYou thank her for the compliment, but tell her that you’re not nearly the strongest of your own kind. Like you had said earlier, there’s more to combat than just bulk. <i>“Did you outsmart her, then?”</i> Nykke asks, and you say that, in a manner of speaking, you certainly used the right tools for the job. <i>“And you’re so young compared to us! A proper mate should be cunning and intelligent enough to stand with a Frostwyrm, as well.”</i>");
	output("\n\nYou implore her to continue. <i>“A good, proper mate would show compassion, like you had shown to your Qim. You didn’t kill her, even when you could, and when she asked you to help her repopulate her species, you didn’t hesitate. It reminds me of my own Qal and how he met my Qim. A good mate would know when to protect a kind that needs help, and when a battle is over.”</i>");
	output("\n\nNykke breathes sharply through her nose, the air hissing into her nostrils. <i>“And a good mate,”</i> she continues, her six limbs constricting you tighter as her fantasies start to get away from her, her fingers getting a little exploratory, <i>“would be close with every single one of their many, many kips, and spend lots of time with them. They’d ensure that their kips grew up strong enough, and wise enough, to stand with a proper Frostwyrm. And a proper mate would ensure they have a strong sense of the world around them. And... a good mate would</i> never <i>shy away from making more kips with their mate. And a good mate–”</i>");
	output("\n\nYou interrupt Nykke and tell her – with her bright-red eyes locked squarely onto yours, her breath shallow, her fingers still rubbing at you, and her nostrils flaring, likely smelling [frostwyrm.name] on you and driving her wild – that you have a pretty close idea of what, or who, she would consider to be a viable mate.");
	output("\n\n<i>“Then enough with the games, already,”</i> she begs, her voice lilting. It sounded like a particularly... vulnerable request: if you had a stronger psionic link with her, you don’t doubt you’d be inundated with lust, and you’re not sure if you’d be able to restrain yourself as much as she must be now. <i>“It’s</i> torture <i>sitting next to such a viable mate and they won’t");
	if (nykke2SteeleCanSatisfy(1) && nykke2SteeleCanSatisfy(2)) output(" let me get started on a massive clutch with them!”</i>");
	else if (nykke2SteeleCanSatisfy(2)) output(" let me put a kip in them!”</i>");
	else output(" put a kip in me!”</i>");
	
	output("\n\nNykke, as a Frostwyrm herself, knows better than anyone that Frostwyrms mate monogamously. Starting a second family altogether would be taboo among her culture.");
	output("\n\nShe huffs and bites into her lower lip, her eyes scanning the ocean without another word.");
	output("\n\nBut, you continue, if she can be a little more patient... your kind has invented a way to mate <i>without</i> it involving conception, if that’ll at least help her with her urges.");
	output("\n\n<i>“Why in the world would your kind invent that?”</i> she asks, bewildered. <i>“What’s the point of mating if you don’t want kips?”</i>");
	output("\n\nFor the pleasure of it, you answer matter-of-factly.");
	output("\n\nShe crosses her legs again. You catch the distinct whiff of her musk in the salty oceanic air as she does so. <i>“Fine,”</i> she says. <i>“I’ll wait a bit more.”</i>");
		
	pc.changeLust(10);
	processTime(5 + rand(5));
	addDisabledButton(0, "Mates","Mates","You already have a <i>pretty</i> good idea on what Nykke considers to be the perfect mate...");
}
public function nykke2TalkPsionics():void
{	
	clearOutput();
	nykke2Header(false);
	
	output("You ask Nykke how her handle on her psionic strengths are. If she’s a Frostwyrm, and she’s as old as [frostwyrm.name], she must have a strong handle on them by now.");
	output("\n\nThe question is met with a quizzical pause. <i>“I’m... not sure what you’re asking me,”</i> she admits.");
	output("\n\nYou recall that [frostwyrm.name] didn’t have the same approach to psionics as you did, either. In her own words, what you call ‘psionics’ is the skill that Frostwyrms have that allow them to communicate without using words, like you are now.");
	output("\n\n<i>Oh, like this?</i> Nykke asks, her voice projecting into your mind directly. You concur: exactly like that. [frostwyrm.name] also said that Frostwyrms don’t necessarily communicate in words: they communicate in ideas and emotions, and are able to project feelings directly into whoever they’re connected with. You’re still new to the whole thing, yourself.");
	output("\n\n<i>My own Qal had the same reaction to our ability to communicate. I thought he was just incapable, for one reason or another, and I didn’t believe him when he said that communicating like this was a unique skill.</i> Nykke focuses her gaze on you, and you can tell that she’s trying to ‘impress’ something into your psyche – like an idea, or an emotion – but all you wind up feeling is a dull thud in the front of your head. <i>Do you feel anything?</i>");
	output("\n\nYou answer that you don’t. She grunts out loud and stops her attempts. <i>“Talking with our mouths is so awkward!”</i> she curses to the ocean. <i>“And using ‘words?’ What’s the point of communicating at all if you’re going to hide your intentions behind ‘words?’”</i>");
	output("\n\nShe turns to you, her eyes arching and her lips flat, trying to mask her expression as best as she could. <i>“You know, I never questioned my Qim’s affection for my Qal. I could</i> feel <i>it whenever they spoke of him. But neither of us could feel it from him back. He always told us that he’d go to the ends of the ‘universe,’ whatever that was, for us. But we never</i> felt <i>his sincerity.”</i> Her expression quickly sours, as if you had just personally wronged her. <i>“What if your ‘words’ could be used to say something you don’t feel? How do I know that every single word you’ve ever said didn’t</i> truly <i>mean what you felt?”</i>");
	output("\n\nFunny enough, there’s a word in your language for that exact sort of question: you tell Nykke that being unable to inherently trust anyone at their word, and assuming that everyone <i>is</i> a liar because they have the <i>potential</i> to be a liar, is called ‘paranoia.’ It’s true, you can’t convey your emotions as well as she or [frostwyrm.name] can to you, but that doesn’t make you untrustworthy. [frostwyrm.name] relies on you despite of that, and... well, there <i>isn’t</i> a word in your language that can describe how that makes you feel about her.");
	output("\n\nYou consider Nykke and [frostwyrm.name] to be gifted and privileged; being able to communicate to each other so purely is a real gift that should be shared with the world, if they could. There are an untold number of languages out there: if everyone could skip the words and jump straight to the ideas, a lot of barriers would be taken down in a hurry.");
	output("\n\nNykke’s eyes stay on yours, and you unflinchingly stare back, hoping that she’ll find your earnestness in them. Apparently satisfied, she relaxes back into her snowy seat, her tail wagging once beneath her, content in what she found. <i>Do you think you could learn? To communicate like my kind could?</i>");
	output("\n\n[frostwyrm.name] had put it best, when you asked her. In her own words, you are as equally equipped as any Frostwyrm; [frostwyrm.name] doesn’t seem to think you can’t be taught.");
	output("\n\n<i>I could try to teach you,</i> she offers. It catches you by surprise – you hadn’t expected Nykke to be so accommodating.");
	output("\n\nYou reply that you’re supposed to be the Qal, and from what you’ve learned, that means you’re supposed to be the teacher. You’d suppose that, if Nykke went through the effort to teach you to communicate like a Frostwyrm, that would make her the Qal between you two.");
	output("\n\n<i>“Hmmph,”</i> Nykke hums, her hips squirming in the snow beneath her. <i>“That sounds like a great idea to me. Maybe we should skip the lessons.”</i> Her eyes are on you again, narrowed predatorily, and her lips split apart by her tongue, wetting them in a long, languid swipe. <i>“I’m giving you one chance to back out.”</i>");
	output("\n\nYou laugh, and say that you’ll take the lessons. Maybe you can save the happy ending for whether it works out or not.");
	output("\n\nThe next hour or so between you two is spent with Nykke trying to put to words what she does when she uses her psionic focus. What she concentrates on, and how she can filter one thought from another – it’s a far more involved process than you initially thought. The mind takes in so much information so quickly, all while coming up with its own thoughts, ideas, and expressions, that if Nykke weren’t careful and selective and simply let the whole gamut of thoughts across the link, you’d easily confuse yourself for her.");
	output("\n\nHowever, despite your best effort to learn, and Nykke’s best effort to teach, you ultimately don’t come any closer to understanding how psionics work, much less mastering them.");
	output("\n\nYou have a link to [frostwyrm.name], and a minor one to Nykke, but while you are able to receive any thought, idea, expression, or inspiration, it’s a one-way connection for you, and you aren’t able to communicate your own thoughts back across it. Whenever you have a thought, Nykke is able to pick up on it and understand it, but that’s not the same as you projecting it to her.");
	output("\n\n<i>“Are there other kinds in the world that can communicate the way my kind can?”</i> Nykke asks, exasperated from an hour’s worth of diligence with nothing to show for it. <i>“If you can’t do it, and my Qal couldn’t do it, it’s hard not to think that us Frostwyrms might be alone.”</i>");
	output("\n\nYou respond that, as far as you know, Frostwyrms are one of the only kinds that can. Maybe it’s simply a uniquely-Uvetan trait.");
	output("\n\n<i>“No, I don’t agree with that,”</i> Nykke says with some finality, leaning into you, her eyes narrowing determinedly on yours. <i>“I understand what your Qim meant: we’re equally equipped. You</i> should <i>be able to communicate like I can. It’s just....”</i>");
	output("\n\nIt’s just that you can’t?");
	output("\n\n<i>“I don’t know how to explain it. Argh, this is all very frustrating!”</i> she exclaims to the ocean. <i>“It’s not like it’s some secret. I understand what I’m doing; any of my kind would understand if I asked them. But being unable to explain it in a way that another kind that can understand–”</i> In her frustration, she picks up two fistfuls of snow with both her left hands, and hurls them as hard as she can into the water. <i>“‘Words’ were a mistake!”</i>");
	output("\n\nYou lean into Nykke, snuggling yourself against her enormous form to get her to calm down. You thank her for going through the effort for you, and you understand that it’s not easy to do. You liken it to explaining what the color blue is to anyone that hasn’t seen it before.");
	output("\n\nNykke probes your mind, in an effort to understand what you mean, but she isn’t in there for long. <i>“Yes! Exactly like that!”</i> she says, clapping herself on the leg, excited that she can at least vocalize her frustrations. <i>“How in the Grand Qim’s shadow do you explain something so fundamental to someone?”</i> She leans into you, reciprocating the snuggle as she tries to calm herself down. <i>“At least your kind knows how to communicate such frustrations.”</i>");
	output("\n\nThere, you see? Words aren’t all bad.");
	output("\n\nThat gets her to laugh, which is good: you’ve gotten her to calm down a bit. You suggest that you two can try again later, if she’d like.");
	output("\n\nShe ‘tch’s’ at the suggestion, but doesn’t immediately dismiss it. <i>“Maybe in a Light’s Rise or two,”</i> she says. <i>“It’ll give me some time to think about it.”</i>");
		
	processTime(60 + rand(15));
	addDisabledButton(1, "Psionics","Psionics","You had just had a whole ordeal about this! Nykke is still a little peeved over her inability to teach you to use psionics, so it’d be best to not press your luck for more right now.");
}
public function nykke2TalkAdventuring():void
{	
	clearOutput();
	nykke2Header(false);
	
	output("Out of turn, you ask Nykke what she knows about the world.");
	output("\n\nShe has to think about her answer for a moment: she taps at her chin and roams her eyes across the ocean’s horizon, considering how to formulate her response. <i>“I’m told that it’s very large,”</i> she says, after a moment. <i>“I had been wandering ever since I left my Qim’s lair. If the world has an end to it, I’m not sure if I’ll ever find it. Although there are fewer mates in the world than I was expecting to find.”</i>");
	if (nykkeFrostwyrmTF()) output("\n\nYou tell Nykke that you aren’t a Frostwyrm, or, at least, you weren’t always; you were born as a " + pc.originalRace + ". You ask her to guess how many of your kind exist. <i>“Hundreds?”</i> she asks, and you tell her there are more. <i>“Thousands?”</i> More than that. Her eyes squint in concentration. <i>“Hmm....”</i>");
	else output("\n\nYou tell Nykke that you aren’t a Frostwyrm, you’re a [pc.race]. You ask her to guess how many of your kind exist. <i>“Hundreds?”</i> she asks, and you tell her there are more. <i>“Thousands?”</i> More than that. Her eyes squint in concentration. <i>“Hmm....”</i>");

	output("\n\nThere are more of your own kind than she might be able to properly envision: a number so large that she might not be able to understand the magnitude of how many exist.");
	output("\n\nAnd, on top of there being so many of your own kind, there are other worlds out there. Your kind have named the world as Nykke knows it as ‘Uveto;’ you’ve been to so many other planets and interacted with so many other kinds by now, that you’d have a hard time categorizing all of it.");
	output("\n\nYou start simple: you ask Nykke if she knows what it means to be warm. <i>“I do,”</i> she says, and you can tell that she’s relieved that you’re finally using words she understands. <i>“‘Warm’ is what I would feel when I curled up against my Qal.”</i> She leans into you, her two, thick right arms curling around you and pulling her into her muscular frame. <i>“Although I’m sure you can find a way to make me warmer than that, in all your wisdom, [pc.name].”</i>");
	output("\n\nYou tell her that it’s something you’ll consider, but right now, you’re trying to be a teacher to her. To continue, you ask Nykke if she knows what it means to be ‘hot.’");
	output("\n\nYou feel the same tugging at your mind, but ask her to answer in her own words. <i>“Uh...,”</i> she stutters. <i>“No.”</i> You teach her that, basically, ‘hot’ is what happens when you’re too warm. <i>“</i>Too <i>warm? There’s no such thing, is there?”</i> There is, yes: when you’re too warm, it feels like you’re suffocating, and that you’re trapped in your own body. If the air around you is too warm, it hurts to breath; if the ground beneath you is too warm, it hurts to walk. When the warmth is all-pervasive, you can feel like there’s just... nothing you can do to escape it.");
	output("\n\n<i>“But it feels that way if we’re too cold, as well,”</i> she notes. That’s right! If it’s too cold, then it can feel just as limiting and painful. Just as there are places like Uveto that are always very cold, there can be places that are always very hot.");
	output("\n\nNykke considers your words, but from the expression on her face and the low, contemplative growl in her throat, she’s not liking what you’re telling her. <i>“Is there any place that is neither?”</i> she asks; she’s finding it hard to believe that the world – or worlds – can be such difficult, unforgiving places to be. You answer that some places may be too warm, and some places may be too cold, but being able to overcome those obstacles and survive, and even thrive, in such environments is what makes kinds like your own so hardy. And, if Nykke is truly the daughter of an Ausar, she’ll be able to adapt and survive in any environment, too.");
	output("\n\nNow that you’ve properly gotten Nykke hooked on your stories, you continue enthusiastically; you start with your parentage and that you’re an heir to... well, it’d be a difficult to explain in a way she understands, but, in the very barest, lamest terms you can, you explain that your own parent had passed away some time ago, and you’re on a journey to reclaim his own lair for yourself.");
	output("\n\n<i>“You did not stay with your Qim and your Qal until they were summoned?”</i> Nykke asks, and you confirm; your kind typically only stay with their parents until they’re fully matured, and then they set out on their own, to find their own lairs and their own mates. <i>“Now that you mention it,”</i> she says, <i>“my Qal</i> did <i>say something about that. He found it unusual that Frostwyrms would stay with their Qim and Qal until their summoning.”</i>");
	output("\n\nWhen your own father was, as Nykke would understand it, ‘summoned,’ you had set out on a mission to claim what was his for your own. That’s taken you to planets full of lush, dense, green jungle; planets of trashy, difficult, desert terrain and wasteland; deep into dark, rocky caves; and even to very small, man-made planets called ‘stations.’ Uveto is just one of the more recent stops in your mission to claim your inheritance.");
	output("\n\nYou feel something pulling at your mind; a curious, probing sensation, rummaging through your memories, almost the same way that [frostwyrm.name] plucks at your head when you use a word she doesn’t understand. As interested as Nykke is on your stories, she doesn’t understand half the things you’re saying. She probably doesn’t even know what a ‘green’ is, never mind a ‘jungle.’");
	output("\n\nNykke’s eyes widen in her head when she finds your conjured images of what a jungle looks like, and what a station looks like. <i>“I could never have imagined that the world would be such a diverse place. I thought that everywhere was like this,”</i> she pauses, gesturing to the snow and ice around you, <i>“everywhere.”</i> Her psionic ‘pulling’ becomes especially intense when you share the image of a cave with her – something about the darker environment has her attention. <i>“Could I travel to any of these places as well?”</i>");
	output("\n\nYou can feel her imagination running wild in your own head: she doesn’t like the idea of being somewhere that’s too hot, or someplace that’s somehow even colder than Uveto, but she nonetheless wants to explore them for her own. You tell her that she could – there’s nothing saying she couldn’t travel the stars with you, and visit all these new locations with you – but... well, one thing at a time.");
	output("\n\nNykke relaxes her body against you, pulling your cheek up against her firm right boob, as she idly fantasizes about leaving Uveto with you and traveling with you on your adventures. The two of you would travel to these ‘hot’ places; she could fly over the tops of the ‘jungles’ and she would help you navigate the dark ‘caves,’ and then, when you two find a spot that isn’t too warm, or too cold, or too jungle or too cave, she finds the perfect lair, one as big as could be, where she and her mate can raise their own clutch.");
	output("\n\nOf course, this imaginary mate of hers is unmistakably you: every time she takes a breath through her nose, your scent sharply defines yourself in her fantasies, and in those fantasies, it’s you that she settles down with and makes a clutch with. A <i>huge</i> one. One that fills the jungles and the caves until they’re full of nothing but your clutch; you two would find a world that has no Frostwyrms in it, and you’d spread your kind until you are the dominant species.");
	output("\n\nThen, she, in her fantasy, and projected to you through your psionic connection, looks right into your eyes. <i>“I know you can see all this,”</i> she says to you. <i>“It would take time... but we could make all this real, [pc.name].”</i>");
	output("\n\nHer psionic projection of herself grabs you by the hand and takes you to the mouth of your cave, overlooking an expansive jungle, reaching as far into the horizon as any ocean. <i>Imagine it,</i> she says, her hand waving over your visage of the treetops. <i>An entire world, dominated by our prodigy. And once our kips establish themselves as the apex predator of one world, we go and propagate the next.</i>");
	output("\n\nHer body turns towards you, and her Frostwyrmling cock is as erect as could possibly be, bobbing");
	if (pc.tallness >= 96) output(" between your bodies, dripping its pre to the ground.");
	else if (pc.tallness >= 65) output(" right between your eyes, dripping its pre onto your nose.");
	else output(" above your head, dripping its pre onto your [pc.hair].");
	output(" <i>Do not pretend you would not enjoy every last second of it, either.</i>");

	output("\n\nThe psionic vision ends abruptly, and you’re back on cold, unforgiving Uveto, sitting in the snowbank next to Nykke. Her legs and thighs shift against each other, and you can see the beginnings of a half-chub peek from between her thick, muscular thighs. She’s putting in the token effort to hide it, but... you can tell, she wants you to start imagining on your own terms.");
	output("\n\nWell... it’s working.");
		
	pc.changeLust(20);
	processTime(10 + rand(5));
	addDisabledButton(2, "Adventuring","Adventuring","You’ve just talked about this! The idea of traveling the stars and seeing new cultures and peoples is an exciting idea for Nykke. She probably wouldn’t be against going with you some day.");
}
public function nykke2TalkBlackScales():void
{	
	clearOutput();
	nykke2Header(false);
	
	output("Lying as you are next to Nykke, you snake your hand down one of her large, muscular arms, until your hand meets hers. You intermingle your fingers with her claws, and give her hand an affectionate squeeze. Nykke recognizes the action – she probably learned it from her Ausar Qal – and she squeezes back, although you can sense the wonder in why you’d do that.");
	output("\n\nYou tell Nykke that you’d like to talk to her about something, but she doesn’t need to answer if she isn’t ready. You recognize that it’s a bit of a sensitive topic for her.");
	output("\n\n<i>“It’s about my scales, isn’t it?”</i> she asks defensively. You respond affirmatively.");
	output("\n\nNykke says nothing further, and instead lets out a long, heavy sigh, in through her nose and out through her mouth. With the three arms you’re not holding, she lifts her hands to her eyes, so she can get a closer look at her own body. Her onyx-black scales reflect the light of the ocean with a brilliant dark sheen, making it easy to focus on her compared to the whites of the snow and ice and the blues of the water.");
	if (nykkeFrostwyrmTF()) output("\n\n<i>“You haven’t had to live a life like mine, so you wouldn’t understand,”</i>");
	else output("\n\n<i>“You’re not a Frostwyrm, so you wouldn’t understand”</i>");
	output(" she says sombrely. Rather than contest her, you remain silent, patiently waiting for her to continue. <i>“Frostwyrms... we develop our connections – you call them ‘psionics’ – when we’re still in the egg. We can feel everything our Qims and Qals feel before we’re even really born. I don’t remember a lot from when I hatched, but....”</i> Her fingers shake in her three outstretched hands. She lowers them, folding them over her stomach, so she doesn’t have to look at them anymore. <i>“I remember what they felt when they first saw me.”</i>");

	output("\n\nAs a Qal yourself, to a beautiful " + (flags["FROSTWYRM_KIP_COUNT"] == 1 ? "kip" : "clutch of kips") + ", you can imagine what they had felt. Concern over her health; worry over her development; but, most of all, total, unyielding, unconditional love for their kip.");
	output("\n\n<i>“Frostwyrms are a very emotional kind,”</i> she says. <i>“I, uh... it was tough for me to look at my Qim and wonder why I was so different from them. The first few Sky Cycles, it was hard for me not to look at my reflection in the ocean and not consider myself a f-... a freak.”</i>");
	output("\n\nNykke takes another, longer, deeper sigh through her nose. She’s mastered her psionics, but... perhaps because of her half-Ausar upbringing, you can feel her control on herself slipping. You can feel a sort of cutting pain in your heart – it’s very slight, but if you’re feeling it, you can only imagine what Nykke has been suppressing for the last two hundred years.");
	output("\n\n<i>“Why did your Qim choose you?”</i> she asks suddenly. <i>“[frostwyrm.name] had her choice of any Frostwyrm in the world, but she chose you. Do you think she gets... I don’t know, lonely? Knowing she’s the only pureblood Frostwyrm in her clutch?”</i>");
	output("\n\nYou respond, with all sincerity, that [frostwyrm.name] has never once wanted for company since she took you on as her mate, and she had you as her Qal. <i>“Even though you’re not " + (nykkeFrostwyrmTF() ? "pure-blooded, " : "") + "like her?”</i>");
	output("\n\n[frostwyrm.name] sometimes likes to remind you that you weren’t her first choice in mate. She had spent much of her life searching for another Frostwyrm like herself, but in all her searching, she couldn’t find one, and she had to ‘settle’ for you.");
	output("\n\nBut, you continue, she <i>also</i> likes to remind you that she doesn’t regret her choice in the very least. If she could go back in time, and she knew everything she knows now, and she found a pure-blooded Frostwyrm to mate with, she’d choose to mate with you, every single time.");
	output("\n\nYou tell Nykke that it doesn’t matter to [frostwyrm.name] that you’re different than her; you may not be a " + (nykkeFrostwyrmTF() ? "pure-blooded " : "") + "Frostwyrm, but you’ve given her a beautiful, healthy, strong " + (flags["FROSTWYRM_KIP_COUNT"] == 1 ? "kip" : "clutch") + ", and you’ve filled the gap in her heart with your affection and attention as a doting mate.");
	output("\n\nAnd, you say as you squeeze Nykke’s hand, it doesn’t matter what <i>she</i> looks like, either. [frostwyrm.name] wanted a clutch, and she knew she was taking a risk committing herself to you – neither of you were sure you’d be able to make it work. Nykke said it best: Frostwyrms are a highly emotional kind. You’re confident that [frostwyrm.name] would tell her that ‘compatibility’ isn’t a priority: what Nykke should want in a mate is someone that can provide her with the same affection she’s capable of putting out.");
	output("\n\nYour words are having an effect on Nykke, but she’s not totally convinced.");
	output("\n\n<i>“I haven’t found a mate in fifty Sky Cycles, [pc.name],”</i> she says, with a bit of punch behind her voice. It’s a difficult, emotional topic for her, and she’s forcing herself to talk about it. <i>“Imagine wandering the world for that long, with no mate and no lair to settle in. Every song I sung died in the winds. For fifty Sky Cycles! It–”</i> She chokes at her next word, and then starts again. <i>“I couldn’t find any other Frostwyrms</i> anywhere. <i>My Qim had told me that we were a plentiful kind, with no shortage of potential mates. I had to–”</i>");
	output("\n\nHer voice lilts, and pitches upward. You had never seen a dragon cry before today.");
	output("\n\n<i>“Either my Qim was wrong – or even worse – or all the Frostwyrms in the world were ignoring me. And if my Qim</i> was <i>being false to me, and if the Frostwyrms</i> were <i>ignoring me, it would be because I looked like this.”</i> She stretches two of her hands in front of herself, and then slaps the back of her own hand. <i>“Who would – who would want to mate with a freak like me?”</i>");
	output("\n\nShe raises her hands to slap herself again, but you grab her by the wrist.");
	output("\n\nYou tell Nykke that you’re a Qal, and from everything you’ve learned from Frostwyrm culture, you’d know exactly what her own Qal thought of her. It doesn’t matter if her scales were white, or black, or green or purple or whatever; he wouldn’t let something as small as the tone of her scales get in the way of him loving <i>his kip.</i> Her scales may not be white, and you and he may not be " + (nykkeFrostwyrmTF() ? "pure-blooded " : "") + "Frostwyrms, but none of that would matter to either of you.");
	output("\n\n[frostwyrm.name] and her own Qim threw ‘standards’ and ‘traditions’ to the wind when they chose their mates, and, you can tell her with all positivity, you’d much rather have [frostwyrm.name] as your mate, and Nykke’s Qal would rather have her as her kip, as you both are than to have you be ‘normal’ just for the sake of being ‘normal.’");
	output("\n\nIt’s not about what she looks like. [frostwyrm.name] has proven to you that being a pure-blooded Frostwyrm is more of a bonus than a prerequisite. You don’t know what happened that made Frostwyrms such an endangered species after all this time, but Nykke is living proof that there is no shortage of potential mates in the world for her to choose from. Mating isn’t just about the sex: it’s about togetherness with someone that loves you and accepts you. You tell Nykke that she can find love on Uveto – hell, it might even be closer than she thinks. She might just have to follow her Qim’s, and [frostwyrm.name]’s, examples and look outside her species.");
	output("\n\nThe sensation of relief comes through much more clearly, now that you’ve given her some perspective on your love for [frostwyrm.name] and the love she had from her own Qim and Qal. You can still sense just a tinge of apprehension, like a tick that refuses to let go, and you’re not certain if you’ll ever be able to get that out of her, but, apart from that, you can tell that Nykke is satisfied with your answer.");
	output("\n\nShe rests her head against yours, gazing out to the sparkling ocean before you two, and her hand squeezes yours tighter. There are a couple of obvious questions she wants to ask you, but they’re for another time – right now, she just wants to think about her parents.");

	pc.changeLust(10);		
	processTime(5 + rand(5));
	addDisabledButton(3, "Black Scales","Black Scales","You aren’t sure if Nykke will ever <i>truly</i> be satisfied with the color of her scales... but now she knows that, to you, and to her own Qim and Qal, it never mattered what she looks like.");
}
public function nykke2SexMenu():void
{	
	clearOutput();
	nykke2Header(false);
	
	output("You regard Nykke, her body curled and cuddled up against you; her naked, powerful form rocks and breathes against you, her scales brushing against your [pc.skinFurScales] gently. You admire her Amazonian muscles and the tightness of her body; your hand idly strokes at the muscles at her thigh, slowly making its way towards the cleft of her crotch. When your fingers tickle at a part of her leg that’s warmer than the rest, she fidgets in the snow.");
	output("\n\nYou can feel her prod at your mind psionically, looking for what your actions mean in your culture – and when she finds it, she coos, and you can see her Frostwyrmling cock start to sprout to life over the ridge of her thick leg. <i>“Finally,”</i> she sighs, and she hefts her massive body over yours, trapping you between the snow and her muscular body. Her massive, heavy, F-cup breasts bear down on your [pc.chest], her pebbly-blue nipples digging into your form. <i>“Not that I mind the bonding, but every moment I go without a good, hard mating just reminds me that I’m not being mated. It’s a vicious cycle.”</i>");
	output("\n\nHer thick, heavy tail makes broad, downward swings into the snow, loudly thumping her approval into the air around you. You can’t see her cock, with your vision thoroughly blocked by her breasts, but you can feel it get harder, hotter, heavier, and longer with every slow, impatient thrust of her hips against yours.");
	if (pc.hasCock()) output(" It frots against yours" + (pc.isCrotchExposed() ? "" : " right through your [pc.lowerGarments]") + ", rousing yourself to action as well.");
	else output(" Like a heat - seeking missile, it finds your [pc.vagina " + rand(pc.vaginaTotal()) + "]" + (pc.isCrotchExposed() ? "" : ", right through your [pc.lowerGarments]") + ", and she grinds the thick of her pole against you, readying you for the thorough thrashing she’s ready to give you.");
	output(" And you <i>are</i> getting ready....");

	output("\n\nTwo of Nykke’s huge hands come down on either side of your head – not as a show of force or dominance, but it keeps you from thinking of backing out. You’ve projected to her that you’re ready and willing, and that’s all the signalling a horny, neglected dragon like her needs.");
	output("\n\nThat said, you can tell, she’s inexperienced. As ready as she is, she’s still very... pliable to suggestion. If you wanted to have her a certain way, you doubt she’d put up any resistance – all she knows is that she wants you, and she doesn’t care how.");
		
	processTime(2);
	clearMenu();
	if (pc.cockThatFits(chars["NYKKE"].vaginalCapacity(0)) >= 0) addButton(0,"Fuck Her",penisRouter,[nykke2SexFuckHer,chars["NYKKE"].vaginalCapacity(),false,0],"Fuck Her","Nykke might be thinking with her dick, but you’re sure that every single part of her needs some special attention. Maybe she’ll hike her tail up for you and give you the chance to show her how a Qal like you fucks a dragon.");
	else if (pc.hasCock()) addDisabledButton(0, "Fuck Her", "Fuck Her", "You don’t have a cock that fits her!");
	else addDisabledButton(0, "Fuck Her", "Fuck Her", "You can’t do this if you have nothing to fuck her with!");
	if (pc.cockThatFits(chars["NYKKE"].analCapacity()) >= 0) addButton(1, "In Her Ass", penisRouter, [nykke2SexInHerAss, chars["NYKKE"].analCapacity(), false, 0], "In Her Ass", "It might not be as ‘productive’ as fucking her pussy, but surely, as a Frostwyrm, Nykke would be eager to learn all the alternative ways a mate can pleasure their better half. Consider it a lesson on how to be a good mate.");
	else if (pc.hasCock()) addDisabledButton(1, "In Her Ass", "In Her Ass", "You don’t have a cock that fits her!");
	else addDisabledButton(1, "In Her Ass", "In Her Ass", "You need a penis to be able to fuck her butt!");
	if (pc.hasVagina()) addButton(2, "Take Her", vaginaRouter, [nykke2SexTakeHer, chars["NYKKE"].cockVolume(0), 0, 0], "Take Her", "The way her Frostwyrmling cock is grinding against you, you’re not thinking of any reason to deny her giving a proper, willing, wet hole to slide herself into. You almost can’t wait, yourself....");
	else addButton(2, "Take Her", nykke2SexTakeHer, -1, "Take Her", "Nykke is so pent up from having gone so long without a proper hole to fuck, it almost makes you guilty that you don’t have one to give her. Maybe you can turn around and offer her the next best thing....");
	addButton(14,"Back",nykke2CallHer,false);
}
public function nykke2SexFuckHer(kok:int=0):void
{	
	clearOutput();
	nykke2Header(true);
	
	output("Your own [pc.cock " + kok + "] nudges and grinds against hers, fighting for the attention between you two. You tell Nykke that you’re sure she’s eager to flip you over and fuck the daylights out of you – but, if she’s anything like [frostwyrm.name], you know she has a more feminine half that needs some attention just as badly. You can give <i>all</i> of her body the attention that it needs.");
	output("\n\nNykke hums in thought at the statement. Her tail swishes behind herself again, thumping into the snow – and then it drags forward and backward, digging a single, thick line into the snow behind her. She takes a deep breath through her nose, and her body tenses – you have a pretty good idea of what her tail is doing to herself, inspired by your idea.");
	output("\n\n<i>“Fine, you’ve convinced me,”</i> she says, and then disengages from you, lifting her body off you and returning to her own spot in the snow, face-down. She folds her four arms beneath her body, and she hikes her tail straight up, until it curves upward and over her back – giving you a perfect, unimpeded look at her pearly, moist gash and her winking asshole, both flanked by a pair of heavy, churning Frostwyrmling nuts. <i>“Teach me how your kind mate, [pc.name]. We Frostwyrms are a very... demanding kind.”</i>");
		
	nykke2IntroFuck(2,kok,-1);
}
public function nykke2SexTakeHer(hole:int=-1):void
{	
	clearOutput();
	nykke2Header(true);
	
	output("Your hands travel down Nykke’s sides, feeling the tightness of her Frostwyrm muscles and the way they combat themselves as she holds her position above you. You ask her what her first instinct is, now that she’s above you, with her body barrelling on top of you, and her cock grinding against you. If she knew what she wanted... how would she take it?");
	output("\n\nAt the question, all four of Nykke’s hands strike forward, gripping you by the arms" + (!pc.isNaga() && !pc.isTaur() ? " and legs" : "") + ". She’s strong enough to restrict you, and, when she leans back and lifts you off the snow, she’s strong enough to lift you, but her grip is conscientious enough that she doesn’t bruise you. You’re as comfortable as her total manhandling of you can be – and, from the poking you’re feeling at your [pc.belly], it seems like Nykke’s made her decision on how she wants you.");

	nykke2IntroFuck(2,-1,hole);
}
public function nykke2SexInHerAss(kok:int=0):void
{	
	clearOutput();
	nykke2Header(false);
	
	output("You reach downward – you have to stretch a bit, Nykke is very tall – and you run your hand along Nykke’s thick, muscular flank, where her legs meet her body. There’s very little give in her toned, experienced frame, but when you touch her and feel her tough body, she flinches. She’s inexperienced, and she’s never had a mate touch her intimately before.");
	output("\n\nYou tell her that, if she’s willing, there’s an ‘alternative’ method to pleasuring her mate, if she’s willing to learn. It won’t result in kips, but if she’s willing to approach it with an open mind, it can be just as pleasurable as mating traditionally. Any mate will tell her that a good mate is one that’s open to all forms of coupling.");
	output("\n\nNykke, however, doesn’t have much patience for your riddles, and you feel her probe your mind, searching for what it is you mean. In her search, she finds a conjured image of you behind her, her tail hiked up and over your shoulder, while you fuck her asshole with everything you have.");
	if (flags["NYKKE_FUCK_HER_ASS2"] == undefined || flags["NYKKE_FUCK_HER_ASS2"] == 0) output("\n\n<i>“Ah,”</i> she says, with a higher tone than you had expected. <i>“My own Qal enjoyed this method of mating very much, as well. I was always curious why that was.”</i>");
	else output("\n\n<i>“Ah, of course,”</i> she says, remembering the last time you had done this with her. <i>“I don’t know if it was</i> better <i>than mating traditionally, but... I certainly didn’t <i>mind</i> it.”</i>");
	
	output("\n\nNykke gets off you, one limb at a time, and then returns to her own spot in the snow, pressing herself face-down into it. She looks at you coyly as, like in your imagination, her thick, powerful tail arcs upward, reaching over her back and towards her head, revealing to you her glistening pussy and her flexing asshole, both ready for the taking.");
	output("\n\n<i>“I understand this isn’t very usual among your kind,”</i> she says, swaying her hips back and forth in front of you. <i>“Frostwyrms don’t mate this way, either. Consider yourself privileged, [pc.name].”</i>");
	output("\n\nYou pull yourself to your [pc.knees] and shuffle behind her, investigating her exposed rear-end. Her Frostwyrm dick is long enough that its head presses evenly against the snow, and is thick enough to be confused for a third leg; her heavy balls jostle and flinch in impatience, her sack flexing and relaxing, knowing that you’re inspecting them; her bluish-pink vagina winks at you, beads of her lust pooling along her taint and dripping down her curvaceous balls; and her puckered blue anus pulsates, unsure if it likes the way you’re looking at it....");
	output("\n\nYou tell Nykke that, if she ever feels uncomfortable at any point, then she needs to tell you. You’re not going to rely on your psionic connection with her to know.");
	output("\n\n<i>“I said I’d do it, already,”</i> she says, her hips swaying for you, enticing you to pick something to pleasure her. With that set, you lean forward, your own [pc.cock " + kok + "] hard as can be, and you poke it at her asshole.");
	output("\n\nShe flinches and freezes in place, instinctually understanding that this isn’t proper. You gentle shush her and stroke at her thighs as your [pc.cockHead " + kok + "] continues to prod at her, easing against her. This may not be how to properly mate, but having sex this way can be just as pleasurable as it can be ‘properly’ – maybe even moreso, if she’s one of the freakier types. She just needs to relax, and you’ll make sure she loves it.");
	output("\n\nShe does as you say, and does her best to relax her body and allow you into her. True to your word, you’re gentle, treating her body like it was made of brittle wax instead of the raw, unbridled Frostwyrm muscle she is; your [pc.cockHead " + kok + "] spears into her, and you stop, with just the tip inside her. When she acclimates to you, you push in, just another couple inches, and you repeat the stop-and-go process.");
	output("\n\n<i>“T-this feels...”</i> she says, her four arms crossed and folded beneath her. She repeats the words every time you push a little further into her. She’s not telling you to stop, and her body isn’t fidgeting or tensing like she doesn’t like it, so, you don’t.");
	output("\n\nYou’re around halfway down to your [pc.base " + kok + "] after the third push into her.");
	if (pc.cocks[kok].cLength() > 9) output(" Frankly, you’re surprised she’s managed to take you this far without trying to back out: you’d think she’d have at least <i>some</i> experience with anal play, considering how little noise she’s making, but, just in case, you don’t say how much is left. You don’t want to intimidate her.");
	else if (pc.cocks[kok].cLength() > 5) output(" It’s not very far, especially compared to how huge Nykke’s body is, but she’s tight as a vice, and, you’re sure, she’s thinking you’re as big as a Frostwyrm right now.");
	else output(" It’s not very far, especially compared to how huge Nykke’s body is, but she’s tight as a vice, and, you’re sure, she’s thinking you’re as big as a Frostwyrm right now.");
	
	output("\n\nYou settle at that distance for now, and begin to pump against her, sawing your [pc.cock " + kok + "] halfway down, then back out. Her body remains still, and her breathing grows shallow and sharp; you hear the sound of her claws shovelling into the snow as her hands clench in pleasure beneath you.");
	output("\n\nRunning your hands over her expansive, tight ass as you slowly sink into it, you ask Nykke how she’s feeling, and the sensations she’s experiencing. You could just as easily feel it over your psionic connection, but you want her to enunciate it. You tell her to feel how it is to be bent over; to be in such a vulnerable position, knowing that she can trust you; and, especially, how it feels to enjoy sex without mating, like you’re doing right now.");
	output("\n\n<i>“This feels...”</i> she tries to say again, but the words just won’t come. You’re patient with her; to help her relax, you lean over her and plant several kisses along the underside of her tail, hoping that the closeness will get her to open up a bit. <i>“It’s... so different.”</i>");
	output("\n\nYou ask her if ‘different’ is bad, in this case.");
	output("\n\n<i>“No,”</i> she answers quickly. <i>“I can see the appeal.”</i> She shifts a bit, unconsciously, causing your [pc.cock " + kok + "] to shuffle inside her, which hits different, more sensitive muscles in her ass. She takes a deep, sharp breath through her nose, then sighs in pleasure. <i>“I never considered mating like this before.”</i>");
	output("\n\nYou tell her that most kinds don’t; it’s a bit of an... acquired taste, for sure. You haven’t even done this with [frostwyrm.name], although that’s not because you haven’t asked. You’re sure she’d let you if you did.");
	output("\n\nAt your Qim’s name, Nykke looks over her shoulder towards you, her ruby-red eyes focusing on yours. Her eyes are half-lidded in lust, but her gaze is nonetheless steely and resolute, determined on you. <i>“Take me,”</i> she demands. <i>“Let me feel all of you inside me.”</i>");
	output("\n\nShe wants you, in part because she wants you; in part because it’s genuinely pleasurable; and, in part, to prove something, either to you, or to [frostwyrm.name] (when she isn’t here to defend herself), or to herself. Whatever the case, you don’t hesitate to acquiesce Nykke, and you thrust into her, sinking the remaining distance into her tight, eager asshole.");
	output("\n\nNykke hisses through clenched teeth, her head resting on her two right forearms, her wings flapping lopsidedly, as you pound into her. Your two hands grip onto her muscular thighs like handles so you can fuck her down to your [pc.base]; you batter yourself against her upturned rump, pulling out far enough to leave just the tip, and then sinking down hard enough so that " + (pc.balls > 0 ? "your [pc.balls] audibly clap against hers." : "your [pc.hips] slap against her, sending rippling shockwaves across her body."));
	output("\n\n<i>“Yes!”</i> she shouts. <i>“More! Teach me the pleasures of your kind!”</i> At that, you lean over her already-prone body and hook an arm around her tail, your palm pressing into her spine to keep her in place and to give you more leverage. With your new positional power over her, you brutalize her asshole as best you can" + (pc.cocks[kok].cLength() >= 10 ? ", and, if you were to guess, she’ll definitely need some time to recuperate, at the very least." : "."));
	output("\n\nThe pretences of this being a learning lesson on the pleasures between two mates has long since passed: Nykke gets the picture, and she wants you to fuck her ass as badly as you do. The sound of your clapping bodies beating together dissipate over the ocean, punctuated every now and again by a high-pitched ‘ah!’ whenever you hit her from a slightly different angle.");
	output("\n\n<i>“My... Qal!”</i> Nykke chokes out, her tongue lolling from her open mouth, licking the snow beneath her. You feel a hot, wet burst of fluids against your [pc.legs], along with a clenching in her body; she’s cumming, her pussy spasming and milking nothing, her internal muscles pushing against your [pc.cock " + kok + "] rhythmically. Beneath her, her iron-hard cock, its head still flatly pressed against the snow, shoots thick bubbles of cum down its length; they burst from her cock head and wet ‘splorch’s, painting the ice with a quickly-growing puddle of her Frostwyrm jizz.");
	output("\n\n<i>“Seed me,”</i> she whimpers, her voice weak from the pleasure. <i>“I need your seed, [pc.name]. I don’t–”</i> She pauses, her voice no longer able to keep up with her body. Despite that, she continues psionically, knowing that you probably want to hear her say it as badly as she wants to say it. <i>“It doesn’t matter that it won’t be for my eggs. I need your seed! I need to feel you, inside me, on me, with me! No matter when or where or how; I need to be your mate!”</i>");
	output("\n\nYour body responds to her plight, and you join her, your world drowning in the pleasures and ecstasies that is Nykke’s huge, draconic ass.");
	if (pc.cumQ() >= 10000) output(" In a stunning display of why you are the Qal and why [frostwyrm.name] has chosen you to foster her lineage, you absolutely <i>soak</i> her insides with your [pc.cum]. The first-of-many hefty loads bursts into her, and you can feel even her taut, powerful form bloat and flex just a bit in time with your seed; it pours down into her, rounding and even inflating her normally-taut stomach, and you still have yet more to give her. She gasps in pleasure, her eyes rolling into her skull, as she tries to remain conscious of her surroundings and the pleasures you’re giving her; she tries to clench her body, to keep any of your [pc.cum] from backwashing out of her asshole, but it’s no use, and your seed jets back against you when her body can simply hold no more.");
	else if (pc.cumQ() >= 4000) output(" You satisfy her thirst, and then some: your [pc.cock " + kok + "] bloats again and again, unloading thick gouts of your [pc.cum] directly into her body. She sighs deliriously, sinking into herself, as she feels your jizz pour down into her, cascading along her inner workings until she can’t feel it anymore. Greedily, she has the sense to keep herself clenched on your length, to prevent anything from slipping out between you.");
	else output(" You might not be able to cum as much as a Frostwyrm, but as soon as your [pc.cum] soaks her insides, Nykke’s mind melts in satisfaction, knowing that you’ve marked her. She can feel your jizz trickle down into her body, and that’s all she needs to know that her needs have been fully and totally met.");
	
	output("\n\nWhen it’s over, and you’re all jizzed out, you withdraw from her greedy, gripping asshole with an elongated slurp, leaving Nykke face-down ass-up in her lair. She’s panting in exertion, a lazy smile on her face and her eyes unfocused on anything" + (pc.cumQ() >= 10000 ? ", and she rubs at her tummy every now and again as your cum settles inside her." : "."));
	output("\n\nYou rub your flagging erection in between her asscheeks, hotdogging her a bit and wiping the excess juices off in the cleavage of her butt. You almost rhetorically ask if she understands the pleasures your kind are capable of; as expected, you get some bumbling, jumbled, indecipherable mess of a response.");
	output("\n\nWith your work done and your position <i>thoroughly</i> asserted, you take your familiar position next to Nykke, allowing her to cuddle up against you as she normally does. It takes her a moment to register where you are at all, and when she does, her movements are automatic and instinctual, as her six limbs slowly coil and wrap around your body to keep her close. A throaty resonance reverberates from her constantly: she’s purring, satisfied with you and your exemplary performance. You doubt she’s going to be forgetting <i>that</i> particular lesson anytime soon.");
	output("\n\nIn fact, you’re sure, if you were to ask her for another round right now, she’d probably be all for it....");
		
	IncrementFlag("NYKKE_FUCK_HER_ASS2");
	IncrementFlag("NYKKE_SEX2");
	processTime(10 + rand(10));
	chars["NYKKE"].loadInAss(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",nykke2CallHer, false);
}

public function nykke2Leave():void
{	
	clearOutput();
	nykke2Header(false);
	
	output("You tell Nykke that, as much as you enjoy being here with her, cuddling in the snow, you have other things to get to. Unfortunately, your life as a non-Frostwyrm doesn’t give you the amenities to spend all your time lounging around.");
	output("\n\n<i>“You’re leaving?”</i> Nykke asks, her eyebrows curling into arches. You get the sensation that Nykke hadn’t entertained the idea that you’d leave her.");
	output("\n\nYou tell her that you’ll be back for her soon. She shouldn’t travel too far from the coast – when you want to meet with her again, you’ll reach out to her.");
	output("\n\nStill, Nykke is apprehensive, and her hands cling to you when you stand from the snow. But, she relents and releases you, allowing you to leave her. <i>“Are you certain?”</i> she asks, and you tell her you’ll do her one better: in your language, if you ‘promise’ something, it means that she has your word that you’ll be back for her. So, you promise.");
	output("\n\n<i>“Alright,”</i> she says, satisfied with your answer. She stands alongside you, and gives her massive, Amazonian body a thorough shake, whisking all the snow off her back. <i>“Come to the coast when you want to see me again.”</i>");
	output("\n\nWith that, she spreads her wings, and with a powerful flap, she’s off the ground, billowing snow every which direction as she does. She gives you one last look before she takes off, arcing over a nearby snow dune, and she disappears.");
	
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}