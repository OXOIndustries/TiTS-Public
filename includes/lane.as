const HYPNOSIS_LEVEL_MAX:int = 3;

/*
Lanes Hypnosis Mechnic
----

PC can freely be hypnotised once every 24 hours with no ill-effect.

If they return to Lane with an existing effect already in place, the hypnosis level will increase.

Hypnosis level increases by "decreasing" a seeded value by some modifier of the players willpower:

	Level 1: 75
	Level 2: 100
	Level 3: 125

	=> 50 + (level * 25)

	On event   => current power += math.round(1.5 - pc.WQ() * 50)

	@ <= 25%  will == 5  events to go from 0 to level 3
	@ <= 50%  will == 7 events to go from 0 to level 3
	@ <= 100% will == 12 events to go from 0 to level 3

Once hypnosis level has increased, it will not decay outside of special events. I think there are some crew-related things that this will be hinged upon.

There are a number of status effects:
	"Lane's Hypnosis - [Stat]" -- These are used to track the individual treatments (and statboosts) that he can give the player, and are isolated so the player can have many.
	"Lane Hypnosis" -- This indicates that the player has been subject to Lane's illicit hypnosis.
*/

/*
Check if the player is subject to Lane's illicit hypnosis effect.
All of the stat-boosting effects will have unique names, so that they can co-exist, but each will create/bump this effect up as a hidden marker where appropriate.
*/
function hasLaneHypnosis():Boolean
{
	if (pc.hasStatusEffect("Lane Hypnosis")) return true;
	return false;
}

/*
Get the players current hypnosis level
*/
function laneHypnosisLevel():int
{
	if (flags["LANE_HYPNOSIS_LEVEL"] == undefined) return 0;
	else return flags["LANE_HYPNOSIS_LEVEL"];
}

/*
Figure out the level-up mechanic for hypnosis levels. Uses weights based on the PCs current hypnosis level versus the PCs willpower.
Returns true if a levelup occured.
*/
function increaseLaneHypnosisLevel():Boolean
{
	if (flags["LANE_HYPNOSIS_LEVEL"] == HYPNOSIS_LEVEL_MAX) return false;

	// Init the "power" tracker
	if (flags["LANE_HYPNOSIS_POWER"] == undefined)
	{
		flags["LANE_HYPNOSIS_POWER"] = (laneHypnosisLevel() * 25) + 50;
	}

	// Decrease power
	flags["LANE_HYPNOSIS_POWER"] -= math.round((1.5 - pc.WQ()) * 50); // This includes a potential will-boost from lanes stat bonuses, because fuck complicating this any more than it already is.

	// Check if "power" was entirely consumed, if so level up
	if (flags["LANE_HYPNOSIS_POWER"] <= 0)
	{
		flags["LANE_HYPNOSIS_LEVEL"] += 1;
		flags["LANE_HYPNOSIS_POWER"] = (laneHypnosisLevel() * 25) + 50;
		return true;
	}
	else
	{
		return false;
	}
}

/*
Decrease the PCs hypnosis level, and forces the level-up power required for the next hypnosis level to reset back to the default for the *new* lower level.
*/
function decreaseLaneHypnosisLevel():Boolean
{
	if (flags["LANE_HYPNOSIS_LEVEL"] > 0) flags["LANE_HYPNOSIS_LEVEL"] -= 1;
	flags["LANE_HYPNOSIS_POWER"] = undefined; // Force the next increase event to work from the "base" of the reduced level.
}

function hasMaxedLaneHypnosis():Boolean
{
	if (laneHypnosisLevel() == HYPNOSIS_LEVEL_MAX) return true;
	return false;
}

function baseHypnosisWearsOff(effectToRemove:String):void
{
	clearOutput();
	if (flags["HYPNO_EFFECT_SMALL_MESSAGES"] == undefined)
	{
		if (flags["LANE_FIRST_HYPNO_RETURN"] != 2)
		{
			outputText("As you walk the biomes of {planet}, you can’t help but feel something is a little... off. Different, from when it was just a few moments ago. You flex your ears, listening for anything out of the ordinary, but you can’t hear anything. You look down your body, for anything alien that might have attached itself to you, but you’re completely clean.");

			outputText("\n\nFor whatever reason, you’re drawn to your codex, to know the time. It displays the time on all known and visited planets, including a clock for Terran’s time in the right hand corner. Seeing that clock there reminds you of something about Terran’s time, but what....");

			outputText("\n\nJust then, your thoughts are drawn to Lane. You recall the lizard-person’s hut in the caves of Venar, and the business {he} runs in hypnotism, and – wait. Hypnotism?");

			switch (effectToRemove)
			{
				case HYPNO_STAT_PHYS:
					outputText(" You look to your hands and make a pair of tight fists. Your grip is still plenty strong, but something just feels off somehow. You look to your bicep and you flex, and you swear your arm wasn’t as big as it was a few hours ago.");
					break;

				case HYPNO_STAT_REF:
					outputText(" You look around your feet for a pebble, or a coin, or something, and the glint of a rounded scrap of metal catches your eye. You pick it up and, without looking, toss it straight up into the air. When it passes your vision, you reach out to grab it, but you come up short, and it hits the ground in front of you.");
					break;

				case HYPNO_STAT_AIM:
					outputText(" You focus your eyes on the space around you, to the dust flitting through the air before your eyes. You spot a particular speck and try to focus on it, but it soon disappears in a cloud of likewise-looking specks, and then it might as well have vanished entirely.");
					break;

				case HYPNO_STAT_INT:
					outputText(" You start trying to do long division in your head. You recall an obscure method of doing it back in middle school – you could always get the first few steps down but then the lessons got murky the further you went, until it became just a total mess of numbers and integers. You probably could have worked it out an hour ago, but now your equation dissolves to nothing in your mind’s eye after a minute.");
					break;

				case HYPNO_STAT_WILL:
					outputText(" You place your [pc.tongue] firmly between your teeth. Lane gave you the strength of will, so if you wanted, you could probably draw blood if you bit hard enough. Just as you begin to bite yourself, the pain shocks you away from the notion, and you grunt. You don’t want to hurt yourself just to make a point to yourself, though you probably would have an hour ago.");
					break;

				case default:
					throw new Error("Couldn't match selected effect.")
					break;
			}

			outputText(" That lying Daynar" + lane.mf(" son of a", "") + " bitch gipped you out of your money! You paid to have something about you changed, and it only lasted a day! You don’t go to the doctor to cure a disease just for the weekend; you shouldn’t have to do the same with a hypnotist! The next time you’re on the planet, you make a mental note to yourself to give that scaly " + lane.mf("prick", "cunt") +" a piece of your mind.");
		}
		else
		{
			outputText("As you walk the biomes of {planet}, you hear a beep and feel a vibration on your [hip]. You reach for your codex; on it flashes a reminder you had programmed into it the day before about Lane’s hypnosis wearing off.");

			outputText("\n\nRight on time, you feel your body change, on a sort of metaphysical level.");

			switch (effectToRemove)
			{
				case HYPNO_STAT_PHYS:
					outputText(" You look to your hands and make a pair of tight fists. Your grip is still plenty strong, but something just feels off somehow. You look to your bicep and you flex, and you swear your arm wasn’t as big as it was a few hours ago.");
					break;

				case HYPNO_STAT_REF:
					outputText(" You look around your feet for a pebble, or a coin, or something, and the glint of a rounded scrap of metal catches your eye. You pick it up and, without looking, toss it straight up into the air. When it passes your vision, you reach out to grab it, but you come up short, and it hits the ground in front of you.");
					break;

				case HYPNO_STAT_AIM:
					outputText(" You focus your eyes on the space around you, to the dust flitting through the air before your eyes. You spot a particular speck and try to focus on it, but it soon disappears in a cloud of likewise-looking specks, and then it might as well have vanished entirely.");
					break;

				case HYPNO_STAT_INT:
					outputText(" You start trying to do long division in your head. You recall an obscure method of doing it back in middle school – you could always get the first few steps down but then the lessons got murky the further you went, until it became just a total mess of numbers and integers. You probably could have worked it out an hour ago, but now your equation dissolves to nothing in your mind’s eye after a minute.");
					break;

				case HYPNO_STAT_WILL:
					outputText(" You place your [pc.tongue] firmly between your teeth. Lane gave you the strength of will, so if you wanted, you could probably draw blood if you bit hard enough. Just as you begin to bite yourself, the pain shocks you away from the notion, and you grunt. You don’t want to hurt yourself just to make a point to yourself, though you probably would have an hour ago.");
					break;

				case default:
					throw new Error("Could find selected effect.");
					break;
			}
			outputText("\n\nYou sigh – it was fun while it lasted. You put your codex away and make a mental note to return to Lane about another boost the next time you’re in the area.");
		}
	}

	// Revert whatever stat the PC paid to increase back to normal
	// If the PC gets hypnotized multiple times, in more than one stat, I think it might be better to revert them all at the same time, starting the clock with the first hypnosis they get (so they can’t wait 23 hours and then scum the clock back). This is mostly just to avoid having the ‘hypnosis wears off’ message several times in succession, but this is, of course, just a suggestion.

	// Rather than removing them all at once, the first one removed trips a flag that will change us from delivering the "full fat" messages, to a lite message.
	// TODO: Add this small message!
	flags["HYPNO_EFFECT_SMALL_MESSAGES"] = 1;

	var modValue:Number = 0;

	switch (effectToRemove)
	{
		case HYPNO_STAT_PHYS:
			modValue = pc.statusEffectv1("Lane's Hypnosis - Physique");
			pc.physiqueMod -= modValue;
			pc.removeStatusEffect("Lane's Hypnosis - Physique");
			break;

		case HYPNO_STAT_REF:
			modValue = pc.statusEffectv1("Lane's Hypnosis - Reflexes");
			pc.reflexesMod -= modValue;
			pc.removeStatusEffect("Lane's Hypnosis - Reflexes");
			break;

		case HYPNO_STAT_AIM:
			modValue = pc.statusEffectv1("Lane's Hypnosis - Aim");
			pc.aimMod -= modValue;
			pc.removeStatusEffect("Lane's Hypnosis - Aim");
			break;

		case HYPNO_STAT_INT:
			modValue = pc.statusEffectv1("Lane's Hypnosis - Intelligence");
			pc.intelligenceMod -= modValue;
			pc.removeStatusEffect("Lane's Hypnosis - Intelligence");
			break;

		case HYPNO_STAT_WILL:
			modValue = pc.statusEffectv1("Lane's Hypnosis - Willpower");
			pc.willpowerMod -= modValue;
			pc.removeStatusEffect("Lane's Hypnosis - Willpower");
			break;

		case default:
			throw new Error("Couldn't find selected effect.");
			break;
	}

	if (flags["HYPNO_EFFECT_SMALL_MESSAGES"] != undefined)
	{
		eventBuffer += "\n\nAnother one of Lane's hypnotic augmentations is beginning to dissipiate. You sigh – it was fun while it lasted. You put your codex away and make a mental note to return to Lane about another boost the next time you’re in the area.";
		mainGameMenu();
	}
	else
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

/*
Add a hypnosis effect that boosts a stat. Also creates the time-checking hidden effect that will be used to determine if we're doing special things.
*/
const HYPNO_STAT_PHYS:String = "Physique";
const HYPNO_STAT_REF:String = "Reflexes";
const HYPNO_STAT_INT:String = "Intelligence";
const HYPNO_STAT_AIM:String = "Aim";
const HYPNO_STAT_WILL:String = "Willpower";

function hasHypnosisEffect():void
{
	if (pc.hasStatusEffect("Lane's Hypnosis - Physique")) return true;
	if (pc.hasStatusEffect("Lane's Hypnosis - Reflexes")) return true;
	if (pc.hasStatusEffect("Lane's Hypnosis - Intelligence")) return true;
	if (pc.hasStatusEffect("Lane's Hypnosis - Willpower")) return true;
	if (pc.hasStatusEffect("Lane's Hypnosis - Aim")) return true;
	return false;
}

function addHypnosisEffect(stat:String):Boolean
{
	if (flags["LANE_TIMES_HYPNOTISED"] == undefined) flags["LANE_TIMES_HYPNOTISED"] = 0;
	flags["LANE_TIMES_HYPNOTISED"]++;

	throw new Error("Ensure the statmods are removed appropriately!");

	var alreadyUnder:Boolean = false;

	if 	(	pc.hasStatusEffect("Lane's Hypnosis - Physique") 
		|| 	pc.hasStatusEffect("Lane's Hypnosis - Reflexes") 
		|| 	pc.hasStatusEffect("Lane's Hypnosis - Intelligence") 
		|| 	pc.hasStatusEffect("Lane's Hypnosis - Willpower") 
		|| 	pc.hasStatusEffect("Lane's Hypnosis - Aim")
		)
	{
		increaseLaneHypnosisLevel();

		if (pc.hasStatusEffect("Lane Hypnosis"))
		{
			pc.setStatusMinutes("Lane Hypnosis", 60 * 24);
		}
		else
		{
			flags["HAS_HAD_LANE_HYPNOSIS"] = 1;
			pc.createStatusEffect("Lane Hypnosis", 0, 0, 0, 0, true, "", "", false, 60 * 24);
		}
		alreadyUnder = true;
	}

	if (stat == HYPNO_STAT_PHYS)
	{
		if (!pc.hasStatusEffect("Lane's Hypnosis - Physique"))
		{
			pc.createStatusEffect("Lane's Hypnosis - Physique", 5, 0, 0, 0, false, "Pill", "Lane's hypnosis session has improved your physique!", false, 60 * 24);
			pc.physiqueMod += 5;
		}
		else
		{
			pc.setStatusMinutes("Lane's Hypnosis - Physique", 60 * 24);
		}
	}
	else if (stat == HYPNO_STAT_REF)
	{
		if (!pc.hasStatusEffect("Lane's Hypnosis - Reflexes"))
		{
			pc.createStatusEffect("Lane's Hypnosis - Reflexes", 5, 0, 0, 0, false, "Pill", "Lane's hypnosis session has improved your reflexes!", false, 60 * 24);
			pc.reflexesMod += 5;
		}
		else
		{
			pc.setStatusMinutes("Lane's Hypnosis - Reflexes", 60 * 24);
		}
	}
	else if (stat == HYPNO_STAT_INT)
	{
		if (!pc.hasStatusEffect("Lane's Hypnosis - Intelligence"))
		{
			pc.createStatusEffect("Lane's Hypnosis - Intelligence", 5, 0, 0, 0, false, "Pill", "Lane's hypnosis session has improved your intelligence!", false, 60 * 24);
			pc.intelligenceMod += 5;
		}
		else
		{
			pc.setStatusMinutes("Lane's Hypnosis - Intelligence", 60 * 24);
		}
	}
	else if (stat == HYPNO_STAT_AIM)
	{
		if (!pc.hasStatusEffect("Lane's Hypnosis - Aim"))
		{
			pc.createStatusEffect("Lane's Hypnosis - Aim", 5, 0, 0, 0, false, "Pill", "Lane's hypnosis session has improved your aim!", false, 60 * 24);
			pc.aimMod += 5;
		}
		else
		{
			pc.setStatusMinutes("Lane's Hypnosis - Aim", 60 * 24);
		}
	}
	else if (stat == HYPNO_STAT_WILL)
	{
		if (!pc.hasStatusEffect("Lane's Hypnosis - Willpower"))
		{
			pc.createStatusEffect("Lane's Hypnosis - Willpower", 5, 0, 0, 0, false, "Pill", "Lane's hypnosis session has improved your willpower!", false, 60 * 24);
			pc.willpowerMod += 5;
		}
		else
		{
			pc.setStatusMinutes("Lane's Hypnosis - Willpower", 60 * 24);
		}
	}

	if (laneHypnosisLevel() == 2) pc.lust(20);
	if (laneHypnosisLevel() == 3) pc.lust(40);

	return alreadyUnder;
}

function enterLanesShop():void
{
	// Reset the "mini" flag so we'll get the full version of the effect-removal messages.
	if (flags["HYPNO_EFFECT_SMALL_MESSAGES"] != undefined) flags["HYPNO_EFFECT_SMALL_MESSAGES"] = undefined;

	if (flags["MET_LANE"] == undefined) discoverLanesShop();
	else if (flags["LANE_FIRST_HYPNO"] == 1 && flags["LANE_TIMES_HYPNOTISED"] > 0 && !hasHypnosisEffect()) lanesShopFirstRepeat();
	else if (hasMaxedLaneHypnosis()) lanesShopFullyUnder();
	else repeatEnterLanesShop();
}

function discoverLanesShop():void
{
	flags["MET_LANE"] = 1;

	clearOutput();
	output("You see a large hut off the beaten pathway of the desert cave’s dirt and sands. The hut is made of hardened mud and stone, but is dressed from top to bottom with fine, lacy fabrics and thin streamers blowing in the calm breeze, making it look quite inviting and standoffish, compared to the blandness of the surrounding area. The hut looks to have three rooms, and is only one story tall. There is a sign nailed above the open, door-less doorway that reads ‘Lane’s Plane: Unlocking the New You.’ Your curiosity is piqued, and you head inside.");
	
	output("\n\nThe first room is really quite plain: there is a small desk to the side, made of concrete but smooth as glass, as well as a pair of chairs on either side, each with a thick, plushy cushion. A small sign on the desk details what services the store provides, but at the top, in huge, bolded letters, are the words ‘No Refunds’. A small bookcase sits behind the desk and faces the inside chair – it’s likely a secretary’s desk or something. Some potted plants, with exotic leaves and stems from parts of the world you’ve yet to explore, sit in the corners. There are no windows. The second half of the room is draped in more of those fabrics and streamers; they don’t conceal what lies beyond them, but they do obfuscate your vision enough to hide the details.");
	
	output("\n\nThere is nobody sitting at the desk to greet you. You hear the sound of bare feet stepping over the stone of the floor beyond the curtains, and you turn to see who is there. On the other side you see a humanoid-shaped person fidgeting with what you assume is some furniture. Whatever it is they’re doing, it appears to be giving regular flashes of red and blue light, dimly illuminating the whole room. They’re not standing profile, so you can’t tell if they have breasts or not, but you can make out the tell-tale sway of a tail reaching down their legs and nearly reaching their ankles.");
	
	output("\n\nWhoever is over there is clearly distracted and hasn’t noticed you yet. You think to clear your throat and call out to them, but, with just the silhouette, you can’t think of which gender-pronoun to address them as. Do you just assume it’s a male, or do you take the chance and assume it’s a female?");

	clearMenu();
	addButton(0, "Male", laneGenderSelect, "male");
	addButton(1, "Female", laneGenderSelect, "female");
}

function laneGenderSelect(g:String):void
{
	if (g == "male")
	{
		lane.configMale();
		meetMaleLane();
	}
	else if (g == "female")
	{
		lane.configFemale();
		meetFemaleLane();
	}
	else
	{
		throw new Error("Invalid gender detected. Wakka wakka.");
	}
}

function meetMaleLane():void
{
	clearOutput();
	outputText("<i>“Excuse me, sir?”</i> you call out, hoping you’ve made the right decision. The figure immediately straightens out, bumping its feet on whatever it was shuffling around, and turns around, towards the curtains. A pair of brown, scaly, webbed, four-fingered ‘hands’ reaches between the gap of the curtains and pulls them wide open: there, a sort of lizard-man greets you, eye-to-eye, looking a little flustered that you had managed to get the drop on him.");

	outputText("\n\n<i>“I’m sorry!”</i> he says, stepping forward and shutting the curtain behind him. <I>“This is embarrassing! I was a little distracted, and I didn’t hear you step in. You haven’t been here for too long, I hope?”</I>");

	outputText("\n\nYou tell him that you had only just walked in. You’re quickly distracted yourself by the lizard-man’s appearance. He’s wearing even more of the white, lacy fabric all over his body, which does a poor job of concealing his skin and his bodily features: he has no nipples on his chest and he has no belly-button, and the whole front of his body appears to have thin, enviously smooth skin. His pelvis is concealed by a much thicker white fabric, concealing his privates and keeping him half-decent. When he first poked his head through the curtains, a pair of large, thin membranes, going from his jaw to his shoulders, seemed to flair wide open for a moment in his surprise before he shut them against his neck again. But the most mesmerizing thing of all is that the lizard-man appears to be... <i>glowing,</i> for lack of a better term. His skin is constantly flashing red and blue, giving away what the pale light from before was.");

	outputText("\n\nHe notices your odd, abject staring at his body, and his lizard-lips curl into a well-meaning smirk. <I>“You must never have seen a Daynar before, I take it?”</i> he asks you, putting his hands on his hips and striking a sassy pose. You hesitate for a moment, trying to find the willpower to break free from the hypnotic glowing underneath his skin, and you nod, confirming his assumption. <i>“Well, there’s a first time for everything.”</i> He reaches forward with his right hand. <i>“My name is Lane. Welcome to my little plane of existence.”</i>");

	outputText("\n\nYou shake his hand and give it a few strong pumps, replying with your own name. He quickly takes his spot behind the concrete desk, pulls his chair forward, and takes a seat, adopting a more professional demeanor for his new customer. <i>“[pc.name] Steele? As in, Steele Tech? Didn’t you inherit that company from your father – may he rest in peace?”</i> You tell him that, yes, of Steele Tech, but no, you haven’t, and that you’re working on it. His eyes wander for the briefest of moments, before he straightens himself out and looks you in the eye. <i>“So, [pc.name] Steele, what can I help you with?”</i>");

	laneShowMenu();
}

function meetFemaleLane():void
{
	clearOutput();
	outputText("<i>“Excuse me, ma’am?”</i> you call out, hoping you’ve made the right decision. The figure immediately straightens out, bumping its feet on whatever it was shuffling around, and turns around, towards the curtains. A pair of brown, scaly, webbed, four-fingered ‘hands’ reaches between the gap of the curtains and pulls them wide open: there, a sort of lizard-woman greets you, eye-to-eye, looking a little flustered that you had managed to get the drop on her.");

	outputText("\n\n<i>“I’m sorry!”</i> she says, stepping forward and shutting the curtain behind her. <I>“This is embarrassing! I was a little distracted, and I didn’t hear you step in. You haven’t been here for too long, I hope?”</I>");

	outputText("\n\nYou tell her that you had only just walked in. You’re quickly distracted yourself by the lizard-woman’s appearance. She’s wearing even more of the white, lacy fabric all over her body, which does a poor job of concealing her skin and her bodily features: she has no nipples on her (rather generous) chest; she has no belly-button; and the whole front of her body appears to have thin, enviously smooth skin. Her pelvis is concealed by a much thicker white fabric, concealing her privates and keeping her half-decent. When she first poked her head through the curtains, a pair of large, thin membranes, going from her jaw to her shoulders, seemed to flair wide open for a moment in her surprise before she shut them against her neck again. But the most mesmerizing thing of all is that the lizard-woman appears to be... <i>glowing,</i> for lack of a better term. Her skin is constantly flashing red and blue, giving away what the pale light from before was.");

	outputText("\n\nShe notices your odd, abject staring at her body, and her lizard-lips curl into a well-meaning smirk. <I>“You must never have seen a Daynar before, I take it?”</i> she asks you, putting her hands on her hips and striking a sassy pose. You hesitate for a moment, trying to find the willpower to break free from the fancy glowing underneath her skin, and you nod, confirming her assumption. <i>“Well, there’s a first time for everything.”</i> She reaches forward with her right hand. <i>“My name is Lane. Welcome to my little plane of existence.”</i>");

	outputText("\n\nYou shake her hand and give it a few strong pumps, replying with your own name. She quickly takes her spot behind the concrete desk, pulls her chair forward, and takes a seat, adopting a more professional demeanor for her new customer. <i>“[pc.name] Steele? As in, Steele Tech? Didn’t you inherit that company from your father – may he rest in peace?”</i> You tell her that, yes, of Steele Tech, but no, you haven’t, and that you’re working on it. Her eyes wander for the briefest of moments, before she straightens herself out and looks you in the eye. <i>“So, [pc.name] Steele, what can I help you with?”</i>");

	laneShowMenu();
}

function lanesShopFirstRepeat():void
{
	flags["LANE_FIRST_HYPNO_RETURN"] = 2;
	clearOutput();
	outputText("You march right into Lane’s little hut, a hundred angry things to say to [lane.himHer] all at once. [lane.heShe]’s there, lounging at [lane.hisHer] desk and playing with [lane.hisHer] codex, and [lane.heShe] hardly seems phased at all when you start stomping into [lane.hisHer] business with a look like you’re going to rip [lane.hisHer] head off.");

	outputText("\n\n<i>“Lane!”</i> you shout, slapping at [lane.hisHer] desk forcefully, rumbling the little knicks and knacks [lane.heShe] has placed all around it. [lane.HeShe] looks up from his codex and into your eyes, fearlessly.");

	outputText("\n\n<i>“Ah, [pc.name],”</i> [lane.heShe] says nonchalantly. <i>“You must be here because the last hypnosis wore off, and you’re upset that it didn’t last forever.”</i> You’re a bit surprised that [lane.heShe] had deduced it so quickly. <i>“Yeah, that’s happened almost every single time, now. Everyone assumes that it’s a one-pay thing, and then they get the clarity I give them for the rest of their lives.”</i>");

	outputText("\n\nYou’re not the first person to yell at [lane.himHer] for giving you a temporary service? <i>“And I very much doubt you’ll be the last,”</i> [lane.heShe] says. <i>“I can understand why you’d be upset, but think about it from a " + lane.mf("businessman", "businesswoman") + "’s point of view, [pc.name]. Where would I get my money if I didn’t have repeat customers? I can’t survive on just one-offs. I</i> am <i>trying to run a business, here.”</i>");

	outputText("\n\nYou remain indignant and insist that [lane.heShe] could have at least told you beforehand that [lane.hisHer] ‘improvements’ were temporary. In response, [lane.heShe] taps at the bottom line of words at [lane.hisHer] ‘No Refunds’ sign. The font is small, but it clearly says that each service of [lane.hisHers] is strictly temporary and will wear off after twenty-four Terran hours, but can be reinstated the following day at the same charge.");

	outputText("\n\nSheepish, you sit and apologize for your outburst. <i>“Think nothing of it,”</i> [lane.heShe] tells you. <i>“Your response was actually quite contained compared to some of my more... animate customers. Besides, if you’re here, it means you liked my business enough to get yourself into a stink over it.”</i> [lane.HeShe] leans back casually. <i>“Let’s put that all behind us. What can I do for you today?”</i>");

	laneShowMenu();
}

function repeatEnterLanesShop():void
{
	clearOutput();
	outputText("You approach Lane’s Plane, interested in another dose of [lane.hisHer] medicine. You enter [lane.hisHer] familiar hut and you see [lane.himHer], lazily lounging on [lane.hisHer] seat behind [lane.hisHer] desk as usual. [lane.HeShe] perks up, lifting [lane.hisHer] head at the sound of a coming customer’s footsteps, and [lane.hisHer] expression lights right up as soon as you walk into the store. <i>“Welcome again, [pc.name]!”</i> [lane.heShe] says, opening [lane.hisHer] arms warmly to greet you. <i>“Please, have a seat. To what do I owe the pleasure today? How can Lane help you in [lane.hisHer] plane?”</i>");

	outputText("\n\n[lane.HeShe] sits there, crossing [lane.hisHer] arms patiently while you take the seat across from [lane.himHer], and waits for your response.");

	laneShowMenu();
}

function lanesShopFullyUnder():void
{
	clearOutput();
	outputText("You approach Lane’s Plane, eager for another dose of your "+ lane.mf("master", "mistress") +"’s medicine. [lane.HisHer] hut has been taking on a rather extravagant turn lately, with all that extra money [lane.heShe]’s been siphoning from you. When you enter, you see [lane.himHer] lounging languidly, [lane.hisHer] legs spread and [lane.hisHer] chair leaned back, waiting for some other unlucky- or lucky, from your twisted, controlled perspective- customer to walk into [lane.hisHer] trap.");

	outputText("\n\n[lane.HeShe] smirks that familiar smirk when you walk in, and [lane.heShe] drops his feet to the floor" + lane.mf("", ", making her bust bounce just slightly from the motion and the vibration") + ".");
	outputText(" [lane.heShe] regulates [lane.hisHer] pulse, and already you’re weak in the knees and horny in the loins,");
	if (pc.hasCock() && !pc.hasVagina()) outputText(" your [pc.eachCock] rousing to attention, hoping Lane will provide you some ‘other’ service. Beads of your [pc.cum] begin to stain your clothing as you sit.");
	else if (pc.hasVagina() && !pc.hasCock()) outputText(" your [pc.vagina] moistening in rapt optimism that Lane will use [lane.hisHer] power over to you give you another life-altering orgasm.");
	else if (pc.hasVagina() && pc.hasCock()) outputText(" each and every part of you ready to sink deeper into [lane.hisHer] control, if it means getting off the way only [lane.heShe] can get you off anymore.");
	else outputText(" which only serves to frustrate you, but your waking mind knows that your needs are secondary to [lane.hisHer], and providing yourself to Lane is the greatest pleasure you'll ever need.");

	outputText("\n\n[lane.HeShe] flairs his tassels open, only for a moment, to let you taste of the sweet pleasure you’ve come to [lane.himHer] for. Teasingly, they shut again, and you’re left horny and thirsty for more of [lane.himHer]. <i>“Welcome back, my pet,”</i> [lane.heShe] says sensually, dragging a loving claw gently over your [pc.face]. <i>“Have you come to Lane for more of [lane.hisHer] magic? Or are you here to pay your ‘taxes’?”</i>");

	laneShowMenu();
}

function laneShowMenu():void
{
	clearMenu();
	addButton(0, "Talk", talkToLane);
	addButton(1, "Services", lanesServices);
	addButton(2, "Taxes", lanesTaxes);
	addButton(5, "Appearance", lanesAppearance);
	addButton(14, "Leave", leaveLanes);
}

function talkToLane():void
{
	clearOutput();

	if (hasLaneHypnosis())
	{
		outputText("[lane.HeShe] laughs, not derisively, but not amusedly either. <i>“You and I have gotten plenty intimate over your visits. I’ve charmed you quite enough, I think.”</i> [lane.HeShe] flairs his tassels open again, and his power over you is refreshed. If [lane.heShe] doesn’t want to talk, that’s perfectly fine with you. <i>“But,”</i> [lane.heShe] yawns, closing [lane.hisHer] membranes against [lane.hisHer] neck, <i>“you’ve come all this way just to taste of your "+ lane.mf("Master", "Mistress") +"’s voice some more. Who would I be to turn down such a loyal pet?”</i>");
	}
	else
	{
		outputText("\n\n<i>“Oh, this is a social call, is it?”</i> Lane says, trilling amusedly. [lane.HeShe] leans back in [lane.hisHer] chair, slumping and relaxing, stretching [lane.hisHer] limbs out. <i>“Sure, I wouldn’t mind shooting the breeze for a moment. What’s on your mind?”</i>");
	}

	generateLaneTalkMenu();
}

function generateLaneTalkMenu():void
{
	clearMenu();
	
	addButton(0, "Occupation", laneTalkOccupation);
	
	if (flags["LANE_OCCUPATION_TALK"] != undefined) addButton(1, "Daynar", laneTalkDaynar);
	else addDisabledButton(1, "Daynar");

	if (flags["LANE_DAYNAR_TALK"] != undefined) addButton(2, lane.mf("Him", "Her") + "self", laneTalkThemself);
	else addDisabledButton(2, lane.mf("Him", "Her") + "self");
	
	addButton(14, "Back", laneShowMenu);
}

function laneTalkOccupation():void
{
	flags["LANE_OCCUPATION_TALK"] = 1;
	clearOutput();
	outputText("You ask Lane what [lane.hisHer] occupation is, out here in the middle of the Venar desert, setting up shop in some little mud hut. Beyond the codex lying atop [lane.hisHer] desk, [lane.hisHer] business seems very... rustic. There’s very little in the way of modernization here.");

	outputText("\n\n<i>“Yeah, you’re right,”</i> [lane.heShe] says proudly. <i>“I know my way around the modern world about as well as anyone else, but I try to keep my house, and my business, as down-to-earth as possible. I specialize in....”</i> [lane.HeShe] pauses, tapping a claw against [lane.hisHer] chin. <i>“</i>Spiritualistic medicine<i> is one way of putting it.”</i> You ask [lane.himHer] to elaborate.");

	outputText("\n\n<i>“Well, think about it. Say you don’t like something about yourself – maybe you’re too meek, or shy, or you have a nervous tic, or something. Maybe you’re just depressed. Today, most of those things can be fixed with a bottle of pills, or the push of a button, or a needle in your arm. Modern medicine is all well and good, and if I ever get sick with the pony pox, you’ll find me elbow-deep in my medicine cabinet. But maybe you have something a pill can’t fix, or maybe you’re not a fan of putting things in your body. That’s where I can help out.”</i>");

	outputText("\n\nA pair of thin, fleshy membranes unstick from the sides of [lane.hisHer] neck and flare open. They reach from the very edges of [lane.hisHer] shoulders to the bottom of [lane.hisHer] jaw on either side of [lane.hisHer] head. They have some markings and piercings on them, but they’re so thin that the glowing from the inside of [lane.hisHer] body is especially intense on them. <i>“I specialize in hypnosis,”</i> [lane.heShe] says, after letting you gawk at the red-and-blue flashing of [lane.hisHer] thin skin a bit. [lane.HeShe] presses the membranes flat against [lane.hisHer] neck again, stopping the light show. <i>“I can hypnotize anybody.”</i>");

	outputText("\n\nYou shake the lights from your eyes, and you scoff at [lane.himHer]. Hypnosis? You’d have thought something as archaic as that would have phased out centuries before the first Great Planet Rush.");

	outputText("\n\n<i>“A lot of people thought so,”</i> [lane.heShe] said, lifting up [lane.hisHer] codex and pressing a few buttons on its screen. [lane.HeShe] then turned it towards you. <i>“Here are some customer testimonials if you’re unconvinced.”</i> On the bright screen was a sort of guestbook: different names and handwriting from every unique customer Lane ever had was there, and each of them sang [lane.hisHer] praises, assuring whoever read them that Lane was the real deal. [lane.HeShe] turns towards his bookcase. <i>“I also have a work permit, and a certification of guaranteed quality from the UGC, if you’d like.”</i> From its top shelf, [lane.heShe] pulls out two certificates, both of them framed, stamped, and signed. You can’t deny it – Lane is running a real, legitimate business in hypnotism.");

	outputText("\n\nYou return his codex to [lane.himHer] and, intrigued, you ask [lane.himHer] how hypnosis works, and how [lane.heShe] can use it as a business. <i>“The most important part is that the customer has to want it. If, say, you came to me complaining about your depression and you paid me to hypnotize it out of you, but you didn’t actually want it, then it would fail.”</i> [lane.HeShe] nods to the sign on [lane.hisHer] desk, tapping at the top line of the sign: the big words that say ‘No Refunds.’ <i>“That’s why there are no refunds. As soon as you give me the credits, I’m not giving them back. If nothing else, it provides a good incentive for people to want to get their money’s worth.”</i>");

	if (pc.isMischevious()) outputText("\n\nYou lean back in your chair and you smirk at [lane.himHer]. If the customer really has to want it, then [lane.heShe] can’t exactly just walk down the street and hypnotize the money out of people’s wallets, then. <i>“Unfortunately, no,”</i> [lane.heShe] says, laughing with you. <i>“If I could do something like that, then I’d have taken up a job as a politician, or a news anchor; something to get me in front of a camera. But unless every single person watching me wants me to hypnotize them, all they’d see is a Daynar with a bunch of tattoos on [lane.hisHer] tassels. I’m afraid universal domination isn’t really in my schedule.”</i> You tell [lane.himHer] that [lane.heShe] must be heartbroken, and [lane.heShe] just waves you off.");

	outputText("\n\n<i>“So, are you convinced?”</i> [lane.heShe] asks, opening [lane.hisHer] hands to you. <i>“Would you like to give it a try? Or is there something I can help you further with?”</i>");

	generateLaneTalkMenu();
	addDisabledButton(0, "Occupation");
}

function laneTalkDaynar():void
{
	flags["LANE_DAYNAR_TALK"] = 1;
	clearOutput();

	outputText("You ask [lane.himHer] about his species. When you first met, [lane.heShe] introduced himself as a ‘Daynar’. <i>“That’s correct,”</i> [lane.heShe] says, crossing [lane.hisHer] arms. <i>“We’re one of the many races natively found on the planet Venar. I’m told we closely resemble a common lizard on the planet Terra.”</i> You confirm. <i>“We’re big fans of hot, dry places, like the desert we’re under. We evolved from a smaller, more... beastly, single-minded creature only a few millenniums ago. A blink of an eye, in geological terms.”</i> [lane.HeShe] scratches the top of [lane.hisHer] bald, scaly head. <i>“Our evolution was natural for the most part, until aliens like yourself started showing up and polluting our sands with your biogenetic drugs. Not that I’m complaining, myself.”</i>");

	outputText("\n\nYou ask [lane.himHer] if all the Daynar have blood that glows. You find it awfully distracting in a pleasant way. <i>“Oh, yes. It’s another evolutionary advantage, one we still use today. How brightly it glows is an indicator of the individual’s health and sexual potency - " + lane.mf("the brighter it is on a male, for instance, then the healthier he is, and the more virile his sperm is.", "the brighter it is on a female, for instance, then the healthier she is, and she’ll lay a larger, healthier clutch of eggs than others.") + " The way the blood pulses can also be a signal if a female Daynar is in heat.”</i> [lane.HeShe] looks away and sighs, twirling a claw on [lane.hisHer] desk. <i>“Back when we were still a fledgling species, we were hunted quite a bit for our blood. They were used for fancy baubles and knick-knacks: tacky, expensive glowsticks and the like. That stopped in a hurry, thankfully, once we learned how to talk. The UGC didn’t like the idea of hunting a sapient species, and outlawed the practice.”</i>");

	outputText("\n\nYou look at Lane’s neck and chest, watching [lane.hisHer] blood course, [lane.hisHer] skin glowing an iridescent red and then a melancholy blue.");
	if (!pc.isMischevious()) outputText(" An obvious, quite personal question comes to mind, but you decide not to embarrass the poor thing.");
	else 
	{
		outputText(" You ask [lane.himHer] what [lane.hisHer] own glowing means for [lane.hisHer] health. <i>“I’m not asked that too often,”</i> [lane.heShe] notes, looking down at [lane.hisHer] chest. <i>“I</i> feel <i>fine... I’m hardly a fitness nut, but I usually start my mornings with a set of " + lane.mf("push-ups", "crunches") +". I think I’m about average.”</i> And, you ask... what about [lane.hisHer] ‘sexual potency?’");
		if (!hasLaneHypnosis()) outputText(" The colour of [lane.hisHer] eyes change from brown to a rosy red, and [lane.heShe] just chuckles and looks away.");
		else outputText(" <i>“I should think you’d know,”</i> [lane.heShe] says, flaring open [lane.hisHer] tassels for a moment, <i>“but I can give you a reminder a little later, pet.”</i> You feel something of yours flaring between your legs as well.");
	}

	outputText("\n\nYou ask Lane about the weird membranes connecting [lane.hisHer] jaw to [lane.hisHer] shoulders. <i>“Oh, these,”</i> [lane.heShe] says, flapping them open. Your eyes are caught on them, watching how [lane.hisHer] blood glows brightest through them, and how the veins in [lane.hisHer] skin work with the tattoos on - [lane.heShe] closes them before you get a little <i>too</i> distracted. <i>“We Daynar call them ‘tassels’. They’re used to regulate our body temperature, and, if we’re in the middle of a fight, we can open them in a flash to scare our opponent. In today’s modern world, though, with air-conditioning, climate control, and not much in the way of natural predators, they don’t see much use anymore.”</i>");

	outputText("\n\n[lane.HeShe] opens [lane.hisHer] eyes wide – unusually wide, making you fidget in your seat – and, just like that, the colour of Lane’s irises begin to change, into every colour you can imagine. <i>“Daynar don’t have the best night vision, so we can open our eyes really wide to draw in more light to compensate. As for the irises... nobody is really sure why we can do that. Our best guess is to unnerve predators: to make us look sickly and unappetizing. Whatever the purpose, they sure make my job easier.”</i> [lane.HeShe] points to the sides of [lane.hisHer] head. <i>“Our ears are pretty plain,”</i> [lane.heShe] begins. You have to lean forward to see where [lane.hisHer] ears even are: they’re just a pair of holes in [lane.hisHer] head, nothing more. <i>“But we have</i> great <i>hearing. Some Daynar pick up jobs as interpreters because we have an easier time picking up different languages than most.”</i>");

	// TODO: Tweak this.
	outputText("\n\n[lane.HeShe] leans forward in [lane.hisHer] seat. <i>“There’s just one more thing I want to mention. It’s about Steele Tech.”</i> You match [lane.hisHer] posture, interested. <i>“I don’t know if you knew this, but most Daynar on the planet are employed by Steele Tech. Venar, it turns out, has a lot of minerals and ores that the rest of the universe is interested in, but no other race can withstand the harsh climate of the hot desert or the planet core like a Daynar can. Which makes us</i> highly <i>desirable for a mining company. Your dad paid us pretty well, and his stickler for safety carried over to Venar; there isn’t a Daynar here that wouldn’t mind calling you ‘boss’ if you kept up his legacy, [pc.name].”</i>");

	outputText("\n\nYou shift in your seat, uncomfortable with the sudden pressure, but you assure [lane.himHer] that you’ll do what you can. Lane leans back, relaxing. <i>“That about covers it, I think. Is there anything else I can help you with?”</i>");

	generateLaneTalkMenu();
	addDisabledButton(1, "Daynar");
}

function laneTalkThemself():void
{
	flags["LANE_SELF_TALK"] = 1;
	clearOutput();

	outputText("You ask [lane.himHer] if hypnosis is a thing that all Daynar can do. <i>“As in, is it something they just intrinsically know? No. Anyone can learn it, of course, but, as far as I know, I’m the only Daynar that bothered to take the time.”</i>");

	outputText("\n\nYou then ask [lane.himHer] about himself. What inspired [lane.himHer] to get into the business of hypnotism? Despite the certificates and the testimonials, you insist that it <i>is</i> a pretty ancient practice. <i>“Yes, I know, and I agree. Hypnosis hasn’t really been in the news, so to speak, for hundreds of years now.”</i> [lane.HeShe] chuckles sheepishly. <i>“If I’m honest, the inspiration for picking it up was because... I was bullied a lot when I was younger. I had a lot of power fantasies about controlling the people around me to do whatever I wanted. Like, commanding them to be my footrest as I sit on my gilded, golden throne; stuff like that. Making them ‘regret’ bullying the wrong Daynar.”</i>");

	outputText("\n\n[lane.HeShe] rests his chin on the palm of [lane.hisHer] scaly hand, reminiscing about [lane.hisHer] younger years. <i>“I didn’t learn about hypnotism until my adolescent years, when I was studying history. One of my textbooks mentioned hypnosis as an old, ancient, spiritual practice. I was intrigued, so I studied it some more, and before I knew it, I was getting a permit to practice it as a business.”</i>");

	if (!hasLaneHypnosis())
	{
		outputText("\n\nYou chuckle uncomfortably, rolling your shoulders. [lane.HeShe] learned how to control people, and [lane.heShe] made it a legitimate business... because of a power fantasy? <i>“I know what you’re thinking,”</i> [lane.heShe] says smoothly, trying to calm your nerves. <i>“If I put a person ‘under’, then I could, theoretically, control what the person feels and thinks and does until they pull out of it. Believe it or not, the UGC thought so too – and they made me swear that I wouldn’t use my skills ‘to the detriment of the peoples that trust my judgment’. Sort of like the Hippocratic Oath for doctors.”</i> You narrow your eyes and chew your bottom lip. You could trust a surgeon, but a hypnotist...?");
	}
	else
	{
		outputText("\n\nYou smile sensually, resting an elbow on Lane’s desk. You tell {him}, in a dulcet tone, that you find power fantasies pretty sexy, yourself – especially when it’s {him} that’s in charge. In response, {he} grins, and opens {his} tassels, letting you absorb more of {him}. <i>“It wasn’t easy at first,”</i> {he} says, enjoying the way you watch the patterns on {his} tassels. <i>“I swore not to use my powers for evil. But then, the heir" + pc.mf("", "ess") + " of Steele Tech had to go and pay me to abuse [pc.himHer] until [pc.heShe] couldn’t get enough of me. And, I have to admit, ‘evil’ feels pretty good when" + lane.mf(" your pretty lips are sucking my dick and swallowing my cum like I was the only fountain in the desert.", " you’re digging for gold with your tongue in my cunny and you try oh-so-hard to hit just the right spots to make your mistress come again and again." + "”</i> {He} closes his tassels, leaving you teased for more.");
	}

	if (lane.mf("m", "f") == "f")
	{
		outputText("\n\nYou decide to broach a rather delicate and personal question, and you preface it by telling Lane that she doesn’t need to answer if she doesn’t want to. If you’re not mistaken, Daynarians are cold-blooded – which she confirms – and that Daynarians lay eggs – which she confirms. So, why does she have breasts?");
		outputText("\n\nShe leans back and stretches her arms, shamelessly showing off her doubly-dangerous jugs to you. <i>“I’m glad you noticed,”</i> she says slyly and without a hint of reserve. <i>“Daynarians were a very sexual species as we transitioned from a lowlier species to one of higher thought. The females don’t have breasts, you’re correct, but, as we discovered the more... carnal pleasures of life, we recognized their appeal and why they’re sexually desirable. Today, breasts on a female Daynarian means she has the means to acquire them in the first place, so they’re something of a status symbol. They don’t serve any purpose other than to be shown off – and,”</i> she says, massaging them right in front of you, <i>“I gotta say, they’re pretty fun.”</i>");
		outputText("\n\nIf they’re considered a status symbol among the Daynarians, does that mean male Daynarians can get them too? You chuckle as you imagine it, but she only smiles. <i>“It’s not unusual.”</i> That silences you in a hurry. <i>“But it is uncommon. It’s something of a clash between Daynarian culture and that of the rest of the universe’s: to us, boobs on anybody means they’re well off and financially stable, but not a lot of other cultures see it that way. So, don’t be surprised if you see a male Daynarian with a set bigger than mine, but try not to be repulsed, either.”</i>");
	}

	outputText("\n\n<i>“Now then, do you have any further questions?”</i> {He} leans back in {his} seat, waiting for your response.");


	generateLaneTalkMenu();
	addDisabledButton(2, lane.mf("Him", "Her") + "self");
}

function laneServices():void
{
	clearOutput();

	if (flags["LANE_SHOWN_SERVICES"] == undefined)
	{
		// First time.
		flags["LANE_SHOWN_SERVICES"] = 1;
		outputText("You ask Lane about {his} service, and you mention that you’re interested. <i>“Of course!”</i> {he} says, giddy that {he} has some business. <i>“I specialize in hypnosis. A lot of problems that a lot of people have are all in their head – if there’s something about yourself that you don’t like, but you’re not comfortable with using drugs or biotech to change your body, I can give you the boost you need. Or maybe you’re struggling with something more cerebral: I’ve had writers come to me before asking me to help with their writer’s block. Whatever the case, there’s no psychological barrier I can’t help you breach.”</i>");

		outputText("\n\nYou ask {him} to elaborate. <i>“Well, in your case, you don’t really seem like the desk-jockey sort. You’re more of a doer, a shaker; you’re out there, exploring new planets and conquering new terrains, or your name isn’t [pc.name] Steele. Am I right?”</i> You confirm. You never were one for desk jobs, and, without telling {him} why, you’ve been exploring the planets rather extensively lately.");

		outputText("\n\n<i>“So, and I don’t want to be presumptuous here, but let’s say you’re in the jungles of Mhen’ga and you see some Naleen in the bushes. You reach for your gun – but it’s faster! It lunges at you, and you point and shoot, but your aim goes wide and now that cat-snake has got you in its coils! You struggle and you struggle, but you don’t have the strength to break free! If only your reflexes were a little better!”</i>");

		outputText("\n\nYou sigh and cross your arms, waiting for {him} to get to the point. <i>“That’s where I can help. I can hypnotize your senses to be more acute, more in-tune with your surroundings and atmosphere. With my help, the next time you’re in those jungles, you’ll be able to turn the surprise around on the Naleen before it could even blink.”</i>");

		outputText("\n\nYou’re definitely intrigued, and you lean forward. {He} can really make your reflexes <i>that</i> good? <i>“Not only your reflexes!”</i> {he} insists. <i>“Have you ever been in a fight, and you wished you were stronger than you were? I can help with that, too! You often hear stories about people performing extraordinary feats of strength, when they look as wiry as a straw, yes? If only a person can harness that sort of strength and call on it whenever they wish. I can help with that! Whatever it is you need – anything at all – I can make you</i> better <i>just by making you believe that you are.”</i>");

		outputText("\n\nYou sit back in your seat, strongly considering Lane’s words. What the fuck, you decide – you’re here, you may as well. You tell {him} that you’re in. <i>“Excellent!”</i> {He} pulls up {his} own codex, and begins tapping at its screen. <i>“I charge one hundred credits per hypnosis. I am contractually obligated to remind you that there are no refunds. As soon as the payment goes through, we can begin.”</i>");

		outputText("\n\n{He} hands you {his} codex. It’s asking for your confirmation, and it lists what you’re purchasing, and for how much. Before you sign your confirmation, you think on it. If you paid Lane to hypnotize you... what would you change about yourself?");

		if (pc.credits < 100)
		{
			outputText("\n\nYou wince, looking at the codex, and you hand it back to {him}, sheepishly telling {him} that you can’t afford it. <i>“Oh.”</i> {He} wipes at its screen, and it goes blank. <i>“Not to worry, I don’t mind this being a social call. Is there anything else I can do for you?”</i>");

			laneShowMenu();
		}
		else
		{
			laneServicesMenu();
		}
	}
	else
	{
		// not hypno
		if (!hasLaneHypnosis())
		{
			if (flags["LANE_TIMES_HYPNOTISED"] > 0)
			{
				outputText("<i>“Of course,”</i> says Lane, already reaching for {his} codex and writing up your receipt. <i>“I’m glad that you enjoyed my service enough to come back, [pc.name].”</i> {He} passes you the codex. <i>“One hundred credits, as usual. Contract, no refunds, blah blah blah. What can I do for you this time?”</i>");
			}
			else
			{
				outputText("<i>“Of course,”</i> says Lane, already reaching for {his} codex and writing up your receipt. <i>“I’m glad to see that you're still interested in my services, [pc.name].”</i> {He} passes you the codex. <i>“One hundred credits, as usual. Contract, no refunds, blah blah blah. What can I do for you?”</i>")
			}

			if (pc.credits < 100)
			{
				outputText("\n\nYou wince, looking at the codex, and you hand it back to {him}, sheepishly telling {him} that you can’t afford it. <i>“Oh.”</i> {He} wipes at its screen, and it goes blank. <i>“I’m afraid I can’t give discounts to my regulars. Sorry. Is there anything else I can do for you, though? Shooting the breeze is always free.”</i>");

				laneShowMenu();
			}
			else
			{
				laneServicesMenu();
			}
		}
		else
		{
			// PC is hypnotized

			outputText("{He} smiles at you, and {he} reaches for his codex. <i>“Of course you do, [pc.name].”</i> {His} tassels flutter just enough so that you can get a taste of what’s to come. {His} claws are jittery on the codex’s screen, proof of {his} own excitement. <i>“I’m sure if I were to charge you three hundred credits, you wouldn’t object.”</i>");
			outputText("\n\nYou tell {him} that you wouldn’t.");
			outputText("\n\n<i>“How about three thousand? And you’re definitely not getting a refund.”</i>");
			outputText("\n\nYou insist that no price is too high.");
			outputText("\n\n<i>“You’re right. Submitting to me and my pleasure is worth more to you than your life. I could ask you to sign everything over to me and you wouldn’t say no, would you?”</i>");

			outputText("\n\nYou shake your head, salivating, eager to get started. {He} hands you the codex – and to your surprise, {he’s} only charging you the standard one hundred credits. <i>“I’m a little kinder than that, though.”</i> You blink, and thank {him} sincerely for {his} unprecedented generosity. <i>“Of course, this isn’t counting the ‘tax’ I’ll be charging you when we’re done.</i>");

			outputText("\n\nYou thank him for his ‘generosity’ again.");

			laneServicesMenu();
		}
	}
}

function laneServicesMenu():void
{
	clearMenu();
	if (pc.credits >= 100)
	{
		addButton(0, "Physique", laneServicePhysique);
		addButton(1, "Reflexes", laneServiceReflexes);
		addButton(2, "Aim", laneServiceAim);
		addButton(3, "Intelligence", laneServiceIntelligence);
		addButton(4, "Willpower", laneServiceWillpower);
	}
	else
	{
		addDisabledButton(0, "Physique");
		addDisabledButton(1, "Reflexes");
		addDisabledButton(2, "Aim");
		addDisabledButton(3, "Intelligence");
		addDisabledButton(4, "Willpower");
	}
	if (!hasLaneHypnosis()) addButton(14, "Back", laneServicesBack);
	else addButton(14, "Taxes", laneServicesBack);

	//[=Physique=] [=Reflexes=] [=Aim=] [=Intelligence=] [=Willpower=] [=Back=]
}

function laneServicesBack():void
{
	clearOutput();
	if (!hasLaneHypnosis())
	{
		outputText("{He} frowns as you hand {him} the codex. <i>“Changed your mind?”</i> You apologize, but you’re just not ready for {his} business today. <i>“Don’t worry, I understand. A lot of my customers, even the repeats, get the jitters sometimes. Is there anything else I can help you with, while you’re here?”</i>");

		// Return to main menu
		laneShowMenu();
	}
	else
	{
		if (pc.credits >= 100)
		{
			outputText("You glance up from the codex, your finger hovering teasingly over the confirmation button, when you hand it back to {him}. He looks confused, before you tell {him} that you’d like to skip the foreplay. {He} smiles and stands from {his} chair; {he} crooks a claw at you, ordering you to follow, as {he} leads you behind the curtain and to the left, towards {his} bedroom.");
		}
		else
		{
			outputText("You grin mischievously, returning {his} codex to {him}, and you tell {him} that you just don’t have the funds. Is there, maybe, some other way you can compensate {him} for {his} time and {his} effort? <i>“No.”</i> {He} looks at you rather sternly, and your attempts at being " + pc.mf("suave", "coy") + " quickly fall flat. <i>“Sex with you doesn’t pay for my bills, [pc.name]. Once we’re done here, you’re going out and you’re making some money, I don’t care how.”</i> Just as you slump in your chair, {he} rises from {his}. <i>“But that doesn’t mean I</i> won’t <i>fuck you. Follow me.”</i> Giddy again, you rise from your seat, following {him} like a horny dog as {he} leads you into {his} bedroom.");
		}

		outputText("\n\nBy the time you enter behind your {master/mistress}, {his} shirt and pants have already been pulled off[if {Lane is female}, letting her heavy breasts bounce free in the wind – not that they were especially well concealed to begin with]. {He} turns to you and, with a predatory grin, slides a claw across the fabric of {his} undergarment, tearing it away and revealing " + lane.mf("his throbbing, pointed cock. It’s halfway hard, and you lick your lips as you watch it slide free from his genital slit, inflating in length and in girth", "her wet, puffy cunt. Her genital slit is open and malleable, ready for you to play with; her labia waves at you, waiting for your pleasure") + ".");

		outputText("\n\n<i>“Strip naked,”</i> {he} commands, opening {his} tassels wide, letting you absorb yourself into {him}. You do as you’re commanded, with ease, excitement, and some flair, for {his} benefit. Naked, vulnerable, and horny, you’re completely at {his} mercy. The patterns on {his} tassels swirl in your vision, and you know you’re going to enjoy it.");

		// Go to Randomized sex
		clearMenu();
		addButton(0, "Next", payTheLaneTax);
	}
}

function laneServicePhysique():void
{
	clearOutput();
	outputText("Before you sign your confirmation, you ask {him} if {he} could improve your strength. You know that’s more of a physical thing, but {he} did say <i>anything</i>, after all. <i>“I sure can,”</i> {he} says confidently. <i>“Other customers have asked me the same question. There is a limit to how hard you can push your body without appropriate work or training, of course, but many hurdles are strictly mental. I’ve had thin, spindly little things come to me, telling me that a ten pound barbell feels like a hundred, especially when they’re in a public place like a gym. With just a little bit of my work, you’ll be pushing past your limits and setting new ones within the hour.”</i>");

	outputText("\n\nLane certainly seems cool about it. Do you ask {him} to improve your physique, by removing your inhibitions and your limits?");

	//[=Confirm=] [=Ehh...=]
	clearMenu();
	addButton(0, "Confirm", laneConfirmService, HYPNO_STAT_PHYS);
	addButton(1, "Maybe Not...", laneServiceMaybeNot);
}

function laneServiceReflexes():void
{
	clearOutput();
	outputText("Before you sign your confirmation, you ask {him} if {he} could improve your reflexes. You’ve walked down enough streets, hiked through enough forests, and drank in enough shady bars to know that anything could get the jump on you at any time. <i>“Of course,”</i> {he} says assuredly. <i>“You wouldn’t be the first adventurer I’ve had. I can sharpen each of your senses to be more in-tune with your surroundings: you’ll see, hear, and smell anything stalking you in the sands of Veran before they’d realize it. You’ll know exactly when you are and are not alone, and you’ll be able to react to it faster than you ever could before. I’ve been known to service more than one starship pilot, as well.”</i>");

	outputText("\n\nLane certainly seems sure of himself. Do you ask {him} to improve your reflexes, by attuning your senses to your environment?");

	//[=Confirm=] [=Ehh...=]
	clearMenu();
	addButton(0, "Confirm", laneConfirmService, HYPNO_STAT_REF);
	addButton(1, "Maybe Not...", laneServiceMaybeNot);
}

function laneServiceAim():void
{
	clearOutput();
	outputText("Before you sign your confirmation, you ask {him} if {he} could improve your aim. In the modern world of weaponry and warfare, the better shot is usually the victor, and you want to be sure yours counts. <i>“You bet I can,”</i> {he} says smugly. <i>“I can give you eyesight like... I believe you call it a ‘hawk’ on Terra? While I don’t exactly improve your eyes, I can help your mind process what it is you’re seeing faster than it ever could before. Shapes, velocity, momentum, and distance will become easier for you to discern, and your marksmanship will follow suit. Although... I have to ask. Is there a marksmanship competition coming up somewhere? I’ve had a customer asking the same thing for that reason, and when the judges found out, he was disqualified for having an unfair advantage.”</i>");

	outputText("\n\nYou tell {him} that it’s purely personal, and {he} nods, waving to {his} codex. Lane certainly seems secure about it. Do you ask {him} to improve your aim, by sharpening your mental acuity?");

	//[=Confirm=] [=Ehh...=]
	clearMenu();
	addButton(0, "Confirm", laneConfirmService, HYPNO_STAT_AIM);
	addButton(1, "Maybe Not...", laneServiceMaybeNot);
}

function laneServiceIntelligence():void
{
	clearOutput();
	outputText("Before you sign your confirmation, you ask {him} if {he} could improve your intelligence. You’re... you refuse to call yourself ‘dumb’, but you admit that, sometimes, you... aren’t exactly as ‘worldly’ as you’d like. Is there anything {he} can do to help? <i>“That’s not a problem at all,”</i> {he} insists gently. <i>“You’re not the first to want that changed about yourself, and you won’t be the last. I can’t exactly make you ‘smarter’, per se, but I can improve your memory by streamlining the way your conscious mind recalls thoughts. Those lessons you thought you doodled through in high school will come back to you as easily as recalling your fondest childhood moment. I’ve had college students come to me asking me about it, and my skills have helped them through many cram sessions.”</i>");

	outputText("\n\nLane certainly seems positive about it. Do you ask {him} to improve your memory by, as he put it, ‘streamlining’ how your conscious mind recalls lessons and memories?");

	//[=Confirm=] [=Ehh...=]
	clearMenu();
	addButton(0, "Confirm", laneConfirmService, HYPNO_STAT_INT);
	addButton(1, "Maybe Not...", laneServiceMaybeNot);
}

function laneServiceWillpower():void
{
	clearOutput();
	outputText("Before you sign your confirmation, you ask {him} if {he} could improve your willpower. Sometimes, you feel a little too meek and shy for your own personal safety, and if exploring these planets and encountering their fauna has taught you anything, it’s that having the strength to say ‘no’ can be your strongest weapon sometimes. <i>“Easily,”</i> {he} says surely. <i>“At least three times now, I’ve had wallflowers come up to me and confess that they don’t have the spine to ask a crush out to a date, or something, and if I could help them with that. There’s nothing special about giving you the strength of will: no improved mental acuity or overcoming mental barriers. All I’m doing is giving that little voice in your head, the voice that says what you</i> really <i>feel and what you</i> really <i>want, a helping hand.”</i>");

	outputText("\n\nLane certainly seems confident about it. Do you ask {him} to improve your willpower, by helping your mouth say what your mind is really thinking?");

	//[=Confirm=] [=Ehh...=]
	clearMenu();
	addButton(0, "Confirm", laneConfirmService, HYPNO_STAT_WILL);
	addButton(1, "Maybe Not...", laneServiceMaybeNot);
}

function laneServiceMaybeNot():void
{
	clearOutput();
	outputText("You frown, unsure about the whole thing, but you’re not quite ready to give the codex back to {him}. You tap at the table as you consider what else you can ask {him}.");
	// Return to [=Services=] menu")
	laneServicesMenu();
}

function laneConfirmService(selectedService:String):void
{
	clearOutput();

	if (flags["LANE_TIMES_HYPNOTISED"] == 0)
	{
		outputText("You sign your signature in the empty field and tap on the confirmation button. A loading bar appears on the codex, and then it beeps – followed by a beep from your own codex. You hand Lane back {his} as you check your own. The payment’s gone through without a hitch. <i>“Lovely!”</i> {He} stands, placing {his} codex in a drawer under {his} desk, twisting its lock shut and hiding the key in {his} transparent pants’ pocket. From another drawer, {he} pulls out a ‘busy’ sign and lays it on the end of {his} table. <i>“Please follow me, [pc.name]. I have a room in the back where I work my magic.”</i>");

		outputText("\n\nYou follow {him} as he leads you behind the faint, airy curtains, barely hiding the second half of the room. {He} turns right and opens a door into another room of {his} hut, holding it open for you. The second room is much darker and warmer: there are no windows or lights; the only thing providing light is Lane’s glowing body. In the room are two plain, concrete chairs, but both of them are heavily dressed with soft, plump cushions and comfy, giving armrests. Four candles sit in a square around the two chairs, their smoke wafting the wax’s incense through the air and immediately assaulting your nostrils with their burning scent. They all sit on a round, featureless, but thick and plush carpet. The room is otherwise rather large and totally bare.");

		outputText("\n\n{He} shuts the door once you’re in, and you’re concealed in total darkness, except for the constant pulsing reds and blues of Lane’s body. {He} removes his shirt, bearing {his} exposed top to you");
		if (pc.isMischevious()) outputText(" – a rogue thought considers that maybe you’re getting a little extra for what you paid for");
		outputText(". {He} sees you looking at him and {his} topless form curiously. <i>“My hypnosis relies on you having an uninterrupted line of vision with my body,”</i> {he} explains, <i>“which means I have to go topless. It’s not going to go any farther than that, I promise, and you don’t have to take anything off yourself.”</i>");
	}
	else
	{
		outputText("You sign your signature in the empty field and tap on the confirmation button. The two familiar beeps between {his} codex and yours ring out, and you know the funds have transferred properly. With practiced ease, {he} slides {his} codex away and places {his} ‘busy’ sign on the end of {his} table. <i>“Follow me, [pc.name],”</i> {he} instructs, leading you through {his} hut and into {his} hypnosis room.");

		outputText("\n\nWhen {he} shuts the door behind you, it’s as dark as you remember it. The incense from the candles greets your nose, and already you feel yourself relaxing, your legs becoming languid as you walk. You turn to Lane, watching {him} remove his top");
		if (hasLaneHypnosis()) outputText(", your eyes lingering on the smoothness of {his} skin for a little longer than you mean");
		outputText(", and then {he} walks past you, towards {his} seat");
		if (laneHypnosisLevel() >= 3) outputText(". Your eyes glue to {him}, trailing themselves from the ridges of {his} shoulders to where {his} tail meets the small of {his} back....");
	}

	outputText("\n\n");
	if (!pc.isTaur()) outputText("{He} takes the farther seat, and wordlessly invites you to take the one across from {him}.");
	else outputText("{He} picks up the closest seat and sets it aside, leaving you to sit on your haunches on the carpet.");
	outputText(" <i>“First, I want you to close your eyes.”</i> You do so, blocking what little vision you had of the room. The only thing you see is the dull pulse of {his} body through your eyelids.");

	outputText("\n\n<i>“Breathe deep through your nose. Focus on what you’re experiencing. Let it calm your body.”</i> You breathe deep, inhaling the smoky incense – a plethora of spices and scents fill your nose, combining to smell like everything they are and not anything at all, somehow. As your thoughts linger on the scents,");
	if (!pc.isTaur()) outputText(" your body sinks into the comfort of the chair: your arms slack on the rests and your neck begins to roll your head slightly.");
	else outputText(" your body sinks into the comfort of the carpet: your arms begin to go slack and your body feels as though it’s sinking into the floor, in a pleasant way.");

	outputText("\n\n<i>“Now, focus on my voice,”</i> says Lane. <i>“Listen to my words, but</i> feel <i>for my voice. Let my voice into your ears, into your mind. Don’t worry about where I am. Don’t worry about where my voice is coming from. Don’t worry about anything.”</i> Lane’s voice seems to come from everywhere all at once, but at the same time, it feels as though {his} voice is coming from somewhere very close by. With every word {he} says, your chest thrums in vibration, as though {he}’s speaking through you.");

	outputText("\n\nEven with all of these sensations combined, though, you don’t really feel ‘hypnotized’. You still feel in control of your conscious thought. Still, if only to get the most for your money, you follow along with Lane’s commands. <i>“Now, I want you to open your eyes. Don’t force them open. Just let them.”</i> You try to follow {his} command, and you ‘let’ your eyes open....");

	outputText("\n\nYour vision is assaulted with Lane’s glowing, luminescent body. {His} tassels are wide open, where {his} coursing blood glows the brightest. With every heartbeat of {his}, you see {his} red blood flow all throughout {his} neck, tassels, face, " + lane.mf("chest", "breasts") + ", through {his} arms, over {his} stomach, before disappearing underneath {his} undergarments and blurring beneath {his} translucent pants. {His} pulse has taken a rather peculiar rhythm, beating twice quickly, then pausing, flooding your vision with bursts of red and a stream of blue, repeating again and again.");

	outputText("\n\nYour eyes open wider of their own accord as you absorb {him}. Adorned across the inside of {his} tassels are a number of black tattoos with swirling, almost tribal designs on them, and all throughout the skin of {his} membranes are light, glassy piercings. As {his} blood beats through {him}, they mingle with the tattoos and their light bounces all throughout the glass of {his} piercings: the lights distract your focus, and every time you move your eyes between them, the tattoos on {him} begin to swirl with each other in the corners of your eyes. With every movement your eyes make, the coursing blood, the bright trinkets pierced to Lane’s skin, and the moving tattoos draw you deeper and deeper into a trance – into <i>{him}</i>.");

	outputText("\n\n<i>“Watch the swirling lights,”</i> {he} says, but you barely need the instruction. Lane begins to say a lot of other things, but you’ve lost your attention. Your senses begin to overcome your consciousness: your nostrils begin to pick out every individual smell with every breath, and your eyes soon start seeing new shapes and motions that hadn’t existed before. Your mind is completely on autopilot: you’re aware of every sight, every smell, and every vague command Lane tells you, but you barely register them as thoughts. Soon, even your thoughts are leaving you, and you become nothing but a blank slab of a person for Lane to mold and shape as {he} likes. {He} tells you that’s okay, and that becomes <i>your</i> thought, <i>your</i> decision.");

	outputText("\n\nYou’re left hanging limp in Lane’s control. {He} says some other things to you, and they become your thoughts for only a moment before they’re lost in the ether that is your blank consciousness. {His} words become your own, and that’s okay. Your eyes hurt, and you remember to blink – no, Lane reminds you to blink – no, <i>you</i> remember to blink.");

	outputText("\n\nLane watches you, completely enthralled and under {his} spell. Your mouth is dry, and you swallow – no, Lane tells you to swallow – no, <i>you</i> swallow, it was a thought you had. {He} takes a deep breath, remaining calm in {his} seat. Confident that you’re deep enough under {his} spell, {he} begins the work you paid {him} to do.");

	clearMenu();
	addButton(0, "Next", laneApplyService, selectedService);
}

function laneApplyService(selectedService:string):void
{
	clearOutput();

	switch (selectedService)
	{
		case HYPNO_STAT_PHYS:
			outputText("<i>“You feel strength like you’ve never known before course through you,”</i> {he} says smoothly. <i>“What was your limit yesterday is your warm-up today. You have the stability to lift any weight; the endurance to run any distance; the strength to defeat any foe. You are as physically capable as you have ever been. You are a fountain, a geyser, of strength: when you think you can not, you will try, and you</i> will.”");
			break;

		case HYPNO_STAT_REF:
			outputText("<i>“You are constantly aware of your surroundings,”</i> {he} begins. <i>“No sound escapes your perfect ears; no smell escapes your sensitive nose; and no sight escapes your sharp eyes. You can feel the sand beneath the shoes on your feet and you can hear the heartbeat of another creature. You know exactly where everything around you is at all times. You can respond to changes around you with perfect precision. Nothing can escape you. Nothing can approach you.”</i>");
			break;

		case HYPNO_STAT_AIM:
			outputText("<i>“Your mind is clear as a crystal,”</i> {he} instructs. <i>“What your eyes see, your mind can react to. Your weapon is as much an extension of you as your arm holding it. Hitting your target is as natural as blinking and breathing. You can account for motion; velocity; acceleration; wind resistance; distance. There is nothing between you and your target. If your weapon is drawn and your target is not struck, it is because that is what you choose.”</i>");
			break;

		case HYPNO_STAT_INT:
			outputText("<i>“You have no forgotten memory,”</i> {he} tells you. <i>“Every lesson is recalled. Every tidbit is remembered. Every trivia is retained. You remember every plant you were taught to avoid. You remember how to combat every species. Every mistake is recollected and learned from. You are knowledgeable with every scenario, every possibility, because you have learned from them before. Yet, your focus is linear. You do not consider anything that does not need considering.”</i>");
			break;

		case HYPNO_STAT_WILL:
			outputText("<i>“You are as rigid as a stone,”</i> {he} says sternly. <i>“As rooted as a tree. You will not sway. You will not bend. Yours is your will alone. Nobody else will impose theirs upon you. You will not compromise. You will not fall for petty tricks; you cannot be deceived. You will not let any action you take, any course you choose, be altered by someone else’s hand. You will take what you want, and you will not give what is not anyone else’s to take.”</i>");
			break;

		case default:
			throw new Error("Couldn't match stat selection.");
			break;
	}

	outputText("\n\n{He} continues reinforcing those sorts of commands for a few minutes. You are completely and utterly absorbed by {him} and the way {he} overloads each of your senses: everything {he} says becomes your thoughts, since you don’t have any of your own, so absorbed are you in the lights and patterns and smells around you. You are a liquid, and {his} words are the container you take the shape of as you’re poured into it.");

	outputText("\n\n<i>“You will forget all of my previous instructions after twenty-four Terran hours,”</i> {he} says, wrapping up his session with you. <i>“It will be as though we had never had this session. You will know to return to me, but you will do it at your leisure; you will not feel you must. When I close my tassels, [pc.name], we will return to my desk in the front room, and you will awaken.”</i> {He} reinforces those statements for another minute.");

	// If addHynosisEffect returns true, it's the second time in a 24 hour period the player has used his services.
	// Basically just a shortcut to checking hasLaneHypnosis()
	if (addHypnosisEffect(selectedService))
	{
		var msgs:Array;

		if (laneHypnosisLevel() == 0)
		{
			msgs = 
			[
				"Lane bites {his} lip, {his} eyes roaming your body as you sit there, enthralled by {him}. <i>“You...”</i> {he} says softly, unsure with {him}self. <i>“You do not mind Lane’s company. You like speaking with {him}.”</i> {He} reinforces that several more times, before {he} sheepishly stops.",
				"Lane bites {his} lip, {his} eyes roaming your body as you sit there, enthralled by {him}. <i>“You...”</i> {he} says softly, unsure with {him}self. <i>“You do not mind the way Lane looks. {He} is easy on your eyes.”</i> {He} reinforces that several more times, before {he} sheepishly stops.",
				"Lane bites {his} lip, {his} eyes roaming your body as you sit there, enthralled by {him}. <i>“You...”</i> {he} says softly, unsure with {him}self. <i>“You will recommend Lane to your friends and coworkers. You believe {he} does a good job.”</i> {He} reinforces that several more times, before {he} sheepishly stops.",
				"Lane bites {his} lip, {his} eyes roaming your body as you sit there, enthralled by {him}. <i>“You...”</i> {he} says softly, unsure with {him}self. <i>“You find Lane mildly attractive. For a Daynar.”</i> {He} reinforces that several more times, before {he} sheepishly stops.",
				"Lane bites {his} lip, {his} eyes roaming your body as you sit there, enthralled by {him}. <i>“You...”</i> {he} says softly, unsure with {him}self. <i>“You like the way Lane keeps {his} business. You find {him} to be professionally approachable.”</i> {He} reinforces that several more times, before {he} sheepishly stops."
			];
		}
		else if (laneHypnosisLevel() == 1)
		{
			msgs = 
			[
				"Lane hums to {him}self as {he} looks at you, seeing you so open to {him} and {his} suggestions. {He} stutters, unsure if {he} should proceed, but {he} does. <i>“You like Lane. You think you’ll visit {him} more often, and not just for {his} business.”</i> {He} reinforces that several more times, and then stops {him}self.",
				"Lane hums to {him}self as {he} looks at you, seeing you so open to {him} and {his} suggestions. {He} stutters, unsure if {he} should proceed, but {he} does. <i>“Your opinion of the Daynar is improved because of Lane. You enjoy their company and believe them to be a friendly, understanding species.”</i> {He} reinforces that several more times, and then stops {him}self.",
				"Lane hums to {him}self as {he} looks at you, seeing you so open to {him} and {his} suggestions. {He} stutters, unsure if {he} should proceed, but {he} does. <i>“You think Lane is reasonably attractive. {He} is a " + lane.mf("handsome", "beautiful") + " Daynar.”</i> {He} reinforces that several more times, and then stops {him}self.",
				"Lane hums to {him}self as {he} looks at you, seeing you so open to {him} and {his} suggestions. {He} stutters, unsure if {he} should proceed, but {he} does. <i>“You like the way Lane looks at you. You think it’s cute.”</i> {He} reinforces that several more times, and then stops {him}self.",
				"Lane hums to {him}self as {he} looks at you, seeing you so open to {him} and {his} suggestions. {He} stutters, unsure if {he} should proceed, but {he} does. <i>“You consider Lane to be a dependable business" + lane.mf("", "wo") + "man and a good friend. You wonder if Lane could be more to you.”</i> {He} reinforces that several more times, and then stops {him}self."
			];
		}
		else if (laneHypnosisLevel() == 2)
		{
			msgs =
			[
				"Lane chews at {his} lip and {his} claw tacks on {his} chair. You’re so vulnerable, so malleable; {he} begins to rub {his} knees together sensually as {he} looks at you. <i>“You think Lane is sexy. You often fantasize about {him} when you’re by yourself.”</i> {He} reinforces that statement several more times, before {he} forces {him}self to stop.",
				"Lane chews at {his} lip and {his} claw tacks on {his} chair. You’re so vulnerable, so malleable; {he} begins to rub {his} knees together sensually as {he} looks at you. <i>“You find yourself compelled to talk about Lane to your friends. You want to promote {his} business as much as you can.”</i> {He} reinforces that statement several more times, before {he} forces {him}self to stop.",
				"Lane chews at {his} lip and {his} claw tacks on {his} chair. You’re so vulnerable, so malleable; {he} begins to rub {his} knees together sensually as {he} looks at you. <i>“You sometimes wonder what Lane looks like beneath the rest of {his} clothing.”</i> {He} reinforces that statement several more times, before {he} forces {him}self to stop.",
				"Lane chews at {his} lip and {his} claw tacks on {his} chair. You’re so vulnerable, so malleable; {he} begins to rub {his} knees together sensually as {he} looks at you. <i>“You have an urge, an itch, to taste Lane. You resist, with some effort.”</i> {He} reinforces that statement several more times, before {he} forces {him}self to stop.",
				"Lane chews at {his} lip and {his} claw tacks on {his} chair. You’re so vulnerable, so malleable; {he} begins to rub {his} knees together sensually as {he} looks at you. <i>“You want to touch Lane, to feel along the smoothness of {his} front scales. You want to touch {him} everywhere, in a sensual way.”</i> {He} reinforces that statement several more times, before {he} forces {him}self to stop."
			];
		}
		else if (laneHypnosisLevel() == 3)
		{
			msgs = 
			[
				"Lane splays {his} legs. Now that the business is done, {he} can proceed with the pleasure. {He} openly begins to rub at {him}self, enjoying the way {he}’s displaying {him}self to you and you’re too brainwashed to even notice. <i>“You can’t get enough of Lane. You want to visit {him} every day to hypnotize you. You love the way {he} controls you.”</i> When {he} finally stops reinforcing that statement, {he}’s spent more time hypnotizing you for {him}self than {he} has doing what you paid {him} for.",
				"Lane splays {his} legs. Now that the business is done, {he} can proceed with the pleasure. {He} openly begins to rub at {him}self, enjoying the way {he}’s displaying {him}self to you and you’re too brainwashed to even notice. <i>“You think Lane is the sexiest creature you’ve ever seen. Nothing and nobody else excites you the way Lane does.”</i> When {he} finally stops reinforcing that statement, {he}’s spent more time hypnotizing you for {him}self than {he} has doing what you paid {him} for.",
				"Lane splays {his} legs. Now that the business is done, {he} can proceed with the pleasure. {He} openly begins to rub at {him}self, enjoying the way {he}’s displaying {him}self to you and you’re too brainwashed to even notice. <i>“Every time you see Lane, you fantasize about " + lane.mf("his cock and what it’ll take to get him to use it on you", "her cunt and what it would be like to finally taste her") + ".”</i> When {he} finally stops reinforcing that statement, {he}’s spent more time hypnotizing you for {him}self than {he} has doing what you paid {him} for.",
				"Lane splays {his} legs. Now that the business is done, {he} can proceed with the pleasure. {He} openly begins to rub at {him}self, enjoying the way {he}’s displaying {him}self to you and you’re too brainwashed to even notice. <i>“You can no longer imagine life without Lane. Your days aren’t complete without worshiping {him} by giving him your body to mold.”</i> When {he} finally stops reinforcing that statement, {he}’s spent more time hypnotizing you for {him}self than {he} has doing what you paid {him} for.",
				"Lane splays {his} legs. Now that the business is done, {he} can proceed with the pleasure. {He} openly begins to rub at {him}self, enjoying the way {he}’s displaying {him}self to you and you’re too brainwashed to even notice. <i>“Lane turns you on so much that each day " + lane.mf("he doesn’t bend you over his desk and take your ass, body, and soul with his cock", "she doesn’t throw you to the ground and claim you as hers with her sweet, sexy cunt") + " is a day that is wasted.”</i> When {he} finally stops reinforcing that statement, {he}’s spent more time hypnotizing you for {him}self than {he} has doing what you paid {him} for."
			];
		}

		outputText("\n\n" + msgs[rand(msgs.length)]);
	}

	clearMenu();
	addButton(0, "Next", lanePostApplyEffect, selectedService);
}

function lanePostApplyEffect(selectedService:String):void
{
	clearOutput();
	outputText("You awaken with a bit of a start. You’re a little dizzy; you’re seeing stars in your eyes and your ears are ringing and your nose is itchy. And yet... you feel amazing. You’re back at the desk in the front room, sitting in the same chair, and Lane is across from you, smiling confidently. <i>“How do you feel?”</i> {he} asks you.");

	outputText("\n\nYou admit that you’re mostly confused. The last thing you remember is being in Lane’s ‘hypnosis room’, following {his} instructions, but then... nothing, and now you’re back at {his} desk. And yet");
	switch (selectedService)
	{
		case HYPNO_STAT_PHYS:
			outputText(" your body feels stronger, tighter... you feel as though there are no obstacles that you can’t overcome, if you just put in a little effort. You’re half tempted to start running, for the sake of it. <b>Your body has never felt better!</b>");
			break;

		case HYPNO_STAT_REF:
			outputText(" your senses all feel so fine-tuned... you can hear Lane’s heartbeat and you can feel the subtle changes in the air pressure as the breeze flows outside the building. A buzzing flits across your ear, and you turn – and you see a common fly buzzing around just beyond the door. You had heard something so small from so far away before you could see it. <b>Your reflexes are better than ever!</b>");
			break;

		case HYPNO_STAT_AIM:
			outputText(" your eyesight has never been better: you’re seeing objects and details with a sort of clarity you had never thought possible before. You can make out every speck of dust flitting through the air between you and Lane, and, if you squint, you can make out the individual swirls and marks, like fingerprints, on {his} scales. {He} blinks, and you can see {his} pupil dilate just slightly from it. <b>Your aim is better than ever!</b>");
			break;

		case HYPNO_STAT_INT:
			outputText(" this very situation reminds you of this one time you were being quizzed in middle school. You remember the teacher, your classmates, and the class so perfectly… you even remember the quiz, and each of its questions, and more importantly, each of their answers. <b>Your intelligence is better than ever!</b>");
			break;

		case HYPNO_STAT_WILL:
			outputText(" you have this urge to start chewing Lane out, demanding to know what {he}’s done to you, and you’re not leaving without a satisfying answer. You tell {him} exactly what you’re thinking, and {he} only smiles in response – and you reel, surprised at yourself and that sudden, willful outburst. <b>Your willpower is stronger than ever!</b>");
			break;
		
		case default:
			throw new Error("Couldn't match selected service.");
			break;
	}

	if (!hasLaneHypnosis())
	{
		outputText("\n\nYou sit and look at your hands. It was a strange, difficult-to-explain sensation: you knew you were different, but you didn’t really <i>feel</i> different. At the same time, you felt different, but you didn’t know if you really <i>were</i> different. Lane definitely did something to you, and whatever it was {he} did, you like it. You tell {him} as much, and {he} claps {his} four-fingered hands together. <i>“I’m happy that you’re happy with the results, [pc.name],”</i> {he} tells you.");
		if (flags["LANE_TIMES_HYPNOTISED"] <= 1) outputText(" <i>“I hope this changes your perception on hypnotism.”</i> You tell {him} that it definitely does, and that you’ll be coming back for {his} service sometime in the future. You even ask {him} if you could sign {his} guestbook, to give {him} another testimonial to add to {his} collection, and {he} happily hands you {his} codex.");

		outputText("\n\nYou thank him for {his} work again, and you leave {his} little hut, ready to tackle the day with the new and improved you.");

		if (flags["HAS_HAD_LANE_HYPNOSIS"] == 1)
		{
			if (laneHypnosisLevel() == 0) outputText("\n\nAs you leave {his} hut, your thoughts linger on Lane just a little while longer. {He}’s certainly an alright sort. You wouldn’t mind having a drink with {him} sometime later, or something.");
			else if (laneHypnosisLevel() == 1) outputText("\n\nYou’ve been getting rather friendly with Lane lately, and {he} holds {him}self very professionally... and, you decide, {he}’s a bit of a looker. For a bipedal lizard-person. You consider asking {him} out to dinner sometime, to get to know {him} outside of {his} profession.");
			else if (laneHypnosisLevel() == 2) outputText("\n\nYou spare a look back at {his} hut as you leave. Just... something <i>about</i> Lane really pushes all your kinky buttons. You idly fantasize about what it’d be like to get into bed with a sexy Daynar like {him}self...");
			else outputText("\n\nYou can’t seem to get that sexy lizard off your mind as you leave {his} hut. Images of yourself at {his} knees, servicing {him} like {he} was your " + lane.mf("king", "queen") + " and it was your privilege, assault your mind, and you gladly let them. You’re itching to march right back in there and throw yourself at {him}, demanding {he} take you then and there, but, after some struggle, you keep walking. You have others things that need doing.");

			// Place PC one square outside of Lane’s Plane
			// TODO: figure out where PC is gonna go.
			clearMenu();
			addButton(0, "Next", mainGameMenu);
		}
	}
	else
	{
		outputText("\n\nYou’re happy that Lane, righteous and generous as {he} is, kept up {his} end of the bargain and gave you what you paid for. But another part of you is ecstatic about what’s going to happen next. You thank {him} for {his} continued excellence, and that, if {he}’s ready, you’re prepared to pay {him} your ‘taxes’ for the privilege of being {his} to own.");

		outputText("\n\n{He} smiles and stands. You stand with {him}, and with a deft, swift hand, {he} grabs you by the collar of your [pc.armor] and pulls you in for an aggressive, dominant kiss. You melt into {him}, opening your mouth and inviting your {master’s/mistress’s} tongue to play with your [pc.eachTongue]. {He}’s grabbing at you roughly and possessively as {he} suffocates you with {his} lips and {his} tongue, guiding you across the desk and to the curtains hiding the second half of the room.");

		outputText("\n\n{He} finally lets you go as {he} opens {his} eyes and {his} tassels wide at you, letting you fall into {him} a second time. Your body sinks");
		if (pc.hasCock() && !pc.hasVagina()) outputText(" but [pc.eachCock] rises");
		else if (pc.hasVagina() && !pc.hasCock()) outputText(" and your [pc.eachVagina] slickens");
		else if (pc.hasVagina() && pc.hasCock()) outputText(" as [pc.eachCock] fights with [pc.eachVagina] for your blood flow, your attention, and your hopes");
		else outputText(" as you lick your [pc.lips] and your [pc.ass] clenches");
		outputText(" while you consciously fall deeper into {his} control, but {he} doesn’t let you zone out like before.");

		outputText("\n\n{He} leads you to {his} bedroom, across from {his} hypnosis room, and as soon as {he} shuts the door behind you, {he}’s stripped of both {his} airy shirt and {his} flowing pants, leaving {him} with only {his} underwear. " + lane.mf("The unmistakable bulge of his delicious, virile Daynarian cock pushes against the stubborn fabric, outlining the trail of his meat from his tip to his base, and it only gets more pronounced with each heartbeat.", "A small damp patch is clearly visible between the cleavage of her legs, but more than that, the musky scent of her needy, demanding sex penetrates the air, and your nostrils, with ease.") + " Your fingers fidget as you imagine just how Lane is going to use you today.");

		outputText("\n\n<i>“Strip naked,”</i> {he} commands, and you do so with ease and without any flair, eager to just get right to servicing your " + lane.mf("master", "mistress") + " once more. Soon, your [pc.armor] is discarded to a pile in the corner, and you’re left as naked as Lane is, once {he} removes {his} undergarment, bearing all of {him}self to you once more.");

		outputText("\n\nAnd to think, you used to hate doing your taxes.");
		// Go to Randomized sex
		clearMenu();
		addButton(0, "Next", payTheLaneTax);
	}
}

