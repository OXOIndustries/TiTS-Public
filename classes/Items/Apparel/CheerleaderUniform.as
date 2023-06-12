package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * @author Gedan
	 */
	public class CheerleaderUniform extends ItemSlotClass
	{
		//Level 3 (Common). Balance 2.0
		public function CheerleaderUniform() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "Chr.Ldr.";
			
			this.longName = "cheerleader uniform";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a cheerleader uniform";
			
			this.tooltip = "An incredibly sexy cheerleader uniform. It consists of a tight colorful top, short pleated skirt, and pom-poms!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 440;
			this.attack = 4;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 3;
			this.evasion = 6;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
	}
}
