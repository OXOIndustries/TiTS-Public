package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Hoverboard extends ItemSlotClass
	{
		//constructor
		public function Hoverboard()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "Hoverboard";
			
			//Regular name
			this.longName = "pink hoverboard";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pink hoverboard";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Hoverboards fell out of style in the core centuries before you were born, but they're still making them for those who need a speedy way to navigate crowded or caustic areas. This particular one is a faded pink marred by hard wear and gleaming new components from the mechanic who fixed it. It appears to have originally been stamped with the logo of a girl's toy line, but time has stripped away any legibility from the characters.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 3999;
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
			
			this.isUsable = false;
			
			this.version = _latestVersion;
		}	
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(!kGAMECLASS.debug) quantity++;
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.clearOutput();
				kGAMECLASS.output("So long as you keep this item in your inventory, you use it automatically to speed travel.");
			}
			else {
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " cannot use this.");
			}
			return false;
		}
	}
}
