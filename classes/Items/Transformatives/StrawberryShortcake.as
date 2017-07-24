package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.num2Text;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class StrawberryShortcake extends ItemSlotClass
	{
		public function StrawberryShortcake()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "Shortcake";
			longName = "Strawberry Shortcake";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a foil-wrapped strawberry shortcake roll";
			tooltip = "[altTooltip StrawberryShortcake]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 10;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			
			// The Idea: Simple height reducer
			
			if(target is PlayerCharacter)
			{
				kGAMECLASS.showName("STRAWBERRY\nSHORTCAKE");
				author("Couch");
				
				// Consumption Text
				output("You unwrap the cake roll from its foil pouch, resting on an inner paper backing that reads “Eat Me!”. The roll goes down in just a few bites, leaving the taste of strawberries in your mouth while you wait for the results.");
				
				var tallMin:Number = (36 + 12);
				var tallMax:Number = (144 - 24);
				var tallChange:Number = 1 + rand(3);
				if((target.tallness - tallChange) < tallMin) tallChange = (target.tallness - tallMin);
				var newTallness:Number = target.tallness - tallChange;
				
				// Shrink 1-3 inches, then raise height to playable floor if need be:
				if(tallChange > 0 && target.tallness > tallMin)
				{
					if(target.tallnessUnlocked(newTallness))
					{
						output("\n\nThe world briefly spins as you suffer a bout of disorientation. When you come to, the ground seems " + num2Text(tallChange) + " inch" + (tallChange == 1 ? "" : "es") + " closer than before.");
						
						target.tallness = newTallness;
					}
					else output("\n\n" + target.tallnessLockedMessage());
				}
				// Dud result:
				else
				{
					output("\n\nYou wait and wait, but nothing happens. You must not be able to get any shorter.");
				}
			}
			//Not player!
			else
			{
				output(target.capitalA + target.short + " eats the shortcake to no effect.");
			}
			return false;
		}
	}
}

