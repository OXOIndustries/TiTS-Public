package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CombatAttacks;
	
	public class BimboleumEmitter extends ItemSlotClass
	{
		public function BimboleumEmitter()
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.RANGED_WEAPON;
			
			shortName = "B.Emitter";
			
			longName = "bimboleum emitter";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a bimboleum emitter";
			
			tooltip = "A custom designed Bimboleum Emitter, like the kind Doctor Badger uses.\n\nMay cause fantasies, enflamed genitalia, inflated genitalia, orgasm, mild euphoria, severe euphoria, temporary loss of intelligence, permanent loss of intelligence, spontaneous silicone synthesis, drooling, undue vaginal secretions, sudden onset of fetishes, attention deficit disorder, high blood pressure, or cardiac arrest. Effects are generally temporary unless exposure is long term.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "shoot";
			attackNoun = "bimbofication";
			
			basePrice = 5500;
			attack = 0;
			baseDamage.tease.damageValue = 16;
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
