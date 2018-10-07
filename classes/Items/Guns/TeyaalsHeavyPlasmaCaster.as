package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class TeyaalsHeavyPlasmaCaster extends ItemSlotClass
	{
		//Level 9 (Rare). Balance 2.0
		//constructor
		public function TeyaalsHeavyPlasmaCaster()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "HvyPlasma";
			
			//Regular name
			this.longName = "Teyaal's heavy plasma caster";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a heavy plasma caster";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A modified plasma pistol, tweaked to do maximum damage at the expense of accuracy - despite the fact that it has a swanky scope bolted onto the top. Presumably this hand cannon was customized by Dr. Teyaal, the chief engineer on Zheng Shi Station. The gun’s almost certainly dangerous to the user if fired for prolonged periods... or if you’re just unlucky. But it will <i>definitely</i> ruin somebody’s day with a couple of well-placed shots.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "plasma ball";
			
			//Information
			this.basePrice = 28000;
			this.attack = -5;
			
			baseDamage = new TypeCollection();
			//baseDamage.electric.damageValue = 1;
			baseDamage.burning.damageValue = 33;
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_BURN);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);

			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 10;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}