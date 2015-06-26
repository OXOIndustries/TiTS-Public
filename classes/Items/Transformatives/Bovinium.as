package classes.Items.Transformatives 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.VaginaClass;
	
	import classes.Engine.Utility.rand;
	
	import classes.Engine.Interfaces.*;
	
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Bovinium extends ItemSlotClass
	{
		
		public function Bovinium() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			this.shortName = "Bovinium";
			this.longName = "Bovinium";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a small bottle of bovinium";
			
			this.tooltip = "Created by a dissident female scientist from the garden world of New Texas, Bovinium is a designer cosmetic transformative that causes the user to gain features reminiscent of bovines, more commonly called \"cow-girls.\" The product label informs you that it is highly feminizing, even capable of complete gender transitions, and causes dramatic increases in breast size, lactation, and fertility. ";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 500;
			
			this.version = this._latestVersion;
		}
		
		private function t0Changes(target:Creature, tChanges:int):int
		{
			var changes:int = 0;
			
			if (target.faceType != GLOBAL.TYPE_HUMAN || target.skinType != GLOBAL.SKIN_TYPE_SKIN)
			{
				output("The first thing you feel after ingesting the treat is an odd calmness that falls over you. A passivity and complacency that makes you want to just sit down and... chew greens? You blink, scowling at yourself for thinking that. What the hell?\n\n");

				//if PC has non-human skin:
				if (target.skinType != GLOBAL.SKIN_TYPE_SKIN && target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
				{
					// ugh - skinFurScales isn't appropriate for this.
					output("Your [pc.skin] starts to itch powerfully. It starts as an annoyance, making you rub at an errant patch of your inhuman flesh, but the sensations spread and intensify.");
					if (target.skinType == GLOBAL.SKIN_TYPE_FUR) output(" After a few moments, you start to see patches of fur falling off as you itch yourself. More and more of your lush coating drops off with every moment, until you're left bare naked! <b>Your fur is gone!</b>");
					else if (target.skinType == GLOBAL.SKIN_TYPE_SCALES) output(" After a few moments, you start to see some of your scales flaking off. More and more drop to the ground as you scratch yourself, tearing away in big chunks until <b>you're left with surprisingly normal human skin.</b>");
					else if (target.skinType == GLOBAL.SKIN_TYPE_GOO)
					{
						output(" Your gooey body starts to feel very.. heavy and solid. Much less malleable and soft than before, for sure! You watch with awe as your body starts to reform, solidifying into almost comically mundane skin. <b>You're not gooey anymore!</b>");
						output("\n\nIt takes a while to get used to no longer having jiggly goo for a body, but before long, you're walking around with a bit more confidence. This'll take some getting used to, though.");
					}
					else
					{
						output(" After a while, your [pc.skinFurScales] begins to morph and give way to a burgeoning coating of human flesh. You watch in awe as <b>your body becomes completely covered with simple, common skin.</b>");
					}
					
					target.skinFlags = [];
					target.skinType = GLOBAL.SKIN_TYPE_SKIN;
					changes++;
					
					output("\n\n");
				}
				else
				{
					output(target.skinTypeLockedMessage() + "\n\n");
				}

				//if PC has a non-human face:
				if (target.faceType != GLOBAL.TYPE_HUMAN && target.faceTypeUnlocked(GLOBAL.TYPE_HUMAN))
				{
					output("You feel your [pc.face] starting to crumple in, rattling your teeth and sending shockwaves of pressure through your head. You feel like you're in a vice! Slowly but surely, your inhuman face takes on a much more common appearance, leaving you with a cute little nose, lips, human eyes -- the works. <b>You now have a human face!</b>\n\n");
					
					target.faceType = GLOBAL.TYPE_HUMAN;
					target.faceFlags = [];
					changes++;
				}
				else
				{
					output("\n\n" + target.faceTypeLockedMessage());
				}
			}
			
			return changes;
		}
		
		private function t1Changes(target:Creature, tChanges:int):int
		{
			var changes:int = 0;
			var doneCockChangeText:Boolean = false;
			
			if (target.hasCock())
			{
				var tCocks:Array = [];
				var cCocks:Array = [];
				
				// Cocks longer than 4" shrink
				for (var i:int = 0; i < target.cocks.length; i++)
				{
					if (target.cocks[i].cLengthRaw > 4) tCocks.push(target.cocks[i]);
				}
				
				if (tCocks.length > 0)
				{
					doneCockChangeText = true;
					
					//Lose maybe 1d4+1 inches each time?
					output("A bolt of... not quite pain, but certainly not pleasure races up your spine! You clutch your crotch, the source of your discomfort,");
					if (!target.isNude()) output(" and strip away your [pc.gear] to reveal");
					else output(" and look down to see");
					output(" that your [pc.cockBiggest] is shrinking, receedinging back into your crotch!");
					tChanges--;
					
					for (i = 0; i < tCocks.length; i++)
					{
						var nLength:Number = tCocks[i].cLengthRaw;
						var lLoss:Number = rand(5) + 2;
						
						if(target.hasPerk("Mini"))
						{
							if(nLength > 12) lLoss *= 2;
							else if(nLength > 6) lLoss += lLoss/2;
						}

						nLength -= lLoss;
						
						if (nLength < 3)
						{
							lLoss += 3 - nLength;
						}
						
						if (target.cockLengthUnlocked(target.cocks.indexOf(tCocks[i]), nLength))
						{
							tCocks[i].cLengthRaw = nLength;
							cCocks.push(tCocks[i]);
						}
					}
				
					if (cCocks.length == 0)
					{
						output(" " + target.cockLengthLockedMessage() + "\n\n");
					}
					else if (cCocks.length > 1)
					{
						changes++;
						output(" Instinctively, you desperately clutch at your shortening lengths, trying to prevent the loss -- but your body is adamant, spurred on by the Bovinium candy. By the time the loss is done, you're certain that <b>your cocks have shrunk " + lLoss + " inches!</b>\n\n");
					}
					else
					{
						changes++;
						output(" Instinctively, you desperately clutch at your shortening length, trying to prevent the loss -- but your body is adamant, spurred on by the Bovinium candy. By the time the loss is done, you're certain that <b>your cock has shrunk " + lLoss +" inches!</b>\n\n");
					}
				}
				
				//Cocks shorter than 4" have a chance to be removed.
				tCocks = [];
				
				for (i = 0; i < target.cocks.length; i++)
				{
					if (cCocks.indexOf(tCocks[i]) != -1) continue; // If a cock was shrunk this item use, skip it
					if (target.cocks[i].cLengthRaw <= 4) tCocks.push(target.cocks[i]);
				}
				
				cCocks = []; // clear the configured cocks for it
				
				if (tCocks.length > 0)
				{
					for (i = 0; i < tCocks.length; i++)
					{
						if (rand(4) == 0) continue;
						if (target.removeCockUnlocked(target.cocks.indexOf(tCocks[i]), 1)) cCocks.push(tCocks[i]);
					}
				}
				
				if (tCocks.length > 0)
				{
					if (!doneCockChangeText)
					{
						output("A bolt of... not quite pain, but certainly not pleasure races up your spine! You clutch your crotch, the source of your discomfort,");
						if (!target.isNude()) output(" and strip away your [pc.gear] to reveal");
						else output(" and look down to see"); 
						output(" that your [pc.cockSmallest] is shrinking, receedinging back into your crotch!");
						
						if (tCocks.length == 1) output(" Instinctively, you desperately clutch at your shortening length, trying to prevent the loss -- but your body is adamant, spurred on by the Bovinium candy.");
						else output(" Instinctively, you desperately clutch at your shortening lengths, trying to prevent the loss -- but your body is adamant, spurred on by the Bovinium candy.");
						doneCockChangeText = true;
					}
					
					if (cCocks.length == 0)
					{
						output(" " + target.removeCockLockedMessage() + "\n\n");
					}
					else
					{
						output(" The shrinking continues, and continues... and continues. You moan helplessly as <b>your [pc.cockSmallest] vanishes completely into your groin.</b> You're left");
						var cocksRemoved:Boolean = false;
						changes++;
						for (i = 0; i < cCocks.length; i++)
						{
							cocksRemoved = true;
							target.removeCock(target.cocks.indexOf(cCocks[i]), 1);
						}
						
						if (target.hasCock()) 
						{
							output(" with " + kGAMECLASS.num2Text(cCocks.length) +" less cock");
							if (cCocks.length > 1) output("s");
						}
						else output(" completely without cocks");
						output(", now.\n\n");
					}
				}
			}
				
			// Shrink balls
			if (target.balls > 0 && target.hasCock() && target.ballSizeRaw > 2)
			{
				output("After the shock of your cock");
				if (!cocksRemoved) output(" shrinking");
				else output(" vanishing");
				output(", you're treated to another round of discomfort -- this time from your [pc.balls]!");
				
				if (!target.ballSizeUnlocked(target.ballSizeRaw - 1))
				{
					output(" " + target.ballSizeLockedMessage() + "\n\n");
				}
				else
				{
					output(" You shiver as <b>your nuts recede into your taint, growing tighter and fuller as a result.</b>");
					
					if (target.ballSizeRaw > 3) target.ballSizeRaw -= 1;
					else if (target.ballSizeRaw > 2) target.ballSizeRaw = 1;
					changes++;
				}
			}
			// Remove balls entirely if no cocks remain
			else if (target.balls > 0 && !target.hasCock())
			{
				output("After the shock of your cock");
				if (!cocksRemoved) output(" shrinking");
				else output(" vanishing");
				output(", you're treated to another round of discomfort -- this time from your [pc.balls]! You shiver as your nuts recede into your taint, continuing to shrink until the flesh of your sack merges completely with your body. <b>Your balls are gone!</b>\n\n");
				
				target.balls = 0;
				target.ballSizeRaw = 0;
				target.ballSizeMod = 0;
				if (target.hasStatusEffect("Uniball")) target.removeStatusEffect("Uniball");
				changes++;
			}
			
			// Genderless autoacquires vagina
			if (!target.hasCock() && !target.hasVagina() || (!target.hasVagina() && rand(4) > 0))
			{
				output("You feel a lance of point, absolutely agonizing, shoot through your body from the crotch. You double over, barely able to keep standing. Fuck that hurts!");

				output("\n\nYou reach a hand down, brushing it along your ");
				if(!target.isCrotchGarbed()) output("bare ");
				output("crotch, and find an unsettling wetness clinging to your groin. Your fingers explore further, and find a cut gaping in your [pc.skin], growing deeper. The pangs of agony start to abate, replaced by something approaching pleasure as your fingers explore this new cleft in your groin. Your find a small lump near to top, and a single touch of it sends shivers of ecstasy through you. As your explore the new hole in your body, you quickly come to the realization that <b>you now have a vagina</b>!\n\n");
				
				target.createVagina();
				target.clitLength = 0.5;
				changes++;
			}
			
			if (target.femininity < 75 && target.femininityUnlocked(target.femininity + 5))
			{
				var startMF:String = target.mfn("m", "f", "n");
				
				output("You feel a slight change in your facial structure -- your lips become a bit more pronounced, your eyelashes grow a bit, your nose becomes a little cuter. Many subtle, small changes occur over the course of a minute or so. When they finish, <b>you feel much more feminine</b>!");
				
				target.femininity += 5;
				changes++;
				
				if (startMF != target.mf("m", "f")) output(" <b>You're now sure anybody who so much as glanced at you would think you're a female.</b>\n\n");
			}
			
			return changes;
		}
		
		private function t2Changes(target:Creature, tChanges:int):int
		{
			var changes:int = 0;
			
			var grownTitties:Boolean = false;
				
			// Boobicles
			if (target.breastRows[0].breastRatingRaw < 40)
			{
				var grownInitialTits:Boolean = false;
				changes++;
				
				if (target.breastRows[0].breastRatingRaw < 1) grownInitialTits = true;
				
				grownTitties = true;
				
				// Min up to EEs
				if (target.breastRows[0].breastRatingRaw < 9)
				{
					target.breastRows[0].breastRatingRaw = 9;
				}
				else
				{
					// +2 rating for < 20, +1 otherwise
					if (target.breastRows[0].breastRatingRaw < 20) target.breastRows[0].breastRatingRaw += 1;
					target.breastRows[0].breastRatingRaw += 1;
				}
				
				output("You feel a sudden rush of pressure onto your [pc.chest]. You grunt and find yourself making a bestial mooing sound as your chest expands");
				if (grownInitialTits) output(" into a pair of perfectly-formed breasts");
				output("! <b>Your tits swell in size, reaching a");
				if (target.breastRows[0].breastRatingRaw < 9) output(" respectable");
				else if (target.breastRows[0].breastRatingRaw < 20) output(" huge");
				else output(" cow-like");
				output(" " + target.breastCup(0) + "s!</b> You find yourself cupping your boobs, squeezing them idly and enjoying the startling sensitivity they have. You get the feeling it'd be easy to cum just from playing with these big, beautiful boobs of yours...\n\n");

				if (target.isBimbo()) output("You really want to go find a cock to slide between your mounds now! Boys are going to love playing them, shoving cum-filled cocks up inbetween your titties and busting big, creamy nuts all over them...\n\n");
			}
			
			if (!target.canLactate())
			{
				target.boostLactation(75);
				changes++;
				
				output("You feel a shift of weight in your [pc.chest], and your hands roam up your");
				if (grownTitties) output(" growing ");
				output("bust. You squeeze one of your [pc.nipples], and find your fingers come away wet with [pc.milkNoun]. You give your boob a squeeze, and sure enough, a little trickle of it comes out of your stuff teat, drooling onto the ground. <b>It looks like you're lactating now</b>!\n\n");
			}
			else if (target.milkMultiplier < 150) // SWINGING IN THE DARK HERE
			{
				target.boostLactation(5);
				changes++;
				
				output("You feel a shift of weight in your [pc.chest], and you get a distinctly more... full... feeling from your breasts. You give your teat an experimental squeeze, and are rewarded with a much more vigorous jet of [pc.milkNoun] that spurts out at your touch. You're pretty sure that <b>you're lactating even more now!</b>\n\n");
			}
			
			if (target.milkType != GLOBAL.FLUID_TYPE_MILK && rand(3) == 0)
			{
				changes++;
				target.milkType = GLOBAL.FLUID_TYPE_MILK;
				
				output("You feel a strange, twisting sensation in your [pc.chest], strong enough to make you clutch at your tits. When you put even the slightest amount of pressure on them, you're treated to a sudden gush of milk -- milk, thick and rich, just like a cow's. You can't resist the urge to bring one of your nipples up to your mouth and suckle from yourself, drinking down your new creamy bounty. Absolutely delicious! <b>Your boobs now produce milk!</b>\n\n");
			}
			
			return changes;
		}
		
		private function t3Changes(target:Creature, tChanges:int):int
		{
			var changes:int = 0;
			
			//High chance for hips growth
			if (target.hipRatingRaw < 17 && rand(3) == 0 && changes < tChanges)
			{
				//Up to big, motherly hips
				output("You wobble unsteadily, feeling your body shifting and expanding");
				if (target.hipRatingRaw > 10) output(" and straining against your clothes");
				output(". Your body mass is shifting to grow your flanks to a more suitably bovine size! You spend a few moments adjusting to your new shape, enjoying the jiggle of your body.\n\n");
				
				target.hipRatingRaw += 1
				changes++;
			}
			
			//High chance for butt growth
			//Up to big, jiggly behind. 
			if (target.buttRatingRaw < 17 && rand(3) == 0 && changes < tChanges)
			{
				output("With a gasp, you feel weight shifting around in your body, guided by the strange, transformative treat. Shivers of sensation explode from your backside, and your hands instinctively move to your rump -- and you find that it's growing! After a few moments, you find that your butt is bigger and jigglier than it was before! You spend a few moments bouncing around, enjoying the feeling of your new posterior.\n\n");
				
				target.buttRatingRaw += 1;
				changes++;
			}

			//High chance to gain small bovine horns
			//Does not change existing horns.
			if (target.horns == 0 && rand(3) == 0 && changes < tChanges)
			{
				output("A tingling sensation comes from your forehead. You reach up and pat at your brow, and find a pair of growing lumps growing from your head. After a few moments, they become very hard, and covered with a velvety softness. <b>They're a pair of small, cow-like horns!</b>\n\n");
				
				target.hornType = GLOBAL.TYPE_BOVINE;
				target.hornLength = 3;
				target.horns = 2;
				changes++;
			}
			
			//High chance to grow a cow tail (No existing tails)
			if (rand(3) == 0 && changes < tChanges && (target.tailType == 0 || target.tailCount == 0))
			{
				if(target.tailTypeUnlocked(GLOBAL.TYPE_BOVINE))
				{
					output("You feel a shifting of flesh behind you. Something's growing, sprouting from your backside. You look over your shoulder, watching as a mass of flesh twists and grows from just above your butt. After a few moments, the mass of flesh resolves into a distinctly tail-like shape which sprouts with a tuft of hair at its tip. <b>You now have a bovine tail!</b>\n\n");
					
					target.tailCount = 1;
					target.tailType = GLOBAL.TYPE_BOVINE;
					target.tailFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_FLUFFY];
					changes++;
				}
				else kGAMECLASS.output(target.tailTypeLockedMessage());
			}

			//High chance to grow a cow tail (PC already has tails)
			if (rand(3) == 0 && changes < tChanges && (target.tailType != GLOBAL.TYPE_BOVINE && target.tailType != 0 && target.tailCount > 0))
			{
				if(target.tailTypeUnlocked(GLOBAL.TYPE_BOVINE))
				{
					if (target.tailCount >= 2)
					{
						output("You feel a strange sensation coming from your tails! They're squirming and shifting, all moving together and seeming... to fuse! You moan, biting your lip as your tails combine into a single, massively thick appendage. After a moment, much of the flesh there starts to recede into your body, leaving a single slender tail in its wake, tipped with a tuft of hair. <b>Your tails have combined into a single cow's tail!</b>\n\n");
					}
					else
					{
						output("You feel a strange sensation coming from your tail. Looking over your shoulder, you watch with alarm as the flesh of it sloughs off, receding into your body to reveal a small, slender tendril of skin tipped with a small tuft of fur. <b>Your tail is now like a cow's!</b>\n\n");
					}
					target.tailCount = 1;
					target.tailType = GLOBAL.TYPE_BOVINE;
					target.tailFlags = [];
					target.clearTailFlags();
					target.addTailFlag(GLOBAL.FLAG_LONG);
					target.addTailFlag(GLOBAL.FLAG_FLUFFY);
					changes++;
				}
				else kGAMECLASS.output(target.tailTypeLockedMessage());
			}
			//High chance to gain bovine ears
			if (rand(3) == 0 && changes < tChanges && (target.earType != GLOBAL.TYPE_BOVINE))
			{
				output("You let out a startled yelp as your ears start to squirm and wiggle, making horrid jelly-like motions as the nanomachines in the Bovinium rearrange your body shape. Your ears grow out from the side of your head, and start to grow a thick layer of curly, soft hair. You pull your Codex out and flip it around, using it like a mirror to examine your newly-molded ears. <b>You now have distinctly bovine ears!</b>\n\n");

				target.earType = GLOBAL.TYPE_BOVINE;
				changes++;
			}

			//Moderate chance for thickness gain
			//Small increments, up to a max of "kind of pudgy." Maybe thickness 70~?
			if (rand(6) == 0 && changes < tChanges && target.thickness < 70)
			{
				target.thickness += 2;
				if (target.thickness < 30) target.thickness += 2;
				
				output("It's obvious that some of your body weight is shifting around. You smile as your belly and libs seem to soften, fat distributing to them. <b>");
				if (target.thickness < 40) output(" You now look a little thicker!</b>");
				else if (target.thickness < 60) output(" You're now fairly thick!</b> If you ever get tired of adventuring or C.E.O.ing, you think you'd make a pretty solid plus-size model! Especially with your otherwise very curvy figure!");
				else output(" You now look quite thick!</b> You've got a distinctly chubby, soft appearance now. You're developing a bit of a belly, just enough to make you look delightfully thick and curvy.");
				output("\n\n");
				
				changes++;
			}

			//Moderate chance for tone loss
			//Small increments, but no minimum. Can take you all the way down to 0 tone.
			if (rand(6) == 0 && changes < tChanges && target.tone > 0)
			{
				target.tone -= 2;
				if (target.tone > 50) target.tone -= 2;
				if (target.tone < 0) target.tone = 0;
				
				changes++;
				output("Your muscles become a little less obvious as your body transforms, hiding deep in your body. While you're no more or less physically fit now, you're less visibly toned than you were before -- much softer and fleshier.\n\n");
			}

			//Low chance to get quad nipples
			if (rand(20) == 0 && changes < tChanges && target.nipplesPerBreast != 4)
			{
				output("Your [pc.nipples] ache all of a sudden! Pain courses through them, a tearing sensation that makes you yelp. When it abates, your hands instinctively rub at your nipples... and you find yourself feeling more nipples than there ought to be. A quick count confirms: <b>you now have quad nipples!</b>\n\n");
				
				target.nipplesPerBreast = 4;
				changes++;
			}

			//Low chance for cow-leg TF
			//PC leg type becomes bipedal, fur-covered, with hooves for feet. 
			if (rand(20) == 0 && changes < tChanges && (target.legType != GLOBAL.TYPE_BOVINE || !target.hasLegFlag(GLOBAL.FLAG_HOOVES) || target.legCount != 2))
			{
				changes++;
				
				//PC was a naga:
				if (target.isNaga())
				{
					output("A strange sensation runs through your serpentine lower body, followed by a wracking pain. You double over, hugging yourself to your coiling snake-body as the Bovinium decides to rob you of your serpent-half. The transformation is quick, but thoroughly unpleasant: your [pc.leg] splits apart wholesale, its outer parts flaking off to reveal taut, [pc.skinColor] skin. <b>You now have bipedal legs!</b>\n\n");

					output("That's not enough for the drug, though. Not by a long shot! After a few moments, you see <b>thick, curly fur starts to grow on your new-grown legs</b>, covering them up to the upper thighs. At least you'll be warm in the winter!\n\n");

					output("The bottoms of your legs take form: <b>rather than feet, they mutate into distinctly animalistic hooves.</b> You spend a good long while standing up and adjusting to your new gait, wobbling around until you get your footing. Or hoofing, as the case may be.\n\n");
					
					target.legCount = 2;
					target.genitalSpot = 0;
					target.legType = GLOBAL.TYPE_BOVINE;
					
					target.legFlags = [];
					target.addLegFlag(GLOBAL.FLAG_HOOVES);
					target.addLegFlag(GLOBAL.FLAG_FURRED);
				}
				//PC was a taur:
				else if (target.isTaur())
				{
					output("Your bestial lower body is wracked with pain, and the mass of it starts convulsing, breaking apart at the seams. From the waist down, your body changes, becoming more and more humanoid as the minutes pass. When the transition ends, <b>you're left with bipedal legs,</b> distinctly human in appearance.\n\n");
					
					if (target.legType != GLOBAL.TYPE_BOVINE || !target.hasLegFlag(GLOBAL.FLAG_FURRED))
					{
						output("That's not enough for the drug, though. Not by a long shot! After a few moments, you see <b>thick, curly fur starts to grow on your new-grown legs</b>, covering them up to the upper thighs. At least you'll be warm in the winter!\n\n");
						target.legType = GLOBAL.TYPE_BOVINE;
						target.addLegFlag(GLOBAL.FLAG_FURRED);
					}
					target.genitalSpot = 0;					
					target.legCount = 2;
					target.legFlags = [];
					target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);

					if (target.hasLegFlag(GLOBAL.FLAG_HOOVES))
					{
						output("The bottoms of your legs take form: <b>rather than feet, they mutate into distinctly animalistic hooves.</b> You spend a good long while standing up and adjusting to your new gait, wobbling around until you get your footing. Or hoofing, as the case may be.\n\n");
						target.addLegFlag(GLOBAL.FLAG_HOOVES);
					}
				}
				//PC was bipedal already:
				else
				{
					output("You feel your [pc.legOrLegs] shifting, the [pc.skinFurScales] on them squirming and moving. After a few tense moments, <b>a thick coating of curly fur sprouts from your [pc.legOrLegs], covering them to the upper thigh</b>.");
					//if not already hooves: 
					if(!target.hasLegFlag(GLOBAL.FLAG_HOOVES)) output(" Your feet curl in, starting to become covered by a thick, black covering. You grunt and moan, rubbing your transforming body as your feet change. When they're done, <b>you have a pair of cow-like hooves!</b>.\n\n");
					target.legType = GLOBAL.TYPE_BOVINE;
					target.legFlags = [];
					target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
					target.addLegFlag(GLOBAL.FLAG_HOOVES);
					target.addLegFlag(GLOBAL.FLAG_FURRED);
				}
			}

			//Moderate chance of nipple size increase
			//Very small increments, up to 2 inches long.
			if (rand(6) == 0 && target.nippleLengthRatio < 2)
			{
				target.nippleLengthRatio += 0.1;
				changes++;
				
				output("You feel your nipples stretching, not quite painfully. A little [pc.milk] squirts out of the tips, worked out by the strange movements in your breasts. When they settle down, you realize that <b>your teats are larger now!</b>");
				if (target.nippleLengthRatio >= 1.5)
				{
					output(" Your [pc.nipples] are now almost udder-like in size");
					if (target.nipplesPerBreast == 4) output(", especially now that you have four nipples per teat");
					output(". You feel like a real cow now!");
				}
			}
			
			return changes;
		}
		
		private function t4Changes(target:Creature, tChanges:int):int
		{
			var changes:int = 0;
			
			//Moderate chance to increase vaginal wetness
			//Up to very wet.
			if (rand(6) == 0 && changes < tChanges && target.hasVagina() && target.driestVaginalWetness() <= 3)
			{
				for (var i:int = 0; i < target.vaginas.length; i++)
				{
					if ((target.vaginas[i] as VaginaClass).wetnessRaw <= 3) target.vaginas[i].wetness += 1;
				}
				
				changes++;
				
				output("You shiver as a lurid wetness seeps out of your [pc.cunts]. You");
				if(target.isBiped()) output(" cross your [pc.legs], groaning and");
				else output(" moan,");
				output(" rubbing a finger through the valley of ");
				if (target.vaginas.length > 1) output(" one of");
				output(" your slit");
				if (target.vaginas.length > 1) output("s");
				output(". Your digit comes away completely soaked! <b>You think your cunt will be much wetter from now on!</b>\n\n");
			}

			//High chance for increased Fertility
			if (rand(3) == 0 && changes < tChanges && target.hasVagina() && target.fertilityRaw < 2)
			{
				target.fertilityRaw += 0.1;
				changes++;
				
				output("Your Codex beeps to alert you that your fertility rating has increased, and delivers a short warning against having unprotected sex. You're much more likely to conceive now, even with alien creatures!\n\n");
			}

			//Low chance to increase libido
			//Increases by 8-16 points.
			if (rand(20) == 0 && changes < tChanges && target.libidoRaw <= 70)
			{
				target.libidoRaw += 3 + rand(5);
				changes++;
				
				output("Your bovine mutations leave you feeling lustier. Thoughts of big, hung bull-men pounding your [pc.vagOrAss], filling you with cum and draining your [pc.breasts] of all their [pc.milkNoun]. You shiver, wrapping your arms around yourself at the lusty day-dream. You're almost salivating as your mind wanders to images of being gangbanged, double-penetrated, suckled from, and in every way sexually used by ultra-hung boys.\n\n");

				if (target.hasVagina())
				{
					output("You look down after a few moments, and realize that your");
					if (target.isGroinCovered()) output(" [pc.lowerUnderGarments]");
					else output(" thighs");
					output(" are soaked in fem-cum. Did you just... cream yourself from daydreaming!?\n\n");
					output("\n\nHot!");
				}
			}

			return changes;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var tChanges:int = 2 + rand(2);
			var totalChanges:int = 0;
			var changes:int = 0;
			
			clearOutput();
			output("You take the small bottle labeled \"Bovinium\" out and crack it open. A single, small, cow-shaped gummy candy drops into your palm when you up-end it. You pick the bovine-themed treat up and squint at it: it's even got little black spots on its white mass, making it look just like a dairy cow. Is that it? It's cute, at least.");

			output("\n\nWell, here goes nothing! You give yourself an experimental \"moo!\" and down the transformative candy. It's sweet, and goes down easily. Tastes almost like milk, though tinged with a strange rusty flavor. Finished with your treat, you toss the bottle aside and wait for the changes to begin...\n\n");

			// T0 must happen before any others
			changes = t0Changes(target, tChanges);
			if (changes > 0) return false;
			
			// T1 must "complete" before the rest can kick in
			changes = t1Changes(target, tChanges);
			if (changes > 0) return false;

			// T2 on kinda bleed together, shit should be weighted towards T2 until all of T2 is complete, then T3 etc.
			changes = t2Changes(target, tChanges);
			totalChanges += changes;
			tChanges -= changes;
			
			if (tChanges > 0)
			{
				changes = t3Changes(target, tChanges);
				totalChanges += changes;
				tChanges -= changes;
			}
			
			if (tChanges > 0)
			{
				changes = t3Changes(target, tChanges);
				totalChanges += changes;
				tChanges -= changes;
			}
			
			return false;
		}
	}

}