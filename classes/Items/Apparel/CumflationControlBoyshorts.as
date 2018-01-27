package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class CumflationControlBoyshorts extends ItemSlotClass
	{
		//constructor
		public function CumflationControlBoyshorts()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "CCB-Shorts";
			
			//Regular name
			this.longName = "Cumflation Control Boyshorts";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pair of Cumflation Control Boyshorts";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Cumflation Control Boyshorts are the ideal undies for the discerning slut. Designed to provide liquid-tight seals for vaginas and anuses alike, this garment ensures the user's bareback inseminations will stay locked inside their body, where they belong. No matter how many sexual partners or how virile, Cumflation Control Boyshorts are ready to help save their love for later. The pressure seals are even rated withstand kui-tan sized loads. Up to 250L's of pussy packing, booty-stretching jism can be locked inside, leaving their wearer looking supremely pregnant.\n\nNow in chameleon silk, these boyshorts can have their pigmentation adjusted to suit the user's preference at a moment's notice. Smart-Fabric technology allows for a phallus-gap in the front to better suit male and hermaphrodite users. A similar setup on the back allows for comfortable wear with tails.\n\nThe packaging includes a picture of a very pregnant Tamani flashing a euphoric smile and a thumbs up.";
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 5000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_ANALLY_SEALED, GLOBAL.ITEM_FLAG_VAGINALLY_SEALED];
			
			this.version = _latestVersion;
		}
	}
}
