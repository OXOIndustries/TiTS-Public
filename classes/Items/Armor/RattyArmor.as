package classes.Items.Armor 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * @author Fennykins
	 */
	public class RattyArmor extends ItemSlotClass
	{
		//Level 9 (Common). Balance 2.0
		public function RattyArmor() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "RattyArmor";
			
			this.longName = "ratty armor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a suit of ratty armor";
			
			this.tooltip = "This suit of combat armor looks to have been assembled by salvaged or looted parts from a half-dozen different companies and designs. Somehow, it all came together in an effective-looking package; the coat of matte black paint certainly helps. For some reason the helmet has a fold-up pair of mouse ears, presumably in keeping with a pirate gang’s aesthetics.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 28000;
			this.attack = 0;
			this.defense = 12;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 16;
			
			/*this.resistances.kinetic.resistanceValue = 15;
			this.resistances.electric.resistanceValue = 10;
			this.resistances.burning.resistanceValue = 10;
			this.resistances.freezing.resistanceValue = 10;
			this.resistances.corrosive.resistanceValue = 10;
			this.resistances.poison.resistanceValue = 3;*/
			
			//this.resistances.addFlag(DamageFlag.MIRRORED);
			//this.resistances.addFlag(DamageFlag.GROUNDED);
			
			this.version = this._latestVersion;
		}
		
	}

}
