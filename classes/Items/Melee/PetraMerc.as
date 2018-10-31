package classes.Items.Melee 
{
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	/**
	 * ...
	 * @author lighterfluid
	 */
	public class PetraMerc extends PetraWhip 
	{
		
		public function PetraMerc() 
		{
			this.tooltip += "\n\nIt seems ripe for modification and as [pc.aStartingCareer], you’ve been able to ";
			this.tooltip += "add some shielding to the hand-grip and mace tips to the end for knocking targets down.";
			this.shortName = "PhasicWhipM"; 
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			this.baseDamage.addFlag(DamageFlag.CHANCE_APPLY_STUN);
			this.fortification = 10;
		}
		
	}

}