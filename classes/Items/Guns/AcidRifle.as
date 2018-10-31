package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class AcidRifle extends ItemSlotClass
	{
		//Level 4 (Rare). Balance 2.0
		//constructor
		public function AcidRifle()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "AcidRfl";
			
			//Regular name
			this.longName = "acid rifle"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an acid rifle";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Designed to take down targets impervious to traditional weaponry, the this gas-operated weapon dispenses small, polymer-wrapped spheres of a proprietary substance designed to disrupt the target at a molecular level. It comes complete with an inertia-compensating grip and scope to assist in landing shots on target.";
			this.attackVerb = "shoot";
			attackNoun = "acid capsule";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1300;
			this.attack = 5;
			
			baseDamage = new TypeCollection();
			baseDamage.corrosive.damageValue = 15;
			//baseDamage.addFlag(DamageFlag.NO_CRIT);
			//addFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE);
			
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
