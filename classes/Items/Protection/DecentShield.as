package classes.Items.Protection
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class DecentShield extends ItemSlotClass
	{
		//Level 1 (Rare). Balance 2.0
		//constructor
		public function DecentShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventodecentttons
			this.shortName = "Decent S.";
		
			//Regular name
			this.longName = "decent JoyCo shield generator";
		
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a decent JoyCo shield generator";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A moderately priced JoyCo shield generator that’s generally only available for order over the extranet.";
			this.attackVerb = "null";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 200;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 18;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances = new TypeCollection();
			resistances.kinetic.damageValue = 40.0;
			resistances.burning.damageValue = 20.0;
			resistances.corrosive.damageValue = 20.0;
			resistances.electric.damageValue = -50.0;

			this.version = _latestVersion;
		}
	}
}