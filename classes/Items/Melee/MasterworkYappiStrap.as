package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class MasterworkYappiStrap extends ItemSlotClass
	{
		//Level 7 (Common) Balance 2.0
		//constructor
		public function MasterworkYappiStrap()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "MW.Yappi";
			
			//Regular name
			this.longName = "masterwork yappi strap";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a masterwork yappi strap";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "An exotic mixture of a whip and a club, refined to near perfection by a master smith’s hand. Hurts like a frostwyrm cockslap. The better balance and lighter weight materials make this weapon much easier to swing multiple times in a row.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "smack";
			attackNoun = "smack";
			
			//Information
			this.basePrice = 7000;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 22;
			baseDamage.addFlag(DamageFlag.CRUSHING);
			//addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 1;
			this.critBonus = 4;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}
