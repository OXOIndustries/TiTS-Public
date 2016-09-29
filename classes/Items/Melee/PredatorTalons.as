package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class PredatorTalons extends ItemSlotClass
	{
		//constructor
		public function PredatorTalons()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "P.Talons";
			
			//Regular name
			this.longName = "Predator Talons";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pair of Predator Talons";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "These heavy gauntlets emit blades of burning plasma to the front and sides, allowing every punch to do just as much damage as an industrial plasma cutter. Not a weapon to be trifled with, or one you want to switch on accidentally.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "claw";
			attackNoun = "burning claw";
			
			//Information
			this.basePrice = 25000;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.burning.damageValue = 17;
			baseDamage.kinetic.damageValue = 4;
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_BURN);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 3;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}