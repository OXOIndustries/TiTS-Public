package classes.Items.Guns 
{	
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class AegisLightMG extends ItemSlotClass
	{
		
		public function AegisLightMG() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Aegis MG";
			
			//Regular name
			this.longName = "aegis light machinegun";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an aegis light machinegun";
			
			//Displayed on tooltips during mouseovers
			tooltip = "A streamlined, clean-looking machine gun. No fancy bells or whistles, designed expressly to shoot a man dead, and shoot him very dead. There’s just the slight issue that the thing looks about four times larger than it should be, what with it having been designed to be wielded by an operator encased in a suit of tank-like power armor. Large enough, almost, to act as a defensive tool.";
			this.attackVerb = "shoot";
			attackNoun = "shot"
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 12500;
			this.attack = -3;
			
			baseDamage.kinetic.damageValue = 25;
			baseDamage.addFlag(DamageFlag.BULLET);
			addFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 10;

			this.version = _latestVersion;
		}
		
	}

}