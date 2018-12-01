package classes.Items.Transformatives
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.StringUtil;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Utility.rand;
	import classes.Util.RandomInCollection;

	public class XhelarfogPlus extends ItemSlotClass
	{
		public function XhelarfogPlus()
		{
			_latestVersion = 1;
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "X.fog+";
			longName = "Xhelarfog Plus Pill";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a SteeleTech branded snack-bar";
			tooltip = "Similar to the more popular Terran Treats, this transformative takes the form of a snack-bar, its wrapper bearing the SteeleTech logo, and the usual amount of technobabble explaining its microsurgeons. Unlike the other item though, this is designed to give the consumer more Xhelarfog-aligned features. It’s even marked with a seal of approval from the government of Anon-Xusya B!\n\n...Wait, is that <i>actual</i> gold leaf?";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 1000;
			
			addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			if (!(target is PlayerCharacter))
			{
				output("<b>You're not supposed to be able to see this. Please report.</b>");
				return false;
			}
			author("GothPastel");

			//PC has witnessed the skin type change scene before, and is in a hostile area
			if (kGAMECLASS.flags["MET_XHELPLUS_ELIJAH"] != undefined && 9999)
			{
				output("You look at the bar in your hand, considering chowing down, but you quickly recall… That previous experience. You don’t want to risk getting carted off by some opportunistic native, and so you pop it back into your pocket. Maybe later.");
				return false;
			}
			else
			{
				output("You unwrap the bar, shrugging as you take a bite, soon finishing the whole thing. It hits your stomach quickly, causing a distinct but not altogether unpleasant tingling that soon spreads, until all of your [pc.skin] prickles.");
				output("\n\nAs the prickling fades, you feel a change coming on.");
				if (!kGAMECLASS.infiniteItems()) kGAMECLASS.pc.destroyItemByClass(XhelarfogPlus);
			}
			
			var effects:Array;
			//50% chance to continue after one effect, 40% after two, for a 50/30/20 distribution :)
			for (var effectCount:int = 0; effectCount == 0 || (effectCount < 3 && rand(10) - effectCount > 3); ++effectCount)
			{
				effects = new Array();
				
				if (target.eyeColor.indexOf("gold") < 0 && target.eyeColorUnlocked("gold")) effects.push(eyeColorChange);
				if (target.eyeType != GLOBAL.TYPE_XHELARFOG && target.eyeTypeUnlocked(GLOBAL.TYPE_XHELARFOG)) effects.push(eyeTypeChange);
				
				if (effects.length > 0) RandomInCollection(effects)(target);
				else
				{
					if (effectCount == 0) output("\n\nOr maybe not. You can’t see or feel any changes, no matter how long you wait. Great - a waste of your credits.");
					return false;
				}
			}
			
			return false;
		}
		
		private function eyeColorChange(target:Creature):void
		{
			output("\n\nThere’s a sudden twinge in your eyes that you have to blink several times to clear. Strange.");
			output("\n\nYou bring up your codex, using the camera to look at yourself - ah, of course. <b>You now have metallic, golden irises!</b>");

			target.eyeColor = "gold";
		}
		
		private function eyeTypeChange(target:Creature):void
		{
			if (target.eyeCount > 3)
			{
				output("\n\nYour eyes feel uncomfortable all of a sudden, a strange, squeezing feeling, and before long you find yourself forced to close your eyes.");
				output("\n\nBy the time you’ve forced them open again, you realise that you feel distinctly… less than before. In fact, <b>you’ve only got three eyes!</b>");
				output("\n\nThe third is situated right in the centre of your forehead, and about the same size as the others, so it’s not <i>quite</i> typical Xhelarfog configuration, but you’re one step closer.");
				output("\n\nThere is now no distinguishable difference between your sclera and iris, both flooded with [pc.eyeColor]. Even your pupils have changed, appearing to be a slightly paler shade of the same color.");
			}
			else if (target.eyeCount < 3)
			{
				output("\n\nYou’d describe the feeling you suddenly start to experience as a migraine, but it’s far too centralized to be one.");
				output("\n\nYou do have to sit down though, pushing your hands against your head in the hopes th-\n\nOw!");
				output("\n\nYour hands jolt away from your face as your third eye blinks rapidly in distress at the unintentional poke. \n\nWait. \n\nThird eye?");
				output("\n\nYou pull out your codex to check, and lo and behold - a third eye! Its situated right in the center of your forehead, and about the same size as the others, so it’s not <i>quite</i> typical Xhelarfog configuration, but you and your <b>new set of three eyes</b> are one step closer.");
				output("\n\nThere is now no distinguishable difference between your sclera and iris, both flooded with [pc.eyeColor]. Even your pupils have changed, appearing to be a slightly paler shade of the same color.");
			}
			else
			{
				output("There’s a sudden, sharp pain in your eyes, forcing you to double over, pressing your palms against them until the sensation fades.");
				output("\n\nVoid, that had better not have been for nothing!");
				output("\n\nA quick check in the nearest mirror confirms that you have, in fact, undergone a change - there is now no distinguishable difference between your sclera and iris, both flooded with [pc.eyeColor]. Even your pupils have changed, appearing to be a slightly paler shade of the same color.");
			}
			
			output("\n\nIt’s quite fetching actually");
			if (kGAMECLASS.flags["YOMA_MET"] != undefined && target.eyeColor == "lime green") output(" - you even almost match a certain android you know");
			output(".");
			output("\n\n<b>You now have Xhelarfog eyes.</b>");

			target.eyeType = GLOBAL.TYPE_XHELARFOG;
		}
	}
}