package classes.ShittyShips.ShittyShipGear
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
			this.tooltip = "TBD";
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1300;
					
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 95;
			baseDamage.addFlag(DamageFlag.BULLET);
			//addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			addFlag(GLOBAL.ITEM_FLAG_QUADSHOT);
			
			//baseDamage.addFlag(DamageFlag.NO_CRIT);
			
			//this.addFlag(GLOBAL.ITEM_FLAG_SHOTGUN_WEAPON);
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
