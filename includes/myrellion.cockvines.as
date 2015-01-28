public function cockvineHeader():void
{
	showName("COCK\nVINE");
	showBust("COCKVINE");
	author("Nonesuch");
}

public function cockvineEncounter():void
{
	cockvineHeader();

	// Basically, reflex check + randomisation!
	if (rand(pc.RQ()/2) + (pc.RQ() / 2) > 60)
	{
		output("In the gloom of the deep caverns you feel constantly on edge; the second you set your gaze anywhere your neck begins to crawl, expecting an attack to come from behind. The ground is the last place your instincts tell you to keep an eye on, but when you glance downwards momentarily you are glad you did. You jerk to an immediate halt, staring at the thick, tubular, organic object sprawled out from a crevice across your path.");

		// First Encounter
		if (flags["MET_COCKVINE"] != undefined)
		{
			
			output("\n\nDeceptively still and partially hidden in the darkness it might be, but you know a cockvine tentacle when you see one.");
		}
		else
		{
			flags["MET_COCKVINE"] = 1;
			output("\n\nYou’ve no idea what it is but everything about it, particularly the way it disappears into that dark hole, makes you uneasy.");
		}

		if (flags["FUCKED_COCKVINE"] == undefined)
		{
			output("\n\nThe thick snake-like thing suddenly rears and grabs at your [pc.lowerbody]; you jump back in the nick of time. Rippling and bobbing agitatedly in the dim light now, you can see it is some sort of lithe, green tentacle with a blunt, purple head, replete with a moist, horizontal slit across the top. It is inexpressibly obscene and your eye is drawn to the thickening end disappearing into the crevice, from which more of these penis-vines are sliding into view. You can only imagine what the main body of this thing looks like: undoubtedly if it had managed to grab you, you would have found out.");

			// Female Treated/Bothrioc perked/whatever slut perks
			if (pc.isTreated() || pc.isBimbo() || 9999 == 0)
			{
				output("\n\nGazing at the emerging tentacles now – those pliable, thick, strong frustrated tentacles which look like just so much juicy cock to you – you feel dim annoyance with yourself for <i>not</i> letting yourself get caught. It is only natural for a creature like this to react to the presence of someone like you, so well-suited to blissfully taking care of such tense, hot, veiny frustration. And how good would that feel… you realize vaguely you are moving towards the mass of writhing cockvines automatically.");

				//{Weak willed/otherwise srsly far gone:
				if (pc.WQ < 5 || 9999 == 0)
				{
					output("\n\nYou couldn’t stop your body’s instincts even if you wanted to. You smile beatifically as first one tentacle, then a second wrap their warm embrace around you, beading their herbal semen onto your skin, leading and welcoming you to their deep, wet boudoir.");

					// Go to Consentacles
					clearMenu();
					addButton(0, "Next", cockvineConsentacles);
					return;
				}
			}
			// Not megaslut
			else
			{
				output("\n\nThe thought makes you shudder. Feeling deeply grateful for and not a little smug about your quick eyes and wits, you carefully skirt the writhing mass of tentacles and continue on your way.");
			}

			clearMenu();
			addButton(0, "Stop", cockvineEncounterStop, undefined, "Stop Moving", "Stop moving towards the cockvines.");
			addButton(1, "Go on", cockvineEncounterGoOn, undefined, "Go on", "Surrender yourself to the cockvines.");
		}
		else
		{
			output("\n\nThe thick snake-like thing suddenly rears and grabs at your [pc.lowerbody], but you are ready for it and jump back easily. The lithe, green tentacle with its blunt, purple head ripples and bobs agitatedly in the dim light now; you hear the slithering, swampy sound of more of it emerging from its crevice nest, rustled into action.");
			
			// Female Treated/Bothrioc perked/whatever slut perks
			if (pc.isTreated() || pc.isBimbo() || 9999 == 0)
			{
				output("\n\nGazing at the emerging tentacles now – those pliable, thick, strong frustrated tentacles which look like just so much juicy cock – you feel dim annoyance with yourself for <i>not</i> letting yourself get caught. It is only natural for a creature like this to react to the presence of someone like you, so well-suited to blissfully taking care of such tense, hot, veiny frustration. And how good would that feel… you realize vaguely you are moving towards the mass of writhing cockvines automatically.");

				// Weak willed/otherwise srsly far gone
				if (pc.WQ() < 5 || 9999 == 0)
				{
					output("\n\nYou couldn’t stop your body’s instincts even if you wanted to. You smile beatifically as first one tentacle, then a second wrap their warm embrace around you, beading their herbal semen onto your skin, leading and welcoming you to their deep, wet boudoir.");

					// Go to Consentacles
					clearMenu();
					addButton(0, "Next", cockvineConsentacles);
					return;
				}
			}
			// Not megaslut
			else
			{
				output("\n\nThe sight never fails to make you shudder. Feeling deeply grateful for and not a little smug about your quick eyes and wits, you carefully skirt the writhing mass of tentacles and continue on your way.");
			}

			clearMenu();
			addButton(0, "Stop", cockvineEncounterStop, undefined, "Stop Moving", "Stop moving towards the cockvines.");
			addButton(1, "Go on", cockvineEncounterGoOn, undefined, "Go on", "Surrender yourself to the cockvines.");
		}
	}
	else
	{
		if (flags["FUCKED_COCKVINE"] == undefined)
		{
			output("In the gloom of the deep caverns you feel constantly on edge; the second you set your gaze anywhere your neck begins to crawl, expecting an attack to come from behind. The ground is the last place your instincts tell you to keep an eye on – you don’t see the thick, tubular, organic, deceptively still shape lying across your path until it is far too late. You gasp as something warm, wet and ropy wraps itself around your [pc.lowerbody], wrenching you off balance; before you can recover, your assailant has established a firm grip around your");
			if (pc.isNaga()) output(" tail");
			else output(" [pc.foot]");
			output(" and sent you sprawling.");
			output("\n\nYou stare down at it, heart pounding. It is some sort of lithe, green tentacle with a blunt, purple head, complete with a moist, horizontal slit across the top. It is inexpressibly obscene and your eye is balefully drawn to the thickening end disappearing into the crevice; more of these penis-shaped vines are slithering out of it, a whole nest of these creatures stirred into action. You claw desperately at the ground but the vine attached to you draws you remorselessly towards the hole, where more tentacles curl their strong, warm grip around you.");
			output("\n\nYou manage to claw your weapon free as the dark swallows you entirely; in here, there is only the heavy herbal heat and smell of the plant monster and its many oozing, sinewy appendages, patiently winding themselves around your frame. You’ve got to fight free!");
		}
		else
		{
			output("In the gloom of the deep caverns you feel constantly on edge; the second you set your gaze anywhere your neck begins to crawl, expecting an attack to come from behind. The ground is the last place your instincts tell you to keep an eye on – you don’t see the thick, tubular, organic, deceptively still shape lying across your path until it is far too late. You gasp and then groan with understanding horror as something warm, wet and ropy wraps itself around your [pc.lowerbody], wrenching you off balance; before you can recover the cockvine has established a firm grip around your");
			if (pc.isNaga()) output(" tail");
			else output(" [pc.foot]")
			output(" and begins to tug you away.");
			output("\n\nDizzily you hear the busy, ropy sound of its many other appendages writhing out of a nearby crevice, stirred into action. You claw desperately at the ground but the vine attached to you draws you remorselessly towards the hole, more tentacles curling their strong, warm grip around you as you are dragged closer. You manage to claw your weapon free as the dark swallows you entirely; in here, there is only the heavy herbal heat and smell of the plant monster and its many oozing, sinewy appendages, patiently winding themselves around your frame.");
			output("\n\nYou’ve got to fight free!");
		}

		pc.createStatusEffect("Cockvine Grip", 1, 0, 0, 0, false, "Constrict", "Cockvine Constriction", "You're in the grip of a Cockvine!", true, 0);
		START FITE;
	}
}

public function cockvineAI():void
{
	if (!pc.hasStatusEffect("Cockvine Grip"))
	{
		pc.createStatusEffect("Cockvine Grip", 1, 0, 0, 0, false, "Constrict", "Cockvine Constriction", "You're in the grip of a Cockvine!", true, 0);
	}

	if (pc.statusEffectv1("Cockvine Grip") < 3) cockvineConstrictAttack();
	else if (pc.statusEffectv1("Cockvine Grip") == 3)
	{
		var attacks:Array = [];

		attacks.push(cockvineWhips);
	}

	if (pc.statusEffectv1("Cockvine Grip") == 0)
	{
		if (foes[0].hasStatusEffect("Flee Disabled")) foes[0].removeStatusEffect("Flee Disabled");
		if (pc.hasStatusEffect("Evasion Reduction")) pc.removeStatusEffect("Evasion Reduction");
		if (pc.hasStatusEffect("Grappled")) pc.removeStatusEffect("Grappled");
	}
	else
	{
		if (!foes[0].hasStatusEffect("Flee Disabled")) foes[0].createStatusEffect("Flee Disabled");

		if (pc.statusEffectv1("Cockvine Grip") == 1)
		{
			if (!pc.hasStatusEffect("Evasion Reduction")) pc.createStatusEffect("Evasion Reduction", 10, 0, 0, 0, true, "", "", "", true, 0);
			else pc.setStatusValue("Evasion Reduction", 1, 10);
		}

		if (pc.statusEffectv1("Cockvine Grip") >= 2)
		{
			if (!pc.hasStatusEffect("Evasion Reduction")) pc.createStatusEffect("Evasion Reduction", 20, 0, 0, 0, true, "", "", "", true, 0);
			else pc.setStatusValue("Evasion Reduction", 1, 20);

			pc.energyRaw -= 5;
			pc.lustRaw += 2 + rand(pc.libido() / 15);
		}

		if (pc.statusEffectv1("Cockvine Grip") == 3)
		{
			pc.createStatusEffect("Grappled", 1000, 0, 0, 0, true, "", "", "", true, 0);
		}
	}
}

public function cockvineConstrictAttack():void
{
	output("\nThe cockvine coils its grasp around you from every angle, trying to bind you closer in its warm, wet clinch.");

	if (rand(pc.SQ()) <= 50)
	{
		output("\n\nYou grapple with it as best you can but whenever you fight off one tentacle another seizes the opportunity to grasp you tightly. You cannot prevent the thoughtless power of it drawing you further into the darkness.");

		pc.addStatusValue("Cockvine Grip", 1, 1);

		switch (pc.statusEffectv1("Cockvine Grip"))
		{
			case 1:
				output("\n\nYou bark in frustration as once again it takes a firm grip of your [pc.lowerbody] and drags you away from the light.");
				break;

			case 2:
				output("\n\nVines slide around your belly and [pc.chest], cosseting you in tight, wet heat as you futilely try to peel them off you. They seem to be sweating an oily substance which makes them difficult to hold onto. The heavy, green air fogging your lungs makes it very difficult to stay focused and struggling against it; it feels like the energy and will to fight is being kneaded out of you, leaving behind a pleasant emptiness.");
				break;

			case 3:
				output("\n\nFeebly you try to swat away the tentacles blindly reaching for your hands, but you’re swaddled in cockvine at this point and you cannot stop it seizing first one wrist then the other, effectively pinioning you. Your breath comes heavy, drawing in more and more of the relaxing pheromone the plant is exuding. You’ve got to fight free whilst you still have the will and energy to do so!");
				break;

			default:
				throw new Error("Unmatched Cockvine Grip Value in ConstrictAttack: " + pc.statusEffectv1("Cockvine Grip"));
				break;

		}
	}
	else
	{
		output("\n\nYou struggle and fight the thing like a trapped wolverine, writhing this way and that to stop it getting a better grip on your limbs, beating back the tentacles so that you have a window of opportunity for your next move.");
	}
}

public function cockvineWhips():void
{
	output("\nThe movement of your own body translates into the surrounding vines where it seems to gather, the tentacles bunching and swaying back and forth until frenetic energy seizes them up, and they are whipping their bulbous heads into you with ropy, numbing force.\n");

	for (var i:int = 0; i < 5; i++)
	{
		enemyAttack(foes[0]);
	}
	output("\n");
}

// TODO: Splice this in to Combat code.
public function cockvineCombatDescriptionExtension():void
{
	if (!pc.hasStatusEffect("Cockvine Grip")) return;

	switch (pc.statusEffectv1("Cockvine Grip"))
	{
		case 0:
			output("\n\nYou have fought yourself clear almost to the lip of the cockvine’s nest. The relative light of the cavern is tantalizingly close...")
			break;

		case 1:
			output("\n\nThe cockvine has a firm grip on your [pc.lowerbody], making escape impossible. You have the use of your arms, at least.");
			break;

		case 2:
			output("\n\nThe cockvine has pulled you deep into the pit and wrapped itself tightly around your torso and [pc.chest], sliding its wet, ropy warmth across your [pc.skin] as it crawls inexorably up your body. The heavy smell of it is overwhelming, dazing – you feel your muscles relaxing despite your terror.");
			break;

		case 3:
			output("\n\nThe cockvine has you bound securely, your arms pulled away from your hot plant - slathered body. The feeling of arousal, hopelessness and doziness is getting steadily stronger and it’s getting increasingly difficult to force yourself to struggle...");
			break;

		default:
			throw new Error("Unmatched Cockvine Description Extension: " + pc.statusEffectv1("Cockvine Grip"));
			break;
	}
}

public function cockvineConsentacles():void
{

}

public function cockvineEncounterGoOn():void
{
	clearOutput();
	cockvineHeader();

	output("You have no wish to stop your body’s instincts. Your mind sinks into the cotton wool of its vast erogenous zone and lets your flesh get on with it, smiling beatifically as first one tentacle, then a second wrap their warm embrace around you, beading their herbal semen onto your skin, leading you downwards to their deep, wet boudoir.");

	clearMenu();
	addButton(0, "Next", cockvineConsentacles);
}

public function cockvineEncounterStop():void
{
	clearOutput();
	cockvineHeader();

	output("You get a firm grip on your treacherous instincts and stop yourself moving within range of the coiling, writhing cockvine. You give the tentacle nest a wide berth, shaking yourself down and refocusing on the cavern’s shadows. You really need to start investing in more cold showers.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}