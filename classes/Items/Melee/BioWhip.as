package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class BioWhip extends ItemSlotClass
	{
		//constructor
		public function BioWhip()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "BioWhip";
			
			//Regular name
			this.longName = "single-tailed bio whip";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a single-tailed bio whip";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This single-tailed bio whip is designed mainly from braided leather, but its tip is actually organic, based off the biology of a skorian’s tail and coated in a translucent aphrodisiac. When a subject is struck by the whip, the potent drug is directly delivered, causing both pleasure and pain to surge through their skin. There is a disclaimer label stating prolonged whipping may cause an individual to confuse pain with pleasure.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "whip";
			attackNoun = "whip";
			
			//Information
			this.basePrice = 4500;
			this.attack = 5;
			
			baseDamage.kinetic.damageValue = 2;
			baseDamage.drug.damageValue = 13;
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 1;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
