package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author lighterfluid
	 */
	public class ReaperStunBaton extends ItemSlotClass
	{	
		public function ReaperStunBaton() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "RatBaton";
			this.longName = "reaper 'AA' stun rod";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a stun baton";
			
			this.tooltip = "Increased demands for a lightweight yet intimidating personal defense tool were answered by Reaper Armaments in the form of the 'Attitude Adjuster'. This glossy-black telescopic baton is the latest model in a new line of 'Electroshock Implementations'. The chief feature is a military-grade battery in the pommel that powers its muscle-seizing charge, capable of outputting 500,000 volts of neural chaos when striking its target. Four buttons placed neatly around the guard control the rod and its ominous electrical wreath.\n\nThis collapsible baton is a favorite among VIPs, Maximum Security Guards, and rich adventurers. Consequently, it is the perfect weapon for a gang of thieves looking only to subdue their targets with less-than-lethal force.";
			this.attackVerb = "hit";
			attackNoun = "hit";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 40000;
			this.attack = 8;
			this.critBonus = 8;
			baseDamage.kinetic.damageValue = 10.0;
			baseDamage.electric.damageValue = 16.0;
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_STUN);
            
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.version = _latestVersion;
		}	
	}
}