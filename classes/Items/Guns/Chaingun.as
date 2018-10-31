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
	 * @author Fenoxofenbuttttt
	 */
	public class Chaingun extends ItemSlotClass
	{
		//Level 7 (Common). Balance 2.0
		public function Chaingun() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Chaingn";
			
			//Regular name
			this.longName = "chaingun";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a chaingun";
			
			//Displayed on tooltips during mouseovers
			tooltip = "A set of five rotating barrels allows this weapon to fire obscene amounts of projectiles without overheating. Though the design is ancient, modern advancements have further improved the fire rate while virtually eliminating mechanical failure. The only drawback is the size and weight.";
			this.attackVerb = "shoot";
			attackNoun = "shot"
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 7000;
			this.attack = 6;
			
			baseDamage.kinetic.damageValue = 28;
			baseDamage.addFlag(DamageFlag.BULLET);
			addFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR);
			addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			baseDamage.addFlag(DamageFlag.NO_CRIT);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = -2;
			this.fortification = 0;

			this.version = _latestVersion;
		}
		
	}

}