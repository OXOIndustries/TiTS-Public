package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class TrashArmor extends ItemSlotClass
	{
		//constructor
		public function TrashArmor()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "T.Armor";
			
			//Regular name
			this.longName = "ancient space suit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an ancient space suit";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Perhaps in the distant past this a shining image of the space suit of the future, with huge metal men dancing across the solarscapes, yet now it’s anything but. The only practical use this has is for discarded wrappers to be shoved in the mouthpiece. Still, while enormously unwieldy, you’d still be able to navigate in it. Blows from your foes would bounce off the thick metal, ringing in your ears instead. Is there such a thing as tinnitus shots?";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 3000;
			this.attack = -2;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 8;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = -2;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = _latestVersion;
		}
	}
}