package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class ShockBow extends ItemSlotClass
	{
		// Shock Bow (Level 6)
		// by HugsAlright
		// Vendor: Somewhere on Myrellion, maybe on Mhen’ga from Crazy Carl at an appropriate level.
		public function ShockBow()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.RANGED_WEAPON;
			
			shortName = "Shock Bow";
			longName = "shock bow";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a lightning-slinging shock bow";
			
			tooltip = "Seen in the hands of game hunters around the galaxy, this compound bow features a lightweight design made from only the best of synthetic materials, and a sleek quiver full of electrode-tipped arrows that can deliver a paralyzing shock to targets. With a robust, reliable design and arrows capable of incapacitating targets, this weapon is perfect for hunting in the wild, but a skilled archer could easily make it work in a firefight scenario.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "shoot";
			attackNoun = "shocking arrow";
			
			basePrice = 10000;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 7;
			baseDamage.electric.damageValue = 6;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_STUN);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			
			attack = 2;
			critBonus = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			evasion = 0;
			fortification = 0;
			
			addFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			version = _latestVersion;
			
			/*
			Chance to Stun: This weapon has a chance to stun enemies when hit.
			*/
		}
	}
}