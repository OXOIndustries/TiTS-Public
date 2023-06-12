package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class NyreanChain extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		//constructor
		public function NyreanChain()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "N.Chain";
			
			//Regular name
			this.longName = "nyrean chain armor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a set of nyrean chain armor";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A suit of armor worn by many nyrean huntresses, both to protect what little of their bodies aren’t covered in chitin and for the awesome sex appeal. Doesn’t provide great protection to someone without a body built to resist impacts on its own.";

			//An alright upgrade. Stronk against kinetic, slashing and thermal, practically worthless against piercing.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 3300;
			this.attack = 0;
			this.defense = 4;
			this.shieldDefense = 0;
			this.shields = 0;
			this.resolve = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 8;
			this.fortification = 4;
			
			//resistances.kinetic.resistanceValue = 10.0;
			
			this.version = _latestVersion;
		}
	}
}