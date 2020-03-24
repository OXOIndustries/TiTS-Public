package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class WeavemailCoat extends ItemSlotClass
	{
		//Level 8 (Common). Balance 2.0
		//constructor
		public function WeavemailCoat()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "WM Coat";
			
			//Regular name
			this.longName = "weavemail coat";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a weavemail coat";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A stylish piece of armor resembling long coat. Much like its lesser sibling, it is made of interwoven layers of spinarran filament mail and ballistic fiber covered by leather, cloth or even made to show off the spinarran mail underneath. Weavemail coats can also include an attached hood. Under the multiple protective layers is a layer of soft downy fur to help keep heat inside while venturing into Uveto’s harsh wilds.";
			// (moderate defence, moderate kinetic resistance, some thermal resistance)
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 15000;
			this.attack = 0;
			this.defense = 9;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			//resistances.kinetic.resistanceValue = 25.0;
			resistances.freezing.resistanceValue = 18.0;
			//resistances.addFlag(DamageFlag.ABLATIVE);
			
			this.version = _latestVersion;
		}
	}
}