package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class BBQToGo extends ItemSlotClass
	{
		
		//constructor
		public function BBQToGo()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.FOOD;
			
			//Used on inventory buttons
			this.shortName = "BBQ To-Go";
			
			//Regular name
			this.longName = "box of barbeque to-go";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a box of barbeque to go";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A tasty packaged meal from the Barbeque Pit on New Texas, this ever-fresh BBQ meal comes with fries and soda. Probably not great for your figure, but it’s guaranteed to give you a boost of energy in the middle of a long day at the office... or of galactic adventuring.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 15;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//Consume:
				//Effect: %Chance +thickness, +25 Energy
				kGAMECLASS.output("You pop open the packaged BBQ To-Go meal and quickly munch down a nice, hot, fresh-tasting roast beef sandwich and fries, washing it down with a swig of sweet bottled orange soda. Delicious!");
				target.energy(25);
				target.thickness += 2;
				if(target.thickness >= 100) target.thickness = 100;
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " eats the food, getting a quick energy boost.");
				target.energy(35);
			}
			return false;
		}
	}
}
