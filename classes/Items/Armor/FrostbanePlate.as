package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class FrostbanePlate extends ItemSlotClass
	{
		//Level 8 (Very Rare) Balance 2.0
		//constructor
		public function FrostbanePlate()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "FB.Plate";
			
			//Regular name
			this.longName = "frostbane plate";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a suit of frostbane plate";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A suit of white dragon scales woven with thick, metal plates into heavy, protective plate mail. Several layers of fur and hide line the entire inside, filling in any holes in the joints. It’s not what you’d call maneuverable, and would only be sexy to a medieval cavalry fetishist, but that’s not really the point.";

			//An alright upgrade. Stronk against kinetic, slashing and thermal, practically worthless against piercing.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 42000;
			this.attack = 0;
			this.defense = 15;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = -2;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = -2;
			this.fortification = 30;
			
			resistances.burning.resistanceValue = -13.0;
			resistances.freezing.resistanceValue = 50.0;
			resistances.addFlag(DamageFlag.PLATED);
			resistances.addFlag(DamageFlag.NULLIFYING);
			
			this.version = _latestVersion;
		}
	}
}