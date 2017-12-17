package classes.Items.Accessories 
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MyrGreatcoat extends ItemSlotClass
	{
		
		
		public function MyrGreatcoat() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "MyrG.coat";
			
			//Regular name
			this.longName = "Myr Greatcoat";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Myr Greatcoat";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A standard-issue Scarlet Federation officer’s leather greatcoat, given to you by Lieve and customized for you, an alien on her world. Sexy, stylish, and guaranteed to keep you toasty in the cold depths.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 18000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 5;
			
			resistances = new TypeCollection();
			resistances.freezing.resistanceValue = 35.0;
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_COVER_BODY);
			
			this.version = _latestVersion;
		}	
	}
}
