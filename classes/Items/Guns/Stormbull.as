package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class Stormbull extends ItemSlotClass
	{
		//Level 9 (Common). Balance 2.0
		//constructor
		public function Stormbull()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Strmbull";
			
			//Regular name
			this.longName = "Stormbull shotgun"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Stormbull shotgun";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A popular bullpup semi-automatic shotgun with a drum magazine. Its large shell gauge, combined with the bullpup design, provides a good amount of firepower at close quarters, and the revolving drum magazine ensures the shotgun will not jam and can be reloaded quickly.";
			this.attackVerb = "shoot";
			attackNoun = "buckshot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 27000;
			this.attack = 18;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 35;
			baseDamage.addFlag(DamageFlag.BULLET);
			//baseDamage.addFlag(DamageFlag.NO_CRIT);
			//addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = -6;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
