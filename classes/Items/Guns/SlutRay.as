package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class SlutRay extends ItemSlotClass
	{
		//Level 4 (Common). Balance 2.0
		public function SlutRay()
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.RANGED_WEAPON;
			
			shortName = "SlutRay";
			longName = "slut ray";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a compact ‘slut ray’ gun";
			tooltip = "This tiny, unassuming handgun-like device is designed to be hidden. When fired at a subject, it causes their mind to be flooded with graphic sexual fantasies, though they still retain free will. The fantasies can be custom selected by the user or set to random. Nobody knows how it works; the gun’s contents are hidden behind a tamper-proof black casing.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "shoot";
			attackNoun = "sexual fantasy";
			
			basePrice = 900;
			
			baseDamage.tease.damageValue = 4;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON);
			
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 0;
			evasion = 0;
			fortification = 0;

			version = _latestVersion;
			
			attackImplementor = CombatAttacks.SlutRayAttackImpl;
		}
	}
}
