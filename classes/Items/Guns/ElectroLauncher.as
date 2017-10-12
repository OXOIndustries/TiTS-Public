package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ElectroLauncher extends ItemSlotClass
	{
		//Level 7 (Rare). Balance 2.0
		//constructor
		public function ElectroLauncher()
		{
			this._latestVersion = 1;
						
			//this.indexNumber = 4;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Electrogun";
			
			//Regular name
			this.longName = "CTL-3 electric launcher";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a CTL-3 electric launcher";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The CTL-3 is a standad rocket launcher loaded with a modified payload: powerful electron charges, capable of creating damaging electirc arcs in a wide area.";
			this.attackVerb = "shock";
			attackNoun = "lightning charge";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 11000;
			this.attack = -8;
			
			baseDamage.electric.damageValue = 29;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}