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
	
	public class OSStimBoost extends ItemSlotClass
	{
		
		//constructor
		public function OSStimBoost()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			this.combatUsable = true;
			this.requiresTarget = false;
			
			//Used on inventory buttons
			this.shortName = "OS StimBoost";
			
			//Regular name
			this.longName = "One Shot Stim Booster";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a one-shot stimbooster";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A hypospray containing a single dose of stimulant boost of microsurgeons.";
			
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
			
			this.version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			// Item loot usage check assistance
			kGAMECLASS.flags["KI_CMO_MEDSUPPLIES"] = 2;
			
			if (usingCreature == null) usingCreature = kGAMECLASS.pc;
			
			if (usingCreature == kGAMECLASS.pc)
			{
				if (target.HP() >= target.HPMax() && target.energy() >= target.energyMax())
				{
					if(!kGAMECLASS.infiniteItems()) quantity++;
					kGAMECLASS.clearOutput();
					kGAMECLASS.output("Using the stimbooster without need would be pretty wasteful....");
					return false;
				}
				else
				{
					kGAMECLASS.clearOutput();
					
					if (usingCreature == target)
					{
						kGAMECLASS.output("You flip the protective cap off the end of the hypospray and settle it quickly against your arm. A quick thumb of the button and the microsurgeons surge into your bloodstream near instantaneously, a distinct feeling of <i>power</i> coursing through your veins as they spread throughout your body.");
						
						var hpChange:int = gainHP(target);
				
						if(hpChange > 0) kGAMECLASS.output(" <b>You have gained " + hpChange + " HP!</b>");
						target.HP(hpChange);
						target.energyRaw = target.energyMax();
					}
				}
			}
			else
			{
				
				if(inCombat()) kGAMECLASS.output("\n\n");
				else kGAMECLASS.clearOutput();
				if (usingCreature == target)
				{
					kGAMECLASS.output(usingCreature.short + " pulls out a HP booster and jabs it into their own arm. Woosh noises etc. In mere seconds they look far perkier, the microsurgeons working quickly to dull the pains and weariness from their frame.");
				}
				else if (usingCreature == kGAMECLASS.pc)
				{
					kGAMECLASS.output("You pull out a stimbooster and toss it to " + target.getCombatName() + ". " + target.mfn("He", "She", "It") + " quickly pops off the cap and presses the business end to their body. In mere seconds "+ target.getCombatName() +" looks far perkier, the microsurgeons working quickly to dull the pains and weariness from "+target.mfn("his", "her", "its") +" frame.");
				}
				else
				{
					kGAMECLASS.output(usingCreature.short + " pulls out a HP booster and jabs it against " + target.short + "’s arm. Woosh noises etc.");
				}
				
				hpChange = gainHP(target);
				if(hpChange > 0) kGAMECLASS.output(" <b>" + target.short + " gained " + hpChange + " HP!</b>");
				target.HP(hpChange);
				target.energyRaw = target.energyMax();
			}

			return false;
		}

		private function gainHP(targetCreature:Creature):int
		{
			var currHP:int = targetCreature.HP();
			var maxHP:int = targetCreature.HPMax();
			var hpBonus:int = maxHP * 0.35;
			
			if (currHP + hpBonus < maxHP) return hpBonus;
			
			return maxHP - currHP;
		}
	}
}
