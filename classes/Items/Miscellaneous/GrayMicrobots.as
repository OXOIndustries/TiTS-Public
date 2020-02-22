package classes.Items.Miscellaneous 
{
	import classes.Creature;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Engine.Combat.inCombat;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class GrayMicrobots extends ItemSlotClass
	{
		public function GrayMicrobots()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 5;
			this.type = GLOBAL.POTION;
			
			this.shortName = "G.M.Bots";
			
			this.longName = "vial of gray microbots";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a vial of gray microbots";
			
			this.tooltip = "This vial of a sloshing, semi-viscous gray liquid was taken from the body of a reprogrammed gray goo, one of the artificial creatures native to Tarkus. Thanks to your tech-savviness, it should be safe to handle. It shouldn’t do anything unless you drink it. You’re going to drink it, aren’t you?\n\n<b>Known to cause slight amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 250;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = true;
			this.targetsSelf = true;
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(targetCreature:Creature, usingCreature:Creature = null):Boolean
		{
			if (targetCreature.hasStatusEffect("Healed"))
			{
				if(!kGAMECLASS.infiniteItems()) quantity++;
				if (targetCreature == kGAMECLASS.pc)
				{
					kGAMECLASS.clearOutput();
					kGAMECLASS.output("Using supplements to heal yourself will only work once per fight. No body can handle the metabolic strain of downing multiple regenerative items in such quick succession.");
				}
				else
				{
					if(inCombat()) kGAMECLASS.output("\n\n");
					else kGAMECLASS.clearOutput();
					kGAMECLASS.output(targetCreature.capitalA + targetCreature.short + " has already healed during this fight! Doing so again would be more than ill-advised!");
				}
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
					if(inCombat()) kGAMECLASS.output("\n\n");
					else kGAMECLASS.clearOutput();
					npcUsed(targetCreature, usingCreature);
				}
				else
				{
					throw new Error("Don’t know how we got here. Exception for debugging.");
				}
			}			
			return false;
		}
		
		public function playerUsed(targetCreature:Creature, usingCreature:Creature):void
		{
			kGAMECLASS.output("Bottoms up! You pop the cork on your vial and down the reprogrammed healer bots.");
			// Restores moderate HP
			var healing:int = 40;
			if(targetCreature.HP() + healing > targetCreature.HPMax())
			{
				healing = targetCreature.HPMax() - targetCreature.HP();
			}
			if (inCombat()) targetCreature.createStatusEffect("Healed", 0, 0, 0, 0, true, "", "", true, 0);
			if(healing > 0) 
			{
				kGAMECLASS.output(" You give a little shudder as they go to work, patching up any injuries they come across.");
				targetCreature.changeHP(healing);
			}
			else kGAMECLASS.output(" There is a slight gurgling in your belly but the item seems to have no effect.");
			targetCreature.taint(1);
		}
		
		public function npcUsed(targetCreature:Creature, usingCreature:Creature):void
		{
			kGAMECLASS.output((inCombat() ? StringUtil.capitalize(usingCreature.getCombatName(), false) : (usingCreature.capitalA + usingCreature.short)) + " pulls a vial of silvery-looking goo and downs it!");
			// Restores moderate HP
			var healing:int = 40;
			if(targetCreature.HP() + healing > targetCreature.HPMax())
			{
				healing = targetCreature.HPMax() - targetCreature.HP();
			}
			if (inCombat()) targetCreature.createStatusEffect("Healed", 0, 0, 0, 0, true, "", "", true, 0);
			targetCreature.HP(healing);
			if(healing > 0) kGAMECLASS.output(" " + usingCreature.mfn("He","She","It") + " appears to be invigorated by the strange draft. (<b>+" + healing + " HP</b>)");
			else kGAMECLASS.output(" However, the item has no effect.");
		}
	}
}
