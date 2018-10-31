package classes.Items.Melee 
{	
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Fenoxo Fenballs :3 <3
	 */
	public class SaurmorianHammer extends ItemSlotClass
	{
		//Level 9 (Rare). Balance 2.0
		public function SaurmorianHammer() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "S.Hammer";
			
			//Regular name
			this.longName = "saurmorian hammer";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a large saurmorian hammer";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Essentially an enormous bushing hammer - with spiked heads capable of extremely high vibration frequencies - this weapon was designed specifically to crush and break through the thick, heavy scales of an unruly saurmorian; making this spiked maul a favorite among law enforcement of locations with saurmorian populations.";
			attackVerb = "swing";
			attackNoun = "smash";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 39000;
			
			baseDamage.kinetic.damageValue = 35;
			baseDamage.addFlag(DamageFlag.CRUSHING);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_STUN);
			
			this.attack = -7;
			this.critBonus = 9;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.evasion = -5;
			this.fortification = 0;
			
			addFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR);

			this.version = _latestVersion;
		}	
	}
}
