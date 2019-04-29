package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class AcidLauncher extends ItemSlotClass
	{
		//Level 7 (Common). Balance 2.0
		//constructor
		public function AcidLauncher()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "A.Lnchr";
			
			//Regular name
			this.longName = "acid launcher"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an acid launcher";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This simple dumbfire rocket launcher is loaded with special projectiles: rockets full of an extremely corrosive synthetic fluid, designed to break down molecules more rapidly than traditional chemistry could possibly explain.";
			this.attackVerb = "fire";
			attackNoun = "rocket";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 7000;
			this.attack = -10;
			
			baseDamage = new TypeCollection();
			baseDamage.corrosive.damageValue = 29;
			//baseDamage.addFlag(DamageFlag.NO_CRIT);
			//addFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE);
			this.addFlag(GLOBAL.ITEM_FLAG_LAUNCHER_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = -2;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
