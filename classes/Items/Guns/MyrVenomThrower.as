package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class MyrVenomThrower extends ItemSlotClass
	{
		//Level 7 (Common). Balance 2.0
		//constructor
		public function MyrVenomThrower()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "VnmThrwr";
			
			//Regular name
			this.longName = "myr venom thrower"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a myr venom thrower";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A modified flamethrower converted to expell a gaseous form of the red Myr’s venom. It appears to be based upon a repurposed gold myr design.";
			this.attackVerb = "gas";
			attackNoun = "red venom gas";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 7000;
			this.attack = 3;
			
			baseDamage = new TypeCollection();
			baseDamage.drug.damageValue = 6;
			baseDamage.addFlag(DamageFlag.NO_CRIT);
			addFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
