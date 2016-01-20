package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class EmmysSalamanderRifle extends ItemSlotClass
	{
		//constructor
		public function EmmysSalamanderRifle()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "E's Rifle";
			
			//Regular name
			this.longName = "tweaked Salamander Rifle";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "Emmy’s Salamander Rifle";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Built with gunmetal gray barrels, gleaming crimson handgrips, and polished white accents, the Salamander line of weapons from KihaCorp cut an impressive figure for those lucky enough to afford them. The strength of their incandescent beams falls just short of military grade, allowing them to be sold as hunting and personal defense weapons to the greater populace. The rifles come equipped with high-tech holoscopes for greater accuracy in the field.\n\nEmmy fitted it with a hotshot energy supply, replaced the regulator contacts, and gave it a better muzzle. It should make it a little easier to land criticals.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "laser beam";
			
			//Information
			this.basePrice = 14000;
			this.attack = 5;
			
			baseDamage = new TypeCollection();
			baseDamage.electric.damageValue = 1;
			baseDamage.burning.damageValue = 19;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.LASER);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 2;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}
