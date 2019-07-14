package classes.ShittyShips.ShittyShipGear.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class ThermalProjector extends ItemSlotClass
	{
		//Level 1 (Common) ship weapon
		//constructor
		public function ThermalProjector()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "T.Projector";
			
			//Regular name
			this.longName = "thermal projector cannon"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a thermal projector cannon";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Thermal projectors rely on intense bursts of short-range radiation to literally melt away the target’s armor. Due to how rapidly such energies dissipate into the vastness of space, thermal projectors must be fired at or near point blank range, making them unpopular choice of weapon for all but the most aggressive of pilots.";
			this.attackVerb = "shoot";
			attackNoun = "thermal radiation";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 2000;
					
			baseDamage.burning.damageValue = 365;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_SHIP_EQUIPMENT);
			
			this.attack = -10;
			this.defense = 0;
			this.shieldDefense = 45;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = -5;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
