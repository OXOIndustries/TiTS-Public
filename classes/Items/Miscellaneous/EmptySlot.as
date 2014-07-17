package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	
	public class EmptySlot extends ItemSlotClass
	{
		//constructor
		public function EmptySlot()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = 0;
			
			//Used on inventory buttons
			this.shortName = "";
			
			//Regular name
			this.longName = "nothing";
			
			//Longass shit, not sure what used for yet.
			this.description = "nothing";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "You aren't wearing anything in this equipment slot... at all.";
			this.attackVerb = "";
			
			//Information
			this.basePrice = 0;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = _latestVersion;
		}
	}
}