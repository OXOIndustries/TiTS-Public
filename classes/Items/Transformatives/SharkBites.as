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
	import classes.Engine.Utility.indefiniteArticle;
	
	public class SharkBites extends ItemSlotClass
	{
		
		//constructor
		public function SharkBites()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "S.Bites";
			//Regular name
			this.longName = "Shark Bites";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a sealed baggie of Shark Bites jerky";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This is a simple white pack containing three brown colored jerky-esque bits. The bottom half of the pack has a stylized depiction of some <i>very</i> scantily clad shark-morphs worshipping the jerky bits as if they were some great deity. Certainly an odd bit of marketing, if you do say so yourself. The pack promises that the consumer will gain the glorious body of a shark in humanoid form. A long, tiny print list of possible side effects is on the back, lost in all the shark worship that covers the pack. You guess the creators must have had a real shark fetish...";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 2700;
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
 		public function hasSharkScales():Boolean
 		{
 			return (kGAMECLASS.pc.skinType == GLOBAL.SKIN_TYPE_SCALES && kGAMECLASS.pc.hasSkinFlag(GLOBAL.FLAG_LUBRICATED));
 		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("JohanLitvisk");
			if(target is PlayerCharacter) {
				var pc:Creature = target;
				var changes:int = 0;
				var changeLimit:int = 2;
				var temp:String = "";
				if(rand(2) == 0) changeLimit++;
				if(rand(2) == 0) changeLimit++;

				output("You bite the pack of jerky bits open and pour them into your mouth. They have a strong fishy taste that ");
				// shark score low: 
				if(pc.sharkScore() < 3) output("makes your face scrunch up in displeasure");
				else output("makes you give a low growl in predatory pleasure");
				output(". You chew the bits up before swallowing them whole and waiting for them to take effect. Almost immediately, a warm, tingling sensation spreads out over your whole body.");

				//Return skin to normal
				if(!hasSharkScales() && pc.skinType != GLOBAL.SKIN_TYPE_SKIN && rand(3) == 0 && changes < changeLimit)
				{
					if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
					{
						output("\n\nYour [pc.skinFurScales] feels rather light and floofy all of a sudden. Rubbing your arms, you watch in amazement as your [pc.skinFurScalesNoun] fall off from the rubbed spot. Soon, all your coverage falls off into a heap, <b>leaving you with completely normal skin!</b>");
						pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
						pc.clearSkinFlags();
					}
					else output("\n\n" + pc.skinTypeLockedMessage());
					changes++;
				}
				//Grow shark skin scales
				if(pc.skinType == GLOBAL.SKIN_TYPE_SKIN && rand(5) == 0 && changes < changeLimit)
				{
					if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SCALES))
					{
						output("\n\nYour skin breaks out in goosebumps as a shiver works its way through your body before it passes. Strange, you feel... calm all of a sudden. ");
						if(!(pc.armor is EmptySlot)) output("Moving some parts of your [pc.armor] out the way");
						else output("Looking down at your bare stomach");
						temp = RandomInCollection(["silver","blue","gray","brown","copper","bronze","white","black"]);
						output(", you notice a " + temp + ", scaly patch forming. It quickly spreads out over your body, <b>covering your body in a coat of " + temp + " scales!</b> As you admire your newly enhanced surface, you notice that some parts of your body are more shiny than usual. Curious, you run your hands along your scales, feeling the moisture now present on your body. It’s almost like you’ve just lubed up!");
						//Scale skintype + Lubricated flag
						pc.clearSkinFlags();
						pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
						pc.addSkinFlag(GLOBAL.FLAG_LUBRICATED);
						//Change skin color to silver, blue, gray, brown, copper, bronze, white or black
						pc.skinTone = temp;
						pc.scaleColor = temp;
					}
					else output("\n\n" + pc.skinTypeLockedMessage());
					changes++;
				}
				if(!pc.hasAccentMarkings())
				{
					//Gain Stripes perk.
					if(hasSharkScales() && !pc.hasStatusEffect("Shark Markings") && rand(5) == 0 && changes < changeLimit)
					{
						pc.skinAccent = RandomInCollection(["black","brown","white"]);
						if(pc.skinAccent == pc.skinTone) pc.skinAccent = "orange";
						output("\n\nYou idly look at your arms and notice several semi-haphazard lines traveling across your body. <b>It seems you have " + target.skinAccent + " stripes across your [pc.skin] now!</b>");
						//Chance to occur at 2%
						pc.createStatusEffect("Shark Markings",1,0,0,0);
						changes++;
					}
					if(hasSharkScales() && !pc.hasStatusEffect("Shark Markings") && rand(5) == 0 && changes < changeLimit)
					{
						pc.skinAccent = RandomInCollection(["black","brown","white"]);
						if(pc.skinAccent == pc.skinTone) pc.skinAccent = "orange";
						output("\n\nYou idly look at your arms and notice multiple dots popping up across your body. <b>It seems you have " + target.skinAccent + " spots across your [pc.skin] now!</b>");
						//Chance to occur at 2%
						//Pc gains "Spots" perks.
						pc.createStatusEffect("Shark Markings",2,0,0,0);
						changes++;
					}
					if(hasSharkScales() && !pc.hasStatusEffect("Shark Markings") && rand(5) == 0 && changes < changeLimit)
					{
						pc.skinAccent = RandomInCollection(["beige","white"]);
						if(pc.skinAccent == pc.skinTone) pc.skinAccent = "neon green";
						output("\n\nYou idly look down at your [pc.chest] and notice a large off-color patch forming over your chest, belly and inner thighs. <b>It seems you have " + indefiniteArticle(target.skinAccent) + " blotch on your frontal body now!</b>");
						//Chance to occur at 2%
						//Pc gains "Frontal Blotch" perk.
						pc.createStatusEffect("Shark Markings",3,0,0,0);
						changes++;
					}
				}
				//Increase Tone
				if(pc.tone < 80 && rand(3) == 0 && changes < changeLimit)
				{
					if(pc.toneUnlocked(pc.tone+5))
					{
						output("\n\nThe muscles in your body harden as they become more defined, the flabbiness you have melting away. You smirk, feeling a confidence boost from your increasingly athletic body. (+5 Tone)");
						pc.modTone(5);
					}
					else output("\n\n" + pc.toneLockedMessage());
					changes++;
				}
				//Decrease Thickness
				if(pc.thickness > 20 && rand(3) == 0 && changes < changeLimit)
				{
					if(pc.thicknessUnlocked(pc.thickness - 5))
					{
						output("\n\nYour body seems to contract");
						if(!(pc.armor is EmptySlot)) output(" as your [pc.armor] feels looser all over");
						output(". It appears you’re slowly becoming thinner, increasing your hydrodynamic capabilities.");
						pc.modThickness(-5);
					}
					else output("\n\n" + pc.thicknessLockedMessage());
					changes++;
				}
				//Decrease Breast Size
				if(pc.breastRows[pc.biggestTitRow()].breastRatingRaw > 2 && rand(4) == 0 && changes < changeLimit)
				{
					if(pc.breastRatingUnlocked(0, 2))
					{
						output("\n\nYour [pc.breasts] fill with a calming and pleasurable warmth as the ground becomes easier to see, letting out a low growl as your breasts shrink. Eventually, your breasts finally settle down into their new cup size.");
						for(var x:int = 0; x < pc.bRows(); x++)
						{
							pc.breastRows[x].breastRatingRaw--;
							if(pc.breastRows[x].breastRatingRaw < 0) pc.breastRows[x].breastRatingRaw = 0;
						}
					}
					else output("\n\n" + pc.breastRatingLockedMessage());
					changes++;
				}
				//Remove Horn(s)
				if(pc.hasHorns() && rand(5) == 0 && changes < changeLimit)
				{
					if(pc.hornsUnlocked(0)) {
						output("\n\nYou feel your [pc.horns] grow stiff and brittle before they crumble away into dust. <b>You are now hornless.</b>");
						pc.removeHorns();
					}
					else output("\n\n" + pc.hornsLockedMessage());
					changes++;
				}
				//Gain Shark Face
				if(pc.faceType != GLOBAL.TYPE_SHARK && rand(4) == 0 && changes < changeLimit)
				{
					if(pc.faceTypeUnlocked(GLOBAL.TYPE_SHARK))
					{
						output("\n\nYou wince as you feel a prick on your tongue. How the fuck did you cut your tongue on your teeth? Better yet, why does the coppery taste of your blood taste... good?");
						output("\n\nBefore you can answer these questions, your face is overcome with pain, your bones rearranging themselves");
						if(pc.faceType != GLOBAL.TYPE_HUMAN) output(" and your jaw elongating");
						output(". You even feel <i>more</i> teeth start to break through, causing your new jaw to widen to accommodate them. By the time it ends, your face is pretty numb. Wondering what the hell happened to you, you pull your codex up, discovering that <b>your face as changed to emulate that of a shark!</b> Your tongue seems to adapt to having less room to maneuver on it’s own rather quickly.");
						pc.clearFaceFlags();
						pc.faceType = GLOBAL.TYPE_SHARK;
						pc.addFaceFlag(GLOBAL.FLAG_MUZZLED);
						pc.addFaceFlag(GLOBAL.FLAG_LONG);
					}
					else output("\n\n" + pc.faceTypeLockedMessage());
					changes++;
				}
				/*Grow Head Fin - Fen note: no, Im not overloading antennae for this. Would likely create some bugs all over the place and non-essential.
				You feel a sharp pain at the top of your head. It feels like something is trying to burst through your scalp! Before you can tend to this pain, a pointed bulge of flesh bursts forth on your head, tingling and morphing as it gains a definite shape. Once the tingling stops, you take a look at your codex and discover that you <b>now have a fin on your head!</b>
				//Occur at 3% chance*/

				//Gain Shark Ears
				if(pc.earType != GLOBAL.TYPE_SHARK && rand(4) == 0 && changes < changeLimit)
				{
					if(pc.earTypeUnlocked(GLOBAL.TYPE_SHARK))
					{
						output("\n\nHow odd... your ears feel oddly numb. You press your hands against the side of your face, noticing that your ear holes are still there but your ear lobes are missing. Suddenly, you feel a pressure against your hands and you move them away, as skin and cartilage bursts forth. They look kind of like three tiny sails were taken off a ship and used to make <b>your new shark ears</b>!");
						pc.earType = GLOBAL.TYPE_SHARK;
						pc.clearEarFlags();
						pc.earLength = 4;
					}
					else output("\n\n" + pc.earTypeLockedMessage());
					changes++;
				}
				//Gain Shark Eyes
				if(pc.eyeType != GLOBAL.TYPE_SHARK && rand(4) == 0 && changes < changeLimit)
				{
					if(pc.eyeTypeUnlocked(GLOBAL.TYPE_SHARK))
					{
						output("\n\nA blurry flash fills your vision before disappearing just as quickly as it came. Blinking-wait... did your eyelids come from the side instead of the top and bottom? You pull up your Codex assessing <b>your new shark-like eyes</b>! The pupils are slit like a feline or lizard and the sclera are much shinier than you remember. Getting used to your eyelids coming from the sides is gonna take some time, but your vision has drastically improved, especially when it comes reacting to fast moving objects.");
						pc.eyeType = GLOBAL.TYPE_SHARK;
						//Small reflex gain of +2
						pc.reflexes(2);
					}
					else output("\n\n" + pc.eyeTypeLockedMessage());
					changes++;
				}
				//Gain Shark Fin/Wing
				if(pc.wingType != GLOBAL.TYPE_SHARK && rand(4) == 0 && changes < changeLimit)
				{
					if(pc.wingTypeUnlocked(GLOBAL.TYPE_SHARK))
					{
						output("\n\nThe skin on your back tightens between your shoulders");
						if(pc.wingCount > 0) output(" as your [pc.wings] crumble away into dust");
						output(". ");
						if(!(pc.armor is EmptySlot)) output("You quickly take off the upper parts of your [pc.armor] as y");
						else output("Y");
						output("ou feel a slit open up on your back. In short order, new flesh and bone sprouts from the slit, shaping itself into a dorsal fin reminiscent of a shark. <b>Seems you have a shark fin on your back now</b>!");
						if(!(pc.armor is EmptySlot)) output(" You make some adjustments to your [pc.armor] in order to make your new fin feel comfortable.");
						pc.shiftWings(GLOBAL.TYPE_SHARK, 1);
					}
					else output("\n\n" + pc.wingTypeLockedMessage());
					changes++;
				}
				//Gain Shark Arms
				if(pc.armType != GLOBAL.TYPE_SHARK && rand(3) == 0 && changes < changeLimit)
				{
					if(pc.armTypeUnlocked(GLOBAL.TYPE_SHARK))
					{
						output("\n\nYour arms go numb as you watch them rumble and shift around. From below your elbows, two small fins burst forth as you gain black claws on your fingertips. Your fingers are webbed and tipped with black claws. This makes perfect sense, with sharks being aquatic creatures after all.");
						pc.armType = GLOBAL.TYPE_SHARK;
						pc.clearArmFlags();
					}
					else output("\n\n" + pc.armTypeLockedMessage());
					changes++;
				}
				//Return to Humanoid form
				if(pc.legType != GLOBAL.TYPE_SHARK && (pc.isTaur() || pc.isNaga()) && rand(2) == 0 && changes < changeLimit)
				{
					if(pc.isNaga() || pc.legCountUnlocked(2))
					{
						output("\n\nAs you ");
						if(pc.isTaur()) output("trot");
						else output("slither");
						output(" around, you feel a great warmth in your lower body. You look down only for that warmth to turn into searing pain. You barely stop yourself from screaming bloody murder as you black out for a brief second before the most soothing feeling runs through your body. It almost feel like the afterglow of sex in some respects. You wipe some tears from your eyes as you look down, noticing that <b>");
						if(pc.isNaga())
						{
							output("your snake-like lower body has now converted to a shape much similar to that of a shark!");
							pc.genitalSpot = 0;
							pc.legType = GLOBAL.TYPE_SHARK;
							pc.legCount = 1;
							pc.clearLegFlags();
							pc.addLegFlag(GLOBAL.FLAG_PREHENSILE);
							pc.addLegFlag(GLOBAL.FLAG_SCALED);
						}
						else
						{
							output("your body now has a human configuration, with two human legs!");
							pc.genitalSpot = 0;
							pc.legType = GLOBAL.TYPE_HUMAN;
							pc.legCount = 2;
							pc.clearLegFlags();
							pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
							//pc.addLegFlag(GLOBAL.FLAG_SCALED);
						}
						output("</b> You hope that this was mentioned in the potential side effects of consuming Shark Bites...");
					}
					else output("\n\n" + pc.legCountLockedMessage());
					changes++;
				}
				//Gain Shark Legs
				if(pc.legType != GLOBAL.TYPE_SHARK && pc.legCount == 2 && rand(3) == 0 && changes < changeLimit)
				{
					if(pc.legTypeUnlocked(GLOBAL.TYPE_SHARK))
					{
						output("\n\nYou stumble over yourself as you feel the bones in your [pc.legs] shift and grow. You steady yourself as feeling slowly returns to your legs. Overall, it looks like your legs haven’t changed that much. They certainly look more muscular than you remember, much better for running... or swimming for that matter. You see that two tiny fins have grown near your ankles, and while your feet look relatively normal, the toes are webbed and tipped with black claws. Looks like <b>you have legs and feet fitting for an aquatic humanoid now!</b>");
						pc.legType = GLOBAL.TYPE_SHARK;
						pc.clearLegFlags();
						pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
						pc.addLegFlag(GLOBAL.FLAG_SCALED);
					}
					else output("\n\n" + pc.legTypeLockedMessage());
					changes++;
				}
				//Grow Gills
				if(!pc.gills && pc.sharkScore() >= 3 && rand(4) == 0 && changes < changeLimit)
				{
					if(pc.gillsUnlocked(true))
					{
						output("\n\nYour throat feels irritated as you notice some strange markings on your lower neck. Are those gills? You take a look at yourself and confirm that these slits are indeed gills, covered in a mucosal layer of protection.");
						pc.gills = true;
					}
					else output("\n\n" + pc.gillsLockedMessage());
					changes++;
				}
				//PC cock isn't a shark cock
				if(pc.totalCocks(GLOBAL.TYPE_SHARK) < pc.totalCocks() && rand(3) == 0 && changes < changeLimit)
				{
					var dickPix:Array = new Array();
					for(var i:int = 0; i < pc.totalCocks(); i++)
					{
						if(pc.cocks[i].cType != GLOBAL.TYPE_SHARK) dickPix.push(i);
					}
					i = RandomInCollection(dickPix);
					if(pc.cockTypeUnlocked(i, GLOBAL.TYPE_SHARK))
					{
						output("\n\nYour [pc.cock " + i + "] grows painfully hard before a pleasant warmth flows through it, base to tip, then back up again. It feels really, really good. You ");
						if(!pc.isCrotchExposedByArmor()) output("pull the lower part of your [pc.armor] forward and ");
						output("look down ");
						if(!pc.isCrotchExposedByLowerUndergarment()) output("into your [pc.lowerUndergarment] ");
						output("to find that your penis has changed into an smoothly contoured tube. The head is now a tapered point, and downy-soft fins ring the base. <b>You have a shark cock now!</b>");
						pc.shiftCock(i,GLOBAL.TYPE_SHARK);
						pc.libido(1);
						pc.changeLust(5);
					}
					else output("\n\n" + pc.cockTypeLockedMessage());
					changes++;
				}
				//PC has one cock
				if(pc.cockTotal() == 1 && pc.cockTotal(GLOBAL.TYPE_SHARK) == 1 && rand(3) == 0 && changes < changeLimit)
				{
					if(pc.createCockUnlocked(2))
					{
						output("\n\nYou grunt as your feel your dick bloat up. Is it getting even bigger now? You take a look at your groin only to find that an identical twin has grown right next to your original [pc.cock]. <b>You now have two penises!</b>");
						pc.createCock();
						pc.copyCock(1, 0);
						pc.libido(3);
					}
					else output("\n\n" + pc.createCockLockedMessage());
					changes++;
				}
				//PC has balls
				if(pc.balls > 0 && rand(5) == 0 && changes < changeLimit)
				{
					if(pc.ballsUnlocked(0))
					{
						output("\n\nYour [pc.balls] involuntarily tighten");
						if(pc.balls == 1) output("s");
						output(" as a pleasant feeling suffuses through ");
						if(pc.balls == 1) output("it");
						else output("them");
						output(". You sigh as you feel ");
						if(pc.balls == 1) output("its");
						else output("their");
						output(" presence slowly retreat into your skin before disappearing completely. How odd... you don’t even feel that torn up about it. <b>You have no testicles now.</b>");
						pc.makeBallsInternal();
						//pc.ballSizeRaw = 3.5;
					}
					else output("\n\n" + pc.ballsLockedMessage());
					changes++;
				}
				//PC vagina isn't a shark vagina
				if(pc.totalVaginas(GLOBAL.TYPE_SHARK) < pc.totalVaginas() && rand(3) == 0 && changes < changeLimit)
				{
					var cuntPix:Array = new Array();
					for(var ii:int = 0; ii < pc.totalVaginas(); ii++)
					{
						if(pc.vaginas[ii].type != GLOBAL.TYPE_SHARK) cuntPix.push(ii);
					}
					ii = RandomInCollection(cuntPix);
					if(pc.vaginaTypeUnlocked(ii,GLOBAL.TYPE_SHARK))
					{
						output("\n\nYour [pc.vagina " + ii + "] tingles as it begins to shift on the inside. Curious, you run your hands over your ");
						if(pc.hasPlumpPussy(ii)) output("puffy ");
						output("lips and notice some tendrils rubbing and grasping your fingers, trying to pull them deeper into your pussy. You blush a little as you have to resist the urge to start fingering yourself right there and reluctantly pull your fingers away, much to the disappointment of your new pussy tendrils. <b>You now have a gray shark vagina!</b>");
						pc.shiftVagina(ii,GLOBAL.TYPE_SHARK);
						pc.changeLust(20);
						pc.libido(2);
					}
					else output("\n\n" + pc.vaginaTypeLockedMessage());
					changes++;
				}
				//PC has no tail
				if(pc.tailCount == 0 && rand(5) == 0 && changes < changeLimit)
				{
					if(pc.tailCountUnlocked(1))
					{
						output("\n\nYou feel a lump forming at the base of your spine. Before you can even feel it out, the lump surges");
						if(pc.isAssExposed()) output("!");
						else if(!pc.isAssExposedByArmor()) output(", threatening to tear through your [pc.armor]! You pull your gear out the way as fast as you can!");
						else output(", threatening to tear through your [pc.lowerUndergarment]! You pull the underwear out of the way as fast as you can!");
						output(" You grunt as new vertebrae fill what is obviously a tail, growing into a thick appendage. The tail grows just as long as you are tall, the end splitting into a big fin, just like a shark. A second, smaller dorsal fin pops up around the halfway point of your tail. <b>Seems you have a shark tail now!</b>");
						pc.tailCount = 1;
						pc.tailType = GLOBAL.TYPE_SHARK;
						pc.clearTailFlags();
						pc.addTailFlag(GLOBAL.FLAG_LONG);
						pc.addTailFlag(GLOBAL.FLAG_SCALED);
					}
					else output("\n\n" + pc.tailCountLockedMessage());
					changes++;
				}
				//PC has tail that's not a shark tail
				if(pc.tailCount > 0 && pc.tailType != GLOBAL.TYPE_SHARK && rand(4) == 0 && changes < changeLimit)
				{
					if(pc.tailTypeUnlocked(GLOBAL.TYPE_SHARK))
					{
						output("\n\nYour tail");
						if(pc.tailCount > 1) output("s recede");
						else output(" recedes");
						output(" back into your body before another, larger tail bursts forth! It grows as long as you are tall before shaping itself into a Selachimorpha-esque form. The end splits into a big, dual-pronged fin, while a smaller one pops up at the halfway point of your tail. <b>Seems like you have a shark tail now!</b>");
						pc.tailCount = 1;
						pc.tailType = GLOBAL.TYPE_SHARK;
						pc.clearTailFlags();
						pc.addTailFlag(GLOBAL.FLAG_LONG);
						pc.addTailFlag(GLOBAL.FLAG_SCALED);
					}
					else output("\n\n" + pc.tailTypeLockedMessage());
					changes++;
				}
				//Dud
				if(changes == 0)
				{
					output("\n\nThat tingling goes on for awhile, but nothing seems to come of it. You guess it was a dud.");
					if(pc.sharkScore() >= 5) output(" Maybe you’re as shark like as you are going to get?");
				}
				return false;
			}
			else {
				output(target.capitalA + target.short + " eats the jerky to no effect.");
			}
			return false;
		}
	}
}

/*Coding

New and Modified Appearance Blurbs
Shark Antenna/Head Fin:
	//This should be Antennae because it could conflict with the hardness of horns.
//The first thing after any if(target.hasAntennae())
if(target.antennaType == GLOBAL.TYPE_SHARK && target.antennae == 1) output2(" A large curved fin sits on the top of your head, looking vaguely like a cresting wave.");
if(target.antennaType == GLOBAL.TYPE_SHARK && target.antennae > 1) output2(" " + StringUtil.capitalize(num2Text(target.antennae)) + " large curved fins sits on the top of your head, looking vaguely like cresting waves. They form a line that gets smaller as they get farther from your front.");

*/