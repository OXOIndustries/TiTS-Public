package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class ChitPlate extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		//constructor
		public function ChitPlate()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "C.Plate";
			
			//Regular name
			this.longName = "suit of chitin plates";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a suit of platemail made from chitin plates";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Sharing the appearance of obsidian stone, these smooth plates fit over the body like some medieval armor, making you pass off as an awkward myrmedion knight. While it doesn’t have any of the flash and festivity of modern armor, the thick, natural plates could easily deflect and absorb your modern day hustle and bustle.";

			//An alright upgrade. Stronk against kinetic, slashing and thermal, practically worthless against piercing.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 3500;
			this.attack = 0;
			this.defense = 9;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 6;
			
			resistances.burning.resistanceValue = -20.0;
			resistances.kinetic.resistanceValue = 10.0;
			resistances.addFlag(DamageFlag.PLATED);
			
			this.version = _latestVersion;
		}
	}
}