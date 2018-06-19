package classes.Items.Transformatives 
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.GameData.CodexManager;
	
	import classes.ItemSlotClass;
	/**
	 * Tentacle transformative
	 * @author Ascent
	 */
	public class Tentacool extends ItemSlotClass
	{
		
		public function Tentacool() 
		{
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "Tentatool";
			longName = "Tentatool pill";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a Tentatool pill";
			tooltip = "A large, transparent pill, swirling with a luminous, green liquid. A banned drug, it has potential side effects you’ll want to read about if you haven’t already.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 1000;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			
			if(target is PlayerCharacter)
			{
				author("Ascent");
				
				CodexManager.unlockEntry("Tentatool");
				//Never read codex entry on it.
				if(!CodexManager.entryViewed("Tentatool"))
				{
					kGAMECLASS.output("Seeing as Tentatool’s a banned drug, it’d probably be a good idea to read up on it before ingesting it.");
					if(!kGAMECLASS.infiniteItems()) quantity++;
				}
				else if (triggerBadEnd(target) && target.hasStatusEffect("Tentatool"))
				{
					tentacleBadEnd(target);
					return true;
				}
				else
				{
					kGAMECLASS.output("You pop the pill into your mouth and swallow it down in one gulp. Immediately you feel a tingling sensation on your skin, but nothing else happens. Your skin is definitely more sensitive, but you’ll have to wait for further effects.");
					
					// If already taken one, up dosage value
					if(target.hasStatusEffect("Tentatool"))
					{
						target.addStatusValue("Tentatool", 1, 1);
					}
					else
					{
						target.createStatusEffect("Tentatool", 1, 0, 0, 0, false, "Pill", "Your skin tingles from the Tentatool pill.", false, 30, 0xB793C4); // Transformations take place after time runs out
					}
				}
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses the pill to no effect.");
			}
			return false;
		}
		
		public static function tentacoolTF(target:Creature, effect:StorageClass, deltaT:int = 0):void
		{
			var isPlus:Boolean = effect.value1 > 1;
			
			var msg:String = "";
			var totalTFs:Number = 2;
			if (rand(2) == 0) totalTFs++;
			if (rand(3) == 0) totalTFs++;
			var select:int = 0;
			var x:int = 0;
			var i: int = 0;
			var tentacleNips:Boolean = true;
			var threeBreastsInRow:Boolean = true;
			var skinColors:Array = ["green", "blue", "red", "purple", "black"];
			var allTentacleCocks:Boolean = true;
			var cockOrPussy:int = rand(2);
			
			for(i = 0; i < target.breastRows.length; i++)
			{
				if (!target.hasTentacleNipples(i) && target.nipplesPerBreast > 0) tentacleNips = false;
				if (target.breastRows[i].breasts < 3) threeBreastsInRow = false;
			}
			
			for (i = 0; i < target.cocks.length; i++)
			{
				if (target.cocks[i].cType != GLOBAL.TYPE_TENTACLE)
				{
					allTentacleCocks = false;
					break;
				}
			}
			
			//Build a list of all potential TFs
			var TFList:Array = new Array();
			
			// Normal dosage transformations
			
			// If target doesn't have tentacle hair
			if (target.hairType != GLOBAL.HAIR_TYPE_TENTACLES && target.hairStyle != "tentacle") TFList.push(1);
			// If target doesn't have tentacle tongue
			if (target.tongueType != GLOBAL.TYPE_TENTACLE) TFList.push(2);
			// If target has any non-tentacle nipples
			if (!tentacleNips) TFList.push(3);
			// If target has any non-tentacle cocks
			if (!allTentacleCocks) TFList.push(4);
			// If target doesn't have tentacle tail(s)
			if (target.tailCount >= 1 && target.tailType != GLOBAL.TYPE_TENTACLE) TFList.push(5);
			// If target has skin color not in list and already has normal skin
			if (target.skinType == GLOBAL.SKIN_TYPE_SKIN && !InCollection(target.skinTone, skinColors)) TFList.push(6);
			// If target doesn't have normal skin
			if (target.skinType != GLOBAL.SKIN_TYPE_SKIN) TFList.push(7);
			// If target doesn't have lubricated skin
			if (target.skinType == GLOBAL.SKIN_TYPE_SKIN && !target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) TFList.push(8);
			
			// Increased dosage transformations
			
			if (isPlus)
			{
				// If target has less than 4 nipples per breast and already has tentacle nipples
				if (target.nipplesPerBreast < 4 && tentacleNips) TFList.push(9);
				// If target has less than 3 breasts per row and already has tentacle nipples and already has 4 nipples per breast
				if (!threeBreastsInRow && tentacleNips && target.nipplesPerBreast == 4) TFList.push(10);
				// If target has less than 4 breast rows and already has tentacle nipples and already has three breasts per row
				if (target.breastRows.length < 4 && tentacleNips && threeBreastsInRow) TFList.push(11);
				// If target doesn't have 10 tentacle wings
				if (target.wingType != GLOBAL.TYPE_TENTACLE || target.wingCount < 10) TFList.push(12);
				// If target doesn't have tentacle arms
				//FEN NOTE: CUT
				//if (target.armType != GLOBAL.TYPE_TENTACLE) TFList.push(13);
				// If target has less than 5 cocks and any existing cocks are already tentacles
				if (target.cocks.length < 5 && allTentacleCocks) TFList.push(14);
				// If target has less than 10 tails
				if (target.tailCount == 0 || (target.tailCount < 10 && target.tailType == GLOBAL.TYPE_TENTACLE)) TFList.push(15);
				// If target doesn't have tentacle legs
				if (target.legType != GLOBAL.TYPE_TENTACLE) TFList.push(16);
			}
			
			// TF texts
			msg += "<b>The Tentatool pill has an effect....</b>";
			var changed:Boolean = false;
			
			while(totalTFs > 0)
			{
				// Pick a transformation	
				x = rand(TFList.length);
				select = TFList[x];
				// Remove from list
				TFList.splice(x,1);
				
				// #1 If target doesn't have tentacle hair, give tentacle hair
				if(select == 1)
				{
					msg += ParseText("\n\nYou feel an intense itch in your scalp, and run your hands through your [pc.hair] just in time to feel it <b>turning into a writhing mass of tentacles</b>.");
					
					if (target.hairLength < 20) {
						msg += " The tentacles also lengthen, seeking further reach.";
						target.hairLength = 20;
					}
					
					target.hairType = GLOBAL.HAIR_TYPE_TENTACLES;
					target.hairColor = target.skinTone;
					target.hairStyle = "null";
					
					changed = true;
				}
				// #2 If target doesn't have a tentacle tongue, give a tentacle tongue
				else if (select == 2)
				{
					if (target.tongueTypeUnlocked(GLOBAL.TYPE_TENTACLE)) {
						msg += "\n\nThe tingling in your skin spreads to your mouth.";
						
						if (!target.hasTongueFlag(GLOBAL.FLAG_LONG)) msg += " Your tongue spills out of your mouth, growing in length.";
						if (!target.hasTongueFlag(GLOBAL.FLAG_LUBRICATED)) msg += " You feel your tongue growing wetter. You run your hand along it and it’s slippery.";
						
						msg += " <b>Your tongue has become a long, slick tentacle</b>, but you’re able to retract it into your mouth.";
						
						target.clearTongueFlags();
						
						target.tongueType = GLOBAL.TYPE_TENTACLE;
						target.addTongueFlag(GLOBAL.FLAG_LONG);
						target.addTongueFlag(GLOBAL.FLAG_LUBRICATED);
						target.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
						
						changed = true;
					}
					else msg += "\n\n" + target.tongueTypeLockedMessage();
				}
				// #3 Change all nipples to tentacle nipples
				else if (select == 3)
				{
					if (target.nippleTypeLockedMessage())
					{
						msg += "\n\nThe tingling in your skin intensifies on your nipples. You feel them... spill out? Your nipples extend, growing into long, prehensile appendages. <b>Your nipples have become writhing tentacles.</b> They contract back into your breasts for now.";
						
						for(i = 0; i < target.breastRows.length; i++)
						{
							if (!target.hasTentacleNipples(i)) target.breastRows[i].nippleType = GLOBAL.NIPPLE_TYPE_TENTACLED;
						}
						
						target.nippleColor = target.skinTone;
						
						changed = true;
					}
					else msg += "\n\n" + target.nippleTypeLockedMessage();
				}
				// #4 Change all cocks to tentacle cocks
				else if (select == 4)
				{
					var numCocksChanged:int = 0;
					
					for (i = 0; i < target.cocks.length; i++)
					{
						if (target.cockTypeUnlocked(i, GLOBAL.TYPE_TENTACLE))
						{
							target.shiftCock(i, GLOBAL.TYPE_TENTACLE);
							target.cocks[i].cockColor = target.skinTone;
							
							if (target.cocks[i].cLengthRaw < 24) target.cocks[i].cLengthRaw = 24;
							if (target.cocks[i].cThicknessRatioRaw > .5) target.cocks[i].cThicknessRatioRaw = .5;
							
							numCocksChanged++;
							changed = true;
						}
					}
					
					if (numCocksChanged == 0) msg += target.cockTypeLockedMessage();
					else
					{
						msg += "\n\nAn itch builds in your crotch, but it’s soon replaced by a strained feeling.";
						
						if (target.isCrotchGarbed()) msg += " You remove your bottoms just in time.";
						
						msg += " The strain releases and ";
						
						if (numCocksChanged > 1) msg += "your cocks change form. <b>You now have a writhing bunch of tentacles for cocks.</b>";
						else msg += "your cock changes form. <b>You now have a writhing tentacle for a cock.</b>";
					}
				}
				// #5 Turn tail(s) into tentacle tail(s) with random cock or pussy tail
				else if (select == 5)
				{
					if (target.tailTypeUnlocked(GLOBAL.TYPE_TENTACLE))
					{
						var oneTail:Boolean = target.tailCount == 1;
						
						msg += "\n\nYour " + (oneTail ? "tail begins" : "tails begin") + " to twitch and wiggle. You feel " + (oneTail ? "it" : "them") + " shifting";
						
						if (!target.hasTailFlag(GLOBAL.FLAG_LONG)) msg += " and growing";
						
						msg += ". You bring " + (oneTail ? "your tail" : "one of your tails") + " around to the front of your body and examine it. <b>Your " + (oneTail ? "tail has become a" : "tails have become") + (cockOrPussy == 0 ? " cock" : " pussy") + "-tipped " + (oneTail ? "tentacle" : "tentacles") + "!</b>";
						
						target.clearTailFlags();
						target.tailType = GLOBAL.TYPE_TENTACLE;
						target.addTailFlag(GLOBAL.FLAG_LONG);
						target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						target.tailGenitalColor = target.skinTone;
						
						if (cockOrPussy == 0)
						{
							target.addTailFlag(GLOBAL.FLAG_TAILCOCK);
							target.tailGenital = GLOBAL.TAIL_GENITAL_COCK;
							target.tailGenitalArg = GLOBAL.TYPE_TENTACLE;
						}
						else
						{
							target.addTailFlag(GLOBAL.FLAG_TAILCUNT);
							target.tailGenital = GLOBAL.TAIL_GENITAL_VAGINA;
							target.tailGenitalArg = GLOBAL.TYPE_HUMAN;
						}
						
						changed = true;
					}
					else msg += "\n\n" + target.tailTypeLockedMessage();
				}
				// #6 Change everything color
				else if (select == 6)
				{
					var newSkinTone:String = RandomInCollection(skinColors);
					if (target.skinToneUnlocked(newSkinTone))
					{
						msg += "\n\nEvery surface of your body shimmers, rapidly switching colors, before quickly settling down. <b>You’re " + newSkinTone + " all over.</b>";
						
						target.skinTone = newSkinTone;
						target.hairColor = newSkinTone;
						target.eyeColor = newSkinTone;
						target.lipColor = newSkinTone;
						target.nippleColor = newSkinTone;
						target.tailGenitalColor = newSkinTone;
						
						for (i = 0; i < target.cocks.length; i++)
						{
							target.cocks[i].cockColor = newSkinTone;
						}
						for (i = 0; i < target.vaginas.length; i++)
						{
							target.vaginas[i].vaginaColor = newSkinTone;
						}
					}
				}
				// #7 change skin to normal skin
				else if (select == 7)
				{
					if (target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
					{
						msg += "\n\nAn intense itch covers your body and ";
						
						if (InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_CHITIN, GLOBAL.SKIN_TYPE_FEATHERS, GLOBAL.SKIN_TYPE_BARK))
						{
							msg += "you begin to shed your " + GLOBAL.SKIN_TYPE_NAMES[target.skinType].toLowerCase() + ". <b>Underneath is normal skin.</b>";
						}
						else
						{
							msg += "your " + GLOBAL.SKIN_TYPE_NAMES[target.skinType].toLowerCase() + " skin shimmers and changes forms, <b>leaving you with normal skin.</b>";
						}
						
						target.skinType = GLOBAL.SKIN_TYPE_SKIN;
						target.clearSkinFlags();
						target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
						changed = true;
					}
					else msg += "\n\n" + target.skinTypeLockedMessage();
				}
				// #8 give lubricated skin
				else if (select == 8)
				{
					if (target.skinFlagsUnlocked(GLOBAL.FLAG_LUBRICATED))
					{
						msg += "\n\nYou feel...wet? <b>Your skin has become self-lubricating.</b>";
						
						target.clearSkinFlags();
						target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
						target.addSkinFlag(GLOBAL.FLAG_LUBRICATED);
					}
				}
				// #9 add one nipple per breast
				else if (select == 9)
				{
					var newNipplesPerBreast:int = target.nipplesPerBreast + 1;
					if (target.nipplesPerBreastUnlocked(newNipplesPerBreast))
					{
						msg += "\n\nYour nipples begin to feel like they’re going to burst. You ";
						
						if (target.isChestGarbed()) msg += "pull off your top and ";
						
						msg += "look down just in time to see <b>another tentacle nipple growing out next to each of your existing nipples.</b>";
						
						target.nipplesPerBreast = newNipplesPerBreast;
						changed = true;
					}
					else msg += "\n\n" + target.nipplesPerBreastLockedMessage();
				}
				// #10 set breasts per row to 3 if less than 3
				else if (select == 10)
				{
					var changedBreasts:Boolean = false;
					var cleavage:Boolean = false;
					for (i = 0; i < target.breastRows.length; i++ )
					{
						if (target.breastRows[i].breasts < 3 && target.breastsUnlocked(i, 3))
						{
							target.breastRows[i].breasts = 3;
							if(target.breastRows[i].breastRating() >= 4) cleavage = true;
							changedBreasts = true;
							changed = true;
						}
					}
					
					if (changedBreasts) 
					{
						msg += "\n\nYou feel a sharp prickling across your body just before a <b>third tentacle-laden breast grows between your other two</b>";
						if(cleavage) msg += ", giving you two lines of tantalizing cleavage";
						msg += ".";
					}
					else msg += "\n\n" + target.breastsLockedMessage();
				}
				// #11 add a breast row
				else if (select == 11)
				{
					if (target.createBreastRowUnlocked(target.bRows() + 1))
					{
						msg += "\n\nYou feel a sharp prickling down your body just before <b>another row of tentacle nipples grows below your existing ones, starting a new row of breasts</b>.";
						
						if (target.createBreastRow())
						{
							target.breastRows[target.breastRows.length - 1].nippleType = GLOBAL.NIPPLE_TYPE_TENTACLED;
							target.breastRows[target.breastRows.length - 1].breasts = 3;
						}
						
						changed = true;
					}
					else msg += "\n\n" + target.createBreastRowsLockedMessage();
				}
				// #12 change wing type to tentacle (or add two wings)
				else if (select == 12)
				{
					if (target.wingType != GLOBAL.TYPE_TENTACLE)
					{
						if(target.wingTypeUnlocked(GLOBAL.TYPE_TENTACLE))
						{
							msg += "\n\n";
							if (target.wingCount == 0)
							{
								msg += "The area around your shoulder blades begins to itch. The itching intensifies until it feels like a sharp prickling sensation on your back. <b>Two writhing, prehensile tentacles burst forth from beneath the skin on your back.</b>";
							}
							else
							{
								msg += ParseText("Your [pc.wings] begin");
								if(target.wingCount == 1) msg += "s";
								msg += ParseText(" to itch. The itching is quickly replaced by a strained sensation. You feel your [pc.wingsNoun]");
								if(target.wingCount == 1) msg += " split into two seperate appendages, each warping and changing into new shapes. You";
								else msg += " changing and";
								msg += ParseText(" realize you’ve gained even greater control of them. You’re able to bring one within your field of vision. <b>It seems your [pc.wingsNoun] have been replaced with writhing, prehensile tentacles.</b>");
							}
							target.wingType = GLOBAL.TYPE_TENTACLE;
							if(target.wingCount < 2) target.wingCount = 2;
							changed = true;
						}
						else msg += "\n\n" + target.wingTypeLockedMessage();
					}
					else
					{
						msg += "\n\nThe tingling on your back intensifies into a sharp prickling sensation. Your back tentacles twitch uncontrollably. <b>Two more tentacles burst forth from your back, and the prickling and twitching calms down.</b>";
						
						target.wingCount += 2;
						changed = true;
					}
				}
				// #13 give tentacle arms - Fen note - I disabled this.
				else if (select == 13)
				{
					if (target.armTypeUnlocked(GLOBAL.TYPE_TENTACLE))
					{
						msg += "\n\nThe tingling in your arms intensifies till they feel like they’re tearing apart. The pain gives way to a feeling of unraveling at your shoulders. Before your eyes, your arms truly do fall apart, morphing into a bunch of tentacles sprouting from each shoulder. You give an experimental wiggle and find you have great control of these tentacles. You twist the tentacles on each side up into normal, arm-like shapes, with five tentacle ends acting as your fingers.";
						
						target.armType = GLOBAL.TYPE_TENTACLE;
						target.clearArmFlags();
						target.addArmFlag(GLOBAL.FLAG_SMOOTH);
						
						changed = true;
					}
					else msg += "\n\n" + target.armTypeLockedMessage();
				}
				// #14 add a tentacle cock
				else if (select == 14)
				{
					if (target.createCockUnlocked(newCockIndex + 1))
					{
						var newCockIndex:int = target.cocks.length;
						
						msg += "\n\nYou feel as if something is trying to push its way out of your crotch. You ";
						
						if (target.isCrotchGarbed()) msg += "take off your bottoms and ";
						
						msg += "look down just in time to see <b>a";
						
						if (newCockIndex > 0) msg += "nother";
						
						msg += " tentacle cock growing in.</b>";
						
						if (target.createCock(24, .5))
						{
							target.shiftCock(newCockIndex, GLOBAL.TYPE_TENTACLE);
							target.cocks[newCockIndex].cockColor = target.skinTone;
						}
						
						changed = true;
					}
					else msg += "\n\n" + target.createCockLockedMessage();
				}
				// add tentacle tail
				else if (select == 15)
				{
					var newTailCount:int = target.tailCount + 1;
					
					if (target.tailCountUnlocked(newTailCount))
					{
						msg += "\n\nThe base of your spine begins to burn followed by the feeling of "
						
						if (newTailCount == 1)
						{
							msg += "<b>a tail growing in</b>. You realize you have great control over the tail and bring it around front to discover it’s a " + (cockOrPussy == 0 ? "cock" : "pussy") + "-tipped tentacle.";
						
							target.clearTailFlags();
							target.tailType = GLOBAL.TYPE_TENTACLE;
							target.addTailFlag(GLOBAL.FLAG_LONG);
							target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
							target.tailGenitalColor = target.skinTone;
							
							if (cockOrPussy == 0)
							{
								target.addTailFlag(GLOBAL.FLAG_TAILCOCK);
								target.tailGenital = GLOBAL.TAIL_GENITAL_COCK;
								target.tailGenitalArg = GLOBAL.TYPE_TENTACLE;
							}
							else
							{
								target.addTailFlag(GLOBAL.FLAG_TAILCUNT);
								target.tailGenital = GLOBAL.TAIL_GENITAL_VAGINA;
								target.tailGenitalArg = GLOBAL.TYPE_HUMAN;
							}
						}
						else msg += "<b>a new tentacle growing in, adding another tentacle to your backside</b>.";
						
						target.tailCount = newTailCount;
						
						changed = true;
					}
					else msg += "\n\n" + target.tailCountLockedMessage();
				}
				// give tentacle legs
				else if (select == 16)
				{
					if (target.legTypeUnlocked(GLOBAL.TYPE_TENTACLE))
					{
						if (target.legCountUnlocked(2))
						{
							msg += ParseText("\n\nAn intense pain shoots through your [pc.legOrLegs] as if " + (target.legCount == 1 ? "it’s" : "they’re") + " tearing apart, and you barely remain standing. The next moment, your lower body unravels out from underneath you and you fall to the ground. Where you once had " + (target.legCount == 1 ? "a [pc.legNoun]" : "[pc.legsNoun]") + ", <b>you now have a writhing bundle of tentacles</b>. You gain control over them, and manage to bound them into a facsimile of normal legs and stand up. It’s a bit shakey, but the tentacle legs do their job. Perhaps you could travel around without forming the tentacles into two leg shapes.");
							
							target.legCount = 2;
							target.legType = GLOBAL.TYPE_TENTACLE;
							target.clearLegFlags();
							target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
							target.addLegFlag(GLOBAL.FLAG_TENDRIL);
							target.addLegFlag(GLOBAL.FLAG_SMOOTH);
							target.addLegFlag(GLOBAL.FLAG_PREHENSILE);
							target.genitalSpot = 0;
							
							changed = true;
						}
						else msg += "\n\n" + target.legCountLockedMessage();
					}
					else msg += "\n\n" + target.legTypeLockedMessage();
				}
				
				totalTFs--;
			}
			
			msg += "\n\n";
			
			if (target.tentacleScore() >= target.willpower() && rand(2) == 0) msg += "As the effects of the Tentatool wind down, you feel a bit dizzy and spaced-out. You quickly snap out of it and clear your head. ";
			
			// Effect over:
			msg += "Finally your skin stops tingling and any remaining tension dissipates. It seems the effects of the Tentatool have worn off."
			
			AddLogEvent(msg, "passive", deltaT);
			
			return;
		}
		
		public static function triggerBadEnd(target:Creature):Boolean
		{
			var targetTentacleScore:int = target.tentacleScore();
			var targetWill:Number = target.willpower();
			
			if (targetTentacleScore < 25 || !(target is PlayerCharacter)) return false;
			//Removed the armType restriction since it was cut from the game.
			//else if (rand(100) < ((targetTentacleScore - (targetWill / 2)) / 80) * 100 && target.armType == GLOBAL.TYPE_TENTACLE && target.legType == GLOBAL.TYPE_TENTACLE) return true;
			else if (rand(100) < ((targetTentacleScore - (targetWill / 2)) / 80) * 100 && target.legType == GLOBAL.TYPE_TENTACLE) return true;
			else return false;
		}
		
		public static function tentacleBadEnd(target:Creature):void
		{
			clearOutput();
			clearMenu();
			author("Ascent");
			
			output("You feel a familiar unraveling sensation, but are unable to pinpoint the source. You move to find a reflective surface, and stumble to the " + (kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.INDOOR) ? "floor" : "ground") + ", suddenly dizzy. You manage to right yourself and locate a reflective surface. As far as you can tell, nothing is changing. Nonetheless, neither the unraveling feeling nor the dizziness goes away.");
			
			output("\n\nYou calmly and carefully pace, waiting for the feelings to recede. Maybe the Tentatool you just took was a bad dose. You stop pacing and take a deep breath, thinking back to what you know about the drug. A moment of clarity allows you to pinpoint the source of the unraveling sensation: your mind. What you feel falling apart this time is your very sense of self.");
			
			output("\n\n");
			if (target.armType != GLOBAL.TYPE_TENTACLE || !target.hasArmFlag(GLOBAL.FLAG_AMORPHOUS))
			{
				output("In the next moment, your");
				if (target.armType != GLOBAL.TYPE_TENTACLE)
				{
					output(" arms warp and change, each bursting into an amorphous bundle of tentacle-like appendages that sprout from each shoulder");
					target.armType = GLOBAL.TYPE_TENTACLE;
					target.clearArmFlags();
					target.addArmFlag(GLOBAL.FLAG_SMOOTH);
				}
				else output(" make-shift arms fall apart, no longer bound into normal arm shapes");
				output(". ");
				target.addArmFlag(GLOBAL.FLAG_AMORPHOUS);
			}
			if (!target.hasLegFlag(GLOBAL.FLAG_AMORPHOUS))
			{
				output("Your legs fall apart as well, leaving you to support yourself on a shapeless mass of tentacles. ");
				target.addLegFlag(GLOBAL.FLAG_AMORPHOUS);
				target.legCount = 1;
				target.genitalSpot = 1;
			}
			
			output("Before you can panic, you look at your reflection, and fail to recognize the creature staring back at you. The last bit of who you are completely unravels and fades away.");
			
			output("\n\nThe tentacle creature’s humanoid torso splits apart into more tentacles, some tipped with phallus-like ends, and some tipped with slick, inviting holes. Its face disappears into the depths of the tentacles. It writes and wriggles experimentally, before settling into one large, shifting mass. Its birth complete, the monster skitters off in search of its first victim.");
			
			// TETSUO!!!
			var i:int = 0;
			
			target.eyeColor = target.skinTone;
			target.lipColor = target.skinTone;
			target.nippleColor = target.skinTone;
			target.tailGenitalColor = target.skinTone;
			if(!target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) target.addSkinFlag(GLOBAL.FLAG_LUBRICATED);
			if(target.hairType != GLOBAL.HAIR_TYPE_TENTACLES) target.hairType = GLOBAL.HAIR_TYPE_TENTACLES;
			if(target.hairLength < 20) target.hairLength = 20;
			target.hairColor = target.skinTone;
			if(target.tongueType != GLOBAL.TYPE_TENTACLE)
			{
				target.tongueType = GLOBAL.TYPE_TENTACLE;
				target.clearTongueFlags();
				target.addTongueFlag(GLOBAL.FLAG_LONG);
				target.addTongueFlag(GLOBAL.FLAG_LUBRICATED);
				target.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			}
			if(target.tailType != GLOBAL.TYPE_TENTACLE)
			{
				target.clearTailFlags();
				target.tailType = GLOBAL.TYPE_TENTACLE;
				target.addTailFlag(GLOBAL.FLAG_LONG);
				target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
				
				if(!target.hasTailFlag(GLOBAL.FLAG_TAILCOCK) && !target.hasTailFlag(GLOBAL.FLAG_TAILCUNT))
				{
					if(rand(2) == 0)
					{
						target.addTailFlag(GLOBAL.FLAG_TAILCOCK);
						target.tailGenital = GLOBAL.TAIL_GENITAL_COCK;
						target.tailGenitalArg = GLOBAL.TYPE_TENTACLE;
					}
					else
					{
						target.addTailFlag(GLOBAL.FLAG_TAILCUNT);
						target.tailGenital = GLOBAL.TAIL_GENITAL_VAGINA;
						target.tailGenitalArg = GLOBAL.TYPE_SIREN;
					}
				}
			}
			target.tailCount += 36;
			target.wingType = GLOBAL.TYPE_TENTACLE;
			target.wingCount += 48;
			for (i = 0; i < 10; i++)
			{
				target.createBreastRow();
				
				if(target.breastRows[i].nippleType != GLOBAL.NIPPLE_TYPE_TENTACLED) target.breastRows[i].nippleType = GLOBAL.NIPPLE_TYPE_TENTACLED;
				if(target.breastRows[i].breasts < 3) target.breastRows[i].breasts = 3;
			}
			for (i = 0; i < 10; i++)
			{
				target.createCock(24, 0.5);
				
				if(target.cocks[i].cType != GLOBAL.TYPE_TENTACLE) target.shiftCock(i, GLOBAL.TYPE_TENTACLE);
				if(target.cocks[i].cLengthRaw < 24) target.cocks[i].cLengthRaw = 24;
				if(target.cocks[i].cThicknessRatioRaw > 0.5) target.cocks[i].cThicknessRatioRaw = 0.5;
				target.cocks[i].cockColor = target.skinTone;
			}
			for (i = 0; i < 3; i++)
			{
				target.createVagina();
				
				if(target.vaginas[i].type != GLOBAL.TYPE_SIREN) target.shiftVagina(i, GLOBAL.TYPE_SIREN);
				if(target.vaginas[i].clits < 3) target.vaginas[i].clits = 3;
				if(target.vaginas[i].wetnessRaw < 5) target.vaginas[i].wetnessRaw = 5;
				if(target.vaginas[i].minLooseness > 1) target.vaginas[i].minLooseness = 1;
				target.vaginas[i].vaginaColor = target.skinTone;
			}
			
			kGAMECLASS.processTime(52);
			
			kGAMECLASS.badEnd();
		}
	}
}