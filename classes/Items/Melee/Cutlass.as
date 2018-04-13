package classes.Items.Melee 
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
	public class Cutlass extends ItemSlotClass
	{
		//Level 2 (Rare). Balance 2.0
		public function Cutlass() 
		{
			this._latestVersion = 1;
			
			//A KNIFE
			//4
			
			//this.indexNumber = 4;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Cutlass";
			
			//Regular name
			this.longName = "steel cutlass";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a steel cutlass";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A fairly standard steel cutlass for the renaissance reenactor in all of us. This hefty sword is and has been a standard for close-quarters boarding actions since the age of sail and has analogs in most interstellar cultures. A favorite of pirates, raiders and navy officers the galaxy over.";
			
			this.attackVerb = "slash";
			attackNoun = "slash";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1;
			
			baseDamage.kinetic.damageValue = 9;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.attack = 3;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 1;
			this.fortification = 0;

			this.version = _latestVersion;
		}
		
	}

}