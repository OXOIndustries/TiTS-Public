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
	
	public class HLTent extends Tent
	{
		
		public function HLTent() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.TENT;
			
			this.shortName = "HL Tent I";
			this.longName = "hardlight survival tent";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a JoyCo-branded hardlight survival tent";
			
			this.tooltip = "While traditional tents are known for their reliability, hardlight tents have come into popularity in the last several centuries, owing to their durability, ability to vacuum-seal themselves to protect against hazards like toxic storms, and surprising lightness. Typical hardlight survival tents weigh no more than the lightest grenades.\n\nThis particular JoyCo model is lighter than most, manufactured for light survival use. Its small power core requires <b>three days</b> to replenish its charge via its miniaturized kinetic generator. To many, this is a major flaw. To explorers who might need to avoid one surprise downpour when they're too far from town, it's perfect.\n\n<b>This item is only usable in hazardous areas.</b>\n<b>Cooldown:</b> 3 days.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 250;
			lastUseAt = -10000;
			cooldown = 24*60*3;
			
			this.version = this._latestVersion;
		}
	}
}