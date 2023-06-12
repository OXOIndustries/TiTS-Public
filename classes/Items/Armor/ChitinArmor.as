package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class ChitinArmor extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		//constructor
		public function ChitinArmor()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "C.Armor";
			
			//Regular name
			this.longName = "suit of chitin armor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a suit of armor incorporating ablative chitin plates";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This sexy, form-fitting armor combines synthetic plates that strongly resemble insectile chitin with sleek chainmail and leather. Wearing this gives you protection and maneuverability where you need it most. It’s about as low-tech as you can really get these days, but don’t underestimate old classics.";

			//An alright upgrade. Stronk against kinetic, slashing and thermal, practically worthless against piercing.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 3500;
			this.attack = 0;
			this.defense = 8;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 4;
			this.resolve = 1;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 18;
			
			resistances.kinetic.resistanceValue = 5.0;
			resistances.burning.resistanceValue = -10.0;
			resistances.addFlag(DamageFlag.ABLATIVE);
			
			this.version = _latestVersion;
		}
	}
}