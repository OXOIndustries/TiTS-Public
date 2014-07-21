package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MechaFist extends ItemSlotClass
	{
		
		public function MechaFist() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "mechafist";
			
			//Regular name
			this.longName = "mechanical fist";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an upgraded knuckle sandwich delivery device";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A metal set of fingers balled up into fists. The steel seems to continue past the writst and all the way up the arm.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "punch";
			
			//Information
			this.basePrice = 0;
			this.attack = 1;
			this.damage = 8;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 2;
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