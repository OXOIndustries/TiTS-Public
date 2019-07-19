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
	
	public class DongDesigner extends ItemSlotClass
	{
		//constructor
		public function DongDesigner()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.GADGET;
			//Used on inventory buttons
			this.shortName = "Dong D.";
			//Regular name
			this.longName = "TamaniCorp Dong Designer";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a TamaniCorp Hora Series Dong Designer";
			//Displayed on tooltips during mouseovers
			this.tooltip = "Lettering in luminescent paint declares it to be a TamaniCorp Dong Designer. These things are incredibly expensive, even in the core. You’ve seen them in less savory holos - they get installed in elite nightclubs or exclusive spas, particularly along the human/ausar border worlds where the two races mix.\n\nWith only a few button presses, you can use this to change the appearance of your penis to be satisfying to a partner of almost any race. It even interfaces directly with your codex to automatically unlock new transformations discovered during the Rush. Of course, you found this one on a junkyard, so maybe there’s something strange about it.\n\n<b>Known to cause moderate amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 5000;
			
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			this.version = this._latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.cockBoxInstallation();
			}
			//Not player!
			else
			{
				clearOutput();
				output(target.capitalA + target.short + " takes a look at the box, then shakes " + target.mfn("his","her","its") + " head.");
			}
			return false;
		}
	}
}

