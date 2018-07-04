package classes.Items.Accessories 
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Fen
	 */
	public class GooCore extends ItemSlotClass
	{
		public function GooCore() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "GooCore";
			
			//Regular name
			this.longName = "goo core";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a goo core";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "While galotians may be infamously as libidinous as they are dull-witted, a specially cut, specially treated picardine gem can remedy the latter. The process is not entirely well-understood, but by taking a gemstone inside themselves, galotians can find themselves with greatly increased cognition.\n\n(<b>This item has no effect for non-goo creatures.</b>)\n(<b>Provides +20 intelligence and +20 willpower to gooey beings.</b>)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 20000;
			this.attack = 0;
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
