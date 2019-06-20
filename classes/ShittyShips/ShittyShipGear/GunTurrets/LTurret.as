package classes.ShittyShips.ShittyShipGear.GunTurrets
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class LTurret extends ItemSlotClass
	{
		//Level 1 (Common) ship weapon
		//constructor
		public function LTurret()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "L.Turret";
			
			//Regular name
			this.longName = "laser turret"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a laser turret";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "As a turret, this requires a crew member to fire it.\n\nLaser weapons have been popular weapons for spacecraft ever since the solar system was first explored. Laser weapons do not require the expendure of mass for ammunition, and in the void of space, their focused beams can travel extreme distances in a flash. Of course, like all pure-energy weapons, lasers require a high amount of energy to fire.";
			this.attackVerb = "shoot";
			attackNoun = "laser beam";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 2750;
					
			baseDamage.burning.damageValue = 350;
			
			addFlag(GLOBAL.ITEM_FLAG_TURRET);
			addFlag(GLOBAL.ITEM_FLAG_TWINSHOT);
			baseDamage.addFlag(DamageFlag.LASER);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_SHIP_EQUIPMENT);
			
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 120;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
