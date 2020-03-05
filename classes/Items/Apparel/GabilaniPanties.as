package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;

	public class GabilaniPanties extends ItemSlotClass
	{
		public function GabilaniPanties()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.LOWER_UNDERGARMENT;
			
			shortName = "Gab.Panty";
			longName = "gabilani panties";
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a pair of panties made for gabilani women";
			
			tooltip = "These panties are made out of a flexible material, made to stretch over gabilani womens’ voluminous hips and butts. The fabric gets more sheer the more it has to stretch, so on those with the most thunderous thighs or the junkiest trunks, it’ll be practically see-through.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 800;
			sexiness = 2;
			resolve = 1;
			
			itemFlags = [GLOBAL.ITEM_FLAG_STRETCHY];
			
			version = _latestVersion;
		}
		
		public function bonusSexiness(bonus:Number = 0):void
		{
			hasRandomProperties = true;
			if(bonus >= 3)
			{
				addFlag(GLOBAL.ITEM_FLAG_TRANSPARENT);
			}
			else
			{
				deleteFlag(GLOBAL.ITEM_FLAG_TRANSPARENT);
			}
			sexiness = 2 + bonus;
		}
		
		override public function onEquip(targetCreature:Creature, outputText:Boolean = false):void
		{
			bonusSexiness(targetCreature.statusEffectv1("Stretchy Sexiness"));
		}
		
		override public function onRemove(targetCreature:Creature, outputText:Boolean = false):void
		{
			bonusSexiness(0);
		}
	}
}