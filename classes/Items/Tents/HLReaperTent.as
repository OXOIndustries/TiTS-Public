package classes.Items.Tents 
{
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.Tent;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.kGAMECLASS;
	import classes.Engine.Map.InShipInterior;
	
	public class HLReaperTent extends Tent
	{
		
		public function HLReaperTent() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.TENT;
			
			this.shortName = "HL Tent IV";
			this.longName = "hardlight survival tent";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a Reaper Armaments-branded hardlight survival tent";
			
			this.tooltip = "While traditional tents are known for their reliability, hardlight tents have come into popularity in the last several centuries, owing to their durability, ability to vacuum-seal themselves to protect against hazards like toxic storms, and surprising lightness. Typical hardlight survival tents weigh no more than the lightest grenades.\n\nReaper Armaments does not compromise on its products. Their survival tent, designed for use in the field by military forces over indefinite deployments, integrates the finest in portable power generation technologies: kinetic, thermal, solar - they're all there and made to military spec.\n\n<b>This item is only usable in hazardous areas.</b>\n<b>Cooldown:</b> 1 days.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 15000;
			lastUseAt = -10000;
			cooldown = Math.round(24*60*1);
			
			this.version = this._latestVersion;
		}
	}
}