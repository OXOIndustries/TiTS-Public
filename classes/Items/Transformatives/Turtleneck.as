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
	
	public class Turtleneck extends ItemSlotClass
	{
		
		public function Turtleneck()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "T.Neck";
			longName = "jar of Turtleneck cream";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a jar of cream called ‘Turtleneck’";
			tooltip = "The label of this Blue Crab product depicts a handsome spy wearing a black turtleneck and spy goggles, with “Turtleneck” written on his sleeve. Inside there is a glittery blue cream filled with microsurgeons, outdated but still endorsed by several health agencies, that when applied to a penis can grow a sheath, a foreskin or result in negligible increases in its length or thickness.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 3000;
			
			version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			kGAMECLASS.showName("TURTLENECK");
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
				
				kGAMECLASS.output("You have more than one penis. Which one will you apply Turtleneck to?\n");
				
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
				kGAMECLASS.output(target.capitalA + target.short + " applies the Turtleneck cream but to no effect.");
			}
			return false;
		}
		
		private function cockTF(arg:Array):void
		{
			clearOutput();
			kGAMECLASS.showName("TURTLENECK");
			author("Lashcharge");
			
			var target:Creature = arg[0];
			var i:int = arg[1];
			var hasUnderwear:Boolean = (target.hasLowerGarment() && !target.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !target.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN));
			
			output("You read the instructions and open the spy-themed jar");
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
			output(". You scoop a large dollop of the blue glittery cream and carefully smear every inch of your [pc.cockNoun " + i + "] in it");
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
			output(". As you wait for the transformation, the blue cream dries up and the aphrodisiacs kick in as your [pc.cock " + i + "] stiffens into a bulging erection, covered in gray glitter.");
			
			output("\n\n");
			if(!target.cocks[i].hasFlag(GLOBAL.FLAG_FORESKINNED) && rand(2) == 0) foreskinTF([target, i]);
			else if(!target.cocks[i].hasFlag(GLOBAL.FLAG_SHEATHED)) sheathTF([target, i]);
			else if(target.cocks[i].cLengthRaw < 20 && rand(2) == 0) cockLengthTF([target, i]);
			else if(target.cocks[i].cThicknessRatioRaw < 2) cockThickTF([target, i]);
			else dudTF([target, i]);
		}
		
		private function dudTF(arg:Array):void
		{
			var target:Creature = arg[0];
			var i:int = arg[1];
			
			output("Aside from a few short tingles along your [pc.cockNoun " + i + "], nothing really happens... what a waste.");
			target.changeLust(4);
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		
		private function foreskinTF(arg:Array):void
		{
			var target:Creature = arg[0];
			var i:int = arg[1];

			//Target penis gains a foreskin flag if lacks one. 
			output("The gray microsurgeons begin to move, positing themselves in circular lines that run around your shaft, starting and ending at where a frenulum should be. You can barely feel these tiny machines crawling all over your [pc.skinColor] skin as it begins to bulge out, their pinching reworking it into a more desirable form. These circular lines begin to pull at the skin, stretching it with them as they climb all together towards the frenulum, leaving behind a ringed bump that will soon become your foreskin. Once that’s done, the machines race back to their original spots, making more circular lines across your length and pull at the skin yet again. Their ascent curls that small bump of loose skin around your shaft into a thin sleeve, all of it firmly attached to a frenulum that goes all the way up to your [pc.cockHead " + i + "].");
			output("\n\nAfter another itchy minute, they finish their work leaving you to admire the slackened foreskin that folds around your [pc.cockHead " + i + "]. The gray glitter gathers on the tip of the loose flesh and massages it into an elastic ridged band that’s delightfully tight. You can see the machines slither inside and work on your cock-head, their prickles becoming increasingly more painful, or rather it looks like you are becoming much more sensitive than before.");
			output("\n\nEventually, the prickling stops and you can’t feel anything else going on with your cock, so you assume the transformation must’ve run its course. You begin to rub your length and explore the gliding action that your new foreskin offers. When you pull it all the way down you rediscover your [pc.cockHead " + i + "], now in a more vibrant and glistening [pc.cockColor], as the machines flake off from it. You admire how the foreskin bunches up over your tip every time you pull it all the way up and shove two fingers within, swirling them around your cockhead as pre-cum gurgles from your cum-slit. The tight band can be stretched pretty wide, sending enjoyable shivers of pleasure running across your spine as you test it with your fingers. You pull your pre-cum slicked fingers from within and the band quickly snaps back into place.");
			output("\n\nPulling the skin all the way down you find yourself overwhelmed by the tight and sensitive band massaging your shaft. Using the skin as the cock sleeve it is, you polish your spear, slowly building yourself into an intense orgasm. You fall to your knees from pleasure and use one hand for support while the other feverishly beats your [pc.cock " + i + "]. Soon you feel your seed rising through your cumvein, so you pull the foreskin over your [pc.cockHead " + i + "] and pinch it closed. It quickly fills with your [pc.cum], ballooning it as you bask in your afterglow. You let it go and the skin rolls back, dripping its [pc.cumFlavor] contents on the floor. <b>Your [pc.cock " + i + "] now has a foreskin!</b>");
		
			target.cocks[i].addFlag(GLOBAL.FLAG_FORESKINNED);
			target.orgasm();

			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		
		private function sheathTF(arg:Array):void
		{
			var target:Creature = arg[0];
			var i:int = arg[1];

			//Target penis gains a sheath flag if lacks one. 
			output("You can see the gray microsurgeons crawling all over your shaft and into the base of your [pc.cock " + i + "], so tightly packed against each other they look like a single silver line of body paint. At first you don’t see anything happening down there, but eventually, the flesh underneath the machines begins to bloat, stretching your [pc.skinColor] skin and growing into what looks like a silver cock ring. The bulging flesh visibly throbs as the little machines do their job, pinching and pulling at the skin, stretching it longer and then curling it for extra protection. After a while they concentrate on the slit, shaping it into a tight form, to make sure it’s kept closed unless you grow aroused.");
			output("\n\nSlowly, the little gray machines begin to pour out of your [pc.skinColor] sheath, as your cock quickly recedes into its new reservoir. As your prick completely retreats within the sheath, it washes away the rest of the glitter with your pre-cum. When it seems like the transformation has run its course, you stick a finger in there, swirling it around and exploring your unfamiliar depths. ");
			switch(target.skinType)
			{
				case GLOBAL.SKIN_TYPE_FUR: output("You realize it’s not done yet when painful trickles surge on the outside, quickly sprouting into tiny hairs. It doesn’t take long for those hairs to grow into a mat of [pc.skinFurScalesColor] that completely covers your sheath."); break;
				case GLOBAL.SKIN_TYPE_FEATHERS: output("You realize it’s not done yet when painful trickles surge on the outside, quickly sprouting into feathers that turn your sheath into a pillow of [pc.skinFurScalesColor]."); break;
				case GLOBAL.SKIN_TYPE_SCALES: output("It completely surprises you when [pc.skinFurScalesColor] scales begin to sprout on your sheath until the flesh is completely covered in smooth scales."); break;
				case GLOBAL.SKIN_TYPE_CHITIN: output("It completely surprises you when the skin begins to harden and turn [pc.skinFurScalesColor]. Soon your sheath is completely covered in a chitinous guard."); break;
				case GLOBAL.SKIN_TYPE_BARK: output("It completely surprises you when the skin begins to harden and turn [pc.skinFurScalesColor], gaining odd ridges on the surface. Soon your sheath is completely covered in hard bark."); break;
				case GLOBAL.SKIN_TYPE_GOO: output("A few more twists here and there with your hands and you finish your [pc.skinFurScalesColor] jello sheath, one that completely fails to hide your dick."); break;
				case GLOBAL.SKIN_TYPE_LATEX: output("The glistening latex sheath you’re left with stretches pretty wide and quickly snaps back into place when you release it."); break;
				case GLOBAL.SKIN_TYPE_PLANT: output("Your new sheath is smooth and completely devoid of hair."); break;
				default: output("Your new sheath is smooth and trying to hide behind your pubes."); break;
			}
			output(" <b>Your [pc.cock " + i + "] now has a [pc.skinFurScales]-covered sheath!</b>");
			
			target.cocks[i].addFlag(GLOBAL.FLAG_SHEATHED);
			target.changeLust(30);
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		
		private function cockLengthTF(arg:Array):void
		{
			var target:Creature = arg[0];
			var i:int = arg[1];

			//Target penis gains 0.1 of length.
			output("You can see the gray microsurgeons forming circular lines around your cock, only to stop and fall off. For some reason they are unable to complete their program and do any of the more advanced transformations. Still, you feel <i>something</i> happening on your dick, like a strangely pleasurable itch, that soon wanes. It doesn’t take long to realize <b>that your [pc.cock " + i + "] has grown a little bit longer.</b>");
			
			target.cocks[i].cLengthRaw += 0.1;
			if(target.hasPerk("Hung")) target.cocks[i].cLengthRaw += 0.1;
			target.changeLust(15);
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		
		private function cockThickTF(arg:Array):void
		{
			var target:Creature = arg[0];
			var i:int = arg[1];

			//Target penis gains 0.1 of thickness ratio.
			output("As soon as the gray machines start moving, they begin to fall off your prick. Seems like you won’t be getting any extra skin this time. You grab your boner and play with it a bit until you notice <b>your [pc.cock " + i + "] has grown a little thicker within your grasp.</b>"); 
			
			target.cocks[i].cThicknessRatioRaw += 0.1;
			target.changeLust(15);
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
	}
}
