package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.kGAMECLASS;
	import classes.GameData.CombatAttacks;
	
	public class SiegwulfeItem extends ItemSlotClass
	{
		public function SiegwulfeItem()
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ACCESSORY;
			
			shortName = "Siegwulfe";
			
			longName = "Siegwulfe personal droid";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a Siegwulfe personal " + (kGAMECLASS.chars["WULFE"].isBimbo() ? "bimbobot" : "security") + " companion";
			
			tooltip = "[altTooltip Siegwulfe]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "null";
			
			basePrice = 10000;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			droneAttack = CombatAttacks.SiegwulfeAttack;
			
			addFlag(GLOBAL.ITEM_FLAG_COMBAT_DRONE);
			addFlag(GLOBAL.ITEM_FLAG_INTERNAL_POWER);
			
			version = _latestVersion;
		}
	}
}
