package classes.ShittyShips.ShittyShipGear.Upgrades
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ShittyShip;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Engine.Combat.damageRand;
	import classes.Engine.Combat.outputDamage;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.possessive;
	
	/**
	 * ...
	 * @author Fenoxo
	 */
	public class ThrustVectoringSystem extends ItemSlotClass
	{
		public function ThrustVectoringSystem() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "T.Vector";
			
			//Regular name
			this.longName = "thrust vectoring system";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a thrust vectoring system";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Thrust vectoring systems allow the main engines and secondary thrusters to be dynamically angled to increase ship agility during extreme maneuvers.\n\n(+20 agility)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 6000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = false;
			this.addFlag(GLOBAL.ITEM_FLAG_SHIP_EQUIPMENT);

			this.version = _latestVersion;
		}	
	}
}
