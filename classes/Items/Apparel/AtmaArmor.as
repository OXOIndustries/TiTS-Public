package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class AtmaArmor extends ItemSlotClass
	{
		
		public function AtmaArmor() 
		{
			this._latestVersion = 1;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "AtmaArmor";
			this.longName = "Atma Armor Mk. I";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a mark one suit of Xenogen's Atma Armor";
			this.tooltip = "Xenogen Industries patented Atma Armor, Mark One. It is designed to auto-administer chemical suppressants when the wearer is subjected to arousing stimuli, aphrodisiacs, or pheromones. Guaranteed to reduce workplace sexual harassment claims.";
			TooltipManager.addTooltip(this.shortName, this.tooltip);

			this.attackVerb = "";
			
			this.bonusLustVuln = -0.3;
			this.basePrice = 1550;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 2;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = [0, 0, 0, 0, 0, 0, 0, 0];
			
			this.version = this._latestVersion;
		}
		
	}

}