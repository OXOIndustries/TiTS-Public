package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ClimbingKit extends ItemSlotClass
	{
		//constructor
		public function ClimbingKit()
		{
			this._latestVersion = 1;
			//this.hasRandomProperties = true;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "ClimbKit";
			
			//Regular name
			this.longName = "climbing kit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a climbing kit";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "An advanced climbing kit meant for extreme environments, includes emergency stabilizers, laser pitons, and synth-weave rope and hooks. Should allow for much easier ascents and descent of extreme climbs.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}	
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(!kGAMECLASS.infiniteItems()) quantity++;
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.clearOutput();
				if(kGAMECLASS.silly) kGAMECLASS.output("Professor Oak: ");
				kGAMECLASS.output("You cannot use this now.");
			}
			else {
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " cannot use this.");
			}
			return true;
		}
	}
}
