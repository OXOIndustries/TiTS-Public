package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.num2Ordinal;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class BumpyRoad extends ItemSlotClass
	{
		
		public function BumpyRoad()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "BumpyRd.";
			longName = "Bumpy Road";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a long injector called ‘Bumpy Road’";
			tooltip = "This product is part of a series made after polling results revealed that a large amount of dominatrixes desired to make their subs even more sensitive. Originally, it was made to only be used on male genitals, but after several complaints it was upgraded to affect both genders equally. This injector contains a mix of nanomachines and lipids that, when injected into the genitals, will grow a nub with sensitive nerve clusters at the spot it was applied.\n\nA really tiny disclaimer warns you that J’ejune Pharmaceutical will not be held accountable if the sensitivity disappears after the initial transformation.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 2500;
			
			version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Lashcharge");
			
			if(target is PlayerCharacter)
			{
				var i:int = -1;
				var x:int = 0;
				var btnSlot:int = 0;
				var nonNubbyCocks:Array = [];
				var nonNubbyCunts:Array = [];
				var nonNubbyTotal:int = 0;
				
				// Scan genitals
				if(target.hasCock())
				{
					for(i = 0; i < target.cocks.length; i++)
					{
						if(!target.cocks[i].hasFlag(GLOBAL.FLAG_NUBBY))
						{
							nonNubbyCocks.push(i);
							nonNubbyTotal++;
						}
					}
				}
				if(target.hasVagina())
				{
					for(i = 0; i < target.vaginas.length; i++)
					{
						if(!target.vaginas[i].hasFlag(GLOBAL.FLAG_NUBBY))
						{
							nonNubbyCunts.push(i);
							nonNubbyTotal++;
						}
					}
				}
				
				if(nonNubbyTotal <= 0)
				{
					if(!kGAMECLASS.infiniteItems()) quantity++;
					if(target.hasGenitals()) kGAMECLASS.output("It seems your genitals are as nubby as they can be already, so you really don’t need to use this without the risk of complications.");
					else kGAMECLASS.output("Unfortunately, you do not have any valid genitalia to use this on.");
					kGAMECLASS.output("\n\nYou put the item back in your inventory.");
					return false;
				}
				else if(nonNubbyTotal == 1 && nonNubbyCocks.length == 1)
				{
					cockTF([target, nonNubbyCocks[0]]);
					return true;
				}
				else if(nonNubbyTotal == 1 && nonNubbyCunts.length == 1)
				{
					cuntTF([target, nonNubbyCunts[0]]);
					return true;
				}
				
				kGAMECLASS.output("You have more than one eligible genital. Which one will you inject with Bumpy Road?\n");
				
				kGAMECLASS.clearMenu();
				if(nonNubbyCocks.length > 0)
				{
					if(target.cocks.length == 1)
					{
						output("\n<b>Cock:</b>");
						if(target.cocks[0].cockFlags.length > 0)
						{
							for(x = 0; x < target.cocks[0].cockFlags.length; x++)
							{
								output(" " + GLOBAL.FLAG_NAMES[target.cocks[0].cockFlags[x]] + ",");
							}
						}
						if(target.cocks[0].cockColor != "") output(" " + StringUtil.toDisplayCase(target.cocks[0].cockColor) + ",");
						output(" " + GLOBAL.TYPE_NAMES[target.cocks[0].cType]);
						
						addButton(btnSlot, "Cock", cockTF, [target, 0], "Cock", "Use this on your [pc.cock " + 0 + "].");
						btnSlot++;
					}
					else
					{
						for(i = 0; i < nonNubbyCocks.length; i++)
						{
							output("\n<b>" + StringUtil.capitalize(num2Ordinal(nonNubbyCocks[i] + 1)) + " Cock:</b>");
							if(target.cocks[nonNubbyCocks[i]].cockFlags.length > 0)
							{
								for(x = 0; x < target.cocks[nonNubbyCocks[i]].cockFlags.length; x++)
								{
									output(" " + GLOBAL.FLAG_NAMES[target.cocks[nonNubbyCocks[i]].cockFlags[x]] + ",");
								}
							}
							if(target.cocks[nonNubbyCocks[i]].cockColor != "") output(" " + StringUtil.toDisplayCase(target.cocks[nonNubbyCocks[i]].cockColor) + ",");
							output(" " + GLOBAL.TYPE_NAMES[target.cocks[nonNubbyCocks[i]].cType]);
							
							addButton(btnSlot, "Cock " + (nonNubbyCocks[i] + 1), cockTF, [target, nonNubbyCocks[i]], StringUtil.capitalize(num2Ordinal(nonNubbyCocks[i] + 1)) + " Cock", "Use this on your [pc.cock " + nonNubbyCocks[i] + "].");
							btnSlot++;
						}
					}
				}
				if(nonNubbyCunts.length > 0)
				{
					if(target.vaginas.length == 1)
					{
						output("\n<b>Vagina:</b>");
						if(target.vaginas[0].vagooFlags.length > 0)
						{
							for(x = 0; x < target.vaginas[0].vagooFlags.length; x++)
							{
								output(" " + GLOBAL.FLAG_NAMES[target.vaginas[0].vagooFlags[x]] + ",");
							}
						}
						if(target.vaginas[0].vaginaColor != "") output(" " + StringUtil.toDisplayCase(target.vaginas[0].vaginaColor) + ",");
						output(" " + GLOBAL.TYPE_NAMES[target.vaginas[0].type]);
						
						addButton(btnSlot, "Vagina", cuntTF, [target, 0], "Vagina", "Use this on your [pc.vagina " + 0 + "].");
						btnSlot++;
					}
					else
					{
						for(i = 0; i < nonNubbyCunts.length; i++)
						{
							output("\n<b>" + StringUtil.capitalize(num2Ordinal(nonNubbyCunts[i] + 1)) + " Vagina:</b>");
							if(target.vaginas[nonNubbyCunts[i]].vagooFlags.length > 0)
							{
								for(x = 0; x < target.vaginas[nonNubbyCunts[i]].vagooFlags.length; x++)
								{
									output(" " + GLOBAL.FLAG_NAMES[target.vaginas[nonNubbyCunts[i]].vagooFlags[x]] + ",");
								}
							}
							if(target.vaginas[nonNubbyCunts[i]].vaginaColor != "") output(" " + StringUtil.toDisplayCase(target.vaginas[nonNubbyCunts[i]].vaginaColor) + ",");
							output(" " + GLOBAL.TYPE_NAMES[target.vaginas[nonNubbyCunts[i]].type]);
							
							addButton(btnSlot, "Vagina " + (nonNubbyCunts[i] + 1), cuntTF, [target, nonNubbyCunts[i]], StringUtil.capitalize(num2Ordinal(nonNubbyCunts[i] + 1)) + " Vagina", "Use this on your [pc.vagina " + nonNubbyCunts[i] + "].");
							btnSlot++;
						}
					}
				}
				return true;
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " injects the Bumpy Road transformative but to no effect.");
			}
			return false;
		}
		private function cockTF(arg:Array):void
		{
			clearOutput();
			kGAMECLASS.showName("BUMPY\nROAD");
			author("Lashcharge");
			
			var target:Creature = arg[0];
			var i:int = arg[1];
			var hasUnderwear:Boolean = (target.hasLowerGarment() && !target.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL));
			
			output("You");
			if(!target.isCrotchExposed())
			{
				if(target.hasArmor()) output(" take off your [pc.armor]");
				if(hasUnderwear)
				{
					if(target.hasArmor()) output(",");
					output(" pull down your [pc.lowerUndergarment]");
				}
				output(" and");
			}
			output(" stroke your [pc.cock " + i + "] to erection. Grabbing the injector from its pack, you place it on the shaft, right where you want a nub to grow. Clicking the button, you feel a tiny needle prick the skin. To your surprise it isn’t painful, just mildly uncomfortable. You move to the next spot and inject it again, in symmetry with the previous, making sure to avoid the head and [pc.knot] of your cock. Once it runs out you discard the injector and patiently wait for the nanomachines to begin their work.");
			output("\n\nTeasing your [pc.cockHead " + i + "] to make sure you remain at full mast, you wait a few good minutes before the first nub starts to appear. The spot where you initially injected suddenly grows painful, the flesh twisting and swelling into a small bump. It soon plumps up as more and more pulsating prickles begin sprouting all around your shaft. You sigh in relief as the pain stops and the lumps finish their growth. That’s as large as they’re gonna get.");
			output("\n\nTouching one of the nubs leaves you frowning, realizing that you can’t feel anything through them. You were promised sensitive nubs... these are nothing more than balls of spongy meat! Before you can think of complaining any further, a sudden rush of blood fills your turgid length - more firm and plump than ever before. The nodules light up in pain as new nerves begin to grow within them. Bringing a finger to the first nub, you gently massage it against your shaft and it answers back with an overwhelming wave of pleasure. Each nub grows a set of nerve clusters and hot damn are they sensitive! You can’t hold it anymore and fully grab your meat, stroking it as gently as you can, feeling the receptive buds against the");
			if(target.hasPaddedHands()) output(" pads");
			else output(" palm");
			output(" of your hands. Each time your fingers glide against a nub your [pc.cock] throbs in response, sending new, powerful sensations directly through your body. <b>Your cock is now covered in nubs.</b>");
			output("\n\nYou reach your limit and shoot the first load of your newly-modded dick. The bumps continue to entice you and you can’t even stop gently beating your dick as you cum, each string of [pc.cum] shooting from the cumslit onto the floor below.");
			if(hasUnderwear) output(" Once your climax ends you pull up your [pc.lowerGarments] and wince as the fabric rubs against your new-found sensitivity, almost triggering a second orgasm.");
			output(" You give the nubbed cock a quick rub");
			if(hasUnderwear) output(" through the underwear");
			output(" as you gear up, barely resisting plugging your altered maleness in the next hole you see. This ought to be quite fun.");
			
			target.cocks[i].addFlag(GLOBAL.FLAG_NUBBY);
			target.orgasm();
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		private function cuntTF(arg:Array):void
		{
			clearOutput();
			kGAMECLASS.showName("BUMPY\nROAD");
			author("Lashcharge");
			
			var target:Creature = arg[0];
			var i:int = arg[1];
			var hasUnderwear:Boolean = (target.hasLowerGarment() && !target.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL));
			
			output("You");
			if(!target.isCrotchExposed())
			{
				if(target.hasArmor()) output(" take off your [pc.armor]");
				if(hasUnderwear)
				{
					if(target.hasArmor()) output(",");
					output(" pull down your [pc.lowerUndergarment]");
				}
				output(" and");
			}
			output(" ponder how you are going to do this. Better get started with the lips. Using your fingers to spread your snatch, you jam the needle on the labia, right where you want one of the nubs to grow. You feel the tiny needle prick the skin.... <i>Oh...</i> this is far more pleasurable than it should be.");
			output("\n\nYou continue injecting your labia until you are satisfied, then you aim the needle inside and guide it into your vulva. The tip rubs on the wall as you adjust the injector inside your [pc.vagina " + i + "], moving it around to find the right place to inject it. As you move the needle to the next spot, you grow more and more aroused with each injection and soon realize that you are also using the injector as a dildo. When the first few bumps begin to grow outside your vagina, you cum, releasing a few squirts of [pc.girlCum], covering your hands and the injector in it. You feel a sudden rush of pleasure as the affected spots on your lady lips begin to twist and swell into nodules. The friction of your hands against each nub triggers another wave of pleasure. If this keeps up, you’re not even sure if you can finish before cumming again.");
			output("\n\nYou inject the inside of your [pc.vaginaNoun " + i + "] again and again, relishing the pleasurable prickles spreading all around its interior. As soon as you finish your work on the inside, you prepare to remove the injector, only to find that you can’t will your hand away despite your mind’s urgings. Falling on your back, you truly begin to use the injector as a dildo, putting your fingers in a V-shape and proceeding to rub them against the newly-nubbed lips. The next wave comes even stronger than before, triggered by the nerves growing inside each bud, becoming fatter and more sensitive with each passing second. <b>Your vagina is now covered in nubs.</b>");
			output("\n\nYou discard the needle and shove your hand in your vagina, testing the new sensitivity of each protrusion. It’s not long before you reach another mind-blowing climax, squirting a big dose of [pc.girlcum] all over your arm and hands, and even the floor.");
			if(hasUnderwear) output(" Once your climax ends you pull up your [pc.lowerGarments], the fabric rubbing against your new nubs.");
			output(" While rubbing your lips");
			if(hasUnderwear) output(" through the fabric");
			output(", you drool at the thought of how good it will feel to get penetrated by an actual dick.");
			
			target.vaginas[i].addFlag(GLOBAL.FLAG_NUBBY);
			target.orgasm();
			target.orgasm();
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
	}
}
