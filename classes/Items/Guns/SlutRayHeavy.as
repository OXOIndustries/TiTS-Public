package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class SlutRayHeavy extends ItemSlotClass
	{
		//Level 10 (Rare). Balance 2.0
		//10% drop chance on SlyverenSlavebreaker.
		public function SlutRayHeavy()
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.RANGED_WEAPON;
			
			shortName = "H.SlutRay";
			longName = "heavy slut ray";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a heavy ‘slut ray’ gun";
			tooltip = "This bulky variant of the ‘slut ray’ was designed for power rather than concealment. Instead of being used for covert brainwashing, it is intended for use in less-than-lethal combat, though the strength of its effects make it equally well-suited to the former. When fired, brilliant pink beams of psychicly-attuned energy fly through the air. Victims of this weapon report experiencing vivid sexual fantasies, often of the wielder, that linger for many hours after exposure.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "shoot";
			attackNoun = "beam of psychic, erotic energies";
			
			basePrice = 25000;
			
			baseDamage.tease.damageValue = 8;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_STUN);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 4;
			evasion = 0;
			fortification = 0;

			version = _latestVersion;
			
			attackImplementor = CombatAttacks.SlutRayAttackImpl;
		}
	}
}
