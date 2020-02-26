package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * @author Zavos
	 */
	
	public class ArmorSteeleSuit extends ItemSlotClass
	{
		//Level 6 (epic). Balance 2.0
		public function ArmorSteeleSuit()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "A. ST. Suit";
			
			//Regular name
			this.longName = "Armored Steel Tech Jumpsuit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a armored Steele Tech jumpsuit";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "An armored jumpsuit, based on the standard company uniform. Though it provides no more modesty than it’s sibling, shock-gel padding will provide lightweight protection for your vitals and limbs.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null"; 
			
			//Information
			this.basePrice = 20000;
			this.attack = 0; 
			this.defense = 5;
			this.shieldDefense = 0;
			this.shields = 20;
			this.sexiness = 4;
			this.resolve = 1;
			this.critBonus = 0;
			this.evasion = 3;
			this.fortification = 0;
			
			
			resistances.kinetic.resistanceValue = 15;
			resistances.electric.resistanceValue = 10;
			resistances.burning.resistanceValue = 10;
			
			
			this.version = _latestVersion;
		}
	}
}