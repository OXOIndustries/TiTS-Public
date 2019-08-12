	/**
	 * Written by Lkynmbr24
	 * @author DrunkZombie
	 */
package classes.Items.Treasures
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class CrudeSaviciteNecklace extends ItemSlotClass
	{
		//constructor
		public function CrudeSaviciteNecklace()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 5;
			this.type = GLOBAL.GEM;
			
			//Used on inventory buttons
			this.shortName = "C.S.Necklace";
			
			//Regular name
			this.longName = "Crude Savicite Necklace";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a crude string of unprocessed obsidian and savicite ore";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A primitive-looking string of poorly shaped obsidian beads, dotted with the occasional savicite chunk. It doesn't look very fashionable to wear, and would chafe against your skin pretty easily. Something like this might sell for a decent amount, or in the hands of an expert, they may find this item's true value.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 3000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.isUsable = false;
			
			this.version = _latestVersion;
		}
	}
}
