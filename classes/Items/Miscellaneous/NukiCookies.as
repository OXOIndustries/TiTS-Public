package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class NukiCookies extends ItemSlotClass
	{
		
		//constructor
		public function NukiCookies()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "Nuki C.";
			
			//Regular name
			this.longName = "packet of 'nuki cookies";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a packet of 'nuki cookies";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Sometimes called tanuki treats, ‘Nuki Cookies were created shortly after kui-tan joined the UGC. Xenogen Biotech used the new aliens’ genetic structures to improve upon primitive body modifications oft used by terran furries. The resulting product became a popular choice for kui-tan wishing to recover from mutations as well as thrill-seeking body-modders.\n\nThey appear as a pair of cookies wrapped in clear cellophane, far more palatable than a pill or a medipen. The boys in the lab must have agonized over how to package gene-weaving microsurgeons into tasty chocolate. Mmmm... chocolate.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 600;
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
			var choices:Array = new Array();
			var x:int = 0;
			var pc:Creature = target;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.output("You rip open the packet and look over the cookies. They seem normal enough, smell normal enough, and... taste normal enough. You go ahead and wolf the second one down before you change your mind.");
				var TFed:Boolean = false;
				var changes:int = 0;
				var changeLimit:int = 1;
				if(rand(2) == 0) changeLimit++;
				if(rand(3) == 0) changeLimit++;
				if(rand(3) == 0) changeLimit++;
				
				//COSMETIC SHITZ
				//Thickness increase to 60
				if(pc.thickness < 60 && changes < changeLimit && rand(3) == 0)
				{
					kGAMECLASS.output("\n\nGas churns in your stomach. You can feel it coming long before you release it. When you finally burp, you feel a little sheepish for eating such fatty cookies. You’re probably gaining pounds this very second.");
					pc.thickness += 5;
					changes++;
				}
				//Tone drops after furriness
				if(pc.skinType == GLOBAL.SKIN_TYPE_FUR && pc.tone > 25 && rand(3) == 0)
				{
					if(pc.tone > 75)
					{
						if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) kGAMECLASS.output("\n\nYou aren’t sure if it’s how thick your fur is getting, but your muscles are getting a little less noticeable.");
						else kGAMECLASS.output("\n\nYour muscles are a little less noticeable. These cookies aren't doing you any favors.");
						pc.tone = 75;
					}
					//50+ to 50
					else if(pc.tone > 50)
					{
						kGAMECLASS.output("\n\nThese cookies are really doing a number on you. You can still see your muscles, but they don’t look nearly as impressive as they used to. You’re a little softer all over.");
						pc.tone = 50;
					}
					//35+ to 35
					else if(pc.tone > 35)
					{
						kGAMECLASS.output("\n\nUsing the Codex’s body scanner, you examine your form. It doesn’t take long, and unsurprisingly, you find that you’re packing less visible tone than before. Your muscles are almost hidden under ");
						if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) kGAMECLASS.output("all the fur as well as ");
						kGAMECLASS.output("a generous layer of padding.");
						pc.tone = 35;
					}
					//25+ to 25
					else
					{
						kGAMECLASS.output("\n\nYou poke your [pc.belly] and sigh. There isn’t a hint of muscle definition on you anymore. You’re like a soft, cuddly little teddy bear, built for hugging and snuggling more than anything else. Maybe you can turn this to your advantage. Your enemies might underestimate you, and your lovers might actually like it.");
						pc.tone = 25;
					}
					changes++;
				}
				//Bigger Butts
				var buttLimit:Number = 7;
				if(pc.mf("","girl") == "girl") buttLimit = 11;
				//After tone hits 29
				if(pc.buttRatingRaw < buttLimit && rand(4) == 0 && pc.tone <= 29 && changes < changeLimit)
				{
					//<= 1 to < 4 - super tight to small
					if(pc.buttRatingRaw <= 1)
					{
						kGAMECLASS.output("You’re conscious of a slight ");
						if(pc.isCrotchGarbed()) kGAMECLASS.output("tightness in the back of your [pc.lowerGarment].");
						else kGAMECLASS.output("change in your center of balance.");
						kGAMECLASS.output(" You think your butt might have gotten a little bigger to match the rest of your overall softness. At least it’s still on the small side.");
						pc.buttRatingRaw = 3;
					}
					//< 4 to < 6 snug to cush, heart-shaped
					else if(pc.buttRatingRaw < 4)
					{
						kGAMECLASS.output("\n\nWhen you idly place your hand upon your hip, you feel a little more brushing against your thumb than you’re used to. A closer inspection reveals that your once small derriere has gotten larger, even a little cushy. It’s the kind of heart-shaped ass that’s easy to look at.");
						pc.buttRatingRaw = 5;
					}
					//<6 to < 8 heart-shaped to cushiony, lil jiggly - guys stop here.
					else if(pc.buttRatingRaw < 6)
					{
						kGAMECLASS.output("\n\nWhen you go to move and feel a little jiggle from your ass, you stop dead in your tracks. It didn’t used to jiggle. These cookies are blowing your butt up! You grab hold of your cheeks in both hands and squeeze, feeling the cushiony mass give around your fingers. You’re getting pretty squeezable back there.");
						pc.buttRatingRaw = 7;
					}
					//<8 to < 10 lil jiggly to plush
					else if(pc.buttRatingRaw < 8)
					{
						kGAMECLASS.output("\n\nYou feel the most delicious onset of warmth in your [pc.butt]. One second, you’re gobbling down cookies, and the next you can feel your cheeks swelling up, all hot and tender. You can’t help but grope the expanding flesh between your fingertips, feeling it feel out, growing rounder and bigger... plusher. You’re almost disappointed when it stops. The whole of your butt still feels nice and sensitive at least. You could spend a little time handling it... just for fun.");
						pc.buttRatingRaw = 9;
						//+1lib.
						pc.slowStatGain("libido",1);
					}
					//< 10 to 12 plush to spacious, slappable.
					else
					{
						kGAMECLASS.output("\n\nOhhh, here it comes! You can feel microscopic robots in your butt, heating up the flesh as they force your cells to divide, your [pc.skin] to stretch, and your nerves to multiply. Second by second, your plump ass is expanding, getting increasingly slappable by the second.");
						if(pc.isCrotchGarbed()) kGAMECLASS.output(" Your poor [pc.lowerGarment] strains around the new girth.");
						kGAMECLASS.output(" You give yourself a playful slap, just to feel it jiggle and shake, reveling in the heated sparks of pleasure it sends to your brain. A tender butt like this might give you a thing for spanking....");
						pc.slowStatGain("libido",1);
						pc.buttRatingRaw = 11;
					}
					changes++;
				}
				//Alcohol Tolerance
				//Get drunk twice as slow and sober 4x slower
				if(pc.nukiScore() >= 4 && rand(4) == 0 && !pc.hasPerk("'Nuki Drunk"))
				{
					kGAMECLASS.output("\n\nYou have a sudden desire to relax with some sake, maybe a beer or two. Yeah, that’d hit the spot. You wonder if the ‘Nuki Cookies are somehow responsible. Could be a side effect? You can’t imagine anyone would make a transformation with alcohol cravings... would they?");
					kGAMECLASS.output("\n\n(<b>Perk Gained: ‘Nuki Drunk</b> - Get drunk twice as slow and sober up four times slower.)");
					pc.createPerk("'Nuki Drunk",0,0,0,0,"Get drunk twice as slow and sober up four times slower.");
					changes++;
				}
				//Hair color change
				if(pc.hairColor != "brown" && pc.hairColor != "chocolate" && pc.hairColor != "dark brown" && changes < changeLimit && rand(4) == 0)
				{
					kGAMECLASS.output("\n\nThe most insidious change the cookies wreak isn’t something sexual or mental. No, it’s changing your hair color. <b>Your [pc.hairColor] locks have turned brown</b>! You didn’t even get to watch it happen!");
					pc.hairColor = "brown";
					changes++;
				}
				//Fur color changing
				if(pc.hasFur() && pc.furColor != "brown" && pc.furColor != "chocolate" && changes < changeLimit && rand(4) == 0)
				{
					kGAMECLASS.output("\n\nYou glance down, then do a double-take. Your [pc.skinFurScales] is changing color, morphing before your very eyes into a color like rich chocolate. It’s even getting a little thicker too - fluffier for sure. You pet yourself and try to enjoy the change. You can probably dye it if you aren’t happy <b>having brown fur</b>.");
					pc.furColor = "chocolate";
					changes++;
				}
				//Eye type changed to normal wiv color change
				if(pc.eyeType != GLOBAL.TYPE_HUMAN && rand(4) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nEverything is getting really fuzzy. You can barely see your hand in front of your face, for crying out loud. Unreasoning terror wells up inside you; are you going blind? Was there some kind of programming mishap with the microsurgeons buried in these cookies?\n\nYou get your answer after a half-minute of panic when your vision returns to normal, even if the color balance seems a little off. You check yourself with the Codex’s camera function and discover that your eyes have changes to a far plainer design. <b>You’ve got eyes like a terran or dozens of other species");
					if(pc.eyeColor != "brown") kGAMECLASS.output(", and yours turned brown in the process");
					kGAMECLASS.output(".</b>");
					pc.eyeType = GLOBAL.TYPE_HUMAN;
					pc.eyeColor = "brown";
					changes++;
				}
				//Nonhair to hair
				if((pc.hairType == GLOBAL.HAIR_TYPE_FEATHERS || pc.hairType == GLOBAL.HAIR_TYPE_GOO || pc.hairType == GLOBAL.HAIR_TYPE_TENTACLES) && rand(4) == 0 && changes < changeLimit)
				{
					//Feathers
					if(pc.hairType == GLOBAL.HAIR_TYPE_FEATHERS)
					{
						kGAMECLASS.output("\n\nA feather falls past your eye - one of yours. More follow it. One after another, the feathers that line your head are detaching and drifting to the ground. An insane part of you feels compelled to gather them up - to somehow keep them from leaving you. You soon forget that in the face of an incredible itch. Both hands go to your bared scalp, scratching like mad as tiny filaments emerge from your skull.\n\nYou itch and itch, feeling the individual threads thicken into a short man of ruddy brown hair. <b>You have brown hair!</b>");
					}
					//Goo
					else if(pc.hairType == GLOBAL.HAIR_TYPE_GOO)
					{
						kGAMECLASS.output("\n\nYour gooey hair shudders, the effect sending jiggles through the whole mass. You put a hand to it, wondering what could be wrong, but it contracts again. This time, the surface feels vaguely... fibrous, like someone made gelatin in a broom. Unsure what to do, you feel around while it happens again... and again... and again. Each time, there’s less goo and more... hair. In the span of a few minutes, <b>you go from having amorphous locks to brown hair of similar length.</b>");
					}
					//Tentacles
					else if(pc.hairType == GLOBAL.HAIR_TYPE_TENTACLES)
					{
						kGAMECLASS.output("\n\nThe tentacles on your head go limp one after another, and you realize that the feeling you get from them is gradually dying away, replaced with the passive sensation of them limp against your skull. Poking and prodding at them, you discover that they’re splitting apart into hundreds upon hundreds of thin, flexible filaments. In no time flat, <b>you’ve got a head of lustrous brown hair in place of tentacles.</b>");
					}
					pc.hairType = GLOBAL.HAIR_TYPE_REGULAR;
					pc.hairColor = "brown";
					changes++;
				}
				//Nuki ears
				if(pc.earType != GLOBAL.TYPE_KUITAN && rand(4) == 0 && changes < changeLimit)
				{
					kGAMECLASS.output("\n\nAn itch radiates out from the top of your head, migrating down the sides to your ears. Nerves fizzle and misfire as your flesh remoulds. Your eardrums pop a half-dozen times in a row. You wince a time or two, then reach to try and feel the changes. Silky fur brushes against your fingertips, revealing a rounded pair of ears - just like a tanuki or kui-tan!");
					pc.earType = GLOBAL.TYPE_KUITAN;
					changes++;
				}
				//Nuki tail - make sure TF locks work. No gettin’ rid of snakebuttez
				if(pc.tailType != GLOBAL.TYPE_KUITAN && rand(4) == 0 && changes < changeLimit)
				{
					if (target.tailTypeUnlocked(GLOBAL.TYPE_KUITAN))
					{
						//From no tail
						if(pc.tailCount == 0)
						{
							if(changes > 0) kGAMECLASS.output("\n\nIn addition, y");
							else kGAMECLASS.output("\n\nY");
							kGAMECLASS.output("our attention is drawn down to your [pc.butt] - directly above it, actually. There’s an upraised lump forming at the base of your spine. You can feel the bones down there shifting slightly, adjusting as the protrusion grows larger. There’s less pain than you would have thought. The existing nervous connections have been broken and are still growing in behind your expanding flesh.");
							kGAMECLASS.output("\n\nYour tail grows in long and thick, lined with powerful muscles. You could probably use it as a bludgeon if the need arose.");
							if(!pc.hasFur()) 
							{
								kGAMECLASS.output(" Of course, the fur that’s growing all over it would diminish its effectiveness as a weapon.");
								if(pc.furColor != "black") kGAMECLASS.output(" At least it has a stylish brown and black ringed pattern!");
							}
							else 
							{
								kGAMECLASS.output(" Of course, your natural fur would diminish its effectiveness as a weapon.");
								if(pc.furColor != "black") kGAMECLASS.output(" At least the tail is growing its own stylish black and brown pattern.");
							}
							kGAMECLASS.output(" Hugging the thick thing to your chest, you feel its growth slowly come to a stop. <b>You have a big, bushy tail.</b>");
							pc.tailCount = 1;
							pc.clearTailFlags();
							pc.tailType = GLOBAL.TYPE_KUITAN;
							pc.addTailFlag(GLOBAL.FLAG_LONG);
							pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
							pc.addTailFlag(GLOBAL.FLAG_FURRED);
							changes++;
						}
						//From other tail
						else if(pc.tailCount == 1)
						{
							if(changes > 0) kGAMECLASS.output("\n\nIn addition, y");
							else kGAMECLASS.output("\n\nY");
							kGAMECLASS.output("our attention is drawn down to your [pc.tail]. It’s twitching wildly, the skin visibly shifting as the microscopic machines trick your cells into assuming a new shape. ");
							if(!pc.hasTailFlag(GLOBAL.FLAG_LONG)) kGAMECLASS.output("The shortened shape of your tail stretches longways, filling out before your eyes.");
							else kGAMECLASS.output("The already long shape of your tail is well suited its form. Not much adjustment is needed.");
							if(!pc.hasFur()) 
							{
								kGAMECLASS.output(" Fur springs up across the whole thing");
								if(pc.furColor != "black") kGAMECLASS.output(", revealing a ringed black and brown pattern");
								kGAMECLASS.output(".");
							}
							else 
							{
								kGAMECLASS.output(" Your existing fur remains, tinted into a familiar-looking black");
								if(pc.furColor == "black") kGAMECLASS.output("-ringed pattern.");
								else kGAMECLASS.output(" and brown pattern.");
							}
							kGAMECLASS.output(" You wiggle it around a few times for fun. It’s heavy enough that you could really wallop someone! <b>You’ve got a tanuki tail!</b>");
							pc.clearTailFlags();
							pc.tailType = GLOBAL.TYPE_KUITAN;
							pc.addTailFlag(GLOBAL.FLAG_LONG);
							pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
							pc.addTailFlag(GLOBAL.FLAG_FURRED);
							changes++;
						}
						//From multitail
						else
						{
							if(changes > 0) kGAMECLASS.output("\n\nIn addition, y");
							else kGAMECLASS.output("\n\nY");
							kGAMECLASS.output("our attention is drawn down to your [pc.tails]. They’re writhing against one another like wild, pressed so tightly into a single bundle that even you are having trouble telling them apart. Then, before your very eyes, they begin to merge together. You aren’t sure how to describe it. It feels sort of like when your arm all falls asleep - all tingle and yet still half numbed.");
							kGAMECLASS.output("\n\nThe ‘Nuki Cookies are undoubtedly going to work on your [pc.tails], reshaping them into a single powerful limb, one that’s covered in a luscious coat of black");
							if(pc.furColor != "black") kGAMECLASS.output(" and brown rings");
							kGAMECLASS.output(". The muscular thing is weighty enough that you could probably batter someone with it quite effectively. If only it wasn’t so padded. <b>You have a tanuki tail!</b>");
							pc.tailCount = 1;
							pc.clearTailFlags();
							pc.tailType = GLOBAL.TYPE_KUITAN;
							pc.addTailFlag(GLOBAL.FLAG_LONG);
							pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
							pc.addTailFlag(GLOBAL.FLAG_FURRED);
							changes++;
						}
					}
					else kGAMECLASS.output(target.tailTypeLockedMessage());
				}
				//GO FULL Nukiface
				//Requires nonhumoo face.
				if(pc.earType == GLOBAL.TYPE_KUITAN && pc.hasFur() && pc.faceType != GLOBAL.TYPE_HUMAN && pc.faceType != GLOBAL.TYPE_KUITAN && changes < changeLimit && rand(5) == 0)
				{
					kGAMECLASS.output("\n\nVertigo nearly drops you to the ground. Something isn’t right with your skull or your equilibrium. You can feel your skin crawling from your reshaping face, your nose stretched tight. The air feels cold blowing across a suddenly damp nose. Your teeth feel sharp and your jaw roomy. There’s so smuch space for your tongue to wiggle. In the middle of your vision is a slightly protruding muzzle. No doubt about it, <b>you have a raccoon-like face now</b>, just like a kui-tan.");
					pc.clearFaceFlags();
					pc.faceType = GLOBAL.TYPE_KUITAN;
					changes++;
				}
				//Maskface
				//Human-type faces get dis. Others go st8 2 muzzle
				if(pc.faceType == GLOBAL.TYPE_HUMAN && changes < changeLimit && rand(5) == 0 && (pc.earType == GLOBAL.TYPE_KUITAN || pc.tailType == GLOBAL.TYPE_KUITAN))
				{
					kGAMECLASS.output("\n\nYour vision goes double! You blink repeatedly, shaking your head to clear your wits. You’re absolutely sure something must have changed with your face, but you haven’t grown any eyestalks that will let you take a look at it - thank the stars!\n\nYou whip out the Codex and use the integrated camera function as an improvised mirror. Smiling, you admire the new look. A " + pc.mf("handsome-looking","fetching") + " mask has grown over your face, giving you a roguish look. The police might look a little closer at your activities, but that’s a small price to pay for looking this good.");
					pc.clearFaceFlags();
					pc.faceType = GLOBAL.TYPE_HUMANMASKED;
					changes++;
				}
				//Fuzzy handtypeshit - req’s fur.
				if(pc.armType != GLOBAL.TYPE_KUITAN && pc.hasFur())
				{
					kGAMECLASS.output("\n\nYou ball a hand into a fist while you wait, only to feel the softest little pads pressing into your palm. Opening your digits, you marvel at the appearance of small, dark-brown pads on the tips of your fingers. A larger one stretches across the top of your palm. They’re soft as hell and might feel pretty good in certain... tender areas. <b>You’ve got padded palms, just like a kui-tan.</b>");
					pc.armType = GLOBAL.TYPE_KUITAN;
					changes++;
				}
				//Grow fur
				if((pc.skinType == GLOBAL.SKIN_TYPE_SKIN || pc.skinType == GLOBAL.SKIN_TYPE_SCALES) && pc.earType == GLOBAL.TYPE_KUITAN && pc.tailType == GLOBAL.TYPE_KUITAN && rand(4) == 0 && changes < changeLimit)
				{
					//From skin
					if(pc.skinType == GLOBAL.SKIN_TYPE_SKIN)
					{
						kGAMECLASS.output("\n\nYou idly scratch at your arm, but find yourself catching on something. Looking closer, you see a single hair growing from a normally hairless part of your body. A second later, another pops out alongside it... then another, and another... and another. They’re everywhere! Tiny hairs are surfacing all across your body, thickening into layer of fur before your eyes. All over, there’s a seemingly endless sea of thick, fluffy brown. <b>You pet your silky fur as you try to get used to it.</b>");
					}
					//From scales
					else
					{
						kGAMECLASS.output("\n\nYou idly scratch at a loose scale, feeling it come loose under your fingers, but the one alongside it is also loose now. You flick it off just before you become aware that the sensation is spreading; scales are dropping like rain now, even without you touching them. Underneath, a lush carpet is springing up from your [pc.skin]. <b>You’re growing the typical tanuki brown fur.</b> You pet yourself to try and get used to the sensation. You might have to buy a brush later - for grooming, not because it feels good.");
					}
					pc.furColor = "brown";
					pc.skinType = GLOBAL.SKIN_TYPE_FUR;
					pc.clearSkinFlags();
					changes++;
				}
				//SEXY STUUUUUFF
				//Rare: 5+ Ultraball Squish Enabled!
				if(pc.balls >= 2 && pc.hasCock() && !pc.hasStatusEffect("Uniball") && changes < changeLimit && rand(2) == 0 && pc.ballSizeRaw >= 16 && pc.nukiScore() >= 3 && !pc.hasPerk("'Nuki Nuts"))
				{
					kGAMECLASS.output("\n\nThe ‘Nuki Cookies must have some kind of unexpected reaction with your body, because you go from patiently watching and waiting to overwhelmed with lust. Your [pc.sack] grows tight. Muscles in your middle spasm, and you start hosing [pc.cum] out of your [pc.cocks] long before ");
					if(pc.cockTotal() == 1) kGAMECLASS.output("it’s");
					else kGAMECLASS.output("they’re");
					kGAMECLASS.output(" even hard.");
					//CrotchGurbed
					if(pc.isCrotchGarbed()) kGAMECLASS.output("\n\nMost of the discharge is spent in your poor [pc.lowerGarment]. Runnels of [pc.cumColor] squirt out every possible gap after the first blast, but it only gets worse as your inexplicable pleasure continues. [pc.Cum] flows in rivers down all sides of your [pc.legOrLegs], and the worst part is you can’t stop yourself or summon up the motor control to move somewhere better. You drop to the ground, careful of your bloating balls, flooding the ground around you with more and more of the [pc.cumVisc] fluid.");
					//Uncovered
					else kGAMECLASS.output("\n\nYou’re quietly thankful for your own uncovered loins, free to spray your [pc.cumColor] relief every which way. Even without touching yourself, the inexplicable pleasure continues. [pc.Cum] flows in rivers from you, and the worst part is that you can’t seem to stop yourself or summon the will to move. You drop to the ground, careful of your ceaselessly productive, bloating balls, flooding the ground around you with more and more of the [pc.cumVisc] fluid.");
					kGAMECLASS.output("\n\nThe flow refuses to ebb or slow for what feels like hours, but it must have only been minutes. When it does finally come to an end, you’re left panting and [pc.cumNoun]-stained, and <b>your balls are even bigger.</b> Maybe you had best lay off the tanuki treats for a while");
					if(pc.isCrotchGarbed()) kGAMECLASS.output("... and get a change of bottoms");
					kGAMECLASS.output(".");
					kGAMECLASS.output("\n\n(<b>Perk Gained: 'Nuki Nuts</b> - Your gonads can now swell up with excess semen, allowing for excessively large orgasms. Beware of immobilization!)");
					pc.createPerk("'Nuki Nuts",0,0,0,0,"Allows gonads to swell with excess seed.");
					pc.ballSizeRaw += 1.5;
					if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 1.5;
					pc.orgasm();
					pc.ballFullness = 100;	
					changes++;
				}
				//Bigger Balls
				//Reqs 2 balls && !trap pouch
				if(pc.balls >= 2 && pc.hasCock() && !pc.hasStatusEffect("Uniball") && changes < changeLimit && rand(3) == 0 && pc.ballSizeRaw < 16)
				{
					//1” diameter to 2” diameter
					if(pc.ballSizeRaw <= 3.5)
					{
						kGAMECLASS.output("\n\nYou reach down to scratch your [pc.balls]. The real surprise is just how much you have to scratch. Your whole sack is bigger, and the balls within significantly swollen, almost doubled in size. You idly wonder how much of a mess you’ll make when you masturbate now.");
						pc.ballSizeRaw = 6.5;
					}
					//2” diameter to 2.5” diameter
					else if(pc.ballSizeRaw <= 6.5)
					{
						kGAMECLASS.output("\n\nYour [pc.balls] feel increasingly heavy, swollen even, pulling the skin of your sack tighter moment by moment. They stop at the size of large eggs. You roll them around in your palm, admiring their heft and weight, the way they fill your hand. A few more ‘Nuki Cookies and you could have some really big balls....");
						pc.ballSizeRaw = 8;
					}
					//2.5” diameter to 3 diameter
					else if(pc.ballSizeRaw <= 8)
					{
						kGAMECLASS.output("\n\nThe [pc.skin] of your [pc.sack] pulls tight, stretched from within. New weight is settling in your [pc.balls], making them swell with newfound virility, reminding you now more than ever that kui-tan are reknowned for having large balls. <b>Yours are easily apple-sized at this point.</b>");
						pc.ballSizeRaw = 9.5;
						//+1 libido
						pc.slowStatGain("libido",1);
					}
					//3 diameter to 3.5 diameter
					else if(pc.ballSizeRaw <= 9.5)
					{
						kGAMECLASS.output("\n\nA surge of arousal hits you, perfectly timed with almost instantaneous engorgement of your crotch - and not just from your [pc.cocks] either. Your [pc.balls] are swelling larger by the minute. Interestingly, they seem a little bit less sensitive. Gently kneading them feels kind of nice, actually. You whimper and force yourself to stop. If you kept it up, you’d probably wind up blowing your load.");
						pc.lust(15);
						pc.libido(1);
						pc.slowStatGain("libido",1);
						//+2 libido, +15 lust
						pc.ballSizeRaw = 11.5;
					}
					//3.5 to 4
					else if(pc.ballSizeRaw <= 11.5)
					{
						kGAMECLASS.output("\n\nThere’s no hiding the way your [pc.sack] is swelling out with newfound mass, the microscopic robots causing your testicular tissue to divide seemingly endlessly. It’s getting pretty heavy now, and you’ve got to be careful when sitting down not to crush them. At least they feel really nice to run your fingers across.");
						//+1 libido
						pc.slowStatGain("libido",1);
						pc.lust(5);
						//+5 lust
						pc.ballSizeRaw = 13;
					}
					//4 to 4.5
					else if(pc.ballSizeRaw <= 13)
					{
						kGAMECLASS.output("\n\nYour nuts churn with their barely-suppresed, virile [pc.cumNoun]-load, working on overtime to make your next orgasm hotter, wetter, and all around messier. The sense of need in your swollen cum-factories rises higher and higher, driving to look down and pant with lust. Pre-cum leaks from you like a sieve, and your balls are bigger than ever. You give them a familiar squeeze, kneading the growing boys until your body relaxes, the change finished.");
						pc.ballFullness = 100;
						//+25 lust
						pc.lust(25);
						//+2 libido
						pc.libido(1);
						pc.slowStatGain("libido",1);
						pc.ballSizeRaw = 14.5;
					}
					//4.5 to 5
					else
					{
						kGAMECLASS.output("\n\nYou break out in sweat all over, not from the heat but from your suddenly hammering heart. Your [pc.legOrLegs] wobble and dump you to the ground, which is for the best really. Your package visibly jiggles with each heartbeat, the orb-like sperm-producers expanding in almost imperceptible spurts. Ribbons of pre-cum roll out of your [pc.cocks] while you watch. followed shortly after by a few drops of [pc.cumNoun]. You feel fuller than you’ve ever been, made randy by overwhelming need.");
						//+33 lust
						pc.lust(33);
						//refil balls.
						pc.ballFullness = 100;
						pc.ballSizeRaw = 16;
					}
					changes++;
				}
				//Nuki Cock
				//Crazy triknot shit.
				choices = new Array();
				for(x = 0; x < pc.cockTotal(); x++)
				{
					if(pc.cocks[x].cType != GLOBAL.TYPE_KUITAN) choices[choices.length] = x;
				}
				//Set x to a random dick from choices
				if(choices.length > 0) x = choices[rand(choices.length)];
				//Else set to -1, code for NODONG NOGO
				else x = -1;
				if(changes < changeLimit && x >= 0 && rand(3) == 0)
				{
					if(target.cockTypeUnlocked(x,GLOBAL.TYPE_KUITAN))
					{
						//No sheath
						if(!pc.hasSheath(x))
						{
							kGAMECLASS.output("\n\nThe [pc.skin] around the base of your [pc.cock " + x + "] begins to bunch up, pulling the length of your penis back with it. At first, you fear that you’re shrinking, but soon enough that folding skin builds up into what can only be a sheath, drawing your softening length back inside it.");
							kGAMECLASS.output("\n\nAside from the oddness of manifesting a new addition to your genitals, something else doesn’t feel quite right. Your new sheath ");
						}
						//Sheathhas
						else
						{
							kGAMECLASS.output("\n\nYour sheath pulls your [pc.cock " + x + "] back into it out of the blue. You ");
							if(pc.lust() < 50) kGAMECLASS.output("were excited enough for it to popping out into open air, but it seems to have changed its mind.");
							else kGAMECLASS.output("were really excited. Why would it do that?");
							kGAMECLASS.output(" Maybe... maybe the cookies are doing something to your dick? Your sheath ");
						}
						//Merge. No new pg
						kGAMECLASS.output("confirms your suspicions when it starts pulling more of your [pc.cock " + x + "] inside it. You can still feel yourself in there, somewhere inside the soft flesh of your own body, but your shape is definitely changing, twisted by the nanoscale machines engineering your body.");
						kGAMECLASS.output("\n\nYou wait patiently, feeling warmer by the second, until your body is finally ready to reveal your changed cock. It slides out of its furry scabbard, angry and red, ridged with three uninflated knots, the largest positioned at its base. When fully aroused, you’re sure that such a tool will be incredibly stimulating for any partner, and probably have a good chance of knotting you in place too. The urethra at the tip of the heart-shaped head trickles a little pre-cum in its excitement.");
						kGAMECLASS.output("\n\n<b>");
						if(pc.cockTotal() > 1) kGAMECLASS.output("One of your penises");
						else kGAMECLASS.output("Your penis");
						kGAMECLASS.output(" is just like that of a kui-tan now");
						//Will all dicks be kuitan dicks now?
						if(pc.cockTotal(GLOBAL.TYPE_KUITAN) == pc.cockTotal() -1 && pc.cockTotal() > 1) 
						{
							kGAMECLASS.output(", matching the ");
							if(pc.cockTotal() == 2) kGAMECLASS.output("other");
							else kGAMECLASS.output("others");
							kGAMECLASS.output(" perfectly");
						}
						kGAMECLASS.output(".</b> You’ll have to take it for a spin sometime.");
						changes++;
						pc.lust(30);
						pc.slowStatGain("libido",10);
						pc.shiftCock(x,GLOBAL.TYPE_KUITAN);
					}
					else
					{
						kGAMECLASS.output(target.cockTypeLockedMessage());
					}
				}
				//Find nonblack vags for TF!
				choices = new Array();
				for(x = 0; x < pc.totalVaginas(); x++)
				{
					if(pc.vaginas[x].vaginaColor != "black") choices[choices.length] = x;
				}
				//Set x to a random dick from choices
				if(choices.length > 0) x = choices[rand(choices.length)];
				//Else set to -1, code for NODONG NOGO
				else x = -1;
				//Black Cunt Color
				if(changes < changeLimit && x >= 0 && rand(3) == 0)
				{
					kGAMECLASS.output("\n\nA tickling, teasing sensation flutters across your nether-lips");
					if(pc.totalVaginas() > 1)
					{
						kGAMECLASS.output(" - ");
						if(pc.totalVaginas() == 2) kGAMECLASS.output("both sets");
						else kGAMECLASS.output("every single set of them");
					}
					kGAMECLASS.output(", leaving you intensely aware of your own movements. You peek down there to see what’s going on");
					if(pc.isCrotchGarbed()) kGAMECLASS.output(", taking special care to move your [pc.lowerGarments] out of the way");
					kGAMECLASS.output(". <b>Your [pc.vaginas] ");
					if(pc.totalVaginas() == 1) kGAMECLASS.output("is");
					else kGAMECLASS.output("are");
					kGAMECLASS.output(" black!</b> Everything from the lips to the clit is a dusky onyx that glistens in the light. Nothing else changed at least.");
					//Go through the list of unblack vags and make 'em black!
					while(choices.length > 0)
					{
						pc.vaginas[choices[0]].vaginaColor = "black";
						choices.splice(0,1);
					}
					changes++;
				}
				//Leg changing - monopods split to bipednuki
				if(pc.legCount == 1 && changes < changeLimit && rand(4) == 0)
				{
					kGAMECLASS.output("\n\nOne moment, you’re savoring the last few crumbs from your cookies, the next, you’re dropping hard on your [pc.butt]. It feels like you’ve lost all control over your [pc.leg]... and not just all control - all feeling! In a panic, you look down at your quivering appendage, watching it ripple and shift, slowly revealing a divot in the center that all-too-soon becomes a total split.\n\nYou’ve got two masses, shaped roughly like bipedal legs, filling out before your eyes. Knees appear. New-grown toes wiggle, tipped with short claws. You can even feel soft pads forming on the bottoms of your freshly-minted feet. Not long after, a thick coat of fur springs up across your flesh, bringing with it a tingling so intense that it makes your recently-shaped muscles jerk and twitch. You can feel again!\n\nThe new limbs get easier to control over the next minute, and in no time you’re standing up and walking around on <b>your new, tanuki-like legs</b> just fine.");
					pc.clearLegFlags();
					pc.legCount = 2;
					pc.genitalSpot = 0;
					pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
					pc.addLegFlag(GLOBAL.FLAG_FURRED);
					pc.addLegFlag(GLOBAL.FLAG_FLUFFY);
					pc.legType = GLOBAL.TYPE_KUITAN;
					changes++;
				}
				//Leg changing - any other amount of legs become nukilegs.
				//Taurs stay taurs, become nukitaurs.
				else if(pc.legCount > 1 && changes < changeLimit && pc.legType != GLOBAL.TYPE_KUITAN && rand(4) == 0)
				{
					if(pc.isTaur())
					{
						kGAMECLASS.output("\n\nOne at a time, your multitude of lower limbs go numb. The change is slow enough that you can lower yourself to the ground safely rather than tripping and potentially injuring yourself, but it is disconcerting all the same. Rubbing the closest pair, you marvel at the way your flesh shifts beneath your fingers, flowing past your inquisitive digits on its way to a new shape.");
						if(!pc.hasLegFur()) kGAMECLASS.output(" They even grow a thick coat of fur and");
						else kGAMECLASS.output(" They even grow");
						kGAMECLASS.output(" soft pads on the bottom.");
						kGAMECLASS.output("\n\n<b>You’ve got legs like a tanuki or a kui-tan - fur, pads, and all.</b>");
					}
					//Nontaur
					else
					{
						kGAMECLASS.output("\n\nYour right leg goes implausibly numb, dumping you to the ground before you have the slightest chance to react. Thankfully, you are uninjured, but your sense of alarm only continues to rise as you lose feeling in your left.");
						if(pc.legCount == 3) kGAMECLASS.output(" Your middle limb goes dull and distant soon after.");
						kGAMECLASS.output(" Reaching down, you press your hand against your [pc.legFurScales] and discover something alarming. Your flesh is moving like liquid! Muscles are fading and reforming, bones are changing shape, and it’s all somehow painless.\n\nThe remarkable transformation slows once you’ve got a fairly normal-looking set of plantigrade legs.");
						if(!pc.hasLegFur()) kGAMECLASS.output(" A coat of fur arrives next, followed shortly after by the appearance of soft-looking pads on the bottom of your feet.");
						else kGAMECLASS.output(" Finally, soft-looking pads appear on your new-formed feet.");
						kGAMECLASS.output(" <b>You’ve got furry legs just like a tanuki.</b>");
					}
					pc.clearLegFlags();
					pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
					pc.addLegFlag(GLOBAL.FLAG_FURRED);
					pc.addLegFlag(GLOBAL.FLAG_FLUFFY);
					pc.legType = GLOBAL.TYPE_KUITAN;
					changes++;
				}
				if(changes == 0)
				{
					kGAMECLASS.output("\n\nDespite your patient waiting, nothing happens. At least they tasted good.");
				}
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " consumes the cookies to no effect.");
			}
			return false;
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
	}
}
