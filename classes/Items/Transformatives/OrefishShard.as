package classes.Items.Transformatives
{	
	import classes.GLOBAL;
	import classes.Creature;
	import classes.CockClass;
	import classes.kGAMECLASS;
	import classes.StringUtil;
	import classes.VaginaClass;
	import classes.ItemSlotClass;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.Engine.Map.InPublicSpace;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Interfaces.output;
	import classes.Util.RandomInCollection;

	public class OrefishShard extends ItemSlotClass
	{
		public function OrefishShard()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 20;
			type = GLOBAL.PILL;
			shortName = "O.F. Shard";
			longName = "Orefish Shard";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a hard tablet labeled ‘Orefish Shard’";
			tooltip = "Originally distributed as a mineral-rich pick-me-up for saurmorians situated far from Molis, this product became obsolete once advances in medicine and genetics allowed their metabolism to properly absorb the nutrients needed from alien foods. Later interest from Xenogen, however, led to a co-developed gene-therapy mod under the same name - saurmorian hierarchy having been assured of the potential profit.\n\nThe rebranded shard is an iridescent lozenge shaped like a thick fish scale - though no longer from an actual orefish - and packed with potent nanomachines that cause the consumer to gain authentic saurmorian features. It’s surprisingly heavy for such a small item.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "glitch";
			
			basePrice = 750;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if (!target is PlayerCharacter) { output("ERROR: Orefish shard should not be used by NPCs."); return false; }

			kGAMECLASS.clearMenu();
			kGAMECLASS.clearOutput();
			author("Aullama");
			
			output("You undo the sleek wrapping, its patterns forming a long and serpentine shape, until the heavy lozenge plops into your hand. The pearly surfaces feel warm against your [pc.skinFurScales], as if freshly chiselled from living rock. Slipping the tablet past your lips, you’re hit with a strong salty flavor as it touches your tongue; though just as quickly, you taste a fruity sweetness that you can’t quite name, but is quite delightful as it swiftly dissolves within your mouth.");
			output("\n\nPeaking at the inside of the wrapper, you spot something written along its length: <i>“" + RandomInCollection(["With those silver scales, it ain’t bad to stick out like a </i>saur<i> thumb!", "No </i>saur<i> loser here, if we can help it!", "We came, we </i>saur<i>, we conquered!", "The more shards you eat, the more your awesomeness </i>scales<i> with you!", "Don’t miss out on any new Xenogen products, or you’ll be </i>saur-y<i>!", "Be careful when talking about Molis, they say it’s quite the </i>saur<i> spot!", "When a Grand Matron was asked if she was thirsty for anything, she replied ‘I’ll have a martian; </i>scaled<i>, not furred.’", "Avoid using other gene mods with this product. That could result in a </i>reptile<i> dysfunction!", "Respect your matrons! Even if they’re a little </i>ore-nery<i>."]) + "”</i>");
			output("\n\nCute.");
			
			kGAMECLASS.addButton(0, "Next", useFunctionPartII, target);
			
			return true;
		}
		
		private static function useFunctionPartII(target:Creature):void
		{
			kGAMECLASS.clearMenu();
			kGAMECLASS.clearOutput();
			author("Aullama");
			
			var effectsLeft:int = 4;
			var validChanges:Array = new Array();
			var lockedChanges:Array = new Array();

			//[Head/Face]
			
			//Has scale skin type, non-saurmorian ears
			//Change ears to saurmorian
			if (rand(100) >= 25) {}
			else if (target.skinType == GLOBAL.SKIN_TYPE_SCALES && target.earType != GLOBAL.TYPE_SAURMORIAN && target.earTypeUnlocked(GLOBAL.TYPE_SAURMORIAN))
			validChanges.push(function (target:Creature):void
			{
				output("You wince as heat abruptly flashes through your ears, and hearing becomes difficult as they seem to move and vibrate with increasing intensity. Reaching a hand up to the side of your head, you struggle to find an ear - until your fingers graze over slight mounds of thickening scale. As if at your touch, the scales suddenly flare open, seeming to stop the heat and vibrations. You sigh in relief even though you feel a momentary pressure from the scales as they shift further into you.");
				output("\n\nGingerly feeling around, you find at first what appears to be a normal reptilian ear. Partially covering the small, round opening, however, is a convex [pc.skinFurScalesColor] scale; almost acting like a shield. The same can be felt on the other side of your head. <b>You’ve grown a pair of saurmorian ears!</b>");
				
				target.earType = GLOBAL.TYPE_SAURMORIAN;
				target.clearEarFlags();
				target.earLength = 0;
			});
	
			// Non-saurmorian eyes
			// change eyes to saurmorian
			// change eye color to chestnut, gold, green, hazel, jade, orange, or yellow
			// rare chance for: amethyst, aquamarine, iridescent, opal, ruby, or sapphire
			var newEyeColor:String = (rand(8) == 0 ? RandomInCollection(["amethyst", "aquamarine", "iridescent", "opal", "ruby", "sapphire"]) : RandomInCollection(["chestnut", "gold", "green", "hazel", "jade", "orange", "yellow"]));
			if (rand(100) >= 25) {}
			else if (target.eyeType != GLOBAL.TYPE_SAURMORIAN && target.eyeTypeUnlocked(GLOBAL.TYPE_SAURMORIAN))
			{
				if (target.eyeColorUnlocked(newEyeColor))
				validChanges.push(function (target:Creature):void
				{
					if (target.eyeCount() != 2) output("Your vision momentarily flickers, and you have the strange sensation of your eyes going numb. Once your sight completely goes dark, you force yourself not to panic as you try to maintain your balance. You wait for your eyes to work again, though you’re not quite prepared when - as if a switch were flipped - you can see once more. Something’s off, though... Feeling around your [pc.face], it would seem you have " + (target.eyeCount() == 1 ? "more" : "fewer") + " eyes now.\n\n");
					output("You gasp as colors seem to swap, shifting and changing with a pulsating beat. You blink several times - as if that would somehow fix everything - but that just causes each eye to see different hues. Just as you’re starting to feel quite nauseous a bright flash forces your eyes shut, the pulsating gradually receding. When you open your eyes again, everything seems back to normal - except metals seem to catch your attention more easily (or is that just your imagination?). Checking your Codex, you notice your eyes are different; vertically slitted, reptilian pupils bordered by slight - almost imperceptible - " + newEyeColor + " irises, sclera similarly colored. <b>You have saurmorian eyes!</b>");
					
					target.eyeType = GLOBAL.TYPE_SAURMORIAN;
					target.eyeColor = newEyeColor;
				});
				else lockedChanges.push(target.eyeColorLockedMessage);
			}

			//Has scale skin type, saurmorian arms, saurmorian legs, non-saurmorian face, no hair and no beard
			//change face to muzzled, saurmorian face
			//New face type: saurmorian
			//if skintype flagged thick, increase weight by 15% of base weight
			//if skintype flagged smooth, increase weight by 5% of base weight
			var faceWeight:int = 100;
			if (target.hasSkinFlag(GLOBAL.FLAG_THICK)) faceWeight += 15;
			if (target.hasSkinFlag(GLOBAL.FLAG_SMOOTH)) faceWeight += 5;
			if (rand(400) >= faceWeight) {}
			else if (target.skinType == GLOBAL.SKIN_TYPE_SCALES && target.armType == GLOBAL.TYPE_SAURMORIAN && target.legType == GLOBAL.TYPE_SAURMORIAN && target.faceType != GLOBAL.TYPE_SAURMORIAN && target.faceTypeUnlocked(GLOBAL.TYPE_SAURMORIAN) && target.faceFlagsUnlocked(GLOBAL.FLAG_MUZZLED) && !target.hasBeard() && !target.hasHair())
			validChanges.push(function (target:Creature):void
			{
				output("Your jaw snaps shut, and your face twists into a grimace as you feel your muscles cramping from ear to ear and brow to chin. As quickly as it appeared, the pain recedes barely a heartbeat later. You still feel rather tense, however - especially along your jaw.");
				output("\n\nAt first you grasp your cheeks in an attempt to soothe your strained muscles, but instead simply follow them as they shift - some expanding, others receding. All the while, bones painlessly reshape into an imposing reptilian snout. The moment these changes settle, intense heat flares up along the top of your snout and along your jaw as you feel scales across your head move and harden. The warmth feels incredibly pleasant as it soothes your sore muscles, and a steamy breath of relief hisses past your teeth.");
				output("\n\nAfter waiting for the heat to wane - and you’re almost certain nothing else is going to change - your [pc.fingers] are exploring your new face; most obvious are the metallic scales now covering your jaw and the top of your muzzle, running over your head and down your neck to join the rest of your [pc.skinFurScales]. Your Codex confirms this, and shows similar scales along the sides of your face - though less dense, and showing pebbly [pc.skinColor] hide underneath. Your smile, meanwhile, contains a mouthful of sharp teeth. <b>You have the proud visage of a saurmorian!</b>");
				
				target.faceType = GLOBAL.TYPE_SAURMORIAN;
				target.clearFaceFlags();
				target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
			});
			
			//Non-canine tongue
			//change tongue to squishy canine
			if (rand(100) >= 25) {}
			else if (target.tongueType != GLOBAL.TYPE_CANINE)
			{
				if (target.tongueTypeUnlocked(GLOBAL.TYPE_CANINE) && target.tongueFlagsUnlocked(GLOBAL.FLAG_SQUISHY))
				validChanges.push(function (target:Creature):void
				{
					output("Your tongue starts to wriggle in your mouth, feeling rather odd as it stirs on its own. Reflexively licking your lips, you’re surprised as it all but smacks your cheek instead, looking quite different than before; quite wide, round, and <i>very</i> soft. In fact, it looks rather canine. Looks like <b>you now have the gentle, dog-like tongue of a saurmorian.</b>");
					
					target.tongueType = GLOBAL.TYPE_CANINE;
					target.clearTongueFlags();
					target.addTongueFlag(GLOBAL.FLAG_SQUISHY);
				});
			}
			//Has canine tongue, not squishy
			//add squishy flag to tongue
			else if (!target.hasTongueFlag(GLOBAL.FLAG_SQUISHY) && target.tongueFlagsUnlocked(GLOBAL.FLAG_SQUISHY))
			validChanges.push(function (target:Creature):void
			{
				output("Noticing that your tongue feels softer against your teeth, you idly lick your lips for a better feel. Though looking no different, it certainly feels softer - <b>squishy, even.</b>");
				
				target.addTongueFlag(GLOBAL.FLAG_SQUISHY);
			});

			//Has hair/beard, scale skin type
			//remove hair and beard
			if (rand(100) >= 25) {}
			else if ((target.hasHair() || target.hasBeard()) && target.skinType == GLOBAL.SKIN_TYPE_SCALES && target.hairLengthUnlocked(0) && target.beardLengthUnlocked(0))
			validChanges.push(function (target:Creature):void
			{
				output("A tingling sensation spreads across your head, prickling your nerves. Checking your Codex, you watch as you seemingly reabsorb your [pc.hair] right back to where it came from. It itches terribly, but you bite a lip and wait until there’s nothing left. After a slight pause, you feel the tingling cease, and the air feels like a cool balm. Gingerly gliding your hands over your bared [pc.skinFurScales], you find no trace of your [pc.hair] left. It’s all gone.");

				target.hairLength = 0;
				target.removeBeard();
			});

			//Has more/less than 2 eyes
			//change eye count to 2
			//SAURMORIAN EYE TYPE HANDLES THIS

			//gender appearance score<49, no horns, saurmorian face
			//gain 2 - 3 silver saurmorian horns
			//change horn length to 6 - 8 inches
			var newHorns:int = 2 + rand(2);
			var newHornLength:Number = 6 + rand(2);
			if (rand(100) >= 25) {}
			else if (!target.hasHorns() && target.faceType == GLOBAL.TYPE_SAURMORIAN && target.femininity < 49)
			{
				if (!target.hornsUnlocked(newHorns)) lockedChanges.push(target.hornsLockedMessage);
				else if (!target.hornLengthUnlocked(newHornLength)) lockedChanges.push(target.hornLengthLockedMessage);
				else validChanges.push(function (target:Creature):void
				{
					if (newHorns == 2) output("You grunt as a <i>very</i> uncomfortable pressure erupts along the back of your head. Though not quite what you would call painful, but a sensation you’d still rather not be experiencing right now. In two specific spots it intensifies until - with a metallic screech - two solid, pointed horns burst forth from the back of your skull. You’re not sure if any scales have broken, but it certainly feels like it as the metal plates grind against each other to make room. You shiver as your jarred nerves settle, then raise a hand to investigate the new growths; hard, and just as metallic as your scales, the thick protrusions jut out from the back of your head before beginning to curve up and over. <b>You’ve grown two saurmorian horns!</b>");
					else output("You grunt as a <i>very</i> uncomfortable pressure erupts along the back of your head and on your nose. Though not quite what you would call painful, but a sensation you’d still rather not be experiencing right now. In three specific spots it intensifies until - with a metallic screech - two solid, pointed horns burst forth from the back of your skull and a third from atop your snout. You’re not sure if any scales have broken, but it certainly feels like it as the metal plates grind against each other to make room. You shiver as your jarred nerves settle, then raise a hand to investigate the new growths; hard, and just as metallic as your scales, the two thick protrusions from your skull jut out from behind before curving upwards. The third one proudly juts up from your nose. <b>You’ve grown three saurmorian horns!</b>");
					
					target.hornType = GLOBAL.TYPE_SAURMORIAN;
					target.hornLength = newHornLength;
					target.horns = newHorns;
				});
			}

			//Has 2 saurmorian horns, saurmorian face
			//rare chance to gain a 3rd saurmorian horn, increasing horn count to 3
			if (rand(100) >= 10) {}
			else if (target.horns == 2 && target.hornType == GLOBAL.TYPE_SAURMORIAN && target.faceType == GLOBAL.TYPE_SAURMORIAN && target.hornsUnlocked(3))
			validChanges.push(function (target:Creature):void
			{
				output("You grunt as a <i>very</i> uncomfortable but familiar pressure erupts on your nose. Though, again, not quite what you would call painful, but a sensation you’d still rather not be experiencing right now. In one specific spot it intensifies until - with a metallic screech - a solid, pointed horn bursts forth from atop your nose. Your teeth grind together as you wait for your jarred nerves to settle, and then you reach a hand up to investigate. Just like your other horns, this one is metallic, and very hard. Unlike your other two, this new one proudly juts upward from your snout. <b>You gained a third horn!</b>");
				
				target.horns = 3;
			});
			
			//Has saurmorian horns, horn length less than 24 inches
			//increase horn length by 1-3 inches, up to 24 inches
			var increasedHornLength:Number = Math.min(24, target.hornLength + 1 + rand(3));
			if (rand(100) >= 25) {}
			else if (target.hasHorns() && target.hornType == GLOBAL.TYPE_SAURMORIAN && target.hornLength < 24)
			{
				if (target.hornLengthUnlocked(increasedHornLength))
				validChanges.push(function (target:Creature):void
				{
					output("You gasp as a surprisingly pleasant warmth radiates from the base of your horns, and seems to throb in time with your heartbeat. With each relaxing pulse you feel your horns grow longer, pushing out additional length until the throbbing warmth dissipates. A quick check shows your horns seem to have gained roughly " + (increasedHornLength - target.hornLength) + " inches");
					if (increasedHornLength >= 18) output(", leaving you with a crown of very imposing horns adorning your head");
					output(".");
					
					target.hornLength = increasedHornLength;
				});
				else lockedChanges.push(target.hornLengthLockedMessage);
			}

			//Has horns, has saurmorian face, horns not silver colored
			//change horn color to silver
			//SAURMORIAN HORNS ALWAYS SILVER

			
			
			//[Skin]

			//Has non-scale skin type
			//change skin to scales, change scale color to silver
			//gain smooth or thick skin flag
			//thick if gender appearance score<49
			//smooth if feminity≥49
			var thicknessFlag:int = (target.femininity < 49 ? GLOBAL.FLAG_THICK : GLOBAL.FLAG_SMOOTH);
			if (rand(100) >= 25) {}
			else if (target.skinType != GLOBAL.SKIN_TYPE_SCALES && target.scaleColorUnlocked("silver") && target.skinFlagsUnlocked(thicknessFlag))
			validChanges.push(function (target:Creature):void
			{
				output("You suddenly feel <i>very</i> itchy all over, and you struggle to get your hands everywhere at once as you claw at yourself in a frenzy. As much as you try though, the irritation won’t go away. Groaning, you start to worry that you’ll scratch yourself raw before finding any lasting relief - until you feel a blast of heat flow over you. Your groan changes from one of misery to one of pleasure as comfort spreads like hot water. Looking down at yourself, you notice that wherever the warmth goes, in its wake is a covering of shiny, silver scales. Brushing your fingers across the metallic plates, you marvel at how " + (thicknessFlag == GLOBAL.FLAG_THICK ? "thick and heavy" : "smooth and elegant") + " they feel. <b>You’re now covered from head to " + (target.isNaga() ? "tail-tip" : "toe") + " in shiny silver scales!</b>");
				
				target.skinType = GLOBAL.SKIN_TYPE_SCALES;
				target.clearSkinFlags();
				target.addSkinFlag(thicknessFlag);
				target.scaleColor = "silver";
			});
			
			//Has scale skin type, non-silver scale color
			//change scale color to silver
			if (rand(100) >= 25) {}
			else if (target.skinType == GLOBAL.SKIN_TYPE_SCALES && target.scaleColor != "silver" && target.scaleColorUnlocked("silver"))
			validChanges.push(function (target:Creature):void
			{
				output("Your scales shimmer in the light, becoming more iridescent by the second. As you’re watching, a bright flash abruptly flares across each one, blinding you and throwing you on your [pc.ass]. After a moment spent blinking and rubbing your temples, and your sight returns, you notice <b>your scales are now a metallic silver.</b>");
				
				target.scaleColor = "silver";
			});


			//Has scale skin type
			//change skin color to
			//if gender appearance score<49: black, brown, dark blue, dark gray, dark green, or dark red
			//rare chance for: amber, azure, bronze, emerald, gold, or ruby
			//If gender appearance score≥49: black, brown, crimson, indigo, jade, lapis, light green, or light purple
			//rare chance for: hot pink, ivory, lime green, royal purple, or turquoise
			var rareDudeSkins:Array = ["amber", "azure", "bronze", "emerald", "gold", "ruby"];
			var rareChickSkins:Array = ["hot pink", "ivory", "lime green", "royal purple", "turquoise"];
			var regularDudeSkins:Array = ["black", "brown", "dark blue", "dark gray", "dark green", "dark red"];
			var regularChickSkins:Array = ["black", "brown", "crimson", "indigo", "jade", "lapis", "light green", "light purple"];
			var newSkinTone:String = RandomInCollection((target.femininity < 49 ? (rand(8) == 0 ? rareDudeSkins : regularDudeSkins) : (rand(8) == 0 ? rareChickSkins : regularChickSkins)));
			if (rand(100) >= 25) {}
			else if (target.skinType == GLOBAL.SKIN_TYPE_SCALES && rareDudeSkins.indexOf(target.skinTone) == -1 && rareChickSkins.indexOf(target.skinTone) == -1 && regularChickSkins.indexOf(target.skinTone) == -1 && regularDudeSkins.indexOf(target.skinTone) == -1)
			{
				if (target.skinToneUnlocked(newSkinTone))
				validChanges.push(function (target:Creature):void
				{
					output("You begin to feel quite warm, warmer than you remember feeling in a long while. Even more alarming is that you feel it <i>beneath</i> your scales - you’re not sure how you can tell, but that changes very little at the moment. You calm down, though, as it starts to feel rather pleasant and relaxing, almost steamy. The nice heat starts to dissipate, sadly, and while you cool off, you whip out your Codex; with the help of your trusty tool, you notice that <b>under your scales your skin has become " + newSkinTone + ".</b>");
					
					target.skinTone = newSkinTone;
				});
				else lockedChanges.push(target.skinToneLockedMessage);
			}

			//Has scale skin type, not thick/smooth
			//gain smooth or thick skin flag
			//thick if gender appearance score<49
			//smooth if feminity≥49
			if (rand(100) >= 25) {}
			else if (target.skinType == GLOBAL.SKIN_TYPE_SCALES && !target.hasSkinFlag(thicknessFlag) && target.skinFlagsUnlocked(thicknessFlag))
			validChanges.push(function (target:Creature):void
			{
				if (thicknessFlag == GLOBAL.FLAG_THICK) output("You start to feel a slight heaviness to your movements, as if weights were strapped to your limbs. It’s not until you hear your scales clank together that you notice what’s different; <b>they’ve thickened, feeling more dense than before.</b>");
				else output("Your movements start to feel lighter, as if weights were lifted from your limbs. It’s not until you glance at your scales that you notice what’s different; <b>they look smoother, less dense than before.</b> They’re certainly no less durable, though.");
				
				target.addSkinFlag(thicknessFlag);
			});

			
			
			//[Arms/Legs]

			//Has scale skin type, non-saurmorian arms
			//gain scaled, saurmorian arms
			// New arm type: saurmorian
			// if skintype flagged thick, increase weight by 25% of base weight
			// if skintype flagged smooth, increase weight by 10% of base weight
			var armWeight:int = 100;
			if (target.hasSkinFlag(GLOBAL.FLAG_THICK)) armWeight += 25;
			if (target.hasSkinFlag(GLOBAL.FLAG_SMOOTH)) armWeight += 10;
			if (rand(400) >= armWeight) {}
			else if (target.skinType == GLOBAL.SKIN_TYPE_SCALES && target.armType != GLOBAL.TYPE_SAURMORIAN && target.armTypeUnlocked(GLOBAL.TYPE_SAURMORIAN))
			validChanges.push(function (target:Creature):void
			{
				output("You grunt in surprise as your arms are locked in place. Glancing at them, you see your scales have partially fused together as they swell and thicken, and you can feel them shifting. They slide on top of your arms and hands while leaving your palms and the inside of your arms bare, revealing a more pebbly [pc.skinColor] hide. The thickened plating almost feels a touch heavier, as if growing more dense.");
				output("\n\nOnce the shifting seems to cease, you’re allowed a moment to breathe - only to grit your teeth as your fused scales virtually break apart in a shower of sparks. Though the sensation of shattering metal is jarring beyond measure, you find you can move your armored appendages just about as freely as before. Working the feeling back into your nerves, you marvel that the scales have separated seamlessly to resemble plated armor down your arms to your clawed gauntlets for hands. <b>You now have the arms of a saurmorian.</b>");
				
				target.armType = GLOBAL.TYPE_SAURMORIAN;
				target.clearArmFlags();
				target.addArmFlag(GLOBAL.FLAG_SCALED);
			});

			//Has scale skin type, non-saurmorian legs, is biped
			//gain scaled, plantigrade saurmorian legs
			// New leg type: saurmorian
			// if skintype flagged thick, increase weight by 25% of base weight
			// if skintype flagged smooth, increase weight by 10% of base weight
			var legWeight:int = 100;
			if (target.hasSkinFlag(GLOBAL.FLAG_THICK)) legWeight += 25;
			if (target.hasSkinFlag(GLOBAL.FLAG_SMOOTH)) legWeight += 10;
			if (rand(400) >= legWeight) {}
			else if (target.skinType == GLOBAL.SKIN_TYPE_SCALES && target.legType != GLOBAL.TYPE_SAURMORIAN && target.isBiped() && target.legFlagsUnlocked(GLOBAL.FLAG_SCALED) && target.legFlagsUnlocked(GLOBAL.FLAG_PLANTIGRADE) && target.legTypeUnlocked(GLOBAL.TYPE_SAURMORIAN))
			validChanges.push(function (target:Creature):void
			{
				output("You let out a yelp as you fall face first to the ground, legs held still and unable to move as something encases them. That something happens to be your own scales, seeming to fuse together as they grow larger and thicker over your limbs. They start to shift, migrating onto your outer thighs to reveal hints of [pc.skinColor], pebbly hide.");
				if (target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output(" Your bones - as if made of liquid - reshape into a more human structure within their cocoons.");
				output(" The thickened plating almost feels a touch heavier, as if growing more dense; especially as you’re completely covered from the knees down.");
				output("\n\nAs things seem to settle, you start to worry that your legs may be stuck in the metal scales indefinitely. When you instinctively clench, you’re stunned as the merged plating breaks apart in a hail of sparks.Though the sensation of shattering metal is jarring beyond measure, you find you can move your armored appendages just about as freely as before. Working the feeling back into your nerves, you marvel that the scales have separated seamlessly to resemble plated armor from your hips to your clawed feet, with four toes each. <b>You now have the legs of a saurmorian.</b>");
				
				target.legType = GLOBAL.TYPE_SAURMORIAN;
				target.clearLegFlags();
				target.addLegFlag(GLOBAL.FLAG_SCALED);
				target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			});

			//Has more/less than 2 legs
			//change leg count to 2
			//if naga/drider, change leg type to human
			//change genital location to waist
			if (rand(100) >= 25) {}
			else if (!target.isBiped() && target.legCountUnlocked(2) && target.genitalSpotUnlocked(0) && ((!target.isNaga() && !target.isDrider()) || target.legTypeUnlocked(GLOBAL.TYPE_HUMAN)))
			validChanges.push(function (target:Creature):void
			{
				output("You start to wobble unsteadily as your [pc.legOrLegs] " + (target.legCount > 1 ? "weaken" : "weakens") + ", feeling more like rubber with every second. A numb, prickly sensation descends past your waist until you can no longer support yourself, and your [pc.legOrLegsNoun] give out.");
				if (target.isTaur())
				{
					target.legCount = 2;		
					output(" Tumbling onto your side, you grit your teeth to the feeling of your lower body changing - bones, muscles and more shifting dramatically. Though not painful, it’s still intense as your rear legs are absorbed into your body, their extra mass seeming to disappear.\n\nOnce there’s no trace left of your tauric hindquarters, and your remaining legs align with your [pc.hips], the numbness recedes. You flex your muscles back into shape, though there’s technically fewer now that <b>you’re walking on two legs.</b>");
				}
				else
				{
					if (target.isDrider())
					{
						output(" Tumbling onto your side, you grit your teeth to the feeling of your lower body changing - muscles and more shifting dramatically. Though not painful, it’s still intense as your legs and lower body fuse, then split into two vague appendages, their extra mass seeming to disappear. They quickly grow more defined and distinguished.\n\nOnce the changes seem to settle, and your two new limbs have completely formed, the numbness recedes. You flex your muscles back into shape, though there’s technically fewer now that <b>you’re walking on two human legs.</b>");
					}
					else
					{
						output(" Just barely catching yourself from colliding with the ground, you watch as your [pc.legNoun] painlessly splits, shifting into two separate limbs that gain more definition every second.\n\nYou flex them experimentally once the changes seem to settle, and the numbness starts to fade. You take a moment to admire the sight; <b>your lower body has become a pair of human legs.</b>");
					}
					target.legType = GLOBAL.TYPE_HUMAN;
					target.clearLegFlags();
					target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
				}
				
				target.legCount = 2;
				if (target.genitalSpot != 0)
				{
					target.genitalSpot = 0;
					output("\n\nYou also notice your [pc.crotch], sitting between your legs.");
				}
				if (target.hasTail()) output("\n\nSomehow, though, you’ve managed to keep your [pc.tails], sitting just above your [pc.ass].");
			});
			
			

			//[Body/Build]

			//Gender appearance score<49, Tone<75
			//increase tone by 1 - 3, up to 75
			var newTone:int = Math.min(target.tone + 1 + rand(3), 75);
			if (rand(100) >= 25) {}
			else if (target.femininity < 49 && target.tone < 75)
			{
				if (target.toneUnlocked(newTone))
				validChanges.push(function (target:Creature):void
				{
					output("You gasp as a shock sends your hand spasming, then bolts up your arm in a hot arc. Splitting across the rest of your body, your entire form grows tense as every muscle seems to clench. Though not painful like a cramp, it’s still an overwhelming sensation as you feel sparks flow through and stimulate every bit of flesh.\n\nYou groan in relief once you feel the electric shocks start to recede, letting your sore muscles relax - though the occasional jolt sends quivers down your spine. Looking yourself over, you run your [pc.fingers] over muscles that feel more firm, more defined, than they had before.");
					
					target.tone = newTone;
				});
				else lockedChanges.push(target.toneLockedMessage);
			}

			//Gender appearance score≥49, Tone>40
			//decrease tone by 1 - 3, down to 40
			var newToneF:int = Math.max(40, target.tone - 1 - rand(3));
			if (rand(100) >= 25) {}
			else if (target.femininity >= 49 && target.tone > 40)
			{
				if (target.toneUnlocked(newToneF))
				validChanges.push(function (target:Creature):void
				{
					output("Pleasant heat flares across your muscles, pulling a groan out of you. Unable to help yourself, you wrap your arms around your middle as you revel in the delightful warmth and rub wherever your hands can reach. One could lose themselves to this kind of sensation! You notice, however, that something feels different while you massage your sides.\n\nLooking down at yourself, your eyes confirm what your fingers felt; your body feels softer, with more give. Taking it all in, it seems you’ve become less toned, your muscles less defined.");
					
					target.tone = newToneF;
				});
				else lockedChanges.push(target.toneLockedMessage);
			}
			
			// Gender appearance score<49, Thickness<75
			// increase thickness by 1 - 3, up to 75
			var newThicc:int = Math.min(target.thickness + 1 + rand(3), 75);
			if (rand(100) >= 25) {}
			else if (target.femininity < 49 && target.thickness < 75)
			{
				if (target.thicknessUnlocked(newThicc))
				validChanges.push(function (target:Creature):void
				{
					output("You almost stumble as your movements suddenly have a little more weight to them, as if you’ve put on a few pounds - you don’t necessarily feel slower, though. Looking yourself over, you note that you seem a touch wider; your frame has broadened.");
					
					target.thickness = newThicc;
				});
				else lockedChanges.push(target.thicknessLockedMessage);
			}

			//Gender appearance score≥49, Thickness>20
			//decrease thickness by 1 - 3, down to 20
			var newThiccF:int = Math.max(20, target.thickness - 1 - rand(3));
			if (rand(100) >= 25) {}
			else if (target.femininity >= 49 && target.thickness > 20)
			{
				if (target.thicknessUnlocked(newThiccF))
				validChanges.push(function (target:Creature):void
				{
					output("You let out a sigh - and abruptly feel lighter than you did a moment ago. Looking down at yourself, you’re surprised to see you’ve slimmed down; your frame has become slightly thinner.");
					
					target.thickness = newThiccF;
				});
				else lockedChanges.push(target.thicknessLockedMessage);
			}

			//Base hip size rating<4
			//Increase hip size by 1, up to 4
			if (rand(100) >= 25) {}
			else if (target.hipRatingRaw < 4 && target.hipRatingUnlocked(target.hipRating()+1))
			validChanges.push(function (target:Creature):void
			{
				output("You trip as your gait unexpectedly shifts, and you’re sent tumbling to the ground. Your [pc.hips] barely feel the impact. Instead, they’re busy expanding with additional padding, [pc.skinFurScales] prickling with new nerves. Finally managing to hobble back onto your [pc.footOrFeet] once your flaring nerves settle, you unconsciously adjust your posture for your widened hips; they’re shown off more than ever thanks to your new stride.");
				
				target.hipRating(1);
			});

			//Base butt size rating<4
			//increase butt size by 1, up to 4
			if (rand(100) >= 25) {}
			else if (target.buttRatingRaw < 4 && target.buttRatingUnlocked(target.buttRating()+1))
			validChanges.push(function (target:Creature):void
			{
				output("You let out a yelp as your rear is dealt a sudden, stinging <i>smack</i> by some sadistic hand. Twisting around, you don’t see anyone - or any<i>thing</i> - copping a feel behind you");
				if (InPublicSpace(target)) output(", though several sets of curious eyes passing by look your way");
				output(". What you do see, however, is your [pc.ass] expanding with every heartbeat as the tingling heat from the impact spreads");
				if (!target.isAssExposed()) output(", straining your [pc.assCover]");
				output(". It quickly stops, though, and you gently run a hand over the sore [pc.skinFurScales]. As you soothe the tenderness, you note you’re left with a rounder, fuller rump.");
				
				target.buttRating(1);
			});
			
			//Base hip size rating>4
			//decrease hip size by 1 - 3, down to 4
			var newHip:int = Math.max(4, target.hipRatingRaw - 1 - rand(3));
			if (rand(100) >= 25) {}
			else if (target.hipRatingRaw > 4)
			{
				if (target.hipRatingUnlocked(target.hipRating()+newHip-target.hipRatingRaw))
				validChanges.push(function (target:Creature):void
				{
					output("You’re surprised to find your gait has changed; your [pc.hips] don’t have the sway they used to. Upon closer inspection, they seem to have narrowed, looking a touch slimmer than before.");
					
					target.hipRating(newHip, true);
				});
				else lockedChanges.push(target.hipRatingLockedMessage);
			}

			//Base butt size rating>4
			//decrease butt size by 1 - 3, down to 4
			var newButt:int = Math.max(4, target.buttRatingRaw - 1 - rand(3));
			if (rand(100) >= 25) {}
			else if (target.buttRatingRaw > 4)
			{
				if (target.buttRatingUnlocked(target.buttRating()+newButt-target.buttRatingRaw))
				validChanges.push(function (target:Creature):void
				{
					output("You grit your teeth as a sudden pressure tightly grips your butt, and your [pc.hands] quickly clutch onto the aching cheeks. Under your [pc.fingers] you can feel your rear throb with every heartbeat, and every moment seems to leave you with just a little less in the trunk. Before you can begin to worry about how much will be left, the throbbing stops, and the only pressure is from your own clenching digits.\n\nGlancing back, you take in the sight of your slighter, smaller ass.");
					
					target.buttRating(newButt, true);
				});
				else lockedChanges.push(target.buttRatingLockedMessage);
			}

			//Gender appearance score<49, height<7 feet
			//OR Gender appearance score≥49, height<6 feet
			//increase height by 2 - 4 inches
			var newTall:int = Math.min((target.femininity < 49 ? 7*12 : 6*12), target.tallness + 2 + rand(3));
			if (rand(100) >= 25) {}
			else if (target.tallness < (target.femininity < 49 ? 7*12 : 6*12))
			{
				if (target.tallnessUnlocked(newTall))
				validChanges.push(function (target:Creature):void
				{
					output("You wobble unsteadily as your balance seems to shift, only barely catching yourself before tipping over. Standing upright, you notice that the ground seems slightly farther away; or you’re slightly taller? Checking your Codex, it seems you’ve gained " + (newTall - target.tallness) + " inches!");
					
					target.tallness = newTall;
				});
				else lockedChanges.push(target.tallnessLockedMessage);
			}

			//Has vagina, Genital elasticity<5
			//increase elasticity by 1 - 2
			var newElas:int = Math.min(5, target.elasticity + 1 + rand(2));
			if (rand(100) >= 25) {}
			else if (target.hasVagina() && target.elasticity < 5)
			validChanges.push(function (target:Creature):void
			{
				output("You coo as a pleasant chill begins to emanate from your " + (target.hasVaginas() ? "wombs" : "womb") + ", brisk tendrils gently stroking and exploring your inner walls. It’s actually rather refreshing, even as more feelers spread throughout [pc.eachVagina]. Once they’ve finished probing and testing you, they start to recede, until the cold itself is gone. The warmth it leaves behind has you feeling rather... supple. Somehow, you’re certain your [pc.vaginas] can take larger insertions with less permanent stretching.");
				
				target.elasticity = newElas;
			});

			
			
			//[Genitals]
			
			//Has non-saurmorian vagina
			//change vagina to ribbed, half pumped, saurmorian vagina
			//vagina stays fully pumped if already fully pumped
			var tfCuntIdx:int = target.vaginas.indexOf(RandomInCollection(target.vaginas.filter(function (v:VaginaClass, index:int, arr:Array):Boolean { return v.type != GLOBAL.TYPE_SAURMORIAN })));
			if (rand(100) >= 25) {}
			else if (tfCuntIdx >= 0)
			{
				if (target.vaginaTypeUnlocked(tfCockIdx, GLOBAL.TYPE_SAURMORIAN))
				validChanges.push(function (target:Creature):void
				{
					output("You yelp as a sudden, powerful orgasm thunders through your [pc.vaginaNounSimple " + tfCuntIdx + "], barely catching yourself as your hips go wild");
					if (target.vaginas[tfCuntIdx].wetness() > 5) output(", flinging droplets of [pc.girlCum]" + (!target.isCrotchExposed() ? " through your [pc.crotchCovers]" : ""));
					output(".");
					if (target.isBiped()) output(" Your hands dart between your legs, as if to calm your frothing loins, but you only succeed in getting all the more hot and bothered as your fingers slide against your flushed cunt.");
					output(" The lips of your quim feel particularly inflamed, swollen and full as more blood flows to your crotch.");
					output("\n\nIt only grows more intense, as each pulse of ecstasy is followed by what feels like molten claws squeezing and massaging your insides. You groan, sides lurching in rhythm while you grind your thighs together. You don’t fully know what’s happening, but you can’t take it anymore; with a mind of its own, your hand slips");
					if (!target.isCrotchExposed()) output(" under your [pc.crotchCovers], and");
					output(" into your pussy, lips parting like a juicy veil. Your other hand covers your mouth, stifling a cry of joy to the feeling of your [pc.hips] thrusting against your hand, grinding your palm into your [pc.clit].");
					output("\n\nIt’s not until you’re left panting, cooling down from the breathtaking ordeal, that you dimly start to realize something is off.\n\nTaking a closer look, you notice your labia are still quite plump, even while your arousal recedes; they also look incredibly glossy and smooth. Upon stirring your fingers within your honeypot, you feel odd bulges lining it within - your cunt is ribbed!\n\nChecking in with your Codex confirms it; <b>you’ve got a saurmorian vagina!</b>");
					
					var puffFlag:int = 0;
					if(target.vaginas[tfCuntIdx].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) puffFlag = 1;
					if(target.vaginas[tfCuntIdx].hasFlag(GLOBAL.FLAG_PUMPED)) puffFlag = 2;
					if(target.vaginas[tfCuntIdx].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) puffFlag = 3;
					target.shiftVagina(tfCuntIdx, GLOBAL.TYPE_SAURMORIAN);
					if(puffFlag == 1) target.vaginas[tfCuntIdx].addFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
					if(puffFlag == 2) target.vaginas[tfCuntIdx].addFlag(GLOBAL.FLAG_PUMPED);
					if(puffFlag == 3) target.vaginas[tfCuntIdx].addFlag(GLOBAL.FLAG_HYPER_PUMPED);
				});
				else lockedChanges.push(target.vaginaTypeLockedMessage);
			}

			//Has vagina, base looseness>1
			//decrease looseness by .1 - .3
			var looseCuntIdx:int = target.vaginas.indexOf(RandomInCollection(target.vaginas.filter(function (v:VaginaClass, index:int, arr:Array):Boolean { return v.loosenessRaw > 1 })));
			if (rand(100) >= 25) {}
			else if (looseCuntIdx >= 0)
			{
				var newCuntLsns:int = target.vaginas[looseCuntIdx].loosenessRaw - ((1.0 + rand(3))/10);
				if (target.loosenessUnlocked(looseCuntIdx, target.looseness(looseCuntIdx) - target.vaginas[looseCuntIdx].loosenessRaw + newCuntLsns))
				validChanges.push(function (target:Creature):void
				{
					output("You let out a gasp as your [pc.vagina " + looseCuntIdx + "] abruptly clamps tight, as if trying to cling to something. Not painful like a normal cramp, it’s still intense as your muscles clench tight. There’s a sudden pinch as your vaginal walls are wrung taut, drawing a hiss past your lips. Your hands roam over your loins in an attempt to soothe your tense muscles.\n\nIt doesn’t last long, though you can’t help but sigh in relief once you feel your [pc.vagina " + looseCuntIdx + "] start to relax. Something still feels different, though.\n\nTaking a moment to probe and test your nethers, noting that your pussy certainly feels more... <i>tight</i>.");

					target.vaginas[looseCuntIdx].looseness(newCuntLsns, true);
				});
				else lockedChanges.push(target.loosenessLockedMessage);
			}

			//Has vagina, incubation speed modifier<500%
			//increase incubation speed modifier by 20 - 50%
			var newSpeed:Number = target.pregnancyIncubationBonusMotherRaw + ((2.0 + rand(4))/10);
			if (rand(100) >= 25) {}
			else if (target.hasVagina() && target.pregnancyIncubationBonusMotherRaw < 5)
			validChanges.push(function (target:Creature):void
			{
				output("There’s a brief spark of heat in your [pc.wombs] that almost gives you pause, but it swiftly shifts to a comforting warmth - not unlike the feeling of being hugged tight by a lover, idly admiring and praising your fertility. The thought brings a smile to your face, and you place your hands on your middle. After a few moments, you snap out of your daydreaming, but the warmth stays for a while longer.\n\nA notification from your Codex tells you that your pregnancies will be a bit faster from now on.");
				
				target.pregnancyIncubationBonusMotherRaw = Math.min(newSpeed, 5);
			});
			
			//Vagina count >1
			// remove (secondary?) vagina
			// add capacity to first vagina
			//CANCELED
			
			//Has non-saurmorian penis
			// change penis to blunt, ribbed, sheathed saurmorian penis
			// if non-saurmorian penis count >1, change one penis
			// if base penis length<5 inches, change to 8 inches
			// if base penis width<1 inch, change to 1.5 inches.
			// ^ I'm changing this to a min cThicknessRatioRaw so I don't cry -lighterfluid
			// random chance between black, dark blue, dark red, or purple
			var saurCockIdx:int = target.findFirstOfcType(GLOBAL.TYPE_SAURMORIAN);
			//If you know a better way to do this, please let lighterfluid know. Thanks.
			var tfCockIdx:int = target.cocks.indexOf(RandomInCollection(target.cocks.filter(function (c:CockClass, index:int, arr:Array):Boolean { return c.cType != GLOBAL.TYPE_SAURMORIAN })));
			var newColor:String = (saurCockIdx >= 0 ? target.cocks[saurCockIdx].cockColor : RandomInCollection(["black", "dark blue", "dark red", "purple"]));
			if (rand(100) >= 25) {}
			else if (tfCockIdx >= 0)
			{
				if (!target.cockTypeUnlocked(tfCockIdx, GLOBAL.TYPE_SAURMORIAN)) lockedChanges.push(target.cockTypeLockedMessage);
				else if (target.cocks[tfCockIdx].cLength < 5 && !target.cockLengthUnlocked(tfCockIdx, 8)) lockedChanges.push(target.cockLengthLockedMessage);
				else if (target.cocks[tfCockIdx].cThicknessRatioRaw < 0.833 && !target.cockThicknessUnlocked(tfCockIdx, 1.125*8/6)) lockedChanges.push(target.cockThicknessLockedMessage);
				else if (!target.cockFlagsUnlocked(tfCockIdx, GLOBAL.FLAG_BLUNT) && !target.cockFlagsUnlocked(tfCockIdx, GLOBAL.FLAG_RIBBED) && !target.cockFlagsUnlocked(tfCockIdx, GLOBAL.FLAG_SHEATHED)) lockedChanges.push(target.cockFlagsLockedMessage);
				else validChanges.push(function (target:Creature):void
				{
					output("You’re surprised when you feel " + (target.isCrotchExposed() ? "a draft caress [pc.oneCock] with a tender touch" : "[pc.oneCock] chafe against your [pc.crotchCoverUnder]") + ". The sensation has your cock surging to full size in several heartbeats, engorged and feeling more sensitive than your pleasure shocked mind can remember. Unable to resist, your breath hitches and your [pc.hips] quiver as you tightly grip onto the hot phallus, its length practically bulging between your fingers.");
					if (!target.hasCockFlag(tfCockIdx, GLOBAL.FLAG_SHEATHED)) output("\n\nThe flesh around the base of your shaft begins to swell, creating a bloated ring. It shifts inward while bunching closely to your prick, [pc.skin] flushed and hot as it forms what can only be a thick sheath. You hardly need to touch to feel how sensitive it is, but you do anyways, letting out a pleased groan as you probe the musky folds.");
					output("\n\nYour cock lurches in your hand, pulling free of your grasp and disappearing into its sheath - though not entirely unpleasant, the sense of fullness has you gritting your teeth - and searing rings of heat bind it from base to tip; you can almost feel them enlarge, bulging against your insides with extra mass. You’re unsure how to handle the alien feeling of being full of your own hard meat, only able to grunt while your hips lurch and twitch from the stimulation.");
					output("\n\nJust as your gut clenches, and you worry you’ll cum within your own sheath, your cock bursts forth vigorously");
					if (kGAMECLASS.silly) output(", as if it had just come up with a new recipe");
					output("; slipping right back into your grip, your phallus’ exodus is more than enough to send you into a powerful climax. Bolts of pleasure run along your nerves with each contraction,");
					if (target.cumQ() >= 3000) output(" rope after rope of");
					output(" [pc.cumNoun] making a mess of your hands and the floor beneath you as you sloppily stroke away.");
					output("\n\nOnce you’re able to uncross your eyes, you look down at your prick; Thick, fattened ridges ring its " + newColor + " length - giving it a ribbed appearance - from the sheath to just under the blunt, almost equine head. And just like that, <b>your cock has become that of a saurmorian!</b>");

					target.shiftCock(tfCockIdx, GLOBAL.TYPE_SAURMORIAN);
					target.cocks[tfCockIdx].cockColor = newColor;
					//pc orgasms, and becomes cum soaked
					target.orgasm();
					target.applyCumSoaked();
				});
			}

			//Has penis, base length<10 inches
			//increase length by .2 - .5 inches
			var shortCockIdx:int = target.cocks.indexOf(RandomInCollection(target.cocks.filter(function (c:CockClass, index:int, arr:Array):Boolean { return c.cLengthRaw < 10 })));
			if (rand(100) >= 25) {}
			else if (shortCockIdx >= 0)
			{
				var shortCockLen:Number = target.cocks[shortCockIdx].cLengthRaw + (target.hasPerk("Hung") ? 0.5 : (2.0 + rand(4))/10);
				if (target.cockLengthUnlocked(shortCockIdx, shortCockLen))
				validChanges.push(function (target:Creature):void
				{
					output("You groan as you feel a pulsing tide of heat flow onto your [pc.cockNounSimple " + shortCockIdx + "] before it swiftly recedes, gently but insistently tugging on your cock. Once the feeling is gone, you quickly check what happened with your trusty Codex - and it seems your prick has gained a little bit of length!");
					
					target.cocks[shortCockIdx].cLength(shortCockLen, true);
				});
				else lockedChanges.push(target.cockLengthLockedMessage);
			}
			
			//Has penis, base length>12 inches
			//decrease length by .2 - .5 inches
			var longCockIdx:int = target.cocks.indexOf(RandomInCollection(target.cocks.filter(function (c:CockClass, index:int, arr:Array):Boolean { return c.cLengthRaw > 12 })));
			if (rand(100) >= 25) {}
			else if (longCockIdx >= 0)
			{
				var longCockLen:Number = target.cocks[longCockIdx].cLengthRaw - (target.hasPerk("Mini") ? 0.5 : (2.0 + rand(4))/10);
				if (target.cockLengthUnlocked(longCockIdx, longCockLen))
				validChanges.push(function (target:Creature):void
				{
					output("You gasp as an icy chill grips your shaft, sending shivers up your spine. It’s accompanied by a slight pressure, as if something cold were being shoved against your crotch. The feeling doesn’t last long, however, and is gone before it can get uncomfortable. Taking a quick peek, you’d swear your [pc.cockNounSimple " + longCockIdx + "] is a little shorter.");
					
					target.cocks[longCockIdx].cLength(longCockLen, true);
				});
				else lockedChanges.push(target.cockLengthLockedMessage);
			}
			
			//Has penis, base width<3 inches (changed to 1.8 thickness ratio)
			//increase width by .2 - .5 inches (changed to .1 - .3 increase to thicc)
			var thinCockIdx:int = target.cocks.indexOf(RandomInCollection(target.cocks.filter(function (c:CockClass, index:int, arr:Array):Boolean { return c.cThicknessRatioRaw < 1.8 })));
			if (rand(100) >= 25) {}
			else if (thinCockIdx >= 0)
			{
				var thinCockTh:Number = target.cocks[thinCockIdx].cThicknessRatioRaw + (target.hasPerk("Hung") ? 0.3 : (1.0 + rand(3))/10);
				if (target.cockThicknessUnlocked(thinCockIdx, target.cocks[thinCockIdx].cLength*thinCockTh))
				validChanges.push(function (target:Creature):void
				{
					output("You groan as you feel a pulsing tide of heat flow onto your [pc.cockNounSimple " + thinCockIdx + "] before it swiftly recedes, gently but insistently tugging on your cock. Once the feeling is gone, you quickly check what happened with your trusty Codex - and it seems your prick has gained a little extra girth!");
					
					target.cocks[thinCockIdx].cThicknessRatio(thinCockTh, true);
				});
				else lockedChanges.push(target.cockThicknessLockedMessage);
			}

			//Has penis, base width>4 inches (now 2.4, see above)
			//decrease width by .2 - .5 inches (now .1-.3, see above)
			var thicCockIdx:int = target.cocks.indexOf(RandomInCollection(target.cocks.filter(function (c:CockClass, index:int, arr:Array):Boolean { return c.cThicknessRatioRaw > 2.4 })));
			if (rand(100) >= 25) {}
			else if (thicCockIdx >= 0)
			{
				var thicCockTh:Number = target.cocks[thicCockIdx].cThicknessRatioRaw - (target.hasPerk("Mini") ? 0.3 : (1.0 + rand(3))/10);
				if (target.cockThicknessUnlocked(thicCockIdx, target.cocks[thicCockIdx].cLength*thicCockTh))
				validChanges.push(function (target:Creature):void
				{
					output("You gasp as an icy chill grips your shaft, sending shivers up your spine. It’s accompanied by a slight pressure, as if something cold were being shoved against your crotch. The feeling doesn’t last long, however, and is gone before it can get uncomfortable. Taking a quick peek, you’d swear your [pc.cockNounSimple " + thicCockIdx + "] is a little slimmer.");
					
					target.cocks[thicCockIdx].cThicknessRatio(thicCockTh, true);
				});
				else lockedChanges.(target.cockThicknessLockedMessage);
			}

			//Multiple hasCock requirements
			if (target.hasCock())
			{
				//Has penis, refractory rate<5
				//increase refractory rate by .2 - .5
				var newRefrac:Number = target.refractoryRate + ((2.0 + rand(4))/10);
				if (rand(100) >= 25) {}
				else if (target.refractoryRate < 5)
				validChanges.push(function (target:Creature):void
				{
					output("You let out a grunt as [pc.eachCock] surges to life");
					if (target.isCrotchExposed()) output(" and strains against your [pc.crotchCovers]");
					else output(" and smacks against your [pc.belly]" + (target.biggestCockLength() >= target.tallness/2 + 6 ? " and face" : (target.biggestCockLength() >= target.tallness/2 - 6 ? " and [pc.chest]" : "")) + ", hot against your [pc.skinFurScalesNoun]");
					output(" while blood pools to your nethers, your heartbeat pounding in your ears. You even feel a throbbing in your [pc.balls]. You can’t help but find the idea of getting off right now quite appealing, though that’s not really what you need, you think, as your mind shifts towards more base instincts.\n\nYou can’t shake the thought of emptying your " + (target.balls > 0 ? "[pc.balls]" : "load") + " as hard as you can - preferably into or on someone. Void, you could really use a fuck, and perhaps a quick fuck after <i>that</i>.\n\nA quick notification from your Codex alerts you to changes to your refractory rate. Looks like you’ll be ready for round two more often...");
					
					target.refractoryRate = newRefrac;
				});

				//Has penis, base virility/cum quality<5
				//increase virility/cum quality by .2 - .5
				var newVir:Number = target.cumQualityRaw + ((2.0 + rand(4))/10);
				if (rand(100) >= 25) {}
				else if (target.cumQualityRaw < 5)
				validChanges.push(function (target:Creature):void
				{
					output("Your breath hitches as incredible heat engulfs your [pc.balls], virtually boiling the cum within. Though not painful, surprisingly, it still takes you a moment to remember to breathe. Once your lungs are heaving in a steady rhythm, your [pc.balls] begin to vibrate, as if charged with a powerful energy.\n\nThe end of it brings a deep sigh of relief as your loins cool down - though something is certainly different, what with your [pc.balls] feeling a little heavier, a touch more dense.\n\nA chirp from your Codex clues you in; your [pc.cum] has become more potent!");
					
					target.cumQualityRaw = newVir;
				});
			}

			//Same as above, but with balls
			if (target.balls > 0)
			{
				//Has testicles, base size<8
				//increase testicle size by .2 - .5
				var biggerBallSize:Number = target.ballSizeRaw + (target.hasPerk("Bulgy") ? 0.5 : ((2.0 + rand(4))/10));
				if (rand(100) >= 25) {}
				else if (target.ballSizeRaw < 8)
				validChanges.push(function (target:Creature):void
				{
					output("You let slip a moan as a steamy heat pools into your crotch, and you feel your [pc.balls] swell, pressing into your [pc.thighs] with extra mass.");
					if (target.isBiped()) output(" Sliding a hand down, you rub and caress your [pc.sack], [pc.skinFurScalesNoun] hot to the touch.");
					output(" It doesn’t last long, but certainly leaves a little extra sway between your legs; your [pc.balls] " + (target.balls > 1 ? "have" : "has") + " grown.");
					
					target.ballSize(biggerBallSize, true);
				});

				//Has testicles, base size>14
				//decrease testicle size by .2 - .5
				var smolerBallSize:Number = target.ballSizeRaw - ((2.0 + rand(4))/10);
				if (rand(100) >= 25) {}
				else if (target.ballSizeRaw > 14)
				validChanges.push(function (target:Creature):void
				{
					output("There’s a sudden pressure on your [pc.balls], as what feels like several soft hands begin to squeeze and grope you. It... feels good, though more relaxing than arousing. You let out a sigh as you spend a moment basking in the sensation.\n\nYour middle clenches, the familiar feeling of climax welling up as your [pc.sack] pulls taut against you. It’s not a normal orgasm, however, not with your [pc.cum] practically forced out, spurting and dribbling from your half-hard [pc.cockNounSimple], and you grit your teeth with each contraction.It doesn’t last forever, thankfully. Once you feel your [pc.balls] calm down, you’re quick to inspect what that was all about; your [pc.balls] " + (target.balls > 1 ? "have" : "has") + " gotten a bit smaller!");
					
					target.ballSize(smolerBallSize, true);
				});
			}
			
			
			
			// [Tail]

			//Has more than 1 tail
			//remove 1 tail
			if (rand(100) >= 25) {}
			else if (target.hasTails() && target.tailCountUnlocked(target.tailCount-1))
			validChanges.push(function (target:Creature):void
			{
				output("Your attention is brought to your rear, where your [pc.tails] are feeling rather odd. Limp, heavy and hard to move, it’s especially alarming when one goes numb - you grunt with the effort, but you can’t even move it!\n\nBefore your very eyes, you watch as the paralyzed limb begins to wither, shriveling as it loses mass while being absorbed into your body. The whole ordeal has you gritting your teeth nervously.\n\nSoon, though, it’s completely gone, and a wiggle of your [pc.ass] brings the remaining [pc.tails] back to life. Just... one fewer.");
				
				target.tailCount -= 1;
			});

			//Has no tail
			//gain 1 lizan tail
			if (rand(100) >= 25) {}
			else if (!target.hasTail() && target.tailCountUnlocked(1) && target.tailTypeUnlocked(GLOBAL.TYPE_LIZAN))
			validChanges.push(function (target:Creature):void
			{
				output("You grunt in irritation, feeling a slight pressure just above your [pc.ass]. Twisting around, you notice an ungainly lump in the same spot; as the pressure grows so does the lump, quickly becoming longer, and thicker.\n\nWith the creak of bones straining and expanding from your spine, a distinctive tail gradually takes shape, [pc.skinFurScalesColor] scales sprouting along its length from wide base to tapered tip. It itches like hell, the new limb twitching as fresh nerves flare and spark, but you manage to keep your hands to your sides. Thankfully it doesn’t last forever, and you let out a happy sigh as things settle down.\n\nEyeing your new appendage as you sway it around playfully, you admire its sleek look; from the tapered appearance, and powerful muscles under smooth scales, you’re left with a nice reptilian tail.");
				
				target.tailCount = 1;
				target.tailType = GLOBAL.TYPE_LIZAN;
				target.clearTailFlags();
			});

			//Has scale skin type
			//Has 1 tail (non-genitail)
			//change to a long, scaled, thick/smooth, tapered, saurmorian tail
			//if gender appearance score<49, thick
			//if gender appearance score≥49, smooth
			//if height<60 inches, rare chance for short instead of long
			var lengthFlag:int = (rand(8) == 0 && target.tallness < 60 ? GLOBAL.FLAG_SHORT : GLOBAL.FLAG_LONG);
			var thickFlag:int = (target.femininity < 49 ? GLOBAL.FLAG_THICK : GLOBAL.FLAG_SMOOTH);
			if (rand(100) >= 25) {}
			else if (target.skinType == GLOBAL.SKIN_TYPE_SCALES && !target.hasTailGenital() && target.tailCount == 1 && target.tailType != GLOBAL.TYPE_SAURMORIAN && target.tailTypeUnlocked(GLOBAL.TYPE_SAURMORIAN) && target.tailFlagsUnlocked(lengthFlag) && target.tailFlagsUnlocked(GLOBAL.FLAG_TAPERED) && target.tailFlagsUnlocked(GLOBAL.FLAG_SCALED) && target.tailFlagsUnlocked(thickFlag))
			validChanges.push(function (target:Creature):void
			{
				output("Your breath hitches as a hard material suddenly encompasses your tail, weighing the appendage down and locking it in place; the sensation is rather unnerving, made all the worse by the sounds of metallic scraping. Peering behind you, you take in the odd sight of what looks like your tail completely cocooned in dense, metal scales - though it appears longer, and rather bloated...\n\nYou try to move the ungainly thing, but only manage to grunt with the effort. Those scales are linked together with a powerful bond - they’re not budging.\n\nThe feeling of liquid fire pooling into your tail catches you off guard, your thoughts immediately shifting to finding relief as your hands scrabble for the solid limb behind you");
				if (target.isTaur() || target.isDrider()) output(", made all the more difficult by your animalistic body");
				output(". When that fails, you’re left shifting from one [pc.foot] to another in discomfort as the heat intensifies. The idea to look for a body of water comes to you; maybe then-\n\nYou yelp as the sensation in your tail shifts to immense pressure, and your muscles clench <i>hard</i> - hard enough to shatter the cocoon of scales, freeing you with a torrent of sparks and broken metal. It takes a moment for your rattled nerves to calm, but you quickly start to feel the (comparatively) cool air against your rear once more. Twisting around, you notice some definite changes.");

				if (lengthFlag == GLOBAL.FLAG_LONG) output("\n\nWhat sways behind you looks much less unwieldy now that it’s free of confinement; a long and " + (thickFlag == GLOBAL.FLAG_THICK ? "wide" : "lithe") + " reptilian tail, covered in [pc.skinFurScalesColor] scales from base to tapered tip - as hard and metallic as before, but no longer melded together. Instead, they glide smoothly and harmlessly along each other with each movement. The soft underside of your tail, however, reveals a smooth, pebbly hide. <b>Your tail is now a saurmorian tail,</b> you muse while idly swaying the armored appendage to and fro.");
				else output("\n\nWait. What the...\n\nInstead of the long, majestic limb you were expecting, what greets your gaze is a small, plump version. The metal scales - no longer stuck together, but gliding smoothly against each other - run from base to tip, but don’t quite reach the bottom of your saurmorian tail, leaving the soft, pebbly skin more exposed than on a normal one. That’s the only thing this can be, after all; <b>your tail is a saurmorian tail, but a much shorter, incredibly plump one.</b> It bounces along with every movement of your [pc.ass], sure to draw the occasional eye. You can’t help but admire it as you give it a wiggle.\n\nIt’s... It’s so <i>cute!</i>");

				output("\n\nYou sigh, recalling the sparks and metal breaking off, and scan the ground in search of the inevitable debris. To your surprise, however, there appears to be nothing on the ground");
				if (InPublicSpace(target)) output(" nor any damages");
				output(". Weird.");
				
				target.tailType = GLOBAL.TYPE_SAURMORIAN;
				target.clearTailFlags();
				target.addTailFlag(thickFlag);
				target.addTailFlag(lengthFlag);
				target.addTailFlag(GLOBAL.FLAG_SCALED);
				target.addTailFlag(GLOBAL.FLAG_TAPERED);
			});
			
			
			while (validChanges.length > 0 && effectsLeft-- > 0) { validChanges.splice(rand(validChanges.length),1)[0](target); output("\n\n"); }
			while (lockedChanges.length > 0 && effectsLeft-- > 0) output(lockedChanges.splice(rand(lockedChanges.length),1)[0]()+"\n\n");
			if (effectsLeft == 4) output("And... Nothing. You feel no change as you swallow the last of the treat. Looks like this one was a bust. Oh well, at least it tasted nice.");
			
			kGAMECLASS.addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
	}
}