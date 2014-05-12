package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class MilkBag extends ItemSlotClass
	{
		//constructor
		public function MilkBag()
		{
			this._latestVersion = 1;
			this.hasRandomProperties = true;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "MilkBag";
			
			//Regular name
			this.longName = "bag of milk";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a bag of milk";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This bag was filled from a Magic-Milker 7, a product of JoyCo. JoyCo makes no guarantees of the quality or safety of the fluid this bag contains.\n\nThe value of this item will vary depending on its level of fullness and the fluid inside, though most liquids will never bypass basic commodity levels.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 2;
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
			if(!kGAMECLASS.debug) quantity++;
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.clearOutput();
				kGAMECLASS.output("You have no use for this item at present.");
			}
			else {
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " cannot use the bag.");
			}
			return true;
		}
	}
}
