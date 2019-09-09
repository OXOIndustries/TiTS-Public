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
	public class StealthFieldForShips extends ItemSlotClass
	{
		public function StealthFieldForShips() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "S.Field";
			
			//Regular name
			this.longName = "stealth field generator";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a stealth field generator";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Stealth field generators are popular with smugglers, though their extremely limited duration makes them unsuitable long term use. Most captains find use for them as evasion-boosters.\n\n(~4000 shields)\n(1x/fight)";
			
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
			this.targetsSelf = true;
			this.requiresTarget = false;
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			this.addFlag(GLOBAL.ITEM_FLAG_SHIP_EQUIPMENT);

			this.version = _latestVersion;
		}	
		override public function useFunction(targetCreature:Creature, usingCreature:Creature = null):Boolean
		{
			//Combat-only status for tracking it
			this.addFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF);
			usingCreature.energy(-this.shieldDefense);
				
			if(usingCreature.hasPerk("PCs")) 
			{
				clearOutput();
				output("Your craft thrums quietly as the stealth field leaps into existence.");
			}
			else
			{
				output("Data on " + (usingCreature.getCombatName()) + " thins to almost nothing as a stealth field leaps into being!");
			}
			usingCreature.createStatusEffect("Stealth Field", 5, 0, 0, 0, false, "DefenseUp", "+80 evasion!", true, 0);
			return false;
		}
	}
}
