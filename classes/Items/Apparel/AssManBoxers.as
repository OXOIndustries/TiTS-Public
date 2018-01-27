package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class AssManBoxers extends ItemSlotClass
	{
		//constructor
		public function AssManBoxers()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "AMB-Briefs";
			
			//Regular name
			this.longName = "Ass-Man Boxer Briefs";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pair of Ass-Man Boxer Briefs";
			
			//Displayed on tooltips during mouseovers
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			this.tooltip = "Beseiged by requests for more a more masculine piece of cum-storing technology, TamaniCorp answered with the Ass-Man Boxer Briefs. These undies, just like the Cumflation Control Boyshorts and Anal Princess Panties, utilize microscopic technology to establish a seal around the wearer's anus after taking a load of sexual fluid. Their fashionable cut of chameleon silk hugs every feature tightly in a chromatically-variable package.\n\nThe packaging displays Tamani next to a beef-cake with an absolutely swollen gut, flashing a thumbs up. He look quite satisfied with the product.\n\nA warning on the tag states, <i>“Seal not guaranteed for fluid quantities over 250L.”</i>";
			
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
