package classes.Items.Transformatives 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
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
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			output("You take the small bottle labeled \"Bovinium\" out and crack it open. A single, small, cow-shaped gummy candy drops into your palm when you up-end it. You pick the bovine-themed treat up and squint at it: it's even got little black spots on its white mass, making it look just like a dairy cow. Is that it? It's cute, at least.");

			output("\n\nWell, here goes nothing! You give yourself an experimental \"moo!\" and down the transformative candy. It's sweet, and goes down easily. Tastes almost like milk, though tinged with a strange rusty flavor. Finished with your treat, you toss the bottle aside and wait for the changes to begin...\n\n");
			
			var doneChange:Boolean = false;
			
			if (target.faceType != GLOBAL.TYPE_HUMAN || target.skinType != GLOBAL.SKIN_TYPE_SKIN)
			{
				output("The first thing you feel after ingesting the treat is an odd calmness that falls over you. A passivity and complacency that makes you want to just sit down and... chew greens? You blink, scowling at yourself for thinking that. What the hell?\n\n");

				//if PC has non-human skin:
				if (target.skinType != GLOBAL.SKIN_TYPE_SKIN && target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
				{
					output("Your [pc.skinFurScales] start to itch powerfully. It starts as an annoyance, making you rub at an errant patch of your inhuman flesh, but the sensations spread and intensify.");
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
					doneChange = true;
					
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
					doneChange = true;
				}
				else
				{
					output("\n\n" + target.faceTypeLockedMessage());
					doneChange = true;
				}
			}
			else
			{
				var doneCockChangeText:Boolean = false;
				
				if (target.hasCock())
				{
					var tCocks:Array = [];
					var cCocks:Array = [];
					
					// Cocks longer than 4" shrink
					for (i = 0; i < target.cocks.length; i++)
					{
						if (target.cocks[i].cLengthRaw > 4) tCocks.push(i);
					}
					
					if (tCocks.length > 0)
					{
						doneCockChangeText = true;
						
						//Lose maybe 1d4+1 inches each time?
						output("A bolt of... not quite pain, but certainly not pleasure races up your spine! You clutch your crotch, the source of your discomfort,");
						if (!target.isNude()) output(" and strip away your [pc.gear] to reveal");
						else output(" and look down to see");
						output(" that your [pc.cockBiggest] is shrinking, receedinging back into your crotch!");
						
						for (i = 0; i < tCocks.length; i++)
						{
							var tCock:int = tCocks[i];
							var nLength:Number = target.cocks[tCock].cLengthRaw;
							var lLoss:Number = rand(5) + 2;
							
							nLength -= lLoss;
							
							if (nLength < 3)
							{
								lLoss += 3 - nLength;
							}
							
							if (target.cockLengthUnlocked(tCock, nLength))
							{
								target.cocks[tCock].cLengthRaw = nLength;
								cCocks.push(tCock);
							}
						}
					
						if (cCocks.length == 0)
						{
							output(" " + target.cockLengthLockedMessage() + "\n\n");
						}
						else if (cCocks.length > 1)
						{
							output(" Instinctively, you desperately clutch at your shortening lengths, trying to prevent the loss -- but your body is adamant, spurred on by the Bovinium candy. By the time the loss is done, you're certain that <b>your cocks have shrunk " + lLoss + " inches!</b>\n\n");
						}
						else
						{
							output(" Instinctively, you desperately clutch at your shortening length, trying to prevent the loss -- but your body is adamant, spurred on by the Bovinium candy. By the time the loss is done, you're certain that <b>your cock has shrunk " + lLoss +" inches!</b>\n\n");
						}
					
						//Cocks shorter than 4" have a chance to be removed.
						tCocks = [];
						
						for (i = 0; i < target.cocks.length; i++)
						{
							if (cCocks.indexOf(i) != -1) continue; // If a cock was shrunk this item use, skip it
							if (target.cocks[i].cLengthRaw <= 4) tCocks.push(i);
						}
						
						cCocks = []; // clear the configured cocks for it
						
						if (tCocks.length > 0)
						{
							for (i = 0; i < tCocks.length; i++)
							{
								if (rand(4) == 0) continue;
								
								tCock = tCocks[i];
								if (target.removeCockUnlocked(tCock, 1)) cCocks.push(tCock);
							}
						}
						
						if (tCocks.length > 0)
						{
							if (!doneCockChangeText)
							{
								output("A bolt of... not quite pain, but certainly not pleasure races up your spine! You clutch your crotch, the source of your discomfort,");
								if (!pc.isNude()) output(" and strip away your [pc.gear] to reveal");
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
								for (i = 0; i < cCocks.length; i++)
								{
									cocksRemoved = true;
									doneChange = true;
									target.removeCock(cCocks[i], 1);
								}
								
								if (target.hasCock()) 
								{
									output(" with " + num2Text(cCocks.length) +" less cock");
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
							doneChange = true;
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
						doneChange = true;
					}
				}
				
				// Genderless autoacquires vagina
				if (!target.hasCock() && !target.hasVagina() || (!target.hasVagina() && rand(4) > 0))
				{
					output("You feel a lance of point, absolutely agonizing, shoot through your body from the crotch. You double over, barely able to keep standing. Fuck that hurts!");

					output("\n\nYou reach a hand down, brushing it along your {bare }crotch, and find an unsettling wetness clinging to your groin. Your fingers explore further, and find a cut gaping in your [pc.skin], growing deeper. The pangs of agony start to abate, replaced by something approaching pleasure as your fingers explore this new cleft in your groin. Your find a small lump near to top, and a single touch of it sends shivers of ecstasy through you. As your explore the new hole in your body, you quickly come to the realization that <b>you now have a vagina</b>!\n\n");
					
					target.createVagina();
					target.clitLength = 0.5;
					doneChange = true;
				}
				
				if (target.femininity < 75 && target.femininityUnlocked(target.femininity + 5))
				{
					var startMF:String = target.mfn("m", "f", "n");
					
					output("You feel a slight change in your facial structure -- your lips become a bit more pronounced, your eyelashes grow a bit, your nose becomes a little cuter. Many subtle, small changes occur over the course of a minute or so. When they finish, <b>you feel much more feminine</b>!");
					
					target.femininity += 5;
					doneChange = true;
					
					if (startMF != target.mf("m", "f")) output(" <b>You're now sure anybody who so much as glanced at you would think you're a female.</b>\n\n");
				}
				
				if (doneChange) return; // Stop here if any of the primary gender/genital changes took place.
				
				// Second Tier
				
				// Boobicles
				if (target.biggestTitSize() < 
				
				
			}
		}
	}

}