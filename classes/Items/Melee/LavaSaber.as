package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class LavaSaber extends ItemSlotClass
	{
		//constructor
		public function LavaSaber()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "L.Saber";
			
			//Regular name
			this.longName = "lava saber";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a lava saber";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Feared for their relentless, burning strikes, Lava Sabers use directed hardlight fields to constrain a reservoir of liquid metal into a blade-like shape. Their heavy, insulated sheaths use kinetic energy capture to recharge the top-end capacitors in the hilt and minimize their power draw when not in use.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "burning slash";
			attackNoun = "burning slash";
			
			//Information
			this.basePrice = 14199;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 4;
			baseDamage.burning.damageValue = 14;
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