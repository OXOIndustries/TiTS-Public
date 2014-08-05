package classes.Items.Miscellaneous 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class UthraSap extends ItemSlotClass
	{
		public function UthraSap() 
		{
			this._latestVersion = 1;
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.FOOD;
			
			this.shortName = "UthraSap";
			this.longName = "bottled uthra sap";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a small bottle of uthra sap";
			
			this.tooltip = "The Codex informs you the sap of the Uthra Birch is well known for its transformative properties. When applied to the breasts or testacles, it reduces them in size. It is a substance used by the vanae for ritual punishment.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 25;
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			// Shrink balls if balls > 0
			// Shrink tits if tits > 0
			
			if (!kGAMECLASS.debug) this.quantity++;
			kGAMECLASS.output("Nothing you can do with this yet.");
			return false;
		}
	}
}