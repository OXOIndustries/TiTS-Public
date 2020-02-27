package classes.Items.Armor.Unique
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Creature;
	import classes.Items.Armor.Unique.OmnisuitCollar;
	
	public class StrangeCollar extends ItemSlotClass
	{
		public function StrangeCollar()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			
			type = GLOBAL.ARMOR;
			
			shortName = "S.Collar";
			
			longName = "strange metal collar";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a strange metal collar";
			
			tooltip = "This unusual metal collar gives no clues as to its manufacture - or its purpose. You could try it on, if you’re feeling daring.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 700;
			attack = 0;
			defense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			resistances.burning.resistanceValue = 0.0;
			resistances.freezing.resistanceValue = 0.0;
			
			resistances.pheromone.resistanceValue = 0.0;
			
			// Note: Since the suit creates a stable environment any gaseous based damage wouldn't work against it.
			itemFlags = [GLOBAL.ITEM_FLAG_EXPOSE_FULL];
			//itemFlags.push(GLOBAL.ITEM_FLAG_AIRTIGHT);
			
			version = _latestVersion;
		}
		
		override public function onEquip(targetCreature:Creature, outputText:Boolean = false):void
		{
			return (new OmnisuitCollar()).onEquip(targetCreature, outputText);
		}
		
		override public function onRemove(targetCreature:Creature, outputText:Boolean = false):void
		{
			return (new OmnisuitCollar()).onRemove(targetCreature, outputText);
		}
	}
}
