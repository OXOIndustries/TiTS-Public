package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * Something something test item with long words, fofofofo.
	 */
	public class TachyonBeamLaser extends ItemSlotClass
	{
		//constructor
		public function TachyonBeamLaser()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Tach. Beam";
			
			//Regular name
			this.longName = "tacyhon beam laser";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a tacyhon beam laser gun";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "An ultra-heavy beam laser designed for medium to long range engagements. Due to the power requirements of the laser emitters used by the weapon, it’s commonly found mounted to various forms of mechanized exoskeletal combat suits-- if not directly attached to the hull of a starship.\n\nBy introducing modulated tachyon pulses into the focusing chamber, the laser can impart some finite quantity of mass to photons directed towards the target aperature.";
			this.attackVerb = "shoot";
			attackNoun = "beam laser";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 37500;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.electric.damageValue = 5;
			baseDamage.burning.damageValue = 25;
			baseDamage.kinetic.damageValue = 10;
			baseDamage.unresistable_hp.damageValue = 10;
			baseDamage.addFlag(DamageFlag.LASER);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.PENETRATING);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			baseDamage.drug.damageValue = 5;
			baseDamage.tease.damageValue = 5;
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 5;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
