package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CombatAttacks;
	
	/**
	 * ...
	 * @author Fenoxo
	 */
	public class Fedora extends ItemSlotClass
	{
		public function Fedora() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "Fedora";
			
			//Regular name
			this.longName = "battered fedora";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a battered fedora";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This once stylish fedora has seen better days. Now it’s a little beat up - the sort of thing you’d expect to see someone put on their semi-aquatic mammal or cringy internet persona.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 17;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
				
			this.version = _latestVersion;
		}	
	}
}
