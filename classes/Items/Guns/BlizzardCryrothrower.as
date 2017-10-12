package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class BlizzardCryrothrower extends ItemSlotClass
	{
		//Level 4 (Common). Balance 2.0
		//constructor
		public function BlizzardCryrothrower()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "BC.Thrwr";
			
			//Regular name
			this.longName = "Blizzard cryrothrower"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Blizzard cryrothrower";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The “Blizzard” is a retrofitted device originally designed to cool down starship reactors and modified to be used as a weapon. It's a devastating piece of technology; the mere thought of using this on a living being just gives you the chills.";
			this.attackVerb = "spray";
			attackNoun = "blast";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 850;
			this.attack = 10;
			
			baseDamage = new TypeCollection();
			baseDamage.freezing.damageValue = 16;
			baseDamage.addFlag(DamageFlag.NO_CRIT);
			addFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = -4;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
