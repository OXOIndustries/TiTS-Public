package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class ZilBow extends ItemSlotClass
	{
		//constructor
		public function ZilBow()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "ZilBow";
			
			//Regular name
			this.longName = "zil champion’s bow";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a zil champion’s bow";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A small bow made out of pliant wood and fibrous thread, complete with a quiver of dart-like arrows. Well suited to the tight confines of the Mhen’gan jungle."
			this.attackVerb = "shoot";
			attackNoun = "arrow";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 6500;
			
			baseDamage.kinetic.damageValue = 4;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.attack = 0;
			this.critBonus = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.evasion = 5;
			this.fortification = 0;
			
			this.addFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON);

			this.version = _latestVersion;
		}
	}
}