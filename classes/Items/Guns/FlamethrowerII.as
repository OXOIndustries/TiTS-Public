package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class FlamethrowerII extends ItemSlotClass
	{
		//Level 4 (Common). Balance 2.0
		//constructor
		public function FlamethrowerII()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "F.ThrwrII";
			
			//Regular name
			this.longName = "mark II flamethrower";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a mark II flamethrower";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Though no designation actually signifies this flamethrower is of any specific make, the features and craftsmanship on display make it clear it is no bottom-tier weapon from a barely-industrialized society.";
			this.attackVerb = "spray";
			attackNoun = "stream of flames";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 850;
			this.attack = 10;
			
			baseDamage = new TypeCollection();
			baseDamage.burning.damageValue = 16;
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
