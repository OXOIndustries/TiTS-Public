package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * ...
	 * @author lighterfluid
	 */
	public class PetraWhip extends ItemSlotClass 
	{
		//ownerClass: pc's class, or nothing for petra's version
		public function PetraWhip() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "PhasicWhip";
			this.longName = "Petra's phasic whip";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a phasic whip";
			this.tooltip = "A rather brutal and cumbersome custom-weapon, the Phasic Whip is a three-branch whip that";
			this.tooltip += " thrums with an electrical current when activated. While it’s robust enough (and heavy enough)";
			this.tooltip += " to just be slammed into an enemy with precise and skillful blows, it originally appears to be used";
			this.tooltip += " for ensnarement against single targets.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "whip";
			attackNoun = "whip";
			
			this.basePrice = 77000;
			this.attack = 5;
			
			baseDamage.electric.damageValue = 10;
			baseDamage.kinetic.damageValue = 20;
			
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.critBonus = 10;
			this.evasion = -10;
		}
	}
}