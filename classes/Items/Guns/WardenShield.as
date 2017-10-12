package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class WardenShield extends ItemSlotClass
	{
		//Level 4 (Common). Balance 2.0
		//constructor
		public function WardenShield()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "WardenS.";
			
			//Regular name
			this.longName = "warden shield";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a warden shield";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The warden shield is an exotic, scarcely manufactured piece. After failing at market over ten years ago, it fell into obscurity and disuse. The design is fairly basic, with a wrist strap designed to attach to the shield on command. The shield itself has a basic hoverdrive built into the underside to allow it to be thrown extremely long distances - and return to the wielder on command. It is a \"weapon\" for the user who would rather fight with brute strength than the finesse of a firearm.";
			this.attackVerb = "throw";
			attackNoun = "shield";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 850;
			this.attack = 5;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 4;
			//baseDamage.addFlag(DamageFlag.BULLET);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 5;
			this.fortification = 20;

			this.version = _latestVersion;
		}
	}
}
