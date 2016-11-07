package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class GooBallPink extends ItemSlotClass
	{
		//constructor
		public function GooBallPink()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Pink GB";
			//Regular name
			this.longName = "pink ball of goo";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pink ball of goo";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This ball of leftover ganrael gloop has formed a little crust all on its own. It doesn’t have much stiffening power remaining but it could hold something light in place, like hair.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			//Information
			this.basePrice = 70;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Gardeford/Zeikfried");
			if (target is PlayerCharacter) 
			{
				kGAMECLASS.gooballOption([GooBallPink]);
				return true;
			}
			else 
			{
				kGAMECLASS.output(target.capitalA + target.short + " rubs the goo on their head to no effect.");
				return false;
			}
		}
	}
}

