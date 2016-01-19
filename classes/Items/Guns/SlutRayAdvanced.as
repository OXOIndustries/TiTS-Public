package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CombatAttacks;
	
	public class SlutRayAdvanced extends ItemSlotClass
	{
		public function SlutRayAdvanced()
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.RANGED_WEAPON;
			
			shortName = "A.SlutRay";
			
			longName = "advanced slut ray";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a silvery ‘slut ray’ gun";
			
			tooltip = "An advanced slut ray model, designed to project sexual fantasies into the mind of a target. Incredibly similar to the original model, except this one boasts higher intensity settings and a wider database of fantasies to draw upon.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "shoot";
			attackNoun = "sexual fantasy";
			
			basePrice = 4500;
			attack = 0;
			baseDamage.tease.damageValue = 12;
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON);
			
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 2;
			evasion = 0;
			fortification = 0;
			
			version = _latestVersion;
			
			attackImplementor = CombatAttacks.SlutRayAttackImpl;
		}
	}
}
