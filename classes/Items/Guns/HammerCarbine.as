package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class HammerCarbine extends ItemSlotClass
	{
		//constructor
		public function HammerCarbine()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Hammer C.";
			
			//Regular name
			this.longName = "hammer carbine";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a hammer carbine";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A questionably civilian-legal modification of the popular Hammer pistol, the Hammer Carbine features a folding stock for greater accuracy, an expanded magazine, and a three-round burst trigger mod, greatly increasing damage-per-hit over its smaller cousin.";
			this.attackVerb = "shoot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 4000;
			this.attack = 1;
			this.damage = 14;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);

			this.version = _latestVersion;
		}
	}
}