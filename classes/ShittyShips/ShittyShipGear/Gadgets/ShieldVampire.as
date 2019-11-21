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
	public class ShieldVampire extends ItemSlotClass
	{
		public function ShieldVampire() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "S.Vampire";
			
			//Regular name
			this.longName = "shield vampire";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a shield vampire";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Utilizing the latest in wireless energy transmission devices, the shield vampire system effectively leaches enemy defense screens in order to fortify the user’s own shields.\n\n(1x/fight)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 10000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 75;
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
					output("You can’t use this module on something without shields!");
				}
				else output("For some reason, " + usingCreature.getCombatName() + " tries to leach shields that no longer exist. What a waste!");
			}
			else
			{
				//Combat-only status for tracking it
				this.addFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF);
				usingCreature.energy(-this.shieldDefense);
				//Success!
				if((usingCreature as ShittyShip).shipSystems()/2 + rand(20) + 1 >= (targetCreature as ShittyShip).shipSystems()/2 + 10)
				{
					var damageNum:Number = 2500;
					if(usingCreature.hasPerk("PCs")) 
					{
						clearOutput();
						output("A crackling vortex appears between " + targetCreature.getCombatName() + " and your own vessel as your shield vampire siphons energy!");
					}
					else if(targetCreature.hasPerk("PCs")) output("Your view ripples and shudders as " + usingCreature.getCombatName() + " leaches your shield away!");
					else output(possessive(targetCreature.capitalA + usingCreature.short) + " shield flickers as " + possessive(usingCreature.getCombatName()) + " shield vampire leaches its defensive screen away!");
					var dr:DamageResult = applyDamage(damageRand(new TypeCollection ( { truedamage: damageNum }, DamageFlag.ONLY_SHIELD ), 15), usingCreature, targetCreature, "minimal");
					if (dr.shieldDamage > 0) 
					{
						var shieldHeal:Number = Math.ceil(dr.shieldDamage);
						output(" (<b>S:</b> +<b><span class='shield'>" + shieldHeal + "</span></b>)");
						usingCreature.shields(shieldHeal);
					}
				}
				//Fail!
				else
				{
					if(usingCreature.hasPerk("PCs")) 
					{
						clearOutput();
						output("Despite your best efforts, the shield vampire can’t seem to leach " + possessive(targetCreature.getCombatName()) + " shields.");
					}
					else if(targetCreature.hasPerk("PCs")) output("Despite " + possessive(usingCreature.getCombatName()) + " best efforts, your shields are too robust to be siphoned by a shield vampire.");
					else output("Despite " + possessive(usingCreature.getCombatName()) + " best efforts, " + possessive(targetCreature.getCombatName()) + " shields are too robust to be siphoned by a shield vampire.");
				}
			}
			return false;
		}
	}
}
