package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class TestHPBooster extends ItemSlotClass
	{
		
		//constructor
		public function TestHPBooster()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
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
			this.damage = 0;
			this.damageType = GLOBAL.NO_TYPE;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if (usingCreature == null) usingCreature = kGAMECLASS.pc;
			
			if (usingCreature == kGAMECLASS.pc)
			{
				if (target.HP() == target.HPMax())
				{
					kGAMECLASS.clearOutput();
					kGAMECLASS.output("Using an instant HP booster whilst at full health would be pretty wasteful....");
					this.quantity++;
				}
				else
				{
					kGAMECLASS.clearOutput();
					
					if (usingCreature == target)
					{
						kGAMECLASS.output("You jab the booster against your arm. Woosh noises etc.");
						
						var hpChange:int = gainHP(target);
				
						kGAMECLASS.output(" You have gained " + hpChange + " hp!\n");
						target.HP(hpChange);
					}
				}
			}
			else
			{
				if (usingCreature == target)
				{
					kGAMECLASS.output(usingCreature.short + " pulls out a hp booster and jabs it into their own arm. Woosh noises etc.");
				}
				else
				{
					kGAMECLASS.output(usingCreature.short + " pulls out a hp booster and jabs it against " + target.short + "s arm. Woosh noises etc.");
				}
				
				hpChange = gainHP(target);
				kGAMECLASS.output(" " + target.short + " gained " + hpChange + " hp!\n");
				target.HP(hpChange);
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
