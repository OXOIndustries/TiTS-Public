package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class KorgGreatBow extends ItemSlotClass
	{
		//Level 7 (Common) Balance 2.0
		//constructor
		public function KorgGreatBow()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "KorgBow";
			
			//Regular name
			this.longName = "korgonne greatbow";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a korgonne greatbow";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A heavily built bow with large arrows, designed to be an intimidating tool for exceptionally strong korgonne. Despite being built with the small stature of their people in mind, it still manages to be a challenge to wield properly for people of other races who lack significant strength."
			this.attackVerb = "shoot";
			attackNoun = "arrow";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 8000;
			
			baseDamage.kinetic.damageValue = 26;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.attack = 8;
			this.critBonus = 6;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.evasion = -2;
			this.fortification = 0;
			
			this.addFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON);
			this.addFlag(GLOBAL.ITEM_FLAG_HIGH_PHYSIQUE);

			this.version = _latestVersion;
		}
	}
}