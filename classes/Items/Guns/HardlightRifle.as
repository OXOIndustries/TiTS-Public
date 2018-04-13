package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class HardlightRifle extends ItemSlotClass
	{
		//Level 7 (Rare). Balance 2.04

		//constructor
		public function HardlightRifle()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "HL Rifle";
			
			//Regular name
			this.longName = "hardlight rifle";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a hardlight rifle";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A rifle equipped with several internal hardlight emitters, capable of projecting a hail of pure force and light into a target. While this technology packs more punch than your typical laser, it has fallen out of favor due to its ineffectiveness against shielded targets.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "hardlight projectile";
			
			//Information
			this.basePrice = 11000;
			this.attack = 8;
			
			baseDamage = new TypeCollection();
			//baseDamage.electric.damageValue = 1;
			baseDamage.kinetic.damageValue = 28;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.LASER);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}
