package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * @author Gedan
	 */
	public class SilkDress extends ItemSlotClass
	{
		//Level 8 (Common). Balance 2.0
		public function SilkDress() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "S.Dress";
			
			this.longName = "silk dress";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a silk dress";
			
			this.tooltip = "The classic formal dress known the universe over. It’s long, sleek, and completely flattering to its wearer. Add in the fact that it’s waterproof and made of chameleon silk, meaning you can change its color at will, and you’ve got an entire wardrobe in one sexy outfit.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 15000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 12;
			this.fortification = 0;
			
			resistances.burning.resistanceValue = 25.0;

			this.version = this._latestVersion;
		}
	}
}
