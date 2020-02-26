package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * @author Zavos
	 */
	
	public class HardlightAGShirt extends ItemSlotClass
	{
		
		public function HardlightAGShirt()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "HL Top";
			
			//Regular name
			this.longName = "hardlight undershirt";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a hardlight anti-gravity undershirt";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A sleek metallic choker fitted with hardlight projectors. Upon activation it coats the wearer’s upper body in sapphire light, providing coverage while keeping your musculature on display.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null"; 
			
			//Information
			this.basePrice = 2400;
			this.attack = 0; 
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_TRANSPARENT);
			itemFlags.push(GLOBAL.ITEM_FLAG_ANTIGRAV);
			
			
			this.version = _latestVersion;
		}
	}
}