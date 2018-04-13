package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class YappiStrap extends ItemSlotClass
	{
		//Level ??? (???). Balance 2.0
		//constructor
		public function YappiStrap()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Y.Strap";
			
			//Regular name
			this.longName = "yappi strap";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a yappi strap";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "An exotic mixture of a whip and a club. Hurts like you wouldn’t believe.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "smack";
			attackNoun = "smack";
			
			//Information
			this.basePrice = 9000;
			this.attack = -2;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 21;
			baseDamage.addFlag(DamageFlag.CRUSHING);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 1;
			this.critBonus = 8;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
