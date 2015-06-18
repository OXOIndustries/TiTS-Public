package classes.Items.Miscellaneous 
{
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.Characters.PlayerCharacter;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class RedMyrBlood extends ItemSlotClass
	{
		
		public function RedMyrBlood()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.QUESTITEM;
			//Used on inventory buttons
			this.shortName = "MyrBlood";
			//Regular name
			this.longName = "red myr blood";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a blood sample taken from a red myr";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A small medical vial filled with a sample of red myr blood.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			//Information
			this.basePrice = 0;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			 // Player uses this!
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output("There is nothing you can do with this yet.");
				if(!kGAMECLASS.infiniteItems()) this.quantity++;
			}
			// Not the player!
			else
			{
				kGAMECLASS.output("\n\n");
				kGAMECLASS.output(target.capitalA + target.short + " fails to use the seed correctly and inadvertently destroys it in the process.");
			}
			return false;
		}
	}

}