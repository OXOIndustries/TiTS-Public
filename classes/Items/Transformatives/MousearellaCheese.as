package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.num2Ordinal;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	
	public class MousearellaCheese extends ItemSlotClass
	{
		public function MousearellaCheese()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.FOOD;
			shortName = "MouseCh";
			longName = "Mousearrela Cheese";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a wedge of Mousearrela Cheese";
			tooltip = "A cheesy snack covered in a thin plastic wrapper with the image of a cartoon mouse nibbling on an oversized wedge of Swiss cheese. To the side in fine print is a warning about this product’s mutative properties.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 800;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Higuera");
			
			if(target is PlayerCharacter)
			{
				//On Use
				var changes:Number = 0;
				var changeLimit:Number = 2;
				if(rand(2) == 0) changeLimit++;

				var pc:Creature = target;
				var maxHeight:Number = 5*12;
				var maxHips:Number = 2;
				var maxButt:Number = 4;
				var maxBoobs:Number = 0;
				var maxBalls:Number = 3 + (pc.hasPerk("Bulgy") ? 3:0);
	
				output("You unwrap the bite-sized snack and quickly toss it into your mouth, spending a minute to enjoy the dense, creamy taste before it slides down your throat." + (InCollection(pc.race(), "mouse", "mouse-morph", "rodenian", "half-rodenian", "rat", "rat-morph") ? " You can’t help but shiver in delight as the tasty treat hits with a hard shot of pleasure...":""));
				
				if(pc.isHerm())
				{
					maxHeight -= 1;
					maxHips = 6;
					maxButt = 7;
					maxBoobs = 3;
				}
				else if(pc.mf("","f") == "f") 
				{
					maxHeight -= 3;
					maxHips = 9;
					maxButt = 8;
					maxBoobs = 3;
				}
				
				//Height Decrease
				if(pc.tallness > maxHeight && changes < changeLimit && rand(2) == 0)
				{
					if(pc.tallnessUnlocked(maxHeight))
					{
						output("\n\nYou suddenly stumble towards support as vertigo strikes. After a moment of confusion you reorient yourself, <b>albeit at a smaller size than before.</b>");
						pc.tallness -= 2 + rand(4);
						if(pc.tallness > 6*12) pc.tallness -= 2 + rand(4);
						if(pc.tallness > 8*12) pc.tallness -= 2 + rand(4);
						if(pc.tallness > 10*12) pc.tallness -= 2 + rand(4);
						changes++;
					}
					else output("\n\n"+pc.tallnessLockedMessage());
				}
				//Hip Width Decrease
				if(pc.hipRatingRaw > maxHips && changes < changeLimit && rand(3) == 0)
				{
					if(pc.hipRatingUnlocked(maxHips))
					{
						output(ParseText("\n\nAn uncomfortably strange feeling you cannot describe with words washes over your [pc.legOrLegs], investigating the source you realize <b>your hips have become slightly narrower than before!</b>"));
						pc.hipRatingRaw--;
						if(pc.hipRatingRaw > 10) pc.hipRatingRaw--;
						if(pc.hipRatingRaw > 16) pc.hipRatingRaw--;
						changes++;
					}
					else output("\n\n"+pc.hipRatingLockedMessage());
				}
				//Butt Size Decrease
				if(pc.buttRatingRaw > maxButt && changes < changeLimit && rand(2) == 0)
				{
					if(pc.buttRatingUnlocked(maxButt))
					{
						output(ParseText("\n\nA few seconds after swallowing the wedge, your [pc.ass] goes numb as if you’d sat on it the wrong way too long. Massaging your cheeks to regain feeling, you realize <b>your ass has shrunk!</b>"));
						pc.buttRatingRaw--;
						if(pc.buttRatingRaw > 10) pc.buttRatingRaw--;
						if(pc.buttRatingRaw > 16) pc.buttRatingRaw--;
						changes++;
					}
					else output("\n\n"+pc.buttRatingLockedMessage());
				}
				//Ball Size Decrease
				if(pc.ballSizeRaw > maxBalls && pc.balls > 0 && changes < changeLimit && rand(3) == 0)
				{
					if(pc.ballSizeUnlocked(maxBalls))
					{
						output(ParseText("\n\nA chilling sensation runs across your [pc.balls]. " + (!pc.isCrotchExposed() ? "Undoing your [pc.crotchCovers], y":"Y") + "ou watch as your [pc.sack] tightens and shrinks, as the feeling fades you notice <b>your ball" + (pc.balls > 1 ? "s have":" have") + " shrunk in size!</b>"));
						pc.ballSizeRaw--;
						if(pc.ballSizeRaw > 12) pc.ballSizeRaw--;
						if(pc.ballSizeRaw > 18) pc.ballSizeRaw--;
						if(pc.ballSizeRaw > 24) pc.ballSizeRaw--;
						if(pc.ballSizeRaw > 32) pc.ballSizeRaw--;
						if(pc.ballSizeRaw > 40) pc.ballSizeRaw--;
						if(pc.ballSizeRaw > 50) pc.ballSizeRaw--;
						if(pc.ballSizeRaw > 72) pc.ballSizeRaw--;
						changes++;
					}
					else output("\n\n"+pc.ballSizeLockedMessage());
				}
				//Breast Size Decrease
				if(pc.biggestTitSize() > maxBoobs && changes < changeLimit && rand(3) == 0)
				{
					if(pc.breastRatingUnlocked(0, 3))
					{
						output(ParseText("\n\nA warm sensation washes over your chest as your [pc.breasts] slowly shrink, begging you to give your soft mounds the attention they crave. However, you force your hands to your back and wait for the warmth to die down, <b>leaving you a cup size smaller than before.</b>"));
						for(var i:int = 0; i < pc.bRows(); i++)
						{
							//Only shrink boobs that are 2big!
							if(pc.breastRows[i].breastRatingRaw > maxBoobs)
							{
								pc.breastRows[i].breastRatingRaw--;
								if(pc.breastRows[i].breastRatingRaw > 5) pc.breastRows[i].breastRatingRaw--;
								if(pc.breastRows[i].breastRatingRaw > 30) pc.breastRows[i].breastRatingRaw--;
								if(pc.breastRows[i].breastRatingRaw > 60) pc.breastRows[i].breastRatingRaw--;
							}
						}
						changes++;
					}
					else output("\n\n"+pc.breastRatingLockedMessage())
				}
				//Change Legs to Mouse
				if(pc.tailType == GLOBAL.TYPE_MOUSE && (pc.legType != GLOBAL.TYPE_MOUSE || pc.legCount < 2) && changes < changeLimit && pc.hasFur() && rand(2) == 0)
				{
					if(pc.legCount < 1 && !pc.legCountUnlocked(2)) output("\n\n"+pc.legCountLockedMessage());
					else if(pc.legTypeUnlocked(GLOBAL.TYPE_MOUSE))
					{
						if(pc.isTaur())
						{
							output("\n\nYou suddenly collapse to the ground in agony, watching as your bestial lower body shifts and writhes, reshaping itself into a more... rodent-like form. By the time the process completes, you’re left with <b>a gigantic version of a mouse’s body</b>." + (pc.hasGenitals() ? " Fortunately, your genitalia remains more or less where you would expect it, unaltered.":""));
						}
						else
						{
							output("\n\nYou suddenly collapse to the ground in agony, watching as your [pc.legOrLegs] " + (pc.legCount != 1 ? "rearrange themselves into <b>anthropomorphized, mouse-like shape.</b>":"splits apart and shortens into <b>something akin to a Terran Mouse.</b>"));
							//if Goo: legs mold and solidify into <b>something not unlike a Terran mouse.</b>
							pc.legCount = 2;
						}
						pc.legType = GLOBAL.TYPE_MOUSE;
						pc.legFlags = [GLOBAL.FLAG_DIGITIGRADE,GLOBAL.FLAG_PAWS,GLOBAL.FLAG_FURRED];
						changes++;
					}
					else output("\n\n"+pc.legTypeLockedMessage());
				}
				//Grow Fur
				if(!pc.hasFur() && changes < changeLimit && pc.armType == GLOBAL.TYPE_MOUSE && pc.earType == GLOBAL.TYPE_MOUSE && rand(3) == 0)
				{
					if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
					{
						var furColor:String = RandomInCollection(["black","gray","white","ivory","brown","blonde","tan"]);
						if(InCollection(pc.furColor,"black","gray","white","ivory","brown","blonde","tan")) furColor = pc.furColor;
						output("\n\nMoments after munching down on the bite sized wedge, ");
						//If PC has scale, feather, or chitin:
						if(pc.hasScales() || pc.hasFeathers() || pc.hasChitin()) output("your [pc.skinFurScalesNoun] " + (pc.hasChitin() ? "fall":"falls") + " to the ground in heavy clumps, the raw skin across your body sprouting <b>tufts of " + furColor + " fur</b> that cover you in short order.");
						//If PC has skin:
						else output(" your skin crawls as you watch sprouts of hair shoot out, little by little blanketing your entire body in a <b>coat of " + furColor + " fur!</b>");
						pc.clearSkinFlags();
						pc.skinType = GLOBAL.SKIN_TYPE_FUR;
						pc.furColor = furColor;
						changes++;
					}
					else output("\n\n"+pc.skinTypeLockedMessage());
				}
				//Grow/Change Tail
				if((pc.tailCount == 0 || (pc.tailCount > 0 && pc.tailType != GLOBAL.TYPE_MOUSE)) && changes < changeLimit && rand(2) == 0)
				{
					if(pc.tailTypeUnlocked(GLOBAL.TYPE_MOUSE))
					{
						if(pc.tailCountUnlocked(1))
						{

							//(if PC does not have a tail)
							if(pc.tailCount == 0)
							{
								output("\n\nA numb tingling sensation develops at the base of your spine. Looking towards a reflective surface nearby, you notice a pink, ropey tail sprouting out from your behind that barely reaches your ankles. As sensation returns, <b>so it does to your new mouse tail.</b>");
							}
							//(if PC has more than one existing tail)
							else if(pc.tailCount > 1)
							{
								output(ParseText("\n\nWith a sudden twinge of pain followed by nothing, you watch in a nearby reflection as your [pc.tails] merge and shift, shedding excess material as they form into <b>a single ropey, pink mouse tail!<b>"));
							}
							//(if PC has an existing tail)
							else
							{
								output(ParseText("\n\nYou watch with a hint of curiosity as your numbing [pc.tail] shifts in shape and sheds any excess material, slowly warping into <b>a ropey, pink mouse’s tail</b> that reaches down to your " + (pc.hasFeet() ? "ankles":"[pc.foot]") + "."));
							}
							pc.tailCount = 1;
							pc.clearTailFlags();
							pc.tailType = GLOBAL.TYPE_MOUSE;
							pc.tailFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE,GLOBAL.FLAG_SMOOTH,GLOBAL.FLAG_TAPERED];
							changes++;
						}
						else output("\n\n"+pc.tailCountLockedMessage());
					}
					else output("\n\n"+pc.tailTypeLockedMessage());
				}
				//Grow Ears
				if(pc.earType != GLOBAL.TYPE_MOUSE && changes < changeLimit && rand(2) == 0)
				{
					if(pc.earTypeUnlocked(GLOBAL.TYPE_MOUSE))
					{
						output("\n\nWith an odd... buzzing sensation, you feel the auricle of your ear growing larger by the second, and when it finally settles down <b>you find a large pair of [pc.skinColor], dish-like mouse ears in their place.</b>");
						pc.earType = GLOBAL.TYPE_MOUSE;
						target.clearEarFlags();
						target.addEarFlag(GLOBAL.FLAG_FURRED);
						changes++;
					}
					else output("\n\n"+pc.earTypeLockedMessage());
				}
				//Change Face to Mouse
				if(pc.faceType != GLOBAL.TYPE_MOUSE && changes < changeLimit && pc.earType == GLOBAL.TYPE_MOUSE && pc.hasFur() && rand(3) == 0)
				{
					if(pc.faceTypeUnlocked(GLOBAL.TYPE_MOUSE))
					{
						output(ParseText("\n\nHeat ripples outwards from your [pc.face] as it rearranges itself in a manner that, to an onlooker, would appear utterly unnatural, [pc.skinFurScales] oscillating. After a moment of light-headedness the warmth seems to simply dissipate. Looking into a reflective surface you realize <b>your new face now resembles a Terran mouse’s, complete with whiskers.</b>"));
						pc.faceType = GLOBAL.TYPE_MOUSE;
						pc.faceFlags = [GLOBAL.FLAG_MUZZLED,GLOBAL.FLAG_FURRED];
						changes++;
					}
					else output("\n\n"+pc.faceTypeLockedMessage());
				}
				
				//Change Arms to Mouse
				if(pc.armType != GLOBAL.TYPE_MOUSE && changes < changeLimit && rand(3) == 0)
				{
					if(pc.armTypeUnlocked(GLOBAL.TYPE_MOUSE))
					{
						var furColor2:String = RandomInCollection(["black","gray","white","ivory","brown","blonde","tan"]);
						if(InCollection(pc.furColor,"black","gray","white","ivory","brown","blonde","tan")) furColor2 = pc.furColor;
						output(ParseText("\n\nAs you scratch your itchy arms, you realize that they seem to be growing " + furColor2 + " fur, your [pc.arms] shifting towards a new form. By the time it’s finished changing you have <b>fuzzy mouse limbs, complete with paws.</b>"));
						pc.armType = GLOBAL.TYPE_MOUSE;
						pc.furColor = furColor2;
						pc.armFlags = [GLOBAL.FLAG_PAWS,GLOBAL.FLAG_FURRED];
						changes++;
					}
					else output("\n\n"+pc.armTypeLockedMessage());
				}
				if(changes == 0)
				{
					output("\n\nYou wait but nothing seems to happen. Maybe it was a dud?" + ((pc.armType == GLOBAL.TYPE_MOUSE && pc.legType == GLOBAL.TYPE_MOUSE && pc.tailType == GLOBAL.TYPE_MOUSE && pc.tailCount > 0 && pc.hasFur() && pc.earType == GLOBAL.TYPE_MOUSE && pc.faceType == GLOBAL.TYPE_MOUSE) ? " Or maybe you just can’t become more mouse-like...":""));
				}
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " eats the cheese to no effect.");
			}
			return false;
		}
	}
}