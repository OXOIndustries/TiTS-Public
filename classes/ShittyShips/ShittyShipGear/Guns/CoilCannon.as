package classes.ShittyShips.ShittyShipGear.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class CoilCannon extends ItemSlotClass
	{
		//Level 1 (Common) ship weapon
		//constructor
		public function CoilCannon()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Coil C.";
			
			//Regular name
			this.longName = "coil cannon"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a coil cannon";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Using magnetic fields, the fearsome coil cannon delivers massive punches of kinetic damage at space-faring ranges with ease. Unfortunately, the sheer size of the weapon requires shifting armor mounts around, negatively impacting the vessel's durability.";
			this.attackVerb = "shoot";
			attackNoun = "coilshot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 4500;
					
			baseDamage.kinetic.damageValue = 500;
			baseDamage.addFlag(DamageFlag.BULLET);
			//baseDamage.addFlag(DamageFlag.NO_CRIT);
			//baseDamage.addFlag(DamageFlag.LASER);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			//addFlag(GLOBAL.ITEM_FLAG_TWINSHOT);
			this.addFlag(GLOBAL.ITEM_FLAG_SHIP_EQUIPMENT);
			//addFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR);
			//addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			
			//this.addFlag(GLOBAL.ITEM_FLAG_SHOTGUN_WEAPON);
			this.attack = 0;
			this.defense = -10;
			this.shieldDefense = 70;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
