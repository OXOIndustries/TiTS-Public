package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class VenusBloom extends ItemSlotClass
	{
		//constructor
		public function VenusBloom()
		{
			this._latestVersion = 1;
			//this.hasRandomProperties = true;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.QUEST_ITEM;
			
			//Used on inventory buttons
			this.shortName = "V.Bloom";
			
			//Regular name
			this.longName = "venus pitcher bloom";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a venus pitcher bloom";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This flower broke off of a venus pitcher after a chance encounter with one. The stem has already started producing tiny roots, and the petals are a kaleidoscope of purples and pinks. The sweet aroma the flower produces would make it a welcome addition to any office. Maybe you know someone that would want it?";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 0;
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
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(!kGAMECLASS.infiniteItems()) quantity++;
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.clearOutput();
				kGAMECLASS.output("You have no use for the flower at present. Maybe you can give it to someone?");
			}
			else {
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " cannot use the flower.");
			}
			return true;
		}
	}
}
