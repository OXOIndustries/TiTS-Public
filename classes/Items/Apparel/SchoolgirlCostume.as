package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Creature;
	
	public class SchoolgirlCostume extends ItemSlotClass
	{
		
		public function SchoolgirlCostume() 
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.CLOTHING;
			
			shortName = "S.Girl C.";
			
			longName = "schoolgirl costume";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a sexy schoolgirl costume";
			
			tooltip = "[altTooltip SchoolgirlCostume]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 1500;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			sexiness = 5;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			version = _latestVersion;
		}
		
		override public function onEquip(targetCreature:Creature):void
		{
			targetCreature.createStatusEffect("Sexy Costume", 10, 0, 0, 0, false, "LustUp", "The outfit you are wearing is making you feel randier than usual.", false, 0, 0xB793C4);
		}
		
		override public function onRemove(targetCreature:Creature):void
		{
			targetCreature.removeStatusEffect("Sexy Costume");
		}
	}
}
