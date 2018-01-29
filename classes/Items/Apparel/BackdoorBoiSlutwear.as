package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class BackdoorBoiSlutwear extends ItemSlotClass
	{
		//constructor
		public function BackdoorBoiSlutwear()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "BB-Slutwear";
			
			//Regular name
			this.longName = "Backdoor Boi Slutwear";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "some Backdoor Boi Slutwear";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Emboldened by the success of its Slut-Seal Thong, TamaniCorp took their patented orifice-sealing technology behind closed doors for months in order to produce a successor. The result a whole new way of storing up liquid butt-love: Backdoor Boi Slutwear. On the surface, it might appear like a boner-hugging thong for men, but inside its cock-wrapping fabric lies an array of proprietary microscopic machinery, just waiting to convert stray cum into a perfect, butthole-girding seal. With a pair of these on, you won’t lose more than single drop worth of liquid-love, no matter how packed your asshole.\n\n<i>“Backdoor Boi Slut”</i> is written across the back in glittery white cursive. The strip of fabric for covering up the asshole is stamped with a red target.\n\nA warning on the tag states, <i>“Seal not guaranteed for fluid quantities over 250L.”</i>";
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 3500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_ANALLY_SEALED];
			
			this.version = _latestVersion;
		}
	}
}
