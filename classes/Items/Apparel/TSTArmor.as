package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class TSTArmor extends ItemSlotClass
	{
		//Level 4 (Common). Balance 2.0
		public function TSTArmor() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "TSTArmor";
			
			this.longName = "TS-T armor plating";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a set of hardened, energy absorbant armor plates";
			
			this.tooltip = "TS-T armor features an engineered hybrid of materials, utilizing a mesh of complex fullerene molecules to suspend a trade-secret mixture of secondary elements in isolation. The result is a tunable sacrificial material; a highly energy resistant, light weight armor, that can be reconfigured to dissipate a variety of energy emissions.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 1100;
			this.attack = 0;
			this.defense = 2;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 10;
			
			resistances.electric.resistanceValue = 15.0;
			resistances.burning.resistanceValue = 20.0;
			
			this.version = this._latestVersion;
		}
		
	}

}