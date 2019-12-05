package classes.Items.Transformatives 
{
	import classes.Engine.Interfaces.*;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.CockClass;
	import classes.BreastRowClass;
	import classes.VaginaClass;
	
	public class KerokorasVenom extends ItemSlotClass
	{
		//constructor
		public function KerokorasVenom()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.DRUG;
			
			shortName = "Kero.Ven.";
			longName = "vial of kerokoras venom";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a vial of kerokoras venom";
			
			tooltip = "[altTooltip KerokorasVenom]\n\n<b>Known to cause moderate amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 5;
			
			version = _latestVersion;
		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			
			if(target is PlayerCharacter)
			{
				author("Gardeford");
				
				output("You uncork the vial of viscous venom, treating your nose to a rush of sugary scents. It certainly smells appetizing, if nothing else. With a single tip of the bottle you drink the contents down in one gulp. The sticky fluid coats your tongue for a few seconds, requiring a few extra swallows to get down. You savor the sweet taste while you wait for the changes to occur...");
				
				// Initialize variables
				var changes:Number = 0;
				var changeLimit:Number = 3;
				var i:int = 0;
				var isTopClothed:Boolean = target.isChestCovered();
				var isBottomClothed:Boolean = target.isCrotchGarbed();
				var hasKeroFace:Boolean = InCollection(target.faceType, [GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_FROG]);
				var faceChanged:Boolean = false;
				var frogSkinColors:Array = ["orange and green", "mottled brown", "black and gold", "black and blue", "black and red", "red and blue", "black, blue and yellow", "gold"];
				var frogIrisColors:Array = ["red", "ruby", "green", "emerald", "blue", "sapphire", "yellow", "amber", "gold", "black"];
				
				target.taint(3);

				// Humanization first
				if((target.skinType != GLOBAL.SKIN_TYPE_SKIN || target.eyeType != GLOBAL.TYPE_FROG || !hasKeroFace) && rand(2) == 0)
				{
					output("\n\nThe first thing you feel after swallowing the sticky concoction is a giddy lightheadedness. You feel like jumping in the trees and finding something to lick, maybe all the things to lick! You shake your head, clearing the silly thoughts from it.");
					
					//if pc has nonhuman skin: 
					if(target.skinType != GLOBAL.SKIN_TYPE_SKIN)
					{
						if(target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
						{
							output("\n\nYou feel an unnatural heat begin to spread throughout your [pc.skinFurScales]. It starts in a few small areas, but swiftly spreads across your entire body.");
							if(isTopClothed)
							{
								output(" Noticing the change, you quickly remove your [pc.upperGarments]...");
								isTopClothed = false;
							}
							// fur:
							if(target.hasFur()) output(" You struggle to breath evenly as your fur becomes matted with sticky sweat, trying desperately to find a way to cool off. The clumped fur suddenly liquefies, sliding off your body and into a puddle beneath your feet. You’re left with perfectly smooth skin. <b>Your fur is gone!</b>");
							//scales:
							else if(target.hasScales()) output(" After a few seconds your scales become soft and spongy. You struggle to find your breath as they begin to liquify and slough from your body. The sticky goop continues to puddle beneath you until <b>You are left with completely smooth skin!</b>");
							//if goo:
							else if(target.hasGooSkin()) output(" You feel the interior of your gooey body begin to solidify. Fluid gel is replaced by fully functional humanoid parts. A thin coating of goo remains, feeling pleasant on your newly acquired skin. <b>You’re not gooey anymore!</b>");
							// catchall:
							else output("After a while, your [pc.skinFurScales] begins to morph and give way to a burgeoning coating of human flesh. You watch in awe as <b>your body becomes completely covered with simple, common skin.</b>");
							
							target.skinType = GLOBAL.SKIN_TYPE_SKIN;
							target.clearSkinFlags();
							target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
							changes++;
						}
						else output("\n\n" + target.skinTypeLockedMessage());
					}
					//if face is nonhuman/eyes are nonfrog
					if((target.eyeType != GLOBAL.TYPE_FROG || !hasKeroFace) && rand(2) == 0)
					{
						if((target.eyeType != GLOBAL.TYPE_FROG && target.eyeTypeUnlocked(GLOBAL.TYPE_FROG)) || (!hasKeroFace && target.faceTypeUnlocked(GLOBAL.TYPE_HUMAN)))
						{
							var newEyeColor:String = RandomInCollection(frogIrisColors);
							
							output("\n\n");
							if(isTopClothed && target.hasAirtightSuit())
							{
								output("Detecting a change, you quickly remove your [pc.armor]... ");
								isTopClothed = false;
							}
							output("You rub your eyes as everything in your field of vision turns blurry. Your hands come away coated in viscous goop. It takes a few brushes to clear away all the gunk, but when it clears you use your codex’s mirror function to find that <b>");
							if(target.eyeType != GLOBAL.TYPE_FROG && !hasKeroFace) output("you now have a human face and " + newEyeColor + " eyes like a frog");
							else if(!hasKeroFace) output("you have a human face");
							else output("you have " + newEyeColor + " frog eyes");
							kGAMECLASS.output("!</b>");
							if(target.eyeType != GLOBAL.TYPE_FROG)
							{
								target.eyeColor = newEyeColor;
								target.eyeType = GLOBAL.TYPE_FROG;
							}
							if(!hasKeroFace)
							{
								target.faceType = GLOBAL.TYPE_HUMAN;
								target.clearFaceFlags();
								target.addFaceFlag(GLOBAL.FLAG_SMOOTH);
							}
							faceChanged = true;
							changes++;
						}
						else if(target.eyeType != GLOBAL.TYPE_FROG) output("\n\n" + target.eyeTypeLockedMessage());
						else output("\n\n" + target.faceTypeLockedMessage());
					}
				}
				
				// Firststuff: Genderbits
				else if((!target.hasVagina() || target.femininity < 80) && rand(2) == 0)
				{
					//Pc grows a vagina!
					if(changes < changeLimit && !target.hasVagina() && rand(3) != 0)
					{
						if(target.createVaginaUnlocked())
						{
							output("\n\nA sudden bout of vertigo and a hot panging flash");
							if(target.legCount != 1) output(" between your [pc.legs]");
							output(" brings you to");
							if(target.hasKnees()) output(" your [pc.knees]");
							else output(" the floor");
							output(". After your head is done spinning, you");
							if(isBottomClothed)
							{
								output(" remove your [pc.lowerGarments] and");
								isBottomClothed = false;
							}
							output(" check your faculties to see if anything is wrong. You’re surprised to find <b>a new vagina");
							if(target.genitalLocation() >= 2) output(" in your genital region");
							else if(target.legCount == 1) output(" between your thighs");
							else output(" between your legs");
							output("</b>");
							if(target.hasCock()) output(", right behind [pc.eachCock]");
							output(". The new hole comes with a fully functional button-sized clit!");
							
							target.createVagina();
							target.clitLength = 0.5;
							changes++;
						}
						else output("\n\n" + target.createVaginaLockedMessage());
					}
					//100% fem increase
					if(changes < changeLimit && target.femininity < 80)
					{
						var femInc:Number = 2;
						if(target.femininity < 60) femInc += 2;
						if(target.femininity < 40) femInc += 2;
						if(target.femininity < 20) femInc += 2;
						
						if(target.femininityUnlocked(target.femininity + femInc))
						{
							output("\n\nYou feel your facial structure begin to shift and soften. At first the feeling comes with a sharp stinging, but soon it fades to a dull ache as your features change slightly. <b>You feel much more feminine now!</b>");
							
							target.femininity += femInc;
							changes++;
						}
						else output("\n\n" + target.femininityLockedMessage());
					}
				}
				
				// Nextstuff: Boobers
				if(changes < changeLimit && rand(2) == 0)
				{
					//pc boobshrink
					if(changes < changeLimit && target.biggestTitSize() > 0)
					{
						var boobDec:Number = 2;
						if(target.biggestTitSize() > 30) boobDec += 2;
						if(target.biggestTitSize() > 20) boobDec += 2;
						if(target.biggestTitSize() > 10) boobDec += 2;
						
						var boobChanged:Boolean = false;
						var boobLocked:Boolean = false;
						for (i = 0; i < target.breastRows.length; i++)
						{
							if(target.breastRatingUnlocked(i, target.biggestTitSize() - boobDec))
							{
								if(target.breastRows[i].breastRatingRaw > 0) target.breastRows[i].breastRatingRaw -= boobDec;
								if(target.breastRows[i].breastRatingRaw < 0) target.breastRows[i].breastRatingRaw = 0;
								boobChanged = true;
							}
							else boobLocked = true;
						}
						
						if(boobChanged)
						{
							output("\n\nYou feel a sudden tightness in your chest, causing your heart to beat faster as your hands go to your [pc.chest]. You grit your teeth and then finally suck in a gasp of air. Your breasts inflate with the inhalation, swelling to almost twice their size, the skin stretched like a drum and aching with need of release. You open your mouth to cry out, only to have a loud and inhuman <i>“CROOOOOOOOAK....”</i> escape your lips, your breasts deflating to push out the echoing sound. By the time it is finished your breasts have more than just deflated, they seem smaller than they were before.");
							
							changes++;
						}
						else if(boobLocked) output("\n\n" + target.breastRatingLockedMessage());
					}
					var normalNips:Number = 0;
					var flatNips:Number = 0;
					var invertNips:Number = 0;
					var nipLocked:Boolean = false;
					var nipChanged:Boolean = false;
					for (i = 0; i < target.breastRows.length; i++)
					{
						if(target.breastRows[i].nippleType != GLOBAL.NIPPLE_TYPE_NORMAL) 
						{
							if(!target.nippleTypeUnlocked(i, GLOBAL.NIPPLE_TYPE_NORMAL)) nipLocked = true;
						}
						else normalNips++;
						if(target.breastRows[i].nippleType != GLOBAL.NIPPLE_TYPE_FLAT)
						{
							if(!target.nippleTypeUnlocked(i, GLOBAL.NIPPLE_TYPE_FLAT)) nipLocked = true;
						}
						else flatNips++;
						if(target.breastRows[i].nippleType != GLOBAL.NIPPLE_TYPE_INVERTED)
						{
							if(!target.nippleTypeUnlocked(i, GLOBAL.NIPPLE_TYPE_INVERTED)) nipLocked = true;
						}
						else invertNips++;
					}
					// convert normal nipples to flat or inverted
					if(changes < changeLimit && normalNips == target.bRows() && rand(3) != 0)
					{
						/*
						if(flatNips <= 0 && target.nippleLengthRatio < 1 && rand(2) == 0)
						{
							output("\n\nA strange sensation hits your nipples. Quickly");
							if(isTopClothed && !target.isChestExposed())
							{
								output(" undressing and");
								isTopClothed = false;
							}
							output(" taking them into your hands, you notice your nubs rapidly shrinking - smaller and smaller... When the feeling subsides, you are left with a flat pebbly surface on each areola in the place where a nipple would be. <b>Your nipples are now flat!</b>");
							
							for (i = 0; i < target.breastRows.length; i++)
							{
								if(target.nippleTypeUnlocked(i, GLOBAL.NIPPLE_TYPE_FLAT)) target.breastRows[i].nippleType = GLOBAL.NIPPLE_TYPE_FLAT;
							}
							nipChanged = true;
							changes++;
						}
						else 
						*/
						if(invertNips <= 0)
						{
							output("\n\nAn unpleasent twinge of nerves brings your attention to your nipples.");
							if(isTopClothed && !target.isChestExposed())
							{
								output(" You quickly undress to investigate...");
								isTopClothed = false;
							}
							output(" By the time you focus on them the pain is gone, but you find what looks pinched holes in their place. Momentary panic subsides when a bit of rubbing has them poking out just the same as before. <b>Your nipples are now inverted!</b>");
							
							for (i = 0; i < target.breastRows.length; i++)
							{
								if(target.nippleTypeUnlocked(i, GLOBAL.NIPPLE_TYPE_INVERTED)) target.breastRows[i].nippleType = GLOBAL.NIPPLE_TYPE_INVERTED;
							}
							nipChanged = true;
							changes++;
						}
						else if(nipLocked) output("\n\n" + target.nippleTypeLockedMessage());
					}
					//nips become normal
					if(changes < changeLimit && !nipChanged && (normalNips + invertNips + flatNips) != target.breastRows.length)
					{
						var nipChangeFrom:int = -1;
						for (i = 0; i < target.breastRows.length; i++)
						{
							if(target.nippleTypeUnlocked(i, GLOBAL.NIPPLE_TYPE_NORMAL))
							{
								if(target.breastRows[i].nippleType != GLOBAL.NIPPLE_TYPE_NORMAL) nipChangeFrom = target.breastRows[i].nippleType;
							}
						}
						
						if(nipChangeFrom != -1)
						{
							output("\n\n");
							if(isTopClothed && !target.isChestExposed())
							{
								output(" An odd feeling in your chest makes you remove your [pc.upperGarments]. ");
								isTopClothed = false;
							}
							//lipples:
							if(nipChangeFrom == GLOBAL.NIPPLE_TYPE_LIPPLES) output("Your [pc.nipples] pucker up as though about to kiss something, pressing tight enough to ache, and with a disturbing blown kiss sound, they seem to pop, transforming back into plain and boring normal nipples.");
							//Dicknipples:
							else if(nipChangeFrom == GLOBAL.NIPPLE_TYPE_DICK) output("Your [pc.nipples] swell obscenely and you feel a tightness in your breasts before torrents of [pc.cum] explode from within the orbs. Each spurt of the [pc.cumColor], creamy [pc.cumNoun] causes your phallic teats to contract and deform, transforming back into plain and boring normal nipples.");
							//tentacle nipples:
							else if(nipChangeFrom == GLOBAL.NIPPLE_TYPE_TENTACLED) output("Your [pc.nipples] go numb for a moment, the normally nearly prehensile buds falling limp before slowly stiffening, losing their muscles for a more natural blood filled erectile tissue as they transform back into plain and boring normal nipples.");
							//catchall:
							else output("Your [pc.nipples] go numb as a slick goo engulfs them. A few tingles replace the feeling and you reflexively wipe the gunk away to reveal that your nipples have completely changed in shape...");
							output(" <b>You now have normal nipples!</b>");
							
							for (i = 0; i < target.breastRows.length; i++)
							{
								if(target.nippleTypeUnlocked(i, GLOBAL.NIPPLE_TYPE_NORMAL))
								{
									if(target.breastRows[i].nippleType != GLOBAL.NIPPLE_TYPE_NORMAL) target.breastRows[i].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
								}
							}
							nipChanged = true;
							changes++;
						}
						else if(nipLocked) output("\n\n" + target.nippleTypeLockedMessage());
					}
					//pc nippleshrink
					if(changes < changeLimit && !nipChanged && normalNips == target.bRows() && target.nippleLengthRatio > 0.01 && rand(3) != 0)
					{
						var nipLDec:Number = 0.5;
						if(target.nippleLengthRatio > 2) nipLDec++;
						if(target.nippleLengthRatio > 4) nipLDec++;
						if(target.nippleLengthRatio > 6) nipLDec++;
						if((target.nippleLengthRatio - nipLDec) < 0.01) nipLDec = (target.nippleLengthRatio - 0.01);
						
						if(target.nippleLengthRatioUnlocked(target.nippleLengthRatio - nipLDec))
						{
							output("\n\nA tingling sensation in your [pc.nipples] causes them to stiffen fully erect for a moment, before they seem to regress, shrinking to a slightly smaller size on your [pc.chest]. A touch");
							if(isTopClothed && !target.isChestExposed())
							{
								output(" against your");
								if(target.hasArmor()) output(" [pc.armor]");
								else output(" [pc.upperUndergarment]");
							}
							output(" reveals them to be, thankfully, just as sensitive as before.");
							
							target.nippleLengthRatio -= nipLDec;
							changes++;
						}
						else output("\n\n" + target.nippleLengthRatioLockedMessage());
					}
				}
				
				// thirdstuff: Froggify yoself
				var hasKeroSkin:Boolean = InCollection(target.skinType, [GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_LATEX, GLOBAL.SKIN_TYPE_PLANT]);
				if(changes < changeLimit && hasKeroSkin)
				{
					//low chance to lose hair
					if(changes < changeLimit && target.hasHair() && rand(3) == 0)
					{
						if(target.hairLengthUnlocked(0))
						{
							output("\n\n");
							if(isTopClothed && target.hasAirtightSuit())
							{
								output("Detecting a change, you quickly remove your [pc.armor]... ");
								isTopClothed = false;
							}
							output("A tingling sensation covers your scalp. When you reach to feel your [pc.hair] you find it soaked with a sticky gel. You quickly activate the self view function of your codex just in time to see your [pc.hair] seemingly meld with your skin, leaving you totally bald.");
							
							target.hairLength = 0;
							changes++;
						}
						else output("\n\n" + target.hairLengthLockedMessage());
					}
					//frog ears tf
					if(changes < changeLimit && target.earType != GLOBAL.TYPE_FROG && rand(3) != 0)
					{
						if(target.earTypeUnlocked(GLOBAL.TYPE_FROG))
						{
							output("\n\n");
							if(isTopClothed && target.hasAirtightSuit())
							{
								output("Detecting a change, you quickly remove your [pc.armor]... ");
								isTopClothed = false;
							}
							output("Your [pc.ears] begin to itch and burn, and you reach up to rub them. You’re surprised to find, however, that your ears have sunk into the sides of your head, leaving shallow divots for your hearing holes. <b>You now have frog ears!</b>");
							
							target.earType = GLOBAL.TYPE_FROG;
							target.clearEarFlags();
							target.earLength = 0;
							changes++;
						}
						else output("\n\n" + target.earTypeLockedMessage());
					}
					//Frog eyes tf
					if(changes < changeLimit && target.eyeType != GLOBAL.TYPE_FROG && rand(3) != 0)
					{
						if(target.eyeTypeUnlocked(GLOBAL.TYPE_FROG))
						{
							output("\n\nYour vision goes dark, and for a second you’re worried that you may be going blind. Light comes back a few seconds later, and you rush for your codex’s mirror function. Your irises are still the same as before, but your pupils have been replaced with");
							if(target.eyeColor == "black") output(" blocky, almost digital-looking, iridescent ‘plus’ signs");
							else output(" bubbly black pluses");
							output(". <b>You now have frog eyes!</b>");
							
							target.eyeType = GLOBAL.TYPE_FROG;
							changes++;
						}
						else output("\n\n" + target.eyeTypeLockedMessage());
					}
					// horn loss
					if(changes < changeLimit && target.hasHorns() && rand(3) == 0)
					{
						if(target.hornsUnlocked(0))
						{
							output("\n\n");
							if(isTopClothed && target.hasAirtightSuit())
							{
								output("Detecting a change, you quickly remove your [pc.armor]... ");
								isTopClothed = false;
							}
							output("You feel an itching sensation in your skull, and reach for your horns, only to feel them crumble apart. You brush the dust off your head, leaving it free of debris.");
							
							target.removeHorns();
							changes++;
						}
						else output("\n\n" + target.hornsLockedMessage());
					}
					// lips up to just below bimbo
					if(changes < changeLimit && target.lipMod < 3 && rand(3) != 0)
					{
						if(target.lipModUnlocked(target.lipMod + 1))
						{
							output("\n\nYour lips tingle, and you lick them, finding them to be slightly fuller than they were before. The tingling sensation quickly fades, leaving you with a slightly more kissable mouth.");
							
							target.lipMod++;
							changes++;
						}
						else output("\n\n" + target.lipModLockedMessage());
					}
					// Tail
					if(changes < changeLimit && rand(2) == 0)
					{
						// tail growth
						if(target.tailCount == 0)
						{
							if(target.tailCountUnlocked(1) && target.tailTypeUnlocked(GLOBAL.TYPE_FROG))
							{
								output("\n\n");
								if(isBottomClothed)
								{
									output("Sensing a change coming on, you hastily remove your [pc.lowerGarments]... ");
									isBottomClothed = false;
								}
								output("You feel a warm tugging just above your butt, and look back to see a small mound of flesh slowly growing from your tailbone. The tugging ebbs as the protrusion settles into a small stubby tail. It waggles cutely when you look at it, and feels sensitive when you touch it. <b>You now have a frog tail!</b>");
								
								target.removeTails();
								target.tailCount = 1;
								target.tailType = GLOBAL.TYPE_FROG;
								target.addTailFlag(GLOBAL.FLAG_SMOOTH);
								target.addTailFlag(GLOBAL.FLAG_STICKY);
								changes++
							}
							else if(target.tailCountUnlocked(1)) output("\n\n" + target.tailTypeLockedMessage());
							else output("\n\n" + target.tailCountLockedMessage());
						}
						// tail change
						else if(target.tailType != GLOBAL.TYPE_FROG)
						{
							if(target.tailTypeUnlocked(GLOBAL.TYPE_FROG))
							{
								output("\n\nYou feel your [pc.tail] tighten and constrict, losing");
								if(target.hasTailFlag(GLOBAL.FLAG_LONG)) output(" a few inches of length.");
								else output(" its former shape.");
								//if furred tail:
								if(target.hasTailFlag(GLOBAL.FLAG_FURRED)) output(" Its fur becomes coated with a sticky substance, congealing into a single smooth tail.");
								output(" When it finishes, you’re left with a small stubby protrusion just above your butt. <b>You now have a frog tail!</b>");
								
								target.removeTails();
								target.tailCount = 1;
								target.tailType = GLOBAL.TYPE_FROG;
								target.addTailFlag(GLOBAL.FLAG_SMOOTH);
								target.addTailFlag(GLOBAL.FLAG_STICKY);
								changes++
							}
							else output("\n\n" + target.tailTypeLockedMessage());
						}
					}
					// Legs
					if(changes < changeLimit && target.legType != GLOBAL.TYPE_FROG && rand(2) == 0)
					{
						// legs become human
						if(target.legType != GLOBAL.TYPE_HUMAN)
						{
							if(target.legTypeUnlocked(GLOBAL.TYPE_HUMAN))
							{
								output("\n\n");
								if(isBottomClothed && target.legCount != 2)
								{
									output("Sensing a change coming on, you hastily remove your [pc.lowerGarments]... ");
									isBottomClothed = false;
								}
								output("A tingly numbness spreads through your [pc.legOrLegs], and you watch ");
								if(target.legCount < 2) output("your [pc.lowerBody]");
								else if(target.isTaur()) output("your tauric body");
								else output("your [pc.legs]");
								output(" become soaked with sticky liquid. The liquid shimmers and grows thicker until it obscures your [pc.legOrLegs] from sight. Suddenly it falls into a puddle beneath you, revealing a pair of smooth - albeit a little sticky - humanoid legs.");
								
								target.legCount = 2;
								target.genitalSpot = 0;
								target.legType = GLOBAL.TYPE_HUMAN;
								target.clearLegFlags();
								target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
								target.addLegFlag(GLOBAL.FLAG_SMOOTH);
								changes++
							}
							else output("\n\n" + target.legTypeLockedMessage());
						}
						// get frog feet(requires human legs)
						else if(target.legCount >= 2)
						{
							if(target.legTypeUnlocked(GLOBAL.TYPE_FROG))
							{
								output("\n\nYou fall flat on your [pc.butt] as your [pc.feet] tense and spasm, slowly rearranging until they become three-toed webbed feet, exactly like the kerokoras. You wiggle and stretch your new digits, getting used to them before continuing on your way.");
								
								target.legType = GLOBAL.TYPE_FROG;
								target.clearLegFlags();
								target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
								target.addLegFlag(GLOBAL.FLAG_SMOOTH);
								target.addLegFlag(GLOBAL.FLAG_STICKY);
								changes++
							}
							else output("\n\n" + target.legTypeLockedMessage());
						}
					}
					// Arms
					if(changes < changeLimit && target.armType == GLOBAL.TYPE_HUMAN && rand(2) == 0)
					{
						if(target.armTypeUnlocked(GLOBAL.TYPE_FROG))
						{
							output("\n\nA sudden flush makes you raise your arms in surprise. Spotting your hands, you find that they sweat a viscous, gooey substance, making them glisten in the light. Your trembling fingers begin elongating ever-so-slightly, the nails soften as each tip bulges out into a bulbous shape, and new skin expands between each digit. When your arm transformation completes, you find that <b>you now have sticky, webbed hands!</b>");
							
							target.armType = GLOBAL.TYPE_FROG;
							target.clearArmFlags();
							target.addArmFlag(GLOBAL.FLAG_SMOOTH);
							target.addArmFlag(GLOBAL.FLAG_STICKY);
							changes++
						}
						else output("\n\n" + target.armTypeLockedMessage());
					}
					// get frog tongue
					if(changes < changeLimit && target.tongueType != GLOBAL.TYPE_FROG && rand(2) == 0)
					{
						if(target.tongueTypeUnlocked(GLOBAL.TYPE_FROG))
						{
							output("\n\nYou suddenly lose your sense of taste, feeling an uncomfortable tingle in your mouth. The sensation passes quickly however, and when you stick out your tongue, you find it to be coated in a gooey sticky substance - and also a great deal longer than before. You have the sudden urge to eat insects, but dismiss the thought with an embarrassed shake of your head.");
							
							target.tongueType = GLOBAL.TYPE_FROG;
							target.clearTongueFlags();
							target.addTongueFlag(GLOBAL.FLAG_LONG);
							target.addTongueFlag(GLOBAL.FLAG_SMOOTH);
							target.addTongueFlag(GLOBAL.FLAG_STICKY);
							changes++
						}
						else output("\n\n" + target.tongueTypeLockedMessage());
					}
					//Skin color change to colors similar to forg gorls
					if(changes < changeLimit && !InCollection(target.skinTone, frogSkinColors) && rand(3) == 0)
					{
						var newSkinColor:String = RandomInCollection(frogSkinColors);
						
						if(target.skinToneUnlocked(newSkinColor))
						{
							output("\n\n");
							if(isTopClothed || isBottomClothed)
							{
								output("A major change courses through you and you quickly undress yourself. ");
								isTopClothed = false;
								isBottomClothed = false;
							}
							output("Goosebumps pepper your [pc.skinFurScales] as a ticklish feeling spreads across it. The feeling spreads through your body until you have to blink away the itchiness in your eyes. When you open them again you find that your body has changed color! Your skin is now in a pattern of ");
							if(newSkinColor == "orange and green") output("bright orange with splashes of pale green");
							else if(newSkinColor == "mottled brown") output("mottled earthy brown with muddy spots");
							else if(newSkinColor == "black and gold") output("pure inky black with patches of gold on your upper body");
							else if(newSkinColor == "black and blue") output("sea blue with black blotches along your back and sides");
							else if(newSkinColor == "black and red") output("dark inky black with vibrant blood red patches across your body");
							else if(newSkinColor == "red and blue") output("vibrant red with deep blue arms and legs");
							else if(newSkinColor == "black, blue and yellow") output("blue striped black legs with a bright yellow upper body");
							else output("solid sparkling gold");
							output(", coloring you like a painting canvas. After the sensation passes, you take a good look at yourself. <b>You’re colored like a kerokoras!</b>");
							
							target.skinTone = newSkinColor;
							changes++;
						}
						else output("\n\n" + target.skinToneLockedMessage());
					}
					// get venomous sweat
					// Enemies who grapple pc take 8-15 lust damage per turn.
					if(changes < changeLimit && (!target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED) || !target.hasSkinFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) && rand(3) == 0)
					{
						//Desc:
						output("\n\n");
						if(isTopClothed || isBottomClothed)
						{
							output("A major change courses through you and you quickly undress yourself. ");
							isTopClothed = false;
							isBottomClothed = false;
						}
						output("Your skin begins to excrete slippery venomous sweat, and you rub your hands across your body, rejoicing in the slippery feeling. You aren’t as much of a fountain as the kerokoras themselves");
						// 9999 Not sure battles can/should support this...
						//output(", but in the heat of battle you think it’ll have some effect. <b>You have lust venom sweat!</b>");
						// Alternate
						output(", though you doubt that will be an issue. <b>Your skin is now coated in lubricant!</b>");
						target.addSkinFlag(GLOBAL.FLAG_LUBRICATED);
						target.addSkinFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
						changes++;
					}
					// froggy face!
					if(changes < changeLimit && !faceChanged && target.eyeType == GLOBAL.TYPE_FROG && target.earType == GLOBAL.TYPE_FROG && target.tongueType == GLOBAL.TYPE_FROG && target.faceType != GLOBAL.TYPE_FROG && rand(4) == 0)
					{
						if(target.faceTypeUnlocked(GLOBAL.TYPE_FROG))
						{
							output("\n\n");
							if(isTopClothed && target.hasAirtightSuit())
							{
								output("Detecting a change, you quickly remove your [pc.armor]... ");
								isTopClothed = false;
							}
							output("Your [pc.face] feels heavy, sweating huge globs of sticky liquid until it entirely blocks your vision. You feel your face reforming under the slime, rearranging itself to a new shape. After the changes subside, the goo oozes off your new visage and you gladly wipe it away. As your fingers pass, you feel the different surface of your face... smooth, flat and noseless. Double-checking your codex you confirm that <b>you now have a frog-like face, similar to that of a kerokoras!</b>");
							
							target.faceType = GLOBAL.TYPE_FROG;
							target.clearFaceFlags();
							target.addFaceFlag(GLOBAL.FLAG_SMOOTH);
							faceChanged = true;
							changes++;
						}
						else output("\n\n" + target.faceTypeLockedMessage());
					}
				}
				
				// Fourstuff: Body and insides
				if(changes < changeLimit && target.hasVagina())
				{
					// lose 1 physique
					if(changes < changeLimit && target.physique() > 10 && rand(4) == 0)
					{
						output("\n\nYour muscles shift and ripple beneath your [pc.skin], shrinking and losing raw strength as you watch.");
						
						target.physique(-1);
						changes++;
					}
					// gain 1 reflexes
					if(changes < changeLimit && target.reflexes() < 20 && rand(4) == 0)
					{
						output("\n\nYour muscles shift and ripple beneath your [pc.skin], becoming more compact and quicker. You feel like you could run faster, jump higher, and... lick things?");
						
						target.slowStatGain("reflexes", 1);
						changes++;
					}
					// hip rating up to max
					if(changes < changeLimit && target.hipRatingRaw < 20 && rand(3) != 0)
					{
						var hipChange:Number = 1;
						if(target.hipRatingRaw < 10) hipChange++;
						if(target.hipRatingRaw < 5) hipChange++;
						
						if(target.hipRatingUnlocked(target.hipRatingRaw + hipChange))
						{
							output("\n\nA sudden warmth invades your [pc.hips] and you feel them become slightly more expansive. You’re suddenly hit by an urge to jump as high as you can into the air, but shake it off with a smile.");
							
							target.hipRatingRaw += hipChange;
							changes++;
						}
						else output("\n\n" + target.hipRatingLockedMessage());
					}
					// butt rating up to squeezable
					if(changes < changeLimit && target.buttRatingRaw < 15 && rand(2) == 0)
					{
						var buttChange:Number = 1;
						if(target.buttRatingRaw < 10) buttChange++;
						if(target.buttRatingRaw < 5) buttChange++;
						
						if(target.buttRatingUnlocked(target.buttRatingRaw + buttChange))
						{
							output("\n\nA rush of warmth flows into your butt, and you feel a slight tingling as it increases in size. You squeeze the cheeks between your hands, sighing with pleasure as the warmth redistributes through your whole body.");
							
							target.buttRatingRaw += buttChange;
							changes++;
						}
						else output("\n\n" + target.buttRatingLockedMessage());
					}
					// vag capacity up to 4
					if(changes < changeLimit && target.vaginas[target.smallestVaginaIndex()].bonusCapacity < 100 && rand(2) == 0)
					{
						output("\n\nYou feel a sudden warm tugging in your nethers, and the thought of breeding with the largest nearby male temporarily invades your thoughts. You shake your head, but the thought has done its job getting you hot.");
						for(i = 0; i < target.vaginas.length; i++)
						{
							if(target.vaginas[i].bonusCapacity < 10) target.vaginas[i].bonusCapacity += 5;
							if(target.vaginas[i].bonusCapacity < 50) target.vaginas[i].bonusCapacity += 5;
							if(target.vaginas[i].bonusCapacity < 100) target.vaginas[i].bonusCapacity += 5;
						}
						// (also +15 lust)
						target.lust(15);
						changes++;
					}
					// pc fertility up to max
					if(changes < changeLimit && target.fertilityRaw < 2)
					{
						output("\n\nA trickling warmth works its way through your stomach, and you feel like everything in your life");
						//pcpreg
						if(target.isPregnant()) output(" is perfect");
						//not
						else output(" would be perfect if you could get knocked up");
						output(". Your codex beeps to inform you that your fertility levels have increased, giving you a higher chance to conceive from any unprotected encounters.");
						
						target.fertilityRaw += 0.01;
						changes++;
					}
					// anal capacity up to 4
					if(changes < changeLimit && target.ass.bonusCapacity < 100 && rand(3) == 0)
					{
						output("\n\nYou grasp your [pc.butt] as a shudder runs through it, feeling as if your insides have become looser than they were before. You’ll probably be able to fit larger insertions now.");
						
						if(target.ass.bonusCapacity < 10) target.ass.bonusCapacity += 5;
						if(target.ass.bonusCapacity < 50) target.ass.bonusCapacity += 5;
						if(target.ass.bonusCapacity < 100) target.ass.bonusCapacity += 5;
						changes++;
					}
				}
				
				// No changes!
				if(changes <= 0)
				{
					output("\n\n... Aside from a slight bout of dizziness, it looks like the venom didn’t have any affect on you after all...");
					if(target.race() == "kerokoras") output(" <i>It seems you are already as much of a kerokoras as you’re going to get!</i>");
				}
				// Recloth self
				else if(!target.isNude() && (!isTopClothed || !isBottomClothed))
				{
					output("\n\nAfter the getting used to your new changes, you redress and get on your way.");
				}
			}
			//Not the player!
			else
			{
				output(target.capitalA + target.short + " opens the vial and drinks the venom to no effect.");
			}
			return false;
		}
	}
}
