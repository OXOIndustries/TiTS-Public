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
		//constructor
		public function SlutRayHeavy()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "H.SlutRay";
			
			//Regular name
			this.longName = "heavy slut ray";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a heavy ‘slut ray’ gun";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This bulky variant of the ‘slut ray’ was designed for power rather than concealment. Instead of being used for covert brainwashing, it is intended for use in less-than-lethal combat, though the strength of its effects make it equally well-suited to the former. When fired, brilliant pink beams of psychicly-attuned energy fly through the air. Victims of this weapon report experiencing vivid sexual fantasies, often of the wielder, that linger for many hours after exposure.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "beam of psychic, erotic energies";
			
			//Information
			this.basePrice = 25000;
			this.attack = 0;
			baseDamage.tease.damageValue = 8;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_STUN);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 4;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
			
			attackImplementor = CombatAttacks.SlutRayAttackImpl;
		}
	}
}
