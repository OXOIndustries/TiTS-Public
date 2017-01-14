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
	public class LactaidOverdrive extends ItemSlotClass
	{
		
		public function LactaidOverdrive() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "LactaidO";
			//Regular name
			this.longName = "bottle labeled “Lactaid Overdrive”";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a bottle labeled “Lactaid Overdrive”";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This is the newest in TamaniCorp’s Lactaid-brand series of milk enhancement products. The bottle is similar to a nutrient drink, and it indeed contains a liquefied nutrient paste together with microsurgeons that will increase the rate at which a lactating drinker will refill their supply of milk. It’s popular as a lunchtime supplement with those wanting to recreate the inhuman milk production of a New Texan girl without being Treated.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1800;
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
			author("Couch");

			if (!(target is PlayerCharacter))
			{
				output(target.capitalA + target.short + " injects the Lactaid to no effect.");
				return false;
			}
			
			output("You unscrew the top on the bottle and gulp down the nutrient drink. It goes down in just a few swallows, tasting strongly of vanilla. Huh, you expected, well, milk.\n\n");
			
			if (!target.hasStatusEffect("Lactaid Overdrive Uses"))
			{
				target.createStatusEffect("Lactaid Overdrive Uses", 1, 0, 0, 0, true, "", "", false, 1440, 0xFFFFFF);
			}
			else
			{
				target.addStatusValue("Lactaid Overdrive Uses", 1, 1);
				target.addStatusMinutes("Lactaid Overdrive Uses", 1440);
			}
			
			if (!target.canLactate())
			{
				if (target.statusEffectv1("Lactaid Overdrive Uses") < 3)
				{
					output("You feel a bit of discomfort in your chest, but nothing happens. It’s probably only meant to work on someone who already lactates.");
				}
				else
				{
					if (target.milkFullness <= 50) target.milkFullness = 75;
					output("There’s a sense of pressure inside your [pc.breasts] as a small amount of [pc.milkNoun] escapes from the tips of your [pc.nipples]. <b>You’ve started lactating, albeit slowly.</b>");
				}
			}
			else if ((target.milkRate < 15 && target.milkMultiplier < 100 && target.milkStorageMultiplier < 5) || (target.statusEffectv1("Lactaid Overdrive Uses") < 5 || target.hasPerk("Hypermilky")))
			{
				if (rand(4) == 0)
				{
					target.milkMultiplier += 10;
					target.milkStorageMultiplier += 1;
					output("You can feel your body adapting to the extra speed with extra capacity, gaining the ability to provide more of the milk that comes faster and faster to your breasts. <b>Your body is trained for greater lactation!</b>");
				}
				else
				{
					output("Your breasts grow warm with new production, unchanged in their capacity but reaching that capacity visibly faster than they used to. <b>You’re recovering faster from milkings.</b>");
				}
				target.milkRate += 2;
			}
			else
			{
				output("As you down the drink you feel a bit of [pc.milkNoun] foam from your nipples even without your touching them. You’re producing so much, so fast, and your");
				if (target.biggestTitSize() > 6) output(" huge");
				output(" milk tanks aren’t slowing down anytime soon.");

				output("\n\n<b>Gained perk: Hypermilky!</b> (Lactation will not decrease from disuse or overfilling.)");
				target.createPerk("Hypermilky", 0, 0, 0, 0, "Lactation will not decrease from disuse or overfilling.");
			}
			

			return false;
		}
	}
}