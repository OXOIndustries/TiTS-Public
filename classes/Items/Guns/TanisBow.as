package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class TanisBow extends ItemSlotClass
	{
		//constructor
		public function TanisBow()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Tanis's Bow";
			
			//Regular name
			this.longName = "Tanis's bow";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "Tanis's compound bow";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A compound bow made to the specifications of the leithan scout Tanisaran, who trained you in the ancient tradition of leithan bowhunting. It's a huge bow, but light as a feather and almost unbelievably easy to draw. Your arrows are tipped with acid bulbs that shatter on impact, splattering the target."
			this.attackVerb = "shoot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 6500;
			
			baseDamage.kinetic.damageValue = 12;
			baseDamage.corrosive.damageValue = 12;
			
			
			this.attack = 2;
			this.critBonus = 2;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.addFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON);

			this.version = _latestVersion;
		}
	}
}