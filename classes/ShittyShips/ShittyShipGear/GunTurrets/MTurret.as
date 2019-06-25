package classes.ShittyShips.ShittyShipGear.GunTurrets
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class MTurret extends ItemSlotClass
	{
		//Level 1 (Common) ship weapon
		//constructor
		public function MTurret()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "MTurret";
			
			//Regular name
			this.longName = "machine gun turret"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a machine gun turret";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "As a turret, this requires a crew member to fire it.\n\nWhile colloquially known as a machine gun, this ship-mounted monstrosity would be a rapid-firing anti-tank weapon on the ground, but in the vastness of space, its punishing shells may as well be .22 bullets.";
			this.attackVerb = "shoot";
			attackNoun = "bullet";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1625;
					
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 190;
			baseDamage.addFlag(DamageFlag.BULLET);

			addFlag(GLOBAL.ITEM_FLAG_TURRET);
			addFlag(GLOBAL.ITEM_FLAG_QUADSHOT);
			addFlag(GLOBAL.ITEM_FLAG_SHIP_EQUIPMENT);
			
			this.attack = -5;
			this.defense = 0;
			this.shieldDefense = 50;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
