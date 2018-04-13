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
	 * @author Gedan
	 */
	public class NovaPistol extends ItemSlotClass
	{
		//Level 5 (Rare). Balance 2.0
		public function NovaPistol() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Nova Pstl.";
			
			//Regular name
			this.longName = "Nova pistol";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pistol salvaged from the Nova’s deck 13";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This primitive laser pistol was a favorite among starbound colonists in the early days of the planet rush scheme. It lacks the safety features and onboard lockouts that make modern commercial pistols reliable, but weak. This baby packs a punch, but it lacks the finesse and precision of more modern builds.";
			this.attackVerb = "shoot";
			attackNoun = "laser beam";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 2500;
			this.attack = 2;
			
			baseDamage = new TypeCollection();
			//baseDamage.electric.damageValue = 1;
			baseDamage.burning.damageValue = 18;
			baseDamage.addFlag(DamageFlag.LASER);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 4;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
		
	}

}
