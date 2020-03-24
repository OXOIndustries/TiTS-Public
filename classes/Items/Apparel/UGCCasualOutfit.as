package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class UGCCasualOutfit extends ItemSlotClass
	{
		//Level 2 (Common). Balance 2.0
		public function UGCCasualOutfit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "Penny Casual";
			
			this.longName = "casual outfit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a casual outfit";
			
			this.tooltip = "A too-small white T-shirt, with sleeves that reach halfway to her elbows; a hem that reaches just beneath the ribs, exposing midriff. It would to any breasts, leaving nothing to the imagination. Emblazoned on its front is a cutesy cartoon character – what looks like a pink cat-like creature with <i>huge</i> blue eyes, striking a playful pose, standing on top of some words written in a language you don’t immediately understand. For pants, it comes with a pair of cut-off jeans that hug tightly to the thighs; they also only reach halfway to the knees, exposing quite a lot of leg.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 220;
			this.attack = 1;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 1;
			this.resolve = 4;
			this.critBonus = 0;
			this.evasion = 4;
			this.fortification = 20;
			
			this.version = this._latestVersion;
		}
		
	}

}
