package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Jolthammer extends ItemSlotClass
	{
		//constructor
		public function Jolthammer()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "J.Hmmr.";
			
			//Regular name
			this.longName = "Jolthammer";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Jolthammer";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The Jolthammer is a weapon based on an age-old design but given a modern flair by the engineers at KihaCorp. It’s heavy, conductive head is actually divided by several layers of non-conductive materials, allowing it to build up opposing electrical charges - much like a modern supercapacitor. On impact, this energy is discharged through the target creature, frying nerves and crushing bone with equal authority.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "smash";
			attackNoun = "shocking smash";
			
			//Information
			this.basePrice = 15499;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 3;
			baseDamage.electric.damageValue = 21;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.CRUSHING);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = -6;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}