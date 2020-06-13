package classes.Items.Miscellaneous 
{
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Combat.inCombat;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.CodexManager;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.StringUtil;
	
	public class Plumpkin extends ItemSlotClass
	{
		public function Plumpkin()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.FOOD;
			
			shortName = "Plumpkin";
			longName = "plumpkin";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a plumpkin fruit";
			tooltip = "A round, pale-brown fruit, rather like a peach but softer and hairless. It has a cake-like flavor, rich and incredibly moist. The intense calorific boost it offers comes at the expense of making you feel rather soft and languid.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 25;
			
			combatUsable = true;
			targetsSelf = true;
			
			version = _latestVersion;
		}
		
		private function useEffect(target:Creature):void
		{
			/*
			+100 Energy
			-15% Reflexes for 1 hour
			*/
			var addAim:Number = -15;
			var addMin:Number = 60;
			
			target.createStatusEffect("Plumpkin", addAim, 0, 0, 0, false, "Icon_Slow", ((target is PlayerCharacter ? "You are" : (target.capitalA + target.short + " " + (!target.isPlural ? "is" : "are"))) + " under the effects of the fruit.\n\n" + StringUtil.printPlusMinus(addAim) + " reflexes"), false, 0,0xB793C4);
			
			target.addStatusMinutes("Plumpkin", addMin);
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var hasEffect:Boolean = target.hasStatusEffect("Plumpkin");
			var addStat:int = 100;
			if (target.energy() + addStat > target.energyMax())
			{
				addStat = target.energyMax() - target.energy();
			}
			
			if (target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				output("You sink your teeth into the sweet, bread-like flesh of the plumpkin, the juices dribbling down your chin.");
				if(addStat > 0) output(" Onedamn... your heart pumps faster, your veins widen as the richness of it slides into your gut, leaving you feeling both energized and rather logy.");
				else if(!hasEffect) output(" The fruit makes you feel rather logy.");
				else output(" The side effect of your lowered reflexes has been extended.");
			}
			else
			{
				if (inCombat()) output("\n\n");
				else kGAMECLASS.clearOutput();
				output((inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " pulls out a plumpkin fruit and bites into it");
				if(addStat > 0) output(", raising " + target.getCombatPronoun("pa") + " stamina");
				else if(!hasEffect) output(", making " + target.getCombatPronoun("o") + " rather logy");
				else output(" to little effect");
				output(".");
			}
			
			useEffect(target);
			if(addStat > 0) target.changeEnergy(addStat);
			
			return false;
		}
	}
}
