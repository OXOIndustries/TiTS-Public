package classes.Items.Miscellaneous 
{
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Combat.inCombat;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.CodexManager;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.StringUtil;
	
	public class MhengaMango extends ItemSlotClass
	{
		// Item constructor
		public function MhengaMango()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.FOOD;
			
			shortName = "M.Mango";
			longName = "mhen’gan mango";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a ripe mhen’gan mango";
			tooltip = "[altTooltip MhengaMango]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 25;
			
			combatUsable = true;
			targetsSelf = true;
			
			version = _latestVersion;
		}
		
		// Limit max; adjust if necessary!
		protected var sexyMax:Number = 10;
		
		// Give the effect!
		private function haveTheMango(target:Creature):void
		{
			var sexyCurrent:Number = 0;
			// Change these variables if too overpowered!
			// 1 to 5 sexiness gain
			var sexyBoost:Number = 1 + rand(5);
			// Effect lasts for 4 hours total
			var sexyHours:Number = 240;
			
			// If no mango, give mango
			if (!target.hasStatusEffect("The Mango"))
			{
				if (target is PlayerCharacter) target.createStatusEffect("The Mango", sexyBoost, 0, 0, 0, false, "Charmed", ("You are irresistible!\n\n(" + StringUtil.printPlusMinus(sexyBoost) + " sexiness)"), false, sexyHours,0xB793C4);
				else target.createStatusEffect("The Mango", sexyBoost, 0, 0, 0, false, "Charmed", (target.capitalA + target.short + " is irresistible!\n\n(" + StringUtil.printPlusMinus(sexyBoost) + " sexiness)"), true, 0,0xB793C4);
			}
			// If have mango, upgrade mango
			else
			{
				sexyCurrent = target.statusEffectv1("The Mango");
				sexyBoost += sexyCurrent;
				if (sexyBoost > sexyMax) sexyBoost = sexyMax;
				
				target.setStatusValue("The Mango", 1, sexyBoost);
				
				if (target is PlayerCharacter)
				{
					// Hours are additive for each time consumed.
					target.addStatusMinutes("The Mango", sexyHours);
					// Update the effect tooltip message, just in case!
					target.setStatusTooltip("The Mango", ("You are irresistible!\n\n(" + StringUtil.printPlusMinus(sexyBoost) + " sexiness)"));
				}
				else target.setStatusTooltip("The Mango", (target.capitalA + target.short + " is irresistible!\n\n(" + StringUtil.printPlusMinus(sexyBoost) + " sexiness)"));
			}
		}
		
		// Using the item!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var healing:int = 15;
			var sexyChance:int = 5;
			var hasEffect:Boolean = false;
			if (target.energy() + healing > target.energyMax())
			{
				healing = target.energyMax() - target.energy();
			}
			if (target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				// Consuming:
				if (!target.hasStatusEffect("The Mango"))
				{
					kGAMECLASS.output("You take a bite into the extremely ripe fruit.");
					if (!inCombat()) kGAMECLASS.output(" The juices suddenly burst into your mouth, engulfing your tongue with the unique taste of pure sweetness.");
				}
				else
				{
					kGAMECLASS.output("Already under the effects of the mango, you cannot resist but to have another, sweet, juicy bite.");
					if (!inCombat()) kGAMECLASS.output(" Once again, the juices cascade into your mouth and wash your tongue with its unique flavors. <i>Yum!</i>");
				}
				if (healing > 0)
				{
					//kGAMECLASS.output(" (<b>+" + healing + " Energy</b>)");
					target.changeEnergy(healing);
					hasEffect = true;
				}
				if (rand(sexyChance) == 0)
				{
					if (!inCombat()) kGAMECLASS.output("\n");
					if (!target.hasStatusEffect("The Mango"))
					{
						kGAMECLASS.output("\nYou feel suprisingly sensuous");
						if (!inCombat()) kGAMECLASS.output(", making you feel like a sexual magnet to others nearby");
						kGAMECLASS.output(". Others are now more likely to be attracted to you!");
						haveTheMango(target);
					}
					else
					{
						kGAMECLASS.output("\nThe familiar sensation of attractiveness surrounds you... ");
						haveTheMango(target);
						
						// Deep in thought of the mango...
						if (!inCombat())
						{
							if (kGAMECLASS.silly)
							{
								var msg:String = "";
								msg += "<i>";
								// Basic question
								msg += "\n\n\tCan you";
								if (rand(3) == 0) msg += " put the galaxy in your mouth?";
								else if (rand(2) == 0) msg += " know the mighty void of space?";
								else msg += " take the milk from the milky way?";
								// A little sillier...
								msg += "\n\n\tCan you";
								if (rand(3) == 0) msg += " catch a falling star without burning your hand?";
								else if (rand(2) == 0) msg += " lasso a star from the sky?";
								else msg += " solve the mysteries of a shooting star?";
								// Ridiculous!
								var randBlurb:Array = [];
								msg += "\n\n\tCan you say to a";
								randBlurb.push(" space rainbow... ‘Hey, would you stop being a space rainbow for one second?’");
								if (CodexManager.entryViewed("Galotians")) randBlurb.push(" galotian... ‘Hey, do green ones taste like lime or sour apple?’");
								if (CodexManager.entryViewed("Naleen") && CodexManager.entryViewed("Cunt Snakes")) randBlurb.push(" naleen... ‘Hey, are you related to the other pussy snakes?’");
								if (CodexManager.entryViewed("Vanae")) randBlurb.push(" vanae... ‘Hey, can you see how many fingers I’m holding up?’");
								if (CodexManager.entryViewed("Venus Pitchers")) randBlurb.push(" Venus pitcher... ‘Hey, do you know what you get when you plant kisses?’");
								if (CodexManager.entryViewed("Zil")) randBlurb.push(" zil... ‘Hey, does the </i>‘bee’s knees’<i> mean the same thing to you as it does to me?’");
								if (CodexManager.entryViewed("The Treatment")) randBlurb.push(" Treated cowgirl... ‘Hey, stop being a cowgirl and milk </i>me<i> for a change, okay?’ - But she’ll probably just look on cluelessly and moo... but that’s not the point!");
								randBlurb.push(" falling meteorite... ‘Hey, would you hold still for a second?’");
								msg += randBlurb[rand(randBlurb.length)];
								// Mango!
								msg += "\n\n\tNo! Such is a mango!";
								msg += "</i>\n\n";
								kGAMECLASS.output(msg);
							}
							
							if (target.statusEffectv1("The Mango") < sexyMax) kGAMECLASS.output("You feel even sexier after eating that!");
							else kGAMECLASS.output("Your true nature is calling!");
						}
					}
					hasEffect = true;
				}
				if (!hasEffect) kGAMECLASS.output(" Aside from the tropical aftertaste, nothing else seems to happen.");
			}
			else
			{
				// Yes, NPCs can use this in combat!
				if (inCombat()) kGAMECLASS.output("\n\n");
				else kGAMECLASS.clearOutput();
				kGAMECLASS.output((inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " pulls out a Mhen’gan mango and bites into it");
				if (healing > 0)
				{
					kGAMECLASS.output(", replinishing some of [target.hisHer] energy!");
					target.changeEnergy(healing);
					hasEffect = true;
				}
				if (rand(sexyChance) == 0)
				{
					if (!hasEffect) kGAMECLASS.output(".");
					if (!inCombat()) kGAMECLASS.output("\n");
					kGAMECLASS.output("\nAs an additional effect, [target.heShe] suddenly gets a quick sexiness boost!");
					haveTheMango(target);
					hasEffect = true;
				}
				if (!hasEffect) kGAMECLASS.output(", but to no effect.");
			}
			
			return false;
		}
	}
}
