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
	
	public class Peprika extends ItemSlotClass
	{
		public function Peprika()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.FOOD;
			
			shortName = "Peprika";
			longName = "peprika";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a peprika fruit";
			tooltip = "A long, thin, glossy red fruit, similar to a big chili pepper... if a chili pepper had sharp purple thorns at its stem. It has a salty, jerky-like flavor, odd but undeniably moorish. Whatever proteins it contains causes you to feel frisky, worked-up and anxious to move.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 25;
			
			combatUsable = true;
			targetsSelf = true;
			
			version = _latestVersion;
		}
		
		private function useEffect(target:Creature):void
		{
			/*
			+20 Energy
			+30% Lust
			+50% Reflexes, max 125% of level limit, for 1 hour
			*/
			var addAim:Number = 50;
			var maxAim:Number = 25;
			var addMin:Number = 60;
			
			target.createStatusEffect("Peprika", addAim, maxAim, 0, 0, false, "Icon_Haste", ((target is PlayerCharacter ? "You are" : (target.capitalA + target.short + " " + (!target.isPlural ? "is" : "are"))) + " under the effects of the fruit.\n\n" + StringUtil.printPlusMinus(addAim) + " reflexes\n" + StringUtil.printPlusMinus(maxAim) + " maximum reflexes"), false, 0,0xB793C4);
			
			target.addStatusMinutes("Peprika", addMin);
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var hasEffect:Boolean = target.hasStatusEffect("Peprika");
			var addStat:int = 20;
			if (target.energy() + addStat > target.energyMax())
			{
				addStat = target.energyMax() - target.energy();
			}
			var addLust:int = 30;
			if (target.lust() + addLust > target.lustMax())
			{
				addLust = target.lustMax() - target.lust();
			}
			
			if (target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				output("You bite off a segment of the chewy plant, gnawing on the tough flesh until the salty, meaty flavor is released.");
				if(addStat > 0 || addLust > 0) output(" You instantly feel more alert and twitchy, a fire growing in your veins. Fight! Flight! Fuck! One or more of the above!");
				else if(!hasEffect) output(" The fruit makes you feel more alert and twitchy.");
				else output(" The side effect of your heightened reflexes has been extended.");
			}
			else
			{
				if (inCombat()) output("\n\n");
				else kGAMECLASS.clearOutput();
				output((inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " pulls out a peprika fruit and bites into it");
				if(addStat > 0) output(", raising " + target.getCombatPronoun("pa") + " stamina");
				else if(!hasEffect) output(", making " + target.getCombatPronoun("o") + " more alert");
				else output(" to little effect");
				output(".");
			}
			
			useEffect(target);
			if(addStat > 0) target.changeEnergy(addStat);
			if(addLust > 0) target.changeLust(addLust);
			
			return false;
		}
	}
}
