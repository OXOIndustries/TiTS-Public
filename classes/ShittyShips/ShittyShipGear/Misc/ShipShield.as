package classes.ShittyShips.ShittyShipGear.Misc
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class ShipShield extends ItemSlotClass
	{
		//Level 1 (Common) ship weapon
		//constructor
		public function ShipShield()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used on inventory buttons
			this.shortName = "ShieldGen";
			
			//Regular name
			this.longName = "shield generator"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a shield generator";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "TBD";
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 5000;		
			
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 1000;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances = new TypeCollection();
			resistances.kinetic.resistanceValue = 50.0;
			resistances.corrosive.resistanceValue = 25.0;
			resistances.burning.resistanceValue = -25.0;
			resistances.electric.resistanceValue = -50.0;
			
			this.version = _latestVersion;
		}
	}
}
