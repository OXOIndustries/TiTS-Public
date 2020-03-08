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
	
	public class TestHPBooster extends ItemSlotClass
	{
		
		//constructor
		public function TestHPBooster()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.POTION;
			
			//Used on inventory buttons
			this.shortName = "HP Boost";
			
			//Regular name
			this.longName = "Instant HP Booster";
			
			//TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an instant HP booster";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A vial filled with a vitreous red fluid securely lodged within a single-use pressurised contact skin infusion port, designed to replenish 35% HP.";
			
			//TooltipManager.addTooltip(this.shortName, this.tooltip);
			
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
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if (usingCreature == null) usingCreature = kGAMECLASS.pc;
			
			var hpChange:int = 0;
			
			if (usingCreature == kGAMECLASS.pc)
			{
				if (target.isImmobilized() || (usingCreature != target && target.isDefeated()))
				{
					if(!kGAMECLASS.infiniteItems()) quantity++;
					kGAMECLASS.clearOutput();
					if(usingCreature == target) kGAMECLASS.output("You can’t seem to get a hold of the HP booster at the moment!");
					else kGAMECLASS.output("You are about to pull out an HP booster, but " + (inCombat() ? target.getCombatName() : (target.a + target.short)) + " wouldn’t be able to make use of it!");
					return false;
				}
				
				if (target.HP() >= target.HPMax() && target.energy() >= target.energyMax())
				{
					if(!kGAMECLASS.infiniteItems()) quantity++;
					kGAMECLASS.clearOutput();
					kGAMECLASS.output("Using an instant HP booster whilst at full health would be pretty wasteful....");
					return false;
				}
				
				kGAMECLASS.clearOutput();
				
				if (usingCreature == target)
				{
					kGAMECLASS.output("You jab the HP booster against your arm. Woosh noises etc.");
					
				}
				else
				{
					if(target.isPlural) kGAMECLASS.output("You pull out an HP booster and jab it into " + (inCombat() ? target.getCombatName() : (target.a + target.short)) + ". Woosh noises etc.");
					else kGAMECLASS.output("You pull out an HP booster and jab it into " + (inCombat() ? target.getCombatName() : (target.a + target.short)) + ". Woosh noises etc.");
				}
				
				hpChange = gainHP(target);
				/* OLD. New hotness damage change below.
				if(hpChange > 0)
				{
					if(usingCreature == target) kGAMECLASS.output(" <b>You have gained " + hpChange + " HP!</b>");
					else kGAMECLASS.output(" <b>" + (inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " " + (target.isPlural ? "have" : "has") + " gained " + hpChange + " HP!</b>");
				}*/
				target.changeHP(hpChange);
			}
			else
			{
				if(inCombat()) kGAMECLASS.output("\n\n");
				else kGAMECLASS.clearOutput();
				if (usingCreature == target)
				{
					if(target.isPlural) kGAMECLASS.output((inCombat() ? StringUtil.capitalize(usingCreature.getCombatName(), false) : (usingCreature.capitalA + usingCreature.short)) + " pulls out an HP booster and jabs it into their own arm. Woosh noises etc.");
					else kGAMECLASS.output((inCombat() ? StringUtil.capitalize(usingCreature.getCombatName(), false) : (usingCreature.capitalA + usingCreature.short)) + " pulls out an HP booster and jabs it into " + target.mfn("his", "her", "its") + " own arm. Woosh noises etc.");
				}
				else
				{
					if(target.isPlural) kGAMECLASS.output((inCombat() ? StringUtil.capitalize(usingCreature.getCombatName(), false) : (usingCreature.capitalA + usingCreature.short)) + " pulls out an HP booster and jabs it against " + (inCombat() ? target.getCombatName() : (target.a + target.short)) + ". Woosh noises etc.");
					else kGAMECLASS.output((inCombat() ? StringUtil.capitalize(usingCreature.getCombatName(), false) : (usingCreature.capitalA + usingCreature.short)) + " pulls out an HP booster and jabs it against " + (inCombat() ? target.getCombatName() : (target.a + target.short)) + "’s arm. Woosh noises etc.");
				}
				
				hpChange = gainHP(target);
				//OLD BUSTED: if(hpChange > 0) kGAMECLASS.output(" <b>" + (inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " " + (target.isPlural ? "have" : "has") + " gained " + hpChange + " HP!</b>");
				//NEW HOTTIE:
				target.changeHP(hpChange);
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
