package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class MilkBag extends ItemSlotClass
	{
		public var fluidType:Number = 0;
		public var fullnessLevel:Number = 0;
		
		public function MilkBag()
		{
			_latestVersion = 1;
			hasRandomProperties = true;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.POTION;
			
			shortName = "MilkBag";
			hasUniqueName = true;
			longName = "bag of milk";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a bag of milk";
			
			tooltip = "[altTooltipMilkBag]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 2;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(!kGAMECLASS.infiniteItems()) quantity++;
			if(target is PlayerCharacter) {
				kGAMECLASS.clearOutput();
				kGAMECLASS.output("You have no use for the bag at present.");
			}
			else {
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " cannot use the bag.");
			}
			return true;
		}
	}
}
