package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author Gedan
	 */
	public class BunnyOutfit extends ItemSlotClass
	{
		//Level 3 (Common). Balance 2.0
		public function BunnyOutfit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "Bunny.O";
			
			this.longName = "one-piece bunny outfit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a one-piece bunny outfit";
			
			this.tooltip = "This is a ‘JoyCo Bunny’ outfit. It’s not a full bunny outfit - there’s only satin ears and a fluffy tail. The rest of the outfit is hardly furry; a strapless one-piece bikini, black pantyhose, high heels, a collar with bow tie, and cuffs with cuff links. Wear it and be a Joy-Bunny!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 1000;
			this.attack = 5;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 2;
			this.evasion = 6;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
	}
}
