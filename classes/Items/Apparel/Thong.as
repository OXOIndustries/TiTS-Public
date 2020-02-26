package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Thong extends ItemSlotClass
	{
		//constructor
		public function Thong()
		{
			this._latestVersion = 2;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "Thong";
			
			//Regular name
			this.longName = "thong";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a thong";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A simple set of underwear that barely qualifies as clothing on many planets. It’s made of ultralastic and chameleon silk, and is completely hydrophobic, making it useful as a swimsuit.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 550;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR];
			
			this.version = _latestVersion;
		}
		
		public function UpgradeVersion1(d:Object):void
		{
			d.basePrice = 550;
			d.sexiness = 1;
			d.itemFlags = [GLOBAL.ITEM_FLAG_SWIMWEAR];
		}
	}
}
