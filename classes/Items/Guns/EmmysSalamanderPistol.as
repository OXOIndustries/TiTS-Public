package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class EmmysSalamanderPistol extends ItemSlotClass
	{
		//constructor
		public function EmmysSalamanderPistol()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "E's Pistol";
			
			//Regular name
			this.longName = "tweaked Salamander pistol";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "Emmy’s Salamander pistol";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Built with gunmetal gray barrels, gleaming crimson handgrips, and polished white accents, the Salamander line of weapons from KihaCorp cut an impressive figure for those lucky enough to afford them. The strength of their incandescent beams falls just short of military grade, allowing them to be sold as hunting and personal defense weapons to the greater populace. Salamander Pistols lack the superior optics of their long-barreled counterparts, but their lighter size and ease of use can make it easier to land the occasional lucky shot in a fight.\n\nEmmy fitted it with a smart-linked scope that can interface with almost anything - even the microsurgeons in your blood.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "laser beam";
			
			//Information
			this.basePrice = 13500;
			this.attack = 2;
			
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
			this.critBonus = 5;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}
