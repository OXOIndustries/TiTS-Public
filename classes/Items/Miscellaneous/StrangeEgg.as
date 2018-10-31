package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class StrangeEgg extends ItemSlotClass
	{
		//constructor
		public function StrangeEgg()
		{
			this._latestVersion = 1;
			this.hasRandomProperties = true;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.DRUG;
			
			//Used on inventory buttons
			this.shortName = "S.Egg";
			
			//Regular name
			this.longName = "strange egg";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a strange egg";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This egg is larger than most you’ve heard about and warm to the touch. Whatever is inside there, it’s still alive and moving. Your Codex identifies it as species UHS-1045. There’s no real data aside from a warning of danger and a high value for living eggs on less reputable markets.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			this.version = _latestVersion;
		}	
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.clearOutput();
				kGAMECLASS.output("You have no obvious use for a strange egg.");
			}
			else {
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " cannot use a strange egg.");
			}
			return true;
		}
	}
}
