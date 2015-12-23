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
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	
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
			this.tooltip = "This ball of goo smells pretty acrid, so you probably shouldn't eat it. The ganrael use it to alter their gooey locks. Maybe it'll work on more traditional types of hair too?";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
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
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Gardeford");
			if(target is PlayerCharacter) {
				//pc is human
				if(target.hairType != GLOBAL.HAIR_TYPE_GOO)
				{
					output("You rub the ball of goo ");
					if(target.hasHair()) output("into your [pc.hair]");
					else output("onto your scalp");
					output(". You stand for a moment, waiting for something to happen. Eventually you realize that nothing is going to happen, and you've just rubbed a wad of goo all over your head...");
				}
				//pc is goo
				else
				{
					output("You rub the ball of goo ");
					if(target.hasHair()) output("into your [pc.hair]");
					else output("onto your scalp");
					output(", smiling widely when it's color changes to match the ball's. Using your codex's mirror function, you admire the new color, striking a few cool poses to test it out.");
					target.hairColor = "pink";
				}
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " rubs the goo on their head to no effect.");
			}
			return false;
		}
	}
}

