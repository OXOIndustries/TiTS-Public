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
	public class RepairModule extends ItemSlotClass
	{
		public function RepairModule() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "Repair M.";
			
			//Regular name
			this.longName = "repair module";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a repair module";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This bank of repairbots waits securely inside the hull the order to scuttle out and repair damage damage to the ship’s armor in the blink of eye. After use, they require roughly ten minutes to recharge their batteries and gather more material to patch gaps.\n\n(~3500 armor)\n(1x/fight)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 3000;
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
			//No shields
			if(targetCreature.HP() >= targetCreature.HPMax())
			{
				if(usingCreature.hasPerk("PCs")) 
				{
					clearOutput();
					output("Your armor is not damaged!");
				}
				else output("For some reason, " + usingCreature.getCombatName() + " releases a small army of repair drops, but its armor is undamaged!");
			}
			else
			{
				//Combat-only status for tracking it
				this.addFlag(GLOBAL.ITEM_FLAG_TOGGLED_OFF);

				var healing:Number = 3400 + rand(200);
							
				if(usingCreature.hasPerk("PCs")) 
				{
					clearOutput();
					output("One of the spider-like repair bots scuttles in front of your viewscreen as the flashes of dozens of tiny plasma torches flicker to life all over your craft.");
				}
				else
				{
					output("Swarms of spider-like repair bots scuttle across the surface of " + (usingCreature.getCombatName()) + ", patching damage.");
				}
				//output(" (<b>H:</b> +<b><span class='hp'>" + healing + "</span></b>)");
				usingCreature.changeHP(healing);
			}
			return false;
		}
	}
}
