package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.inCombat;
	
	public class ThermalPack extends ItemSlotClass
	{
		
		//constructor
		public function ThermalPack()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "T.Pack";
			
			//Regular name
			this.longName = "Thermal Pack";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Thermal Pack";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This disposable device is roughly the size of an egg. Upon activation, it emits a microwave field around you to protect you from some of the negative effects of the cold. It probably can't handle the deep freezes of a snowstorm, though.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 60;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			//this.combatUsable = true;
			this.targetsSelf = true;
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				//Consume:
				kGAMECLASS.output("You squeeze the top and bottom of the silver egg together. With a soft hum, it begins to float slowly around you, orbiting you like a tiny moon. Around its center, a red ring glows brightly, bathing you with a mild heat.");
				if(!target.hasStatusEffect("T.Pack")) target.createStatusEffect("T.Pack",0,0,0,0,false,"Icon_Smelly","You are protected from Uveto's harsh cold... for now!",false,1440);
			}
			else
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " activates the Thermal Pack.");
				if(!target.hasStatusEffect("T.Pack")) target.createStatusEffect("T.Pack",0,0,0,0,false,"Icon_Smelly","Currently being protected from Uveto's harsh cold... for now!",false,1440);
			}
			return false;
		}
	}
}
