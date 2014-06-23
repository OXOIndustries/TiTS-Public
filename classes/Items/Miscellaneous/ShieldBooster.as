package classes.Items.Miscellaneous 
{
	import classes.Creature;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShieldBooster extends ItemSlotClass
	{
		public function ShieldBooster()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 5;
			this.type = GLOBAL.POTION;
			
			this.shortName = "S.Booster";
			
			this.longName = "single use shield booster";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a single use shield booster";
			
			this.tooltip = "This single use shield booster can be used to replenish up to 40 points of shielding all at once. The only downside is that subjecting a shield generator to such large power surges in quick succession would damage or destroy it. <b>You can only use shield boosters once per fight!</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 200;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.THERMAL;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.combatUsable = true;
			this.targetsSelf = true;
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(targetCreature:Creature, usingCreature:Creature = null):Boolean
		{
			if(targetCreature.shield.shortName == "")
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output("You need to have a shield generator in order to use a shield booster.\n");
				if(!kGAMECLASS.debug) quantity++;
				return false;
			}
			else if (targetCreature.hasStatusEffect("Shield Boosted"))
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output("Using another shield booster would probably destroy your shield generator.\n");
				if(!kGAMECLASS.debug) quantity++;
				return false;
			}
			else
			{
				// Player used an item
				if (targetCreature == kGAMECLASS.pc)
				{
					kGAMECLASS.clearOutput();
					playerUsed(targetCreature, usingCreature);
				}
				// Enemy used an item on the PC
				else if (targetCreature != kGAMECLASS.pc && usingCreature != kGAMECLASS.pc)
				{
					kGAMECLASS.output("\n");
					npcUsed(targetCreature, usingCreature);
				}
				else
				{
					throw new Error("Don't know how we got here. Exception for debugging.");
				}
			}			
			return false;
		}
		
		public function playerUsed(targetCreature:Creature, usingCreature:Creature):void
		{
			kGAMECLASS.output("You press the booster to the charge port on your shield generator and hear the telltale hum of rapidly discharging electrical energy. After a second, the booster beeps and blinks red before dying completely.");
			//{Restores moderate HP}
			var healing:int = 40;
			if(targetCreature.shields() + 40 > targetCreature.shieldsMax())
			{
				healing = targetCreature.shieldsMax() - targetCreature.shields();
			}
			if (kGAMECLASS.inCombat()) targetCreature.createStatusEffect("Shield Boosted", 0, 0, 0, 0, true, "", "", true, 0);
			targetCreature.shields(healing);
			kGAMECLASS.output(" (<b>+" + healing + "</b>)\n");
		}
		
		public function npcUsed(targetCreature:Creature, usingCreature:Creature):void
		{
			kGAMECLASS.output(usingCreature.capitalA + usingCreature.short + " uses a shield booster!");
			//{Restores moderate HP}
			var healing:int = 40;
			if(targetCreature.shields() + 40 > targetCreature.shieldsMax())
			{
				healing = targetCreature.shieldsMax() - targetCreature.shields();
			}
			if (kGAMECLASS.inCombat()) targetCreature.createStatusEffect("Shield Boosted", 0, 0, 0, 0, true, "", "", true, 0);
			targetCreature.shields(healing);
			kGAMECLASS.output(" (<b>+" + healing + "</b>)\n");
		}
	}
}