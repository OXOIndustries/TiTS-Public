package classes.Items.Treasures
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class QueenlyNecklace extends ItemSlotClass
	{
		//constructor
		public function QueenlyNecklace()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 20;
			this.type = GLOBAL.GEM;
			
			//Used on inventory buttons
			this.shortName = "Q.Necklace";
			
			//Regular name
			this.longName = "Queenly Necklace";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Queenly Necklace";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This enormous necklace is clearly made for a giant of a woman, and weighs enough to nearly topple a normal person over if they chose to wear it. It won’t do you much good, but it’s definitely worth a pretty penny.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 13000;
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
