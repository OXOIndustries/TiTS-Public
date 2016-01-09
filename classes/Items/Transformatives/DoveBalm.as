package classes.Items.Transformatives 
{
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	
	public class DoveBalm extends ItemSlotClass
	{
		//constructor
		public function DoveBalm()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.DRUG;
			
			shortName = "Dove Balm";
			longName = "tube of Dove Balm";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a tube of Dove Balm";
			
			tooltip = "This is a small tube filled with a white microsurgeon-laced gel, to be rubbed into the skin. The labeling says it will cause the growth of feathered wings in most species when applied to the back. A small warning label says that in very rare cases it may produce more than one pair of wings.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 14000;
			
			version = _latestVersion;
		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			// Initialize variables
			var bonus: Number = 0;
			clearOutput();
			
			if(target is PlayerCharacter)
			{
				author("Couch");
				// PC does not have wings:
				if(target.wingType == 0)
				{
					output("You");
					if(target.isChestGarbed()) output(" remove your [pc.upperGarments] and");
					output(" twist around in order to get at your back, carefully squeezing out the balm into a hand and rubbing it in as directed. After a few moments the affected area starts to feel warm, and you grunt as you feel the [pc.skinFurScalesNoun] bulge outward.");
					// 75% chance that the PC grows feathered wings.
					if(rand(4) != 0)
					{
						target.wingType = GLOBAL.TYPE_DOVETWO;
						output("\n\nThe bulging and the heat intensify until you feel a moment of pain followed by a sweet cool feeling of relief. A few warm tingles run up and down your spine as your body’s rewired to work with its new parts, and you check your codex to discover <b>you’ve gained [pc.furColor]-feathered wings</b>!");
					}
					else
					{
						output("\n\nSomething feels off, you can feel more than two new appendages growing within your back. You start to panic, but the sudden burst of pain and blessed relief that follows do a good job of distracting you. When you recover and check your codex, you see that <b>you’ve gained");
						// 15% chance that the PC grows four feathered wings.
						if(rand(3) != 0)
						{
							target.wingType = GLOBAL.TYPE_DOVEFOUR;
							output(" four");
						}
						// 10% chance that the PC grows six feathered wings.
						else
						{
							target.wingType = GLOBAL.TYPE_DOVESIX;
							output(" six");
						}
						output(" [pc.furColor]-feathered wings<b>! Well, that’s certainly a rarity!");
					}
					output("\n\nUpon rubbing your new feathers, you find them to be blissfully soft to the touch.");
				}
				// PC has any wing type granted by this item:
				else if(target.wingType == GLOBAL.TYPE_DOVETWO || target.wingType == GLOBAL.TYPE_DOVEFOUR || target.wingType == GLOBAL.TYPE_DOVESIX)
				{
					output("Even though you already have feathered wings, you opt to apply some of the balm to your wingpoints anyway.");
					// 80% chance of dud result.
					if(rand(5) != 0)
					{
						output("\n\nA heat builds in your wings, then fades. You’re not really sure what you expected to happen...");
					}
					// 20% chance of wing type changing to one of the other two types that can be granted by this item.
					else
					{
						// Change to two wings:
						if(target.wingType != GLOBAL.TYPE_DOVETWO)
						{
							output("\n\nYou feel your");
							if(target.wingType == GLOBAL.TYPE_DOVEFOUR) output(" four");
							else output(" six");
							
							target.wingType = GLOBAL.TYPE_DOVETWO;
							
							output(" wings grow hot and meld together, <b>becoming a standard single pair</b> once they cool off.");
						}
						// Change to four or six wings from two:
						else if(target.wingType == GLOBAL.TYPE_DOVETWO)
						{
							output("\n\nYou feel your wings grow hot, then begin to stretch vertically before they suddenly split apart, new flesh and feathers growing in so that when the heat fades, <b>you’re left with");
							if(rand(2) == 0)
							{
								target.wingType = GLOBAL.TYPE_DOVEFOUR;
								output(" four");
							}
							else
							{
								target.wingType = GLOBAL.TYPE_DOVESIX;
								output(" six");
							}
							output(" wings instead of two.</b>");
						}
						// Change to four or six wings from four or six wings:
						else
						{
							output("\n\nYou feel your wings grow hot, melding together and then splitting again so that <b>you’re left with");
							// Four to six.
							if(target.wingType == GLOBAL.TYPE_DOVEFOUR)
							{
								target.wingType = GLOBAL.TYPE_DOVESIX;
								output(" six");
							}
							// Six to four.
							else if(target.wingType == GLOBAL.TYPE_DOVESIX)
							{
								target.wingType = GLOBAL.TYPE_DOVEFOUR;
								output(" four");
							}
							// Failsafe.
							else
							{
								target.wingType = GLOBAL.TYPE_DOVETWO;
								output(" two");
							}
							output(" feathered wings</b> by the time the heat fades.");
						}
					}
				}
				// PC has any other wing type:
				else if(target.hasWings())
				{
					// 75% chance that PC’s wing type changes to feathered wings.
					if(rand(4) != 0) target.wingType = GLOBAL.TYPE_DOVETWO;
					// 15% chance that PC’s wing type changes to four feathered wings.
					else if(rand(3) != 0) target.wingType = GLOBAL.TYPE_DOVEFOUR;
					// 10% chance that PC’s wing type changes to six feathered wings.
					else target.wingType = GLOBAL.TYPE_DOVESIX;
					
					output("You already have wings, but you’d kind of like to try out feathers. You rub the balm into your wingpoints, feeling a heat well up inside them almost as soon as you pull your hand away. Your wings practically melt into their new form like candle wax");
					if(target.wingType == GLOBAL.TYPE_DOVEFOUR || target.wingType == GLOBAL.TYPE_DOVESIX)
					{
						output(", though it comes with an odd splitting sensation you’re pretty sure isn’t supposed to happen");
					}
					output(".");
					output("\n\nBy the time your wings cool off, <b>they’ve become");
					if(target.wingType == GLOBAL.TYPE_DOVETWO) output(" two");
					else if(target.wingType == GLOBAL.TYPE_DOVEFOUR) output(" four");
					else output(" six");
					output(" majestic [pc.furColor]-feathered wings<b>!");
					output("\n\n");
					if(target.wingType == GLOBAL.TYPE_DOVEFOUR || target.wingType == GLOBAL.TYPE_DOVESIX)
					{
						output("Wait,");
						if(target.wingType == GLOBAL.TYPE_DOVEFOUR) output(" four");
						else output(" six");
						output("? Well that’s certainly unusual, though the label did warn you it could happen. ");
					}
					output("You pet one of your new wings, discovering that the feathers are deliciously soft.");
				}
				// Failsafe, something is wrong here...
				else
				{
					output("You");
					if(target.isChestGarbed()) output(" remove your [pc.upperGarments] and");
					output(" twist around in order to get at your back, carefully squeezing out the balm into a hand and rubbing it in as directed. After a few moments the affected area starts to tingle a little, and then... nothing. You should have known this wouldn’t have worked... what a rip-off!");
				}
			}
			//Not the player!
			else
			{
				output(target.capitalA + target.short + " applies the balm to no effect.");
			}
			return false;
		}
	}
}
