private const HYPNOSIS_LEVEL_MAX:int = 4;

/*
Lanes Hypnosis Mechnic
----

PC can freely be hypnotised once every 24 hours with no ill-effect.

If they return to Lane with an existing effect already in place, the hypnosis level will increase.

Hypnosis level increases by "decreasing" a seeded value by some modifier of the players willpower:

	Level 1: 75
	Level 2: 100
	Level 3: 125
	Level 4: 150

	=> 50 + (level * 25)

	On event => current power += math.round(1.5 - pc.WQ() * 50)

	@ <= 25% will == 5 events to go from 0 to level 3
	@ <= 50% will == 7 events to go from 0 to level 3
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

public function laneHeader(sex:Boolean = false):void
{
	showName("\nLANE");
	if (flags["MET_LANE"] == 1)
	{
		if (sex) showBust("LANE_"+lane.mf("M", "F")+"_NUDE");
		else showBust("LANE_"+lane.mf("M", "F"));
	}
	author("B");
}

public function hasLaneHypnosis():Boolean
{
	if (flags["LANE_FULLY_HYPNOTISED_FOREVER"] != undefined) return true;
	if (pc.hasStatusEffect("Lane Hypnosis")) return true;
	return false;
}

public function outsideLanesPlane():Boolean
{
	// Safe paths lead north, east, and west from here.
	if (flags["MET_LANE"] == undefined)
	{
		output("\n\nThere’s a little hut built between some of the trees to the north; if you squint just right, you can barely make out a sign above the doorway- “Lane’s Plane: Unlocking the New You”.");
	}
	else
	{
		output("\n\nLane’s shop is tucked between some of the trees to the north.");
	}
	output(" Safe paths lead to the east and west from here.");
	if (rustScytheGladeEncounters()) return true;
	return false;
}

/*
Get the players current hypnosis level
*/
public function laneHypnosisLevel():int
{
	if (flags["LANE_FULLY_HYPNOTISED_FOREVER"] != undefined) return 5;
	if (flags["LANE_HYPNOSIS_LEVEL"] == undefined) return 0;
	return flags["LANE_HYPNOSIS_LEVEL"];
}

/*
Figure out the level-up mechanic for hypnosis levels. Uses weights based on the PCs current hypnosis level versus the PCs willpower.
Returns true if a levelup occured.
*/
public function increaseLaneHypnosisLevel():Boolean
{
	if (flags["LANE_HYPNOSIS_LEVEL"] == undefined)
	{
		flags["LANE_HYPNOSIS_LEVEL"] = 0;
	}
	if (flags["LANE_HYPNOSIS_POWER"] == undefined)
	{
		flags["LANE_HYPNOSIS_POWER"] = (laneHypnosisLevel() + 1 * 25) + 50;
	}
	
	if (flags["LANE_HYPNOSIS_LEVEL"] >= HYPNOSIS_LEVEL_MAX)
	{
		trace("Lane HypnoLevel:", flags["LANE_HYPNOSIS_LEVEL"]);
		trace("Lane HypnoPower:", flags["LANE_HYPNOSIS_POWER"]);
		trace("Max Level!");
		return false;
	}

	// Decrease power
	var powV:Number = 1.5 - Number(pc.WQ()/100.0);
	powV *= 50;
	powV = Math.round(powV);
	
	flags["LANE_HYPNOSIS_POWER"] -= powV; // This includes a potential will-boost from lanes stat bonuses, because fuck complicating this any more than it already is.

	// Check if "power" was entirely consumed, if so level up
	if (flags["LANE_HYPNOSIS_POWER"] <= 0)
	{
		flags["LANE_HYPNOSIS_LEVEL"] += 1;
		flags["LANE_HYPNOSIS_POWER"] = (laneHypnosisLevel() * 25) + 50;
		trace("Lane HypnoLevel:", flags["LANE_HYPNOSIS_LEVEL"]);
		trace("Lane HypnoPower:", flags["LANE_HYPNOSIS_POWER"]);
		trace("Leveled!");
		return true;
	}
	else
	{
		trace("Lane HypnoLevel:", flags["LANE_HYPNOSIS_LEVEL"]);
		trace("Lane HypnoPower:", flags["LANE_HYPNOSIS_POWER"]);
		trace("Didn’t level!");
		return false;
	}
}

/*
Decrease the PCs hypnosis level, and forces the level-up power required for the next hypnosis level to reset back to the default for the *new* lower level.
*/
public function decreaseLaneHypnosisLevel():Boolean
{
	if (flags["LANE_FULLY_HYPNOTISED_FOREVER"] != undefined) return false;

	if (flags["LANE_HYPNOSIS_LEVEL"] > 0)
	{
		flags["LANE_HYPNOSIS_LEVEL"] -= 1;
		flags["LANE_HYPNOSIS_POWER"] = undefined; // Force the next increase event to work from the "base" of the reduced level.
		return true;
	}
	else
	{
		flags["LANE_HYPNOSIS_POWER"] = undefined; // Force the next increase event to work from the "base" of the reduced level.
		return false;
	}
}

public function hasMaxedLaneHypnosis():Boolean
{
	if (flags["LANE_FULLY_HYPNOTISED_FOREVER"] != undefined) return true;
	if (laneHypnosisLevel() >= HYPNOSIS_LEVEL_MAX) return true;
	return false;
}

public function baseHypnosisWearsOff(effectToRemove:String):void
{
	if (flags["HYPNO_EFFECT_OUTPUT_DONE"] == undefined)
	{
		eventQueue.push(function(tarEffect:String):Function {
			return function():void {
				clearOutput();
		
				laneHeader();

				if (flags["LANE_FIRST_HYPNO_RETURN"] != 2)
				{
					flags["LANE_FIRST_HYPNO_RETURN"] = 1; // Set flag to trigger the actual first time message interaction
					
					output("As you walk the biomes of "+ getPlanetName() +", you can’t help but feel something is a little... off. Different, from when it was just a few moments ago. You flex your ears, listening for anything out of the ordinary, but you can’t hear anything. You look down your body, for anything alien that might have attached itself to you, but you’re completely clean.");

					// I don't even know what the fuck this is supposed to be implying. Considering how weird it is, and how
					// extreneous to the actual scene, DROPPED.
					// output("\n\nFor whatever reason, you’re drawn to your codex, to know the time. It displays the time on all known and visited planets, including a clock for Terran’s time in the right hand corner. Seeing that clock there reminds you of something about Terran time, but what....");

					output("\n\nJust then, your thoughts are drawn to Lane. You recall the lizard-person’s hut");
					//output(" in the caves of Venar");
					output(" in the forest near Novahome");
					output(", and the business [lane.heShe] runs in hypnotism, and – wait. Hypnotism?");

					switch (effectToRemove)
					{
						case "Lane's Hypnosis - Physique":
							output(" You look to your hands and make a pair of tight fists. Your grip is still plenty strong, but something just feels off somehow. You look to your bicep and you flex, and you swear your arm wasn’t as big as it was a few hours ago.");
							break;

						case "Lane's Hypnosis - Reflexes":
							output(" You look around your [pc.feet] for a pebble, or a coin, or something, and the glint of a rounded scrap of metal catches your eye. You pick it up and, without looking, toss it straight up into the air. When it passes your vision, you reach out to grab it, but you come up short, and it hits the ground in front of you.");
							break;

						case "Lane's Hypnosis - Aim":
							output(" You focus your eyes on the space around you, to the dust flitting through the air before your eyes. You spot a particular speck and try to focus on it, but it soon disappears in a cloud of likewise-looking specks, and then it might as well have vanished entirely.");
							break;

						case "Lane's Hypnosis - Intelligence":
							output(" You start trying to do long division in your head. You recall an obscure method of doing it back in middle school – you could always get the first few steps down but then the lessons got murky the further you went, until it became just a total mess of numbers and integers. You probably could have worked it out an hour ago, but now your equation dissolves to nothing in your mind’s eye after a minute.");
							break;

						case "Lane's Hypnosis - Willpower":
							output(" You place your [pc.tongue] firmly between your teeth. Lane gave you the strength of will, so if you wanted, you could probably draw blood if you bit hard enough. Just as you begin to bite yourself, the pain shocks you away from the notion, and you grunt. You don’t want to hurt yourself just to make a point to yourself, though you probably would have an hour ago.");
							break;

						default:
							throw new Error("Couldn’t match selected effect.")
							break;
					}

					output(" That lying Daynar" + lane.mf(" son of a", "") + " bitch gipped you out of your money! You paid to have something about you changed, and it only lasted a day! You don’t go to the doctor to cure a disease just for the weekend; you shouldn’t have to do the same with a hypnotist! The next time you’re on the planet, you make a mental note to yourself to give that scaly " + lane.mf("prick", "cunt") +" a piece of your mind.");
				}
				else
				{
					output("As you walk the biomes of Tarkus, you hear a beep and feel a vibration on your [pc.hip]. You reach for your codex; on it flashes a reminder you had programmed into it the day before about Lane’s hypnosis wearing off.");

					output("\n\nRight on time, you feel your body change, on a sort of metaphysical level.");

					switch (effectToRemove)
					{
						case "Lane's Hypnosis - Physique":
							output(" You look to your hands and make a pair of tight fists. Your grip is still plenty strong, but something just feels off somehow. You look to your bicep and you flex, and you swear your arm wasn’t as big as it was a few hours ago.");
							break;

						case "Lane's Hypnosis - Reflexes":
							output(" You look around your feet for a pebble, or a coin, or something, and the glint of a rounded scrap of metal catches your eye. You pick it up and, without looking, toss it straight up into the air. When it passes your vision, you reach out to grab it, but you come up short, and it hits the ground in front of you.");
							break;

						case "Lane's Hypnosis - Aim":
							output(" You focus your eyes on the space around you, to the dust flitting through the air before your eyes. You spot a particular speck and try to focus on it, but it soon disappears in a cloud of likewise-looking specks, and then it might as well have vanished entirely.");
							break;

						case "Lane's Hypnosis - Intelligence":
							output(" You start trying to do long division in your head. You recall an obscure method of doing it back in middle school – you could always get the first few steps down but then the lessons got murky the further you went, until it became just a total mess of numbers and integers. You probably could have worked it out an hour ago, but now your equation dissolves to nothing in your mind’s eye after a minute.");
							break;

						case "Lane's Hypnosis - Willpower":
							output(" You place your [pc.tongue] firmly between your teeth. Lane gave you the strength of will, so if you wanted, you could probably draw blood if you bit hard enough. Just as you begin to bite yourself, the pain shocks you away from the notion, and you grunt. You don’t want to hurt yourself just to make a point to yourself, though you probably would have an hour ago.");
							break;

						default:
							throw new Error("Could find selected effect.");
							break;
					}
					output("\n\nYou sigh – it was fun while it lasted. You put your codex away and make a mental note to return to Lane about another boost the next time you’re in the area.");
				}
			
				clearMenu();
				addButton(0, "Next", mainGameMenu);
			}
		
		}(effectToRemove));
	}
	

	// Revert whatever stat the PC paid to increase back to normal
	// If the PC gets hypnotized multiple times, in more than one stat, I think it might be better to revert them all at the same time, starting the clock with the first hypnosis they get (so they can’t wait 23 hours and then scum the clock back). This is mostly just to avoid having the ‘hypnosis wears off’ message several times in succession, but this is, of course, just a suggestion.

	// Rather than removing them all at once, the first one removed trips a flag that will change us from delivering the "full fat" messages, to a lite message.
	flags["HYPNO_EFFECT_OUTPUT_DONE"] = 1;

	var modValue:Number = 0;

	switch (effectToRemove)
	{
		case "Lane's Hypnosis - Physique":
			modValue = pc.statusEffectv1("Lane's Hypnosis - Physique");
			pc.physiqueMod -= modValue;
			break;

		case "Lane's Hypnosis - Reflexes":
			modValue = pc.statusEffectv1("Lane's Hypnosis - Reflexes");
			pc.reflexesMod -= modValue;
			break;

		case "Lane's Hypnosis - Aim":
			modValue = pc.statusEffectv1("Lane's Hypnosis - Aim");
			pc.aimMod -= modValue;
			break;

		case "Lane's Hypnosis - Intelligence":
			modValue = pc.statusEffectv1("Lane's Hypnosis - Intelligence");
			pc.intelligenceMod -= modValue;
			break;

		case "Lane's Hypnosis - Willpower":
			modValue = pc.statusEffectv1("Lane's Hypnosis - Willpower");
			pc.willpowerMod -= modValue;
			break;

		default:
			throw new Error("Couldn’t find selected effect.");
			break;
	}
}

/*
Add a hypnosis effect that boosts a stat. Also creates the time-checking hidden effect that will be used to determine if we're doing special things.
*/
private const HYPNO_STAT_PHYS:String = "Physique";
private const HYPNO_STAT_REF:String = "Reflexes";
private const HYPNO_STAT_INT:String = "Intelligence";
private const HYPNO_STAT_AIM:String = "Aim";
private const HYPNO_STAT_WILL:String = "Willpower";

public function hasHypnosisEffect():Boolean
{
	if (pc.hasStatusEffect("Lane's Hypnosis - Physique")) return true;
	if (pc.hasStatusEffect("Lane's Hypnosis - Reflexes")) return true;
	if (pc.hasStatusEffect("Lane's Hypnosis - Intelligence")) return true;
	if (pc.hasStatusEffect("Lane's Hypnosis - Willpower")) return true;
	if (pc.hasStatusEffect("Lane's Hypnosis - Aim")) return true;
	return false;
}

public function addHypnosisEffect(stat:String):Boolean
{
	if (flags["LANE_TIMES_HYPNOTISED"] == undefined) flags["LANE_TIMES_HYPNOTISED"] = 0;
	flags["LANE_TIMES_HYPNOTISED"]++;

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
			pc.createStatusEffect("Lane's Hypnosis - Physique", 5, 0, 0, 0, false, "Pill", "Lane’s hypnosis session has improved your physique!", false, 60 * 24);
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
			pc.createStatusEffect("Lane's Hypnosis - Reflexes", 5, 0, 0, 0, false, "Pill", "Lane’s hypnosis session has improved your reflexes!", false, 60 * 24);
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
			pc.createStatusEffect("Lane's Hypnosis - Intelligence", 5, 0, 0, 0, false, "Pill", "Lane’s hypnosis session has improved your intelligence!", false, 60 * 24);
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
			pc.createStatusEffect("Lane's Hypnosis - Aim", 5, 0, 0, 0, false, "Pill", "Lane’s hypnosis session has improved your aim!", false, 60 * 24);
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
			pc.createStatusEffect("Lane's Hypnosis - Willpower", 5, 0, 0, 0, false, "Pill", "Lane’s hypnosis session has improved your willpower!", false, 60 * 24);
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

public function enterLanesShop():Boolean
{
	if (flags["LANE_DISABLED"] == 1)
	{
		output("\n\nThe inside of the shop has been cleared out, and in a hurry too. Various belongings are scattered around haphazardly, considered and evidently forgotten in Lane’s haste to clear out of here as quickly as possible.");
		return false;
	}

	if (flags["LANE_FULLY_HYPNOTISED_FOREVER"]) flags["LANE_HYPNOSIS_LEVEL"] = 5;

	// Reset the "mini" flag so we'll get the full version of the effect-removal messages.
	if (flags["HYPNO_EFFECT_SMALL_MESSAGES"] != undefined) flags["HYPNO_EFFECT_SMALL_MESSAGES"] = undefined;

	if (flags["LANE_DETOX_STATUS"] == undefined && flags["LANE_DETOX_COUNTER"] != undefined)
	{
		visitLaneWhilstDetoxing();
		return true;
	}
	if (flags["LANE_DETOX_STATUS"] == 1)
	{
		visitLaneAfterDetoxing();
		return true;
	}

	if (flags["MET_LANE"] == undefined)
	{
		discoverLanesShop();
		return true;
	}
	else if (flags["LANE_FIRST_HYPNO_RETURN"] == 1 && flags["LANE_TIMES_HYPNOTISED"] > 0 && !hasHypnosisEffect())
	{
		lanesShopFirstRepeat();
		return true;
	}
	else if (hasMaxedLaneHypnosis() && flags["LANE_FULLY_HYPNOTISED"] != undefined)
	{
		lanesShopFullyUnder();
		return true;
	}
	else
	{
		repeatEnterLanesShop();
		return false;
	}
}

public function visitLaneWhilstDetoxing():void
{
	clearOutput();

	laneHeader();

	output("You rush into Lane’s hut with all the haste you can. You were such a fool! How could you think to leave Lane – your lover, your hunger, your <i>world!</i> There [lane.heShe] sits, idly watching something on [lane.hisHer] codex, as you come barreling in, tears in your eyes and your mouth dry.");

	output("\n\n[lane.HeShe] looks surprised to see you rush in so eagerly. <i>“[pc.name]!”</i> [lane.heShe] shouts. [lane.HeShe] sounds halfway between relieved and upset to see you again. <i>“Where have you been? I haven’t seen you in a while... and you’ve stopped sending me your payments. I thought you had died!”</i>");

	output("\n\nYou vault over [lane.hisHer] desk effortlessly and wrap your arms around [lane.hisHer] legs, burying your [pc.face] into [lane.hisHer] knees as you sob in delight that you’ve found your way back to your [lane.master]. <i>“[lane.Master]! I...”</i> you begin, choking back your ecstatic tears. <i>“I told one of my crewmates about us, [lane.master]. " + lFollowerMF("He", "She") + " saw my daily payments and started asking questions.”</i>");

	output("\n\nLane doesn’t move a muscle. <i>“And what did this crewmate of yours say?”</i>");

	output("\n\n<i>“"+ lFollowerMF("He", "She") +" told me to leave you, [lane.master]. "+ lFollowerMF("He", "She") +" tried to tell me that you were stealing from me and abusing me. "+ lFollowerMF("He", "She") +" convinced me to try and leave you, but... but I couldn’t! It was the darkest, most worthless time of my life, trying to tear myself from you! I won’t ever leave you again, [lane.master],");
	if (!silly) output(" I swear on my life!");
	else output(" I swear on me mum!")
	output("”</i>");

	output("\n\nYou hiccup your tears a few times, waiting for your love to say or do something, <i>anything</i> to make you feel welcomed and that [lane.heShe] wasn’t mad. Finally, after a heart-pounding eternity, you feel [lane.hisHer] soft, forgiving hands on your [pc.hair]. You immediately melt into [lane.himHer], feeling a relief you had never known before today. <i>“I forgive you, [pc.name],”</i> [lane.heShe] says to you, and you clutch at [lane.hisHer] legs tighter. <i>“You’re a good " + pc.mf("boy","girl") + ". You’ve made the right decision to come back to me.”</i>");

	output("\n\nYou sigh out loud, and look up at [lane.himHer], across [lane.hisHer] flat stomach, [lane.hisHer] beautiful " + lane.mf("chest","breasts") +", and at [lane.hisHer] adoring eyes. <i>“Let’s make sure you never make that mistake again, [pc.name]. I want you to look deep into my eyes. Can you do that for me?”</i> You obey wordlessly, staring deep into [lane.hisHer] eyes as [lane.heShe] flairs [lane.hisHer] tassels wide open for you. The familiar, safe feeling of sinking into the swirls of [lane.hisHer] tattoos and the lights of [lane.hisHer] body wash over you. <i>Good. You’re doing good....</i>");

	processTime(60);

	clearMenu();
	addButton(0, "Next", laneGonnaFuckYourDetoxinAssUp);
}

public function laneHandleCredits(totalDays:uint):void
{
	if (flags["LANE_PAYS_PC_ERRY_DAY"] == 1)
	{
		pc.credits += (200 * totalDays);
		AddLogEvent("A notification arrives in your codex’s message box with a shrill bleep. Quickly reading it, it’s a " + (isAprilFools() ? "dogecoin" : "credit") + " transfer message; Lane has paid you a total of " + String(200 * totalDays) + " credits, right on time.", "good", ((1440 - (GetGameTimestamp() % 1440)) + ((totalDays - 1) * 1440)));
	}
	if (flags["PC_PAYS_LANE_ERRY_DAY"] == 1)
	{
		pc.credits -= (500 * totalDays);
		AddLogEvent(ParseText("A notification arrives in your codex’s message box with a shrill bleep. Quickly reading it, you recognize it as an automatic payment that you’ve setup to [lane.master] Lane."), "bad", ((1440 - (GetGameTimestamp() % 1440)) + ((totalDays - 1) * 1440)));
	}
}

public function visitLaneAfterDetoxing():void
{
	clearOutput();

	laneHeader();

	if (pc.WQ() >= 75 || flags["ARAKEI_RESOLVED_MASTER_LANE"] != undefined)
	{
		if (pc.isNice())
		{
			output("You sigh. There [lane.heShe] is. Sitting inside that little hut of [lane.hisHers] in the middle of");
			//output(" the desert");
			output(" a forest");
			output(".");

			output("\n\nYou didn’t tell "+ lFollowerName(true) +" that you were coming here, but, as a victim of Lane’s ‘work,’ you feel you have something of a responsibility to anyone else that could potentially fall for [lane.hisHer] trap. Short of trying to warn the entire universe of a single Daynar that uses an ancient spiritual practice, the most surefire way to stop the problem is at its source. You enter Lane’s Plane.");

			output("\n\nThere [lane.heShe] sits, at [lane.hisHer] desk, idly thumbing through some tabs on [lane.hisHer] codex. [lane.HeShe] looks up when [lane.heShe] hears [lane.heShe] has a customer, but as soon as [lane.heShe] realizes it’s you, [lane.heShe] stands, looking you over concernedly. <i>“Where have you been, [pc.name]?! I’ve been worried sick! This whole time, I thought you had crashed into an asteroid, or you caught some kind of fever!”</i>");

			output("\n\nYou motion for [lane.himHer] to sit and take the seat across from [lane.himHer]. You take a deep breath. <i>“We need to talk, you and I,”</i> you say, trying to remain composed. <i>“It’s about how you hypnotized me.”</i>");

			output("\n\nLane apparently doesn’t like your non-threatening yet confident tone. As [lane.heShe] sits, [lane.heShe] flares [lane.hisHer] tassels wide and assaults you with the light of [lane.hisHer] glowing blood, mixing with the bright swirls of [lane.hisHer] tattoos and piercings. <i>“We can go deeper if you’d like.”</i> [lane.HeShe] snickers.");

			output("\n\nYou feel a twinge of... something, deep in the back of your mind, as your eyes watch the patterns on [lane.hisHer] body, but you manage to swallow it back with a hard blink. You stare at [lane.himHer] dead in the eye. <i>“That won’t work on me anymore, Lane.”</i>");

			output("\n\nLane looks at you, confused. [lane.HeShe] doesn’t believe you, and flexes [lane.hisHer] tassels wider, but [lane.hisHer] efforts are lost on you. You sit in the chair, calmly waiting for [lane.himHer] to stop [lane.hisHer] petty attempts to enthrall you once again. <i>“I don’t understand,”</i> [lane.heShe] eventually admits. <i>“Not once, in all my years of work or in my studies, have I heard of a person ‘breaking out’.”</i>");

			output("\n\n<i>“I’m honored to be the first,”</i> you say, <i>“and the last.”</i> Lane closes [lane.hisHer] tassels after another moment, and [lane.heShe] slumps in [lane.hisHer] chair, knowing [lane.heShe]’s been beaten. You tell [lane.himHer] that you remember every last detail; how [lane.heShe] made you love [lane.himHer], and how [lane.heShe] used [lane.hisHer] power over you to abuse you sexually. You also remember how depleted your bank account was for a few days.");

			output("\n\n<i>“Do you believe that any news is good news, Lane?”</i> [lane.HeShe] ponders the question, but you know [lane.heShe]’s really only trying to figure out your game and what you want. <i>“How do you think the universe would react when they hear how you tried to hypnotize the heir"+ pc.mf("", "ess") +" of Steele Tech out of [pc.hisHer] money? That I went to you, trusting you to do an honest, reputable job, and then you abused that and tried to rob one of the richest people alive?”</i> Lane squirms in [lane.hisHer] seat. <i>“You may have a monopoly on hypnotism, but that won’t mean shit if your market is poisoned.”</i>");

			output("\n\n<i>“Are you trying to blackmail me, [pc.name]?”</i> Lane says. <i>“That’s not very becoming of someone of your... future social standing.”</i>");

			output("\n\n<i>“Considering what you’ve done to</i> me, <i>I think I’m being rather generous.”</i> You lean forward, tapping your finger on [lane.hisHer] codex. <i>“One sentence will be all it’ll take to ruin all those testimonials you’ve been hoarding. What if we were all hypnotized to sign it? Could you ever be trusted with anything ever again?”</i>");

			output("\n\nLane breaks eye contact to glance at [lane.hisHer] codex. At the threat of ruining [lane.hisHer] reputation, [lane.heShe] sighs in defeat. <i>“What do you want from me, [pc.name]?”</i>");

			output("\n\nYou tap your chin as you think about it. <i>“I think five hundred credits a day is a good start, don’t you? An eye for an eye?”</i>");

			output("\n\nAt that, Lane becomes visibly upset. [lane.HeShe] begins to quiver in [lane.hisHer] seat. <i>“I can’t afford that sort of cash!”</i>");

			output("\n\n<i>“Well then, you and I are going to have a problem.”</i>");

			output("\n\n<i>“I’m serious, [pc.name], come on,”</i> [lane.heShe] all but pleads. <i>“I specialize in</i> hypnotism, <i>and I live in a one-story mud-tent in the middle of a");
			//output(" desert");
			output(" junkyard");
			output(" planet! At five hundred credits a day, with the customers I get and the bills I pay, I’d be starving after a week! Please, I’m begging you–”</i> [lane.HeShe] clasps [lane.hisHer] hands together and reaches over [lane.hisHer] desk, pleading for mercy, <i>“I can do two hundred credits. Two hundred credits a day.”</i>");

			output("\n\nYou tilt your nose up, looking down at [lane.himHer] as [lane.heShe] begs for [lane.hisHer] financial security. <i>“If I remember right,”</i> you say threateningly, <i>“didn’t you once say that Daynarian blood was once highly valued? Do you think a black market for it exists?”</i> You’re bluffing, but watching the color literally drain from Lane’s face is worth the visit alone. You stand. <i>“Two hundred credits a day, Lane. After what you did to me, you should be thankful. Be sure to not miss a payment.”</i> You turn towards the door, but you stop. <i>“And – don’t ever hypnotize another person like you did to me. I’ll find out.”</i>");

			output("\n\nYou hear Lane slump forward onto [lane.hisHer] desk as you victoriously leave [lane.hisHer] hut. With any luck, you won’t have to visit [lane.himHer] again anytime soon. Not that you’d be welcomed with open arms, anyway.");

			processTime(30);

			// Remove ‘Lane’s Plane’ from the map; the PC gains 200 credits a day for the rest of the game
			flags["LANE_PAYS_PC_ERRY_DAY"] = 1;
			flags["LANE_DISABLED"] = 1;

			clearMenu();
			addButton(0, "Next", move, "287");
		}
		else
		{
			output("There [lane.heShe] is. That slippery" + lane.mf(" son of a", "") + " bitch, sitting in that little mud-hut of [lane.hisHers], conning [lane.hisHer] next victim out of their money. You’re going to put a stop to that today.");

			output("\n\nIt’s not difficult to find Lane, sitting at [lane.hisHer] desk as [lane.heShe] lazily flips through something on [lane.hisHer] codex. [lane.HeShe] looks up, at first to greet a new customer into coming into [lane.hisHer] plane, but [lane.hisHer] emotion washes away the moment [lane.heShe] registers you.");

			output("\n\n<i>“Lane!</i> you shout, trying to sound as aggressive as you can. You march into [lane.hisHer] office,");
			if (pc.hasMeleeWeapon()) output(" one hand on your [pc.meleeWeapon]");
			else output(" popping the joints in your neck");
			output(" as you slap down on [lane.hisHer] table. You make it as obvious as you can that [lane.heShe]’s in trouble and that no amount of pleading is going to stop you.");

			output("\n\nLane leaps from [lane.hisHer] chair in response, fearful for [lane.hisHer] own safety, and instinctively opens [lane.hisHer] tassels to you. The adrenaline coursing through [lane.hisHer] blood speeds up [lane.hisHer] heart rate, making the lights of [lane.hisHer] body pulse brighter.");

			output("\n\nAt the first flash of light from [lane.hisHer] tassels, you feel your strength begin to leave you. Stars begin to fill your vision and the fight starts to drain from your arms... but, with a hard blink and a vigorous head shake, you clear the stuffiness from your senses and start your rampage against [lane.himHer] again. <i>“That’s not going to work on me anymore, you motherfucker!”</i>");

			output("\n\n<i>“How could you break my hold on you?!”</i> [lane.heShe] bellows, backing away from a mighty swing. Your");
			if (!pc.hasMeleeWeapon()) output(" fist");
			else output(" [pc.meleeWeapon]");
			output(" collides harmlessly with the curtain separating [lane.hisHer] office into two. You grip onto the fabric and, with a yank, pull it from the tracks keeping it connected to the ceiling. <i>“Nobody’s ever done that before! It should have been impossible!”</i>");

			output("\n\n<i>“I had some help!”</i> You swing again, and [lane.heShe] just barely scrapes by again. You feel just the tiniest bit of drag from swinging so close to [lane.hisHer] body. <i>“You’re giving me back every last fucking credit, or so help me, I’ll pull it from your blood! Daynarian blood was worth something once, I hear!”</i>");

			output("\n\nYou give up your position between [lane.himHer] and the door in your chase, and you realize that [lane.heShe] could just as easily make a dash out of [lane.hisHer] hut if [lane.heShe] wanted. You don’t care – you wouldn’t mind waiting until [lane.heShe] came back if [lane.heShe] did, and until then, [lane.hisHer] hut’s probably worth something, sentimentally or otherwise.");

			output("\n\n<i>“Let’s just talk this through, like a pair of reasonable adults, okay, [pc.name]?”</i> [lane.HeShe] tries to keep [lane.hisHer] voice steady as [lane.heShe] nimbly manages to avoid your every swing, but you’re getting closer and closer each time. <i>“We can work this out! Maybe, uh, we can –”</i> [lane.HeShe] makes a dive for [lane.hisHer] desk, digging through one of its drawers for what you can only assume is a weapon. You’re too close and [lane.heShe]’s too slow: you close the gap and deliver a strong punch to [lane.hisHer] ribs. The satisfying sound of your [pc.skinFurScales] connecting with [lane.hisHer] ribs fills your ears, and [lane.heShe] collapses forward, the wind knocked out of [lane.himHer].");

			output("\n\n[lane.HeShe] winces painfully as [lane.heShe] grips onto [lane.hisHer] side, where you had punched [lane.himHer]. Remorseless, you reach forward and wrap your right arm around [lane.hisHer] neck and pin [lane.hisHer] arm behind [lane.himHer] with your other, locking [lane.himHer] into the sleeper hold. [lane.HeShe] begins to choke, [lane.hisHer] words sputtering before they leave [lane.hisHer] lips – you grip onto [lane.himHer] tighter so [lane.heShe] can’t even do that.");

			output("\n\n<i>“This is how it’s going to work,”</i> you say to [lane.himHer]. [lane.HisHer] free hand claws at your shins and your arms, and though [lane.hisHer] claws manage to draw your blood, you’re not going to give up that easily. <i>“I want you to pick up your codex, and I want you to transfer every last goddamn " + (isAprilFools() ? "dogecoin" : "credit") + " you have to me.”</i>");

			output("\n\n[lane.HeShe] redoubles what little effort [lane.heShe] can muster, trying to break your iron grip on [lane.himHer], but all it does is irritate you. <i>“Or, I can snap your neck right now, Lane, and you</i> will <i>pay me back in blood. It wouldn’t be difficult to find a black market for Daynarian blood these days.”</i>");

			output("\n\nUnable to speak, Lane quickly gives up, and reaches forward for [lane.hisHer] codex, still on [lane.hisHer] desk. [lane.HeShe] quickly flips through the open tabs [lane.heShe] had on, until [lane.heShe] reaches [lane.hisHer] bank account. You ease your grip on [lane.himHer] just enough so [lane.heShe] can see what [lane.heShe]’s doing – once [lane.heShe] punches in [lane.hisHer] account number, your own, and [lane.hisHer] password, you hear [lane.hisHer] codex give off a little beep. Your own follows suit shortly after, and you know the deed is done.");

			output("\n\nJust as the pulsing of Lane’s colorful blood begins to slow and wane, you release [lane.himHer] entirely, letting [lane.himHer] collapse forward. [lane.HeShe] massages at [lane.hisHer] neck while [lane.heShe] coughs and takes deep, stuttering breaths, using the desk to support [lane.hisHer] weight. You look down at [lane.himHer], vulnerable as [lane.heShe] is, and consider giving [lane.himHer] a swift kick to the ass for good measure, but you decide against it. You’ve taken [lane.hisHer] money; you don’t need to take [lane.hisHer] dignity too, fitting as it would be.");

			output("\n\n<i>“Don’t ever let me catch you doing what you did to me to anyone else,”</i> you warn. Lane turns [lane.hisHer] head, glancing at you over [lane.hisHer] shoulder, [lane.hisHer] expression hurt and furious, but doesn’t make another move.");

			output("\n\nYou turn and leave [lane.hisHer] hut for the last time. You don’t think you’re welcome back there anymore, anyway.");

			// Remove ‘Lane’s Plane’ from the map; PC gains 12,000 credits
			pc.credits += 12000;
			flags["LANE_DISABLED"] = 1;

			clearMenu();
			addButton(0, "Next", move, "287");
		}
		
		variableRoomUpdateCheck();
		generateMapForLocation(currentLocation);

		return;
	}
	else
	{
		output("There [lane.heShe] is. That slippery" + lane.mf(" son of a", "") +" bitch, sitting in that little mud-hut of [lane.hisHers], conning [lane.hisHer] next victim out of their money. You’re going to put a stop to that today.");

		output("\n\nIt’s not difficult to find Lane, sitting at [lane.hisHer] desk as [lane.heShe] lazily flips through something on [lane.hisHer] codex. [lane.HeShe] looks up, at first to greet a new customer into coming into [lane.hisHer] plane, but [lane.hisHer] emotion washes away the moment [lane.heShe] registers you.");

		output("\n\n<i>“Lane!</i> you shout, trying to sound as aggressive as you can. You march into [lane.hisHer] office,");
		if (pc.hasMeleeWeapon()) output(" one hand on your [pc.meleeWeapon]");
		else output(" popping the joints in your neck");
		output(" as you slap down on [lane.hisHer] table. You make it as obvious as you can that [lane.heShe]’s in trouble and that no amount of pleading is going to stop you.");

		output("\n\nLane leaps from [lane.hisHer] chair in response, fearful for [lane.hisHer] own safety, and instinctively opens [lane.hisHer] tassels to you. The adrenaline coursing through [lane.hisHer] blood speeds up [lane.hisHer] heart rate, making the lights of [lane.hisHer] body pulse brighter. Your first thought is to shield your eyes – but your hands suddenly become rather heavy. Your eyelids, however, are light as could be.");

		output("\n\nYour ‘rampage’ against [lane.himHer] ends as quickly as it starts. Your arms hang limp at your sides");
		if (!pc.hasMeleeWeapon()) output(" and you drop your [pc.meleeWeapon] harmlessly");
		output(" as [lane.heShe] absorbs you once again. [lane.HeShe] still looks afraid, pressed against the far wall, but when [lane.heShe] realizes why you’ve stopped, [lane.heShe] peels [lane.himHer]self away.");

		output("\n\nYour mind’s voice screams at you to move, to thrash [lane.himHer] and take back what belonged to you. You fought so hard to break away from Lane – you should be clean now! [lane.HeShe] should have no power over you anymore! But your body disobeys your every command, and, on its own volition, you drop to your [pc.knees], looking up at Lane helplessly.");

		output("\n\nFerociously, Lane clamps both [lane.hisHer] hands against your head, rocking your eyes in your skull from the blow, but you don’t look away. Lane leans in close until [lane.hisHer] ever-changing eyes are all you see. You feel [lane.hisHer] breath blow down your neck through clenched teeth, and you feel [lane.hisHer] claws dig into the roots of your [pc.hair] painfully. <i>“You’re a very special person, [pc.name],”</i> [lane.HeShe] says disdainfully, forcing your head still to make sure your eyes never leave " + lane.mf("his", "hers") + ". <i>“I’ve never heard of a person breaking out of their hypnosis before. You’re much stronger than I gave credit for.”</i>");

		output("\n\nYour shoulders begin to go slack and loose in [lane.hisHer] grip. Visions of you serving [lane.himHer] once more begin to fill your eye, and the wonderful feel of being " + lane.mf("his", "hers") + " creeps over you. You begin to question why you had ever bothered to try and fight [lane.himHer] in the first place – you know happiness when you’re with Lane. <i>“Perhaps I gave you too much leeway, giving you enough freedom to wander the stars as you like. We won’t be making that mistake again, that’s for damn sure.”</i>");

		// Continue at ‘Merge’

		output("\n\n<i>“Watch the swirling lights,”</i> [lane.heShe] says, and it’s hard not to. Everything in your vision is moving and swimming: from the tattoos on [lane.hisHer] body to the lights in [lane.hisHer] eyes. The familiar sensation of being immersed in [lane.himHer], engrossed by [lane.himHer], overcomes you. <i>“You trust Lane. You can listen to Lane. Lane wants you to watch the swirling lights.”</i>");

		output("\n\nAny resistance you thought you once had evaporates as you’re introduced to the bliss that is Lane’s hypnotism. <i>“This is all so familiar to you. You remember being where you are before.”</i> [lane.HeShe]’s right, and in more ways than one: although you never remember the sessions, you remember the sensations subconsciously. <i>“Familiarity is good; familiarity is safe. Lane is familiar to you. You are safe with Lane. You want to stay with Lane, because Lane is safe.”</i>");

		output("\n\nHow did you never think of it that way before? Like a warm house, or a cozy bed, you’ve never felt more at-ease than with Lane. You want to nod your head, but you don’t really have the strength or the drive. You’d much rather just keep watching and listening. <i>“You don’t ever want to leave Lane again. You don’t mind giving up your life to be with Lane. The universe is unfamiliar to you; you want to stay with Lane, where it’s safe.”</i>");

		output("\n\nYou have to admit, that’s a good point. In your journey to claim your inheritance, you’ve been to different planets, met unfamiliar and dangerous plants and animals, and traveled the lonely stars. Why should you pursue such recklessness, when you could stay with Lane all your life?");

		output("\n\n<i>“You’ve forgotten your birthplanet.”</i> Well, that’s silly. You were born on... on... huh. <i>“But wherever it was, it is too different now. You love the planet Venar much more.”</i> You <i>do</i> enjoy the warmth of the desert sands and the contrasting coolness of its caves...");

		output("\n\n<i>“You’ve forgotten your spaceship.”</i> It was a hunk of junk anyway. <i>“Its metal hide was too unforgiving compared to the concrete of Lane’s hut. You prefer Lane’s home to your spaceship.”</i> You <i>have</i> been here enough times to know just about every little thing about it.");

		output("\n\n<i>“You’ve forgotten your friends.”</i> You try to put names to faces and faces to names, but, as Lane continues to absorb you, you have the damndest time doing either. <i>“People change. People corrupt. But Lane will never change. You are comfortable with Lane because Lane will never change.”</i> You sigh in relaxation, watching Lane as [lane.heShe] works [lane.hisHer] familiar, wonderful magic with you.");

		output("\n\n<i>“You’ve forgotten your name.”</i> You figured that would have been a difficult thing to forget, but you’re delightfully surprised by Lane’s skill. <i>“As Lane does not call you by it, it has become unusual and unfamiliar to you. You eagerly await the day Lane will give you a new name.”</i> That’s been something you’ve been hoping for all your life. You remember, as a child, fantasizing about the most perfect name Lane will give you when [lane.heShe] finally feels it’s ready.");

		output("\n\n<i>“You remember living to serve Lane.”</i> All the memories you had of providing for your [lane.master], waiting on [lane.himHer] hand and foot, and loving every last second of it, come rushing back to you. <i>“You remember surrendering to Lane physically, emotionally, and sexually, and you remember your life being perfect.”</i> You had no problems, until... until someone tried to confuse you and take that all from you. The thought that you’re almost back to your perfect life makes your heart race.");

		output("\n\n<i>“You remember the taste of Lane’s " + lane.mf("cock", "cunt") + ".”</i> It was sort of a salty, spicy taste; utterly unique to Lane, having been hidden behind [lane.hisHer] genital slit all [lane.hisHer] life, saturating itself in its own flavors, waiting for you to taste of [lane.himHer]. <i>“You want to taste it again.”</i> Gods above, do you ever.");

		output("\n\nLane releases [lane.hisHer] grip on your head and leans back in [lane.hisHer] chair. <i>“Pull down my pants,”</i> [lane.heShe] commands, and you do so with trembling, excited hands. You reach for the waistband of [lane.hisHer] flowing, airy pants, gripping onto them and pulling them from [lane.hisHer] waist with ease once [lane.heShe] lifts [lane.hisHer] pelvis. <i>“Remove my undergarments.”</i> You again obey, licking your lips as your fingers dig into the tight elastic of [lane.hisHer] underwear, and, teasing yourself, you pull down, slowly " + lane.mf("revealing his long, hard, hot, smooth, magnificent, delicious pink obelisk to you, pulsing and spurting, just as excited to see you as you are to it.", "revealing her puffy, juicy, wet, warm, enticing, incredible, delicious pink box to you, winking and shivering, just as ready for you as you are to it."));

		output("\n\n<i>“You may taste Lane.”</i>");

		output("\n\nYou wouldn’t give it up for the world.");

		processTime(60);

		clearMenu();
		addButton(0, "Next", laneGonnaFuckYourDetoxinAssUp);
	}
}

public function laneGonnaFuckYourDetoxinAssUp():void
{
	clearOutput();

	laneHeader();
	
	output("<i>“Now, I want you to open your eyes. Don’t force them open. Just let them.”</i>");

	output("\n\nYour [lane.master] instructed you to hide behind [lane.hisHer] chair in the hypnosis room as [lane.heShe] works with another client of " + lane.mf("his", "hers") + ". You sit, totally naked, as you await for your further instruction.");

	output("\n\nThis wouldn’t be the first time you’ve done this with your [lane.master] to a client of " + lane.mf("his", "hers") + ", but it is a relatively new idea. You are nonetheless eager to do it again; you’ve noticed some real changes in attitude in some of the clients after you’ve finished. You sit there");
	if (pc.hasCock()) output(", stroking [pc.eachCock] torturously, arousing yourself for what comes next");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	else output(",");
	if (pc.hasVagina()) output(" jilling yourself, plunging your fingers into your [pc.vagina]");
	output(" as you await your [lane.master]’s command");
	output(". You know this is a delicate procedure, but you’re just so anxious to get started!");

	output("\n\nA few minutes pass. You can see the light of Lane’s blood glowing off the far walls of the room you’re in, giving you a weak light show to entertain yourself with until you’re needed. Your heart leaps into your throat when you hear your [lane.master] say, <i>“Come forward," + lane.mf(" Cocksucker", " Cuntlicker") + ".”</i>");

	output("\n\nIt is both a name and one of your many occupations, since you’ve started living with Lane. You emerge from behind Lane’s chair, crawling seductively across the floor on all fours. You can see Lane’s client in the opposite chair: a pretty, raven-haired human, her eyes wide as saucers as she finds herself absolutely absorbed in Lane. This is the fourth time you’ve seen her this week – your [lane.master]’s new ‘procedure’ must be working.");

	output("\n\nLane already has " + lane.mf("his long, throbbing lizard cock", "her puffy, needy lizard cunt") + " out in display. [lane.HeShe] does nothing to arouse [lane.himHer]self further and keeps [lane.hisHer] hands to [lane.hisHer] sides, allowing you to do your job. Licking your [pc.lips], you crawl up your [lane.master]’s legs slowly, and, without so much as a word, lunge forward, " + lane.mf("swallowing his cock all the way to the base – just as you’re trained, and just as he likes", "plunging your tongue into her as deep as you can – just as you know she likes") + ".");

	output("\n\n<i>“Watch closely,”</i> Lane says, not to you. <i>“This is " + lane.mf("Cocksucker", "Cuntlicker") + ". You are jealous of [pc.himHer]. You would like for nothing more than to replace [pc.himHer].”</i> That line always makes you shiver – your [lane.master] would never replace you, would [lane.heShe]? <i>“You want for nothing more than to be between Lane’s knees and pleasuring [lane.himHer].”</i>");

	output("\n\nThis continues for the better part of an hour, with Lane growing more and more aroused with each command. As your mouth begins to flood with [lane.hisHer] " + lane.mf("[lane.cum]", "[lane.girlCum]") + ", you’re reminded of what a simple, wonderful life you live, and how you’re so fortunate to live it. You do hope this woman succumbs soon – it’d be a crime to hoard your gifts to yourself.");

	processTime(60);
	
	pc.removeAll();
	pc.lust(100);
	var i:int = 0;
	if(lane.mf("m", "f") == "m")
	{
		for(i = 0; i < 8; i++)
		{
			pc.loadInMouth(lane);
			pc.orgasm();
		}
	}
	else
	{
		for(i = 0; i < 8; i++)
		{
			pc.girlCumInMouth(lane);
			pc.orgasm();
		}
	}

	badEnd();
}

public function laneTakesOverTheSteeleFortune():void
{
	currentLocation = "GAME OVER";
	rooms[currentLocation].planet = "PLANET: VENAR";
	rooms[currentLocation].system = "SYSTEM: REDACTED";
	generateLocation(currentLocation);
	
	clearOutput();

	laneHeader();

	output("You landed on the planet Venar less than an hour ago. You stride with confidence and a little bit of bounce – you’ve been walking on clouds ever since you’ve beaten [rival.name] to your father’s inheritance and become wealthier than you honestly know what to do with. It’s been a few solar days since then, and you haven’t had a real chance to manage Steele Tech, but you’re eager to get started. There’s just one more person you want to include in the celebrations.");

	output("\n\nYou approach Lane’s hut and see [lane.himHer] lounging, as usual, in [lane.hisHer] chair, boorishly flipping through a few tabs on [lane.hisHer] codex to keep entertained. [lane.HeShe] perks up as soon as [lane.heShe] hears footsteps, and [lane.hisHer] spirits lift as soon as [lane.heShe] sees you. <i>“[pc.name]! You’re really back! I had heard rumors that... is it true? Did you really inherit Steele Tech?”</i>");

	output("\n\nYou assure [lane.himHer] that you have, and you are indeed the new CEO of Steele Tech Industries. Lane wastes no time in standing and practically catapulting over [lane.hisHer] desk to give you a great big celebratory hug. <i>“Congratulations, [pc.name]! You must be so thrilled!”</i> You don’t answer; your sheepish grin says it all. <i>“I can’t believe that the big boss of one of the most lucrative enterprises in the <b>entire</b> universe is one of my customers! Do you have any idea what that’ll mean for my business?”</i>");

	output("\n\nYou’re thrilled to see your [lane.master] so happy for your success. You entertain [lane.himHer] and ask what it means. Rather than answer, a lascivious grin spreads across [lane.hisHer] lips as [lane.hisHer] tassels slowly expand, submerging you in the glowing swirls of [lane.hisHer] tattoos and piercings once again. You sigh languidly, submerging yourself in the lights. <i>“It means I won’t have to live in a little mud-tent in the middle of an empty desert anymore.”</i>");

	output("\n\nEven as you feel yourself beginning to slip lovingly into [lane.hisHer] control, you have enough sense to ask [lane.himHer] what [lane.heShe] means. <i>“I mean that I’m about ready for new, lucrative business opportunities, [pc.name],”</i> [lane.heShe] says. [lane.HeShe] gently places [lane.hisHer] hands on the sides of your head, making sure your eyes don’t ever leave [lane.hisHer], not that you intended to. <i>“I’d like to work at Steele Tech. Would you happen to have any... ‘openings’?”</i>");

	output("\n\nYou pause before you realize it’s an actual question. You tell [lane.himHer] that you’re in charge of the whole business – you can give [lane.himHer] any job [lane.heShe] wants. [lane.HisHer] thin lips spread even wider, bearing [lane.hisHer] pointed teeth. <i>“Even yours?”</i>");

	output("\n\nThe question snaps you awake just slightly. Lane is asking for your job as CEO of Steele Tech Industries. That job was something you had been fighting to obtain for the past... however long, now, and with the position, the ungodly amount of money that comes with the salary. More than that, though, that position was your father’s legacy to you. As much as you love Lane and want [lane.himHer] to be happy, is that really something you can forsake?");

	output("\n\nLane picks up on your internal struggling and your refusal to answer. The lights of [lane.hisHer] body intensify, and the images swirling in your eyes devour you more thoroughly. <i>“It’s okay, [pc.name].”</i> [lane.HeShe] gently strokes at your cheeks, relaxing you with [lane.hisHer] expert caresses. <i>“You’d trust me with your life, wouldn’t you?”</i> That’s a much easier question to answer, and you nod. <i>“So then, what’s a job worth compared to your life? You can trust me with the job. In fact, you can trust me with your father’s financial inheritance. You know I’ll spend it wisely.”</i>");

	output("\n\nThe voice in your head, telling you to deny Lane or at least to ask for something else, grows quieter the longer you stare at [lane.himHer]. You <i>do</i> trust Lane. [lane.HeShe] hasn’t done you wrong yet. You even come to realize that [lane.heShe] technically has more experience running a business than you do. Maybe Steele Tech would be better off in [lane.hisHer] soft, gentle, capable hands.");

	output("\n\nYour will fractures, and you agree with Lane. You tell [lane.himHer] that, if that’s what will make [lane.himHer] happy, you’d gladly give [lane.himHer] your position at Steele Tech, and you’re confident in [lane.hisHer] money management capabilities. As the words leave your mouth, the glowing on Lane’s body stops, then quickens, as [lane.heShe] realizes just how close [lane.heShe] is to more money and power than [lane.heShe] had ever dared to fantasize about.");

	output("\n\n[lane.HisHer] hands trail from your cheeks to your shoulders, and then [lane.heShe] moves beside you, draping [lane.hisHer] left arm across the small of your back. <i>“You’ve made the best decision of your life,”</i> [lane.heShe] assures you. You trust Lane, and if Lane says it’s true, then it’s true to you. <i>“But we can worry about the paperwork later. For now, let’s head to my room and celebrate our good fortune.”</i>");

	output("\n\nAt hearing that,");
	if (pc.hasCock()) output(" [pc.eachCock] immediately begins to harden in your pants");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina()) output(" your [pc.vagina] clenches and moistens almost immediately");
	output(". You’re still looking at Lane’s eyes, but as [lane.heShe] leads you to [lane.hisHer] room, out of the edges of your vision, you can see " + lane.mf("his own cock tenting his undergarment furiously", "a damp patch at the crotch of her undergarment, growing with each step") + ", proof of [lane.hisHer] own excitement for the new direction your lives are taking.");

	output("\n\nAs you’re led past the door to [lane.hisHer] room, you idly wonder just what tomorrow will bring...");

	processTime(60);

	clearMenu();
	addButton(0, "Next", laneTakesOverTheSteeleFortuneII);
}

public function laneTakesOverTheSteeleFortuneII():void
{
	clearOutput();

	laneHeader();

	output("You’re underneath [lane.Master] Lane’s clean, massive desk, hidden completely from sight on all sides. The top is so high that you can sit straight up without any problems, and the edges are so far apart, you can lie down and still have a little bit of headroom to spare. You thank [lane.Master] Lane every day for it; it’d be so much harder to " + lane.mf("suck his delicious, prodigious cock", "lick her delicious, wonderful pussy") + " otherwise.");

	output("\n\nYou press your head forward, " + lane.mf("deepthroating him", "penetrating her as deep as you can with your [pc.tongue]") + " for the second time that morning. Your vision is surrounded by Lane’s meaty thighs, with [lane.hisHer] business pants hanging off [lane.hisHer] calves, as usual – ever since your [lane.Master] gave you the official, Steele Tech-approved position of " + lane.mf("Cocksucker", "Cuntlicker") + ", there’s not much else you do all day, or all night, or especially on weekends and holidays. You don’t deal with anybody else; you don’t sign any papers or approve any contracts; all you do at Steele Tech is service Lane whenever [lane.heShe] wants you. You don’t get many breaks, and you don’t get paid for it. You don’t even wear clothes anymore; they just get in the way of your work. You live, sleep, and eat underneath [lane.Master] Lane’s desk, or, if you need to be a bit more discreet, in a small cubbyhole your [lane.Master] graciously had built into the floor.");

	output("\n\nLane shivers at your work – perfect as it always is – and you feel [lane.hisHer] hand press on your [pc.hair]. <i>“Is everything alright, " + lane.mf("Mister", "Miss") + " Lane?”</i> you hear an older, very deep male voice say on the other side of the desk.");

	output("\n\n<i>“Everything is perfect,”</i> [lane.Master] Lane answers, and [lane.hisHer] words flow like honey to your ears, making you sigh through your nose. <i>“It’s just been a long, exciting morning so far.”</i>");

	output("\n\nThe other male chuckles. <i>“I can sympathize. A ten-billion-" + (isAprilFools() ? "dogecoin" : "credit") + " contract between businesses is nothing to take lightly. I’ve been counting the minutes until today, myself.”</i> You hear something slide across the marble top of [lane.Master] Lane’s business desk. <i>“This is the final contract we’ve agreed on last week. All we need is your signature, " + lane.mf("Mister", "Miss") + " Lane, and the universe can enjoy a long, rewarding relationship between Steele Tech and Reaper Armaments. Take your time looking it over, of course.”</i>");

	output("\n\nThen, for another few minutes, the only sounds you hear are the gentle sucking of your mouth on Lane’s genitals. Despite Lane’s calm demeanor, " + lane.mf("his cock is harder than you’ve ever seen it, and from the way he’s gently rocking back and forth, he’s moments away from cumming", "her box is wetter than you’ve ever felt it before, and from the way her legs squeeze around your head, she’s moments away from cumming") + ". You hear the distinct sound of pen on paper as Lane signs the contract, and in that instant, [lane.heShe]’s delivering an explosive orgasm straight down your throat. Experienced as you are, you easily handle [lane.hisHer] entire, copious output, swallowing every drop and wanting more.");

	output("\n\nThe paper slides back over the desk, and you hear the other man stand. <i>“You’ve made a great choice today, " + lane.mf("Mister", "Miss") + " Lane.”</i>");

	output("\n\nThe hand on your head leaves your [pc.hair] and [lane.heShe] leans forward in [lane.hisHer] seat. <i>“Likewise. Ah, forgive me for not standing.”</i> You gently clean " + lane.mf("his cock", "her cunt") + ", lapping up whatever juices you may have missed. <i>“I’m afraid I’ve worked my legs stiff at the golf links the other day.”</i>");

	output("\n\n<i>“Think nothing of it.”</i> You feel [lane.Master] Lane give the male a strong, firm handshake above you as [lane.hisHer] genital slit slowly begins to retract and conceal [lane.himHer].");

	output("\n\nYou had expected that to be it, but you actually hear the male take his seat again. <i>“If I may, I’d like to speak with you about a more personal matter.”</i>");

	output("\n\nLane’s hand returns to play with your [pc.hair]. <i>“How can I help you further?”</i>");

	output("\n\n<i>“I had heard a rumor that, before you had come to discover that planet of Oxonium, giving you enough wealth to buy out Steele Tech, you were a hypnotist, and that you had [pc.name] Steele as one of your clients. Is this true?”</i>");

	output("\n\nLane’s hand nervously clenches at your head. <i>“Yes, that is true.”</i>");

	output("\n\n<i>“I was wondering if you wouldn’t mind scheduling a personal session with my wife and I sometime within the solar month. Without going into too many details at the moment, there’s been some... trouble in paradise. I’m sure you understand.”</i>");

	output("\n\nImmediately, Lane’s genital slit begins to expand, and " + lane.mf("his cock surges from him once again, ready for another bout or three", "her pussy slickens and pulls on your cleaning tongue once again, ready for another go or three") + ". Lane only laughs as you set to work on [lane.himHer] for the third time that morning.");

	days += 9 + rand(5);
	processTime(60);
	
	pc.lust(100);
	pc.removeAll();
	pc.armor = new BusinessClothes();
	pc.credits = 0;
	var i:int = 0;
	if(lane.mf("m", "f") == "m")
	{
		for(i = 0; i < 8; i++)
		{
			pc.loadInMouth(lane);
			pc.orgasm();
		}
	}
	else
	{
		for(i = 0; i < 8; i++)
		{
			pc.girlCumInMouth(lane);
			pc.orgasm();
		}
	}

	badEnd();
}

public function discoverLanesShop():void
{
	clearOutput();

	laneHeader();

	output("Seeing such a structure tucked away between the harsh and uninviting ");
	//output("fauna");
	output("flora");
	output(" is certainly strange; your curiosity piqued, you head inside.");
	
	output("\n\nThe first room is really quite plain: there is a small desk to the side, made of concrete but smooth as glass, as well as a pair of chairs on either side, each with a thick, plushy cushion. A small sign on the desk details what services the store provides, but at the top, in huge, bolded letters, are the words ‘No Refunds’. A small bookcase sits behind the desk and faces the inside chair – it’s likely a secretary’s desk or something. Some potted plants, with exotic leaves and stems from parts of the world you’ve yet to explore, sit in the corners. There are no windows. The second half of the room is draped in more of those fabrics and streamers; they don’t conceal what lies beyond them, but they do obfuscate your vision enough to hide the details.");
	
	output("\n\nThere is nobody sitting at the desk to greet you. You hear the sound of bare feet stepping over the stone of the floor beyond the curtains, and you turn to see who is there. On the other side you see a humanoid-shaped person fidgeting with what you assume is some furniture. Whatever it is they’re doing, it appears to be giving regular flashes of red and blue light, dimly illuminating the whole room. They’re not standing profile, so you can’t tell if they have breasts or not, but you can make out the tell-tale sway of a tail reaching down their legs and nearly reaching their ankles.");
	
	output("\n\nWhoever is over there is clearly distracted and hasn’t noticed you yet. You think to clear your throat and call out to them, but, with just the silhouette, you can’t think of which gender-pronoun to address them as. Do you just assume it’s a male, or do you take the chance and assume it’s a female?");

	processTime(5);

	clearMenu();
	addButton(0, "Male", laneGenderSelect, "male");
	addButton(1, "Female", laneGenderSelect, "female");
}

public function laneGenderSelect(g:String):void
{
	flags["MET_LANE"] = 1;
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

public function meetMaleLane():void
{
	clearOutput();

	laneHeader();

	output("<i>“Excuse me, sir?”</i> you call out, hoping you’ve made the right decision. The figure immediately straightens out, bumping its feet on whatever it was shuffling around, and turns around, towards the curtains. A pair of brown, scaly, webbed, four-fingered ‘hands’ reaches between the gap of the curtains and pulls them wide open: there, a sort of lizard-man greets you, eye-to-eye, looking a little flustered that you had managed to get the drop on him.");

	output("\n\n<i>“I’m sorry!”</i> he says, stepping forward and shutting the curtain behind him. <I>“This is embarrassing! I was a little distracted, and I didn’t hear you step in. You haven’t been here for too long, I hope?”</I>");

	output("\n\nYou tell him that you had only just walked in. You’re quickly distracted yourself by the lizard-man’s appearance. He’s wearing even more of the white, lacy fabric all over his body, which does a poor job of concealing his skin and his bodily features: he has no nipples on his chest and he has no belly-button, and the whole front of his body appears to have thin, enviously smooth skin. His pelvis is concealed by a much thicker white fabric, concealing his privates and keeping him half-decent. When he first poked his head through the curtains, a pair of large, thin membranes, going from his jaw to his shoulders, seemed to flair wide open for a moment in his surprise before he shut them against his neck again. But the most mesmerizing thing of all is that the lizard-man appears to be... <i>glowing,</i> for lack of a better term. His skin is constantly flashing red and blue, giving away what the pale light from before was.");

	output("\n\nHe notices your odd, abject staring at his body, and his lizard-lips curl into a well-meaning smirk. <I>“You must never have seen a Daynar before, I take it?”</i> he asks you, putting his hands on his hips and striking a sassy pose. You hesitate for a moment, trying to find the willpower to break free from the hypnotic glowing underneath his skin, and you nod, confirming his assumption. <i>“Well, there’s a first time for everything.”</i> He reaches forward with his right hand. <i>“My name is Lane. Welcome to my little plane of existence.”</i>");

	output("\n\nYou shake his hand and give it a few strong pumps, replying with your own name. He quickly takes his spot behind the concrete desk, pulls his chair forward, and takes a seat, adopting a more professional demeanor for his new customer. <i>“[pc.name] Steele? As in, Steele Tech? Didn’t you inherit that company from your father – may he rest in peace?”</i> You tell him that, yes, of Steele Tech, but no, you haven’t, and that you’re working on it. His eyes wander for the briefest of moments, before he straightens himself out and looks you in the eye. <i>“So, [pc.name] Steele, what can I help you with?”</i>");

	if (!CodexManager.entryUnlocked("Daynar"))
	{
		CodexManager.unlockEntry("Daynar");
		output("\n\n<b>(‘Daynar’ Codex entry unlocked!)</b>");
	}
	
	processTime(15);

	laneShowMenu();
}

public function meetFemaleLane():void
{
	clearOutput();
	laneHeader();

	output("<i>“Excuse me, ma’am?”</i> you call out, hoping you’ve made the right decision. The figure immediately straightens out, bumping its feet on whatever it was shuffling around, and turns around, towards the curtains. A pair of brown, scaly, webbed, four-fingered ‘hands’ reaches between the gap of the curtains and pulls them wide open: there, a sort of lizard-woman greets you, eye-to-eye, looking a little flustered that you had managed to get the drop on her.");

	output("\n\n<i>“I’m sorry!”</i> she says, stepping forward and shutting the curtain behind her. <I>“This is embarrassing! I was a little distracted, and I didn’t hear you step in. You haven’t been here for too long, I hope?”</I>");

	output("\n\nYou tell her that you had only just walked in. You’re quickly distracted yourself by the lizard-woman’s appearance. She’s wearing even more of the white, lacy fabric all over her body, which does a poor job of concealing her skin and her bodily features: she has no nipples on her (rather generous) chest; she has no belly-button; and the whole front of her body appears to have thin, enviously smooth skin. Her pelvis is concealed by a much thicker white fabric, concealing her privates and keeping her half-decent. When she first poked her head through the curtains, a pair of large, thin membranes, going from her jaw to her shoulders, seemed to flair wide open for a moment in her surprise before she shut them against her neck again. But the most mesmerizing thing of all is that the lizard-woman appears to be... <i>glowing,</i> for lack of a better term. Her skin is constantly flashing red and blue, giving away what the pale light from before was.");

	output("\n\nShe notices your odd, abject staring at her body, and her lizard-lips curl into a well-meaning smirk. <I>“You must never have seen a Daynar before, I take it?”</i> she asks you, putting her hands on her hips and striking a sassy pose. You hesitate for a moment, trying to find the willpower to break free from the fancy glowing underneath her skin, and you nod, confirming her assumption. <i>“Well, there’s a first time for everything.”</i> She reaches forward with her right hand. <i>“My name is Lane. Welcome to my little plane of existence.”</i>");

	output("\n\nYou shake her hand and give it a few strong pumps, replying with your own name. She quickly takes her spot behind the concrete desk, pulls her chair forward, and takes a seat, adopting a more professional demeanor for her new customer. <i>“[pc.name] Steele? As in, Steele Tech? Didn’t you inherit that company from your father – may he rest in peace?”</i> You tell her that, yes, of Steele Tech, but no, you haven’t, and that you’re working on it. Her eyes wander for the briefest of moments, before she straightens herself out and looks you in the eye. <i>“So, [pc.name] Steele, what can I help you with?”</i>");

	if (!CodexManager.entryUnlocked("Daynar"))
	{
		CodexManager.unlockEntry("Daynar");
		output("\n\n<b>(‘Daynar’ Codex entry unlocked!)</b>");
	}
	
	processTime(15);

	laneShowMenu();
}

public function lanesShopFirstRepeat():void
{
	flags["LANE_FIRST_HYPNO_RETURN"] = 2;
	clearOutput();
	laneHeader();

	output("You march right into Lane’s little hut, a hundred angry things to say to [lane.himHer] all at once. [lane.HeShe]’s there, lounging at [lane.hisHer] desk and playing with [lane.hisHer] codex, and [lane.heShe] hardly seems phased at all when you start stomping into [lane.hisHer] business with a look like you’re going to rip [lane.hisHer] head off.");

	output("\n\n<i>“Lane!”</i> you shout, slapping at [lane.hisHer] desk forcefully, rumbling the little knicks and knacks [lane.heShe] has placed all around it. [lane.HeShe] looks up from [lane.hisHer] codex and into your eyes, fearlessly.");

	output("\n\n<i>“Ah, [pc.name],”</i> [lane.heShe] says nonchalantly. <i>“You must be here because the last hypnosis wore off, and you’re upset that it didn’t last forever.”</i> You’re a bit surprised that [lane.heShe] had deduced it so quickly. <i>“Yeah, that’s happened almost every single time, now. Everyone assumes that it’s a one-pay thing, and then they get the clarity I give them for the rest of their lives.”</i>");

	output("\n\nYou’re not the first person to yell at [lane.himHer] for giving you a temporary service? <i>“And I very much doubt you’ll be the last,”</i> [lane.heShe] says. <i>“I can understand why you’d be upset, but think about it from a " + lane.mf("businessman", "businesswoman") + "’s point of view, [pc.name]. Where would I get my money if I didn’t have repeat customers? I can’t survive on just one-offs. I</i> am <i>trying to run a business, here.”</i>");

	output("\n\nYou remain indignant and insist that [lane.heShe] could have at least told you beforehand that [lane.hisHer] ‘improvements’ were temporary. In response, [lane.heShe] taps at the bottom line of words at [lane.hisHer] ‘No Refunds’ sign. The font is small, but it clearly says that each service of [lane.hisHers] is strictly temporary and will wear off after twenty-four Terran hours, but can be reinstated the following day at the same charge.");

	output("\n\nSheepish, you sit and apologize for your outburst. <i>“Think nothing of it,”</i> [lane.heShe] tells you. <i>“Your response was actually quite contained compared to some of my more... animate customers. Besides, if you’re here, it means you liked my business enough to get yourself into a stink over it.”</i> [lane.HeShe] leans back casually. <i>“Let’s put that all behind us. What can I do for you today?”</i>");

	processTime(15);

	laneShowMenu();
}

public function repeatEnterLanesShop():void
{
	clearOutput();
	laneHeader();

	output("You approach Lane’s Plane, interested in another dose of [lane.hisHer] medicine. You enter [lane.hisHer] familiar hut and you see [lane.himHer], lazily lounging on [lane.hisHer] seat behind [lane.hisHer] desk as usual. [lane.HeShe] perks up, lifting [lane.hisHer] head at the sound of a coming customer’s footsteps, and [lane.hisHer] expression lights right up as soon as you walk into the store. <i>“Welcome again, [pc.name]!”</i> [lane.heShe] says, opening [lane.hisHer] arms warmly to greet you. <i>“Please, have a seat. To what do I owe the pleasure today? How can Lane help you in [lane.hisHer] plane?”</i>");

	output("\n\n[lane.HeShe] sits there, crossing [lane.hisHer] arms patiently while you take the seat across from [lane.himHer], and waits for your response.");

	processTime(5);

	laneShowMenu();
}

public function lanesShopFullyUnder():void
{
	clearOutput();
	laneHeader();
	output("You approach Lane’s Plane, eager for another dose of your "+ lane.mf("master", "mistress") +"’s medicine. [lane.HisHer] hut has been taking on a rather extravagant turn lately, with all that extra money [lane.heShe]’s been siphoning from you. When you enter, you see [lane.himHer] lounging languidly, [lane.hisHer] legs spread and [lane.hisHer] chair leaned back, waiting for some other unlucky- or lucky, from your twisted, controlled perspective- customer to walk into [lane.hisHer] trap.");

	output("\n\n[lane.HeShe] smirks that familiar smirk when you walk in, and [lane.heShe] drops [lane.hisHer] feet to the floor" + lane.mf("", ", making her bust bounce just slightly from the motion and the vibration") + ".");
	output(" [lane.HeShe] regulates [lane.hisHer] pulse, and already you’re weak in the [pc.knees] and horny in the loins");
	if (pc.hasGenitals() && (flags["LANE_MALE_SEXED"] != undefined || flags["LANE_FEMALE_SEXED"] != undefined))
	{
		if (pc.hasCock() && !pc.hasVagina()) output(", [pc.eachCock] rousing to attention, hoping Lane will provide you some ‘other’ service. Beads of your [pc.cum] begin to stain your clothing as you sit.");
		else if (pc.hasVagina() && !pc.hasCock()) output(", [pc.eachVagina] moistening in rapt optimism that Lane will use [lane.hisHer] power over you to give you another life-altering orgasm.");
		else output(", each and every part of you ready to sink deeper into [lane.hisHer] control, if it means getting off the way only [lane.heShe] can get you off anymore.");
	}
	else output(" which only serves to frustrate you, but your waking mind knows that your needs are secondary to [lane.hisHer], and providing yourself to Lane is the greatest pleasure you’ll ever need.");

	output("\n\n[lane.HeShe] flairs [lane.hisHer] tassels open, only for a moment, to let you taste of the sweet pleasure you’ve come to [lane.himHer] for. Teasingly, they shut again, and you’re left horny and thirsty for more of [lane.himHer]. <i>“Welcome back, my pet,”</i> [lane.heShe] says sensually, dragging a loving claw gently over your [pc.face]. <i>“Have you come to Lane for more of [lane.hisHer] magic?");
	if (flags["LANE_MALE_SEXED"] != undefined || flags["LANE_FEMALE_SEXED"] != undefined) output(" Or are you here to pay your ‘taxes’?");
	output("”</i>");
	
	processTime(15);
	applyDamage(new TypeCollection( { tease: 65 } ), chars["LANE"], pc, "minimal");

	laneShowMenu();
}

public function laneShowMenu():void
{
	clearMenu();
	addButton(0, "Talk", talkToLane);
	addButton(1, "Services", laneServices);
	if (hasMaxedLaneHypnosis() && flags["LANE_FULLY_HYPNOTISED"] == 1) addButton(2, "Taxes", payTheLaneTax);
	else addDisabledButton(2, "Taxes");
	addButton(5, "Appearance", lanesAppearance);
	addButton(14, "Leave", leaveLanes);
}

public function leaveLanes():void
{
	clearOutput();
	laneHeader();
	
	output("On second thought, you decide to cut your visit to Lane’s short.");
	output("\n\nLane seems a little dejected at your decision not to take up [lane.hisHer] offer of a little ‘treatment’ before you leave, but you make it clear that you’ve really got to be moving on.");
	output("\n\nYou bid the daynar a good day and take your leave, heading back out into the wilds of Tarkus.");
	
	processTime(5);
	
	clearMenu();
	addButton(0, "Next", move, "287");
}

public function talkToLane():void
{
	clearOutput();
	laneHeader();

	if (hasMaxedLaneHypnosis())
	{
		output("[lane.HeShe] laughs, not derisively, but not amusedly either. <i>“You and I have gotten plenty intimate over your visits. I’ve charmed you quite enough, I think.”</i> [lane.HeShe] flairs [lane.hisHer] tassels open again, and [lane.hisHer] power over you is refreshed. If [lane.heShe] doesn’t want to talk, that’s perfectly fine with you. <i>“But,”</i> [lane.heShe] yawns, closing [lane.hisHer] membranes against [lane.hisHer] neck, <i>“you’ve come all this way just to taste of your "+ lane.mf("Master", "Mistress") +"’s voice some more. Who would I be to turn down such a loyal pet?”</i>");
	}
	else
	{
		output("<i>“Oh, this is a social call, is it?”</i> Lane says, trilling amusedly. [lane.HeShe] leans back in [lane.hisHer] chair, slumping and relaxing, stretching [lane.hisHer] limbs out. <i>“Sure, I wouldn’t mind shooting the breeze for a moment. What’s on your mind?”</i>");
	}

	processTime(5);

	generateLaneTalkMenu();
}

public function generateLaneTalkMenu():void
{
	clearMenu();
	
	addButton(0, "Occupation", laneTalkOccupation);
	
	if (flags["LANE_OCCUPATION_TALK"] != undefined) addButton(1, "Daynar", laneTalkDaynar);
	else addDisabledButton(1, "Daynar");

	if (flags["LANE_DAYNAR_TALK"] != undefined) addButton(2, lane.mf("Him", "Her") + "self", laneTalkThemself);
	else addDisabledButton(2, lane.mf("Him", "Her") + "self");
	
	addButton(14, "Back", laneShowMenu);
}

public function laneTalkOccupation():void
{
	flags["LANE_OCCUPATION_TALK"] = 1;
	clearOutput();
	laneHeader();
	output("You ask Lane what [lane.hisHer] occupation is, out here in the middle of");
	//output(" the desert");
	output(" a forest");
	output(", setting up shop in some little mud hut. Beyond the codex lying atop [lane.hisHer] desk, [lane.hisHer] business seems very... rustic. There’s very little in the way of modernization here.");

	output("\n\n<i>“Yeah, you’re right,”</i> [lane.heShe] says proudly. <i>“I know my way around the modern world about as well as anyone else, but I try to keep my house, and my business, as down-to-earth as possible. I specialize in....”</i> [lane.HeShe] pauses, tapping a claw against [lane.hisHer] chin. <i>“</i>Spiritualistic medicine<i> is one way of putting it.”</i> You ask [lane.himHer] to elaborate.");

	output("\n\n<i>“Well, think about it. Say you don’t like something about yourself – maybe you’re too meek, or shy, or you have a nervous tic, or something. Maybe you’re just depressed. Today, most of those things can be fixed with a bottle of pills, or the push of a button, or a needle in your arm. Modern medicine is all well and good, and if I ever get sick with the pony pox, you’ll find me elbow-deep in my medicine cabinet. But maybe you have something a pill can’t fix, or maybe you’re not a fan of putting things in your body. That’s where I can help out.”</i>");

	output("\n\nA pair of thin, fleshy membranes unstick from the sides of [lane.hisHer] neck and flare open. They reach from the very edges of [lane.hisHer] shoulders to the bottom of [lane.hisHer] jaw on either side of [lane.hisHer] head. They have some markings and piercings on them, but they’re so thin that the glowing from the inside of [lane.hisHer] body is especially intense on them. <i>“I specialize in hypnosis,”</i> [lane.heShe] says, after letting you gawk at the red-and-blue flashing of [lane.hisHer] thin skin a bit. [lane.HeShe] presses the membranes flat against [lane.hisHer] neck again, stopping the light show. <i>“I can hypnotize anybody.”</i>");

	output("\n\nYou shake the lights from your eyes, and you scoff at [lane.himHer]. Hypnosis? You’d have thought something as archaic as that would have phased out centuries before the first Great Planet Rush.");

	output("\n\n<i>“A lot of people thought so,”</i> [lane.heShe] said, lifting up [lane.hisHer] codex and pressing a few buttons on its screen. [lane.HeShe] then turned it towards you. <i>“Here are some customer testimonials if you’re unconvinced.”</i> On the bright screen was a sort of guestbook: different names and handwriting from every unique customer Lane ever had was there, and each of them sang [lane.hisHer] praises, assuring whoever read them that Lane was the real deal. [lane.HeShe] turns towards [lane.hisHer] bookcase. <i>“I also have a work permit, and a certification of guaranteed quality from the UGC, if you’d like.”</i> From its top shelf, [lane.heShe] pulls out two certificates, both of them framed, stamped, and signed. You can’t deny it – Lane is running a real, legitimate business in hypnotism.");

	output("\n\nYou return the codex to [lane.himHer] and, intrigued, you ask [lane.himHer] how hypnosis works, and how [lane.heShe] can use it as a business. <i>“The most important part is that the customer has to want it. If, say, you came to me complaining about your depression and you paid me to hypnotize it out of you, but you didn’t actually want it, then it would fail.”</i> [lane.HeShe] nods to the sign on [lane.hisHer] desk, tapping at the top line of the sign: the big words that say ‘No Refunds.’ <i>“That’s why there are no refunds. As soon as you give me the credits, I’m not giving them back. If nothing else, it provides a good incentive for people to want to get their money’s worth.”</i>");

	if (pc.isMischievous()) output("\n\nYou lean back in your chair and you smirk at [lane.himHer]. If the customer really has to want it, then [lane.heShe] can’t exactly just walk down the street and hypnotize the money out of people’s wallets, then. <i>“Unfortunately, no,”</i> [lane.heShe] says, laughing with you. <i>“If I could do something like that, then I’d have taken up a job as a politician, or a news anchor; something to get me in front of a camera. But unless every single person watching me wants me to hypnotize them, all they’d see is a Daynar with a bunch of tattoos on [lane.hisHer] tassels. I’m afraid universal domination isn’t really in my schedule.”</i> You tell [lane.himHer] that [lane.heShe] must be heartbroken, and [lane.heShe] just waves you off.");

	output("\n\n<i>“So, are you convinced?”</i> [lane.heShe] asks, opening [lane.hisHer] hands to you. <i>“Would you like to give it a try? Or is there something I can help you further with?”</i>");

	processTime(15);

	generateLaneTalkMenu();
	addDisabledButton(0, "Occupation");
}

public function laneTalkDaynar():void
{
	flags["LANE_DAYNAR_TALK"] = 1;
	clearOutput();
	laneHeader();

	output("You ask [lane.himHer] about [lane.hisHer] species. When you first met, [lane.heShe] introduced [lane.himHer]self as a ‘Daynar’. <i>“That’s correct,”</i> [lane.heShe] says, crossing [lane.hisHer] arms. <i>“We’re one of the many races natively found on the planet Venar. I’m told we closely resemble a common lizard on the planet Terra.”</i> You confirm. <i>“We’re big fans of hot, dry places, like the");
	//output(" desert we’re under");
	output(" plains on Tarkus or a desert");
	output(". We evolved from a smaller, more... beastly, single-minded creature only a few millenniums ago. A blink of an eye, in geological terms.”</i> [lane.HeShe] scratches the top of [lane.hisHer] bald, scaly head. <i>“Our evolution was natural for the most part, until aliens like yourself started showing up and polluting our sands with your biogenetic drugs. Not that I’m complaining, myself.”</i>");

	output("\n\nYou ask [lane.himHer] if all the Daynar have blood that glows. You find it awfully distracting in a pleasant way. <i>“Oh, yes. It’s another evolutionary advantage, one we still use today. How brightly it glows is an indicator of the individual’s health and sexual potency - " + lane.mf("the brighter it is on a male, for instance, then the healthier he is, and the more virile his sperm is.", "the brighter it is on a female, for instance, then the healthier she is, and she’ll lay a larger, healthier clutch of eggs than others.") + " The way the blood pulses can also be a signal if a female Daynar is in heat.”</i> [lane.HeShe] looks away and sighs, twirling a claw on [lane.hisHer] desk. <i>“Back when we were still a fledgling species, we were hunted quite a bit for our blood. They were used for fancy baubles and knick-knacks: tacky, expensive glowsticks and the like. That stopped in a hurry, thankfully, once we learned how to talk. The UGC didn’t like the idea of hunting a sapient species, and outlawed the practice.”</i>");

	output("\n\nYou look at Lane’s neck and chest, watching [lane.hisHer] blood course, [lane.hisHer] skin glowing an iridescent red and then a melancholy blue.");
	if (!pc.isMischievous()) output(" An obvious, quite personal question comes to mind, but you decide not to embarrass the poor thing.");
	else 
	{
		output(" You ask [lane.himHer] what [lane.hisHer] own glowing means for [lane.hisHer] health. <i>“I’m not asked that too often,”</i> [lane.heShe] notes, looking down at [lane.hisHer] chest. <i>“I</i> feel <i>fine... I’m hardly a fitness nut, but I usually start my mornings with a set of " + lane.mf("push-ups", "crunches") +". I think I’m about average.”</i> And, you ask... what about [lane.hisHer] ‘sexual potency?’");
		if (!hasMaxedLaneHypnosis()) output(" The color of [lane.hisHer] eyes change from brown to a rosy red, and [lane.heShe] just chuckles and looks away.");
		else output(" <i>“I should think you’d know,”</i> [lane.heShe] says, flaring open [lane.hisHer] tassels for a moment, <i>“but I can give you a reminder a little later, pet.”</i> You feel something of yours flaring between your legs as well.");
	}

	output("\n\nYou ask Lane about the weird membranes connecting [lane.hisHer] jaw to [lane.hisHer] shoulders. <i>“Oh, these,”</i> [lane.heShe] says, flapping them open. Your eyes are caught on them, watching how [lane.hisHer] blood glows brightest through them, and how the veins in [lane.hisHer] skin work with the tattoos on - [lane.heShe] closes them before you get a little <i>too</i> distracted. <i>“We Daynar call them ‘tassels’. They’re used to regulate our body temperature, and, if we’re in the middle of a fight, we can open them in a flash to scare our opponent. In today’s modern world, though, with air-conditioning, climate control, and not much in the way of natural predators, they don’t see much use anymore.”</i>");

	output("\n\n[lane.HeShe] opens [lane.hisHer] eyes wide – unusually wide, making you fidget in your seat – and, just like that, the color of Lane’s irises begin to change, into every color you can imagine. <i>“Daynar don’t have the best night vision, so we can open our eyes really wide to draw in more light to compensate. As for the irises... nobody is really sure why we can do that. Our best guess is to unnerve predators: to make us look sickly and unappetizing. Whatever the purpose, they sure make my job easier.”</i> [lane.HeShe] points to the sides of [lane.hisHer] head. <i>“Our ears are pretty plain,”</i> [lane.heShe] begins. You have to lean forward to see where [lane.hisHer] ears even are: they’re just a pair of holes in [lane.hisHer] head, nothing more. <i>“But we have</i> great <i>hearing. Some Daynar pick up jobs as interpreters because we have an easier time picking up different languages than most.”</i>");
	
	output("\n\n[lane.HeShe] leans forward in [lane.hisHer] seat. <i>“There’s just one more thing I want to mention. It’s about Steele Tech.”</i> You match [lane.hisHer] posture, interested. <i>“I don’t know if you knew this, but most Daynar on");
	//output(" the");
	output(" that");
	output(" planet are employed by Steele Tech. Venar, it turns out, has a lot of minerals and ores that the rest of the universe is interested in, but no other race can withstand the harsh climate of the hot desert or the planet core like a Daynar can. Which makes us</i> highly <i>desirable for a mining company. Your dad paid us pretty well, and his stickler for safety carried over to Venar; there isn’t a Daynar");
	//output(" here");
	output(" there");
	output(" that wouldn’t mind calling you ‘boss’ if you kept up his legacy, [pc.name].”</i>");

	output("\n\nYou shift in your seat, uncomfortable with the sudden pressure, but you assure [lane.himHer] that you’ll do what you can. Lane leans back, relaxing. <i>“That about covers it, I think. Is there anything else I can help you with?”</i>");

	processTime(20);
	generateLaneTalkMenu();
	addDisabledButton(1, "Daynar");
}

public function laneTalkThemself():void
{
	flags["LANE_SELF_TALK"] = 1;
	clearOutput();
	laneHeader();

	output("You ask [lane.himHer] if hypnosis is a thing that all Daynar can do. <i>“As in, is it something they just intrinsically know? No. Anyone can learn it, of course, but, as far as I know, I’m the only Daynar that bothered to take the time.”</i>");

	output("\n\nYou then ask [lane.himHer] about [lane.himHer]self. What inspired [lane.himHer] to get into the business of hypnotism? Despite the certificates and the testimonials, you insist that it <i>is</i> a pretty ancient practice. <i>“Yes, I know, and I agree. Hypnosis hasn’t really been in the news, so to speak, for hundreds of years now.”</i> [lane.HeShe] chuckles sheepishly. <i>“If I’m honest, the inspiration for picking it up was because... I was bullied a lot when I was younger. I had a lot of power fantasies about controlling the people around me to do whatever I wanted. Like, commanding them to be my footrest as I sit on my gilded, golden throne; stuff like that. Making them ‘regret’ bullying the wrong Daynar.”</i>");

	output("\n\n[lane.HeShe] rests [lane.hisHer] chin on the palm of [lane.hisHer] scaly hand, reminiscing about [lane.hisHer] younger years. <i>“I didn’t learn about hypnotism until my adolescent years, when I was studying history. One of my textbooks mentioned hypnosis as an old, ancient, spiritual practice. I was intrigued, so I studied it some more, and before I knew it, I was getting a permit to practice it as a business.”</i>");

	if (!hasMaxedLaneHypnosis())
	{
		output("\n\nYou chuckle uncomfortably, rolling your shoulders. [lane.HeShe] learned how to control people, and [lane.heShe] made it a legitimate business... because of a power fantasy? <i>“I know what you’re thinking,”</i> [lane.heShe] says smoothly, trying to calm your nerves. <i>“If I put a person ‘under’, then I could, theoretically, control what the person feels and thinks and does until they pull out of it. Believe it or not, the UGC thought so too – and they made me swear that I wouldn’t use my skills ‘to the detriment of the peoples that trust my judgment’. Sort of like the Hippocratic Oath for doctors.”</i> You narrow your eyes and chew your bottom lip. You could trust a surgeon, but a hypnotist...?");
	}
	else
	{
		output("\n\nYou smile sensually, resting an elbow on Lane’s desk. You tell [lane.himHer], in a dulcet tone, that you find power fantasies pretty sexy, yourself – especially when it’s [lane.himHer] that’s in charge. In response, [lane.heShe] grins, and opens [lane.hisHer] tassels, letting you absorb more of [lane.himHer]. <i>“It wasn’t easy at first,”</i> [lane.heShe] says, enjoying the way you watch the patterns on [lane.hisHer] tassels. <i>“I swore not to use my powers for evil. But then, the heir" + pc.mf("", "ess") + " of Steele Tech had to go and pay me to abuse [pc.himHer] until [pc.heShe] couldn’t get enough of me. And, I have to admit, ‘evil’ feels pretty good when" + lane.mf(" your pretty lips are sucking my dick and swallowing my cum like I was the only fountain in a desert.", " you’re digging for gold with your tongue in my cunny and you try oh-so-hard to hit just the right spots to make your mistress come again and again.") + "”</i> [lane.HeShe] closes [lane.hisHer] tassels, leaving you teased for more.");
	}

	if (lane.mf("m", "f") == "f")
	{
		output("\n\nYou decide to broach a rather delicate and personal question, and you preface it by telling Lane that she doesn’t need to answer if she doesn’t want to. If you’re not mistaken, Daynarians are cold-blooded – which she confirms – and that Daynarians lay eggs – which she confirms. So, why does she have breasts?");
		output("\n\nShe leans back and stretches her arms, shamelessly showing off her doubly-dangerous jugs to you. <i>“I’m glad you noticed,”</i> she says slyly and without a hint of reserve. <i>“Daynarians were a very sexual species as we transitioned from a lowlier species to one of higher thought. The females don’t have breasts, you’re correct, but, as we discovered the more... carnal pleasures of life, we recognized their appeal and why they’re sexually desirable. Today, breasts on a female Daynarian means she has the means to acquire them in the first place, so they’re something of a status symbol. They don’t serve any purpose other than to be shown off – and,”</i> she says, massaging them right in front of you, <i>“I gotta say, they’re pretty fun.”</i>");
		output("\n\nIf they’re considered a status symbol among the Daynarians, does that mean male Daynarians can get them too? You chuckle as you imagine it, but she only smiles. <i>“It’s not unusual.”</i> That silences you in a hurry. <i>“But it is uncommon. It’s something of a clash between Daynarian culture and that of the rest of the universe’s: to us, boobs on anybody means they’re well off and financially stable, but not a lot of other cultures see it that way. So, don’t be surprised if you see a male Daynarian with a set bigger than mine, but try not to be repulsed, either.”</i>");
	}

	output("\n\n<i>“Now then, do you have any further questions?”</i> [lane.HeShe] leans back in [lane.hisHer] seat, waiting for your response.");

	processTime(20);
	generateLaneTalkMenu();
	addDisabledButton(2, lane.mf("Him", "Her") + "self");
}

public function laneServices():void
{
	clearOutput();
	laneHeader();

	if (flags["LANE_SHOWN_SERVICES"] == undefined)
	{
		// First time.
		flags["LANE_SHOWN_SERVICES"] = 1;
		output("You ask Lane about [lane.hisHer] service, and you mention that you’re interested. <i>“Of course!”</i> [lane.heShe] says, giddy that [lane.heShe] has some business. <i>“I specialize in hypnosis. A lot of problems that a lot of people have are all in their head – if there’s something about yourself that you don’t like, but you’re not comfortable with using drugs or biotech to change your body, I can give you the boost you need. Or maybe you’re struggling with something more cerebral: I’ve had writers come to me before asking me to help with their writer’s block. Whatever the case, there’s no psychological barrier I can’t help you breach.”</i>");

		output("\n\nYou ask [lane.himHer] to elaborate. <i>“Well, in your case, you don’t really seem like the desk-jockey sort. You’re more of a doer, a shaker; you’re out there, exploring new planets and conquering new terrains, or your name isn’t [pc.name] Steele. Am I right?”</i> You confirm. You never were one for desk jobs, and, without telling [lane.himHer] why, you’ve been exploring the planets rather extensively lately.");

		output("\n\n<i>“So, and I don’t want to be presumptuous here, but let’s say you’re in the jungles of Mhen’ga and you see some Naleen in the bushes. You reach for your gun – but it’s faster! It lunges at you, and you point and shoot, but your aim goes wide and now that cat-snake has got you in its coils! You struggle and you struggle, but you don’t have the strength to break free! If only your reflexes were a little better!”</i>");

		output("\n\nYou sigh and cross your arms, waiting for [lane.himHer] to get to the point. <i>“That’s where I can help. I can hypnotize your senses to be more acute, more in-tune with your surroundings and atmosphere. With my help, the next time you’re in those jungles, you’ll be able to turn the surprise around on the Naleen before it could even blink.”</i>");

		output("\n\nYou’re definitely intrigued, and you lean forward. [lane.HeShe] can really make your reflexes <i>that</i> good? <i>“Not only your reflexes!”</i> [lane.heShe] insists. <i>“Have you ever been in a fight, and you wished you were stronger than you were? I can help with that, too! You often hear stories about people performing extraordinary feats of strength, when they look as wiry as a straw, yes? If only a person can harness that sort of strength and call on it whenever they wish. I can help with that! Whatever it is you need – anything at all – I can make you</i> better <i>just by making you believe that you are.”</i>");

		output("\n\nYou sit back in your seat, strongly considering Lane’s words. What the fuck, you decide – you’re here, you may as well. You tell [lane.himHer] that you’re in. <i>“Excellent!”</i> [lane.HeShe] pulls up [lane.hisHer] own codex, and begins tapping at its screen. <i>“I charge one hundred credits per hypnosis. I am contractually obligated to remind you that there are no refunds. As soon as the payment goes through, we can begin.”</i>");

		output("\n\n[lane.HeShe] hands you [lane.hisHer] codex. It’s asking for your confirmation, and it lists what you’re purchasing, and for how much. Before you sign your confirmation, you think on it. If you paid Lane to hypnotize you... what would you change about yourself?");

		if (pc.credits < 100)
		{
			output("\n\nYou wince, looking at the codex, and you hand it back to [lane.himHer], sheepishly telling [lane.himHer] that you can’t afford it. <i>“Oh.”</i> [lane.HeShe] wipes at its screen, and it goes blank. <i>“Not to worry, I don’t mind this being a social call. Is there anything else I can do for you?”</i>");

			laneShowMenu();
		}
		else
		{
			laneServicesMenu();
		}

		processTime(15);
	}
	else
	{
		// not hypno
		if (!hasLaneHypnosis())
		{
			if (flags["LANE_TIMES_HYPNOTISED"] > 0)
			{
				output("<i>“Of course,”</i> says Lane, already reaching for [lane.hisHer] codex and writing up your receipt. <i>“I’m glad that you enjoyed my service enough to come back, [pc.name].”</i> [lane.HeShe] passes you the codex. <i>“One hundred credits, as usual. Contract, no refunds, blah blah blah. What can I do for you this time?”</i>");
			}
			else
			{
				output("<i>“Of course,”</i> says Lane, already reaching for [lane.hisHer] codex and writing up your receipt. <i>“I’m glad to see that you’re still interested in my services, [pc.name].”</i> [lane.HeShe] passes you the codex. <i>“One hundred credits, as usual. Contract, no refunds, blah blah blah. What can I do for you?”</i>")
			}

			if (pc.credits < 100)
			{
				output("\n\nYou wince, looking at the codex, and you hand it back to [lane.himHer], sheepishly telling [lane.himHer] that you can’t afford it. <i>“Oh.”</i> [lane.HeShe] wipes at its screen, and it goes blank. <i>“I’m afraid I can’t give discounts to my regulars. Sorry. Is there anything else I can do for you, though? Shooting the breeze is always free.”</i>");

				laneShowMenu();
			}
			else
			{
				laneServicesMenu();
			}

			processTime(5);
		}
		else
		{
			// PC is hypnotized

			output("[lane.HeShe] smiles at you, and [lane.heShe] reaches for [lane.hisHer] codex. <i>“Of course you do, [pc.name].”</i> [lane.HisHer] tassels flutter just enough so that you can get a taste of what’s to come. [lane.HisHer] claws are jittery on the codex’s screen, proof of [lane.hisHer] own excitement. <i>“I’m sure if I were to charge you three hundred credits, you wouldn’t object.”</i>");
			output("\n\nYou tell [lane.himHer] that you wouldn’t.");
			output("\n\n<i>“How about three thousand? And you’re definitely not getting a refund.”</i>");
			output("\n\nYou insist that no price is too high.");
			output("\n\n<i>“You’re right. Submitting to me and my pleasure is worth more to you than your life. I could ask you to sign everything over to me and you wouldn’t say no, would you?”</i>");

			output("\n\nYou shake your head, salivating, eager to get started. [lane.HeShe] hands you the codex – and to your surprise, [lane.heShe]’s only charging you the standard one hundred credits. <i>“I’m a little kinder than that, though.”</i> You blink, and thank [lane.himHer] sincerely for [lane.hisHer] unprecedented generosity.");
			if (hasMaxedLaneHypnosis())
			{
				output(" <i>“Of course, this isn’t counting the ‘tax’ I’ll be charging you when we’re done.</i>");
			}

			output("\n\nYou thank [lane.himHer] for [lane.hisHer] ‘generosity’ again.");

			processTime(10);

			laneServicesMenu();
		}
	}
}

public function laneServicesMenu():void
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
	if (!hasMaxedLaneHypnosis()) addButton(14, "Back", laneServicesBack);
	else addButton(14, "Taxes", laneServicesBack);

	//[=Physique=] [=Reflexes=] [=Aim=] [=Intelligence=] [=Willpower=] [=Back=]
}

public function laneServicesBack():void
{
	clearOutput();
	laneHeader();
	if (!hasMaxedLaneHypnosis())
	{
		output("[lane.HeShe] frowns as you hand [lane.himHer] the codex. <i>“Changed your mind?”</i> You apologize, but you’re just not ready for [lane.hisHer] business today. <i>“Don’t worry, I understand. A lot of my customers, even the repeats, get the jitters sometimes. Is there anything else I can help you with, while you’re here?”</i>");

		// Return to main menu
		laneShowMenu();
	}
	else
	{
		if (pc.credits >= 100)
		{
			output("You glance up from the codex, your finger hovering teasingly over the confirmation button, when you hand it back to [lane.himHer]. [lane.HeShe] looks confused, before you tell [lane.himHer] that you’d like to skip the foreplay. [lane.HeShe] smiles and stands from [lane.hisHer] chair; [lane.heShe] crooks a claw at you, ordering you to follow, as [lane.heShe] leads you behind the curtain and to the left, towards [lane.hisHer] bedroom.");
		}
		else
		{
			output("You grin mischievously, returning [lane.hisHer] codex to [lane.himHer], and you tell [lane.himHer] that you just don’t have the funds. Is there, maybe, some other way you can compensate [lane.himHer] for [lane.hisHer] time and [lane.hisHer] effort? <i>“No.”</i> [lane.HeShe] looks at you rather sternly, and your attempts at being " + pc.mf("suave", "coy") + " quickly fall flat. <i>“Sex with you doesn’t pay for my bills, [pc.name]. Once we’re done here, you’re going out and you’re making some money, I don’t care how.”</i> Just as you slump in your chair, [lane.heShe] rises from [lane.hisHer]. <i>“But that doesn’t mean I</i> won’t <i>fuck you. Follow me.”</i> Giddy again, you rise from your seat, following [lane.himHer] like a horny dog as [lane.heShe] leads you into [lane.hisHer] bedroom.");
		}

		output("\n\nBy the time you enter behind your [lane.master], [lane.hisHer] shirt and pants have already been pulled off");
		if (lane.mf("m", "f") == "f") output(", letting her heavy breasts bounce free in the wind – not that they were especially well concealed to begin with");
		output(". [lane.HeShe] turns to you and, with a predatory grin, slides a claw across the fabric of [lane.hisHer] undergarment, tearing it away and revealing " + lane.mf("his throbbing, pointed cock. It’s halfway hard, and you lick your lips as you watch it slide free from his genital slit, inflating in length and in girth", "her wet, puffy cunt. Her genital slit is open and malleable, ready for you to play with; her labia waves at you, waiting for your pleasure") + ".");

		output("\n\n<i>“Strip naked,”</i> [lane.heShe] commands, opening [lane.hisHer] tassels wide, letting you absorb yourself into [lane.himHer]. You do as you’re commanded, with ease, excitement, and some flair, for [lane.hisHer] benefit. Naked, vulnerable, and horny, you’re completely at [lane.hisHer] mercy. The patterns on [lane.hisHer] tassels swirl in your vision, and you know you’re going to enjoy it.");

		// Go to Randomized sex
		clearMenu();
		addButton(0, "Next", payTheLaneTax);
	}
	processTime(10);
}

public function laneServicePhysique():void
{
	clearOutput();
	laneHeader();
	output("Before you sign your confirmation, you ask [lane.himHer] if [lane.heShe] could improve your strength. You know that’s more of a physical thing, but [lane.heShe] did say <i>anything</i>, after all. <i>“I sure can,”</i> [lane.heShe] says confidently. <i>“Other customers have asked me the same question. There is a limit to how hard you can push your body without appropriate work or training, of course, but many hurdles are strictly mental. I’ve had thin, spindly little things come to me, telling me that a ten pound barbell feels like a hundred, especially when they’re in a public place like a gym. With just a little bit of my work, you’ll be pushing past your limits and setting new ones within the hour.”</i>");

	output("\n\nLane certainly seems cool about it. Do you ask [lane.himHer] to improve your physique, by removing your inhibitions and your limits?");

	processTime(5);
	//[=Confirm=] [=Ehh...=]
	clearMenu();
	addButton(0, "Confirm", laneConfirmService, HYPNO_STAT_PHYS);
	addButton(1, "Maybe Not...", laneServiceMaybeNot);
}

public function laneServiceReflexes():void
{
	clearOutput();
	laneHeader();
	output("Before you sign your confirmation, you ask [lane.himHer] if [lane.heShe] could improve your reflexes. You’ve walked down enough streets, hiked through enough forests, and drank in enough shady bars to know that anything could get the jump on you at any time. <i>“Of course,”</i> [lane.heShe] says assuredly. <i>“You wouldn’t be the first adventurer I’ve had. I can sharpen each of your senses to be more in-tune with your surroundings: you’ll see, hear, and smell anything stalking you in the");
	//output(" sands of Venar");
	output(" wastes of Tarkus");
	output(" before they’d realize it. You’ll know exactly when you are and are not alone, and you’ll be able to react to it faster than you ever could before. I’ve been known to service more than one starship pilot, as well.”</i>");

	output("\n\nLane certainly seems sure of [lane.himHer]self. Do you ask [lane.himHer] to improve your reflexes, by attuning your senses to your environment?");

	processTime(5);
	//[=Confirm=] [=Ehh...=]
	clearMenu();
	addButton(0, "Confirm", laneConfirmService, HYPNO_STAT_REF);
	addButton(1, "Maybe Not...", laneServiceMaybeNot);
}

public function laneServiceAim():void
{
	clearOutput();
	laneHeader();
	output("Before you sign your confirmation, you ask [lane.himHer] if [lane.heShe] could improve your aim. In the modern world of weaponry and warfare, the better shot is usually the victor, and you want to be sure yours counts. <i>“You bet I can,”</i> [lane.heShe] says smugly. <i>“I can give you eyesight like... I believe you call it a ‘hawk’ on Terra? While I don’t exactly improve your eyes, I can help your mind process what it is you’re seeing faster than it ever could before. Shapes, velocity, momentum, and distance will become easier for you to discern, and your marksmanship will follow suit. Although... I have to ask. Is there a marksmanship competition coming up somewhere? I’ve had a customer asking the same thing for that reason, and when the judges found out, he was disqualified for having an unfair advantage.”</i>");

	output("\n\nYou tell [lane.himHer] that it’s purely personal, and [lane.heShe] nods, waving to [lane.hisHer] codex. Lane certainly seems secure about it. Do you ask [lane.himHer] to improve your aim, by sharpening your mental acuity?");

	processTime(5);
	//[=Confirm=] [=Ehh...=]
	clearMenu();
	addButton(0, "Confirm", laneConfirmService, HYPNO_STAT_AIM);
	addButton(1, "Maybe Not...", laneServiceMaybeNot);
}

public function laneServiceIntelligence():void
{
	clearOutput();
	laneHeader();
	output("Before you sign your confirmation, you ask [lane.himHer] if [lane.heShe] could improve your intelligence. You’re... you refuse to call yourself ‘dumb’, but you admit that, sometimes, you... aren’t exactly as ‘worldly’ as you’d like. Is there anything [lane.heShe] can do to help? <i>“That’s not a problem at all,”</i> [lane.heShe] insists gently. <i>“You’re not the first to want that changed about yourself, and you won’t be the last. I can’t exactly make you ‘smarter’, per se, but I can improve your memory by streamlining the way your conscious mind recalls thoughts. Those lessons you thought you doodled through in high school will come back to you as easily as recalling your fondest childhood moment. I’ve had college students come to me asking me about it, and my skills have helped them through many cram sessions.”</i>");

	output("\n\nLane certainly seems positive about it. Do you ask [lane.himHer] to improve your memory by, as [lane.heShe] put it, ‘streamlining’ how your conscious mind recalls lessons and memories?");

	processTime(5);
	//[=Confirm=] [=Ehh...=]
	clearMenu();
	addButton(0, "Confirm", laneConfirmService, HYPNO_STAT_INT);
	addButton(1, "Maybe Not...", laneServiceMaybeNot);
}

public function laneServiceWillpower():void
{
	clearOutput();
	laneHeader();
	output("Before you sign your confirmation, you ask [lane.himHer] if [lane.heShe] could improve your willpower. Sometimes, you feel a little too meek and shy for your own personal safety, and if exploring these planets and encountering their fauna has taught you anything, it’s that having the strength to say ‘no’ can be your strongest weapon sometimes. <i>“Easily,”</i> [lane.heShe] says surely. <i>“At least three times now, I’ve had wallflowers come up to me and confess that they don’t have the spine to ask a crush out to a date, or something, and if I could help them with that. There’s nothing special about giving you the strength of will: no improved mental acuity or overcoming mental barriers. All I’m doing is giving that little voice in your head, the voice that says what you</i> really <i>feel and what you</i> really <i>want, a helping hand.”</i>");

	output("\n\nLane certainly seems confident about it. Do you ask [lane.himHer] to improve your willpower, by helping your mouth say what your mind is really thinking?");

	processTime(5);
	//[=Confirm=] [=Ehh...=]
	clearMenu();
	addButton(0, "Confirm", laneConfirmService, HYPNO_STAT_WILL);
	addButton(1, "Maybe Not...", laneServiceMaybeNot);
}

public function laneServiceMaybeNot():void
{
	clearOutput();
	laneHeader();
	output("You frown, unsure about the whole thing, but you’re not quite ready to give the codex back to [lane.himHer]. You tap at the table as you consider what else you can ask [lane.himHer].");
	processTime(2);
	// Return to [=Services=] menu")
	laneServicesMenu();
}

public function laneConfirmService(selectedService:String):void
{
	clearOutput();
	laneHeader();

	pc.credits -= 100;

	if (hasMaxedLaneHypnosis() && flags["LANE_FULLY_HYPNOTISED"] == undefined)
	{
		laneFullyHypnotisesYouDumbshit();
		return;
	}

	if (flags["LANE_TIMES_HYPNOTISED"] == 0 || flags["LANE_TIMES_HYPNOTISED"] == undefined)
	{
		output("You sign your signature in the empty field and tap on the confirmation button. A loading bar appears on the codex, and then it beeps – followed by a beep from your own codex. You hand Lane back [lane.hisHer] as you check your own. The payment’s gone through without a hitch. <i>“Lovely!”</i> [lane.HeShe] stands, placing [lane.hisHer] codex in a drawer under [lane.hisHer] desk, twisting its lock shut and hiding the key in [lane.hisHer] transparent pants’ pocket. From another drawer, [lane.heShe] pulls out a ‘busy’ sign and lays it on the end of [lane.hisHer] table. <i>“Please follow me, [pc.name]. I have a room in the back where I work my magic.”</i>");

		output("\n\nYou follow [lane.himHer] as [lane.heShe] leads you behind the faint, airy curtains, barely hiding the second half of the room. [lane.HeShe] turns right and opens a door into another room of [lane.hisHer] hut, holding it open for you. The second room is much darker and warmer: there are no windows or lights; the only thing providing light is Lane’s glowing body. In the room are two plain, concrete chairs, but both of them are heavily dressed with soft, plump cushions and comfy, giving armrests. Four candles sit in a square around the two chairs, their smoke wafting the wax’s incense through the air and immediately assaulting your nostrils with their burning scent. They all sit on a round, featureless, but thick and plush carpet. The room is otherwise rather large and totally bare.");

		output("\n\n[lane.HeShe] shuts the door once you’re in, and you’re concealed in total darkness, except for the constant pulsing reds and blues of Lane’s body. [lane.HeShe] removes [lane.hisHer] shirt, bearing [lane.hisHer] exposed top to you");
		if (pc.isMischievous()) output(" – a rogue thought considers that maybe you’re getting a little extra for what you paid for");
		output(". [lane.HeShe] sees you looking at [lane.himHer] and [lane.hisHer] topless form curiously. <i>“My hypnosis relies on you having an uninterrupted line of vision with my body,”</i> [lane.heShe] explains, <i>“which means I have to go topless. It’s not going to go any farther than that, I promise, and you don’t have to take anything off yourself.”</i>");
	}
	else
	{
		output("You sign your signature in the empty field and tap on the confirmation button. The two familiar beeps between [lane.hisHer] codex and yours ring out, and you know the funds have transferred properly. With practiced ease, [lane.heShe] slides [lane.hisHer] codex away and places [lane.hisHer] ‘busy’ sign on the end of [lane.hisHer] table. <i>“Follow me, [pc.name],”</i> [lane.heShe] instructs, leading you through [lane.hisHer] hut and into [lane.hisHer] hypnosis room.");

		output("\n\nWhen [lane.heShe] shuts the door behind you, it’s as dark as you remember it. The incense from the candles greets your nose, and already you feel yourself relaxing, your legs becoming languid as you walk. You turn to Lane, watching [lane.himHer] remove [lane.hisHer] top");
		if (hasLaneHypnosis()) output(", your eyes lingering on the smoothness of [lane.hisHer] skin for a little longer than you mean");
		output(", and then [lane.heShe] walks past you, towards [lane.hisHer] seat");
		if (laneHypnosisLevel() >= 3) output(". Your eyes glue to [lane.himHer], trailing themselves from the ridges of [lane.hisHer] shoulders to where [lane.hisHer] tail meets the small of [lane.hisHer] back....");
		else output(".");
	}

	output("\n\n");
	if (!pc.isTaur()) output("[lane.HeShe] takes the farther seat, and wordlessly invites you to take the one across from [lane.himHer].");
	else output("[lane.HeShe] picks up the closest seat and sets it aside, leaving you to sit on your haunches on the carpet.");
	output(" <i>“First, I want you to close your eyes.”</i> You do so, blocking what little vision you had of the room. The only thing you see is the dull pulse of [lane.hisHer] body through your eyelids.");

	output("\n\n<i>“Breathe deep through your nose. Focus on what you’re experiencing. Let it calm your body.”</i> You breathe deep, inhaling the smoky incense – a plethora of spices and scents fill your nose, combining to smell like everything they are and not anything at all, somehow. As your thoughts linger on the scents,");
	if (!pc.isTaur()) output(" your body sinks into the comfort of the chair: your arms slack on the rests and your neck begins to roll your head slightly.");
	else output(" your body sinks into the comfort of the carpet: your arms begin to go slack and your body feels as though it’s sinking into the floor, in a pleasant way.");

	output("\n\n<i>“Now, focus on my voice,”</i> says Lane. <i>“Listen to my words, but</i> feel <i>for my voice. Let my voice into your ears, into your mind. Don’t worry about where I am. Don’t worry about where my voice is coming from. Don’t worry about anything.”</i> Lane’s voice seems to come from everywhere all at once, but at the same time, it feels as though [lane.hisHer] voice is coming from somewhere very close by. With every word [lane.heShe] says, your chest thrums in vibration, as though [lane.heShe]’s speaking through you.");

	output("\n\nEven with all of these sensations combined, though, you don’t really feel ‘hypnotized’. You still feel in control of your conscious thought. Still, if only to get the most for your money, you follow along with Lane’s commands. <i>“Now, I want you to open your eyes. Don’t force them open. Just let them.”</i> You try to follow [lane.hisHer] command, and you ‘let’ your eyes open....");

	output("\n\nYour vision is assaulted with Lane’s glowing, luminescent body. [lane.HisHer] tassels are wide open, where [lane.hisHer] coursing blood glows the brightest. With every heartbeat of [lane.hisHer], you see [lane.hisHer] red blood flow all throughout [lane.hisHer] neck, tassels, face, " + lane.mf("chest", "breasts") + ", through [lane.hisHer] arms, over [lane.hisHer] stomach, before disappearing underneath [lane.hisHer] undergarments and blurring beneath [lane.hisHer] translucent pants. [lane.HisHer] pulse has taken a rather peculiar rhythm, beating twice quickly, then pausing, flooding your vision with bursts of red and a stream of blue, repeating again and again.");

	output("\n\nYour eyes open wider of their own accord as you absorb [lane.himHer]. Adorned across the inside of [lane.hisHer] tassels are a number of black tattoos with swirling, almost tribal designs on them, and all throughout the skin of [lane.hisHer] membranes are light, glassy piercings. As [lane.hisHer] blood beats through [lane.himHer], they mingle with the tattoos and their light bounces all throughout the glass of [lane.hisHer] piercings: the lights distract your focus, and every time you move your eyes between them, the tattoos on [lane.himHer] begin to swirl with each other in the corners of your eyes. With every movement your eyes make, the coursing blood, the bright trinkets pierced to Lane’s skin, and the moving tattoos draw you deeper and deeper into a trance – into <i>[lane.himHer]</i>.");

	output("\n\n<i>“Watch the swirling lights,”</i> [lane.heShe] says, but you barely need the instruction. Lane begins to say a lot of other things, but you’ve lost your attention. Your senses begin to overcome your consciousness: your nostrils begin to pick out every individual smell with every breath, and your eyes soon start seeing new shapes and motions that hadn’t existed before. Your mind is completely on autopilot: you’re aware of every sight, every smell, and every vague command Lane tells you, but you barely register them as thoughts. Soon, even your thoughts are leaving you, and you become nothing but a blank slab of a person for Lane to mold and shape as [lane.heShe] likes. [lane.HeShe] tells you that’s okay, and that becomes <i>your</i> thought, <i>your</i> decision.");

	output("\n\nYou’re left hanging limp in Lane’s control. [lane.HeShe] says some other things to you, and they become your thoughts for only a moment before they’re lost in the ether that is your blank consciousness. [lane.HisHer] words become your own, and that’s okay. Your eyes hurt, and you remember to blink – no, Lane reminds you to blink – no, <i>you</i> remember to blink.");

	output("\n\nLane watches you, completely enthralled and under [lane.hisHer] spell. Your mouth is dry, and you swallow – no, Lane tells you to swallow – no, <i>you</i> swallow, it was a thought you had. [lane.HeShe] takes a deep breath, remaining calm in [lane.hisHer] seat. Confident that you’re deep enough under [lane.hisHer] spell, [lane.heShe] begins the work you paid [lane.himHer] to do.");

	processTime(30);
	clearMenu();
	addButton(0, "Next", laneApplyService, selectedService);
}

public function laneApplyService(selectedService:String):void
{
	clearOutput();
	laneHeader();

	switch (selectedService)
	{
		case HYPNO_STAT_PHYS:
			output("<i>“You feel strength like you’ve never known before course through you,”</i> [lane.heShe] says smoothly. <i>“What was your limit yesterday is your warm-up today. You have the stability to lift any weight; the endurance to run any distance; the strength to defeat any foe. You are as physically capable as you have ever been. You are a fountain, a geyser, of strength: when you think you can not, you will try, and you </i>will<i>.”</i>");
			break;

		case HYPNO_STAT_REF:
			output("<i>“You are constantly aware of your surroundings,”</i> [lane.heShe] begins. <i>“No sound escapes your perfect ears; no smell escapes your sensitive nose; and no sight escapes your sharp eyes. You can feel the");
			//output(" sand");
			output(" ground");
			output(" beneath");
			if(pc.isBiped() && pc.hasFeet()) output(" the shoes on");
			output(" your [pc.feet] and you can hear the heartbeat of another creature. You know exactly where everything around you is at all times. You can respond to changes around you with perfect precision. Nothing can escape you. Nothing can approach you.”</i>");
			break;

		case HYPNO_STAT_AIM:
			output("<i>“Your mind is clear as a crystal,”</i> [lane.heShe] instructs. <i>“What your eyes see, your mind can react to. Your weapon is as much an extension of you as your arm holding it. Hitting your target is as natural as blinking and breathing. You can account for motion; velocity; acceleration; wind resistance; distance. There is nothing between you and your target. If your weapon is drawn and your target is not struck, it is because that is what you choose.”</i>");
			break;

		case HYPNO_STAT_INT:
			output("<i>“You have no forgotten memory,”</i> [lane.heShe] tells you. <i>“Every lesson is recalled. Every tidbit is remembered. Every trivia is retained. You remember every plant you were taught to avoid. You remember how to combat every species. Every mistake is recollected and learned from. You are knowledgeable with every scenario, every possibility, because you have learned from them before. Yet, your focus is linear. You do not consider anything that does not need considering.”</i>");
			break;

		case HYPNO_STAT_WILL:
			output("<i>“You are as rigid as a stone,”</i> [lane.heShe] says sternly. <i>“As rooted as a tree. You will not sway. You will not bend. Yours is your will alone. Nobody else will impose theirs upon you. You will not compromise. You will not fall for petty tricks; you cannot be deceived. You will not let any action you take, any course you choose, be altered by someone else’s hand. You will take what you want, and you will not give what is not anyone else’s to take.”</i>");
			break;

		default:
			throw new Error("Couldn’t match stat selection.");
			break;
	}

	output("\n\n[lane.HeShe] continues reinforcing those sorts of commands for a few minutes. You are completely and utterly absorbed by [lane.himHer] and the way [lane.heShe] overloads each of your senses: everything [lane.heShe] says becomes your thoughts, since you don’t have any of your own, so absorbed are you in the lights and patterns and smells around you. You are a liquid, and [lane.hisHer] words are the container you take the shape of as you’re poured into it.");

	output("\n\n<i>“You will forget all of my previous instructions after twenty-four Terran hours,”</i> [lane.heShe] says, wrapping up [lane.hisHer] session with you. <i>“It will be as though we had never had this session. You will know to return to me, but you will do it at your leisure; you will not feel you must. When I close my tassels, [pc.name], we will return to my desk in the front room, and you will awaken.”</i> [lane.HeShe] reinforces those statements for another minute.");

	// If addHynosisEffect returns true, it's the second time in a 24 hour period the player has used his services.
	// Basically just a shortcut to checking hasLaneHypnosis()
	if (addHypnosisEffect(selectedService))
	{
		var msgs:Array = [];

		if (laneHypnosisLevel() == 0)
		{
			msgs = 
			[
				"Lane bites [lane.hisHer] lip, [lane.hisHer] eyes roaming your body as you sit there, enthralled by [lane.himHer]. <i>“You...”</i> [lane.heShe] says softly, unsure with [lane.himHer]self. <i>“You do not mind Lane’s company. You like speaking with [lane.himHer].”</i> [lane.HeShe] reinforces that several more times, before [lane.heShe] sheepishly stops.",
				"Lane bites [lane.hisHer] lip, [lane.hisHer] eyes roaming your body as you sit there, enthralled by [lane.himHer]. <i>“You...”</i> [lane.heShe] says softly, unsure with [lane.himHer]self. <i>“You do not mind the way Lane looks. [lane.HeShe] is easy on your eyes.”</i> [lane.HeShe] reinforces that several more times, before [lane.heShe] sheepishly stops.",
				"Lane bites [lane.hisHer] lip, [lane.hisHer] eyes roaming your body as you sit there, enthralled by [lane.himHer]. <i>“You...”</i> [lane.heShe] says softly, unsure with [lane.himHer]self. <i>“You will recommend Lane to your friends and coworkers. You believe [lane.heShe] does a good job.”</i> [lane.HeShe] reinforces that several more times, before [lane.heShe] sheepishly stops.",
				"Lane bites [lane.hisHer] lip, [lane.hisHer] eyes roaming your body as you sit there, enthralled by [lane.himHer]. <i>“You...”</i> [lane.heShe] says softly, unsure with [lane.himHer]self. <i>“You find Lane mildly attractive. For a Daynar.”</i> [lane.HeShe] reinforces that several more times, before [lane.heShe] sheepishly stops.",
				"Lane bites [lane.hisHer] lip, [lane.hisHer] eyes roaming your body as you sit there, enthralled by [lane.himHer]. <i>“You...”</i> [lane.heShe] says softly, unsure with [lane.himHer]self. <i>“You like the way Lane keeps [lane.hisHer] business. You find [lane.himHer] to be professionally approachable.”</i> [lane.HeShe] reinforces that several more times, before [lane.heShe] sheepishly stops."
			];
		}
		else if (laneHypnosisLevel() == 1)
		{
			msgs = 
			[
				"Lane hums to [lane.himHer]self as [lane.heShe] looks at you, seeing you so open to [lane.himHer] and [lane.hisHer] suggestions. [lane.HeShe] stutters, unsure if [lane.heShe] should proceed, but [lane.heShe] does. <i>“You like Lane. You think you’ll visit [lane.himHer] more often, and not just for [lane.hisHer] business.”</i> [lane.HeShe] reinforces that several more times, and then stops [lane.himHer]self.",
				"Lane hums to [lane.himHer]self as [lane.heShe] looks at you, seeing you so open to [lane.himHer] and [lane.hisHer] suggestions. [lane.HeShe] stutters, unsure if [lane.heShe] should proceed, but [lane.heShe] does. <i>“Your opinion of the Daynar is improved because of Lane. You enjoy their company and believe them to be a friendly, understanding species.”</i> [lane.HeShe] reinforces that several more times, and then stops [lane.himHer]self.",
				"Lane hums to [lane.himHer]self as [lane.heShe] looks at you, seeing you so open to [lane.himHer] and [lane.hisHer] suggestions. [lane.HeShe] stutters, unsure if [lane.heShe] should proceed, but [lane.heShe] does. <i>“You think Lane is reasonably attractive. [lane.HeShe] is a " + lane.mf("handsome", "beautiful") + " Daynar.”</i> [lane.HeShe] reinforces that several more times, and then stops [lane.himHer]self.",
				"Lane hums to [lane.himHer]self as [lane.heShe] looks at you, seeing you so open to [lane.himHer] and [lane.hisHer] suggestions. [lane.HeShe] stutters, unsure if [lane.heShe] should proceed, but [lane.heShe] does. <i>“You like the way Lane looks at you. You think it’s cute.”</i> [lane.HeShe] reinforces that several more times, and then stops [lane.himHer]self.",
				"Lane hums to [lane.himHer]self as [lane.heShe] looks at you, seeing you so open to [lane.himHer] and [lane.hisHer] suggestions. [lane.HeShe] stutters, unsure if [lane.heShe] should proceed, but [lane.heShe] does. <i>“You consider Lane to be a dependable business" + lane.mf("", "wo") + "man and a good friend. You wonder if Lane could be more to you.”</i> [lane.HeShe] reinforces that several more times, and then stops [lane.himHer]self."
			];
		}
		else if (laneHypnosisLevel() == 2)
		{
			msgs =
			[
				"Lane chews at [lane.hisHer] lip and [lane.hisHer] claw tacks on [lane.hisHer] chair. You’re so vulnerable, so malleable; [lane.heShe] begins to rub [lane.hisHer] knees together sensually as [lane.heShe] looks at you. <i>“You think Lane is sexy. You often fantasize about [lane.himHer] when you’re by yourself.”</i> [lane.HeShe] reinforces that statement several more times, before [lane.heShe] forces [lane.himHer]self to stop.",
				"Lane chews at [lane.hisHer] lip and [lane.hisHer] claw tacks on [lane.hisHer] chair. You’re so vulnerable, so malleable; [lane.heShe] begins to rub [lane.hisHer] knees together sensually as [lane.heShe] looks at you. <i>“You find yourself compelled to talk about Lane to your friends. You want to promote [lane.hisHer] business as much as you can.”</i> [lane.HeShe] reinforces that statement several more times, before [lane.heShe] forces [lane.himHer]self to stop.",
				"Lane chews at [lane.hisHer] lip and [lane.hisHer] claw tacks on [lane.hisHer] chair. You’re so vulnerable, so malleable; [lane.heShe] begins to rub [lane.hisHer] knees together sensually as [lane.heShe] looks at you. <i>“You sometimes wonder what Lane looks like beneath the rest of [lane.hisHer] clothing.”</i> [lane.HeShe] reinforces that statement several more times, before [lane.heShe] forces [lane.himHer]self to stop.",
				"Lane chews at [lane.hisHer] lip and [lane.hisHer] claw tacks on [lane.hisHer] chair. You’re so vulnerable, so malleable; [lane.heShe] begins to rub [lane.hisHer] knees together sensually as [lane.heShe] looks at you. <i>“You have an urge, an itch, to taste Lane. You resist, with some effort.”</i> [lane.HeShe] reinforces that statement several more times, before [lane.heShe] forces [lane.himHer]self to stop.",
				"Lane chews at [lane.hisHer] lip and [lane.hisHer] claw tacks on [lane.hisHer] chair. You’re so vulnerable, so malleable; [lane.heShe] begins to rub [lane.hisHer] knees together sensually as [lane.heShe] looks at you. <i>“You want to touch Lane, to feel along the smoothness of [lane.hisHer] front scales. You want to touch [lane.himHer] everywhere, in a sensual way.”</i> [lane.HeShe] reinforces that statement several more times, before [lane.heShe] forces [lane.himHer]self to stop."
			];
		}
		else if (laneHypnosisLevel() >= 3)
		{
			msgs = 
			[
				"Lane splays [lane.hisHer] legs. Now that the business is done, [lane.heShe] can proceed with the pleasure. [lane.HeShe] openly begins to rub at [lane.himHer]self, enjoying the way [lane.heShe]’s displaying [lane.himHer]self to you and you’re too brainwashed to even notice. <i>“You can’t get enough of Lane. You want to visit [lane.himHer] every day to hypnotize you. You love the way [lane.heShe] controls you.”</i> When [lane.heShe] finally stops reinforcing that statement, [lane.heShe]’s spent more time hypnotizing you for [lane.himHer]self than [lane.heShe] has doing what you paid [lane.himHer] for.",
				"Lane splays [lane.hisHer] legs. Now that the business is done, [lane.heShe] can proceed with the pleasure. [lane.HeShe] openly begins to rub at [lane.himHer]self, enjoying the way [lane.heShe]’s displaying [lane.himHer]self to you and you’re too brainwashed to even notice. <i>“You think Lane is the sexiest creature you’ve ever seen. Nothing and nobody else excites you the way Lane does.”</i> When [lane.heShe] finally stops reinforcing that statement, [lane.heShe]’s spent more time hypnotizing you for [lane.himHer]self than [lane.heShe] has doing what you paid [lane.himHer] for.",
				"Lane splays [lane.hisHer] legs. Now that the business is done, [lane.heShe] can proceed with the pleasure. [lane.HeShe] openly begins to rub at [lane.himHer]self, enjoying the way [lane.heShe]’s displaying [lane.himHer]self to you and you’re too brainwashed to even notice. <i>“Every time you see Lane, you fantasize about " + lane.mf("his cock and what it’ll take to get him to use it on you", "her cunt and what it would be like to finally taste her") + ".”</i> When [lane.heShe] finally stops reinforcing that statement, [lane.heShe]’s spent more time hypnotizing you for [lane.himHer]self than [lane.heShe] has doing what you paid [lane.himHer] for.",
				"Lane splays [lane.hisHer] legs. Now that the business is done, [lane.heShe] can proceed with the pleasure. [lane.HeShe] openly begins to rub at [lane.himHer]self, enjoying the way [lane.heShe]’s displaying [lane.himHer]self to you and you’re too brainwashed to even notice. <i>“You can no longer imagine life without Lane. Your days aren’t complete without worshiping [lane.himHer] by giving [lane.himHer] your body to mold.”</i> When [lane.heShe] finally stops reinforcing that statement, [lane.heShe]’s spent more time hypnotizing you for [lane.himHer]self than [lane.heShe] has doing what you paid [lane.himHer] for.",
				"Lane splays [lane.hisHer] legs. Now that the business is done, [lane.heShe] can proceed with the pleasure. [lane.HeShe] openly begins to rub at [lane.himHer]self, enjoying the way [lane.heShe]’s displaying [lane.himHer]self to you and you’re too brainwashed to even notice. <i>“Lane turns you on so much that each day " + lane.mf("he doesn’t bend you over his desk and take your ass, body, and soul with his cock", "she doesn’t throw you to the ground and claim you as hers with her sweet, sexy cunt") + " is a day that is wasted.”</i> When [lane.heShe] finally stops reinforcing that statement, [lane.heShe]’s spent more time hypnotizing you for [lane.himHer]self than [lane.heShe] has doing what you paid [lane.himHer] for."
			];
		}

		output("\n\n" + msgs[rand(msgs.length)]);
	}

	processTime(30);

	clearMenu();
	addButton(0, "Next", lanePostApplyEffect, selectedService);
}

public function lanePostApplyEffect(selectedService:String):void
{
	clearOutput();
	laneHeader();

	output("You awaken with a bit of a start. You’re a little dizzy; you’re seeing stars in your eyes and your ears are ringing and your nose is itchy. And yet... you feel amazing. You’re back at the desk in the front room, sitting in the same chair, and Lane is across from you, smiling confidently. <i>“How do you feel?”</i> [lane.heShe] asks you.");

	output("\n\nYou admit that you’re mostly confused. The last thing you remember is being in Lane’s ‘hypnosis room’, following [lane.hisHer] instructions, but then... nothing, and now you’re back at [lane.hisHer] desk. And yet");
	switch (selectedService)
	{
		case HYPNO_STAT_PHYS:
			output(" your body feels stronger, tighter... you feel as though there are no obstacles that you can’t overcome, if you just put in a little effort. You’re half tempted to start running, for the sake of it. <b>Your body has never felt better!</b>");
			break;

		case HYPNO_STAT_REF:
			output(" your senses all feel so fine-tuned... you can hear Lane’s heartbeat and you can feel the subtle changes in the air pressure as the breeze flows outside the building. A buzzing flits across your ear, and you turn – and you see a common fly buzzing around just beyond the door. You had heard something so small from so far away before you could see it. <b>Your reflexes are better than ever!</b>");
			break;

		case HYPNO_STAT_AIM:
			output(" your eyesight has never been better: you’re seeing objects and details with a sort of clarity you had never thought possible before. You can make out every speck of dust flitting through the air between you and Lane, and, if you squint, you can make out the individual swirls and marks, like fingerprints, on [lane.hisHer] scales. [lane.HeShe] blinks, and you can see [lane.hisHer] pupil dilate just slightly from it. <b>Your aim is better than ever!</b>");
			break;

		case HYPNO_STAT_INT:
			output(" this very situation reminds you of this one time you were being quizzed in middle school. You remember the teacher, your classmates, and the class so perfectly... you even remember the quiz, and each of its questions, and more importantly, each of their answers. <b>Your intelligence is better than ever!</b>");
			break;

		case HYPNO_STAT_WILL:
			output(" you have this urge to start chewing Lane out, demanding to know what [lane.heShe]’s done to you, and you’re not leaving without a satisfying answer. You tell [lane.himHer] exactly what you’re thinking, and [lane.heShe] only smiles in response – and you reel, surprised at yourself and that sudden, willful outburst. <b>Your willpower is stronger than ever!</b>");
			break;
		
		default:
			throw new Error("Couldn’t match selected service.");
			break;
	}

	if (!hasMaxedLaneHypnosis() || flags["DELAY_TAXES_ADDITION"] == undefined)
	{
		if (hasMaxedLaneHypnosis()) flags["DELAY_TAXES_ADDITION"] = 1;
		
		output("\n\nYou sit and look at your hands. It was a strange, difficult-to-explain sensation: you knew you were different, but you didn’t really <i>feel</i> different. At the same time, you felt different, but you didn’t know if you really <i>were</i> different. Lane definitely did something to you, and whatever it was [lane.heShe] did, you like it. You tell [lane.himHer] as much, and [lane.heShe] claps [lane.hisHer] four-fingered hands together. <i>“I’m happy that you’re happy with the results, [pc.name],”</i> [lane.heShe] tells you.");
		if (flags["LANE_TIMES_HYPNOTISED"] <= 1) output(" <i>“I hope this changes your perception on hypnotism.”</i> You tell [lane.himHer] that it definitely does, and that you’ll be coming back for [lane.hisHer] service sometime in the future. You even ask [lane.himHer] if you could sign [lane.hisHer] guestbook, to give [lane.himHer] another testimonial to add to [lane.hisHer] collection, and [lane.heShe] happily hands you [lane.hisHer] codex.");

		output("\n\nYou thank [lane.himHer] for [lane.hisHer] work again, and you leave [lane.hisHer] little hut, ready to tackle the day with the new and improved you.");

		if (flags["HAS_HAD_LANE_HYPNOSIS"] == 1)
		{
			if (laneHypnosisLevel() == 0) output("\n\nAs you leave [lane.hisHer] hut, your thoughts linger on Lane just a little while longer. [lane.HeShe]’s certainly an all right sort. You wouldn’t mind having a drink with [lane.himHer] sometime later, or something.");
			else if (laneHypnosisLevel() == 1) output("\n\nYou’ve been getting rather friendly with Lane lately, and [lane.heShe] holds [lane.himHer]self very professionally... and, you decide, [lane.heShe]’s a bit of a looker. For a bipedal lizard-person. You consider asking [lane.himHer] out to dinner sometime, to get to know [lane.himHer] outside of [lane.hisHer] profession.");
			else if (laneHypnosisLevel() == 2) output("\n\nYou spare a look back at [lane.hisHer] hut as you leave. Just... something <i>about</i> Lane really pushes all your kinky buttons. You idly fantasize about what it’d be like to get into bed with a sexy Daynar like [lane.himHer]self...");
			else output("\n\nYou can’t seem to get that sexy lizard off your mind as you leave [lane.hisHer] hut. Images of yourself at [lane.hisHer] knees, servicing [lane.himHer] like [lane.heShe] was your " + lane.mf("king", "queen") + " and it was your privilege, assault your mind, and you gladly let them. You’re itching to march right back in there and throw yourself at [lane.himHer], demanding [lane.heShe] take you then and there, but, after some struggle, you keep walking. You have other things that need doing.");
		}
		
		// Place PC one square outside of Lane’s Plane
		clearMenu();
		addButton(0, "Next", move, "287");
	}
	else
	{
		output("\n\nYou’re happy that Lane, righteous and generous as [lane.heShe] is, kept up [lane.hisHer] end of the bargain and gave you what you paid for. But another part of you is ecstatic about what’s going to happen next. You thank [lane.himHer] for [lane.hisHer] continued excellence, and that, if [lane.heShe]’s ready, you’re prepared to pay [lane.himHer] your ‘taxes’ for the privilege of being [lane.hisHers] to own.");

		output("\n\n[lane.HeShe] smiles and stands. You stand with [lane.himHer], and with a deft, swift hand, [lane.heShe] grabs you by the collar of your [pc.armor] and pulls you in for an aggressive, dominant kiss. You melt into [lane.himHer], opening your mouth and inviting your [lane.master]’s tongue to play with your own. [lane.HeShe]’s grabbing at you roughly and possessively as [lane.heShe] suffocates you with [lane.hisHer] lips and [lane.hisHer] tongue, guiding you across the desk and to the curtains hiding the second half of the room.");

		output("\n\n[lane.HeShe] finally lets you go as [lane.heShe] opens [lane.hisHer] eyes and [lane.hisHer] tassels wide at you, letting you fall into [lane.himHer] a second time. Your body sinks");
		if (pc.hasCock() && !pc.hasVagina()) output(" but [pc.eachCock] rises");
		else if (pc.hasVagina() && !pc.hasCock()) output(" and your [pc.eachVagina] slickens");
		else if (pc.hasVagina() && pc.hasCock()) output(" as [pc.eachCock] fights with [pc.eachVagina] for your blood flow, your attention, and your hopes");
		else output(" as you lick your [pc.lips] and your [pc.ass] clenches");
		output(" while you consciously fall deeper into [lane.hisHer] control, but [lane.heShe] doesn’t let you zone out like before.");

		output("\n\n[lane.HeShe] leads you to [lane.hisHer] bedroom, across from [lane.hisHer] hypnosis room, and as soon as [lane.heShe] shuts the door behind you, [lane.heShe]’s stripped of both [lane.hisHer] airy shirt and [lane.hisHer] flowing pants, leaving [lane.himHer] with only [lane.hisHer] underwear. " + lane.mf("The unmistakable bulge of his delicious, virile Daynarian cock pushes against the stubborn fabric, outlining the trail of his meat from his tip to his base, and it only gets more pronounced with each heartbeat.", "A small damp patch is clearly visible between the cleavage of her legs, but more than that, the musky scent of her needy, demanding sex penetrates the air, and your nostrils, with ease.") + " Your fingers fidget as you imagine just how Lane is going to use you today.");

		output("\n\n<i>“Strip naked,”</i> [lane.heShe] commands, and you do so with ease and without any flair, eager to just get right to servicing your " + lane.mf("master", "mistress") + " once more. Soon, your [pc.armor] is discarded to a pile in the corner, and you’re left as naked as Lane is, once [lane.heShe] removes [lane.hisHer] undergarment, bearing all of [lane.himHer]self to you once more.");

		output("\n\nAnd to think, you used to hate doing your taxes.");
		// Go to Randomized sex
		clearMenu();
		addButton(0, "Next", payTheLaneTax);
	}

	processTime(20);
}

public function payTheLaneTax():void
{
	clearOutput();

	var availScenes:Array = [];

	if (lane.mf("m", "f") == "m")
	{
		IncrementFlag("LANE_MALE_SEXED");
		
		availScenes.push(suckLanesDick);
		availScenes.push(fuckedByMaleLane);
		if (pc.hasCock() || !pc.hasVagina()) availScenes.push(firstTimeLaneMPCM);
		if (pc.hasVagina()) availScenes.push(firstTimeLaneMPCFH);
	}
	else
	{
		IncrementFlag("LANE_FEMALE_SEXED");
		
		availScenes.push(munchLanesCarpet);
		availScenes.push(fuckedByFemLane);
		if (pc.hasCock()) availScenes.push(firstTimeLaneFPCMH);
		if (!pc.hasCock()) availScenes.push(firstTimeLaneFPCFGenderless);
	}

	availScenes[rand(availScenes.length)]();
}

public function laneSexSelection():void
{
	var availScenes:Array = [];

	if (lane.mf("m", "f") == "m")
	{
		IncrementFlag("LANE_MALE_SEXED");

		if (pc.hasCock() || !pc.hasVagina()) availScenes.push(firstTimeLaneMPCM);
		if (pc.hasVagina()) availScenes.push(firstTimeLaneMPCFH);
	}
	else
	{
		IncrementFlag("LANE_FEMALE_SEXED");

		if (pc.hasCock()) availScenes.push(firstTimeLaneFPCMH);
		if (!pc.hasCock()) availScenes.push(firstTimeLaneFPCFGenderless);
	}

	availScenes[rand(availScenes.length)]();
}

public function suckLanesDick():void
{
	clearOutput();
	laneHeader(true);

	output("Lane walks past you and sits on the edge of his large bed, his cock pointing towards the ceiling. <i>“I want to feel your [pc.lips] on me,”</i> he says, taking your hand and insistently pulling you towards him. <i>“I want you to swallow my cock and tell me how much better Daynarian cum tastes compared to anyone else’s.”</i>");

	output("\n\nYou admit that that’s a pretty hot idea, and you eagerly sink to your [pc.knees], levelling yourself with his dick. It’s long, thin, and tapered; it has no visible bumps or veins anywhere on it, its skin thick and smooth as could be. His genital slit, normally hard and rough, clings to the base of it wetly and is easily malleable between your fingers.");

	output("\n\nYou test the waters by wrapping your fingers around it, feeling its heat and its pulse. It’s slimy; he’s not leaking with pre yet, so you’re not sure with what. It’s about six inches long");
	if (pc.hasCock() && pc.biggestCockLength() >= 7) output(" – you’ve seen longer, but you know it’s not a competition");
	output(", and it’s thin: you can easily wrap your fingers all the way around it, and then some. Yet, with every pulse, you can feel it getting just <i>slightly</i> thicker.");

	output("\n\nYou pump your hand up and down his length gently, savoring its feel and the way you make your master sigh in delight and jerk his hips involuntarily. Your palm gets soaked in whatever juice was keeping his nice, warm dick all wet and ready for you. Its smell is alien to you: hardly repugnant, but the pheromones are a bit weak and grainy.");

	output("\n\nYou feel Lane’s hand on your scalp, massaging you as you work him. You lean in close, getting your [pc.face] right up against the skin of his penis. You feel its heat wash over your nose and Lane quivers every time your breath washes over his crotch. You love teasing your master, taunting him with the service he wants as you slide your hand from the pointed tip to the thick base, his groans sinful music to your ears. He, however, has enough, and insistently pushes on you towards his dick.");

	output("\n\nLicking your [pc.lips], you glide your moist hand up and down his pole twice more, and then you replace it with your mouth. You barely open your mouth wide enough for his already thin tip, and suck it in, clamping tightly on the head of his penis. That doesn’t do much for him, though, and you know that; Daynarian penises get more sensitive towards the base, unlike most other species.");

	output("\n\nThe taste on your [pc.tongue] is delicious, knowing it’s your master. You lick and lap at the opening of his penis, trying to coax out anything to play with, but he’s being stubborn. As your lips maintain their suction, you can better feel Lane’s unique cock as it expands against you, prying your lips apart with every other pulse. You trail your eyes from his pelvis, across his stomach, up his chest, and innocently into his eyes as you lower yourself ever so slowly.");

	output("\n\nHe grins back down at you and grips tighter onto your [pc.hair]. He shows amazing restraint, keeping from thrusting into your throat and taking what he wants; rather, he lets you go at your teasing pace as you slide down his meat, tasting and examining every nuance with your [pc.tongue]. He slides past your teeth and across the flat of your tongue, crawling deeper and deeper into your mouth.");

	output("\n\nWithout breaking eye contact, you come to his base. He grunts in appreciation as your lips slide over those hot nerve endings. You stay there, holding your breath, letting his taste conquer your mouth and letting you imprint on his taste. It grows thicker and thicker with each passing second; already it’s maybe twice the thickness of when it started, and you know it’s not about to stop.");

	output("\n\nYou feel a small drop of his pre on your tongue before you taste it. It tastes just like his dick, conveniently enough, but stronger. Back down you go, kissing the skin that melds with his penis, making him sigh out in pleasure. Another drop is waiting for you when you get back to the top.");

	output("\n\nYou settle into a faster rhythm, for his benefit, and he moans out in appreciation. <i>“You’re a good cocksucker,”</i> he compliments. <i>“You know just what I like. Not too fast...”</i> You smile, his dick splitting your [pc.lips] wider and wider. Every time you sink down, his penis tickles the roof of your mouth and delights your [pc.tongue]; every retreat leaves you both breathless for more.");

	if (pc.hasTongueFlag(GLOBAL.FLAG_HOLLOW))
	{
		output("\n\nOne of the advantages of having a new, hollow tongue, is giving amazing blowjobs with it – or, so you’ve ever fantasized, but you figure now would be a good time to try. You pull all the way back from Lane, to his confusion, so you can line up your shot. It takes you a second to feel it out, but once you’ve got it, you slide your [pc.tongue] all the way down, slowly.");

		output("\n\nLane visibly shivers as your warm, wet tongue sucks him up, massaging his every nerve with your tastebuds. His pulse beats off-sync with yours; you contract and convulse your tongue, doing your best to simulate a vagina for his benefit, and it seems to work. <i>“Ooooh, that’s new,”</i> he coos, and he tightens his grip on your head.");

		output("\n\nYou lower yourself all the way down his shaft, until you connect to his skin, and start to kiss and stroke his base with your [pc.lips] while your tongue undulates around the rest of his cock. The sensations cause his heartbeat to quicken and his hips to thrust upward impishly; you smile, taking your own pleasure from pleasing your master so well.");
	}

	if (pc.biggestTitSize() >= 3 && pc.biggestTitSize() <= 14)
	{
		output("\n\n<i>“Let me feel those tits of yours,”</i> he commands, and you’re all too happy to comply. You draw your mouth up and up until you, with some reluctance, pull away from him completely, leaving his wet cock to the cold air between you. You don’t leave it alone for too long: you lean forward, wrapping your [pc.chest] around his meat, giving it a cushy new home to dwell in.");

		output("\n\nPressing your tits together, you begin gently rocking yourself up and down his length.");
		if (pc.biggestTitSize() <= 7) output(" You see the tip of it poke up from between your heaving boobs, slathering your own spit into your cleavage, the cumslit slightly dilated with precum and promises of more if you keep it up.");
		if (pc.biggestTitSize() >= 8 && pc.biggestTitSize() <= 14) output(" The only guarantee that his cock is still between your mammoth boobs is the warm feel of it splitting your cleavage and slathering you with your own spit. You occasionally feel a warm bead of liquid spurt out and add to the mess, with promises of more if you keep it up.");

		output("\n\nYou lean your head down");
		if (pc.biggestTitSize() >= 8 && pc.biggestTitSize() <= 14) output(", searching for his dick in the deep, sweaty valley of your [pc.chest]");
		output(", and");
		if (pc.biggestTitSize() >= 8 && pc.biggestTitSize() <= 14) output(", after some effort, your face pressed deep into the fat of your tits,");
		output(" you wrap your lips around his cock once again, tasting and teasing his tip while your jugs do the rest of the work. He thrusts; you lean and rock against him; and you use your hands to press them together tighter for his pleasure and benefit.");

		if (pc.isLactating())
		{
			output("\n\nThe motions of your bodies causes your [pc.milk] to spray from your [pc.nipples] after each bump and squeeze. Your liquids drip and splash from you and onto his body, coating his lower stomach in it. <i>“I understand the appeal behind a big set of boobs,”</i> he says, humping against you with as much fervor as ever, <i>“but the... milk? The milk, I just can’t wrap my head around.”</i> That said, he doesn’t seem to mind it coating you both, even if it makes things a little sticky.");
		}
	}

	output("\n\nYou proceed as you are for several minutes, with him feeding you his cock and his precum, until the familiar, bestial quickening of his motions and his breath makes his orgasm obviously close. You don’t stop – in fact, you go faster, eager to taste your master again.");
	if (pc.biggestTitSize() >= 3 && pc.biggestTitSize() <= 14) output(" You pull your [pc.chest] away and engulf him in your mouth once more. No sense in letting any of it go to waste on you when it would go so much better <i>in</i> you.");

	output("\n\nHis hands go to the edge of the bed for stability as he fucks your throat until he ejaculates. His shaft is rock hard and thick enough to graze your front teeth if you didn’t stretch your jaw to accommodate him. You hear his moans of bliss before you feel the warmth of his cum blossom in the back of your throat, pooling into your cheeks and submerging your tonsils in his ambrosia. He humps into your mouth erratically several times, each one accentuated with another giving of his cream, each blast getting weaker than the one before it until he’s cumming nothing.");

	output("\n\nWhatever doesn’t immediately get swallowed bathes your tongue and your gums for a moment before you gulp it down. He moans, enjoying the afterglow of his release; you take the time to bathe and wash his cock, which is still hard and has a warm home in your mouth, but is shrinking. After a minute, it begins to recede into himself; you follow it every inch of the way, washing him lovingly and even hoping to go for another round, but it’s no use. You’re kissing and licking at his genital slit before he pushes you away.");

	output("\n\n<i>“That was good, [pc.name],”</i> he tells you, and you smile at the praise. <i>“You’ve done well. Now, tell me what I want to hear.”</i>");

	output("\n\nYou haven’t forgotten what he told you before you had started. <i>“It was delicious, master Lane. Daynarian jizz is so much better than anything or anyone else’s. I don’t think I’ll ever be satisfied giving head to anyone else again.”</i>");

	output("\n\nHe pats you on the head, and from the corner of your eye, you can see his slit bulging slightly, threatening to burst with his dick again, but he stands. <i>“You</i> do <i>know what I like. We’ll be doing that again in the near future, I can promise you that. But, for now, we both have jobs to do.”</i>");

	output("\n\nDisappointed but understanding, you pull yourself to your [pc.feet], trying to ignore the fire in your own loins for the time being. You both get dressed, you stealing glances at his naked ass and form whenever you can.");

	output("\n\nWhen you’re both presentable again, you leave his room wordlessly. He returns to his desk and immediately starts playing with his codex again as he waits for another client; he doesn’t so much as give you a glance as you leave his hut.");

	pc.loadInMouth(lane);
	lane.orgasm();
	pc.lust(30);
	processTime(30);

	// Lust increases by 30; place the PC one square outside of Lane’s Plane

	clearMenu();
	addButton(0, "Next", move, "287");
}

public function munchLanesCarpet():void
{
	clearOutput();
	laneHeader(true);

	output("Lane walks past you and sits on the edge of her large bed, splaying her legs and displaying all of herself to you. <i>“I want that talented tongue of yours inside me,”</i> she says, reaching down with one hand and spreading her already moist and welcoming cunny for you. <i>“I want you to lick me until I cum in that pretty mouth of yours and I want you to thank me for the opportunity.”</i>");

	output("\n\nYou don’t need any further commanding; you take a step forward and sink to your [pc.knees], eagerly placing yourself between her open knees and your mouth just inches away from her pussy. It’s similar to most other cunts you’ve seen, but with a few differences: beside her spread labia is her genital slit, which is tough and stiff when she’s unaroused, but is soft and malleable when she is. Her pink, narrow walls wink at you invitingly, waiting for you to take the plunge into her and pull you inside. Unfortunately, she has no clitoris – ");
	if (pc.hasVagina()) output("you feel sorry for your mistress. She doesn’t even know what she’s missing.");
	else output("you’re told that that’s something women generally enjoy having.");

	output("\n\nYou lean in close, breathing hotly on the skin of her sex, resting your cheek on the fat of her thigh. You wrap your hands around her legs, massaging the thick, scaly skin and muscles, worming your fingers forward towards the plush of her ass. You can smell the musk of your mistress emanating from her, conquering your nostrils and teasing your tongue, inviting you to close the gap.");

	output("\n\nYou let go of her right thigh and bring your left hand to her entrance; gently, you pet at her pussy, feeling her moisture collect between your digits, making them stick together. She ‘mmms’ at your feathery touch and opens her legs just a little wider, giving you more room to play with. Locking your eyes with hers, you bring your fingers, dewy with her essence, and slowly lick them clean, before putting them back and exploring further.");

	output("\n\nTwo fingers easily slide inside her. She arches her back slightly and drags her hips forward, resting her ass on the bedside. The walls of her vagina are streamlined and move in ripples, from her outer lips all the way to her womb. With her every muscle contraction, her pussy grips tighter onto your fingers and subtly drags you into her, wanting you to go as deep as you can.");

	output("\n\nYou don’t give her the satisfaction just yet, though. You go as deep as the second knuckles on your fingers, crooking them to feel along the smooth lines and ripples in her snatch. It makes her leap on her seat, but not as much as she <i>could</i> be, you know. You also know that her particular species is very sensitive at the labia; you crane your wrist so that your other two fingers brush and rub against one side of her outer labia, while your thumb toys with the other.");

	output("\n\nShe moans in delight at your teasing and rocks her body forward some more, urging you to continue and to go deeper. You sink your hand up to your third knuckles, reaching as deep as you can, but nowhere near where you know her Daynarian G-spot is. She yips in pleasure, swaying her hips side-to-side to grind your hand across as much of her as she can.");

	output("\n\n<i>“That’s good, that’s very good,”</i> she tells you, and you feel a sense of belonging when your mistress gives you her praise. <i>“But as well as you’re doing, [pc.name], I asked for your mouth.");
	if (!silly) output(" If I want your hands, I’ll ask for them. Now let me feel your mouth on me.”</i>");
	else output(" You know the saying: ‘a handjob’s a man’s job; a blowjob’s a ho’s job.’”</i> You look up to Lane’s eyes. <i>“I know what I said.”</i>");

	output("\n\nWith just a touch of difficulty, you withdraw your fingers from her pulling snatch, drenched and sticky in her alien girl-jizz. You bring them to your nose, taking a whiff of her undeniably-Lane scent. You lick them clean once more, trying to make a show of it for her, and when they’re totally clean, you lean in for the real deal.");

	output("\n\nThere’s no more hesitation or teasing: you kiss her labia, your [pc.lips] sliding over hers, collecting the drops of her lust on them. Your tongue licks and plies along her entrance, dipping in just a little with each pass. She tastes salty; grainy; and a little thick, but the taste is unique to her alone, that the thought that you’re eating your mistress’s box alights a fire in you.");

	output("\n\nYour hands, without permission, go forward and clamp directly onto Lane’s thin, scaly ass for support. She sighs out loud as she feels you penetrate her; you moan out yourself as you feel the unique sensation of your tongue being pulled and squeezed by the unique muscles of Lane’s Daynarian sex. With her every pulse, her cunt contracts and you feel her get just a little bit wetter.");

	output("\n\nHer hands press down on your [pc.hair], playing with what she finds as she pulls you into her crotch. As your tongue reaches deeper into her, you move your lips to try and cover her own as best as you can, knowing that she derives a great deal of pleasure from it.");
	if (!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Lane’s grip is tight, not painfully so but tight, and she crams as much of her pussy against your face as she can with every hump she makes. You’re reaching as far as you can into her, but it’s just not enough to satisfy her. You don’t dwell on it, though: you hope to make up for your shortcomings with enthusiasm, and you don’t hear her complaining.");
	else output(" Lane coos out in delight as she feels your long, slender, wriggling tongue crawl its way deeper into her, feeling along every ridge inside her and tickling all the right spots. She gasps when you reach her G-spot, deep inside her, and you relax – with your lips sealed to her cunt, you didn’t have much slack left to go! Now that you know you’ve hit the mark, you relax and start acting casual with your cunnilingus.");

	// This was "super long", but we don't have a super long flag and fuck adding one.
	if (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" Your tongue rolls into her like a long, fleshy pink carpet, connecting her every vaginal nerve and muscle to you. You surge into her in ‘waves’, going in a little, then stopping and exploring what you have before continuing. You aren’t even one-fourth out of tongue by the time you hit her G-spot. Lane, though, isn’t complaining; her claws painfully scrape against your head in her throes of passion and her hips squeeze against your cheeks almost reflexively as you work on her, hitting every special spot with ease again and again. Her every lustful gasp and yelp is like music to your muffled ears.");

	output("\n\n<i>“That’s more like it,”</i> she says, her ass halfway off the bed. You push back against her, squashing your features against her crotch, and not caring as long as it pleasures your mistress. You try to look up at her eyes, but your vision is obscured by her heaving breasts and unfocused from her pulsing blood.");

	output("\n\nYou decide that if you can’t look at her, then you can do your best to feel her; your hands begin roaming as high as her lower torso and as low as her ankles, kneading and massaging the silky smooth skin of her lower body (and tickling along the hint of a set of abs she has), and pinching and plucking at the rockier, scaly exterior of the backs of her legs.");

	output("\n\n<i>“You want something to grope?”</i> you hear her ask. Your hands freeze where they are. She didn’t sound upset, but you <i>were</i> touching her without her permission. Still tongue-deep in her muff, you see some other wriggly thing approach you from the corner of your vision. <i>“Here, then. Squeeze my tail. Do it gently.”</i>");

	output("\n\nIt’s not the oddest request. You bring your left hand from her shin, feeling along the smooth contours of her tail’s underside, and the pebbly skin of its topside. You poke and press at the very tip of it like a button, and trail your hand across it, marveling at how thick it gets so quickly, and loving all the individual muscles you can easily feel along it. You grip it and stroke it like it were a cock, and Lane moans along like it were one too.");

	output("\n\nLane lets her tail flop down to rest across her leg, its tip pointed right at your face. If she wants it treated like a dick, then you can treat it like one. With an insistent grip, you yank it forward slightly, until its tip is right next to your [pc.lips].");
	if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" You turn your head to the side, your [pc.tongue] still locked deep inside your mistress’s canal. You try and maneuver your face enough so that you can stick the tip of her tail inside without withdrawing too much from her, and you succeed.");
	else output(" You pull away from your mistress’s snatch for a moment, giving it a kiss before you depart. Lane looks down at you curiously, just in time to watch you stick her tail into your mouth, followed by another few inches.");
	output(" The rough texture of her skin hurts against your front teeth, and her tail doesn’t taste nearly as good or as unique as her pussy, but the delighted chirring you hear above is enough to satisfy you.");

	output("\n\nThe sudden inspiration causes Lane’s breath to leave her and her body to quake just slightly from her impending orgasm. She goes silent; her body begins shivering; and her hips rock forward another inch, leaving her dangling off the side of her bed.");
	if (!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" You withdraw the tail from your mouth, leaving a string of your saliva as the proof of your kinkiness, and return to your true duty with her pussy.");
	output(" Your right hand squeezes hard on however much ass it can just as she explodes into your mouth.");

	output("\n\nHer girlcum tastes as fine as every other part of her; it washes over your [pc.tongue] smoother than any malt you’ve ever had and straight into your waiting gullet.");
	if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Her tail thrashes along with the rest of her stimulated body, rocking against your lips and your teeth; her girlcum drenches and soaks the bit in your mouth, at least making it easier on your tongue as it does.");
	output(" Her knuckles go white from holding onto the bed so strongly as she humps against you several more times. The hungry walls of her cunt squeeze almost painfully on your tongue, milking it for all the cum it can’t provide and pulling incessantly on it");
	if (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(", cramming more and more of it from your throat and inside of her");
	output(".");

	output("\n\nStreams of it drip from your assaulted lips; you swallow all that you can, in worship for your mistress, but the seal around her cunny wasn’t as airtight as you had thought,");
	if (!pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" especially with her tail in the corner of your mouth");
	output(". She has two smaller orgasms, pumping her cream into your thirsty mouth each time, before she finally relaxes.");

	output("\n\n<i>“That was excellent, pet,”</i> she says, breathing heavily. She places a hand on your head and you feel a sense of pride for your good work. <i>“You’ve done me well. Now, where are your manners?”</i>");

	output("\n\nYou haven’t forgotten what she told you before you started. You pull away from her");
	if (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(", your [pc.tongue] withdrawing with a loud, wet slurp");
	output(", and look lovingly into her eyes. <i>“Thank you so much for the opportunity to lick you, and suck you, and drink you, mistress Lane,”</i> you say sincerely. <i>“Performing for you and on you is all I could want in life.”</i>");

	output("\n\nHer hand rubs along your scalp affectionately, and you could swear that her genital slit nearly stops retracting her vagina from your words alone. <i>“You’re a very skilled slut, [pc.name]. We’ll be doing this again in the near future, for sure. But, I’m afraid fucking all day isn’t going to pay my bills.”</i>");

	output("\n\nDisappointed but understanding, you pull yourself to your feet, trying to ignore the fire in your own loins for the time being. You both get dressed, you stealing glances at her naked ass and form whenever you can.");

	output("\n\nWhen you’re both presentable again, you leave her room wordlessly. She returns to her desk and immediately starts playing with her codex again as she waits for another client; she doesn’t so much as give you a glance as you leave her hut.");

	lane.orgasm();
	pc.lust(30);

	processTime(30);

	clearMenu();
	addButton(0, "Next", move, "287");
}

public function fuckedByMaleLane():void
{
	clearOutput();
	laneHeader(true);
	output("Lane approaches you, his cock in one hand and his other reaching out to grip onto your [pc.hair]. <i>“Have a taste, [pc.name],”</i> he says, jacking himself, his dick pointed right at your face.");

	output("\n\nYou’d be glad to. You sink to your [pc.knees] in front of him and lick your [pc.lips] in anticipation, gently gripping onto his waist and kneading the hard scales there. You pucker your lips, waiting for him to stop touching himself; he takes the hint and, without much warning or preparation, he thrusts forward, sliding his thin dick into your thirsty throat.");

	output("\n\nIts thin girth makes it easy to take for the moment, but you know that’s not going to last long. You suck and lick on the tasty, smooth, soft skin of his alien cock – although he’s ‘erect’, he feels flaccid compared to most other penises you know. You look up across his chest and into his eyes, letting them absorb you a little more, making it all the more pleasurable for you.");

	output("\n\nHe hums out as he saws himself in and out of your mouth. He takes sharp inhales when you get to the base of him, and exhales through the corners of his upturned lips when he pulls out. His dick tickles the back of your palate and warms the length of your tongue. It’s going to take a few minutes for it to balloon to its full girth, which you’re looking forward to. You can already feel it get thicker with each pulse.");

	output("\n\nYou do everything you can to get him to get harder faster: you gently suck; you lick; you kiss and tease every centimeter you can reach. Your hands keep busy pinching and groping at the fat of his thighs and the thick of his ass. You keep trying to fuck him with your eyes. It all works to your advantage: <i>“You’re a thirsty little slut, aren’t you?”</i> he says, twirling his fingers and lightly scratching at your head. <i>“Keep it up. We’re nearly ready.”</i>");

	output("\n\nYou obligingly keep up your pace, slathering his penis with your saliva. You can taste the occasional bead of precum from the his tip wet your gullet and then wash down your throat. By the time Lane’s had enough and pulls away, his cock is considerably thicker: it’s easily twelve centimeters thick when it leaves your lips again, a far cry from the spindly thing it was when it went in. You almost feel proud.");

	output("\n\n<i>“There you go,”</i> he praises warmly, <i>“you’ve done well. You’re an excellent cock fluffer.”</i> You’re a little confused as to what he wants, but it gets clearer when he lifts you by your armpits and then throws you onto the bed, face down and bent at the waist, your [pc.vagOrAss] exposed and winking vulnerably to him.");

	output("\n\nHe claps his hands down on your [pc.ass] painfully. The sound of his hands slapping you echo off the wall, followed by your pained yell. He thrusts his hips forward, his cock jamming between your thighs;");
	if (pc.hasVagina()) 
	{
		output(" he slides his smooth tool between your labia");
		if (pc.hasClit()) output(" and kisses your [pc.clit] with his tip");
		if (pc.balls > 0) output(", and");
	}
	if (pc.balls > 0) output(" his hot length tucks itself between your [pc.balls] and massages along the taut skin of your [pc.sack]");
	if (!pc.hasVagina() && !pc.hasCock()) output(" it humps against your blank crotch, and Lane grunts in disappointment. He keeps at it, but it’s clear he’s not deriving as much pleasure from it as he’d like");
	output(".");

	output("\n\n<i>“I love [pc.raceCute] asses,”</i> he says. He leans forward, pressing his chest and stomach against your upper and lower back. His tongue slips out and licks along the back of your ear, and you swoon. <i>“So much better than Daynarian asses. Ours are all hard and boney, but with an ass like yours...”</i> He draws his cock against you once more");
	if (pc.hasVagina()) output(", soaking it in more of your juices");
	output(". <i>“I feel like I could fuck it for days. Would you like that? Would you like to spend the weekend on my dick?”</i>");

	output("\n\nYou smile and back yourself against him, wordlessly telling him what you think of that");
	if (pc.hasCock()) output(". Your [pc.cock] rubs against the fabric of his bed. You leak a little bit of your own pre; you hope your master doesn’t mind");
	output(". He laughs a little, and brings his hands up, rubbing softly yet possessively against your sides and your lower ribs. He keeps his claws extended the whole time, leaving a light red trail from your butt to wherever he’s going.");

	if (pc.biggestTitSize() <= 2) 
	{
		output("\n\nHis hands reach up and roughly maul onto your [pc.chest]. He ‘ooh’s’ at what he finds and gropes at your flat tits a couple times. <i>“Still better than our typical females. Though you should consider looking into ‘enhancement’. It’d certainly make your master happier.”</i>");
		if (pc.hasCock() && !pc.hasVagina()) output(" You look back to Lane, concerned. <i>“Don’t worry about what the rest of the universe thinks. Daynarians love boobs on anybody. Everybody will understand if you tell them you got them for your master.”</i>");
	}

	if (pc.biggestTitSize() >= 3) output("\n\nHis hands reach up and roughly grope at your [pc.chest]. He exhales in excitement at what he finds; his tongue lolls out and licks along your bare shoulder while his hands go to town on the fat of your breasts. <i>“I don’t think I’ll ever be satisfied with a girl of my own species again. Not with a pair of tits like these.”</i> He pinches and pokes at your soft, plushy skin, leaving marks on you. His claws round about your mounds, meeting in your cleavage, and then switch boobs, crossing his arms across you.");
	if (pc.biggestTitSize() >= 18) output(" They barely get very far, though – your massive breasts take up far too much space for him to reach very well. But, from the way his hips jack a little harder against you, he’s perfectly okay with that.");

	output("\n\nHis claws click on your [pc.nipples], squeezing them tightly. <i>“And these, these are unique. I’m told you have these all your life?”</i> You shudder as he mistreats them. It makes you so much hornier, but his insensitivity makes it more painful than you’d appreciate. <i>“I don’t even know the first thing about them. You’ll have to walk me through their intricacies someday. It’ll be a learning experience for both of us, I’m sure.”</i>");
	if (pc.hasFuckableNipples()) output(" His claws sink into your sensitive [pc.nipples] as he fondles them, eliciting a familiar groan from you. <i>“I don’t think having an extra pair of cunts is normal, either, but who am I to say in this universe of ours?”</i>");
	else if (pc.hasNippleCocks()) output(" His claws scratch and grip along your [pc.nipples] as he fondles them, eliciting a familiar moan from you. <i>“Is having a pair of extra dicks a ‘thing’ with your species? Should I be jealous? Was I born the wrong species?”</i>");

	output("\n\nHe rocks himself against you some more. His dick is hot and, you guess, about as hard and thick as it’s going to get. Every time you feel it spear between your legs, and not into your [pc.vagOrAss], you whimper in need. <i>“You sound... needy.”</i> Lane, already leaning almost totally over you, lowers his body and presses you into the bed below you. You’re pinned motionless, but Lane keeps teasing you by rubbing his entire body against yours. <i>“What do you need, [pc.name]? Tell your master. I’m in a generous mood.”</i>");

	output("\n\n<i>“You!”</i> you shout through clenched teeth and pressed lungs. <i>“I need you, master Lane! Please, I need you inside me!”</i>");

	output("\n\nYou feel him rear his pelvis away from you. <i>“If that’s what you need.”</i> He reaches back with one hand and feels between you both, gripping onto his cock, and then aligns it with your [pc.vagOrAss]. He slowly begins to feed it into you, centimeter by agonizing centimeter. You’d thought his penetration would calm the fires of your lust, but it only feeds them!");

	output("\n\nHaving him inside you again is the most wonderful, pleasurable feeling you can imagine, but it doesn’t make you want it any less. He teases you by going slowly; you take action and thrust back, shoving more of his now gorgeously thick dick into your waiting hole. He gasps out in surprise and clicks his tongue playfully. <i>“You’re so eager! I hope you’re not thinking of taking advantage of your master’s hospitality.”</i> His voice is low and he’s trying to sound serious, but his tone is light-hearted, and he doesn’t squeeze or press you any harder. <i>“You know what they say about rabbits and turtles, or whatever.”</i>");

	output("\n\n<i>“Speaking of rabbits, let’s fuck like a pair,”</i> you say huskily, and back your ass up some more, squeezing some more of him into you. He only laughs and begins his own thrusting, cramming his dick into your [pc.vagOrAss], filling the room with the sound of his thick shaft plowing past your");
	if (pc.hasVagina())
	{
		output(" vulva and into your wet, waiting depths.");
		pc.cuntChange(0, lane.biggestCockVolume(), true, true, false);
	}
	else
	{
		output(" [pc.asshole] and hinting at poking into your stomach.");
		pc.buttChange(lane.biggestCockVolume(), true, true, false);
	}

	output("\n\nYour head lowers and you relax. Your master is back inside you again – Lane wanted to fuck you, so you wanted to be fucked, and you’re getting what you wanted. You nearly don’t notice when his hands let go of your body and roughly grip onto the sheets on either side of your face. He pulls away, withdrawing from you, making you whimper at the sudden chill around your junk, and then he roughly thrusts back in.");

	output("\n\nThe room is filled with the squelching of your mixing juices and the slapping of his hips against yours as he fucks you like he were running a marathon. You can’t help but smile as he goes at it; your [pc.vagOrAss] spreads invitingly around his tool, sucking him in and resisting when he tries to pull away. His breath starts coming out raggedly, with shuddering exhales and long inhales; it washes down your back in a warm wave, and you absolutely love it.");

	output("\n\n<i>“Is this what you had in mind?”</i> Lane asks you. His voice comes out unevenly between his thrusts. <i>“Pressed into my bed, getting fucked like an animal by your master? Do you want my cum inside you, and to come back for seconds when it leaks out?”</i>");

	output("\n\n<i>“Yeeeeeesssssss,”</i> you moan languidly. You spread your legs wider, giving him more space to fuck you with. You wish his cock could get thicker, to split you wider, to give you <i>more</i> of him. His desires are yours, and you want nothing more than to be fucked by Lane and have him shoot his warm lizard load inside of you.");

	output("\n\n<i>“You’re a good bitch.”</i> He gets off of you and stands back onto his feet, never letting himself pull out. He smacks onto your [pc.ass] with both hands again, turning the [pc.skinFurScales] redder than before. With his new leverage and grip, he resumes pounding you into the fabric.");

	if (pc.hasCock())
	{
		output("\n\nYour [pc.cock] is as hard as you’ve ever felt it and is leaking your precum at an alarming rate, squashed between your body and the bed");
		// This was an area call- it didn't make much sense
		if (pc.biggestCockLength() >= 12) 
		{
			output(". Your [pc.cockBiggest] has wedged itself beautifully");
			if (pc.biggestTitSize() >= 3) output(" between your [pc.chest]");
			else if (pc.biggestTitSize() <= 2) output(" against your [pc.chest]");
			output(" and you feel yourself inadvertently fucking yourself while Lane fucks you. He’s so talented!");
		}
		else
		{
			output(". It’s trapped underneath your gut, getting rubbed raw by your skin and the fabric of the bed, but it just hurts so good! You won’t last much longer like this!");
		}
	}
	if (pc.hasVagina())
	{
		output("\n\nY");
		if (pc.hasCock()) output("et, despite how good your dick feels, it can’t possibly compare to y");
		output("our lucky, spoiled [pc.vagina]");
		if (pc.hasCock()) output(". It");
		output(" feels absolutely amazing with your master’s cock plowing into it; every time he pulls away leaves you teased and wanting for him again, and you’re fed and satisfied every time he thrusts back home. Your muscles ripple and squeeze in delight as his smooth dick <i>just</i> brushes against all the best spots inside you, making you squirm and slack-jawed as each of his thrusts claims you individually.");
	}
	if (!pc.hasVagina() && !pc.hasCock()) output(" You clench your ass with his every inward thrust, trying to make the sensation last as long as you can, but it’s all a vain effort. Without genitals to release with, you can’t help but feel your release build and build and build, and have nowhere to go at the end of it. It’s torturous and maddening, and you love every second of it. Only Lane can make you feel so wonderfully contradictory!");

	output("\n\nHis grip gets tighter, and he drags his claws over your [pc.skinFurScales] painfully as a consequence. You wince a bit, but the sound of his breath coming out faster and faster distracts you. He’s nearly at his peak! You’re eager for his seed and you back against him every time he thrusts, wanting him to shoot his load as deep as he can into your [pc.vagOrAss]. At the same time, you lament that he’s nearly done fucking you – if only you could be like this with your master at all hours of the day! You try to cherish the time you have remaining and the coming climax to it all.");

	output("\n\nHe bucks thrice more, then he grunts, and then you feel a magnificent warmth spread inside you, shooting");
	if (pc.hasVagina()) output(" deep into your waiting cunny and towards your patient womb");
	else output(" far into your large intestine and finding its way deeper, towards your hungry belly. You hope he’ll provide for it next time");
	output(". You try to hold back your own orgasm, but Lane wanted to cum inside you, so you wanted him to cum inside you,");
	if (pc.hasVagina() || pc.hasCock()) 
	{
		output(" and now that you have what you want, your floodgates burst open.");
		if (pc.hasCock())
		{
			output(" [pc.EachCock] sprays your cum all over your stomach");
			if (pc.biggestCockLength() >= 8) output("; across your [pc.chest]; onto your chin; and all over his bed, soaking the sheets in the proof of your eagerness for your union.");
			if (pc.hasVagina()) output("\n\n");
		}
		else output(" ");

		if (pc.hasVagina())
		{
			output("A");
			if (pc.hasCock()) output("t the same time, a");
			output("ll at once, your [pc.vagina] squeezes on Lane’s impressive, godlike dick in sequential waves, coaxing his cum from his sensitive base to his tip and working what you get deeper inside of you. Your [pc.girlcum] sprays out onto him, wetting him at his own crotch and tainting his bedsheets even more. With every pass your cunt makes at milking him, the knowledge that it’s your master’s dick that’s inside you provokes another, smaller orgasm, until your poor genitals exhaust themselves.");
		}
	}
	else
	{
		output(" but now that you have what you want... you’re just so <i>close</i> to your release, but no amount of humping the bedsheets or fucking against Lane is going to give you what you need! You bite your tongue hard enough to hurt as you try to frantically recall what an orgasm felt like before you lost your genitals. The bloom of warmth radiating from your crotch; the tension unfolding from your body; the way all your muscles writhe and then relax at the same time... you feel something akin to it as you feel Lane’s warm, heavenly cum seep deeper and deeper into you, but it’s just not enough.");
	}

	output("\n\nLane flops back down onto your body and tries to catch his breath. You sigh in ");
	if (!pc.hasCock() && !pc.hasVagina()) output("half-");
	output("delight; you’ll remember this day forever, and you hope you’ll have many more days to remember in the future. His body feels good against yours: warm, smooth, and tight in all the right places. His breath bats against your ear, and soon his tongue is there instead, licking you affectionately.");

	output("\n\n<i>“You’re such a good cumdump,”</i> he says. At first, you sort of object to the phrase, but, being a cumdump is what Lane wants, so you want to be his cumdump. <i>“I think we made a great decision, making you into what you are, don’t you think? This is so much more rewarding for us both.”</i>");

	output("\n\nYou nod, whispering your agreement, your thanks, and your praise. You don’t stop praising him and his ‘ability to perform’ for a solid minute and a half – you try your best to encourage him for another round, even as his cock starts flagging inside your [pc.vagOrAss]. Occasionally you feel a twitch from him, which excites you, but soon enough, he goes soft and his cock starts retreating into him once more.");

	output("\n\nHe hoists himself off of you and back onto his feet. You turn around, looking to his receding penis, thinking that maybe you could try to fellate him some more... but you only see the tapered tip, and soon it’s swallowed away by his slit. You frown, and he sees it. <i>“Don’t worry, [pc.name]. You’ve done such an excellent job that you’ll be back on it soon enough, I promise.”</i>");

	output("\n\nHe turns to one of the dressers on the side of the room, and pulls out a fresh, complete set of the same airy clothes he always wears. <i>“But for now, I’m afraid we both have work to do. I can’t make fucking my living unless I fuck everybody, and I only have one special slut in my life.”</i> He winks at you, and you practically melt on the spot. He laughs light-heartedly. <i>“Put on your clothes, [pc.name], and get back out there. You have some money to make.”</i>");

	output("\n\nAnd then he leaves you alone in his room. You lay there for another minute, reflecting on what he just said, about how you were special to him. You smile to yourself, but you know he’s right in that you still have things to do. With some effort, you peel away from his bed and reach for your [pc.armor], scattered across his floor.");

	output("\n\nAnother minute or two later, you’re presentable again, and you leave his hut, energized.");

	processTime(60);

	if (pc.hasVagina()) pc.loadInCunt(lane, 0);
	else pc.loadInAss(lane);

	lane.orgasm();
	pc.orgasm();

	if (!pc.hasCock() && !pc.hasVagina()) pc.lust(20);

	clearMenu();
	addButton(0, "Next", move, "287");
}

// From the doc:
// 		I may have gotten a little ambitious with this one
// http://i.imgur.com/JedndTn.gif
public function fuckedByFemLane():void
{
	clearOutput();
	laneHeader(true);

	output("Lane roughly shoves you in your chest, knocking you off your [pc.feet] and onto your ass onto her bed. Before you can rub the sore spot she had hit, she has your [pc.hair] in her hand, gripping you tight enough to pay attention. <i>“We’re going to have some fun,”</i> she says. That makes you shiver. <i>“Before we begin, I need some... encouragement. Show me how enthusiastic you are for me.”</i>");

	output("\n\nShe pulls you forward");
	if(pc.hasHair()) output(" by your hair,");
	output(" until your nose presses hard against the scales of her lower belly. The glowing underneath her thicker skin is less pronounced, but so close, you can practically taste her with her scent. She tilts your head until your lips are pressed against her soft, pliable, sensitive (and more than a little tasty) Daynarian cunt. She’s clearly aroused enough, but she wants you to excite her, so that’s what you want too.");

	output("\n\nShe moans out once you pucker your [pc.lips] and slide them over her own. She sways and swings her hips, putting on a bit of a dance for you as you go down on her. You tentatively raise your hands to grope onto her hips, but she swats both of them away with her free hand. <i>“Just your mouth, pet. I want to feel what you’re capable of.”</i> You moan out and acquiesce.");

	output("\n\nIt doesn’t take much doing for her to get absolutely soaked, coating your tongue in her lubricant. She’s as horny as she’s probably going to be already – maybe you had left her a little pent up? You’ll be sure to give your mistress more attention to prevent that. Either way, the foreplay probably isn’t what she’s after: if her welcoming pussy isn’t hint enough, then the way she humps against your face and constantly runs her hands through your [pc.hair] is telltale enough.");

	output("\n\nThe sound of her moaning out pleasurably joins the wet kisses and licks you’re giving her mound. <i>“That’s right, pet,”</i> she says as you work.");
	if (!pc.hasTongueFlag(GLOBAL.FLAG_LONG) && !pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" You dig into her as far as you can, but you know your [pc.tongue] isn’t quite long enough to reach her sensitive G-spot deep inside her. You compensate as much as you can by working your lips against her labia, knowing what they do for her too.");
	else if (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" You know how much your mistress likes it when you stuff her cunt full of your [pc.tongue], and you’re not going to disappoint her. Your long, slippery muscle slips in with ease and then places itself directly on top of her G-spot. She laughs in delight and thrusts her hips forward, and you don’t stop laying in more and more tongue, packing her full even when your tongue starts layering on top of itself.")
	else if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Your [pc.tongue] reaches all the way to her cervix with a little bit left to spare. Every pass the tip of your tongue makes over her G-spot, she clenches hard on your head, which, with her claws, hurts quite a bit. But, she wants you to keep going, so you want to keep going, in spite of the pain.");

	output("\n\nHer body rocks in a wavy motion, from her ankles all the way to her neck, as she fucks your face some more. She loves what you’re doing with what you’re given, and you love doing it because she loves it. Her body starts to quiver a bit, signaling an impending orgasm, when she quickly shoves you back. <i>“You’re such a good cuntlicker, [pc.name],”</i> she praises. You smile goofily. <i>“As good as your pretty [pc.lips] are, and as much as I could get off on them again and again and again, I want something a bit more substantial from you.”</i>");

	output("\n\nShe raises her webbed foot and presses it against your collarbone, where she had shoved you before, and kicks you backward, onto the bed. As soon as your back hits the softness of her quilt, she’s flopped down on top of you, pinning your body down with her own. The soft heaviness of her breasts against your [pc.chest] is the best vice you could have asked for.");

	if (pc.biggestTitSize() <= 5) 
	{
		output("\n\nLane gently cups your face with her hands and leans in for a kiss. You reciprocate gladly – and, despite her aggression so far, her kiss is loving, passionate, and caring; neither of you hesitate to swap spit, pressing your tongues together. You melt into her embrace, letting yourself get absorbed into her in more ways than one. Lane’s thigh slips in between your own, rubbing gently at");
		if (pc.hasCock() || pc.hasVagina())
		{
			if (pc.hasCock()) output(" [pc.eachCock]");
			else if (pc.hasVagina()) output(" [pc.eachVagina]");
			output(", stimulating it and making you readier than you thought you were. Lane’s gentle kissing and fervent-yet-considerate rocking against your body has caught you off-guard, and you love it.");
		}
		else
		{
			output(" your groin.")
		}
	}
	else
	{
		output("\n\nLane’s earlier aggression keeps up as she tops you on her bed. Her hands slap next to your head on either side, making you flinch; before you can right yourself, Lane’s lips are on yours, claiming and dominating you with her mouth. Your mouth is full of her swatting tongue, beating yours down into submission. Her body grinds yours into the bed; her heavy breasts, inferior to yours, squashing your better pair flat, which awkwardly bends her upper back upward but she’s insistent on bettering you. Her thigh worms in between yours, where she practically knees you in the crotch in her passion; it’s <i>definitely</i> stimulating, at least.</i>");
	}

	output("\n\nShe breaks away from you, panting, breathless from the intense make-out session.");
	if (pc.biggestTitSize() <= 5) output(" <i>“You’re such a beautiful creature, [pc.name].”</i> You blush at the undue praise – you didn’t even kiss <i>her,</i> she kissed <i>you</i>. <i>“I love what you’ve become and what our relationship is.”</i> Your heart nearly leaps into your throat, but she keeps avoiding the context you’re after. <i>“You’re such a good toy. And I like to treat my toys well. I think you’re going to enjoy this.”</i>");
	else output(" <i>“You hot, big-tittied bitch,”</i> she says, her eyes drilling and boring into yours. She’s talking dirty, but her tone is serious. <i>“You think you’re better off just because your tits are bigger than mine.”</i> Is she jealous of your [pc.chest]? You open your mouth to respond, but she keeps going. <i>“I’m going to fuck you into the dirt. I can’t promise it’ll be good for you. I want you to look into breast reduction when we’re done here – I can’t have my pets walking around like they’re better than me.”</i>");

	output("\n\nShe leans back, pressing her hips down onto yours. Her hands travel up your stomach and onto your [pc.chest],");
	if (pc.biggestTitSize() <= 5) output(" kneading and caressing them between her skilled, webbed fingers");
	else output(" harshly squeezing onto them between her unforgiving and jealous claws");
	output(". She toys with your [pc.nipples] with her index fingers, experimentally flicking them and watching them bounce back. <i>“These are awfully unique, too.”</i> She pinches them between her fingers, tugging them upward. You wince at the rough treatment, and she");
	if (pc.biggestTitSize() <= 5) output(" eases up. She hadn’t realized just how sensitive they really were");
	else output(" tugs harder. When you sputter in pain, she grins and relaxes your tits, only to tug even harder");
	output(". <i>“They must be awfully sensitive. You’ll have to walk me through their intricacies some other time.”</i>");
	if (pc.hasFuckableNipples()) output(" She notices that your nipples look awfully familiar, and she sticks a finger into the open tunnel of your left nipple cunt. When you make a distinctly feminine gasp, she realizes right away what they are. <i>“Huh,”</i> she says – and nothing else.");
	if (pc.hasNippleCocks()) output(" She grips onto your elongated, masculine nipples. She recognizes their distinct shape right away and knows exactly what she’s doing when she pinches their veins and tubes tightly. <i>“These look fun,”</i> she remarks, <i>“but having sex with your chest would be a little weird, even for an alien. Hell, we might give it a try someday... but not today.”</i>");

	if (pc.hasCock()) 
	{
		output("\n\nHer weight bears down on you, and your [pc.cock] is pressed flat, pointed towards your stomach with her body. It’s turned purple with how aroused it is and yet its veins are pinched shut by Lane’s devilish hips.");
	}
	else
	{
		output("\n\nShe touches her cunt down on your");
		if (pc.hasVagina()) output("s");
		else output(" empty pelvis, meeting nothing but skin");
		output(". The feeling of her warm sex wetly meeting your body so suddenly makes you bite your lip. She keeps her body still, not stimulating you any further. Your hands grip onto the bedsheets; she had commanded you not to use your hands, and you desperately wait for her to rescind her order. <i>“Would you like me to fuck you, [pc.name]?”</i>");
	}

	output("\n\n<i>“Yes!”</i> you bark out loudly.");

	// Cock selection shit.
	var selCock:int = pc.cockThatFits(lane.vaginalCapacity(0));
	var cockTooBig:Boolean = false;

	if (selCock == -1) 
	{
		selCock = pc.biggestCockIndex();
		cockTooBig = true;
	}

	output("\n\n<i>“Ooh, such passion!”</i> She slides her cunny up your body just a little bit");
	if (pc.hasCock()) output(", leaving a slimy trail along the shaft of your cock");
	else if (pc.hasVagina())
	{
		output(", the heat of her vulva radiating just enough to tease your engorged");
			if (pc.hasClit()) output(" [pc.clit]");
			else output(" folds");
	}
	output(". <i>“You don’t waste any time getting to your point. I like that.”</i>");
	if (pc.hasCock())
	{
		if (!cockTooBig) output(" She slides her pussy all the way up until she’s perched just above your tip. <i>“Well then, let’s not make you wait any longer, hmm?”</i>");
		else
		{
			output(" She leans forward, resting your [pc.cock] between your stomach and hers. She fits it between her heavy, smooth boobs, the tip pointed");
			if (pc.cocks[selCock].cLength() <= 14) output(" right towards your face");
			else output(" well above your head");
			output(". <i>“This isn’t going to fit into me, [pc.name]. You should look into fixing that someday. But that doesn’t mean we can’t still have some fun.”</i>");
		}
	}

	// PC is male/herm and will fit
	if (!cockTooBig)
	{
		output("\n\nShe lifts herself with her knees just enough to fit you inside her, and, with a sharp drop, she engulfs you to your base in one swing. You moan out, feeling your [pc.cock " + selCock + "] inside her familiar tunnel and you submerge yourself in the sensation of her oddly-lined walls sucking on you pleasurably, yanking you deeper and deeper into her. <i>“That’s it,”</i> she says encouragingly. <i>“You’re back where you belong, [pc.name]. Inside your beloved mistress. That’s where you should be.”</i> And you agree!");

		output("\n\nFrom her position, she does a minimal amount of thrusting, but she rocks back and forth on top of you, swinging your dick around inside her. Admittedly, it probably gives her more pleasure than it gives you, but you’re nonetheless not going to complain.");
		if (pc.balls > 0) output(" The heat of her ass tickles the tip of your [pc.sack], making them tense up beneath her.");
		output(" <i>“Would you like to shoot a hot load inside your mistress, [pc.name]?”</i> She leans back, displaying her abdomen to you. Her bloodflow illuminates her lower torso neatly, practically outlining just where your hot load would be going. <i>“Do you want to feel your cum going into your Daynarian queen?”</i>");

		output("\n\nYou grunt your approval and thrust deeper into her, spurred on by her words. She coos out and keeps grinding her snatch onto your pelvis. <i>“That’s it, fuck me good. Prove to me that you love me.”</i> She begins kneading at her titflesh, squishing them together and enhancing her cleavage for you. Her long, thin tongue snakes out and starts licking the salt off the top of her boobs.");

		output("\n\nDespite you having to do most of the work for your own pleasure, it’s absolutely paying off. Whether it’s because of the base, primal act of what you’re doing, or because you’re doing it with your mistress, you feel your release building up in your loins – perhaps a little sooner than you had hoped. Your [pc.cock " + selCock + "] pierces into her with every thrust you can manage");
		if (pc.balls > 0) output(" and your [pc.balls] jiggle every time you slap into her");
		output(". You look at her belly, trying to see if you could spot the outline of yourself through the glowing of Lane’s veins.");
		if (pc.cocks[selCock].volume() >= lane.vaginalCapacity(0) * 0.75) output(" To your surprise, you do! Lane’s abdomen bulges out slightly every time you thrust your well-endowed cock into her. She’s moaning like a horny whore, so you know you’re not hurting her with your tool, thank goodness.");
		else output(" Unfortunately, you’re not quite endowed enough for something quite that kinky. Maybe she wouldn’t mind if you packed on another inch...");

		output("\n\nHer grin evaporates to a more focused expression and her eyes become heavily lidded. Her hands leave her bouncing breasts and tightly grip onto the quilt you’re lying on, and she uses it to anchor herself to you and keep you from thrusting out of her. You moan pleadingly, but she doesn’t care. You’re forced to fight against her to keep up.");

		output("\n\nYour focus is torn between the sensations you have and the sensations you want, and it makes the sex a little wanting on your end. Lane, however, speeds up her breathing, her jaw hanging open. The flashing lights from all over her body begin to pick up their pace, practically turning her body into a strobe light. She starts whimpering like a kitten and the grip her vagina has on your [pc.cock " + selCock + "] tightens, massaging you from your base to your tip, urging out every drop of juice you have.");

		output("\n\nBefore you can give her what she wants, she orgasms. She presses hard onto your dick and keeps totally still; you can feel her cunt working overtime to deposit any fluids it gets into her, though you stubbornly don’t give her any. That’s hardly for lack of trying, though");
		if (pc.balls > 0) output(": your [pc.balls] begin to ache from the teasing and the frustrating lack of stimulation. She wants your load, and you’d be happy to give it, but she’s not giving you much to work with");
		output(".");
		if (pc.hasVagina()) 
		{
			output(" To say nothing of your lonely [pc.vagina], clenching at nothing and wishing it got the same attention your mistress’s was getting. You’re soaked");
			if (pc.balls > 0) output(" beneath your [pc.sack]");
			output(", and you doubt it’s about to get any better.");
		}

		output("\n\nShe rocks her hips gently, stimulating herself a little more each time. You can feel your cock getting squeezed and soaked inside her, and you’re <i>so very close</i>, but she’s just not helping you over the edge.");
		if (pc.cocks.length >= 2) output(" [pc.eachCock] protest against her abusive vulva, each of them just as hard, but none of them are half as stimulated as the one inside your scaly mistress.");
		output(" You just hope she doesn’t –");

		output("\n\nShe leans forward again, bringing her eyes close to yours. You wonder if you had done something wrong, and that she wasn’t letting you cum as retribution. She smiles a warm, genuine smile, and that helps ease your tension somewhat. <i>“You still haven’t cum, [pc.name],”</i> she says in a sing-song-like voice. <i>“Is something the matter? Could it be... you’re not sexually interested in your mistress anymore?”</i>");

		output("\n\nYou shake your head, but you bite your lip. You’re as sexually attracted to Lane as the day you met her, but you can’t just up and say she’s not helping you get off. <i>“Kaithrit got your tongue?”</i> She presses her body onto yours without letting your [pc.cock " + selCock +"] slip free from her cunt. Her vaginal walls still cling to you, but not nearly as aggressively as before. <i>“The Kaithrit can have your tongue, then.");
		if (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" As long as it gives it back later – no way am I letting some bitch Kaithrit hog all of that tongue to itself.");
		output(" For now, I’ll settle with having your eyes.”</i>");

		output("\n\nHer tassels flare open slowly, and your vision begins swimming with the lights of her beating blood mixing with her glassy piercings and swirling tattoos on her thin membranes. Her eyes open wide, very wide, and they begin changing their colors as well. Effortlessly, your body goes numb and relaxes, sinking into her subconscious grip willingly. Your raging hard-on doesn’t flag at all, however.");

		output("\n\n<i>“You’d do anything for your mistress, wouldn’t you, [pc.name]?”</i> she says sweetly. You barely have the thought in your head to answer. <i>“You love mistress Lane so very much. Of course you’d do anything for her.”</i> Of course you would. You love Lane, after all. You wouldn’t hesitate to give her anything you could. <i>“Then, would you cum for your mistress? Your mistress wants you to cum inside her. Go ahead and let it all out, [pc.name]. Spill your seed into her.”</i>");

		output("\n\nThe release that had been evading you all this time suddenly comes rocketing through your cock");
		if (pc.hasVagina()) output(" and gushing out your cunt");
		output(".");
		if (pc.cumQ() <= 349) output(" You sigh as your [pc.cum] finally spills from your aching dick and into Lane’s impatient honeypot. She coos out every time she feels a fresh spurt and gently slides her hips over yours, sucking out all your cum and letting her vagina drink it all, deep inside her. By the time you’re done, there isn’t a drop left from you, and all of it has tucked neatly inside Lane’s body.");
		else if (pc.cumQ() >= 600) output(" Lane moans in approval as your cum sinks into her body. The teasing had left you pent up! You cum and you cum inside her, and you hear every splurge of juice shooting into her as well as you can feel it. Lane whispers encouragement as you deposit as many loads as you can, and her thirsty honeypot takes it all in. Her muscles work overtime to make sure nothing escapes, and they succeed, barely.");
		else if (pc.cumQ() >= 2500) output("Your first two wads of spunk pack into her easily enough, but you’re shooting so much that she’s totally stuffed by the fourth. You’re not halfway done, though, and you keep blasting your [pc.cum] into her rounded, swollen belly. No matter what her cunt tries to do to contain it, it shoots out around your girth and sprays uselessly onto the quilt beneath you. The juice leaks backward, pooling underneath your body and sticking your [pc.skinFurScales] to the fabric. Even then, it doesn’t stop until you’re resting in sizeable puddle of your own cum.");
		if (pc.balls > 0)
		{
			output(" The aching in your [pc.balls] drains with every jet you unleash into your willing and wanting mistress, until the discomfort in them is nothing but a distant memory.");
			if (pc.hasVagina()) output(" And, despite the total lack of attention, y");
		}
		else
		{
			if (pc.hasVagina()) output(" Y");
		}
		if (pc.hasVagina()) output("our [pc.vagina] clenches at nothing and spasms in delight, as though it had been filled by the perfect dick and had been given the royal treatment. You shake your hips as you feel a sort of fiery sensation reaching as far as your lower belly inside you. You’re surprised, but at the same time, your mistress told you to cum, so you came.");
	}
	else if (pc.hasCock() && cockTooBig)
	{
		// PC is male/herm and will not fit
		output("\n\nShe rocks her body forwards, and you feel her every smooth, delectable scale slide over the underside of [pc.oneCock]. The bit that’s trapped between your [pc.chest] and her cleavage is surrounded by warm flesh on all sides");
		if (pc.biggestTitSize() >= 3) output(", and it’s treated to a double-titfuck, making it the luckiest dick in the universe, according to you");
		output(". You feel her wet box tickle along the base of your dick as she draws herself up, and with her every motion, the skin of your penis is dragged along with her.");
		if (pc.canSelfSuck()) output(" You could easily lean your head forward and take yourself into your mouth if you wanted, and she could do the same, but maybe your mistress has other plans.");
		else if (pc.biggestCockLength() >= 26) output(" Your [pc.cockHead] is well beyond your [pc.lips], making it impossible to give yourself head from this position, but that’s not to say your mouth is <i>useless</i>. Still, you wait for your mistress’s move before you make your own.");

		output("\n\nShe gently rocks her body from side to side, grinding your tool between your bodies. Its veins and tubes are pinched between you, making it throb almost painfully; you can see it visibly expand with each heartbeat. Whatever you feel, it’s all exquisite and you hope it goes on forever.");

		output("\n\nLane’s hands go to her breasts, pushing them together around your [pc.cock]. You have so much you’d like to touch – yourself, her, her breasts, her sides, her ass");
		if (pc.balls > 0) output(", your balls");
		if (pc.hasVagina()) output(", your cunt");
		output("... but you keep them obediently at your sides. Lane’s eyes lock onto yours, and they narrow seductively as their colors begin to change. <i>“You’re a very good toy, [pc.name],”</i> she tells you, almost lovingly. <i>“I’ll give you a break. You can touch me however you like.”</i>");

		output("\n\nYour hands work faster than your mouth, and you’re groping her in different places all over as your tongue fumbles with your thanks. She laughs, and then coos as you poke, prod and massage all the right spots on her scales. You feel and rub along her back, gently trailing your fingers along her ribs, to the small of her back and the swell of her ass. You’re eager, but you try to keep composed and restrained.");

		output("\n\n[pc.EachCock] grow");
		if (pc.cocks.length == 1) output("s");
		output(" harder as you work her.");
		if (pc.cocks.length == 1) output(" It");
		else output(" One of them");
		output(" insistently keeps");
		if (pc.biggestCockLength() <= 14) output(" prodding your mistress in the chin");
		else output(" smacking your mistress in the cheek");
		output(", wanting to rise upright but her body keeps");
		if (pc.cocks.length == 1) output(" it");
		else output(" them");
		output(" cushioned in its soft, warm prison. She seems to enjoy seeing you so hard, and she doesn’t do much for your own pleasure. She does, however, keep grinding her snatch against the underside of your dick, deriving as much pleasure for herself as she can.");
		if (pc.balls > 0) output(" Her juices drip and trail down the rest of your length, pooling in the union of your cock and your [pc.sack]. Its ticklish and it makes them draw upward pleasurably.");
		if (pc.hasVagina())
		{
			output("\n\nLane keeps her tail tucked in between your legs, and you can feel the heat of her tail radiate just enough to tickle your own quivering feminine sex.");
			if (pc.balls == 0)
			{
				output(" The juices from her own leaking cunt trail from down the rest of your length and onto your");
				if (pc.hasClit()) output(" [pc.clit]");
				else output(" folds");
				output(", mingling with your own girly secretions.");
			}
			output(" You clench your thighs, idly wishing for something to penetrate you. Lane’s tail swishes lazily behind her – she does not grant your unspoken wish.");
		}

		output("\n\n<i>“You’re so hard, [pc.name],”</i> she comments. She makes a display of taking a few heavy breaths on you, stimulating you, but the only pleasure you’re getting from her pleasuring herself on you. <i>“Won’t you do something about it?”</i> You’re unsure how to reply, other than to keep squeezing her ass. You look at her");
		if (pc.biggestCockLength() >= 15) output(" around your long dick");
		output(" inquisitively – once your eyes meet hers, you feel a sense of calmness wash over you while the lights of her body tunnel your vision. <i>“You have needs too, [pc.name]. Living with a penis this... prodigious must be trying. I can’t imagine there are a lot of cunts out there that can take it.”</i> She pauses, then grins a sinister, toothy grin. <i>“Maybe not consensually, anyway.”</i>");

		output("\n\nAs you watch and listen, her body keeps moving, rubbing at all your best spots on your massive dick. It’s taken until now for a bead of your [pc.cum] to travel up your shaft and hang from your [pc.cockHead],");
		if (pc.biggestCockLength() <= 14) output(" splashing down onto your chin");
		else output(" dripping down somewhere above you and onto her quilt");
		output(". <i>“Pleasure yourself, [pc.name],”</i> she says, not-too-subtly. <i>“Your mistress wants to see it. Use your mouth on yourself. You must have gotten a lot of practice by now. You can be honest with your mistress.”</i>");

		output("\n\nYou decide to pleasure yourself, with or without Lane’s go-ahead or initiative. You crane your neck upward,");
		if (pc.biggestCockLength() <= 14) 
		{
			output(" and slip your [pc.cockHead] past your lips. Your own taste, somewhat familiar, coats your tastebuds in an instant, along with your leaking pre. The pleasure you get from finally having your glans stimulated with a tongue as gentle, caring, and familiar as yours, inflates your vas deferens with more of your impatient precum.");
			if (pc.cumQ() >= 1000) output(" You’re very aware that the few drops that land in your mouth are merely the drizzle before the hurricane.");
		}
		else
		{
			output(" and slide your [pc.tongue] out to coat and pleasure the skin of your shaft. You feel the rigid, thick muscle under the thin layer of skin beat and bloat with your heart, and finally feeling something wet and warm pleasure your tool makes it lurch with excitement. You can see your vas deferens, nearly hidden against Lane’s body, inflate with your impatient precum, and you can hear it splurt and drip onto her bed above you.");
			if (pc.cumQ() >= 1000) output(" You really hope Lane isn’t going to mind the mess you make when you unload. The size of your cock isn’t the only thing ‘prodigious’ about you.");
		}

		output("\n\nTo your relief, you hear your mistress giggle above you. She drags her body in broader strokes against you, and her breathing starts getting a little shallower as she watches you. <i>“That’s it,”</i> she says, cheering you on softly. <i>“Let me see you work your own cock, you fucking size-queen. Let’s see how good you are with your own equipment.”</i> She rolls her hips forward, then languidly slides them back down, forcefully pushing her crotch against your thick tube. She winces and moans out <i>“yeeeeeessssss”</i> as she goes, her eyes watching your mouth’s every movement.");

		output("\n\nYou keep up your licking and sucking, encouraged by your mistress’s words.");
		if (pc.biggestCockLength() <= 14) output(" You lean forward further, stuffing as much dick into your mouth as you can. Giving yourself a blowjob is a unique, wonderful feeling combing the best of having your dick sucked and the sexy, slutty feeling of having a warm, fat dick in your mouth. It’s exacerbated, perhaps, by your mistress lying atop you and enhancing your experience.");
		else
		{
			output(" You cover as much of your shaft as you can with your [pc.tongue]");
			if (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE) || pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(", which isn’t a daunting task – you can reach all the way to your base and all the way to your tip in just a pass");
			output(". You pucker your [pc.lips] and kiss the fat, hard bit of muscle directly in front of you repeatedly, giving yourself hickeys on your straining tool. Lane seems to love watching you pleasure yourself, and you love that she’s loving it, making every lick, kiss, and rub a new delight to all five of your senses in new and exciting ways.");
		}

		output("\n\n<i>“You’re a good pet,”</i> Lane says through staggered breaths. Her masturbating herself against your cock grows frantic, and her scaly boobs hang loose and low, surrounding your [pc.cock] rather than smothering it. <i>“You do exactly as you’re told.”</i> With that, her body tenses and she takes a long, deep breath through her clenched teeth. You feel the same wetness from before begin to flood down the shaft of your dick and pool at your groin");
		if (pc.balls > 0) output(", glazing over each of your [pc.balls] and dripping off them towards the quilt beneath you");
		if (pc.hasVagina() && pc.balls == 0)
		{
			output(", dripping down across your [pc.vagina]");
			if (pc.hasClit()) output(", soaking your [pc.clit]");
			output(" and drenching your thighs in more than your own femcum");
		}
		output(". <i>“Cum with me, [pc.name],”</i> she demands. She’s barely able to form the words. <i>“Let me see what that cock is capable of!”</i>");

		output("\n\nYou don’t hesitate to ‘do as your told,’ and, almost before you’re even ready, you feel your [pc.cum] surging through you, burning a trail up your massive shaft.");
		if (pc.cumQ() <= 349)
		{
			if (pc.biggestCockLength() <= 14)
			{
				output(" The taste of your bloated [pc.cockHead] is accompanied by your personal cream, immediately coating your tongue and puffing out your cheeks. Without hesitation, you swallow – you hope your mistress will get an even bigger kick out of it. The load in your mouth is replaced with two more, neither of them as large as the first. You make a show of swishing it around in your mouth for her before you gulp it down as well.");
			}
			else 
			{
				output(" Your cum shoots from your [pc.cockHead], bursting out in a few ropes over your head and onto Lane’s bed above you. If she’s disappointed at the mess you’re making, she’s not showing it. Your cock tenses between you for a moment, squeezing out your load – you spurt three times, the latter two hardly the size of the first combined. Your teeth clench as you try to keep from thrashing as you ride out the rest of your orgasm.");
			}
		}
		else if (pc.cumQ() <= 1000)
		{
			if (pc.biggestCockLength() <= 14)
			{
				output(" Your [pc.cockHead] puffs out, pushing against your tongue and your palate, and then erupts your load directly down your throat. You barely have the time to register the orgasm and your very sudden meal before another shot replaces the first, just as voluminous as before. You try to swallow as much as you can – you don’t want to make a mess, and judging from the look on your mistress’s face, she’s getting a real thrill off seeing you struggle with it. Eventually, you fail, and your [pc.cum] leaks from your [pc.lips] in thick rivers before your load finally comes to an end.");
			}
			else
			{
				output(" You feel your [pc.cock] bulge and expand between you as your [pc.cum] gushes from your loins to your tip. The can hear the squelching sound of your cream spraying from your tip, landing in bulges and ropes on the fabric of her quilt. You can barely see straight through your orgasm, but you have the consciousness to hope that your mistress doesn’t mind the mess you’re making. From the look on her face as she fucks against you, urging out more of your cream with every rock of her hips, you doubt she does.");
			}
		}
		else
		{
			if (pc.biggestCockLength() <= 14)
			{
				output(" Your [pc.cockHead] stresses almost painfully in your mouth, and then you’re absolutely assaulted by your own massive load of [pc.cum]. The wad that forces itself down your throat is nothing compared to the amount pooling in your cheeks, spraying out your [pc.lips], and the little hot, stinging bit that leaks out of your nose. You can barely taste it, with how much your dick is pumping into you. With your mistress pinning you down, you can’t move your cock anywhere but your face; you’d feel some discomfort from your bloating stomach and your sticky cumbath if you weren’t experiencing a full-body orgasm as the same time. Your mistress, for her part, roils her hips against your straining shaft with each pulse of cum, clearly loving watching you struggle with yourself.");
			}
			else
			{
				output(" Your shaft balloons sequentially with each wad of your thick [pc.cum]. When the first rockets from your [pc.cockHead] and onto your mistress’s bed above your head, you feel the second and the third surge from your groin and up your prick and burst from your straining dick with an audible, squishy pop. You can feel each surge press against your belly, and from the look on your mistress’s face, she can, too, and she loves it. But she keeps looking up at where your cum is landing; you can’t see the growing pool, but, even as she bites her lip and rides out another orgasm, you can tell she’s not looking forward to the future.");
			}
		}
	}
	else
	{
		// PC is female/sexless
		output("\n\nShe leans back and, with an exaggerated motion, draws her pussy forward and over");
		if (pc.hasVagina()) output(" yours, kissing your vulva with hers");
		else output(" across the blank slate of flesh that is your crotch");
		output(". She moans out and grips onto");
		if (pc.isBiped()) output(" your ankles; her claws scratch against your skin and her grip, in her passion, is tight enough to hurt a little.");
		else output(" the quilt; she grips onto it tight enough to rip some holes into the fabric in her passion.");

		output("\n\nYou both gasp out as she grinds on top of you.");
		if (!pc.hasVagina()) output(" You really wish you had some genitals to truly emphasize the sensations, but you’ll have to do with pleasuring your mistress for now.");
		output(" The heat of her body and the smoothness of her scales make the actions so much better for you. You can’t focus your eyes on any one thing, but Lane has hers focused solidly on you as she grinds her body onto yours.");

		if (pc.biggestTitSize() <= 5)
		{
			output("\n\nHer rocking is slow and methodical: she moves as much as she can in one swing before starting on the next, drawing as much stimulation for you both as possible. You can feel her juices drip onto you,");
			if (pc.hasVagina()) output(" mixing with your own");
			else output(" soaking your crotch and lathering it across your skin");
			output(". She takes deep, heavy breaths through her nose often, and soon a sly grin crosses her face.");
		}
		else
		{
			output("\n\nHer thrusting against you is slow, but it’s hard and drawn out every time. She presses down on you as hard as she can: she grunts out in pleasure as she stimulates her labia on your");
			if (pc.hasVagina()) output(" own. It sort of hurts, the way the friction drags and pulls on your poor [pc.vagina], but your mistress is having the time of her life above you");
			else output(" body. The way the friction between you pulls at your skin causes some irritation, but it’s nothing compared to knowing you’re doing right by Lane");
			output(". Her mouth opens into a large, domineering, toothy grin.");
		}

		output("\n\n<i>“You like that?”</i> Her words are punctuated with her using her body to claim yours. <i>“You like having your mistress own you with her pussy? You like being underneath her?”</i> You moan out, trying to use your words but they fall apart on your lips. <i>“Hmm... maybe I should invest in some Throbb. Give myself a nice, thick Daynarian dick. Then I could fuck you properly.");
		if (!pc.hasVagina()) output(" As properly as we can, anyway. Maybe I’ll get you some Tittyblossom while I’m at it. ");
		output(" Would you like that? Would you like to feel mistress Lane deep inside you, fucking you, and making you cum with her cock?</i>");

		output("\n\nYou still can’t manage the words, but the idea of her truly claiming you");
		if (pc.hasVagina() && pc.vaginalVirgin) output(" and taking the one thing you can still truly give");
		output(" makes you even more excited");
		if (!pc.hasVagina()) output(", which makes things more frustrating");
		output(". You lift your [pc.hips] in time with her rocking against you, wanting to feel more. She doesn’t alter her rhythm at all, but from the way she starts heaving, the idea’s a little enticing to her too.");

		output("\n\nAlready, Lane’s reaching her limit.");
		if (pc.isBiped()) output(" Her grip on your ankles tightens and she pulls harder on your body against you.");
		output(" Her blood is glowing and flashing at faster and faster rates, matching the way she can’t seem to catch her breath as she bucks and writhes. Her teeth clench, and she tenses.");

		output("\n\nYou feel a gush of feminine fluids drench you suddenly.");
		if (pc.hasVagina()) output(" Knowing that your mistress is coming, and that you’ve done your part, sets off your own orgasm, and you cum with her. You feel a pleasant burn reach from your [pc.vagina] into your spine and all over your body; your [pc.girlcum] jets from you, splashing with Lane’s, soaking both of you at the crotch. The combined smells and musks makes your head spin even harder, and with the way her lights flash, you’re seeing stars.");
		else
		{
			output(" Seeing your mistress coming reminds you of how that used to feel, and how you wish you hadn’t ever lost your genitals, but as it is, you have no way of joining Lane in her bliss. The heat and the irritation on your pelvis make your lusts burn hotter; you try to lift your hips and clench your [pc.ass] in an effort to get <i>something</i>, but there’s nothing you can do!");

			output("\n\nLane takes her time coming down from her orgasmic high. Her body twitches occasionally; her grip on");
			if (pc.isBiped()) output(" your ankles had turned vice-like in her throes, but they’re starting to ease up now that she’s calming down");
			else output(" her bed has turned it disheveled and uprooted the quilt from the edges of the bed. Her claws had ripped long holes in the fabric; you hope she has a spare handy");
			output(". Her eyes re-focus, and she looks down on you: face-scrunched, hips thrusting, breathing heavily, and searching for an orgasm that just doesn’t exist.");

			output("\n\n<i>“Poor [pc.name],”</i> she says earnestly. She hiccups happily every time you stimulate her labia. <i>“You’re so horny, but you’ve got nothing to release with. That must be a special kind of hell.”</i> She leans forward. Her heavy breasts land and rest on your [pc.chest], and she pins you still against her bed.");
			if (pc.biggestTitSize() <= 5) output(" <i>“It’s okay. Your mistress isn’t cruel. She can help.</i>");
			else output(" <i>“I could just leave you like this... but I can’t be that mean. I couldn’t imagine a life without being able to cum.”</i>");

			output("\n\nShe gently grips onto your face, forcing you to look into her eyes. They immediately start changing color, and her tassels flare open suddenly. In a flash, you’re seeing a myriad of different colors and patterns, and the familiar sensation of relaxing in Lane’s all-encompassing control soothes you.");

			output("\n\n<i>“You’d do anything to make your mistress happy, wouldn’t you, [pc.name]?”</i> You nod dumbly. <i>“You can’t orgasm. It’s okay. That must be so hard for you.”</i> Your lust rises and becomes almost unbearable – if Lane weren’t here for you, you’re sure you would lose your mind any second now. <i>“Your mistress wants you to calm down. Forget about your lusts for now. You don’t need to cum right now.”</i> At first, you don’t know what she’s saying, but right away, you feel a distinct different in your loins as your body starts to cool. <i>“That’s right. Your aches and needs feel soothed. Your mistress has achieved orgasm, and that’s pleasure enough for you, [pc.name].”</i>");

			output("\n\nShe repeats and enforces her words for another minute. Your [pc.hips] have stopped their humping against her, and the frustrations you’ve been feeling seem to evaporate into nothing. The aching your body had to overcome its ‘disability’ begins to vanish, until there’s finally nothing left, and you feel absolutely content.]");
		}
	}

	// Merge all scenes here
	output("\n\nYou pant beneath your mistress as she finishes up having her way with you. Laboriously, she climbs off of you, peeling away from the sweat clinging your bodies together.");
	if (pc.hasCock() && !cockTooBig) output(" Your [pc.cock] slips free from her cunt as she stands; it’s still hard as a rock and stands tall in the air, but it’s softening quickly enough.");
	output(" She wobbles as she stands, adjusting her tail again and again to help her keep balance after all the wild sex.");

	output("\n\n<i>“You’re an amazing toy, [pc.name],”</i> she slurs. <i>“That’ll do me for a little while yet. I think we’ve made a great decision to make you into my plaything, don’t you? I think the future’s only going to be brighter between us.”</i> You nod your agreement without getting up from your spot. Your muscles are too exhausted to lift you.");
	if (!pc.hasVagina() && !pc.hasCock()) output(" You feel completely, utterly satisfied, something you haven’t felt in a long, long time. You could swear you feel exactly as if you had recently climaxed, but you don’t recall cumming – which would be a challenge, considering your lack of equipment.");

	output("\n\nYou hear Lane shuffle around the foot of the bed, and then to one of her dressers on the side of the room. She still can’t stand straight, but she’s walking with some determination. You turn your head, and you get an eyeful of her ass, occasionally obscured by her swishing tail. She bends at the waist, giving you a clear view of her genital slit, already swallowing her happy, satisfied cunny away from your view. Despite your exhaustion, you wonder if you can’t entice her for another round.");

	output("\n\nShe turns back to you");
	if (pc.hasCock()) output(" and sees your flagging erection, slowly fighting to stay erect and go another time");
	else if (pc.hasVagina())
	{
		output(" and sees you idly playing with your [pc.vagina]");
		if (pc.hasClit()) output(", gently rubbing at your [pc.clit]");
		output(" as you stare at her");
	}
	output(". She knows the look on your face. <i>“Already? Do you love your mistress just that much?”</i> You don’t reply, and you’re too unfocused at the moment to realize what messages you’re sending her. <i>“Don’t worry, pet. We have all the time in the world to go as many times as we like.”</i>");

	output("\n\nShe turns back to her dresser and pulls out an exact set of her light, thin, airy clothing, fresh and clean as could be. <i>“But,”</i> she says as she casually dresses herself - taking her time with her shirt, for your benefit - <i>“I’m afraid sucking and fucking all day doesn’t pay for my bills. We both have some work to do, [pc.name]. Take your time getting dressed, but just remember that you have some money to make.”</i>");

	output("\n\nOnce she slips on her pants, she leaves the room without another word, leaving you to stew a bit in your afterglow. She’s right, though – you’re not going to get anything done just lying there. You’re sure your mistress would appreciate you getting a move on.");

	output("\n\nLazily, you slip off her bed and collect your clothing. When you’re dressed and halfway presentable again, you leave her room. You see Lane sitting at her desk, nonchalantly flipping through some tabs on her codex. She doesn’t even spare you a look as you pass her by and step out into the");
	//output(" desert planet Venar");
	output(" the wilds of Tarkus");
	output(" once more.");
	
	processTime(60);

	if (pc.hasCock() && !cockTooBig) lane.loadInCunt(pc, 0);
	if (pc.hasCock() && cockTooBig) pc.loadInMouth(pc);

	pc.orgasm();
	lane.orgasm();

	// Reduce lust to 0
	// Place PC one square outside of Lane’s Plane
	clearMenu();
	addButton(0, "Next", move, "287");
}

public function laneFullyHypnotisesYouDumbshit():void
{
	flags["LANE_FULLY_HYPNOTISED"] = 1;
	flags["LANE_FULLY_HYPNOTISED_DAY"] = days;

	clearOutput();
	laneHeader(true);
	
	// Lane fully hypnotizes the PC. Tier 5 aggression, basically. Start here after the first [=Next=] button once the PC pays for a normal hypnosis.

	output("Lane spreads [lane.hisHer] legs apart, already making [lane.himHer]self comfortable before your hypnotized, immobile, impressionable, compliant self... [lane.heShe] doesn’t say anything as [lane.heShe] stares at you, rubbing [lane.himHer]self through the fabric of [lane.hisHer] pants and undergarment, arousing [lane.himHer]self as [lane.heShe] imagines the oh-so-delectable things [lane.heShe] could make [lane.hisHer] absolute favorite customer do...");

	output("\n\n[lane.HeShe] frowns to [lane.himHer]self, and [lane.hisHer] eyes wander for a moment. [lane.HeShe] begins to fight with [lane.himHer]self silently, trying to decide if [lane.heShe]’s gone too far already and if [lane.heShe] should just give you what it is you paid for... but that’s a short lived battle, and [lane.hisHer] eyes lock on yours once more, steeled with dangerous, predatory resolve. " + lane.mf("The nub of his penis slowly but determinately erecting underneath his clothing is plainly visible, and he paws at it with one hand.", "Moisture begins to dampen the center of her undergarment as she palms at herself idly, and her musk joins the incense of the candles in your nose."));

	output("\n\n<i>“[pc.name]”,</i> [lane.heShe] says, but of course, you don’t answer. <i>“You can no longer stand it. Lane is everything you ever wanted in life. You can’t bear the thought of leaving [lane.hisHer] hut today without fucking [lane.himHer]. " + lane.mf("You want his dick in your mouth; the taste of his cock on your tongue and the feel of his cum in your throat is the greatest pleasure in your life. You want his dick in your ass; knowing that Lane is inside you, owning you, and dominating you, will forever be your wildest, most desirable indulgence.", "You want her cunt in your mouth; her cum is finer than any wine, sweeter than any honey, and smoother than any malt. You want her to dominate you; being underneath her as she asserts herself is where you belong, and nothing is more relieving, more thrilling, or more pleasurable than being where you belong.") + " You will surrender yourself, mentally, physically, and emotionally to Lane, and you will not object to whatever [lane.heShe] desires. [lane.HisHer] wishes, [lane.hisHer] kinks, and [lane.hisHer] desires are now yours.”</i>");

	output("\n\n[lane.HeShe] spends far longer reinforcing [lane.hisHer] new commands on you than [lane.heShe] ever has on anything before, and you absorb every word and every command [lane.heShe] tells you. You’re in the room for the better part of an hour as [lane.heShe] reprograms you into being [lane.hisHer] new sex slave, and you, helpless and enraptured as you are, are defenseless against [lane.hisHer] unrelenting onslaught of suggestions.");

	output("\n\nSuddenly, your eyes, and your mind, clear completely. You blink, the familiar dizziness and ringing ears welcoming you back to the conscious world. You shake your head, trying to re-familiarize yourself with the waking world, and when you open your eyes, the first thing you see is Lane, sitting across from you, [lane.hisHer] elbows on [lane.hisHer] desk and [lane.hisHer] chin in [lane.hisHer] hands. <i>“How do you feel?”</i> [lane.heShe] asks you innocently.");

	output("\n\nYour eyes focus solely on [lane.himHer], and... something comes over you. Your breathing quickens, your heart races, and your head becomes light, likely from all the blood rushing from it to your loins. A sort of dissatisfaction washes over you, and you crave something, something from Lane. You see hundreds of images in your mind in quick succession – some of them are panicky, trying to get you to get up and run from [lane.himHer], but everything else sees you on your [pc.knees], pleasuring Lane with your mouth, or on a bed," + lane.mf(" [pc.legOrLegs] in the air", " on your back") + " as [lane.heShe] pounds you – fucks you - <i>claims</i> you and <i>owns</i> you for [lane.himHer]self. Your imagination soars blissfully with the idea of giving yourself to [lane.himHer] and [lane.hisHer] pleasure, of letting [lane.himHer] control your wants and your actions and your life.");
	if (pc.hasCock()) output(" [pc.EachCock] is raging hard in your pants, already nearly at full mast, more than eager for the pleasures it knows Lane would bestow upon you for your obedience.");
	else if (pc.hasVagina()) output(" [pc.EachVagina] throbs, oozing your girlcum into the fabric of your [pc.armor] and further influencing your mind into following through with your perverted fantasies.");

	output("\n\nYour body makes your decision before your mind does, and you leap from the chair, practically vaulting over the open end of Lane’s desk to place yourself at [lane.hisHer] feet. [lane.HeShe] turns in [lane.hisHer] chair, smiling wickedly, and opens [lane.hisHer] legs, letting you nestle yourself between them. You begin to rub your [pc.face] against the fabric of [lane.hisHer] pants, your cheeks against [lane.hisHer] thighs and your nose ever so close to [lane.hisHer] crotch – [lane.hisHer] musk wafts from [lane.himHer], filling your nose and your mind with more perverted images. " + lane.mf(" His bulge is very well defined and pronounced, and thoughts of his wonderful, delicious cock filling your mouth make you salivate.", " The scent of her moist, hungry cunt is overpowering, and you see her juices beginning to seep through her fabrics. Thoughts of her using it to dominate you make you ache for her even more."));

	output("\n\n<i>“And just what are you doing, [pc.name]?”</i> [lane.heShe] asks you, somewhat condescendingly, though [lane.heShe] makes no movement to stop you from your nuzzling and massaging. Your [pc.tongue] snakes from your [pc.lips] and flicks at [lane.hisHer] clothed crotch, but [lane.heShe] swats at your head, not enough to hurt, but enough to get the message that you may not act unless [lane.heShe] allows you.");

	output("\n\n<i>“Please!”</i> you beg [lane.himHer] shamelessly, lowering your head. <i>“I want you, Lane! I... I won’t leave until you fuck me! I’ll do anything; I’ll do whatever you ask! Just... just let me have you!”</i>");

	output("\n\n<i>“Anything?”</i> [lane.heShe] asks you, and you confirm three times. Lane is <i>so close</i>, but [lane.heShe] won’t let you close that last little distance that’ll make you " + lane.mf("his", "hers") + ". [lane.HeShe]’s very clearly aroused and enjoying your begging and pleading, but [lane.heShe] just won’t let you! <i>“I want you to tell me that you’re mine forever, [pc.name].”</i>");

	output("\n\n<i>“I’m yours! I’m yours until the day I die!”</i>");

	output("\n\n[lane.HeShe] hums to [lane.himHer]self. <i>“Starting tomorrow, I want you to wire me five hundred credits each and every day that you are mine, [pc.name].”</i> You look up at [lane.himHer], surprised, mouth agape – your mind is racing with ways you could possibly afford that. <i>“That should be chump change for the heir");
	if (pc.mf("m", "f") == "f") output("ess");
	output(" of Steele Tech, I think.”</i>");

	flags["PC_PAYS_LANE_ERRY_DAY"] = 1;

	output("\n\nFrantic, you begin to explain that you haven’t actually inherited the business from your father yet. [lane.HeShe] listens to you ramble, but when the message is made clear, [lane.heShe] tells you to stop. <i>“If you can’t afford it, just wire me what you have. I’ll trust you. You wouldn’t ever lie to me, would you, [pc.name]?”</i> You shake your head, vehemently telling [lane.himHer] that you would never dream of it.");

	output("\n\n<i>“There’s one last thing. One last thing, and then I’ll give you,”</i> [lane.heShe] says, using [lane.hisHer] hands to frame [lane.hisHer] crotch, <i>“what you want.”</i> You don’t dare move or speak, listening rapturously for whatever else [lane.heShe] has in mind for you. <i>“From now on, I want you to call me your " + lane.mf("master", "mistress") + ". You will no longer address me as Lane, or as " + lane.mf("mister", "missus") + " anything. I own you now, [pc.name], and I demand respect from my pets.”</i>");

	output("\n\nYou beg and plead with your " + lane.mf("master", "mistress") + ", asking them to give you what you need, to douse the fire in your loins, to physically claim you as " + lane.mf("his and his", "hers and hers") + " alone for the rest of your life. Wordlessly, [lane.heShe] grabs you by the collar of your [pc.armor], lifting you up. You feel some anxiety, pulled from [lane.himHer] as roughly as you are, but your fear turns to curiosity as [lane.heShe] leads you behind the curtain splitting the room in half once more. Instead of turning towards the hypnosis room, [lane.heShe] turns to [lane.hisHer] left, and shows you through the second door.");

	output("\n\nIt leads to what looks to be Lane’s bedroom. It’s a modest place, all told: there are two dressers leaning against both the left and right walls, and a small nightstand sitting in the corner with a large lamp on top of it. Pressed against the far wall is a queen-sized bed with a thick, fluffy, plain white quilt atop of it. Rather than windows on the walls, there’s a large skylight above the bed with a thick pane of glass set in it. Everything is kept quite clean and tidy, but the room is very plain and without much personality.");

	output("\n\nLane turns and, with [lane.hisHer] other hand, grasps you by the [pc.hips] and roughly spins you towards [lane.hisHer] bed, tossing you onto it. You land on your back, and just as you regain your bearings, you see Lane standing at your [pc.feet], effortlessly ripping off [lane.hisHer] airy shirt and tearing through [lane.hisHer] pants. Using [lane.hisHer] claws, [lane.heShe] rips through the tougher fabric of [lane.hisHer] undergarment, " + lane.mf(" and you finally lay eyes on the twenty-four centimeter long Daynarian cock. It’s only six centimeters thick, but, before your very eyes, with every throb, it grows thicker and thicker. He has no testicles, which you sort of expected, but makes you sigh disappointedly either way – they would have been fun to play with.", " and you finally see the Daynarian treasure you’ve waited your whole life for. Her cunt is the most erotic thing you’ve ever seen: it’s surrounded by a tough genital slit that, with every throb of her heart, opens wider to reveal Lane’s concave labia, teasing themselves open for you. She does not have a clitoris, which you didn’t expect."));

	output("\n\nStill lying prostrate on [lane.hisHer] bed, you begin to strip off your own clothing, until you’re as naked as [lane.heShe] is. Lane looks down at you, " + lane.mf(" both hands stroking his engorging cock,", " one hand teasing her sopping wet cunt while her other plays with her nipple-less boob,") + " smirking at you, seeing how ready and willing and wanting you are for [lane.himHer] on [lane.hisHer] bed.");

	output("\n\n[lane.HeShe] doesn’t waste any more time.");

	processTime(60);
	//[=Next=]
	clearMenu();
	addButton(0, "Next", laneSexSelection);
}

// The doc had a comment that claimed this scene was for the following configuration:
// 		Lane is Male, PC is Male or Genderless.
// However, the scene made a reference to the PCs cervix. So, yeah.
public function firstTimeLaneMPCM():void
{
	clearOutput();
	laneHeader(true);

	output("Lane crawls forward, paying no heed to");
	if (pc.hasCock()) output(" [pc.eachCock]");
	else output(" your body or needs");
	output(" as he slithers forward, his body rubbing against yours in a sensual yet predatory way. The feel of his glowing skin against yours is electric, and you shut your eyes in pleasure. You reach up with your hands to stroke along his skin. <i>“Hands to yourself,”</i> he commands you, and you comply, whimpering like a spoiled child without [pc.his] candy.");

	output("\n\nLane’s hands clamp down hard on your skull, and you’re nudged hard in the [pc.face] as Lane’s unique, undeniable scent assails your nostrils. You open your eyes to see yourself eye level with his quickly engorging and expanding cock; its base rubs against your upper lips while its tip reaches up between your eyes and out of your vision, and it just continues to grow. The skin of his dick is very thick; you can’t see any vein or blemish along its smooth surface. The skin is a dull, fleshy pink, but its hue changes slightly from pinkish to a more grayish color on Lane’s excited heartbeats.");

	output("\n\nLane humps himself against your face, rutting his thin (but thickening) dick all the way from his base to your bottom [pc.lip] to the bridge of your nose, and from his tip to the bridge of your nose to well into your [pc.hair]. He rocks your head for you with his strong grip on your skull, making sure that he’s always in control. You whine, snaking your tongue out to press it against his dick as it slides across your face. He sighs in relaxation when your wandering tongue presses over his shaft, and he grunts in jubilation when you lick along his base, rutting faster against you.");

	output("\n\nBefore your very eyes, his shaft continues to bloat and expand. It doesn’t get much longer, but when he first started, it was only as thick as your finger; with every hump he makes against your face, marking his scent on you, its girth keeps getting wider and wider, and you don’t see it stopping anytime soon.");

	output("\n\nLane grips onto his smooth Daynarian dick by its base, and he whacks it against your face several times; the tip slaps into the curve of your cheekbones, splashing a bit of his clear precum over your vision and into your [pc.hair]. He teases by beating his meat against your face, delighting your vision, warming your face and enticing your waiting, thirsty mouth. <i>“Open your mouth,”</i> he commands you, and you’re all too happy to, knowing what’s coming next, but the simple act of doing what Lane commands you to gives you such an electric thrill as well.");

	output("\n\nHe shifts back and traces along your open [pc.lips]. You can feel it leave behind a trail of his juices, wetting your lips for you, until he’s made a full circle. He descends, slowly at first, running his length across your [pc.tongue], and you moan at finally, <i>finally,</i> getting what you’ve wanted since you first saw him. Your lips close without his consent, but from the way he continues to sink into you and the way he moans when the flaps of his genital slit meet your face, he doesn’t mind. You suckle on him, cherishing the juices he gives you and swallowing them thankfully; you’re eager to get more.");

	output("\n\nHis length delights your [pc.tongue] and his taste sets your mouth positively aflame. He pulls back, driving his tool over as much of your mouth as he can, renewing your taste. He pauses, enjoying but unused to his position over you. He thrusts again, and again, and soon, once he’s comfortable with his domineering position, he’s outright fucking your face, and not only do you let him, you love it. Unable to touch him – much as you want to grope and squeeze at his ass, and stroke at his tail, and grip his ankles for support – your hands instead go to your");
	if (pc.cocks.length == 1)
	{
		output(" [pc.cock], stroking along it in time with Lane’s thrusting");
		if (pc.balls > 0) output(" and fondling your [pc.sack] in tandem");
		output(".");
	}
	else if (pc.cocks.length > 1)
	{
		output(" [pc.eachCock], pumping them alternately with Lane’s hungry thrusting.");
		if (pc.cocks.length >= 3) output(" Unfortunately, you only have two hands; the rest of you bounces along with the ride, hard as a rock and leaking your fluids in the vain hope for some attention that never comes.");
	}
	else output(" [pc.ass], kneading and squeezing the cheeks in a desperate attempt to pleasure yourself. It helps, but only somewhat.");

	output("\n\nLane is a little more forceful than you’d have expected: he hammers roughly into your face, slamming and bruising your poor [pc.lips] with his crotch. His hands toy roughly with your [pc.hair], which hurts, but it’s a sexy kind of hurt, because Lane is doing it. His tip drains itself directly into your throat, and it touches and tickles your uvula occasionally, threatening to make you heave. You’re sure that he’s aware of that, though, and whatever he wants, you want. You relax and continue to pleasure yourself");
	if (!pc.hasCock()) output(" as best as you can");
	output(" as he uses your mouth and your eyes are treated to as spectacular a light show as you could have asked for.");

	output("\n\nHis dick has been inflating this whole time, to your delight; what was the width of a pair of fingers is now wide enough to fill every part of your mouth with his delicious cock. Sucking on him and pressing your lips together against him just <i>feels</i> good, and your taste buds delight in the constant, copious cream he’s spraying into you.");

	output("\n\nOne particularly rough thrust makes you croak just a little, though, and he looks down at you. <i>“I must not have told you,”</i> he grunts out. He doesn’t slow his thrusting down at all, but he’s beginning to pant a little. <i>“Daynarian cocks aren’t like your usual cocks. We’re not satisfied with just the tip.”</i> He thrusts again and keeps himself buried in your mouth, and he rubs his crotch, pressed firmly against your face, back and forth across your skin. <i>“All our nerve endings are in the base.”</i> Grind; scrape. <i>“It’s so we want our dick as deep as we can get, to better plant our seed.”</i>");

	output("\n\nSuddenly, Lane is overcome with inspiration. He pulls his cock from your throat, much to your trepidation. You look up at it with a wanting gaze; dripping with your spit and leaking its own fluid, it looks so much longer and thicker than when it first went back in, and your imagination races with how much bigger it would get if he just put it back in your mouth where it belonged. <i>“Turn over,”</i> he tells you; your eyes light up and your [pc.ass] clenches together in glee.");

	output("\n\nYou do as he commands quickly and easily, and you raise your lower end up at him, hoping to feel your master inside you, claiming you by claiming your most private, personal spot. He laughs at your enthusiasm, but he obviously shares it: he swats down on your [pc.hips] hard, and he presses his own forward, dragging his hot, hard dick up through the cleavage of your ass");
	if (pc.balls > 0) output(". As he presses forward, the base of his cock just kisses the bottom of your [pc.balls], causing them to lurch and tense, nearly ready to shoot their load, if only they had just a little more stimulation...");
	output(". You brace your upper body with your arms, and though you regret not being able to masturbate, you’re sure the pleasure your master will give you will be more than enough to bring you over.");

	output("\n\nHis cock teases and plies against your butthole, digging in but feinting out at the last second, just before penetration. You clench your teeth together as you wait for him to finally do what you were <i>born</i> for and make you his, but he just doesn’t do it. <i>“Please, master Lane!”</i> you gasp out pitifully, backing your ass onto him and squishing his cock between your cheeks, hoping the extra incentive will entice him.");

	output("\n\nNot much for conversation, he obliges wordlessly and drives his tip into your asshole. Your wait to exhale is over, and you sigh as you’re split open the way only he can. You feel such a sense of <i>rightness</i> as the thick, wet skin of his special Daynarian prick pushes past your sphincter: the deeper he goes, the weaker you feel – no, that’s not right. The more you give to Lane, the stronger he becomes, and you feel a very divine, and a little perverse, pleasure at helping Lane assert himself over you. ");
	pc.buttChange(lane.biggestCockVolume(), true, false, false);

	output("\n\nLane presses forward until his body claps against yours, and your arms give out from underneath you, lowering your [pc.chest] into the quilt of his bed and raising your [pc.ass] for him to better conquer. Lane sighs too, feeling his dick buried all the way to the base by your hungry, demanding asshole, which clenches and squeezes around him for his benefit. The sensation begins to wear for him, and he’s quick to begin thrusting once again.");

	output("\n\nEvery slam of his into you is hungry and wanton, eager to bury himself until the sensitive nerves in his base are delighted at the warmth and slickness of your asshole. You begin to bliss out, yourself; every outward thrust leaves you teased and unsatisfied, and every inward thrust fills you and comforts you in ways you had never felt before.");

	output("\n\nHis thrusts begin to even out at a steady pace, slower than you know he’s capable of. He lingers every time he buries himself inside you, and every thrust is hard, strong, demanding, aggressive, almost angry; you love every single one and how they tickle you in different ways every time. Lane snarls like the feral lizard he evolved from; his claws dig and scrape against your [pc.hips] – you don’t care if they’ll leave marks or scars or if he makes you bleed, because then you’ll have something to remember the day he finally helped you realize your true station in life.");

	output("\n\nLane’s breath starts coming out in ragged, heaving strokes, and the lights coming from him begin to pulse more erratically. He’s thrusting faster, and you know he’s very close;");
	if (pc.hasCock())
	{
		output(" you reach down with one hand and start stroking your [pc.cock] in excitement");
		if (pc.cocks.length == 2) output(" while your [pc.cock 1] bounces shamelessly against your stroking knuckles");
		else if (pc.cocks.length >= 3) output(" while [pc.eachCock] flops and slaps against your stroking knuckles and heaving belly");
		output(".");
	}
	else output(" you reach back with one hand and knead and pull at one of your asscheeks, desperate to bring Lane to climax by masturbating him through your glutes.");
	output(" <i>“Come for me, master,”</i> you say to him, your own voice hoarse and needy. <i>“Take me!”</i>");

	output("\n\nHe’s more than happy to oblige, and with a long, shuddering grunt, he finally unloads his holy seed deep inside you. You feel his cock lurch and expand inside you as he leans forward, covering your back with his front. Warmth begins to spread inside you; a different warmth flows all throughout your body as you feel a sort of spiritual release at being the one Lane chose to bless you with his gift.");

	output("\n\nYour spiritual release is followed by a very physical one:");
	if (pc.cocks.length >= 1)
	{
		if (pc.cumQ() <= 349)
		{
			output(" your own [pc.cock] bulges in your pumping fist and lurches forward, spraying your [pc.cum] forward and onto his bed. Your orgasm pales in comparison to Lane’s, much like most of your other qualities; you last only several spurts before you’ve decorated Lane’s quilt as much as you can. But that doesn’t mean you stop cumming – though you’re dry, the feel of Lane continuing to burst inside you drives you to more and more orgasms, and you thank him for each and every one");
			if (pc.balls > 0) output(", even as your [pc.balls] begin to sting somewhat from the strain");
		}
		else if (pc.cumQ() <= 1200)
		{
			output(" your own [pc.cock] expands in your beating fist and you orgasm hard, joining your master Lane in his glory. Your [pc.cum] flows steadily and freely from you, and you match Lane burst for burst: with every pulse you feel reach deeper inside you, you shoot another heavy load onto his quilt. You shout your praise to him with each and every lewd pulse; your hand is covered in your semen and some bursts reach high enough to splatter onto your [pc.chest]. Your orgasm ends with Lane, almost perfectly on-sync, almost like some sort of true-love adult fairy tale");
		}
		else
		{
			output(" your fingers are pushed apart by your rapidly expanding [pc.cock] as you blast your [pc.cum] all over master Lane’s quilt. As great and incredible your perfect master is, there’s just no way he can keep up with your production: he grunts and paints your insides with every thrust, but your heady stream doesn’t ever stop for him – it only gets thicker sometimes. You feel him begin to peter out, but you just keep going until your cream begins pooling around your [pc.knees] and spilling over the sides of his bed");
			if (pc.balls > 0) output(". Your heavy, happy [pc.balls] tense and bounce with your incredible orgasm, and by the time you’re finally done, you feel a certain lightness to them that you haven’t felt in a while");
			if (pc.cumType == GLOBAL.FLUID_TYPE_HONEY) output(". The wonderful scent of fresh, thick honey rises to your nostrils, drowning out the heavy smells of your lovemaking");
		}
		output(".");
	}
	if (pc.cocks.length == 2)
	{
		output(" Your [pc.cock 1] thrusts and bounce in time with the one in your hand, spraying even more of your [pc.cum] all over Lane’s bed and underneath your body, adding to the glorious mess your master made you do.");
	}
	else if (pc.cocks.length > 2)
	{
		output(" [pc.EachCock] thrusts and bounce in time with the one in your hand, spraying even more of your [pc.cum] all over Lane’s bed and underneath your body, adding to the glorious mess your master made you do.");
	}
	if (!pc.hasCock())
	{
		output(" although you have no outlet, you feel a quivering, wonderful feeling emanating from your [pc.ass], reminding you of what an orgasm felt like before you lost your genitals. Lane, your beautiful master, has fucked you so well and thoroughly that he can bring you to orgasm even when you have nothing to cum with!");
		if (pc.balls > 0) output(" The endorphins even relax your [pc.balls], causing a delightful numbness to spread from them, making you forget about their frustrating fullness, if only for now.");
	}

	output("\n\nThe flashing lights of Lane’s body begin to wane as he calms down. You’re so happy that you’re seeing stars; you can’t believe how finalizing, how enlightening, it really felt to be taken so thoroughly by your rightful master. The sound of his satisfying panting and the feel of his tested and toned body flopping onto yours are both the most wonderful things you could hope to experience.");

	output("\n\n<i>“You’ve done well, [pc.name],”</i> he tells you. His words bring a flutter to your heart");
	if (pc.hasCock()) output(" and a lurch to your loins");
	output(". You’re so thrilled that you’ve pleased him! <i>“I think I’ve made the right decision in choosing you to be my cumdump.”</i> You assure him that it’s a station in life that you’ll never take for granted.");

	output("\n\nYou both spend some time on his bed, recuperating and basking in each other (you more than him, however, but that’s okay with you). You feel him go soft inside you until his delightful Daynarian cock eventually slips from your [pc.asshole]. You wiggle your ass on him, trying to entice him for more, but you frown when you realize the fun’s over for now. You’re nonetheless pleased with yourself and the knowledge that you’ll always carry a part of him in you from now on.");

	output("\n\nAll told, an hour passes between when you started and when Lane finally gets up off of you. He doesn’t seem to care about");
	if (pc.cumQ() <= 1000)
	{
		output(" the cum you’ve shot onto his quilt");
	}
	else
	{
		output(" the veritable lake of cum you’ve submerged his room in");
	}
	output(". He makes his way to the dresser against the far wall, and he redresses himself in a spare set of white, airy clothing. When he’s done, he looks just like the day you met him.");
	
	if(flags["LANE_MALE_SEXED"] == undefined || flags["LANE_MALE_SEXED"] == 1)
	{
		output("\n\n<i>“Here’s the deal, [pc.name],”</i> he says. You listen to his words raptly. <i>“You’re going to wire me five hundred credits every twenty-four solar hours. If you can’t afford it, just send me what you have.”</i> You nod in understanding; you had agreed to this before. <i>“If you want to be hypnotized again, I’ll charge you the regular fee for the regular service. But you’re... going to pay me a tax. The ‘Body Tax’. I’ll be taking a little extra from you physically.”</i> You feel a fire beginning to stoke in your pelvis, and you tell him that you’re looking forward to it.");
	}
	output("\n\n<i>“That’s a good pet,”</i> he tells you. <i>“Now, get dressed. As much as I’d like to fuck you every hour of the day, it doesn’t pay the bills. Go out there and make me my money.”</i> He then leaves you alone in his room, without so much as a glance. But you like that quality about Lane – a sort of hard, unforgiving singularity of a man who takes what he wants. Thinking of him as a vicious sexual conqueror makes you hot all over again.");

	output("\n\nStill, you do what you’re told. In just minutes, your [pc.armor] is back on, and you leave his bedroom. Lane is sitting at his desk as though nothing had happened; you give him a sultry grin that he does not return, before you leave his little hut and return to the");
	//output(" caves of Venar");
	output(" wastes of Tarkus");
	output(".");

	// Lust reduced to 0, time progresses by 1 hour, place PC one square outside Lane’s Plane
	processTime(60);

	pc.loadInAss(lane);
	pc.loadInMouth(lane);

	lane.orgasm();
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", move, "287");
}

public function firstTimeLaneMPCFH():void
{
	clearOutput();
	laneHeader(true);

	output("Lane is quick to flop his body atop yours and roughly grip onto your [pc.fullChest]. You wince at the way his claws dig into your skin, but the feeling of him pressing himself against you is far more pleasurable than any pain he might inflict. You squeeze your legs together");
	if (pc.hasCock()) output(", enjoying the way [pc.eachCock] grows and inflates against his warm, smooth, lower-belly scales. You get a warm spike of pleasure with every movement you both make against each other.");
	else
	{
		output(" and you raise your [pc.hips], humping your [pc.cunt] against his warm, smooth lower-belly scales. It’s a difficult angle to get, but with every push");
		if (pc.hasClit()) output(" you get against your [pc.clit]");
		output(", your eyes cross and your mouth gets a little drier.");
	}

	output("\n\nLane mauls at your [pc.fullChest], squeezing and pulling at your flesh. He growls at you predatorily, bearing his dripping teeth and showing his flapping tongue in his elongated mouth. As much as you want him, you don’t want him to bite you... he lunges forward, startling you, and you brace yourself for the pain (sexy as it would be, coming from Lane), but what you feel instead is the hungry licking and sucking on your [pc.nipples].");

	output("\n\nYou heave your chest into his maw, enjoying the new wet sensation on your chest and loving the delectable sounds of his tongue slurping on your [pc.skin]. He humps his waist against you the whole time, grinding his expanding dick against your thigh. You moan out as you trail your hands down his scaly, rough back, your fingers bumping over each ridge and crevice exquisitely until you reach the base of his tail. You deftly wrap your fingers around it, tugging, massaging and tickling at it, groping what little ass muscle he has, for his pleasure.");

	output("\n\nAs you do that, Lane’s appetite for your breasts is voracious: his tongue is quick and deft, swishing over your sensitive mounds, across your [pc.nipples], and through the cleavage between them as he transitions to your other boob and repeats the process. The sound of Lane hungrily sucking and licking at you like a beast makes you all the hornier.");
	if (pc.biggestTitSize() <= 1) output(" As you feel his long tongue mark your chest, you moan in both pleasure and disappointment; it feels great – beautiful, even, the way he samples you – but you can’t help but feel a little self-conscious about your cup size. From the way he’s going at it, though, maybe he’s a fan of tiny titties...");
	else if (pc.biggestTitSize() <= 7) output(" You thrust your [pc.chest] higher, eager to feed more of them to him, to feel his mouth wrap around your two proud puppies, to feel his teeth nip at your skin excitedly and to feel his breath wash between them... you’re just as absorbed into Lane as he is into you. You flex your arms against them, squeezing them together, thrusting your [pc.nipple] further along his tongue.");
	else if (pc.biggestTitSize() <= 18) output(" You love the way Lane sinks his face into your chest as he presses forward. He makes you feel so wanted, so sexy; he gently but demandingly nips at the flesh of your [pc.chest], groping at it aggressively with his face. It takes him some time to cover you in his saliva as he slobbers over them, but you’re more than happy to lay there and let him have his way with you. From the way his cock slides against your thigh as his humps grow more insistent, he’s certainly enjoying himself.");
	else
	{
		output(" Lane positively disappears between your [pc.chest], sinking into them as he licks and sucks and kisses and nips. You sigh, enjoying the way he determinately enjoys every little bit you give him; his brown lizard skin disappears in the valley of your boobs, but you can feel everything he does to you. You’re going to have hickeys in places you didn’t realize you had, and you’re looking forward to it. Lane’s hips are positively pumping against you in his excitement; maybe he’s a fan of");
		if (silly) output(" tig ole’ bitties?");
		else output(" boobs as boisterous as yours?");
		output(" Maybe he’ll enjoy it if you make them bigger, too...");
	}
	if (pc.hasFuckableNipples())
	{
		output("\n\nYou leap in pleasure each time Lane’s tongue passes over your [pc.nipples], and you moan and whimper for him to continue without actually telling him. Lane doesn’t stop or even slow his exploring of your body, but he’s quick to get the hint every time his tongue tastes the different tastes and textures of your extraordinary nipples. You become wetter along your [pc.chest] than you are between your legs, and not just because of his saliva.");
	}
	else if (pc.hasNippleCocks())
	{
		output("\n\nYour [pc.nipples] extend from your chest until they’re at their full, rock-hard length, standing proud atop your mounds. Lane is clearly aware of them, and he takes his time coating them with his spit like he does the rest of you, but he’s otherwise much more interested in the rest of your breast flesh.");
	}
	else if (pc.isLactating())
	{
		output("\n\nYou sigh as his administrations cause your [pc.milk] to flow from the tips of your [pc.nipples]. Whenever he gropes at a particularly sensitive spot, a splurt of it shoots out a few centimeters and then dribbles down your supple [pc.skinFurScales]. When [lane.heShe] first tastes it, he pauses, unfamiliar with the taste or the sensation. He reaches up and squeezes one of your tits, and is surprised when some more begins to flow from you. He otherwise pays it no mind, though – he cleans wherever your milk lands, but he doesn’t seek it out.");
	}
	if (pc.breastRows.length == 1)
	{
		output("\n\nHis four-fingered hands aren’t idle. They stroke along your skin; across waist and your [pc.hips], under your [pc.chest] and over your ribs. They squeeze at you, stress-testing their new property. They clench at your [pc.ass] and grope along your thighs. The way he tickles and massages you make you feel so good and loved – and they reassure you that Lane feels the same way.");
	}
	else if (pc.breastRows.length >= 2)
	{
		output("\n\nHis hands busily grope and feel along your [pc.fullChest], and wherever his mouth doesn’t reach, his webbed hands are more than ready to pick up the slack. You coo, loving the way he doesn’t neglect any part of you. His excitement begins to escalate further as his face travels to your other breasts, judging from the way his humping becomes more insistent – he must be a real fan of boobs, big or small.");
	}
	if (pc.hasCock())
	{
		output("\n\n[pc.EachCock] stands between you insistently, absolutely pouring your pre down your shaft and pooling at the base of your stomach");
		if (pc.balls > 0) output(" and where your base meets your [pc.sack]");
		output(". Lane’s smooth belly scales rub sensually against you, and you love the electric feeling of it, but he grunts in displeasure at the way it pokes at him while he’s busy with your [pc.chest]. Disappointed but understanding that Lane’s wants are yours, you shift your hips so [pc.eachCock] flop");
		if (pc.cocks.length == 1) output("s");
		output(" to the side and rubs against his hip rather than his stomach.");
	}

	output("\n\nHis licking eventually trails upward, across your neck and up to your jaw. [lane.HisHer] body begins to cover you as he finds his way up, pressing against you possessively, and you moan in appreciation. His tongue begins to lap up your chin and across your [pc.lips], and you open them, knowing what he wants. His kiss is very dominant and almost affectionless: the raw sexuality of the way his tongue presses and pins yours while he bears down on you, forcing you deeper into the mattress, makes you melt. The way he controls you so effectively makes you shudder in ecstasy.");

	output("\n\nJust as the tip of his tongue begins caressing your palate, he withdraws, much to your chagrin. Instead, he sits up and onto his knees, towering his body over yours. His tassels are flared wide open, and his pulse is quick and excited, but unfocused; the lights of his piercings and the swirls of his tattoos sink you into him, just as, from the way he adjusts his pelvis and begins aligning his with yours, he will soon be sinking into you.");

	output("\n\nHe sits on his knees, rubbing his pink, smooth, tapered Daynarian cock against your waiting mound. He grinds it against your");
	if (pc.hasClit()) output(" [pc.clit]");
	else output(" labia");
	if (pc.balls > 0) output(" and up the crease between your [pc.balls]");
	output(" like he had against your thigh; with each thrust, an electric, exciting jolt goes through your body, but it’s not enough to satisfy you. He moans out every time the base of his dick brushes against your vulva, and he lets his thick base rest there for a moment before he backs up and teases you again. It’s frustrating and teasing, but you love every bit of it.");

	output("\n\nEventually, he tires of that, and he grips onto his shaft as he pulls back. Your mouth waters in anticipation: the moment you were born for is just a thrust away! You grip onto his quilts, bracing yourself for the moment he buries himself in you and takes you the way only a real man like him could. The point of his dick traces the lips of your [pc.vagina], testing the waters, before he finally pushes in.");

	output("\n\nEvery centimeter he goes into you is divine.");
	if (pc.hasCock()) output(" [pc.EachCock] stands tall and almost painfully hard between you, wishing for some action, but he outright ignores your masculine half.");
	output(" His hands trail to your [pc.hips], and he squeezes them roughly – you feel his claws pinch against your skin as he gropes you, and you almost hope it leaves a mark, if only so you’ll have proof of your consummation later. He rolls his hips forward, and you go cross-eyed: every push against your walls lights another firework in your senses. You look down,");
	if (pc.biggestTitSize() <= 19)
	{
		if (pc.biggestTitSize() >= 8) output(" straining to see over your sizeable bust,");
		output(" to your pelvis as he pushes in. His skin is glowing so brightly and frequently, you’re curious to see if you could see the light of his cock through your waist. Unfortunately, that’s not the case – that would have been so kinky!");
	}
	else output(" trying to see over your titanic tits, but they’re way too huge so see over. You try to wrap your hands around them and pull them apart, but it’s no use. You sigh. You were curious if the glow of Lane’s blood was strong enough to see through your skin, now that he’s inside you. That would have been so kinky to see!");
	output(" The thought sends you that much closer to cumming, but you resolve to hold back. You want to come with your master.");

	output("\n\nHe exhales once he’s buried as deep inside you as he can. You writhe beneath him: he’s the <i>perfect</i> length for you, tickling and caressing your most sensitive spots without overloading or overbearing you. He backs up, making you feel cold for a moment, and he thrusts back in, harder. Is it just you, or is he getting thicker? God, you hope so! ");
	pc.cuntChange(0, lane.biggestCockVolume(), true, false, false);

	output("\n\nYou can do nothing but gasp and squirm beneath him as he works you, fucking his dick into your [pc.vagina] again and again, and each thrust sends you to worlds you haven’t explored yet. He’s particularly harsh on his inward thrusts, then he pauses as his base kisses your sensitive cunny, then he’s quick to pull out and repeat. You feel so weak – but in a good way. Your grip loosens on the quilts in your pleasure. You bring both your hands to your [pc.chest],");
	if (pc.biggestTitSize() >= 3) output(" massaging them and pressing them together for master Lane’s benefit");
	else if (pc.biggestTitSize() <= 2) output(" pinching at your [pc.nipples] in an effort to bring you closer to orgasm");
	output(".");

	output("\n\nAs much as you love Lane and the way he’s drilling you, he’s not the most gentle of lovers. One particularly powerful thrust makes you wince, but it’s a sexy kind of wince, because Lane made you do it. It doesn’t go unnoticed, and his eyes lock to yours. <i>“I must not have mentioned,”</i> Lane says, his voice ragged with his breath. You strain to hear him over your heartbeat and the sound of his hips slamming into yours. <i>“Daynarian dicks aren’t like your typical tool. Most of our nerve endings are in the base.”</i> The tempo of his thrusting doesn’t change, but they get stronger, and he begins to pant. <i>“We’re not satisfied with just the tip. It’s another evolutionary advantage: it’s so we want to go as deep as we can to plant our seed.”</i>");

	output("\n\nYou try to focus on what he’s saying, but it’s hard when every other sense demands your attention. He said something about his dick, and wanting to go deep. That’s good enough for you! <i>“Go deeper, master!”</i> you encourage him, lifting your [pc.hips] with every inward thrust, no matter how painful it may feel. <i>“I want you to come in me! Fill me! Make me yours! I want to feel your cum in me when I leave!”</i>");

	output("\n\nYour dirty talk seems to have an effect on him, and his thrusting finally increases in speed, as does the pulsing of his lights. His cock is so hard inside you – you’re <i>positive</i> it was actually getting thicker, too. His breathing starts coming out in more rapid bursts, and you brace yourself for the explosion that’ll remake you as Lane’s property, now and forever.");
	if (pc.hasCock()) output(" [pc.EachCock] is so hard between you two that it hardly sways at all under Lane’s force. With every push, a little bit more precum splurts from you, some getting on you, some getting on Lane, and he doesn’t seem to mind.");

	output("\n\nHis shudder is the only warning you get before he hilts into you as far as he can. His pulse quickens for just a moment, and you feel a beautiful, cleansing warmth wash your insides. You try to stifle a shout of ecstasy, but you can’t help letting the worlds know of your joy when you finally let go, letting your [pc.vagina] cum with your master. Your release has a sort of enlightening, clarifying quality to it: now that your master has finally come inside you after you’ve spent your life pining for it, you feel you can leave this life without regrets. You’d happily give up hunting for your father’s fortune if it meant being with Lane forever. ");

	output("\n\nYou tighten, your muscles milking every centimeter of Lane’s length, eagerly swallowing more of his cum into you. Every blast of his cum into you shakes the earth once more, and you’re seeing more stars and swirls than the ones on Lane’s body. You feel the rest of your strength leave your body as you’re wracked again and again with orgasms.");
	if (pc.hasCock())
	{
		if (pc.cumQ() <= 500)
		{
			output(" [pc.EachCock] erupts powerfully, spraying your [pc.cum] some distance into the air between you two. It rains down in time with Lane’s thrusts, splashing onto your stomach and [pc.chest], drenching you with your own juices, spreading your own liquid warmth around your skin to compliment the warmth blossoming inside you. Some of it splashes onto Lane, reaching as high as his own chest, but, in his own single-minded orgasmic ecstasy, he doesn’t care at all. Which is all the sexier to you.");
		}
		else
		{
			output(" Your cum rockets from [pc.eachCock] with a force unlike anything you’ve felt before. Your [pc.cum] shoots several feet into the air in long, thick strands, and it showers down on you in thick splashes and clumps. It soaks your [pc.chest], your stomach, and your [pc.hips], leaking between the creases of Lane’s claws. It reaches high enough to land on Lane’s elongated face, with drops of it resting on the bridge of his nose, while other strands hit him on his lower jaw and his upper chest. It looks so hot, the way you’re coating him the way he’s taking you – and, to your further excitement, you see his long tongue snake out to clean his nose for a split second. Knowing your jizz is on his tongue makes you cum again.");
		}
	}

	output("\n\nEventually, his orgasm tapers to nothing inside you. You groan out loud, wishing he had just a little bit more to give, to douse the last few embers inside you, although you actually doubt you’ll ever be satisfied. He collapses forward");
	if (pc.hasCock()) output(", crushing your softening cock");
	if (pc.cocks.length > 1) output("s");
	output(" between you both and flopping into the puddles of [pc.cum] you’ve covered yourself in");
	output(", his hands leaving your aching [pc.hips] and slapping onto the quilt near your shoulders. He looms over you, panting and snarling like a beast, and you can’t help but adore him even more from the domineering, sexy angle you’re seeing him in.");

	output("\n\nHe withdraws from your [pc.vagina], making you whimper. He crawls his body forward until his hips are against your face: his cock is hanging limp just before your [pc.lips], and you see it beginning to shrink as his genital slit begins working on slurping it back inside him. Taking that as a challenge, you wrap your mouth around it, to clean it of both your juices and, maybe, get him going for another round. His cock tastes better than you had ever imagined – maybe because you can taste both of you on him, mixing into a sort of divine cocktail of... completion. Accomplishment.");

	output("\n\n<i>“That was great, [pc.name],”</i> he tells you, and he gropes at your left boob affectionately as you clean him. Your heart jumps in your chest at his congratulation, and you moan your thanks around his cock. <i>“I think I’ve made the right decision in making you my personal whore.”</i> Knowing that you’re his from now on starts making you wetter");
	if (pc.hasCock()) output(" and harder");
	output(", and you’re already ready for another go.");

	output("\n\nAs you clean Lane’s groin with your mouth, a concern comes to mind. You ask Lane if there’s any chance of you becoming pregnant with his kids. You admit that you’re not very well versed with Daynarian biology. Of course, you’d be glad to bear his offspring if he only wished. He hums to himself as he thinks – he clearly hadn’t considered that either. <i>“I’ve never heard of a Daynarian cross-breeding with your species before,”</i> he admits. <i>“But we should be careful just in case. Find some birth control medicine as soon as you can.”</i> You nod in understanding, bobbing Lane’s cock in your mouth as you do.");

	output("\n\nUnfortunately, your mouth loses the battle with Lane’s genital slit, and his cock disappears inside his body. You persistently lap at his slit like a bitch until he pulls himself away from you");
	if (pc.hasCock()) output(". The sexy sound of your cum peeling between your skin and his rings through the air");
	output(". You lay on his bed, wanting more, as he makes his way to one of his dressers. From it, he pulls out another set of clothing: an undergarment; a set of translucent, pants; and a thin shirt. When he’s dressed, he looks exactly as the day you had met him.");
	if(flags["LANE_MALE_SEXED"] == undefined || flags["LANE_MALE_SEXED"] == 1)
	{
		output("\n\n<i>“Here’s the deal, [pc.name],”</i> he says. You listen to his words raptly. <i>“You’re going to wire me five hundred credits every twenty-four solar hours. If you can’t afford it, just send me what you have.”</i> You nod in understanding; you had agreed to this before. <i>“If you want to be hypnotized again, I’ll charge you the regular fee for the regular service. But you’re... going to pay me a tax. The ‘Body Tax’. I’ll be taking a little extra from you physically.”</i> You feel a fire beginning to stoke in your pelvis, and you tell him that you’re looking forward to it.");
	}
	output("\n\n<i>“That’s a good pet,”</i> he tells you. <i>“Now, get dressed. As much as I’d like to fuck you every hour of the day, it doesn’t pay the bills. Go out there and make me my money.”</i> He then leaves you alone in his room, without so much as a glance. But you like that quality about Lane – a sort of hard, unforgiving singularity of a man who takes what he wants. Thinking of him as a vicious sexual conqueror makes you hot all over again.");

	output("\n\nStill, you do what you’re told. In just minutes, your [pc.armor] is back on, and you leave his bedroom. Lane is sitting at his desk as though nothing had happened; you give him a sultry grin that he does not return, before you leave his little hut and return to the");
	//output(" caves of Venar");
	output(" wilds of Tarkus");
	output(".");

	// Lust reduced to 0, time progresses by 1 hour, place PC one square outside Lane’s Plane
	processTime(60);

	pc.loadInCunt(lane, 0);

	pc.orgasm();
	lane.orgasm();

	clearMenu();
	addButton(0, "Next", move, "287");
}

public function firstTimeLaneFPCMH():void
{
	clearOutput();
	laneHeader(true);

	output("Lane leaps onto the bed, immediately straddling your stomach. She lowers her body and kisses her snatch against your lower ribs, and she immediately shivers in desire. You nervously lift your hands, knowing you’re about to caress your goddess, but just as you feel the electric thrill of your hands on her hips, she slaps them away. <i>“I am in charge,”</i> she tells you, her tassels flared open. You moan in submission, watching the swirls and the flashing lights, physically unfulfilled but enticed. She’ll be good to you.");

	if (pc.biggestTitSize() <= 5)
	{
		output("\n\nLane smirks down at you and slaps at your tits. You grunt in some pain, but then she becomes gentler, groping and massaging at them with soothing hands. The smoothness of the scales on her palms feel divine against your [pc.chest]. She hums to herself in amusement as she slides her hands all across the flesh of your breasts. She palms at your [pc.nipples]");
		if (pc.isLactating())
		{
			output(", soaking them with your [pc.milk] and rubbing your cream into your skin");
		}
		output(", and you squirm beneath her. She leans forward, her mouth deliciously close to them, and her tongue snakes out – to lick her lips and leave you teased. Her abdomen slides across your stomach, leaving a trail of her excitement in its wake.");
	}
	else
	{
		output("\n\nLane clicks her tongue as she looks down at you, and then lunges forward, gripping onto your [pc.chest] tightly. You yelp out in surprise as you feel the sharpness of her claws digging into your flesh. She pulls, squeezes, stretches, and abuses your titflesh; the softness of her palms contrasts her aggressiveness. She pinches and pulls at your [pc.nipples]");
		if (pc.isLactating())
		{
			output(", causing your [pc.milk] to squirt into the air between you, soaking up to your neck and around her webbed fingers");
		}
		output(", heedless to your comfort. She leans forward, her mouth dangerously close to your [pc.chest], her lips open and snarling her teeth at you. Her abdomen slides down your stomach, and despite her aggression, she leaves behind a trail of her own excitement on you. She’s so rough – maybe she’s jealous of your assets?");
	}

	output("\n\nLane sits back up and swings her right leg up and over your head, followed by her left over your stomach and torso, until she’s straddling you reverse-cowgirl. She slides her hips backward, her puffy cunt sliding across your skin,");
	if (pc.biggestTitSize() <= 2) output(" over your [pc.chest]");
	else output(" between your [pc.chest]");
	output(", atop your neck, until you’re face-to-waist, lips-to-lips with her genitals. She hums to herself as she lowers her upper body, pressing her own tits onto your lower stomach, her");
	if (pc.biggestTitSize() <= 5) output(" soft hands trailing down your thighs sensually");
	else output(" harsh claws marking roads down your thighs, not enough to bleed but just enough to hurt");
	output(". <i>“Pleasure your mistress. Let her know you want her.”</i> [pc.EachCock] is standing proud and tall in front of her, but clearly that’s not proof enough. Not that you’re complaining.");

	output("\n\nShe lowers her hips onto your face, smothering you between her luscious, scaly thighs. The glow of her blood isn’t especially visible through the thickness of her glutes, even thin as they are, but the few pulses you make out sends a pleasant chill up your spine. Your lips connect with her cunt; at first, you’re dazed at the thickness of her scent and the fact that you’ll finally be accomplishing what you’ve been <i>made</i> to do, but it’s a fleeting emotion. Your [pc.tongue] snakes out, tasting her eagerly, and you’re not disappointed: she tastes finer than any wine you’ve ever had. You open wider, eager to cover more of her with your mouth, to taste as much of her as you possibly can.");

	if (!pc.hasTongueFlag(GLOBAL.FLAG_LONG) && !pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE))
	{
		output("\n\nShe coos at your eager ministrations on her pussy, and she rewards you by letting more of her weight press against your face. You kiss and lick at everything you can, loving her taste and textures: her inner vaginal muscles feel carved and curved, guiding you deeper into her. The muscles contract, and their design gently yet insistently pulls you deeper into her. [pc.EachCock] strains in the air, waiting impatiently to feel what it’s like.");
	}
	else if (pc.hasTongueFlag(GLOBAL.FLAG_LONG) && !pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE))
	{
		output("\n\nShe laughs in restrained excitement as your [pc.tongue] pushes into her with ease. You taste all manner of flavors inside her, most of them bitter but all of them as amazing as you had fantasized. Your muscle wriggles and collides against hers, feeling and exploring her crevasses and peculiarities: the muscles of her inner vaginal walls seem designed to pull intrusions deeper into her, and every time you hit a particularly sensitive zone, she shudders her back and rubs her pussy against your lips a little harder. [pc.EachCock] throbs in excitement, hoping to make your mistress shudder as well as your [pc.tongue] can.");
	}
	else if (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE))
	{
		output("\n\nHer breath leaves her lungs in a hurry as your enormous [pc.tongue] easily reaches her most delicate, private depths, with quite a bit of tongue to spare. Your every movement inside her is met with short, excited gasps and an insistent, needy grind of her cunt against your lips and her weight crushing you into the mattress. Her girlcum flows and coats your every tastebud, and drools from her cunny and onto your chin and your neck, and you love every taste and every sensation, knowing you’ve pleased your mistress so well. [pc.EachCock] is hard as can be, their fighting spirit and refusal to be shown up by your [pc.tongue], talented as it might be, evident in the precum pooling across your base.");
	}

	output("\n\nYour hands grip tightly onto the quilt, fighting their every reflex to reach up and grab onto Lane’s ass. She’s always watching them, teasing you about them: every time you consider disobeying and grabbing a fistful of scaly ass, she chastises you playfully. <i>“No haaaands,”</i> she says in a sing-song tone, and you sigh in defeat.");

	output("\n\nEven so close to your sex");
	if (pc.hasCock() && pc.hasVagina()) output("es");
	output(", Lane does nothing to return your service. Her soft, careful fingers examine [pc.oneCock], mapping the veins and tickling the skin, but she never grips you or pumps you. You can feel her breath wash over [pc.eachCock], but that’s all she does with her mouth.");
	if (pc.balls > 0) output(" She cups and rolls your [pc.balls] between her fingers delicately, knowing how full and sensitive they are for her, but she doesn’t please them or massage them.");
	if (pc.hasCock() && pc.hasVagina()) output(" Her claws gently tease and rake against your [pc.vagina], making you jump and squirm under her, but she doesn’t penetrate you with them.");
	if (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" Every touch and caress she makes is accentuated by a leap of her own whenever your massive tongue hits something particularly pleasurable, but she’s good at keeping her composure.");
	output(" It’s all very frustrating, but you continue your worship without question: what she wants, you want, and if she wants to tease you, you want her to tease you.");

	output("\n\nShe suffocates you with her quim for another minute, both of you loving every second of it, before she climbs up and off of you. She swings her legs over you again, and again she’s straddling you, facing you. <i>“Good " + pc.mf("boy", "girl") + ", very good,”</i> she praises. You perk your ears at her praise and you feel your heart leap with joy. She leans forward, closing the gap between your faces. <i>“So good. You let your mistress know you love her. You deserve a reward.”</i> She clamps onto your arms with her hands, pinning them to the bed, as she draws her body backward. Her ass collides with your aching [pc.cock], which lurches in anticipation.");

	output("\n\n<i>“But before I do,”</i> she says, grinding her body against your dick, hot-dogging you with what little meat on her ass she has, <i>“I’m going to give you an anatomy lesson.”</i> You look deep into her eyes, sinking into her subconscious grip, watching her irises change color and her blood pulse around her face. You wait rapturously for her knowledge, though you bite your lower [pc.lip], trying to resist thrusting into her.");

	output("\n\n<i>“A Daynar’s cunt is very sensitive at the lips,”</i> she moans, grinding her snatch against your pole, slicking it with her juice and your spit, <i>“but the real prize is much deeper. Just before the womb. It’s so we want our men to go as deep as they can, to get their cum as deep as possible.”</i>");
	if (pc.biggestCockVolume() <= 32) output(" You gulp in embarrassment, knowing how... lacking you are when it comes to male assets. Her expression is mostly neutral. <i>“It’s not the size that matters,”</i> she tells you, nuzzling your [pc.face] with her face to calm you down, but her tone is rather demanding. <i>“But I hope you know how to use it.”</i>");
	else if (pc.biggestCockVolume() <= 92) output(" She smiles down at you as she grinds herself on your meat. You smile back, happy that she’s happy, and you’re more than up to the challenge. <i>“I’m sure you’ll do great,”</i> she tells you, leaning in to nuzzle at your [pc.face], but then she whispers, <i>“because you wouldn’t want to leave your mistress wanting.”</i> You steel your resolve: you’re going to fuck Lane senseless, come hell or high water!");
	else if (pc.biggestCockVolume() <= 199) output(" She licks her lips and her eyes narrow deviously as she cranes her back to hump the entirety of your shaft, from [pc.cockHead] to base. <i>“If I’m honest,”</i> she says as she lowers her torso, her heavy boobs resting on your [pc.chest]. She presses her cheek against yours. <i>“You’re probably the biggest I’ve had. I’m looking forward to it.”</i> A sense of pride wells up in your chest. You’ve never been more ready to do your life’s duty as you have been after hearing her say that.");

	var selCock:int = pc.cockThatFits(lane.vaginalCapacity());

	// Too big
	if (pc.biggestCockVolume() >= lane.vaginalCapacity())
	{
		output("\n\nShe leans her hips back, drawing her snatch from the base of your [pc.cock] to its tip. She chews at her lip and narrows her eyes as she gauges you, judges you – despite your immensity, you feel inadequate because from the look on her face, you’re making your mistress reconsider. <i>“To be frank,”</i> she begins – never a good start to any conversation. <i>“You’re... massive. I don’t think you’ll fit.”</i>");

		if (selCock != -1)
		{
			output(" She wraps her tail around [pc.eachCock] as she continues to hump against you, searching for a substitute to match your enormous dick.");
			if (pc.cocks.length > 2) output(" Eventually, s");
			else output(" S");
			output("he finds your [pc.cock " + selCock + "], and strokes it for a moment while she hums. <i>“Luckily, you’ve got options. I’ve always admired versatility.”</i> You sigh in relief: you’ll still get to achieve your life’s goal by the end of the day.");
		}
		else
		{
			output("\n\nLane wraps her tail around your [pc.cock] and presses it against her cunt, and she begins to hump against you in earnest. It’s clear that she’s not too interested in even trying to stuff you inside her, and you moan out in dismay; you had <i>one job</i> in life, and you had to go and ruin it by getting carried away with male enhancement. Lane doesn’t look especially thrilled either, but she’s making due, and the feminine gasps of pleasure she makes as she fucks herself against your meat is about all you’re going to get.");

			output("\n\nShe arches her back in her effort to rub more of herself against you. You can feel her pussy lube the wall of your [pc.cock], her juice dripping and pooling at your base, and then she slides it all the way down until her hips connect with yours. She’s humping and fucking as though she were bouncing on a real dick, but there’s obviously a lot more work and a lot less payoff to it.");

			output("\n\nYour [pc.cock] towers and arches over her back, dripping your [pc.cum] onto her shoulders. From the way her eyes glance to her sides, she notices, but she doesn’t try to move out of the way. Instead, she lifts her hands off your arms and places them next to your ribs. <i>“Grab my tits,”</i> she commands you, her breath ragged. <i>“Might as well try and make the most of this.”</i>");

			output("\n\nYou babble your thanks to you as you release your white-knuckle grip on her sheets and reach for her breasts. Their smoothness is unreal: the scales on her front are worn, soft, and warm. You’re almost tempted to say it’s smoother than human skin. Her boobs, while obviously fake, feel as every bit the real deal as any other set you’ve felt – the wonders of modern cosmetic surgery. Your fingers press into her skin, which easily meld around them, resisting firmly without being solid. She sighs at your plying, and she thrusts them out for you to better feel at them.");

			output("\n\nYou feel Lane’s tail squeeze harder at your shaft, constricting it, while it snakes and coils its way down, towards your crotch. ");
			if (pc.balls == 0)
			{
				output("The tip of her tail tickles and searches along your base for anything to play with, but all it strokes at is empty skin.");
				if (!pc.hasVagina()) output(" It reaches deeper, caressing at your perineum, hoping there’s something else to play with, but finds nothing. Her grip on your [pc.cock] tightens the farther she reaches, until she’s wriggling at your [pc.asshole]. You tense, caught between not wanting her to put a tighter grip on your prick and wanting her to bless you with another pleasure, but ultimately, she withdraws. She winds up resuming masturbating your length with her tail. She sighs – you could swear she’s almost as disappointed as you are.");
			}
			else
			{
				output("The tip of her tail finds your [pc.sack] and begins sliding between your [pc.balls], frigging itself in the crevice between them. The underside of her tail is just as soft as the scales of her belly, and despite her frantic humping against your shaft, her tail is smooth and sensual in their rubbing and tickling against your jewels.\n\n");
			}
			if (pc.hasVagina())
			{
				output("Her tail continues to slide ever downward, until it finds your [pc.vagina], alone and neglected in the activities. She gently slides her tail between your uvula, teasing your tunnel by dipping her very tip just beyond your lips but no farther. You yelp in pleasure");
				if (pc.hasClit()) output(" whenever his smooth scales draw over your [pc.clit], and you");
				else output(" and");
				output(" feel another surge through both your sexes. Lane looks down at you, almost contemptuous that you’re experiencing more pleasure than her; you return her look with absolute devotion and adoration that she would go through the effort, despite your ‘greed’.");
			}

			output("\n\nEventually, your hard work begins to pay off. Lane becomes more frantic and less focused; her humping becomes more forceful, pressing her body against your [pc.cock] while her tail tightens its grip, keeping it from swaying. She begins to gasp as her body rocks against you. You thrust your hips upward in time to her humping; your hands stop having any sense to their groping and default to simply rubbing the butts of their palms against her skin. She tenses and lets out a quiet wail, and you feel a hot liquid start coating the skin of your [pc.cock].");

			output("\n\nYour orgasm is right on the coattails of hers, and with another few humps, you join her in bliss.");
			if (pc.cumQ() <= 150) output(" Your quantity is quite lacking, compared to the excess of your [pc.cock]. Your [pc.cum] spits from your [pc.cockHead], pumping out once, twice... and that’s it. It drips in strands from your urethra, sliding down the skin of your shaft, and it drops onto Lane’s scaly back, which she barely notices in her own throes of ecstasy. Despite your volume, the pleasure you experience at finally achieving orgasm with your beloved mistress is beyond words – even though you finish your orgasm before she does, and she started before you did.");
			else if (pc.cumQ() <= 500) output(" You feel your [pc.cum] launch up your cock and towards your looming [pc.cockHead]. Lane’s constricting tail pinches your tube and restricts the flow somewhat, but your quantity cannot be denied: it fires from your urethra with some force, shooting into the air above you both. Some of it hits the ceiling; the rest rains down on Lane’s back, coating her in your proof of your love for her. Lane stops her shivering before you do, but she doesn’t stop seeing stars until the last of your jizz is squeezed from you and drips a trail down your shaft. Your [pc.cock] gurgles a little from the cum her tail managed to keep back.");
			else output(" Lane’s constricting tail tries to constrain the onslaught of cum rocketing up your shaft, but all she manages to do is increase the pressure as it rockets out of your tip. Your [pc.cum] explodes from you, launching into the air and smashing against the ceiling above you. Its arc goes above both of you, landing on the floor between the bed and the wall. It goes everywhere, but most importantly, it completely soaks Lane: her scaly back is totally covered with your jizz, and then some. Strands of it trace down her arms to her fingers and pool at the base of her tail. Your orgasm, and your pent-up blasts of your seed, continue well after Lane’s has ended, and you paint the room white the entire time.");

			output("\n\nLane collapses on top of you, enjoying the warmth between your bodies in the afterglow. Despite your inability to perform, you’re somewhat eased that you’ve pleased your mistress.");
			if (pc.cumQ() > 150)
			{
				output(" She reaches up towards her back, feeling along it for the cum you’ve splattered all over her");
				if (pc.cumQ() > 500) output(". She doesn’t have to reach very far – she’s covered in pools and strands of it, and her every movement has it splash off her body in sheets");
				output(" She coats her fingers in it and brings it to her face, then she looks you in the eye – your [pc.cock] lurches at the idea that she might lick her fingers clean. But, instead, she wipes them off on your [pc.chest].");
			}
		}
	}

	// Will fit
	if (selCock != -1)
	{
		output("\n\nLane raises her lower body, trailing a path along your [pc.cock " + selCock + "] as she prepares to penetrate herself on you.");
		if (pc.cocks[selCock].volume() <= 32) output(" She snickers at you");
		else output(" She bites her lower lip");
		output(" as she does, and, when she finally reaches the tip of your penis, she rears back and engulfs you in one swift motion.");
		var cvState:Boolean = pc.cockVirgin;
		pc.cockChange();

		output("\n\nYou both moan out in satisfaction – there’s no doubt she wanted it too, but you doubt she wanted it as badly as you did. Lane has finally allowed you inside her, and it’s everything you had dreamed it would be. Her muscles feel very peculiar: they don’t squeeze like");
		if (cvState) output(" you imagined most other cunts would");
		else output(" most other cunts you’ve fucked had");
		output(", but they ripple in a wave-like motion, from her entrance to her womb, in an effort to massage the jizz out of you. Like everything else about Lane, it’s absolutely divine");
		if (pc.cocks[selCock].volume() <= 32) output(", and you find yourself wishing you had more manhood with which to feel it");
		output(".");

		output("\n\nLane begins fucking you with a bit more earnest, lifting her hips and pressing them back down onto yours.");
		if (pc.cocks[selCock].volume() <= 32) output(" She giggles with every press against you she makes");
		else if (pc.cocks[selCock].volume() <= 92) output(" She moans out every time she presses down and your [pc.cock " + selCock +"] teases her more sensitive spots");
		else output(" She gasps in surprise and pleasure with every hump, loving the way your [pc.cock " + selCock +"] fits her just perfectly");
		output(", and you writhe with her, meeting her every hump with one of your own, wanting to go deeper and feel more of her amazing alien pussy.");

		output("\n\n<i>“You’re a good " + pc.mf("boy", "girl") + ", [pc.name],”</i> she tells you");
		if (pc.cocks[selCock].volume() > 32) output(", her breath catching in her mouth with every thrust against you");
		output(". <i>“So obedient.”</i> With her position and the way she’s bearing down on your torso, she has all the leverage: your every lift is miniscule compared to the distance and power Lane can utilize. Generously, she relinquishes it – she sits up, removing her hands from your arms, and stretches her own above and behind her neck. <i>“Go ahead and play with my tits, [pc.name]. Let me know you appreciate them.");
		if (pc.cocks[selCock].volume() <= 32) output("”</i> She grinds her pussy down on your [pc.hips], trying to fit as much of you as she can into her. <i>“Lord knows I’ll be needing as much as I can get out of you.");
		output("”</i>");

		output("\n\nBabbling a thanks, you let go of your white-knuckle grip on the sheets and, eager but mindful of her comfort, you reach up and maul at Lane’s generous bust while you restart your thrusting into her with renewed vigor. Their texture is unlike any other sets of boobs you’ve held before – arguably even smoother than a human’s skin. While they’re obviously fake, they look and feel as every bit real as an all-natural pair. She lets out a deep breath as your fingers press and mold her skin, and she thrusts her chest forward, letting you get a better grip on them.");

		output("\n\nLane continues to bounce on your lap, reveling in the sensations of your hands on her tits, your [pc.cock " + selCock +"] in her honeypot, and you being under her thrall, obeying and enjoying her every command.");
		if (pc.balls > 0) output(" Your [pc.sack] bounds up with every thrust you make, slapping lightly onto Lane’s pert, warm ass, and you love the way her scales caress them.");
		output(" Lane’s long, dexterous tail snakes down between you, sliding");
		if (pc.balls > 0) output(" between the crease of your [pc.balls]");
		else output(" over your perineum");
		output(", in search of something to entertain it;");
		if (!pc.hasVagina()) output(" despite its groping and feeling, it finds nothing, and you can hear Lane click her tongue in disappointment.");
		else
		{
			output(" it finds the vulva of [pc.oneVagina] and, without hesitation, begins sliding between your lips relentlessly");
			if (pc.hasClit()) output(", rubbing over your [pc.clit]");
			output(" and pressing its silky-smooth scales against you, but Lane doesn’t penetrate you, which frustrates you into fucking her harder.");
		}
		output(" With its surplus length, her tail continues onward, wrapping the rest of itself around the fat of your thigh, for equal parts stability and sensuality.");

		output("\n\nLane pants as she ruts against you, slapping her hips on top of yours and claiming you in the most physical way she can, and you love every second of it. The pulses of light under her skin grow in frequency and intensity, along with her gasps of pleasure. Her hands drop from behind her head and slam onto your chest");
		if (pc.biggestTitSize() <= 5) output(", harmlessly palming at your [pc.chest]");
		else output(", squeezing at the flesh of your [pc.chest] and biting her claws into you");
		output(". Her bouncing picks up the pace until she’s fucking you hard enough to cause your pelvis to bruise, but you’re okay with that.");

		output("\n\nHer voice rises in her throat through pursed lips. You move your hands from her pillowy tits to her thighs, gripping onto the scratchy scales. Her tail tightens on your thigh");
		if (pc.hasVagina()) output(" and continues to glide the soft underside of its scales against your [pc.vagina]");
		output(" in her coming ecstasy: her fucking is becoming more forceful and less focused. She leans down, her face close to yours, her body pressed on you tight; her cunt grips and sucks on your [pc.cock " + selCock +"] hungrily, coaxing your [pc.cum] from you, and as an incentive, she wails out loud and orgasms on you, dressing your dick in her warm girlcum.");

		output("\n\nPart because of your own stimulation, and part seeing your wonderful mistress come to orgasm because of you, you cum yourself, finally.");
		if (pc.cumQ() < 350) output(" You thrust in as deep as you can, feeling your cum jet its way up your shaft and coat Lane’s insides. You feel each individual, warm shot seep from you and into her, all while her vagina works in waves to drink it deeper inside herself. Lane sighs in satisfaction as you seed her and humps against you a few more times to lure as much out of you as she can.");
		else if (pc.cumQ() < 1000) output(" Your dick inflates with your seed and punches forth with some force, immediately painting Lane’s muscles white as her vagina works to suck it into her abdomen. Lane doesn’t expect the volume of your load, but from the way she laughs in delight, she more than enjoys the feel of her thirsty cunt quenching its hefty thirst. She humps against you twice more, but, after a few seconds pass and your orgasm doesn’t ebb, she goes slack and relaxes, figuring she doesn’t need to work for any more.");
		else output(" Your prodigious load of [pc.cum] detonates inside Lane like a stick of dynamite. She has some difficulty registering the absurd volume of cum your pumping into her; even in her own orgasm, her cunt can’t keep up with your cock, and despite her genitals’ every effort, your seed spills back out from between you two. With every pulse of your seed that splatters out from her, you deposit a new wave inside her, making sure you never leave her wanting for your cum. You’ve lost count of how many ropes of jizz you cum into her before she pulls from you in defeat, releasing your [pc.cock " + selCock +"] to the cold air to rain the rest of your load onto the small of her back.");

		if (pc.hasVagina())
		{
			output("\n\nThe way Lane’s tail tightens and grinds against you and your feminine bits in her throes of passion is a little uncomfortable, but that doesn’t stop the torrent that gushes from your [pc.vagina] in time with its lucky brother");
			if (pc.cocks.length >= 2) output("s");
			output(". Your feminine orgasm isn’t nearly as intense as your masculine one, but it’s nonetheless enough to make you go just a little cross-eyed.");
		}

		output("\n\nLane rests her body on top of yours for a moment. Her every heavy, satiated gasp comes as music to your ears.");
		if (pc.cumQ() >= 1000)
		{
			output(" The seed that didn’t make it inside Lane drips from where her tail meets her back, then onto you");
			if (pc.balls > 0) output("r [pc.sack]");
			output(" and from there onto the comforter you’re both laying on.");
		}
		output(" The afterglow of your rutting comes to you a little less literally than it does to Lane; her glowing begins to slow and soften as the minutes tick by and she collects herself. Your cock eventually softens");
		if (pc.cumQ() < 1000) output(" and slides from Lane’s warm confines");
		output(", hanging limp in the comparatively cool air of the hut.");
	}

	// Merge
	output("\n\n<i>“You’ve done well, [pc.name],”</i> Lane praises, stroking your [pc.hair] affectionately. <i>“");
	if (pc.biggestCockVolume() <= 32) output("Especially with the tools you’ve been given. ");
	output("I think making you my personal cum pump was a good idea after all.”</i> You sincerely thank her for her praise, and your hand trails down her body once more, gripping at her scaly ass as well as you can from your angle.");

	output("\n\nAfter you’ve copped a good feel, Lane pulls herself off of you. <i>“I’m gonna have to wash up,”</i> she sighs, looking across her body. She hasn’t sweat a drop, naturally, but you’ve more than made up for her particular lack of bodily fluids, and the stink of your love making clings to her scales like glue. You lean on one side, watching her as she goes to one of her dressers, and from it, she pulls out a perfectly identical set of white, airy clothing, like she was wearing before.");
	
	if(flags["LANE_FEMALE_SEXED"] == undefined || flags["LANE_FEMALE_SEXED"] == 1)
	{
		output("\n\n<i>“Here’s the deal, [pc.name].”</i> You sit up and listen to her words rapturously. <i>“From now on, after every twenty-four Terran hours, you will wire me five hundred credits. If you can’t afford it, just wire me what you have. I’ll believe you.”</i> You nod in understanding – you had discussed this with her before. <i>“If you want to get hypnotized, I’ll charge you the regular fee. But, from now on, you’ll have to... pay me a tax. The ‘Give Lane Your Body’ tax. I’ll be taking a little extra from you, physically.”</i> Your [pc.cock] begins to inflate once more as you fantasize it: your very body, belonging to Lane’s every sexy whim.");
		if (pc.biggestCockVolume() <= 32) output(" <i>“Hopefully you’ll be... better equipped for when the time comes.”</i>");
		if (pc.biggestCockVolume() > lane.vaginalCapacity() * 0.75) output(" <i>“You may want to... look into ‘male reduction’ in the meantime. There can be too much of a good thing, you know.”</i>");
	}
	output("\n\nOut of turn, you ask her if there’s any chance of Lane getting pregnant. You admit that you feel you’re a little young to have kids yourself, but if Lane wants any, you’re all for it. <i>“I’ve never heard of a Daynar cross-breeding with a species like yours,”</i> she says, humming in thought, <i>“but there’s no risk of it anyway. JoyCo’s been good to us Daynarians.”</i> You don’t press the subject further. If Lane ever wants kids, you’re sure she’ll tell you.");

	output("\n\n<i>“You’re a good pet,”</i> Lane tells you, <i>“but I’m afraid fucking you doesn’t pay my bills. That’s not the sort of business I run, unfortunately. Get dressed, and get out there and make me some money.”</i> And then she just leaves you alone in her room, her clothes still in her arms. That was a little cold, the way she talked to you like a tool, but that’s just one of the many things you like about Lane – she’s focused on what she wants, and when she doesn’t want money for her business, she wants you. Thinking of her as a sort of predator, sexual or otherwise, makes your [pc.cock] stiffen all the more.");

	output("\n\nYou take a few more minutes to yourself to calm your newly rising erection. When you’re ready, you move to put your [pc.armor] back on, and when you’re presentable again, you leave her room. Lane is nowhere to be found – the ‘busy’ sign is still on her desk, untouched. You have no idea where she goes to bathe.");

	output("\n\nWith nothing (and nobody) else to do in the hut, you leave for the");
	//output(" caves of Venar");
	output(" wastes of Tarkus");
	output(", with a new objective in your life.");

	// Lust reduced to 0 time progresses by 1 hour, place PC one square outside Lane’s Plane
	processTime(60);

	lane.loadInCunt(pc, 0);

	pc.orgasm();
	lane.orgasm();

	clearMenu();
	addButton(0, "Next", move, "287");
}

public function firstTimeLaneFPCFGenderless():void
{
	clearOutput();
	laneHeader(true);

	output("Lane crawls onto the bed, stalking her way across it and up your body. She moves slowly, dragging her heavy breasts and smooth front scales across your skin in a delicious, electric way that alights your senses. Her soft hands map the way for her as she crawls over you and drapes her body over yours; she feels along the fat of your legs and the thick of your [pc.hips], across your belly and over your [pc.chest] until she’s completely on top of you, face-to-face, her snout just centimeters from your [pc.face].");

	output("\n\n");
	if (pc.biggestTitSize() <= 5)
	{
		output("Her hands gently palm at the heaving flesh of your [pc.chest] as she squirms and grinds her sexy body on yours. You moan out, your eyes locked onto hers the whole time, watching their irises change colors to match the pulsing lights under her skin.");
		if (pc.isLactating()) output(" Your [pc.milk] squirts from your [pc.nipples] at her gentle ministrations, soaking her webbed fingers as she squeezes your tits, getting them both nice and soaked in your fluids.");
		output(" You gasp in pleasure as she fondles you, and then she strikes, closing the gap between you and assaulting your mouth with hers. You absolutely melt as she directs her tongue over and around yours, making itself at home in your mouth.");
	}
	else
	{
		output("Her hands roughly grip onto the supple, generous flesh of your [pc.chest] as she begins to forcefully grind her body on top of yours. You gasp out in both pain and pleasure as she handles you, your eyes locked onto hers, unable to look away from them as they rapidly change colors, off-tempo from the lights under her skin.");
		if (pc.isLactating()) output(" Your [pc.milk] shoots from your [pc.nipples] in harsh bursts as Lane roughly grips and plies at your skin, launching a solid foot into the air before raining back down on your titflesh and on Lane’s webbed fingers.");
		output(" You moan out again, and Lane takes advantage of your weakness: she launches forward, closing the gap between your faces, and she assaults your vulnerable mouth with hers. Your tongue is dominated by hers as she wrestles it, and before long she has you cowed with her aggressive kiss.");
	}

	output("\n\nLane straddles your left thigh, and she’s then fucking herself on you, deliberately keeping her own leg away from your [pc.vagina] to keep you teased. She removes her left hand from your tit and moves it up to your head,");
	if (pc.biggestTitSize() <= 5) output(" caressing your cheek lightly");
	else output(" clamping onto your scalp roughly");
	output(" as she kisses you and rocks against you. You move to wrap your own arms and legs over her body, to reciprocate some of her affection, but she slaps at your wrists and kicks at your [pc.knees]. <i>“I’m in charge”</i> she tells you in a sing-song tone, and then goes right back to dominating your body and your mouth.");

	output("\n\nYour breath leaves your nose in heavy gasps from the stimulation you’re receiving, but it’s not nearly going to be enough to make you orgasm, and Lane knows it. Finally, she has her fill of you, and she pulls away for a moment, to catch her own breath for a bit. She looks down at you predatorily; a wry, toothy grin spread on her scaly face; she can see in the reflection of your eyes how into her you are, and the sight of you, underneath her, panting and squirming for a release only she can provide, makes her chuckle.");

	output("\n\nYet, she’s not satisfied either. She begins climbing her way forward, only slightly, and presents her own chest to your face. She straddles your waist and continues to rub her now wet cunt across your lower stomach while she sandwiches your face between her scaly boobs.");
	if (pc.biggestTitSize() <= 5) output(" She coos out in delight once you, without instruction, begin kissing and licking at her ‘skin’, pleasuring her and appreciating her superior rack as she clearly wants you to. The smoothness and the warmth of her body are positively divine on your face; you wouldn’t mind coming home to this for the rest of your life. The scent of her scales and the light of her blood accompany the taste of her on your tongue, and you find a nirvana you’d never thought you’d encounter before now.");
	else output(" She grunts once and uses her hands to squeeze your face between her firm, scaly breasts as much as she can. Your air is cut off and your cheeks are pressed into your face; you can’t manage to open your mouth and worship her body as you’d like to with the way she’s controlling you. She massages her tits, inferior to your own, on your skull; you wish that she’d be just a little less rough with you, so that you’d be able to appreciate her body a little better, but if it’s her wish to be dominant, controlling, and a little abusive, then it’s your wish as well.");

	output("\n\nEventually, she tires of smothering you with her boobs as well, and continues her journey up your body. Your vision is assaulted by the silky smooth skin of her front sliding over your [pc.face] and the lights of her blood pulsating in front of you. You stick out your [pc.tongue], letting it draw over her scales as she crawls over you, and she rewards you for it with a soft coo.");

	output("\n\nShe eventually places her knees on either side of your head, and, before you, is the treasure you’ve always dreamed of: her glistening alien sex, puffy with arousal, dripping in excitement for you. You lick your lips; you’ve never been more ready for her than you are now.");

	output("\n\nBefore she indulges you, she turns her body around so that she’s straddling you reverse-cowgirl. <i>“I’m going to tell you a little something about Daynar anatomy,”</i> she says, rocking her hips from left to right with every other word she says, taunting you with her sex. <i>“A Daynarian’s cunt is very sensitive at the lips.”</i> She drags it across the tip of your nose, and she shudders, anticipating it as much as you are. <i>“It’s so we want our men to keep thrusting. An incentive for fucking. But the real prize is much deeper; just before the womb.”</i>");

	output("\n\nA drop of her girl cum drips onto your nose, sliding down it and across your cheek. <i>“That’s where we’re most sensitive. It’s so we want our Daynarian cocks as deep as they can go, so there’s a better chance of getting knocked up.”</i> She shivers, and then finally lowers herself on your face, pressing her against you, and letting you fulfill your purpose in life. <i>“I’m sure you’ll do a fine job, [pc.name]. You won’t disappoint me.”</i>");

	output("\n\nThe finality of finding yourself where you want to be – between Lane’s luscious, smooth, thick thighs, your lips against her vulva, the taste of her just an easy lick away – leaves you a little light-headed. You feel as though you’ve waited so long to have everything you’ve wanted, and it’s right there. You almost forget to appreciate it.");

	output("\n\nYou want to grip onto Lane’s legs for stability, but you remember her earlier instruction, and you force yourself to keep still.");
	if (!pc.hasTongueFlag(GLOBAL.FLAG_LONG) && !pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" You drag the fat of your [pc.tongue] once languidly across her gash, making her shiver in delight and press more of her weight onto you. You respond by pressing your lips to hers tightly, doing your best to not leave any part of her wanting, while you dig as deeply into her as you can. You adore her every taste, scent, and texture – her inner muscles are peculiarly streamlined, designed to pull you deeper into her, and you’re absolutely willing to let them. She coos and laughs in delight at your work, sloppy as it is, but your obvious excitement makes up for it.");
	else if (pc.hasTongueFlag(GLOBAL.FLAG_LONG) && !pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" She hunches forward, hiccupping once, caught off guard by the length of your [pc.tongue]. You slide deeply into her with ease, tickling her more sensitive spots, making her wriggle and coo and reward you by giving you more of her. Every smell in your nose is complimented with every taste on your tongue, and everything is so undeniably Lane. Every thrust you make with your long tongue is met with a contraction in her vagina, with her peculiar muscles rippling inward, trying to pull you deeper into her. You take that as an invitation.");
	else if (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE))
	{
		output(" Lane doubles over in surprise and immediately starts moaning like a pornstar when your massive [pc.tongue] penetrates her and then some, with more than a little bit to spare. She grinds her vulva onto your face, trying to cram as much of your tongue into her as she can, but you doubt she grasps just how deep you can reach. Her pussy is spasms in delight; her inner walls are peculiarly designed, and with each rippling sensation, her muscles draw more and more of you into her. You gladly acquiesce, and soon her entire vent is crammed with your tongue as it layers into itself again and again, yet with her every pulse she seems determined to have more.");
		// [if {tongues = 2}[pg]Your {tongue2} pleases your mistress’s vulva, licking along its twin around where it meets Lane. {It/they} reaches up, teasing at where her clit would be, and it lazily reaches out, tracing along her genital slit[if {tongue2 is at least ‘long’} and licking along her inner thighs], tasting every delectable, unique taste it can.][if {tongues >= 3}[pg][pc.eachTongue] slithers from your maw, lathering up your mistress’s crotch with their attention, and introducing your world to a myriad of unique and utterly Lane tastes. Lane’s legs twitch with every touch [pc.eachTongue] makes against her genital slit, her inner thighs, around to her ass and up to her bottommost belly, but she laughs in pleasured delight with every one.]");

		output("\n\nShe leans forward as you fuck her sex with your mouth. She spreads her legs reflexively, giving you more room to breathe. She keeps her hands on your [pc.chest] to help with her balance, and as you eat her, she returns some of the favor.");
		if (pc.hasFuckableNipples()) output(" Her palms land directly on your [pc.nipples], making you gasp out in pleasure as your... alternative orifices receive some unexpected stimulation. Lane seems completely oblivious, lost in her own pleasure, but with every hump she makes on your head, her hands crudely massage your [pc.nipples] some more, and you shiver in bliss each time.\n\n");
		else if (pc.hasNippleCocks()) output(" Her webbed fingers brush crudely against the shafts of your hard, erect [pc.nipples], causing them to bob and sway in the heated air between you, longing for some attention. Even in her passionate rutting against you, she thinks to give jack them several times, making sure you know that every part of you is always on her mind. Your chest heaves with the stimulation, but, teasingly, she lets them both go, leaving you whimpering for more.\n\n");
		if (pc.biggestTitSize() <= 5) output(" Every time your [pc.tongue] lashes into her, she responds by pulling and squeezing at your [pc.chest], rhythmic with your own actions. She’s inconsistent – sometimes she presses down too hard, sometimes she squeezes too strongly – but her effort is nonetheless there and you love her all the more for her consideration.");
		else output(" Your every ministration with your [pc.tongue] is met by a rough squeeze or a heavy press on your [pc.chest], and a thrust of her cunny harder onto your face. Her claws dig into your skin, scratching you painfully, but you know it’s only because she can’t control herself with what you’re doing to her, and you consider it a compliment. You almost hope she leave scars, as proof of your skill and her admiration.");
		if (pc.isLactating())
		{
			output("\n\nHer");
			if (pc.biggestTitSize() <= 5) output(" massaging");
			else output(" groping");
			output(" eventually teases the [pc.milk] out of your [pc.chest], spraying softly from your nipples and washing onto Lane’s scaly hands and wrists. Your torso becomes cool with the liquid washing down your body, and Lane’s grip becomes slippery on your tits, forcing her to readjust on your body every time, forcing you to spray more of your milk into the air. It’s an awkward but nonetheless pleasurable cycle, especially as it helps relieve the stress in your boobs.");
		}

		output("\n\nYou feel your chest beginning to burn slightly as Lane rides you and refuses to let you go to breathe. The muscles in her cunt ripple again and again, and with each pass, it draws your [pc.tongue] ever deeper into her snatch. She’s quickly running out of space to cram you into, and you’re not even halfway out of tongue to give her. <i>“No way am I giving this up,”</i> you hear her say, and she bears down on you harder, squashing you into her bed and flooding your mouth with more of her cunt.");

		output("\n\n<i>“But I am not an unfair mistress,”</i> she declares to you, and you feel her shift her weight forward, so that she’s lying atop you properly without removing her quim from your patient mouth. <i>“Keep pleasuring your mistress, [pc.name],”</i> she instructs, and without warning, you feel her press her own mouth to your crotch,");
		if (pc.hasVagina()) output(" digging herself daintily into your [pc.vagina], not nearly as enthusiastic as you – acting as though it’s more of a service than a pleasure");
		else output(" licking along the [pc.skinFurScales] of your void pelvis, not really with any goal or purpose");
		output(" while her hands wrap around your [pc.hips] and roughly grip onto your [pc.ass] for support.");

		output("\n\nYou redouble your efforts, stimulated by the pleasure and attention your mistress is giving you. Your tongue is so long that you don’t need to crane your head at all to slather it all over her gash and taste her every inch, but you do so anyway, pressing your lips against her genital slit, putting them back where they belong.");

		output("\n\nLane’s ministrations on you feel lazy and unguided, but it’s the thought that counts, and the feel of her warm scales sliding fully over your body are pleasurable enough. Your tongue slides from your mouth constantly; the inches queue up at her twat as she flexes and writhes above you in an effort to cram more into her. With every flex of her cunt, you get in a little bit more, but it’s becoming more and more difficult. She, however, is perfectly content to keep trying.");

		output("\n\nYou sixty-nine for only a minute or two before Lane pulls her mouth from your");
		if (pc.hasVagina()) output(" [pc.vagina]");
		else output(" crotch");
		output(". <i>“[pc.name] – ah!”</i> she stutters, just as you slide in another few centimeters. <i>“Exactly how much tongue do you – uh... – do you have?”</i> Her voice accents with every rock of her hips on your face.");

		output("\n\n<i>“Ahm nuh sthur, mithpreth,”</i> you try and answer. You don’t attempt to withdraw your tongue from the cozy, tasty new home it’s in, though you’re sure she’d get a real kick out of it.");

		output("\n\n<i>“Let’s find out.”</i> She shifts her body forward slightly, pulling her lips away from your own, and presses her abdomen down on your [pc.chest]. <i>“Lick as much as you can. Try not to pull out. I might just reward you if you don’t.”</i>");

		output("\n\nYou obey her suggestion, and you reach deep within yourself to withdraw as much [pc.tongue] as you can. The feel of your tongue continuously sliding over your teeth, and the way you can taste so many things at once, is still new and alien to you. You marvel at yourself as it just keeps extending, piling out of your mouth in a hurry, and you’re totally in control of how it bends and coils.");

		output("\n\nYou set your tongue to work: what isn’t crammed inside your mistress does its damndest to please her outside. The flat of your appendage coils, licks, and slides along the fat of her ass, reaching down to the thick of her thighs, and up to caress the underside of her tail.");
		//[if {tongues >= 2}. There is no part of Lane’s pert ass that escapes [pc.eachTongue] in their adventure to map out her lower body; the taste of her scales is bitter and tart, but it tastes like Lane]. 
		output(" The fat of your tongue coils up slides into the crack of her ass, hot-dogging itself in what little cleavage her scaly derriere provides; she tenses in ecstatic pleasure with every rub and grind. You’re not averse to layering your tongue higher until it massages against her rosebud – whatever to pleasure Lane, and from the way she yips in surprise and fucks her hips backward, she finds it very pleasurable.");

		output("\n\n<i>“That’s it!”</i> she encourages you, <i>“Lick me everywhere! That’s it, [pc.name]! Let’s see what you got!”</i> You gladly submit and continue to dole out your alien [pc.tongue], wrapping it around her pelvis, all without withdrawing the fifth-or-so bit of tongue still wriggling and plying in her pussy. You coil your obscene length all around her tail, reaching the tip of it and winding all the way back down before you finally start to come to your limit.");
		//[if {tongues >= 2}. Your other tongue[if {tongues >= 3}s] slither[if {tongues = 2}s it’s ][if {tongues >= 3} their] way up Lane’s quivering, outstretched body, tasting along her belly and licking and pressing along the underside of her boobs. She doesn’t tell you to stop – on the contrary, it seems to excite her further].

		output("\n\nLane can’t hold her breath for more than a second, with the tricks and feats you’re performing on her. She’s totally forgotten about pleasing you in return, and in truth, so have you, though your arousal still burns persistently. Every time your [pc.tongue] squeezes and slacks around her tail, it draws up and through her asscrack");
		//[if {tongues >= 2} and the other[if {tongues >= 3}s] whip[if {tongues = 2}s] up her body, feeling out her ribs under her skin and playing with her heavy boobs, a whole body’s length away]
		output(", pleasuring Lane in the most exotic way she could have imagined.");

		output("\n\nShe stutters out words, but none of them are in context; between the breathy laughs as you wrap her in your tongue and the extreme length still squishing inside the walls of her cunt, she’s too off in her own world to make sense of anything. You both fall into a rhythm of delicious rocking, contracting, tasting, and binding, her body only inches from your face yet completely tied up in your own tongue, and it’s not too long until her orgasm rocks her like an earthquake.");

		output("\n\nEverything about Lane gets tense and spontaneously stops moving. She yelps out once again, much louder and longer than before, and you feel her pussy tighten around you, and her ass squish the length stuffed between her cheeks. Among the hurricane of tastes on your tongue");
		// [if {tongues >= 2}s]
		output(", you taste another; a hot liquid, coating the tip of your [pc.tongue] and pooling around the pile still locked deep inside her, dripping between the cracks and creases, delighting every bud it hits, but not a single drop manages to escape her.");

		output("\n\nAfter her one yell, came silence, followed by a single, low groan as her muscles quaked and threatened to give out on her. Her grumbling turns into a long, drawn-out <i> “–yyyyyyyyyes!”</i> Overcome with ‘inspiration,’ she rocks her hips back until she’s sitting squat on your face once more, and then she falls forward, her face on your groin, giving you");
		if (pc.hasVagina()) output("r [pc.vagina]");
		output(" a long, lascivious lick.");

		output("\n\nThe feel of her own tongue on you");
		if (pc.hasVagina()) output("r own puffy sex");
		output(" reminds you of your own needs in a flash, and the sensations you get from both ends light your very short fuse. With just one more generous, lingering lick from your beloved mistress,");
		if (pc.hasVagina())
		{
			output(" you cum like a geyser. You reflexively lift your [pc.hips] off the bedsheet and thrust yourself into her mouth, funneling your [pc.girlcum] onto her tongue without regard for her commands or her desires.");
			if (pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY) output(" As Lane registers the taste, the volume, and the viscosity, she ‘mmm’s out in delight and labors over you a moment longer, lapping up your honey willingly.");
			output(" You feel the tension melt from your body, starting at your lower spine and spreading to your digits, and you sigh around your heavy, outstretched tongue.");
		}
		else
		{
			output(" and, despite your lack of utilities, you feel a type of slow, relenting release – where your body burned, a relaxing cool overtakes you, until it douses the frustration you had been building up since you had lost your gender. You couldn’t adore your mistress any more than you could at that moment – even without a pussy to cum with, she nonetheless brought you to climax, and with such ease!");
		}

		output("\n\nShe bucks against your tongue");
		// [if {tongues >= 2}s] 
		output(" several more times, drawing out her long orgasm and getting a handful of smaller ones, before her whole body finally goes limp on top of you. It takes some effort and time to disentangle your massive tongue from her body – uncoiling it from her tail, sliding it out of the valley of her ass, and unplugging the stuff crammed into her honeypot, while rolling the massive appendage back into your mouth and down your throat where it belongs. She takes a sharp breath every time you hit a particularly sensitive spot again, and when you withdraw from her cunt, the cum she had built up inside her comes gushing from her, spilling onto your [pc.chest] and pooling around your ribs.");
	}

	// Continue here if tongue is not ‘super long’
	if (!pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE))
	{
		output("\n\nYou’re forced to take deep breaths through your nose, the way Lane’s riding you, and as much as you enjoy being beneath your mistress and fulfilling your life’s duty, your breath sputters in relief as she climbs off of you, having something else in mind. <i>“You’re doing so well, [pc.name],”</i> she coos, looking down her chest and belly at you, smiling warmly. Your heart burns with the rest of your chest in delight as she compliments you. <i>“You have a great tongue. But I have something else in mind.”</i>");

		output("\n\nYou look on in curiosity as she climbs down your body once again, towards your");
		if (pc.hasVagina()) output(" neglected [pc.vagina], which burns with need and arousal but hasn’t had any chance to be a part of the action yet");
		else output(" blank crotch, which is frustratingly hot with arousal but has no outlet to vent with");
		output(". Moving like a predator stalking prey in the wild, she slithers forward and turns her body until she’s facing you once more, her cunt just a hair’s breadth from");
		if (!pc.hasVagina()) output(" where");
		output(" yours");
		if (!pc.hasVagina()) output(" would be");
		output(".");

		output("\n\n");
		if (pc.isNaga()) output("She straddles your open waist");
		else output(" She hooks her right hand underneath your left leg and hoists it above her shoulder, pressing you into the bamboo position beneath her, and straddles your waist");
		output(". Her pussy is just above yours, pressed against the bone of your pelvis");
		if (pc.hasClit()) output(", her body heat <i>just</i> stimulating your clitoris");
		output(". You pant, her taste still on your tongue, as you watch her rapturously, waiting for her to fuck you the way only a");
		if (pc.hasVagina()) output("nother");
		output(" woman could. The lights emanating from her body provide some relief, but your lust can’t be ignored.");

		output("\n\n<i>“This will make you mine forever,”</i> she tells you, not as a warning but as a statement, and you welcome the finality. She grinds her way backward, pressing her pussy against your");
		if (pc.hasVagina()) output(" [pc.vagina]");
		else output(" crotch");
		output(", and with that simple motion, your body is rocked with fire and lightning, knowing that your beautiful mistress has finally claimed you in the most physical way a woman can.");

		output("\n\n");
		if (!pc.isNaga()) output("Lane’s hand slaps down onto your exposed [pc.ass] cheek as s");
		else output("S");
		output("he begins fucking you in earnest. She’s not gentle as she moves and presses her pussy against your");
		if (pc.hasVagina()) output("s");
		else output(" crotch");
		output(", sliding her vulva over");
		if (pc.hasVagina()) output(" and between yours");
		else output(" your flat skin");
		output(", kissing your lips with hers. Her passion comes out as force; her hands grip onto your skin tightly for leverage as she claims you.");

		output("\n\nYou grip onto the bedsheets as best as you can for your own support, but your hands feel weak. Your body goes stiff as Lane viciously scissors you. You look up at her as she pants down at you with every rock of her tight body against yours – the way she grins and breathes and moves just looks so <i>right</i> to you, especially where you are. Her cunt feels electrifying on you, and you’ve never felt quite as alive as you are now, fulfilling your life’s dream of being fucked by Lane. The sweat starts building up on your body, rolling off in rivulets, but Lane’s body remains clean and clear through the whole ordeal.");

		output("\n\n<i>“That’s gooooood,”</i> Lane moans out, her voice rocked and stuttered with her every movement against you. You agree, without as many words. You feel the comforter of the bed scrunch up around your back as she forces your body across it while she fucks you, pounding you into her mattress with the whole weight of her body. Your whole body feels like it’s on fire");
		if (!pc.isNaga()) output(" – you’ve lost the feeling in your left leg, but you hardly care.");

		if (pc.hasVagina())
		{
			output("\n\nYou didn’t realize just how aroused you were until Lane started giving your [pc.vagina] what it wanted. As happy and thrilled as you were to service her, she hadn’t returned the favor at all until now. You’re seeing stars and swirls, and not just in Lane’s tassels; your hands itch to grip onto her thighs, to feel her as much as you can, but you’re a good girl, and you won’t disobey.");
		}
		else
		{
			output("\n\nYou loved servicing Lane, and you love that she’s generous enough to attempt to return the favor, but all it does is make your arousal all the more frustrating. Your damnable lack of features builds your lust up to intolerable levels, and her every pitch against you is like a velvet prison: there’s no escaping the torturous pleasure Lane is giving you.");
		}
		if (pc.tailType != 0)
		{
			output(" Your [pc.tail] lashes underneath you both, sprawled out and hanging off the side of the bed. Lane wraps her own tail around it twice for stability, and squeezes hard.");
			if (pc.hasTailCunt())
			{
				output(" Your [pc.tailCunt] pulses with your excited heart, puffy with need and without something to please it.");
				if (!pc.hasVagina()) output(" You grunt in despair that your only outlet of relief isn’t getting any attention at all.");
				output(" Another squeeze from Lane’s strong tail rushes your blood to the vulva of your [pc.tailCunt], making it sting, and you bite your lips in an effort to keep from yelping.");
			}
			else if (pc.hasTailCock())
			{
				output(" Your [pc.tailCock] is painfully hard, the tip of it purple and swollen, leaking your [pc.cum] onto the floor beneath you, itself begging to be a part of the action somehow.");
				if (!pc.hasVagina()) output(" You moan in displeasure as your only outlet of release is completely ignored.");
				output(" Another strong squeeze from Lane’s tail inflates the head of your [pc.tailCock] even more, making it sting and even cutting off the flow of your precum.");
			}
		}

		output("\n\nLane’s breathing grows heavier and her motions become unfocused but intense, and you know she’s close. Her pleasured moans turn to quiet barks the more she moves until she can’t take any more: she leans back and thrusts her chest out, and you feel a warm liquid begin mingling with your own lustful juices, running down your [pc.vagina] and pooling underneath your");
		if (!pc.isNaga()) output(" [pc.ass]");
		else output(" body");
		output(". She stops her rocking against you selfishly while she climaxes,");
		if (pc.hasVagina())
		{
			output(" but luckily for you, your own is hot on her heels, and the feeling and the sight of having your mistress on top of you, pleasing herself with you, and releasing on you, pushes you over the edge. Your eyes practically roll into your head while your pussy convulses with Lane’s, letting your [pc.girlcum] flow from your box and mix and mingle with hers.");
			if (pc.isSquirter()) output(" You orgasm with such intensity that it shoots from your happy [pc.vagina], smashing into Lane’s and reaching as high as her lower stomach with some force.");
			output(" You cum twice more, so elated are you that you’ve finally cum with your mistress.");
		}
		else
		{
			output(" much to your pain and chagrin, but seeing Lane, in all her power and beauty, climaxing on top of you and flooding your crotch with her girl cum, unlocks something within you, and you remember, for a moment, what it was like to climax before you had lost your genitals. You spasm and climax a little awkwardly, but the release is nonetheless present, and you sigh in delight – your wonderful mistress had made you orgasm despite your features!");
		}

		output("\n\nShe doesn’t stop her fucking against you, but each buck is far less pronounced, and she’s mostly just riding out the aftermath of her orgasm. You’re more than content to join her, thrusting your [pc.hips] up to meet each press she makes against you. Minutes pass before you both calm down; you catch your breath and wipe the sweat from your brow, while the constant pulsing from Lane’s body begins to slow and regulate.");
	}

	// Merge
	output("\n\nYou lie on the bed, stewing in a mixture of your juices, embracing the literal afterglow of the heavy");
	if (pc.hasVagina()) output(" lesbian");
	output(" sex with your mistress. Among the lights and swirls of her body, you see stars and lines, and your lazy eyes focus on a single point on the ceiling above you as you come down.");

	output("\n\nLane, however, is much quicker on the draw. Once she catches her breath, she pulls herself off of you, leaving you on her bed. <i>“That was something else, [pc.name],”</i> she says softly, lowering her face close to yours. You habitually focus on her eyes, and you grin like a child with a toy when she changes their color for you like magic.");

	output("\n\nShe strokes along your [pc.hair] affectionately. <i>“You’re gonna need a shower,”</i> she remarks. <i>“You smell like a horny Daynar. You wouldn’t make it ten meters out in the");
	//output(" deserts of Venar");
	output(" wastes of Tarkus");
	output(" with this stench on you. Unless you don’t mind the stink of your mistress on you all the time.”</i> You’re tempted to tell her that you wouldn’t, but you’re actually not certain if that’s what she’s hinting you do.");

	output("\n\n<i>“You did very well, [pc.name],”</i> she praises as she turns away, towards one of her dressers on the far wall. From its drawers, she pulls out a fresh set of her airy, light clothing, precisely identical to her previous outfit. Once the crease of her ass vanishes beneath her thick undergarment, you resign that you’re not going to get any more out of her right now. <i>“I think I’ve made a good decision on making you my personal sex toy, don’t you?”</i> You agree with her wholeheartedly; you’ve never been so sincere before. You’d do anything if it meant being with Lane and providing her pleasure.");

	if(flags["LANE_FEMALE_SEXED"] == undefined || flags["LANE_FEMALE_SEXED"] == 1)
	{
		output("\n\n<i>“Here’s what’s going to happen.”</i> You roll over and sit up, peeling yourself from her bedsheets as you listen to her rapturously. <i>“From now on, after every twenty-four Terran hours, you will wire me five hundred credits. If you can’t afford it, just send me what you can. I’ll believe you. You wouldn’t lie to me.”</i> You nod your head – your earlier discussion still fresh in your memory. <i>“If you want to get hypnotized again, I’ll charge you the regular fee, but from now on, you’re... I’m going to tax you for it. It’s called the ‘Give Lane Your Body Tax.’ You’ll be giving something a little extra back to me for my service.”</i> You lick your [pc.lips]");
		if (pc.hasVagina()) output(" and your [pc.vagina] gets a little moist all over again");
		output(" at the very thought of it.");
		if (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" <i>“Whatever you took to make your tongue so long and talented, [pc.name]... I wouldn’t mind if you took a little more.”</i>");
	}
	output("\n\n<i>“Now then.”</i> When she’s finished, she stands before you, fully dressed and looking almost no different from when you had walked into her hut just an hour ago. <i>“As cute as you are, and as much as I wouldn’t mind going again, I’m afraid fucking my new property doesn’t pay the bills. Get out there and make me some money.”</i> And, without another word, she leaves the room, leaving you naked and soaked in a variety of juices. That was a little harsh, the way she talked to you like you were a tool in her toolbox, but in a way, that sort of attitude is what makes Lane so attractive to you – the way she’s focused on what she wants, like a predator, and when she’s done with it, she leaves it for her next target.");

	output("\n\nYou peel yourself from her bed and gather your belongings. Once you’re fully dressed once more, you leave her room, walking your way back through her ‘office.’ She’s found something to entertain her in her codex, and she barely even looks at you as you leave.");

	// Lust reduced to 0, time progresses by 1 hour, place PC one square outside Lane’s Plane
	processTime(60);

	pc.orgasm();
	lane.orgasm();

	clearMenu();
	addButton(0, "Next", move, "287");
}

public function lanesAppearance():void
{
	clearOutput();
	laneHeader();

	if (lane.mf("m", "f") == "m")
	{
		output("You sit across from Lane, on the opposite side of his table. He has a warm, disarming smile on his Daynarian face.");

		output("\n\nHe is just shy of 182cm tall, which, as you understand, is slightly above-average for Daynarians. He is covered in a layer of fine, brown scales, each of them meticulously groomed, going from the top of his head, to the tips of his shoulders, to, presumably, the base of his tail. The front of [lane.hisHer] body is very light brown skin, undeniably different from the scales going across [lane.hisHer] back: soft and smooth to the touch. He looks at you with calm, brown eyes – but sometimes, when you’re not looking right at them, he changes their color, just to mess with your head. He is slouched forward, his elbows on his table, resting his broad jaw on the back of his four-‘fingered’ hands. Each of them is webbed between the joints of his fingers.");

		output("\n\nHis form is slender and not especially masculine, but his chest is just a little thicker around the ribs; one of the few hints of the gender dimorphism of his species. His arms are a little thick around the biceps: it looks like Lane works out a little on his off-time. Adorned across his torso is a light, thin, airy shirt, clinging dutifully to his form but is designed to be removed in an instant. The material is practically see-through, although his chest and belly are completely featureless, lacking a belly-button and pecs and even nipples. Though you don’t see him stand too often, you know his pants are woven of the same material: light and breezy. They do not hide the pitch-white underwear covering what the rest of his clothes do not. Although you have to beg the question why he might want pants that are designed to be removed in a hurry....");

		output("\n\nAttaching his shoulders to his neck are a pair of membranes on either side of his head. The Daynarians call them ‘tassels’, if you remember correctly. Lane’s tassels are currently closed and pressed against the skin of his neck, but they can flare open whenever he wants them to. His tassels are adorned with inks of all colors and intensities, painting swirls and patterns on his skin, and clinging to the tassels are all manner of piercings, each glinting in the light of his little hut.");

		output("\n\nThe most mesmerizing thing about Lane is a rather unique feature that only the Daynarians have: their blood is naturally luminescent. All throughout Lane’s body, you can see his blood course: it’s easiest to see in his wrists and in his tassels, but it’s visible all over his body, from the thick of his chest to the thin of his cheeks. The luminescent blood lights a warm red with every beat of his heart, and on every rest, different veins map out a different route on his body with a calm, pale blue. The blood flowing through his tassels compliment his tattoos and his piercings exquisitely: you could just sit there and watch the glowing patterns for hours....");

		if (flags["LANE_MALE_SEXED"] != undefined) output("\n\nYou remember Lane’s equipment rather clearly. Between the crease of his legs is a genital slit roughly 7cm long, concealing a smooth, tapered Daynarian tool that’s 24cm in length when fully aroused. When you first get it to flop out of his slit, it’s only 6cm across, but the longer you go and the hornier he gets, it inflates to a girth twice that size. His dick has a pointed tip and has almost no distinguishing features: the typical Daynarian penis has thick skin that hides the veins, although the excited pulsing of his blood is still barely visible. You also know that, unlike most species, he’s the most sensitive at the base rather than the tip.");
	}
	else
	{
		output("You sit across from Lane, on the opposite side of her table. She has a warm, disarming smile on her Daynarian face.");

		output("\n\nShe is just shy of 179cm tall, which, as you understand, is slightly above-average for Daynarians. She is covered in a layer of fine, brown scales, each of them meticulously groomed, going from the top of her head, to the tips of her shoulders, to, presumably, the base of her tail. The front of her body is very light brown skin, undeniably different from the scales going across her back: soft and smooth to the touch. She looks at you with calm, brown eyes – but sometimes, when you’re not looking right at them, she changes their color, just to mess with your head. She is slouched forward, her elbows on her table, resting her long, angular jaw on the back of her four-‘fingered’ hands. Each of them is webbed between the joints of her fingers.");

		output("\n\nHer form is slender and not especially feminine, but her hips are just a little wider; one of the few hints of the gender dimorphism of her species. Adorned across her torso is a light, thin, airy shirt, clinging dutifully to her form but is designed to be removed in an instant. The material is practically see-through, and is cut to give Lane rather generous cleavage down her DD-cupped breasts – you understand that female Daynarians don’t usually have breasts at all, and having the means to purchase them is considered a status symbol among the species. Besides that, however, she has no nipples at all, although the fabric of her cloth would have done nothing to hide them. Her stomach, besides having no belly-button, is really rather toned, and you see a faint hint of a respectable four-pack of abs: it looks as though Lane likes to work out a little on her off time. Though you don’t see her stand too often, you know her pants are woven of the same material as her shirt: light and breezy. They do not hide the pitch-white underwear covering what the rest of her clothes do not. Although you have to beg the question why she might want pants that are designed to be removed in a hurry....");

		output("\n\nAttaching her shoulders to her neck are a pair of membranes on either side of her head. The Daynarians call them ‘tassels’, if you remember correctly. Lane’s tassels are currently closed and pressed against the skin of her neck, but they can flare open whenever she wants them to. Her tassels are adorned with inks of all colors and intensities, painting swirls and patterns on her skin, and clinging to the tassels are all manner of piercings, each glinting in the light of her little hut.");

		output("\n\nThe most mesmerizing thing about Lane is a rather unique feature that only the Daynarians have: their blood is naturally luminescent. All throughout Lane’s body, you can see her blood course: it’s easiest to see in her wrists and in her tassels, but it’s visible all over her body, from the thick of her breasts to the thin of her cheeks. The luminescent blood lights a warm red with every beat of her heart, and on every rest, different veins map out a different route on her body with a calm, pale blue. The blood flowing through her tassels compliment her tattoos and her piercings exquisitely: you could just sit there and watch the glowing patterns for hours....");

		if (flags["LANE_FEMALE_SEXED"] != undefined)
		{
			output("\n\nYou remember Lane’s honeypot rather clearly. Between the crease of her legs is a genital slit roughly 7cm long, concealing a hungry, wet vagina, with streamlined muscles adorning a narrow tunnel, designed to pull you deeper into her. She has no clitoris, unlike most other species you’ve encountered. The lips of her cunny are among the most sensitive part of her genitals, although the real prize, for her, is reaching as deep inside with whatever you can as possible. Her genital slit is not actually a part of her genitals, and is stubborn to move when she’s not in the mood, but are spongy and pliable when she is.");
		}
	}

	addDisabledButton(5, "Appearance");
}

public function tryFollowerLaneIntervention():Boolean
{
	if(flags["LANE_FULLY_HYPNOTISED_DAY"] <= days - 7 && flags["FOLLOWER_LANE_INTERVENTION"] == undefined)
	{
		// Figure out which follower is actually gonna take lead on this.
		var availFollowers:Array = getCrewOnShipNames(false, false);
		
		// Prune those that don't apply.
		var i:int = 0;
		while(i < availFollowers.length)
		{
			if (
				(InCollection(availFollowers[i], ["Ben-14","Bess-13"]) && !(flags["BESS_JUST_A_SEXBOT"] != 1 && (flags["BESS_LOVER"] != undefined || flags["BESS_IS_FRIEND"] != undefined || bessAffection() >= 30)))
			||	(availFollowers[i] == "Reaha" && !reahaIsCured())
			||	(availFollowers[i] == "Sera")
			||	(availFollowers[i] == "Goo Armor")
			) {
				availFollowers.splice(i, 1);
			}
			else i++;
		}
		
		if (availFollowers.length > 0)
		{
			var followerName:String = availFollowers[rand(availFollowers.length)];
			
			eventQueue.push(function():void {
				followerLaneIntervention(followerName);
			});
			
			return true;
		}
	}
	return false;
}

public function lFollowerName(customName:Boolean = false):String
{
	if (customName) return getFollowerName(flags["FOLLOWER_LANE_INTERVENTION"]);
	return flags["FOLLOWER_LANE_INTERVENTION"];
}
public function lFollowerBustDisplay():String
{
	return getFollowerBustDisplay(flags["FOLLOWER_LANE_INTERVENTION"]);
}
public function lFollowerMF(m:String, f:String):String
{
	if (isFollowerMale(flags["FOLLOWER_LANE_INTERVENTION"])) return m;
	return f;
}

public function followerLaneIntervention(followerName:String):void
{
	flags["FOLLOWER_LANE_INTERVENTION"] = followerName;

	clearOutput();
	showName("\n" + lFollowerName(true).toUpperCase());
	showBust(lFollowerBustDisplay());
	author("B");

	// I woulda used something like:
	// var tFollower:Creature = arg, tFollower.mf()
	// through this, but I figure some of these potential followers may not always have a statblock and fuck adding one.

	output("You board your ship once more, and shortly after you arrive, you’re met by " + lFollowerName(true) + ". You greet "+ lFollowerMF("him", "her"));
	if (lFollowerName() != "Dane") output(" warmly");
	output(", but in return, you get a scrunched, perplexed look. You see in "+ lFollowerMF("his", "her") +" left hand "+ lFollowerMF("his", "her") +" own codex, its light shimmering against "+ lFollowerMF("his", "her") +" thigh dependably.");

	output("\n\n<i>“We need to talk,”</i> "+ lFollowerMF("he", "she") +" says. You can’t get a good read on "+ lFollowerMF("his", "her") +" emotions; whatever is bothering "+ lFollowerMF("him", "her") +" is clearly important, but "+ lFollowerMF("he", "she") +"’s in that sort of middle-ground between");
	if (lFollowerName() == "Dane") output(" confusion and concern");
	else output(" angry, confused, upset, distraught, and a plethora of others");
	output(". You pat "+ lFollowerMF("him", "her") +" on the shoulder warmly and ask "+ lFollowerMF("him", "her") +" what the problem is.");

	output("\n\n" + lFollowerMF("He", "She") + " brings up "+ lFollowerMF("his", "her") +" codex, and on it is a long list of numbers. In particular, a lot of negative numbers, usually around the five hundred area. Beside each number is a green ‘before’ and a red ‘after’ – and both of those numbers steadily shrink as the days pass by.");
	if (lFollowerName() == "Dane") output(" <i>“Remiss as it may be to take too fine an interest in my </i>employers<i> financial situation...”</i>");
	else output("<i>“I was looking over our financial reports,”</i>");
	output(" "+ lFollowerMF("he", "she") +" says, holding "+ lFollowerMF("his", "her") +" voice steady and concealing "+ lFollowerMF("his", "her") +" thoughts, <i>“");
	if (lFollowerName() == "Dane") output("but");
	else output("and");
	output(" I can’t help but notice a pattern");
	if (lFollowerName() == "Dane") output(", and frankly, I’m not quite ready to jump off this gravy train just yet, Steele");
	output(".”</i>");

	output("\n\nYou already know the answer to the question "+ lFollowerMF("he", "she") +"’s not asking, but before you can explain yourself, "+ lFollowerMF("he", "she") +" pulls "+ lFollowerMF("his", "her") +" codex back. <i>“This has been going on for some time now,”</i> "+ lFollowerMF("he", "she") +" says, scrolling the page with "+ lFollowerMF("his", "her") +" finger. <i>“Five hundred credits have been disappearing from your account once a day at, coincidentally, the crack of midnight on Terra. Says here that they’ve been going to a PIN number rather than a business, so I couldn’t put a name to the benefactor.”</i> "+ lFollowerMF("He", "She") +" looks up from its glowing screen, and from the look in "+ lFollowerMF("his", "her") +" eyes, you could probably guess that "+ lFollowerMF("he", "she") +" already knows your answer. <i>“Do you know anything about this?”</i>");

	output("\n\n<i>“What if I did?”</i> you answer defensively, crossing your arms.");

	output("\n\n<i>“It’d save us all a whole lot of trouble, for one.");
	if (lFollowerName() == "Dane") output(" I’ve been in touch with a few of my contacts.");
	else output(" I’ve already contacted the UGC about it.");
	output(" They think we’re a victim of fraud");
	if (lFollowerName() == "Dane") output(". I’m asking what you know before I look into this any deeper.");
	else output(", but I’ve told them to put off their investigation until I had a chance to speak with you.");
	output("”</i> At the threat of");
	if (lFollowerName() == "Dane") output(" dragging Dane");
	else output(" bringing the authorities");
	output(" into your already convoluted mess, you avert your eyes nervously. <i>“They at least told me who the PIN number belongs to. Something about a Daynar living on the");
	//output(" desert planet Venar");
	output(" junkyard planet Tarkus");
	output("? Is any of this ringing a bell?”</i>");

	output("\n\nYou grit your teeth as you consider "+ lFollowerMF("his", "her") +" words and think on the implications of your next actions. You love your [lane.master] Lane; what [lane.heShe] wants is what you want, but you’re not entirely certain someone like " + lFollowerName(true) + " would see it that way. You could try to confide in "+ lFollowerMF("him", "her") +" how you feel about Lane and what [lane.heShe] means to you – or you could tell "+ lFollowerMF("him", "her") +" to mind "+ lFollowerMF("his", "her") +" own goddamn business. "+ lFollowerMF("He", "She") +" knows who the captain of this ship is; if you told "+ lFollowerMF("him", "her") +" to fuck off, "+ lFollowerMF("he", "she") +" would, plain and simple.");

	processTime(20);

	// [=Confide=][=Fuck Off=]
	clearMenu();
	addButton(0, "Confide", followerLaneInterventionConfide);
	addButton(1, "FuckOff", followerLaneInterventionFuckOff);
}

public function followerLaneInterventionConfide():void
{
	clearOutput();
	showName("\n" + lFollowerName(true).toUpperCase());
	showBust(lFollowerBustDisplay());
	author("B");

	output("<i>“I trust you,”</i> you tell "+ lFollowerName(true) +" suddenly. In response, "+ lFollowerMF("his", "her") +" eyes widen slightly");
	if (lFollowerName() != "Celise") output(" and "+ lFollowerMF("his", "her") +" nostrils flare");
	output("– "+ lFollowerMF("he", "she") +" knows "+ lFollowerMF("he", "she") +"’s not going to like whatever you have to tell "+ lFollowerMF("him", "her") +", but you continue anyway.");

	output("\n\nYou tell "+ lFollowerMF("his", "her") +" all about Lane, and how you just wandered into [lane.hisHer] hut one day and discovered what sort of service [lane.heShe] provides. You tell "+ lFollowerName(true) +" about how [lane.heShe] made you so much... better! [lane.HeShe] made your senses and your confidence so much better, and your limits and your barriers turned to nothing with [lane.hisHer] help.");

	output("\n\n<i>“Does this ‘Lane’ charge you five hundred credits per hypnosis?”</i>");

	output("\n\n<i>“No, [lane.heShe] only charges one hundred.”</i>");

	output("\n\n"+ lFollowerName(true) + " asks you to get to the point, and you tell "+ lFollowerMF("him", "her") +" how you came to love Lane, to adore [lane.himHer] and... and even worship [lane.himHer] a little. You tell "+ lFollowerMF("him", "her") +" how [lane.heShe] makes you feel so good, the way [lane.heShe] touches you and the way [lane.heShe] loves you. It’s become so much more than a business relationship between you two. You adore Lane so much, and you’d give so much to be with [lane.himHer], that when [lane.heShe] asked you to wire [lane.himHer] five hundred credits a day for the privilege of being [lane.hisHer] one-and-only, it almost seemed unfair to the rest of the universe that you’d get [lane.himHer] all to yourself.");

	output("\n\nWhen you finish, you expect");
	if (lFollowerName() == "Dane") output(" a barrage of questions from Dane");
	else output(" an entire array of emotions from " + lFollowerName(true));
	output("–");
	if (lFollowerName() != "Dane") output(" happiness that you’ve found the one that makes your heart flutter;");
	output(" acceptance that Lane means everything to you and that five hundred credits is a minor sum");
	if (lFollowerName() != "Dane") output("; maybe even jealousy that Lane didn’t choose "+ lFollowerMF("him", "her"));
	output(". The expression you get – jaw slack, eyes wide, lips curled and quivering, brow furrowed – looks appalled and disgusted.");

	output("\n\n<i>“[pc.name], listen very closely,”</i> "+ lFollowerMF("he", "she") +" says to you, placing both "+ lFollowerMF("his", "her") +" hands on your shoulders and forcing your eyes to lock to "+ lFollowerMF("his", "hers") +". <i>“Lane is stealing from you. [lane.HeShe] abused your trust, and now [lane.heShe]’s hypnotized you");
	if (lFollowerName() == "Dane") output(" into being your slutty little squeeze");
	else output(" to love [lane.himHer]");
	output(". [lane.HeShe] took your dignity, and now [lane.heShe]’s taking your money too.”</i>");

	output("\n\nYou try to insist that [lane.heShe] isn’t, but "+ lFollowerName(true) +" is not having any of it. <i>“Try and think. When did you first realize you ‘loved’ this Daynar?”</i> You squint your eyes as you recall it. It was a glorious afternoon; the weather was flawless; the smell of vanilla and lavender was – <i>“Focus!”</i> "+ lFollowerMF("he", "she") +" snaps, and you think harder. You can’t remember the date, but it was shortly after one of your sessions with [lane.himHer].");

	output("\n\n<i>“And what was your opinion of [lane.himHer] before that ‘session’?”</i>");

	output("\n\nIt was a cloudier time, you admit, but after focusing on it a moment longer, you tell "+ lFollowerMF("him", "her") +" that your opinion of Lane before that was that [lane.heShe] was an all right person, all around. [lane.HeShe] was a dependable business" + lane.mf("", "wo") + "man that ran a fair, if obscure, little business in the");
	//output(" desert");
	output(" forest");
	output(". You thought [lane.heShe] was attractive and were considering asking [lane.himHer] out on a date, or something.");

	output("\n\n<i>“That’s weird, [pc.name], that you would go straight from ‘eh, [lane.heShe]’s alright,’ to ‘surrender your livelihood to [lane.himHer]’ in the space of a single session, don’t you think?”</i> You don’t have a response to that – you never really considered it that way before. <i>“[lane.HeShe] didn’t do whatever you paid [lane.himHer] to do to you, and [lane.heShe] made you [lane.hisHer] little lovesick battered-housewife " + lane.mf("cumdump", "cuntslave") +" instead that day. Do you really love [lane.himHer]?”</i> You nod your head, though "+lFollowerName(true)+" is making you think thoughts you’d rather not. <i>“Has [lane.heShe] ever told you that [lane.heShe] loves you back?”</i>");

	output("\n\nYou’re stricken for words at that, and your mind desperately scrambles to recall some instance where [lane.heShe] did something for you that required some sacrifice on [lane.hisHer] part. There was that one time [lane.heShe] – no, that was someone else. But at least [lane.heShe] – actually, not once has Lane given you a discount. At the very least, Lane is a good lover! But... now that you think about it, most of your bouts with [lane.himHer] involve you doing all the work. [lane.HeShe]’s never wanted to go down on you... [lane.heShe]’s never even let you kiss [lane.himHer]; [lane.heShe]’s always the kisser.");

	output("\n\nYou suddenly feel very itchy, particularly around");
	if (pc.hasCock() && !pc.hasVagina()) output(" [pc.eachCock] and your [pc.asshole]");
	else if (!pc.hasCock() && pc.hasVagina()) output(" your [pc.vagina]");
	else if (pc.hasCock() && pc.hasVagina()) output(" your genitals, [pc.eachCock] and your [pc.vagina] each demanding attention");
	else output(" your [pc.asshole]");
	output(" and you have an insatiable need to go to Lane, knowing that [lane.heShe]’ll be able to scratch your itch just right. You look to "+lFollowerName(true)+", your eyes wide and begging. <i>“You can’t go to [lane.himHer] again, [pc.name],”</i> "+ lFollowerMF("he", "she") +" says to you as calmly as "+ lFollowerMF("he", "she") +" can, knowing that you’re about to freak out. <i>“[lane.HeShe]’ll only keep abusing you and stealing your money. You have to stop going to Lane, starting right now, or else [lane.heShe]’ll </i>own<i> you. Do you understand what that would mean?”</i>");

	output("\n\n<i>“Tell me what I need to do,”</i> you practically beg "+lFollowerMF("him", "her")+".");

	output("\n\n<i>“First, stop sending Lane your money.”</i> You reach for your own codex – but you can’t do it. You hand it to "+lFollowerName(true)+" and ask "+lFollowerMF("him", "her")+" to instead. Once you give "+lFollowerMF("him", "her")+" the password to your account (and promising yourself to change it when you’re finished here), "+lFollowerMF("he", "she")+" hands it back to you, the deed done. <i>“Second, don’t just not go to Lane anymore: stop thinking about [lane.himHer], stop wanting [lane.himHer], don’t call [lane.himHer], nothing. Let’s avoid even going to Tarkus if we can. [lane.HeShe]’s a bad drug, and the most effective way to wean off drugs is cold turkey.”</i>");

	output("\n\n<i>“I don’t know if I can,”</i> you say, knowing how pathetic you sound.");

	output("\n\n<i>“You can. If you don’t think you can believe in yourself, think about the others who");
	if (lFollowerName() == "Dane") output(" rely");
	else output(" believe");
	output(" in you. We can all break whatever hold this asshole has on you.”</i>");
	if (lFollowerName() == "Dane") output(" He squeezes your shoulder as a measure of reassurance");
	else output(" " + lFollowerMF("He", "She") + " cups your cheeks gently, and smiles warmly at you");
	output(". <i>“Whatever you think only [lane.heShe] can do, you can find someone else in the whole wide universe who can do it better. If you just need to blow off some steam and relieve some tension... you don’t need to pay a whole five hundred bones and look any farther than your own ship for that.”</i> You smile back at "+lFollowerMF("him", "her")+" – you knew you brought "+lFollowerMF("him", "her")+" on your ship for a reason.");

	output("\n\n"+ lFollowerName(true) +" is confident in your strength, and you feel some relief in confiding with "+lFollowerMF("him", "her")+" – and you thank "+lFollowerMF("him", "her")+" for "+ lFollowerMF("his", "her") +" help in realizing what Lane was doing to you. <b>From now on, you <i>cannot</i> visit Lane again.</b> You’re afraid of what might happen if you do. You and "+lFollowerName(true)+" both figure that <b>if you can make it ten days without any contact with Lane,</b> you ought to be cleansed of [lane.hisHer] influence.");

	output("\n\nYour old life starts again today.");

	// The PC no longer loses 500 credits per day. ‘Detox’ begins.
	flags["PC_PAYS_LANE_ERRY_DAY"] = undefined;
	flags["LANE_DETOX_COUNTER"] = 0;

	processTime(30);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function followerLaneInterventionFuckOff():void
{
	clearOutput();
	showName("\n" + lFollowerName(true).toUpperCase());
	showBust(lFollowerBustDisplay());
	author("B");

	output("You look "+ lFollowerName(true) +" dead in the eye. <i>“It’s not any of your business,”</i> you tell "+ lFollowerMF("him", "her") +" sternly. You try to look as serious as possible, but "+ lFollowerMF("he", "she") +"’s not entirely convinced.");

	output("\n\n<i>“At five hundred credits a day, I would think it’s the whole ship’s business, [pc.name].”</i> "+ lFollowerMF("He", "She") +" meets your stare unflinchingly and refuses to back down. <i>“That’s not chump change disappearing here. We could be using that for repairs or improvements");
	if (lFollowerName() == "Dane") output("- or keeping the resident mercenary paid well enough to stick around");
	output(".”</i>");

	output("\n\n<i>“That is </i>my<i> money, "+ lFollowerName(true) +", not yours.”</i> You snap at "+ lFollowerMF("him", "her") +", raising your voice slightly, hearing it echo off the steel girders and walls surrounding you. <i>“What I want to do with my goddamn money isn’t your prerogative or responsibility.");
	if (lFollowerName() == "Dane") output(" Drop it. I’ll make sure there’s enough money for </i>you<i> to shut the fuck up, so I suggest you get back to work. Assuming you actually still want to do your fucking job.");
	else output(" The next chance you get, I want you to contact the UGC and tell them we’re not a victim of any sort of fraud.");
	output(" Everything is under control, and I want you to remember that the next time you go poking your nose in someone else’s fucking affairs, least of all your </i>captain<i>, of all people.”</i>");

	output("\n\nNeither of you blink or flinch, sizing each other up in the bay of your ship. You clench your fists, bracing yourself to throw down if you need to. Finally, after a tense few seconds, "+ lFollowerName(true) +" takes a long sigh through "+ lFollowerMF("his", "her") +" nose. "+ lFollowerMF("His", "Her") +" expression softens, from a determined poker face to something decidedly more");
	if (lFollowerName() == "Dane") output(" defeated");
	else output(" hopeless");
	output(". <i>“Whatever you say,</i> Captain <i>[pc.name].”</i> "+ lFollowerMF("He", "She") +" turns and begins making "+ lFollowerMF("his", "her") +" way down the corridors of your ship, the light of "+ lFollowerMF("his", "her") +" codex flickering off the walls until "+ lFollowerMF("he", "she") +"’s out of sight.");

	output("\n\nYou exhale; that was close. As much as you love Lane, you’re too attached to "+ lFollowerName(true) + " to want to fight "+ lFollowerMF("him", "her") +". But at least now your future with your sexy Daynar "+ lane.mf("master", "mistress") +" is secure. You wonder if you should tell [lane.himHer] – maybe [lane.heShe]’ll reward you for your loyalty...");

	// The PC is hypnotized for the rest of the game and is guaranteed to get the ‘Lane owns Steele Tech’ bad ending after he/she obtains their father’s fortune.
	flags["LANE_FULLY_HYPNOTISED_FOREVER"] = 1;
	processTime(30);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function processLaneDetoxEvents(minutes:Number):void
{
	if (flags["LANE_DETOX_COUNTER"] == undefined) return;

	var oldT:Number = flags["LANE_DETOX_COUNTER"];
	flags["LANE_DETOX_COUNTER"] += minutes;
	var newT:Number = flags["LANE_DETOX_COUNTER"];

	if (oldT < 24 * 60 && newT >= 24 * 60)
	{
		AddLogEvent("Your codex beeps. You look down at it, and on its screen is a message from yourself, congratulating yourself for making it a whole twenty-four hours. You specifically neglect to mention what you’ve gone twenty-four hours without.\n\nThat wasn’t so bad! Ten days ought to be a breeze if they’re all this easy. You replace your codex and continue about what you were doing, but with a more confident stride than usual.", "good", minutes);
	}
	if (oldT < 48 * 60 && newT >= 48 * 60)
	{
		AddLogEvent(ParseText("Your codex beeps. You look down at it, and on its screen is a message from yourself, congratulating yourself for making it another twenty-four hours since you’ve gone cold turkey.\n\nAs easy as these past two days have been, you can’t help but feel a little guilty towards Lane. You haven’t had any sort of contact with [lane.himHer] in a while – [lane.heShe] must be worried about you by now. You consider giving [lane.himHer] a call, but you resist, placing your codex back where it belongs."), "good", minutes);

		if (!pc.hasStatusEffect("Lane Detoxing Weakness"))
		{
			pc.createStatusEffect("Lane Detoxing Weakness", 1, 0, 0, 0, false, "Charmed", "Cutting yourself off from Lane’s hypnotic treatments is taking its toll on your willpower.", false, 0);
			pc.willpowerMod -= 1;
		}
	}
	if (oldT < 72 * 60 && newT >= 72 * 60)
	{
		AddLogEvent("Your codex beeps. Your skin crawls just a little bit from the sound. You look down at it, and on its screen is a message from yourself, congratulating yourself for making it another twenty-four hours since you’ve promised to become clean.\n\nIt’s been getting a little harder, though. Lights seem a little duller; smells don’t entice you like they had. Your life in general seems just a little less exciting. Maybe you could ask Lane to hypnotize you into thinking – you stop yourself and, without another thought, you replace your codex and continue with your day.", "good", minutes);

		if (pc.hasStatusEffect("Lane Detoxing Weakness"))
		{
			pc.addStatusValue("Lane Detoxing Weakness", 1, 1);
			pc.willpowerMod -= 1;
		}
	}
	if (oldT < 96 * 60 && newT >= 96 * 60)
	{
		AddLogEvent(ParseText("Your codex beeps. Your fingers scratch along its glassy surface before you grip onto it. You look down at it, and on its screen is a message from yourself, reminding you that you’re still going without La – without your ‘drug’ after all this time.\n\nYou let yourself think about Lane. It’s been four days. You can handle a little fantasy about Lane. You fondly remember the way [lane.hisHer] body glows, the way [lane.heShe] talks so casually with you about business, the way [lane.hisHer] ") + lane.mf("dick", "cunt") +" felt " + lane.mf("in", "on") + " your–\n\nThe tingle of arousal snaps you out of your reverie and reminds you of what you’re fighting to avoid. You put your codex away and continue with your business, your eyes scanning the way ahead of you for something to distract you.", "good", minutes);

		if (pc.hasStatusEffect("Lane Detoxing Weakness"))
		{
			pc.addStatusValue("Lane Detoxing Weakness", 1, 1);
			pc.willpowerMod -= 1;
			pc.setStatusValue("Lane Detoxing Weakness", 2, 5);
		}
	}
	if (oldT < 120 * 60 && newT >= 120 * 60)
	{
		AddLogEvent(ParseText("Your codex beeps once, but your ears register it as a dull wail. You claw at your codex and bring it to your face. On it is a message from yourself, reminding you of what you had given up and what you could be experiencing <i>right now.</i>\n\nEverything reminds you of Lane somehow. The breeze reminds you of the way [lane.hisHer] breath washed over your neck as [lane.heShe] fucked you. You compare the taste of the foods you eat to the way [lane.hisHer] " + lane.mf("cock","pussy") + " tasted. The lights of the stars are nothing compared to the way the lights of [lane.hisHer] tassels glowed when [lane.heShe] worked on you.\n\nYou lick your [pc.lips] and replace your codex. You think about taking a seat and working out some new frustrations... but it wouldn’t be as good without Lane."), "good", minutes);

		if (pc.hasStatusEffect("Lane Detoxing Weakness"))
		{
			pc.addStatusValue("Lane Detoxing Weakness", 1, 2);
			pc.willpowerMod -= 2;
			pc.setStatusValue("Lane Detoxing Weakness", 2, 10);
		}
	}
	if (oldT < 144 * 60 && newT >= 144 * 60)
	{
		AddLogEvent(ParseText("You feel the vibration of your codex before you hear the beep. You scratch at its edges before you realize you’re even touching it. You have to re-read the message on it three times before you realize what it’s saying.\n\nNo matter how much you drink, your thirst is never quenched. For a split second, you see Lane in your mind’s eye, you at [lane.hisHer] feet, [lane.hisHer] genitals unaroused, [lane.hisHer] happy smile at your obedience cleansing your fiery nerves. You blink and chastise yourself for thinking about [lane.himHer] and promise not to do it again, and then you’re right back to your fantasies not even two minutes later."), "good", minutes);

		if (pc.hasStatusEffect("Lane Detoxing Weakness"))
		{
			pc.addStatusValue("Lane Detoxing Weakness", 1, 3);
			pc.willpowerMod -= 3;
			pc.setStatusValue("Lane Detoxing Weakness", 2, 15);
		}
	}
	if (oldT < 168 * 60 && newT >= 168 * 60)
	{
		AddLogEvent(ParseText("You’re hyper-aware of your surroundings, but that doesn’t make you any more conscious of them. The sound of your codex splits your ears like a jackhammer. The light of its screen burns your eyes, and the text on it berates you for your stupidity, giving up the best thing that ever happened to you.\n\nYou’re pretty sure you’re hallucinating. Every other time you turn around, you see Lane among the foliage, or as a face in the crowd. Each time you think you see [lane.himHer], your heart stops, and you nearly call out to [lane.himHer], to ask [lane.himHer] to end your torment and to beg for [lane.hisHer] forgiveness for letting yourself stray from [lane.hisHer] vices, and to fuck you like [lane.heShe] used to.\n\nFortunately for your dignity, that’s never the case, and your vision of [lane.himHer] vanishes when you stare for longer than a second."), "good", minutes);

		if (pc.hasStatusEffect("Lane Detoxing Weakness"))
		{
			pc.addStatusValue("Lane Detoxing Weakness", 1, 5);
			pc.willpowerMod -= 5;
			pc.setStatusValue("Lane Detoxing Weakness", 2, 20);
		}
	}
	if (oldT < 192 * 60 && newT >= 192 * 60)
	{
		AddLogEvent(ParseText("You’ve been staring at the screen of your codex for a few minutes, now. The warm glow of its screen on your eyes reminds you of Lane. Whatever endorphins the little machine gives you is peanuts compared to the real thing. The little release you manage to eke from it is interrupted by an angry message from yourself, taunting you that you had it just fine when Lane owned you, and that in surrendering your vice for a cleaner life, you’ve condemned yourself to needing it more than you ever had before.\n\nYour hallucinations have begun pervading your dreams; the last time you slept, you dreamt that you were back in Lane’s large, warm bed, snuggling underneath its sheets, naked as could be, when [lane.heShe] enters the room and silently climbs " + lane.mf("in behind you. You smile and pull your [pc.knees] to your [pc.chest], spreading your [pc.ass] for his thick, wonderful cock to claim you forever again.", "in front of you. You smile and lay flat on your back as she straddles your [pc.hips] and begins rocking herself back and forth, dominating you with her cunt like she used to.") + "...\n\nYou woke up on the <i>very</i> wrong side of the bed that time."), "good", minutes);

		if (pc.hasStatusEffect("Lane Detoxing Weakness"))
		{
			pc.addStatusValue("Lane Detoxing Weakness", 1, 7);
			pc.willpowerMod -= 7;
			pc.setStatusValue("Lane Detoxing Weakness", 2, 30);
		}
	}
	if (oldT < 216 * 60 && newT >= 216 * 60)
	{
		AddLogEvent("You see only bold, blasé colors: reds, browns, blacks and whites. Your vision has tunneled slightly, and you have to squint to look at your codex, to read the very harsh words you left yourself nine days ago. The beep it made hurt your ears, even though it didn’t sound any louder than a heartbeat, to you.\n\nOh well. You put your codex away and turn back to Lane,", "good", minutes);
		if (lane.mf("m", "f") == "m") ExtendLogEvent(ParseText(" sticking his wonderful cock back into your mouth and nursing on him gently. You feel his hands on the sides of your head as he warmly but eagerly guides you across his length. <i>“I’ve missed you, [pc.name],”</i> he says, and you’re instantly gratified. You lean forward to deepthroat him – and you feel something sharp across your soft palate."));
		else ExtendLogEvent(ParseText(" placing your [pc.lips] back on her wonderful cunt and lapping at her honeypot like a cat with a saucer of milk. You feel her hands on the sides of your head as she gently but eagerly presses your [pc.face] deeper into her. <i>“I’ve missed you, [pc.name],”</i> she says, and your heart flutters. You tilt your head up, to dig into her as deep as you can with your [pc.tongue] – and you feel something sharp across your palate."));
		ExtendLogEvent(ParseText("\n\nYou’re snapped back to reality. You look down at where your [lane.master] was, and find your thumb in your mouth, wet and compressed from you sucking on it. You wail in despair that it wasn’t real."));
		if (shipLocation != "201") ExtendLogEvent(" Tarkus is only a flight away – you could easily make it real!");
		else ExtendLogEvent(" Lane is only a few hours walk away - you could easily make it real!");

		if (pc.hasStatusEffect("Lane Detoxing Weakness"))
		{
			pc.addStatusValue("Lane Detoxing Weakness", 1, 9);
			pc.willpowerMod -= 9;
			pc.setStatusValue("Lane Detoxing Weakness", 2, 50);
		}
	}
	if (oldT < 240 * 60 && newT >= 240 * 60)
	{
		AddLogEvent("Your codex beeps. You look down on it, and see two new messages: one from yourself, congratulating you on making it another twenty-four hours. The other is from " + lFollowerName(true) + ".", "good", minutes);

		if (lFollowerName() != "Dane")
		{
			ExtendLogEvent(ParseText("\n\n<i>“This is going to sound a little gushy,”</i> it starts, <i>“but I just wanted to let you know that I’m really proud of you for making it the whole ten days without breaking and going back to that Lane person. You’re a great example of what a captain ought to be, and I’ve never been happier to be a part of someone’s crew. You’re an inspiration to the rest of us, [pc.name], and I’d gladly follow you to the edge of the universe.”</i>"));
		}
		else
		{
			ExtendLogEvent("\n\n<i>“I knew there was a reason I offered you my contract, Steele.”</i> it starts, <i>“You’ve proven yourself a far more capable captain than your idiot cousin could ever hope to be. You’ve only solidified the correctness of my choice again by breaking this Lanes hold over you. You’re an example of what a captain should be, Steele, and I’m glad to be a part of your crew.”</i>");
		}

		ExtendLogEvent("\n\nYou feel a little something in your eye when you read that message for the fourth time. You place your codex back where it belongs and continue your day with a much stronger, more confident stride than before. The name ‘Lane’ leaves nothing more than a bland taste on your tongue. <b>You are no longer hypnotized!</b>");

		if (pc.hasStatusEffect("Lane Detoxing Weakness"))
		{
			pc.willpowerMod += pc.statusEffectv1("Lane Detoxing Weakness");
			pc.removeStatusEffect("Lane Detoxing Weakness");
			flags["LANE_DETOX_COUNTER"] = undefined;
			flags["LANE_DETOX_STATUS"] = 1;
		}
	}
}
