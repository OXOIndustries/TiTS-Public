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
		
		public function VoidPlateArmor() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "Void Plates";
			
			this.longName = "Black Void modified TS-T armor plating mark IV";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a heavily modified set of hardened, energy absorbant armor plates";
			
			this.tooltip = "TS-T armor features an engineered hybrid of materials, utilizing a mesh of complex fullerene molecules to suspend a trade-secret mixture of secondary elements in isolation. The result is a tunable sacrificial material; a highly energy resistant, light weight armor, that can be reconfigured to dissipate a variety of energy emissions.\n\nThe mark IV variation of the armoring system integrated a series of material refinements designed to better combat laser and other energy-based weapons.\n\nThis set of armor has been further modified by Black Void engineers; it looks slightly bulkier than standard sets of TS-T plating, and is adorned in the ‘official’ black-red shades of the organisation.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 4000;
			this.attack = 0;
			this.defense = 5;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 2;
			
			this.resistances.kinetic.resistanceValue = 15;
			this.resistances.electric.resistanceValue = 30;
			this.resistances.burning.resistanceValue = 30;
			this.resistances.corrosive.resistanceValue = 15;
			this.resistances.poison.resistanceValue = 15;
			
			this.resistances.addFlag(DamageFlag.MIRRORED);
			this.resistances.addFlag(DamageFlag.GROUNDED);
			
			this.version = this._latestVersion;
		}
		
	}

}