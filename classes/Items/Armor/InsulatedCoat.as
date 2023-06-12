package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class InsulatedCoat extends ItemSlotClass
	{
		//Level 7 (Rare). Balance 2.0
		//constructor
		public function InsulatedCoat()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "I.Coat";
			
			//Regular name
			this.longName = "insulated coat";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an insulated coat";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Stitched leather hides harvested from aquatic mammals in the aquatic core and dyed to blend in with the icy tundra of Uveto VII. It’s been sewn to consist of several cushioning layers that provide excellent protection against the cold but only moderate protection from everything else. It does have a wide number of pockets, so that’s a plus! (+1 inventory slot while equipped).";

			//An alright upgrade. Stronk against kinetic, slashing and thermal, practically worthless against piercing.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 11000;
			this.attack = 0;
			this.defense = 6;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 18;
			
			resistances.freezing.resistanceValue = 25.0;
			resistances.kinetic.resistanceValue = 10.0;
			resistances.electric.resistanceValue = 10.0;
			resistances.burning.resistanceValue = -10.0;
			//resistances.addFlag(DamageFlag.PLATED);
			
			this.version = _latestVersion;
		}
	}
}