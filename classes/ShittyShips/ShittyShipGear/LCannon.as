package classes.ShittyShips.ShittyShipGear
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class LCannon extends ItemSlotClass
	{
		//Level 1 (Common) ship weapon
		//constructor
		public function LCannon()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "L.Cannon";
			
			//Regular name
			this.longName = "laser cannon"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a laser cannon";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "TBD";
			this.attackVerb = "shoot";
			attackNoun = "beam";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1300;
					
			baseDamage.burning.damageValue = 240;
			//baseDamage.addFlag(DamageFlag.BULLET);
			//baseDamage.addFlag(DamageFlag.NO_CRIT);
			baseDamage.addFlag(DamageFlag.LASER);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			//addFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR);
			//addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			
			//this.addFlag(GLOBAL.ITEM_FLAG_SHOTGUN_WEAPON);
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 60;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
