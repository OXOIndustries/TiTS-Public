package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class OnePieceSwimsuit extends ItemSlotClass
	{
		//Level 3 (Common). Balance 2.0
		public function OnePieceSwimsuit()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			
			type = GLOBAL.CLOTHING;
			
			shortName = "O.Swimsuit";
			
			longName = "one-piece swimsuit";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a black one-piece swimsuit";
			
			tooltip = "A simple, figure-hugging black swimsuit that will cover you from crotch to chest. Gracefully alluring and gets the job done.";
			//tooltip += " Note that this will cover both your upper and lower under-region.";
			tooltip += " Note that this should cover both your upper and lower under-regions, so wearing undergarments with this before a swim is redundant.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 400;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			sexiness = 5;
			critBonus = 0;
			evasion = 3;
			fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR];
			resistances.tease.resistanceValue = 24.0;
			
			version = _latestVersion;
		}
	}
}
