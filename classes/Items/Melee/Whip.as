package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Whip extends ItemSlotClass
	{
		//constructor
		public function Whip()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Whip";
			
			//Regular name
			this.longName = "whip";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a whip";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This simple, single-tailed bullwhip is made from black, braided leather. It’s length, flexibility, and tapered design allows it to be thrown in such a way that part of the whip can exceed the speed of sound, letting out a small sonic boom in the form of a satisfying ‘crack’. Very accurate, but deals very little real damage compared to modern weapons. Still favored among adventuring archeologists.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "whip";
			attackNoun = "whip";
			
			//Information
			this.basePrice = 250;
			this.attack = 5;
			
			baseDamage.kinetic.damageValue = 2;
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 1;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
