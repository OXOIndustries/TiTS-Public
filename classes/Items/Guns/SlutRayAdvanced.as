package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class SlutRayAdvanced extends ItemSlotClass
	{
		//Level 5 (Rare). Balance 2.0
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
			
			basePrice = 2500;
			attack = 0;
			baseDamage.tease.damageValue = 5;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON);
			
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 5;
			evasion = 0;
			fortification = 0;
			
			version = _latestVersion;
			
			attackImplementor = CombatAttacks.SlutRayAttackImpl;
		}
	}
}
