package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ApolloPlasmaRifle extends ItemSlotClass
	{
		//Level 9 (Rare). Balance 2.0
		//constructor
		public function ApolloPlasmaRifle()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "ApolloPR";
			
			//Regular name
			this.longName = "Apollo plasma rifle";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an Apollo plasma rifle";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The Apollo plasma rifle is a mainstay of Terran military forces. Originally produced by Reaper Armaments, it now has variants in use from over a dozen different manufacturers. The one in your hands, however, is definitely one of the originals. It lacks the heat vents added in later revisions to support full-auto fire.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "plasma ball";
			
			//Information
			this.basePrice = 40000;
			this.attack = 4;
			
			baseDamage = new TypeCollection();
			//baseDamage.electric.damageValue = 1;
			baseDamage.burning.damageValue = 29;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_BURN);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}