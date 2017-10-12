package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class NANDeconstructor extends ItemSlotClass
	{
		//Level 9 (Common). Balance 2.0
		//constructor
		public function NANDeconstructor()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "NaN D.";
			
			//Regular name
			this.longName = "NaN Deconstructor"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a NaN Deconstructor";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This rare weapon fires a blob of modified microsurgeons programed to eat through both organic and inorganic targets. Its sale has been banned as 'cruel' throughout most of the core. On the fringes, it can still find use, but most prefer to stick to weapons that won't eat them alive if they spill the ammo.";
			this.attackVerb = "shoot";
			attackNoun = "nanite blob";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 27000;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.corrosive.damageValue = 26;
			//baseDamage.kinetic.damageValue = 16;
			//baseDamage.addFlag(DamageFlag.NO_CRIT);
			//addFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE);
			baseDamage.addFlag(DamageFlag.VAMPIRIC);
			baseDamage.addFlag(DamageFlag.PENETRATING);

			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 6;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
