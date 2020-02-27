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
	
	public class HLKihaCorpTent extends Tent
	{
		
		public function HLKihaCorpTent() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.TENT;
			
			this.shortName = "HL Tent III";
			this.longName = "hardlight survival tent";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a KihaCorp-branded hardlight survival tent";
			
			this.tooltip = "While traditional tents are known for their reliability, hardlight tents have come into popularity in the last several centuries, owing to their durability, ability to vacuum-seal themselves to protect against hazards like toxic storms, and surprising lightness. Typical hardlight survival tents weigh no more than the lightest grenades.\n\nKihaCorp's recent take on the ubiquitous survival structure comes with higher grade components than you'll find in a comparable JoyCo model and some brand-new, high-grade engineering. Integrating an addition electro-thermal interface allows for this model to recharge relatively quickly - quick enough for the hottest-blooded races to use this as a long-term camping solution. Mere warm-blooded life-forms are advised to bring a second.\n\n<b>This item is only usable in hazardous areas.</b>\n<b>Cooldown:</b> 1.5 days.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 5000;
			lastUseAt = -10000;
			cooldown = Math.round(24*60*1.5);
			
			this.version = this._latestVersion;
		}
	}
}