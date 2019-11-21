package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection; 
	import classes.Engine.Combat.DamageTypes.DamageFlag; 
	
	/**
	 * @author Zavos
	 */
	
	public class TriBeamRifle extends ItemSlotClass
	{
		//Level 9 (common). Balance 2.0
		public function TriBeamRifle()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "T.B. Rifle";
			
			//Regular name
			this.longName = "Tri-beam Rifle";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a tri-beam rifle";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "An obscure type of rifle, capable of shooting alternating beams of energy. Though relatively effective against most armor types, the design’s bulk and upkeep often sees it passed over in favor of more practical designs.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot"; 
			attackNoun = "energy beam"; 
			
			//Information
			this.basePrice = 37000;
			this.attack = 10; 
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = -5;
			this.fortification = 0;
			
			
			this.baseDamage = new TypeCollection(); 
			this.baseDamage.electric.damageValue = 10;
			this.baseDamage.burning.damageValue = 10;
			this.baseDamage.freezing.damageValue = 10;
			this.baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			this.baseDamage.addFlag(DamageFlag.LASER);
			this.addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			this.addFlag(GLOBAL.ITEM_FLAG_RIFLE_WEAPON);
			
			
			this.version = _latestVersion;
		}
	}
}