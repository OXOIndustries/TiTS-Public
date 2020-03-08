package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.num2Ordinal;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.GameData.CodexManager;
	import classes.StringUtil;
	
	public class FizzyFix extends ItemSlotClass
	{
		public function FizzyFix()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "FizzyFix";
			longName = "FizzyFix";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a FizzyFix pill";
			tooltip = "Originally designed to remove the tongue that appears when one applies Muffstick, this up and coming JoyCo product is more often used as a source of arousal.\n\nIt looks like a round and flat gray pill with a red crossed out tongue mark stamped on it.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 15;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			// Concept: Tongue removal pill
			// Company: JoyCo
			// Location: XXX rated dispenser. Possibly Lerris or Inessa too, if deemed a thematically appropriate fit.
			
			if(target is PlayerCharacter)
			{
				if(!CodexManager.entryUnlocked("FizzyFix"))
				{
					clearOutput();
					kGAMECLASS.showName("\nFIZZYFIX");
					author("Shadefalcon");
					output("When you grasp the pill, your codex beeps, informing you of extra detail on the item’s history. If you want to learn more about FizzyFix before using it, it might be a good idea to.");
					output("\n\nAre you sure you want to continue to use the item?");
					//CodexManager.unlockEntry("Muffstick");
					CodexManager.unlockEntry("FizzyFix");
					clearMenu();
					addButton(0, "Yes", vagMenu, target);
					addButton(1, "No", rbgCancel, target);
					return true;
				}
				vagMenu(target);
				return true;
			}
			else
			{
				clearOutput();
				output(target.capitalA + target.short + " swallows the FizzyFix pill but to no effect.");
			}
			return false;
		}
		
		private function rbgCancel(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nFIZZYFIX");
			author("Shadefalcon");
			
			output("You put the pill back into your inventory.\n\n");
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new FizzyFix()]);
			else
			{
				clearMenu();
				addButton(0, "Next", kGAMECLASS.useItemFunction);
			}
		}
		
		private function vagMenu(target:Creature):void
		{
			if(!target.hasVagina())
			{
				clearOutput();
				kGAMECLASS.showName("\nFIZZYFIX");
				author("Shadefalcon");
				if(rand(2) == 0) output("If you are not mistaken, you’ll need to have a vagina before you can even think of changing it...");
				else output("If you recall correctly, you’ll need to have a vagina to be able to change it...");
				clearMenu();
				addButton(0, "Next", rbgCancel, target);
				return;
			}
			
			var i:int = 0;
			var x:int = 0;
			
			// If vaginacount=1: Proceed to transformation text
			if(target.vaginas.length == 1)
			{
				useTF([target, 0]);
				return;
			}
			
			// If vaginacount>1: Proceed to third consumption text
			clearOutput();
			kGAMECLASS.showName("CHOOSE\nVAGINA");
			author("Shadefalcon");
			clearMenu();
			
			output("You have more than one vagina. Which one will you insert with the FizzyFix?\n");
			
			for(i = 0; i < target.vaginas.length; i++)
			{
				output("\n<b>" + StringUtil.capitalize(num2Ordinal(i + 1)) + " Vagina:</b>");
				if(target.vaginas[i].vagooFlags.length > 0)
				{
					for(x = 0; x < target.vaginas[i].vagooFlags.length; x++)
					{
						output(" " + GLOBAL.FLAG_NAMES[target.vaginas[i].vagooFlags[x]] + ",");
					}
				}
				if(target.vaginas[i].vaginaColor != "") output(" " + StringUtil.toDisplayCase(target.vaginas[i].vaginaColor) + ",");
				output(" " + GLOBAL.TYPE_NAMES[target.vaginas[i].type]);
				
				addButton(i, ("Vagina " + (i + 1)), useTF, [target, i], (StringUtil.capitalize(num2Ordinal(i + 1)) + " Vagina"), ("Use this on your [pc.vagina " + i + "]."));
			}
			addButton(14, "Back", rbgCancel, target);
		}
		
		private function useTF(arg:Array):void
		{
			var target:Creature = arg[0];
			var selVag:int = arg[1];
			
			clearOutput();
			kGAMECLASS.showName("\nFIZZYFIX");
			author("Shadefalcon");
			
			// Fizzy Fix Second consumption text:
			
			// Remove tongue scene:
			// Requirements: Tongue flag
			if(target.vaginas[selVag].hasFlag(GLOBAL.FLAG_TONGUE))
			{
				output("The wondefully perverse ‘oral’ muscle that the Muffstick gifted you with has been quite a delight, but you reckon it’s time to bid it adieu.");
				output("\n\n");
				if(!target.isCrotchExposed())
				{
					output("Before you begin, however, you strip out of your [pc.lowerGarments] and look around for a bit, searching for someplace comfortable");
					if(target.exhibitionism() < 33) output(" and secluded");
					output(" to take a seat.");
				}
				else
				{
					output("Before you begin, however, you look around for a bit, searching for someplace comfortable");
					if(target.exhibitionism() < 33) output(" and secluded");
					output(" to take a seat.");
				}
				output("\n\nAfter finding a nice spot, you activate the codex’s camera-display app and set it up on the ground, giving you an ultra HD view of your [pc.vagina " + selVag + "]. Next, you follow the simple instructions given by the Muffstick’s pamphlet and insert the gray pill in your pussy.");
				output("\n\nThe FizzyFix starts melting the second it touches your ‘tongue’, quickly spreading its gray microsurgeons all over the perverse organ. In contrast to the scorching heat you felt when it was created, the process feels rather chilly, making you shiver a bit as the remainder of the licker gets covered. Afterwards, while waiting for the microsurgeons to begin their work, you wonder momentarily how they’re going to proceed this time before you register a fizzy sensation in your canal. Suddenly, your entire tongue feels like it’s been covered in cosmic candy, with tiny bubbles rapidly forming and popping throughout it. Slightly numbed by the gray coating, you’re only able to sense slight tingles along your usually extremely sensitive tongue. ");
				output("\n\nYou can see it gradually melting away and mixing with your [pc.girlCum] before being expelled out of your ecstatically convulsing vagina. The strange sight reminds you of foam being washed away by the shore. It doesn’t even take a minute before your tongue has completely vanished. You briefly miss having an extra erogenous organ in your [pc.vagina " + selVag + "], but console yourself with the knowledge that should you ever feel the need to get it back, it’s but an application of Muffstick away.");
				
				// remove tongue flag
				target.vaginas[selVag].delFlag(GLOBAL.FLAG_TONGUE);
				// + lust
				target.changeLust(25);
			}
			// Lust increase scene:
			// Requirements: No tongue flag
			else
			{
				if(!target.isCrotchExposed())
				{
					output("You ");
					if(target.exhibitionism() < 33) output(" find a secluded enough spot,");
					output(" take off your [pc.lowerGarments] and insert the Fizzy fix inside your [pc.vagina " + selVag + "].");
				}
				else
				{
					output("Nether lips already fully accessible, you ");
					if(target.exhibitionism() < 33) output(" find a secluded enough spot and");
					output(" insert the FizzyFix inside your [pc.vagina " + selVag + "].");
				}
				output("\n\nThe gray pill melts upon first contact with your [pc.girlCum] and drips into your tunnel, swiftly coating it. A short while afterwards you suddenly feel all fizzy downstairs. The sensation is just like eating cosmic candy, if the point of those was experiencing some kind of perverse and slightly masochistic pleasure. With every pop you feel a slight almost electrical tingle that instantly develops into a short wave of pleasure.");
				output("\n\nThe sensations of tiny explosions of ecstasy rapidly releasing inside of you soon start to accumulate into larger waves of euphoria, spreading throughout your entire body all the way up to your head, filling it with cravings for more. Never have you thought that fizzing candy could sound so sexy, so delightful, as you let yourself be engulfed by the combined efforts of the increasingly active microsurgeons.");
				output("\n\nAs the bubbling intensifies, fierce pleasure spreads throughout your body, making you feel flushed and incredibly sensitive. You lose strength in your [pc.legs] and fall flat on your [pc.butt], a whorish moan escaping your lips as you feel a particularly loud crack");
				if(target.vaginas[selVag].clits == 1) output(" near your [pc.clit]");
				else output(" near one of your [pc.clits]");
				output(". Spurred on by this, like a glass being filled to its uttermost limit, you’re so close to overflowing with blissful delight.");
				output("\n\nYou’re but a moment from reaching your climax, before all too suddenly, the fizzing sound stops and the sensations that came with it die down. You’re left incredibly horny, almost desperate for release.");
				
				// +++ Lust
				target.changeLust(target.lustMax());
			}
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
	}
}

