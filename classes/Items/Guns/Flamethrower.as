package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class Flamethrower extends ItemSlotClass
	{
		//Level 2 (Rare). Balance 2.0
		//constructor
		public function Flamethrower()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "F.Thrwr";
			
			//Regular name
			this.longName = "flamethrower";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a flamethrower";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Most of the galaxy has moved on from the primitive flamethrower to favor less volatile weapons. Nevertheless, more barbaric worlds still employ these weapons of fire-belching death as an essential part of warfare. This particular specimen has any manufacturer’s insignia skillfully lasered off. There’s probably a crooked quartermaster pocketing a pile of credits somewhere.";
			this.attackVerb = "spray";
			attackNoun = "stream of flames";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 300;
			this.attack = 6;
			
			baseDamage = new TypeCollection();
			baseDamage.burning.damageValue = 8;
			baseDamage.addFlag(DamageFlag.NO_CRIT);
			addFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE);
			this.addFlag(GLOBAL.ITEM_FLAG_THOWER_WEAPON);
			
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
