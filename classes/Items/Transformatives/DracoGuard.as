package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Engine.Utility.indefiniteArticle;
	import classes.Engine.Utility.num2Text;
	
	public class DracoGuard extends ItemSlotClass
	{
		
		//constructor
		public function DracoGuard()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "DracoG.";
			//Regular name
			this.longName = "DracoGuard pill";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a DracoGuard pill";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A product of the Gryvain Heartland Republic, these golden pills are meant to counteract mutations suffered by the winged reptilian race when out among the stars. In the hands of anyone else, though, this blend of gene-splices and one-use micro-surgeons may cause physical transformations similar to the features of a gryvain.";
			
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
			
			this.version = this._latestVersion;
		}
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Savin");
			if(target is PlayerCharacter) {
				output("You tear open the small packet and tap the golden pill out into your palm. It’s a small thing, colored the same as a gryvain’s eyes, and faintly warm in your hand. Without a second thought, you pop the pill into your mouth and swallow it down.");
				
				var pc:Creature = target;
				// Heal 20
				// Restore 5 ENG
				// +1 Libido
				pc.changeHP(20);
				pc.changeEnergy(5);
				pc.changeLust(5);
				
				var changes:int = 0;
				var changeLimit:int = 1;
				if(rand(2) == 0) changeLimit++;
				if(rand(3) == 0) changeLimit++;
				if(rand(3) == 0) changeLimit++;
				
				//Always +Femininity, and grants other effects. 
				
				//+Femininity (2-6 pts.), up to 70+
				if(pc.femininity < 70)
				{
					var newFem:Number = pc.femininity + 2 + rand(5);
					if(newFem > 70) newFem = 70;
					
					if(pc.femininityUnlocked(newFem))
					{
						output("\n\nThe first thing you feel is a faint tingle running across your face -- an electric buzz in your lips and cheeks, followed by a slight tightness. You flip your Codex out of your pack and look at yourself in its reflective back. You look just a touch more delicate now, you think: your cheeks are a little higher, lips a little fuller, and your eyelashes have grown richer than before. <b>You’ve become more feminine!</b>");
						
						pc.femininity = newFem;
					}
					else output("\n\n" + pc.femininityLockedMessage());
				}
				//Grow/Change Wings
				if(changes < changeLimit && pc.wingType != GLOBAL.TYPE_GRYVAIN && rand(4) == 0) {
					if(pc.wingTypeUnlocked(GLOBAL.TYPE_GRYVAIN))
					{
						//Grow draconic wings; doesn't already have wings.
						if(!pc.hasWings())
						{
							output("\n\nThe muscles along your back suddenly tighten, straining against an unbidden pressure. You grunt in discomfort,");
							if(pc.isChestGarbed()) output(" loosening your garments and");
							output(" moving your pack out of the way. The muscles on your shoulders twist and knot up, not quite painful but certainly uncomfortable enough to leave you gritting your teeth.");
							output("\n\nA moment later and your [pc.skinFurScalesNoun] stretches, distending just below the shoulder blades. You grimace and reach back, just in time to feel two slender growths sprouting from your back! You panic for a moment as the protrusions grow in, <b>filling out into sprawling draconic wings</b>! You feel your new limbs growing scaly coverings and growing talon-like bones at their tips.");
							output("\n\nA few minutes later and the gryvain-like growth spurt seems to tapered off, giving you a moment’s respite to flex your muscles -- and elicit a gentle beat of your new wings! It takes a bit of getting used to, but you soon have command of your new appendages, and can even lift yourself off the ground -- if only for a few moments!");
							
							pc.shiftWings(GLOBAL.TYPE_GRYVAIN, 2);
						}
						//Change wingtype to draconic (already has wings).
						else
						{
							output("\n\nYou feel a tingling spread across your [pc.wings], making your muscles twitch and knot incessantly. With a grunt of discomfort, you reach back and run a hand across your wings -- only to realize that they’re changing! Scales are spreading out across them, linking long, membranous areas and bony, talon-like protrusions. By the time the changes seem to finish, <b>your wings have become sweeping, powerful dragon’s wings!</b>");
							pc.wingType = GLOBAL.TYPE_GRYVAIN;
							if(pc.wingCount < 2) pc.wingCount = 2;
						}
						changes++;
					}
					else output("\n\n" + pc.wingTypeLockedMessage());
				}
				//Grow +2x dragon wings (only has 2; already dragon wings)
				else if(changes < changeLimit && (pc.hasWings(GLOBAL.TYPE_GRYVAIN) || pc.hasWings(GLOBAL.TYPE_DRACONIC)) && pc.wingCount == 2 && rand(4) == 0)
				{
					output("\n\nThe muscles underneath your majestic dragon’s wings begin to contract and tighten, knotting around some unbidden pressure. A few second pass before you feel your flesh expanding, erupting into new limbs! ");
					output("\n\nYou gasp, reaching back around to feel as a pair of new wings fill in behind you, growing in beneath the first pair. Like your first, the second pair is a sweeping set of draconic wings, with bony talons and strong membranes, almost bat-like, with a span that would make any gryvain proud. You smile to yourself and <b>give your two new wings</b> a mighty beat, using the quartet you now possess to lift yourself off the ground with ease!");
					
					pc.wingCount += 2;
					changes++;
				}
				//Change skin-type to human/flesh
				if(changes < changeLimit && pc.skinType != GLOBAL.SKIN_TYPE_SKIN && rand(2) == 0)
				{
					if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
					{
						output("\n\nA faint, almost pleasurable tinge starts spreading across your [pc.skinFurScales]. You shiver and moan, reaching down to touch yourself... and finding that your [pc.skinFurScales] is changing! Your body is changing, losing its normal coating and sprouting normal, human-like skin in its place! It takes only a few moments for your entire upper body to change its form");
						var gryvainSkinColor:Array = ["pale", "tanned", "pink"];
						if(pc.legType == GLOBAL.TYPE_GRYVAIN)
						{
							output(", though the pill’s splices are cunning enough to leave your scales intact from the waist down, letting you retain your reptilian legs");
							gryvainSkinColor.push("dark red", "dark green");
						}
						
						pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
						pc.clearSkinFlags();
						pc.skinTone = gryvainSkinColor[rand(gryvainSkinColor.length)];
						changes++;
						
						output(". <b>Most of your body is now covered in " + pc.skinTone + " human skin!</b>");
					}
					else output("\n\n" + pc.skinTypeLockedMessage());
				}
				//Grow/Change Tail
				if(changes < changeLimit && (pc.tailCount == 0 || pc.tailType != GLOBAL.TYPE_GRYVAIN) && rand(3) == 0)
				{
					if(pc.tailTypeUnlocked(GLOBAL.TYPE_GRYVAIN) && pc.tailType != GLOBAL.TYPE_GRYVAIN)
					{
						//Grow gryvain tail (no tail)
						if(pc.tailCount == 0)
						{
							output("\n\nSomething shifts just under your [pc.skinFurScales], right above your [pc.butt]. You twist around, trying to see what’s going on... and feeling a sudden spike of pressure at the base of your spine! You grit your teeth and find yourself instinctively pushing back, in time to feel your [pc.skinFurScales] erupt in a surge of growth! The flesh around your spine expands, pushing outwards and down, drooping behind your [pc.legOrLegs]. It doesn’t take long before you realize <b>you’re growing a tail!</b>");
							output("\n\nA few moments of growing, expansive sensation and your body seems to settle down, leaving you with a scale-wrapped tail about as long as you are tall, and with a little effort, you’re able to start curling it and swishing it from side to side. With a little practice, you’re sure this new appendage will be incredibly dexterous! Not to mention, you feel much more sure of your balance, and find yourself moving with a greater, almost sensual confidence!");
							
							pc.tailCount = 1;
						}
						//Change tailtype to gryvain (from any other type)
						else
						{
							output("\n\nAn aching tingle starts spreading through your [pc.tails]. The sensation changes slowly, feeling like a... like you’re hardening, becoming thicker and fuller. A glance over your shoulder shows that your tail" + (pc.tailCount == 1 ?" is" : "s are") + " mutating, covering with scales and becoming thick as your neck at the base, tapering down to nothing but a hair-thin point several feet later! No doubt about it, <b>you’ve got" + (pc.tailCount == 1 ? " a gryvain tail" : " gryvain tails") + " now!</b>");
						}
						pc.clearTailFlags();
						pc.tailType = GLOBAL.TYPE_GRYVAIN;
						pc.addTailFlag(GLOBAL.FLAG_SCALED);
						pc.addTailFlag(GLOBAL.FLAG_LONG);
						pc.addTailFlag(GLOBAL.FLAG_TAPERED);
						pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						changes++;
					}
					else output("\n\n" + pc.tailTypeLockedMessage());
				}
				//Reduce TailCount to 1
				if(changes < changeLimit && pc.tailCount > 1 && rand(4) == 0)
				{
					if(pc.tailCountUnlocked(1))
					{
						output("\n\nA tight, clenching sensation starts spreading through your backend, right above your [pc.butt]! You twist around, just in time to see all but your top-most tail twitching uncontrollably. A moment later and your eyes go wide, watching all but the first simply fall off, flopping painlessly to the ground. <b>You’re left with only one [pc.tail] now!</b>");
						
						pc.tailCount = 1;
						changes++;
					}
					else output("\n\n" + pc.tailCountLockedMessage());
				}
				//Change legs to Reptilian (scaled + clawed).
				//PC must have skin-type... uh, skin... already. Also legs.
				if(changes < changeLimit && pc.legType != GLOBAL.TYPE_GRYVAIN && pc.isBiped() && rand(2) == 0)
				{
					if(pc.legTypeUnlocked(GLOBAL.TYPE_GRYVAIN))
					{
						output("\n\nAll of a sudden, your [pc.legs] start to itch. You grimace");
						if(pc.hasFeet()) output(", bouncing from foot to foot");
						output(" as the uncomfortable sensation spreads");
						if(pc.hasToes()) output(" from toe to crotch");
						output(". Finally, you grunt and");
						if(!pc.isNude()) output(" pull your gear aside, looking");
						else output(" look");
						output(" down.");
						output("\n\nYour [pc.legsNoun] are changing! Your [pc.skin] is twitching and sprouting, erupting into a fine coating of reptilian scales! The coating spreads out across your [pc.legsNoun], all the way up to your [pc.hips] and down to your [pc.toes], which begin to grow into long, sharp claws that click with every step. <b>Your entire lower body is covered in fine, draconic scales now!</b>");
						pc.legType = GLOBAL.TYPE_GRYVAIN;
						pc.clearLegFlags();
						pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
						pc.addLegFlag(GLOBAL.FLAG_SCALED);
						changes++;
					}
					else output("\n\n" + target.legTypeLockedMessage());
				}
				//Change facial shape to human
				//Comes with a big Femininity boost!
				if(changes < changeLimit && pc.faceType != GLOBAL.TYPE_HUMAN && rand(2) == 0)
				{
					if(pc.faceTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						output("\n\nYour nose twitches, an instinctive motion in response to a sudden itch. You try and ignore it for a moment, but the sensation only spreads, to your cheeks and brow, finally making you start scratching at yourself, then looking into your Codex’s reflection to see what’s wrong.");
						output("\n\nYou’re changing!");
						output("\n\nThe shape of your face slowly molds itself, painless but not strictly comfortable, becoming smoother, curving and feminine -- and soon, decidedly human. You brush your new, shapely cheeks and admire yourself in the mirror. <b>Your face now looks perfectly human");
						if(pc.femininity < pc.femininityMax())
						{
							output(", and much softer and more feminine than ever");
							pc.femininity += 10;
							if(pc.femininity > pc.femininityMax()) pc.femininity = pc.femininityMax();
						}
						output("!</b>");
						
						pc.faceType = GLOBAL.TYPE_HUMAN;
						pc.clearFaceFlags();
						pc.addFaceFlag(GLOBAL.FLAG_SMOOTH);
						changes++;
					}
					else output("\n\n" + pc.faceTypeLockedMessage());
				}
				//Gain Gryvain-type eyes
				if(changes < changeLimit && pc.eyeType != GLOBAL.TYPE_GRYVAIN && rand(4) == 0)
				{
					if(pc.eyeTypeUnlocked(GLOBAL.TYPE_GRYVAIN))
					{
						output("\n\nSuddenly, your vision goes blurry, and your eyes start watering. You blink quickly, trying to clear them, but the irritation persists for what seems like an eternity! Your vision keeps getting worse, almost shriveling to blackness before erupting again into a cascade of brilliant colors!");
						output("\n\nYou blink, suddenly feeling perfectly fine -- better than ever, really! You take a look at yourself on the shiny back of your Codex, and can’t help but grin as you see <b>your eyes have changed! They’re dark yellow and slitted now</b>, with tendrils of black snaking in every direction from your draconic irises. Your peepers look just like a gryvain’s now!");
						
						pc.eyeType = GLOBAL.TYPE_GRYVAIN;
						pc.eyeColor = "dark yellow";
						changes++;
					}
					else output("\n\n" + pc.eyeTypeLockedMessage());
				}
				//Hair type changes to hair, grow +(1-3) inches
				if(changes < changeLimit && pc.hasHair() && pc.hairType != GLOBAL.HAIR_TYPE_REGULAR && rand(4) == 0)
				{
					if(pc.hairTypeUnlocked(GLOBAL.HAIR_TYPE_REGULAR))
					{
						output("\n\nYou reach a hand up and start scratching at your scalp, mindlessly at first until you start to realize that you can’t <i>stop</i>! Glancing up, you realize that your [pc.hair] is changing, becoming soft and fine and flexible... and very human! It’s also a bit longer than you remember, and oh-so lustrous now! Very sexy!");
						
						pc.hairType = GLOBAL.HAIR_TYPE_REGULAR;
						pc.hairLength += 1 + rand(3);
						changes++;
					}
					else output("\n\n" + pc.hairTypeLockedMessage());
				}
				//Grow hair out (less than 12 inches long) (Grow 1-3 inches)
				//Must already have normal hair
				if(changes < changeLimit && pc.hasHair() && pc.hairType == GLOBAL.HAIR_TYPE_REGULAR && pc.hairLength < 12 && rand(4) == 0)
				{
					var newHairLength:Number = pc.hairLength + 1 + rand(3);
					
					if(pc.hairLengthUnlocked(newHairLength))
					{
						output("\n\nSomething tingles in your hair, just above the scalp. Cocking a brow, you reach up and run a hand through your hair -- and find that it seems just a little bit longer than before! Your mane looks that much more lush and regal now.");
						
						pc.hairLength = newHairLength;
						changes++;
					}
					else output("\n\n" + pc.hairLengthLockedMessage());
				}
				//Gain draconic horns.
				if(changes < changeLimit && !pc.hasHorns() && rand(4) == 0)
				{
					if(pc.hornsUnlocked(2) && pc.hornTypeUnlocked(GLOBAL.TYPE_GRYVAIN))
					{
						output("\n\nPressure starts building in your head, like the late stage of a headache but so much more crushing -- more like your head is in a vice! Groaning, you put your hands on your temples, trying to alleviate the pressure... only to find something growing from your brow! You gasp, feeling around as a pair of thick bumps rise from your head, splitting from the skin and curling back, sweeping over your head as they grow and grow.");
						output("\n\nWhen the growth spurt seems to finish off, you run your fingertips along the protrusions. No doubt about it, <b>you’ve got a pair of majestic, draconic horns now!</b>");
						
						pc.horns = 2;
						pc.hornType = GLOBAL.TYPE_GRYVAIN;
						pc.hornLength = 3 + rand(4);
						changes++;
					}
					else if(pc.hornTypeUnlocked(GLOBAL.TYPE_GRYVAIN)) output("\n\n" + pc.hornsLockedMessage());
					else output("\n\n" + pc.hornTypeLockedMessage());
				}
				//Change ear-type to reptilian
				if(changes < changeLimit && pc.earType != GLOBAL.TYPE_GRYVAIN && rand(2) == 0)
				{
					if(pc.earTypeUnlocked(GLOBAL.TYPE_GRYVAIN))
					{
						output("\n\nYou feel something like a pinch on the tip of your [pc.ear], pulling at it. You swipe a hand back that way, thinking something’s caught you, yet find nothing but [pc.skin] -- but not where it ought to be. Letting your fingers wander, you feel that your ear itself has sunk into the side of your head and is now shielded by a sweeping, bony fin -- a pair of them on either side! <b>You’ve got frilled reptilian ears now!</b>");
						
						pc.earType = GLOBAL.TYPE_GRYVAIN;
						target.clearEarFlags();
						pc.earLength = 3;
						changes++;
					}
					else output("\n\n" + pc.earTypeLockedMessage());
				}
				//Increase hipsize.
				//Higher proc chance up to very large; lower proc chance up to huge, broodmother hips
				if(changes < changeLimit && ((pc.hipRatingRaw < 10 && rand(2) == 0) || (pc.hipRatingRaw < 20 && rand(4) == 0)))
				{
					var newHipSize:Number = pc.hipRatingRaw + 1 + rand(2);
					if(newHipSize > 20) newHipSize = 20;
					
					if(pc.hipRatingUnlocked(newHipSize))
					{
						output("\n\nYour gear seems to strain around your waist, making you fidget and wobble unsteadily. Instinctively, your hands drop to your hips, just in time to feel them getting wider! Your bones broaden, getting nice and big, like they’re ready to lay eggs, and you’re sure your thighs are getting a little thicker to boot. You’re left with a swaying, sexy gait, instinctively wiggling your broader hips with every step now!");
						
						pc.hipRatingRaw = newHipSize;
						changes++;
					}
					else output("\n\n" + pc.hipRatingLockedMessage());
				}
				//Grow breasts!
				//If PC doesn't have boobs, grow C-cups!
				if(changes < changeLimit && !pc.hasBreasts() && rand(4) == 0)
				{
					if(pc.breastRatingUnlocked(0, 3))
					{
						output("\n\nYour [pc.chest] swells, the skin stretching and shifting around your [pc.nipples]. You look down and see that a pair of small mosquito-bites have formed on your chest, and are only growing. Shivers of pleasure spark from your stiff nipples as your burgeoning flesh fills out, growing and growing into plump, tender handfuls. A quick consideration -- and no small amount of self-groping, exploring your new and sensitive peaks -- tells you that <b>you’ve got C-cup breasts now!</b>");
						output("\n\nBetter invest in a bra!");
						
						if(pc.breastRows.length <= 0) pc.createBreastRow();
						pc.breastRows[0].breasts = 2;
						pc.breastRows[0].breastRatingRaw = 3;
						changes++;
					}
					else output("\n\n" + pc.breastRatingLockedMessage());
				}
				var iBoobRow:int = 0;
				var b:int = 0;
				//Increase Breast Size
				for(b = 0; b < pc.bRows(); b++)
				{
					//See if testing row is smaller than smallest row
					if(pc.breastRows[iBoobRow].breastRating() > pc.breastRows[b].breastRating()) iBoobRow = b;
				}
				//Very high proc chance up to DD; much lower proc chance up to H cup.
				if(changes < changeLimit && ((pc.breastRows[iBoobRow].breastRating() < 5 && rand(2) == 0) || (pc.breastRows[iBoobRow].breastRating() < 19 && rand(4) == 0)))
				{
					if(pc.breastRatingUnlocked(iBoobRow, pc.breastRows[iBoobRow].breastRatingRaw + 1))
					{
						output("\n\nA tingling, almost electric pleasure starts taking hold in your [pc.chest], eliciting a gasp from you.");
						
						pc.breastRows[iBoobRow].breastRatingRaw += 1;
						for(b = 0; b < pc.bRows(); b++)
						{
							if(pc.breastRows[b].breastRating() < 19 && b != iBoobRow) pc.breastRows[b].breastRatingRaw += 1;
						}
						
						output(" Your hands instinctively move to your rack, groping at yourself and feeling your tits growing even more! By the time they settle down, feeling heavier and fuller than ever, <b>you guess you must have " + pc.breastCup(0) + "s now!</b>");
						changes++;
						pc.changeLust(10 + rand(6));
					}
					else output("\n\n" + pc.breastRatingLockedMessage());
				}
				//Change nipple type to normal/human, reduce size to 1 inch if larger.
				iBoobRow = -1;
				for(b = 0; b < pc.bRows(); b++)
				{
					if(pc.breastRows[b].nippleType != GLOBAL.NIPPLE_TYPE_NORMAL) iBoobRow = b;
				}
				if(changes < changeLimit && iBoobRow >= 0 && rand(4) == 0)
				{
					if(pc.nippleTypeUnlocked(iBoobRow, GLOBAL.NIPPLE_TYPE_NORMAL))
					{
						output("\n\nSomething feels like it’s pinching at your nipples, squeezing and twisting them until you gasp and shudder. You grab your chest, and feel your nipples getting rigid -- and so sensitive that the slightest touch nearly makes you cum, wobbling on the spot until you catch your breath. Running your fingers across them, though, tells you that <b>your teats have changed shape, now thoroughly normal in shape and size!</b>");
						
						for(b = 0; b < pc.bRows(); b++)
						{
							if(pc.breastRows[b].nippleType != GLOBAL.NIPPLE_TYPE_NORMAL) pc.breastRows[b].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
						}
						if(pc.nippleLengthRatio != 1) pc.nippleLengthRatio = 1;
						if(pc.nippleWidthRatio != 1) pc.nippleWidthRatio = 1;
						
						changes++;
					}
					else output("\n\n" + pc.nippleTypeLockedMessage());
				}
				//Reduce nipple size, down to coin-sized.
				else if(changes < changeLimit && iBoobRow < 0 && (pc.nippleLengthRatio > 1 || pc.nippleWidthRatio > 1) && rand(4) == 0)
				{
					if(pc.nippleLengthRatioUnlocked(1) && pc.nippleWidthRatioUnlocked(1))
					{
						pc.nippleLengthRatio = 1;
						pc.nippleWidthRatio = 1;
						
						output("\n\nSomething feels like it’s pinching at your nipples, squeezing and twisting them until you gasp and shudder. You grab your chest, and feel your nipples getting rigid -- and so sensitive that the slightest touch nearly makes you cum, wobbling on the spot until you catch your breath. You shiver as you feel yourself up, and see that your nipples have shrunk. You figure they’re about " + num2Text(Math.floor(pc.nippleLength(0))) + " inches now.");
						
						changes++;
					}
					else if(pc.nippleWidthRatioUnlocked(1)) output("\n\n" + pc.nippleLengthRatioLockedMessage());
					else output("\n\n" + pc.nippleWidthRatioLockedMessage());
				}
				//Grow a vagina, if don't have one!
				//New vagina has 6 clits to start with! Has nubby, gryvain type.
				if(changes < changeLimit && !pc.hasVagina() && rand(4) == 0)
				{
					if(pc.createVaginaUnlocked(1))
					{
						output("\n\nA faint, pleasant stretch starts radiating through your nethers. At first, it feels like you’re clenching on a particularly thick dildo, stretching you open, but the more it persists, the more you realize that it’s not coming from your [pc.asshole]. You shiver with unbidden, but nonetheless sexual, bliss. Fuck, that feels good!");
						output("\n\nAfter a moment, your enjoyment of the sensation is interrupted by a wetness on your thighs! A moment of panic makes you shove aside your gear and reach a hand down to your crotch... and almost slip a finger into a new slit! When you do, incredible wetness greets your touch, following by a shock of pleasure so intense you nearly collapse.");
						output("\n\nOnce you’ve got yourself calmed down a bit, you resume exploring this new cavern in your groin. <b>You definitely have a vagina now, and not just a normal human one!</b> You quickly find a ring of six incredibly sensitive nubs just inside the lips -- and more behind them, forming ring after ring of clitorises all the way into your twat, as deep as you can go. If one finger sliding inside nearly makes you cum on the spot, you can only imagine what it would feel like to get fucked in this ultra-sensitive gryvain cunt.");
						output("\n\nAnd you can’t wait to find out!");
						
						pc.createVagina();
						pc.shiftVagina(0, GLOBAL.TYPE_GRYVAIN);
						changes++;
					}
					else output("\n\n" + pc.createVaginaLockedMessage());
				}
				else if(pc.hasVagina())
				{
					var vagList:Array = [];
					var v:int = 0;
					
					//Change non-gryvain vagina to a gryvain vagina.
					for(v = 0; v < pc.totalVaginas(); v++)
					{
						if(pc.vaginas[v].type != GLOBAL.TYPE_GRYVAIN) vagList.push(v);
					}
					if(changes < changeLimit && vagList.length > 0 && rand(2) == 0)
					{
						v = vagList[rand(vagList.length)];
						
						if(pc.vaginaTypeUnlocked(v, GLOBAL.TYPE_GRYVAIN))
						{
							output("\n\nA pleasant feeling starts radiating through your [pc.vagina " + v + "]. At first, it feels like you’re clenching onto a particularly thick dildo, but the more it persists, the more you realize something is actually changing down there. You shiver with unbidden, but nonetheless sexual, bliss. Fuck, that feels good!");
							output("\n\nAfter a moment, your enjoyment of the sensation is interrupted by a wetness on your thighs! A moment of panic makes you shove aside your gear and reach a hand down to your crotch, slipping a finger into your changing slit! Incredible wetness greets your touch, following by a shock of pleasure so intense you nearly collapse.");
							output("\n\nOnce you’ve got yourself calmed down a bit, you resume exploring your newly-shaped cavern. <b>You definitely have a different vagina now, and not just " + indefiniteArticle(GLOBAL.TYPE_NAMES[pc.vaginas[v].type].toLowerCase()) + " one!</b> You quickly find a ring of six incredibly sensitive nubs just inside the lips -- and more behind them, forming ring after ring of clitorises all the way into your twat, as deep as you can go. If one finger sliding inside nearly makes you cum on the spot, you can only imagine what it would feel like to get fucked in this ultra-sensitive gryvain cunt.");
							output("\n\nAnd you can’t wait to find out!");
							
							pc.shiftVagina(v, GLOBAL.TYPE_GRYVAIN);
							changes++;
						}
						else output("\n\n" + pc.vaginaTypeLockedMessage());
					}
					//Gain (2-4) extra clits, up to 12, if less than 12.
					vagList = [];
					for(v = 0; v < pc.totalVaginas(); v++)
					{
						if(pc.vaginas[v].type == GLOBAL.TYPE_GRYVAIN && pc.vaginas[v].clits < 12) vagList.push(v);
					}
					if(changes < changeLimit && vagList.length > 0 && rand(2) == 0)
					{
						v = vagList[rand(vagList.length)];
						var newClits:Number = pc.vaginas[v].clits + 2 + rand(3);
						if(newClits > 12) newClits = 12;
						
						if(pc.clitsUnlocked(v, newClits))
						{
							output("\n\nYour [pc.cunt " + v + "] clenches and drools, reacting to some internal change and sending shivers of pleasure up your spine. Trembling, you reach down to your feminine sex and brush your fingers between the lips, only to find that <b>there are more nubby clits inside your gryvain twat than before -- you count " + num2Text(Math.floor(newClits)) + " now</b> in the first ring, within easy reach of your lips, with many rings further inside.");
							
							pc.vaginas[v].clits = newClits;
							changes++;
						}
						else output("\n\n" + pc.clitsLockedMessage());
					}
					//Reduce clitsize (down to .3 inches)
					if(changes < changeLimit && pc.totalVaginas(GLOBAL.TYPE_GRYVAIN) == pc.totalVaginas() && pc.clitLength > 0.3 && rand(2) == 0)
					{
						var newClitLength:Number = 0.3;
						if(pc.hasPerk("Mini")) newClitLength = 0.1;
						
						if(pc.clitLengthUnlocked(newClitLength))
						{
							output("\n\nYou feel a tightness in your crotch, an unpleasant knot inside your quim and a leakage of moisture that stains your thighs. Reaching down, you prod around your trembling sex, only to find that the" + (pc.totalClits() == 1 ? " your clit has" : " outer ring of nubby clits in your crotch have") + " shrunk! At best, your [pc.clits] " + (pc.totalClits() == 1 ? "is" : "are") + " " + num2Text(Math.floor(pc.clitLength)) + " inches now. Nice and small, better matching a nub-ringed gryvain twat.");
							
							pc.clitLength = newClitLength;
							changes++;
						}
						else output("\n\n" + pc.clitLengthLockedMessage());
					}
				}
				//Increase butt size (up to big & jiggly).
				if(changes < changeLimit && pc.buttRatingRaw < 10 && rand(2) == 0)
				{
					var newButt:Number = pc.buttRatingRaw + 1 + rand(2);
					if(newButt > 10) newButt = 10;
					
					if(pc.buttRatingUnlocked(newButt))
					{
						output("\n\nSuddenly, you feel quite a bit heavier, like your center of balance has shifted backwards by several pounds. You stagger, blinking in surprise as your [pc.butt] starts tingling... and jiggling! Reaching back and grabbing two big, meaty handfuls of your own butt, there’s no denying it: <b>you’ve got a little more junk in your trunk, now!</b>");
						if(newButt >= 8) output(" Your behind jiggles and wiggles with every step now, pleasantly plump and begging for a spank.");
						
						pc.buttRatingRaw = newButt;
						changes++;
					}
					else output("\n\n" + pc.buttRatingLockedMessage());
				}
				//Grow a dragon donger (has no dongers); starts at 8 inches w/ small knot.
				if(changes < changeLimit && !pc.hasCock() && rand(4) == 0)
				{
					if(pc.createCockUnlocked(1))
					{
						output("\n\nYou feel a pressure in your loins, a growing and stretching sensation. You tremble, feeling something well up inside you... what’s going on? Reaching down, you run a hand along your groin, only to find an unfamiliar lump " + (pc.hasVagina() ? "just above your [pc.cunt]" : "growing from your featureless groin") + "! You give it a gentle squeeze, trying to find out what it is, and receive a shuddering tingle of pleasure in response. At first, you think it’s some sort of new clit growing in, but it just keeps growing! Before long, it’s as long as you thumb, throbbing against your hand.");
						output("\n\nThere’s no doubt about what this growing shaft is before long: <b>you’re growing a cock!</b> You watch in shivering awe as a turgid, tapered shaft grows in on your crotch. When the growth seems over, you measure at least eight inches of fresh new cockmeat, knotty and bulbous at the base and tapered to a fine, leaking point at the crown. Just like a gryvain’s!");
						
						pc.createCock();
						pc.shiftCock(0, GLOBAL.TYPE_GRYVAIN);
						pc.cocks[0].cLengthRaw = 8;
						if(pc.hasPerk("Hung")) pc.cocks[0].cLengthRaw += 2;
						pc.cocks[0].knotMultiplier = 1.10;
						
						changes++;
					}
					else output("\n\n" + pc.createCockLockedMessage());
				}
				else if(pc.hasCock())
				{
					var cockList:Array = [];
					var c:int = 0;
					var newKnot:Number = 1.10;
					
					//Change donger type to dragon
					for(c = 0; c < pc.cockTotal(); c++)
					{
						if(pc.cocks[c].cType != GLOBAL.TYPE_GRYVAIN) cockList.push(c);
					}
					if(changes < changeLimit && cockList.length > 0 && rand(2) == 0)
					{
						c = cockList[rand(cockList.length)];
						if(pc.hasKnot(c) && pc.cocks[c].knotMultiplier > newKnot) newKnot = pc.cocks[c].knotMultiplier;
						
						if(pc.cockTypeUnlocked(c, GLOBAL.TYPE_GRYVAIN))
						{
							output("\n\nYou feel a twitching throb make its way through your [pc.cock], making your [pc.legs] wobble and your breath catch. A cummy heat drools from your [pc.cockHead], smearing across your gear until you reach down and grab yourself, trying to figure out what’s going on.");
							output("\n\nA quick brush along the twitching length of your schlong tells you all you need to know: the shape is changing, tapering down at the tip and growing thicker and more bulbous at the base.");
							if(pc.hasPartScales() && pc.cocks[c].cockColor != pc.scaleColor) output(" Even the color changes, matching your [pc.scaleColor] scales.");
							output(" <b>Your cock has mutated to mimic that of a gryvain in shape!</b>");
							
							pc.shiftCock(c, GLOBAL.TYPE_GRYVAIN);
							pc.cocks[c].knotMultiplier = newKnot;
							changes++;
						}
						else output("\n\n" + pc.cockTypeLockedMessage());
					}
					//Increase cocksize (1-3) inches
					//High proc chance up to 10 inches; lower proc chance up to 16 inches
					cockList = [];
					for(c = 0; c < pc.cockTotal(); c++)
					{
						if(pc.cocks[c].cLengthRaw < 10 && rand(2) == 0) cockList.push(c);
						if(pc.cocks[c].cLengthRaw < 16 && rand(4) == 0) cockList.push(c);
					}
					if(changes < changeLimit && cockList.length > 0)
					{
						c = cockList[rand(cockList.length)];
						var newCockLength:Number = pc.cocks[c].cLengthRaw + 1 + rand(3);
						if(newCockLength > 16) newCockLength = 16;
						if(pc.hasPerk("Hung")) newCockLength *= 1.5;
						var cockDiff:Number = newCockLength - pc.cocks[c].cLengthRaw;
						
						if(pc.cockLengthUnlocked(c, newCockLength))
						{
							output("\n\nA rush of pleasure races through your [pc.cock " + c + "], sudden enough to make you almost double over before you can clench back the sensation, keeping yourself from cumming on the spot. The veins and muscles in your prick throb, straining powerfully. You reach down, grabbing at yourself to try and figure out what’s going on.");
							output("\n\nThe answer becomes apparent the moment you grope your crown, and feel it pushing hard against your palm. <b>Your [pc.cockNoun " + c + "] is growing</b>!");
							output("\n\nYou shiver with unbidden pleasure, feeling your shaft elongate and thicken in your grasp. The sensations only last a few moments more, but when they fade, you’re sure you’re at least");
							if(cockDiff < 1) output(" a little");
							else if(cockDiff < 2) output(" an inch");
							else output(" " + num2Text(Math.floor(cockDiff)) + " inches");
							output(" bigger!");
							if(cockDiff >= 1) output("\n\nNow to put this new cockmeat to use...");
							
							pc.cocks[c].cLengthRaw = newCockLength;
							changes++;
						}
						else output("\n\n" + pc.cockLengthLockedMessage());
					}
					//Gain a knot (has no knots)
					cockList = [];
					for(c = 0; c < pc.cockTotal(); c++)
					{
						if(!pc.hasKnot(c)) cockList.push(c);
					}
					if(changes < changeLimit && cockList.length > 0 && rand(2) == 0)
					{
						c = cockList[rand(cockList.length)];
						
						output("\n\nBlood rushes to your [pc.cock " + c + "], giving you a sudden and rock-hard erection. You blink and awkwardly adjust your stance, trying to figure out why you’re so stiff all of a sudden. The answer comes a moment later, when your fingers brush across the base of your schlong. The flesh there has become thick and bulbous, much more so than before, like its inflating into a tennis-ball-sized orb of flesh, ready to stretch any a cunny open and lock your manhood inside while you deposit your load. <b>You’ve got a knot now,</b> making your [pc.cockNoun " + c + "] look just that much more like a proper gryvain’s.");
						
						pc.cocks[c].addFlag(GLOBAL.FLAG_KNOTTED);
						pc.cocks[c].knotMultiplier = newKnot;
						changes++;
					}
					//Increase knot size (one-time bump up to fist-thick)
					cockList = [];
					var knotThick:Number = (pc.mf("m", "f") == "m" ? 3.5 : 3); // Width: Male fist is about 3.5 in, Female fist is about 3 in.
					for(c = 0; c < pc.cockTotal(); c++)
					{
						if(pc.hasKnot(c) && pc.knotThickness(c) < knotThick) cockList.push(c);
					}
					if(changes < changeLimit && cockList.length > 0 && rand(2) == 0)
					{
						c = cockList[rand(cockList.length)];
						newKnot = (Math.round((knotThick / pc.cocks[c].thickness()) * 100) / 100);
						
						output("\n\nYour [pc.knot] flushes with blood, bloating out to full thickness without so much as an encouraging stroke of your prick. The sudden shock of pleasure makes you stagger, and your whole body goes rigid when your knot keeps growing... and growing... and growing! By the time it’s done, <b>your [pc.knot] is at least as thick as your fist</b>, ready to absolutely break a bitch in and make sure not a single drop of [pc.cum] escapes! Ohhh, you can’t wait to try this bad boy out!");
						
						pc.cocks[c].knotMultiplier = newKnot;
						changes++;
					}
				}
				//Change thickness towards average (up or down). 
				if(changes < changeLimit && pc.thickness != 50 && rand(3) == 0)
				{
					var newThickness:Number = 0;
					if(pc.thickness < 50)
					{
						newThickness = pc.thickness + (5 + rand(5));
						if(newThickness > 50) newThickness = 50;
					}
					else
					{
						newThickness = pc.thickness - (5 + rand(5));
						if(newThickness < 50) newThickness = 50;
					}
					var thickDiff:Number = newThickness - pc.thickness;
					
					if(pc.thicknessUnlocked(newThickness))
					{
						output("\n\nYou feel a rumble in your tummy, just enough to make you sigh and put a hand to it, enjoying the faintly full sensation. Your skin feels a little " + (thickDiff < 0 ? "looser" : "tighter") + " now that you think about it, like your weight’s shifting around a little. You glance down and pat your belly and thighs, pretty sure that you’re a little " + (thickDiff > 0 ? "thicker" : "thinner") + " now.");
						
						pc.thickness = newThickness;
						changes++;
					}
					else output("\n\n" + pc.thicknessLockedMessage());
				}
				//Change scale/hair/cock coloration, if outside the gryvain range, to a random gryvain color (blue, green, black, dark red). Must already have at least partial scales.
				var gravainColors:Array = ["dark blue", "blue", "dark green", "green", "black", "dark red"];
				if(pc.short == "Geddy") gravainColors.push("red", "red", "red");
				var g:int = 0;
				var cCockList:Array = [];
				var cCuntList:Array = [];
				for(g = 0; g < pc.cockTotal(); g++)
				{
					if(!InCollection(pc.cocks[g].cockColor, gravainColors)) cCockList.push(g);
				}
				for(g = 0; g < pc.vaginaTotal(); g++)
				{
					if(!InCollection(pc.vaginas[g].vaginaColor, gravainColors)) cCuntList.push(g);
				}
				if(changes < changeLimit && pc.hasPartScales() && (!InCollection(pc.scaleColor, gravainColors) || !InCollection(pc.hairColor, gravainColors) || cCockList.length > 0 || cCuntList.length > 0) && rand(2) == 0)
				{
					var newColor:String = gravainColors[rand(gravainColors.length)];
					
					if(!pc.scaleColorUnlocked(newColor)) output("\n\n" + pc.scaleColorLockedMessage());
					else if(!pc.hairColorUnlocked(newColor)) output("\n\n" + pc.hairColorLockedMessage());
					else
					{
						output("\n\nA faint, tingling itch spreads across your scales. Not enough to be annoying, really, but eventually it does draw your attention");
						if(pc.hasLegFlag(GLOBAL.FLAG_SCALED)) output(" downwards");
						output(". Splotches of color have appeared on you");
						if(pc.hasLegFlag(GLOBAL.FLAG_SCALED)) output("r [pc.lowerBody]");
						else if(pc.hasArmFlag(GLOBAL.FLAG_SCALED)) output("r [pc.arms]");
						else if(pc.hasTailFlag(GLOBAL.FLAG_SCALED)) output("r [pc.tails]");
						output(", little pinpricks of " + newColor + " at first, slowly spreading across");
						if(pc.hasLegFlag(GLOBAL.FLAG_SCALED) || pc.hasArmFlag(GLOBAL.FLAG_SCALED) || pc.hasTailFlag(GLOBAL.FLAG_SCALED)) output(" your body");
						else output(" the surface");
						output(". Your eyes go wide a moment, before you realize that the color splotches are actually your scales, changing hue! Before long, your");
						var scaleCnt:Number = 0;
						if(pc.hasLegFlag(GLOBAL.FLAG_SCALED)) { output(" [pc.legOrLegs]"); scaleCnt += pc.legCount; }
						else if(pc.hasArmFlag(GLOBAL.FLAG_SCALED)) { output(" arms"); scaleCnt += 2; }
						else if(pc.hasTailFlag(GLOBAL.FLAG_SCALED)) { output(" tail" + (pc.tailCount == 1 ? "" : "s")); scaleCnt += pc.tailCount; }
						if(pc.hasScales())
						{
							if(scaleCnt > 0) output(" and");
							output(" scaly body");
							scaleCnt++;
						}
						output(" " + (scaleCnt == 1 ? "is" : "are") + " completely " + newColor);
						if(cCockList.length > 0 || cCuntList.length > 0)
						{
							output(", as is your");
							if(cCockList.length > 0) output(" [pc.cocks]");
							if(cCockList.length > 0 && cCuntList.length > 0) output(" and");
							if(cCuntList.length > 0) output(" [pc.vaginas]");
						}
						output("!");
						if(pc.hairColor != newColor) output(" As you explore your newly colored body, you quickly realize that your [pc.hair] has changed, too, matching the color of your scales!");
						output(" You look that much more gryvain, now!");
						
						pc.scaleColor = newColor;
						pc.hairColor = newColor;
						if(cCockList.length > 0)
						{
							for(g = 0; g < pc.cocks.length; g++)
							{
								pc.cocks[g].cockColor = newColor;
							}
						}
						if(cCuntList.length > 0)
						{
							for(g = 0; g < pc.vaginas.length; g++)
							{
								pc.vaginas[g].vaginaColor = newColor;
							}
						}
						changes++;
					}
				}
				//Change lower body type to legs. Legs get scale type.
				if(changes < changeLimit && pc.legCount != 2 && rand(4) == 0)
				{
					if(!target.legCountUnlocked(2)) output("\n\n" + target.legCountLockedMessage());
					else if(!pc.legTypeUnlocked(GLOBAL.TYPE_GRYVAIN)) output("\n\n" + target.legTypeLockedMessage());
					else
					{
						output("\n\nAll of a sudden, it feels like your [pc.legOrLegs] fell asleep. You shift uncomfortably, suddenly unable to feel half your body as anything other than a numb tingle...");
						output("\n\nAnd then something twists, moving on its own in entirely the wrong way. You gasp and plummet to the ground, flopping on your back in a stunned heap. Your lower body shifts under the skin, twisting and warping until you feel something shattering and reforming.");
						if(pc.legCount == 1) output(" Your lower half splits just below the hips, compacting and reforming.");
						output(" Before long, your previous shape is all but gone, replaced by a pair of long, shapely legs covered in a fine coating of scales and tipped with claws at the end of each digit.");
						output("\n\n<b>You’re a biped now!</b>");
						
						pc.legCount = 2;
						pc.genitalSpot = 0;
						pc.legType = GLOBAL.TYPE_GRYVAIN;
						pc.clearLegFlags();
						pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
						pc.addLegFlag(GLOBAL.FLAG_SCALED);
						changes++;
					}
				}
				if (changes < changeLimit && pc.race() == "gryvain" && pc.hasWombPregnancy() && pc.isLactating() && !pc.hasPerk("Hypermilky"))
				{
					output("\n\nYou pause a moment as you feel a sudden burning itch in your [pc.chest]. There is a tingling sensation that radiates from your pregnant womb" + (pc.totalWombPregnancies() == 1 ? "" : "s") + ", suddenly bursting outward and spreading to your irritated [pc.nipples]. Like an extinguisher to a fire, your nipples are hit with a breezy coolness and you let out a relieved sigh. But just before you think it is over, your chest gradually fills with another pressure... Your lactation is picking up in production and filling your " + pc.breastCup(pc.biggestTitRow()) + " tits! Your hand travels over your [pc.nipples " + pc.biggestTitRow() + "], and you " + (pc.isChestExposed() ? "notice the [pc.milkGem] [pc.milkNoun] trickling off them and plotting on the floor" : "feel the [pc.milkVisc] [pc.milkNoun] coat your top, rapidly wetting the surface with ease") + ".");
					
					pc.milkFullness += 200;
					
					output("\n\nYour tits continue to get fuller and fuller and you get a feeling that they won’t stop for anything! When it finally settles, the pressure is almost overwhelming--you’ve got to milk yourself right away! Due to the vast amount of gryvain genes you have in your system, you suspect this permanent change is a result of the drug’s reaction to your preganancy and [pc.milkNoun] production...");
					
					output("\n\n<b>Perk Gained: Hypermilky!</b> (Lactation will not decrease from disuse or overfilling.)");
					pc.createPerk("Hypermilky", 0, 0, 0, 0, "Lactation will not decrease from disuse or overfilling.");
					changes++;
				}
				
				if(changes == 0)
				{
					output("\n\nIt seems nothing happens...");
					if(pc.race().indexOf("gryvain") != -1) output(" Perhaps you are as gryvain as you are going to get?");
					else output(" Eh, probably a dud.");
				}
				return false;
			}
			else
			{
				output(target.capitalA + target.short + " swallows the DracoGuard pill to no effect.");
			}
			return false;
		}
	}
}

