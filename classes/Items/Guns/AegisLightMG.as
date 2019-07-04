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
		//Level 8 (Rare). Balance 2.0
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
			tooltip = "A military-grade squad automatic weapon, the Aegis is a high-tech solution to front line offense and defense. Equipped with a huge box of ammunition, the user can send a withering hail of bullets down range and generate a hardlight shield around the weapon’s muzzle, creating a moving point of cover in whatever direction he or she is firing.";
			this.attackVerb = "shoot";
			attackNoun = "shot"
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 20000;
			this.attack = 10;
			
			baseDamage.kinetic.damageValue = 29;
			baseDamage.addFlag(DamageFlag.BULLET);
			addFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR);
			addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			this.addFlag(GLOBAL.ITEM_FLAG_RIFLE_WEAPON);
			baseDamage.addFlag(DamageFlag.NO_CRIT);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 25;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = -2;
			this.fortification = 0;

			this.version = _latestVersion;
		}
		
	}

}