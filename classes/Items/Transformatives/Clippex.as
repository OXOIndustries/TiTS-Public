package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.indefiniteArticle;
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
	
	public class Clippex extends ItemSlotClass
	{
		
		//constructor
		public function Clippex()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "Clippex";
			longName = "bottle of Clippex";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a bottle of Clippex";
			tooltip = "An early JoyCo attempt to engineer a milk production booster for mammalian mothers, the gene mod that came to be known as Clippex instead produced alarming changes in its test group’s nipples. Never one to throw away a potentially profitable mutagen simply because it reduced twenty women to tears, JoyCo marketed the drug as a specialist mod to those more interested in the erotic rather than nutritious potential of their breasts. It appears as a small, tubular bottle of white fluid with a sharp, solvent smell. The lid has a brush built into its underside for application.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 3600;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			kGAMECLASS.clearOutput();
			
			if(target is PlayerCharacter)
			{
				author("Nonesuch");
				
				kGAMECLASS.output("The sharp smell of the gene mod stings your nostrils as you undo the cap, unsheathe the oozing brush, and delicately apply the thick, white gloop to your [pc.nipples]. It quickly sinks into your skin. Your [pc.chest]");
				if(target.hasBreasts()) kGAMECLASS.output(" are");
				else kGAMECLASS.output(" is");
				kGAMECLASS.output(" left feeling rather tender");
				if(!target.isChestExposed()) kGAMECLASS.output(", the texture of your [pc.upperGarment] firmly engaging your attention");
				kGAMECLASS.output(".");
				
				//Add “Clippex effect” upon use. Lasts for five hours.
				
				var timerStamp:int = (5 * 60);
				
				if(target.hasStatusEffect("Clippex Gel"))
				{
					// If another dose taken when “Clippex effect” is up, run persistent dose effects.
					target.addStatusValue("Clippex Gel", 2, 1);
				}
				else
				{
					// "Clippex Gel"
					// v1: Timestamp!
					// v2: Dosage counter
					target.createStatusEffect("Clippex Gel", timerStamp, 1, 0, 0, false, "Pill", "Your nipples tingle by the gel you applied...", false, timerStamp,0xB793C4);
				}
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses the goo to no effect.");
			}
			return false;
		}
		
		// Lust increase:
		public static function ClippexLustIncrease(deltaT:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
		{
			// Number of potential lust increases that could occur this update
			var numProcs:int = Math.floor((Math.min(deltaT, effect.minutesLeft) + effect.value4) / 30);
			var firstProcOffset:int = kGAMECLASS.minutes + (30 - effect.value4);
			
			// Remainder of time to next potential proc stashed in v4
			effect.value4 = (effect.value4 + deltaT) - (numProcs * 30);
			
			if (numProcs == 0) return;
			
			for (var i:int = 0; i < numProcs; i++)
			{
				if (rand(5) < 2)
				{
					AddLogEvent(ParseText("<u>The Clippex drug has an effect....</u>\n\nYour breath catches in your throat as" + (!target.isChestExposed() ? " your [pc.nipples] rub against your [pc.upperGarment]" : " sensation twinges and nibbles through your [pc.nipple]") + ". They really are very tender right now..."), "passive", firstProcOffset + (30 * i));
					
					target.lust(5);
				}
			}
		}
		
		// This only triggers during removal afaik, so deltaT is kinda irrelevant
		public static function ClippexTF(deltaT:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
		{
			var isPlus:Boolean = effect.value2 > 1;
			
			var msg:String = "";
			var totalTFs:Number = 2;
			if(rand(2) == 0) totalTFs++;
			var select:int = 0;
			var x:int = 0;
			var i: int = 0;
			var smallestTitIndex:int = target.smallestTitRow();
			var nonCuntNipIndex:int = -1;
			var nonLippleNipIndex:int = -1;
			var removedTop:Boolean = false;
			
			for(i = 0; i < target.breastRows.length; i++)
			{
				if (target.breastRows[i].nippleType != GLOBAL.NIPPLE_TYPE_FUCKABLE) nonCuntNipIndex = i;
				if (target.breastRows[i].nippleType != GLOBAL.NIPPLE_TYPE_LIPPLES) nonLippleNipIndex = i;
			}
			
			//Build a list of all potential TFs
			var TFList:Array = new Array();
			//#1 If breasts < C cup, move towards C cup (inc. other rows)
			if(target.smallestTitSize() < 3)
				TFList.push(1);
			//#2 Increase size of nipples towards 3” by 0.5 per dose
			if(target.nippleLength(smallestTitIndex) < 3)
				TFList.push(2);
			//#3 If nipples 3”, morph to nipple cunts
			if(isPlus && target.nippleLength(smallestTitIndex) >= 1 && nonCuntNipIndex >= 0 && nonLippleNipIndex >= 0)
				TFList.push(3);
			//#4 If nipple cunts, morph to nipple mouths
			if(isPlus && nonCuntNipIndex < 0 && nonLippleNipIndex >= 0)
				TFList.push(4);
			
			// TF texts
			msg += "<u>The Clippex drug has an effect....</u>";
			var changed:Boolean = false;
			
			while(totalTFs > 0)
			{
				//Pick a TF	
				x = rand(TFList.length);
				select = TFList[x];
				//Cull 'dat TF from the list.
				TFList.splice(x,1);
				
				if(select == 0 && changed) { /* No new line */ }
				//else msg += "\n\n";
				
				//#0 Catch all
				if(select == 0 && !changed)
				{
					msg += ParseText("\n\nYour [pc.nipples] tingle for a brief moment but nothing seems to happen...");
					if((target.hasCuntNipples() || target.hasLipples()) && target.nippleLengthRatio >= 0.8 && target.smallestTitSize() >= 3)
					{
						msg += " Perhaps you already have the all the mutations the Clippex item has to offer.";
					}
					else msg += " Perhaps the Clippex you used is just a dud.";
					
					break;
				}
				//#1 If breasts < C cup, move towards C cup (inc. other rows)
				else if(select == 1)
				{
					if(target.breastRatingUnlocked(smallestTitIndex, (target.breastRows[smallestTitIndex].breastRatingRaw + 1)))
					{
						msg += "\n\nYou coo as soft flesh bulges into being on your chest, your bosom plumping out.";
						
						for(i = 0; i < target.breastRows.length; i++)
						{
							if (target.breastRows[i].breastRatingRaw < 3) target.breastRows[i].breastRatingRaw++;
						}
						// Increase breasts to D cup
						if(isPlus)
						{
							if(target.breastRatingUnlocked(smallestTitIndex, (target.breastRows[smallestTitIndex].breastRatingRaw + 1)))
							{
								msg += "\n\nEven more softness";
								if(!removedTop && !target.isChestExposed()) msg += " develops";
								else msg += " appears";
								msg += " below you, your already considerable rack increasing in size.";
								for(i = 0; i < target.breastRows.length; i++)
								{
									if (target.breastRows[i].breastRatingRaw < 3) target.breastRows[i].breastRatingRaw++;
								}
							}
						}
						changed = true;
					}
					else
					{
						msg += target.breastRatingLockedMessage();
					}
				}
				//#2 Increase size of nipples towards 3” by 0.5 per dose
				else if(select == 2)
				{
					var newNipLengthRatio:Number = target.nippleLengthRatio + 0.5;
					// Increase size of nipples towards 3” by 0.8 per dose
					if(isPlus) newNipLengthRatio = target.nippleLengthRatio + 0.8;
					
					if(target.nippleLengthRatioUnlocked(newNipLengthRatio))
					{
						if(!isPlus)
						{
							msg += ParseText("\n\nYou flinch as your [pc.nipples] engorge, becoming incredibly tender as they absorb fluid and bulk from your breasts proper. The sensation eventually passes - however");
							if(!removedTop && !target.isChestExposed()) msg += ParseText(" the feeling in your [pc.upperGarment]");
							else msg += " a glance down";
							msg += " tells you that your nipples have definitely gotten larger.";
						}
						else
						{
							msg += "You sigh as intense sensation surrounds your [pc.nipples], becoming erect and engorging irresistibly. It’s all you can do to keep your hands away from them. Eventually the beautiful tenderness subsides and";
							if(!removedTop && !target.isChestExposed())
							{
								msg += ", after removing your top,";
								removedTop = true;
							}
							msg += " you look down beatifically to see that your nipples have increased significantly in size.";
							// (+10 lust)
							target.lust(10);
						}
						target.nippleLengthRatio = newNipLengthRatio;
						changed = true;
					}
					else
					{
						msg += target.nippleLengthRatioLockedMessage();
					}
				}
				//#3 If nipples 3”, morph to nipple cunts
				else if(select == 3)
				{
					if(target.nippleTypeUnlocked(nonCuntNipIndex, GLOBAL.NIPPLE_TYPE_FUCKABLE))
					{
						if(!removedTop && !target.isChestExposed())
						{
							msg += ParseText("\n\nYour [pc.nipples] tingle powerfully and you are forced to remove your [pc.upperGarments]. ");
							removedTop = true;
						}
						else
						{
							msg += "\n\n";
						}
						msg += ParseText("You gasp as your nipples suddenly suck themselves inwards, like mouths pulling their lips in. Something wet and warm is happening within your [pc.chest]... when your breasts feel like they’ve finally relaxed you gingerly touch them. Your nipples have become “innies” – all that remains is " + indefiniteArticle(target.nippleColor) + ", horizontal slit in place of each. Experimentally, you sink a finger into one and sigh as a delicious sensation shimmers through your boob. They feel every bit as slick and sensitive inside as a vagina.");
						
						for(i = 0; i < target.breastRows.length; i++)
						{
							if (target.breastRows[i].nippleType != GLOBAL.NIPPLE_TYPE_FUCKABLE)
							{
								target.breastRows[i].nippleType = GLOBAL.NIPPLE_TYPE_FUCKABLE;
								// (+10 lust)
								target.lust(10);
							}
						}
						target.nippleLengthRatio = (Math.round(target.nippleLengthRatio * 0.25 * 100) / 100);
						if(target.nippleLengthRatio < 0.25) target.nippleLengthRatio = 0.25;
						changed = true;
					}
					else
					{
						msg += target.nippleTypeLockedMessage();
					}
				}
				//#4 If nipple cunts, morph to nipple mouths
				else if(select == 4)
				{
					if(target.nippleTypeUnlocked(nonLippleNipIndex, GLOBAL.NIPPLE_TYPE_LIPPLES))
					{
						if(!removedTop && !target.isChestExposed())
						{
							msg += ParseText("\n\nYour [pc.nipples] convulse powerfully and you are forced to remove your [pc.upperGarments]. ");
							removedTop = true;
						}
						else
						{
							msg += "\n\n";
						}
						msg += ParseText("You moan as the erotic sensation seizes your nipples, making them dribble fluid in excitement. It’s stronger than it was before, and you twitch and seize up as the entrances to your breasts seem to plump up, become wetter and even more sensitive. When the intensity of it has passed slightly you dare a look down. Each of your nipple cunts have transformed into two pairs of miniature lips: [pc.nippleColor], wet, bee-stung lips. You delicately touch them, and immediately they grasp your fingers, pulling them inwards to suckle them in – you moan again – the velvety insides of your breasts, which are every bit as sensitive and arousing as they were in their previous form. You pull away with some difficulty. They seem to have minds of their own!");
						
						for(i = 0; i < target.breastRows.length; i++)
						{
							if (target.breastRows[i].nippleType != GLOBAL.NIPPLE_TYPE_LIPPLES)
							{
								target.breastRows[i].nippleType = GLOBAL.NIPPLE_TYPE_LIPPLES;
								target.breastRows[i].clearAreolaFlags();
								//+10 lust, +3 Libido
								target.lust(10);
								target.slowStatGain("libido", 3);
							}
						}
						changed = true;
					}
					else
					{
						msg += target.nippleTypeLockedMessage();
					}
				}
				totalTFs--;
			}
			
			// Effect over:
			msg += ParseText("\n\nSomething feels like it’s disappeared. You touch your [pc.chest] absently and realize your [pc.nipples] are no longer constantly reminding you of their presence. It seems the tenderness the Clippex caused has finally calmed down.");
			if(removedTop) msg += ParseText(" You reclothe yourself, shivering at the new sensations your [pc.nipples] produce underneath the material....");
			
			AddLogEvent(msg, "passive");
			
			return;
		}
	}
}

