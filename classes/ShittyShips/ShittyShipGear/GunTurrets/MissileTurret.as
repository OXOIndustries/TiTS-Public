package classes.ShittyShips.ShittyShipGear.GunTurrets
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class MissileTurret extends ItemSlotClass
	{
		//Level 1 (Common) ship weapon
		//constructor
		public function MissileTurret()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "MissileT.";
			
			//Regular name
			this.longName = "missile turret"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a missile turret";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "As a turret, this requires a crew member to fire it.\n\nMissiles are a common form of defense. Packing self-oxidizing fuel, they can give chase to targets in ways that dumb-fired bullets and streaking lasers cannot. Explosive warheads make them more effective against shielded foes than impact-focused weapons like rail and coil guns, but missiles still lag behind lasers and EM shells when it comes to raw, shield-purging power.";
			this.attackVerb = "shoot";
			attackNoun = "bullet";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1625;
					
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 90;
			baseDamage.burning.damageValue = 90;
			//baseDamage.addFlag(DamageFlag.BULLET);

			addFlag(GLOBAL.ITEM_FLAG_TURRET);
			addFlag(GLOBAL.ITEM_FLAG_QUADSHOT);
			addFlag(GLOBAL.ITEM_FLAG_SHIP_EQUIPMENT);
			
			this.attack = 10;
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
