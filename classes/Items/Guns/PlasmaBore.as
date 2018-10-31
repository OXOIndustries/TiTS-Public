package classes.Items.Guns 
{	
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Fenoxo
	 */
	public class PlasmaBore extends ItemSlotClass
	{
		//Level 8 (Common). Balance 2.0
		public function PlasmaBore() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "PlasmaBore";
			
			//Regular name
			this.longName = "plasma bore";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a spinarran plasma bore";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The mainstay of spinarran infantry, the plasma bore is a heavy plasma weapon that is designed for short and medium ranged engagements. It fires a fast, fat glob of boiling plasma that melts or vaporizes bodies and tunnels through rock with equal ease.";
			this.attackVerb = "shoot";
			attackNoun = "plasma blob";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 14000;
			this.attack = 10;
			
			//baseDamage.electric.damageValue = 5;
			baseDamage.burning.damageValue = 27;

			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.NO_CRIT);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			//this.critBonus = 5;
			this.critBonus = 0;
			this.evasion = -3;
			this.fortification = 0;

			this.version = _latestVersion;
		}
		
	}

}
