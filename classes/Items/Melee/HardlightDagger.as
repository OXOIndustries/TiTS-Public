package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class HardlightDagger extends ItemSlotClass
	{
		// Hardlight Dagger (Level 6-7)
		// by HugsAlright
		// Vendor: Anno or Nerrasa?
		public function HardlightDagger()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.MELEE_WEAPON;
			
			shortName = "HL Dagger";
			longName = "hardlight dagger";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a thermal-heated hardlight dagger";
			
			tooltip = "At first glance this weapon seems to only be the hilt of a dagger, but this handle hides a hardlight projector that protrudes a razor-sharp blade made of photons that heat the air around them. Ultra-lightweight due to its lack of a physical blade, and highly concealable, this weapon is perfect for any rogue in need of a holdout weapon for close encounters of the third kind.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "slash";
			attackNoun = "hardlight slash";
			
			basePrice = 13800;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 8;
			baseDamage.burning.damageValue = 9;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			attack = 0;
			critBonus = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			evasion = 8;
			fortification = 0;
			
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);

			version = _latestVersion;
		}
	}
}