package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GLOBAL;
	import classes.Util.*;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.*;

	/**
	Changes areola shapes
	 */
	public class Areolove extends ItemSlotClass
	{
		private var counter:int = 0;
		private var options:Array = [];
		
		public function Areolove()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "Areolove";
			longName = "dose of Areolove";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a medipen loaded with Areolove";
			tooltip = "A low-grade transformative, Areolove will change the shape or size of the user’s areolae. Buttons with various shapes line up across the length of the medipen, featuring many ways to stylize your nipples. There’s a small disclaimer stating that this product might not work on unusual nipple types.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 750;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var buttons:int = 0;
			clearOutput();
			clearMenu();
			author("Somebody Else");
			var i:int = 0;
			if (target is PlayerCharacter)
			{
				if (!target.hasNipples())
				{
					areoloveCancel(target);
				}
			
				else addButton(14, "Back", areoloveCancel, target);
				output("The medipen has a number of symbol-shaped buttons on it. You can select an option to change the appearance of your areolae.");
				if(target.breastRows.length > 1) output(" Note that the selection will change the areolae of all your breast rows.");
				output("\n\nWhat do you choose?");
				
				var sFlags:String = target.areolaFlagDescript();
				output("\n\nYou currently have " + target.areolaSizeDescript());
				if(sFlags != "") output(", " + sFlags);
				output(" areolae.");
				
				var numPumped:int = 0;
				var numFlat:int = 0;
				var numRound:int = 0;
				var numHeart:int = 0;
				var numStar:int = 0;
				var numFlower:int = 0;
				for(i = 0; i < target.breastRows.length; i++)
				{
					if(target.breastRows[i].hasAreolaFlag(GLOBAL.FLAG_PUMPED)) numPumped++; 
					else numFlat++;
					if(!target.hasSymbolAreola()) numRound++;
					if(target.breastRows[i].hasAreolaFlag(GLOBAL.FLAG_HEART_SHAPED)) numHeart++;
					if(target.breastRows[i].hasAreolaFlag(GLOBAL.FLAG_STAR_SHAPED)) numStar++;
					if(target.breastRows[i].hasAreolaFlag(GLOBAL.FLAG_FLOWER_SHAPED)) numFlower++;
				}
				
				//Increase Size
				if (target.nippleWidthRatio >= 5)
				{
					addDisabledButton(buttons++, "Increase", "Increase Size" , "Your areolae are already as large as this transformative can make them.");
				}
				else
				{
					addButton(buttons++, "Increase", changeThemBoobHats, [-2, target], "Increase Size", "Increases the size of your areola.");
				}
				//Decrease Size
				if (target.nippleWidthRatio <= 0.5)
				{
					addDisabledButton(buttons++, "Decrease", "Decrease Size" , "Your areolae are already as small as this transformative can make them.");
				}
				else
				{
					addButton(buttons++, "Decrease", changeThemBoobHats, [-3, target], "Decrease Size", "Decreases the size of your areola.");
				}
				
				//Puffy
				if (numPumped >= target.breastRows.length)
				{
					addDisabledButton(buttons++,"Puffy","Puffy","Your areolae are already puffy.");
				}
				else
				{
					addButton(buttons++, "Puffy", changeThemBoobHats, [GLOBAL.FLAG_PUMPED, target], "Puffy", "Makes your areolae puffy.");
				}
				//Depuff
				if (numFlat >= target.breastRows.length)
				{
					addDisabledButton(buttons++,"Flat","Flat","Your areolae are already flat.");
				}
				else
				{
					addButton(buttons++, "Flat", changeThemBoobHats, [-1, target], "Flat", "Makes your areolae flat.");
				}
				
				buttons++;
				
				//Round
				if (numRound >= target.breastRows.length)
				{
					addDisabledButton(buttons++,"Round","Round","Your areolae are already round.");
				}
				else
				{
					addButton(buttons++, "Round", changeThemBoobHats, [0, target], "Round", "Changes the shape of your areolae to be round.");
				}
				//Heart shaped areola
				if (numHeart >= target.breastRows.length) 
				{
					addDisabledButton(buttons++,"Hearts","Hearts","Your areolae are already shaped like hearts.");
				}
				else
				{
					addButton(buttons++, "Hearts", changeThemBoobHats, [GLOBAL.FLAG_HEART_SHAPED, target], "Hearts", "Changes the shape of your areolae to hearts.");
				}
				//Star shaped areola
				if (numStar >= target.breastRows.length)
				{
					addDisabledButton(buttons++,"Stars","Stars","Your areolae are already shaped like stars.");
				}
				else
				{
					addButton(buttons++, "Stars", changeThemBoobHats, [GLOBAL.FLAG_STAR_SHAPED, target], "Stars", "Changes the shape of your areolae to stars.");
				}
				//Flower shaped areola
				if (numFlower >= target.breastRows.length)
				{
					addDisabledButton(buttons++,"Flowers","Flowers","Your areolae are already shaped like flowers.");
				}
				else
				{
					addButton(buttons++, "Flowers", changeThemBoobHats, [GLOBAL.FLAG_FLOWER_SHAPED, target], "Flowers", "Changes the shape of your areolae to flowers.");
				}
				
				return true;
			}
			
			//Not player!
			else
			{
				output(target.capitalA + target.short + " injects the Areolove to no effect.");
			}
			return false;
		}
		
		private function changeThemBoobHats(arg:Array):void
		{
			var selection:int = arg[0];			
			var target:Creature = arg[1];
			var i:int;
			var clothed:Boolean = true;
			author("Somebody Else");
			
			clearOutput();
			
			output("Making your selection, you inject yourself with the medipen.");
			
			var numLocked:int = 0;
			if(selection >= 0)
			{
				for(i = 0; i < target.breastRows.length; i++)
				{
					if(!target.areolaFlagUnlocked(i, selection)) numLocked++;
				}
			}
			
			//Nipple flags locked: no changes
			if (numLocked >= target.breastRows.length)
			{
				output(" You feel a brief tingling in your areolae, but nothing else happens. What a waste.");
				clearMenu(); 
				addButton(0, "Next", mainGameMenu);
				return;
			}
			
			//Selection independent stuff
			//Some Steeles are shy/unable to strip
			if (target.isChestGarbed() && ((kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC) && target.exhibitionism() <= 66) || kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.NUDITY_ILLEGAL))) output(" You peek down your top to get a look at the changes as they unfold.");
			else 
			{
				clothed = false;
				output(" You " + (target.isChestGarbed() ? "strip out of your gear":"look down") + " to watch the changes as they progress.");
			}
			output("\n\nA slight sensation of pins and needles buds in your areolae, then it rapidly builds to the point where you let out a small gasp at the intensity. As the feeling reaches its peak, each individual pinprick takes on a laser-like feeling of heat, there and gone almost too quickly to notice were it not for the staggering number of them. Your breath occasionally hitching in your throat, you watch as the transformation begins.");
			
			//Selection dependent stuff
			switch (selection)
			{
				//Increase size
				case -2:
					output("\n\nThe sensations focus themselves around the edges of your areolae as they slowly grow. <b>Your areolae are now larger!</b>");
					target.nippleWidthRatio += 0.5;
					if (target.nippleWidthRatio > 5) target.nippleWidthRatio = 5;
					break;
				//Decrease size
				case -3:
					output("\n\nThe sensations focus themselves around the edges of your areolae as they slowly contract. <b>Your areolae are now smaller!</b>");
					target.nippleWidthRatio -= 0.5;
					if (target.nippleWidthRatio < 0.5) target.nippleWidthRatio = 0.5;
					break;
				//Puff
				case GLOBAL.FLAG_PUMPED:
					output("\n\nThe sensations diffuse evenly throughout your areolae, increasing the amount of tissue to reach your desired shape. <b>Your areolae are now puffy!</b>");
					for(i = 0; i < target.breastRows.length; i++)
					{
						if(!target.areolaFlagUnlocked(i, GLOBAL.FLAG_PUMPED)) continue;
						target.breastRows[i].addAreolaFlag(GLOBAL.FLAG_PUMPED); 
					}
					break;
				//Unpuff
				case -1:
					output("\n\nThe sensations diffuse evenly throughout your areolae, increasing the amount of tissue to reach your desired shape.<b>Your areolae are no longer puffy.</b>");
					for(i = 0; i < target.breastRows.length; i++)
					{
						if(!target.areolaFlagUnlocked(i, 0)) continue;
						target.breastRows[i].delAreolaFlag(GLOBAL.FLAG_PUMPED); 
					}
					break;
				//Round
				case 0:
					output("\n\nThe sensations focus themselves around the edges of your areolae, reshaping the outline into a much more exciting shape. <b>Your areolae are now round!</b>");
					for(i = 0; i < target.breastRows.length; i++)
					{
						if(!target.areolaFlagUnlocked(i, 0)) continue;
						target.breastRows[i].delAreolaShapeFlags(); 
					}
					break;
				//Hearts
				case GLOBAL.FLAG_HEART_SHAPED:
					output("\n\nThe sensations focus themselves around the edges of your areolae, reshaping the outline into a much more exciting shape. <b>Your areolae are now heart-shaped!</b>");
					for(i = 0; i < target.breastRows.length; i++)
					{
						if(!target.areolaFlagUnlocked(i, GLOBAL.FLAG_HEART_SHAPED)) continue;
						target.breastRows[i].delAreolaShapeFlags();
						target.breastRows[i].addAreolaFlag(GLOBAL.FLAG_HEART_SHAPED);
					}
					break;
				//Stars
				case GLOBAL.FLAG_STAR_SHAPED:
					output("\n\nThe sensations focus themselves around the edges of your areolae, reshaping the outline into a much more exciting shape. <b>Your areolae are now star-shaped!</b>");
					for(i = 0; i < target.breastRows.length; i++)
					{
						if(!target.areolaFlagUnlocked(i, GLOBAL.FLAG_STAR_SHAPED)) continue;
						target.breastRows[i].delAreolaShapeFlags();
						target.breastRows[i].addAreolaFlag(GLOBAL.FLAG_STAR_SHAPED);
					}
					break;
				//Flowers
				case GLOBAL.FLAG_FLOWER_SHAPED:
					output("\n\nThe sensations focus themselves around the edges of your areolae, reshaping the outline into a much more exciting shape. <b>Your areolae are now flower-shaped!</b>");
					for(i = 0; i < target.breastRows.length; i++)
					{
						if(!target.areolaFlagUnlocked(i, GLOBAL.FLAG_FLOWER_SHAPED)) continue;
						target.breastRows[i].delAreolaShapeFlags();
						target.breastRows[i].addAreolaFlag(GLOBAL.FLAG_FLOWER_SHAPED);
					}
					break;
			}
			
			//Puts gear back on if it was taken off earlier
			if(target.isChestGarbed() && !clothed) output(" Shivering a bit from the lingering tingling, you put your gear back on.");
			target.changeLust(10);
			kGAMECLASS.processTime(5);
			clearMenu(); 
			addButton(0, "Next", mainGameMenu);
		}
		
		private function areoloveCancel(target:Creature):void
		{
			clearOutput();
			author("Somebody Else");
			
			if (!target.hasNipples()) output("You need nipples to use this item.\n\n");
			output("You put the Areolove back into your inventory.\n\n");
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new Areolove()]);
			else
			{
				clearMenu();
				addButton(0,"Next",kGAMECLASS.useItemFunction);
			}
		}		
	}
}
