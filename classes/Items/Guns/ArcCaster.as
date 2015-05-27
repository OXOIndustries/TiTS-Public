package classes.Items.Guns 
{	
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ArcCaster extends ItemSlotClass
	{
		
		public function ArcCaster() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "ArcCast.";
			
			//Regular name
			this.longName = "arc caster";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an arc caster";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A big, bulky hand cannon charged with a JoyCo hovercar battery, the Arc Caster projects a stream of electricity that can burn through shields, armor, and flesh with equal ease. A skilled user can cause the caster's stream to arc between multiple targets, making it a favored weapon for crowd control situations.";
			this.attackVerb = "shock";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 6700;
			this.attack = 2;
			
			baseDamage.electric.damageValue = 14;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			
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