package classes.Items.Miscellaneous
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Anusoft extends ItemSlotClass
	{
		public function Anusoft()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "Anusoft";
			longName = "Anusoft cream";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a bottle of Anusoft cream";
			
			tooltip = "One of TamaniCorp’s rare unisex products, Anusoft is a popular choice with devoted buttsluts. Applied to the user’s tailhole, it adds a thickening layer to the anal rim which both improves elasticity and produces a distinctive donut shape that many users find quite stimulating even when not being fucked.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 200;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			// The Idea: Inspired by the high-libido Omnisuit scene and the SukMaster, makes assholes “pumped” in similar fashion to vaginas.
			
			kGAMECLASS.clearOutput();
			author("Couch");
			kGAMECLASS.showName("ANUSOFT\nCREAM");
			
			if(target == kGAMECLASS.pc)
			{
				var pc:Creature = target;
				
				// Consumption Text
				kGAMECLASS.output("You unscrew the cap on the tube, a bit of ivory cream emerging from within with the pressure from your fingers. You shed your gear so that it doesn’t get in the way for the moment and spread your [pc.ass] with one hand to bring the tube to your tailhole with the other, applying the cream directly to your anal ring. The cream melts into your body as quickly as you can squeeze it out, and within seconds it’s all gone. You discard the tube and stand up straight, waiting for the results.");
				
				// Anus doesn’t have the Slightly Pumped flag or the Pumped flag:
				// Anus gains the Slightly Pumped flag. Increase bonusCapacity towards 100.
				if(!pc.ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && !pc.ass.hasFlag(GLOBAL.FLAG_PUMPED) && !pc.ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED))
				{
					kGAMECLASS.output("\n\nYou feel your [pc.asshole] quiver, twitching as if being prodded with a vibrator. You can’t help but lick your lips in anticipation of what’s about to happen,");
					if(pc.libido() < 33) kGAMECLASS.output(" stifling a quiet whimper");
					else if(pc.libido() < 66) kGAMECLASS.output(" cooing to yourself");
					else kGAMECLASS.output(" letting out an exultant groan");
					kGAMECLASS.output(". Your anus is starting to thicken with new material, pushing out just enough to let you feel it pressed lightly against your cheeks like a soft little button.");
					kGAMECLASS.output("\n\nYou reach back to examine it as the growth stops, and it feels so good that you nearly cum just from the brush of your fingertip. Gone is the trim star once nestled between your buns, replaced by a soft, spongy donut that’s just as");
					if(pc.ass.looseness() <= 1) kGAMECLASS.output(" tight");
					else if(pc.ass.looseness() <= 5) kGAMECLASS.output(" loose");
					else kGAMECLASS.output(" gaping wide");
					kGAMECLASS.output(" as before but far more pliable and willing to stretch around your finger. Touching the rim feels almost like");
					if(pc.hasVagina()) kGAMECLASS.output(" touching your pussy lips, getting the real thing wetter by the second");
					else kGAMECLASS.output(" what you imagine it would be like to have a set of pussy lips to rub, pleasure rushing hot through your veins");
					kGAMECLASS.output(". You can’t wait to find out how this feels when you get a real cock crammed in there!");
					kGAMECLASS.output("\n\nYou manage to keep yourself from descending into full-on masturbating just yet, standing up straight and putting your gear back on. You’ll be biting your lip for a good long while at the sensation of your new plump pucker rubbing against your ass with every step you take.");
					
					// Anus becomes Slightly Pumped, capacity increases
					pc.ass.addFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
					if(pc.ass.bonusCapacity < 100) pc.ass.bonusCapacity += 10;
					pc.changeLust(50);
				}
				// Anus has the Slightly Pumped flag but not the Pumped flag:
				// Anus loses the Slightly Pumped flag and gains the Pumped flag. Increase bonusCapacity towards 100.
				else if(pc.ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && !pc.ass.hasFlag(GLOBAL.FLAG_PUMPED) && !pc.ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED))
				{
					kGAMECLASS.output("\n\nYou");
					if(pc.libido() < 33) kGAMECLASS.output(" can’t help it; this time you");
					kGAMECLASS.output(" moan like a whore as your anal ring swells and softens further still, thickening until it presses against your buns with delicious firmness. It feels so fat, so sinfully soft, that you don’t know how you’ll ever feel calm again with such an exciting pressure constantly lurking below");
					if(pc.hasTails()) kGAMECLASS.output(" your tails");
					else if(pc.hasTail()) kGAMECLASS.output(" your tail");
					else kGAMECLASS.output(" your tailbone");
					kGAMECLASS.output(".");
					kGAMECLASS.output("\n\nYou reach behind yourself and cry out at the sensations that rocket through your ass.");
					if(pc.hasVagina())
					{
						kGAMECLASS.output(" It’s every bit as sensitive as [pc.eachCunt], maybe even more so");
						if(pc.matchedVaginas() && (pc.vaginas[0].hasFlag(GLOBAL.FLAG_PUMPED) || pc.vaginas[0].hasFlag(GLOBAL.FLAG_HYPER_PUMPED))) kGAMECLASS.output(" had you not juiced that up into a big puffy pleasure mound as well");
						kGAMECLASS.output(". The thought of taking a cock in each at once, of feeling this ecstasy in front and back at the same time, has [pc.girlCum] streaming down your thighs.");
					}
					else
					{
						kGAMECLASS.output(" Who needs a pussy when you’ve got a hole like this? Your donut’s just as plump and inviting as any cunt could ever be.");
					}
					kGAMECLASS.output(" Your anus has completely transformed into something meant for pleasure and pleasure alone, a big fat donut with a winking little hole nestled in the center ripe and ready to fuck.");
					kGAMECLASS.output("\n\nYou barely manage to resist the urge to see how many fingers you can cram in your new pleasure pit, instead getting up and getting your gear back on. Your pucker twitches with disappointment, but you’re sure you’ll be finding a use for it soon enough.");
					
					// Slightly Pumped anus becomes Pumped, capacity increases
					pc.ass.delFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
					pc.ass.addFlag(GLOBAL.FLAG_PUMPED);
					if(pc.ass.bonusCapacity < 100) pc.ass.bonusCapacity += 10;
					pc.changeLust(100);
				}
				// Anus has the Pumped flag, bonusCapacity is less than 100:
				// Increase bonusCapacity.
				else if((pc.ass.hasFlag(GLOBAL.FLAG_PUMPED) || pc.ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) && pc.ass.bonusCapacity < 500)
				{
					kGAMECLASS.output("\n\nYou shiver as your [pc.asshole] softens further, getting even more stretchy but, you note with a touch of disappointment, no bigger. It looks like even modern medical science can’t make your pucker any plumper than it already is, but it can certainly make it even better at taking bigger cocks.");
					
					// Fully pumped, increase capacity
					pc.ass.bonusCapacity += 10;
					pc.changeLust(15);
				}
				// Anus has the Pumped flag, bonusCapacity is 100 or more:
				// Dud result.
				else
				{
					kGAMECLASS.output("\n\nYou feel a little twitch in your tailpipe, but no other changes. It looks like your asshole is as prepared for pleasure as any hole could ever be.");
					// Dud
					pc.changeLust(5);
				}
			}
			else
			{
				kGAMECLASS.output(target.short + " applies the cream to no effect.");
			}
			return false;
		}
	}
}
