package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class TrashArmor extends ItemSlotClass
	{
		//Level 4 (Common). Balance 2.0
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
			this.basePrice = 1000;
			this.attack = -1;
			this.defense = 7;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = -2;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = -2;
			this.fortification = 10;
			
			itemFlags = [GLOBAL.ITEM_FLAG_AIRTIGHT];
			resistances.addFlag(DamageFlag.PLATED);

			this.version = _latestVersion;
		}
	}
}
