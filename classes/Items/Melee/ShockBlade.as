package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ShockBlade extends ItemSlotClass
	{
		//constructor
		public function ShockBlade()
		{
			this._latestVersion = 1;
			
			//A KNIFE
			//4
			
			//this.indexNumber = 4;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "ShockBlade";
			
			//Regular name
			this.longName = "electrified shock blade";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an electrified shock blade";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This weapon is a curved sword that most resembles a primitive saber. The similarities end there, however. Shock blades are made from highly conductive alloys designed to deliver massive electrical shocks to their opponents. A small power cell is housed in the hilt, good for about 100 strikes before it must be recharged.";
			this.attackVerb = "shocking slash";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1450;
			this.attack = 0;
			this.damage = 12;
			this.damageType = GLOBAL.ELECTRIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);

			this.version = _latestVersion;
		}
	}
}