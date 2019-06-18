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
	public class ShieldDisruptor extends ItemSlotClass
	{
		public function ShieldDisruptor() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "S.Disrupt";
			
			//Regular name
			this.longName = "shield disruptor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a shield disruptor";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This module houses a cornucopia of electronic warfare tools capable of sabotaging enemy shield generators. Whether by use of firmware-crashing cryptoworms or projector-confusing magnetic fields, this shield disruptor provides a once-per-combat attempt to play havoc with your enemy's defenses, after which its one-use, burst-transmitting system will need maintenance to fire again.\n\n(1x/fight)\n(+5 Systems)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 3000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 50;
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
			if(targetCreature.shields() <= 0)
			{
				if(usingCreature.hasPerk("PCs")) 
				{
					clearOutput();
					output("You can't use this module on something without shields!");
				}
				else output("For some reason, " + usingCreature.getCombatName() + " tries to hack shields that no longer exist. What a waste!");
			}
			else
			{
				//Combat-only status for tracking it
				this.addFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF);
				usingCreature.energy(-this.shieldDefense);
				//Success!
				if((usingCreature as ShittyShip).shipSystems()/2 + rand(20) + 1 >= (targetCreature as ShittyShip).shipSystems()/2 + 10)
				{
					var damageNum:Number = Math.round(targetCreature.shields()/2);
					if(usingCreature.hasPerk("PCs")) 
					{
						clearOutput();
						output("Visible ripples in space appear around " + targetCreature.getCombatName() + " as your shield disruptor tricks your foe's shield into tearing itself apart!");
					}
					else if(targetCreature.hasPerk("PCs")) output("Your view ripples and shudders as your shield tears itself apart at the behest of " + usingCreature.getCombatName() + "!");
					else output(possessive(targetCreature.capitalA + usingCreature.short) + " shield ripples and tears itself apart at the behest of " + possessive(usingCreature.getCombatName()) + " shield disruptor!");
					applyDamage(damageRand(new TypeCollection ( { truedamage: damageNum } ), 15), usingCreature, targetCreature, "minimal");
				}
				//Fail!
				else
				{
					if(usingCreature.hasPerk("PCs")) 
					{
						clearOutput();
						output("Despite your best efforts, the shield disruptor can't seem to sabotage " + possessive(targetCreature.getCombatName()) + " systems.");
					}
					else if(targetCreature.hasPerk("PCs")) output("Despite " + possessive(usingCreature.getCombatName()) + " best efforts, your systems are too robust to be sabotaged by a shield disruptor.");
					else output("Despite " + possessive(usingCreature.getCombatName()) + " best efforts, " + possessive(targetCreature.getCombatName()) + " systems are too robust to be sabotaged by a shield disruptor.");
				}
			}
			return false;
		}
	}
}
