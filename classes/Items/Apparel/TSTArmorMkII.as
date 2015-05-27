package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * aka Thanks for using muh test items SAVIN :||||||
	 * @author Gedan
	 */
	public class TSTArmorMkII extends ItemSlotClass
	{
		
		public function TSTArmorMkII() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "TST Armor II";
			
			this.longName = "TS-T armor plating mark II";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "an upgraded set of hardened, energy absorbant armor plates";
			
			this.tooltip = "TS-T armor features an engineered hybrid of materials, utilizing a mesh of complex fullerene molecules to suspend a trade-secret mixture of secondary elements in isolation. The result is a tunable sacrificial material; a highly energy resistant, light weight armor, that can be reconfigured to dissipate a variety of energy emissions.\n\nThe mark II variation of the TS-T armor series offers a series of military-demanded features and upgrades over the consumer version, including but not limited to <b>GAME BREAKING THINGS THAT SHOULD ONLY BE USED TO TEST GAME SUBSYSTEMS</b>. Prolonged usage of the Mk. II version of the armoring system has a nasty habit of taking an unsightly toll on the wearer.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 200;
			this.attack = 0;
			this.defense = 1;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 1;
			
			this.resistances.kinetic.resistanceValue = 5;
			this.resistances.electric.resistanceValue = 10;
			this.resistances.burning.resistanceValue = 15;
			this.resistances.freezing.resistanceValue = 20;
			this.resistances.corrosive.resistanceValue = 25;
			this.resistances.poison.resistanceValue = 30;
			this.resistances.psionic.resistanceValue = 35;
			this.resistances.drug.resistanceValue = 40;
			this.resistances.pheromone.resistanceValue = 45;
			this.resistances.tease.resistanceValue = 50;
			
			this.resistances.addFlag(DamageFlag.ABLATIVE);
			this.resistances.addFlag(DamageFlag.MIRRORED);
			this.resistances.addFlag(DamageFlag.GROUNDED);
			
			this.version = this._latestVersion;
		}
		
	}

}