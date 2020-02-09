//[UPON CONSUMPTION]
//Instantly fills up cum up to 75% of capacity.
//If already above 75% or pc doesn't have (internal) balls, nothing happens

package classes.Items.Transformatives {
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	
	public class SaltyJawBreaker extends ItemSlotClass {
		//constructor
		public function SaltyJawBreaker() {
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "JawBreakr";
			longName = "Salty Jaw-Breaker";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a salty Jaw-Breaker";
			
			tooltip = "This obnoxiously large jaw-breaker contains a hard mixture of sugar, hormones, and microsurgeons that will refill the consumer’s masculine reproductive organs nigh-instantly.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 150;
			
			version = _latestVersion;
		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean {
			clearOutput();
			author("Lashcharge");
			
			if (target is PlayerCharacter) {
				output("You unwrap the candy from its package and carefully pop it in your mouth, bracing for the harsh flavor. To your surprise, it’s much more sweet than you imagined! The salty name must refer to its effects, not the flavor");
				//where there is a cock, there is cum - jaw breaker is only effective on peeps with (internal) balls
				if (!target.hasCock() && target.balls == 0) output(" - but whatever it ought to do, you only feel a slight itching around your crotch. <b>Seems you don’t package the sort of goods affected by this treat.</b>");
				else output(".");
				if (!target.hasCock() && target.balls == 0) output(" Still, you")
				else output(" You"); 
				output(" suck on it for several minutes, savoring the flavor while it slowly melts into a small bit. When it’s dissolved into a manageable size, you promptly swallow it, and it quickly settles in your stomach.");
				
				target.changeEnergy(5);
				
				//if player has external balls
				if(target.balls > 0) {
					output("\n\nYour [pc.balls] begin");
					if (target.balls == 1) output("s");
					output(" to itch, and you reach down to scratch");
					if (target.balls == 1) output(" it");
					else output(" them");
					output(".");
					
					output(" As you grab");
					if (target.balls == 1) output(" it");
					else output(" them");
					output(",");
					
					//if below 75% print text about filling up balls
					if(target.ballFullness < 75) {
						if (target.balls == 1) output(" it begins");
						else output(" they begin");
						output(" to expand in your grip, your [pc.sack] hanging lower with its new-found weight. Your ball");
						if(target.balls > 1) output("s are");
						else output(" is");
						output(" brimming with [pc.cum], which you’ll happily unload into the next hole you can find.");
					//if above 75% print text about already full balls
					} else {
						output(" you can feel your potent [pc.cumNoun] churn beneath your fingertips. Nothing besides that happens. <b>These candies would definitely be more useful to someone who isn’t so full of [pc.cumNoun] already!</b>");
					}
				//if player has internal balls
				} else if(target.balls == 0 && target.hasCock()) {
					output("\n\nSuddenly you feel warmth spread through your lower body as your prostate begins to churn with potent [pc.cumNoun]");
					
					//if below 75% print text about filling up balls
					if(target.ballFullness < 75) {
						output(", and you start to feel a bit fuller from your prostate ballooning with a whole new load of [pc.cum] to dump in the next hole you can find.");
					//if above 75% print text about already full balls
					} else {
						output(", but besides that, nothing else happens. <b>These candies would definitely be more useful to someone who isn’t so full of [pc.cumNoun] already!</b>");
					}
				}
				//fill up balls to 75% if below that amount.
				if ((target.hasCock() || target.balls >= 1) && target.ballFullness < 75) target.ballFullness = 75;
			//not the player	
			} else {
				kGAMECLASS.output(target.capitalA + target.short + " uses the candy to no effect.");
			}
			return false;
		}
	}
}