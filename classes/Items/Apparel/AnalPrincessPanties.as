package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class AnalPrincessPanties extends ItemSlotClass
	{
		//constructor
		public function AnalPrincessPanties()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "AP-Panties";
			
			//Regular name
			this.longName = "Anal Princess Panties";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pair of Anal Princess Panties";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Emboldened by the success of its Slut-Seal Thong, TamaniCorp took their patented orifice-sealing technology behind closed doors for months in order to produce a successor. The result a whole new way of storing up baby-batter: Anal Princess Panties. On the surface, they might appear to be cute, pink panties, but inside their heiny-hugging fabric lies an array of proprietary microscopic machinery, just waiting to convert stray cum into a perfect, butthole-girding seal. With a pair of these on, you won't lose more than single drop worth of liquid-love, no matter how packed your asshole.\n\n<i>“Anal Princess”</i> is written across the back in glittery purple cursive.\n\nA warning on the tag states, <i>“Panty seal not guaranteed for fluid quantities over 250L.”</i>";
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
