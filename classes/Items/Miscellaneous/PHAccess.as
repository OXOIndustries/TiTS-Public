package classes.Items.Miscellaneous 
{
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class PHAccess extends ItemSlotClass
	{
		
		public function PHAccess() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			this.shortName = "PH Access.";
			
			this.longName = "photon-harmonic accessory";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a prototype photon-harmonic accessory";
			
			this.tooltip = "This is a prototype device, designed to modify the harmonic characteristics of photons. Photon-harmonic. It's not a placeholder at all.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 100;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.LASER;
			this.defense = 0;
			this.shieldDefense = 1;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = this._latestVersion;
		}
		
	}

}