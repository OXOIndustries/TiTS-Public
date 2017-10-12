package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class CryroPistol extends ItemSlotClass
	{
		//Level 2 (Rare). Balance 2.0
		//constructor
		public function CryroPistol()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "CryroP";
			
			//Regular name
			this.longName = "cryropistol";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a cryropistol";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A seldom-made weapon capable of delivering pellets of near zero kelvin fluid to a target. A curious weapon for sure; it could prove useful against cold-blooded creatures.";
			this.attackVerb = "shoot";
			attackNoun = "cryro-capsule";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 300;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.freezing.damageValue = 8;
			//baseDamage.addFlag(DamageFlag.BULLET);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 5;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
