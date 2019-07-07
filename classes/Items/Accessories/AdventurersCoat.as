package classes.Items.Accessories
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * @author Zavos
	 */
	
	public class AdventurersCoat extends ItemSlotClass
	{
	
		public function AdventurersCoat()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "A. Coat";
			
			//Regular name
			this.longName = "Adventurer’s Coat";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an adventurers cloak";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Woven from siel silk, this overcoat is meant to be worn over heavier armor. Self-repairing, hydrophobic and packing low yield deflectors; this coat will keep your armor pristine for when it’s needed.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null"; 
			
			//Information
			this.basePrice = 10000;
			this.attack = 0;
			this.defense = 2;
			this.shieldDefense = 0;
			this.shields = 10;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 4;
			this.fortification = 0;
			
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_COVER_BODY);

			
			this.version = _latestVersion;
		}
	}
}