package classes.Items.Protection
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	// Debug item much?
	public class DBGShield extends ItemSlotClass
	{
		public function DBGShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventory buttons
			this.shortName = "DBG Shield";
			
			//Regular name
			this.longName = "Delta Borite-Gavlon shield emitter";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Delta Borite-Gavlon shield emitter";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "It could be said that, in many ways, GDN systems development of their personal defense shielding technology was a game changer... almost as if their devices, the DBG ranked amongst them, could dramatically unbalance the playing field.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 50;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 500;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);
			this.bonusResistances[GLOBAL.KINETIC] = 1.1;
			this.bonusResistances[GLOBAL.SLASHING] = 1.1;
			this.bonusResistances[GLOBAL.PIERCING] = 1.1;
			
			this.bonusResistances[GLOBAL.LASER] = 0.5;
			this.bonusResistances[GLOBAL.PLASMA] = 0.4;
			this.bonusResistances[GLOBAL.GRAVITIC] = 0.6;
			this.bonusResistances[GLOBAL.ELECTRIC] = 0.9;
			this.bonusResistances[GLOBAL.THERMAL] = 0.75;
			
			this.version = _latestVersion;
		}
	}
}