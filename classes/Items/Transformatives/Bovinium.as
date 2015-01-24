package classes.Items.Transformatives 
{
	import classes.Creature;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	import classes.Engine.Utility.rand;
	
	import classes.Engine.Interfaces.*;
	
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Bovinium extends ItemSlotClass
	{
		
		public function Bovinium() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			this.shortName = "Bovinium";
			this.longName = "Bovinium";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a small bottle of bovinium";
			
			this.tooltip = "Created by a dissident female scientist from the garden world of New Texas, Bovinium is a designer cosmetic transformative that causes the user to gain features reminiscent of bovines, more commonly called \"cow-girls.\" The product label informs you that it is highly feminizing, even capable of complete gender transitions, and causes dramatic increases in breast size, lactation, and fertility. ";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 500;
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			output("You take the small bottle labeled \"Bovinium\" out and crack it open. A single, small, cow-shaped gummy candy drops into your palm when you up-end it. You pick the bovine-themed treat up and squint at it: it's even got little black spots on its white mass, making it look just like a dairy cow. Is that it? It's cute, at least.");

			output("\n\nWell, here goes nothing! You give yourself an experimental \"moo!\" and down the transformative candy. It's sweet, and goes down easily. Tastes almost like milk, though tinged with a strange rusty flavor. Finished with your treat, you toss the bottle aside and wait for the changes to begin...");
			
			var doneChange:Boolean = false;
			
			if (target.faceType != GLOBAL.TYPE_HUMAN || target.skinType != GLOBAL.SKIN_TYPE_SKIN)
			{
				output("\n\nThe first thing you feel after ingesting the treat is an odd calmness that falls over you. A passivity and complacency that makes you want to just sit down and... chew greens? You blink, scowling at yourself for thinking that. What the hell?");

				//if PC has non-human skin:
				if (target.skinType != GLOBAL.SKIN_TYPE_SKIN && target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
				{
					output("\n\nYour [pc.skinFurScales] start to itch powerfully. It starts as an annoyance, making you rub at an errant patch of your inhuman flesh, but the sensations spread and intensify.");
					if (target.skinType == GLOBAL.SKIN_TYPE_FUR) output(" After a few moments, you start to see patches of fur falling off as you itch yourself. More and more of your lush coating drops off with every moment, until you're left bare naked! <b>Your fur is gone!</b>");
					else if (target.skinType == GLOBAL.SKIN_TYPE_SCALES) output(" After a few moments, you start to see some of your scales flaking off. More and more drop to the ground as you scratch yourself, tearing away in big chunks until <b>you're left with surprisingly normal human skin.</b>");
					else if (target.skinType == GLOBAL.SKIN_TYPE_GOO)
					{
						output(" Your gooey body starts to feel very.. heavy and solid. Much less malleable and soft than before, for sure! You watch with awe as your body starts to reform, solidifying into almost comically mundane skin. <b>You're not gooey anymore!</b>");
						output("\n\nIt takes a while to get used to no longer having jiggly goo for a body, but before long, you're walking around with a bit more confidence. This'll take some getting used to, though.");
					}
					else
					{
						output(" After a while, your [pc.skinFurScales] begins to morph and give way to a burgeoning coating of human flesh. You watch in awe as <b>your body becomes completely covered with simple, common skin.</b>");
					}
					
					target.skinFlags = [];
					target.skinType = GLOBAL.SKIN_TYPE_SKIN;
					doneChange = true;
					
				}
				else
				{
					output("\n\n" + target.skinTypeLockedMessage());
				}

				//if PC has a non-human face:
				if (target.faceType != GLOBAL.TYPE_HUMAN && target.faceTypeUnlocked(GLOBAL.TYPE_HUMAN))
				{
				You feel your [pc.face] starting to crumple in, rattling your teeth and sending shockwaves of pressure through your head. You feel like you're in a vice! Slowly but surely, your inhuman face takes on a much more common appearance, leaving you with a cute little nose, lips, human eyes -- the works. <b>You now have a human face!</b>
				}
			}
		}
	}

}