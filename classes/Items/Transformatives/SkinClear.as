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
	
	public class SkinClear extends ItemSlotClass
	{
		public function SkinClear()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.DRUG;
			
			shortName = "S.Clear";
			longName = "Skin Clear";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a small bottle labeled “Skin Clear”";
			
			tooltip = "A skin lotion produced by J’ejune Pharmaceuticals. Following the success of Rubber-Made, J’ejune decided to capitalize on the idea of skin treatment cosmetics. Most flopped, but they had a second success with Skin Clear. Marketed as an alternative for those wishing to remove fur or scales, Skin Clear promises to give you smooth, creamy skin.\n\nThere’s a warning on the back that reads <i>“Danger: Do not ingest Skin Clear”</i>.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 2500;
			
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
			
			output("You take out a small bottle of Skin Clear. Turning it over, you note that there’s a warning on the back which reads <i>“Danger: Do not ingest Skin Clear”</i>.");
			output("\n\nHow would you like to use this item?");
			
			clearMenu();
			addButton(0, "Skin", useSkin, target, "Apply to Skin", "Apply the lotion to your skin.");
			addButton(1, "Ingest", useIngest, target, "Ingest Lotion", "Ignore the warning...");
			addButton(14, "Back", useCancel, target);
		}
		
		private function useCancel(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("SKIN\nCLEAR");
			author("Owens");
			
			output("You put the bottle back into your inventory.\n\n");
			kGAMECLASS.itemCollect([new SkinClear()]);
		}
		
		// Use: Skin
		private function useSkin(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("SKIN\nCLEAR");
			author("Owens");
			
			output((!target.isNude() ? "After undressing quickly, y" : "Y") + "ou squirt the contents of the bottle into your hand, letting the clear liquid pool onto your palm. It’s fairly viscous, barely spreading as you finish emptying the container. Setting aside the empty bottle, you rub both hands together, before setting to work rubbing the cream into your [pc.skinFurScales]. Working from the top down, you have just enough to make sure you covered every inch of your body, from your head to " + (target.hasFeet() ? "the tip of your [pc.toes]" : "your [pc.feet]") + ". Once finished, it doesn’t take long for the lotion to be absorbed by your body, leaving the faint scent of peaches behind. You wonder what will happen next...");
			
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
			
			var changes:int = 0;
			
			// If pc skin type is not skin, change pc skin type to skin. Remove all flags.
			if(target.skinType != GLOBAL.SKIN_TYPE_SKIN && rand(2) == 0)
			{
				output("While waiting for the lotion to have an effect, you notice that the air around you is starting to get quite warm. While pleasant at first, the temperature continues to increase until it’s positively sweltering. Feeling flushed, you look around for the source of the heat, only to realize that it’s your body producing it. The heat is now so bad that you’re starting to sweat, feeling perspiration slide across your [pc.skinFurScales] in large droplets. Within minutes, your [pc.skinFurScalesNoun] is absolutely drenched, causing you to shiver despite the heat.");
				output("\n\nWorried that you might be having an allergic reaction to the cream, you rub idly at your neck, hoping to wipe off some of the moisture dripping down your back. To your surprise, you feel something rip, pulling your hand away to reveal a clump of your [pc.skinFurScales] clutched between your fingers. Dropping the wet patch of dead [pc.skinFurScales] in shock, your hand darts back to your neck, only to feel normal skin in its place. Hesitantly, you pick at the edge, feeling another wet strip of skin peel away with a damp tearing sound.");
				
				target.skinType = GLOBAL.SKIN_TYPE_SKIN;
				target.clearSkinFlags();
				//if(!InCollection(target.skinTone, skinColorList)) target.skinTone = RandomInCollection(skinColorList);
				
				output("\n\nSoon, both hands are working to remove your former layer of [pc.skinFurScalesNoun], revealing more and more of your [pc.skinColor] skin underneath. When you’re finished, you’re standing in a pile of damp, dead flakes that used to be your outer layer, and are admiring your brand new <b>[pc.skinColor] skin!</b>");
				
				changes++;
			}
			// If pc skin type is skin, gain the smooth flag. Increase Libido by 1 to 5.
			else if(target.skinType == GLOBAL.SKIN_TYPE_SKIN && !target.hasSkinFlag(GLOBAL.FLAG_SMOOTH))
			{
				output("You’re not exactly sure what will happen by applying the liquid when you already have normal skin, but it couldn’t hurt to try, right? While waiting, your body begins to heat up across the your [pc.skinNoun]. With the constant feeling of warmth playing across your body, you feel yourself start to sweat, small droplets beading up on the surface of your [pc.skin]. Soon, your body is producing a constant deluge of moisture, apparently trying to push all the water in your body out through your pores. Worried that you might become dehydrated, you grab the bottle and scan the back, trying to see if it mentions anything about this.");
				output("\n\nThe only thing you find is shilling for more of J’ejune products. Figures, the cheapskates. Tossing the bottle aside, you sink to the ground, feeling a little light headed. You’re still sweating, but it looks like it’s slowed down, allowing you to dry yourself a bit. Soon, your pores close up, and you can towel off completely. Upon finishing, you realize that something about your skin has changed: <b>It’s now totally flawless!</b>");
				
				target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
				
				if(target.libido() < target.libidoMax())
				{
					target.libido(1 + rand(5));
					output("\n\nAs you set about doing your gear, you notice there’s a bit of residual heat reaming. It seems the lotion has made you just a bit more sensitive...");
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
				output("Without warning, your [pc.skin] starts to change color, shifting form its normal [pc.skinColor] to a radically different coloration. Once it finishes, your new skin color is a");
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
				output("After waiting a good while, nothing happens... You even check your codex for any internal changes, but nothing out of the ordinary shows up. So either your skin is as normal as can be, or this bottle is pretty much a dud!");
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
			if(!target.isBro() && !target.isBimbo()) output("It seems a little silly that they would list a warning on what is clearly a skin product. Overcome by curiosity, you squeeze a small dollop onto a fingertip, hesitantly licking the clear drop. Peaches and cream explodes in your mouth, a delightful combination. No wonder they had to put the warning! Well, you’re not one to abandon what you’ve started: unscrewing the top of the bottle, you tilt your head back, dumping the viscous liquid down your throat. It’s like a shot of the stickiest yogurt you’ve ever had, oozing down your throat and leaving a thick trail behind. Smacking your lips, you set the bottle down and wait to see what happens.");
			// If brute:
			else if(target.isBro()) output("No stupid label tells you what to do! Ripping the cap off the bottle, you chug the liquid inside like a pro. No, like a bro! YEAH! Tossing the bottle aside, you swallow the last of the thick, clear stuff, feeling it clog your throat. Tastes like a fruity girly drink, not something you’d usually go for. A loud belch works it way up from your gut, letting a slew of bubbles escape from your mouth. Weird as shit, bro. Now bored, you wait, wondering what’s going to happen next.");
			// if bimbo:
			else output("You giggle. Like, that’s totally a challenge! Unscrewing the cap, you pour the liquid into your mouth. Oh, it tastes like Peaches and Cream! Delicious! Soon, you’ve emptied the entire container of sweet syrup, and swish the thick liquid around inside your mouth. It’s almost the consistency of cum, it’s so thick. Once you’ve coated your entire mouth in the sweet stuff, you swallow, feeling your throat bulge as the load of liquid slowly slides down into your belly, coating your throat in a thick, sticky trail. Giggling, you let out a small burp, hiccupping as some bubbles of the clear stuff escape. Oopsie. Still giggling, you settle down to wait, wondering just what the sweet drink will do.");
			
			clearMenu();
			addButton(0, "Next", ingestTF, target);
		}
		// Effects: Ingesting
		private function ingestTF(target:Creature):void
		{
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
			/*
			if(target.hasCock())
			{
				for(i = 0; i < target.cocks.total; i++)
				{
					if(selTF.indexOf(2) == -1 && target.cocks[i].hasFlag(GLOBAL.FLAG_LUBRICATED))
						TFList.push(2);
				}
			}
			if(target.hasVagina())
			{
				for(i = 0; i < target.vaginas.total; i++)
				{
					if(selTF.indexOf(3) == -1 && target.vaginas[i].hasFlag(GLOBAL.FLAG_LUBRICATED))
						TFList.push(3);
				}
			}
			*/
			
			if(TFList.length > 0) selTF = TFList[rand(TFList.length)];
			
			switch(selTF)
			{
				// Skin
				case 0:
					// if not brute/bimbo:
					if(!target.isBro() && !target.isBimbo())
					{
						output("As you wait, you notice that your body is slowly heating up, spreading from the outside in. Soon, you’re very core feels like it’s on fire, and you’re sweating all over your body. Grossed out, you strip off your [pc.gear], letting off some of the excessive heat that your body is producing. It soon becomes irrelevant, as your body continues to heat up, quickly driving all thoughts from your mind as the sweat continues to pour off you.");
						output("\n\nWithin minutes, the ground around you is damp, and your pores are still gushing liquid. Surprisingly, you don’t feel dehydrated. On the contrary, you feel pretty great, despite the continuous stream of sweat soaking your [pc.skinFurScales]. Looking yourself over, you notice that the sweat has started to change. Instead of regular moisture, it’s now... shinier, for lack of a better word. Additionally, it’s started to smell faintly of peaches, just like the Skin Clear lotion you used. <b>Soon, your whole body is coated in layer of clear liquid, leaving you with glistening, lubricated skin.</b>");
						output("\n\nShortly after beginning to glimmer, the torrential output of liquid slows to a crawl. It doesn’t stop, though, continuing to cover you in a perpetual layer of slickness. Shrugging, you pull your [pc.gear] back on, shivering as it slides across your newly lubed [pc.skin].");
						if(libidoGain) output(" The drug seems to have increased your sensitivity as well...");
						output("\n\n");
					}
					// if brute:
					else if(target.isBro())
					{
						output("After a few minutes of jack squat happening, you feel your body beginning to heat up. It feels like your muscles are burning, like after a really good workout. Hell yeah, feel the burn, man! You start flexing, hoping that whatever’s happening will make you even more ripped, so that all the ladies will totally dig your rockin’ bod. Maybe even make all your guy friends jealous, no homo though! It doesn’t take long for beads of sweat to start to appear all over your [pc.skinFurScales], and soon you’re positively dripping. Dang, man, that cream stuff was legit bad mojo. Maybe you should have listened to the warning label. Well, whatever man, to late for that now. You just keep flexing, hoping your kickass body can withstand whatever the science-y junk is doing to your insides.");
						output("\n\nEventually, the heat suffusing your body dies down, and you’re able to relax. Your limbs feel like you might have over flexed them, so worried were you about the creepy liquid pouring out of ya. Speaking of which... you give yourself a once over, checking out all your major body parts. Seems like everything is still where it’s supposed to be. ‘Cept, everywhere you look, your [pc.skinFurScalesNoun] is shiny. Like, really fucking shiny, man. <b>Seems that cream made you permanently glisten like an oiled Adonis, Hell yeah!</b> You snort, totally checking yourself out, no homo. Screw warning labels man, you should try this shit again!");
					}
					// If bimbo:
					else
					{
						output("There’s a gurgling in your tummy, sounding rather unpleasant. Holding your belly with both hands, you start to rub its surface, hoping that it wasn’t something you ate. Oh, wait, you ate that peach flavored lotion, didn’t you? Uh-oh...");
						output("\n\nThe gurgling becomes more pronounced, and you notice that beads of sweat have started to appear on your skin. Gross! Stripping off your [pc.gear] so that it doesn’t get stinky, you rub your belly with one hand while wiping the sweat away with your other. It doesn’t help, and soon you are drenched in sticky sweat drops. You shiver as they roll down your spine, trickling into all your secret places. You let out a gasp of surprise, feeling the sticky layer all over your body slowly warming with your body heat.");
						output("\n\nWithin minutes, you’re constantly dripping, covered in a thin sheen of sticky clear liquid. No matter what you do, it doesn’t stop, and you " + (target.hasFeet() ? "stamp your [pc.foot]" : "wriggle") + " in frustration. You don’t want to be covered in icky sweat all the time! There’s little time for your tantrum, however, because there’s a change in your slimy cover. It starts to smell faintly of peaches! Surprised, you watch as the icky, sticky stuff stops flowing so fast, and instead becomes a glistening layer all over your body. It makes you sparkle!");
						output("\n\nWith that, the gurgling in your belly ceases as well, and you spend a few minutes looking at your reflection in your shiny, constantly lubed skin. You giggle. Now that it’s no longer sticky, it would feel pretty good to rub against someone, just gliding all over their body as your frictionless skin heats up... oh, that’s something you’re going to have to try.");
						if(libidoGain) output(" Pulling your [pc.gear] back on, you notice right away that you’re a lot more sensitive, cooing as the fabric of your [pc.underGarments] rubs against your sensitive spots. This could be really fun...");
					}
					
					// If pc skin does not have the lubricated flag, gain the lubricated flag. Increase Libido by 1 to 5. Decrease energy by 10.
					target.addSkinFlag(GLOBAL.FLAG_LUBRICATED);
					if(libidoGain) target.libido(1 + rand(5));
					target.energy(-10);
					break;
				// Tongue
				case 1:
					output("The inside of your mouth feels... slimy, for lack of a better word. Opening your mouth to get a better look, you’re surprised to find that a pool of saliva begins to spill over your lower [pc.lip]. Some of it lands on the ground, splattering as it hits, but you’re forced to swallow more and more as the interior of your mouth seems hell bent on drowning you. After a few tense minutes, the flood of spit settles down, and you’re able to examine the source of this outpouring. It would seem that your tongue is responsible, as it now glistens with slathered excesses of saliva. Letting it dangle out, it drools a steady stream of sticky, clear spittle down your front, without drying out. <b>It would seem that your tongue is now lubricated</b>, suffusing your mouth with a constant warm yet wet feeling.");
					
					// If pc tongue is not lubricated, gain the lubricated flag. Increase Libido by 1 to 5.
					target.addTongueFlag(GLOBAL.FLAG_LUBRICATED);
					if(libidoGain) target.libido(1 + rand(5));
					break;
				// Cock
				case 2:
					output("");
					output("\n\n");
					
					// Nothing yet!
					break;
				// Vagina
				case 3:
					output("");
					output("\n\n");
					
					// Nothing yet!
					break;
				// Dud effect
				default:
					output("After waiting a good while, nothing happens... You even check your codex for any internal changes, but nothing out of the ordinary shows up. So either your stomach nullified the effects, or this bottle is pretty much a dud!");
					break;
			}
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
	}
}

