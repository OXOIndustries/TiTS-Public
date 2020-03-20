package classes.Items.Miscellaneous
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.formatFloat;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.num2Ordinal;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.GameData.CodexManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Engine.Utility.rand;
	
	public class Dicksprout extends ItemSlotClass
	{
		
		//constructor
		public function Dicksprout()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.DRUG;
			
			//Used on inventory buttons
			this.shortName = "Dicksprout";
			
			//Regular name
			this.longName = "box of Dicksprout";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "A box of Dicksprout";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "One of the first, if not the first man-made transformative ever commercialized. Even after hundreds of years, it remains an extremely popular and safe choice.\n\nWhile it was originally released as a true penis enlargement drug; its staggering success and the development of new technologies led to the modern version currently for sale. It's capable not only of dick enlargement but also may be used to gain full male genitalia in those lacking one.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 30000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			author("Thebiologist");
			clearOutput();
			clearMenu();

			var btnSlot:int = 0;

			if(target is PlayerCharacter) {
				kGAMECLASS.output("You open the cardboard box and peruse its contents: a small, metallic, handheld cylinder with a big red button on one end and a plastic cap on the other.  It’s a jet injector, a needleless syringe with a pressurized vial full of a deep-blue liquid. A small internal chip allows it to link with your codex so you can choose from several customization options.");

				output("\n\nThere’s also a set of instructions printed on the back of the box:");

				output("\n\n<i>“Link the injector with any compatible dataslate or similar device. Remove the plastic cap. Press the injector against the crotch or penis. Select the desired testicle, length, and thickness options. Press the red button.");

				output("\n\n<b>WARNING</b>: Use only as instructed. Misuse may result in abnormal growths.”</i>");

				output("\n\nWell, that was pretty sparse. The rest of the text contains a list of side-effects, related medical conditions and a lot of legal jargon you can barely understand.");

				output("\n\nWhat will you do now?");

				if (kGAMECLASS.pc.hasCock()) addButton(btnSlot, "Dick", (kGAMECLASS.pc.hasCocks() ? dicksproutCockSelect:dicksproutBallChoice), undefined, "Dick", "Press it against your cock. That should add some inches.");
				else addButton(btnSlot, "Crotch", dicksproutBallChoice, undefined, "Crotch", "Press it against your crotch. That should give you a brand-new dick.");
				btnSlot++;

				if (kGAMECLASS.pc.hasTentacleNipples() || kGAMECLASS.pc.hasDickNipples()) addButton(btnSlot, "Nipples", dicksproutCockChoice, [-1], "Nipples", "Fuck the rules. Use it on your nipples. See what happens.");
				else addButton(btnSlot, "Nipples", dicksproutNipples, undefined, "Nipples", "Fuck the rules. Use it on your nipples. See what happens.");
				btnSlot++;

				if (kGAMECLASS.pc.hasTail())
				{
					if(!kGAMECLASS.pc.hasTailGenital()) addButton(btnSlot, "Tail", dicksproutTail, undefined, "Tail", "A piece of cardboard won't tell you what to do! Use it on your tail.");
					else addDisabledButton(btnSlot, "Tail", "Tail", "You shouldn't attempt further shenanigans with your tail mounted genitalia.")
					btnSlot++;
				}
				addButton(btnSlot, "Nothing", dicksproutPutAway, undefined, "Nothing", "You've changed your mind.");
				
				return true;
			}

			else {
				kGAMECLASS.output(target.capitalA + target.short + " injects the Dicksprout to no effect.");
			}
			return false;
		}

		public function dicksproutCockSelect():void
		{
			clearOutput();
			clearMenu();
			author("Thebiologist");
			output("First, you should decide which one in particular you're gonna use it on? \n");

			var btnSlot:int = 0;
			for(var i:int = 0; i < kGAMECLASS.pc.cocks.length; i++)
			{
				output("\n<b>" + StringUtil.capitalize(num2Ordinal(i + 1)) + " Cock:</b>");
				if(kGAMECLASS.pc.cocks[i].cockFlags.length > 0)
				{
					for(var x:int = 0; x < kGAMECLASS.pc.cocks[i].cockFlags.length; x++)
					{
						output(" " + GLOBAL.FLAG_NAMES[kGAMECLASS.pc.cocks[i].cockFlags[x]] + ",");
					}
				}
				if(kGAMECLASS.pc.cocks[i].cockColor != "") output(" " + StringUtil.toDisplayCase(kGAMECLASS.pc.cocks[i].cockColor) + ",");
						output(" " + GLOBAL.TYPE_NAMES[kGAMECLASS.pc.cocks[i].cType]);
				if(kGAMECLASS.pc.cocks[i].cLength() > 0) output(", " + formatFloat(kGAMECLASS.pc.cocks[i].cLength(), 3) + " in long");
				if(kGAMECLASS.pc.cocks[i].thickness() > 0) output(", " + formatFloat(kGAMECLASS.pc.cocks[i].thickness(), 3) + " in thick");
						
				addButton(btnSlot, "Cock " + (i + 1), dicksproutBallChoice, i, StringUtil.capitalize(num2Ordinal(i + 1)) + " Cock", "Use this on your [pc.cock " + i + "].");
						btnSlot++;
			}
		}

		//Choose to make testicles internal or external
		public function dicksproutBallChoice(dick:int = 0):void
		{
			clearOutput();
			clearMenu();
			author("Thebiologist");

			if (kGAMECLASS.pc.hasCock())
			{
				output("Well, it’s time to add some extra oomph to your good old [pc.cock " + dick + "]. It surely deserves a nice treat, and the extra attention you’ll both get is a nice bonus.");

				output("\n\nYou’re already fantasizing about what you’re going to do with all that surplus cockflesh. The thought won’t leave your mind, and without realizing it, your hand has already slipped under the radar and is idly playing with " + (kGAMECLASS.pc.hasCocks() ? "a":"your") + " [pc.cockNoun " + dick + "].");

				output("\n\nYou can feel your manhood stiffening, swelling and hardening from all the mental images cast by your lewd imagination and your unintentional manual stimulation");
				if (kGAMECLASS.pc.isCrotchGarbed()) output(", pressing hard against your [pc.crotchCoverUnder]");
				output(". You’ve barely done anything and you’re all riled up.");

				output("\n\nFirst things first. You should select the option you want in regard to your testicles.");
			}
			else
			{
				output("It’s been decided. You could always use a brand-new dick. Just thinking about the many ways you could use it already sends your mind racing. Acts of penile debauchery flood your brain, making you hornier than ever, hot and bothered.");

				output("\n\nYour lewd fantasy has your mind already holding tightly to a phantom cock that’s yet to come. You’re humping instinctively way before you even have a cock to call your own; your body getting ready to welcome your future addition: its new upcoming member.");

				output("\n\nShaking your head, you snap out of it and remember you have a decision to make first. What kind of testes do you want?");
			}

			//Already has balls
			if (kGAMECLASS.pc.balls > 0)
			{
				addButton(0, "Internal", dicksproutCockChoice, [dick, true], "Internal", "Select internal testicles. Those are safer.");
				addButton(1, "No Change", dicksproutCockChoice, [dick, false], "No Change", "Keep your testicles externalized.");
			}
			//No balls
			else if (kGAMECLASS.pc.hasCock())
			{
				addButton(0, "No Change", dicksproutCockChoice, [dick, true], "No Change", "Keep your testicles internalized.");
				addButton(1, "External", dicksproutCockChoice, [dick, false], "External", "Select external testicles. Those are much more fun.");
			}
			//No dick
			else
			{
				addButton(0, "Internal", dicksproutSelectLength, [dick, true], "Internal", "Select internal testicles. Those are safer.");
				addButton(1, "External", dicksproutSelectLength, [dick, false], "External", "Select external testicles. Those are much more fun.");
			}

		}

		//Choose between lengthening, thickening, or both for your dick
		public function dicksproutCockChoice(args:Array):void
		{
			clearOutput();
			clearMenu();
			author("Thebiologist");

			//Regular cock
			if (args[0] != -1) 
			{
				output("And about length and width. What do you choose?");

				addButton(0, "Lengthen", dicksproutCrotch, [args[0], args[1], 0]);
				addButton(1, "Thicken", dicksproutCrotch, [args[0], args[1], 1]);
				addButton(2, "Both", dicksproutCrotch, [args[0], args[1], 2]);
			}

			//Dicknipples
			else
			{
				output ("Your chest mounted stallions could use a bit of extra length themselves. The instructions said something about using the transformative just as indicated, but fuck them, right? Time to make those breeders reach new heights!");

				output("\n\nFirst things first, you need to configure the damn thing. About the length and width. What do you choose?");

				addButton(0, "Lengthen", dicksproutNipples, 0);
				addButton(1, "Thicken", dicksproutNipples, 1);
				addButton(2, "Both", dicksproutNipples, 2);
			}
		}

		public function dicksproutSelectLength(args:Array):void
		{
			clearOutput();
			clearMenu();
			author("Thebiologist");

			output("And now, you should adjust the desired length. Decide how big it should be:");

			var btnSlot:int = 0;

			for (var i:int = 3; i < 10; i++)
			{
				addButton(btnSlot, i + "\"", dicksproutSelectThickness, [args[0], args[1], i]);
				btnSlot++;
			}
		}

		public function dicksproutSelectThickness(args:Array):void
		{
			clearOutput();
			clearMenu();
			author("Thebiologist");

			output("And of course, the thickness. How fat you want your cock to be?");

			addButton(0, "Standard", dicksproutCrotch, [args[0], args[1], args[2], 1]);
			addButton(1, "Thick", dicksproutCrotch, [args[0], args[1], args[2], 1.1]);
			addButton(2, "Thicker", dicksproutCrotch, [args[0], args[1], args[2], 1.2]);
			addButton(3, "Extra Thick", dicksproutCrotch, [args[0], args[1], args[2], 1.3]);
		}

		/*
		arg[0] which dick 
		arg[1] internalize balls choice
		(if existing cock):
		arg[2] 0 lengthen, 1 thicken, 2 both;
		(if new cock):
		arg[2] new cock length
		arg[3] new cock thickness
		*/
		public function dicksproutCrotch(args:Array):void
		{
			clearOutput();
			clearMenu();
			author("Thebiologist");

			var changeBalls:Boolean = false;
			if ((kGAMECLASS.pc.balls > 0 && args[1]) || (kGAMECLASS.pc.balls == 0 && !args[1])) changeBalls = true;

			//Enhancing existing cock
			if (kGAMECLASS.pc.hasCock())
			{
				//Break if selections made are locked
				if (!kGAMECLASS.pc.ballsUnlocked(args[1] == 0 ? 0:2) || (args[2] != 1 && !kGAMECLASS.pc.cockLengthUnlocked(args[0], kGAMECLASS.pc.cocks[args[0] + 3])) || (args[2] != 1 && !kGAMECLASS.pc.cockThicknessUnlocked(args[0], kGAMECLASS.pc.cocks[args[0]].cThicknessRatioRaw + 0.1)))
				{
					output("Your crotch warms, but nothing happens. What a ripoff.")
					kGAMECLASS.processTime(5);
					mainGameMenu();
					return;
				}
				output("The decisions have been made. Now it’s time to get down to business.");

				output("\n\nUsing your thumb, you pop the injector’s plastic cap like a cork.");
				if (!kGAMECLASS.pc.isCrotchExposed()) output("First, you pull your [pc.cockNoun " + args[0] + "] out.");
				output("\n\n You then press the device against the [pc.knot "  + args[0] + "] of your already steel hard shaft, feeling the rubbery, cool silicone ending of the injector. You make sure it creates a nice tight seal, so its contents don’t spill. Then, you move your thumb over the flashy, big red button and press it without a second thought.");

				output("\n\nA soft pneumatic hiss escapes the injector, and the vial empties slowly, delivering the dose. The area around the injection point tingles slightly. It feels like having a miniaturized rainstorm localized entirely within that tiny region of your [pc.cockSimple " + args[0] + "].");

				output("\n\nOnce the vial is devoid of its contents, you set aside the device and examine the injection site. The entire area and its vicinity are slightly reddened, but other than that, you see no evident changes in your anatomy.");

				output("\n\nLike a jolt of lightning, an intense sensation assails you, traveling up your spine and causing your entire body to tense up in response, arching your back in the process. All you can do is let out a throaty moan in reply as the powerful stimuli reaches your brain. You’re experiencing an acute pleasure which compels you to instinctively grab hold of your [pc.cock " + args[0] + "] and masturbate frantically.");

				output("\n\nThe changes become apparent in a few short minutes. Your [pc.cockSimple " + args[0] + "] swells as blood rushes in with every consecutive beat of your heart. Your prick keeps enlarging, throbbing incessantly. You can feel the tremendous pressure building up inside, with veins bulging visibly under your [pc.cockSkin " + args[0] + "], pulsating and growing nonstop. You’re scared that they might burst at this rate. Your [pc.cockSimple " + args[0] + "] is ludicrously distended right now, and so ridiculously hard you could puncture a ship’s hull with it... well, maybe not that.");

				output("\n\nAll your thoughts, all your worries are washed away by the immense wave of ecstasy triggered by the next growth spurt, and the next one ... and the one after that. You can barely think straight. All you know is you need to keep pumping hard on your [pc.cockNoun " + args[0] + "], faster, stronger.");

				output("\n\nIt feels like an eternity, but in truth, your vigorous self-loving session barely lasts a minute before your [pc.cockNoun " + args[0] + "] reaches its tipping point, setting off a cascade of mini-orgasms culminating in an intense, body-shaking climax.");

				output("\n\nYour [pc.cock " + args[0] + "] twitches and throbs with a renewed and increased size. You can only smile in contentment, delighting in the fruits of its hard-earned labor.");
 
				if (changeBalls) output("\n\nBut... there’s something missing... Your seed is not coming out. Shouldn’t your [pc.cum] be squirting out of your urethra already? That’s how it usually goes. .");

				//Testicles become internal
				if (changeBalls && args[1])
				{
					output("\n\nAn intense rumbling and a powerful tingling sensation emerges from your [pc.balls]. It feels odd. It’s not entirely painful, but it aches a bit.");
					if (kGAMECLASS.pc.balls == 1) output("Alarmed, you take a good look at your uniball, only to watch it as it snuggles tightly against your crotch.");
					else output("Alarmed, you take a good look at your testes, only to watch them as they snuggle tightly against your crotch.");

					output("\n\nThe pressure keeps steadily rising. You can feel it, like a bizarre straining sensation.");
					if (kGAMECLASS.pc.balls == 1) output(" Your uniball is beginning to shrink! No… that's not right. Not shrink, sink! Your [pc.balls] is sinking inside your body, slowly moving upwards until it becomes an internal gonad, nesting safely within you.");
 					else output(" Your testicles are beginning to shrink! No… that's not right. Not shrink, sink! Your [pc.balls] are sinking inside your body, slowly moving upwards until they become internal gonads, nesting safely within you.");

					output("\n\n<b>You now have internal testicles</b>");
					kGAMECLASS.pc.makeBallsInternal();
				}

				//Testicles become external
				else if (changeBalls && !args[1])
				{
					output("\n\n There’s a slight itching sensation coming from under your [pc.cocks]. Annoyed, you reach with your hand to scratch it only to notice a small but quickly expanding fleshy bump.");

					output("\n\nThe ever-expanding bulge has you slightly concerned, but all you can do now is watch in shock as the nub continues growing, causing an acute straining sensation in your nether regions.");

					output("\n\nFor a couple of minutes, you are worried about the possible side effects you didn’t bother to read, until the bulb begins to take shape, dividing into two equally sized orbs that hang from your crotch. Those are balls! Your [pc.balls]. They just changed locations.");

					output("\n\n<b>You now have external testicles</b>");
				
					kGAMECLASS.pc.balls = 2;
					if (kGAMECLASS.pc.ballSizeRaw < 3) kGAMECLASS.pc.ballSizeRaw = 3;
				}

				if (changeBalls) output("\n\nWell, you did select that option when you – Oh! Fuck! A new, unexpected, delayed climax hits you harder than a freight train, giving you no warning this time. Right on cue, you cum.");

				output("\n\nYour [pc.cockSimple " + args[0] + "] erupts with fury and thunder, squirting load after load of your precious [pc.cum] like an unending storm, painting the floor [pc.cumColor] with a nice helping of [pc.cumNoun].");

				output("\n\nExhausted by the whole ordeal, you barely manage to stand up, only to marvel at the sight of your new and improved cock. Just perfect. You smile with glee"); 
				if (kGAMECLASS.pc.isCrotchGarbed()) output(" and stow your [pc.cockNoun " + args[0] + "] back inside your clothing");
				output(". You’ve got exactly what you wanted; what you paid for.");
				
				kGAMECLASS.pc.orgasm();

				if (args[2] != 1) kGAMECLASS.pc.cocks[args[0]].cLengthRaw += (rand(2) + 1);
				if (args[2] != 0) kGAMECLASS.pc.cocks[args[0]].cThicknessRatioRaw += 0.1;
			}

			//Growing a cock
			else
			{
				//Break if can't grow a cock
				if (!kGAMECLASS.pc.createCockUnlocked(kGAMECLASS.pc.cocks.length))
				{
					output(kGAMECLASS.pc.createCockLockedMessage());
					output(" What a ripoff.");
					kGAMECLASS.processTime(5);
					mainGameMenu();
					return;
				}

				output("All set and ready to go.");

				output("\n\nWithout hesitation, you pop the plastic cap off the jet injector");
				if (kGAMECLASS.pc.isCrotchGarbed()) output(" and remove your lower body’s clothing");
				output(". You then press its rubbery, silicone capped tip against your bare crotch, pushing hard to create a nice seal and avoid any spillage. You bite your lower lip with anticipation and press on the big red button without a second thought.");

				output("\n\nA faint pneumatic hissing sound reaches your ears as the vial begins emptying. The sensation is a most curious one; intense pressure and tiny raindrops crashing heavily against the surface of the [pc.skinFurScalesNoun] in contact with the injector.");

				output("\n\nFirst, you discard the now empty device, and with that junk now out of the way, you take a good look at the area. There a slight reddening and a minor tingling, but other than that you don’t notice any immediate effects.");

				output("\n\nYou try massaging the afflicted [pc.skinFurScalesNoun] patch, rubbing it tenderly with a pair of fingers. There’s... something odd. It feels... nice. Actually, like really nice. The sensation is bizarre but so pleasant you can’t keep your fingers away. You feel compelled by a primal need. You need to keep massaging your tingling nethers no matter what... no matter what.");

				output("\n\nSomething finally clicks inside your mind. What you feel... It’s arousal! Sexual stimuli, but there’s still no cock to be seen. Could it be the nerve endings develop first? Suddenly, your fingers hit a bump. You look downwards only to see a tiny reddish nub. It’s small, but it’s growing. You can feel it flustered, full of blood and pulsating.");

				output("\n\nPerhaps... with encouragement... You bite your lower lip as a naughty thought crosses your mind. You decide to pinch the tiny thing and in return, you’re rewarded with an intense burst of pleasure. Like a miniature orgasm but still astonishingly potent. So much you can’t help but arch your back and howl from the acute, ecstatic stimuli.");

				output("\n\nYou’re unsure if it’s supposed to be like this, but that harsh squeeze has triggered an immediate growth spurt. The tiny mass of flesh quickly expands, becoming bigger and longer, like a tiny finger, but big enough to grab hold of it with your hand.");

				output("\n\nUnable to help yourself, and incited by raw animalistic instinct, you begin furiously jerking off the bizarre protuberance, delighting in the intensely pleasurable sensations you draw from it with every pump. You keep upping the pace, stroking it relentlessly and squeezing vigorously, only to trigger new surges. Its mass keeps increasing exponentially, and so is the pleasure. It already resembles a simple penis with a basic human-like shape and feels like the real deal.");

				output("\n\nOverwhelmed by the myriad of new sensations, you’re beginning to lose control over your body. Primitive impulses take over, making you unable to focus on anything but your brand new appendage and your zealous self-loving session.");

				//apply changes here for parser later
				kGAMECLASS.pc.createCock(args[2], args[3]);
				kGAMECLASS.pc.setNewCockValues(0);
				
				//Safeguard in case the PC somehow has balls but no cock and selects internal testicles
				if(kGAMECLASS.pc.balls > 0 && args[1])
				{
					if (kGAMECLASS.pc.balls == 1) output("\n\nSomething odd is going on. You take a good look down and notice your [pc.testicles] is rapidly sinking inside your body, becoming {an} internal testicle.");

					else output("\n\nSomething odd is going on. You take a good look down and notice your [pc.testicles] are rapidly sinking inside your body, becoming internal testicles.");

					kGAMECLASS.pc.makeBallsInternal();
				}

				//Internal testicles
				else if (args[1])
				{
					output("\n\nThe pressure is too much. You can feel it building up deep within you. It’s an orgasm, a male one. Your first one.");
					if (!kGAMECLASS.pc.cockVirgin) output(" With this dick at least.");
					output(" You can’t hold it back anymore. You need to cum and you need it now. You can feel something squeezing inside you... a prostate? Yes! You have a prostate now! It’s pumping. It’s getting ready, and here it comes.");
				}

				else
				{
					output("\n\n... Here it comes! ... Now? Now! What’s going on?! It feels like someone hit the pause button. You’re on edge; feeling incredibly frustrated, denied. This is despairing. You need to cum, and you’re a split second from doing so, yet nothing happens no matter how hard you pump. Come on! Damnit!");

					output("\n\nWait... There’s something else... missing? The sudden realization hits you hard, and an intense strain assails your crotch, right under your newfound [pc.cock]. It aches, pulsates. There’s an immense pressure coming from your nethers, and then you feel it; a pair of fleshy nubs popping out of your crotch. Testes! Your new [pc.balls], quickly expanding and hanging from your newly minted scrotum. So that’s what - Ah! Fuck! You’re cumming!");

					output("\n\nThe dam bursts, on hold no longer.");

					kGAMECLASS.pc.balls = 2;
					if (kGAMECLASS.pc.ballSizeRaw < 3) kGAMECLASS.pc.ballSizeRaw = 3;
				}

				output("\n\nAn enormous tsunami of endorphins floods your system as the feel-good chemicals inundate every single pleasure center inside your brain. It’s Intense but short-lived, like an adrenaline shot.");

				output("\n\nFinally, you cum, exactly what you were yearning for. You finally get to see your [pc.cum] shooting out of your brand-new [pc.cock]. Your precious bounty sprays wildly everywhere: you, the floor...");

				output("\n\nIt takes mere seconds, but your fiery climax finally runs its course, leaving you exhausted but somewhat satisfied. You can’t help but smile with contentment. This is it: your new, mint condition [pc.cockNoun]. Just what you wanted.");

				kGAMECLASS.pc.orgasm();
			}

			kGAMECLASS.processTime(10 + rand(6));
			addButton(0, "Next", mainGameMenu, undefined);
		}	
		
		public function dicksproutNipples(changes:int = -1):void
		{
			clearOutput();
			author("Thebiologist");
			clearMenu();

			//Existing dicknipples
			if (changes != -1)
			{
				//Break if dicknipple multiplier locked
				if (!kGAMECLASS.pc.dickNippleMultiplierUnlocked(kGAMECLASS.pc.dickNippleMultiplier + 1))
				{
					output(kGAMECLASS.pc.dickNippleMultiplierLockedMessage());
					output(" What a ripoff.");
					mainGameMenu();
					kGAMECLASS.processTime(5);
					return;
				}

				output("Eager to see the results, you pop the plastic cap and quickly inject each");
				if (kGAMECLASS.pc.breastRows[0].breasts > 0 || kGAMECLASS.pc.breastRows.length > 1) output(" and every one");
				output(" of your nipples with a partial dose of the transformative, distributing it to the best of your abilities.");

				output("\n\nYour [pc.nipples] tingle a bit, and they are visibly engorged, but just so slightly. This is not what you wanted. You try rubbing one of your nipples, see if there’s is something wrong, and as soon as flesh meets flesh it hits you. Like a freight train, an intense convulsion shakes your entire body, causing it to tense, yet twitch uncontrollably.");

				if (changes != 2) kGAMECLASS.pc.dickNippleMultiplier += 1;
				if (changes != 1) kGAMECLASS.pc.nippleWidthRatio += 0.05;

				output("\n\nA powerful surge of pleasure comes from deep within your chest area, and right on cue, your [pc.dickNipples] pop out of their hideout like torpedoes, hardening in an instant. This isn’t what you were expecting either!");

				output("\n\nYou’re suddenly brought low by a new outburst of joy, as powerful as the first. You can’t help but lay helplessly as the potent sensation turns your body into jelly. You can’t control yourself anymore. This is much more than you’ve bargained for. You are orgasming, riding your fervent peak, and you’ve done nothing at all!");

				output("\n\nYour body is at the mercy of your lust. You can do nothing but watch and hope for your ferocious climax to reach its end, yet it shows no hint of having such intentions. You simply keep cumming; unending, locked in perpetual bliss, unable to move on your own.");

				output("\n\n[pc.milk] finally geysers out of your [pc.dickNipples], reaching untold heights and raining down on your squirming body. You instinctively open your mouth; any shred of self-control already lost within your mighty climax.");

				output("\n\nYou wake up perhaps an hour later, having passed out from the intense overstimulation. It seems that’s what you get for messing around with complex transformatives and ignoring the big bold warning letters. Wait... your [pc.dickNipples] are actually bigger now that you look at them! It worked! Suck it, big bold warning letters.");
				kGAMECLASS.processTime(60);
			}

			//Grow dicknipples
			else
			{
				//Break if nipple type locked
				if (!kGAMECLASS.pc.nippleTypeUnlocked(0, GLOBAL.NIPPLE_TYPE_DICK))
				{
					output(kGAMECLASS.pc.nippleTypeLockedMessage());
					output(" What a ripoff.");
					kGAMECLASS.processTime(5);
					mainGameMenu();
					return
				}

				output("There’s no way you can shake the thought of your head now. You’re already fantasizing about it; gaining brand-new chest-borne breeders. About how delightful they will feel and how hard they’ll cum.");

				output("\n\nLust struck, you pop the plastic cap of the jet injector with eagerness and push the big red button again and again, distributing the drug evenly among each ");
					if (kGAMECLASS.pc.breastRows[0].breasts > 0 || kGAMECLASS.pc.breastRows.length > 1) ("and every one ");
					output("of your [pc.nipplesNoun].");

					if (kGAMECLASS.pc.hasNippleCunts())
					{
						output("\n\nYou can feel an odd, tingling sensation emanating deep within your [pc.nippleCunts]. It’s a bizarre straining feeling, like pressure. It’s almost like your [pc.breasts] are being squeezed, but, as crazy as it sounds, the sensation is coming from the inside.");

						output("\n\nAlarmed, you poke and probe, sliding your index inside to check if everything’s alright. Fuck! You’re ludicrously tight and your [pc.nippleCunts] only keep squeezing more and more with each passing moment. Hey! That’s your finger and you want it back. Damnit! It feels like an odyssey, but eventually, you manage to pull out. Whatever it is, it seems your boobginas are shutting shop.");

						output("\n\nThis isn’t the end though. The straining is only intensifying. You can feel something else, something new. There’s something growing inside your [pc.breasts].");

						output("\n\nAt this point, the bittersweet mix of pain and pleasure you’re experiencing is too much. You’re down on the floor, panting and moaning like a whore. You can’t contain yourself anymore, and your hands move on their own volition, reaching for your [pc.breasts]. They are decided and relentless. You can’t control them and they keep groping and molesting your chest, squeezing harder and harder until the pressure is too much to bear and something pops out of your [pc.breasts].");

						dicksproutDickNippleChange();

						output("\n\nWhat did you just do?! This isn’t normal, this... they... they are - your nipples are enormous, and sensitive, and... [pc.dickNipples]! They are [pc.dickNipples], and - FUCK!");

						output("\n\nA glorious, new sensation hits you like a sledgehammer. It’s an orgasm, but it’s all wrong. It’s coming from your chest. You’re boobgasming! It’s too much to bear. One powerful jolt of ecstasy after another pounds your already overstimulated system, nearly driving you insane from the untold pleasure and kicking your body into autopilot.");
					}

					if(kGAMECLASS.pc.hasLipples())
					{
						output("\n\nThere’s this curious feeling coming from your [pc.lipples]. They are sucking on their own, yet there’s nothing that should warrant that kind of response. Out of curiosity, you stick a finger inside one [pc.lipple]. It’s tight, like really tight. Damnit! It almost hurts, and it keeps sucking so hard you’re afraid you’re not gonna get that finger back. It takes some elbow grease, but eventually, you manage to pull out, but not without enticing a sonorous wet pop in the process.");

						output("\n\nWhat the hell is going on? Fuck! You’re so flustered and light-headed right now. It’s debilitating. You can barely think straight and you’re... panting? Why? It feels... Oh! Fuck! It feels so good.");

						output("\n\nYou’re getting a nice blowjob out of the blue, so nice... wait, who? What? The sensation is not coming from your crotch!");
						if (!kGAMECLASS.pc.hasCock()) output(" And why would it? You don’t have a dick down there.");
						if (!kGAMECLASS.pc.hasTailCock()) output(" It's not coming from your [pc.tailCock] either.");
						output("\n\n There where? No way! It’s coming from your [pc.breasts]! Or more accurately, from your [pc.lipples]. This doesn’t make any sense, but fuck, they are so tight and skilled.");

						output("\n\nYou’re so overwhelmed by the delightful sensation, you can’t stand anymore. You find yourself laying on the floor, brought low by the ghost blowjob you’re experiencing. You can’t take this anymore. Your body tenses up and your back arches sharply. You’re cumming!");

						dicksproutDickNippleChange();

						output("\n\nA peculiar orgasm spawns from your chest, rocking your entire body and sending a wave of pure, distilled bliss washing all over your system. At the peak of your fierce orgasm, your hands instinctively go for your breasts, squeezing and groping until something truly bizarre happens: something pops out of your [pc.breasts]. No way... they are [pc.dickNipples]!");
					}

					if (kGAMECLASS.pc.hasFlatNipples() || kGAMECLASS.pc.hasInvertedNipples ())
					{
						output("\n\nYou’re expectant, awaiting for the results to manifest. Yet nothing happens. Your [pc.nipples] remain the same. Now that you notice it, you’re breathing erratically, and faster than ever before. You’re flustered all over and incredibly horny right now. Furthermore, you can finally feel something. It’s a minor tingle coming from your areolas.");

						output("\n\nYou trail your fingers all over your [pc.nipplesNoun] only to be assailed by an intense and pleasurable sensation almost immediately. Fuck! They are so goddamn sensitive right now. The slightest caress has a powerful debilitating effect on you. At this point, you can’t stop yourself. Your body is working on autopilot, rubbing, pinching, squeezing and massaging your [pc.nipples] with reckless abandon.");

						output("\n\nYour hands are fixed on your tender flesh, almost like welded to your [pc.nipples]. You would need a crowbar to keep them away from each other. The sensation is so magnificent you can’t help but agree with your hands. They must keep going.");

						output("\n\nYour furious [pc.nippleNoun] worship is about to reach its peak. You can feel the pressure rising steadily. You’re so close to... something. It’s a peculiar, yet familiar sensation. Fuck! It’s an orgasm. You’re climaxing! No your [pc.breasts] are... boobgasming?! Yes!");

						output("\n\nIt’s a ferocious and mighty peak, as intense as it’s debilitating. Without realizing it, you’ve been moaning and panting like an ausar in heat. You can do nothing but relish in the strong and gratifying sensation you’re experiencing right now. Endorphins flood your hyperstimulated system, triggering a cascade of micro-orgasm one after another, culminating in a powerful, earth-shattering climax.");

						output("\n\nDistracted by the heat of the moment, you barely notice a nub forming on your [pc.nipples]. That wasn’t there before! It seems your " + (kGAMECLASS.pc.hasFlatNipples() ? "flat":"inverted") + " nipples are now plain and simple nipples... No, wait. It’s growing... changing?!");
						dicksproutDickNippleChange();
						output(" That too. The nub if steadily enlarging in both girth and length and reshaping into something entirely different than a nipple... no way... [pc.dicknipples]! You’ve got [pc.dickNipples].");
					} 

					else if (kGAMECLASS.pc.hasNormalNipples())
					{
						output("\n\n You’re already panting, staring at your chest and hoping for the new surge of flesh, yet nothing happens. All you feel is a slight tingle coming from your sensitive nubs. You reach with your index and poke one of your buds with curiosity. Oh, Damn! They are ludicrously sensitive right now. Just that simple brush nearly makes you cum on the spot. You can only wonder... what if...");

						output("\n\nWith a naughty grin in your face, you do something really stupid and pinch hard on the tender flesh of your nipples. It feels like getting struck by lightning; a sharp sensation soon drowned by intense joy. You’re orgasming! Boobgasming?! The feeling is much more powerful than expected. You can help but howl in delight, delivering a mighty cry of pleasure for the entire universe to hear.");

						output("\n\nStunned by your intense orgasm, you barely manage to notice your [pc.nipplesNoun], growing steadily in girth and length, expanding, bigger and longer, reshaping into what you were just expecting: large, throbbing chest-mounted cocks.");

						dicksproutDickNippleChange();
					}

					output("\n\nYour body moves on primal instinct now and your hands latch to your newly-minted [pc.dickNipples] like a lifeboat during a storm and begin zealously jerking them off.");

					output("\n\nYour climax seems unending. Just when you think it’s beginning to run its course, a new orgasm chains right after the previous one, triggering a new growth spurt, soon followed by a new wave of pure bliss invading your already overtaxed nervous system.");

					output("\n\nYou wake up much later feeling awfully sore and sticky. Your own climax knocked you off for who knows how long. You’re laying on the ground, over a puddle of your own [pc.milk]. Did you do that?! Impressive.");

					output("\n\nNow that you take a good look at it, there isn’t much of a change. Is the effect only temporary? Curious about the answer, your rub your [pc.nippleNoun], just to see if there’s anything new. The texture is odd, and it’s much more consistent than before, not to mention much more sensitive.");

					output("\n\nEventually, you touch something unusual. It’s almost like a sheath. It’s faint, but it’s there. This could only mean one thing... You pinch your [pc.nippleNoun] and squeeze hard with your hand, and just as you thought, slowly, but surely, the nub engorges and stiffens, quickly popping out from inside your breast. It’s not a nipple, it’s a [pc.dickNipple]!");

					output("\n\nUh, quite convenient. They retract when not in use. You take a few moments to allow your chestborne breeder to retreat back inside its protective sheath and resume your adventures.");

					output("\n\nIt seems you got just what you wanted, despite ignoring all the warnings.");

					output("\n\n<b>You’ve got dicknipples now.</b>");
					kGAMECLASS.processTime(10 + rand(6));
				}

			kGAMECLASS.pc.orgasm();
			addButton(0, "Next", mainGameMenu, undefined);
		}	

		//Making this a seperate function because it needs to be inserted multiple times for proper parser stuff
		public function dicksproutDickNippleChange():void
		{
			for (var i:int = 0; i < kGAMECLASS.pc.breastRows.length; i++) kGAMECLASS.pc.breastRows[i].nippleType = GLOBAL.NIPPLE_TYPE_DICK;

			kGAMECLASS.pc.dickNippleType = cockCanMatchRace(1);
			if (kGAMECLASS.pc.dickNippleMultiplier < 3) kGAMECLASS.pc.dickNippleMultiplier = 5;
			if (kGAMECLASS.pc.nippleLengthRatio < 3) kGAMECLASS.pc.nippleLengthRatio += 3;
			kGAMECLASS.pc.nippleWidthRatio += 0.05;
		}

		public function dicksproutTail():void
		{
			clearOutput();
			author("Thebiologist");
			clearMenu();

			//Break if tailgenital locked
			if (!kGAMECLASS.pc.tailGenitalUnlocked(1))
			{
				output(kGAMECLASS.pc.tailGenitalLockedMessage());
				output(" What a ripoff.")
				kGAMECLASS.processTime(5);
				mainGameMenu();
				return;
			}

			//Add tailcock flag. Change tail genital race to match if possible. 
			if (kGAMECLASS.pc.hasTails()) output("A wild thought crosses your mind. What if you use Dicksprout on your [pc.tails]? Your [pc.tailNoun] are fun and all, but perhaps they could be enhanced... with a big, fat cock. It’s hard not to fantasize about it; having an extra set of genitalia available and ready for action, mounted on your [pc.tailNoun].");
			else output("A wild thought crosses your mind. What if you use Dicksprout on your [pc.tails]? Your [pc.tailNoun] is fun and all, but perhaps it could be enhanced... with a big, fat cock. It’s hard not to fantasize about it; having an extra set of genitalia available and ready for action, mounted on your [pc.tailNoun].");

			output("\n\nWithout giving your brain enough time to second guess itself, you quickly pop the injector’s plastic cap, slap the rubbery tip against your [pc.tailNoun] and press the flashy, big red button");
			if (kGAMECLASS.pc.hasTails()) output(" , then repeat the process with " + (kGAMECLASS.pc.tailCount > 2 ? "the rest of your [pc.tails":"your other one"));
			output(".\n\nA few minutes pass, but nothing happens. Perhaps it doesn’t work like that. All you feel is an annoying tingling sensation. You decide to run your hands along the length of your [pc.tails] to try and feel if something has changed or, at the very least, try to soothe the itch that bothers you to no end.");

			output("\n\nOther than an increase in overall sensitivity, there doesn’t seem to be any new changes. That is until your finger reaches the tip of your [pc.tailNoun]. It’s subtle and barely noticeable at all, but it feels like a slit. You poke and probe at your new anatomy with your index only for it to slip inside, startling you for a second.");

			kGAMECLASS.pc.addTailFlag(GLOBAL.FLAG_TAILCOCK);
			kGAMECLASS.pc.tailGenital = GLOBAL.TAIL_GENITAL_COCK;
			kGAMECLASS.pc.tailGenitalArg = cockCanMatchRace(2);

			output("\n\nThe sensation is... bizarre, but somewhat familiar. Intrigued about what you might find, you continue pushing your digit inside the opening until it collides with something squishy. It feels odd but slightly pleasant. So, you keep rubbing and feeling with your finger until suddenly, the squishy thing begins moving forwards, pushing your index out and away from its burrow. Then, you finally see it, sliding out from is protective folds. It’s a [pc.tailCockNoun]! A large, towering shaft, and it’s dangling from the very tip of your [pc.tailNoun]; already hard from your accidental stimulation.");

			output("\n\nIt worked! Just like you wanted. Now it’s time... to... so big... return... Wha- focus! It would feel so good between your fingers. Damnit!");

			output("\n\nLike a moth to a flame, you’re unable to help yourself. Your gaze is fixed on your new dangling appendage. It calls to you; throbbing, dripping, swinging like a clock’s pendulum. You can’t stand this level of teasing.");

			output("\n\nFocus! No... You can’t. The alluring, dangling siren is singing, and you can’t resist the temptation anymore. The eagerness in your face says it all. You’re already licking your lips with anticipation as your hands reach for the new addition to your body.");

			output("\n\nThere’s no mercy and no foreplay. Once your greedy fingers grab hold of your [pc.tailCock], franctic debauchery ensures: a desperate masturbatory session. With zealous dedication, both your hands worship your new appendage, polishing its entire length, massaging and stroking it from base to [pc.tailCockHead], making sure not a single square inch of cockflesh is left unexplored.");

			output("\n\nWave after wave of glorious pleasure emanates from your [pc.tailCock] like the mythical fountain of youth. The whole experience feels surreal. All your senses are unnaturally heightened right now, making the amount of pleasure drawn from the mere brush of flesh against flesh feel divine.");

			output("\n\nIn your hypersensitive state, mere seconds is all that’s needed. As vigorous as it was, your furious self-loving is short lived as well.");

			output("\n\nAs intense as it’s delightful, your climax finally hits you with the power of a supernova. Burning bright but quickly. A powerful burst of concentrated bliss and joy make their way from your [pc.tailCock] traveling up your spine and wreaking havoc on every single pleasure receptor of your body until it finally smashes into your brain like a sledgehammer, threatening to knock you out with its fierce peak.");

			output("\n\nWith perfect timing, your [pc.tailCock] " + (kGAMECLASS.pc.hasTails() ? "s erupt":"erupt") + " with the fury of a pent up volcano, spraying wildly in every direction, bathing you and your immediate vicinity with a thin layer of [pc.cum].");

			output("\n\nExhausted and... sticky, you take a breather, resting for a few minutes before leaping back into action.");

			kGAMECLASS.pc.orgasm();
			kGAMECLASS.processTime(10 + rand(6));
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}

		public function dicksproutPutAway():void
		{
			clearOutput();
			clearMenu();
			output("Now is not the time to use that. You stash the item back inside its box and then inside your inventory.\n\n");
			kGAMECLASS.processTime(2);
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new Dicksprout()]);
			addButton(0,"Next",kGAMECLASS.mainGameMenu);
		}

		//For the body part in question, checks to see if there's a race specific cock type (0 regular cock, 1 dick nipples, 2 tail cock)
		public function cockCanMatchRace(typeOfCock:int = 0):int
		{
			var i:int = 0;
			//Clean up our race string so we can use it for sorting
			var race:String = kGAMECLASS.pc.race();
			//Remove "half-"
			var surplus:String = race.substr(0, 5);
			if (surplus == "half-") race = race.substr(5);
			//Remove "-morph"
			surplus = race.substr(-6);
			if (surplus == "-morph") race = race.substr(0, (race.length - 6));
			//Capitalize so it'll properly match GLOBAL.TYPE names
			race = StringUtil.capitalize(race);
			
			//For regular cocks
			if (typeOfCock == 0) for (i; i < GLOBAL.VALID_COCK_TYPES.length; i++)
			{
				if (race == GLOBAL.TYPE_NAMES[GLOBAL.VALID_COCK_TYPES[i]]) return GLOBAL.VALID_COCK_TYPES[i];
			}
			
			//For dicknipples
			else if (typeOfCock == 1) for (i; i < GLOBAL.VALID_DICKNIPPLE_TYPES.length; i++)
			{
				if (race == GLOBAL.TYPE_NAMES[GLOBAL.VALID_DICKNIPPLE_TYPES[i]]) return GLOBAL.VALID_DICKNIPPLE_TYPES[i];
			}
			
			//For tail cocks
			else for (i; i < GLOBAL.VALID_TAIL_GENITAL_ARGS.length; i++)
			{
				if (race == GLOBAL.TYPE_NAMES[GLOBAL.VALID_TAIL_GENITAL_ARGS[i]]) return GLOBAL.VALID_TAIL_GENITAL_ARGS[i];
			}
			
			return 0;
		}

		public function cumCanMatchRace():int
		{
			//Clean up our race string so we can use it for sorting
			var race:String = kGAMECLASS.pc.race();
			//Remove "half-"
			var surplus:String = race.substr(0, 5);
			if (surplus == "half-") race = race.substr(5);
			//Remove "-morph"
			surplus = race.substr(-6);
			if (surplus == "-morph") race = race.substr(0, (race.length - 6));

			if (race == "sydian") return GLOBAL.FLUID_TYPE_SYDIAN_CUM;
			if (race == "gabilani") return GLOBAL.FLUID_TYPE_GABILANI_CUM;
			if (race == "nyrea") return GLOBAL.FLUID_TYPE_NYREA_CUM;
			if (race == "goo") return GLOBAL.FLUID_TYPE_SPECIAL_GOO;
			if (race == "hrad") return GLOBAL.FLUID_TYPE_HRAD_CUM;
			if (race == "vanae") return GLOBAL.FLUID_TYPE_VANAE_CUM;
			if (race == "cockvine" || race == "dryad" || race == "treant" || race == "plant") return GLOBAL.FLUID_TYPE_FRUIT_CUM;
			
			return -1;
		}
	}
}
