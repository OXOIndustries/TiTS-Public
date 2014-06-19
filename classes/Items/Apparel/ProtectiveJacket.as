package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ProtectiveJacket extends ItemSlotClass
	{
		//constructor
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
			this.tooltip = "Revelling in the sort of stylish fashion and utter swagger only a deprecated wasteland environment could provide, this auburn brown jacket could woo the folks at home and make anyone look good rocking a pompadour. It jingles faintly with each shake though, betraying the armored plates inside of it.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 2500;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 4;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 1;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = _latestVersion;
		}
	}
}