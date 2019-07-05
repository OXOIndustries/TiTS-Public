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
	
	public class CrudeSaviciteBand extends ItemSlotClass
	{
		//constructor
		public function CrudeSaviciteBand()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 5;
			this.type = GLOBAL.GEM;
			
			//Used on inventory buttons
			this.shortName = "C.S.Band";
			
			//Regular name
			this.longName = "Crude Savicite Band";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a crude ring of unprocessed obsidian ore, fitted with a small chunk of savicite";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A crude ring made of pure obsidian, with a small chunk of savicite set into the fitting. The lack of a clasp on it suggests that it is meant to be worn on the finger rather than function as a piercing. It doesn't look very fashionable to wear, and would chafe against your skin pretty easily. Something like this might sell for a decent amount, or in the hands of an expert, they may find this item's true value.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 2000;
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
