package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class Cryrolizer extends ItemSlotClass
	{
		//Level 7 (Rare). Balance 2.0
		//constructor
		public function Cryrolizer()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "CryroL";
			
			//Regular name
			this.longName = "cryrolizer";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a cryrolizer";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A cryrolizer is an advanced piece of technology designed for unconventional warfare. It fires an energy beam capable of quickly dissipating all heat from the target, potentially causing fatal hypothermia and even freezing it solid.";
			this.attackVerb = "shoot";
			attackNoun = "cold beam";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 11000;
			this.attack = 5;
			
			baseDamage = new TypeCollection();
			baseDamage.freezing.damageValue = 25;
			//baseDamage.addFlag(DamageFlag.BULLET);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			//baseDamage.addFlag(DamageFlag.LASER);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
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
