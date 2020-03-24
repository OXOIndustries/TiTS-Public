package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class NemeanThreads extends ItemSlotClass
	{
		public function NemeanThreads()
		{
			_latestVersion = 1;
			//Level 6 common.
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ARMOR;
			
			shortName = "N.Threads";
			longName = "Nemean threads";
			
			TooltipManager.addFullName(shortName,StringUtil.toTitleCase(longName));
			
			description = "a flashy, protective outfit of Nemean design";
			tooltip = "This outfit consists of a jacket, jeans and boots. The gold cloth contrasts sharply with the silver plates covering the abdominals, biceps and quadriceps, creating an image of strength. Bracers and shin guards complete the look. Deceptively durable, woven seil silk and ballistic weave provide very real protection augmented by shining titanium plating.";
			
			TooltipManager.addTooltip(shortName,tooltip);
			
			basePrice = 11000;
			attack = 0;
			defense = 9;
			shieldDefense = 0;
			shields = 0;
			sexiness = 3;
			this.resolve = 2;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			itemFlags = [];
			resistances.addFlag(DamageFlag.PLATED);
			
			version = _latestVersion;
		}
	}
}
