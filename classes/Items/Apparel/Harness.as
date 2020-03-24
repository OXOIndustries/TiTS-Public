package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Harness extends ItemSlotClass
	{

		//constructor
		public function Harness()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "Harness";
			
			//Regular name
			this.longName = "leather harness";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a black leather harness";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A black leather harness with five straps, four of which go around the wearer’s chest and back, while the fifth one is connected to a cock ring. The harness is extremely strong and can be used to hoist wearers onto the ceiling for certain ‘activities’.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 3900;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_CHEST);
			
			this.version = _latestVersion;
		}
	}
}