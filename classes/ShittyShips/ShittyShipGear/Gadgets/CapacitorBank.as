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
	public class CapacitorBank extends ItemSlotClass
	{
		public function CapacitorBank() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "Cap.Bank";
			
			//Regular name
			this.longName = "capacitor bank";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a bank of capacitors";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Capacitor banks are a favorite upgrade for captains who prefer energy-guzzling weapons like plasma cannons, laser weapons, and railguns. These banks of high-density energy stores can be tapped in a pinch to completely refill a vessel’s energy stores once per encounter.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1500;
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
			this.requiresTarget = false;
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			this.addFlag(GLOBAL.ITEM_FLAG_SHIP_EQUIPMENT);

			this.version = _latestVersion;
		}	
		override public function useFunction(targetCreature:Creature, usingCreature:Creature = null):Boolean
		{
			//Max energy
			if(targetCreature.energy() >= targetCreature.energyMax())
			{
				if(usingCreature.hasPerk("PCs")) 
				{
					clearOutput();
					output("Your energy is already maxed out.");
				}
				else output("For some reason, " + usingCreature.getCombatName() + " taps into a reserve power source while at full energy!");
			}
			else
			{
				//Combat-only status for tracking it
				this.addFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF);
				usingCreature.energy(-this.shieldDefense);

				var healing:Number = usingCreature.energyMax();
				usingCreature.energy(healing);
				
				if(usingCreature.hasPerk("PCs")) 
				{
					clearOutput();
					output("The relay between your capacitor bank and your vessel’s power conduits flips open, flooding every circuit with all the energy it could ever need.");
				}
				else
				{
					output("A warning chirp alerts you that " + (usingCreature.getCombatName()) + " has tapped into a reserve energy store.");
				}
				output(" (<b>E:</b> +<b><span class='shield'>" + healing + "</span></b>)");
			}
			return false;
		}
	}
}
