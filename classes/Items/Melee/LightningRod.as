package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class LightningRod extends ItemSlotClass
	{
		// Lightning Rod (Level 6)
		// by HugsAlright
		// Vendor: Somewhere on Myrellion?
		public function LightningRod()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.MELEE_WEAPON;
			
			shortName = "L. Rod";
			longName = "lightning rod";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "an electrode-tipped Lightning Rod";
			
			tooltip = "Affectionately called “Lightning Rods” by those who often use them, these quarterstaff-like weapons are tipped with shocking electrodes on either end of their poly-synthetic shafts. Used as riot-suppression kit by police forces (particularly popular with ausar military and law enforcement), these staves have proven capable weapons with their ability to deliver crushing blows and paralyzing shocks to their targets.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "swing";
			attackNoun = "shocking thrust";
			
			basePrice = 10000;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 7;
			baseDamage.electric.damageValue = 6;
			baseDamage.addFlag(DamageFlag.CRUSHING);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_STUN);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			
			attack = 0;
			critBonus = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			evasion = 3;
			fortification = 0;
			
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);

			version = _latestVersion;
			
			/*
			Chance to Stun: This weapon has a chance to stun enemies when hit.
			*/
		}
	}
}