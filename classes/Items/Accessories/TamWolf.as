package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CombatAttacks;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class TamWolf extends ItemSlotClass
	{
		
		
		public function TamWolf() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "TamWolf";
			
			//Regular name
			this.longName = "Fenris-class assault drone";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Fenris-class assault drone";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Tam-wolf is a state of the art Fenris attack drone you looted from a crazed cat-girl, coincidentally also named Tam. Loyal, intelligent, and alert, you new robotic friend is the closest thing you can get to a real attack dog these days. He replaces your original attack drone, giving you a powerful, bitey friend in battle at the expense of losing your drone's bonus to shields.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 1500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			droneAttack = CombatAttacks.TamwolfAttack;
			
			this.version = _latestVersion;
		}	
	}
}
