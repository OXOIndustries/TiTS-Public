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
	
	public class DispassionFruit extends ItemSlotClass
	{
		public function DispassionFruit()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.FOOD;
			
			shortName = "D.Fruit";
			longName = "dispassion fruit";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a dispassion fruit";
			tooltip = "A nobbly, wrinkled-looking fruit, striped dull blue and pale yellow. Its unappetizing appearance belays its pleasant, cool, pear-like flavor. It also seems to have a sedative effect, quelling your arousal at the expense of making your reactions slower.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 25;
			
			combatUsable = true;
			targetsSelf = true;
			
			version = _latestVersion;
		}
		
		private function useEffect(target:Creature):void
		{
			/*
			- 50 Lust
			- 10% Libido for 1 hour
			- 15% Physique for 1 hour
			- 15% Aim for 1 hour
			*/
			var addPhy:Number = -15;
			var addAim:Number = -15;
			var addLib:Number = -10;
			var addMin:Number = 60;
			
			target.createStatusEffect("Dispassion Fruit", addPhy, addAim, addLib, 0, false, "Icon_LustDown", ((target is PlayerCharacter ? "You are" : (target.capitalA + target.short + " " + (!target.isPlural ? "is" : "are"))) + " under the effects of the fruit.\n\n" + StringUtil.printPlusMinus(addPhy) + " physique\n" + StringUtil.printPlusMinus(addAim) + " reflexes\n" + StringUtil.printPlusMinus(addLib) + " libido"), false, 0,0xB793C4);
			
			target.addStatusMinutes("Dispassion Fruit", addMin);
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var hasEffect:Boolean = target.hasStatusEffect("Dispassion Fruit");
			var addLust:int = -50;
			if (target.lust() + addLust < target.lustMin())
			{
				addLust = target.lustMin() - target.lust();
			}
			
			if (target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				output("You unpeel the blue-and-yellow fruit and gobble it up, the clear, cool juices coursing down your throat. That coolness seems to pervade your whole body after a few moments, washing over your baser instincts.");
				if(addLust < 0) output(" You’re left feeling as calm and still as a cloudless winter night.");
				else if(!hasEffect) output(" You’re libido has dropped at the cost of physique and reflexes.");
				else output(" The side effect of your lowered libido has been extended.");
			}
			else
			{
				if (inCombat()) output("\n\n");
				else kGAMECLASS.clearOutput();
				output((inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " pulls out a dispassion fruit and bites into it");
				if(addLust < 0) output(", dropping " + target.getCombatPronoun("pa") + " arousal");
				else if(!hasEffect) output(", making " + target.getCombatPronoun("o") + " feel less aroused");
				else output(" to little effect");
				output(".");
			}
			
			useEffect(target);
			if(addLust < 0) target.changeLust(addLust);
			
			return false;
		}
	}
}
