package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class AimEyepieceMkII extends ItemSlotClass
	{
		
		
		public function AimEyepieceMkII() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "AimEyeII";
			
			//Regular name
			this.longName = "mark II aim-assisting eyepiece";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a mark II aim-assisting eyepiece";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A squat little thing, placed on your eye like half of a pair of glasses. It operates as a targeting assist, hooking up with the muzzle of a ranged weapon and giving you some flexibility of being able to aim without glaring down the sight of the weapon.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 31000;
			this.attack = 15;
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