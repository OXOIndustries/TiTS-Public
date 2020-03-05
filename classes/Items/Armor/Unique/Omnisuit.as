package classes.Items.Armor.Unique
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Creature;
	import classes.Items.Armor.Unique.OmnisuitCollar;
	
	public class Omnisuit extends ItemSlotClass
	{
		public function Omnisuit()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			
			type = GLOBAL.ARMOR;
			
			shortName = "O.Suit";
			
			longName = "slinky black omnisuit";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a slinky black omnisuit";
			
			tooltip = "This shining metal collar is the container for a prototype omnisuit - a high tech garment that flows out to cover one’s body in a shining black covering - genitalia and all. The resulting suit provides a modest amount of physical protection - and enhanced sensations for the bedroom.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 700;
			attack = 0;
			defense = 3;
			shields = 0;
			sexiness = 5;
			critBonus = 0;
			evasion = 8;
			fortification = 0;
			
			resistances.burning.resistanceValue = 34.0;
			resistances.electric.resistanceValue = 40.0;
			resistances.corrosive.resistanceValue = 15.0;
			resistances.tease.resistanceValue = -25.0;
			
			// Note: Since the suit creates a stable environment any gaseous based damage wouldn't work against it.
			//itemFlags = [GLOBAL.ITEM_FLAG_EXPOSE_FULL];
			//itemFlags.push(GLOBAL.ITEM_FLAG_AIRTIGHT);
			itemFlags.push(GLOBAL.ITEM_FLAG_SKIN_TIGHT);
			
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
