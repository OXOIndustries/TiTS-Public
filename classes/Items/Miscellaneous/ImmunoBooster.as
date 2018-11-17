package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.RandomInCollection;
	import classes.VaginaClass;
	
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.num2Ordinal;
	import classes.Engine.Utility.formatFloat;
	
	public class ImmunoBooster extends ItemSlotClass
	{
		//constructor
		public function ImmunoBooster()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.POTION;
			
			//Used on inventory buttons
			this.shortName = "ImmBoost";
			
			//Regular name
			this.longName = "medipen with Immuno-Booster";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a medipen with Immuno-Booster";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Initially introduced as complimentary for the Foxfire transformative, it quickly become popular among rushers for its low cost and brutal efficiency against a wide range of alien parasites.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 400;
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
			clearOutput();
			if (target is PlayerCharacter)
			{
				var effectUsed:Boolean = false;
				
				output("You inject yourself with the Immuno-Booster medipen.");
				
				if (target.hasStatusEffect("Foxfire"))
				{
					var frost:Boolean = target.statusEffectv1("Foxfire") == 1;
					target.removeStatusEffect("Foxfire");
					output("\n\nYou shiver as a sudden chill clings to your " + target.skin() + ". The effects of " + (frost ? "Frostfire" : "Foxfire") + " has faded!");
					
					var fireColor:String = frost ? "fiery blue" : "glowing ember";
					var newColor:String = frost ? RandomInCollection(["snowy white"]) : RandomInCollection(["red", "red", "red", "orange", "orange"]);
					
					var accentColor:String = frost ? "flickering silver" : "blazing red";
					var accentNewColor:String = frost ? "luminous azure" : "luminous crimson";
					
					if (target.hasPerk("Enlightened Nine-tails") || target.hasPerk("Nine-tails"))
					{ // true kitsune colors, mostly for LD mod compatibility
						newColor = RandomInCollection("shimmering golden", "shimmering silver", "pure white", "iridescent gray");
						accentNewColor = "luminous azure";
					}
					else if (target.hasPerk("Corrupted Nine-tails"))
					{
						newColor = RandomInCollection(["pitch black", "ashen gray", "sable"]);
						accentNewColor = "luminous purple";
					}
					
					var furNotification:Boolean = false;
					var hairNotification:Boolean = false;
					
					if (target.hairColor == fireColor && target.hasHair() && target.hairType != GLOBAL.HAIR_TYPE_FEATHERS) hairNotification = true;
					if (target.furColor == fireColor && target.hasFur() && target.skinType != GLOBAL.SKIN_TYPE_FEATHERS) furNotification = true;
					
					if (hairNotification && furNotification) output("\n\nThe glow on your fur begins to fade, with your " + target.hairNoun() + " following suit - settling for a plainer " + newColor + ". <b>Your fur and hair are now " + newColor + "!</b>");
					else if (hairNotification) output("\n\nYour " + target.hairDescript(false, true) + " grows dim, losing its luminosity as it becomes regular  " + newColor + " hair. <b>Your hair is now " + newColor + "!</b>");
					else if (furNotification) output("\n\nThe glow on your " + target.skinFurScales(true, true, false) + " begins to fade, settling for a plainer " + newColor + ". <b>Your fur is now " + newColor + "!</b>");
					
					if (target.hairColor == fireColor && target.hairType != GLOBAL.HAIR_TYPE_FEATHERS) target.hairColor = newColor;
					if (target.furColor == fireColor && target.skinType != GLOBAL.SKIN_TYPE_FEATHERS) target.furColor = newColor;
					
					if (target.skinAccent == accentColor && target.hasStatusEffect("Vanae Markings"))
					{
						output("\n\nYour markings previously intense glow turn dim as it takes on a softer, less prominent tone. <b>Your markings are now " + accentNewColor + "!</b>");
						target.skinAccent = accentNewColor;
					}
					effectUsed = true;
				}
				
				if (target.hasParasiteTail())
				{
					if (target.tailCount == 1)
						output("\n\nYour [pc.tail] becomes limp as if suddenly paralyzed, then proceeds to crumble to dust before your eyes as it disintegrates completely, leaving no trace anything was ever attached to you. Your parasitic tail is gone!");
					else
						output("\n\nYour [pc.tails] become limp as if suddenly paralyzed, then proceed to crumble to dust before your eyes as they disintegrate completely, leaving no trace anything was ever attached to you. Your parasitic tails are gone!");
					target.removeTails();
					effectUsed = true;
				}
				
				if (kGAMECLASS.attachedMimbranes() > 0) // Mimbrane removal, copy-paste from Foxfire
				{
					if (kGAMECLASS.attachedMimbranes() == 1)
						output("\n\nYour mimbrane parasite turns a sickly pale as it suddenly releases your [pc.skin], slumping to the ground lifelessly. You almost feel sorry for the poor creature as it shrivels up and crumbles to dust before your eyes. <b>Your mimbrane is gone!</b>");
					else
						output("\n\nYour mimbrane parasites turn a sickly pale as they suddenly let go of your [pc.skin], slumping to the ground lifelessly. You almost feel sorry for the poor creatures as they shrivel up and crumble to dust before your eyes. <b>Your mimbranes are gone!</b>");
					kGAMECLASS.removeMimbranes();
					effectUsed = true;
				}
				
				if (target.hasStatusEffect("Butt Bug (Female)")) // Butt Bug removal
				{
					kGAMECLASS.removeButtBugImmunoBooster();
					effectUsed = true;
				}
				
				if(target.hasStatusEffect("Hair Flower"))
				{
					output("\n\nThere is a slight tingle on your head--most notably at the base of " + (target.statusEffectv1("Hair Flower") <= 1 ? "the huge orchid attached to it" : "your huge orchids") + ". Nothing seems to happen afterwards but your codex beeps, notifying you that something has indeed changed...");
					target.setStatusMinutes("Hair Flower", 60);
					
					effectUsed = true;
				}
				
				if(!effectUsed)
				{
					output(".. and nothing happens.");
					output("\n\nYour codex beeps, informing you that your immune system has nothing abnormal to combat.");
				}
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " injects the Immuno-Booster with no effect.");
			}
			return false;
		}
	}
}
