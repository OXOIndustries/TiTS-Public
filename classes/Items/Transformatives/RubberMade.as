package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Engine.Interfaces.AddLogEvent;
	
	public class RubberMade extends ItemSlotClass
	{
		
		//constructor
		public function RubberMade()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "R.Made";
			longName = "Rubber-Made";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a piece of gum labeled “Rubber-Made”";
			tooltip = "A small piece of gum, roughly the size of a thumbnail. One side of the green and purple wrapper depicts a happy customer blowing a bubble with the gum. The other side is a small but strongly worded caution not to swallow the gum.\n\n<b>Known to cause moderate amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 1000;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var pc:Creature = target;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			kGAMECLASS.clearOutput();
			author("Adjatha");
			
			if(target is PlayerCharacter)
			{
				if((pc.isBimbo() || pc.isBro()) && (pc.IQ() < 95 || rand(2) == 0))
				{
					// If a player with bimbo brains tries to use Rubber-Made, they receive the following warning
					output("You playfully turn the funny gum in your fingers, admiring the shiny, striped packaging. There’s some kind of writing on one side, but it seems boring. Something about eating the gum. That’d be kinda icky! Doesn’t that stuff stay in your stomach forever? You’re pretty sure you heard that somewhere before.");
					output("\n\nWould you like to chew the gum anyway?");
					clearMenu();
					addButton(0,"Put It Away",putAwayRubberMade);
					addButton(1,"Blow Bubbles!",blowBubsBadEnd, pc);
					return true;
				}
				pc.taint(2);
				pc.libido(1);
				//First Time
				if(kGAMECLASS.flags["RUBBER_MADED"] == undefined)
				{
					output("Pulling the colorful wrapper away, you clutch the small, cream-colored resin between your fingers, turning it over cautiously. It is a small thing, easily squished but bouncing more or less back into its original shape immediately. Doubtfully, you pop the piece of gum into your mouth and begin chewing. Oddly, it tastes like cherries.\n\nYour mouth waters the longer you chew and gradually the gummy block begins to grow softer and less elastic. As the cherry flavoring begins to fade, you push the waxy substance against the back of your teeth with your [pc.tongue] until it forms a thin plaster. Opening your [pc.lips] slightly, you begin to blow, your breath pushing the pale white gum outward in a small bubble. With each puff, the bubble grows larger, until it even dwarfs your head.");
					output("\n\nThe pasty bubble thins as it grows and emits a slight keening sound as it is put under unsustainable tension. You give it one more puff and the bubble pops with an audible clap. The gooey gunk splatters all over your face and neck, the moisture warm and slimy. What a mess!");
					// if the player has non-latex hair, they gain latex hair. The player gains a rank of Latex Skin
					kGAMECLASS.flags["RUBBER_MADED"] = 1;
				}
				//Repeat
				else
				{
					output("You pop another stick of Rubber-Made into your mouth and wetly chew away. Smacking your lips as you nibble and munch on the sticky gum, your cheeks slowly fill with saliva that threatens to run out of your mouth. You try chewing with your mouth closed, but your jaw quickly becomes fatigued and you simply have to accept a little drool as the gooey treat is chomped to elasticity. When the flavor fades, you blow another bubble, fingertips playing along its straining latex surface as it fills and fills. Then, with cherry saliva dripping over your [pc.lips], you give one more puff to pop the rubber goo all over your body.");
					// if the player has non-latex hair, they gain latex hair. The player gains a rank of Latex Skin
				}
				//Hair
				if(pc.hairLength >= 3 && !pc.hasStatusEffect("Latex Hair"))
				{
					output("\n\nYour fingers run over sticky goop in your hair, despairing at the thought of trying to get it out. As your pull them back, blobs of gooey latex form loose webs from your hand to your head. The longer you look at the drooping slime, however, the thicker it gets, as if growing. You shake off the muck and pat up and down your [pc.hairsDescript]. The [pc.hair] seems almost entirely covered by the thin putty of your bubblegum, rapidly cooling in a glistening sheath. Your hand comes away dry and you shake your head at the added weight of your freshly lacquered mane.");
					pc.createStatusEffect("Latex Hair");
					output("\n\n<b>You have latex hair!</b>");
					// player gains the Latex Hair trait
				}
				//Skin
				if(pc.skinType != GLOBAL.SKIN_TYPE_LATEX || !pc.hasStatusEffect("Latex Skin"))
				{
					output("\n\nFlinching at the pop, you clasp your goo-soaked face and wipe the slime off with your palms. Blinking and flushed, you almost don’t notice that the liquid latex on your hands seems to be spreading. It drips down your wrists and over your forearms. You try to touch the slimy seam, but your fingertips have already been covered and it’s impossible to get a firm grip on the oozing membrane. The resin sheath flows over your [pc.skinFurScales] and under your [pc.clothes], sheathing your body in a seamless, glistening rubber coating no thicker than a layer of body oil.");
					output("\n\nYou’d almost believe the gum had simply vanished into your skin, but when you rub a finger along your cheek, the rude rubber squeak tells you that the latex is permanent. Surprisingly, your sensitivity hasn’t been impaired by the second skin. Touching your pliant, plastic skin confirms that you can feel with surprisingly improved acuteness. <b>You now have rubber skin.</b>");
					// if the player had fur, they lose it. Tail descriptors also gain the latex descriptors
					pc.skinType = GLOBAL.SKIN_TYPE_LATEX;
					pc.clearSkinFlags();
					pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
					//Clear out old latex skin rank counter if PC reset his skin
					pc.removeStatusEffect("Latex Skin");
					//Latex skin ranks counter!
					pc.createStatusEffect("Latex Skin",1,0,0,0);
					// Libido increases by 1-3 points and player gains the Latex Skin trait
					pc.libido(1+rand(3));
				}
				//If Skin is already Latex
				else if(pc.statusEffectv1("Latex Skin") < 3)
				{
					output("\n\nA fresh coating of Rubber-Made gum spreads over your shiny body, adding a little extra to the latex second skin. Your body feels warm as the goo settles over your glistening skin, thickening the sheath almost imperceptibly. Drawing a palm down your throat, over your [pc.chest] and across your [pc.hips] pulls a shuddering moan from your lips that leaves you feeling cheap and easy. Given that your body is increasingly looking like a sex doll, it’s no wonder you’re feeling a little vulgar. You take a deep breath to calm yourself, but it doesn’t work.");
					// Player’s lust increases by 5-10 points and they gain a rank in Latex Skin
					pc.changeLust(5+rand(6));
					pc.addStatusValue("Latex Skin",1,1);
				}
				//3+ ranks in Latex Skin
				else if(!pc.hasPerk("Black Latex"))
				{
					var i:int = 0;
					
					output("\n\nThe latest addition to your glistening latex body spreads over you with customary heat. It seems to be going slower than the others, giving you a chance to really enjoy the experience. Your squeaking sheath ripples with the acceleration of your heart beat");
					if(!pc.isNude()) output(" and it’s all you can do to keep from stripping here and now");
					output(". Discretely, you move your fingertips up and down your tender frame, groping yourself ");
					if(!pc.isNude()) output(" through your [pc.clothes]");
					output(" as vigorously as your dare. Your body heat rises precipitously, fingers tweaking your [pc.nipples] and stroking against your [pc.crotch].");
					output("\n\nThe liquid latex seems to respond to your impassioned seething, the normally translucent shell darkening before fading to an absolute blackness as dark as space itself. You’d panic, but the feel of this new, jet-black coating is a fresh ecstasy that catches the breath in your throat. Wherever the black latex flows, your skin shudders with bliss. It flows over your [pc.chest] and your heart flutters with suffocating heat. It drips down your [pc.hips] and your back arches in clenching delight.");
					output("\n\nWhen it seeps across your [pc.crotch], a ragged moan tears itself from your hushed lips.");
					if(pc.hasCock() && !pc.isNude()) output(" The latex coats your [pc.cocks], already stiff from your earlier caresses. Hips bucking slightly, spurts of [pc.cum] begin filling your [pc.clothes] and dripping down your [pc.legOrLegs].");
					//if cock & naked:
					else if(pc.hasCock()) output(" The latex coats your [pc.cocks], already stiff from your earlier caresses. Hips bucking slightly, ropes of [pc.cum] begin spurting wildly into the air, your freshly glistening, black latex member releasing [pc.cumColor] streams of hot seed with alarming ease.");
					if(pc.hasVagina()) output(" The gushing resin floods your inner recesses, coating the walls of your [pc.vaginas] with a lip-biting fervor that leaves your fingers trembling and your jet-black skin prickling.");
					output(" The feeling of utter encasement is too much, and you sink to the ground, shivers of too-tender delight swimming through your body.");
					if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC)) output("\n\nThe sudden feeling of shocked and lustful eyes on you rouses you from your reverie. Slowly rising from the ground, you try to maintain as much dignity as you can muster. As you move on, you realize that a moaning squeak accompanies your every step. You don’t have a mirror close at hand, but you realize that with the fresh lacquer, you must look like a black rubber fuckdoll. Putting an embarrassed urgency in your steps, you find a little privacy and try to clean up as best you can.");
					// Gives player "Black Latex" condition, increasing minimum lust by 10 but making their attempts to escape grapples or constricts far more successful
					pc.createPerk("Black Latex",0,0,0,0,"Gives you delightful latex skin, but keeps you slightly more aroused at all times.");
					output("\n\n(<b>Perk Gained: Black Latex</b> - Your skin is now hyper-sensitive latex, keeping you constantly at least a little aroused.)");
					pc.skinTone = "black";
					if(pc.hasCock())
					{
						for(i = 0; i < pc.cocks.length; i++)
						{
							pc.cocks[i].cockColor = "black";
						}
					}
					if(pc.hasVagina())
					{
						for(i = 0; i < pc.vaginas.length; i++)
						{
							pc.vaginas[i].vaginaColor = "black";
						}
					}
					if(pc.taint() >= 33)
					{
						pc.removeSkinFlag(GLOBAL.FLAG_FURRED);
						pc.removeSkinFlag(GLOBAL.FLAG_FLUFFY);
						pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
						pc.removeTongueFlag(GLOBAL.FLAG_FURRED);
						pc.removeTongueFlag(GLOBAL.FLAG_FLUFFY);
						pc.addTongueFlag(GLOBAL.FLAG_SMOOTH);
						pc.removeArmFlag(GLOBAL.FLAG_FURRED);
						pc.removeArmFlag(GLOBAL.FLAG_FLUFFY);
						pc.addArmFlag(GLOBAL.FLAG_SMOOTH);
						pc.removeLegFlag(GLOBAL.FLAG_FURRED);
						pc.removeLegFlag(GLOBAL.FLAG_FLUFFY);
						pc.addLegFlag(GLOBAL.FLAG_SMOOTH);
						pc.removeTailFlag(GLOBAL.FLAG_FURRED);
						pc.removeTailFlag(GLOBAL.FLAG_FLUFFY);
						pc.addTailFlag(GLOBAL.FLAG_SMOOTH);
					}
					pc.orgasm();
				}
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " eats the candy to no effect.");
			}
			return false;
		}
		public function putAwayRubberMade():void
		{
			clearOutput();
			author("Adjatha");
			output("Nah, you decide, chewing gum’s a bad habit anyway. Plus, you don’t wanna fill your mouth just in case somebody tasty happens to walk by. Ooo, wouldn’t that be fun? You plop the wrapped square back in your pocket, mouth watering even without the candy.");
			output("\n\n");
			
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new RubberMade()]);
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		public function blowBubsBadEnd(target:Creature):void
		{
			clearOutput();
			author("Adjatha");
			output("It’s fine, you figure, rules were made to be broken! You pop the gum past your [pc.lips] and onto your [pc.tongue]. See, no problems at all! You start chewing away, opening your mouth with every chomping motion. Noisily smacking away at the gum, you begin blowing little bubbles. You bite down and pull the elastic treat back into your mouth each time, before the bubble can pop, a simple smile on your face.");
			//if the player is in a public place:
			if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC)) 
			{
				output("\n\nThe people around you glance your way, annoyed expressions on their faces. What’s their problem, you wonder as you continue your noisome munching. ");
				if(target.isBimbo()) output("<i>“Um, like, take a holo vid? It’ll last longer,”</i> you offer, between your wet munching.");
				//bro: 
				else output("<i>“What’s up?”</i> you shout in defiance. <i>“You want to get that ass kicked, bro? Bring it!”</i>");
				output(" Your lookie-loos go back to minding their own business and you congratulate yourself by smacking your gum extra loudly with a satisfied grin. Tch, it’s like they don’t even know how important you are. Once you get your daddy’s money, everybody’s gonna know how totally boss you are.");
			}
			output("\n\nAs you nibble and play with the gum, your mind wanders. If one of those raccoon guys made booze instead of cum in his nuts, he’d probably get crazy rich. Chew chew blow swallow. Who’d win in a fight between the ant girls and the bee guys? And which honey is sweeter? Chew chew blow swallow. If I had a cock for a tongue, would it be like I’m always giving myself a blowjob? Chew chew blow swallow. After pondering all these weighty questions, your head starts to hurt. <i>“Philosophy is hard work,”</i> you remark to no one in particular. <i>“I should go find a hot piece of ass,”</i> you decide, your mental equilibrium settling on more familiar ground. <i>“Oh gross, the gum’s flavor is gone.”</i> Chew chew blow swallow GULP.");
			output("\n\nYou start off to find a quick fuck but before you’ve taken three steps, your stomach grumbles. You pause and look down, as if to glare at the noisy organ. <i>“Weird. It tastes like cherries again.”</i> ");
			if(target.isBimbo()) output("You let out a small, cute burp, covering your mouth with your hand in surprise.");
			else output("Your body rocks as a tremendous belch surges from your gut, nearly bringing tears to your eyes.");
			output(" Woah. What was that? Poking your belly, you can feel the gurgling unrest within as the gum reacts poorly to your stomach acids. Maybe you should get something to settle your stomach?");
			output("\n\nTaking another step, you’re brought up short again as a hiccup bubbles up your spine. Hic! Ugh, that’s all you need. Hic! What was supposed to cure hiccups? Hic! Drinking cum upside down? Hic! Surprise anal? Hic! Maybe a nursedroid has can fix it? Hic! Hic! Hic! Your shoulders and chest begin to ache from the muscle spasms, the cherry flavor in your mouth growing ever more acute.");
			
			kGAMECLASS.processTime(30 + rand(21));
			target.taint(4);
			
			clearMenu();
			addButton(0,"Next",bubbleYumsBadEnd2, target);

		}
		public function bubbleYumsBadEnd2(target:Creature):void
		{
			clearOutput();
			author("Adjatha");
			output("When you hiccup next, a small black bubble pops from your [pc.lips]. What...? Another hiccup brings another bubble and you notice with disgust that the pop leaves a wet, inky foam on your mouth. You wipe the slime away and purse your [pc.lips], staring down the bridge of your nose to see if you got everything. Seeing that a sable stain seems to be setting into your skin like black lipstick, you form your mouth into an open O and rub one of your fingers over the pliant pucker, trying to wipe off the discoloration.");
			output("\n\nAnother hiccup catches your finger, covering the digit in the same black froth as on your lips. You try to wipe it off with your other hand, but it just seems to spread the sticky, slimy goo. Gross! Your fitful hacking starts splattering sooty sludge on the ground, oozing trails of onyx fluid drooling from your weirdly stiff lips. Shoot! If this keeps up, you’re going to ruin your [pc.clothes]! Thinking quickly, you strip down to your [pc.skinFurScales], carefully setting your belongings off to one side so they don’t stain from the totally uncool goop.");
			output("\n\nYou try to say <i>“cut it out,”</i> to your stomach, but the words come out as <i>“hut hnn hoough”</i> and your brow furrows. Poking your lips again, you find that they’ve lost the soft, yielding texture of normal skin. It seems your mouth has been frozen in a perpetual O-shape of solid latex. <i>“Huugh?”</i> you ask no one as your belly gurgles audibly. The churning percolations seems to start flowing downward, your gut rumbling as the weird, cherry-flavored warmth spreads through your body.");
			output("\n\nBalling your hands into tight fists of annoyance, you resolve to set out and look for a nursedroid. Despite the intoxicating fizzing that seems to be going right to your brain, this bubblegum sucks and you want it out of you right now. You reach over for your CODEX to punch up the nearest location of a hospital, but as you uncurl your hands, you find that all of your fingers have been sealed together in a pair of taut, latex mittens. Flexing your sealed hands, you finally notice that the goo you got on them earlier is growing and spreading. It’s already reached your elbows and shows no signs of stopping.");
			
			kGAMECLASS.processTime(15 + rand(3));
			target.lipColor = "black";
			if(target.lipMod < 7) target.lipMod = 7;
			target.taint(8);
			
			clearMenu();
			addButton(0,"Next",bubbleYumsBadEnd3, target);
		}
		public function bubbleYumsBadEnd3(target:Creature):void
		{
			clearOutput();
			author("Adjatha");
			output("Forgetting about the CODEX, you start to run, but a fierce series of hiccup knocks you to the ground, panting and trying to recover from the spasm. As you gasp, you notice another gummy bubble has formed at your lips. You try to swallow it, but your lips won’t respond. Every breath you take makes the bubble grow larger, swelling from fist-size to head-size in a few seconds. You try to pop it with your latex hands, but you have no sharp points on the sealed limbs and you can’t seem to get a grip on the weirdly thick ball.");
			output("\n\nThe bubblegum balloons still larger and the fire in your chest makes it difficult to think as your body begins to throb with some totally inappropriate needs. ");
			if(target.hasCock())
			{
				output("Your [pc.cocks] surge");
				if(target.cockTotal() == 1) output("s");
				output(" to attention, tender [pc.skinFurScales] aching for attention. ");
			}
			if(target.hasVagina()) output(" [pc.EachVagina] between your [pc.legs] drools in swollen eagerness. ");
			output("Stupid body, you silently berate yourself, trying not to indulge your easily addled [pc.crotch]. Well... maybe one touch wouldn’t hurt, you absently rationalize. It’ll, like, help me think of a way out of this probably. Reaching down and gingerly touching your [pc.crotch] with an acrylic hand, you’re rewarded with a soothing relief that spreads through your body like ice cubes running down your back.");
			output("\n\nAhhh, you sigh into the billowing bubble bouncing before your blissful face. Although you lack the individual fingers to best please yourself, your mitten hands do the job just as well, stroking over-sensitive flesh with an inattentive dreaminess that should be out of place for someone in your situation. More scatterbrained than ever, you keep pumping away even after noticing that the liquid rubber that’s sealed your arms all the way to the shoulder has now begun to cover your crotch, spreading black, oily resin over your [pc.crotch]. Although it hardens and firms up your body, you are, if anything more receptive. Even just touching your peak is enough to bring you to climax, your body writhing on the ground.");
			output("\n\nMoaning between hiccups, you touch yourself again with the same result: instantaneous orgasm. Well hey, maybe this goo isn’t so bad, you ponder, riding the nectar waves of liquid bliss that flow through your veins. The bubble billowing from your mouth has grown as large as your entire body, so thin that it’s nearly translucent. Touching yourself for a third and fourth and fifth orgasm, your lust-drunk mind absently wonders what will happen when the bubble goes...");
			output("\n\nPOP!");
			output("\n\nThe glossy, plastic film erupts and splashes back onto you in a latex coating that coats you stem to stern. Your [pc.hair] is a solid mass of glistening ebony rubber, while your [pc.skinFurScales] is completely lost under the supple, starless varnish. You spread your limbs, trying to take stock of the coating, but your body is sluggish and unresponsive. The resin encasing you dries and hardens even as you can feel the gum coating your inside do the same. You wiggle, emitting a little squeaking sound, but find that you simply can’t move. Uh oh.");
			
			kGAMECLASS.processTime(25 + rand(3));
			var i:int = 0;
			if(target.hasCock())
			{
				for(i = 0; i < target.cocks.length; i++)
				{
					target.cocks[i].cockColor = "black";
				}
			}
			if(target.hasVagina())
			{
				for(i = 0; i < target.vaginas.length; i++)
				{
					target.vaginas[i].vaginaColor = "black";
				}
			}
			for(i = 0; i < 5; i++)
			{
				target.orgasm();
			}
			target.createStatusEffect("Latex Hair");
			target.hairColor = "black";
			target.skinTone = "black";
			target.skinType = GLOBAL.SKIN_TYPE_LATEX;
			target.clearSkinFlags();
			target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
			target.taint(8);
			if(target.taint() >= 33)
			{
				target.removeTongueFlag(GLOBAL.FLAG_FURRED);
				target.removeTongueFlag(GLOBAL.FLAG_FLUFFY);
				target.addTongueFlag(GLOBAL.FLAG_SMOOTH);
				target.removeArmFlag(GLOBAL.FLAG_FURRED);
				target.removeArmFlag(GLOBAL.FLAG_FLUFFY);
				target.addArmFlag(GLOBAL.FLAG_SMOOTH);
				target.removeLegFlag(GLOBAL.FLAG_FURRED);
				target.removeLegFlag(GLOBAL.FLAG_FLUFFY);
				target.addLegFlag(GLOBAL.FLAG_SMOOTH);
				target.removeTailFlag(GLOBAL.FLAG_FURRED);
				target.removeTailFlag(GLOBAL.FLAG_FLUFFY);
				target.addTailFlag(GLOBAL.FLAG_SMOOTH);
			}
			
			clearMenu();
			addButton(0,"Next",bubbleYumsBadEnd4, target);
		}
		public function bubbleYumsBadEnd4(target:Creature):void
		{
			kGAMECLASS.currentLocation = "GAME OVER";
			kGAMECLASS.generateMap();
			kGAMECLASS.showLocationName();
			
			clearOutput();
			author("Adjatha");
			kGAMECLASS.showRival();
			output("When somebody first found you, they mistook you for a lost sex doll. They took you home, cleaned you up, and spent a few weeks playing with every inch of your latex-bound body. Despite the often vigorous activities, you found it impossible to cum, always reaching the peak of climax but never experiencing any kind of release or relief. The delight and frustration built until your already weakened mind fell into a panting, shameless need.");
			output("\n\nWhen your owner got tired of you, they sold you to a sex shop. The owner must follow the extranet news, because he seemed to recognize the fact that his new doll more or less matched the description of the missing corporate magnate. In a perverse sense of class equality, he bought a second hand suit that he forced your squeaking rubber body into and set you out back in an alley, with a chained collar to make sure nobody carried you off. He left a little sign right where you could see that read: <i>“Fuck a rich heir " + target.mf("","ess") + " for free!”</i>");
			output("\n\nThe free sex doll quickly became a favorite spot for the poor - often several at once - using every hole on your latex body until spunk oozed off your glistening, black-varnished skin in thick, slimy cascades. With every new master, your mind slipped a bit further and your climax came just a little closer. Gradually, you grew so excited for more use that you managed to wiggle enough to make happy little squeaking noises. Unfortunately, the rumor that the back alley sex doll had come to life dissuaded your regulars from returning.");
			output("\n\nThe owner of the sex store tossed you into a closet with a variety of unmovable merchandise, but took small pity on you. He left a couple of vibrators inside you to keep you company. Time passed as you edged closer and closer to climax until, finally, the closet opened again and you found yourself looking at your cousin, [rival.name], directly in the eyes. [rival.HeShe] smiles wickedly, paying the owner of the sex shop ten times what he was asking, and ordering her");
			if(kGAMECLASS.flags["BEAT_TAIVRA_TIMESTAMP"] == undefined) output(" huge, ausar");
			else if(kGAMECLASS.flags["FERUZE_ZHENG_OUTCOME"] != undefined) output(" sexy, suula");
			output(" bodyguard to carry you back to [rival.hisHer] ship.");
			output("\n\n<i>“Well, [pc.name], I’d like to say I’m surprised to see you again. But, honestly, I think we all knew you’d end up like this sooner or later. But don’t worry, I’m not going to shut you up in a closet. Nah, I think it’d be so much more fun to have you right by my side as I claim your father’s inheritance. His only " + target.mf("son","daughter") + ", reduced to a dumb fuckdoll.”</i> [rival.HeShe] squeezes you in a tight, mockingly affectionate hug.");
			
			kGAMECLASS.days += ((7 * 3) + rand(5));
			kGAMECLASS.hours = rand(24);
			kGAMECLASS.processTime(rand(60));
			target.maxOutLust();
			target.willpower(-50);
			target.taint(12);
			
			if(!target.hasGenitals()) kGAMECLASS.badEnd();
			else
			{
				clearMenu();
				addButton(0,"Next",bubbleYumsBadEnd5, target);
			}
		}
		public function bubbleYumsBadEnd5(target:Creature):void
		{
			clearOutput();
			author("Adjatha");
			kGAMECLASS.showRival();
			output("The pressure of the embrace draws a wheezing squeak from your happy, O-shaped mouth and your latex-sheathed [pc.crotch] begins to leak with your long-delayed orgasm. <i>“Hrm? What’s this?”</i> [rival.name] ponders, noticing the thin, crystal liquid leaking from your body. Leaning in, [rival.heShe] wipes a finger across your fluid and raises it to [rival.hisHer] nose, sniffing curiously. <i>“Is this...?”</i> [rival.heShe] brings it to [rival.hisHer] mouth and licks curiously.");
			output("\n\nAs if a dam bursting from torrential pressure, your months of edging nearer and nearer to a monumental climax are released in one gushing geyser. ");
			if(target.hasVagina()) output("[pc.EachVagina] shudders, spraying [pc.girlCum] in a squirting symphony of blissful release. ");
			//cocks: 
			if(target.hasCock())
			{
				output("Your [pc.cocks] throb");
				if(target.cockTotal() == 1) output("s");
				output(" with the weight of your heavy, thick cum pumping to the latex [pc.cockHead] and lancing out like a pressurized fountain.");
			}
			output(" The fluid salvo hits [rival.name] square in the face, spoiling your cousin’s moment of triumph with the shocking indiginity of your dripping discharge. <i>“Oh, you stupid " + target.mf("basterd","bitch") + "! Petty to the end!”</i> [rival.heShe] curses, wiping the slimy spoo from [rival.hisHer] face.");
			output("\n\n<i>“Ugh, this is really sticky,”</i> [rival.heShe] mutters, flexing the web of gelling goo between [rival.hisHer] fingers as [rival.heShe] tries to clean herself. The spunky nectar grows more elastic with each passing moment, until [rival.name] finds [rival.heShe] can’t seperate [rival.hisHer] fingers anymore. With the digits on both [rival.hisHer] hands glued together by a transparent varnish, your cousin’s annoyed confusion quickly becomes rage. <i>“What is this, you little shit?”</i> [rival.heShe] grabs your glistening shoulders with [rival.hisHer] rubber-bound hands and shakes you violently, [rival.hisHer] face inches from yours.");
			output("\n\nHic!");
			output("\n\nThe last burping hiccup fluttering in your belly finally finds its way up, a bubble of black, liquid rubber forming on your lips and popping right in [rival.name]’s face. [rival.HeShe] hacks and tries to claw it away, but it spreads and hardens almost immediately, sealing [rival.hisHer] mouth closed. The ebony sludge creeps over [rival.hisHer] body, the acids from your stomach melting away [rival.hisHer] clothing until [rival.heShe]’s just as naked as you are. Eyes wide and panicking, your silenced cousin tries to call for help but can produce only a lewd, squeaking as the resin encases [rival.himHer] as firmly as it does you.");
			output("\n\nAfter a minute, the struggling is over. Your cousin sits, naked and lacquered, [rival.hisHer] grand schemes lost to one latex burp. You can see [rival.himHer] slightly wiggling, [rival.hisHer] body no doubt right on the cusp of a climax it can’t quite achieve. Frankly, you could care less. You continue to orgasm, fluid pumping from your Rubber-Made body with the joy of well-rewarded patience.");
			
			kGAMECLASS.processTime(15 + rand(6));
			for(var i:int = 0; i < 9; i++)
			{
				target.orgasm();
			}
			
			//BAD END.
			kGAMECLASS.badEnd();
		}
		
		// Latex Regrow
		public static function latexRegrow(maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
		{
			if(target.skinType != GLOBAL.SKIN_TYPE_LATEX)
			{
				var oldSkinType:Number = target.skinType;
				var oldSkinFlags:Array = target.skinFlags;
				
				if(target is PlayerCharacter) AddLogEvent(ParseText("You feel the need to stretch and proceed to do so, raising your [pc.arms] high into the air and extending your back. Yes, that feel <i>so</i> goo--<i>Squeeeeaak!</i>\n\nBreaking through your thoughts, the loud, rubbery noise catches your attention. " + (target.isBimbo() ? "<i>Ooo</i>" : "Strange") + ". Rubbing your elbows against your ribs produces more squeaky noises. You flip open your codex and take a good look at your reflection. As glossy as ever, <b>your skin seems to have re-adopted its natural latex properties</b>." + (target.isBimbo() ? " Nothing’s gonna to stop you from being, like, a totally hot sex doll!" : "")), "passive", maxEffectLength);
				
				target.skinType = GLOBAL.SKIN_TYPE_LATEX;
				target.clearSkinFlags();
				target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
				if(InCollection(GLOBAL.FLAG_THICK, oldSkinFlags)) target.addSkinFlag(GLOBAL.FLAG_THICK);
				if(InCollection(GLOBAL.FLAG_LUBRICATED, oldSkinFlags)) target.addSkinFlag(GLOBAL.FLAG_LUBRICATED);
				if(oldSkinType == GLOBAL.SKIN_TYPE_GOO || InCollection(GLOBAL.FLAG_GOOEY, oldSkinFlags)) target.addSkinFlag(GLOBAL.FLAG_GOOEY);
			}
		}
	}
}
