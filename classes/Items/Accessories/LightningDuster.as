package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LightningDuster extends ItemSlotClass
	{
		
		
		public function LightningDuster() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "L.Duster";
			
			//Regular name
			this.longName = "a lightning duster";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a lightning duster";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Though dusters have long since fallen out of fashion, the Aegis Corporation has found the pattern useful when creating personal defenses against energy weapons. This lightning duster is wired with electricity grounds to disappate any electrical attack against the wearer, rendering them near-invulnerable to electrical attacks, though at a glance, it merely appears to be an intricately-patterned duster.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 8000;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, -1, 0);
			
			this.version = _latestVersion;
		}	
	}
}