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
	
	public class LemonLoftcake extends ItemSlotClass
	{
		public function LemonLoftcake()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "Loftcake";
			longName = "Lemon Loftcake";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a foil-wrapped lemon cake roll";
			tooltip = "Slightly less popular as a prank dish than its strawberry counterpart, this lemon cake roll enjoys similar sales as a method of cleaning up afterwards, as its citrus flavor hides a dose of targeted microsurgeons made to increase the eater’s height considerably.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 10;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			
			// The Idea: Simple height increaser
			
			if(target is PlayerCharacter)
			{
				kGAMECLASS.showName("LEMON\nLOFTCAKE");
				author("Couch");
				
				// Consumption Text
				output("You unwrap the cake roll from its foil pouch, resting on an inner paper backing that reads “Eat Me!”. The roll goes down in just a few bites, leaving the taste of lemons in your mouth while you wait for the results.");
				
				var tallMin:Number = (36 + 12);
				var tallMax:Number = (144 - 24);
				var tallChange:Number = 1 + rand(3);
				if((target.tallness + tallChange) > tallMax) tallChange = (tallMax - target.tallness);
				var newTallness:Number = target.tallness + tallChange;
				
				// Grow 1-3 inches, then lower height to playable ceiling if need be:
				if(tallChange > 0 && target.tallness < tallMax)
				{
					if(target.tallnessUnlocked(newTallness))
					{
						output("\n\nThe world lurches as if you’d just stepped onto a falling elevator, nearly making you stumble. By the time you recover, the ground seems " + num2Text(tallChange) + " inch" + (tallChange == 1 ? "" : "es") + " further away.");
						
						target.tallness = newTallness;
					}
					else output("\n\n" + target.tallnessLockedMessage());
				}
				// Dud result:
				else
				{
					output("\n\nYou wait and wait, but nothing happens. You must not be able to get any taller.");
				}
			}
			//Not player!
			else
			{
				output(target.capitalA + target.short + " eats the loftcake to no effect.");
			}
			return false;
		}
	}
}
