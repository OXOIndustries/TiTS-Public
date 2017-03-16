package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.indefiniteArticle;
	
	public class PupperPoppers extends ItemSlotClass
	{
		
		//constructor
		public function PupperPoppers()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "PupperP";
			//Regular name
			this.longName = "Pupper Popper"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Pupper Popper";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This red, plastic-wrapped treat is a promotional transformative sold alongside traditional Canine Poppers. It’s advertised as capable of replicating several rarer canine traits that are impossible to achieve with traditional Canine Poppers, resulting in a distinctly more feral appearance. The bone-shaped wrapping says it tastes like well-seasoned meat.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Lash Charge");
			if(target is PlayerCharacter) {
				var pc:Creature = target;
				var changes:int = 0;
				var changeLimit:int = 1;
				var temp:String = "";
				var x:int = -1;
				if(rand(2) == 0) changeLimit++;
				if(rand(3) == 0) changeLimit++;

				//Consume
				output("You unwrap the scientifically enhanced morsel and toss the bite-sized treat in your mouth. You chew on it for a while, delighting in the juicy meat flavors dancing on your tongue. Once the taste starts to fade, you swallow it all down and wait.");

				//Transformations
				//Canine Ears
				//Effect: Has non-canine ears - turn into canine ears.
				if(pc.earType != GLOBAL.TYPE_DOGGIE && pc.earType != GLOBAL.TYPE_CANINE && rand(3) == 0 && changes < changeLimit)
				{
					if(pc.earTypeUnlocked(GLOBAL.TYPE_CANINE))
					{
						output("\n\nYou spend a good few minutes waiting for something to happen. Tired of waiting, you look at your reflection in your Codex and find that a pair of canine ears have settled on the top of your head. You wiggle them around a bit and confirm that they move and function just like those of a dog. An itch spreads across them as fine hairs begin to grow, thickening into a short layer of fur. <b>You have canine ears!</b>");
						pc.earType = GLOBAL.TYPE_CANINE;
					}
					else output("\n\n" + pc.earTypeLockedMessage());
					changes++;
				}
				//Transformations
				//Canine to Doggie Ears
				//Effect: Has canine ears - turn into doggie ears.
				else if(pc.earType == GLOBAL.TYPE_CANINE && rand(3) == 0 && changes < changeLimit)
				{
					if(pc.earTypeUnlocked(GLOBAL.TYPE_DOGGIE))
					{
						output("\n\nAfter spending a few minutes without anything happening, you check yourself in the Codex and notice that your ears are drooping down, like some breeds of domestic dog. You try to make them stand, but no matter what you do their round tips refuse to go up. <b>");
						if(kGAMECLASS.silly) output("You have cute widdle pupper ears! Who’s a good " + pc.mfn("boy","girl","doggie") + "? You are");
						else output("Your ears are now floppy and round");
						output("!</b>");
						pc.earType = GLOBAL.TYPE_DOGGIE;
					}
					else output("\n\n" + pc.earTypeLockedMessage());
					changes++;
				}
				//Doggie to Canine Ears
				//Effect: Has doggie ears - turn into canine ears.
				else if(pc.earType == GLOBAL.TYPE_DOGGIE && rand(3) == 0 && changes < changeLimit)
				{
					if(pc.earTypeUnlocked(GLOBAL.TYPE_CANINE))
					{
						output("\n\nAfter spending a few minutes without anything happening, you check yourself in the Codex and notice that your ears point straight up, like those of a wild wolf. You try to make them droop, but no matter what you do their pointed tips refuse to go down. <b>Your ears are now pointed and stand straight-up!</b>");
						pc.earType = GLOBAL.TYPE_CANINE;
					}
					else output("\n\n" + pc.earTypeLockedMessage());
					changes++;
				}
				//Canine Tongue
				if(pc.tongueType != GLOBAL.TYPE_CANINE && rand(3) == 0 && changes < changeLimit)
				{
					if(pc.tongueTypeUnlocked(GLOBAL.TYPE_CANINE))
					{
						output("\n\nYou feel your [pc.tongue] swelling rapidly inside your mouth, quickly taking most of the space inside it and making it harder for you to breathe. You stretch your jaw as wide as you can and a large, flat tongue flaps out of it, leaving you panting as it shrinks back to a more normal size. <b>You have grown a canine tongue!</b>");
						pc.tongueType = GLOBAL.TYPE_CANINE;
						pc.clearTongueFlags();
					}
					else output("\n\n" + pc.tongueTypeLockedMessage());
					changes++;
				}
				//Worg Eyes
				//Effect: Has worg face - eyes change to worg type.
				if(pc.faceType == GLOBAL.TYPE_WORG && pc.eyeType != GLOBAL.TYPE_WORG && rand(4) == 0 && changes < changeLimit)
				{
					if(pc.eyeTypeUnlocked(GLOBAL.TYPE_WORG))
					{
						output("\n\nA wave of unreasonable fury breaches through your thoughts as your face twists into an angry snarl. A strange pain spreads through your eyes. When the bizarre emotions subside, the world seems much brighter than before. Bringing your hands in front of your eyes, you notice a soft [pc.eyeColor] light shining on them. Checking your face on your Codex, you notice that <b>your eyes now have luminous sclera!</b>");
						pc.eyeType = GLOBAL.TYPE_WORG;
					}
					else output("\n\n" + pc.eyeTypeLockedMessage());
					changes++;
				}
				//Canine Eyes
				//Effect: Has non-canine eye - turn into canine eye.
				if(pc.eyeType != GLOBAL.TYPE_CANINE && rand(3) == 0 && changes < changeLimit)
				{
					if(pc.eyeTypeUnlocked(GLOBAL.TYPE_CANINE))
					{
						output("\n\nYou feel a strange itch in your eyes and move to rub them. It takes a while, but eventually the feeling disappears. Upon opening them, it seems like everything looks a little bit different. Your eyes quickly adjust, and your vision gradually becomes more normal, or at least what you perceive as normal. Are things a little more gray? Curious, you check yourself in the Codex and find that your [pc.eyeColor] irises are much larger than before, and your pupils dilate much faster. <b>You now have the eyes of a canine!</b>");
						pc.eyeType = GLOBAL.TYPE_CANINE;
					}
					else output("\n\n" + pc.eyeTypeLockedMessage());
					changes++;
				}
				//Worg Face
				//Effect: Has canine face - turn into worg face.
				if(pc.faceType == GLOBAL.TYPE_CANINE && rand(4) == 0 && changes < changeLimit)
				{
					if(pc.faceTypeUnlocked(GLOBAL.TYPE_WORG))
					{
						output("\n\nYou feel unreasonable anger as the corners of your canine snout turn into a snarl. Pain spreads to your teeth and it just makes you even angrier. Your teeth grow sharper and longer than before, your canines already poking out from your muzzle. You feel the pain spreading all across your face, triggering more sparks of unnatural fury as your head grows wider and your jaws and neck gain more muscles. For some reason you snap at the air, biting at an invisible foe with more power than you ever had before. The wrath begins to subside as the transformation ends, and your itchy nose grows slightly larger than before. You check your appearance using the Codex and see that the canine traits of your face have become much more pronounced and intimidating. <b>Your face looks much closer to that of a mythic worg.</b>");
						pc.faceType = GLOBAL.TYPE_WORG;
					}
					else output("\n\n" + pc.faceTypeLockedMessage());
					changes++;
				}
				//Effect: Doesn't have canine or worg face - turn into canine face.
				if(pc.faceType != GLOBAL.TYPE_CANINE && pc.faceType != GLOBAL.TYPE_WORG && pc.hasFur() && rand(4) == 0 && changes < changeLimit)
				{
					if(pc.faceTypeUnlocked(GLOBAL.TYPE_CANINE))
					{
						output("\n\nA sudden burst of pain lights up your cheeks as you feel the bones underneath creaking. The sensation spreads across your [pc.face], the feeling intensifying in your teeth as they grow into a much sharper, carnivorous set. Your bones continue reform while your nose and jaw shift into position, ");
						if(pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) output("the pain slowly subsiding now that your muzzle has reshaped into a canine one");
						else output("painfully elongating and stretching farther from your face. The agony begins to subside when your face settles into a canine muzzle");
						output(". For a short moment, you find your breathing closed off as your nose turns black and moist. A few last cracks announce your bones falling into place, then silence. You check your appearance in the Codex and notice that <b>you now have a canine muzzle.</b>");
						pc.faceType = GLOBAL.TYPE_CANINE;
						pc.clearFaceFlags();
						pc.addFaceFlag(GLOBAL.FLAG_MUZZLED);
					}
					else output("\n\n" + pc.faceTypeLockedMessage());
					changes++;
				}
				//Coarse Fur flags
				//Effect: Has non-coarse fur skin, furred arms or furred legs - adds Coarse flag to skin, arms, legs that are furred.
				if((!pc.hasSkinFlag(GLOBAL.FLAG_THICK) || !pc.hasArmFlag(GLOBAL.FLAG_THICK) || !pc.hasLegFlag(GLOBAL.FLAG_THICK)) && rand(2) == 0 && pc.hasFur() && pc.legType == GLOBAL.TYPE_CANINE && pc.armType == GLOBAL.TYPE_CANINE && changes < changeLimit)
				{
					if(pc.skinFlagsUnlocked(GLOBAL.FLAG_THICK))
					{
						output("\n\nYou feel an itch starting right at the center of your chest that quickly spreads around your torso and into your limbs. As it spreads, your fur grows longer and begins to fall off, being quickly replaced by a new coating of fur. Not noticing anything different about yourself, you put your hand on your chest and give it a good rub. <b>Your [pc.furColor] fur is much thicker and coarser than before!</b>");
						pc.addSkinFlag(GLOBAL.FLAG_THICK);
						pc.addArmFlag(GLOBAL.FLAG_THICK);
						pc.addLegFlag(GLOBAL.FLAG_THICK);
					}
					else output("\n\n" + pc.skinFlagsLockedMessage());
					changes++;
				}
				//Add Breast Row
				//Effect: Has less than 5 breast rows - add 1 breast row, copy from lowest pair.
				if(pc.bRows() >= 1 && pc.bRows() < 5 && rand(4) == 0 && changes < changeLimit)
				{
					output("\n\nYour [pc.fullChest] begin to feel very itchy, and you try to scratch them as the sensation moves lower. It stops right below the ");
					if(pc.bRows() > 1) output("lowest ");
					if(pc.breastsPerRow(pc.bRows()-1) == 2) output("pair");
					else output("group");
					output(", and you feel a " + ((pc.breastsPerRow(pc.bRows()-1) == 2) ? "pair" : "row") + " of tiny [pc.nipplesNoun] sprouting off from the flesh between your fingers. New breasts begin to grow behind them, swelling with fat and muscle. Once the transformation ends, you bring your hands to them and feel the <b>new row of ");
					//PC has large breasts:
					if(pc.biggestTitSize() >= 6) output("luscious tits");
					else if(pc.biggestTitSize() >= 1) output("perky tits");
					else output("pecs");
					output("!</b>");
					pc.createBreastRow();
					pc.breastRows[pc.bRows()-1].breastRatingRaw = pc.breastRows[pc.bRows()-2].breastRatingRaw;
					pc.breastRows[pc.bRows()-1].nippleType = pc.breastRows[pc.bRows()-2].nippleType;
					pc.breastRows[pc.bRows()-1].breasts = pc.breastRows[pc.bRows()-2].breasts;
					pc.libido(1);
					changes++;
				}
				//Canine Cock
				//Effect: Has non-canine cock - turn into canine cock.
				if(pc.cockTotal() > pc.cockTotal(GLOBAL.TYPE_CANINE) && rand(2) == 0 && changes < changeLimit)
				{
					//Pick the dick to TF.
					var dickPix:Array = new Array();
					for(x = 0; x < pc.totalCocks(); x++)
					{
						if(pc.cocks[x].cType != GLOBAL.TYPE_CANINE) dickPix.push(x);
					}
					x = RandomInCollection(dickPix);

					if(pc.cockTypeUnlocked(x, GLOBAL.TYPE_CANINE))
					{
						output("\n\nA sudden rush of arousal hits you as you feel your [pc.cock " + x + "] quickly ");
						if(!pc.isCrotchExposed()) output("pitching a tent in your [pc.lowerGarments]");
						else output("growing erect between your [pc.legs]");
						output(". A strange itch moves across your dick as its surface becomes hotter. The microsurgeons are really going wild down there!");
						//Cock not Tapered:
						if(!pc.hasCockFlag(GLOBAL.FLAG_TAPERED,x)) output(" The [pc.cockHead " + x + "] twists and turns into a new shape, eventually settling into a tapered tip.");
						if (!pc.hasKnot(x)) output(" You can feel the heat rising more intensely near the base of your shaft, new veins and spongy flesh forming and twisting into a new knot, already swollen because of your arousal.");
						if(!pc.hasSheath(x)) 
						{
							output(" The skin behind your knot begins to bunch up and curl");
							if(pc.hasFur() || pc.hasFeathers() || pc.hasScales()) output(", [pc.skinFurScales] growing on this new surface");
							output(", before finally twisting into a new sheath.");
						}
						output(" The surface of your cock seems a bit more raw than it was before, with thin, dark veins visible all around it. Once the Canine Poppers are done with their work, your arousal quickly dies off, and <b>your new canine dick quickly recedes into its new protective sheath.</b>");
						pc.shiftCock(x,GLOBAL.TYPE_CANINE);
						pc.libido(2);
					}
					else output("\n\n" + pc.cockTypeLockedMessage());
					changes++;
				}
				//Canine Vagina
				//Effect: Has non-canine vagina - turn into canine vagina.
				if(pc.totalVaginas() > pc.totalVaginas(GLOBAL.TYPE_CANINE) && rand(2) == 0 && changes < changeLimit)
				{
					//Pick the dick to TF.
					var cuntPix:Array = new Array();
					for(x = 0; x < pc.totalVaginas(); x++)
					{
						if(pc.vaginas[x].type != GLOBAL.TYPE_CANINE) cuntPix.push(x);
					}
					x = RandomInCollection(cuntPix);

					if(pc.vaginaTypeUnlocked(x, GLOBAL.TYPE_CANINE))
					{
						output("\n\nAn unexpected heat erupts in your [pc.vagina " + x + "] followed by a overwhelming wave of arousal. You move your hand ");
						//PC is garbed:
						if(!pc.isCrotchExposed()) output("into your [pc.lowerGarment]");
						else if(pc.legCount > 1) output("between your [pc.legs]");
						else output("between your [pc.thighs]");
						output(" and find them completely drenched with the copious amount of fluids that drip from your vagina. Your lips are swelling obscenely around your fingers, puffing up deliciously as you grow more aroused. Then, all at once, your arousal dies off as the transformation ends just as abruptly as it started, leaving you needy, denied a well deserved orgasm, with wet and now much muskier fingers. <b>You now have a canine vagina that swells during arousal!</b>");
						pc.libido(2);
						pc.shiftVagina(x,GLOBAL.TYPE_CANINE);
					}
					else output("\n\n" + pc.vaginaTypeLockedMessage());
					changes++;
				}
				//Canine Tail
				//Effect: Has non-canine tail - turn into canine tail. Has no tail - grow canine tail.
				if(pc.tailType != GLOBAL.TYPE_CANINE && rand(3) == 0 && changes < changeLimit)
				{
					
					if(pc.tailCount > 0)
					{
						if(pc.tailTypeUnlocked(GLOBAL.TYPE_CANINE))
						{
							//PC has >1 tail:
							if(pc.tailCount > 1) output("\n\nAll of your [pc.tails] feel");
							else output("\n\nYour [pc.tails] feels");
							output(" odd, a shiver crawling back and forth through ");
							if(pc.tailCount > 1) output("them");
							else output("it");
							output(". Looking behind you, you can see its shape slowly changing, ");
							//Tail is Furred:
							if(pc.hasTailFlag(GLOBAL.FLAG_FURRED)) output("the fur becoming closer to that of a canine");
							else if(pc.hasTailFlag(GLOBAL.FLAG_SCALED) || pc.hasTailFlag(GLOBAL.FLAG_FEATHERED) || pc.hasTailFlag(GLOBAL.FLAG_CHITINOUS))
							{
								output("its ");
								if(pc.hasTailFlag(GLOBAL.FLAG_SCALED)) output("scales");
								else if(pc.hasTailFlag(GLOBAL.FLAG_FEATHERED)) output("feathers");
								else output("chitin");
								output(" falling off as a thick coat of fur grows underneath");
							}
							else output("the skin itching as a thick coat of fur grows on it");
							output(". Eventually the transformation ends and you see <b>your new canine tail happily wagging behind you.</b>");
							pc.tailType = GLOBAL.TYPE_CANINE;
							pc.clearTailFlags();
							pc.addTailFlag(GLOBAL.FLAG_FURRED);
							pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
							pc.addTailFlag(GLOBAL.FLAG_LONG);
						}
						else output("\n\n" + pc.tailTypeLockedMessage());
						changes++;
					}
					else
					{
						if(pc.tailCountUnlocked(1))
						{
							output("\n\nYou feel a painful pinch right on the tip of your tailbone and instinctively reach for it, finding a small bump that wasn’t there earlier. ");
							if(!pc.isAssExposed()) output("You pull down your [pc.lowerGarments] to take a better look at it. ");
							output("The bump grows larger, slowly and painfully extending your spine with new flesh and bone into a long, naked tail. The growth pains are quickly replaced by an intense itch all around your new tail as new fine hairs sprout from your [pc.skinColor] [pc.skinNoun]. They become thicker, covering it in a beautiful coat of fur. You enthusiastically wiggle <b>your [pc.furColor] canine tail back and forth.</b>");
							pc.tailCount = 1;
							pc.tailType = GLOBAL.TYPE_CANINE;
							pc.clearTailFlags();
							pc.addTailFlag(GLOBAL.FLAG_FURRED);
							pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
							pc.addTailFlag(GLOBAL.FLAG_LONG);
						}
						else output("\n\n" + pc.tailCountLockedMessage());
						changes++;
					}
				}
				//Multiply Tail
				//Effect: Has tail, less than 9 - clone tail.
				if(pc.tailType == GLOBAL.TYPE_CANINE && pc.tailCount < 9 && pc.tailCount >= 1 && changes < changeLimit && rand(4) == 0)
				{
					if(pc.tailCountUnlocked(pc.tailCount+1))
					{
						if(pc.tailCount == 1) output("\n\nYour wagging tail");
						else output("\n\nOne of your wagging tails");
						output(" seizes and loses all of its strength. You look at it, hoping to find why it hangs limply from your butt, but before you can take a good look, it begins to itch. The itch rapidly turns into pain as the tail splits, taking an excruciatingly long moment to snap into a shoddy, thin pair. After a second, they inflate with fresh mass, quickly returning to a hale and healthy state. Eventually they’re moving just like they used to. <b>Your [pc.tails] ");
						if(pc.tailCount == 1) output("has split into two!</b>");
						else output("have split into " + num2Text(pc.tailCount+1) + "!</b>");
						pc.tailCount++;
					}
					else output("\n\n" + pc.tailCountLockedMessage());
					changes++;
				}
				//Canine Arms
				//Effect: Has non-canine arm - turn into canine arms.
				if(pc.armType != GLOBAL.TYPE_CANINE && rand(3) == 0 && changes < changeLimit)
				{
					if(pc.armTypeUnlocked(GLOBAL.TYPE_CANINE))
					{
						output("\n\nYour hands feel strangely warm before becoming stiff. ");
						//Arm not Clawed:
						if(!pc.hasArmFlag(GLOBAL.FLAG_PAWS)) output("They begin to hurt as a gap opens on your fingertips and a set of canine claws soon comes out of them.");
						else output("Your claws begin to hurt as they change into a more canine set.");
						//Arm not Padded:
						if(!pc.hasArmFlag(GLOBAL.FLAG_PAWS)) output(" The pain moves from your fingertips to your palms and fingers as soft, cushiony pads grow on them.");
						else output(" The pain moves from your fingertips to your palms and fingers as your soft, cushiony pads shift position and shape.");
						//Arm not Furred:
						if(!pc.hasArmFlag(GLOBAL.FLAG_FURRED)) 
						{
							output(" The stiffness and pain are quickly replaced by an itch that covers the entirety of your arms as you");
							if(pc.hasArmFlag(GLOBAL.FLAG_SCALED) || pc.hasArmFlag(GLOBAL.FLAG_FEATHERED) || pc.hasArmFlag(GLOBAL.FLAG_CHITINOUS))
							{
								output("r");
								if(pc.hasArmFlag(GLOBAL.FLAG_SCALED)) output(" scales fall");
								else if(pc.hasArmFlag(GLOBAL.FLAG_FEATHERED)) output(" feathers fall");
								else output(" chitin falls");
								output(" off, and you");
							}
							output(" notice fine hair growing into a thick coat of beautiful [pc.furColor] fur.");
						}
						else output(" The stiffness and pain are replaced by an itch that covers the entirety of your arms, but it disappears just as quickly as it comes.");
						output(" <b>You now have a pair of canine arms!</b>");

						pc.armType = GLOBAL.TYPE_CANINE;
						pc.clearArmFlags();
						pc.addArmFlag(GLOBAL.FLAG_FURRED);
						pc.addArmFlag(GLOBAL.FLAG_PAWS);
					}
					else output("\n\n" + pc.armTypeLockedMessage());
					changes++;
				}
				//Canine Legs
				//Non-canine goo into Canine bipedal legs
				//Effect: Has non-canine goo legs - turn into canine two legs.
				if(pc.legType != GLOBAL.TYPE_CANINE && rand(3) == 0 && changes < changeLimit)
				{
					if(pc.legTypeUnlocked(GLOBAL.TYPE_CANINE))
					{
						if(pc.isGoo())
						{
							output("\n\nYour [pc.legOrLegs] strains with weakness, forcing you to lower your gooey body onto the ground before you collapse. You notice bones forming inside the goo as it turns less transparent and slowly transforms into flesh.");
							//PC has 1 leg:
							if(pc.legCount == 1) output("\n\nYour [pc.leg] splits lengthwise, turning into a pair of amorphous legs. ");
							else if(pc.legCount > 2) output("\n\nYour legs fuse together until only two remain, matched to an appropriate set of hips. ");
							else output("\n\n");
							if(!pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output("Shivers of agony slide through your legs, the joints cracking and reshaping into a digitigrade shape. ");
							//Leg not Paws:
							if(!pc.hasLegFlag(GLOBAL.FLAG_PAWS)) output("Your feet twist into a pair of dog-like paws with pads on the soles and claws in their toe tips. ");
							output("<b>You have a pair of canine legs!</b>");
							pc.legCount = 2;
							pc.genitalSpot = 0;
						}
						//Non-canine omnileg into Canine omnileg
						//Effect: Has non-canine omnileg - turn into canine omnileg.
						else if(pc.legCount == 1)
						{
							output("\n\nYou fall on the ground as your single [pc.leg] fails to maintain your posture. Bones start creaking and muscle starts contracting");
							//Leg not Digitigrade:
							if(!pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE))
							{
								output(", your [pc.leg] painfully shifting into a digitigrade leg");
								if(!pc.hasLegFlag(GLOBAL.FLAG_PAWS)) output(" and");
							}
							//Leg not Paws:
							if(!pc.hasLegFlag(GLOBAL.FLAG_PAWS))
							{
								if(pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output(", your [pc.leg]");
								output(" slowly gaining an adorable padded paw, tipped with claws");
							}
							//Leg is Digitigrade and Paws:
							if(pc.hasLegFlag(GLOBAL.FLAG_PAWS) && pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output(", the muscles readjusting into a more canine shape");
							output(".");
							if(!pc.hasLegFlag(GLOBAL.FLAG_FURRED)) output(" The discomfort is replaced by an itch as hairs starts to grow. Soon your leg is completely covered in a beautiful coat of [pc.furColor] fur.");
							output(" Seconds later, a seam forms in the middle, and your leg splits into two. When it’s all over, you stand up on <b>your new canine legs.</b>");
							pc.legCount = 2;
							pc.genitalSpot = 0;
						}
						//Non-canine bipedal into Canine bipedal legs
						else if(pc.legCount == 2)
						{
							output("\n\nYour [pc.legs] feel stiff and weak, throwing you off balance and forcing you to ");
							if(pc.hasKnees()) output("your knees");
							else output("the ground");
							output(". You roll onto your back, and agonizing pain consumes your lower half. The bones in your legs creak as they undergo a major transformation. It starts from your thighs, slowly descending across your legs, ");
							if(!pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output(" your toes lengthening while your heel moves upwards, reforming your legs into a digitigrade shape. The pain moves lower and lower");
							else output("the pain moving lower");
							if(!pc.hasLegFlag(GLOBAL.FLAG_PAWS)) output(" until it reaches your [pc.feet]. They twist into a pair of canine paws with claws on their toes and pads on their soles");
							else output(" applying some changes here and there, molding your legs into a more canine shape");
							output(". ");
							if(!pc.hasLegFlag(GLOBAL.FLAG_FURRED)) output("An itch spreads, signaling the growth of hairs. Your leg is swiftly covered in a beautiful coat of [pc.furColor] fur. Y");
							else output("As the pain ends, y");
							output("ou stand up and stretch them out, experimenting with <b>your new pair of furry canine legs.</b>");
						}
						//Non-canine tauric legs into Canine Tauric Legs(doesn’t change leg count)
						//Effect: Has non-canine taur legs - turn into canine taur legs.
						//Text:
						else
						{
							output("\n\nYour [pc.legs] grow weaker by the second, and you barely manage to not fall on your [pc.ass]. You hear the creaking sounds of bones being reshaped, starting down by your [pc.feet]. ");
							if(!pc.hasLegFlag(GLOBAL.FLAG_PAWS)) output("They slowly turn into canine paws with pads on their soles and claws instead of nails. ");
							//Leg not Digitigrade:
							if(!pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output("The sensation moves upwards as your heels rise, your toes lengthen, and your muscles shift to transform your legs into a digitigrade form. ");
							//Leg is Digitigrade, Leg is Paws:
							output("When the climbing wave reaches your [pc.thighs] the transformation rapidly turns a lot more violent, as bones, muscles and organs are painfully and brutally changed into a more canine form.");
							//Leg not Furred:
							if(!pc.hasLegFlag(GLOBAL.FLAG_FURRED)) output("An itch soon follows as your legs grow a beautiful coat of [pc.furColor] fur. ");
							output("When it ends, you see that from the waist down <b>you have the body of a canine, your humanoid half starting where its neck should be, with " + num2Text(pc.legCount) + " canine legs.</b>");
						}
						pc.clearLegFlags();
						pc.addLegFlag(GLOBAL.FLAG_FURRED);
						pc.addLegFlag(GLOBAL.FLAG_PAWS);
						pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
						pc.legType = GLOBAL.TYPE_CANINE;
					}
					else output("\n\n" + pc.legTypeLockedMessage());
					changes++;
				}
				
				//Fur Color Change
				//Effect: PC has fur - Fur color changes sometimes, usually when there's nothing else to change.
				var newColor:String = RandomInCollection(["grey","cream","white","golden","brown","silver","orange","black"]);
				if(pc.hasFur() && pc.furColor != newColor && rand(5) == 0 && changes < changeLimit)
				{
					if(pc.furColorUnlocked(newColor))
					{
						output("\n\nSmall specks of " + newColor + " appear on your [pc.skinFurScalesColor] fur. These spots grow larger and more numerous as they spread around your body, eventually changing its entire surface. <b>Your fur is now " + newColor + ".</b>");
						pc.furColor = newColor;
						//possible color changes:Grey/Cream/White/Golden/Brown/Silver/Orange/Black}
						//if patterns are impossible just go with color.
						//possible pattern changes: Spotted/Splotched/Bellied/Tuxedo/Blanket/Brindle/Speckled}
					}
					else output("\n\n" + pc.furColorLockedMessage());
					changes++;
				}
				//Grow Fur
				//Effect: Lacks fur - skin turn into fur.
				if(!pc.hasFur() && (pc.earType == GLOBAL.TYPE_CANINE || pc.tailType == GLOBAL.TYPE_CANINE) && pc.armType == GLOBAL.TYPE_CANINE && pc.legType == GLOBAL.TYPE_CANINE && rand(2) == 0 && changes < changeLimit)
				{
					if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
					{
						if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) output("\n\nThe surface of your goo body feels strange and tingly. Looking at it, you see that it’s slowly shifting into skin, losing its translucence and becoming much more solid. The transformation continues until you are left with only [pc.skinColor] skin. The tingling sensation turns into an itch as new hair sprouts all over your body, completely covering it in a coat of beautiful fur. <b>You’ve grown [pc.furColor] fur!</b>");
						//Scales/Feathers skin:
						else if(InCollection(pc.skinType, [GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_FEATHERS])) 
						{
							output("\n\nA sudden itch spreads throughout your body. A powerful urge to scratch yourself wells up within you. Doing anything other than caving into it never crosses your mind. You scratch and scratch all over until you spot a single [pc.furColor] ");
							if(pc.hasScales()) output("scale");
							else output("feather");
							output(" on the ground. More ");
							if(pc.hasScales()) output("scales");
							else output("feathers");
							output(" gather at your [pc.feet], prompting you to stop scratching for a moment out of worry. Your concerns are soon drowned out by the overwhelming itchiness, though, leading you to scratch yourself like you’ve never scratched before. From beneath every ");
							if(pc.hasScales()) output("scale that flakes");
							else output("feather that falls");
							output(" off, a patch of thin hair grows. Only when the thin hairs grow thicker, completely covering your entire body in a beautiful coat of fur, does the itching stop. <b>Your body is now covered in [pc.furColor] fur!</b>");
						}
						//Bare Skin:
						else output("\n\nYou feel an itch starting on your back, and you reach to scratch it. Unfortunately, you can’t quite get at it, but the itch continues to grow stronger, forcing you to strain still harder in an attempt to reach the elusive spot. You do manage to get a few good scratches in before you realize that particular spot is now covered in a patch of fur. Similar itches begin all over your body, followed by more patches of fur. When the itching stops, you find that <b>your body is completely covered in [pc.furColor] fur!</b>");
						pc.clearSkinFlags();
						pc.skinType = GLOBAL.SKIN_TYPE_FUR;
						pc.addSkinFlag(GLOBAL.FLAG_FURRED);
					}
					else output("\n\n" + pc.skinTypeLockedMessage());
					changes++;
				}
				//Dud
				if(changes == 0) output("\n\nAfter waiting a long while, you realize that this one is a dud. That or you’re as dog-like as you’re going to get. One of the two.");
				return false;
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " consume the Pupper Popper to no effect.");
			}
			return false;
		}
	}
}