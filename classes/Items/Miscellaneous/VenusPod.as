package classes.Items.Miscellaneous 
{
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.GLOBAL;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class VenusPod extends ItemSlotClass
	{
		
		public function VenusPod()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.FOOD;
			//Used on inventory buttons
			this.shortName = "VenusPod";
			//Regular name
			this.longName = "venus pitcher seed pod";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an unfertilized venus pitcher seed pod";
			//Displayed on tooltips during mouseovers
			this.tooltip = "You laid dis, you sloot. (Totes placeholder gtfo)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			//Information
			this.basePrice = 5;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if (!kGAMECLASS.debug) this.quantity++;
			kGAMECLASS.output("Nothing you can do with this yet.");
			return false;
		}
	}

}