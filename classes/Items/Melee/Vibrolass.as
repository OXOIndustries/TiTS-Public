package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection; 
	import classes.Engine.Combat.DamageTypes.DamageFlag; 
	
	/**
	 * @author Zavos
	 */
	 
	public class Vibrolass extends ItemSlotClass
	{
		//Level 9 (common). Balance 2.0
		public function Vibrolass()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Vibrolass";
			
			//Regular name
			this.longName = "Vibrolass";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a vibro-cutlass";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A short, broad and slightly curved blade, often associated with space pirates (and for good reason). Compact engines built into the blade’s spine allow it to vibrate at high speeds for that extra bite.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "slash"; 
			attackNoun = "slash"; 
			
			//Information
			this.basePrice = 35000;
			this.attack = 4; 
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 4;
			this.fortification = 0;
			
			
			this.baseDamage = new TypeCollection(); 
			this.baseDamage.kinetic.damageValue = 30;
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			
			this.version = _latestVersion;
		}
	}
}