package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ThermalScalpel extends ItemSlotClass
	{
		//constructor
		public function ThermalScalpel()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "T.Scalpel";
			
			//Regular name
			this.longName = "thermal scalpel";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a thermal scalpel";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A small plasma weapon designed to cut through metal armor, hard mineral ore, and limbs with equal ease.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "slash";
			attackNoun = "burning slash";
			
			//Information
			this.basePrice = 20000;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 2;
			baseDamage.burning.damageValue = 21;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_BURN);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 5;
			this.evasion = 3;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}