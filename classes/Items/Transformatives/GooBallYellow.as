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
	
	public class GooBallYellow extends ItemSlotClass
	{
		//constructor
		public function GooBallYellow()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Yellow GB";
			//Regular name
			this.longName = "yellow ball of goo";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a yellow ball of goo";
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
		
		private function GooballUsed(target:Creature):void
		{
			target.destroyItemByType(GooBallYellow);
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
		
		private function DoSpikehawk(target:Creature):void
		{
			clearOutput();
			output("You apply the gel to your mohawk and pinch it into four vicious, punk spikes. The devil on your shoulder is going to get a poke in the eye next time you turn your head.");
			target.hairStyle = "spikehawk";
			
			if (target.hairType == GLOBAL.HAIR_TYPE_GOO && target.hairColor != "yellow")
			{
				output(" The gel’s color also bleeds through, turning the points yellow.");
				target.hairColor = "yellow";
			}
			
			GooballUsed(target);
		}
		
		private function DoQuiff(target:Creature):void
		{
			clearOutput();
			output("You slather gel into your " + target.hairDescript(true, true) +" and, when it begins to harden, put it up into a big, tapered point! Your fans will adore it.");
			target.hairStyle = "quiff";
			
			if (target.hairType == GLOBAL.HAIR_TYPE_GOO && target.hairColor != "yellow")
			{
				output(" The color also swamps your gooey locks, turning them yellow.");
				target.hairColor = "yellow";
			}
			
			GooballUsed(target);
		}
		
		private function DoRinglets(target:Creature):void
		{
			clearOutput();
			output("You slather your " + target.hairDescript(true, true) +" one lock at a time and twist it around your fingers. The gel");
			target.hairStyle = "ringlets";
			
			if (target.hairType == GLOBAL.HAIR_TYPE_GOO && target.hairColor != "yellow")
			{
				output(" bleeds color through your goopy drape and");
				target.hairColor = "yellow";
			}
			
			output(" hardens your ‘do into" + target.hairColor + ", bouncy ringlets. Cute!");
			
			GooballUsed(target);
		}
		
		private function DoCurtains(target:Creature):void
		{
			clearOutput();
			output("You smear gel onto your antennae and then stick your bangs to them. The gel hardens, and you can move them to open your hair like drapes. Now you can flash people with your face!");
			target.hairStyle = "curtains";
			
			if (target.hairType == GLOBAL.HAIR_TYPE_GOO) target.hairColor = "yellow";
			else if (target.hairType == GLOBAL.HAIR_TYPE_TENTACLES) output(" Well, you could before, but now it looks theatrical.");
			
			GooballUsed(target);
		}
		
		private function DoFingerwave(target:Creature):void
		{
			clearOutput();
			output("You rub the gel into your " + target.hairDescript(true, true) +" and crimp it into waves for a classy, classic look.");
			target.hairStyle = "fingerwave";
			
			if (target.hairType == GLOBAL.HAIR_TYPE_GOO && target.hairColor != "yellow")
			{
				output(" The gel’s color also spreads, turning your gooey locks yellow.");
				target.hairColor = "yellow";
			}
			output(" <i>Très chic</i>.");
			
			GooballUsed(target);
		}
		
		private function DoTopknot(target:Creature):void
		{
			clearOutput();
			output("You apply the gel to your " + target.hairDescript(true, true) + " and then pin it up in a tight topknot. It’s solid enough to anchor a helmet");
			target.hairStyle = "topknot";
			if (target.hairType == GLOBAL.HAIR_TYPE_FEATHERS)
			{
				output(", and you even fan the tips of your feathers into a gingko leaf shape");
			}
			output("!");
			
			if (target.hairType == GLOBAL.HAIR_TYPE_GOO && target.hairColor != "yellow")
			{
				output(" The ball’s color also swamps your own, changing your hair to yellow.");
				target.hairColor = "yellow";
			}
			
			GooballUsed(target);
		}
		
		private function DyeHair(target:Creature):void
		{
			clearOutput();
			output("You carefully work the gel into your " + target.hairDescript(true, false) +", doing your utmost not to disturb your hairstyle in the process. In a matter of seconds your locks begin to soak up the shade of the gel, changing your hair to yellow.");
			target.hairColor = "yellow";
			
			GooballUsed(target);
		}
		
		private function DyeBody(target:Creature):void
		{
			clearOutput();
			output("You stare down the glob like a horse pill and then throw it in your hatch. It feels like swallowing cotton. By the time it reaches your chest, it’s already begun to leak a cloud of color which radiates all over, making you stiff and slightly numb. <b>When full sensation comes back, your skin is yellow!</b>");
			
			target.skinTone = "yellow";
			
			GooballUsed(target);
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Gardeford");
			if (target is PlayerCharacter) 
			{
				output("You consider the blob of ganrael goo, which has formed a slight crust on its surface. If you wanted, you could probably smear it on something to stiffen it... your hair, for example.");
				if (target.hairType == GLOBAL.HAIR_TYPE_GOO)
				{
					output(" It’d probably change your color if you did, since your hair is also goo.");
					if (target.skinType == GLOBAL.SKIN_TYPE_GOO || target.hasSkinFlag(GLOBAL.FLAG_GOOEY)) output(" For that matter, it’d work on your body, too.");
				}
				else if (target.skinType == GLOBAL.SKIN_TYPE_GOO || target.hasSkinFlag(GLOBAL.FLAG_GOOEY)) output(" It’d probably change the color of your body too, since your skin is gooey.");
				
				clearMenu();
				if (target.hairStyle != "spikehawk")
				{
					if (target.hairStyle == "mohawk") addButton(0, "Spikehawk", DoSpikehawk, target, "Spikey Mohawk", "Shape your mohawk into a spikehawk.");
					else addDisabledButton(0, "Spikehawk", "Spikey Mohawk", "You don’t have a mohawk to spike.");
				}
				else addDisabledButton(0, "Spikehawk", "Spikey Mohawk", "Your hair is currently styled like this!");
				
				if (target.hairStyle != "quiff")
				{
					if (target.hairLength >= 5) addButton(1, "Quiff", DoQuiff, target, "Quiff", "Shape your hair into a single sleek, tapered point.");
					else addDisabledButton(1, "Quiff", "Quiff", "Your hair’s too short for this style.");
				}
				else addDisabledButton(1, "Quiff", "Quiff", "Your hair is currently styled like this!");
				
				if (target.hairStyle != "ringlets")
				{
					if (target.hairLength >= 10) addButton(2, "Ringlets", DoRinglets, target, "Ringlets", "Shape your hair into helical loops.");
					else addDisabledButton(2, "Ringlets", "Ringlets", "Your hair’s too short for this style.");
				}
				else addDisabledButton(2, "Ringlets", "Ringlets", "Your hair is currently styled like this!");
				
				if (target.hairStyle != "curtains")
				{
					if (target.hairLength >= 10 && target.hasAntennae()) addButton(3, "Curtains", DoCurtains, target, "Curtains", "Glue your bangs to your antennae and make curtains you can wave around.");
					else if (target.hairLength < 10) addDisabledButton(3, "Curtains", "Curtains", "You don’t have long enough hair.");
					else addDisabledButton(3, "Curtains", "Curtains", "You don’t have antennae.");
				}
				else addDisabledButton(3, "Curtains", "Curtains", "Your hair is currently styled like this!");
				
				if (target.hairStyle != "fingerwave")
				{
					addButton(4, "Fingerwave", DoFingerwave, target, "Fingerwave", "Shape your hair into a wavy, close bob.");
				}
				else addDisabledButton(4, "Fingerwave", "Fingerwave", "Your hair is currently styled like this!");
				
				if (target.hairStyle != "topknot")
				{
					if (target.hairLength <= 6) addButton(5, "Topknot", DoTopknot, target, "Topknot", "Put your hair up in an ironclad topknot.");
					else addDisabledButton(5, "Topknot", "Topknot", "You have too much hair for this style.");
				}
				else addDisabledButton(5, "Topknot", "Topknot", "Your hair is currently styled like this!");
				
				if (target.hairType == GLOBAL.HAIR_TYPE_GOO && target.hairColor != "yellow") addButton(6, "Dye Hair", DyeHair, target, "Dye Hair", "Use the goo to dye your hair.");
				else if (target.hairType != GLOBAL.HAIR_TYPE_GOO) addDisabledButton(6, "Dye Hair", "Dye Hair", "The gooball can only dye gooey hair types!");
				else addDisabledButton(6, "Dye Hair", "Dye Hair", "Your hair’s already been dyed the colour of this ball of goo!");
				
				if ((target.skinType == GLOBAL.SKIN_TYPE_GOO || target.hasSkinFlag(GLOBAL.TYPE_GOOEY)) && target.skinTone != "yellow") addButton(7, "Dye Body", DyeBody, target, "Dye Body", "Use the goo to dye your gooey body.");
				else if (target.skinTone == "yellow") addDisabledButton(7, "Dye Body", "Dye Body", "Your body is already the same color as this ball of goo!");
				else addDisabledButton(7, "Dye Body", "Dye Body", "Eating this without a gooey body would result in one hell of a blockage.");
				
				addButton(14, "Back", kGAMECLASS.useItemFunction);
				
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

