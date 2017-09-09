package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class HoldOutPistol extends ItemSlotClass
	{
		//Level 1. Balance 2.0
		//constructor
		public function HoldOutPistol()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Hld.Pistol";
			
			//Regular name
			this.longName = "hold-out pistol";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a hold-out pistol";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "[altTooltip HoldOutPistol]";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			//Information
			this.basePrice = 300;
			this.attack = 0;
			
			baseDamage.kinetic.damageValue = 5;
			baseDamage.addFlag(DamageFlag.BULLET);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 1;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
