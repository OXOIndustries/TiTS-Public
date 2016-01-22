package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Hornitol extends ItemSlotClass
	{
		//constructor
		public function Hornitol()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "Hornitol";
			longName = "pill labeled Hornitol";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a pill labeled ‘Hornitol’";
			tooltip = "This is a large white pill comparable in size to a gumball. The labeling says that it contains microsurgeons that will cause the user to grow a horn, along with all of the raw material necessary to form the horn. The packaging warns that if the user has existing horns, they will likely be confused for usable raw material by the microsurgeons.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "";
			
			basePrice = 1500;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			// Initialize variables
			var bonus: Number = 0;
			kGAMECLASS.clearOutput();
			
			if(target is PlayerCharacter)
			{
				author("Couch");
				
				kGAMECLASS.output("You gulp down the pill with some difficulty, feeling a churning in your stomach as it rapidly breaks down");
				// PC does not have a horn:
				if(!target.hasHorns())
				{
					kGAMECLASS.output(".");
					if(target.hornsUnlocked(1))
					{
						kGAMECLASS.output(" Soon the sensation in your stomach passes, but a new sensation begins in your forehead, a thick pressure that thankfully comes without the migraine you feared. You check your appearance in your codex, watching as the [pc.skinFurScalesNoun] at your forehead stretches around a bulge underneath the flesh, slowly beginning to tear.");
						// 50% chance that the PC grows a three-inch rhinoceros-type horn.
						if(rand(2) == 0)
						{
							target.hornType = GLOBAL.TYPE_RHINO;
							target.horns = 1;
							target.hornLength = 3;
							kGAMECLASS.output("\n\nWhat emerges is a solid, slightly curved shaft of hard keratin, starting off quite thick at its base before tapering up to a sharp point. By the time the growth stops, <b>you have a three-inch rhinoceros-like horn!</b> Thankfully the microsurgeons also seem to adapt your head to holding the new weight.");
						}
						// 50% chance that the PC grows a four-inch spiral-type horn.
						else
						{
							target.hornType = GLOBAL.TYPE_NARWHAL;
							target.horns = 1;
							target.hornLength = 4;
							kGAMECLASS.output("\n\nWhat emerges comes out like a corkscrew, sporting a spiral pattern down its long, narrow length. It’s only about an inch in diameter even at the base, feeling so light you hardly notice the extra weight. By the time the growth finishes, <b>you have a four-inch unicorn-like horn!</b>");
						}
					}
					else kGAMECLASS.output("\n\n" + target.hornsLockedMessage());
				}
				// PC has horns of a type not granted by this item:
				else if(!target.hasHorns(GLOBAL.TYPE_RHINO) && !target.hasHorns(GLOBAL.TYPE_NARWHAL))
				{
					if(target.hornTypeUnlocked(GLOBAL.TYPE_RHINO) || target.hornTypeUnlocked(GLOBAL.TYPE_NARWHAL))
					{
						kGAMECLASS.output(", then followed shortly by a similar sensation in your [pc.horns]. Soon you feel");
						if(target.horns == 1) kGAMECLASS.output(" it");
						else kGAMECLASS.output(" them");
						kGAMECLASS.output(" begin to draw inward into your head, scrapped for raw materials by the microsurgeons that soon set to work redistributing all that recycled matter into the new, rapidly growing bulge at your forehead.");
						
						target.removeHorns();
						
						// 50% chance that the PC’s horn becomes a six-inch rhinoceros-type horn.
						if(rand(2) == 0)
						{
							target.hornType = GLOBAL.TYPE_RHINO;
							target.horns = 1;
							target.hornLength = 6;
							kGAMECLASS.output("\n\nWhat emerges is a solid, slightly curved shaft of hard keratin, starting off quite thick at its base before tapering up to a sharp point. By the time the growth stops, <b>you have a six-inch rhinoceros-like horn!</b> Thankfully the microsurgeons also seem to adapt your head to holding the new weight.");
						}
						// 50% chance that the PC’s horn becomes an eight-inch spiral-type horn.
						else
						{
							target.hornType = GLOBAL.TYPE_NARWHAL;
							target.horns = 1;
							target.hornLength = 8;
							kGAMECLASS.output("\n\nWhat emerges comes out like a corkscrew, sporting a spiral pattern down its long, narrow length. It’s only about an inch in diameter even at the base, feeling so light you hardly notice the extra weight. By the time the growth finishes, <b>you have an eight-inch unicorn-like horn!</b>");
						}
					}
					else kGAMECLASS.output(".\n\n" + target.hornTypeLockedMessage());
				}
				// PC has rhino horn, rare chance to multiply horns:
				else if(target.hasHorns(GLOBAL.TYPE_RHINO) && ((target.horns < 5 && rand(5) == 0) || (target.horns < 9 && rand(10) == 0)))
				{
					kGAMECLASS.output(".");
					
					var newHorns:Number = 1;
					if(target.horns >= 3) newHorns++;
					
					if(target.hornsUnlocked(target.horns + newHorns))
					{
						kGAMECLASS.output(" Suddenly, there is a tingling sensation in [pc.eachHorn], building up and then spreading across your [pc.face]...");
						if(target.horns == 1)
						{
							kGAMECLASS.output("\n\nYou feel the horn on your forehead shrink smaller and smaller as two buds of keratin form at the bridge of your nose. Your single horn seems to be displacing much of its mass atop your nose until it is completely gone and you’re left with two horns total standing proud on your nose. The forward-most horn is much longer than the one behind it, making you look much more like a rhinoceros. <b>You now have two rhino horns!</b>");
							
							target.hornLength = Math.ceil(target.hornLength * (3/4));
						}
						else if(target.horns == 2)
						{
							if(target.hornLength < 12) target.hornLength = 12;
							
							kGAMECLASS.output("\n\nThe keratin forming your smallest horn shrinks and disappears, its mass tranferring towards two points on your forehead, one over each brow. The feeling builds as the bumps grow into much longer horns. As the tingling subsides, the weighty horns adopt a kind of aged, bone-like texture to them, making them appear to be from some ancient dinosaur than a rhinoceros. In any case, <b>you realize that you now have three rhino horns!</b>");
						}
						else kGAMECLASS.output("\n\nYour head aches momentarily as you feel new protrusions grow from your skull. The feeling is powerful, though not painful, and after it finally washes away, you check your image on your Codex to reveal that <b>you have gained two more horns!</b>");
						
						target.horns += newHorns;
					}
					else kGAMECLASS.output("\n\n" + target.hornsLockedMessage());
				}
				// PC has one of the horn types granted by this item:
				else if((target.hornType == GLOBAL.TYPE_RHINO && target.hornLength < 48) || (target.hornType == GLOBAL.TYPE_NARWHAL && target.hornLength < 60))
				{
					kGAMECLASS.output(".");
					
					// Random value for bonus length.
					bonus = (rand(3) + 1);
					// Apply bonus length...
					// No, no. No-no-no-no. THERE'S NO LIMIT!
					
					if(target.hornLengthUnlocked(target.hornLength + bonus))
					{
						kGAMECLASS.output(" You feel the microsurgeons carry the material to your horn, setting to work on remodeling it.");
						// 80% chance that PC’s horn grows an additional 1-3 inches.
						if(rand(5) != 0 || target.horns > 1)
						{
							target.hornLength += bonus;
							kGAMECLASS.output("\n\nYou feel a light pressure in your forehead as the new material is added to your [pc.horns], <b>giving you " + kGAMECLASS.num2Text(bonus) + " extra inch");
							if(bonus != 1) kGAMECLASS.output("es");
							kGAMECLASS.output(" of [pc.hornNoun] by the time the changes are done.</b>");
						}
						// 20% chance that the horn type switches to the other type instead.
						else
						{
							// Rhino to Unicorn
							if(target.hornType == GLOBAL.TYPE_RHINO)
							{
								target.hornType = GLOBAL.TYPE_NARWHAL;
								kGAMECLASS.output("\n\nAs you watch in your codex, the horn gains a set of spiral-shaped grooves along its length, becoming thinner as it straightens out. It feels slender and light, but also graceful. <b>You now have a unicorn-like horn!</b>");
							}
							// Unicorn to Rhino
							else
							{
								target.hornType = GLOBAL.TYPE_RHINO;
								kGAMECLASS.output("\n\nAs you watch in your codex, the horn’s spiral-shape fills in as it turns smooth and thick relative to its old appearance, gaining a slight upward curve to its shape. It feels thick and heavy, but also powerful and dangerous. <b>You now have a rhinoceros-like horn!</b>");
							}
						}
					}
					else kGAMECLASS.output("\n\n" + target.hornLengthLockedMessage());
				}
				// Failsafe, something is wrong here...
				else
				{
					kGAMECLASS.output(". Aside from that, you don’t feel any other effect from the pill at all...");
				}
			}
			//Not the player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " swallows the pill to no effect.");
			}
			return false;
		}
	}
}

