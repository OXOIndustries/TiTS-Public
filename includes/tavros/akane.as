/* Flags:
 * SHUKUCHI_TAVROS_ENCOUNTER
 * -0: Chased, hasn't talked yet
 * -1: Chased, never talked
 * -2: Chased, talked
 * -3: Didn't chase
 * SHUKUCHI_MHENGA_ENCOUNTER
 * -0: Got rekt
 * -1: Guy beat up
 * -2: Guy beat off
 * SHUKUCHI_UVETO7_ENCOUNTER
 * -0: Got rekt
 * -1: Guys beat up
 * -2: Guys beat off
 * SHUKUCHI_FOURTH_ENCOUNTER
 * -0: U ded bro
 * -1: Ow my wallet
 * -2: Ow my everything
 * -3: Oh my everything ;););)
 * SHUKUCHI_FOURTH_ENCOUNTER_TIMESTAMP
 * -Self-explanatory. I hope.
 * AKANE_VISITS
 * -Times visited akane
 * AKANE_FUN_VISITS
 * -Times "visited" akane *wink wink nudge nudge*
 * AKANE_LAST_FUN_VISIT_TIMESTAMP
 * AKANE_TIMES_SHOCKED
 * AKANE_TIMES_WHIPPED
 * AKANE_TIMES_FORCED
 * AKANE_TIMES_RIDDEN
 * AKANE_TIMES_TALKED_HER
 * AKANE_TIMES_TALKED_YOU
 * AKANE_TIMES_TALKED_HISTORY
 * AKANE_TIMES_TALKED_MODS
 * AKANE_TIMES_TALKED_HOST
 * AKANE_TIMES_TALKED_RIVALS
 * AKANE_TIMES_TALKED_US
 * AKANE_RIVALS_TIMESTAMP
 * 
 * Status Effects:
 *  Brutalized:
 *   v3: healable?
 *   - -10% all resistances in Creature.getHPresistances
 *   - -10% all damage in calculateDamage
 *   - Doubles travel time in move (game.as)
 *  Tenderized:
 *   - +40% lust resistances and -20% kinetic electric resistances in Creature.getHPresistances
 *  Sore Tubes:
 *   - Damages owner when Creature.orgasm is called
 *  Stinging Bruises/Lash Marks:
 *   v1: damage to deal
 *   v3: healable?
 *   - Damages owner when appereance, move are called (if they're the pc)
 *   - Should also damage when swapping items, but I'm lazy and it's not in yet
 * */

public var akaneBrutalizeIcon:String = "Icon_Slow";
public var akaneSoreIcon:String = "Icon_Water_Drop";
public var akaneWhipIcon:String = "Icon_Crying";
public var akaneTenderIcon:String = "Icon_Paralysis";
 
public function showAkane(nude:Boolean = false, showAuthor:Boolean = true):Boolean
{
	author("SoAndSo");
	showName("\nAKANE");
	showBust("AKANE" + (nude ? "_NUDE":""));
	return false;
}

//NEED TO ACTUALLY MAKE THIS
//UPDATE: ACTUALLY MADE THIS
public function pcIsPainslut():Boolean
{
	return pc.hasPerk("Akane's Painslut");
}
 
public function pcReadyForPainsluttery():Boolean
{
	//Can't become a painslut twice... can you?
	if (pcIsPainslut()) return false;
	if (pc.isPregnant()) return false;
	if (!pc.hasStatusEffect("Sore Tubes")) return false;
	if (!pc.hasStatusEffect("Tenderized")) return false;
	if (!pc.hasStatusEffect("Lash Marks")) return false;
	if (flags["AKANE_TIMES_TALKED_HER"] == undefined) return false;
	if (flags["AKANE_TIMES_TALKED_YOU"] == undefined) return false;
	if (flags["AKANE_TIMES_TALKED_MODS"] == undefined) return false;
	if (flags["AKANE_TIMES_TALKED_HOST"] == undefined) return false;
	if (flags["AKANE_TIMES_TALKED_RIVALS"] == undefined) return false;
	if (flags["AKANE_FUN_VISITS"] == undefined || flags["AKANE_FUN_VISITS"] < 9) return false;
	return true;
}

public function hasAkaneEffects(includeHealed:Boolean = true):Boolean
{
	return hasAkanaEffects(includeHealed);
}
public function hasAkanaEffects(includeHealed:Boolean = true):Boolean
{
	if (pc.hasStatusEffect("Sore Tubes") && (includeHealed || pc.statusEffectv4("Sore Tubes") == 0)) return true;
	if (pc.hasStatusEffect("Tenderized") && (includeHealed || pc.statusEffectv4("Sore Tubes") == 0)) return true;
	if (pc.hasStatusEffect("Lash Marks") && (includeHealed || pc.statusEffectv4("Sore Tubes") == 0)) return true;
	return false;
}

public function akanePainslutTrigger():void
{
	clearMenu();
	clearOutput();
	showAkane(false, true);
	
	IncrementFlag("AKANE_VISITS");
	
	output("As you’re walked through the doors, the same old sights of artisan rock pools and a view of the throne greet you.");
	output("\n\nInstead of waiting for you to be lead to the center, you hear Akane’s telltale <i>click-clacking</i> heels approaching you.");
	output("\n\n<i>“Hold it, let me see [pc.himHer],”</i> she asserts, the sounds of much heavier feet moving away from you as hers come closer.");
	output("\n\nYou wait patiently while she presumably eyes you over, adjusting your posture to allow her a better view. You hear her move from side to side then behind you, all the while ummming-and-arring with her own thoughts.");
	output("\n\nSeemingly from nowhere, cold fingertips latch onto your [pc.face] and the sharp, overwhelming energy of Akane’s ‘touch’ sears itself into your nerves!");
	output("\n\nYour body reacts before your mind does as everything seems to freeze in place. Instead of buckling in a pile, you stand firm and in place as the ephemeral current blazes through your [pc.skinFurScales].");
	output("\n\nIn a flash, it ends. Akane’s warmed fingertips slip away from your head.");
	output("\n\nYou lean forward out of reflex, whining with orgiastic agony as that touch - that pure <i>feeling</i> - that Akane provides cuts you on the deepest level. You almost can’t tell where pain ends and pleasure begins...");
	output("\n\n<i>“Perfect...”</i> comes her murmur from behind. You feel the cooling metal of fingers rest upon your shoulders, a gentle squeeze following. Your body almost shivers as she does, the anticipation for a loving shock forcing you to react to... nothing.");
	output("\n\nJust the soft squeeze of her fingers.");
	output("\n\n<i>“There, there, I think that reaction speaks on its own, hm? That little shiver of expectation, the way your fingers curl...”</i> whispers the domme into your ear, a knowing tone to her words.");
	output("\n\nHer fingertip lands on your right temple and slides against your [pc.skinFurScales]. Taken unawares, the intense, pinpoint pain that you remember returns and spreads throughout your mind.");
	output("\n\nAnd you want more.");
	output("\n\n<i>“I think I can now declare you... <b>my painslut</b>. You’re so attuned to me that I could slap you and you’d cum on the spot, wouldn’t you? So filthy and debased, I love it.”</i>");
	output("\n\n<b>(New Perk Gained: Akane’s Painslut)</b>");
	output("\n\nThe blindfold slips away from your eyes, the warm white light of the throne room taking over your senses.");
	output("\n\n<i>“And nooow,”</i> she purrs, darting in front of you with her body pressed against yours. <i>“You’re coming with me, [pc.name].”</i>");
	
	pc.createPerk("Akane's Painslut", 0, 0, 0, 0, "Your body is attuned to Akane’s methods of pleasurable pain. You have a chance to gain bonus Defense every time you take HP damage which increases with lower health... but you’ll also take additional lust damage. With higher lust, you gain bonus defense!");

	addButton(0, "Uh...", akaneSexOptions);
}

//A copy of pc.mf() for painslutness
public function painslutornot(painslut:String, notslut:String):String
{
	if (pcIsPainslut()) return painslut;
	else return notslut;
}
 
public function shukuchiKFineUSawSomethingMail():String
{
	var body:String = "To " + pc.short + " Steele with the humblest of greetings,";
	body += "\n\nThank you for your time! We at Celeritas Veritas have been keenly aware of your exploits along the Rushers frontier and we have a very, <i>very</i> beneficial deal for you!";
	body += "\n\nWe are an exclusive brand of hi-tech combat solutions, with clients dotted all over known space! Some names include Baryonical Ltd, Power of MechMercs™ and even the illustrious Host Shukuchi! And as you are quite obviously a person of ability and speciality, we can guarantee an answer for your questions in our full range of specialist weapons.";
	body += "\n\nAs an added incentive and show of goodwill, we have included an exclusive loyalty card in this email! Gratis!";
	body += "\n\nIf you’re interested in our offer, our Celeritas Veritas representative operating from Tavros Station will be waiting! Our stall will be on the Merchants deck, a short walk from Mi Amour.";
	body += "\n\nIf you don’t find us, <b>we will find you.</b>";
	body += "\n\nHead Office, Celeritas Veritas LTD.";
	body += "\n\n<i>Your codex beeps as an attachment auto-downloads to your device. True to the email, it appears to be some sort of loyalty card program, one that registers as having 58008 ‘points’ on it, whatever that means.";
	body += "\n\nIt seems that your investigation has yielded something after all!</i>";
	
	return body;
}

public function akaneCeleritasVeritasAvailable():Boolean
{
	
	return (flags["SHUKUCHI_FOURTH_ENCOUNTER"] == undefined && !pc.isPregnant() && MailManager.isEntryViewed("shukuchi_veritas") && 13 <= hours && hours < 18);
}

public function akaneLairAvailable():Boolean
{
	return (flags["SHUKUCHI_FOURTH_ENCOUNTER"] != undefined && flags["SHUKUCHI_FOURTH_ENCOUNTER"] == 3 && GetGameTimestamp() > (flags["SHUKUCHI_FOURTH_ENCOUNTER_TIMESTAMP"] + (24*60)));
}

public function akaneCeleritasVeritasTheLegitimateBusinessBonus():Boolean
{
	if(akaneCeleritasVeritasAvailable())
	{
		output("\n\nYou spot a short male human in a very pristine suit standing behind an elaborate display of weapon models. While at first it seems to be a haphazard shop, it appears to merely be a stand for advertising wares: actual weapon selling would be a difficult thing to do on Tavros. There are two black-suited security guards milling around with unwavering, stern faces at odds with the salesman’s cheerful appearance.");
		output("\n\nThe sign on the front says Celeritas Veritas...");
	
		addButton(0, "Investigate", akaneEmailMeeting, undefined, "Investigate", "You know, the last few times you did this, they all got away in the end. They might not be so elusive this time around. But you’re gonna do it anyway, right? Ya big ol’ space hero, you.");
	}
	else if (akaneLairAvailable())
	{
		output("\n\nYou spot a short male human in a very pristine suit standing behind an elaborate display of weapon models. While at first it seems to be a haphazard shop, it appears to merely be a stand for advertising wares: actual weapon selling would be a difficult thing to do on Tavros. The representative you remember is still there, smiling away as punters stop to look at catalogues and weapon models. He spots you and gives a friendly wave. You could visit Akane at any time if you speak to him, it looks like.");
		if (flags["AKANE_LAST_FUN_VISIT_TIMESTAMP"] + 24*60 > GetGameTimestamp())
		{
			output(" However, as you walk up to him, he raises his hand in a ‘stop’ sort of motion.");
			output("\n\n<i>“Ah, the boss is resting for today. You may return the next day, " + pc.mf("Mister", "Miss") + " Steele,”</i> he says in a flat voice, still wearing that smile.");
			output("\n\nWell shit, guess she tires out easily.");
			addDisabledButton(0, "To The Lair");
		}
		else addButton(0, "To The Lair", akaneVisitLair, undefined, "To The Lair", "Get taken to the Shukuchi hideout...? Or is it more like a residence? <i>Where</i> is it? Oh who knows. You just wanna see Akane again for whatever reason.");
	}
	
	return false;
}

public function akaneEmailMeeting():void
{
	clearMenu();
	clearOutput();
	author("SoAndSo");
	
	output("As obvious a bait as this is, you’ve been too close to exposing and busting open this unseen syndicate that it’s time to play to your strengths: kicking down doors and blowing shit up!");
	output("\n\nWith a little flex of your arms,");
	if (pc.hasBreasts()) output(" a squeeze of your [pc.chest] and [pc.hips],");
	output(" you prep up for whatever’s to come next. You’ve experience with their tactics, methods and motives, the only thing to do is to not slip up.");
	output("\n\nAs if it were any other shop or vendor, you stroll up to the display and eye over the various ‘wares’ on sale. Likely most of these are part of a front, you posit, although the presentation is very authentic...");
	output("\n\n<i>“Anything I can help you with, " + pc.mf("sir", "madam") +"? Anything at all?”</i> comes a voice from your left, the diminutive man in the suit now suddenly within handshaking distance. Sneaky...");
	output("\n\nYou turn to face him, his beaming salesman’s smile and clasped hands inviting you to speak. You have a quick lookover: no more than 5\' 7\" at a guess, broad shoulders exacerbated by a pinstripe black suit. A trimmed, greying beard and short-sides haircut paint him as a veteran at this role.");
	output("\n\nYou start by saying you’re interested in some wares but would like to know more about previous buyers.");
	output("\n\n<i>“Anyone specific, " + pc.mf("sir", "madam") + "? A brand such as ours works on reputation alone,”</i> he replies, gesticulating in a rather delighted manner.");
	output("\n\n<i>“Host Shukuchi. They must need <b>very</b> advanced equipment for what they do, all that on-the-fly invisibility...”</i> you say casually, palming a decommissioned display pistol. That namedrop should get his attention.");
	output("\n\n<i>“Ahaaa, well in the interest of exclusivity, I do have... mock prototypes for consideration if the right clientele gain an interest, based on our previous clients specifications. May I say, " + pc.mf("sir", "madam") + ", that you strike me as such a buyer! If you would... show me your loyalty card,”</i> he continues, going from jovial to inquisitive.");
	output("\n\nYou tap away on your codex, a display screen showing the suspicious and seemingly useless card you received in the email. You show it to the rep, his hands still clasped together as if inspecting some sort of intriguing cake.");
	output("\n\n“Very good, very good, " + pc.mf("sir", "madam") + "! Our designers and researchers would love to have you on board, if you’d step this way,”</i> says the rep, bowing slightly and lifting his arms to a large, brightly lit open door behind the display.");
	output("\n\nYou willingly walk over to this door with the smiling rep trailing behind, mindful of the artifice of this entire event. There hasn’t been another situation where you couldn’t win on your terms, you think: this Host Shukuchi is going to get a taste of Steele-branded justice! ");
	if (silly) output("Steele-branded and Steele-hard! <i>So fucking hard, <b>NNNGGGG</b></i>. ");
	output("Or at least a strong telling-off from the law...");
	output("\n\nAs you approach the door, you wince as the bright lights of the connecting corridor seep into your eyes. You raise an arm to cover yourself, the image of the world around you seeming blurry and harsh...");
	output("\n\nThere’s a <i>swipp</i> of air from behind then<i><b>BNNKKK</i></b>");

	addButton(0, "Guhhh...", akaneGuuhhh, undefined, "Guhhh...", "Uuuunnhhh...");
}

public function akaneGuuhhh():void
{
	clearOutput();
	author("SoAndSo");
	moveTo("GAME OVER");
	showName("\nHUH...?");
	
	output("Mmmhhh...");
	
	processTime(6*60);
	
	addButton(0, "Hhhhuh...", akaneGuuuhhhh, undefined, "Hhhhuh...", "Mmmm...?");
}

public function akaneGuuuhhhh():void
{
	clearOutput();
	author("SoAndSo");
	
	output("Waaaay....uhhhh....");
	
	addButton(0, "Whatsat...?", akaneGuuuuhhhhh, undefined, "Whatsat...?", "Who...?" + (silly ? " WHATCHU TALK BOU’ WILLIS" : ""));
}

public function akaneGuuuuhhhhh():void
{
	clearOutput();
	author("SoAndSo");
	
	output("Waaaakkkke.... Uppppp...!");
	
	addButton(0, "Up...?", akaneFinallyShowsUp, undefined, "Up...?", "Me...?");
}

public function akaneFinallyShowsUp():void
{
	clearOutput();
	showAkane(false, true);
	
	output("<i>“Wake up.”</i>");
	output("\n\nYou jerk and twist in shock as reality knocks you out of your sleepy daze. You can’t help but blink and wince as the ambient light bombards your senses. Even the light’s heat feels like an intangible, oppressive sensation against your [pc.face] and [pc.skinFurScales]. Just how long were you out to be this sensitive, fuck...");
	output("\n\nAs your eyes adjust, the first thing you’re aware of is <i>pain</i>. An ache in every limb joint, especially in your [pc.hips], hammered down with the sluggishness of waking up in such an odd way, some sort of tight, rough feeling covering your [pc.chest], abdomen and pelvis... are you naked?? The usual weight of your [pc.gear] is definitely gone, replaced with a motionless, cool air.");
	output("\n\nYou feel a shiver and a chill as the rest of your body comes to, the ambience of... wherever you are reminding you of a clinically controlled environment.");
	output("\n\nThe fuzziness fades from your vision as you blink away the moisture.");
	output("\n\nYou can see a ceiling that’s flat, red and wooden. You try to move your head around to get a better look but <i>accch</i>, something is catching you by the back of the head! Too tired to fight it, you swivel your eyes around instead: obscured white light that blooms in every corner, long shadows of humanoid figures static against grey and brown walls.");
	output("\n\nSounds of water trickling across stones dance around your ears...");
	output("\n\n<i>“Awake yet?”</i> chimes a breathy, feminine voice. The malaise of unconsciousness melts away as a gravitas - a <i>fear</i> - weighs down on your mind.");
	output("\n\n<i>“Aaanghh...”</i> you mumble, realizing that your jaw is locked in place and your tongue held down by something solid: a gag...?");
	output("\n\nOn instinct, you try moving your arms and [pc.legs], only to find that all of them are held in place too! You wriggle your arms and fingers, getting a feel for whatever’s holding them in place: joined at the elbows...");
	output("\n\nYou pull timidly downwa-<i>ach!</i>");
	output("\n\n...and to your neck, it seems.");
	output("\n\n<i>“Cheo? Release,”</i> says the voice, the sudden tension holding your head pushing it forward to face the mysterious speaker. Now you can see everything: the floor, your [pc.legs] ");
	if (pc.isNaga()) output("coiled up in");
	else output("spread apart underneath you and pinned down by");
	output(" red rope, the stone floor you’re bound to. That rope forms a complex - looking bind, starting at your bare pelvis, stretched tightly across your [pc.belly] and then arrayed in a strange pattern across your [pc.chest].");
	output("\n\nYou’re fully bound and vulnerable.");
	output("\n\n<i>“Peek-a-boo, up here,”</i> comes a melodious chide, your peripheral vision catching a hand gesturing for your attention. You follow the hand, some part of you hoping it will lead to where the voice is coming from.");
	output("\n\n<i>“Thaaaat’s it, eyes up,”</i> says the voice, now given a form as your eyes lay upon your captor.");
	output("\n\nShe, whoever she is, sits on an archaic-looking chair made of wood and red silk. You’d be tempted to say ‘throne’ if it weren’t so oddly modest and small. The voice’s figure seems to ooze egoism and arrogance from her perch, however: a well-dressed and sophisticated femme fatale, perhaps in her 40’s, with long, black gloves and boots...");
	output("\n\nWait no, cybernetics? You can make out the joints in her wrists, knuckles and ankles. Sleek and angular; instead of normal human feet, everything below the ankle turns into a stylized boot-shape with a pin-point heel.");
	output("\n\nShe taps her metallic fingers against her knee.");
	output("\n\n<i>“Still with us? Let’s make things clear, then: your only danger is non-cooperation. I’ve a <b>very</b> willing cadre of throat-slitters on all sides of you; a few words is all they need. Don’t tempt them,”</i> she states flatly, leaning her chin on her fist. <i>“Just nod if you’re intending to play along.”</i>");
	output("\n\nYou nod twice, your neck still stiff. You keep your eyes focused on the queen bee - her own gaze is an unwavering, deadpan stare right back at you.");
	output("\n\n<i>“Cheo? The gag,”</i> she commands, unseen hands grappling some sort of lock on the back of your head. It slips easily out from your [pc.lipsChaste], a string of drool leaving in its wake. Fresh air hits your bone-dry throat and it makes you wince again.");
	output("\n\n<i>“Sooo, care to explain why you’ve been disrupting our business partners?”</i> she enquires, an undercurrent of menace in her otherwise nonchalant tone.");
	output("\n\nBusiness partners...? You only saw shady, illegal behaviour while hopping from hub to hub. By chance, you add. In all cases, it was civic duty.");
	output("\n\n<i>“Mm, </i>‘civic duty’<i> [pc.heShe] says,”</i> chides the crime boss, idly playing with her jacket’s zipper. <i>“Disrupting privately owned business is, at the very least, worthy of a stint in a white collar cell. And yet you chase our brothers through the streets of Tavros, ");
	if (flags["SHUKUCHI_MHENGA_ENCOUNTER"])	output("beat another to the floor");
	else output("challenged another to a fight");
	output(" and then ");
	if (flags["SHUKUCHI_UVETO7_ENCOUNTER"]) output("beat down two more operatives");
	else output("lost to two more operatives");
	output(" later before <b>willingly</b> taking our open bait. Is this something along the lines of civic duty or the acts of a deranged lunatic? What were you thinking?”</i> she asks, gently rubbing her forehead as she recounts every event.");
	output("\n\nHuh... there’s not really an answer to that. ");
	if (silly) output("You were just clicking buttons to see what would happen next!");
	else output("You were following the threads and hoping to rely on yourself like always!");
	output("\n\n<i>“Whatever answer you have doesn’t even matter, I have to decide on how to be rid of you,”</i> she sighs, flicking her hair away from her face.");
	
	addButton(0, "Uhhh...", akaneChoice, undefined, "Uhhh...", "Habeas corpus...?");
}

public function akaneChoice():void
{
	clearOutput();
	showAkane(false, true);
	
	output("But what about intent to disarm and not kill?");
	if(flags["SHUKUCHI_MHENGA_ENCOUNTER"] || flags["SHUKUCHI_UVETO7_ENCOUNTER"]) output(" What about letting the operatives go?");
	if (flags["SHUKUCHI_TAVROS_ENCOUNTER"] > 1) output(" Ensuring their fox-morph ‘client’ was left well enough alone and safe?");
	output("\n\n<i>“And I’ve already thought of something,”</i> interrupts the queen bee, cutting your questions off.");
	output("\n\n<i>“You can either pay your dues with a generous donation to our little group, submit to a physical punishment of equal value, allow me the use of your body or - if you truly <b>do</b> have a death wish - an honorable execution. The choice is yours,”</i> she finishes almost as an afterthought, her ultimatum ringing about your head. <i>Execution....?!?</i>");
	output("\n\nShit... what do you choose?");
	if (silly) output(" One of them makes you a tumblrite, the others make you a raging InCel.");
	
	addButton(0, "Execution", akaneShootMe, undefined, "Execution", "This is exactly what it means. Serious. I dare you to press it, <i>I dares ya</i>.");
	addButton(1, "Donation", akaneChargeMe, undefined, "Donation", "You’ll lose a lot of money in exchange for not dying, sounds good!");
	addButton(2, "Allow Use", akaneShockMe, undefined, "Allow Use", "Although vague, this probably has something to do with your current outfit.");
	addButton(3, "Punishment", akanePunchMe, undefined, "Punishment", "Perhaps the softest option judging by her tone... this most likely means you’re getting beaten black and blue.");
}

public function akaneShootMe():void
{
	clearOutput();
	showAkane(false, true);
	
	output("You stare defiantly at your unnamed captor, having decided that this is the only solution for some reason: you would rather die than give her what she wants.");
	output("\n\n<i>“And you’re quite serious, are you?”</i> she asks, her brow furrowing as she tries to fathom whatever reasons you have for wanting this.");
	output("\n\nYou nod of course, having already made up your mind. 100%, this is exactly what you want. Yep.");
	output("\n\nNo regrets.");
	output("\n\n<i>“Fine. Cheo? Clean shot,”</i> she commands, a rough hand gripping you by the back of the head.");
	output("\n\nWith clenched teeth, you bear it all as the whine of a laser powering up clouds your ears.");
	output("\n\nYou regret everything.");
	output("\n\n<i>PHHHHIIIIII-</i>");
	output("\n\n...");
	output("\n\n...");
	
	badEnd("(Bad end!)");
}

public function akaneChargeMe():void
{
	clearMenu();
	clearOutput();
	showAkane(false, true);
	
	output("You’ve no interest in either of the other choices, preferring to get this over with as quickly as possible and to be done with it all. Although, now stripped of your codex, you’re not sure how you can do all this...");
	output("\n\nYou begin conveying this to the head honcho but she raises a hand to interrupt you.");
	output("\n\n<i>“Hold on, hold on. Cheo, bring [pc.hisHer] things, I’m sure we don’t need to waste words,”</i> she says lazily.");
	output("\n\nOne of the agents brushes against you, masked with black armor like all the others. You spot a tail of three-color fur: black, white and toffee brown... wait.");
	output("\n\nHopefully he doesn’t hold a grudge.");
	output("\n\nYou watch him disappear around some sort of sliding screen, his movements barely making a sound as he does. You jiggle around in place as the cool air starts becoming cold, the rope bindings feeling coarse against your [pc.skinFurScales].");
	output("\n\n<i>“Ohhh of course. Yan, help [pc.himHer] out,”</i> says the queen bee, flicking her mechanical fingers in your general direction.");
	output("\n\nYou wince as the rope goes slack around you and the ache of the awkward pose recedes into a tingling burn in your muscles.");
	output("\n\nAs you shed the rope, you try standing up fully, a little bit on the wobbly side from your ‘time out’ in dreamland.");
	output("\n\n<i>“Hmhm...”</i> murmurs the crime boss, a full view of your <i>everything</i> now on display. Her black irises scour your nude form, the mere act is an invasion against your already exposed body. You’re unfazed... "); 
	if (pc.willpower() < 39) output("on the outside.");
	else output("a weaker mind would recoil under that glare.");
	output("\n\nThe one called Cheo comes back in short order, a bundle of your gear in his arms. Your codex sits on top, looking more vulnerable than even you. The mob boss beckons over Cheo, scooping up the codex with a swivel of her wrist.");
	output("\n\n<i>“Mm, haven’t seen one of these in a while,”</i> mumbles the fascinated femme, fingertips gliding across the surface of your device. Cheo holds your belongings in a haphazard lump. The jolting image of his blank mask lingers as you pick up and put back together all the things that were taken from you. ");
	if (!pc.isNude()) output("You’re no stranger to having your clothes off but given the relative hostility, you turn yourself around to get changed into your [pc.gear] instead of continuing to bare all. ");
	
	var debt:int = Math.ceil(pc.credits*0.2);
	pc.credits -= debt;
	if (debt < 3000) output("<i>“Quite a shoestring you live by, hm? Tech like this in the hands of someone so underfunded... not my place to judge,”");
	else if (debt < 20000) output("<i>“Thank you for the donation, I’m sure that our most modest organization can put it to good use,”");
	else if (debt < 100000) output("<i>“My word, what a lovely donation. I can almost feel the goodwill leaping off of you,”");
	else output("<i>“And now that I feel completely justified in accepting this <b>sizable</b> donation, it seems perfectly fine to let you go,”");
	output("</i> she says plainly, tossing the device back to you.");
	
	output("\n\nYou clutch at it with shaky hands and after a frantic check, something sinks in your chest as you read your credit balance: all that hard-earned money...");
	output("\n\n<i>“And now that’s out of the way, I’ll also add that... we’ll never cross paths again, I assure you. Goodbye now,”</i> waves the mob boss, her eyes drifting off into some other direction.");
	output("\n\nBye? How do do you get back to the ship? How wi-");
	output("\n\n<i><b>BNNKK</b></i>");
	
	addButton(0, "Next", akaneWhereAmIWheresMyMoney, undefined, "Next", "You’re all for secrecy and everything but getting knocked out each time is a bit much.");	
}

//CONFIRM NO BUST
public function akaneWhereAmIWheresMyMoney():void
{
	clearOutput();
	author("SoAndSo");
	moveTo("TAVROS HANGAR");
	processTime(6 * 60);
	
	output("You jerk awake, finding yourself atop some generic crates and storage boxes. Right outside your ship...");
	output("\n\n...How’d they even know where it was?");
	output("\n\nWhatever, at least you’ve got everything. <i>Mostly</i> everything...");
	output("\n\nWith those cash stores a little bit lighter and whatever lessons learned firmly buried under a layer of despondence, you set your sights on furthering your adventures.");

	flags["SHUKUCHI_FOURTH_ENCOUNTER"] = 1;
	
	addButton(0, "Leave", mainGameMenu);
}

public function akaneShockMe():void
{
	clearMenu();
	clearOutput();
	showAkane(false, true);
	
	output("You’ve no interest in losing hard-earned gains and even less in dying for no reason. At least ‘allow use of’ couldn’t be anything crippling or along the lines of mutilation... right?");
	output("\n\nBiting the bullet, you tell her that you’ll allow her to use your body.");
	output("\n\n<i>“Really now...? Cheo, Yan, help [pc.himHer] to my room. Gently now,”</i> she begins, her voice livening up a little in the process. <i>“We’ve already given [pc.himHer] the warm welcome, after all...”</i>");
	output("\n\nTwo hands grasp your shoulders and another two the rope binding your arms and wrists. They prompt you to stand, which you have to do slowly as the ache in your [pc.legs] takes a few seconds to pass.");
	output("\n\nYou quickly turn your head to the both of them: same black masks, outfits, yet judging from their sleeveless attire, one is a pale human and the other is an ausar. White, black and toffee brown fur... hang on.");
	output("\n\nIf he’s who you think he is, ");
	if (flags["SHUKUCHI_MHENGA_ENCOUNTER"] > 0) output("you can’t help but notice the irony of the situation, at least for a moment...\n\n");
	else output("you’re sure that he couldn’t give you more of a beating than he already did, so nothing to fear, right...\n\n");
	if (pc.tallness > 84) output("You have to keep your head bowed low as you’re lead behind another screen: the overall size and space of this hideout seems set to be unfriendly to taller beings. ");
	output("They push you forward by the shoulders, forcing you along the pathway before you.");
	output("\n\nYou haven’t even had time to take in your surroundings before. This ‘throne room’ is long and straight, a stone pathway from one end to the other. The walls are grey with wooden beams and pillars forming uniform patterns. On both sides of the path are two shallow rock pools in artisanal formations, crystal waters forming the ambience of the room.");
	output("\n\nThe ‘throne’ sits on top of wooden steps, with little other decoration. To either side of the throne are two sliding doors, the pathway splitting off to a T to meet them. You’re guided towards the left door, which slides open on its own accord with a quick <i>schwii</i> sound. The room on the other side seems a little... dark...");
	output("\n\n<i>“Go on in,”</i> comes a voice from overhead. You turn around to see the mob boss rubbing her thumb against her cheek, grinning as she does.");
	output("\n\nYou watch her slink off of the seat, her faux-heels <i>clack-clacking</i> against the stone floor behind you.");
	output("\n\nYou get a forceful shove from both agents, one that makes you stagger forward into the room.");

	addButton(0, "Fuh-!", akaneShockMeAlready);
}

public function akaneShockMeAlready():void
{
	clearOutput();
	pc.lust(pc.lustMax());
	showAkane(false, true);
	
	output("The bright, chilled atmosphere of the throne room seems to turn to night as you go through the doorway, the hearty push from the agents is just enough to throw you off balance. With your arms still bound, you’ve nothing to grip on to!");
	output("\n\nYou stumble to the ground, your [pc.knees] stopping you from falling onto your [pc.face]. The light from the throne room casts your shadow across the darkwood floor, showing a kneeling, buckled silhouette of the real you.");
	output("\n\nThe door slides to a sudden close, cutting off the light.");
	output("\n\nYour eyes scan the room around you.");
	output("\n\nThere’s an outline of a bed of sorts, a wall of what seems to be...weapons and weapon shafts, hooks lining the walls and ceiling. All this bathed in the pale blue light of a dimmed LED floor-lamp. The lamp swells before reaching its full intensity, the brightness not quite enough to deter you from looking away. It reveals things in slightly more detail but the room is still dark and eerie enough to put you on edge.");
	output("\n\nWhat’s going to happen...?");
	output("\n\nThinking about it, why rope of all things for restraints? You try to tug and pull at the bindings from behind, only running into the same problem from before: you’re far too restricted to do much aside from awkwardly [pc.walk] where you’re lead.");
	if (pc.isTaur()) output(" Even with your tauric frame, your [pc.legs] are the only source of free movement.");
	output("\n\nAs you glance over the hooks in the ground once more, a thought hits you: this has to be some sort of play dungeon.");
	output("\n\nAnd you just agreed to be the toy.");
	output("\n\nSteeling ");
	if (silly) output("(lololololololololololol) ");
	output("yourself against the thought, you gingerly push yourself up with your [pc.feet] to full height, figuring that if you’re going to be used, the least you can do is make it a challenge.");
	output("\n\nYou jerk around as the door slides open again, the white light stinging your eyes again. The slender, ultra-femme shadow of the mob boss hangs in the doorway.");
	output("\n\n<i>“What a feast for the eyes, ”</i> exclaims the shadowed figure as she prowls forward, the sliding door closing and floor lamp brightening in tandem. She walks with her fingers tapping her chin, the other robo-hand held behind her back.");
	output("\n\nYou briefly consider retaliating with sarcasm, given her disturbingly playful approach to things. Right now though, you’re focused on what she might have planned for you. You keep your thoughts to yourself, [pc.eyes] focused on her as she slinks around and inspects her prize from a distance.");
	output("\n\n<i>“Name?”</i> she asks, her left pinky finger tugging at her lower lip.");
	output("\n\nIt’s only a name, after all.");
	output("\n\n<i>“[pc.name]. [pc.name] Steele,”</i> you say slowly while keeping your head up, watching as the pinky finger sinks slowly into her mouth. Out of the corner of your eye, you notice her right knee rub against the other.");
	if (silly) output(" Well jeez, if it’s <b>that</b> easy to get you aroused, lady, you can say more names if you want... like <i>Grzegorz Brzęczyszczykiewicz</i>.");
	output("\n\nShe removes her finger from her mouth.");
	output("\n\n<i>“[pc.name]. I see... I wonder if I’ll remember it in the morning,”</i> she sighs, bridging the distance between you while glancing over her own hands and fingers. You puff out your chest as she does so, instincts telling you to brace yourself.");
	if (pc.hasBreasts()) output(" You see her smirk at the inadvertent thrust of your [pc.chest] and [pc.nipples] towards her, your nose flaring as she reacts.");
	output("\n\n<i>“Oh don’t be like that, [pc.name],”</i> she coos, her hand darting for your shoulder!");
	output("\n\nYou inhale sharply and tense up in response, expecting a harsh grab or grapple. Instead, she begins... stroking it, the smooth tips of her metallic fingers soothing the [pc.skin] on top and massaging the muscle underneath. It still takes a few seconds for you to relax, your heart rate jumping up just ever so slightly.");
	output("\n\n<i>“See? I’m just a gentle old soul. You needn’t think of this as punishment, more of... an experience, shall we say,”</i> she half-whispers, her voice breaking into a sultry husk as she holds your shoulder in place. You try to avoid eye contact, the need to focus becoming wordless and blurry in your mind.");
	output("\n\nYour [pc.skinFurScales] prickles as another set of smooth, cold fingers trails down your spine. The hand stops just short of your [pc.ass], instead coming to a very comfortable rest against your [pc.hip]. You stay firm, however, no matter how gently or calmly she teases your flesh.");
	output("\n\n<i>“Still not willing to play along? Fiiiine, fine, I suppose a tender caress isn’t everyone’s bag,”</i> she concedes, her mild and playful tone giving way to a sigh as her hands let go of you. The cool metal feeling is replaced with ever-so-slightly warmer air, another tingle prickling through those groped areas.");
	output("\n\n<i>“Just get it over with, I’m ready,”</i> you bite back at her, avoiding her eye contact as she slinks around to face you. Out of the corner of your eye, you see an open palm speed for your face-");
	output("\n\n<i>“Ah ah, hold it, hold it,”</i> half whispers the mob boss, her entire right hand splayed and fitted to your [pc.face]. You almost recoil from the motion as the contact of her fingertips give you a cold, hard reason to pause.");
	output("\n\nYet there’s a genuine throb in your veins, as if hit by a static shock. That throb grows, your muscles stiffening and contracting even though you’re not using them! A primitive instinct begs you to look for the danger, the cause: your eyes stop wandering as they meet the dark, grinning glare of the mob boss.");
	output("\n\n<i>“The name’s Akane. Say it back to me.”</i>");
	output("\n\nAt once, every part of you burns with an intense pain! Every muscle locks in place, ");
	if (pc.isGoo()) output("every bit of [pc.skinColor] goo-flesh");
	else output("every bone");
	output(" and nerve fighting to tear themselves away from you as electric shocks wrack every conceivable part of you!");
	output("\n\nThe loss of control is immediate: you can’t even scream as paralysis takes over your throat and lungs!");
	output("\n\nYour [pc.feet] ");
	output((pc.hasLegs() ? "give" : "gives"));
	output(" way and the physical connection of you and her are kept together as you fall to a kneel. Panic sets in: no arms to use, no lower body movement, a mechanized dominatrix bending and breaking you down... the only salvation is to scream her name!");
	output("\n\n<i>“Ahkk..!”</i> is what you try to shout, the syllables trying to force their way through you.");
	output("\n\nAkane pulls her hand back, the pain flowing around your system instantly dying out. Suddenly, your lungs kick into a frenzy, the need for sweet air becoming a savior’s balm to your freshly tortured nerves.");
	output("\n\n<i>“24 seconds. Didn’t even get one syllable out. We’ll try again”</i> says Akane from on high, her fingers curling and uncurling as if she were just warming up. You can’t help but note her own breathlessness, her chest heaving under her other arm.");
	output("\n\n<i>“Akane. Say it back to me.”</i>");
	output("\n\nHer splayed fingers latch back onto your face, those charged fingertips making you wince and gasp as they make contact with your [pc.skinFurScales]. But... nothing. She merely holds it there.");
	output("\n\n<i>“Say it,”</i> she whispers, her thumb drawing circles across your cheek.");
	output("\n\n<i>“Ah... akah... Akane,”</i> you force out, clenching your eyes closed as your words seem to chime with submission...");
	output("\n\nHer fingers and thumb massage your [pc.face], the gentle motions belying the ghost pain your muscles tingle with.");
	output("\n\n<i>“There, there, surely that’s not all you have? A young, <b>strapping</b> spacer with nerves of steel? Aheh... Steele... “</i> she giggles, palming your head in her hand like an owner comforting their pet.");
	output("\n\n<i>“One more time now. ");
	if (silly) output("WHO’S YOUR WAIFU?”</i>");
	else output("Say my name.”</i>");
	output("\n\nBefore you can think to even form the word, that warm current stings your skin again, rising in strength until your entire body is rapidly subjugated! You manage to gasp out, scream and inhale before your lungs seize up, the cycle continuing as constant <i>pain</i> keeps you locked to the floor and firmly within Akane’s hold.");
	output("\n\nFrom below, your gaze is forced to focus on nothing but her, locked fingers giving you a shattered image of her wild-eyed grin. No, not a grin... a psychotic, lustful visage. A slight squeeze between her tips and you jerk in place, the intense pain that controls your body receding to your [pc.face].");
	output("\n\n<i>“Say it!”</i> she shouts, visibly gritting her teeth.");
	output("\n\nLungs free to move, you blurt out <i>“Akane!!”</i> with as much force as you can muster. As the last syllable leaves your [pc.lipsChaste], you’re both pushed away from each other: Akane staggers back, you fall onto your side! A visible crack of white light flashes between her palm and your head, one last jolt of agonizing energy from her to you!");
	output("\n\nYou cry out and whimper as you land on your shoulder, residual muscle spasms tugging and scraping at your tenderized nervous system.");
	if (pc.hasCock())
	{
		output(" [pc.eachCock] flop");
		if (!pc.hasCocks()) output("s");
		output(" around uselessly on the ground, the combined ‘shock tactics’ having forced ");
		if (pc.hasCocks()) output("them to hardened yet unusable states.");
		else output("it to a hardened yet unusable state.");
	}
	output("\n\nThe groggy dominatrix stumbles on her mechanical heels, the metallic <i>plink-plinks</i> erratic as she manages to stop herself from teetering over. You can see Akane hold herself up against the wall, her knees bent inward and all her limbs jittering with a palsy. Did she just...?");
	output("\n\n<i>“Nngggmmm... I haven’t heard someone say it like that in... ahehe, I don’t even know!”</i> she pants, her voice dotted with feminine squeaks.");
	output("\n\nEven in your compromised state, you can see a glistening <i>wetness</i> seep out between her pale thighs. Oh, she definitely did...");
	output("\n\nYou try hauling yourself up but to no avail, the tight binding still a coarse reminder of your bondage. The slightest bit of extra effort cuts into your stamina and your [pc.skinNoun] is sore and far too sensitive to try again.");
	output("\n\nAkane also slumps to her knees, her fingertips causing sparks to flare against the wall as she drags them down with her.");
	output("\n\n<i>“Oh how glad I am that you agreed... oh how fucking glad,”</i> she giggles, wiping her face with the backs of her wrists. Whatever thoughts you have to add fail to form in your mouth: the cool air filling your lungs is too good to pass up right now.");
	output("\n\nYour eyelids flutter to a close as that same air works its magic. Your lungs relax, your heart slows and your limbs loosen in short order, the comforting afterglow of expending so much energy making things numb and....sleepy...and....");
	output("\n\n...");
	output("\n\n<i>“Ah ah, no no, nooo,”</i> comes a voice from above, the exhausted voice of Akane leading you out of a microsleep. It couldn’t have been more than a minute. She’s got her hands all over you, the sneaky... wait...");
	output("\n\nYou find your head to be resting snugly against her lap. Her hands seem busy with untying your bonds. But...why...");
	output("\n\nThe rope slackens and another burden falls free of you. You gasp as your joints gain fresh movement, the first they’ve had in hours. You’re still pretty sore and vulnerable: it wouldn’t be wise to try to escape the jaws of a tiger...");
	output("\n\nA shadow of five prongs looms out of the corner of your eye...! You wince, tense up and brace for more!");
	output("\n\n...but instead, those same cold tips play lightly and gently across your temple. Instead of agony in its purest form, there’s a warmth and a fuzz from the metal digits. A flush of adrenaline overrides your fear as a tender caress plays about your head and [pc.face]. OOo, that feels <i>nice</i>....");
	output("\n\n<i>“Rather tame as punishments go, wouldn’t you say? Better than ripped out nails and a sliced tongue,”</i> she half-whispers, her middle finger tracing along your [pc.lips]. A small part of you wants to hate her as she teases you, another part internally thanking her for the gentle balm of her touch. With you so tender in body as you as are, you can only go along with her statements.");
	output("\n\n<i>“Hmm, [pc.name], [pc.name]... I wonder,”</i> she thinks out loud, running her thrumming thumb along the back of your neck. An intense, pleasurable throb follows the motion, forcing a shallow inhale out of you as it numbs your lungs with pleasant feelings.");
	output("\n\nWonder what? You realize that your voice tickles your throat something fierce, as if you’d been shouting for hours into the starry void. Akane places a finger across your [pc.lipsChaste], signaling for you to stay silent.");
	output("\n\n<i>“Shhh, shhh, rest easy for now. I’ll have your things brought and then we’ll have a few words. I’ve had my fill for today, ahum... hmhmm...”</i> she giggles, holding your head up as she slips her knees out from underneath.");
	output("\n\nWith your aching arms now free, you steadily bring yourself to a sitting position. The throb of your pulse pounds away against your skull, warms your chest and helps set your body at ease... but your nerves still seem tender as your [pc.feet] ");
	if (pc.hasLegs()) output("find their rightful places");
	else output("finds its rightful place");
	output(" against the ground. Akane is already at the dungeon’s entrance, the ‘session’ having added a subtle swagger to her walk and posture. She curls an index finger towards you, gesturing for you to follow her through the sliding door.");

	addButton(0, "Next", akaneDoneShockingMe);
}

public function akanePunchMe():void
{
	clearMenu();
	clearOutput();
	showAkane(false, true);
	
	output("Not exactly thrilled with the other options and fancying yourself tougher than most, you tell her that you’ll submit to a physical punishment.");
	output("\n\n<i>“Hmph, a brave one. What a waste of a good body. Well, you heard [pc.himHer]. Do be ample with the painkillers, okay Yan?”</i> says the mob boss, turning her head to a masked assistant holding you in place. He in turn nods and lifts you up to your [pc.feet] while the other operative holding you works in perfect sync.");
	output("\n\nThe one called Yan produces a small silver tube, a medipen of some sort by your guess. When he aims it for your arm, you consider resisting... only to remember that - in these bonds - you’ve no way <i>to</i> resist.");
	output("\n\nHe quickly jabs the smooth surface against your [pc.skinFurScales] and presses down on the top of it. A mild hiss precedes a dull ache that swiftly spreads from your arm to almost everywhere in your body. You wince out of reflex but within seconds, the ache dissipates into a warm numbing sensation. You almost feel like smiling...");
	output("\n\nSeveral agents then meld into reality before you; agents of all types and sizes, each holding a black baton.");
	output("\n\nAh. <i>Aahhh</i>. Ah shit.");
	output("\n\nThe first in line takes a hefty swing at your [pc.hip]. The object hits but you feel... very little, actually. With a small yelp, you’re jolted slightly to the side. Instead of sudden pain, there’s an intense and discomforting heat. You shuffle your [pc.legs] a little: still functioning properly at any rate.");
	output("\n\nWhile you’re assessing the ‘injury’, the second agent in line steps forward. Another swing, this time at your [pc.thigh]. The same shake from impact and the same intense heat... the same discomforting burn from each impact.");
	output("\n\nYou can’t quite tell how many ‘hits’ you take by the end of it. Each one dulls your focus and perception as your body is liberally covered in sickly, purplish blotches.");
	output("\n\nYour eyes can’t... stay... open...");
	
	addButton(0, "OoHereWeGo", akanePunchBye, undefined, "Ooo Here We Go Again");
}

//ALSO CONFIRM NO BUST
public function akanePunchBye():void
{
	clearOutput();
	author("SoAndSo");
	moveTo("TAVROS HANGAR");
	processTime(6 * 60);
	pc.createStatusEffect("Brutalized", 0, 0, 1, 0, false, akaneBrutalizeIcon, "You move in twice the time between tiles.\n-10% to all resistances and damage.", false, 14*24*60, UIStyleSettings.gStatusBadColour);
	
	output("It takes a long while to come round.");
	output("\n\nWhen you awaken, you’re nestled on a chair of cargo crates and boxes in the Tavros docks.");
	output("\n\nYou scan your eyes over everything, hoping that nothing has been taken: nnnnnno. Your [pc.gear] all seem to be on your person.");
	output("\n\nYou move an arm to help yourself up, the- <i>gaahhh!</i>");
	output("\n\nMoving <i>hurts</i>. "); 
	if (silly) output("So does breathing, oh god <i>life is pain</i> <b>kill me</b>");
	output("\n\nThat anaesthetic must’ve worn off: all you can feel is debilitating aches and pains all over your limbs and joints. Guess you’ll have to see a doc!");

	flags["SHUKUCHI_FOURTH_ENCOUNTER"] = 2;
	
	addButton(0, "Leave", mainGameMenu);
}

public function akaneDoneShockingMe():void
{
	clearOutput();
	author("SoAndSo");
	
	output("The white light of the throne room stings your eyes again as you enter, making you wince a little. You trail a few steps behind Akane who proceeds to take her place on the chair, knees just a little bit closer together this time...");
	output("\n\nYou stop [pc.walking] when you spot her two adjutants approaching you, one with a bundle of... oh, right. The one carrying your gear appears to be the ausar from before, that tri-color fur tone giving it away. ‘Cheo’ wasn’t it...?");
	
	if (pc.exhibitionism() > 40)
	{
		output("\n\nWith your naked body on full display, you give your [pc.chest] a ");
		if (!pc.isMale()) output("tempting fondle towards him and a little bit of tarty lip biting to top it off");
		else output("rub and a flex so that he gets the point");
		output(". Just a little something for him to remember ");
		if (!flags["SHUKUCHI_ENCOUNTER_MHENGA"]) output("what he missed out on when he beat you");
		else output("who he lost to");
		output("! Cheo pauses for a second and then merely sniffs, shrugging your display away...");
	}
	else
	{
		output("\n\nWith your nakedness on display to the large room, with who knows how many operatives present under their cloaks, you feel the urge to cover yourself with your hands.");

		var longDick:Boolean = false;
		for (var i:int = 0; i < pc.cocks.length; ++i) if (pc.cocks[i].cLengthFlaccid > 5) longDick = true;
		
		if (longDick) output(" It’s a little bit difficult with the [pc.groin] that you have... but");
		output(" Cheo continues unfazed, his arms stretching out to present you with your things.");
	}
	
	output("\n\nHe cautiously offers you your [pc.gear], eyeing you as you holster your [pc.weapon].");
	output("\n\n<i>“No funny business,”</i> he growls through his mask, arms folded. You turn yourself away from the blank mask, proceeding to get dressed ");
	if (pc.exhibitionism() > 40) output("with the intent of putting on a show.");
	else output("quickly to avoid being out in the open.");
	output("\n\nOnce finished, Cheo and the other operative turn in unison and promptly take their places by Akane’s side. The queen bee beckons you to stand before the throne, wordlessly gesturing to the spot. Hiding a sneer, you take up the spot with folded arms.\n\n");
	if (pc.personality <= 33) output("This whole thing has to be some kind of [pc.race] rights violation.");
	else if (pc.personality <= 66) output("Didn’t even get you off, the bitch...");
	else output("All you need is one more excuse to take her down.");
	output("\n\n<i>“Mmmmm and now business resumes,”</i> begins Akane, getting comfortable in her seat.");
	output("\n\n<i>“Perhaps, as an... honored guest of our establishment, " + pc.mf("Mister", "Miss") + " Steele would consider a deal?”</i>");
	output("\n\n<i>“Do I even have a choice?”</i> you say back in a low tone.");
	output("\n\n<i>“Well said,”</i> she grins, tapping her fingertips against both armrests in arpeggiated patterns. <i>“Did we um... did we ever find the relevant information, Cheo?”</i>");
	output("\n\nCheo nods and produces a small datapad from his pocket, holding it in front of the mob boss. She lazily trails her fingers along its surface, talking out loud as she goes.");
	output("\n\n<i>“Let’s see, Steele, Steele... Steele Tech, Victor, Maximilian, dead, blah blah, heir or heiress... oh,”</i> she says at first, abruptly stopping and squinting when some detail catches her eye. <i>“So young, [pc.name]. Oh my, I had no idea...”</i> she exclaims, her grin gaining a devilish hint as she stares you down.");
	output("\n\nYou turn your head away, both to avoid her predatory stare and to hide the mild blush you feel welling in your cheeks. It’s not like she’s your mother, she can’t just... say that kind of thing... Akane simply laughs, holding her palm up to cover her mouth.");
	output("\n\n<i>“Look at you, all grown up and playing spacer. How about that, how about that indeed...”</i> she says to you, her grin turning into a smile. She cocks her head to the left as if to examine you once more.");
	output("\n\n<i>“As to the deal: consider it as something as informal as it could be. An open invitation, that’s all. An invitation for my audience in a very... intimate setting,”</i> says Akane, tapping a knee with her fingers. <i>“If you’ve a need for... pain, love, joy, or maybe to brighten a bored old woman’s day, just say so at our representative’s stall. You know the one. No knockouts this time, I promise.”</i>");
	output("\n\nUh... hmm. Well, you’ve no reason to commit to anything, so you simply nod and consider what she means.");
	output("\n\nWait, you spent who knows how long on finding this place, putting yourself in harms way at several points... only to have a mob boss solicit you? The galaxy these days.");
	output("\n\n<i>“Yan, show [pc.himHer] out, if you please,”</i> directs Akane, that bored tone of hers taking over once again as she turns her attention back to the dataslate.");
	output("\n\nThe male agent to her right steps forward to your direction, reaching for something from a pocket. A weapon...? Oh wait. He produces a thin piece of black fabric: a blindfold.");
	output("\n\n<i>“Sorry, company policy,”</i> he shrugs with a digitized voice, taking a spot behind you. Sighing, you straighten up as he reaches around and ties the blindfold over your eyes. You feel another set of hands guide you by the shoulder to somewhere else, the sounds of several kinds of doors opening as you’re moved along.");

	addButton(0, "Next", akaneDoneShockingMeII);
}

public function akaneDoneShockingMeII():void
{
	clearOutput();
	author("SoAndSo");
	moveTo("110");
	
	output("It couldn’t have been more than a few minutes but the strange and unknowable route you’re guided through seems to go on for miles.");
	output("\n\nAll of a sudden, as one final door opens with a <i>schwiii</i> sound, you’re pushed through into a loud, crowded area. You quickly remove the blindfold, twisting around to see where you came from, where those operatives... went...");
	output("\n\nHuh. The wall behind is just a wall. There’s nothing to the sides... where did they go? Where did you come <i>from</i>?");
	output("\n\nWith Akane’s open invitation in the back of your mind, you shake your head, clear out the questions and get back to your business.");

	flags["SHUKUCHI_FOURTH_ENCOUNTER"] = 3;
	flags["SHUKUCHI_FOURTH_ENCOUNTER_TIMESTAMP"] = GetGameTimestamp();
	
	addButton(0, "Leave", mainGameMenu);
}

public function akaneVisitLair():void
{
	clearMenu();
	clearOutput();
	author("SoAndSo");
	
	output("As you walk to the stand, the rep meets you halfway, all smiles and clasped hands. ");
	
	if (flags["AKANE_VISITS"] == undefined) output("You feel your nose wrinkle as you anticipate going to the hideout again: all this secrecy...");
	else output("You greet him with a small wave, less phased by the usual procedure of getting to and from Akane’s abode.");
	
	output("\n\nInstead of greeting you fully, he directs you to that familiar doorway with the impossibly bright lights. You [pc.walk] to it as casually as possible: it <i>is</i> a crime ring after all...");
	output("\n\nThe rep follows behind, producing another familiar item in the form of a blindfold. Sighing, you ");
	if (pc.tallness > 72) output("bend down");
	else output("allow him the space");
	output(" to let him apply it around your head. Gentle as he is, there’s always something unnerving about losing one of your senses.");
	output("\n\nWith everything all in its right place, you’re guided through the door and along the complex path to your destination...");

	addButton(0, "Akane", akaneLair);
}

public function akaneLair():void
{
	clearOutput();
	moveTo("GAME OVER");
	showAkane(false, true);
	
	if (pcReadyForPainsluttery())
	{
		akanePainslutTrigger();
		return;
	}
	
	output("Some ten or so minutes later, a distinct <i>thun-thunk</i> of heavy sliding doors tells you you’ve arrived. The two pairs of hands let go of your shoulders and sides and the blindfold promptly falls away as you’re all brought to a halt. The bright white ambience of the hallway greets you again, the head honcho’s chair at the opposite end of the grey slab floor. Akane sits on top, her chin resting on her right fist.");
	output("\n\nShe visibly smiles.");
	output("\n\nYou pluck up and approach her, mindful of the two agents to her left and right.");
	if (flags["AKANE_VISITS"] == undefined)	output("\n\n<i>“Ahh, now there’s a face I wasn’t expecting to see. I wonder what brings young " + pc.mf("mister", "miss") + " Steele back to our little group?”</i> questions the mob boss, her other hand playing with her hair.");
	else if (flags["AKANE_VISITS"] == 1) output("\n\n<i>“Back again? I’m honestly flattered, [pc.name]. You really know how to brighten this old lady’s day,”</i> she quips, a genuine note of relief coming through. She eyes you all over, her teeth catching on her lower lip.");
	else if (pcIsPainslut()) output("\n\n<i>“My perfect picture... how do I even find the right words for you? Maybeeee... get in that damned bedroom,”</i> giggles Akane, the most devilish of smiles playing across her face.");
	else
	{
		output("\n\n<i>“Oh what a joy, my favourite strapping young " + pc.mf("lad", "lady"));
		if (silly) output(" <b>I’ll wait for the night to come</b>");
		output(" is paying me a visit! So what of it, Steele? Do I behave as unladylike as possible and take you here and now?”</i> croons Akane, her voice laced with salaciousness.");
	}
	
	IncrementFlag("AKANE_VISITS");
	
	addButton(0, "Her", akaneAkaneMain, undefined, "Her", "Just her, no one else.");
	addButton(1, "Leave", akaneNevermind, false, "Leave", "You just wanna get out of here.");
}

public function akaneAkaneMain():void
{
	clearOutput();
	showAkane(false, true);
	
	output("You say that you wanted to spend time with her.\n\n");
	if (flags["AKANE_FUN_VISITS"] == undefined) output("Something about that ‘punishment’ made you want to come back. It might even be the intrigue and mystery of this place, who knows?");
	else output("How could you say no to more of her... particular brand of intimacy?");
	output("\n\n<i>“Mmhmm, you know how to shame this old bag of bones and bolts, you monster. Care to entertain me, then?”</i>");
	
	addButton(0, "Appearance", akaneLookAtMafiaBoss, undefined, "Appearance", "Take in the full grace and majesty of this augmented crime boss. Respectfully of course. <i>She’s watching</i>.");
	if (pc.isPregnant()) addDisabledButton(1, "Sex", "You are unable to participate in this while pregnant!");
	else addButton(1, "Sex", akaneSexOptions, undefined, "Sex", "Throw yourself before her and get right up in that sweet, sweet agony that makes you want to die.");
	addButton(2, "Leave", akaneNevermind, true, "Leave", "You just wanna get out of here.");
	
	//AkaneQuest content
	if (MailManager.isEntryViewed("akanequest_email"))
	{
		switch(flags["AKANEQUEST_STAGE"])
		{
			case undefined:
				addButton(3, "The Raid", akanequestRaidBriefing, undefined, "The Raid", "Seems she has something planned if the email is correct. Something involving your skillset...?"); break;
			case 0:
				akanequestImInButton(3); break;
		}
	}
}

public function akaneNevermind(talked:Boolean = true):void
{
	clearMenu();
	clearOutput();
	showAkane(false, true);
	
	if (!talked) output("<i>“Wait, you went through all that just to... say you don’t want to be here? Eugh... fine, Cheo, Yan, show [pc.himHer] out, I wonder if time away will open [pc.himHer] up,”</i> she says curtly, apparently having lost interest in you already.");
	else output("<i>“Leaving so soon...? Hmm, you do have a life outside this place after all. Maybe I’ll..." + (pcIsPainslut() ? "miss you" : "") + ",”</i> she half whispers, beckoning Cheo to come over. He helps you up and reclaims your [pc.gear], showing you towards the door once you’re done.\n\nYou leave her darkened chambers, then...");

	output("\n\nHer two attendants approach you with that same old blindfold. With a sigh, you stand ready and close your eyes, the blindfold then comfortably tightening around your head.");
	output("\n\nLed back through the winding maze of doors, corridors and odd angles, you’re quickly put out onto the Tavros merchants deck.");
	
	addButton(0, "Exit", akaneLeave);
}

public function akaneLookAtMafiaBoss():void
{
	clearMenu();
	clearOutput();
	showAkane(false, true);
	
	output("Akane is a human female, the boss of a crime syndicate in her early-to-mid 40’s at a guess. She stands at around 6’ in height - give or take an inch - with a slender, well-toned gymnasts frame. Currently, she sits with folded legs and a watchful eye on a ‘throne’ of sorts, one with a simplistic and authentic design. It’s made of real, dark brown wood and perfectly straight in all observable proportions with the only decoration being a red backrest.");
	output("\n\nAkane herself is anything but just an old piece of furniture, however.");
	output("\n\nHer face is structurally flat and perfectly symmetrical with high cheekbones and narrow eyes. Her skin is a gentle pale tone and only slightly affected by her age: some crow’s feet and the odd wrinkle. Old Terran definitions would have her placed as Eastern Asian, although such definitions are blurred in this day and age.");
	output("\n\nHer jet black hair is silky smooth, wavy and glossy and cut sharply to about chin length on her left side. Where you would expect hair follicles on the right side, there is a web of scar tissue consistent with cuts and lacerations going from her right ear down to her right collarbone. All of the healed-over marks are made of erratic, angular and deep looking patterns. Said ear seems surprisingly undamaged and appears to be modded into an elvish, pointed shape. Instead of one prong, there are three and they all have a slight upward flick towards the tips, making her right ear look ‘wing-like’.");
	output("\n\nHer eyes dart around you from time to time, as if sizing you up every few minutes. They’re colored a plain shade of black and give little away.");
	output("\n\nAside a light application of crimson lipstick, she wears no makeup.");
	output("\n\nWhat draws your eyes more and more are her cybernetic augmentations. From elbow to fingertip and from knee to toe, sleek and seamless black replacements make up the rest of her limbs. They almost seem realistic, aside from the obvious joints and pivots. Instead of typical human feet and legs, her robo-limbs form pseudo-boots with angular arched heels about 4\" high, giving her a stylish edge on top of pinpoint footing balance. When traversing, she moves with grace and precision; the added effect of the heels pushing her hips out with each step is just a small bonus.");
	output("\n\nIn terms of outfit, Akane wears a short, sleeveless dress much like an ancient qipao. It’s made of thin silver fabric and patterned with pink and red draconic designs. On top of that is a short, black leather jacket cut at the diaphragm, the sleeves only extending to her prosthetic elbows. The end effect would normally make one believe she was wearing long gloves.");
	output("\n\nUnderneath all this, her body is slender but not slim, detailed with muscle but built more like a gymnast or acrobat. A mild amount of ab detail shines through her thin dress, although little else does.");
	output("\n\nHer chest barely seems to reach a B-cup and her jacket adds modesty. Although <i>some</i> natural curve exists on her, she is on the lanky side of things.");
	output("\n\nYou have a glance over her folded legs, thinking about what feminine allurement lies in between... only to have her own gaze intercept yours with an unflinching and knowing stare.");
	output("\n\nBetter just to... look away for now...");
	
	addButton(0, "Back", akaneAkaneMain);
}

public function akaneSexOptions():void
{
	clearOutput();
	showAkane(true, true);
	
	if (flags["AKANE_FUN_VISITS"] == undefined)
	{
		output("You nod and shuffle your [pc.feet], as if the admittance were some mark of shame. It’s just a booty call, right? Or something like it.");
		output("\n\n<i>“Oh don’t be so coy, [pc.name]. Be proud in knowing what you want, there’s nothing quite like a self-secure sub,”</i> she chirps, eagerly pushing herself off of the chair. With surprising speed, Akane already has a cyber-digits locked to your shoulders!");
		if (pc.tallness > 84) output(" Even if she has to stretch to reach you, the strength of her grip keeps you held in place.");
	}
	else if (flags["AKANE_FUN_VISITS"] == 1)
	{
		output("You nod to her, confident that this is what you want. You gotta have what she’s giving, and only she can give it to you...");
		output("\n\n<i>“Marvelous, you’re filling my heart with joy,”</i> she says off-hand, slinking off of her seat with an almost feline grace. Before you can react, her hands have already locked themselves to your wrists.");
	}
	else if (pcIsPainslut())
	{
		output("<i>“I NEED it! Hurt me, pleeeease...!”</i> you blurt out to her, the rampant need for her cathartic touch overriding your inhibition.");
		output("\n\nAkane merely smiles, darting at you with raptor-like speed. You close your eyes and brace yourself for her touch, a reflexive gasp coming from your lips as her fingers make contact with your skull. An instantaneous heat begins to throb across your [pc.skinFurScales], a feeling so pleasurable that it almost brings you to your knees.");
	}
	else
	{
		output("Before you can even assent to her suggestion, Akane raises her hand to bid you silence.");
		output("\n\n<i>“Shhshhshhh, I know that expression, that little look in your eye... you’ve no need to say anything,”</i> she says softly, slinking off of her chair with frightening immediacy. In a flash, she’s upon you... you close your eyes as you feel her fingers caress your neck and cheek.");
	}
	output("\n\n<i>“Cheo? Some assistance is needed next door,”</i> commands Akane, her piercing stare focused squarely on you. Cheo leaves his spot, moving with a quick step through the door to Akane’s ‘dungeon’.");
	output("\n\n<i>“And now, what to do with you...”</i>");
	
	//Stim
	addButton(0, "StimDom", akaneShockMeAgainRegularly, undefined, "Stim Dom ", "Relive your first encounter and help get Akane off. She’ll use her hands and... other things.");
	//What do the PC and cream have in common? They're best whipped.
	if (!pc.hasStatusEffect("Lash Marks")) addButton(1, "Whipping", akanePlsWhipMe, undefined, "Whipping", "Get lashed in sensitive spots and know raw, sexual pain.");
	else addDisabledButton(1, "Whipping");
	//Come on, iykwim
	if (pc.hasGenitals()) addButton(2, "ForcedOrg", akanePleaseComeAgain, undefined, "Forced Orgasms", "Get pinned down and made to orgasm over and over again. Involves toys.");
	else addDisabledButton(2, "ForcedOrg");
	//Nom nom nom
	if (flags["AKANE_TIMES_LICKED"] || (pc.hasStatusEffect("Tenderized") && pc.hasStatusEffect("Lash Marks"))) addButton(3, "Tender Oral", akaneTenderOralSurrender, undefined, "Tender Oral", "Aw ye, put that tongue to work baby. Then she’ll put her fingers to work on <i>you</i>...");
	else addDisabledButton(3, "Tender Oral", "You’re not quite deserving of this, yet...");
	//Dunun duundun duundun dununu nunun
	if (pcIsPainslut())
	{
		var fitCock:CockClass = null;
		for (var i:int = 0; i < pc.cocks.length; ++i)
		{
			var john:CockClass = pc.cocks[i];
			if (john.cLengthRaw > 4 && john.cLengthRaw < 13 && john.thickness() < 2.5) fitCock = john;
		}
		if (!pc.isTaur() && (fitCock || pc.hasHardLightEquipped())) addButton(4, "SlowRide", akaneOPIsASlowRideFoghat, fitCock, "Slow Ride", "She wants to get properly intimate...?" + (silly ? " SHLOOOOW RIIIIDE, TAKE IT EEEEZEEEEH" : ""));
		else addDisabledButton(4, "SlowRide", "Slow Ride", "She wants to get properly intimate...?" + (silly ? " SHLOOOOW RIIIIDE, TAKE IT EEEEZEEEEH" : "") + " Hmmm, seems you’re not properly equipped though...");
	}
}

public function akaneShockMeAgainRegularly():void
{
	clearMenu();
	clearOutput();
	showAkane(true, true);
	pc.lust(pc.lustMax());
	
	output("<i>“Can we do it like the first time...?”</i> you pipe up, your gaze getting ensnared in her dark-eyed stare.");
	if (flags["AKANE_TIMES_SHOCKED"] == undefined)
	{
		output("\n\n<i>“Ahhhh, I see you’ve got a taste for it already, hmmm?”</i> teases the mob boss, her thumb massaging your [pc.skinFurScales] with slow and soft motions. The smooth metal glides over the surface and leaves a residual sting. You grit your teeth and inhale as the sting takes a few seconds to subside, the dissipation turning into warmth and soothed nerves. You feel a gasp rise up through your throat...");
		output("\n\n<i>“..aah....hh!”</i>");
		output("\n\nAkane giggles deliriously as her fingers manipulate your flesh, her other hand pointing to <i>that</i> room.");
		output("\n\n<i>“Let’s get you what you need, you poor " + pc.mf("boy", "girl") +". Some tender, loving care, ”</i> she says breathily, excitement coloring every part of her. <i>“Go on then...”</i>");
		output("\n\nShe cocks her head to the direction of the door, her smile following you as you [pc.walk] to it with bated breath.");
	}
	else if (flags["AKANE_TIMES_SHOCKED"] == 1)
	{
		output("\n\n<i>“Of course, precious. Let’s make it as special as we can, hm?”</i> she coos, fawning her thumbs over your [pc.face] as if to wipe away unseen tears. The smooth metal glides over the surface and leaves a residual sting. It’s a sharp pain but a <i>good</i> one, one that leaves your [pc.skinFurScales] warm and ready.");
		output("\n\nAkane cocks her head to the side as if lost in some thought, mouthing something you can’t discern.");
		output("\n\n<i>“I’ll give you all that you need, poor thing,”</i> she says mid-mumble, pointing you towards her chamber door. You [pc.walk] towards it with head held high, a bubble of anticipation forming within.");
	}
	else if (pcIsPainslut())
	{
		output("\n\n<i>“Shhshh...”</i> whispers Akane, anticipating your needs. Her fingers trail across your cheeks, your jaw, your chin: the nerves in your [pc.skinFurScales] tingle and sting with each motion. It’s enough to excite your inner painslut, a soft flush of arousal following every nerve touched by her fingertips. You feel your eyes flutter to a close, an impulse you can’t even control.");
		output("\n\n<i>“Perfect, simply... perfect,”</i> she croons, her breathy tones ending with a chewed lower lip. <i>“Get in that room...”</i>");
		output("\n\nYou barely even wait for her to gesture: you dart for the door!");
	}
	else
	{
		output("\n\n<i>“Yes, yes! Ohhh yes, let’s. With my fingers all over you, touching your very soul,”</i> swoons the breathy Akane, her hands bringing your head " + (pc.tallness > 84 ? "down " : "") + "to meet hers. She presses your foreheads together, her black, blank eyes boring into your [pc.eyes].");
		output("\n\n<i>“Efffffhhh, I’ve never wanted to rely or depend on others but I... ohh, I could never deny you, [pc.name],”</i> she half-whispers, a sharp inhale trying to hide the palpable arousal texturing her words. <i>“Now get to that bed before I... do something.”</i>");
		output("\n\nShe giggles at the thought, her thumbs circling against your cheeks as you give in to your reflexive smile. You can’t wait: you practically sprint to her door!");
	}

	output("\n\nYou enter her chambers once again through the sliding door, the greyish-blue ambience sucking you into Akane’s personal world. Cheo stands with his hands behind his back, standing to attention with an immovable stance. As you approach the center of the room, he approaches you with his hands open, revealing some dark colored rope.\n\n");
	if (flags["AKANE_TIMES_SHOCKED"] == undefined) output("<i>“Standard procedure,”</i>");
	else output("<i>“You know the rules,”</i>");
	output(" he sniffs under his mask, the roboticized tone at odds with Akane’s assertive direction.");
	if (flags["AKANE_TIMES_SHOCKED"] != undefined) output("Yeah, yeah, rules is rules...");

	if (!pc.isNude()) output("\n\n<i>“All that off too,”</i> he adds, pointing to your clothes. You turn around to undress properly, precision over haste.");
	
	output("\n\nYou toss your [pc.gear] behind you with the more dangerous items placed on top of the pile. Apparently satisfied, he grips you by your shoulder with a vice-like paw. Not enough to hurt but there’s no way you could break that hold in this state...");
	output("\n\nThe masked ausar turns you on the spot so that he faces your back. The <i>click-clack</i> of Akane’s heeled feet come closer from behind, the ausar manipulating and binding your arms and wrists while she inspects and observes.\n\n");

	if (flags["AKANE_TIMES_SHOCKED"] == undefined) output("<i>“A little bit of slack, right there Cheo,”</i> says the queen bee, her finger tapping on your wrist. You feel the rope lighten in tension, not enough to let you move your arms however.\n\n<i>“Just like that. Good boy,”</i> half-whispers Akane, stepping in front of you with a knowing smirk on her face. <i>“He’ll be a master knot-tyer in no time.”</i>");
	else if (flags["AKANE_TIMES_SHOCKED"] == 1) output("<i>“Nearly perfect,”</i> is what you hear from her, metallic digits trailing across the secure bind that ties your forearms and wrists.\n\n<i>“Thank you, Akane,”</i> replies the ausar, that digitized voice covering his notes of modesty. Akane has the galaxy’s most telling smirk as she steps out in front of you, a hand on her chin.");
	else output("<i>“Excellent work, Cheo. I wonder if working on our little playmate is having an effect on you?”</i> jokes Akane, the solid metal of her fingers trailing across the taut and thorough binding.\n\n<i>“Ahmm, I couldn’t say,”</i> admits the ausar, clearing his throat. Akane giggles, her fingers creeping up your arm as she turns to face you.");
	
	output("\n\n<i>“All comfortable, [pc.name]?”</i> she asks, eyeing your nude form up and down. You nod back, butterflies in your gut stopping you from verbalizing your response. She “hmmm’s”, trailing her fingertips across her pale cheeks.");

	if (pc.isGoo())
	{
		if (flags["AKANE_TIMES_SHOCKED"] == undefined) output("\n\n<i>“I’m surprised these binds are holding up with that squishy body of yours. Even I might have something to learn...”</i> she mumbles, her pinky finger brushing against her ruby red lips.");
		else output("\n\n<i>“Even with all that [pc.skinColor] goop, there’s no way you could get out of this thing...”</i> she half-whispers, apparently in awe of Cheo’s work.");
	}
	
	output("\n\n<i>“Follow,”</i> she commands, grabbing your left shoulder. Cheo grabs you by the right, the two of them guiding you towards the end of the immaculately made bed.");
	if (flags["AKANE_TIMES_SHOCKED"] != undefined) output(" Looking at that familiar spot, yet more bubbles and butterflies fill your insides: just to be so close to that wondrous world of... pain...");
	output("\n\nIn short order, you’re placed in front of the edge of the bed. The two of them put pressure on your shoulders, an insistent prompt for you to get down on your [pc.knees]. You do so ");
	if (flags["AKANE_TIMES_SHOCKED"] == undefined) output("hesitantly, the appointed time drawing nearer.");
	else if (flags["AKANE_TIMES_SHOCKED"] == 1) output("willfully, comfortable with what to expect.");
	else output("eagerly, eternally wishing to feel Akane’s touch once again.");
	
	output("\n\nAkane herself sits on the edge, no more than a foot of space between the two of you. Your eyeline " + (pc.tallness > 84 ? "meets hers" : "meets her chest") + ", quickly becoming dominated by her near-psychotic gaze.");
	output("\n\nOut of nowhere, she clasps your head in her metallic palms!");
	output("\n\n<i>“Shhshh...”</i> she says under her breath, her slender legs spreading open below. <i>“I wonder...”</i> Akane holds on both sides of your jaw, her hands slowly drawing you closer.");
	output("\n\nHer lips part.");
	
	if (!pcIsPainslut())
	{
		output("\n\nYou want yours to as well. Your eyes flutter to a close and your [pc.lips] slowly open but...");
		output("\n\n<i>“Mmmmno, I don’t think so,”</i> she says flatly, leaving you in place. <i>“Perhaps when we’re ready.”</i>");
		output("\n\nB-but...you’re ready now...!");
	}
	else
	{
		output("\n\nYou go through the routine, the same old ‘will she/won’t she’ that she always teases you with. Your eyes close and [pc.lips] open...");
		output("\n\nThe gentle bump of your mouths touching catches you by surprise. Some part of you expected a rough tongue-fuck and then having your head crushed in between her palms but no... it’s soft, sensuous and slow. The purring mob boss takes her time with your mouth, her fingers gently gripping and releasing against your skull and [pc.hair]. With a gasp, Akane breaks away...");
		output("\n\n<i>“Fuh... ohhhho, now that’s the mouth I’m glad I saved. All for me, a perfect memory,”</i> she says breathily, wiping a sliver of drool from your mouth and hers.");
	}

	output("\n\nShe leans backwards so that she now sits upright, legs still parted. Her hands remain attached to your head and you can feel the fingers locking into place.");
	output("\n\n<i>“Like " + (flags["AKANE_TIMES_SHOCKED"] == undefined ? "before" : "last time, like every time") + ": say my name.”</i>\n\n");
	if (flags["AKANE_TIMES_SHOCKED"] == undefined) output("You hesitate at first, not knowing her game plan. You mouth the word before you say anything, a move to test the waters.\n\n<i>“Ah... Akane,”</i> you say slowly, a split second passing before her fingers twitch.");
	if (flags["AKANE_TIMES_SHOCKED"] == 1) output("Knowing what to expect, you inhale and exhale through your nose with deep, slow breaths. Just a few seconds more...\n\n<i>“Akane,”</i> you say firmly, a sinking feeling playing about inside as her fingers twitch.");
	if (pcIsPainslut()) output("<i>“Akane!”</i> you blurt out, needy and eager for her loving touch.\n\nShe giggles at your eagerness and at that moment, her fingers twitch.");
	else output("<i>“Akane,”</i> you say immediately, fully prepared for what’s to come.\n\nShe merely smiles back, a devilish smile that precedes the tell-tale twitch in her fingers.");

	output("\n\nAll at once, a heat that feels like molten metal burns into your skin! It starts from her palms, from your jaw to your temples and spreads all over the muscles of your upper body! Your throat locks up, your lungs freeze and every limb becomes paralyzed in place as the brutal energy of Akane makes its mark on your body yet again.");
	output("\n\nYou want to scream. Oh how badly you and your body want to scream! Nerves burn and bristle with inorganic agony, the overwhelming force penetrating your senses just as deep. The blue lights of the room become difficult to look at, the rapid beating of your blood throbs in your ear and the faintest whiff of ozone fills your nose.");
	
	if (flags["AKANE_TIMES_SHOCKED"] == undefined) output("\n\nEverything’s a blur.\n\nYour only possible focus through the subjugation is the wide-eyed, psychotic grin of Akane. In that moment, the current tearing through your senses numbs <i>everything</i>. The vision of her shakes, twists and-\n\n<i>“Aghh!”</i>");
	else if (pcIsPainslut())
	{
		output("\n\nYou’ve endured worse: the roiling surges of euphoric agony that have taken control of you make your body feel so <i>alive</i>! You can feel it in every part of you, from head to [pc.feet].");
		if (pc.hasGenitals()) output(" The tension building in your [pc.groin] seems impossible to resist, each part flushed with arousal.");
		output(" Something’s coming, something’s going to-!");
	}
	else output("\n\nYou somehow manage to keep focus, the lack of <i>everything</i> except unremitting nerve-fire not quite hammering you down as before. Akane’s wide-eyed grin contorts and twitches as she does her work, your eyeline shaking and shaking until-");
	
	output("\n\nWith a cathartic shriek, you’re pushed back by the sudden break in contact. A white flash of energy leaps between your [pc.face] and her palms, the force splitting you from Akane’s hold. Cool air balms your gullet as everything starts working again and you can’t get enough.");
	output("\n\n<i>“Fuuh... whew... 31 seconds. Better! But I need more,”</i> gasps the queen bee, her sleek robotic limbs now trembling as she touches and fondles her chest. You can do nothing but slump down, on the edge of losing all will.");
	output("\n\nTaking advantage of this, Akane grabs you again by the jaw! With a quick shuffle of her posture, she brings her legs up and slides both feet against your neck! The heels dig into your clavicles, forming a complex lock.");
	output("\n\nNow, you’ve got a full view of what’s under her dress... a faint sheen of femcum dripping from parted labia.");
	output("\n\n<i>“More!”</i>");
	output("\n\nThe surge of energy comes again, just as potent but twice as effective against your weakened shell. " + (pcIsPainslut() ? "<i>“Y - yes, gimme more ! <b>More!!</b>”</i> is what you force out on the cusp of muscle loss.</b>" : ""));
	output("\n\nYour lungs pause and your muscles seize up into a painful inner prison once again. The lewd, complex body lock that Akane has you held in forces you to look right into her shadowed pubis, the parted lips glistening with her juice. Every second that passes, you’re edged closer and closer to her moistening slit. Even under this duress - this caustic, cathartic and rapturous state of agony - you can’t help but force your [pc.tongue] out. Just a few inches...!");
	output("\n\n<i>“Say it!”</i> you hear through the aching beat in your head, the piercing, harsh shriek of Akane’s commands breaking through the white noise of pain.");
	output("\n\n<i>“Ahhh...ka...neh....!”</i> is all you can muster.");
	output("\n\n<i>“More! Again! S-Say it!”</i> screams the jittering mob boss, her limbs visibly shaking with a palsy. Surely she must be close...! ");
	if (pcIsPainslut())	output("One thought jumps into your mind: n-no, I’m not close yet!");
	else output("You’re almost at your limit!");
	output(" Her hands spring off of your [pc.face], a double jolt of white energy leaping between the surfaces. You take the moment to breathe for all its worth, the air going in and out of your lungs so fast that it causes you to wheeze. Your eyes flutter and roll back as the sweet release of endorphins breaks the hold that her ministrations have on you, a part of your mind grateful for Akane’s mercy.");
	output("\n\n<i>“Akane...!”</i>");
	
	addButton(0, "Next", akaneKeepShockingMe);
}

public function akaneKeepShockingMe():void
{
	clearOutput();
	showAkane(true, true);
	if (pc.hasStatusEffect("Tenderized")) pc.setStatusMinutes("Tenderized", 4 * 24 * 60);
	//Effect in Creature.getHPresistances or however it as called. Just ctrl+f the name.
	else pc.createStatusEffect("Tenderized", 0, 0, 0, 0, false, akaneTenderIcon, "-20% Kinetic and Electric resistance.\n+40% Lust resistance.", false, 3*24*60, UIStyleSettings.gStatusBadColour);
	
	output("You force it once more and immediately, Akane buckles forward with a pure, piercing note of joy. Her fingers claw into your head as a silent, quivering orgasm rocks her hunched over form, her face now an agape portrait of bliss.");
	output("\n\nHer hold on you weakens, mechanical limbs shaking in their joints as Akane simply falls on her side. As she hits the bed, her body jerks and quivers in place as it shakes her to the core. You follow suit, your body finally giving out to ardor and exhaustion. With a quick turn of your head, it comes to rest against the soft mattress of the bed’s edge. The contact makes your face ache as your tortured nerves have barely begun to settle, mercifully dissipating after some tense seconds.");
	output("\n\n<i>“Cheh... Cheo... be a good boy and uh... help [pc.himHer] up on here,”</i> calls out Akane, her breathing shallow and fast. You can see her chest rise and back arch as the throes of her passion die down. In her convulsions, she ends up sprawled at the other end of the bed with her arms and legs splayed.");
	output("\n\n<i>“Mmmercy me..”</i> she half-whispers, mecha-digits fondling and caressing her feminine soft spots.");
	output("\n\nA pair of paws hauls you up to your [pc.feet] with surprising strength, holding you steady as you’re helped onto the spare bit of bed.");
	if (pc.isTaur() || pc.tallness > 96) output("\n\nThe bed heaves with the double weight on top of it but even with your body, there’s enough room for you and her.");
	output("\n\nWith the soft bedding comforting you on your side and your bonds loosened by unseen hands, you find yourself face to face with a woozy Akane.");
	output("\n\n<i>“So...”</i>");
	
	akanePostSexOptions("SHOCKED");
}

public function akanePlsWhipMe():void
{
	clearMenu();
	clearOutput();
	showAkane(true, true);
	pc.lust(pc.lustMax());
	
	if (flags["AKANE_TIMES_WHIPPED"] == undefined)
	{
		output("<i>“Ah wait! Something... something interesting. How about a good old </i>lashing?” she says out loud, not waiting for your response. She turns to her asuar attendant. <i>“Cheo, Procedure 16. Soft leather and plenty of ointment, understand?”</i>");
		output("\n\nYou see Cheo nod and aim straight for the door on the right, the entrance sliding open on its own. Akane lets go of you and folds her arms, her gaze now centered on you alone.");
		output("\n\n<i>“I’ll lay out something you’ll need to learn: safewords. If you want to pause the session, for a breather, say ‘Breve’. If you want to stop immediately, for whatever reason, say ‘Tacet’. Say it as loud as you can, as many times until everything stops, alright?”</i> she says warmly but sternly, her stare unflinching. You nod: “Breve”, “Tacet”, got it.");
		output("\n\n<i>“Turn around. Then... strip,”</i> is what she half whispers to you, twirling her finger towards the ground. Taking a second to realize she means you, you cautiously turn your back to the smirking yakuza. You briefly wonder what could she be planning... but it’s too intriguing to think on it: the mystery will unfold on its own.");
		output("\n\nNot sure of what any of this ‘procedure’ might be, you take a minute to undress from your [pc.gear]. The resulting pile ends up behind you, somewhere. Ahh well, you can worry about it later...");
		if (pc.exhibitionism() > 40) output(" Wait, getting your clothes off in such a grand area and no one’s around to see...? The inner voyeur within fights to jump out...!");
		output("\n\n<i>“Arms up, wrists together,”</i> comes Akane’s command from behind, two hard fingers walking up your spine as a prompt. Again, you cautiously perform the action, not exactly knowing what the next step is. The sound of some mechanical hatch opens from above and the sounds of small servos descend. You have a quick glance up and-");
		output("\n\n<i><b>TOONG TOONG</b></i>");
		output("\n\nYour hands are clasped by two cylindrical cuffs, holding you in place!\n");
		if (flags["TAMTAM_PRISONED"]) output("From what you can tell... prison grade. ");
		output("You pull down reflexively, only to be pulled back up again by the double servo grips. It pulls you up just an inch higher than your full body span, forcing you to balance on the " + (pc.hasLegs() ? "tips" : "tip") + "of your [pc.legs].");
		if (pc.isTaur()) output(" Even with your centauric lower body, your back legs only give minimal relief. You almost stagger off of them as you try to stabilize your footing.");
		output("\n\n<i>“Now then...”</i> chimes Akane, her hands caressing each [pc.hip] in turn.");
		output("\n\n<i>“Cheo? The lash.”</i>");
		output("\n\nLash...?!?");
		output("\n\nYou try to turn around but the servos push you back into the same pose. You’ve nowhere to run... you steel yourself for what’s to come.");
	}
	else if (flags["AKANE_TIMES_WHIPPED"] == 1)
	{
		output("<i>“What do you say to a lovely lashing, [pc.name]? I knew you had something open and curious about you,”</i> she giggles, her fingers playing against your cheek and chin. She turns briefly to her ausar attendant.");
		output("\n\n<i>“Cheo, another P16. Same as before, some of that rubbing salt too.”</i>");
		output("\n\nAs Cheo hurries off to carry out his orders, you’re quietly preparing for what’s next. With a small prompt from Akane’s palm, she traces the outline of your [pc.hip]. <i>“Remember the safewords?”</i> she whispers. You nod in turn: “Breve” and “Tacet”.");
		output("\n\n<i>“Strip.”</i>");
		output("\n\nY-yeah...! You turn on the spot, eager to tap into her wavelength. You take a minute to undress from your [pc.gear]. The resulting pile ends up behind you, somewhere. Ahh well, you can worry about it later...");
		output("\n\nYou raise your arms in the air to finish, anticipating what comes next.");
		output("\n\n<i>“Mmmhmm, I like a little eagerness in a new blood. Or are you such a sudden craven for a lashing that the mere suggestion gets you going?”</i> mocks Akane, the sounds of servos coming from overhead. The two clamps lock around your hands with a jolt, securing you in place.");
		if (pc.isTaur()) output(" Second time around, you’ve got used to the balance needed from your back legs.");
	}
	else if (pcIsPainslut())
	{
		output("<i>“Please whip me, Akane,”</i> you say with confidence, looking her dead in the face. <i>“I... need it.”</i>");
		output("\n\n<i>“Ohhooo, I know you do,”</i> giggles Akane, her ");
		if (pc.tallness > 84) output("fingers playing across your [pc.chest]");
		else output("ruby lips planting a kiss to your cheek");
		output(". <i>“And I need it too.”</i> She helps turn you on the spot, her husky breathing playing around your [pc.ears].");
		output("\n\n<i>“So say it again,”</i> she commands.");
		output("\n\n<i>“Please whip me, Akane!”</i> you say automatically, louder than before.");
		output("\n\n<i>“Again!”</i>");
		output("\n\n<i>“Please whip me, Akane!!!”</i> you yell, your cheeks flushing red. D-did you just...");
		output("\n\n<i>“Right... well, get ready then,”</i> she says casually, releasing you from her playful fingers. Without another thought, you quickly get out of your [pc.gear] without much thought to where it ends up.");
		output("\n\nAs soon as you’re ready, you fling your arms up in the air. The servo-cuffs almost seem to shoot out of the ceiling, the mechanical gauntlets locking your wrists in place with a welcomed, relief-building <i><b>TOONG TOONG</i></b>.");
		output("\n\nYou’ve never been more ready.");
	}
	else
	{
		output("<i>“Can you...whip me?”</i> you blurt out, the desire for a lashing overpowering your self-control.");
		output("\n\nAkane raises her brow at your request. A near-maniacal grin spreads across her ruby lips, one that you can’t help but imitate.");
		output("\n\n<i>“What was that? You’ll have to say it louder,”</i> whispers the yakuza boss, her thumb pulling at your chin.");
		output("\n\n<i>“Whip me, Akane!”</i> you blurt out again, closing your eyes in admittance.");
		output("\n\n<i>“Cheeeoooo, you know what to bring,”</i> calls out Akane, her eyes never breaking their lock on you. Cheo hurries off at once, an audible huff coming through his mask. <i>“And as for you, [pc.name], uh...”</i>");
		output("\n\nYou’re already stripped clean. Your [pc.gear] " + "sit"/*{s} <- IMPLEMENT THIS, ME! */ + " in a pile to the side, all that’s left to do iiiis: turn around, arms in the air, brace for impact...");
		output("\n\nThe servos whirring above add to the building butterflies in your gut but it’s all part of the movement, part of the routine: when they clamp around your held up wrists, relief tickles your spine in the most pleasant way.");
		output("\n\nYou’re ready.");
	}
	
	output("\n\nNow your view is the long chamber of artisan walls and rockpool springs.");
	output("\n\nSomething rough and bundled gets dragged across your back. The sensation sends a discomforting chill up and down your spine, making you catch your breath.");

	if (flags["AKANE_TIMES_WHIPPED"] == undefined)
	{
		output("\n\n<i>“B-but I’m not ready...I think?!”</i> you blurt out.");
		output("\n\n<i>“Don’t worry, precious. I would <b>never</b> give you more than you could handle, trust me... I’ll be with you every step of the way,”</i> croons Akane, a free hand caressing a [pc.hip]. You hear her take some steps back behind you.");
		output("\n\nYou close your eyes.");
		output("\n\n<i>“One... two... three...!”</i>");
	}
	else if (flags["AKANE_TIMES_WHIPPED"] == 1)
	{
		output("\n\nYou brush it aside, shaking it off as novices nerves. You want it again, no matter how fresh the experience or <i>wounds</i> are.");
		output("\n\n<i>“You’re all ...comfortable, I take it? It’s all under control, I promise you,”</i> whispers Akane, her voice trailing from some unseen, impossible position behind you. You nod as she talks, a sense of trust growing within you as the process continues. A few <i>clink-clinks</i> later and she’s in position.");
		output("\n\nYou inhale, savoring the moment before it’s all let loose.");
		output("\n\n<i>“One.... two.... three!”</i>");
	}
	else if (pcIsPainslut())
	{
		output("\n\nYou shiver and quake on the spot as the feeling of taut leather brushes against your [pc.skinFurScales]. It’s only natural for you to feel this way, now that you’ve been fully bent into Akane’s personal painslut.");
		output("\n\nAkane giggles behind you, one that turns into a soft sigh.");
		output("\n\n<i>“Just perfect. Perfect, perfect...”</i>");
		output("\n\nAkane takes a few steps backwards.");
		output("\n\n<i>“One... two... three!”</i>");
	}
	else
	{
		output("\n\n<i>Fuck</i>, that feels good!");
		output("\n\nThe certainty of it all, the release you need, the loving application of pain you crave: that little motion with the folded whip in her hands brushing against your back [pc.skinFurScales] makes your heart flutter something fierce.");
		output("\n\n<i>“Getting a taste for it, I see,”</i> murmurs Akane, a genuine strand of appreciation cutting through her amused tone. <i>“You better give it your all, else I may have to push you...”</i> You nod hastily, not caring for what it is you just agreed to. ");
		if (silly) output("<i>Just hurry up and whip me, Mommy.</i>");
		else output("<i>Just hurry up and whip me, already.</i>");
		output("\n\nAkane takes a few steps backwards.");
		output("\n\n<i>“One... two... three!”");
	}
	
	output("\n\n<i>Wuh-<b>TSSCH!</b></i>");
	output("\n\nIn that instant, an impossibly sharp pain and a piercing whipsnap breaks across your back and in your ears. You lurch forward in your bonds as the force, shock and speed takes your body by surprise. ");
	output(painslutornot("Y - yes... another! MORE!\nYou almost orgasm on the spot", "Fuuuckkk..!\nYou grunt through your teeth"));
	output(" as the split-second of contact takes a moment to sink in. A reflexive inhale stifles your reaction: ");
	output(painslutornot("can’t give in now, it’s only just started!\n\n<i>“Oh come now, don’t make it easy for me, precious,”</i>", "gotta be strong, it wasn’t that b-bad, you can take... more!\n\n<i>“There there, that was just a love tap,”</i>"));
	output(" chides Akane, the sounds of coiling leather coming from behind.");
	output(painslutornot("", " L - love tap...??"));
	output(" You brace yourself for the next hit, which could co-");
	output("\n\n<i>Wuh-<b>TSSCH!</b></i>");
	output("\n\nAnother instantaneous crack, another biting mark against your [pc.skinFurScales] and another ");
	output(painslutornot("stifled moan", "gritted grunt"));
	output(" you jerk in place as the whip makes second contact. A few seconds of whip coiling...");
	output("\n\n<i>Wuh-<b>TSSCH!</b></i>");
	output("\n\nAgain.");
	output("\n\n<i>Wuh-<b>TSSCH!</b></i>");
	output("\n\nAnd again!");
	output("\n\nEach one builds upon your pain, the keenly accurate strikes against your upper back landing within inches of each other. Each one burns and then stings ferociously under your [pc.skinFurScales], forcing your fingers to curl in their restraints. You try to calm your heart with a few slow breaths with the cooling air adding some mild relief for your senses. But then<i>Wuh-<b>TSSCH!</b></i>");
	output("\n\n<i>“Ahhh! Ngg!”</i> is the sound you make, a harsh inhale of air following as the fifth strike makes its mark. ");
	output(painslutornot("T-that’s nothing.. you need more!", "Fuck, that <i>hurts</i>!"));
	output("\n\n<i>“Holding up, precious?”</i> says Akane from behind, loud and clear.");
	
	akaneWhippingOptions();
}

public function akaneWhippingOptions(breveSaid:Boolean = false):void
{
	addButton(0, "Continue", akaneMyWhippingWillGoOn, undefined, "Continue", "Keep going, never stopping!" + (silly ? " NEVER SURRENDUUUUUUUH" : ""));
	if (!breveSaid) addButton(1, "Breve", akaneSayBreveAgainMotherfucker, undefined, "Breve", "Just a sec to catch your breath and decide whether you want to continue or not.");
	addButton((breveSaid ? 1 : 2), "Tacet", akaneDontGiveTacetPermission, undefined, "Tacet", "Stop everything altogether, you’ve had enough lashing for now.");
}

public function akaneSayBreveAgainMotherfucker():void
{
	clearMenu();
	clearOutput();
	showAkane(true, true);
	
	output("You shout the pausing word out.");
	output("\n\n<i>“A breather? Of course,”</i> acquiesces Akane, coiling the whip up behind you. <i>“Tell me what you’re feeling, [pc.name].”</i>");
	
	akaneWhippingOptions(true);
}

public function akaneDontGiveTacetPermission():void
{
	clearOutput();
	showAkane(true, true);
	//Give this a real icon later on
	if (pc.hasStatusEffect("Stinging Bruises")) pc.setStatusMinutes("Stinging Bruises", 7*24*60);
	else pc.createStatusEffect("Stinging Bruises", -1, 0, 1, 0, false, akaneWhipIcon, "Walking and checking your appearance may damage you!", false, 84*60, UIStyleSettings.gStatusBadColour);
	
	output("You cry out the stopping word and at once, Akane drops her lash to the floor.");
	output("\n\n<i>“Cheo, some assistance,”</i> she says decisively, her metallic hands holding you by the middle.");

	akaneWhippingDone();
}

public function akaneMyWhippingWillGoOn():void
{
	clearOutput();
	showAkane(true, true);
	if (pc.hasStatusEffect("Stinging Bruises")) pc.removeStatusEffect("Stinging Bruises");
	if (pc.hasStatusEffect("Lash Marks")) pc.setStatusMinutes("Lash Marks", 7*24*60);
	else pc.createStatusEffect("Lash Marks", -2, 0, 1, 0, false, akaneWhipIcon, "Walking and checking your appearance may damage you!", false, 7*24*60, UIStyleSettings.gStatusBadColour);
	
	output("You nod several times, leaning on your restraints for a few seconds. You tense and relax your shoulders in pulses, the sting biting into your nerves with each one. ");
	output(painslutornot("You keep the rhythm consistent and fast, savoring the sensation like the dirty painslut you are.", "Some part of you wants to do more, push the envelope... but you remember that there’s still more to come."));
	output("\n\n<i>“All ready then? Nice,”</i> hisses the mob boss, readying herself up judging by the clicks of her metal feet.");
	output("\n\n<i>Wuh-<b>TSSCH!</b></i>");
	output("\n\n<i>“Ahuuh...!”</i> you gasp out as the fresh hit throws you back into her world. ");
	output(painslutornot("An exquisite rush passes through your [pc.groin], reigniting your arousal and desire for punishment.", "You notice your breathing getting choppier and more staggered, the shock of each hit taking its toll on you bit by bit."));
	output("\n\n<i>Wuh-<b>TSSCH!</b></i>");
	output("\n\nYou tune out most of the sound surrounding you or what little there is of it. All you can feel is the pump of blood in your skull, the rhythm a constant and rapid throb at the sides of your head. When you’re hit again, you follow through with the strike, working with the pain to feel for Akane’s patterns. As each lash rocks your flesh and sends shocks through your nerves, the more you hurt. The more you hurt, the more your senses blur into a haze of catharsis. The more you get lashed, the more you... enjoy it.");
	output("\n\n<i>Wuh-<b>TSSCH!</b></i>");
	output("\n\nAnother snap and strike briefly takes you out of that mindset. That flesh-deep sting lands dangerously close to previous wounds, the sensation strong enough to make your eyes water.");
	output("\n\n<i>Wuh-<b>TSSCH!</b></i>");
	
	if (flags["AKANE_TIMES_WHIPPED"] == undefined)
	{
		output("\n\n<i>“Aahhuh...!”</i> you yell, your body reeling from a sudden state of shock. There’s a jittering in your [pc.legs], one that makes standing up a genuine challenge. You weigh up the problem: what’s going to give up first, your mind or your body? But before you can say the call sign...");
		output("\n\n<i>“Hold it. I think that’s enough. Yep, definitely enough,”</i> calls out Akane, brushing the quickly coiled-up whip against your [pc.hip]. You flinch as she does, your nerves pumped up on instinct and adrenaline.");
		output("\n\n<i>“Shhshhh... Cheo, how many did we get through?”</i> she says calmly, cupping your jaw in her hands as your breath turns rapid and shallow.");
		output("\n\n<i>“Nineteen,”</i> comes a voice from the side. Nineteen...?!");
		output("\n\n<i>“Impressive, [pc.name]. Your mind held out more than your body. Can’t risk any actual wounds of course, I couldn’t live with myself if that happened,”</i> half-whispers the grinning mob boss, her eyes scanning your weeping visage. A cold, wet sensation trickles down your back, the deep sting of the lash turning into a pleasant, sobering mild ache that melds with natural endorphins. Oil, right...?");
		output("\n\n<i>“Thank you Cheo. Just a little something to take the edge off, hm? Don’t forget cleanup procedures. Now let’s get you down from here.”</i>");
	}
	else if (flags["AKANE_TIMES_WHIPPED"] == 1)
	{
		output("\n\nYou yell out in garbled syllables as that last hit breaks something within you. You can feel it grow and settle within: a hot, burning ache that doubles down on your whip wounds. The sensation makes your eyes stream with moisture: the pain is just too much to hold back against. You find yourself gritting your teeth as all that building catharsis gives way to physical distress. So close to breaking through...");
		output("\n\n<i>“I think that’s enough for you, precious. Uh, Cheo, the um... you know, thing,”</i> you hear Akane say from behind, pausing as she tries to think of the right word.");
		output("\n\nOnce again, a cold and wet sensation dribbles from your collarbones down your back, the cool infusion turning your patchwork of lash marks into a pleasant mesh of dull aches.");
		output("\n\nAkane approaches from your side, her hands moving to rest under your jaw.");
		output("\n\n<i>“How many, Cheo?”</i> she calls out, her glassy eyes and grinning face examining your own for something.");
		output("\n\n<i>“Thirty-one,”</i> comes the gruff reply from behind.");
		output("\n\n<i>“My my, quite the improvement, [pc.name]. Who knew you would take to this so quickly... consider me enamoured,”</i> she half-whispers to you, her ruby lips mere inches from yours. She leans in a little bit closer, almost planting them on your cheek, then...");
		output("\n\n<i>“Ah... no. Let’s just help you down from here first, hm?”</i> she whispers, stepping back to allow Cheo some space to help you.");
	}
	else if (pcIsPainslut())
	{
		pc.orgasm();
		output("\n\nYour voice squeaks and groans as that last hit forces your body to climax! You jerk and convulse in your restraints as ");
		if (pc.hasCock() && pc.hasVagina()) output("a simultaneous splatter of [pc.cum] and [pc.girlCum] gushes to the ground underneath");
		else if (pc.hasCock()) output("[pc.cum] splatters out of [pc.eachCock]");
		else if (pc.hasVagina()) output("[pc.girlCum] squirts and dribbles out of [pc.eachVagina]");
		else output(" SoAndSo gets around to writing a neuter version of this line"); // <- ASK ABOUT THIS
		output("!\nYour heart ticks over faster than ever as the overwhelming fusion of pain and euphoria numbs your shaking body to the core. Every muscle tightly stiffens around your frame, the <i>rush</i> of it all forcing everything to ache.");
		output("\n\nAt that moment, the clatter of leather comes from behind and Akane rushes to your side.");
		output("\n\n<i>“Hey, heyheyhey, shhh, there there! I’ve got you,”</i> she calls out, her arms wrapping around your waist to prevent you from slipping. Your [pc.legs]");
		if (pc.hasGenitals()) output(", now sodden,");
		output(" almost go" + (pc.hasLegs() ? "" : "es") + " limp but you prevail, a little bit of strength needed to stand. <i>“I’ve got you, okay? You did so well, so well! Stay with me,”</i> comes Akane’s breathless plea, her cheek rubbing against your " + (pc.tallness < 84 ? "own" : "sternum") + ". Your body slows down as her gentle affection warms you up again, this time with a deep-rooted and touching heat. Not just affection but maybe...");
		output("\n\n<i>“C-Cheo, come help me here,”</i> she says with a waver in her voice, her arms tightening around you as a form of support.");
		if (pc.cumQ() > 3000) output(" <i>“And get Yan to clear all this gunk up on the floor. Sorry, [pc.name], but that is... an absolutely revolting spillage you’ve caused.”</i>");
	}
	else
	{
		output("\n\nYour voice squeaks as the last hit brings you out of that cathartic mindset. A soft flow of pleasant arousal fills your [pc.chest] with heat, enough to make you relax in your restraints. The stinging in your back worsens as your body succumbs to stress and the clash of pain and pleasure with the tender marks now a reminder of how close you were to... something.");
		if (pc.hasGenitals())
		{
			output(" Whatever that something was, your [pc.groin] ");
			if (pc.hasCock() + pc.hasCocks() + pc.hasVagina() + pc.hasVaginas() == 1) output("leaks fluid");
			else output("leak fluids");
			output(" by the dribble-load, hinting at your body’s subconscious lust...");
		}
		output("\n\n<i>“Mmph, my my, quite the mess with have here. That’s enough for now, don’t you think?”</i> comes Akane’s voice from behind, her <i>click click</i> heels coming closer. Her mechanical fingers trace along your [pc.hip] to your neck, her face coming into view as she slinks in from your left.");
		output("\n\n<i>“How many, Cheo?”</i>");
		output("\n\n<i>“" + (40 + rand(10)) + ",”</i> comes the gruff call from behind.");
		output("\n\n<i>“Mm, getting there, aren’t we... someday, I’ll ring out your inner painwhore. Merely a slap or a spank and you’ll be gushing all over the floor. Wouldn’t that be something...?”</i> giggles the wide-eyed Akane, her gaze boring into yours.");
		output("\n\n<i>“Let’s get you out of these nasty, nasty cuffs, hmhmm.”</i>");
	}
	
	akaneWhippingDone();
}

public function akaneWhippingDone():void
{
	output("\n\nThe mechanical gauntlets holding you up spring open and release you. You almost fall to the floor, the quick intervention of Akane and Cheo holding you on each side halting you midway. You whimper as your body calms down from the ordeal, the numbness and aching giving way to fatigue and delirium. Gotta... find somewhere... to...");
	output("\n\nCheo bears the brunt of you on his shoulder, holding you up by himself as Akane quickly strides to the sliding door of her chambers.");
	output("\n\n<i>“Let’s get [pc.himHer] a place to cool down, Cheo,”</i> she calls out, gesturing the two of you to follow.");
	output("\n\nYou limp alongside the stocky ausar with timid steps. As you enter the chamber, the dim blue hue of the lights cools your mind somewhat, the physical pain seeming to numb as you approach her bed. Akane reclines on top, patting the space next to her for you alone. With Cheo’s guidance, you lay on top of the plush surface with a small grunt of discomfort. There’s little you can do but lay on your side.");
	output("\n\nAkane shuffles a little bit closer to you, her eyeline meeting yours with a loving gaze.");
	output("\n\n<i>“So...”</i>");
	
	akanePostSexOptions("WHIPPED");
}

public function akanePleaseComeAgain():void
{
	clearMenu();
	clearOutput();
	showAkane(true, true);
	
	if (flags["AKANE_TIMES_FORCED"] == undefined)
	{
		output("<i>“Ah! I know. Somethingggg messier,”</i> she exclaims with audible whimsy, her eyes darting between you, the door to her chambers and... your crotch.");
		output("\n\nEh?");
		output("\n\n<i>“Cheo, join us please. I might need some additional hands,”</i> she directs, taking you by the hand. She flashes a most innocent smile at you, the faintest glint of deviousness flashing across her void-black irises.");
		output("\n\nYou follow her, playfully pulled along by an energized Akane. Cheo follows after, shaking his head from side to side. Girls will be girls...?");
		output("\n\nThat view of him becomes shadowed as you’re yanked into the private chambers, the blue lighting making it seem like a different reality altogether.");
		output("\n\nYou’re brought to the center of the chamber, standing just in front of some kind of metal grilling on the floor. What’s it all for?");
		output("\n\n<i>“Might want to get undressed, [pc.name]. You have an invitation to Akane’s world and the dress code is a birthday suit,”</i> chirps Akane as she jogs to a non-descript storage box to the side of the room.");
		output("\n\nIf that’s how it’s played... you quickly strip from your gear, eager to find out what’s in store. You place your [pc.gear] near the bed and take up your spot again, must be a good reason for standing there after all.");
		output("\n\nYou spot Cheo holding several oddly shaped items in his arms. You can’t quite see what it all is but there are... straps.");
		if (pc.exhibitionism() > 40) output(" Wait a sec: he was watching you undress the entire time! What a dirty, dirty boy. The thought plays around with your voyeur side something fierce.");
	}
	else if (flags["AKANE_TIMES_FORCED"])
	{
		output("<i>“Want to get messy again?”</i> she says with a husky tone, void-black eyes darting all over your form.");
		output("\n\nYou hastily nod, hoping for it to be as complete and total as last time.");
		output("\n\n<i>“Come, come!”</i> says the enthused mob boss, pulling you by both hands to her chamber door.");
		if (silly) output(" SOMETHING SOMETHING NEVERMORE.");
		output(" You’re pretty much dragged from the wrists across the pathway, Cheo in a slow step behind you.");
		output("\n\nThe door parts open with a small <i>schwi</i> and the white of the long room turns into the hazy blue of the chambers. Akane pulls you along into her fold, making sure you’re placed near to that familiar grate once more.");
		output("\n\nYou don’t wait for her to tell you to prepare: you take off and place your [pc.gear] near the bed as before. Akane rummages through her crate of tricks to get what she needs for you while Cheo stands silently by the door with a bundle of restraints.");
	}
	else if (pcIsPainslut())
	{
		output("<i>“I want to get messy-”\n“Want to get messy?-”</i>");
		output("\n\nYou both blurt out your words simultaneously, pausing as the penny drops.");
		output("\n\nAkane bursts out in giggles, clutching your hands in hers. You can’t help but laugh as well, the moment having caught you off guard. Mecha-fingers slide up behind your head as she presses herself against you, her ruby lips so close to yours that you can taste them already. Your hands react on sexual instinct, landing on her hips with massaging fingers.");
		output("\n\n<i>“Huhhmmm, not yet. G-gotta... got to get you what you need,”</i> gasps the queen bee, almost trembling in your embrace. She steps back, quickly clasping your wrists. She looks at you dead in the eyes with a look that says everything: come with me.");
		output("\n\nAkane yanks you towards her chamber, almost pulling you off of your [pc.feet]. You both rush through the sliding door to her room and you’re dragged to that oh-so-familiar spot by the grate.");
		output("\n\nYou don’t wait for her to tell you to prepare: you take off and place your [pc.gear] near the bed as before. Akane rummages through her crate of tricks to get what she needs for you while the ever present Cheo stands silently by the door with a bundle of restraints.");
	}
	else
	{
		output("<i>“Uhhh, m-makmecummm,”</i> you blurt out, enthusiasm getting the better of you.");
		output("\n\nAkane zones in on your gaze like a predatory beast, pulling your head to hers so that you’re within kissing distance.");
		output("\n\n<i>“Say that again, precious?”</i> she whispers, unflinching in her stare.");
		output("\n\n<i>“Please make me cum,”</i> you say with forced calmness. She merely cocks her head to the side, as if waiting for you to finish.");
		output("\n\n<i>“...Akane,”</i> you add at the end, blinking uncomfortably.");
		output("\n\n<i>“Better,”</i> she finally says, smirking at your admittance. <i>“Come along, come along, I can smell the grovelling need all over you.”</i>");
		output("\n\nWith a giggle, she locks her mechanical hands around your wrists and pretty much hauls you into her chambers. The door parts open with a small <i>schwi</i> and the white of the long room turns into the hazy blue you’re used to. Akane hurriedly places you just over the grate, the same spot as ever.");
		output("\n\nYou don’t wait for her to tell you to prepare: you take off and place your [pc.gear] near the bed as before. Akane rummages through her crate of tricks to get what she needs for you while the ever present Cheo stands silently by the door with a bundle of restraints.");
	}

	output("\n\n<i>“Ahaah! Got ‘em,”</i> exclaims the enthused mob boss, the call now drawing your attention to her. In between her fingers are a variety of plugs, dildoes and assorted vibes of all sizes with wires spilling over her palms. ");
	if (flags["AKANE_TIMES_FORCED"] == undefined) output("Ohhhh... ! That’s what’s going to happen.");
	else output("Upon seeing them, your body can’t help but tingle internally at the thought of what’s to come.");
	output("\n\n<i>“Let Cheo help you out, [pc.name], just let him do his work. I’ve got to work out your... configuration,”</i> she quips, gaze swapping between your pelvis and her hands. Silent as ever, Cheo places his furred fingers on your shoulders from behind, sliding them down to your elbows.");
	output("\n\n<i>“Elbows here,”</i> he directs, pushing yours together so that they meet at the top of your [pc.belly]. <i>“Aaand fists here");
	if (flags["AKANE_TIMES_FORCED"] != undefined) output(". Just to make sure you don’t forget");
	output(".”</i>\n\nWith your forearms now together, the awkward pose forces your fists under your chin and jaw, preventing you from looking down with your neck. Cheo picks up a very long piece of that familiar red rope and begins binding your forearms, the eventual bind that he makes also wrapping under your armpits.");
	output("\n\n<i>“On your back,”</i> growls the ausar, gently pushing you down with one hand and holding your lower back with the other. Putting your trust in him, you let him guide you to the floor and straighten as much of yourself as you can.");
	if (pc.isTaur())
	{
		output("\n\nWith some additional rope, Cheo guides your ankles to a point facing upwards and binds them into a pseudo-hogtie. Although not uncomfortable, you have little ability to move your [pc.legs].");
		output("\n\n<i>“Hmm, you’re okay like this,”</i> he says softly. With some extra tightening around your wrists to your armpit, he steps away from your stretched out, tauric form.");
	}
	else
	{
		output("\n\n<i>“Nah, that won’t do. Gotta bring " + (pc.isNaga() ? "that tail up" : "those legs up, like a squat") + ",”</i> he murmurs, driven by procedure. You try doing so at first, only to have him position your [pc.legs] for you. He curls " + (pc.hasLegs() ? "them" : "it") + " up so that the excess rope has enough room to bind your [pc.legs] " + (pc.hasLegs() ? "by your spread-apart [pc.thighs] and shins" : ""));
		output(", the tension in the rope now pulling on your fists! Overall, the effect has your arms tightly bound over your [pc.chest] while your [pc.groin] become" + (pc.hasLegs() ? "" : "s") + " exposed to the air!");
	}
	output("\n\n<i>“All done here,”</i> says Cheo to the pondering Akane, the ausar slinking off into the shadows.");
	output("\n\n<i>“Mmm, let me inspect...”</i>");
	output("\n\nShe saunters her way over to you, hands filled with yet more phallic shapes and wires. She leans over you with her heels at either side of your head. With the only view being the one between her toned gymnasts thighs, you internally curse as the dim light covers the view in shadow.");
	output("\n\n<i>“Aw, so close yet so far. ");
	if (flags["AKANE_TIMES_FORCED"] != undefined) output("I will never, ever get bored from doing that, mmhm. ");
	output("On with the show,”</i> she teases, stepping over you to line up with your pelvis. She places her assortment of wires and plastic by your side, her sleek, metallic fingers lightly tracing around your [pc.groin]. The pinpoint contact tickles your [pc.skinFurScales], forcing a half-laugh, half-gasp from your lips. Wherever the line traces, a sensuous heat blooms underneath and spreads all throughout your lower body. The effect forces ");
	if (pc.hasCock() && pc.hasVagina()) output("[pc.eachCock] throb and harden then [pc.eachVagina] to moisten and puff up in seconds!");
	else if (pc.hasCock()) output("[pc.eachCock] to bounce and throb, coming to hardness in seconds!");
	else if (pc.hasVagina()) output("[pc.eachVagina] to moisten and puff up in seconds!");
	output("\n\nYou can’t help but inhale sharply as virulent arousal takes over your flesh, counteracting the growing aches in your bound limbs. You whimper as somewhere deep down, your body realizes you’re at a loss when you can become so aroused on mere command.");
	
	output("\n\n<i>“Theeere we go. Now hold still for me, precious,”</i> coos Akane, just out of sight. Your fists make it difficult to tell what she’s about to do but then-\n\n");
	if (pc.hasCock())
	{
		output("Her fingers grip and straighten your shaft" + (pc.hasCocks() ? "s, one by one" : "") + ", some sort of binding tightening around [pc.eachCockHead]. It all feels a little ‘heavier’ for some reason...");
		output("\n\nThen, some sort of strip is placed under your urethra" + (pc.hasCocks() ? ". It adheres" : "s. They adhere") + " naturally to the muscle; neither cold nor hot but definitely <i>strange</i>. ");
		if (pc.balls > 0) output("Something similar gets placed across your [pc.sack] with the same neutral sensation. Some kind of stim-pad, perhaps...? ");
	}
	if (pc.hasVagina())
	{
		output("Something hard and smooth pushes against the tingling folds of [pc.oneVagina], slowly parting them and driving itself inside your depths. F-fffuck that’s cold! You whimper again as the object continues, blessedly stopping after only a second or so of insertion. Not that big, you tell yourself, it’s not that big... ");
		if (pc.hasVaginas()) output("then comes another, similar pressure to your other pussy. [pc.eachVagina] gets the same treament, the smoothly inserted toys exciting your nerves to no end. ");
	}
	
	output("One extra pressure pushes in between your [pc.ass] and butts against your [pc.asshole]. You wince and whine as you understand what’s going to happen next, that thought blurred out as your teased hole is painfully parted. You find yourself gritting your teeth as the object get’s ever so slightly wider the further it’s pushed in! With an uncomfortable, final shunt");
	if (pc.hasCock()) output(", and your prostate now firmly pressed in by the dildo");
	output(", the faux-shaft gets lodged in.\n\n");
	
	if (flags["AKANE_TIMES_FORCED"] == undefined) output("<i>“Phwew, certainly got some... equipment, haven’t you? To each their own, I suppose");
	else output("<i>“Good thing I’ve had practice on you before, hm? Of course, gearing you up is only half the fun");
	output(",”</i> comments Akane as she stands up from the floor, a small box in her hand. Thin cables extend from the thing to the ground, ");
	if (flags["AKANE_TIMES_FORCED"] == undefined) output("towards your... ah.");
	else output("a comforting web that you bit your lower lip at the sight of.");
	output("\n\n<i>“All ready, my sweet?”</i>");

	addButton(0, "Y-Yeah!", akaneAgainAndAgainAndAgainAndAgain, undefined, "Y-Yeah!", "YEAH"); //Hetfield would be proud
}

public function akaneAgainAndAgainAndAgainAndAgain():void
{
	clearOutput();
	showAkane(true, true);
	pc.lust(pc.lustMax());
	
	output("You nod and smile as best you can, the excitement, teasing and arousal gearing up your suggestiveness and willingness.");
	output("\n\nAkane grins the grinniest of grins and twiddles some settings with her thumb.");
	output("\n\nIt begins quite gently at first.\n\n");
	
	if (pc.hasCock())
	{
		output("[pc.EachCock] react" + (pc.hasCocks() ? "" : "s") + " almost immediately to warm, tingly vibrations, centered from [pc.eachCockHead] all the way down to your [pc.base]. You attain full hardness in seconds, much to your delight. ");
		if (pc.balls > 0) output("Your [pc.sack] feels the same but to a lesser degree, instead mostly filling with a comforting warmth. ");
	}
	if (pc.hasVagina()) output("[pc.EachVagina] can’t help but wink and contract around the probe" + (pc.hasVaginas() ? "s buried within as they tease" : " buried within as it teases") + " the soft folds with gentle vibration. ");
	output("You purse your lips and exhale slowly as the vibe stretching your [pc.asshole] begins its work alongside. ");
	if (pc.hasCock()) output("A tiny ache growing from your prostate gets massaged away as the comfortable vibration becomes enough to make your toes curl. ");
	output("\n\nYou run into your first instinctual restriction: your bonds. With such little room to move your arms and [pc.legs], involuntary jerks and shakes fight against the rope in an awkward, rough manner.");
	
	output("\n\n<i>“How’s that, precious?”\n\n“");
	
	if (flags["AKANE_TIMES_FORCED"]) output("N-nice enough, aheh... a little bit tight");
	else if (pcIsPainslut()) output("Pleeease, it’s not e-enough");
	else output("Feels good, I-I just want more");
	output(",”</i> you say out loud, some pleasant jitters and shivers coloring your response.");
	output("\n\nAkane merely chuckles, her thumb pressing on some more buttons.");
	output("\n\nThe sudden jump in intensity catches you by surprise. The vibe" + (true /*multiple vibes?*/ ? "s now audibly whirr" : " now audibly whirrs") + " from beneath you, the pleasant throb turning into an intense assault on your [pc.asshole] and [pc.groin].\n\n");
	
	if (pc.hasCock())
	{
		output("[pc.EachCockHead] twinge");
		if (pc.hasCocks()) output(" and pulse as if they were trying to rip themselves from the shafts.");
		else output("s and pulses as if it were trying to rip itself from the shaft.");
		output(" The new intensity in nerve teasing from the adhesive strips hardens the inner muscle further: you find yourself unable to relax your cock" + (pc.hasCocks() ? "s! " : "! "));
		if (pc.balls > 0) output("The dermis of your [pc.sack] grows hotter, the jump in intensity forcing your kegels to reflex and [pc.eachCock] to twinge all the more. ");
	}
	if (pc.hasVaginas()) output("The probes buried firmly in [pc.eachVagina] touch every sensitive part possible as they kick up a notch, your G-spots getting the best of its unfaltering vibrations. ");
	else if (pc.hasVagina()) output("The probe buried firmly in [pc.eachVagina] touches every sensitive part possible as they kick up a notch, your G-spot getting the best of its unfaltering vibrations. ");
	output("Lastly, the thick plug that stretches your [pc.asshole] makes you clench every connected muscle as it ramps up. ");
	if (pc.hasCock()) output("Reflexive movements try to force out the probe as it subjugates your poor prostate but the more you squeeze, the tighter everything becomes...");

	if (flags["AKANE_TIMES_FORCED"] == undefined)
	{
		output("\n\nYou can’t help but continuously whine in submission as this new sensation takes over you, punctuated by sharp inhalations through gritted teeth. What feels like a flame borne out of your bones takes over every joint and muscle as they lock up from this intense fusion of euphoria and agony.");
		output("\n\n<i>“Aw, now now, we’ve barely even begun,”</i> calls out a calm Akane over your bleating, her face overcome by a wide-eyed and blank stare.");
		output("\n\n<i>More...?!</i>");
	}
	else if (pcIsPainslut())
	{
		output("\n\nYou’re ready for what’s next; the routine is integral to Akane’s system. As lust, muscle pain and loosening inhibitions pile up, you give in to your body’s need to let it all out. You whine and moan on the ground without a care for restraint, the numbing fusion filling you with <i>godly</i> sensations.");
		output("\n\nAkane remains silent, her black irises constantly scanning and analyzing your state and reactions. You can see her chest heaving through her silver dress; either from pressure or from... excitement.");
	}
	else
	{
		
		output("\n\nEven with last time’s practice embedded in your memory, you still find yourself trying to stifle your reflexive whines. You give in even more easily to your body’s lack of control, the muscle spasms and continuous contractions fusing a bodily pain with the vibe array’s bliss.");
		output("\n\nA particularly strong surge of arousal forces you to hold your breath to fight it back. It only takes a few seconds for you to break from it, pain gasps taking over you as it passes.");
		output("\n\n<i>“Yeees, why fight it, hm? Give in to your body. In turn, let it give you what you need,”</i> calls out a calm Akane over your bleating, her face overcome by a wide-eyed and blank stare.");
	}
	
	output("\n\nShe presses some more buttons.");
	output("\n\n<i>Fuck!</i>");
	output("\n\nThe intensity of <i>everything</i> rises as the vibrations of the noisy probes ramp up dramatically. Whatever your body thought of as ‘intense’ is smashed apart as your cries rise higher and higher, your lower body twitching and shaking: you’re gonna blow!");

	addButton(0, "Jizz!", akaneItsOverWaitNoItIsnt);
}

public function akaneItsOverWaitNoItIsnt():void
{
	pc.orgasm();
	clearOutput();
	showAkane(true, true);
	if (pc.hasStatusEffect("Sore Tubes")) pc.setStatusMinutes("Sore Tubes", 3 * 24 * 60);
	//Damage in Creature.orgasm;
	else pc.createStatusEffect("Sore Tubes", 0, 0, 0, 0, false, akaneSoreIcon, "Orgasms damage you!", false, 3*24*60, UIStyleSettings.gStatusBadColour);
	
	output("All at once, everything reaches its peak; from the pain of tension to the euphoria of release, you clench your teeth and scream out. ");
	if (pc.hasCock()) output("[pc.EachCockHead] erupt" + (pc.hasCocks() ? " with hot [pc.cum]! It pulses out of each" : "s with hot [pc.cum]! It pulses out of your") + " shaft in random directions, landing with audible splatters on you and around you. With a quick foot, Akane uses the arch of her heel to bend the pulsing shaft" + (pc.hasCocks() ? "s" : "") + " towards the grate beneath you. ");
	if (pc.hasVagina()) output("[pc.EachVagina] grip" + (pc.hasVaginas() ? " and squeeze at the probes" : "s and squeezes at the probe") + " buried within, [pc.girlCum] " + (pc.isSquirter() ? "spurting" : "oozing") + " out of the tight seal" + (pc.hasVaginas() ? "s" : "") + " and all over the floor.");

	output("\n\nYour whole body shakes and quivers as a powerful orgasm hits you all over, forcing your bound limbs to jerk against their restraints. By the end of your climax, you’re left aching, hot and breathless; veins and arteries throb against the sides of your head with enough force and speed to make you wince.");
	output("\n\n<i>“Aw, look at all that mess you made. " + (pc.cumQ() > 3000 ? "Good thing it’s all going to waste, wouldn’t want stains and odd smells everywhere, ickkk" : "I wonder how much you’ll make when...") + ",”</i> quips Akane from above you.");
	if (pc.hasCock()) output(" She releases your cock" + (pc.hasCocks() ? "s" : "") + " from her heels hold as a token of mercy.");
	output("\n\nShe paces and prowls around you with the box and wires still in her hands. You feel another layer of relief hitting you as the vibrations return to low and slow pulses.");
	output("\n\n<i>“How about another?”</i>");
	
	if (flags["AKANE_TIMES_FORCED"] == undefined)
	{
		output("\n\n<i>“A-another...?? Uhh...hhh,”</i> you try forcing out, still breathless from it all.");
		if (pc.hasCock()) output(" Your half-hard shaft" + (pc.hasCocks() ? "s still twinge" : " still twinges") + " in place, ready for another round...");
	}
	else if (pcIsPainslut()) output("\n\n<i>“Y-yes, a-another! Please Akane...”</i> you call out at the top of your lungs, feeling a second wind kick in already.");
	else output("\n\n<i>“Ye-yes...”</i> you weakly force out, breathless but wide-eyed and alert.");

	output("\n\nAkane sighs with a smile on her face, tapping on the buttons once more.");
	output("\n\nYou reflexively whine as the array of vibes ramp back up again, a deep thrum returning to reignite your body’s lust. ");
	if (pc.hasCock()) output("Still hard but now numbed from a fresh cum, [pc.eachCock] jerk" + (pc.hasCocks() ? "" : "s") + " up to full height once again with the pads adding subtle warmth to the used up muscle. [pc.eachCockHead] pulse" + (pc.hasCocks() ? " as the vibes connected whirr" : "s as the vibe connected whirrs") + " away. ");
	if (pc.hasVagina()) output("You almost jerk upwards with a body crunch as [pc.eachVagina] get" + (pc.hasVaginas() ? "" : "s") + "vibed and sodden again. ");
	output("All the while, the probe filling your [pc.asshole] sits at the same ‘deep massage’ setting. ");
	if (pc.hasCock()) output("You silently thank and curse the thing for keeping your prostate nice and juicy throughout.");
	
	addButton(0, "More...!", akaneMoarMoarMoar);
}

public function akaneMoarMoarMoar():void
{
	clearOutput();
	showAkane(true, true);
	pc.lust(pc.lustMax());
	
	output("It seems different now.");
	output("\n\nInstead of the exciting-if-strong throb that built you up before, that same setting feels like hot fire against all of your most sensitive and vital areas. You find your limbs locking and tensing up out of reflex, the rope restraints easily keeping them from moving at any significant speed. The material still feels soft but also uncomfortably taut against your [pc.skinFurScales].");
	output("\n\n<i>“And how’s the little rope bunny doing...?”</i> questions Akane, probing the side of your arm with the tip of her faux-foot.");

	if (flags["AKANE_TIMES_FORCED"] == undefined)
	{
		output("\n\nYou whine again when it makes contact, making you instinctively realize that all forms of nerve are extremely sensitive.");
		output("\n\n<i>“Oh don’t fret, my dear [pc.name]. If you’ll hang on and allow me to do a bit of this... and this,”</i> she says casually, as if ticking off a to-do list but with a box of wires instead.");
	}
	else if (pcIsPainslut())
	{
		output("\n\nYou gasp as the cool metal tip touches on the sensitive bundles of nerves that your body has become. What your body feels - agony, euphoria, both - devolves in your mind is pure, animalistic sense. Without thinking to do it or thinking on it, you’re smiling wide and proud as you enjoy Akane’s touch in the most pure way.");
		output("\n\n<i>“That’s right, that’s right, my little perfect plaything. A mere touch is all it takes now...”</i> whispers the wily domme, bending to one knee by your side.");
		output("\n\n<i>“Let’s take this last leg together, hm?”</i> she assures, stroking your [pc.hair]. You feel your eyes flutter as Akane’s fingers stroke the top of your head, eliciting a giggle from her. She stands up just as quickly, the box of with connected wires getting another thorough button-pushing.");
	}
	else
	{
		output("\n\nYou bite your lip down as the pressure point excites your sensitive flesh, fusing hot pain and pleasure together from only a mild touch. You do your best to stifle a whine, the merest hint of a note coming through.");
		output("\n\n<i>“That’s better, see? Self-control is something you learn, " + (silly ? "<i>I’M IN CONTROL OF THE INFINITE MIND, AND I CONTROL INFINITE POWER</i> ": "") + "then maybe with enough practice... enjoyment is something you earn,”</i> she half-whispers, kneeling by your head. What she’s saying seems odd and whimsical: who cares? You’re just trying not to black out!");
		output("\n\n<i>“With that said, I’ve so little of either! Ha!”</i> exclaims the grinning domme, fiddling with the box once more.");
	}

	output("\n\nThis time, you’ve no control over your whines and cries. Although not quite as intense as your pre-jizzing torture, the combined stimulation forces your muscles to lock up as your will to cum is tested.");
	output("\n\nAkane takes a spot up behind you, lifting you up by your shoulders to a pseudo-sitting position. She slips her sleek legs past either side of you and lets your head rest against her shrink-wrapped chest. Her hands, still clutching the control box, come around to rest on your folded arms.");
	output("\n\n<i>“I’ve got you, right? The last leg of this little journey. Do me proud,”</i> she whispers into your [pc.ears], thumbling with the buttons once more.");
	output("\n\nThe heat rises, the vibrations strengthen, your body gives in: you cum!\n\n");
	
	if (pc.hasCock()) output("Your tired-out shaft" + (pc.hasCocks() ? "s jerk and bounce" : " jerks and bounces") + " as thin streaks of [pc.cum] spurt wildly into the air! It splatters all over the floor before you and slowly trickles to the grate. ");
	if (pc.hasVagina()) output("[pc.EachVagina] leak" + (pc.hasVaginas() ? "" : " s") + " [pc.girlCumColor] into the grey floor, your [pc.legs] shaking in place as feminine, orgiastic pleasure rocks you.");

	output("\n\nYou only have strength to cry out as it ends, the strain on your [pc.groin] forcing pain into your overused, sensitive nerves. You wish to shout stop but there’s just no energy, no focus: your breathless, spent state leaves you vulnerable in Akane’s grasp.");
	output("\n\n<i>“Shhh, it’s all okay. Slooow down and relax with me, hm? Deep breaths,”</i> she half-whispers, her fingers at work on the box of wires. In an instant, the tortuous warmth and vibrations cease. Your eyes flicker as you try to follow her lead: slow... <i>nhhhh</i> breaths...");
	output("\n\nEverything seems blurrier.");
	output("\n\nThe darkness of the room darkens further still as fatigue blots out your thoughts.");
	output("\n\nYou blink a few times... only to find yourself lying on your side side on top of Akane’s bed. The dark-haired domme smiles to you as if you were coming round from a long, deep sleep.");
	output("\n\n<i>“Hey there.”</i>"); //General Kenobi

	akanePostSexOptions("FORCED");
}

public function akaneOPIsASlowRideFoghat(usingDick:CockClass):void
{
	clearMenu();
	clearOutput();
	showAkane(true, true);
	pc.lust(pc.lustMax());
	pc.applyPussyDrenched();
	
	if (usingDick) pc.applyBlueBalls();
	
	if (flags["AKANE_TIMES_RIDDEN"] == undefined)
	{
		output("<i>“Hmm, not in the mood to do painplay right now... how about something nicer, [pc.name]?”</i> she smirks, her thumb running " + (pc.isBald() ? "across" : "through") + " your [pc.hair]. You get the feeling that she means to be genuine, especially with her slower, considered movements.");
		output("\n\n<i>“I could do that,”</i> you say coolly, glancing over to the side with a matched smirk. <i>“What did you have in mind?”</i>");
		output("\n\n<i>“Shhhshhh, just come with me,”</i> she says hurriedly, her hands locking round your wrists to pull you to her chambers. You’re almost yanked off of the spot!");
	}
	else
	{
		output("<i>“Mm, willing to have me on your lap again...?”</i> whispers the mob boss, shuffling a little closer to you so that her dress-wrapped chest ");
		if (pc.tallness < 66) output("meets your neck");
		else if (pc.tallness < 76) output("presses against yours");
		else output("presses against you");
		output(". With your eyelines locked together, you see a hint of a rosy blush develop in her cheeks.");
		
		output("\n\n<i>“Very willing, Akane, oh so willing,”</i> you whisper back, pressing your nose to hers for a soft nuzzle. Taking the hint, Akane plants her ruby red lips to yours with her hands tugging at your [pc.hips]. Your cheeks flush with tender warmth at her show of passion but the tender kiss is swiftly broken.");
		output("\n\n<i>“On we go,”</i> giggles the excited domme, pulling you by your wrists to her personal chambers!");
	}
	
	output("\n\nTogether, the pair of you pretty much dash to the sliding door with you nearly tripping as you’re yanked along.");
	output("\n\nThe white light of the long room turns into the blueish grey ambience of Akane’s bedroom, the giggling domme hurriedly placing you on a spot just before the bed. Unsure of whether to sit or not, you glance around you for a second for some guidance. Instead, Akane’s right foot launches flat against your [pc.chest] and pushes you to the bed!");
	output("\n\nYou fall flat on your back and the needy domme is already on top of you, her gymnasts body climbing over you like it wasn’t there. She comes to rest on top of your [pc.belly] with her legs spread to either side of you.");
	output("\n\nHer hands pin you down by your shoulders before you can even react, not that you were planning to: she always takes lead, after all. Her gaze traps your attention entirely but you can feel her grinding her pelvis against your [pc.armor]. Akane leans forward so that her face comes within kissing distance with her glossy hair trailing over her face.");
	if (flags["AKANE_TIMES_RIDDEN"] == undefined) output("\n\n<i>“Gahhh, I always feel useless with this luvvy duvvy ‘normal’ stuff but... maybe you’ve earned a reprieve from all that mmm, stimulation I give you,”</i> ");
	else output("\n\n<i>“Mmmhmmm, let’s not waste words this time, hm? Just get that thing of yours out,”</i> ");
	output("she giggles, her splayed fingers trailing across your cheek.");
	output("\n\nWith the promise of pussy on the mind, you reach around Akane and start to undo your [pc.armor]. Through touch alone, you’re able to loosen the clothing cage ");
	if (usingDick) output("housing [pc.eachCock] and then let " + (pc.hasCocks() ? "them free to rest in semi-hard states. " : "it free to rest in a semi-hard state. "));
	else output("where you have your hardlight device stored, a few twiddles of the settings causing the [pc.cockOrStrapon] to flash into existence. ");
	output("Akane herself continues to grind against you, her lips taking yours off guard for a deep, tongue-heavy kiss.");
	output("\n\nShe yanks your hands and places them on her skirt hem, the two of you pulling the flexible silk up to her diaphragm to reveal her feminine nethers: a trimmed, dainty flower of a pussy, glistening and grinding against your [pc.belly].");

	if (flags["AKANE_TIMES_RIDDEN"] == undefined)
	{
		output("\n\n<i>“Be gentle with me, please? I’m not a New Texan by any stretch...”</i> she whispers to you, a hint of shakiness in her voice. Asking <i>your</i> permission...?");
		output("\n\nYou nod, sensing that it wouldn’t do well to hurt her. That’s what you get Akane to do to <i>you</i>, after all. With another giggle, she shuffles herself backwards to line herself up with your pelvis.");
	}
	else output("\n\n<i>“Like last time, nice and slow and... gentle, yeah?”</i> she whispers to you with her eyes shut, palpable unease in her voice. She presses her forehead to yours and cradles your head in her palms. You whisper back to her that you’ll do all that she asks as always, much to Akane’s delighted grin. You hear her whisper a <i>“Thank you...”</i> as she shuffles backwards.");

	output("\n\nYou lean back on your elbows as you watch her trepidatious movements, a grin spanning your face as her cold fingers fumble around to guide your [pc.cockOrStrapon] to her entrance. In short order, she lines the " + (usingDick ? "[pc.cockHead]" : "hardlight head") + " perfectly to her soft-lipped snatch and begins sinking onto your shaft. She inhales sharply as the penetration parts her open, a sumptuously warm, <i>tight</i> sheath now slowly enveloping your shaft.\n\n");

	if (usingDick && usingDick.cLengthRaw <= 7) output("<i>“Mmm, there we go... l-lemme just adjust,”</i> mumbles Akane, sliding all the way down to your [pc.knot]. She chuckles as she comes to rest on your lap, her hands resting on your [pc.belly].");
	else if (!usingDick || usingDick.cLengthRaw <= 10) output("<i>“A-almost, almost, just a little more...”</i> mumbles Akane, taking your length to within an inch or so of your [pc.knot]. You can feel the tightness of her pussy squeeze down as your " + (usingDick ? "[pc.cockHead]" : "hardlight head") + " hits the deepest parts. Apparently comfortable, she rests her palms on your [pc.belly] to use as support.");
	else output("<i>“Fuh... why does there have to be so much...”</i> she murmurs, her eyes shutting and teeth clenching as she stops a few inches shy of your [pc.knot]. You can feel the tightness of her pussy squeeze down as your " + (usingDick ? "[pc.cockHead]" : "hardlight head") + " hits the deepest parts. Seemingly comfortably, she rests her palms on your [pc.belly] to use as support.");
	if (usingDick && usingDick.thickness() > 2) output(" <i>“Juh... why do you have to be so thick...?”</i> she whines, her softened abs tensing and relaxing as she breathes. <i>“I can take it, I can take it, I can...”</i>");
	
	output("\n\n");
	if (pc.cockChange(false)) output("\n\n");

	output("You place your hands around her waist, warm palms touching upon her cold skin. She sighs with a smile as you do so but still shivers on the spot as you make contact.\n");
	if (pc.isNaga()) output("Upon seeing this, you instinctively wrap your [pc.legs] around her middle for a loose tail hug with the hope of making her feel safe. <i>“Aw, [pc.name]...”</i> she croons, appreciatively patting your coiled tail.\n");
	output("The breathy domme starts slow, her hips swaying and gyrating from side to side. Each movement forces your [pc.cockOrStrapon] to slip and slide around within her and the snug, warm confines of her cunt grip loosely with her wet arousal.");
	output("\n\nShe’s quite stiff at first, as if getting used to your particular shape was a challenge. You go with her movements, massaging her hips with your palms as she rides your lap.");

	output("\n\n<i>“Feeling good?”</i> she asks between breaths, pushing herself to a proper cowgirl position with one hand on your gut and one just above her clit. You nod and smile the dopiest smile, mouthing <i>“yeah”</i>.\n\n<i>“");
	if (flags["AKANE_TIMES_RIDDEN"] == undefined) output("Efffffhhh, good. Now I want");
	else output("Now just like last time, I have");
	output(" to feel what you feel,”</i> she says in a clearer tone, inhaling sharply as she rubs her metal palm against your [pc.belly]. As her fingers trail across your [pc.skinFurScales], a familiar warmth blooms internally wherever her digits go. You feel everything twinge and tickle within your gut, the effect multiplying in your [pc.groin] as indescribable pleasure.\n\n");

	if (flags["AKANE_TIMES_RIDDEN"] == undefined) output("You watch her closely as she does this, her other hand gliding all over her lower body with similar movements. Judging by the squeaks and peaks in her voice, she must be feeling the exact same thing on a much more intense level.");
	else output("You guide her other hand along as she mirrors the patterns across her own lower front; the feedback she’s experiencing from the empathic exchange of pure <i>feeling</i> must be intense! Her face continuously scrunches and relaxes between a wince and a joyous, glassy-eyed smile. She almost looks close to fainting...");

	output("\n\nYou’re close to <i>something</i> as well, the building lust making your inner muscles feel looser and hotter like a forced workout.");
	output("\n\nYour brow furrows and scrunches up as Akane’s sensuous rhythm and dexterous touch combines into a singular feeling of raw, indefinable bliss. Blood and arteries pump against the sides of your head as your body is pushed through this more and more! The throb becoming unbearable, <i>painful</i> even. You slap your fists against the bed as it builds up in your head, traverses in waves down your spine and blends into the loving pleasure from your [pc.cockOrStrapon].");
	output("\n\n<i>“A-a-almost, almo...!”</i> gasps the gyrating domme, her gasps cut between stifled squeals. You doubt there’s any way you can hold on if she keeps this up, but the-");
	output("\n\n<i>“Ahaa... ah.... Fuh...!”</i>");
	output("\n\nAkane flash freezes on the spot, her mouth gaping open as a silent, overwhelming orgasm takes hold of her. Her limbs quake about her, her abs contract and relax while her velvety snatch oozes with warm, feminine fluids all over your pelvis.");
	output("\n\nHaving not quite reached the same peak, you anticipate her losing composure. Instead, she just falls forward with her arms limp to the sides. You just about manage to soften the fall by gripping her shoulders, allowing the breathless Akane to rest on top of you.");
	if (pc.tallness <= 72) output(" A small part of you instantly regrets having 6 foot of cyborg flop on top of you but the rest wants nothing more than for her to feel safe...");
	output("\n\nYour [pc.cockOrStrapon] slowly recedes from out of her flexing snatch, an audible grunt passing through your ears from the quivering domme.");
	output("\n\nThe shaft springs about in a near-hard state, still in need of relief.");
	output("\n\nAkane seems out for the count, at least on the face of things. You can hear her murmur and mouth words but she stays silent all the same, completely spent of energy. Your instinct is to wrap your arms around her middle and hug her tight and the gentle warmth of two aroused bodies couldn’t be more blissful.");
	output("\n\n<i>“W-wait... but you didn’t...”</i> murmurs Akane, weakly pushing herself up with her hands planted on the bed. <i>“You didn’t get off... now what kind of fun is that...?”</i>");
	output("\n\nShe slinks backwards on her knees....");
	
	addButton(0, "Shhh", akaneEndOfTheRide, undefined, "Shhh", "Pull her to and continue hugging. Doesn’t matter if you didn’t get off, she’s all used up.");
	addButton(1, "Let Her", akaneRideThroughTheNight, usingDick, "Let Her", "Sit back and let her do what she wants to you, she’s a tough old girl...");
}

public function akaneEndOfTheRide():void
{
	clearOutput();
	showAkane(true, true);
	
	output("No, she’s a mess. For once, you feel the need to take control as the giddy Akane tries - badly - to slink her way to your pelvis. You pull your hands down firmly so that she’s pressed against you once more, her weakened limbs relenting in an instant to your insistence.\n\n");
	if (flags["AKANE_TIMES_RIDDEN"] == undefined)
	{
		output("<i>“Oof... why? Dont you... dont you want a nicer... ending?”</i> she whispers to you, her mecha-fingers trembling as she strokes your jawline.");
		output("\n\n<i>“No, you’re a mess,”</i> you say firmly, trying not to laugh at her stroppy face.");
		output("\n\n<i>“Fffffffffffine,”</i> she giggles weakly, rolling over to her back.");
	}
	else
	{
		output("<i>“Ugh... you’re right. It’d not be that satisfying with these silly fingers just... flailing,”</i> she giggles, rolling onto her back beside you. She turns her head the side with a tired smile adorning her blushing face.");
	}
	output("\n\n<i>“So what now, precious?”</i>");
	
	akanePostSexOptions("RIDDEN");
}

public function akaneRideThroughTheNight(usingDick:CockClass):void
{
	clearOutput();
	showAkane(true, true);
	pc.orgasm();
	if (pc.hasCock()) pc.applyCumSoaked();
	
	output("...And you let her do so, your chest fluttering as she positions herself into a loose 69 on top of you. You pay little attention to her feet and heels which slide under your arms with small effort. Now you’ve got a full view of her dampened snatch, the slightly pulsing labia still flushed with arousal. ");
	if (flags["AKANE_TIMES_RIDDEN"] == undefined) output("She wants more, does she...?");
	else output("You already know her game but hell yeah, you’re going to play along anyway!");
	output("\n\nYou’re distracted by her dripping gash. Such a delicate thing... you don’t even pay attention until the last second as Akane sits up in a swift motion and plants her MILF muff right onto your [pc.face]!");
	output("\n\nYour [pc.lips] part on their own accord, the sudden taste of pussy coaxing your [pc.tongue] to penetrate her as far is it can.\n\n<i>“");
	if (flags["AKANE_TIMES_RIDDEN"] == undefined) output("Thaaat’s it, I’m gonna get one more fuck out of you yet!");
	else output("Something tells me you wanted me to use your face, hm?");
	output("”</i> she calls out from above, her energy returning from nowhere. To prove her point, she rolls her hips front, back and side-to-side across your head so that your face is used like some toy. Her gymnasts thighs and mecha-calves clamp down on your arms with just enough strength to be uncomfortable, preventing them from moving.");
	output(" As she does this, you feel her cool metal fingers drag and trace along your [pc.cockOrStrapon] with a clawed pattern. The five tips blossom with concentrated heat across your " + (usingDick ? "" : "faux-") + "shaft, the sudden feedback making you wince as it spreads itself throughout your lower body.");
	output("\n\nYou were already pretty pent-up before... you could blow at any second!");
	output("\n\n<i>“Nngggyes...! Use that t-tongue...”</i> whines the gyrating domme, your mouth getting a trickling wash of feminine juices as she wails. As your use your mouth muscle to clean her out, the sensations that tingle and sting your throbbing shaft building and building until-");
	output("\n\n<i>“Mmrrwrfffffmm!”</i>");
	output("\n\nYou can’t even scream. Your [pc.legs] can barely hold " + (pc.hasLegs() ? "themselves" : "itself") + " in place as a long overdue climax erupts from within. ");
	if (usingDick) output("[pc.EachCock] spray" + (pc.hasCocks() ? " their loads" : "s its load") + " freely off of the bed, pulses of blissfully hot [pc.cum] leaving their ephemeral mark on your hand-clasped cock" + (pc.hasCocks() ? "s." : "."));
	else if (pc.hasVagina()) output("The hardlight device sends intense pulses of sensation all the way through [pc.eachVagina], those pulses tearing into your most tender nerves in cathartic and pleasurable ways.");
	//What if no vagina tho

	output("\n\nYou let your body fall limp as your orgasm passes, muffled in... well, muff.");
	output("\n\nAkane, all breathy and sweaty, groggily disentangles from you and slumps onto her back beside you. She turns her gaze to yours, giggling as you absent-mindedly lick and lap at your femcum-glazed face.");
	output("\n\n<i>“Sooo then...”</i>");

	akanePostSexOptions("RIDDEN");
}

public function akaneTenderOralSurrender():void
{
	clearMenu();
	clearOutput();
	showAkane(false, true);
	
	var firstTime:Boolean = (flags["AKANE_TIMES_LICKED"] == undefined);
	
	if (firstTime)
	{
		output("Her face screws up as she looks you over, not out of frustration but more out of... worry?");
		output("\n\n<i>“Perhaps something a bit less intense for today. What do you say, hm?”</i> she says softly, stroking your cheek with the back of her hand. <i>“There are many ways to get you what you need, after all.”</i>");
		output("\n\nYou nod slowly, saying that her idea sounds intriguing. Your hand finds itself clasping her elbow as she strokes you, bringing a knowing grin to the dark-haired dommes face.");
		output("\n\n<i>“Cheo, a wrist bind for [pc.name], if you please,”</i> calls out Akane, her eyes never looking away from you.");
	}
	else if (pcIsPainslut())
	{
		output("You merely point to your [pc.lipsChaste] with both hands, then point downwards to the ground.");
		output("\n\nAkane giggles as you sign out your intentions, her thumb moving to caress your cheekbone.");
		output("\n\n<i>“Already reading my mind, hm? I wouldn’t expect anything less,”</i> she giggles, planting a kiss on your forehead.");
		output("\n\n<i>“Cheo, Cheo, wrist bind, you know the thing,”</i> Akane says quickly, stealing an opportunity to enjoy the feel if your cheek against hers.");
	}
	else
	{
		output("<i>“C-can I... please you like last time?”</i> you force out ahead of her answer, a mild blush forming under your cheeks.");
		output("\n\n<i>“Awhaw, how could I say no to that face?”</i> giggles the domme, one of her hands moving to stroke your cheek. <i>“Got a taste for little old me? Mhm, hmhm...”</i>");
		output("\n\nYou can’t help but return her smile, your gaze drifting off to the side as you briefly dwell on just how needy you must sound.");
		output("\n\n<i>“Well then... Cheo? Going to need a nice wrist bind again, if you please,”</i> calls out Akane as she admires your [pc.face].");
	}
	
	output("\n\nYou feel the fuzzy hands of Cheo guide your wrists together behind your back. He quickly binds them together with a comfortably tight arrangement and he’s over and done without you breaking your gaze from Akane. She can’t keep her eyes away from you, like a sculptor looking for flaws in her work. The moment is broken abruptly by her turning you on the spot, a firm but comfortable grip pushing you insistently to her personal chambers. You go along with it, of course: the excitement infects you both.");
	output("\n\nThe door slides open and the two of you sprint over to the bed. The eager domme steps just ahead of you to lead the way with you awkwardly yanked along. Once you’ve reached the bed, she guides you to a rough spot in front of her and sits herself on the edge.");
	output("\n\n<i>“Kneel,”</i> she commands, brushing her glossy hair from her face to reveal a lust-driven grin.");
	output("\n\nYou do so " + painslutornot("immediately", "with a cautious step") + ", the excitement of it all stringing you along.");
	if (firstTime) output("\n\nYou don’t even really know what you’re doing yet!");
	else output("\n\nAnything to get a taste of... her.");
	output("\n\nWith your [pc.knees] planted firmly on the ground and your head level with her");
	if (pc.tallness > 84) output(" chest");
	else output(" navel");
	output(", she beckons you closer with her index fingers. You shuffle a few inches forward so that you’re level with her spreading cyber-legs, eager to maintain eye contact from below.");
	output("\n\nAkane halts your advance with a full hand of fingertips pressed to your forehead.");
		
	if (firstTime)
	{
		output("\n\n<i>“Hold it. Good " + pc.mf("boy", "girl") + ". Put that tongue of yours out, would you?”</i> she coos, gently massaging your forehead with her sleek, metal fingers. The small sting that forms under your skin encourages your compliance.");
		output("\n\nYou open your mouth as wide as it can go, slowly pushing your [pc.tongue] out to its full length.");
		if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" You restrain yourself from giggling as Akane’s face turns from excitement to confused surprise, her brow contorting in all shapes as she watches your mouth muscle unfurl."); 
		else output(" Akane’s grin turns into a keen squint as your mouth muscle peeks out between your [pc.lips].");
	}
	else if (pcIsPainslut())
	{
		output("\n\n<i>“Hold it,”</i> she firmly calls out, your body automatically halting on command. As you stop, your mouth opens up just as reflexively. You just about manage to pause before she gives the command...");
		output("\n\n<i>“Tongue. Out,”</i> she says with a pause in between, smiling as your [pc.tongue] escapes paste your [pc.lips].");
		output("\n\n<i>“Mmhmm, lovely...”</i> she half-whispers, her fingertips massaging your brow with tender micromovements.");
	}
	else
	{
		output("\n\n<i>“Ahdadadastop. Stop. You know the drill, precious. Show me the goods,”</i> she smirks, pointing to your [pc.lips] with her free hand.");
		output("\n\nOn command, you open your mouth as wide as it can go and unfurl your [pc.tongue] for her to see. Her smirk turns into a grin, the subtle twinge of stinging pain playing across your brow. It’s hard to say if that was firm encouragement or... a reward.");
	}
	
	output("\n\nWith her free hand, she slides your tongue between her index and middle fingers. She clamps them together so that your tongue is caught in a painless pinch. Akane gently manipulates her pincering fingers up and down, side to side: you do your best oblige her, even having to turn your head in spots to avoid pain from her pulling.");
	output("\n\nApparently satisfied, she retracts her hand from your forehead which leaves a subtle blooming of warmth under your [pc.skinFurScales]. On her other robo-hand, her fingers release your [pc.tongue] with her index’s tip trailing across the surface. You can almost taste the metal as her slow-drag goes from teeth to tongue tip. As she ends her little inspection, Akane’s lower lip receives a firm chewing and her hair loses some of its composure and cascading shape as she brushes it aside.");
	output("\n\n<i>“Mm, here we go,”</i> she murmurs, gripping at the hem of her short silver qipao. She lifts the material with tantalizing slowness, pulling the back of it over her toned gymnasts derriere first. Her knees <i>clink</i> together as she moves her hands round to the front, forcing you to lean back slightly with a blocked view from in front of you. So close... you find yourself chewing your lower lip.");
	output("\n\nShe pulls the hem up until it reaches her navel, exposing the taut, pale detail of her soft abs and midriff.");
	if (pc.lust() >= pc.lustMax()) output(" The urge to just force her legs apart with your [pc.face] to get at what’s inside is... almost overwhelming!");
	output("\n\nAkane - amused by your reaction - giggles in her seat.");
	output("\n\n<i>“Just the sweetest little thing, aren’t you?”</i> she says adoringly, scrunching the hem up so that it holds at her navel. With an immovable mechanical grip, she pulls you ever so gently closer by the top of your [pc.hair]. With the other hand, she begins to glide her palm from her bellybutton to her nethers. With the two motions in sync, her legs spread apart once more to reveal your prize.");

	addButton(0, "Oh Babeh", akaneBabyBabyBabyWhoooral, firstTime, "Oh Babeh", "<i><b>OH BABY</b></i>");
}

public function akaneBabyBabyBabyWhoooral(firstTime:Boolean):void
{
	if (silly)
	{
		clearOutput();
		showAkane(true, true);
		output("it’s a penis lol");
	}
	else akaneBabySrslyTho(firstTime);
	
	akanePostSexOptions("LICKED");
	if (silly) addButton(2, "SrslyTho", akaneBabySrslyTho, firstTime);
}
	
public function akaneBabySrslyTho(firstTime:Boolean):void
{
	clearOutput();
	showAkane(true, true);
	output("What you see is a soft, delicate flower of a pussy between her thighs. Her splayed fingers rest just above it with the tip of her middle finger brushing against a nestled clit. The scent of feminine lust plays about your nose and you can see a shiny veneer of wet arousal adorning her dark pink labia.");
	if (firstTime) output("\n\n<i>“Like it...?");
	else output("\n\n<i>“Ready, precious?");
	output("”</i> whispers the lightly blushing domme, her splayed fingers tightly squeezing across your scalp. You nod, your eyes shifting gazes from her snatch to her adoring gaze. In this moment, you want nothing but to please Akane.");
	output("\n\n<i>“Tongue out, then.");
	if (firstTime) output(" Show me how you use it"); 
	else output(" Use it like you always do");
	output(",”</i> she says casually, pulling your head to within an inch of her pussy. On command, you push your [pc.tongue] out to its full length once again and aim it at her slightly-parted lips. She squeaks and squirms on her seat as your tongue and her folds make warm and wet contact.");
	output("\n\n<i>“Iiih, h-hold it,”</i> she she calls out, her chest rapidly rising with sudden breathlessness. You keep your patient tongue firmly held against her all the same, awaiting her next order. Several breathy seconds pass before she murmurs <i>“Continue”</i>, both her splayed hands now holding your head steady with a massagers grip. Her thumbs come to rest on your forehead while her palms cover your [pc.ears].");
	output("\n\nYou begin by dragging the entire length of your tongue directly down the center of her pussy, the slow and smooth motion only stopping when the tip flicks against her clit. You can hear Akane inhale through her teeth as you both get into it, her fingers making small movements against your temples. You repeat the action in reverse, from top to bottom.");
	output("Along the way, you add a little more pressure to her folds each time, threatening to plunge your [pc.tongue] in any second. With each lick and drag, you accentuate every movement with a pivoting motion from your neck, finding hidden angles and tender spaces that make the heaving domme quiver and quake.");
	output("\n\n<i>“Mmph, right there,”</i> murmurs Akane, her thumbs massaging against your forehead. As she does so, the point of placement stings with that familiar sting and yet... a simultaneous soothing of the same nerves follows with her other thumb. You feel your [pc.face] tense up but the feeling is bearable when the second wave of pleasantness washes under your skin. You must be doing a good job...");
	output("\n\nYou move onto more complex shapes with your tongue: swirls, circles, even a star constellation. With each new shape, you add more gentle pressure to her entrance until-");
	output("\n\n<i>“Ooh...!”</i>");
	output("\n\nYour mouth muscle pushes in.");
	if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("\n\nWithout anything to stop you and with Akane now putty in your mouth, your long tongue unfurls within her depths like a snake making a home.");
	else
	{
		output("\n\nWithout anything to stop you, your [pc.tongue] glides and swirls against her inner sanctum with near-involuntary urgency.")
		if (pc.tongueType == GLOBAL.TYPE_FELINE) output(" You can feel her tense up a little as your rough kitty tongue makes itself known.");
	}
	output("\n\nYou press your [pc.lips] against her labia and form a soft seal with your open mouth. Each motion elicits a soft feminine whine from the domme, her hands planting your head firmly against her pussy. Using what wiggle room you have, your [pc.lips] kiss, suck and massage her entrance in tandem with the writhing motions of your tongue. You’re able to catch a glimpse of Akane’s face: blushing, panting, eyes screwed up in lust. She’s in your control now, right..?");
	if (firstTime) output("\n\n<i>“Not enough... not enough yet");
	else output("\n\n<i>“Efffhh, you know what comes next");
	output(",”</i> she says quickly, her grip on your head now mechanically locked in place! Your instinct is to move your head back, only to find that it’s impossible with those fingers holding you place. With no option, you continue to eat her senseless.");

	if (firstTime) output("\n\nYou just about stop yourself from biting down as a surge of bio-electrical pain sears itself across your skin and skull.");
	else output("\n\nYou’ve got yourself braced for the sudden surge of bio-electrical pain that sears itself across your skin and skull, the effect overwhelming your senses.");
	
	output("\n\nYou whine through the seal that your mouth makes up, [pc.tongue] flailing wildly inside Akane’s wettening snatch. In " + (pcIsPainslut() ? "Akane’s own loving" : "some twisted") + " way, you’re spurred on to keep going, your face now so firmly held in place that your nose gets smushed against her clit.");
	output("\n\nHer hands now in control, she uses your entire head as a physical sex toy. Your tongue seems to move on its own accord as your head is bent about and manhandled, your [pc.face] itself now an extra tool for her pleasure.");
	output("\n\nYou both whine together as she sends another fused jolt of euphoric agony, the effect strong enough to make your limbs lock up in place. Akane becomes more and more insensate with using your body in such a way, almost losing her grip of you as her arms and legs quiver.");
	output("\n\n<i>“Guh... gonna...! Ahhh...!”</i> are all she can say before her body locks up. You see her face contort in frozen bliss as a silent orgasm rocks her world, your mouth filling with the gentle flash of feminine juices. Her abs tense and contract through her skin, fighting against her lungs need to scream.");
	output("\n\nA vibrant heat gets blurred into the frozen moment, one shattered by Akane thrusting you away and collapsing against the bed. You’re able to stay on your knees and your woozy view is now that of the orgasming domme jerking and quivering against the plush bedding. You slobber and gulp down as much of Akane’s ‘gift’ as you can so the flavour stays fresh in your mouth.");
	output("\n\n<i>“Cheh... Cheo, put ‘em... up here,”</i> she forces in between breaths, her voice strained and high in pitch. You try to take stock of what she’s ordered, only to have a pair of fluffy arms hoist you from your armpits and guides onto the bed.");
	if (pc.isTaur()) output(" It’s a little bit of a struggle but with some effort, you’re comfortably seated on top.");
	output(" You shuffle across your side to the gasping Akane and, with a fiddle, your wrist bonds come undone with help from her ausar attendant.");
	output("\n\nYou place a hand on top of Akane’s heaving abs, massaging her pale skin with your palm. She turns her head to the side, her glassy, weary gaze meeting yours. You can make out her whispering something to you.");
	output("\n\n<i>“Oh... h-hey... stay with me, would you...?”</i>");
	
	removeButton(2);
}

public function akanePostSexOptions(activity:String = "TALKED"):void
{
	clearMenu();
	showAkane(true, true);
	
	//Does activity start with TALKED? If so, disable more talking.
	var silenceOnly:Boolean = activity.split("_")[0] == "TALKED";
	
	//Quest triggerable
	if (activity == "TALKED_RIVALS" && flags["AKANE_RIVALS_TIMESTAMP"] == undefined)
	{
		flags["AKANE_RIVALS_TIMESTAMP"] = GetGameTimestamp();
	}
	
	IncrementFlag("AKANE_TIMES_" + activity);
	if (silenceOnly) IncrementFlag("AKANE_TIMES_TALKED");
	else flags["AKANE_LAST_FUN_VISIT_TIMESTAMP"] = GetGameTimestamp();
	
	if (!silenceOnly) addButton(0, "Pillow Talk", akanePillowTalk, undefined, "Pillow Talk", "Communicate, be healthy with your relationships. Might be a good time to uh, get to know her...");
	addButton((silenceOnly ? 0 : 1), "Enjoy Silence", akaneEnjoySilence, undefined, "Enjoy Silence", "Just enjoy each other on an instinctual level.");
}

public function akanePillowTalk():void
{
	clearOutput();
	showAkane(true, true);
	
	output("<i>“Chat with me? ");
	if (flags["AKANE_FUN_VISITS"] == undefined) output("I always find it sweet when lovers lend ears, wouldn’t you agree?");
	else output("I just want to make this last,");
	output("”</i> she says softly, idly fidgeting with her dress. She shuffles around and comes to rest on her side while using a palm to support her head.");
	output("\n\n<i>“I’d love to,”</i> you say back, a tired smile forming across your face. Your body hasn’t fully calmed down from your latest ‘excursion’ so something relaxing could help...");
	output("\n\n<i>“Hmmm... then ask me something. I know a bit about you but that’s hardly fair so go on, ask me,”</i> she smiles, her other palm resting upon yours.");

	addButton(0, "Her", akaneTalkHer, undefined, "Her", "Well so far, there’s a lot of answers needed for all... this. Start with the basics.");
	addButton(1, "You", akaneTalkYou, undefined, "You", "She knows some basic info on you but if it’s a fair exchange then she must want to know more...");

	if (flags["AKANE_TIMES_TALKED_HER"] && flags["AKANE_TIMES_TALKED_YOU"] && flags["AKANE_TIMES_TALKED_MODS"] && flags["AKANE_TIMES_TALKED_HOST"] && flags["AKANE_TIMES_TALKED_RIVALS"] && pcIsPainslut())
		addButton(2, "History", akaneTalkHistory, undefined, "History", "Well now you gotta know about her past, what with all her allusions...");
	else addDisabledButton(2, "History", "History", "You haven’t quite hit the right chord with her to ask this yet.");

	addButton(3, "Her Mods", akaneTalkMods, undefined, "Her Mods", "That’s some rather robust hardware she’s using and what’s with the ear?");
	addButton(4, "About Host", akaneTalkHost, undefined, "About Host", "It’s kind of fascinating that it remains this under the radar... you only found it because they let you, after all.");
	addButton(5, "Rivalries", akaneTalkRivals, undefined, "Rivalries", "Surely she must have run-ins with various other groups and syndicates...?");

	if (flags["AKANE_TIMES_TALKED_HISTORY"] != undefined && flags["AKANE_FUN_VISITS"] >= 12 && pcIsPainslut() && flags["AKANEQUEST_STAGE"] > 0)
		addButton(9, "Us...?", akaneTalkUs, undefined, "Us...?", "She’s allowed you close, she’s shared how she values you and how much she wants you to thrive... but what does it all mean?");
}

public function akaneTalkHer():void
{
	clearOutput();
	showAkane(true, true);
	
	if (flags["AKANE_TIMES_TALKED_HER"] == undefined) output("“<i>Tell me about you and who you are first. I know your name and... preferences but that’s it. What’s behind Akane’s mask...?");
	else output("<i>“Talk about yourself again, I like it when you do that,");
	output("”</i> you say softly, a look of curiosity on your face. ");
	if (flags["AKANE_TIMES_TALKED_HER"] == undefined) output("She purses her lips as she tries to think.");
	else output("You see her mouth <i>“Again?”</i> with a slight furrow in her brow.");
	
	output("\n\n<i>“Hmmm... so obviously, I am Akane. It’s not just a name, more of a sign of respect. Almost a title, if you will. I wouldn’t want to say I’m that important to have one but it does have a nice ring to it. How I earned it is its own story,”</i> she starts off by saying, casual and matter-of-fact.");
	output("\n\n<i>“I am the ‘big boss’ of this little organization, as you’ve likely gathered. Been doing it a while, some would say for far longer than is supposedly healthy. Others still consider me a bit of a child in the criminal game. Less said on that for now, the better,”</i> she smirks, rolling her eyes.");
	output("\n\n<i>“Always irks me when that’s mentioned, as if I’m not already old enough or something. Although I do often forget in this routine. Is it 47 or 48, Cheo?”</i>");
	output("\n\n<i>“Fairly sure it’s 47,”</i> comes a low, distant voice from the door.");
	output("\n\n<i>“Mmm, not as bad as I thought. Time has a habit of leaving you in this line of work,”</i> giggles Akane, brushing her hair from her face. <i>“Almost feels motherly at times, having all these young agents around me and making sure they’re not jumping into frying pans on a daily basis. I wonder if real mothers have ‘that’ sort of feeling...?”</i>");

	if (StatTracking.getStat("pregnancy/total births") != 0) output("\n\nHaving been pregnant, you ask her to clarify what she means.\n\n<i>“Ohh! Hm... that overwhelming sense of worry and pride that bubbles up when I think about them. You know the thing right?”</i>\n\nYou nod, although you’ve no way of knowing if that’s the same experience.\n\n<i>“So young...”</i> you hear her whisper.");

	output("\n\n<i>“Anyway,”</i> she continues, brushing the thought aside. <i>“I suppose there’s not really a lot to myself aside all this. It’s almost a 24 hour shift in a lot of ways, directing where things go and who faces the wrath of a fist. Even if I don’t have to do the dirty work, still...”</i> - she yawns in between with her mouth covered - <i>“still rather draining. I’m just blessed to have so many lovely boys and girls on the payroll.”</i>");
	output("\n\nYou ask her about her particular sexual tastes, considering the idea that they seem very personal to her.");
	output("\n\n<i>“Mhm... very personal subject. Let’s just say that I’ve never had a taste for being... controlled,”</i> she says softly, a hint of menace in her ending word. You sense that it’d be a topic best left for later but...");
	output("\n\n<i>“But I think I can say that I’ve only ever worked with what I’ve been given. Oh and whoever was willing enough, mmhmm,”</i> smiles Akane, gently squeezing your hand between her fingers.");

	akanePostSexOptions("TALKED_HER");
}

public function akaneTalkYou():void
{
	clearOutput();
	showAkane(true, true);
	
	output("<i>“So what do you actually know about me...?”</i> you ask plainly, the sneaking suspicion about her knowing of Steele Tech tickling bits of your curiosity.\n\n<i>“");
	if (flags["AKANE_TALKED_YOU"] != undefined) output("No more than I’ve already said back to you. ");
	output("I know what you look like naked, ”</i> she giggles, brushing her hair to the side as it flops over her face. <i>“And that you’re very receptive... very receptive indeed.”</i>");
	output("\n\nIn that small moment, her eyes turn from calm to predatory as if she was still in control of your physical body.");
	output("\n\n<i>“But in terms of everything else... I know of your legacy, your family, career, age, sizes, most purchases made within the last solar year, your email contacts, important dates, ship, crew, uhh... what was the other thing? OHH right, also a deluge of half-baked theories and crushed dreams on some extranet forums.");
	if (silly) output(" I believe the biggest is called #tits_general.");
	output("”</i>\n\nYou’re a little taken aback: on one hand, you’d expect her to know <i>something</i> at least but so much raw information...");
	output("\n\n<i>“Oh don’t be so surprised, this is far from the dirty laundry we’d usually scope out for celebrity types. Although you’re not much of a celebrity in fairness, no offence,”</i> she quips, tracing her fingers across your palm. <i>“In fact, Steele Tech is something of less than low interest. An awful lot of slow gains with far too many barriers of entry for such a small group like ours. I think we have some form of contact in there however, isn’t that right Cheo?”</i>");
	output("\n\n<i>“Operation Ran-Soh-Kah,”</i> comes Cheo’s distant, low voice from the doorway.");
	output("\n\n<i>“Ahhh yes, yes. Less said on that the better,”</i> winks Akane, a smug look forming across her face.");
	output("\n\nHang on, she... what... but...!");
	output("\n\n<i>“W-wait a sec-”</i> you begin to say.");
	output("\n\n<i>“Hushshsh, don’t worry. Consider it a mutually beneficial scenario. ");
	if (flags["AKANE_TALKED_YOU"] != undefined) output("I’m fairly sure I told you about it anyway, right? ");
	output("Besides, you don’t even own the thing yet,”</i> she interrupts, laughing it off.");
	output("\n\nThat’s... technically true. And in fairness, you don’t actually have power to stop her from doing it.");
	output("\n\nYou push it out of your mind for the time being, she’s obviously not telling the whole story but you sense that she’s trying to be honest. You swiftly move on to your usual spiel of what your ultimate end goal is, the people you’ve met and the quests you’ve gone on.\nShe seems ever so slightly more curious whenever you mention pirates...");
	
	akanePostSexOptions("TALKED_YOU");
}

public function akaneTalkHistory():void
{
	clearOutput();
	showAkane(true, true);
	
	if (flags["AKANE_TIMES_TALKED_HISTORY"] == undefined) output("<i>“Sooooo, I know a good bit about what you do but not as much as I want to about who you are,”</i>");
	else output("<i>“I know it was a little difficult before but I want to hear your story again if you’re comfortable,”</i>");
	output(" you ask cooly, hoping that you’re not prying into something too personal.");
	if (flags["AKANE_TIMES_TALKED_HISTORY"] == undefined) output("\n\n<i>“Huuuh... you’ve earned it, I suppose. No, you definitely have. Although I’m not sure why, there’s nothing that special there,”</i>");
	else output("\n\n<i>“It’s alright, I don’t mind retelling. Just bear with me if I have a few ‘moments’,”</i>");
	output(" she starts slowly, as if internalizing a confidence boost.");
	
	output("\n\n<i>“Right, well...”</i>");
	output("\n\nShe rubs her eyes with her index and thumb.");
	
	output("\n\n<i>“So as I’ve said, Akane is more of a title than my name. Something bigger than I am, something that’s just sort of ‘there’ and covers me. Got all sorts of rumours and stories in certain circles, for instance. Mysterious mafioso leader with an army of ghosts and demons, hmhm. Or some old witch from myth who won’t die a silent death. I believe its Old Earth meaning is more appropriate than all of that: it just means ‘angry child’,”</i> she begins with a plain, casual tone.");
	output("\n\n<i>“As to how I was given it, well...”</i>");
	output("\n\nShe inhales slowly and closes her eyes for a few seconds as bracing herself for something.");
	
	output("\n\n<i>“A condensed version of the whole thing, I think. There’s not a lot that I chose to remember. I believe I was 18, 19 maybe. Seems like a blur thinking back to that age. I was just a dancer, believe it or not. A sponsored performer for all kinds of acts. Me and a little group with some Terran agency. Very acrobatic, intense, demanding... loved every moment of it. So get this, we’re on a short tour as part of a modern opera. All this crazy showmanship, insane stunts. I was part of this big scene, the big twist before the final act. But you know, young performers on the road, we need our breaks,”</i> she sighs, laughing half-heartedly.");
	output("\n\n<i>“Just ended up in some bars the day before our third performance. Normal things, simple things. It somehow turned into a firefight, I don’t quite know... quite know what happened to everyone. Slavers, in droves. Raiding the waterfront. Or was it a... space station?”</i>");
	output("\n\nHer eyes glaze over and stop moving. If her hands had a pulse, you could probably feel it rise.");
	output("\n\n<i>“Aaat this point, I don’t remember what happens. Memory blocks, or was it erasure? Aheh... uhhh. There’s a blank gap there,”</i> she half-whispers, visible distress in her face.");
	output("\n\n<i>“It’s okay, you don’t have to continue...”</i> you whisper back, hoping she’ll not push herself.");
	output("\n\n<i>“No no, it’s fine. I just need to focus... I remember lying on a bed. Some sort of medical bed. Seemed like it lasted forever. I could barely see what was happening around me, like my head was fixed to the spot. Always fading in and out of consciousness. And just... one day, I’m alert and ready. I’m scared but I’m alive. Trapped in the same bed with some old guy looking over me. And uh...”</i>");
	output("\n\nShe looks down to her hands, arms and knees.");
	output("\n\n<i>“...some new hardware sticking out of me. I could barely handle it at first, until I actually moved the things. It all felt surprisingly normal, just... numb. I’ve had 25 odd years to get used to it, but there’s still that slight numbness behind it all. Anyway, this old guy, he explains everything but I... don’t remember most of it. And then I’m just given a choice: get thrust back into the world like this, with no money, connections or sense of where I am <b>or</b> I can integrate with his little club... now </i>my<i> little club. In between that is a grueling, silent tale of rising up the foodchain and trying to impress this silly old man.”</i>");
	output("\n\nShe blinks slowly and sighs, drawing a fingertip across your palm.");
	output("\n\n<i>“His title was Bishamon. He lead this branch of the Shukuchi before it moved to Tavros station. All the faces have changed since I was new to it, save our business partners. Very taxing for younger folk, most burn out and retire by the time they’re in their mid 30’s. I only went further, outlasted them all. When Bishamon retired himself - probably 70 years old, I don’t even know - he only wanted me to lead. Said I knew the ‘pains of struggle’ on an instinctual level and it’s only in the last few years that I knew what he meant... “</i>");
	output("\n\nAkane pauses, looking wistfully into your eyes.");
	output("\n\n<i>“Aaand with all that, I think that covers the story of ‘me’. I think so, anyway,”</i> she finishes, glancing away from you with a look of discomfort on her face.");
	output("\n\nYou’re not sure what to say despite wishing you could say something. You instead clasp her fingers and squeeze the metal digits gently, the smallest hint of a smile playing at the corners of her mouth.");
	output("\n\n<i>“It’s okay, I just don’t make a habit of telling anybody this stuff. Maybe I realised I just need someone to... share secrets with,”</i> she sniffs, her glassy eyes looking into yours.");
	output("\n\nSomething jumps and wriggles in your chest. Is she... saying...");
	output("\n\n<i>“Ahh, oh dear, a bit of weakness on my part,”</i> she blusters, wiping her face with the back of her hand. <i>“Just stay with me for now, hm?”</i>");

	akanePostSexOptions("TALKED_HISTORY");
}

public function akaneTalkMods():void
{
	clearOutput();
	showAkane(true, true);
	
	output("<i>“So where’d you get the arms... and legs...?”</i> you say cooly, a little inner voice scolding you for tactlessness.");
	output("\n\nRight on cue, Akane’s brow furrows and she makes a disapproving hum. Even so, she takes the time to scan her cybernetics with her eyes. The ultra-sleek, svelte design glints with the tame blue of the room the smallest detail in faux-muscle curve catching the light.");
	output("\n\n<i>“I suppose it would come up at some point, so very well. These, my dear, are the top of the line bionic replacements for those looking for or </i>needing<i> alternatives to organic regrowth. I had to have a lot of my skeleton replaced or upgraded to support them. Built from several types and arrangements of nanomaterials and constructed to my exact needs and specifications, they are... understandably, what enable me to live,”</i> she begins in matter-of-fact tone. From the way she hesitates, maybe there’s even more to it than she’s letting on...");
	output("\n\nWith her right hand, she grips the seal on her bicep that connects her robotic left arm to her flesh and bone. There’s a slight <i>shkk</i> sound like several forms of lock disengaging in unison and the robo-limb twists in her palm. She pulls downwards and the whole thing comes with... leaving a metallic rim that’s melded seamlessly to what’s left of her arm.");
	output("\n\n<i>“As you can see, it’s not so difficult to disarm,”</i> smiles Akane, winking to you. You’re a little too lost in the detachment process to appreciate her wordplay...");
	output("\n\n<i>“I think one day, I’ll be able to sleep soundly with all my cybernetics by the bedside...”</i>");
	output("\n\nWith a sigh, she reattaches her arm in short order, gaining full use after a couple of finger curls.");
	output("\n\n<i>“Back to specifications: the alloy is extremely durable and lightweight. I shed quite a few kilos from my original weight when I had them fully integrated. I merely need to have the will to move them and they move. Of course, you’re fully aware of a... particular feature,”</i> she giggles, rubbing her thumb and index finger together. Between them, white sparks and tiny ropes of static fizzle and snap between her silvery fingertips.");
	output("\n\n<i>“Nothing damaging. I can send a neural signal through contact with any bit of flesh and the poor synapses have little else to do but accept it. When that happens, they go into overdrive and all I need is to think of how intense it should be. Barely even need to hold a weapon anymore if I need to get my hands dirty. You’d be surprised by how many <b>scream</b> for a quick death than live another minute more under my thumb...”</i>");
	output("\n\nWow. <i>Mood killer</i>.");
	output("\n\nNoticing your subtle wince, Akane merely laughs.");
	output("\n\n<i>“Oh please, [pc.name]. Your screams are the <b>best</b>, the only ones I need. Don’t feel shame for it,”</i> she smiles, stroking your chin.");
	output("\n\nYou clear your throat as a telltale blush forms in your cheeks.");
	output("\n\n<i>“And what about the ear?”</i> you say abruptly.");
	output("\n\n<i>“Ah, of course. Little bit of vanity on my part, disregarding the whole... scar business. I quite like both, truth be told. The ear mostly came about as a replacement for reasons you can probably discern. I liked the design, I still like the design, that’s pretty much it,”</i> she shrugs, smiling again.");
	output("\n\nThe next chat turns into a rather vague mess of what Akane would look like after taking " + RandomInCollection("Nepeta", "Pandaneen", "DracoGuard") + ", much to her delight and curiosity.");
	
	akanePostSexOptions("TALKED_MODS");
}

public function akaneTalkHost():void
{
	clearOutput();
	showAkane(true, true);
	
	if (flags["AKANE_TIMES_TALKED_HOST"] == undefined) output("<i>“So what is the Host, then?”</i>");
	else output("<i>“Tell me again about this organization, it’s fascinating,”</i>"); 
	output(" you ask generally, your tired gaze focusing on hers.");
	output("\n\n<i>“I suppose it’s all a little vague. We’re a community, a family, a business group, a force for change. Sometimes a vigilante group, sometimes security, sometimes tax collectors. It’s a very old form of organization, dating back to ancient Terran traditions. Quite far from being the same thing, of course. Passage of time and all that. Even I don’t know that much about the origins and I run this thing, hmhmm. ‘Shukuchi’ is an old, old Terran word referring to silent, swift movement as if someone was able go from one point to another instantaneously. As such, we use it to describe our way of working. Bit on the nose but it works,”</i> she begins, very quickly lost in thought as she relays the story.");
	output("\n\n<i>“U.G.C officially states that we’re a crime syndicate under their laws and I suppose I could agree. Barely anything we do is legal. What legal business we do have is often fronted behind something else. Oh we’re not all just operatives in the field by the way. Lawyers, businessmen both small and large scale, product manufacturers... could go on. It’s not a </i>wide<i> web but it’s a cohesive and efficient one. Our other interests include protection for smaller businesses, paid security, information brokering, sometimes private eye work and even lobbying,”</i> continues Akane, reciting the list as if it were something constantly pressed into her mind.");
	output("\n\n<i>“It’s diverse, mostly clean and highly sustainable. Of course, we’re not the only branch...”</i>");
	output("\n\nWait...");
	output("\n\n<i>“So this isn’t exclusive to Tavros?”</i> you ask cautiously, feeling some kind of imperceptible penny drop within.");
	output("\n\n<i>“Oh by my sainted stars, of course not, dearest. As if we could pull all that off from just this station! Not that it wouldn’t be fun but it’s a quieter, less stressful environment we have in the Rusher front as odd as that sounds, just doing small time work to get a foothold. Plus more of everything slips under the cracks... “</i>");
	output("\n\nShe sighs with a grin on her face, a palpable sense of pride radiating from her.");
	output("\n\n<i>“Should go without saying that we’re not really fond of current society. It’s a chaotic web of traps and circumstance where everyone uses their bodies just to scrape money for food. Either that or get lucky enough to have work, only to indulge in body modding. Not a slight against you though, precious,”</i> she opines, tapping her fingertip on your nose.");
	output("\n\n<i>“Just against the system we’ve all been through. Count your lucky novas that you’re a semi-celebrity.”</i>");
	output("\n\n<i>“Not much else to say on that. I’m sure you understand why of course. I may sleep with you but I dare not let you into the family, you’d have to be to be able to know all this. I couldn’t do that to you, you’re far too... far too young with all this life ahead of you. No sense settling down this early on...”");
	output("\n\nShe trails off into wordless thought, a glassy sheen forming over her darkened eyes.");
	output("\n\n<i>“I... didn’t know you felt that way,”</i> you half-whisper, taken aback by her admission.");
	output("\n\n<i>“What, is it wrong for me to... only want the best? I just want to see you thrive, [pc.name]. That you kept coming back to me just... nevermind, I’m babbling, I’m babbling it all away,”</i> she sniffs, wiping her face with her jacket sleeve.");
	output("\n\n<i>“Let’s just enjoy each other for a bit, hm?”</i>");
	output("\n\nYou nod, your face trying to hide the feeling of your chest filling with the soft flutter of butterflies.");

	akanePostSexOptions("TALKED_HOST");
}

public function akaneTalkRivals():void
{
	clearOutput();
	showAkane(true, true);
	
	if (flags["AKANE_TIMES_TALKED_RIVALS"] == undefined) output("<i>“I got a question: do you guys ever get competition...? Outside of the law, I mean,”</i>");
	else output("<i>“Tell me again about the other crime groups, it’s a curious situation,”</i>");
	output(" you begin slowly, keeping the tone light in the post-sex glow you share.\n\n");
	if (flags["AKANE_TIMES_TALKED_RIVALS"] == undefined) output("<i>“Oof, I’ll certainly try darling. What a web it is...”</i>");
	else output("<i>“Again? Hmm, just for you then, my little thrillseeker,”</i>”");
	output(" she giggles, her eyes looking into random corners of the room as she thinks of what to say.");

	output("\n\n<i>“It’d be remiss of me to not mention the big guns: the Black Void. Mm, what an absolutely dashing, fantastical name,”</i> she groans sarcastically, rolling her eyes.");
	output("\n\n<i>“All dressed in red and black, how original. Anyway, petty quibbles aside, they’re not something that our group needs to worry about that much. Unpleasant to say the least but they’re merely just a grim mirror of the U.G.C at the dirtiest, darkest level. Same lack of mass cohesion as well,”</i> she starts, her tone turning factual but lined with soft disdain.");
	output("\n\n<i>“Are they really that big?”</i> you ask quickly, curiosity getting stronger.");
	output("\n\n<i>“Well not </i>as<i> big but big enough that you’d only need to dismantle the command structure and all semblance of terror melts away. Those ‘Dread Lords’, you know?”</i> opines Akane.\n\n");
	if (flags["FALL OF THE PHOENIX STATUS"] >= 1 || flags["SAENDRA_XPACK1_STATUS"] >= 9 || /*KaraQuest*/ flags["KQ2_QUEST_FINISHED"] == 1) 
		output("Yep you <i>definitely</i> know, having run into the Black Void before. You consider telling her about your experiences but... ");
	output("<i>“Have you... met them?”</i> you ask on the fly.");
	output("\n\nHer look of thought turns into a smile.");
	output("\n\n<i>“Under less-than-friendly terms, yes. A certain Dread Lord Bragga as it were. A brutish weirdo who doesn’t enjoy anything as far as I could say. Definitely did not think much of me at all. Her mistake,”</i> she winks, tracing her fingers across your hand.");
	output("\n\n<i>“We’re not a powerful, space-borne army but on the ground outside of literal warzones, the Void come up short. During our little talks, I made it clear where our interests lie and the personal threat of a strike from a stealth field put her into a more reasonable state of mind. So without revealing too much, the Black Void leave us alone as long as we leave them alone. That is, until they start hosting their slavery parties around here...”</i> she finishes, going quiet as she mentions ‘slavery.’");
	output("\n\nHmm. A small part of you wishes she’d said more instead of cutting it short...");
	output("\n\n“What about the other groups?”</i> you say quickly, keeping her recollections fresh.");
	output("\n\n<i>“Hmm, in this part of space, there aren’t many big players. Void mostly just rubs its flaccid... thing all over the frontier and that’s enough to scare most small and large scale groups away. Not us though, different fields of business. But there are one or two exceptions. The biggest I’ve had the pleasure of dealing with is one Mr. Lysander Chow...”</i>");
	output("\n\nSomething about that name tickles a memory in the back of your mind but you can’t quite discern what it is...");
	output("\n\n<i>“Utter bastard by most accounts, even mine. Apparently he has a ‘thing’ for me personally but whether that’s a bounty or a series of delightful planned dates, I couldn’t say. Sometimes we come into conflict, other times we broker the same business deals. It’s all over the place with him, he’s quite the maverick. Grisly too. Still, we respect each other enough to cooperate on the rare occasion. I’m just never, ever going to be in the same room with freaky old man ever again,”</i> she finishes bluntly, apparently rankled.");
	output("\n\n<i>“Mmm, that was a bit brash... mind if we just cuddle...?”</i> she says softly, her biting tone turning into a sweet calmness.");
	
	akanePostSexOptions("TALKED_RIVALS");
}

public function akaneTalkUs():void
{
	clearMenu();
	clearOutput();
	showAkane(true, true);
	
	if (flags["AKANE_TIMES_TALKED_US"] == undefined)
	{
		output("You’ve shared an awful lot with her, from her body to her experiences and to her most sensitive of secrets. You keep coming back for what she has and what she can give you. She even named your her special ‘painslut’ of all things...");
		output("\n\n<i>“Akane,”</i> you begin tentatively, cupping her wrists in a loose grip. <i>“Something’s been on my mind for a while and... I want to know how you see me? See us?”</i>");
		output("\n\n<i>“Ohh... oh,”</i> mouths the stunned domme, blinking as if stunned by a bright light.");
	}
	else
	{
		output("<i>“I want to talk about us again,”</i> you say quickly, even before you’ve both settled down.");
		output("\n\n<i>“Ah... you’re still thinking about what you want then? We can talk about it more if you’d really like to, I... I have to know how you feel,”</i> she says breathily, her chest heaving in anticipation yet... her expression is needy as all hell.");
		output("\n\n<i>“We should talk, yeah,”</i> you say, smiling to her to put her at ease.");
		output("\n\n<i>“J-just let’s get the bearings first...”</i> says Akane.");
	}
	
	output("\n\n<i>“From the top, then: as soon as you bought into our very obvious bait, willingly and with a clear head on your shoulders, I had to divert my attention to it. At the very least, you had to be... brave or mentally deranged. There’s procedures for both,”</i> she begins, speaking slowly but with a slight waver in her voice.");
	output("\n\n<i>“You walk in, drop out, get prepared for interrogation... what can I say, I liked what I saw. I gave you the options and you tapped into my line of thinking. And that was our first time together, wasn’t it?”</i> she giggles, tracing her fingers across your grinning cheeks and [pc.lipsChaste]. <i>“And had I known you’d keep coming back time and time again...”</i>");
	output("\n\nA fresh blush rises in your cheeks as she says so. There’s a little bit of guilt and romance there, constantly returning to some gang’s hideout just to sleep with their sexy boss all the time... Akane merely chuckles, bopping your nose with her fingertips.");
	output("\n\n<i>“And each time you did, I knew you more and I wanted to know more. More of this... this Steele creature in front of me. Just had to crack the shell first, ahmmhmm. Now that I’ve done that I uh, I find myself wishing to know more...”</i>");
	output("\n\nShe shuffles closer on her side so that her face is within an inch of yours.");
	output("\n\n<i>“But you’re so young. So young... I couldn’t take more than I have done from you. You’ve got all this <b>life</b> ahead of you and I’m just... something nice on the side. I-I can live with that, I can...”</i>");
	output("\n\nThe wavering domme pushes her ruby lips to your [pc.lipsChaste], her kisses coming in slow and sensuous as she tries to keep herself steady. You can’t help but oblige with your [pc.tongue], using as much of to fill out her mouth as you can. For some long, blissful seconds, the two of you become enraptured in your own thoughtless, personal universe ");
	if (silly) output("MY PERSONAL UNIVERSE, CAN YOU HEAR ME ");
	output("that never seems to end.");
	output("\n\nAkane breaks the kiss abruptly, leaving your [pc.lipsChaste] feeling cold.");
	output("\n\n<i>“A-alright alright, stop, stop,”</i> she flusters, resting her forehead against yours.");
	
	if (flags["AKANE_TIMES_TALKED_US"] == undefined)
	{
		output("\n\n<i>“Why do we have to do this, just throw our little arrangement away? Let’s just be this, as a c-casual dominant and submissive relationship. You have so much ahead of you... if we kept going, if we became lost to this then that means you’d have to be here, with us... the higher ups wouldn’t allow it otherwise,”</i> she sniffs, her fingers curling against your shoulder with a pained expression.");
		output("\n\n<i>“But why...?”</i> you whisper.");
		output("\n\n<i>“We can’t risk the secrecy... for anything. Either you’re here with me, knowing all we know or you’re not, knowing only me. I-I can’t make you choose but please, I just want what’s best for my young [pc.name]...”</i>");
	}
	else
	{
		output("\n\n<i>“You know what it would mean if we kept going. You’d leave your spacer life behind and have to adapt to mine. It wouldn’t be yours anymore... and I want you. But I want you to thrive. Y-you don’t need me, our time together has been perfect at every point as is! I...”</i>");
		output("\n\nShe trails off before finishing her thought, her glassy eyes looking lost and fearful.");
	}
	
	addButton(0, "Want Her", akaneWantYouBaybeh, undefined, "Want Her", "You want to keep it the same as a loose relationship.");
	addButton(1, "Need Her", akaneJoinShukuchi, undefined, "Need Her", "No one else can compare, you <i>need</i> her... and she wants you as much. All you gotta do is say it, baby. <b>Point of No Return</b>");
}

public function akaneWantYouBaybeh():void
{
	clearOutput();
	showAkane(true, true);
	
	output("<i>“It’s alright, I want the same too. Existing as our own guilty pleasures,”</i> you say to her, cupping her hand with the two of yours and bringing it up to your face.");
	output("\n\nWith a heavy sigh, Akane’s fearful face turns into a smile of relief. Her forehead comes to rest against yours as her shoulders visible relax.");
	output("\n\n<i>“Good, good... making the better choice for your future. Effhhhfuck, my head... I was so worried! Almost shaking...”</i> she says slowly, half giggling as the moment of truth passes. <i>“D-don’t scare me like that again, you... monster.”</i>");
	output("\n\nAkane nuzzles your nose to hers, the two of you then settling into a more relaxed mood...");
	
	akanePostSexOptions("TALKED_US");
}

public function akaneJoinShukuchi():void
{
	clearMenu();
	clearOutput();
	showAkane(true, true);
	
	output("<i>“But that’s just it: I need you, Akane,”</i> you whisper back to her, clasping her hand in both of yours. <i>“I’m perfectly happy to live my life away from the Rush, outside of the messes going on in U.G.C. I can adapt here, I can help! I’ve already done so much already...”</i>");
	output("\n\nAkane’s eyes well up, a single tear running across each of her flushed cheeks.");
	output("\n\n<i>“[pc.name]... so does this mean you...?”</i>");
	output("\n\nYou lean in just a little closer so that you can whisper into her ear, the magic words of <i>“I love you”</i> passing from your lips. As you pull back, Akane’s fingers cover her mouth in disbelief. You can only smile as her reaction morphs into a tearful smile.");
	output("\n\nYou couldn’t help yourselves if you tried.");
	output("\n\nKnowing each other’s true feelings, you lose yourselves to a deep, loving kiss. Lips squish and pull against each other; tongues meeting then twisting together endlessly in between gasps and giggles.");
	output("\n\nYou’re pushed by your shoulder onto your back and Akane lays herself on top, the kissing kept to a constant and feral intensity. She directs the flow of things of course, pushing you into places that you can only react to.");
	output("\n\nShe continues to keep the pressure up at all times, the bristling sting of her fingertips becoming more frequent and invasive as her hands brush against, grip and squeeze your body all over. The more she does it, the more you bend to her manipulation under the near-orgasmic pain that flows through your nerves. With the way you wince and whine underneath, she seems keen on taking you down with her...");
	output("\n\nAkane’s reactions go from maniacal giggles to feminine wails with every touch she makes adding to the blissful agony that bends you to her ministrations.");
	output("\n\nEven after your previous sexcapade, that rising lust surging through your nerves burns twice as hard as before.");
	output("\n\nAkane clasps your temples with her palms.");
	output("\n\nThe sheer strength of the current flowing into your body makes you want to scream. All the blood in your body seems to flood into your head, the deepest throbs turning into ungodly shivers down your spine.");
	output("\n\n<i>“S-say it! Say it”</i> yells the quivering domme from above, her voice cutting through the sensory white noise.");
	output("\n\nHer name...!");
	output("\n\n<i>“Ah...akane..!”</i> you force out meekly, loud but incoherent.");
	output("\n\n<i>“Once more...!”</i> she gasps, her slender body starting to quiver against you.");
	output("\n\n<i>“AKANE..!”</i>");
	output("\n\nWith that, her palms spring away from your head with a nasty <i>czzrt</i> of energy and the wailing domme slumps against you. On instinct, you wrap your arms around her as her jerking body succumbs to an orgasm. You take it upon you to whisper “I’m here” and “It’s ok” as Akane lies breathless on top of you.");
	output("\n\nWith the two of you too tired to really do anything after this spiritual consummation, the thoughtless veil of sleep takes over. Your thoughts rest on what’s to come.\nHere it starts: a new life. A life away from Steele Tech and all of those childish hopes and dreams...");
	
	addButton(0, "What Next?", akaneEpilogue, undefined, "What Next?", "Here’s to the rest of your life...");
}

public function akaneEpilogue():void
{
	clearOutput();
	showAkane(false, true);
	
	output("The next few weeks become something of a blur.");
	output("\n\nYou’re quick to announce that you’re putting your dad’s quest to bed. The press surrounding Rusher space blow up in terms of speculation and it’s not so surprising to you. You know what the real answer is but... your new commitment means one final challenge. You give a tearful goodbye to your crew before selling your ship.");
	
	if (annoIsCrew())
	output("\n\nAnno is - at first - highly distraught but quickly comes to terms with the situation, hoping one day you’ll meet her again. You’re gonna miss that white-haired firebrand..");

	if (seraIsCrew())
	{
		output("\n\nAlthough known for her thorny exterior, Sera seems genuinely lost in the wake of things. She even begs to take you with her given how you cost her the Chrysalis. ");
		if (seraIsMerchant()) output("However, with a few kind words and one last filthy railing for being such a good girl, she vows to use her new found freedom to become a mercantile giant in rusher space, delivering the most boutique of mods she can think of.");
		else output("Given how you’re unsure how she plans to survive with no guidance, money or friends to rely on... you gift her a sizable chunk of your savings with no expectation of returns. After some deliberation, she regains some of her zing and vows to rebuild a new shop from the ground up.");
	}

	if (kaseIsCrew())
	{
		output("\n\nPutting on a brave face, Kase can’t help but shed a tear as you break the news. ");
		if (flags["KASE_STEELETECH"] == 1) output("Still a part of Steele Tech, he promises to keep you and your legacy in mind while finding a suitable role for his talents. PR might be a good one...");
		else output("With his contract bought by you, he has little in the way of fallback but after some deliberation and a few spins of communication, he becomes convinced that he can get something in corporate PR.");
	}

	if (azraIsCrew())
		output("\n\nAzra approaches it with a realists view, despite declaring her sadness and disappointment. The nagging thought of her work still keeps her grounded all the same. Still, she isn’t above embracing you for what is really longer than necessary, what with the towering suula pretty much crushing you into her chest before you leave her be.");


	if (hasGooArmor())
		output("\n\nNova, always a rather naive creature, isn’t sure what to make of your action. You’re able to explain it to her in very rough ways, only for her to make the snap judgement to go to Steele Tech as a ‘person of interest’. You’re not entirely sure what her intentions are but you figure it might be a long lost kinship with what remains of her goo-like body elsewhere.");

	if (paigeIsCrew())
		output("\n\nAlthough having dealt with this sort of sadness before, a tearful Paige says she understands before giving you a loving hug. She emphasises how you’ve done more than enough for her in this lifetime after having regained her sight. Paige then begins steps to re-opening her yoga business.");

	if (reahaIsCrew())
	{
		output("\n\nReaha can’t stop herself from crying, having been saved from legal sex-slavery only to be homeless once again. ");
		if (flags["REAHA_ADDICTION_CURED"] == 1) output("However, with her renewed will to keep striving, she declares that she’ll put her new lease on life to good use. She hints heavily at opening a brand of milkshakes and icecreams, something affirmed with the wiggle of her ample, pendulous tits.");
		else output("Knowing that she’d be very open to abuse and hardship with her addiction, you give her a list of contacts including Maki who could help, along with a sizable chunk of your savings to keep her stable.");
	}

	if (celiseIsCrew()) output("\n\nAlthough not as broken up about it as you’d have thought, Celise instantly takes to the idea of going after " + (flags["MET_ANNO"] != undefined ? "Anno" : "and old friend she grew apart from") + ". Apparently being friendly with her from before turned into something else when you dropped the bombshell...");

	if (yammiIsCrew())
	{
		output("\n\nYammi is saddened but remains optimistic for you and for her. Having toured with spacers, she tells you that she has new ideas and plans in her head that are above and beyond what she could’ve dreamt of before. ");
		if (flags["YAMMI_HELPED"] >= 2) output("With her pexiga pet in tow, she already begins preparing for her newly minted business schemes.");
	}

	output("\n\nAnd that’s that. Despite having such love to go around, you know that your commitment to Akane now comes first. The spontaneity of it all, giving up your spacer life and all your friends, the promise of something new that you <i>need</i>... a pure, cathartic rush. A week after the declaration, you’re already at a shipyard with your " + (PCShipIsCasstech() ? "ancient Casstech" : "ship") + " cleared of all personal belongings. It’s old enough and <i>just</i> about famous enough that it’s sequestered into an ‘artefacts’ category, presumably for some sort of Rushers museum. There’s an intense pang of guilt as you hand the command codes over... but by turning around, the guilt wafts away in a sea of new ideas and aspiration.");
	output("\n\nYou spend the next week adjusting to life in the Host. Akane’s room becomes the most central part of your new home, something you get used to very quickly. The soft covers become the perfect balm for the nightly sessions you and her play out, and Akane is more than willing to wrap you up and tuck you in whenever there’s a particularly brutal one.");
	output("\n\nEvery night feels like a new experience as she finds more intense and disturbing ways to bring you to your knees. During the day, you become familiar with the other inhabitants: the agents who have their own dorms and temporary sleeping places; training rooms and meditation spaces; comms rooms and actions rooms for planning and staging... with all your new free time, you dedicate yourself to knowing your surroundings in as complete a way as possible.");
	output("\n\nAkane lets you roam free, letting you interact with the agents on their off hours. Despite their universally ‘professional’ attitudes, they lead surprisingly sane lives within the context of the Host. In turn, they all ask about how you plan to live in the organization, a question you leave open. Even if you don’t make friends immediately, you make good foundations.");
	output("\n\nA week turns into two, then into four.");
	output("\n\nYou’ve gotten used to the strange routines, procedures and quirks of the daily life of a Host Shukuchi member. Akane keeps to her own, even stricter routine that involves far more logistics and directive work than you would’ve considered before. You assist her at times, giving her emotional support on the long shifts... as well as servicing her during free time.");
	output("\n\nYet you still haven’t quite found a true role in this walk of life.");
	output("\n\nSome days pass and an opportunity arises when you’re able to figure out a solution to a complex business trade: managing business partners.");
	output("\n\nAkane gives you the go ahead to be part of her business branch as a liaison of sorts. You work normal hours in a secure, Tavros-based office, several floors away from and two elevators behind the Merchants deck. It takes a good few days to get used to the routines, although the various lawyers, contacts and businessmen you have to manage are more than willing to help you with your first advances.");
	output("\n\nIt’s slow but steady work at first, mostly ordering one lawyer in one direction and one portfolio into another to best fit the markets. It’s work that seems so far from your earlier beginnings as a [pc.startingCareer], the only things keeping you tied to that world are news reports of the odd new planet found, settled on and colonized in the space of weeks.");
	output("\n\nEvery night, you come back to a warm bed and a loving hand. Most days, the passions between you and your new partner last well into the night. Each new morning feels like the most well earned rest in the world. On the hard days, you spend more time together in a warm, silent embrace.");
	output("\n\nAnother week passes and you quickly find that the work of managing Shukuchi assets is certainly peaceful and smooth, it is far from the stimulation you were used to.");
	output("\n\nYou approach Akane for a change of course...");
	
	addButton(0, "Oooo...?", akaneBecomesASpookyGhost, undefined, "Oooo...?", "What could be next...?");
}

public function akaneBecomesASpookyGhost():void
{
	clearOutput();
	showAkane(false, true);
	
	output("Although initially loathing the prospect of putting you in harm’s way once again, you play up your combat experience and your accomplishments during her slaver bust-up.");
	output("\n\nAfter a few days of indecision, Akane relents and allows you to train with her other subordinates.");
	output("\n\nThe going is tough. While you’ve had your fair share of live fire situations, acrobatics and formal martial arts brings in a whole new set of skills. Skills that take some time to even get the basics right. ");
	if (pc.isTaur()) output("It doesn’t help that your tauric body bars you from doing most things easily, forcing you to consider a drastic change to your body...\nIn the end, you’re able to requisition resources to purchasing specially made bi-pedal mods and taur-body mods in case this current route becomes too much.");

	output("\n\nBut weeks pass smoothly with the right training on hand, every night becoming a recovery session in which Akane massages, comforts and praises your personal progress. With all this bolstering, you can feel your body grow spiritually as well as physically. As a reflection of that, you’ve become more physically athletic and dedicated to improving your body’s strengths and limits. When you’re introduced to the specific combat routines used by the Host operatives, stealth field and all, you do surprisingly well. From then on, you only continue to improve...");
	output("\n\nA year passes, almost without you thinking of it. The routine of the Host Shukuchi becomes your rhythm. You’re often separated from Akane for most of the day, only to have her by your side at night. You both couldn’t be happier being together, a matured and intimate understanding having blossomed between the two of you. It comes to the point where Akane is able to live out her dream of sleeping without her cybernetics, her trust in you reaching a zenith. On nights like these, you find yourself taking on a spiritual protector role.");
	output("\n\nAs she protects you during the day, you protect her during the night.");
	output("\n\nAfter a year of training and simple procedures - collection, security, some roughhousing for unscrupulous CEO’s - and some <i>personally</i> lucrative corporate work on the side, Akane deems you fit (and safe) enough to take part in clan warfare.");
	output("\n\nYour first raid is against a weapon smugglers crew, a low-level affair but with enough money and ammo in it that it’s treated seriously. With your own team of six agents, you sneak into the storehouse and incapacitate the few guards there with flashbangs, using stealth fields to bypass the unmanned security.");
	output("\n\nIt’s swift, smooth and lucrative. As a congratulation for your first successful mission, Akane presents you your official, personalized Shukuchi mask. Wearing it feels seamless, almost enlightening: the kind of tech that opens your eyes and awareness in the heat of combat.");
	output("\n\nAnother year passes.");
	output("\n\nYou’re now among the best agents at Akane’s behest. You’re afforded more respect and privilege than usual owing to your relationship with the boss. Although there’s not a complete lack of discontent among lower level agents, the arrangement doesn’t affect the Host. Now, your life has become a routine. Never a dull one, of course: every day, you’re given active duties to perform from shakedowns, reclamation, raiding or even protection and then every night, you return to the lover you never see enough of.");
	output("\n\nOver time, Akane’s style becomes more open and relaxed. Instead of body-hugging, short dresses and leather jackets, she opts for looser, ankle length robes that show off more of her skin. Her personal demands of you become more and more hedonistic, from subtle things like leaving the door open during painplay to having you pleasure her orally on her throne. You’re never left wanting for ways to please her, at least...");

	addButton(0, "And Then?", akaneRetiresFromMafiaing, undefined, "And Then...?", "Where’s this all going...?");
}

public function akaneRetiresFromMafiaing():void
{
	clearOutput();
	showAkane(true, true);
	
	output("Four years pass.");
	output("\n\nEventually, you feel your zest for the rhythm of the Host to dull. Not in a negative way, more in a pure way. The actions become so well-versed and integral to you that you couldn’t even think back on what life you had before this all. Akane never ceases to provide the best of what you need... that overwhelming desire to be touched by her every night has never faded. Yet Akane herself has only grown more demanding of you while simultaneously letting herself become more lost to vice.");
	output("\n\nStill very much in control and in top form amongst the Host, her sexual appetite grows more and more obscure as she tries to wring as much from your body as she can. Sometimes, it’s a public ‘shaming’ where you’re lashed in front of a parade of agents you’re friendly with. Other times, it’s sending you on missions strapped the nines in all manner of vibe-toys, stim-pads and potent aphrodisiacs. At the end of each day, you’re so worked up that you’re more than willing to accept her relief... and continue again the next day.");
	output("\n\nAt some point, you’re snapped out of the routine.");
	output("\n\nThe higher-ups in the command structure, impressed with your rapid rise in skill and accomplishment, send envoys to express their need for you in their more active fronts. You’re assured an intense and perk-heavy life well within U.G.C space as a mid-high level agent.");
	output("\n\nYour immediate reaction is to refuse... and Akane agrees. The main reason you’re even a part of the organization is because of her, after all.");
	output("\n\nHowever, the higher-ups the lay down an ultimatum: agree to the order or face a forced retirement.");
	output("\n\nAkane immediately voices her support for the latter. She explains her slowly unraveling behaviour as her getting more and more weary of the Host lifestyle. Now in her 50’s and with silvered streaks in her onyx hair, she tells you that she’s been feeling closer to just... whisking you away at some point to some pleasure planet. Now you have the chance to do so.");
	
	addButton(0, "Aw...", akaneGoodEnd, undefined, "Aw...", "And then...");
}

public function akaneGoodEnd():void
{
	clearOutput();
	showAkane(true, true);
	
	output("One more year passes.");
	output("\n\nYou’ve both settled into your quiet resort in the middle of U.G.C space. With the Hosts blessing and Akane’s sizable monetary investments, you’ve several million in the bank to be comfortable with for a long time to come.");
	output("\n\nYou spend most days together, experiencing peace and relaxation on a most indulgent and decadent level.");
	badEnd("Congratulations! You got the Good End!");
	output("\n\nAt this point, this story continues in its own vacuum... but maybe you’d rather begin your adventures again?");
}

public function akaneEnjoySilence():void
{
	clearMenu();
	clearOutput();
	showAkane(true, true);
	processTime(2 * 60);
	
	output("Having spent both of your energies, you and Akane simply gaze into each others eyes with mutually satisfied grins. With slow, tender movements, the breathy domme spends extra care in stroking and caressing your [pc.skinFurScales]. The smooth, warm fingertips delight your used and abused nerves to no end with gentle pulses of bio-energy.");
	output("\n\nYou lay for hours in the silence, completely at peace after the intense session. The afterglow wears off eventually, convincing Akane to wrap the two of you in the bed covers.");
	output("\n\nYou couldn’t be any more content in this moment.");
	output("\n\nSoon enough, you’re both feeling revitalized. Akane helps you up then helps you redress with what gear you have, fussing over the small details. You’re almost, <i>almost</i> tempted to say “thanks mom” or something to that effect but it didn’t seem... fitting.");
	output("\n\nYou give each a goodbye kiss, one interrupted by Cheo as he looms out of the shadows. Accepting that things have to move on, you follow him out of the room with a final view of Akane sprawled across the bed.");
	output("\n\nAnother attendant joins the two of you with a blindfold in his hands. Oh joy. With a sigh, you stand ready and close your eyes, the blindfold then comfortably tightening around your head. You get led back through the winding maze of doors, corridors and odd angles and then back out onto the Tavros merchants deck.");

	IncrementFlag("AKANE_FUN_VISITS");
	
	addButton(0, "Exit", akaneLeave);
}

public function akaneLeave():void
{
	clearMenu();
	clearOutput();
	moveTo("110");
	mainGameMenu();
}