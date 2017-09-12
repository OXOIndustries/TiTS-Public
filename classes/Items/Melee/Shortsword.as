package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Shortsword extends ItemSlotClass
	{
		//Level 2 (Common). Balance 2.0
		//constructor
		public function Shortsword()
		{
			this._latestVersion = 1;
			
			//this.indexNumber = 4;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Shortsword";
			
			//Regular name
			this.longName = "shortsword";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a shortsword";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Shortswords have been around as long as terran history has been recorded. This one is no exception. It has a simple steel blade with a point and stab interface.";
			this.attackVerb = "stab";
			attackNoun = "stab";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 200;
			
			baseDamage.kinetic.damageValue = 10;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.attack = 1;
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