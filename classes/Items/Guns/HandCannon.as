package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class HandCannon extends ItemSlotClass
	{
		//Level 9. Balance 2.0
		//constructor
		public function HandCannon()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "H.Cannon";
			
			//Regular name
			this.longName = "hand cannon";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a hand cannon";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Most pistols are designed to efficiently put rounds downrange without breaking the wielder’s wrist. This one is designed to throw a super-heated lead slug at a target with absolutely no concern for the crushing amounts of recoil. The perfect weapon for when you absolutely must destroy a target - assuming you can hit it.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			//Information
			this.basePrice = 40000;
			this.attack = -4;
			
			baseDamage.kinetic.damageValue = 14;
			baseDamage.burning.damageValue = 13;
			baseDamage.addFlag(DamageFlag.BULLET);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 10;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
