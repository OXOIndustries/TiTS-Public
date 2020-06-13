package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Stockings extends ItemSlotClass
	{
		//constructor
		public function Stockings()
		{
			this._latestVersion = 2;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "Stockings";
			
			//Regular name
			this.longName = "stockings and panties";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a set of stockings and panties";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This set consists of a pair of lacy panties along with silky stockings. As they’re made of chameleon silk, at a moment’s notice the stockings can switch to opaque, sheer or fishnet styles.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 850;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
		
		public function UpgradeVersion1(d:Object):void
		{
			d.basePrice = 850;
			d.sexiness = 2;
		}
	}
}
