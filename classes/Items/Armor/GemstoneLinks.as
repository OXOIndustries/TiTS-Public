package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class GemstoneLinks extends ItemSlotClass
	{
		//constructor
		public function GemstoneLinks()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "Gem Links";
			
			//Regular name
			this.longName = "gemstone links";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a teasing arrangement of gemstone links";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Black and blue gemstones along a thin silvery chain, the links slide over the body as the wearer moves, creating the imagery of ice flowing over a waterfall. Equally effective when used to seduce hostile opponents as it is when giving a lover a private show.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 4500;
			this.attack = 5;
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 10;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
