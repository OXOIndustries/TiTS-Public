package classes.ShittyShips.ShittyShipGear.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class MGun extends ItemSlotClass
	{
		//Level 1 (Common) ship weapon
		//constructor
		public function MGun()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "MGun";
			
			//Regular name
			this.longName = "machine gun"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a machine gun";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "While colloquially known as a machine gun, this ship-mounted monstrosity would be a rapid-firing anti-tank weapon on the ground, but in the vastness of space, its punishing shells may as well be .22 bullets.";
			this.attackVerb = "shoot";
			attackNoun = "bullet";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1300;
					
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 100;
			baseDamage.addFlag(DamageFlag.BULLET);

			addFlag(GLOBAL.ITEM_FLAG_QUADSHOT);
			addFlag(GLOBAL.ITEM_FLAG_SHIP_EQUIPMENT);
			
			this.attack = -5;
			this.defense = 0;
			this.shieldDefense = 25;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
