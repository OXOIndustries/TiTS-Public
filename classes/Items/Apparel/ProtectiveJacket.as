package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ProtectiveJacket extends ItemSlotClass
	{
		//constructor
		//Level 4 (Common). Balance 2.0
		public function ProtectiveJacket()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "P.Jacket";
			
			//Regular name
			this.longName = "protective jacket";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an armored leather jacket";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Reveling in the sort of stylish fashion and utter swagger only a deprecated wasteland environment could provide, this auburn brown jacket could woo the folks at home and make anyone look good rocking a pompadour. It jingles faintly with each shake though, betraying the armored plates inside of it. Of course, no protective equipment would be complete without a matching set of pants and comfortable undershirt.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 900;
			this.attack = 0;
			this.defense = 6;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 4;
			this.resolve = 1;
			this.critBonus = 2;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}