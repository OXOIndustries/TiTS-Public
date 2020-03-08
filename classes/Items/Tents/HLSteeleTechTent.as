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
	
	public class HLSteeleTechTent extends Tent
	{
		
		public function HLSteeleTechTent() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.TENT;
			
			this.shortName = "HL Tent II";
			this.longName = "hardlight survival tent";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a SteeleTech-branded hardlight survival tent";
			
			this.tooltip = "While traditional tents are known for their reliability, hardlight tents have come into popularity in the last several centuries, owing to their durability, ability to vacuum-seal themselves to protect against hazards like toxic storms, and surprising lightness. Typical hardlight survival tents weigh no more than the lightest grenades.\n\nThese SteeleTech models come with a more expensive power cell and kinetic charger than the JoyCo equivalent, allowing them to be used far more frequently. They also come with the added bonus of user-customizable coloration, though the default settings are set to a stylish black-and-yellow scheme.\n\n<b>This item is only usable in hazardous areas.</b>\n<b>Cooldown:</b> 2 days.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 999;
			lastUseAt = -10000;
			cooldown = 24*60*2;
			
			this.version = this._latestVersion;
		}
	}
}