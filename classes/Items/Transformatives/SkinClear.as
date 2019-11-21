package classes.Items.Transformatives 
{
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.CockClass;
	
	public class SkinClear extends ItemSlotClass
	{
		public function SkinClear()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "S.Clear";
			longName = "Skin Clear";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a small bottle labeled “Skin Clear”";
			
			tooltip = "A skin lotion produced by J’ejune Pharmaceuticals. Following the success of Rubber-Made, J’ejune decided to capitalize on the idea of skin treatment cosmetics. Most flopped, but they had a second success with Skin Clear. Marketed as an alternative for those wishing to remove fur or scales, Skin Clear promises to give you smooth, creamy skin.\n\nThere’s a warning on the back that reads, <i>“<b>Danger:</b> For topical use only. Do not apply internally to any orifices. <b>Do not ingest Skin Clear</b>.”</i>";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 1250;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			/*
			Idea: A Lotion based TF that changes the PC’s skin. It removes skin flags, such as Scales, Fur, Chitin, etc. It also comes in a few color selections (Pale, Fair, Tan, Olive, Dark). First dose simply strips flags, second applies the Smooth flag. Each dose can also change skin color if not Human normal pigment. If ingested, the TF will give the lubricated flag to various body parts.
			*/
			
			clearOutput();
			
			if(target is PlayerCharacter)
			{
				useMenu(target);
				return true;
			}
			//Not the player!
			else
			{
				output(target.capitalA + target.short + " applies the Skin Clear lotion to no effect.");
			}
			return false;
		}
		
		private function useMenu(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("SKIN\nCLEAR");
			author("Owens");
			
			output("You take out a small bottle of Skin Clear. Turning it over, you note that there’s a warning on the back which reads, <i>“<b>Danger:</b> For topical use only. Do not apply internally to any orifices. <b>Do not ingest Skin Clear</b>.”</i>");
			output("\n\nHow would you like to use this item?");
			
			clearMenu();
			addButton(0, "Skin", useSkin, target, "Apply to Skin", "Apply the lotion to your skin.");
			addButton(1, "Ingest", useIngest, target, "Ingest Lotion", "Ignore the warning....");
			addButton(14, "Back", useCancel, target);
		}
		
		private function useCancel(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("SKIN\nCLEAR");
			author("Owens");
			
			output("You put the bottle back into your inventory.\n\n");
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new SkinClear()]);
			else
			{
				clearMenu();
				addButton(0,"Next",kGAMECLASS.useItemFunction);
			}
		}
		
		// Use: Skin
		private function useSkin(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("SKIN\nCLEAR");
			author("Owens");
			
			output((!target.isNude() ? "After undressing quickly, y" : "Y") + "ou squirt the contents of the bottle into your hand, letting the clear liquid pool onto your palm. It’s fairly viscous, barely spreading as you finish emptying the container. Setting aside the empty bottle, you rub both hands together, before setting to work, applying the cream into your [pc.skinFurScalesNoun]. Working from the top down, you have just enough to make sure you covered every inch of your body, from your head to " + (target.hasFeet() ? "the tip of your [pc.toes]" : "your [pc.feet]") + ". Once finished, it doesn’t take long for the lotion to get absorbed, leaving the faint scent of peaches behind. You wonder what will happen next....");
			
			clearMenu();
			addButton(0, "Next", skinTF, target);
		}
		// Effects: Skin
		private var skinColorList:Array = ["pale", "fair", "tan", "olive", "dark", "ebony"];
		private function skinTF(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("SKIN\nCLEAR");
			author("Owens");
			
			// Remove Wooly perk
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN && target.hasPerk("Wooly") && !target.hasStatusEffect("Wool Removal"))
			{
				output("After waiting a good while, nothing happens.... You even check your codex for any internal changes, but nothing out of the ordinary shows up. Suddenly, you feel a burning tingle quickly followed by a cool shiver. Double-checking your codex, you discover nothing again. Well something did happen... didn’t it?");
				
				target.createStatusEffect("Wool Removal");
				
				clearMenu();
				addButton(0, "Next", kGAMECLASS.useItemFunction);
				
				return;
			}
			
			var changes:int = 0;
			
			// If pc skin type is not skin, change pc skin type to skin. Remove all flags.
			if(target.skinType != GLOBAL.SKIN_TYPE_SKIN && rand(2) == 0)
			{
				output("While waiting for the lotion to have an effect, you notice that the air around you is starting to get quite warm. While pleasant at first, the temperature continues to increase until it’s positively sweltering. Feeling flushed, you look around for the source of the heat, only to realize that it’s your body producing it. The heat is now so bad that you’re starting to sweat, feeling perspiration slide across your [pc.skinFurScales] in large droplets. Within minutes, your [pc.skinFurScalesNoun] is absolutely drenched, causing you to shiver despite the heat.");
				output("\n\nWorried that you might be having an allergic reaction to the cream, you rub idly at your neck, hoping to wipe off some of the moisture dripping down your back. To your surprise, you feel something rip, pulling your hand away to reveal a clump of your [pc.skinFurScales] clutched between your fingers. Dropping the wet patch of dead [pc.skinFurScales] in shock, your hand darts back to your neck, only to feel normal skin in its place. Hesitantly, you pick at the edge, feeling another wet strip of skin peel away with a damp tearing sound.");
				
				target.skinType = GLOBAL.SKIN_TYPE_SKIN;
				target.clearSkinFlags();
				//if(!InCollection(target.skinTone, skinColorList)) target.skinTone = RandomInCollection(skinColorList);
				
				output("\n\nSoon, both hands are working to remove your former layer of [pc.skinFurScalesNoun], revealing more and more of your [pc.skinColor] skin underneath. When finished, you’re standing in a pile of damp, dead flakes that used to be your outer layer, and are admiring your brand new <b>[pc.skinColor] skin!</b>");
				
				changes++;
			}
			// If pc skin type is skin, gain the smooth flag. Increase Libido by 1 to 5.
			else if(target.skinType == GLOBAL.SKIN_TYPE_SKIN && !target.hasSkinFlag(GLOBAL.FLAG_SMOOTH))
			{
				output("You’re not exactly sure what will happen by applying the liquid when you already have normal skin, but it couldn’t hurt to try, right? While waiting, your body begins to heat up across the surface of your [pc.skinNoun]. With the constant feeling of warmth playing across your body, you feel yourself start to sweat, small droplets beading up on the surface of your [pc.skin]. Soon, your body is producing a constant deluge of moisture, apparently trying to push all the water in your body out through your pores. Worried that you might become dehydrated, you grab the bottle and scan the back, trying to see if it mentions anything about this.");
				output("\n\nThe only thing you find is shilling for more of J’ejune products. Figures, the cheapskates. Tossing the bottle aside, you sink to the ground, feeling a little lightheaded. You’re still sweating, but it looks like it’s slowed down, allowing you to dry yourself a bit. Soon, your pores close up, and you can towel off completely. Upon finishing, you realize that something about your skin has changed: <b>It’s now totally flawless!</b>");
				
				target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
				
				if(target.libido() < target.libidoMax())
				{
					target.libido(1 + rand(5));
					output("\n\nAs you set about donning your gear, you notice there’s a bit of residual heat reaming. It seems the lotion has made you just a bit more sensitive....");
				}
				
				changes++;
			}
			
			// Skin Color
			// If skin color is not {Pale, Fair, Tan, Olive, or Dark}, change skin color to {Pale, Fair, Tan, Olive, or Dark}. The chance of this effect happening is determined by skin type: if skin type is non-skin, 25% chance; if skin type is skin, 50% chance; if skin type is skin with smooth flag, 75% chance.
			var colorChance:int = 3;
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN)
			{
				colorChance = 2;
				if(target.hasSkinFlag(GLOBAL.FLAG_SMOOTH)) colorChance = 1;
			}
			if(!InCollection(target.skinTone, skinColorList) && rand(4) >= colorChance)
			{
				var newColor:String = RandomInCollection(skinColorList);
				
				if(changes > 0) output("\n\n");
				output("Without warning, your [pc.skin] starts to change color, shifting from its normal [pc.skinColor] to a radically different coloration. Once it finishes, your new skin color is a");
				switch(newColor)
				{
					case "pale": output(" blinding pale"); break;
					case "fair": output(" rosy fair"); break;
					case "tan": output(" deep golden tan"); break;
					case "olive": output(" rich olive"); break;
					case "dark": output(" dark chocolate"); break;
					case "ebony": output("n intense ebony"); break;
				}
				output(" hue.");
				
				target.skinTone = newColor;
				
				changes++;
			}
			
			// Dud
			if(changes <= 0)
			{
				output("After waiting a good while, nothing happens.... You even check your codex for any internal changes, but nothing out of the ordinary shows up. So either your skin is as normal as can be, or this bottle is pretty much a dud!");
			}
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
		
		// Use: Ingest
		private function useIngest(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("SKIN\nCLEAR");
			author("Owens");
			
			// if not brute/bimbo:
			if(!target.isBro() && !target.isBimbo()) output("It seems a little silly that they would list a warning on what is clearly a skin product. Overcome by curiosity, you squeeze a small dollop onto a fingertip, hesitantly licking the clear drop. The taste of peaches and cream explodes in your mouth, a delightfully sweet combination. No wonder they had to put the warning! Well, might as well finish what you’ve started: unscrewing the top of the bottle, you place the opening to your [pc.lips] and tilt your head back, dumping the viscous liquid down your throat. It’s like a shot of the stickiest yogurt you’ve ever had, oozing down your throat and leaving a thick, creamy trail behind. As the last of the liquid leaves the bottle, you feel a rumbling in your belly. Setting the bottle down, you cover your mouth as your gut gurgles, feeling something working its way back up your throat. As if beyond your control, a hiccup forces your jaw open, releasing a smattering of small bubbles. They float gently upwards, drifting away from you as your upset tummy quiets. Smacking your lips after the strange experience, you settle down, waiting to see what happens.");
			// If brute:
			else if(target.isBro()) output("No stupid label tells you what to do! Ripping the cap off the bottle, you chug the liquid inside like a pro. No, like a bro! YEAH! Tossing the bottle aside, you swallow the last of the thick, clear stuff, feeling it clog your throat. Tastes like a fruity girly drink, not something you’d usually go for. A loud belch works it way up from your gut, letting a slew of bubbles escape from your mouth. Weird as shit, bro. Now bored, you wait, wondering what’s going to happen next.");
			// if bimbo:
			else output("You giggle. Like, that’s totally a challenge! Unscrewing the cap, you place the opening between your [pc.lips], tilt your head back and pour the liquid down. Bottoms up! Oh, it tastes like peaches and cream! Delicious! Soon, you’ve emptied the entire container of sweet syrup, and swish the liquid around between your jaws. It’s almost the consistency of cum, it’s so thick. Once you’ve coated your entire mouth in the sweet stuff, you swallow, feeling your throat bulge as the load of liquid slowly slides down into your belly, coating your throat in a viscous, sticky trail. Giggling, you let out a small burp, hiccupping as some bubbles of the clear stuff escape. Oopsie. Still giggling, you settle down to wait, wondering just what the sweet drink will do.");
			
			clearMenu();
			addButton(0, "Next", ingestTF, target);
		}
		// Effects: Ingesting
		private function ingestTF(target:Creature):void
		{
			if(badEndCheck(target))
			{
				badEndTF([target, 0]);
				return;
			}
			
			clearOutput();
			kGAMECLASS.showName("SKIN\nCLEAR");
			author("Owens");
			
			var selTF:int = -1;
			var TFList:Array = [-1];
			var i:int = 0;
			var libidoGain:Boolean = (target.libido() < target.libidoMax());
			
			if(!target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED))
				TFList.push(0);
			if(!target.hasTongueFlag(GLOBAL.FLAG_LUBRICATED))
				TFList.push(1);
			if(target.hasCock())
			{
				for(i = 0; i < target.cocks.length; i++)
				{
					if(TFList.indexOf(2) == -1 && !target.cocks[i].hasFlag(GLOBAL.FLAG_LUBRICATED))
						TFList.push(2);
				}
			}
			if(target.hasVagina())
			{
				for(i = 0; i < target.vaginas.length; i++)
				{
					if(TFList.indexOf(3) == -1 && !target.vaginas[i].hasFlag(GLOBAL.FLAG_LUBRICATED))
						TFList.push(3);
				}
			}
			if(!target.ass.hasFlag(GLOBAL.FLAG_LUBRICATED)) TFList.push(4);
			
			if(TFList.length > 0) selTF = TFList[rand(TFList.length)];
			
			switch(selTF)
			{
				// Skin
				case 0:
					// if not brute/bimbo:
					if(!target.isBro() && !target.isBimbo())
					{
						output("As you wait, you notice that your body is slowly heating up, spreading from the outside in. Soon, your very core feels like it’s on fire, and you’re sweating all over. Grossed out, you " + (!target.isNude() ? "strip off your [pc.gear], letting" : "spread your limbs in an attempt to let") + " off some of the excessive heat that you are producing. It soon becomes irrelevant, as you continue to heat up, quickly driving all thoughts from your mind as the sweat continues to pour off you.");
						output("\n\nWithin minutes, the ground around you is damp, and your pores are still gushing liquid. Surprisingly, you don’t feel dehydrated. On the contrary, you feel pretty great, despite the continuous stream of sweat soaking your [pc.skinFurScales]. Looking yourself over, you notice that the sweat has started to change. Instead of regular moisture, it’s now... shinier, for lack of a better word. Additionally, it’s started to smell faintly of peaches, just like the Skin Clear lotion you used. <b>Soon, your whole body is coated in layer of clear liquid, leaving you with glistening, lubricated skin.</b>");
						output("\n\nShortly after, your [pc.skinNoun] begins to glimmer, the torrential output of liquid slows to a crawl. It doesn’t stop, though, continuing to cover you in a perpetual layer of slickness. Shrugging, you " + (!target.isNude() ? "pull your [pc.gear] back on" : "experimentally brush a hand across the surface of your body") + ", shivering as it slides across your newly lubed [pc.skin].");
						if(libidoGain) output(" The drug seems to have increased your sensitivity as well....");
					}
					// if brute:
					else if(target.isBro())
					{
						output("After a few minutes of jack squat happening, you feel your body beginning to heat up. It feels like your muscles are burning, like after a really good workout. Hell yeah, feel the burn, man! You start flexing, hoping that whatever’s happening will make you even more ripped, so that all the ladies will totally dig your rockin’ bod. Maybe even make all your guy friends jealous! It doesn’t take long for beads of sweat to start forming all over your [pc.skinFurScales], and soon you’re positively dripping. Dang, man, that cream stuff must have been packing legit bad mojo to be doing this to you. Maybe you should have listened to the warning label. Well, whatever, man, too late for that now. You just keep flexing, hoping your kickass body can withstand whatever the science-y junk is doing to your insides.");
						output("\n\nEventually, the heat suffusing your body dies down, and you’re able to relax. Your limbs feel like you might have over flexed them, so worried were you about the creepy liquid pouring out of ya. Speaking of which... you give yourself a once over, checking out all your major bodyparts. Seems like everything is still where it’s supposed to be. ‘Cept, everywhere you look, your [pc.skinFurScalesNoun] is shiny. Like, really fucking shiny, man. <b>Seems that cream made you permanently glisten like an oiled Adonis, Hell yeah!</b> You snort, totally checking yourself out, no homo. Screw warning labels man, you should try this shit again!");
					}
					// If bimbo:
					else
					{
						output("There’s a gurgling in your tummy, sounding rather unpleasant. Holding your belly with both hands, you start to rub its surface, hoping that it wasn’t something you ate. Oh, wait, you drank that peach flavored lotion, didn’t you? Uh-oh...");
						output("\n\nThe gurgling becomes more pronounced, and you notice that beads of sweat have started forming on your skin. Gross! " + (!target.isNude() ? "Stripping off your [pc.gear] so that it doesn’t get stinky" : "Attempting to groom yourself") + ", you rub your belly with one hand while wiping the perspiration away with your other. It doesn’t help, and soon you are drenched in sticky sweat drops. You shiver as they roll down your spine, trickling into all your secret places. You let out a gasp of surprise, feeling the viscous layer all over your body slowly starting to warm up.");
						output("\n\nWithin minutes, you’re constantly dripping, covered in a thin sheen of sticky clear liquid. No matter what you do, it doesn’t stop, and you " + (target.hasFeet() ? "stamp your [pc.foot]" : "wriggle") + " in frustration. You don’t want to be covered in icky sweat all the time! There’s little time for your tantrum, however, because your slimy cover is changing, starting to smell faintly of peaches! Surprised, you watch as the icky, sticky stuff stops flowing so fast, and instead becomes a glistening layer all over your body. It’s making you sparkle!");
						output("\n\nWith that, the gurgling in your belly ceases as well, and you spend a few minutes looking at your reflection in your shiny, constantly lubed skin. You giggle. Now that it’s no longer sticky, it would feel pretty good to rub against someone, just gliding all over their body as your frictionless skin heats up... oh, that’s something you’re going to have to try.");
						if(libidoGain) output(" Pulling your [pc.gear] back on, you notice right away that you’re a lot more receptive, cooing as the fabric of your [pc.underGarments] rubs against your sensitive spots. This could be really fun....");
					}
					
					// If pc skin does not have the lubricated flag, gain the lubricated flag. Increase Libido by 1 to 5. Decrease energy by 10.
					target.addSkinFlag(GLOBAL.FLAG_LUBRICATED);
					if(libidoGain) target.libido(1 + rand(5));
					target.energy(-10);
					break;
				// Tongue
				case 1:
					output("The inside of your mouth feels... slimy, for lack of a better word. Opening your mouth to get a better look, you’re surprised to find that a pool of saliva has gathered there and begins to spill over your lower [pc.lipChaste]. Some of it lands on the ground, splattering as it hits, but you’re forced to swallow more and more as the interior of your mouth seems hell bent on drowning you. After a few tense minutes, the flood of spittle settles down, and you’re able to examine the source of this outpouring. It would seem that your tongue is responsible, as it now glistens with slathered excesses of saliva. Letting it dangle out, it drools a steady stream of sticky, clear lubricant down your front, without drying out. <b>It would seem that your tongue is now lubricated</b>, suffusing your mouth with a constant warm yet wet feeling.");
					
					// If pc tongue is not lubricated, gain the lubricated flag. Increase Libido by 1 to 5.
					target.addTongueFlag(GLOBAL.FLAG_LUBRICATED);
					if(libidoGain) target.libido(1 + rand(5));
					break;
				// Cock
				case 2:
					var uniCock:Boolean = (target.cocks.length == 1);
					var cockIdx:int = target.biggestCockIndex();
					
					// if not brute:
					if(!target.isBro())
					{
						output("At first, it seems nothing has happened. You scratch your head, wondering if ingesting the cream was the right decision after all, since it appears to have been a waste of credits. That thought vanishes as you feel an unnatural wetness");
						if(!target.isCrotchExposed())
						{
							output(" in your [pc.lowerGarment].");
							if(!target.isCrotchExposedByArmor()) output(" Pulling down your [pc.armor], y");
							else output(" Y");
							output("ou find that the front of your " + (!target.isCrotchExposedByLowerUndergarment() ? "[pc.lowerGarment]" : "crotch") + " is sopping wet. Worried, you undress");
						}
						else output(" on your groin. You find that the front of your crotch is sopping wet. Worried, you reposition yourself");
						output(", now intent on finding out what’s happening to your nether region.");
						output("\n\nAs soon as you get" + (!target.isCrotchExposed() ? " your [pc.lowerGarments] out of the way" : " a better view") + ", you are quickly able to identify the source of your unnatural dampness: " + (uniCock ? "your [pc.cock] has begun to drip a clear liquid from every inch of its surface" : "all of your [pc.cocks] have begun to secrete a clear liquid along its length") + ". Your first thought is that you should see a doctor, since it looks like your dick" + (uniCock ? " is" : "s are") + " melting into clear slime. However, you notice that nothing bad seems to be happening to your cock" + (uniCock ? " itself" : "s themselves") + ". In fact, a subtle, pulsing heat has begun to play up and down your shaft" + (uniCock ? "" : "s") + ", and the " + (uniCock ? "it has" : "they have") + " begun to rise in response.");
						output("\n\nWithin in minutes");
						if(!target.isCrotchExposed()) output(" of being freed from the confines of your wet underwear");
						output(", [pc.eachCock] is hard, throbbing with need as you stare wide eyed at the shiny length" + (uniCock ? "" : "s") + " before you. Tentatively, you reach out a hand to grasp your [pc.cock " + cockIdx + "], surprised to find the fluid coating it is comparatively cool to the touch, creating an interesting contrast with the hot flesh in your grasp. Slowly, you begin to pump up and down, feeling your fingers glide around the slick shaft with relatively little friction. When nothing bad seems to happen, you speed up, sliding your hand faster and faster. Soon, you’re moving your arm at a breakneck rate, your breaths becoming more and more ragged as the twinge of arousal begins to build and spread throughout your body. It feels so good, jerking off as the strange clear coating covers your dick" + (uniCock ? "" : "s") + ". Stranger still, there seems to be no end to it. Instead, there’s simply a continuous flow, coming from your body itself. The way it coats your shaft" + (uniCock ? "" : "s") + ", letting you work yourself closer and closer to the edge of sweet release, almost as if you were using...");
						output("\n\nRealization dawns on you and you slap your free hand to your forehead. Of course, as if you were using lubricant. <b>The lotion has made it so that your dick is now constantly dripping clear lube</b>. The source of the fluid now identified, you push it out of your mind, instead focusing on bringing your [pc.cock " + cockIdx + "] to climax. The speed at which you’re moving your arm would give you friction burns if not for the grease coating you’ve been using, but you don’t care: you <i>need</i> to get off. Pre has started to drip from your cock-head" + (uniCock ? "" : "s") + ", mixing into the fluid already coating your " + (uniCock ? "[pc.cock]" : "[pc.multiCocks]") + ".");
						if(libidoGain) output(" It seems the cream also jacked your sensitivity up a notch, as the feeling of stroking up and down is easily double in intensity to before you swallowed that peachy mixture.");
						output(" A low groan works it way out of your clenched teeth, feeling the results of your frantic masturbation session begin to build up in your [pc.balls].");
						output("\n\nFinally, you a tingling sensation works its way up your spine, the sure sign that you’ve reached climax. Unable to keep up your pace, you stop, feeling a load of [pc.cum] push its way out of your [pc.balls] and up your flailing cock" + (uniCock ? "" : "s") + ". Flopping backwards, your body cums without your assistance, " + (uniCock ? "your single shaft pulses, pushing the whole load straight up in a tiny fountain spray that arcs over you, splattering down in large drops as you close your eyes in exhaustion" : "each cock head spasms as it shoots streamers of [pc.cumNoun] into the air, falling back to coat you in hot stripes of your own jizz") + ".");
						output("\n\nWhen you’ve recovered enough to sit back up, you find that your " + (uniCock ? "[pc.cock] is" : "[pc.multiCocks] are") + " still covered in the shiny lubricant that your body seems to naturally produce now. Your hand, too, is covered in the stuff, trailing streamers between it and your drenched groin. You wipe as much jizz and lube off yourself as you can");
						if(!target.isCrotchExposed())
						{
							if(!target.isCrotchExposedByLowerUndergarment()) output(" before sliding your [pc.lowerGarment] back on. There’s a squishing sound as the wet material nestles snuggly against your " + (uniCock ? "[pc.cock]" : "[pc.multiCocks]") + ", trapping the hot skin against the soaked fabric");
							if(!target.isCrotchExposedByArmor()) output(". Sighing, you don your [pc.armor]");
							else output(". Adjusting yourself, you sigh");
						}
						else output(". Adjusting yourself, you sigh");
						output(", acutely aware that from now on your privates are going to be constantly dripping.");
						
						// Decrease energy by 10.
						target.energy(-10);
					}
					// if brute:
					else
					{
						output("It’s been a few minutes, and you’re suddenly alerted to a pressing issue: your");
						if(!target.isNude())
						{
							if(!target.isCrotchExposed()) output(" " + (!target.isCrotchExposedByArmor() ? "[pc.armor]" : "[pc.lowerUndergarment]") + " tented by");
							else output(" crotch is displaying");
							output(" a raging erection. Grinning, you slide out of your [pc.lowerGarments], getting buck naked");
						}
						else output(" crotch is displaying a raging erection. Grinning, you drop our gear on the spot");
						output(" as you prepare yourself to deal with your best budd" + (uniCock ? "y’s" : "ies’") + " most urgent of problems. However, you’re halted in your tracks when you see something has changed about your little friend" + (uniCock ? "’s" : "s’") + " appearance: " + (uniCock ? "he’s" : "they’re") + " now coated in a layer of clear slime!");
						output("\n\nYou grunt, perturbed by this sudden development. But fuck time is go time, and you have a clear objective, man: to take care of this hard-on by jerking it like there’s no tomorrow. To that end, you grab your [pc.cock " + cockIdx + "] firmly, ignoring the strange, sticky covering, and begin to beat your meat. Surprisingly, the goop seems to be acting like some sort of lubricant, letting you deal with your penis" + (uniCock ? "" : "es") + "’ problem. Awesome.");
						output("\n\nIn no time at all, your well-oiled, fuck-machine body comes crashing into the station with an explosive climax. From your " + (uniCock ? "[pc.cockhead], a blast of [pc.cum] shots out, splattering across the ground in front of you as your arm movements slow down" : "[pc.cockHeads], streams of [pc.cum] launch in all directions, painting a work of modern art on the ground in front of you. Too bad you ain’t no artist, bro") + ". Finished with your impromptu wank, you once again examine your solid snake" + (uniCock ? "" : "s") + ". The surface of your dong is still shining, prompting you to scratch your head. <b>Shiiit, looks like you’re going to constantly have a lubed up dick, man</b>. Man, that’s gonna be a pain. Able to jerk one off whenever you want, being constantly ready to slip right into any chick you come across, and needing no prep time to get sufficiently lubed...");
						output("\n\nWait... that actually sounds pretty awesome. Fuck yeah! You high five your member" + (uniCock ? "" : "s"));
						if(libidoGain) output(", wincing as you slap the tender dick flesh. Seems like you’re a bit more sensitive as well, probably why you finished so fast. Should have taken twice as long");
						output(". You nod in agreement with yourself, assured of your own sexual prowess.");
						if(!target.isNude()) output(" You pull your clothes back on, satisfied with what has happened.");
						output(" You’re still a mean fuck-machine, no doubt about that.");
						
						// Decrease energy by 20.
						target.energy(-20);
					}
					
					// If pc cock{s} {doesn’t/don’t} have the lubricated flag, gain the lubricated flag. Increase Libido by 1 to 5. Reset Lust to 0.
					for(i = 0; i < target.cocks.length; i++)
					{
						if(!target.cocks[i].hasFlag(GLOBAL.FLAG_LUBRICATED)) target.cocks[i].addFlag(GLOBAL.FLAG_LUBRICATED);
					}
					if(libidoGain) target.libido(1 + rand(5));
					target.orgasm();
					break;
				// Vagina
				case 3:
					var uniVag:Boolean = (target.vaginas.length == 1);
					var vagIdx:int = rand(target.vaginas.length);
					
					// if not bimbo:
					if(!target.isBimbo())
					{
						output("A vast rumbling works its way through your lower body, causing you to double over in discomfort. Holding your gut with both arms, you can only gasp as what feels like a switch is thrown, and the floodgates inside you open up." + (!target.isCrotchExposed() ? " You’ve soaked your [pc.lowerGarments] within seconds, a torrent of clear slime oozing through the material from your [pc.vaginas]" : " A torrent of clear slime oozes from your [pc.vaginas] and down your [pc.thighs]") + ". Shocked at the sudden outpouring, you " + (!target.isCrotchExposed() ? "pull back the offending clothing" : "position yourself for a better view") + ", watching as what looks like liters of clear fluid leaks out of your cunt" + (uniVag ? "" : "s") + ". A worrying amount, if you had to be honest. Soon, you’re sitting in a puddle of the stuff, but strangely, you feel none the worse for wear.");
						output("\n\nThe deluge of liquid abates as quickly as it began, and you shakily rise to your feet. Gingerly, you poke at the still dripping surface of [pc.oneVagina], relieved to find that it’s mostly normal aside from the constant drooling. In fact, the inside is glistening from the outpouring, thoroughly coated in the mixture. As you ponder where exactly all this stuff came from, you finally notice the faint smell of peaches wafting in the air. Of course, the lotion you drank. Probably not your brightest idea after all, <b>since it has left your [pc.vaginas] permanently lubricated and dripping</b>.");
						if(!target.isCrotchExposed())
						{
							if(!target.isCrotchExposedByLowerUndergarment()) output(" You pull your [pc.lowerGarment] back on and feel the waistband snap snugly around you, trapping the sticky goop inside the fabric.");
							if(libidoGain) output(" " + (!target.isCrotchExposedByArmor() ? "As you pull on your [pc.armor], y" : "Y") + "ou sigh, feeling the tingles of lust that foreshadow another wild sexcapade.");
						}
						else if(libidoGain) output(" You sigh, feeling the tingles of lust that foreshadow another wild sexcapade.");
						if(libidoGain) output(" Seems the lotion’s not done with you yet. Probably a good idea to find a spot to take care of your increased sex drive before you set off again.");
						
						// Increase lust by 10.
						target.lust(10);
					}
					// if bimbo:
					else
					{
						output("There’s a familiar sensation as your " + (uniVag ? "cunny begins" : "cunnies begin") + " to drool hungrily. You giggle, " + (!target.isCrotchExposed() ? "stripping off your [pc.gear]" : "adjusting yourself") + " so you can get at " + (uniVag ? "your dripping twat" : "one of your dripping twats") + ". Ooh, it’s positively gushing in anticipation as you stick a finger inside, feeling your [pc.vagina " + vagIdx + "] clench around the intruder. Fishing the digit out, you pop it into your mouth, intending to savor the flavor of your [pc.girlCum]. Instead, you get a mouthful of peaches. With cream. Oh, right, that weird liquid you drank. You totally forgot about that. As you suck on the finger, wondering just why your girl juice tastes like the strange not-drink, you notice that your [pc.vagina " + vagIdx + "] is still gushing. Odd.");
						output("\n\nToo weirded out by your dribbling lower mouth" + (uniVag ? "" : "s") + " to continue playing with yourself, you settle down to watch what looks like a gallon of liquid seep out of you. The cream must be doing something inside of your tummy, since it doesn’t feel icky despite losing so much liquid. In fact, you begin to enjoy the feeling, slapping your hand against the " + (target.hasPlumpPussy(vagIdx) ? "puffy pussy" : "dainty nether") + " lips and watching as thick streams of clear, gooey liquid stretch from your fingers to the surface of your twat. However, the deluge only lasts for a little while, and soon it all but stops. You pout, watching as your soaked pussy lets out a few half hearted dribbles, before patting it gingerly.");
						if(libidoGain) output(" While your were playing around, the lotion jacked up your sensitivity down there, making it feel so much better when you...");
						output("\n\nYou moan unintentionally, having snuck a finger or two back into your [pc.vagina " + vagIdx + "]");
						if(libidoGain) output(", enjoying the increased sensitivity more than you should");
						output(". As you pull them out, you notice that the inside is still glistening with a steady stream of the sticky stuff seeping right from the walls of your vag. <b>It looks like your " + (uniVag ? "pussy is" : "pussies are") + " now continually drooling [pc.girlCumFlavor] lube</b>.");
						if(!target.isCrotchExposedByLowerUndergarment()) output(" You giggle again, pulling your [pc.lowerGarment] back on with a snap of the waistband, feeling the fabric press against your aroused muff" + (uniVag ? "" : "s") + " in the most delicious ways.");
						output(" You need to find a nice, hard dick to fill you right up, forcing all the gooey juice out as he - or she - pumps a hot steaming load into your hungry cunt" + (uniVag ? "" : "s") + ". Mmmh. Just thinking about it has you soaked again, your vagina" + (uniVag ? "" : "s") + " slobbering over the thought of such a dick. You lick your [pc.lips] as well, " + (!target.isCrotchExposedByArmor() ? "pulling your [pc.armor] on" : "adjusting your gear") + " as you set off, juicy snatch" + (uniVag ? "" : "es") + " now constantly dripping and ready to be fucked.");
						
						// Increase lust by 20.
						target.lust(20);
					}
					
					// If pc vagina doesn’t have the lubricated flag, gain the lubricated flag. Increase Libido by 1 to 5.
					for(i = 0; i < target.vaginas.length; i++)
					{
						if(!target.vaginas[i].hasFlag(GLOBAL.FLAG_LUBRICATED)) target.vaginas[i].addFlag(GLOBAL.FLAG_LUBRICATED);
					}
					if(libidoGain) target.libido(1 + rand(5));
					break;
				// Asshole
				case 4:
					author("Jacques00");
					
					var canReachBooty:Boolean = (target.hasPartGoo("arm") || target.isGoo() || (!target.isTaur() && !target.isDrider()));
					
					output("Something strange happens as your [pc.asshole] throbs quite forcefully. Your ass is definitely causing quite a ruckus. If it is trying to get your attention, it definitely has it. You try to bend your torso to get a good look at what is going on but to no avail. The orgasmic spasm of your anus increases in intensity as you begin to feel several sensations in sequence: First a light tingling, then an itching feeling, and finally a burning irritation. What is going on?!");
					output("\n\nYou lose control of your lower body as your hands hit the floor and your [pc.butt] sticks straight up in the air, bobbing and bouncing in some kind of strange erotic dance. Your head follows soon after, laying against the floor as your ass stands as tall atop your [pc.legOrLegs] as possible.");
					output("\n\nThe burning sensation turns into an intense inferno that builds higher and higher. Your [pc.asshole] tenses tighter and tighter. Your face flushes red as the internal pressure fills you more and more that you might want to explode. Then, as soon as you’ve reached the peak, the fire is suddenly doused with an extremely cool liquid. Relief... You almost coo at the feeling. The liquid spooge pouring out from between your [pc.butts] continues to trickle down your");
					if(target.hasGenitals()) output(" [pc.crotch] and");
					output(" [pc.legOrLegs], giving you goosebumps from the trail it leaves behind.");
					output("\n\nWith your butt still in the air, you attempt to explore your rectum with your hands");
					if(!canReachBooty) output(" but you can’t seem to reach it, no matter how much you want to. Regardless, y");
					else output(". Y");
					output("ou can feel your asshole become a lot more slick than usual, drooling a constant stream of thick lube. You try to");
					if(!canReachBooty) output(" move your rectal muscles to cut the flow");
					else output(" wipe it away with your fingers");
					output(", but it will not cease. You even retry it a few times, but it is a futile effort. <b>It seems the lotion has worked with the microsurgeons in your system to permanently lubricate your backdoor...</b>");
					output("\n\nWhen you think your butt has finally calmed, you get yourself up off the floor and on your [pc.feet]. As you do, however, you notice a strong, sweet scent of peaches and cream flow from your ass.");
					if(kGAMECLASS.silly) output(" Great, now your butt smells lovely.");
					output(" You dust yourself off and rub your backside tenderly. Your cheeks and hips tingle as your asshole throbs in response, making sure the trail of lube continues to flow down your [pc.thigh]... well, now you have something new to get used to!");
					
					target.lust(30);
					target.ass.addFlag(GLOBAL.FLAG_LUBRICATED);
					if(libidoGain) target.libido(1 + rand(5));
					break;
				// Dud effect
				default:
					output("After waiting a good while, nothing happens.... You even check your codex for any internal changes, but nothing out of the ordinary shows up. So either your stomach nullified the effects, or this bottle is pretty much a dud!");
					break;
			}
			
			kGAMECLASS.processTime(5 + rand(5));
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
		
		// Bad End
		// If the pc ingests Skin Clear while all four supported body parts - skin, tongue, dick, and vagina - already have the lubricated tag, it results in a bad end.
		private function badEndCheck(target:Creature):Boolean
		{
			var i:int = 0;
			
			if(!target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) return false;
			if(!target.hasTongueFlag(GLOBAL.FLAG_LUBRICATED)) return false;
			if(target.hasCock())
			{
				for(i = 0; i < target.cocks.length; i++)
				{
					if(!target.cocks[i].hasFlag(GLOBAL.FLAG_LUBRICATED)) return false;
				}
			}
			if(target.hasVagina())
			{
				for(i = 0; i < target.vaginas.length; i++)
				{
					if(!target.vaginas[i].hasFlag(GLOBAL.FLAG_LUBRICATED)) return false;
				}
			}
			if(!target.ass.hasFlag(GLOBAL.FLAG_LUBRICATED)) return false;
			
			return true;
		}
		private function badEndTF(arg:Array):void
		{
			clearOutput();
			author("Owens");
			
			var target:Creature = arg[0];
			var pageNum:int = arg[1];
			var i:int = 0;
			
			switch(pageNum)
			{
				case 0:
					kGAMECLASS.showName("SKIN\nCLEAR");
					
					output("You make yourself comfortable, used to the transformation taking some time to set in. You wonder what new part of you will become coated in a layer of shiny, oiled lubricant after this most recent dose, mind wandering as you wait for the changes to start. Time seems to stretch on and on, and you find your eyelids drooping slightly, a feeling of fatigue coming over you. Weird, you didn’t feel so tired when you drank the peachy liquid, but whatever, a nap wouldn’t hurt. You close your eyes, settling back against a nearby " + (kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.OUTDOOR) ? "rock" : "wall") + ". Dimly, you’re aware of a warm heat starting to diffuse through you, but you can do nothing as sleep overtakes you, dragging you into the inky darkness of unconsciousness.");
					output("\n\nIt’s probably a good thing that you let sleep claim you, as you are not awake to see the changes that take place. Your subconscious notices, though, and your sleep is plagued by half glimpses of what is becoming of your body as the nanomachines inside of you work to adapt your biology to the strange chemical you have continuously imbibed. Fitfully, you toss and turn, chased by a never ending, cascading roar of liquid. Whenever a drop lands on your naked body - of course you’re naked, that’s just perfect - it clings, suffusing the surrounding skin with an overwhelming, lusting heat. Soon, the beads have grown larger, more splatters clumping together to form rivulets that drip down your back as you flee, heating your body up so much that smoke starts to pour from your skin.");
					output("\n\nThe smoke is white, a clinging fog that wraps itself around your head, invading through your nose, ears, eyes, and mouth. It smells of peaches and cream, a cloying scent that wiggles into your brain as you struggle to breath through the fog pouring off of you. What’s worse, it obscures your vision, making it impossible to see a foot in front of you. Blissfully, the roar is muted by the fog, but you can feel it behind you, pressing in as your body slows. Soon, you are deprived of all of your senses, and the ground recedes away from you, leaving you falling in white mist. Then the impact, as you fall head first into the wall of rushing liquid. You scream, but your voice is snatched away as the fog and sticky fluid rush in, filling your lungs with their essence. You struggle, feeling the surrounding fluid flex with your movements, containing you as you choke. Tears bead up, floating in the gooey, sticky mess that surrounds you. There’s a burning inside your chest, radiating outward. A deep, intrinsic need that beats in time with your heart, blanking out everything else in your mind. And just as the white begins to darken, you feel like you’re going to pass out....");
					
					kGAMECLASS.processTime(30 + rand(5));
					break;
				case 1:
					kGAMECLASS.showName("CLEARER\nSKIN...");
					
					kGAMECLASS.restHeal();
					
					output("You wake up. And nothing has changed. Only now, you don’t feel the need to breath. Your lungs ARE liquid, your body is one with the fluid that was pressing in on you, the white fog is not some obscuring mist, but a strange film on the outside of your form. Tentatively, you press outward, watching as the film cracks, similar to an egg, letting you spill forth into the world. Shakily, you try and stand up, parts of your body dripping off as you rise higher and higher, until you’re once more at your old height. Looking down, you see your body - rather, your new body - steadily dripping. You’re made of a clear, sticky liquid, slowly streaming off your vaguely humanoid shape as you look around. Your gear lies in a pile behind you, covered in the remains of your filmy cocoon, but you feel no attachment to it. Instead, you turn away, rolling forward on your greased, blobby bottom carriage, looking for someone to sate the burning heat inside of you. Searching for someone to fill the need for you.");
					
					kGAMECLASS.processTime(1412);
					
					target.removeAll();
					target.hairType = GLOBAL.HAIR_TYPE_GOO;
					target.createStatusEffect("Goo Vent");
					target.createStatusEffect("Goo Crotch");
					target.createStatusEffect("Gel Body");
					target.addStatusValue("Gel Body", 1, 1);
					kGAMECLASS.revertGooBody();
					kGAMECLASS.flags["GOO_BIOMASS"] = 9000000;
					
					var gooTone:String = "transparent";
					target.skinTone = gooTone;
					target.hairColor = gooTone;
					target.furColor = gooTone;
					target.scaleColor = gooTone;
					
					if(target.hasCock())
					{
						for(i = 0; i < target.cocks.length; i++)
						{
							if(!target.cocks[i].hasFlag(GLOBAL.FLAG_GOOEY)) target.cocks[i].addFlag(GLOBAL.FLAG_GOOEY);
							target.cocks[i].cockColor = gooTone;
						}
					}
					if(target.hasVagina())
					{
						for(i = 0; i < target.vaginas.length; i++)
						{
							if(!target.vaginas[i].hasFlag(GLOBAL.FLAG_GOOEY)) target.vaginas[i].addFlag(GLOBAL.FLAG_GOOEY);
							target.vaginas[i].vaginaColor = gooTone;
						}
					}
					target.girlCumType = GLOBAL.FLUID_TYPE_SPECIAL_GOO;
					target.cumType = GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO;
					
					target.maxOutLibido();
					target.maxOutLust();
					break;
				case 2:
					kGAMECLASS.showName("CLEARER\nSKIN...");
					
					output("<b> Time passes....</b>");
					kGAMECLASS.currentLocation = "GAME OVER";
					kGAMECLASS.generateMap();
					kGAMECLASS.processTime(20 + rand(5));
					
					output("\n\nYou come across another rusher, dressed in skintight catsuit that shows off her curves. Without your codex, you have no clue to her race, but she seems to be some sort of reptilian. She has her back turned to you, observing something on the ground as you stealthily approach, taking in the wide expanse of her ass hovering just inches off the ground. You hesitate for a moment, but the need burns inside of you, pushing away all other thoughts. The only warning she gets is the sound of you pouncing, and then you’re on her, wrapping your gooey limbs around her chest as she falls forward in surprise. <i>“Wha--”</i> is all she gets to say before you turn her around to face you and close off her lips in a gooey kiss, pressing your lips into hers gently as one arm slips down to pull her big behind tightly into your gooey frame. Breaking apart, she gasps, eyes slightly askew as you smile reassuringly, hand slipping down to her crotch. To your delight, you find that she’s already soaked, her sexy suit squelching as you close your sticky digits around the outside. She blushes as her senses slowly return to her. Allowing her a second to respond, she gives you a slight nod and grins. Looks like you’ve caught quite a horny one!.");
					output("\n\nFrom your crotch, a gooey pseudo phallus pushes outward");
					if(target.hasCock()) output(", mimicking your own dick" + (target.cocks.length == 1 ? "" : "s") + " from before");
					output(". The alien rusher’s blush deepens, looking away from you as your new pulsing member pushes into her belly. You gently turn her back to face you, kissing her again as you pull down on the catsuit, revealing her scaled pussy. Now sure that she’s comfortable, you push forward, ramming the full length of your gooey dick into her, earning yourself a little squeak from your alien friend. The heat inside of you burns hotter, and you begin to pump back and forth, hauling the alien’s legs around your back and gripping the her big cushiony butt as you pump your hips back and forth. All the rusher can do is hold on for dear life, as you take her for a ride. Soon, your feel yourself stiffen, and the rusher lets out a cry as you both climax, filling her belly with an explosion of sticky goo. The reptilian girl slides out of your grasp, lying limply on the ground as you pant, watching her smile at you as she tries to get her breath back from the fucking you just gave her.");
					
					var newCock:CockClass = new CockClass();
					target.cocks.push(newCock);
					
					if(target.hasCock())
					{
						var bigCock:int = target.biggestCockIndex();
						if(target.cocks[bigCock].cThicknessRatioRaw < 1.5) target.cocks[bigCock].cThicknessRatioRaw = 1.5;
						if(target.cocks[bigCock].cLengthRaw < 18) target.cocks[bigCock].cLengthRaw = 18;
						target.copyCock(target.cocks.length - 1, bigCock);
					}
					else
					{
						target.cocks[target.cocks.length - 1].cThicknessRatioRaw = 1.5;
						target.cocks[target.cocks.length - 1].cLengthRaw = 18;
					}
					
					target.cockChange();
					target.orgasm();
					
					output("\n\nBut it’s not enough. More than ever, the burning need inside of you is blazing, and you look down at the tired girl hungrily. She watches, nervously, as your member slides out of her and rises back to pseudo-erection as you gaze at her, grinning much less friendly now. Slowly, she shakes her head, inching backwards. <i>“O-once was enough, wasn’t it?”</i> You shake your head no in return, your goo-phallus shivering as it splits down the length into two larger dicks. Her eyes bug out, and she turns to run from your fuck hungry cocks, but you lash out one gooey tendrils, wrapping around her feet and tripping her. You pull her back, placing a hand on that massive ass as you press both heads against her cushiony derriere. She glances over her shoulder at you, tears in her eyes and whispers <i>“Please--”</i>");
					
					target.cocks[target.cocks.length - 1].cThicknessRatioRaw += 0.5;
					target.cocks[target.cocks.length - 1].cLengthRaw += 6;
					target.copyCock(target.cocks.length - 1, target.biggestCockIndex());
					
					output("\n\nThat’s all she gets out before you plunge yourself through the catsuit, punching a hole with the force of your thrust. This time she screams, tears freely flowing as you pound her brutally, twin cocks ramming her as hard as you can physically move. Soon, you feel yourself crest again, and blast more sweet goop into her insides, watching as her stomach bloats a little from your liquid load. You pause for a second, wondering if that’s enough for now. Inside your chest, the familiar heat, the need to fuck, pulses, and you grin in response. The girl below you voiceless gasps as your cocks multiply again, two in each hole, and you resume fucking her, enjoying the feeling of pumping her full of your peachy seed.");
					
					target.cockChange();
					
					target.maxOutLust();
					target.orgasm();
					target.cocks.push(newCock);
					target.copyCock(target.cocks.length - 1, target.biggestCockIndex());
					target.cocks.push(newCock);
					target.copyCock(target.cocks.length - 1, target.biggestCockIndex());
					target.orgasm();
					
					kGAMECLASS.processTime(720 + rand(720));
					break;
				case 3:
					kGAMECLASS.showName("MORE CLEAR\nSKIN...");
					
					output("<b> Time passes....</b> ");
					kGAMECLASS.currentLocation = "GAME OVER";
					kGAMECLASS.generateMap();
					kGAMECLASS.sleepHeal();
					kGAMECLASS.processTime(4320 + rand(720));
					
					output("\n\nYou pause to admire your handiwork. It’s been a full three days, and the alien girl is now gone. In her place is a gooey slime creature, similar to you. You noticed the changes after about a day, that her skin was glistening like yours had after ingesting the Skin Clear stuff. After two days, she was practically see through, and now she’s exactly like you, totally made of shiny, liquid goop. You smile down at her, and she gives you a smile in return. You’re currently hilted on her massive dong, enjoying the feeling of her member stirring up your insides as you contemplate what to do next. As you fuck her, you see snippets of her past life, probably due to her becoming part of whatever you are now. So you know where she and her crewmates landed, and that the three of them should still be there. A predatory smile creeps onto your face and you look down at your partner, seeing your expression mirrored. Perhaps the two of you should pay them a visit?");
					break;
				case 4:
					kGAMECLASS.showName("MORE CLEAR\nSKIN...");
					
					output("<b> Time passes....</b>");
					kGAMECLASS.currentLocation = "GAME OVER";
					kGAMECLASS.generateMap();
					kGAMECLASS.processTime(120 + rand(60));
					
					output("\n\nYou groan, cumming again as you stuff the kaithrit girl on your dick full with your odd, peachy cum. Gooey tentacles from your back are restraining the other two crew members, a human male and some sort of snake lady as their former crewmate fucks them at the same time. Below you, the kaithrit looks fit to burst, her belly bloating from the load you dumped down her throat. Looks like it’s time to rotate her. Behind you, you hear your goo partner giggle at your mental joke, the connection between you apparently growing stronger. Whatever is happening, you’re loving every minute of it.");
					
					kGAMECLASS.processTime(35 + rand(5));
					
					target.wingType = GLOBAL.TYPE_COCKVINE;
					if(target.wingCount < 24) target.wingCount = 24;
					
					target.orgasm();
					break;
				case 5:
					kGAMECLASS.showName("MORE CLEAR\nSKIN...");
					
					output("<b> Time passes....</b>");
					kGAMECLASS.currentLocation = "SHIP INTERIOR";
					kGAMECLASS.generateMap();
					kGAMECLASS.sleepHeal();
					kGAMECLASS.processTime(43200 + rand(10080));
					
					output("\n\nThere’s a knock of the door of the spaceship. You grunt in frustration, stopping what you are doing and walking over to the door. Opening it, you are face to face with a plumed, avian biped. He - you assume it’s a he - blinks at the sight of you. <i>“Miss, your ship has been stationed here for a month. You need to leave. The other spaceport attendants have told you the same thing!”</i> He squawks, arms crossed over his chest. You grin slowly, leaning to one side, dick swinging between the two of you. Oh, yes, the station attendants. You were just finishing with one now. Maybe he’s likely to come and see? He blinks again, nervously, then nods, stepping through the door. As it slides closed behind him, you grin, dick hardening as you begin to fantasize about what you are going to do to his bony ass.");
					output("\n\nYou follow him as he walks through your ship, sniffing disparagingly at the thin coating of slime on everything. You apologize, saying it makes you and the crew feel more comfortable. When he gets to the opening in the next room, he freezes, eyes widening in shock. You’re on him in a moment, pushing him forward and tearing off his pants. He shrieks, trying to claw at you, but your body simply grabs his flailing limbs, holding him in place as your massive dick pokes gently at his back door. <i>“When I finish, the other attendants get a turn with you. They say that you’re kind of a prick,”</i> you whisper to him. The gooey attendants in front of him begin to giggle, dicks hardening as you slide him down your pseudo-penis.");
					
					target.cockChange();
					
					kGAMECLASS.processTime(35 + rand(5));
					target.lust(100);
					break;
				case 6:
					kGAMECLASS.showName("MUST\nASSIMILATE...");
					
					output("<b> Time passes....</b>");
					kGAMECLASS.currentLocation = "GAME OVER";
					kGAMECLASS.generateMap();
					kGAMECLASS.sleepHeal();
					kGAMECLASS.processTime(432000 + rand(10080));
					
					output("\n\nIt’s been almost a year now. You sit at your desk, typing at an old terminal. Below, one of your extras is giving you a blowjob, deep throating your dick as you work, helping you to focus on the important tasks of running the small spaceport. The door to your office opens, and you look up in annoyance. It’s your secretary, the first one you turned. She has a new batch of off-worlders, seeking landing permits. Your annoyance evaporates, turning into a lusty grin that spreads across all three of your faces. You cum, filling up the gooey girl under the desk as you straighten, shutting off the terminal. You love greeting new arrivals. It’s always so... personal. The cum filled girl giggles at your joke, and your secretary chuckles lustily, her own dick rising alongside yours. Together, the two you prepare to induct the newcomers into your fold. After all, you want to be welcoming.");
					
					kGAMECLASS.processTime(35 + rand(5));
					target.orgasm();
					break;
				case 7:
					kGAMECLASS.showName("AUTOEROTIC\nASSIMILATION");
					
					output("<b> Time passes....</b>");
					kGAMECLASS.currentLocation = "GAME OVER";
					kGAMECLASS.generateMap();
					kGAMECLASS.sleepHeal();
					kGAMECLASS.processTime(2628000 + rand(525600));
					
					output("\n\nYou’re now the ruler of your own little planet, everyone else another one of you. You sit at your old desk, your chair now a quivering on your throne of goo. The girls below you struggle, trying to fill you as they endlessly cum into your body, but many have fallen off in exhaustion. The burning desire inside of you is never sated, even when you sink to the highest forms of debauchery. Indeed, the western continent is still locked in perpetual orgasm after your last attempt to sate your lusts. You sigh in annoyance, standing up so suddenly that the dicks buried in you pull out with a squelch. The girls try and apologize to you, but you brush them off. Shooting you worried looks, they turn to each other and begin to fuck amongst themselves as you leave the room, unsatisfied.");
					output("\n\nAs you walk through what is now the capital, the citizens around you are constantly fucking each other. You can feel them through the link between you all, and in essence, you are constantly fucking and being fucked by everyone around you. Yet, there’s never any release anymore. The only thing that makes you even remotely satisfied is turning things into goo by coming on them over and over, but it’s only a brief relief. Adding more people to your collective is the only thing that can sate your desires now, you know it. Because the U.G.C. put a blockade on the planet five years ago, no one has been able to enter, and since you’ve conquered all the remaining people in that time, there’s no one to ease your ever growing lust. To that end, you have one recourse.");
					output("\n\nYou enter the hangar, approaching your Vice Ruler. The title is meaningless, since she’s also you, but it’s fun to give her nicknames. She smiles at you, kissing you on the cheek in greeting as you slap her on her ass. She giggles, jiggling from the gesture, then turns to direct your attention to the ground below. All the starcrafts you could collect are assembled below and you’re loading them with dozens upon dozens of yourself. They all turn to look at you, saluting before resuming to board the multitude of ships. You grimace, gooey fists clenching the railings. The only option you have left is to try and reach for the stars, or sit here and go crazy. Your lover wraps her arms around you, trying to console you, but you can’t even return her affection. As the engines fire up below you, the burning need pushes all other thoughts from your mind.");
					
					kGAMECLASS.processTime(35 + rand(5));
					target.maxOutLibido();
					target.maxOutLust();
					break;
				default:
					output("Oh no, something unexpected happened!");
					clearMenu();
					addButton(0, "Next", kGAMECLASS.useItemFunction);
					break;
			}
			
			if(pageNum < 7)
			{
				clearMenu();
				addButton(0, "Next", badEndTF, [target, (pageNum + 1)]);
			}
			else
			{
				kGAMECLASS.badEnd();
			}
			
			return;
		}
	}
}

