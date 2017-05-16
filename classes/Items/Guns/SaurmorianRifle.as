package classes.Items.Guns 
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
	public class SaurmorianRifle extends ItemSlotClass
	{
		public function SaurmorianRifle() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "S.Rail";
			
			//Regular name
			this.longName = "saurmorian railgun";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a custom saurmorian railgun";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This matte-black cannon, with its long and heavy barrel and dual drum-magazine, is a beloved weapon of freelancing saurmorians. Unable to be efficiently used by the military (to their utter chagrin) and never found whole, these manually constructed weapons almost always have some sentimental value to their wielders. Though you may not be able to hold one of these cumbersome things as easily as a saurmorian, you nonetheless may find yourself capable of using it as an effective weapon.";
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 25000;
			this.attack = -2;
			this.critBonus = -2;
			
			baseDamage.kinetic.damageValue = 28;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.evasion = -5;
			this.fortification = 0;

			this.version = _latestVersion;
		}	
	}
}
