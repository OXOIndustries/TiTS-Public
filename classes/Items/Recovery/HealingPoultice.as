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
	
	public class HealingPoultice extends ItemSlotClass
	{
		
		//constructor
		public function HealingPoultice()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 5;
			this.type = GLOBAL.FOOD;
			
			//Used on inventory buttons
			this.shortName = "H.P.";
			
			//Regular name
			this.longName = "healing poultice";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a healing poultice";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "You can’t see the actual plants and herbs; they’re wrapped tightly in a thin gauze, which is tied shut at the top. You’re supposed to unravel the gauze, then apply the herbs to your body, and keep them in place <i>with</i> the gauze. It’s a bit primitive as far as medicine goes, and it’s too unwieldy to use more than once in a fight, but it’ll do in a pinch.\n\n<b>In Combat:</b> Restores 75 HP.\n<b>Out of Combat:</b> Restores 200 HP.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 40;
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
			var healing:int = 75;
			if(!inCombat()) healing = 200;
			if(target.HP() + healing > target.HPMax())
			{
				healing = target.HPMax() - target.HP();
			}
			if (target.hasStatusEffect("Healed"))
			{
				if(!kGAMECLASS.infiniteItems()) quantity++;
				if (target == kGAMECLASS.pc)
				{
					kGAMECLASS.clearOutput();
					kGAMECLASS.output("Using supplements to heal yourself will only work once per fight. No body can handle the metabolic strain of downing multiple regenerative items in such quick succession.");
				}
				else
				{
					if(inCombat()) kGAMECLASS.output("\n\n");
					else kGAMECLASS.clearOutput();
					kGAMECLASS.output(target.capitalA + target.short + " has already healed during this fight! Doing so again would be more than ill-advised!");
				}
				return false;
			}
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				//Consume:
				kGAMECLASS.output("You apply the poultice to your body");
				if(healing > 0) kGAMECLASS.output(" and instantly feel the alien enzymes go to work");
				kGAMECLASS.output(".");
				target.changeHP(healing);
			}
			else
			{
				if(inCombat()) kGAMECLASS.output("\n\n");
				else kGAMECLASS.clearOutput();
				kGAMECLASS.output((inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " opens a healing poultice and uses it");
				if(healing > 0) kGAMECLASS.output(", closing quite a few wounds.");
				else kGAMECLASS.output(" to no effect.");
				target.changeHP(healing);
			}
			if (inCombat()) target.createStatusEffect("Healed", 0, 0, 0, 0, true, "", "", true, 0);
			return false;
		}
	}
}
