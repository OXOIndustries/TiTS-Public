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
	
	public class PyriteIssuedStim extends ItemSlotClass
	{
		//constructor
		public function PyriteIssuedStim()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.DRUG;
			
			//Used on inventory buttons
			this.shortName = "PI-Stim";
			
			//Regular name
			this.longName = "Pyrite-issued stimpen";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Pyrite-issue stimpen";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This self-contained injection system is loaded with potent drugs known to cause a rush of energy. Popular with mercenary forces and private militaries alike, PI-Stims can be found anywhere warriors prioritize combat effectiveness over long-term health.\n\n<b>Known to cause slight amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 35;
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
			var healing:int = 100;
			if(target.energy() + healing > target.energyMax())
			{
				healing = target.energyMax() - target.energy();
			}
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				//Consume:
				kGAMECLASS.output("You press the applicator tip against your arm and barely even feel the teltale pinch of an injection. The rush of jittery, high-octane energy has your [pc.legOrLegs] bouncing and your jaw clenching.");
				target.changeEnergy(healing);
			}
			else
			{
				if(inCombat()) kGAMECLASS.output("\n\n");
				else kGAMECLASS.clearOutput();
				kGAMECLASS.output((inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " injects the Pyrite-issue stimpen");
				if(healing > 0) kGAMECLASS.output(", getting a quick energy boost.");
				else kGAMECLASS.output(" to no effect.");
				target.changeEnergy(healing);
			}
			target.taint(1);
			return false;
		}
	}
}
