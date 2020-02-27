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
			this.type = GLOBAL.POTION;
			this.combatUsable = true;
			this.requiresTarget = true;
			
			//Used on inventory buttons
			this.shortName = "OS StimBoost";
			
			//Regular name
			this.longName = "one shot stim booster";
			
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
			
			var hpChange:int = 0;
			
			if (usingCreature == kGAMECLASS.pc)
			{
				if (target.isImmobilized() || (usingCreature != target && target.isDefeated()))
				{
					if(!kGAMECLASS.infiniteItems()) quantity++;
					kGAMECLASS.clearOutput();
					if(usingCreature == target) kGAMECLASS.output("You can’t seem to get a hold of the stimbooster at the moment!");
					else kGAMECLASS.output("You are about to pull out an stimbooster, but " + (inCombat() ? target.getCombatName() : (target.a + target.short)) + " wouldn’t be able to make use of it!");
					return false;
				}
				
				if (target.HP() >= target.HPMax() && target.energy() >= target.energyMax())
				{
					if(!kGAMECLASS.infiniteItems()) quantity++;
					kGAMECLASS.clearOutput();
					kGAMECLASS.output("Using the stimbooster without need would be pretty wasteful....");
					return false;
				}
				
				kGAMECLASS.clearOutput();
				
				if (usingCreature == target)
				{
					kGAMECLASS.output("You flip the protective cap off the end of the hypospray and settle it quickly against your arm. A quick thumb of the button and the microsurgeons surge into your bloodstream near instantaneously, a distinct feeling of <i>power</i> coursing through your veins as they spread throughout your body.");
					
				}
				else
				{
					if(target.isPlural) kGAMECLASS.output("You pull out a stimbooster and toss it to " + (inCombat() ? target.getCombatName() : (target.a + target.short)) + ". They quickly pop off the cap and press the business end to their body. In mere seconds " + (inCombat() ? target.getCombatName() : (target.a + target.short)) + " look far perkier, the microsurgeons working quickly to dull the pain and weariness from their frame.");
					else kGAMECLASS.output("You pull out a stimbooster and toss it to " + (inCombat() ? target.getCombatName() : (target.a + target.short)) + ". " + target.mfn("He", "She", "It") + " quickly pops off the cap and presses the business end to " + target.mfn("his", "her", "its") + " body. In mere seconds " + (inCombat() ? target.getCombatName() : (target.a + target.short)) + " looks far perkier, the microsurgeons working quickly to dull the pain and weariness from " + target.mfn("his", "her", "its") + " frame.");
				}
				
				hpChange = gainHP(target);
				/* OLD AND VERBOSE AN' BUSTED
				if(hpChange > 0)
				{
					
					if(usingCreature == target) kGAMECLASS.output(" <b>You have gained " + hpChange + " HP!</b>");
					else kGAMECLASS.output(" <b>" + (inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " " + (target.isPlural ? "have" : "has") + " gained " + hpChange + " HP!</b>");
					
				}*/
				// NEW HOTTIES:
				target.changeHP(hpChange);
				target.changeEnergy(target.energyMax());
			}
			else
			{
				if(inCombat()) kGAMECLASS.output("\n\n");
				else kGAMECLASS.clearOutput();
				if (usingCreature == target)
				{
					if(target.isPlural) kGAMECLASS.output((inCombat() ? StringUtil.capitalize(usingCreature.getCombatName(), false) : (usingCreature.capitalA + usingCreature.short)) + " pulls out a stimbooster and jabs it into their own body. In mere seconds they look far perkier, the microsurgeons working quickly to dull the pain and weariness from their frame.");
					else kGAMECLASS.output((inCombat() ? StringUtil.capitalize(usingCreature.getCombatName(), false) : (usingCreature.capitalA + usingCreature.short)) + " pulls out a stimbooster and jabs it into " + target.mfn("his", "her", "its") + " own arm. In mere seconds " + target.mfn("he", "she", "it") + " looks far perkier, the microsurgeons working quickly to dull the pain and weariness from " + target.mfn("his", "her", "its") + " frame.");
				}
				else
				{
					if(target.isPlural) kGAMECLASS.output((inCombat() ? StringUtil.capitalize(usingCreature.getCombatName(), false) : (usingCreature.capitalA + usingCreature.short)) + " pulls out a stimbooster and jabs it against " + (inCombat() ? target.getCombatName() : (target.a + target.short)) + ". In mere seconds they look far perkier, the microsurgeons working quickly to dull the pain and weariness from their frame.");
					else kGAMECLASS.output((inCombat() ? StringUtil.capitalize(usingCreature.getCombatName(), false) : (usingCreature.capitalA + usingCreature.short)) + " pulls out a stimbooster and jabs it against " + (inCombat() ? target.getCombatName() : (target.a + target.short)) + "’s arm. In mere seconds " + target.mfn("he", "she", "it") + " looks far perkier, the microsurgeons working quickly to dull the pain and weariness from " + target.mfn("his", "her", "its") + " frame.");
				}
				
				//OLD BUSTED: if(hpChange > 0) kGAMECLASS.output(" <b>" + (inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " " + (target.isPlural ? "have" : "has") + " gained " + hpChange + " HP!</b>");
				//New hotties:
				hpChange = gainHP(target);
				target.changeHP(hpChange);
				target.changeEnergy(target.energyMax());
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
