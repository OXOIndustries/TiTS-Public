package classes.Items.Miscellaneous 
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Utility.rand;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LactaidMilkTank extends ItemSlotClass
	{
		
		public function LactaidMilkTank() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "LactaidMT";
			//Regular name
			this.longName = "lactaid milk tank medipen";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a medipen labeled “Lactaid Milk Tank”";
			//Displayed on tooltips during mouseovers
			this.tooltip = "One of Tamani Corp’s Lactaid-brand series of milk enhancement products, created after the success of the classic Lactaid in rescuing their brand image from the Gush incident. The specially formulated medipen focuses on improving the user’s ability to store milk in large quantities without increasing breast size or sensitivity, largely avoiding the dangers of Gush.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 2600;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			author("Savin");

			if (!(target is PlayerCharacter))
			{
				output(target.capitalA + target.short + " injects the Lactaid to no effect.");
				return false;
			}
			
			output("You apply the medipen just above your breasts, feeling a cool sensation in your skin as the payload makes its way downward and gets to work.\n\n");

			if (!target.canLactate())
			{
				if (!target.hasStatusEffect("Lactaid Milk Tank Uses") || target.statusEffectv1("Lactaid Milk Tank Uses") < 4)
				{
					output("You feel a bit of discomfort in your chest, but nothing happens. It’s probably only meant to work on someone who already lactates.");
					
					if (!target.hasStatusEffect("Lactaid Milk Tank Uses"))
					{
						target.createStatusEffect("Lactaid Milk Tank Uses", 1, 0, 0, 0, true, "", "", false, 1440, 0xFFFFFF);
					}
					else
					{
						target.addStatusValue("Lactaid Milk Tank Uses", 1, 1);
						target.addStatusMinutes("Lactaid Milk Tank Uses", 1440);
					}
				}
				else
				{
					target.removeStatusEffect("Lactaid Milk Tank Uses");
					output("There’s a sense of pressure inside your [pc.breasts] as a small amount of [pc.milkNoun] escapes from the tips of your [pc.nipples]. <b>You’ve started lactating, albeit slowly.</b>");
					if (target.milkRate < 25) target.milkRate = 25;
					if (target.milkFullness < 50) target.milkFullness = 75;
				}
			}
			else if (target.milkStorageMultiplier < 10)
			{
				output("Your breasts feel warm and oddly tight, as if pressing inward on their lactic cargo to compress it down into a smaller space. You feel like you could store more, much more, before your breasts had to swell to hold it all. <b>Your breasts can hold more milk!</b>");
				target.milkStorageMultiplier += 1;
			}
			else if (target.milkStorageMultiplier < 1000)
			{
				if (rand(2) == 0)
				{
					output("Your breasts feel blessedly airy, as though they could bear an ocean of milk and not show even the slightest hint of strain in doing so. Perhaps if you didn’t milk yourself for weeks on end, but you doubt even that would put a dent in your bottomless capacity. At the same time you don’t feel at all empty; rather, you’re full, and can just keep on getting fuller and fuller. <b>You can hold virtually limitless milk!</b>");
					target.milkStorageMultiplier = 1000;
					target.milkRate += 100; // Otherwise it will take LITERALLY FOREVER for this to fill up and trigger various states
				}
				else
				{
					output("You feel a pleasant warmth and tightness in your breasts, but it soon fades, leaving you feeling unchanged. You suppose even modding has its limits to how much milk you can store in how little space, but what a limit it is!");
				}
			}
			else
			{
				output("You feel a pleasant warmth and tightness in your breasts, but it soon fades, leaving you feeling unchanged. You suppose even modding has its limits to how much milk you can store in how little space, but what a limit it is!");
			}
			
			return false;
		}
	}
}