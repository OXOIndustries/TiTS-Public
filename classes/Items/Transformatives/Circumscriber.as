package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.formatFloat;
	import classes.Engine.Utility.num2Ordinal;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	
	public class Circumscriber extends ItemSlotClass
	{
		
		public function Circumscriber()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "Circumser";
			longName = "jar of Circumscriber cream";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a jar of cream called ‘Circumscriber’";
			tooltip = "The label of this Blue Crab product is an ancient, sepia style drawing of a scribe, penning the word “Circumscriber” on a scroll. Inside there is a glittery orange cream filled with microsurgeons, outdated but still endorsed by several health agencies, that when applied to a penis can erase a sheath, a foreskin or result in negligible decreases in its length or thickness.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 3000;
			
			version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			kGAMECLASS.showName("CIRCUMSCRIBER");
			author("Lashcharge");
			
			if(target is PlayerCharacter)
			{
				if(!target.hasCock())
				{
					if(!kGAMECLASS.infiniteItems()) quantity++;
					kGAMECLASS.output("Unfortunately, you do not have any penises to apply this on.");
					kGAMECLASS.output("\n\nYou put the item back in your inventory.");
					return false;
				}
				
				var i:int = -1;
				var x:int = 0;
				var btnSlot:int = 0;
				
				if(target.cocks.length == 1)
				{
					cockTF([target, 0]);
					return true;
				}
				
				kGAMECLASS.output("You have more than one penis. Which one will you apply Circumscriber to?\n");
				
				kGAMECLASS.clearMenu();
				for(i = 0; i < target.cocks.length; i++)
				{
					output("\n<b>" + StringUtil.capitalize(num2Ordinal(i + 1)) + " Cock:</b>");
					if(target.cocks[i].cockFlags.length > 0)
					{
						for(x = 0; x < target.cocks[i].cockFlags.length; x++)
						{
							output(" " + GLOBAL.FLAG_NAMES[target.cocks[i].cockFlags[x]] + ",");
						}
					}
					if(target.cocks[i].cockColor != "") output(" " + StringUtil.toDisplayCase(target.cocks[i].cockColor) + ",");
					output(" " + GLOBAL.TYPE_NAMES[target.cocks[i].cType]);
					if(target.cocks[i].cLength() > 0) output(", " + formatFloat(target.cocks[i].cLength(), 3) + " in long");
					if(target.cocks[i].thickness() > 0) output(", " + formatFloat(target.cocks[i].thickness(), 3) + " in thick");
					
					addButton(btnSlot, "Cock " + (i + 1), cockTF, [target, i], StringUtil.capitalize(num2Ordinal(i + 1)) + " Cock", "Use this on your [pc.cock " + i + "].");
					btnSlot++;
				}
				return true;
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " applies the Circumscriber cream but to no effect.");
			}
			return false;
		}
		
		private function cockTF(arg:Array):void
		{
			clearOutput();
			kGAMECLASS.showName("CIRCUMSCRIBER");
			author("Lashcharge");
			
			var target:Creature = arg[0];
			var i:int = arg[1];
			var hasUnderwear:Boolean = (target.hasLowerGarment() && !target.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !target.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN));
			
			output("You read the instructions and open the scribe-themed jar");
			if(!target.isCrotchExposed())
			{
				output(", followed by");
				if(target.hasArmor()) output(" removing your [pc.armor]");
				if(hasUnderwear)
				{
					if(target.hasArmor()) output(" and");
					output(" dropping your [pc.lowerUndergarment] to the floor");
				}
			}
			output(". You scoop a large dollop of the orange glittery cream and carefully smear every inch of your [pc.cockNoun " + i + "] in it");
			if (target.cocks[i].hasFlag(GLOBAL.FLAG_KNOTTED) || target.cocks[i].hasFlag(GLOBAL.FLAG_SHEATHED))
			{
				output(", especially");
				if(target.cocks[i].hasFlag(GLOBAL.FLAG_KNOTTED)) output(" behind the [pc.knot " + i + "]");
				if(target.cocks[i].hasFlag(GLOBAL.FLAG_KNOTTED) && target.cocks[i].hasFlag(GLOBAL.FLAG_SHEATHED)) output(" and");
				if(target.cocks[i].hasFlag(GLOBAL.FLAG_SHEATHED)) output(" within the [pc.sheath " + i + "]");
				if(target.totalGenitals() > 1) output(" while trying to avoid your other genital");
				if(target.totalGenitals() > 2) output("s");
			}
			output(". You apply the rest around and on your [pc.cockHead " + i + "]");
			if(target.cocks[i].hasFlag(GLOBAL.FLAG_FORESKINNED)) output(", pulling down your foreskin, coating its insides and releasing it, letting it spread the cream more thoroughly by itself");
			output(". As you wait for the transformation, the orange cream dries up and the aphrodisiacs kick in as your [pc.cock " + i + "] stiffens into a bulging erection, covered in gray glitter.");
			
			output("\n\n");
			if(target.cocks[i].hasFlag(GLOBAL.FLAG_FORESKINNED) && rand(2) == 0) foreskinTF([target, i]);
			else if(target.cocks[i].hasFlag(GLOBAL.FLAG_SHEATHED)) sheathTF([target, i]);
			else if(target.cocks[i].cLengthRaw > 5 && rand(2) == 0) cockLengthTF([target, i]);
			else if(target.cocks[i].cThicknessRatioRaw > 0.8) cockThickTF([target, i]);
			else dudTF([target, i]);
		}
		
		private function dudTF(arg:Array):void
		{
			var target:Creature = arg[0];
			var i:int = arg[1];
			
			output("Aside from a few short tingles along your [pc.cockNoun " + i + "], nothing really happens... what a waste.");
			target.changeLust(100);
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		
		private function foreskinTF(arg:Array):void
		{
			var target:Creature = arg[0];
			var i:int = arg[1];

			//Target penis loses a foreskin flag if it has one. 
			output("You feel pinching on your foreskin as the goo seems to crawl all over your shaft, gathering around the ridged band, touching and triggering every sensitive nerve on one of your most innervated parts. Its delicate work stretches the elastic band apart, leaving a slackened sleeve of skin hanging around your [pc.cockHead " + i + "]. Some of the cream crawls inside your prepuce while the rest spreads around your shaft. It positions itself in the form of rings around your [pc.skinColor] shaft, more abundant where your foreskin is loose and less frequent the closer they are to its base and frantically moving up and down across it. They never break formation and only turn back when they reach another ring, turning the skin tighter as it starts to disappear into your shaft.");
			output("\n\nThankfully you seem to become less sensitive with time, the itchiness disappearing together with your extranous nerves. The foreskin turns into a bump as they get closer to finishing their job, some of the rings already gathering at what remains of your frenulum and erasing the last bits of the elastic tissue. Soon there is nothing left but a straight line that runs across your cumvein to the urethra.");
			output("\n\nYou are left with a ");
			{
				if (InCollection(target.cocks[i].cType, [GLOBAL.TYPE_BEE, GLOBAL.TYPE_VANAE, GLOBAL.TYPE_ANEMONE, GLOBAL.TYPE_SIREN, GLOBAL.TYPE_TENTACLE, GLOBAL.TYPE_HUMAN]) || !target.cocks[i].cockColor == "mottled pink and black") output("two-toned dick, the vibrant [pc.cockColor " + i + "] head accentuated by your [pc.skinColor]-colored shaft");
				else output("[pc.cockColor " + i + "] dick, completely uniform in color");
			}
			output(". But it seems like the work of the little machines is not over, as they spread around your cock-head and give it a thorough rubbing. It seems like your new-found insensitivity is helping, as you barely feel them transforming your [pc.cockHead " + i + "] to be a little bit more rugged than it used to be."); 
			output("\n\nAs the machines flake off and disappear into the ground below, you sigh in relief, realizing you can now rub one out. You wrap your hands around your [pc.cock " + i + "] and try to masturbate, discovering the wonder of having a smooth, unblemished prick to play with, not having any extra skin to bunch up or require extra cleaning.");

			output(" With gentle, gliding strokes, you caress your shaft, trying to get as much sensation out of it as you can possibly get. ");
			if(target.cocks[i].hasFlag(GLOBAL.FLAG_LUBRICATED)) output("Your slick, lubricated dick is really helping with bringing yourself to the edge");
			if(target.cocks[i].hasFlag(GLOBAL.FLAG_STICKY)) output("Your sticky, oil-covered dick, is definitely not helping with this, forcing you to be even rougher than you thought you could tolerate");
			else output("Delightedly, you start to ooze with pre-cum, the extra lubrication really helping with bringing yourself to the edge");
			output(". It takes a while to reach your orgasm and, with little notice, it explodes in your mind, sending waves of lust throughout your body. Your ejaculate shoots unimpeded straight into the floor before tapering off into oozing [pc.cum] from your unsullied dick. <b>Your [pc.cock " + i + "] has lost its foreskin!</b>");
		
			target.cocks[i].delFlag(GLOBAL.FLAG_FORESKINNED);
			target.orgasm();

			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		
		private function sheathTF(arg:Array):void
		{
			var target:Creature = arg[0];
			var i:int = arg[1];

			//Target penis loses a sheath flag if has one. 
			output("You feel itchy as the cream crawls all over your [pc.sheath " + i + "] and into it from all across your [pc.cock " + i + "], giving it a gray metallic tint");
			{
				if (target.skinType == GLOBAL.SKIN_TYPE_FUR) output(". One by one the hairs on your sheath fall off");
				else if (target.skinType == GLOBAL.SKIN_TYPE_FEATHERS) output(". One by one the feathers on your sheath fall off");
				else if (target.skinType == GLOBAL.SKIN_TYPE_SCALES) output(". One by one the scales on your sheath fall off");
				else if (target.skinType == GLOBAL.SKIN_TYPE_CHITIN) output(". You hear the chitinous covering of your sheath cracking off and turning into dust as it falls on the ground");
				else if (target.skinType == GLOBAL.SKIN_TYPE_BARK) output(". You hear the arboreal covering of your sheath cracking off and turning into dust as it falls on the ground");
				else if (target.skinType == GLOBAL.SKIN_TYPE_GOO) output(". Your amorphous sheath feels weird as it loses its translucence");
			}
			output(". Slowly, you can see your sheath recede into the skin of your crotch until it evens out, and all that remains is the outline of the slit tight around the base of your cock. Then the machines loosen that ring, uncurling it until it completely disappears into your body.");
			output("\n\nWith their job done the spent machine-goo falls off you and fades into dust, blowing away in the air. Your cock is left ");
			{
				if(target.cocks[i].hasFlag(GLOBAL.FLAG_FORESKINNED)) output("with a comforting foreskin around it. With no distinct line dividing the [pc.skinColor] of your cock from the skin of your crotch");
				else output("bare of any loose skin, with your [pc.cockHead " + i + "] fully exposed");
			}
			output(". There must have been a weird anaphrodisiac somewhere in there because you’re rapidly losing your erection, but unlike before it now hangs completely flaccid against your [pc.sack]. <b>Your [pc.cock " + i + "] has lost its sheath!</b>");
			
			target.cocks[i].delFlag(GLOBAL.FLAG_SHEATHED);
			target.changeLust(-10);
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		
		private function cockLengthTF(arg:Array):void
		{
			var target:Creature = arg[0];
			var i:int = arg[1];

			//Target penis gains 0.1 of length.
			output("The gray ooze is unable to complete its programming and promptly falls off your prick, yet you still feel <i>something</i> going on down there. The tell-tale sensation of nanomachines in action and your aphrodisiac-powered boner helps you figure out what’s happening. To your chagrin, it seems <b>that your [pc.cock " + i + "] has lost a bit of its length.</b>");
			
			target.cocks[i].cLengthRaw -= 0.1;
			if(target.hasPerk("Mini")) target.cocks[i].cLengthRaw -= 0.1;
			target.changeLust(15);
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		
		private function cockThickTF(arg:Array):void
		{
			var target:Creature = arg[0];
			var i:int = arg[1];

			//Target penis gains 0.1 of thickness ratio.
			output("The goo slithers around your [pc.cock " + i + "], falling off it drop by drop as its programming fails. Not wanting to let a good boner go to waste, you decide to play with yourself for a bit. You only stop when you notice <b>that your [pc.cock " + i + "] has become a little thinner within your grasp.</b>"); 
			
			target.cocks[i].cThicknessRatioRaw -= 0.1;
			target.changeLust(15);
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
	}
}
