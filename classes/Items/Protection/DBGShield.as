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
			this.tooltip = "It could be said that, in many ways, GDN systems development of their personal defense shielding technology was a game changer... almost as if their devices, the DBG ranked amongst them, could dramatically unbalance the playing field.\n\nThat is until the item had served its purpose for debugging item tooltips. Now it's little more than a pile of barely functional junk.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 1;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 1;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);
			this.bonusResistances[GLOBAL.KINETIC] = 0.35;
			this.bonusResistances[GLOBAL.SLASHING] = 0.25;
			this.bonusResistances[GLOBAL.PIERCING] = 0.15;
			
			this.bonusResistances[GLOBAL.LASER] = 0.1;
			this.bonusResistances[GLOBAL.PLASMA] = 0.2;
			this.bonusResistances[GLOBAL.GRAVITIC] = 0.3;
			this.bonusResistances[GLOBAL.ELECTRIC] = 0.4;
			this.bonusResistances[GLOBAL.THERMAL] = 0.6;
			
			this.version = _latestVersion;
		}
	}
}