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
	
	public class ClearYu extends ItemSlotClass
	{
		
		//constructor
		public function ClearYu()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.DRUG;
			shortName = "ClearYu";
			longName = "ClearYu";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a lollipop labeled “ClearYu”";
			tooltip = "A crimson, candy sphere on a white stick that has been tied up in a pink, waxy wrapper. It’s a small, trivial looking thing, but somehow the lollipop seems heavier than it should be.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 600;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			kGAMECLASS.clearOutput();
			author("Adjatha");
			
			if(target is PlayerCharacter)
			{
				//Consumption
				//First time
				var normal:Boolean = true;
				if(kGAMECLASS.flags["CLEARED_YU"] == undefined)
				{
					output("Pulling off the wrapper, you pop the candy into your mouth and suck at the sweet treat with delight. Faint hints of ripe fruit and bubbly champagne tingle through your lips as as you lap at the firm lollipop.");
					output("\n\nThe tingle from your mouth spreads until it seems to settling in the back of your head, a slightly fuzzy feeling washing over you. What were you just thinking about? It seems distant and unimportant, especially compared to the lovely tingling that loosens the stress in your neck and shoulders. It’s as if a weight has been lifted from your chest and you can breathe deeper and more easily than ever before.");
					kGAMECLASS.flags["CLEARED_YU"] = 1;
					//{Reduce Intellect by 3-5 points. Increase Reflexes, Aim, and Libido by 1-3 points each, to a max of 60.}
				}
				//Critical Levels
				//{If a player has already consumed one of these items and their Intelligence is at 10 or lower, this plays instead of the normal Repeat text}
				else if(target.intelligence() <= 10)
				{
					//Bad End
					if(target.hasStatusEffect("Sweet Tooth"))
					{
						//{If a player tries to consume another ClearYu while they have the <i>“Sweet Tooth”</i> status effect, they will attempt to eat two at the same time, triggering a Bad End. This can only trigger if the player has an Intelligence below 10}
						output("Rolling the partially dissolved lollipop from your lips and holding the glistening candy to eye level, it occurs to you that you’ve never tried two at once. If one of these is so delicious you could just about suck on it all day long, just think how good two must be. Popping the first treat back into your mouth, you pull out a second and unwrap the waxy paper from it. The interior of the wrapper seems to have some kind of safety information written on it and you giggle. Putting nutrition facts on a lollipop? How silly! You crumple up the paper and let it fall to the ground as you stuff the second ClearYu past your [pc.lips]");
						output("\n\nThe two hard candies clink against each other as you roll them around in your mouth, your [pc.tongue] swirling and caressing each in turn as your mouth fills with saliva. The taste is better than you could’ve imagined, a sugar rush overtaking you as raw sensation floods your brain. ");
						if(target.isBald()) output("The faint wind rolls across your [pc.skin] sending deserate shivers through your back and up your spine.");
						else output("You can feel a slight gust of wind through your [pc.hair] as sharply as if it had been a lover’s hand caressing your tresses with wanton need.");
						output(" Your [pc.chest] rises and falls with quickening intensity, every breath sending waves of cool ice through your inflamed nerves.");
						output("\n\nYou try to smile with blissful contentment, but your lips feel numb. You touch the pillowy surfaces and discover your mouth has swollen into an O-shaped pucker. You try to pull the lollipops out, but your lips are clenched too tightly to remove the chemical candy. The attempt does, however, permit a trickle of cherry-flavored drool to leak from your pursed oval. Your candy-coated lips swell at the stimulation, leaving your weak in the knees. It’s as if your lips have become as sensitive as your [pc.crotch].");
						output("\n\nA dazed, weakened hand reaches up to press against your lips and while the yielding flesh is as pliant as ever, the pressure sends irresistible euphoria radiating through your body with the intensity of gripping a live wire. Your vision swims as your higher brain functions shut down from the sensory input of your body. An orgasm that ignites every cell in your body shudders from your lips on down. Your shoulders tighten backward, thrusting out your [pc.chest]. As you gasp for ever more icy air, your stomach churns with unspoken appetites too desperate to focus on without a painful sense of emptiness. Your long, elegant [pc.legOrLegs] wobble");
						if(target.legCount == 1) output("s");
						output(" as you nearly sink to the ground from the suffocating ecstasy.");

						output("\n\nWhen your orgasm finally finds your [pc.crotch], the release is a mere formality. Every inch of your body is so enraptured by the candy climax that ");
						//dick: 
						if(target.hasCock()) output("the moistness filling your [pc.clothes] with [pc.cum] seems a relatively minor addition.");
						else if(target.hasVagina()) output("the moistness filling your [pc.clothes] with [pc.girlCum] seems a relatively minor addition.");
						//neuter: 
						else output("it nearly robs you of your motor control, your [pc.hips] swaying drunkenly to the fluid bliss within you.");
						output(" Is this an overdose? The small portion of you still capable of rational thought fills with white-hot panic, realizing that the drug coursing through your body means to leave you a brainless slave to your own desires. You try to scream, but only manage a lust-drug giggle.");
						output("\n\nWait. Didn’t dad");
						if(target.isBimbo()) output("dy");
						output(" give you something for this? That icky cocktail of immune-whatsits? Even as you’re trying to remember what you were told about your enhancements, a tightness seizes you. Each muscle in your body flexes in turn, and with each flex comes a sense of complete control. It’s as if you suddenly discovered that you had an extra set of arms and are trying them out for the first time. The drugged haze clings to your brain, settling in for a long occupancy, but the clarity of your body is so intense that it brings tears of joy to your eyes. You’ve lived your entire life inside your body, but now you don’t feel like a passenger or a prisoner.");
						output("\n\nYou’re free.");
						
						kGAMECLASS.processTime(10 + rand(3));
						
						clearMenu();
						addButton(0,"Next",lollipopSuperBadEnd, target);
						return true;
					}
					output("You unwrap another lollipop and stare at it for a moment. The crimson candy is still as bright as alluring as ever, but you notice perhaps for the first time, that the red seems to darken towards the interior. The whorling patterns across its surface are almost mesmeric, drawing you into that dark, unknown depth within.");
					output("\n\nYou blink, the daydream vanishing before your eyes. Weird! You move to consume the candy with your normal joyful relish, but the memory of your silly fantasy gives you pause. Maybe you’ll take your time with this lollipop, rather than just sucking it down as quickly as possible.");

					//{Reduces Intellect by 1 point. Player gains the status effect: <i>“Sweet Tooth.”</i> This status lasts for 12 hours and has the mouseover text <i>“Sucking seductively on a lollipop.”</i> In combat, this increases your tease effectiveness.}
					normal = false;
				}
				//Repeat
				else
				{
					output("Popping another ClearYu in your mouth, you suck with abandon, grinning as the fizzy lollipop fills your plump, puckered lips. Your fingers twist the flavorful lollipop around and around, pulling it nearly out to kiss the tip before thrusting it back in to swallow the firm sphere within your needy cheeks. Your body tingles as a warm bloom fills your sight, everything around you becoming both softer and clearer. You’re more aware of your body and while you vaguely sense you’re losing something else, it’s probably not important.");
					//{Reduce Intellect by 3-5 points. Increase Reflexes, Aim, and Libido by 1-3 points each, to a max of 60)
				}
				if(normal)
				{
					if(target.intelligence() <= 1) {}
					var amount:Number = 3 + rand(3);
					if(target.intelligence() - amount < 0) amount = target.intelligence() - 1;
					var change:Number = amount - 2;
					if(change < 1) change = 1;
					target.intelligence(-amount);
					target.slowStatGain("aim",change);
					target.slowStatGain("reflexes",change);
					target.slowStatGain("libido",change);
				}
				else
				{
					target.intelligence(-1);
					target.createStatusEffect("Sweet Tooth",0,0,0,0,false,"Icon_Lollipop","Sucking seductively on a lollipop.",false,720);
					target.libido(3);
				}
				//Transformation Effects
				//{Each transformation has a 30% chance to trigger with each item consumed}
				//Lips
				if(target.lipColor != "ruby" && rand(3) == 0)
				{
					output("\n\nAbsently, you grip the little stick and pull the candy to your lips, twirling it between your forefinger and thumb. The sticky pop leaves a warm, red lacquer across your lips that seems to harden, like a candy shell. You lick your lips and the moisture softens them instantly, rewarding you for the effort with another tingling flutter that leaves you blushing.");
					//{Increase Lip Size by 2. Change Lip Color to Candy Apple Red}
					target.lipMod += 2;
					target.lipColor = "ruby";
				}
				//Hair
				if(rand(3) == 0)
				{
					//if bald}
					if(!target.hasHair())
					{
						output("\n\nThe tingle in your mouth wiggles its way up through your brain and settles at the top of your head, leaving you a bit giggly, as if drunk. You run a palm across the [pc.skin] of your head and find a fuzzy growth covering your previously smooth scalp. How odd! It seems you’ve got hair now. Oh well! No use worrying about it.");
						target.hairLength = 0.5;
					}
					//{if not bald}
					else
					{
						output("\n\nAs you enjoy the treat, you flick your hand over your shoulder, fingers flitting against the [pc.skin] of your neck. To your surprise, they end up tangled amid your [pc.hair], finding rather more of it than you’d expected. Can a candy make your hair grow? No, that’s silly. You must’ve just forgotten how long your luscious locks are.");
						target.hairLength += 2 + rand(4);
						//{Increases Hair Length by 2-5 inches}
					}
				}
				//Hair Color
				if(target.hairColor != "raven" && target.hairLength >= 6 && rand(3) == 0)
				{
					//{Only changes if the player’s hair is 6 inches or longer and not already Raven Black}
					output("\n\nFlipping your hair back, a moment of confusion washes over you. Did you always have dark black hair? Wasn’t it... you struggle to recapture the memory of your own hair color, but it’s gone. Oh well, you shrug. Not really all that important afterall. You shake out your shimmering black tresses and lick the lollipop in an oblivious, dreamy daze.");
					target.hairColor = "raven";
					//{Change hair color to Raven Black}
				}
				//Height
				if(target.tallness < 102 && rand(3) == 0)
				{
					output("\n\nA wave of exhaustion pours over you and settles in the pit of your stomach. You yawn, tongue curling up at the tip, and stretch vigorously. Your limbs tremble at the intensity of your taut muscles. When the weariness passes, your full body strain leaves your [pc.legOrLegs] wobbling slightly. Glancing down, you tilt your head to one side, noisily sucking on your lollipop. Were you always this tall? Your upper body seems more or less normal, but below your waist, it seems like you’ve gotten a bit longer. Must be one of those late growth spurts!");
					//{Height increases by 1-2 inches, up to a maximum of 102 inches}
					target.tallness += 1 + rand(2);
				}				
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " eats the candy to no effect.");
			}
			return false;
		}
		public function lollipopSuperBadEnd(target:Creature):void
		{
			kGAMECLASS.currentLocation = "GAME OVER";
			kGAMECLASS.generateMap();
			kGAMECLASS.showLocationName();
			
			clearOutput();
			author("Adjatha");
			output("Over the course of a few months, your life has changed completely. All thoughts of your father’s inheritance are gone. As are most of your other thoughts, in fact. All that remains is desire. The desire to experience sensation of any and every sort. In the first month you ran your body ragged fucking anything and everything you possibly could in ways that even Ultra Porn hasn’t explored.");
			output("\n\nAfter that, you spent your time training every muscle in your body to perfection. You entered a variety of dexterous fields, like pole dancing, gymnastics, climbing and acrobatics, mastering each with a trivial effort that astounded all your competition. The rewards and fame were meaningless- it was the effort alone that mattered to you.");
			output("\n\nNext, you took up weapons once more, but not in exploration- merely for the joy of practice. A crack shot with every gun you touched, you signed on for mercenary work in the most dangerous regions of space simply to put your body to the test. It was as if everyone around you moved in slow motion, gunning down raiders and pirates with the thoughtless ease of a hardened killer. It simply never occurred to you that your employers might be horrified by the mindless delight you took in demonstrating your expertise. Empathy had been burned out of your seductive, doll-like body.");
			output("\n\nBoth renown and feared, your name became something of a legend. [pc.name], the lollipop-sucking sexpot who kills with an ease primitive cultures once reserved for gods. Rumors and gossip don’t bother you, though. Nothing bothers you. The bliss of a perfect body more than makes up for the absence of a contemplative mind. Your vacant eyes and perpetually puckered cherry red lips are as empty of doubt and fear as they are of compassion or love.");
			
			kGAMECLASS.days += ((30 * 3) + rand(8));
			kGAMECLASS.hours = rand(24);
			kGAMECLASS.processTime(rand(60));
			
			if(target.lipColor != "ruby") target.lipColor = "ruby";
			if(target.hairColor != "raven") target.hairColor = "raven";
			if(target.tallness < 102) target.tallness = 102;
			if(target.hairLength < target.tallness - 6) target.hairLength = (target.tallness - 6);
			
			//BAD END.
			kGAMECLASS.badEnd();
		}
	}
}
