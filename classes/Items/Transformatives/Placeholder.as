package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.GameData.CodexManager;
	import classes.Engine.Map.InShipInterior;
	import classes.Engine.Utility.IncrementFlag;
	
	public class Placeholder extends ItemSlotClass
	{
		//Placeholder
		public function Placeholder()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "Placeholder";
			
			//Regular name
			this.longName = "TamaniCorp Placeholder";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a TamaniCorp Placeholder";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Stuff!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1;
			
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			this.version = _latestVersion;
		}	
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if (target is PlayerCharacter) 
			{
				return kGAMECLASS.placeholderInstallation();
			}
			else
			{
				clearOutput();
				output(target.capitalA + target.short + " cannot use the Placeholder.");
			}
			return false;
		}	
	}
}
