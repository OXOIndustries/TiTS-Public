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
	public class ShieldBoosterForShips extends ItemSlotClass
	{
		public function ShieldBoosterForShips() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "S.Booster";
			
			//Regular name
			this.longName = "shield booster";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a shield booster";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Shield boosters are one of the most popular modifications employed by rushers. Using a dedicated capacitor bank, this device can dump an absurd amount of power into the ship’s shield emitters nearly instantly, allowing for the rapid restoration of defensive energy screens.\n\n(~4000 shields)\n(1x/fight)";
			
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
			//No shields
			if(targetCreature.shields() >= targetCreature.shieldsMax())
			{
				if(usingCreature.hasPerk("PCs")) 
				{
					clearOutput();
					output("Your shields are already at their maximum strength!");
				}
				else output("For some reason, " + usingCreature.getCombatName() + " tries to boost its shields, despite being at full strength!");
			}
			else
			{
				//Combat-only status for tracking it
				this.addFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF);
				usingCreature.energy(-this.shieldDefense);

				var healing:Number = 3900 + rand(200);
				if(usingCreature.hasPerk("PCs")) 
				{
					clearOutput();
					output("The deck seems to hum beneath your [pc.footOrFeet] as your shield booster dumps a city block’s worth of electricity into your defensive screen all at once.");
				}
				else
				{
					output("An alarm on the console blares, informing you that " + possessive(usingCreature.getCombatName()) + " shields are restored!");
				}
				usingCreature.changeShields(healing);
			}
			return false;
		}
	}
}
