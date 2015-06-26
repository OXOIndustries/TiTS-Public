package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class PlasmaPistol extends ItemSlotClass
	{
		//constructor
		public function PlasmaPistol()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Plasma P.";
			
			//Regular name
			this.longName = "plasma pistol";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a plasma pistol";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This black-market plasma pistol has so many modifications that it's almost unrecognizable.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			
			//Information
			this.basePrice = 100050;
			this.attack = -1;
			
			baseDamage = new TypeCollection();
			baseDamage.electric.damageValue = 1;
			baseDamage.burning.damageValue = 30;
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_BURN);
			
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