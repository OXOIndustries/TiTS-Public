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
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 1;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.kinetic.damageValue = 10.0;
			resistances.electric.damageValue = 15.0;
			resistances.burning.damageValue = 20.0;
			resistances.freezing.damageValue = 25.0;
			resistances.corrosive.damageValue = 30.0;
			resistances.poison.damageValue = 35.0;
			
			resistances.psionic.damageValue = 40.0;
			resistances.pheromone.damageValue = 45.0;
			resistances.tease.damageValue = 50.0;
			resistances.drug.damageValue = 55.0;
			
			this.version = _latestVersion;
		}
	}
}