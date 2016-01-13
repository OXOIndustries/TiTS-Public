package classes.Items.Protection
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class JoyCoEliteShield extends ItemSlotClass
	{
		
		//constructor
		public function JoyCoEliteShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventodecentttons
			this.shortName = "E.Shield";
		
			//Regular name
			this.longName = "elite JoyCo shield generator";
		
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an elite JoyCo shield generator";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "An ‘elite-edition’ shield generator manufactured by JoyCo. This device features an intuitive power flow function which directs protective energy to where it is most needed, enhancing its protective strength.";
			this.attackVerb = "null";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 8000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 60;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 5;
			
			resistances.kinetic.resistanceValue = 35.0;
			
			this.version = _latestVersion;
		}
	}
}