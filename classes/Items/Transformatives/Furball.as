package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Furball extends ItemSlotClass
	{
		public function Furball()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "Furball";
			longName = "Furball candy";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a packet of Furball candy";
			tooltip = "A small packet of what appears to be candy called “Furball.” The pink lettering is large and stylized with fuzzy edges. The nutrition facts on the back promise you the softest, fluffiest, plushest, most squeezable balls ever.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 250;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			// Furball: Your Go-To Candy for Soft, Fluffy Balls!
			// This candy is exactly what it says on the tin. One pop and voila! You have soft, oh so squeezable jewels!
			// **Sold by Jade on Tavros Station. This candy is meant to give you balls that are still fluffy, even when the rest of you body is not. If the PC already has fluffy balls, likely due to being furry, there are still some other effects that can occur. Price to be determined by Fenoxo.
			
			clearOutput();
			kGAMECLASS.showName("\nFURBALL");
			author("Anonymous Drake");
			
			if(target is PlayerCharacter)
			{
				// Consumption:
				output("You open the package and find a soft, fluffy morsel inside. It appears to be two balls of pink cotton candy fused together. Come to think of it, they really resemble a pair of testicles. Oh well, down the hatch! You pop the candy in your mouth, and you find it to taste a lot like cotton candy with a tiny hint of strawberry. It’s delicious! You can’t help but feel disappointed when it dissolves.");
				
				// Effects
				
				var isFuzzy:Boolean = (target.hasFur() || target.hasFeathers() || target.statusEffectv1("Special Scrotum") == GLOBAL.FLAG_FURRED);
				
				// If PC has balls, small chance of gaining quad balls (rare effect):
				// NOTE: You have a higher chance of getting this rare effect when eating multiple candies in rapid succession.
				if(target.balls >= 2 && target.balls < 4 && target.statusEffectv1("Fuzzball Candy") > (1 + rand(20)))
				{
					output("\n\nThere is an unexpected pressure growing under your [pc.balls]. After removing your [pc.gear] to inspect the damages, you are amazed by what you see. <b>It would seem that you’ve grown a" + (target.balls == 2 ? " second pair of balls" : "nother testicle") + "!</b>");
					
					// ++ lust!
					target.balls = 4;
					target.changeLust(30);
				}
				// If PC has uniball, balls become normal:
				else if(target.hasStatusEffect("Uniball") && rand(2) == 0)
				{
					output("\n\nThere is a strange pressure welling up in your tight sack. Once the sensation passes, you remove your [pc.gear] to see just what happened to it. <b>Amazing! It would seem that your previously tight package has loosened up, giving you a normal pair of balls!</b>");
					
					// ++ lust!
					target.removeStatusEffect("Uniball");
					target.changeLust(15);
				}
				// If PC has balls and no fur, balls become fluffy:
				else if(target.balls >= 2 && !isFuzzy && rand(2) == 0)
				{
					var matchHair:Boolean = (!target.hasPartFur() && !target.hasPartFeathers() && target.hasHair());
					if(!target.hasStatusEffect("Special Scrotum")) target.createStatusEffect("Special Scrotum", GLOBAL.FLAG_FURRED, 0, 0, 0, true, "", "", false, 0);
					else target.setStatusValue("Special Scrotum", 1, GLOBAL.FLAG_FURRED);
					
					output("\n\nNot long after the candy hits your stomach, a prickly, itching sensation plagues your balls. Resisting the urge to scratch is impossible! As quickly as the itchiness starts, though, it stops. Now you’re able to comfortably inspect your jewels. <b>Just as the package promised, you’re left with unbelievably soft, fluffy balls");
					if(matchHair)
					{
						output(" the same color as your [pc.hairColor] [pc.hairNoun]");
						target.setStatusTooltip("Special Scrotum", target.hairColor);
					}
					output("!</b>");
					
					// ++ lust!
					target.changeLust(30);
				}
				// If PC has balls, balls have a chance of getting bigger:
				else if(target.balls > 0 && target.ballSizeRaw < 20 && rand(2) == 0)
				{
					var newBallSize:Number = target.ballSizeRaw + 2;
					if(target.hasPerk("Bulgy")) newBallSize += 2;
					
					if(target.ballSizeUnlocked(newBallSize))
					{
						output("\n\nThere is a brief swelling sensation in your [pc.balls]. A quick inspection of your family jewel" + (target.balls == 0 ? "" : "s") + " confirms your suspicions. " + (target.balls == 0 ? "It is" : "They are") + " definitely bigger!");
						
						target.ballSizeRaw = newBallSize;
						// ++ lust!
						target.changeLust(15);
					}
					else output("\n\n" + target.ballSizeLockedMessage());
				}
				// If PC has at least one penis and no balls, grow a pair of balls:
				else if(target.balls <= 0 && target.hasCock() && rand(2) == 0)
				{
					if(target.ballsUnlocked(2))
					{
						output("\n\nIt isn’t long before you begin to notice a change in your body. A pressure builds just below your [pc.cocksLight]. The sensation isn’t painful, but it is strange to say the least. Your remove your [pc.gear] to see two distinct lumps forming in the offending area. <b>Once the growths reach their full size, it becomes clear to you that you are now the proud owner of a pair of balls!</b>");
						if(!isFuzzy) output(" They aren’t furry as the candy advertised, though. Maybe if you ate more...?");
						
						// ++ lust!
						target.balls = 2;
						target.changeLust(30);
					}
					else output("\n\n" + target.ballsLockedMessage());
				}
				// If PC eats furball again right after no balls dud, PC grows balls anyway:
				else if(target.balls <= 0 && !target.hasCock() && target.statusEffectv1("Fuzzball Candy") >= 1)
				{
					output("\n\nDespite your stomach’s obvious resentment, you pop some more furball down the hatch. Almost instantly you discover that it isn’t just your stomach protesting. Horrible pain scythes through your crotch, almost doubling you over right then and there. Thankfully it doesn’t last very long.");
					output("\n\nImmediately you discover what exactly has happened down there. <b>It would seem that you’ve grown a pair of testitcles!</b> Without a penis, though, they’re kind of just <i>there</i>, for lack of a better word.");
					
					target.balls = 2;
					target.changeEnergy(-5);
					target.changeLust(1);
				}
				// If PC has no penis and no balls, nothing happens:
				else
				{
					output("\n\nYou wait and you wait, but nothing special seems to be happening. The only thing that becomes clear to you is that the candy doesn’t quite agree with your stomach. Oh well. At least it tasted good.");
					if(target.balls <= 0) output(" Maybe it didn’t work because you’re missing something?");
				}
				
				/*
				Appearance tab description (only if rest of body is not furry): Your [pc.balls] are covered in plush, [pc.hairColor] fuzz.
				*/
				
				if(!target.hasStatusEffect("Fuzzball Candy")) target.createStatusEffect("Fuzzball Candy", 1, 0, 0, 0, true, "", "", false, 1440);
				else target.addStatusValue("Fuzzball Candy", 1, 1);
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " eats the Furball candy, but to no effect.");
			}
			return false;
		}
	}
}

