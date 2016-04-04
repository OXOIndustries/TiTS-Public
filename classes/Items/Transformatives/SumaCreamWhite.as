package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Items.Transformatives.SumaCream;
	
	public class SumaCreamWhite extends ItemSlotClass
	{
		private var pillColor:String = "white";
		
		public function SumaCreamWhite()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 12;
			type = GLOBAL.PILL;
			
			shortName = "Suma";
			longName = "Suma Cream capsule";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a Suma Cream capsule";
			
			tooltip = "[altTooltip SumaCreamWhite]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 800;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				SumaCream.sumaEffects(target, pillColor);
				return true;
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses the pill to no effect.");
			}
			return false;
		}
	}
}

