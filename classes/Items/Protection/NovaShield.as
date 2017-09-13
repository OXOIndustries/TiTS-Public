package classes.Items.Protection
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class NovaShield extends ItemSlotClass
	{
		//Level 6 (Rare). Balance 2.0
		//constructor
		public function NovaShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventodecentttons
			this.shortName = "N.Shield";
		
			//Regular name
			this.longName = "'Nova' shield generator";
		
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a 'Nova' shield generator";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Proudly stamped with the Bell-Isle/Grunmann logo, this shield generator bears a vague resemblance to many Reaper shield belts, though its profile is less smoothly engineered, and the emitters themselves more bulbous. It is purported to protect you from anything up to and including a supernova, according to praise-filled instruction file.";
			this.attackVerb = "null";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 4800;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 2;
			this.shields = 95;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.kinetic.resistanceValue = 30.0;
			resistances.burning.resistanceValue = 20.0;
			resistances.electric.resistanceValue = -55.0;
			
			this.version = _latestVersion;
		}
	}
}