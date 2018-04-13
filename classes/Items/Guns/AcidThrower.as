package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class AcidThrower extends ItemSlotClass
	{
		//Level 4 (Rare). Balance 2.0
		//constructor
		public function AcidThrower()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "A.Thrwr";
			
			//Regular name
			this.longName = "acidthrower";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an acidthrower";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This mechanical device is designed to project a stream of pressurized acid over a long distance. Its design is based on that of the standard flamethrower, but modified to use next-gen corrosive compounds instead of flammable liquids. The heavy backpack hinders movement considerably.";
			this.attackVerb = "spray";
			attackNoun = "acid stream";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1300;
			this.attack = 11;
			
			baseDamage = new TypeCollection();
			baseDamage.corrosive.damageValue = 17;
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
