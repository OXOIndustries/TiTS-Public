package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class PolishedPlate extends ItemSlotClass
	{
		//Level 8 (Rare). Balance 2.0
		//constructor
		public function PolishedPlate()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "P.Plate";
			
			//Regular name
			this.longName = "suit of polished platemail";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a suit of platemail polished to a mirror sheen";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This suit of platemail would look right at home on a knight of terran myth, but there’s no doubting the protection it provides. Crafted from something stronger than traditional steel, it can stand up to many of the more deadly weapons the galaxy has to offer. Just watch out for warhammers - a dented chestplate can make quite it hard to breathe.";

			//An alright upgrade. Stronk against kinetic, slashing and thermal, practically worthless against piercing.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 21000;
			this.attack = 0;
			this.defense = 16;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = -4;
			this.fortification = 11;
			
			resistances.burning.resistanceValue = -10.0;
			resistances.electric.resistanceValue = -10.0;
			resistances.kinetic.resistanceValue = 10;
			resistances.addFlag(DamageFlag.PLATED);
			resistances.addFlag(DamageFlag.MIRRORED);
			
			this.version = _latestVersion;
		}
	}
}