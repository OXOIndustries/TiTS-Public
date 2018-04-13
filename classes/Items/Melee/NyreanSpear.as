package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class NyreanSpear extends ItemSlotClass
	{	
		//Level 7 (Common). Balance 2.0
		public function NyreanSpear() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "N.Spear";
			this.longName = "nyrean spear";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a two-handed combat spear";
			
			this.tooltip = "A two-handed spear carried by the nyrean huntresses roaming the surface of Myrellion.\n\nThe length of the shaft is wrapped in tight bindings - the same material the Nyrean hunting nets are made of - from tip to tail, obscuring the underlying structure, but making for superior grip. The business end is tipped with a wide, finely honed metal blade, the edges razor sharp.";
			this.attackVerb = "stab";
			attackNoun = "stab";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 6500;
			this.attack = 6;
			this.critBonus = 5;
			this.evasion = 5;
			baseDamage.kinetic.damageValue = 13.0;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.version = _latestVersion;
		}	
	}
}