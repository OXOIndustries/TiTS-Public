package classes.Items.Armor 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * @author Gedan
	 */
	public class VoidPlateArmor extends ItemSlotClass
	{
		//Level 7 (Rare). Balance 2.0
		public function VoidPlateArmor() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "Void Plates";
			
			this.longName = "Black Void armor plate";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a suit of Black Void plate";
			
			this.tooltip = "TS-T armor features an engineered hybrid of materials, utilizing a mesh of complex fullerene molecules to suspend a trade-secret mixture of secondary elements in isolation. The result is a tunable sacrificial material; a highly energy resistant, light weight armor, that can be reconfigured to dissipate a variety of energy emissions.\n\nThe mark IV variation of the armoring system integrated a series of material refinements designed to better combat laser and other energy-based weapons.\n\nThis set of armor has been further modified by Black Void engineers; it looks slightly bulkier than standard sets of TS-T plating, and is adorned in the ‘official’ black-red shades of the organization.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 11100;
			this.attack = 0;
			this.defense = 6;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 1;
			this.fortification = 3;
			
			//this.resistances.kinetic.resistanceValue = 15;
			this.resistances.electric.resistanceValue = 10;
			this.resistances.burning.resistanceValue = 10;
			this.resistances.freezing.resistanceValue = 10;
			this.resistances.corrosive.resistanceValue = 10;
			this.resistances.poison.resistanceValue = 3;
			
			this.resistances.addFlag(DamageFlag.MIRRORED);
			//this.resistances.addFlag(DamageFlag.GROUNDED);
			
			this.version = this._latestVersion;
		}
		
	}

}
