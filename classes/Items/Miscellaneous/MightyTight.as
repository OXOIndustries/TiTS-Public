package classes.Items.Miscellaneous
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.indefiniteArticle;
	import classes.Engine.Utility.num2Ordinal;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class MightyTight extends ItemSlotClass
	{
		public function MightyTight()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "M.Tight";
			longName = "Mighty Tight pill";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a package containing a pill of Mighty Tight";
			
			tooltip = "This is a colorfully-packaged box featuring some holovid sales girl.";
			if(!kGAMECLASS.silly) tooltip += " Equally colorful lettering informs you that this is an after-sex drug which tightens vaginas and asses that have gotten stretched out by too much attention or excessively hung playmates.";
			else tooltip += "\n\n<i>“Hi, Milly Bayes here with Mighty Tight! Gotten knotted one too many times? Stopped by New Texas and ran with the bulls? Do you feel like you’re just worn out down there? J’ejune Pharmaceutical has your back with Mighty Tight! Mighty Tight is guaranteed to tighten your cooch, leaving you fresh and ready to party some more! Not only that, Mighty Tight works on asses too! Put the squeeze on your playmates with Mighty Tight!”</i>";
			tooltip += "\n\nBelow this, in much smaller text, is a warning informing you <b>not to take Mighty Tight more than twice every four hours</b>. It also lists off a long string of minor potential side effects. Within the colorful packaging is a dull pink pill.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 300;
			
			version = _latestVersion;
		}
		private function useAddDose(target:Creature):void
		{
			target.addStatusValue("Mighty Tight", 1, 1);
			target.setStatusMinutes("Mighty Tight", 240);
		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			//Effects
			//When used as directed:
			//Reduce looseness of all of the PC’s holes by 1, to a minimum of their respective minLooseness. If no holes can be reduced this way, dud result.
			
			//Overdose:
			//Reduce looseness of all of the PC’s holes by 1, to a minimum of 0. If a hole is reduced below its normal minLooseness by this, reduce the minLooseness of that hole by 1. If a vagina, but not an asshole, is already at looseness 0, remove it instead. Leave one vagina if removing it would leave the character genderless.
			
			kGAMECLASS.clearOutput();
			author("Couch");
			kGAMECLASS.showName("MIGHTY\nTIGHT");
			
			//Consumption Text
			var pc:Creature = target;
			var x:int = 0;
			var i:int = 0;
			
			if(target == kGAMECLASS.pc)
			{
				// Define the smallest possible hole size:
				// Not sure if 'game.as' supports decimal values for this multiplier, so leaving it at 1 for now...
				var smallestLooseness:Number = 0.5;
				
				// Find total number of holes!
				// Anus
				var holes:Number = 1;
				// Vaginas
				if(pc.hasVagina()) holes += pc.totalVaginas();
				
				// Find gapest vagina index!
				var tinyVaginas:Array = [];
				// Find tightest vagina index!
				var tightestVaginaIndex:int = 0;
				if(holes != 1)
				{
					for(i = 1; i < pc.vaginas.length; i++)
					{
						if(pc.vaginas[i].minLooseness <= smallestLooseness) tinyVaginas.push(i);
						if(pc.vaginas[i].minLooseness < pc.vaginas[tightestVaginaIndex].minLooseness) tightestVaginaIndex = i;
					}
				}
				
				var myBodyIsReady:Boolean = ((holes > 1) || (pc.ass.loosenessRaw > smallestLooseness));
				
				// When using as directed:
				if(!pc.hasStatusEffect("Mighty Tight") && myBodyIsReady)
				{
					kGAMECLASS.output("You swallow the pill of Mighty Tight, feeling your hole");
					if(holes != 1) kGAMECLASS.output("s");
					kGAMECLASS.output(" clench on");
					if(holes != 1) kGAMECLASS.output(" their");
					else kGAMECLASS.output(" its");
					kGAMECLASS.output(" own as the pill gets to work.");
					if(holes != 1) kGAMECLASS.output(" They");
					else kGAMECLASS.output(" It");
					kGAMECLASS.output(" soon relax, but you feel noticeably smaller than before. <b>You’ve definitely gotten tighter.</b>");
					
					// Anus
					if(pc.ass.loosenessRaw > smallestLooseness) pc.ass.loosenessRaw--;
					if(pc.ass.loosenessRaw < smallestLooseness) pc.ass.loosenessRaw = smallestLooseness;
					
					// Vaginas
					if(holes != 1)
					{
						for(x = 0; x < pc.vaginas.length; x++)
						{
							if(pc.vaginas[x].loosenessRaw > smallestLooseness) pc.vaginas[x].loosenessRaw--;
							if(pc.vaginas[x].loosenessRaw < smallestLooseness) pc.vaginas[x].loosenessRaw = smallestLooseness;
						}
					}
					
					pc.createStatusEffect("Mighty Tight", 1, 0, 0, 0, true, "", "", false, 240);
				}
				// Second time in four hours:
				else if(pc.hasStatusEffect("Mighty Tight") && pc.statusEffectv1("Mighty Tight") <= 1 && myBodyIsReady)
				{
					kGAMECLASS.output("That’s the " + num2Ordinal(target.statusEffectv1("Mighty Tight") + 1) + " one you’ve taken, and the clenching feeling was noticeably stronger this time. <b>You probably shouldn’t take another one of these until your body finishes flushing it out of your system, or who knows what could happen.</b> <i>Maybe give it about four hours from now...</i>");
					
					useAddDose(pc);
				}
				// Overdose:
				else if(pc.hasStatusEffect("Mighty Tight") && (holes > 1 || (pc.ass.minLooseness > smallestLooseness)))
				{
					kGAMECLASS.output("Ignoring the directions, you take " + indefiniteArticle(num2Ordinal(target.statusEffectv1("Mighty Tight") + 1)) + " Mighty Tight. This time the clenching in your hole");
					if(holes != 1) kGAMECLASS.output("s");
					kGAMECLASS.output(" is painful, as if being crushed from the outside into a smaller shape.");
					
					// Vagina
					if(holes != 1 && rand(2) == 0)
					{
						if(tinyVaginas.length > 0) tightestVaginaIndex = tinyVaginas[rand(tinyVaginas.length)];
						
						// Shrink vagina and reduce minLooseness:
						if(pc.vaginas[tightestVaginaIndex].minLooseness > smallestLooseness)
						{
							kGAMECLASS.output("\n\nBy the time [pc.eachVagina] relaxes, it feels like you’ve gotten smaller than you normally could no matter how much you let it recover.");
							
							for(x = 0; x < pc.vaginas.length; x++)
							{
								if(pc.vaginas[x].minLooseness >= 2) pc.vaginas[x].minLooseness--;
								else pc.vaginas[x].minLooseness *= 0.5;
								if(pc.vaginas[x].minLooseness < smallestLooseness) pc.vaginas[x].minLooseness = smallestLooseness;
							}
						}
						// Remove vagina:
						else if(pc.removeVaginaUnlocked(tightestVaginaIndex))
						{
							kGAMECLASS.output("\n\nThe pain sharply spikes, then abruptly fades. Checking your groin, you find the offending hole has completely disappeared!");
							
							pc.removeVagina(tightestVaginaIndex);
							
							if(pc.totalVaginas() > 0)
							{
								kGAMECLASS.output(" <b>You only have " + kGAMECLASS.num2Text(pc.totalVaginas()) + " vagina");
								if(pc.totalVaginas() != 1) kGAMECLASS.output("s");
								kGAMECLASS.output(" now!</b>");
							}
							else
							{
								kGAMECLASS.output(" <b>Your vagina");
								if(holes > 2) kGAMECLASS.output("s are");
								else kGAMECLASS.output(" is");
								kGAMECLASS.output(" completely gone!</b>");
							}
							kGAMECLASS.output(" Thankfully your ass relaxes without incident.");
						}
						// Can't remove vagina!
						else kGAMECLASS.output("\n\n" + pc.removeVaginasLockedMessage());
					}
					// Anus
					else if(pc.ass.minLooseness > smallestLooseness)
					{
						// Shrink ass and reduce minLooseness:
						kGAMECLASS.output("\n\nBy the time your ass finishes relaxing, it feels tighter than it could have gotten by just letting it rest.");
						
						if(pc.ass.minLooseness >= 2) pc.ass.minLooseness--;
						else pc.ass.minLooseness *= 0.5;
						if(pc.ass.minLooseness < smallestLooseness) pc.ass.minLooseness = smallestLooseness;
					}
					// Dud:
					else kGAMECLASS.output("\n\nThankfully, your body soon relaxes. That was painful, but it doesn’t seem to have affected you.");
					
					pc.removeStatusEffect("Mighty Tight");
				}
				// When using as directed, dud result:
				else
				{
					kGAMECLASS.output("You swallow the pill of Mighty Tight, feeling your hole");
					if(holes != 1) kGAMECLASS.output("s");
					kGAMECLASS.output(" clench on");
					if(holes != 1) kGAMECLASS.output(" their");
					else kGAMECLASS.output(" its");
					kGAMECLASS.output(" own as the pill gets to work, but immediately relax. You guess you can’t get any tighter than you already are");
					// second time in four hours:
					if(pc.hasStatusEffect("Mighty Tight"))
					{
						kGAMECLASS.output(", and you really shouldn’t take another right now anyway");
						useAddDose(pc);
					}
					kGAMECLASS.output(".");
				}
			}
			else
			{
				kGAMECLASS.output(target.short + " consumes the pill to no effect.");
			}	
			return false;
		}
	}
}
