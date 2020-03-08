package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Fenbutt
	 */
	public class Rouser extends ItemSlotClass
	{	
		//Level 11 (Rare) Balance 2.0
		//Fighting knife with acid reservoir. Corrosive. Penetrating.
		public function Rouser() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "Rouser";
			this.longName = "rouser";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a rouser";
			
			this.tooltip = "Are you sick of having to repeat yourself? Wish there was some way to leave a lasting impression? With Paragon Incorporated’s Rouser-type fighting knife, now you can! Every dagger contains a reservoir of the very same acidic compounds used in Dhaal’s industrial manufacturing. If the knife wound doesn’t make your point, the resultant bubbling scar certainly will.";
			this.attackVerb = "stab";
			attackNoun = "acid";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 143000;
			this.attack = 0;
			this.critBonus = 2;
			this.evasion = 10;
			baseDamage.kinetic.damageValue = 10.0;
			baseDamage.corrosive.damageValue = 16.0;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.version = _latestVersion;
		}	
	}
}