package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Shortsword extends ItemSlotClass
	{
		//constructor
		public function Shortsword()
		{
			this._latestVersion = 1;
			
			//A KNIFE
			//4
			
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
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 550;
			this.attack = 1;
			this.damage = 7;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);

			this.version = _latestVersion;
		}
	}
}