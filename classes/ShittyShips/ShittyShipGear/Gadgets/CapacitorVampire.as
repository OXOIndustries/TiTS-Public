package classes.ShittyShips.ShittyShipGear.Gadgets
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ShittyShip;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Engine.Combat.applyDamage;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.inCombat;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Interfaces.clearOutput;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.damageRand;
	import classes.Engine.Combat.outputDamage;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.possessive;
	
	/**
	 * ...
	 * @author Fenoxo, heavily referencing Gedan's grenades
	 */
	public class CapacitorVampire extends ItemSlotClass
	{
		public function CapacitorVampire() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "C.Vampire";
			
			//Regular name
			this.longName = "capacitor vampire";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a capacitor vampire";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Utilizing the latest in wireless energy transmission devices, the capacitor vampire system effectively leaches the enemy’s stored electrical energy directly into your own stockpile!\n\n(1x/fight)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 10000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 5;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = true;
			this.targetsSelf = false;
			this.requiresTarget = true;
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			this.addFlag(GLOBAL.ITEM_FLAG_SHIP_EQUIPMENT);

			this.version = _latestVersion;
		}	
		override public function useFunction(targetCreature:Creature, usingCreature:Creature = null):Boolean
		{
			//No shields
			if(targetCreature.energy() <= 0)
			{
				if(usingCreature.hasPerk("PCs")) 
				{
					clearOutput();
					output("You can’t use this module on something without any energy!");
				}
				else output("For some reason, " + usingCreature.getCombatName() + " tries to leach energy that no longer exists. What a waste!");
			}
			else
			{
				//Combat-only status for tracking it
				this.addFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF);
				usingCreature.energy(-this.shieldDefense);
				//Success!
				if((usingCreature as ShittyShip).shipSystems()/2 + rand(20) + 1 >= (targetCreature as ShittyShip).shipSystems()/2 + 10)
				{
					var damageNum:Number = 1000;
					if(usingCreature.hasPerk("PCs")) 
					{
						clearOutput();
						output("The lights on " + targetCreature.getCombatName() + " flicker as you siphon away its energy!");
					}
					else if(targetCreature.hasPerk("PCs")) output("The internal lights flicker as " + usingCreature.getCombatName() + " siphons away your energy reserves!");
					else output(possessive(targetCreature.capitalA + usingCreature.short) + " lights flicker as " + possessive(usingCreature.getCombatName()) + " energy vampire leaches its capacitor reserve away!");
					//Calculate how much energy we can steal.
					var capStolen:Number = targetCreature.energy();
					if(capStolen > damageNum) capStolen = damageNum;
					capStolen = Math.round(capStolen);

					targetCreature.energy(-capStolen);
					usingCreature.energy(capStolen);

					output(" (<b>E:</b> -<b><span class='hp'>" + capStolen + "</span></b>).");
					output(" (<b>E:</b> +<b><span class='hp'>" + capStolen + "</span></b>).");
				}
				//Fail!
				else
				{
					if(usingCreature.hasPerk("PCs")) 
					{
						clearOutput();
						output("Despite your best efforts, your capacitor vampire fails to siphon any of " + possessive(targetCreature.getCombatName()) + " energy.");
					}
					else if(targetCreature.hasPerk("PCs")) output("Despite " + possessive(usingCreature.getCombatName()) + " best efforts, its capacitor vampire fails to siphon your energy.");
					else output("Despite " + possessive(usingCreature.getCombatName()) + " best efforts, " + possessive(targetCreature.getCombatName()) + " systems are too robust for its capacitors to be drained by capacitor vampire.");
				}
			}
			return false;
		}
	}
}
