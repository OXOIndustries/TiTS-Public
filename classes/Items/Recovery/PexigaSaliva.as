package classes.Items.Recovery
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.inCombat;
	
	public class PexigaSaliva extends ItemSlotClass
	{
		
		//constructor
		public function PexigaSaliva()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.FOOD;
			
			//Used on inventory buttons
			this.shortName = "P.Saliva";
			
			//Regular name
			this.longName = "bottled pexiga saliva";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a bit of bottled pexiga saliva";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This bottled pexiga saliva is incredibly sweet. Just what you need for a pick-me-up in the field!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 15;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = true;
			this.targetsSelf = true;
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var healing:int = 70;
			if(target.energy() + healing > target.energyMax())
			{
				healing = target.energyMax() - target.energy();
			}
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				//Consume:
				kGAMECLASS.output("You knock back the gooey, sweet-tasting stuff with ease, finding it more than palatable to your tongue. It tingles pleasantly on your taste buds as it invigorates you.");
				if(healing > 0) kGAMECLASS.output(" You even feel like you could go longer before needing to sleep. Is there caffeine in this stuff?");
				target.changeEnergy(healing);
			}
			else
			{
				if(inCombat()) kGAMECLASS.output("\n\n");
				else kGAMECLASS.clearOutput();
				kGAMECLASS.output((inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " opens a vial of pexiga saliva and drinks it");
				if(healing > 0) kGAMECLASS.output(", getting a quick energy boost.");
				else kGAMECLASS.output(" to no effect.");
				target.changeEnergy(healing);
			}
			return false;
		}
	}
}
