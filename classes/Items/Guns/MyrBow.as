package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class MyrBow extends ItemSlotClass
	{
		//constructor
		public function MyrBow()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Myr Bow";
			
			//Regular name
			this.longName = "myr bow";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a myr hunting bow";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A large, heavy composite bow made for small game hunting by Red Myr elite, but repurposed for commando action in the Seven Years' War. The bow's arrows are tipped with darts that deliver a potent cocktail of red venom, sedatives, and aphrodisiacs to quickly and quietly debilitate its targets."
			this.attackVerb = "shoot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 6500;
			
			baseDamage.kinetic.damageValue = 1;
			baseDamage.drug.damageValue = 18;
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 3;
			this.evasion = 0;
			this.fortification = 0;
			
			this.addFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON);

			this.version = _latestVersion;
		}
	}
}